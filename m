Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132E74322F1;
	Mon, 12 Oct 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797973; cv=none; b=E9ZpWxdP7Vn191JMSfPFRdpZTGSSd+04nD8v87u4tIL0iOBKyZBJ62nYHIxlPxKY+8vZ7pel9B+5Sx89vOi9owK9G5uvYrj5FSFWFTais78nAAnPBpQz83QGUx+pgzva52/MaZcC2oZRmi6M4/nvFGsA81anj6Le6ic7zDNIc48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797973; c=relaxed/simple;
	bh=6DAUdSYgrFFFnRxjax0YLBCCbKAi1sxHa5frVqD/In0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8WYwynRGOOP/vsFnrKqqtfE7YaCUUCEEPh6SgyMPUI2zUXJXDg+6MJfoAmmAVynQ+EY6XpEaWCaLs1oXN3jbiX83u7VuJSZcDXzA5wAJMnplc4qlkzEuAHnouvu3GjN7YYD+hqfMBT9dgCtSvDjiPcvTOggbNlK7L9C/B3NWYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUM1TEOI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUM1TEOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1551F0089B;
	Mon, 12 Oct 2026 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797971;
	bh=84ktSiAc3ep1HGqfqHtaoCm3J0cGPIJTEmmE4bm8YRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LUM1TEOIPbtIKfnhRLU2zF0J+EvVr5t2tr2g9di1kDiTS6gzk+0RymOXmAibyxOzj
	 QQ6FpayATCyqWkUq9/SUyorNLfc3HjSmkdiACWLLjlXxjxO0DHF/UmX+RgQD6u2Brb
	 mvZOQiFapYrVMp/Z0NDIGSdcJFPKIk/Fijg2JxeZHHRHrYTZuDnioPnrj1Ot653bcb
	 l/vUXjWEhfcN64/q418E6ge2geWxgH5t1xUMP157veiS6iegXoOhlJ1m0x8lYWtZPj
	 xc7hxrZR6Wt8MCntJL4WiZfcOeVlK/8TrOvmDRcBJkhq9KTi+ybmoyt7TCiPBMK/6E
	 WHQ1pKYFvdTlA==
Date: Mon, 12 Oct 2026 11:39:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, 
	Haoxiang Li <haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa <tfiga@chromium.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v8 08/14] dt-bindings: media:
 mediatek,vcodec-subdev-decoder: Add MT8196
Message-ID: <20261012-inquisitive-scallop-of-business-baeb1e@quoll>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
 <e756699a4be5b530338e373842365e6698ed066b.1791619743.git.kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e756699a4be5b530338e373842365e6698ed066b.1791619743.git.kyrie.wu@mediatek.com>

On Sat, Oct 10, 2026 at 04:36:07PM +0800, Kyrie Wu wrote:
> Compared to previous ICs, the MT8196 supports a 10-bit decoder
> and has a decoding capability of 4K@120fps. It also supports
> 36-bit DRAM IOVA address and Video Power Control to optimize
> bandwidth and voltage usage.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 49 ++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)


Honestly, I see random approach your patches visible in how
inconsistently you use subject prefixes.

Where did you describe REASON to drop the tag?


> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index d1d209cb..d8f25ccd 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -76,6 +76,7 @@ properties:
>        - mediatek,mt8186-vcodec-dec
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
> +      - mediatek,mt8196-vcodec-dec
>  
>    reg:
>      minItems: 1
> @@ -96,6 +97,11 @@ properties:
>        The node of system control processor (SCP), using
>        the remoteproc & rpmsg framework.
>  
> +  mediatek,vcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the Video Companion Processor (VCP) that runs the
> +      video decoder firmware.
> +
>    "#address-cells":
>      const: 2
>  
> @@ -163,7 +169,6 @@ required:
>    - compatible
>    - reg
>    - iommus
> -  - mediatek,scp
>    - ranges
>  
>  if:
> @@ -179,6 +184,48 @@ then:
>      - interrupts
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8196-vcodec-dec
> +
> +    then:
> +      required:
> +        - mediatek,vcp
> +
> +      properties:
> +        mediatek,scp: false
> +
> +      patternProperties:
> +        '^video-codec@[0-9a-f]+$':
> +          properties:
> +            compatible:
> +              enum:
> +                - mediatek,mtk-vcodec-core
> +                - mediatek,mtk-vcodec-lat
> +

Missing constraints for clocks

> +            clock-names:
> +              items:
> +                - const: sel
> +                - const: vdec
> +                - const: lat
> +                - const: top

Best regards,
Krzysztof

