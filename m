Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360922;
	b=ykTPVEGKzxZE4o2tTIRNqrGu0RPIilDUfKBU8mF9Fm8pNW/V2BLVAIekRRH8qq8m8mx/
	 cwlF05CAkd8lkrOPtdn8c8Zk8rwecwVZYHw91+XmZdmGJYSiDKPFlrsGzCnegJCIYQShJ
	 Dvw+oJPyjJ8xr6TPfEXIaUxmjdhXtG5Pq0MbABJl8sDKZRWcwMT8Sou3lcrud6iO327Ut
	 G0d2KgD/81JU+8/ck2f2pdMBOPkaksfr6peS6XnIbONKwfen7ncybCavxjlhAowY6iF23
	 qNrZSUd1Qrt25NBoZIIV0A6aMP8NkTtRqekBvxxRpQkWdo5mn8dXWIFpwcdXw54/HqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=;
	b=jbsHFq+OCwzOVHJxFvzaZ4DtMRnV8soRHFUAtyTHyV7RwAtL90/ScAKVNazXc1EaMTeB
	 s1Ng+hWN/2Nvyp51KdFnyypApaQdCWdERgagiDYQ1QhzMWAekSvbL3Fl5M1XbCd0ftVfp
	 VZaI9S7V2eP3uR4oVMwrRfWSD4FQ92ezjwPQatBPrYbqUpssc0HgupR4fuCMKXXxpKfxc
	 IEec95Vp7NOmFcoh1u7d+KlylNCT+UdE3oJcKwIuuQ5LYPLbRvshDXfY0MX4oL0w93Gy7
	 dT4Jw5drB7z3DG/LoSQMd0TIAWGESJCfB6b2n1tSAc2uwuxBBbis6s+hRCPcPWSoEEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=LSdvu+y3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942EB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=LSdvu+y3
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd623dfe420so416422a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360921; cv=none;
        d=google.com; s=arc-20260327;
        b=g4PRVVyrya3cj4J4tH6Uh6IADQtI1+LPMY7+u+7o2EYKWXRpuEpTIW7GK+regJGRiS
         77wR33hirmNK0jFVc6fuRgy8EEs/oOmd+Qzr+vPw5ijXRh7Ds8QEhoKiztFHLUEmr6AP
         fEAzO98Ytwb6G7zTrFkt4N0jqKw24yd+uylm+/mrmE/mipGTrJd54rqmV+mj+mYpEdfc
         tznStwM1ME4fBrig2VMJJp465koPOZbZC38A7DgtPYvHCAFVbh9uRuZnEQKE2cv9D9+n
         meyWC9pUfHMdj4SL3uu07cwjsCguCELOVlTnpJw7/OrLp8UlNMRe9w+byTFx6MiONurI
         ml9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=;
        fh=05ciksguoz+X0anCG8vEaeBMSBaDM7UjklwhFdDilow=;
        b=GFSL9IHbRu3tQTnyJmo2TufDrXWH9xpqQ4hzldqhSR87RAjbzsdLu1HcQqwJZqeEsu
         1oWMO59gsHRQGEnXFpiSuw+YVnaW20ucJLlDAtr34dlcEV+5Ki7Cj/jm43L9+w3QLY/Q
         jcM+tRc7Oe8ZhRX2ffr9fV33FUgpzLu+px6DiAc6OFgbuJ71Tult4pXM/PWdoxlDO1Q/
         H7ntnz0s2TIxtVfj8zTZ0gfM5FU6yfdKbiHVv3j4IaChd9lhC5wtOFMFYCSpywcNeiBg
         1t7ctC11QTGAiL8jdtOaaMOw5a3i3XszE29rEBajjnTfLSMWsfqcfCzHMjzjtndSgqCX
         fOqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360921; x=1793965721; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=;
        b=LSdvu+y3IPgRcAtg5miAIlPbVuoMPy9U227DfxhrEUc8OusbTn/n4kyWv4rIf5N4KD
         kb0MeajT5M41marBN+SVSmLB42TAhxaXGb6fI0cUSHaWjsAEGYqmlFIkW59zpAvebknQ
         xaDbsDAyA0pyae5AkMfKJKbuVWlX89rdnUILjmpOMhG16mjCi6pJKx2kQjgjom27KJV8
         e6OWyIcV7NqM1RBbja0vE1wTJC9XZ0ctrCh9PwQHcYZTw1+MC/Qce7hNAZAImXVfl6KX
         HIXgX0xhL67Lk5sFtaB06/YOwieAxWt42lgUp01mG04sRvW+XTi+rJcBWIMf+xuXI1lc
         Hp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360921; x=1793965721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=;
        b=cyK1U8jZkknpDBgotfojqJiW1MY7ELH7PTwRgJFmunZDj++I9/CqBORd5VY5dObyjE
         Lo+ed9RfAmdoV2ohBgIhHSsqv1TS5qezTbUBMAHBgD3jDQ/uAH3wU3uLgmktNn9PLH30
         KL4Pv3ZX7N3jlQU1iY8eH8+x6KuC3+0Bi/OBgk+F0HQr6IzxWstl6xMpvSTClU6998Q+
         7GCXukEL9VRJutkniSi16+E2I3YADs3DfzA+P2TN2T8A9SDSGNFwm4fMmqg+jiw8PRob
         42GGfeiSdSzKcwpdcOuBQMTZymMWLs90HeEFpNttBtFX/5+LmouyzaAFR0FzTpdbcp/f
         faGg==
X-Forwarded-Encrypted: i=1; AKwUvBxpaqmMgdSlGFBO4KzfDTQ5w76ETpzDB+7uNPC9+N+QK3YAeXTfPkXbNG/23D5SJji6BDY/5QfzB6v+g9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLLiKrE14Iz0QXKLOgU15gfCOhPUgXRGIGWhiIbzhiKOcx4Mh5
	itiXH/ZiFPUQ6rG2s/TmTkx8jMUOdQQjxsT7xIOMEWzda/zay1K3IXuwp91Ba5+UBVLwzWYoe/S
	8OxFkTr6tO7w9In/xbNywsF+tmlc3k0AOIDdBfVH1oQ==
X-Gm-Gg: AYBFou3elCNV7I3B7faCx15qIlTtGimYjWtFa1CB2Jo+BgrcyvAPiqIWtv7CooHi9mJ
	tZ51abWjbDn6AgAWGtzOdzxcLL3i5YyLzhG/Op7TY/9UXN2nKFR93SmS3FNcMYf1ahwSBYOw2Om
	gmi/Mlcj9Zt4gs1RkXcRUbZnPnwDWPTC6ujyJTFP2FIa8UlR7cnuBpdtFQl5QRKy3wCfArkCSW1
	qEng9GnBFeH12YCZ8UEnW2XH/9ivbE3gZdml98s91H05XsT0wuUaL11hdMMjsL3gO+pjAvoOF4U
	j0DqKL9pB5iCFGuZ2M5QF8LqJ7iwjkOGzipnHqiX48crlIBIgYhtm3J3SdA1IsPXGcgqOQbQ3iw
	fo8RB05DM0RP2MFN7+5FZtICFH7XmNNyBYfmw9Lw1++4eYplz9M3AaCYzag==
X-Received: by 2002:a05:6a20:d10f:b0:3cd:3e77:1dcd with SMTP id
 adf61e73a8af0-3e928a7e442mr2014372637.1.1793360921012; Fri, 30 Oct 2026
 04:48:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-11-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-11-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:48:28 +0000
X-Gm-Features: AclHuK9bHaRXHNAR7u16We-RytuEmqtwRDDQT6RAcbrEMxFejcbNnPABR9ssHjo
Message-ID: <CAPj87rN7RWfEa_YypQq+quER7V6pt2A3q4fYRuUXF3_Ch7yL8A@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] drm/bridge: dw-hdmi-qp: Log resolution and
 refresh rate in atomic_enable()
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> The debug entry in the HDMI branch of dw_hdmi_qp_bridge_atomic_enable()
> previously printed the literal string 'HDMI' as the mode field, giving
> no information about the actual display timing being configured.
>
> Extend it to include the active resolution and refresh rate by
> retrieving the CRTC mode from the incoming atomic state:
>
>   dw_hdmi_qp_bridge_atomic_enable mode=HDMI:1920x1080@50Hz fmt=RGB rate=185625000 bpc=10
>
> This makes the log line self-contained and directly useful when
> debugging mode-setting issues, format negotiation, or TMDS rate
> mismatches without having to cross-reference a separate mode dump.

Reviewed-by: Daniel Stone <daniels@collabora.com>
