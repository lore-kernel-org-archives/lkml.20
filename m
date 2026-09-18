Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6E052BE57;
	Fri, 18 Sep 2026 21:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766488; cv=pass; b=Rp6fguM1HC7O1tvEwMpM/rycxTDhbIs9ZsYRhJIV8atzVGMkvDfieQkHV9v4Hh3pTq7aHMuOWoS4ilbkCb9+tFMpoyHzRQ4+saPHev1Ki3P979dlWiac8L/+aJhN9bdwBTnRRlBnonuqhcU2DKMsN5uvIMendY4vFiQ2m9hTNAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766488; c=relaxed/simple;
	bh=o8EcjDNiJcQcYVP5UEs7f0dfuAMS1BNsch9mt/IOUFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exoWAFDazl/sOuenrwKvcO3jXxurH07AQ+rXX5nwPM3RW+H3b+kfaATimKRn2hXH8rwV+GukHQanHGbqqeb3CX9IUV9x4sy2CMmpAlAjpdTBnv/XuhxglTIHAeBWrIoML/45WRoARloh8WfPtcoKs7cebQpIs9rL6iBGXCJMSIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=B3pnhjhL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="B3pnhjhL"
ARC-Seal: i=1; a=rsa-sha256; t=1789766477; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZRTPs+/EQn6AzTGcOTrIbRhRrGLanIGQioKhMY1bIqzFOpYljLMSAWgLVX4dAw6keghmfU8OJpFdEroBzPej1tDz9Doh0X9S3K258mM/BCTKdBBXYz6ruR9nZWMw2cVaZbO5YmT7jDKytf6ZfySLtcFuiAPVp4/qgqc2yoTG7Oo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789766477; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o3AIqpCx1xGDSyIic5bd3W6l+0N3zsLVo4Tor3degLA=; 
	b=TJRg6etdGn4KnZZ5H8DyjVpjloCwlQlKaMtzwgvsGQPa3a3IdzJzDoRdTsekyjNxr8SVahj+9y0QJGp8D+oMG/+rguHShBqvbsOXMyAM84qtdd+cBYWXgKVhvBn4gbWQsC3cn58rJrQ+qyw3HHAUOs30RurVTR57QzUNjpKU7nQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789766477;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=o3AIqpCx1xGDSyIic5bd3W6l+0N3zsLVo4Tor3degLA=;
	b=B3pnhjhLpfd3841dq7Q6zohkaeJnGM8mGeORhvnmjlo+ROGq6yAEjqC+Dj6cQIDU
	fekNUYdo84Yig+aeNdLrVIJGmHp38/wEaqBC1/0yQxH0a+iBP7QyUVPbbR6RYMEUR8o
	fF3bMYeBGjKVktReAuCls7H0jSUlxHB34sZbTygk=
Received: by smtp.zohomail.com with SMTPS id 1789766475322457.08237500283667;
	Fri, 18 Sep 2026 14:21:15 -0700 (PDT)
Message-ID: <c38e3ec8-74a3-4ab9-9d76-c5fe020284ea@collabora.com>
Date: Fri, 18 Sep 2026 23:21:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dt-bindings: add rockchip rk3576 vicap
To: Amin Gattout <amin.gattout@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
 <20260915-vicap-rk3576-v1-1-d3f5eb58a0b5@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260915-vicap-rk3576-v1-1-d3f5eb58a0b5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Amin,

Thanks for the patch, LGTM!

On 9/15/26 14:27, Amin Gattout wrote:
> Add the compatible for the Video Capture (VICAP) unit of the Rockchip
> RK3576. This variant features five MIPI CSI-2 ports and a connection
> to the image signal processor (ISP). The pixel clock of each MIPI port
> enters the VICAP through a dedicated gate in the clock and reset unit,
> so the variant takes five interface clocks and five interface resets
> in addition to the aclk, hclk and dclk of the other variants.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 46 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> index 080b64503b1b..b7dfaf3b378d 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> @@ -15,6 +15,10 @@ description:
>    the data from camera sensors, video decoders, or other companion ICs and
>    transfers it into system main memory by AXI bus.
>  
> +  The Rockchip RK3576 Video Capture (VICAP) is similar to its RK3568
> +  counterpart, but features five MIPI CSI-2 ports and an additional
> +  connection to the image signal processor (ISP) block.
> +
>    The Rockchip RK3588 Video Capture (VICAP) is similar to its RK3568
>    counterpart, but features six MIPI CSI-2 ports and additional connections
>    to the image signal processor (ISP) blocks.
> @@ -23,6 +27,7 @@ properties:
>    compatible:
>      enum:
>        - rockchip,rk3568-vicap
> +      - rockchip,rk3576-vicap
>        - rockchip,rk3588-vicap
>  
>    reg:
> @@ -33,7 +38,7 @@ properties:
>  
>    clocks:
>      minItems: 4
> -    maxItems: 5
> +    maxItems: 8
>  
>    clock-names:
>      items:
> @@ -42,6 +47,9 @@ properties:
>        - const: dclk
>        - const: iclk
>        - const: iclk1
> +      - const: iclk2
> +      - const: iclk3
> +      - const: iclk4
>      minItems: 4
>  
>    iommus:
> @@ -221,6 +229,40 @@ allOf:
>  
>              port@11: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3576-vicap
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 8
> +
> +        clock-names:
> +          minItems: 8
> +
> +        resets:
> +          minItems: 8
> +          maxItems: 8
> +
> +        reset-names:
> +          items:
> +            - const: arst
> +            - const: hrst
> +            - const: drst
> +            - const: irst0
> +            - const: irst1
> +            - const: irst2
> +            - const: irst3
> +            - const: irst4
> +
> +        ports:
> +          properties:
> +            port@6: false
> +
> +            port@11: false
> +
>    - if:
>        properties:
>          compatible:
> @@ -230,9 +272,11 @@ allOf:
>        properties:
>          clocks:
>            minItems: 5
> +          maxItems: 5
>  
>          clock-names:
>            minItems: 5
> +          maxItems: 5
>  
>          resets:
>            minItems: 9
> 

