Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618906;
	b=kS8SfjkcRg9sBiMREgsnC4k421PUJceZvVlWQdAi2UGvMAI7HFsfoZIbMIyk/1yHTuEK
	 sgC15RGENDclQO2AF0z8yLrpJT6q7Bltqhv4hqhu+CwB+6ORIwm0467PTnpSpg3OEDDLr
	 IBVcFSAFUdH/EDs7OqQ9cQ7ZqDZvmyh7Tr8NTL7lpzTFXVjV6mR4RSwNtZbwi27TTIww4
	 IqIRKaNLffnEZcv1/cYMuE27Oebp32nVv1dEDTi54PV4GquD+XW+zhB/XR8a8/RWSYJ/C
	 d10Gy9tgFzCvcfBl3XjV/HO3Zewcb7RCmfcbItl8xgj9eAxwFs6oCYZEeerNSU15n2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618906;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YAj/j/4efbhabnnhYe0OawMFMjQPvNoehqB7lBM/oH4=;
	b=eqEsZ+gdHys3MkCWdpqklPulgKVo1OgW8V1F3edJ9bQ5p+UYtGl+cggHYn5+hmwWdXeO
	 7dabxtniaGQ3yO5grcdb86QXtAYoLHsGCVun29yYW/k8FDwrRxj/FuEJKFnh683+Ivp7l
	 sOXdrIuEH1pd8yxm4WnVifUvEaJdYcnxmtVrStoe8Tg39lN1YooB7tcTpmlnK7n1OLZ+r
	 PC4ktv5gnOV5lX2kVFGYDTdzGCD6lRxmxKFpsQUQ9fly8z2Bi9G4Dgr07QTX+ML/tAr+D
	 0oAzGaHAzuX+AYT5h77yUDVvtQzh3Om4qH0fWkmTyqBEGuEFaLZrR3rfhsj4o4u1z7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Se/JwnRU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9060A2610;
	Mon,  2 Nov 2026 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Se/JwnRU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B841F00A18;
	Mon,  2 Nov 2026 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618905;
	bh=YAj/j/4efbhabnnhYe0OawMFMjQPvNoehqB7lBM/oH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Se/JwnRUSvAI174uNSFWm8zut3t4wPxKX5b6eyWLnlfmxFJ3gkN6dGEFZP668euNQ
	 OvJYYgJz4nE29c3PBg8TbI/Umvjs0TK8ynMEiLVIgqDsz7l2kU9HQp+ClIUHBtpR91
	 x5lS7QhfHyQ953vDyfEQjpGryIcog9WtJ87zbvsoRHiaM6LyQyH7p+fxlzw9wPKzKt
	 QBp5oHWfuF1z3Wb2VPyhiBXYb9SAtKTpUFfFj+fCg3opeWkwuw4jdb7P6bJ+1SCAd+
	 MU76NXBDYCFd3JJKikrSpY2LrsUKOOZXt/LnFpddxT7kXRQXUhVwWtpeMA2h9IXDRw
	 BZesqZeokXJ4Q==
Date: Mon, 2 Nov 2026 12:28:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Icneowy Zheng <uwu@icenowy.me>, 
	Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: document TH1520 MIPI
 DSI controller
Message-ID: <20261102-spry-snobbish-hound-384cae@quoll>
References: <20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn>
 <20261030-th1520-dw-mipi-dsi-v1-1-753f34fd304f@iscas.ac.cn>
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
In-Reply-To: <20261030-th1520-dw-mipi-dsi-v1-1-753f34fd304f@iscas.ac.cn>

On Fri, Oct 30, 2026 at 03:47:49PM +0800, Icenowy Zheng wrote:
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: DSI controller APB clock
> +      - description: PHY configuration clock
> +      - description: PHY reference clock
> +      - description: DSI controller input pixel clock gate
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: phy_cfg
> +      - const: ref
> +      - const: pixel
> +
> +  syscon:

Such property names are not allowed. Missing vendor prefix, missing
descriptive name.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the VO subsystem system controller.

For what purpose? How does this device use VO? What is VO subsystem
system?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - interrupts
> +  - syscon
> +  - ports

Best regards,
Krzysztof

