Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705735;
	b=vkOHZTWEWfI9SHXupnH5NcegLw8FXzslKCFd42/l1Hvhsc1SL85CNmhOukU9B6+R9GgI
	 LLOcdUYO8Y5ZVxFv9QbU43igFHtjW4ki7EaGE3wMVsOoHOAooDFUM1w38KG5d7+0X9LFI
	 e4FAJD6P3jtITbpaLohCV9HxmOfCz+MCg58wg4z7/VjkunwwMsP9KvDoPabrIY9IJMX4p
	 vSYSMQp9j3eGOWKJcFnXt+iVJt3xB+8NtW3rnaFJX0/dp53eOwgc8ygHPRu9A0dZI+y6U
	 6JwGw8ft+mHDywSH+d15B8YDfuJao1iO5cjoVmhCgusFDEhLlscLhA1HVyXrVitX4dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705735;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LKUnUURPxCCQnn0/zAL5oUiqitujy5IJ59hG70436C8=;
	b=Wm06G6XrH3740b4wQXj6PPUzyj10hKt3ChrFgYS5Bi4WRavXUY4ndWp+RL3KedoD1oEo
	 7x5f6o2FkjYtik1KNUk3PBFaMA7kYFg7hcEveFauE1Xu0Z7GkWvte/ZKrZ/oyhSYdZ++M
	 xfstvXfAYCQr+V+QNDBztUuHz3EQ774ck86/nlND2tH4DHYUwgk0Ue1X3cGjm5UXtawPy
	 Wr4fpOPolyddpVdj5Lyq48y6Zi2pYmHkD+vbm7nmXi0RA3XR8qgTC4HAhWfsZXUe70IP1
	 g5jWnzoaD0puSqmJNd6+n4+REqfvRkheKPnFjOhVZRSQomQrzSgeY+CoBdd/mvEhfVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1ECVZnz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732E5606A326;
	Tue,  3 Nov 2026 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1ECVZnz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D331F000C1;
	Tue,  3 Nov 2026 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793705735;
	bh=LKUnUURPxCCQnn0/zAL5oUiqitujy5IJ59hG70436C8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P1ECVZnzr9CJFL5gouN5bcvYxOOKQPlPPcVZy6yYN1vQrUnSjQV3w6oMe1KVR5lEi
	 zocpyAnPKFclr5Y04gMz3QqM/sKExagLeaV/dcZbYyiVNagXrDl3kRVRdsjUrjD3yj
	 9P9GS07DfygIeKkwAAajwhGA/HIP7Rktz/VsP1R7w0yJMOyJbFlTVy6gDw+Z6pt2Az
	 HLCuQtNXGvXVS3NLvljGFevVAQpDQQhgv4/bP0TKvE8iN1jFQytA36LhuJtgBd3D5d
	 UwbjSctQFgA/TiaVKGxuhWjFpvm9+dkW+FmotioQU2Xv5ticgT3AHP3hd1DppRI4vG
	 fLYY2cBR7ZATw==
Date: Tue, 3 Nov 2026 12:35:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guido =?utf-8?Q?G=C3=BAnther?= <agx@sigxcpu.org>, Robert Chiras <robert.chiras@nxp.com>, 
	Tim Harvey <tharvey@gateworks.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: embedded-controller: remove
 #address-cells and #size-cells from required
Message-ID: <20261103-poetic-comical-skua-defb5a@quoll>
References: <20261022-cleanup_dtb_warning-v2-0-e9502fafec59@nxp.com>
 <20261022-cleanup_dtb_warning-v2-2-e9502fafec59@nxp.com>
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
In-Reply-To: <20261022-cleanup_dtb_warning-v2-2-e9502fafec59@nxp.com>

On Thu, Oct 22, 2026 at 03:37:05PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The "^fan-controller@[0-9a-f]+$" child node is optional, so it is not
> necessary to always have address-based child nodes.
> 
> "refer to the board hardware user manuals to see what features are present"
> Means fan-controller is optional, which may not present at boards.
> 
> Remove '#address-cells' and '#size-cells' from the required list.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change at v2
> - add descriptions about why fan-controller is optional.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

