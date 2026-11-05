Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793889249;
	b=NEXzpWJz86EP5GRYHQ+3teM+1Fc2xzE3dc4zhN5oHP4lA3z3t/4/IF1oNirdQqafnYsK
	 PAkztBg7Wm/j2UMd0lFxeJ3AmQQrMK6dLKmS58uLyiR3kd8nMCfdkroLwAzw+HunMsbF4
	 /4Qna53HOpBMIRiMpaAJO1qma0L1VRfIX4PsVsZSXGnViXuh82W9s8dhcBDlkhHn6HAZx
	 hwu1DE02KYkPuMNM+eDBIdxYah6MpT/lZspx08mDBPzy/sHrEJd/YbbitglaFkVdPIiFZ
	 WSOyiT2nROkJySgdnqucTx+HAqc7ztYc2driaaeRX+1tfIkrkvE3/4RqZJJUyAJs+FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=;
	b=qGTScZEN4J8hFa6CF4Q1Ecnxfl7QwxcNnqBpPjPfJis/gDHtI0V9zdWzG+cTqMR1dKGY
	 PAEXfOhJs1FLLqBU1ccXwwFE9JOLZPYuCfGuOccP1PSwya16mBel9hg2NRzxOzhoKOEP9
	 n1e31vd0gkILBLCWG/3hdWITMdxI5Ld5zpzVYTwj9UpKPuTeFzkQtBjUznD1N6tAcqAfg
	 fMSxViUMgRoxp5Cof1mS5jAaod8fXyswCwQuROp5EJAoYpSQyjshYqqQMuWSpctbiWrrw
	 RDf2jN290dLJnlHc1W1KtQlx4FiTTbD1xWwGi/hvPCq53JTzkIPZCBgMg8197HKWfZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=hZn452jv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F423606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F423606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=hZn452jv
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06210b29fso1077811b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889248; cv=none;
        d=google.com; s=arc-20260327;
        b=ZbHquXKdruFdoQmMX62k4GMIBwsGrUidJPFZtg9txjM7JVZ5Ddk22W0NfyI0a3jMOb
         tlMADvsd15sbB6OQXXA2g/Vb4MnvwfjzWo0p+jVCOtTV2B7zPzOJwaAaCcJSjn6UXPFz
         9iZu2ruk+Ih08xBmjX9WJ5EHUlyY7sti/kT4jeHrTMng/KhFgEHmjJOFg3yQkbttJA9o
         miawPs2oxCU21kJ6xhdv6AXJSY9qpcouf6FDLXjSPncyR8fRKS+Yusrs2oSn9yPlPmzt
         Ljl9NmI3yDvAkW71jiWx8NIWC4luiF44wGZT3geL/kuxDxLQ10xRasv1HWya8CLSW3al
         AMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=;
        fh=kKZevzZx28GJg1zT2mb9Jm648Njme7XHJh78zoqL1eY=;
        b=FrGMbwh6KpuEh/PBfokbqQHCdaWRbKRqhIbluuv4az513jOqI2uh57qnXn3y9KW33f
         HkFHj8xxm7jvIqz7mpHOffatImYve/H1fmadiBppuRMjZRzcGFtXpT20Y1c5RP5b/aVx
         jJ1uZCa0HPAaEPMCJhv29bcy1gCiT3RpQQskjXFeF94EO3drn9MvNaQQN92H0Mz5vFEY
         IQ4eXZWGS9q1AIu27MYlvVab7IxZvfmlrkK5Tr6r746Z+ysaLVtBs5lLH99816QKvyND
         K3rwy6p/0YS2rWsV+3neyEr0TJeR8kAzZgiwpk5bitbrxrR0tooBuF9zlqD2Qjv6MUTL
         8t0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889248; x=1794494048; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=;
        b=hZn452jvEIQ6KXYQe6zz7/XEhlWEeO1EUuU3NlegSbQEq6BhDga8GKLHcqlBGo4jjy
         IvPJAVwJMzuTkngSG3BF6HmOv0WDodbZjI+Bhfv0+2ebD+t3JpUfff7b3RnvUhh0Zg7K
         TYPchv3GUX9FOP3c8mkdX/BvAqSZrqclbtEqG1Qoh849HSc7mBUrktiU5XO4ebYu16ZK
         Ud1rQznrE7F9xpQkbIHFShDNloXf8z4f6tPQW0NzMFKskvA44eadQL/9mAQW3HfuZRHr
         QTgDIgZUq2nxaOgk0gbnaLmpAfjk4FCa2PqIMnrgQW07YBpAUUBsvlNRVfik6KXzkXWn
         gcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889248; x=1794494048;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=;
        b=v+KCvfWJhSBMCk9R3qJzGVOJXRxjEZ88OZo5cwFU0qmFXFBgZiiGHOp+OmdD3CgWGs
         STcdyt5bEu3nvqF9UkIVF258faL5MCn4sVVRDoom47fsrWb9Gx+lXU5DTH8C1Q8RMVBD
         aGG40Kp+QYma1eO5gXR2driy8mXsbdvzGK848yFN/r3sOODUvCE9QK1cbsrs1xdHVxrF
         AsDWFBovM5O/1gwWK2noevtTFDfQaas46Wnsdd5k/ldpS3zejKCSbTEildp0MxjjRT8Q
         2d+/jbRxF19iDGDmas5r0fOd/fwAXIESdDNhkskagH7Ofwj6oCsFQ7Pq9az7QczNMnEh
         1dag==
X-Forwarded-Encrypted: i=1; AKwUvBxaGzxoyLD6uEQwj7Flw03ZDnWR7sGnDO2TGiEZMXkrMJ1cKCTgzIdWljiGNOhoBXgIpaicPPDJn85qPcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RiryVx6mrwlMG8l4dFEpzkbc7NNSl1AHE3sGZN3HJrKVz1dpu
	9mF+6K7FtciuTj4AaIb5VLUYACrGR0wqFsDW3gOnu44Lhh+x623DvhGF0G50F5PBA+jfktNeWs5
	be1pDEosGzr6Xc1cLvXvbIm1t6CkJT9F3l2XRxWOHEw==
X-Gm-Gg: AYBFou0ji4c8dte7LD6KdJR0DPZ2/n0NB0riBdAXIqTCE19zNhx/9f7zWS1mrAyV6cb
	OsACbRZKKwNCNapd7/yQU+FNbvKoHO+95IgqNbB/GuW+CMiYhPCXV2FnPvUD2nzLqGIzKKTZsMn
	VPzHGbY2OxPQuznPpE8IK4Xh0eGI72GMEClN1vqqNscT/ZasM8ZC6Pqsvfcu/XHENKyilVQ7X/n
	Gax0O4yjkvT73z6Msdim9ilHsJVphlBs9MzkPhvz9v0eZZr53GH6R/vWjFduwvcMYzGOMRghhC+
	5SSuq1lQkoymaboi3r9YRDk0eKJ7kqMxvOASyTo/Kcj9lYonCNly8DQipr2y8ahlliBrKS0Hycy
	DuZI9Yr0JPLGIqhS6hSTktQ3dSt+jflz1qazHjF86Pbpf7sHeSH8lmeGeOg==
X-Received: by 2002:a17:90b:4cd2:b0:3a8:a1f6:3b32 with SMTP id
 98e67ed59e1d1-3ae89772b3dmr14182837a91.38.1793889248197; Thu, 05 Nov 2026
 06:34:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <20261105-dw-hdmi-qp-yuv-v6-8-1bb63ef5766e@collabora.com> <CAPj87rPk=girxTziKY5ROV3ZYqGhKRz471BLWpkCjtvNNseuog@mail.gmail.com>
 <7b86ca7f-fe7f-492a-bf88-0ac7afee3963@collabora.com>
In-Reply-To: <7b86ca7f-fe7f-492a-bf88-0ac7afee3963@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:33:54 +0000
X-Gm-Features: AclHuK_cuDuuWPdBNDPf4-o5prQpG_rTSQHgkH5hHnp_VrKYmgc4urnB9GsSVjA
Message-ID: <CAPj87rMWa0wyopX6D2dUSYLXUYS9wvzVUFeKUh8coTxtF+Jf6w@mail.gmail.com>
Subject: Re: [PATCH v6 08/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
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
	linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 5 Nov 2026 at 12:56, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On 11/5/26 2:18 PM, Daniel Stone wrote:
> > I'm confused ... if we have switched to the PHY for dclk, then a mode
> > switch wants us to come back to the CRU source, don't we need to
> > reparent to dclk_src?
>
> This is actually done in vop2_crtc_atomic_disable():
>
>     if (vp->dclk_src)
>         clk_set_parent(vp->dclk, vp->dclk_src);
>
> Mostly to ensure the PHY related resources are released when not in use, e.g.
> after unplugging the display.

Right you are, sorry I missed that one.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
