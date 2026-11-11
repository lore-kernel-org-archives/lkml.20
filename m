Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794393209;
	b=MMQ2xK7eignDTt0pjYd85R7u2kcsMyKkb1JEkuCAOjBE5HbnUxkanQ2W7KhlxEvcqdMt
	 FLmLs2B4akWe5zkAUHi2xKGLVC1xTD4B83ibj31f2o+1VL/j3jIsOtmED0GCX2h/4UXQ1
	 y+swn6usNitvFGg7T0VqsSYQpiVfL3IIvTUegyQY1RTtvrJckRnnsK29O1duZ7AoMk6jP
	 tgXiQG99XyWY5dGjmnxOMHGPfrePcPLxfKphRO4yBceAcsOzfWaVaXZm+sNUvcJKlYgiS
	 NpCftnQtAq4u+oL2fAwa/KuKCKyW7rQJh6I6k7wLPuxnLc53PxvGEdwSJ3qvDTmQ4eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393209;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=G1EXoC3/dM52h/5QzlqeiUrYzrsPXmSPQc5+mcQk2xc=;
	b=FgOwqrtHnojiTzbuaOYZcB0MHoRJWkhO6T4xTzugqLATLq0w9tJr4sEY0RXwtGQkNchh
	 3m701yrcF5vtto8QJD3Dbp+HKZRiW4IGTp/4AtBbK2WC1oSPs38WmDr302snwfxINM7dm
	 rlbW+ThRjjZ6w2PxUYT+9AR5j765Xkv50aIHe4KbXQLMVs9skggMITZHPIxzeEcVGd6z7
	 rlheTVu1mN4CFXbTS/zlKpOHxsgMgnErsqGaMKV/9Sov0uYHZkUhfbCOFLz7mjvgfD8Mn
	 Yf/0E6UsxSKec4oyF88ZgeqyP+4vg/J7ggawllke3WRsydUVyN2pdBZvuywsTkmhzvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=H6mAiZT7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2804A606A321;
	Wed, 11 Nov 2026 10:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2804A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=H6mAiZT7
ARC-Seal: i=1; a=rsa-sha256; t=1794393192; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ln3+MFTmgrY81TE+bPWkWr5RPd/pjVPHi8lldolx9J1XltKclcA7jrhT609/qKAbVLDlKGrsXWCn0+qDo6+H5UHebzOyWZaIJA5loQq/bktxqCHasXAhQQIPJzuGd7V4Jy+b0wP1JQRSgulhlWgU5aaT9RA5SK9wXN1yDclWsTQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794393192; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G1EXoC3/dM52h/5QzlqeiUrYzrsPXmSPQc5+mcQk2xc=; 
	b=Munz0+RA3TA1qI+b+Yrp70TG4bnomruSFG7YEZzKHsRyRFOPF2AeqptssDlqVXd3xx/38NH5y/6+mOUyFIoD+nGR1+sBwsoGpHJfCz9N9Km8Cr2hsLN2N4jO5xTNVGq+NZjkt+ru9yl4xfqfMpoJk9a1qLMuaAI3QFhWoUN+36I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=H6mAiZT7/x5F6sAPwzjNIY7bBA3ULr8+Xsuxz6UEYd5DdGP3jgG70Vm/qlxF4PS+tB/MumWO8XVIW00P3ro/vpZjNlwb0+nM9jTJMWMi8j8LblISi/csKJkMKH9YlfUjB4Ca4Kfio1BoCWfwdMupwgohbDcepG1bMu+BbJ4+AOk=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=G1EXoC3/dM52h/5QzlqeiUrYzrsPXmSPQc5+mcQk2xc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794393191115893.3755015868243;
	Wed, 11 Nov 2026 02:33:11 -0800 (PST)
Message-ID: <d2d48b72-839a-4f6f-829e-e18f6fa819f6@collabora.com>
Date: Wed, 11 Nov 2026 11:33:06 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-2-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-2-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jason,

Thanks for the patch.

On 11/10/26 09:18, Jason Yang wrote:
> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
> for DSI and a receiver for CSI-2, and the DSI host and the CSI-2 host
> can use the transmitter and the receiver at the same time. The single
> cell of this binding selects the mode and refers to the transmitter, so
> the receiver cannot be described.
> 
> Change the cell to select the transmitter or the receiver. The
> transmitter and the receiver cannot operate in different modes [1], so
> the optional phy-type property of the PHY node sets the mode for the
> whole block, D-PHY by default:
> 
> 	/* the MIPI DSI host, driving the transmitter */
> 	phys = <&mipidcphy0 PHY_DIRECTION_TX>;
> 
> 	/* the MIPI CSI-2 host, driving the receiver */
> 	phys = <&mipidcphy0 PHY_DIRECTION_RX>;
> 
> For C-PHY the consumers stay the same and the PHY node gets:
> 
> 	phy-type = <PHY_TYPE_CPHY>;
> 
> Existing DTs on a newer kernel: PHY_TYPE_DPHY and PHY_TYPE_CPHY remain
> valid as deprecated values. They select the transmitter and imply
> phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY> respectively, so nothing
> changes for them.
> 
> New DTs on an older kernel: an ABI break. The older kernel ignores
> phy-type and takes any cell value as the mode of the block. A DSI node
> with PHY_DIRECTION_TX therefore gets no display, and a CSI-2 node with
> PHY_DIRECTION_RX gets no camera.
> 
> [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
>     operate in the same PHY mode."
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Link: https://lore.kernel.org/r/94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml       | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> index c8ff5ba22a86..1ea21ab203ba 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> @@ -22,11 +22,23 @@ properties:
>    "#phy-cells":
>      const: 1
>      description: |
> -      Argument is mode to operate in. Supported modes are:
> -        - PHY_TYPE_DPHY
> -        - PHY_TYPE_CPHY
> +      Argument defines whether receiver or transmitter PHY is used.
> +        - PHY_DIRECTION_TX
> +        - PHY_DIRECTION_RX
> +
> +      PHY_TYPE_DPHY and PHY_TYPE_CPHY are deprecated. They select the
> +      transmitter and imply phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY>
> +      respectively. Use PHY_DIRECTION_TX and phy-type instead.
> +
>        See include/dt-bindings/phy/phy.h for constants.
>  
> +  phy-type:
> +    description: D-PHY (default) or C-PHY mode
> +    enum:
> +      - 10 # PHY_TYPE_DPHY
> +      - 11 # PHY_TYPE_CPHY
> +    default: 10
> +
>    clocks:
>      maxItems: 2
>  
> 

