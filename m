Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60823CF68E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147429; cv=none; b=Vyl9ealN6Uz5kmknUxibi7m+3oo5ausO8nA1SmaXyQX15fUtEWCH3x/MxnhbTaF9a97CBTAizkNZxcLEnBuEGyIUFncIGSz3rHFRSuYeO9huFivQyLuLco0hdkPwOM6UKuvYXRVFbenMIE8Ozodt7JuSgdLfzIjpFHWX2NgKfTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147429; c=relaxed/simple;
	bh=dxvf1inNccImbQFktMu0mLzZ4Vn2ARiX9UQx3SK3Bhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxFXZt1TDJArgqO7m3rHlZckwlYJaxJwttMmhqyTszR+ZJN31kFm6XKO0FPUTKW696O8YBQ5kBTcooSc++XkWkv+xjMyseQuuKFxY1iJdPdsV/MkmP4qjH2+kPI5B6oRlwzbeDUf4S0TFdI5JYJkWIKJxsoU7h28Hxs9WfXXkPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c9zaW2Vc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c9zaW2Vc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso10271475e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147426; x=1792752226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4YkMEnEcFAsesSJUaufOq7VhqrmQqlZmujS8ZU12sw=;
        b=c9zaW2VcJkHM5DKBIyx3v11qeNYdlkNPU0Dl9/1xfoYJWmPFuzvqZvh8cay6yXP2W7
         4l8aa3ibmStdS/M3/43kXJH3yqAjrDquRZBfJtgk7gnHyVKoIisZKtffZ1kOc0Ar59Ty
         Wx5mTtsPtEzDFyjFg5mGhpLF+5QiDxvbo2sPD6TTIMV2LHM4WqJZQrw+VNLOT3msdtMX
         Sy2y78EYbAfbAPq6zeR2KhhuLVQgKqTRRlDK2N1Cv1cdwED+IpZmi53wFSyGs4ChGs7Q
         4Rs/qhSOVATP9uEp5wc+gWygJr5fI8dqwO4Ne4m8j6K9MgtxgVfXA3SwiTFpkZY0B6iH
         ASdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147426; x=1792752226;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4YkMEnEcFAsesSJUaufOq7VhqrmQqlZmujS8ZU12sw=;
        b=r/H00fDwrrloKVKWV2NchFPBDS/KWzKL9oVZenG1faW9dbFXKLPCaZu4IzQvg5vOAX
         jxEVFAOvfCBd35VfnHq7V8xDO//lKpbQTGUj3Wo8HWXWVIFQvyW2nKlSK4gMER1zZSXU
         Sev6GvbflhuYhrAjFwJXynx1iaw9XmCw2lHpabprRbERaZkNQGV3BNsIIgsJrFYHoUp+
         aMhKoG7V0Rc5qQLfVbV7WqNkirHK0TpMX62mys/1wQklOE9EOc0QS61fUiNk/jcO5LXc
         SmBV4jGKQvoC/CcoTTUQ4AXTfMKhCHc1aiUsu+r1GDfDk6l1MV64c7maY+N1U5ZK4ih1
         kUaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhfLs0xUC5Ec9g9GK3UW/Ub2vvzSmTPuilUYwz44eInv+2CQxAwvwsSZdT6kRL6ulKt5C5WCGvoZJPhRQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI603YiGXdhTpRDyYGV9HTekR5FKVsI00Gx/h37+0zFOl2HtDx
	K3rTn+cD3Z31juQUONnrDojg+9c/SJ+ZeaHrqQhMxxsqKdefTzP6p19+Ae2sGEsVnXo=
X-Gm-Gg: AYBFou0whXdyb5iyAczom16nmUlxOL4+nuCiP8Kjk5/+miXELgho4DaAepdmT0rX3qd
	Se7HU+3HRH4I49NnTH7shn3/i9f3x0AVR02TAdvdaAXWf9PKITZgjXQnHfvsPHM4F138OQ/r8gm
	NJrhjdzYeZxzxY0EeEAv7YPw2P1fDTg1696vGYLlC0k3znfMzFS59/WyC6UhEAGOyzfdjQXM5jW
	S3bZ6xd499DuunQ2s2JsVgh5rgvJyeqcZibJYzNzUwXniaQzPsW2C/FUNyIwXItGYzk+4KPcBup
	ngD9cm8GpCPXb6SWC0DrLBcCgEpkG/cWM9FevuxwPUNEiYwlHPBrUY7Ex/pqgBlXs3nQizSsOAA
	juYS3hC70KOZVGzSP+4QbuD/8ExvArr80Qch0K/Xk5ldqTTkgDLB2ZtpLMsE/civ34XLr3o5uHo
	JjfA7jwddJ+VY0T5xBtS2rtJVpavyNjh2ZjD1XVZi3VPFnAYJ2hHbdwYJbfw8mpuiv8hGLNrmDv
	PLhDwRChhid
X-Received: by 2002:a7b:c3c1:0:b0:4a1:8849:17ae with SMTP id 5b1f17b1804b1-4a1c663b460mr49457595e9.1.1792147425952;
        Fri, 16 Oct 2026 03:43:45 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f9c41sm4500725f8f.38.2026.10.16.03.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:43:45 -0700 (PDT)
Message-ID: <f337f41f-2ada-4958-b0f9-379e78e96a3d@linaro.org>
Date: Fri, 16 Oct 2026 11:43:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 09:56, Jason Yang wrote:
> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
> for DSI and a receiver for CSI-2, and two consumers can use them at the
> same time. 

Two consumers use them - which them ? Two consumers use the receivers at 
the same time ?

Its minor but instead of "them" define what the them is.

The single cell of this binding selects the mode and refers
> to the transmitter, so the receiver cannot be described.
> 
> Allow a second cell that selects the transmitter or the receiver. With
> D-PHY:
> 
> 	/* the MIPI DSI host, driving the transmitter */
> 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
> 
> 	/* the MIPI CSI-2 host, driving the receiver */
> 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;
> 
> and with C-PHY:
> 
> 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_TX>;
> 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_RX>;
> 
> The transmitter and the receiver cannot operate in different modes [1],
> so the first cell must match in both consumers.
> 
> Two cells describe the receiver as well. A single cell keeps referring
> to the transmitter, so existing device trees are unaffected.
> 
> [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
>      operate in the same PHY mode."
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>   .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml     | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> index c8ff5ba22a86..6e8cc56e4986 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> @@ -20,11 +20,25 @@ properties:
>       maxItems: 1
>   
>     "#phy-cells":
> -    const: 1
> +    enum: [1, 2]
>       description: |
> -      Argument is mode to operate in. Supported modes are:
> +      The first cell selects the mode to operate in:
>           - PHY_TYPE_DPHY
>           - PHY_TYPE_CPHY
> +
> +      A single cell refers to the transmitter and is kept for existing
> +      device trees.
> +
> +      The second cell selects the transmitter or the receiver, so that a

The second cell, if present

-> you want to make clear it is optional.

> +      MIPI DSI host and a MIPI CSI-2 host can be described as independent
> +      consumers of the same PHY node:
> +        - PHY_DIRECTION_TX
> +        - PHY_DIRECTION_RX
> +
> +      The transmitter and the receiver cannot operate in different modes,
> +      so when both are described, the first cell must match in both
> +      consumers.
> +

Not really related to this patch but how do you envision that 
requirement being enforced, per driver ?
>         See include/dt-bindings/phy/phy.h for constants.
>   
>     clocks:
> @@ -82,6 +96,6 @@ examples:
>                    <&cru SRST_S_MIPI_DCPHY0>;
>           reset-names = "m_phy", "apb", "grf", "s_phy";
>           rockchip,grf = <&mipidcphy0_grf>;
> -        #phy-cells = <1>;
> +        #phy-cells = <2>;
>         };
>       };
> 

Looks pretty good to me I'm interested in adding an RB here - please 
include me in CC for next versions so I may do so.

---
bod

