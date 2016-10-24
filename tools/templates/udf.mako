<%def name="udf_docs(section, udf)">
	% if udf.internal:
	<div id="udf-${section.name}-${udf.name}" class="udf internal">
		<h3><a name="${section.name}-${udf.name}"></a>[internal] ${udf.name}</h3>
	% else:
	<div id="udf-${section.name}-${udf.name}" class="udf">
		<h3><a name="${section.name}-${udf.name}"></a>${udf.name}</h3>
	% endif
	% for arglist in udf.arglists:
		<table class="signature">
		% if udf.aggregate:
			<tr><td class="decl" colspan="5">AGGREGATE FUNCTION ${udf.name} (
		% else:
			<tr><td class="decl" colspan="5">FUNCTION ${udf.name} (
		% endif
		% if len(arglist.args) > 0:
			</td></tr>
			% for i, arg in enumerate(arglist.args):
			<tr>
				<td class="argkind">&nbsp;</td>
				<td class="argname">${arg.name}</td>
				% if i != len(arglist.args) - 1 or arglist.varargs:
				<td class="argtype">${arg.type},</td>
				% else:
				<td class="argtype">${arg.type}</td>
				% endif
				<td class="argunits">${arg.units}</td>
				<td class="argdesc">${arg.description}</td>
			</tr>
			% endfor
			% if arglist.varargs:
			<tr><td class="argkind">&nbsp;</td><td class="argname">...</td><td class="decl" colspan="3"></td></tr>
			% endif
			<tr><td class="decl" colspan="5">) RETURNS ${udf.return_type}</td></tr>
		% else:
				) RETURNS ${udf.return_type}</td></tr>
		% endif
		</table>
	% endfor
		<div class="description">
			${udf.description.full}
		</div>
	% if len(udf.notes) > 0:
		<h5>Notes</h5>
		<ul class="notes">
		% for note in udf.notes:
			<li class="${note.clazz}">${note.content}</li>
		% endfor
		</ul>
	% endif
	% if len(udf.examples) > 0:
		<h5>Examples</h5>
		% for example in udf.examples:
		<pre class="prettyprint lang-${example.lang} linenums">${example.source}</pre>
		% endfor
	% endif
	</div>
</%def>
