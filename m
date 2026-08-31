Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE113A4F58
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158048; cv=none; b=EJN5ezZ4g+2l/OlVatDrI/QJytlAEXIWYcJ5GI6EjeZLE6cnL4ow3enD1SU7HCdgy37lKls7Ce76g8yoFxrlXIdMNTRix9TuTF0WTGHzyh7l8rFDFMBgTq6yX3Cy2jCBkLhGNOrpuiigHEdTG1uN7OZQLqstd9a5q5pbDa/gwps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158048; c=relaxed/simple;
	bh=/lmQshMnH697F9QSeSeHWD2u64V+LTtfoazb/YyBF9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ET1zO+IGnXtUV22aXfDXaWqFFoBVn6kgpIsZo1OauRZnJvJVoSBVSgfjS2Oxu+HCtk73mdvo4LAzPKlPHloHG3ZCyJx0CblIGmrG+hgiAnBFGPCRkdkgVuABc5McgjY2b0/ZBuSlPegW4JSvpS4jWXB7x4kqqDuMSJHhO8Ih+jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejMc4HS4; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejMc4HS4"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2225309a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788158046; x=1788762846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptsOsHU/6/aB7s/AaOx0+tOkggKvvNrqLs8HPEye82U=;
        b=ejMc4HS4JbsXzvY6BYCyU7AA3DfJae+gKC86LejTtPhSg8rH35M5ANVSLgvFGrdoOt
         wIdeX4kzTADZeUF5qoOVSPsMuUVKbTnJgJqCBS6YjwNVfvTCOdmxh6VPpTF7aGDRDy3a
         tdX61pBUw2ot6A4BAzPreNoJGjf1cxMqYjr34/STyDDcvWkkl2QSaykTa4m/1T1eAfAM
         VrcvUFQ6xXEc+S/lB+a3xjIxNZRDAFlKEDAHcgk/ubZbmd0JdAWNtDoTobMKanbEoHOe
         RlaVvZLq+i6Y0Xb4wW0oFZzcE3Q0wTU3XiFhSU2QFVj4uduE1ofx7dAhcuwSw0Lp0WTA
         i++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788158046; x=1788762846;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptsOsHU/6/aB7s/AaOx0+tOkggKvvNrqLs8HPEye82U=;
        b=oSlOk9j1BReP/m55kiGFKS2LHfUyOyYnKD4tZvssbNIctDaxzTBqAvS9c5q8eSAAI2
         WU9SIRZ2/8vP7BMMZy8L9V9GOLVbzMf2Efy8tLPirNvc7aVdlZvL+Le1yyh2ZXYTreNm
         AqQxujQoYaNPXhTZUMzlKY4P2xb9+7b1wOzcrh9A2JmrA3D0xqXabZ2I0e0cxM5EIrDw
         oAXNG0E/+GtqYL8tsg9BI56HlC9gUm8dtE/vnnqt7hFMUXbMF3QcClSvhyFjvF6xFlXI
         lVXzKxx4jrUSrCjrOmSqYCDTfzfEUHhC3C5XYjV3YNK6QaufL8MKodAzaOJ8E+K88i6c
         463g==
X-Forwarded-Encrypted: i=1; AKwUvBz5G6LouU292VBExijLjmn+0ncDWz+dSa7q3FyN957LX7yimASOAoGQVwrOOA9rletIwk4AslGLZBIhbWE=@vger.kernel.org
X-Gm-Message-State: AFuF++nFMkJ1f0+QxQny2XOVg6gzCWuU4Qpzm1PJ16sKXVhaGrCxWpjG
	U8lvbDsTD06nIjaQT8kIj7LS/nb1YisdRJqQspiQmzfAUxxdnOoaYFIH
X-Gm-Gg: AYBFou3/TpAFBS431wGCpRUDUW8unlmhS4riIQMPnGRUU1FgPYwIy1CAgJDSpSFTAMK
	lXCYTJJB+9KSR30qWkcfJhEWGIPhQCmKajXc4HzcpJGJUfPHvSdZKE2TSflLWuD3ZJ7FCqcHIZV
	wbq8ffhcBFh5lohK/R9zkjanzlOuaHjDO0VCtDSLT5e5/raIMzMKuJUHAXXL559biv9I57UpNTw
	uv1IcPyhRUTQT4HN9Xl/kawBqOZZY0QPwY7sWTgNeN9GcnpYIiPsuptJW7DJiDgGesdkAj/yHep
	l5JA6LPa8x6ufy4zWGhz2FTYehxnyt6IHLXawn7/HEGa0mTFrw/mM8caC66dAix817G4YGXww9T
	8P0yCVQsEmADKlUZK69Q0McXQaKl0a1wJFAD516RWyGRsFTf9nixN2mNOAQ57PnTwFLgdPM+YHi
	fQtkxgfl6RP84VVadykKqGLubcbulSHYhCKeLcC/nt9nfxD2oxz+wboS2NlmLdKuSbzR1d7meQe
	HWQWiuSWPTX3QI=
X-Received: by 2002:a17:90b:4b92:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-398f8203c37mr1788304a91.3.1788158046328;
        Sun, 30 Aug 2026 23:34:06 -0700 (PDT)
Received: from [10.25.162.18] ([165.85.1.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d18eaasm27743090c88.1.2026.08.30.23.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:34:05 -0700 (PDT)
Message-ID: <4dafc090-4e2d-4f05-85ce-cba993e93575@gmail.com>
Date: Mon, 31 Aug 2026 14:33:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI
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
References: <20260831051222.3298730-1-primoz.fiser@norik.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260831051222.3298730-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> The dailink_master label was placed on the codec sub-node instead of
> the CPU sub-node, configuring the codec as I2S bitclock/frame master
> with SAI2 as slave. On this board, BCLK and LRCLK are wired the other
> way around: SAI2 must be bus master, with the codec as I2S slave.
> 
> Move dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK,
> fixing broken audio on the PHYTEC phyBOARD-Pollux-i.MX8MP board with
> PEB-AV-10 Audio/Video expansion board. Also remove the spurious clocks
> property from the codec sub-node, which had no effect in this topology.
> 
> Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

> ---
> Changes in v2:
> - reword commit message to avoid topology confusion
> 
> Link to v1: https://lore.kernel.org/all/20260827065556.2326079-1-primoz.fiser@norik.com/
> 
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
