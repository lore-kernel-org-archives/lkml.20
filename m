Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827292;
	b=2+Evnvj6moGkaFXksU006kKAVU6X3ryDd4zhMtMws4wlz0E4ztpLtgBGzGKxYPMIZdNT
	 D/IQVG75YtEYoGKNd5bSmdkB7OG6nypEOqXg/5h/IJ4Aiq/Xmjx8x6hTUyL6PeDCF6tss
	 0OklD+APnyW3XBOkrfAaELipxl0zdzys56boma3zwJKA+bxPkc9AOYhwQsJoYCJJSFQoW
	 TIb21oSbJllWdF9pvWdXOXPzGoHZakZL3wASh1LhcigwpbcGXN3eOFgm9n2VhiEhyy/gQ
	 EqruR741MNsOn5t7CuLwmgsDlsE9b0jN/dbFtkFbUdQLPSeiKMDs0X5EO4XchHruWzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827292;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Tnrm2Z2gquTMYs7zQc0+lDwq1ETpRKjpBdm61ZWYAbA=;
	b=r2zJ8uNwFR9D/ZzKzbuMlP85U/IBFKG7R6nhfFKUXP27koNtPIGu34WTfengRq2yl2zH
	 MvkfxwE/iqAbcdmKSlwLO2+1Adz2wOgQSnnukqZUFY50vPSl4VZyjrC4hiimvyt5wx0W3
	 4RG3Fe8SZDqQcFr+XPeAtiTVRxUcnXm7mpPHsJVVMesLDyC7cZfgRmiT1rXXe1dL/zVw1
	 RiXceedRm0odrYngX3NsQJsg+xY3m4y1zYmX/0FSNDBKyCMO8AgVwypMZ1QESSEsk03RC
	 A509I1io6TmyoOcovoVdjPHu1vtgklz31bTJ5kmiJj3v6wqA4/j+Iqy4y6p7vl0ahAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kA9kqj0b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A0C606AB7D;
	Mon, 16 Nov 2026 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kA9kqj0b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660DF1F000C4;
	Mon, 16 Nov 2026 11:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794827292;
	bh=Tnrm2Z2gquTMYs7zQc0+lDwq1ETpRKjpBdm61ZWYAbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kA9kqj0bVGLJ+0hgWX3mQK7tsnOtrkdLxxkiq9XUOP3QnAvTssJtqePgvEddgIMbI
	 zFkKjHqZGJmovUAMM7+oQTz/OBhvuk2ymX5MKea36ofZXzCZqxCZI7p+MMuP7wbH1q
	 vSPFwIm2MLhvvUbjWV0Knf6sJhfL2wR4/QwXnCzou57y+gDI+UUuwiRPChrtIAF5NK
	 +hgSR62YModftceaJmeZiIgTMeedK9vLuSut+6KNRsEN0UzHLgzcmm+A7JqyhS8Fcp
	 7BTmJw7cfAgVgMmDTibW3a7eOLVdoKZJ3r29XUBGLhjeQibpfrn80gCrTDlqzYxTiS
	 1DQnVIvrNzt2Q==
Date: Mon, 16 Nov 2026 12:08:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yanli Yang <yanli.yang@bedmex.com>
Cc: linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhirun Liu <zhirunliu@aicsemi.com>, 
	Dijia Xu <dijiaxu@aicsemi.com>, Chunqiu Liu <chunqiuliu@aicsemi.com>, 
	Liheng Wei <liheng.wei@bedmex.com>
Subject: Re: [PATCH wireless-next v5 1/4] dt-bindings: net: wireless: Add
 AIC8800D80 SDIO Wi-Fi
Message-ID: <20261116-foamy-bee-of-will-2050bc@quoll>
References: <179481380235.4.7388336477392853157@bedmex.com>
 <179481380235.4.9476425206200425967@bedmex.com>
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
In-Reply-To: <179481380235.4.9476425206200425967@bedmex.com>

On Mon, Nov 16, 2026 at 03:23:22PM +0800, Yanli Yang wrote:
> +description:
> +  The AIC8800D80 and AIC8800D80N are Wi-Fi and Bluetooth combo chips.
> +  Wi-Fi is attached over SDIO and the chip variant is identified through
> +  the SDIO vendor and device IDs. Both chips use the aicsemi,aic8800d80-fmac
> +  compatible and the same device tree properties defined here.
> +  The node describes SDIO function 1 and its optional out-of-band wake-up
> +  lines, and is a child of the MMC host controller node. The chip supply
> +  and enable line are described on the MMC host controller through
> +  vmmc-supply and mmc-pwrseq.
> +
> +allOf:
> +  - $ref: ieee80211.yaml#
> +
> +properties:
> +  compatible:
> +    const: aicsemi,aic8800d80-fmac
> +
> +  reg:
> +    description: SDIO function number of the Wi-Fi function
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Interrupt connected to the WIFI_WAKE_HOST pin of the chip, raised by
> +      the chip when it has data for a sleeping host and used to wake up the
> +      host from system suspend.
> +
> +  interrupt-names:
> +    items:
> +      - const: host-wakeup

Jusr wakeup

> +
> +  device-wakeup-gpios:

> +    maxItems: 1
> +    description:
> +      GPIO connected to the HOST_WAKE_WIFI pin of the chip, asserted while

Looks LLM hallucinated since same pin has multiple names.

Best regards,
Krzysztof

