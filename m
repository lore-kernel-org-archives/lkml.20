Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568098;
	b=bSm5mmU4kAUBIxFVzW3r0pOkcHJ6g5pc46crqZnYeL5dQnIm86gjGMHt3AYH90SlccxO
	 oACKilCu+yjtML1C9FP9/hsHCMAMuuEUNweowlR1t+M9d34LG8Thb+EbQ7rl3wYxqRwGe
	 7gu5CpcESWprrOZIuDsNlVG6uxIbcslu9SIuF0aluYy1tb/dRGha3QfMluD2m2D88Uz+X
	 BpNET2Ht0GgTWSRX+aVJ5uEvYEAKO0XpkYzrYMrNqZMRixJ4huVrn58uyAD4kt+AtKnTm
	 baMNmTYuIPpD+FTXtvLkjxc9EA95y2xNu4jmB2fJxd/RcXHJconrbjCVmjXvtXNE+WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568098;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=fq3kf+R0bXg/PMFA3ZhBZYTzFMJM46ITiicdv9cui8M=;
	b=l60p3TnargqU6F9WVj71QHrBvx2hqZS8zCs4xnXQp8q/SPTRfBWlG98el9YimoGz6WfS
	 rXmjutSLL1U3Xa7Jm6JY+7woi7JIQECOReKWkBPyfnNEMeWHsIF2Jor+5X0dHJO1RvrnK
	 zNoMENoqcVX2ROFbpUVo76yV9D0CUUVmiQZFnBAQNJDRS9fQJ3vV9WwBM6Daq3XE7/o93
	 Jsh4NDcCizJu7301e+b5g4rsHJpcJegj3hbXb56TpTLRoCj1ph4Emcm0nEHX0cdvNcHqD
	 k9IZ5iQMkssmsCh7eqs1FGshTC9QOQ8Ai1bpLUx+Hu7+PaLLex8EzJgj1SeyOnsPyEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BO1O9Xfx;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A39B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A39B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BO1O9Xfx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 04F8BC5CD71;
	Wed, 21 Oct 2026 07:35:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2598A606E3;
	Wed, 21 Oct 2026 07:34:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FED810328934;
	Wed, 21 Oct 2026 09:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792568093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fq3kf+R0bXg/PMFA3ZhBZYTzFMJM46ITiicdv9cui8M=;
	b=BO1O9XfxRrtnjZGlNXNACWs6J/WOV6p4OppWyoQBx3ifMxrVvbC1s1AkQJ0egwUyJjmyZE
	YwQuf2xvTsR1v8v1Stxc+aPVptNgF/YnMYlMxRatdlK80kRcTd3wSRdvZHUXsWyW8Vsaz1
	U1tHwwtcrIJ7OcJsUjiNyIdyXRW7JYXfbEGeGYmDG/MGzEK7xpfWiBWWaISRkONF1rIoay
	/+PgI9EnevrncniM0LEONdnCmB2SeJ8g9LgXag9v8AfnV3KyJxtACBuyfeMUo8xkoYkWWF
	ZIi62bwH8t6m0hWGffMUEdAk5y83B/nlCI74tiolBtXYVBlpwIWqseAB7lTBlg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] drm/bridge: aux-hpd-bridge: replay last HPD status on
 hpd_enable
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com>
References: <20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:34:45 +0200
Message-Id: <179256808506.89747.16992632119493179553.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello Yongxing, Dmitry,

> If a downstream consumer (e.g. drm_bridge_connector attached by the
> msm/dp driver) registers its HPD callback after an upstream driver
> has already reported a HPD event through drm_aux_hpd_bridge_notify(),
> the notification is dropped because bridge->hpd_cb is still NULL.
> This can affect any user of drm_aux_hpd_bridge_notify() whose
> downstream consumer arms HPD only after upstream events have started.
>
> The race has been observed on Qualcomm X1E-based laptops during boot,
> when pmic_glink_altmode reports the initial USB-C DP connection state
> before the DP driver has finished probing and enabled HPD handling on
> the bridge. The consumer then never observes the initial connected
> state and the external display remains dark.
>
> Cache the last HPD status reported through drm_aux_hpd_bridge_notify()
> and replay it when HPD is enabled by the downstream consumer.
>
> The replay is deferred to a work item so that the replayed HPD
> notification is delivered outside drm_bridge_hpd_enable()'s call
> context.
>
> This follows the same pattern as display-connector, which also defers
> an initial HPD notification from .hpd_enable(), but reuses the cached
> status since aux-hpd-bridge cannot re-detect sink presence on its own.
>
> Fixes: e560518a6c2e ("drm/bridge: implement generic DP HPD bridge")
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

Is this patch still current?

It looks mostly OK at quick glance, but there are issues reported by
sashiko which look valid to me. If you could reply to those remarks, either
confirming the issue or explaining why it isn't, it would help reviewing.

@Dmitry: I'm not familiar with this code, do you have any comment on this
patch?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

