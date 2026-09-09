Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581E4489893;
	Wed,  9 Sep 2026 09:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947591; cv=none; b=sBrig2HQl6Lq44Z33HHfxtAsRaIDJEb41sMbIKhyd486Gz6Es4o9BdVCvgrAA6HpT2NXDdMJuJvKy4SI36C1d1dXQHYbb7TA51p/WvUKt41TMRmJGR0YRE4Vv/Prm/f8T2y04Bd+A5eyjO6o+LtTZ38xtAomqy4ljdubJoKyUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947591; c=relaxed/simple;
	bh=ZoLRYrhsi0rsdSeaR+606R03qSLubwt7gfupiCo9cfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FdMwKqt+cC/kWz8avN77x7teM4Zb2q1CTbCTinHwmwfilwa0WimhK/g/Ky7QLHmN/6XkGeYtnrKTbOyvzLkY2JCRlyLgIO1UAZL4k9AsW0UUSMU/VD8QMLxsp0ak8V8w17wHYAqV65IM4DfIG9jEVrY8cNh0SbUh64ojRMNY/F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FNhYyLcY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FNhYyLcY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788947587;
	bh=ZoLRYrhsi0rsdSeaR+606R03qSLubwt7gfupiCo9cfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNhYyLcYk+pHG+NuCEBoN9Z9qL4DcRhrU+huzWhiidgEmeCWxspJXn7VJwZ/n0TJt
	 hBnfmuUwE3ybYGY6GXbQD3iq2Q/ucPpom3qJSpa4w8ax2CP5F8lkk7VKIPj5QC2YQp
	 +1Wr1BER27HnNb02KA28QvzTOz6zudDz1haVx88h08HrPtMMRT2RsvE9RKR3g3nXLN
	 RpHf52dq9yke72Y+icPpIfFhsemJllPUfUz1TGqCHcBTB3qTLaiG1bB6J9W1fY3GpT
	 Fa2jCs+2feOqQGIP1gNJhJfuvqW2cSgGw/DqWhZ50k4SSyNFndlDABnEj1WZLjTlWb
	 cfVO5CvVgAKIA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA1F017E093B;
	Wed, 09 Sep 2026 11:53:06 +0200 (CEST)
Message-ID: <637ff670-1d12-479a-b35f-9d54b153a832@collabora.com>
Date: Wed, 9 Sep 2026 11:53:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] dt-bindings: mediatek: hdmi-ddc: Correct the
 compatibles for mt7623-mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260908184125.10916-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260908184125.10916-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/26 20:41, Luca Leonardo Scorcia wrote:
> The HDMI DDC driver for both mt7623 and mt8167 is actually the same as
> mt8173-hdmi-ddc and the mt7623n.dtsi board include file already uses
> mt8173-hdmi-ddc compatible as a fallback, but the documentation lists
> them as separate entries. Correct the binding by adding the correct
> fallback.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Fixes the following dtbs_check error in mt7623n-rfb-emmc.dts and
> mt7623n-bananapi-bpi-r2.dts:
> 
> i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
>    ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long
> 
>   .../bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
> index bd8f7b8ae0ff..966127e1ee63 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
> @@ -15,10 +15,13 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - mediatek,mt7623-hdmi-ddc
> -      - mediatek,mt8167-hdmi-ddc
> -      - mediatek,mt8173-hdmi-ddc
> +    oneOf:
> +      - const: mediatek,mt8173-hdmi-ddc
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-hdmi-ddc
> +              - mediatek,mt8167-hdmi-ddc
> +          - const: mediatek,mt8173-hdmi-ddc
>   
>     reg:
>       maxItems: 1

