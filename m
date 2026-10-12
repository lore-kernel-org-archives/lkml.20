Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5E44734E5;
	Mon, 12 Oct 2026 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797521; cv=none; b=GTKme2/9dwmmMzjGDCDkv+GSw6mN69Q5hRUZAv1iGQwovL8bHWst5L2eI4ofvwQ5BQfHZZBShPqtCLeJeCTe4z8R0JS9VJO7jCv6kecweUDaouekHK6QtARWsrYC3GAGTSuSnSlBytbaOgpfnHifDVbb7eceB6OUF7OeuqMwJco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797521; c=relaxed/simple;
	bh=YlXB2sfR/8uHmt7u6McLV75lOgXzbBw1zIigD7BXieU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcXU21B6wpY+p5NyJGICrgh/i5ZONlQrz2rac/jUBCELvNP8ZVY4h9cCXQ/y+duNuwhN+hd4V+ZE8fU7RqEqTzZrX/eHry/Ayyd3nehkf+U7fLZOSFbgXlk3QbMGsJ8f98IwzSklu9mjv/9ecpPXy3e9CpzY6apLLUAP6CvNCcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmqAbzqc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmqAbzqc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4601F0089B;
	Mon, 12 Oct 2026 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797517;
	bh=9H3LKXnRsRjgTOnxDKBRlZJ3/mRIKDiFks9Hh8YiVWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cmqAbzqcGelilGuTJJ6bjDCEq00JPGjCkgjHDvwpLU0uf6s9uW1SO/JXMG7yFF3u1
	 RkgTY1PpW9MgXdChn8b8XkoNTL019lOy9OJtHJQc0jWyLIQzZuoexjKVuri3ge1BQj
	 oz+hn4nT+HIfRHkvCtXm8i3zL4SJP6Jj6hsyc7UVopcHddJShX+cfaJDb+ZDRYrYZG
	 HIYsIwOf5OhmPGN5kHu5McqeuAyqVFY262E3xkO2ZER2l6SBco613s9IO3Ziu6+Zfi
	 CfaCcViWqhonjPe2y+izstLmnQoR2zGWoY4EXC4UwYDwVvX8O8sNBuRuMYDoHnskqX
	 e4IWc+YRzvKRQ==
Date: Mon, 12 Oct 2026 11:31:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, 
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil <hverkuil@kernel.org>, 
	irui wang <irui.wang@mediatek.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v18 12/13] dt-bindings: mediatek: Add MT8196 JPEG SMMU
 bindings
Message-ID: <20261012-determined-magenta-camel-ff2ca8@quoll>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <77ae5bfdedb1240420fd1aced446c9dfee38283e.1791614327.git.kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <77ae5bfdedb1240420fd1aced446c9dfee38283e.1791614327.git.kyrie.wu@mediatek.com>

On Sat, Oct 10, 2026 at 04:07:16PM +0800, Kyrie Wu wrote:
> Document the decoder and encoder phandles and describe the dedicated
> JPEG SMMU configuration syscon for MT8196.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>  .../media/mediatek,mt8195-jpegdec.yaml        | 16 ++++++++
>  .../media/mediatek,mt8195-jpegenc.yaml        | 16 ++++++++
>  .../mediatek/mediatek,mt8196-jpeg-smmu.yaml   | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  4 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> index 28a9a9b..b1dccc3 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> @@ -73,6 +73,22 @@ patternProperties:
>        power-domains:
>          maxItems: 1
>  
> +      mediatek,smmu-config:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          Phandle to the MT8196 JPEG SMMU configuration syscon used to
> +          program this decoder's GUSER_ID fields.
> +
> +    allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: mediatek,mt8196-jpgdec-hw
> +        then:
> +          required:
> +            - mediatek,smmu-config

Why are you adding incomplete hardware in one patch and then immediately
fixing it later?

Please read writing bindings doc (and part about complete hardware
support).

Best regards,
Krzysztof

