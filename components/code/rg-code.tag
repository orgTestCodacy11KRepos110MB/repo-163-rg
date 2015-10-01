<rg-code>

	<div class="editor"></div>

	<script>
		let editor

		this.on('mount', () => {
			editor = ace.edit(this.root.querySelector('.editor'))
			if (opts.theme) editor.setTheme(`ace/theme/${opts.theme}`)
			if (opts.mode) editor.getSession().setMode(`ace/mode/${opts.mode}`)
			editor.getSession().setTabSize(opts.tabsize || 2)
			if (opts.softtabs == "true") editor.getSession().setUseSoftTabs(true)
			if (opts.wordwrap == "true") editor.getSession().setUseWrapMode(true)
			if (opts.readonly == "true") editor.setReadOnly(true)
			editor.$blockScrolling = Infinity

			editor.getSession().on('change', e => {
				if (rg.isFunction(opts.onchange)) opts.onchange(editor.getValue())
			})
			this.setContent()
		})

		this.setContent = () => {
			/* istanbul ignore next */
			if (opts.src) {
				rg.xhr('get', opts.src, resp => {
					editor.setValue(resp, -1)
					this.update()
				})
			} else {
				editor.setValue(opts.code)
			}
		}

		this.on('update', () => {
			if (this.isMounted) this.setContent()
		})

	</script>

	<style scoped>
		.editor {
			position: absolute;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
		}

	</style>

</rg-code>