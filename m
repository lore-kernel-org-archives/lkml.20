Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EB9408031
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821016; cv=none; b=rWdEt/7KyKxK+7skGzFp/4W+CiUykODSof98nSyTE8I44IB4jMmlL5byv7uurCiMp2fzwBk3T0JLJU2W5ycxssYfXEMHpvhYSJ6wgLjve4WXRUyRJ/+IsIGGLdB2cmFD1KosjR7QPA5fSVGzZLNA9Zs5OnVL1FhJPU+fKqwdS48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821016; c=relaxed/simple;
	bh=agVt9u5auVW/rGrjfz9BIea5qwFk+9eBDj75bT1gfLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QznaHMh57urhvupfl/Bdgq7EiAtdy56xDRoxBIUFP8DrmX8Mu4/AraOx3MkEV3MIwFW0RdKtukqYEyWiLFj2R0Ao37kzutT6fEDdxZ9jiNNMdLlAzD+Zx9BKPt0mz51rhx5+1LH16ojQIDZF3xkwv+Om3ZSZMRABgcJA2ZJArcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq284FHM; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq284FHM"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2585709a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821012; x=1788425812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zaEqDrC5jYAKebMDLgOTjAUIE2F2Prlvaylcbrjmns0=;
        b=Vq284FHMSAssFtJhISDoaAQJyqtV4XRYd4nuIRxr+XdZf9iTPAarPc9rV9dCtB1yZX
         8khYu81BA4Wy3hguL0MrQ3fwgJzlZvHZvIh1PIFUN8+NR//0gxHNZEypaSjuUX0KXOCs
         JTbugL+uZgBlL5/zCAhBYk2o5x85MkwXQEazmcIjr4ci4G7ybzmQ0mIMoZcrlGk6YrSJ
         ef+e17LJcImzPDWUvIe7D9y5C2x8cAUwqaT7/Gqmhkno2ddJvExvc1x8Pof9mA2Z9LmG
         /d+IZRVqodjxn7QXgOO0nhdh84wMuNqgDhQZz4BcoDMwaiLNBKkj0CNFkoROwFzQo7Vs
         wNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821012; x=1788425812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaEqDrC5jYAKebMDLgOTjAUIE2F2Prlvaylcbrjmns0=;
        b=p2TdCFW2/yhhXkF+bRZ2T2LvTEjANF4MDswU6vNQA2ZH+ZKXzD1v9l3vgxMEsndfDT
         0IMqrWASWpT0z4DBmZ96G5pvYUWexYR7uL7cvl6qMbWRDZfkK+cEtiiFCtcpi7sAvJ0S
         qa7bkcdT4fUscFhJ0IzxRth4sHt3afe1Y2i+j23dbKhnkhNadbhRN6Fg+7cN4db9+V5X
         YYTPkZwSX0RunvGDn+uJMePy+TsdimIGnbPUTMdgCYKNdmdj7KEDYhoNRBn4g3pezdKG
         WO7A+0G9bRA2ek534hx9OVZgvwz6mNpt0xGXTmbubtM7M37qRxzBhhanbb/h15F5cVnk
         zp+w==
X-Forwarded-Encrypted: i=1; AHgh+RoNEA78zAm5yCF0AIWGXtk/M+f6yV08p5AMHNSvVOnX5ItjvPEc11NKJ294Z1NOmyaHdCDD6KtpyITB4ZA=@vger.kernel.org
X-Gm-Message-State: AFuF++lQZaZ7HpAmfkS9nBAtmEgi7ehl/1ZMtyV951g7gxlUUIP06My7
	0LuGX1volszIReeUa/NcTw45R4KIwBv6a3IbJMgWpbcffyBSi8gL4ytb
X-Gm-Gg: AR+sD10b2DinFlk2O6VvBibuem0ygNPmA42KLzZmJ4C1BUlEezmF4/d9sM+qwCoSqPm
	Hcp+w90+O2XhM+E3sTNoGYvvFBVKHNJMvbQgJTP39ZoSrprD1m18m66uYp993CM9PlX7pXhx1rM
	Zd0ydPNYRbTjuUigZmIOyVRK+xoC1rbJtSBxHfkDcb4IUNjHLfaL2ocmVMvrOOpOxqNIMhjs5s4
	Gc0OM4g4hL/sIXdqbpt+3oh+uqB5/OQiu24a3WNtW4KYgGAwVy441hTHmhGfgNw6fu364Dey2/E
	ncOI627QDEDxdidj/g/aQ4/vdKsHh3Lc/jd3u8eNeUgyEzoyutTFRA1tmKMsYPocUsw/3f56m4J
	gQ/uPRW5uPZFYfgm7jb2N4LzXl5U2qChl3kcHaObRSpq6x9+s3Ub3dhdbNXAwyhemBFXjtP3QkS
	Ty7Srawq7fbPm6b3Cl/GyHLUQnpOCcklAUA8LTQ1Bx+VsC9i3w7o1i43S3rICljDWZsUgXnFYiY
	XNp
X-Received: by 2002:a17:90b:520f:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3966d5f8f84mr28728747a91.9.1787821011778;
        Thu, 27 Aug 2026 01:56:51 -0700 (PDT)
Received: from [10.25.160.98] ([165.85.1.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3967582e855sm2085902a91.2.2026.08.27.01.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:56:51 -0700 (PDT)
Message-ID: <0ee330e3-8c6b-4162-81fe-d769982df5de@gmail.com>
Date: Thu, 27 Aug 2026 16:56:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI
 master assignment
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Yannic Moog <y.moog@phytec.de>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20260827065556.2326079-1-primoz.fiser@norik.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260827065556.2326079-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> The dailink_master label was incorrectly placed on the codec sub-node,
> causing simple-audio-card to configure TLV320AIC3007 as the I2S bitclock
> and frame master with SAI2 in consumer mode. This contradicts the SAI2
> node configuration (assigned-clock-parents, assigned-clock-rates,
> fsl,sai-mclk-direction-output) which requires provider/master mode.

Just a small question about the commit message. As far as I understand,
these SAI2 node configurations only describe SAI2 providing MCLK to the
codec. A topology where the SAI provides MCLK while the codec is the
bclk/fs provider is common. So the original configuration seems
self-consistent, not contradictory.

Regards,
Chancel Liu

> Restore dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK
> with the codec operating as I2S slave. Also remove the spurious clocks
> property from the codec sub-node which had no effect in this topology.
> 
> This fixes the broken audio on PHYTEC phyBOARD-Pollux-i.MX8MP board with
> PEB-AV-10 Audio/Video expansion board.
> 
> Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> index bb740f845855..8957b24a7ad2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> @@ -77,13 +77,12 @@ sound {
>  			"MIC3R", "Microphone Jack",
>  			"Microphone Jack", "Mic Bias";
>  
> -		simple-audio-card,cpu {
> +		dailink_master: simple-audio-card,cpu {
>  			sound-dai = <&sai2>;
>  		};
>  
> -		dailink_master: simple-audio-card,codec {
> +		simple-audio-card,codec {
>  			sound-dai = <&codec>;
> -			clocks = <&clk IMX8MP_CLK_SAI2>;
>  		};
>  	};
>  };

