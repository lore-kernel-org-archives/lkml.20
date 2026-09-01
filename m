Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA62D3812DD;
	Tue,  1 Sep 2026 08:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250886; cv=none; b=iO26j84DGgB+qjFIQeJjrLmewrmCcZNBrvyqbpBaWauGm9Z95ZPTF9tcDVGLi9cHHetjUoYZG6JN6SAirVBkg42KyryjfqIC1z+Rz/qAajI4Z1j1dLDDd5Sr7RzOlod+1SX9OfwWVNxWvxsP7fdNdOoCOEm408kcKwsZhK0GDpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250886; c=relaxed/simple;
	bh=3z9FlMuwFeEP8NtG2NQH9s4DhyDCmMQBroSkqEkvXA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uI+ALbw6w2226c2KCKs6zz/TG3I1IbVgdAYV3diSyu7gnbhuu4TwA2K7qxhEB1NsaR3UIlQ0M/IJZqQVikEfBOp7C215KbBwnImgbXBCbiFeNpzbguPvuZWjFqvK8TI5OJ5VB8AHfISLPsIjjT8d9HjUtYi0DglLIcb4BtZlTzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=es9JJSCY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="es9JJSCY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CCD1F00A3D;
	Tue,  1 Sep 2026 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250885;
	bh=kZfvDFaLatUlB1wp5I2s/R7TKlec2rrMOd8ygLJGYk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=es9JJSCYblCEbnlkbdP4qJCKdURohgCDMFXz25i4fLE3f62KV+QBIFpXArlySGq1c
	 fBSbMdEEuhnLpXyWOdAmGR5tuQDGQeB8CSLBmRWFgnySM70Ewp3PxouLDTl0s3ck+/
	 +719D6XX/b18DYbi74HeQzoxYJZMz8+/ux1gpFER8CqDin+DxaJoF40ruJWLGYKgQe
	 9vTxIUB4MIyoocxcQhyRK1l6LftRDGPjLsBqFGvUXI7kXk8tsnfWk2XXjpwyTxv9TS
	 jrifj0wwA2ZPdVutYK8w9E6rmLeOgNFRx7qAqKTr68C7RQQG84lRLWbP/mNso8fooG
	 DTnEam+cybRNg==
Date: Tue, 1 Sep 2026 10:21:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-check-style: Handle indented fragments in
 indent-unit-dts
Message-ID: <20260901-relaxed-hare-of-romance-abad1f@quoll>
References: <20260830-b4-dts-check-fix-v1-0-e7c1b2774730@kernel.org>
 <20260830-b4-dts-check-fix-v1-1-e7c1b2774730@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-b4-dts-check-fix-v1-1-e7c1b2774730@kernel.org>

On Sun, Aug 30, 2026 at 08:24:54PM +0200, Sven Peter wrote:
> The multi-die Apple SoCs contain most of their nodes in a file that is
> included to instantiate the same nodes across both dies. These included
> fragments all have a tabs-only prefix that is correct in the final
> composed file. dt-check-style however finds the first line starting with
> two (or more) tabs and then indent-unit-dts rejects those correctly
> indented files.
> 
> Fix that by detecing a tabs-only prefix shared by rootless files and
> treat that as a constant offset. Also add fixtures to test this.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  scripts/dtc/dt-check-style                         | 69 +++++++++++++++++-----
>  .../bad/dts-fragment-missing-prefix.dtsi           |  6 ++
>  .../bad/dts-indented-ref-node.dtsi                 |  6 ++
>  .../expected/dts-fragment-missing-prefix.dtsi.txt  |  2 +
>  .../expected/dts-indented-ref-node.dtsi.txt        |  2 +
>  5 files changed, 70 insertions(+), 15 deletions(-)
> 
> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 96deffc0d8a7..2afc05fa6602 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
> @@ -380,12 +380,43 @@ def check_mixed_indent_chars(ctx):
>                  yield (cont.lineno, 'mixed tabs and spaces in indent')
>  

I did not expect simultaneous work, so I did some renaming and moving
which unfortunately will cause you conflicts.

My patches got merged and they add _ to detect_indent_unit(), so please
follow. Also other functions go to a bit different place after sorting.

>  
> +def detect_fragment_offset(ctx):
> +    """Return the indentation inherited from an include context.
> +
> +    A fragment has neither a root nor top-level reference nodes and all

What is a DTS fragment?

> +    its top-level lines share the same tabs-only indentation.

I don't think you are fixing right problem or at least not completely.
The Apple DTS is incorrect, because - I assume we talk about
t600x-dieX.dtsi - this should not be indented with a tab in the first
place. Apple does not get separate coding style, although I am working
on supression tags to avoid certain warnings.




> +    """
> +    if ctx.file_type != 'dts':
> +        return ''
> +    offset = None
> +    for dl in ctx.lines:
> +        if dl.depth != 0:
> +            continue
> +        if dl.linetype not in (LineType.NODE_OPEN, LineType.NODE_CLOSE,
> +                               LineType.PROPERTY):
> +            continue
> +        if dl.linetype == LineType.NODE_OPEN and \
> +                (dl.node_name == '/' or dl.ref_name is not None):
> +            return ''
> +        if offset is None:
> +            offset = dl.indent_str
> +        elif dl.indent_str != offset:
> +            return ''
> +    if not offset:
> +        return ''
> +    if any(char != '\t' for char in offset):
> +        return ''
> +    return offset
> +
> +
>  def detect_indent_unit(ctx):
>      """Find the indent unit used at depth 1 in this block.
>  
>      Returns tuple of string (one of: '  ' (2 spaces), '    ' (4 spaces),
> -    '\\t' (tab), or None if depth-1 is empty or ambiguous) and line number when
> -    detection was made)."""
> +    '\\t' (tab), or None if depth-1 is empty or ambiguous), line number when
> +    detection was made, and whether the detected fragment prefix is valid.
> +    """
> +    prefix = detect_fragment_offset(ctx)
>      for dl in ctx.lines:
>          if dl.depth != 1:
>              continue
> @@ -395,20 +426,25 @@ def detect_indent_unit(ctx):
>              continue
>          if not dl.indent_str:
>              continue
> -        if dl.indent_str == '\t':
> -            return ('\t', dl.lineno)
> -        if dl.indent_str == '    ':
> -            return ('    ', dl.lineno)
> -        if dl.indent_str == '  ':
> -            return ('  ', dl.lineno)
> +        indent = dl.indent_str
> +        if prefix and not indent.startswith(prefix):
> +            return (indent, dl.lineno, False)
> +        if prefix:
> +            indent = indent[len(prefix):]
> +        if indent == '\t':
> +            return ('\t', dl.lineno, True)
> +        if indent == '    ':
> +            return ('    ', dl.lineno, True)
> +        if indent == '  ':
> +            return ('  ', dl.lineno, True)
>          # Anything else at depth 1 is non-canonical; flag elsewhere.
> -        return (dl.indent_str, dl.lineno)
> -    return (None, None)
> +        return (indent, dl.lineno, True)
> +    return (None, None, True)
>  
>  
>  def check_indent_unit_relaxed(ctx):
>      """YAML examples: 2 or 4 spaces. Never tabs or other widths."""
> -    (unit, lineno) = detect_indent_unit(ctx)
> +    (unit, lineno, _) = detect_indent_unit(ctx)
>      if unit is None:
>          return
>      if unit not in ('  ', '    '):
> @@ -417,7 +453,10 @@ def check_indent_unit_relaxed(ctx):
>  
>  def check_indent_unit_dts(ctx):
>      """DTS files: 1 tab per level. Always required."""
> -    (unit, lineno) = detect_indent_unit(ctx)
> +    (unit, lineno, prefix_valid) = detect_indent_unit(ctx)
> +    if not prefix_valid:
> +        yield (lineno, 'indent does not start with fragment offset')
> +        return
>      if unit is None:
>          return
>      if unit != '\t':
> @@ -426,7 +465,7 @@ def check_indent_unit_dts(ctx):
>  
>  def check_indent_unit_strict(ctx):
>      """YAML: must be exactly 4 spaces. DTS: 1 tab (same as relaxed)."""
> -    (unit, lineno) = detect_indent_unit(ctx)
> +    (unit, lineno, _) = detect_indent_unit(ctx)
>      if unit is None:
>          return
>      if ctx.file_type == 'yaml':
> @@ -437,8 +476,8 @@ def check_indent_unit_strict(ctx):
>  
>  def check_indent_consistent(ctx):
>      """All indented lines must be a multiple of the detected unit."""
> -    (unit, lineno) = detect_indent_unit(ctx)
> -    if unit is None:
> +    (unit, lineno, prefix_valid) = detect_indent_unit(ctx)
> +    if unit is None or not prefix_valid:
>          return
>      if ctx.file_type == 'yaml':
>          if unit not in ('  ', '    '):
> diff --git a/scripts/dtc/dt-style-selftest/bad/dts-fragment-missing-prefix.dtsi b/scripts/dtc/dt-style-selftest/bad/dts-fragment-missing-prefix.dtsi
> new file mode 100644
> index 000000000000..a72735e0884b
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/bad/dts-fragment-missing-prefix.dtsi
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/* Include fragment whose child does not contain the inherited indentation. */
> +
> +		bus@10000 {
> +	compatible = "simple-bus";
> +		};
> diff --git a/scripts/dtc/dt-style-selftest/bad/dts-indented-ref-node.dtsi b/scripts/dtc/dt-style-selftest/bad/dts-indented-ref-node.dtsi
> new file mode 100644
> index 000000000000..cabe4ee96d10
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/bad/dts-indented-ref-node.dtsi
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/* Reference nodes must remain at column zero. */
> +
> +	&example {
> +		status = "okay";
> +	};

A good example would be useful and probably made the discussion easier -
we would see that "good" example is actually not desired/correct style.

Best regards,
Krzysztof

