Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298170;
	b=Llw6SRf+KK1pW3/JNJuA58jFzrNmkcHHiM5M4ptAAAvCNUyLsY18t8N+XL4QjznpMY4j
	 9k/ZjSSLx+yUma84AOeNNL8/CbwB9w+4lFJvVLFBSQxPnKSfg4LjvCGVsadZczgT2utLt
	 mxE6LNbylx+MRHu363zxnA8j851q7ukXwgJ9Uc+RV3UAQDfBsNCbxkVfwUT1vn7qSfA9V
	 gLIc7JRorsmpqJYHjWm3zb2+bb4VzICf4yENZmt3pCvI+9+fNHsIGI9wgNwBiTH/DbepL
	 VeqsRJseMVQ4IU6k4Q3O6jBG/itJdBw8Li3mzGXQZdBXd0LcVTshXmXBfrFGKPRymbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298170;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ReXpY7Tk/3jj/XdY4rvKW39RVDWdGFUOAciKQOHGPVM=;
	b=XVpmJZgvbiLoFJvq7/hzCIZEKV/a0sov3XaJE48Jp9stHeOzDIgW4mlHqI6vMsbuwHBZ
	 lBnxo/BFhRD3FdBmK3wdiiRcdWcdNAywAc8qY6j82tNcGoj4eKDBjGLvEXcOKc0QL2lQY
	 xvEudMW4VrdtppG9Y9ejip+6KmjFtC1wuAqqNh9+UaavYbo2dADs09SFiy9mPlcRjn/De
	 0DDPiw6dpbh4MPjLerzDwPu6A0pL32NJisLh6KxoHMx3pSwNEmORzKL72oGBWu1cvAdP1
	 EXV5jw7cIEnBBfH29lC3ykTqfrRDtqsQCqK3DYqtKarzxoQ+gWiY18eACIqLNvrzjfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3yo0IKl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2D9606A31C;
	Tue, 10 Nov 2026 08:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3yo0IKl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D9E1F0089F;
	Tue, 10 Nov 2026 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298170;
	bh=ReXpY7Tk/3jj/XdY4rvKW39RVDWdGFUOAciKQOHGPVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n3yo0IKlp6z6pEyFVyNuYAuH53TFfYFGwrvKxG6RDzD1iWIOsshoDoOydXQmQMJBQ
	 8YnB5R+MBmm4doJB818aov/nwP3FHdrxBe7CXLjoQOIKwBZDOSU9fnWfS2mJweQoYn
	 wxhTFR7K7Rid8WkHNzpn9zQwPPdasnCQcu91GSAgs3vMG0niqz6OhgISWiusCBKqrN
	 /za6TkKKs6IE2EmBycTkTYkDpCh++uCN/erPki8i5ctNCVCXsrQHH+a6HIFp2jNwMg
	 Vp7b5zEkDBvvAGEloPYcZplQLtK1qZZoLtOdld+i4e38WqSIRK4OBqAVeCxfdeyo+C
	 2TJyojpRg4ahw==
Date: Tue, 10 Nov 2026 09:09:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorena Tanase <tanaselorena3@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: wm8741: Convert to DT schema
Message-ID: <20261110-tomato-ape-of-faith-55b70e@quoll>
References: <20261109165522.6663-1-tanaselorena3@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109165522.6663-1-tanaselorena3@gmail.com>

On Mon, Nov 09, 2026 at 06:55:22PM +0200, Lorena Tanase wrote:
> Convert the WM8741 audio CODEC bindings to DT schema.
> 
> Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
> ---
>  .../devicetree/bindings/sound/wlf,wm8741.yaml | 40 +++++++++++++++++++
>  .../devicetree/bindings/sound/wm8741.txt      | 29 --------------
>  2 files changed, 40 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8741.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
> new file mode 100644
> index 000000000000..a9a7fc2414bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/wlf,wm8741.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: WM8741 audio codec
> +
> +description: |
> +  Wolfson Microelectronics WM8741 audio CODEC
> +
> +maintainers:
> +  - patches@opensource.cirrus.com
> +
> +properties:
> +  compatible:
> +    const: wlf,wm8741
> +
> +  reg:
> +    maxItems: 1
> +
> +diff-mode:
> +  description: diferential output mode
> +  $ref: /schemas/types.yaml#/definitions/uint32
> +  enum: [0, 1, 2, 3]

You never tested your code.

The main point of this commit is to convert to DT schema, right? So if
you do not test if resulting DT schema is correct, this makes absolutely
no sense. Please read ALL existing docs in DT/bindings directory.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    wm8903: codec@1a {
> +      compatible = "wlf,wm8741";
> +      reg = <0x1a>;
> +
> +      diff-mode = <3>;    

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

