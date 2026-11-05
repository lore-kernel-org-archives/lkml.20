Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793889328;
	b=0jWzueDdeF5CNtONCgRICtq8Rs0LQtXtGEBshnWDu8dudlK3UOJM2v8j6R42iPmLU1u/
	 qsQ9CrmTEyPZncaKvEasj12c91H63RwZSgcfO6a7CyVMebAhazsY7nRbA+si/gKWoTunb
	 pTMMxKB5niuoK0f/nhEvFijTPehKve19u3iaY0dbCNJUDZ/uTHAMzi4NANdGiJ0AlgHwF
	 ulRZEPCmbElBm4GSWFz8JQ5lGd+YjVSqeWjsk0/GItZcJGoljR+bcNvzVuKaD2iCfOgPx
	 F2DVUOvVMHvQWbq5mD684JH9g1brzlGIqSY/WNwvm/cPUlxbbOd86C6CbE5kgG3RegA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=;
	b=SHiVH2iwKmpKwMfawg8rcFmnZAtQhVotP1etKoEW8cPTR9My6KKWgA3rSBYGV2fm0R+3
	 /ZiqeH8U0BVOmbrMGd3goVhkJqVuxRq0l8Z7sFuhmIfYYjX14W9xP1zBrMVBoADndYsUT
	 84cuJIjT3F4y28YretJF/TbffGT/WVYzpQyMZMWlFEK3HN+gtnlnv9palIH+OL7NF5/N0
	 LaROxu7xZIFIm5ytLIxHCNBRZhpNLEdgaVdGr2QnoFu240QyO2Qab4YnH8W4za1soJ1om
	 +jmxRfVchZqOtT3M8035mukYiG27EAEH6rm/+cYgZPpZsL4m72XJ2rVxT0J9UvvbuqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b="Me/qf0GG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B0F606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B0F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Me/qf0GG
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-886e61fa30fso910748b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889327; cv=none;
        d=google.com; s=arc-20260327;
        b=EvuwxXZ2dueWrozxGtXUasQu5iOyvyk282Fg2IiF8bIDh5G1oQ6sVtGTEvPm4aPiPK
         D3XiKsTVezm5PwZLem0EVQ4CDJKtq9Gzf5tP/SmYOpVCpbUmdX3bqjB4HP5XunbNKJP7
         1H44Dh0mXtGyLZl+FeXvQWtfwmsELatn7ToIIl3+5aByUEsglX8H9BJucTOxs0tRBVBW
         7qhHP8fo2R8cAA3oV4Y32iz46Wukhda6Xy4XoZc4jSzRWI0XH2KVmLWkhFOG9t/uL/Io
         QspMyucJLcFYhMjYW+/cZ7daoypBqvpNXc3GL2U3rf5ja+nuC4fSV+vynSGZHHX+nLEa
         mCiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=;
        fh=uh7hGNIf358FVvTKpnxG1ttr91LzdU/d+1R1BZL6AaI=;
        b=hFzUdGAop7LPUdg2TQNLrvNBikWZaOG8vm9bsffssZQf1Elqk4zAMxKoU6NDuA6jpU
         3UiNnqd2Xq+33usWWr8UUs+roM8vT1ja5gLcj8gwZSCeRuvdc2Ux4+z0DoFK1F1k4cQo
         nTxSrvllVl1uolVfNI9JIv0SkxKtM9JvMF7J90KR1L4PsAn+Bak6xC/ibkRCyNyrW5nh
         YWLg9w0ZIzc4ZDQVuiThOMyOxWHpDmUdIvct/JJH+D218WrJga9cd0iXI3wm2LIhft3W
         aVWzsowsRZjJ7D/P6bAtGubWypsj/9Ds3Bti346iyEaLcvS6HjMyH3drnh/66ecx9oGS
         GvNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889327; x=1794494127; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=;
        b=Me/qf0GGQl7p2CLtA6UaauD3mVPhNfPZ6j+rMbzFCTrHwPgiOWrruC4R7wOiSLDsqo
         q4wbRY0oHmY0K8JiqAKm9J1pj4tJJftZiu9UrwIySoSSBeZz060odCbcjACqxZoG+tqM
         GvKUJhk/febxO/RSJM91tFI5H7yA+mDnojqoME7qdjczkfUyNwr9GLKrfk8awmCwKo3N
         QbjsXR1lROlWQo41cUm68ebiArEPwnfjMnt0Z2GdcYaJY4UeFsUHVbNAQx4YN92ig7bU
         wWyRtRFBy7d1BscGVrMRhvynGCUSbepbxsFlX6alToFslnbPBYY9cyH/JZy8KgBr8jJm
         uF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889327; x=1794494127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=;
        b=g54TVGLPIePF1lL9r33BpfCZiE6OIOnBtfVbhaa18EhZUfurEPW9MIoI/IX2F1iAdl
         dyXTiVcz4nd8XpyCdMxtmgbxIFG8E16NrYR2WeKi/MkWwGPpJ2kv9+IbZsWXM4dW+b/A
         +qYd9ZoY4dbdCsn52cLoWBMer8On8yCDqEhABhvPh9NL8kjWQP/fOqjGhwB/tDm7BFms
         +ZWoBRYdx3Dgw1M5u3aOLE+Ya6qgPfHfTYf1vCFzGgFxPYbdG1Z1b+ku8F3oCPnx43Pp
         kJLo5Grsi0/TxEMNpd+t52SCXqIv6G2tjaCK6rPwHIqPzp7+plvPrrgHkaOUXpbfx3w9
         rhPA==
X-Forwarded-Encrypted: i=1; AKwUvByorLHJT8MrycbCPvNl2j69GPdXTYLW/XbhLulpTgsb6x4sMsg9R+PhYbG+NHnpxuCcjA/okJ5dzFZKj4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0ssiMm9RoHWxh4UiD+YR/DFY0OI5fQa9Wzu/iiLERZvzpzsay
	g/ThzPjovA0Oh70NSxgyR76GtlPTRETfJwIBu8xkV+FWF1gtUxs/Uv2cORA9sd3D424KQrEnnP1
	K+RjLCwUkV1oKDq13ZlQT2vqyk6BWkzYmwL2E4rWiOQ==
X-Gm-Gg: AYBFou10IEUIXnRKQ41acvDpZws7+zeVs5oVxN7QP0O26BQEAntD4xQuogjmhzas++O
	s46JFQIephQZhylh+u4h7Lk5a+ZMyDdueoLlAQIyHdhn0zwGIha+/ZCbIYvOaL+oGAlB/0hqdMu
	XmaNbntfv/gabmntVoDbQPdkFEFZn1WAKGLs3NcLekDnlVQowN8pSkKNPJ9tsgDmvWFB7r6JwZS
	U/1vPtWH46V3AfBFPwVmXoi78H4aTC5Qlx1nw49+C78Sst3oReb5gXSfmtZqO0SB1hqaoqn4M8H
	Bka+4O90+UeqEUi9Bo6Nd5KsRzuuhjmJSzr+ZyGifrb7+KwfVuLAAsUz/1kLrB/7aC4qU7UEhfC
	N4DMTqevLJul9q0PzwfdjnWqbXKiItnsvn9N3kMOQsrtl1zoM4ErjkqlofQ==
X-Received: by 2002:a05:6a00:21cb:b0:8a0:6860:cb16 with SMTP id
 d2e1a72fcca58-8a9ba806f4bmr13913523b3a.8.1793889327094; Thu, 05 Nov 2026
 06:35:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-9-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-9-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:35:16 +0000
X-Gm-Features: AclHuK_n1-N1ApR-k6d2Ij0iknOGmj4ALZ4zRGpX5gsfuT0639_6holwqyNMTac
Message-ID: <CAPj87rOutcy5VhtmqYg=YD4OB6dbRzxyaf1rG2kcASp477X6og@mail.gmail.com>
Subject: Re: [PATCH v6 09/15] drm/rockchip: vop2: Use TMDS character rate to
 select DCLK source
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> The HDMI PHY PLL can only be used as DCLK source while the HDMI link
> operates in TMDS mode, i.e. for TMDS character rates up to 600 MHz.
> Beyond that, HDMI 2.1 FRL is required, in which case the PLL would run
> at the link rate and VOP2 must keep using the system CRU.
>
> Currently, this is decided by reconstructing the TMDS character rate
> from the DCLK rate and the color depth, i.e. DCLK * bpc / 8, which does
> not hold for all possible output configurations:
>
> - YUV422 always transmits two 12-bit components per clock cycle,
>   regardless of the color depth, which from a clock-rate perspective is
>   equivalent to three 8-bit RGB components.  For example, 4K@60Hz 10-bit
>   YUV422 requires the same bandwidth as 4K@60Hz 8-bit RGB, typically 594
>   MHz.  However, VOP2 wrongly assumes it needs 742.5 MHz (594 * 10 / 8)
>   and ends up switching the DCLK source.  As a consequence, modes
>   requiring uncommon pixel clocks, such as those corresponding to
>   fractional refresh rates, will fail.  An example is 3840x2160@59.94Hz,
>   which would likely rely on a 593.407 MHz clock rate, unsupported by
>   the system CRU.
>
> - When VOP2 processes multiple pixels per clock cycle, DCLK is only a
>   fraction of the pixel clock, e.g. RK3576 halves it for pixel clocks
>   above 600 MHz.  Hence, an FRL mode such as 4K@120Hz 8-bit RGB, with a
>   pixel clock of 1188 MHz, ends up with a 594 MHz DCLK, which slips
>   under the limit and wrongly selects the HDMI PHY PLL as DCLK source.
>
> In preparation for supporting the use cases above, rework the DCLK
> source switch logic to check the TMDS character rate computed by the
> HDMI connector state helpers, which already accounts for the output
> color format and depth.  Keep using the system CRU when the rate is not
> available.
>
> While at it, drop the VOP2_MAX_DCLK_RATE define in favor of the generic
> HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ, since the 600 MHz limit applies to the
> TMDS character rate rather than to DCLK.

Reviewed-by: Daniel Stone <daniels@collabora.com>
