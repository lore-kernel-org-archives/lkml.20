Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515151;
	b=bNAD285MKvofDaOF7lJH3H5UJKN8K7CyRHNy6AvQVX/qD0ACXbJtJmMMweTTVWjFjSsu
	 e67N/tnxWoObpV7MjjaAPjyaXXHPcSoJrwKh65nbPWMVOHuWDfuGDEhKIlFrXyIuCpTHx
	 fhoho56UuXpzeT/Ittf4jRGVetbQ+b9twnO8ZARpucFDbpqfVv9mi+wBWwP7dSS/Pct6p
	 F/fKuebgj9KTMmbXmJbneQnrvJXyT6WUdaShMAudrtfRXrE7Tp50B8p041JpYbRpZWVUt
	 K+ucmPy3HCmXtceZfkelPwJQq5KJPlkD9v2ilXGbexOttfEFu8pW5Z7tnxGsD//HCJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515151;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=v7xkHl3uAJvD4/78sgLN77kYpieA8BRah0ZBUP6Shl0=;
	b=F6PtJz1FzeH2cM3t6TefUDO5HlTBt6TYDu6iYe5llkyLdBEEGrsBUeF6/Gw+bhzHJWxv
	 NYzz7a4awYxn5HlXYkwFn4vjqqExiw0ecCV9qyUd+SLNka9kpJQZbO3CIUQXbS6iidnDN
	 TBAcg8tdsnGLdf2DgiiiPUZPLZyal9DqdNI+px3kLt4bjrh7vq6mL6l+4nVSKEVoNrkq1
	 9HSozqz653HAK9/swXVQ5+o03g9VAgCH5WF7XA3DDwUfg5hXz7eB77z9uclZrN0arJaG9
	 S/cJF//3WphB7+LtPxijJkX0c7ceJiS06ks4UloeVGI2wARWnV51VlCRRem93kqD7oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SAq8W9JE;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDEB606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDEB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SAq8W9JE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 90363C5CD64;
	Tue, 20 Oct 2026 16:53:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 023E460393;
	Tue, 20 Oct 2026 16:52:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE0F910328C52;
	Tue, 20 Oct 2026 18:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515143; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v7xkHl3uAJvD4/78sgLN77kYpieA8BRah0ZBUP6Shl0=;
	b=SAq8W9JEdMZVH+u7Z0hsckBD2XtVfIZAtGxGb7CU6htgMi2KduNM9WCDCoW4pMKR3Qwd/I
	fghA5CB7bb22DmIat5VmrCiz2NQemh05J5q9zoB7DwOFEG9EFuS6mwOz5NfqgBgKdm8qKF
	q7ZRaLyxJkWk8fVoK/rgvFCcnCOFEajig2aFliuJFX7vsA5/0nis1oRJWnGpe0lz3sskPX
	yK8Lv3Cqp+dnzk6L79DDkzityxIqjxDWaXG+HqCX+yAe6Lf0SwADHTgPhpgvLgG/EeibHR
	SK+2K3YX+SNS3t57WWKlr/gSP+CiEF2uT+5w3/aFsDpeJWon5/w4eripxL7ibA==
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
Subject: Re: [PATCH v8 04/14] drm/bridge: it6505: unregister DP AUX adapter
 on bridge detach
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>, 
 Pin-yen Lin <treapking@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <ae0941be8fb5e20a309f2e30b5e2d8818168aa38.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <ae0941be8fb5e20a309f2e30b5e2d8818168aa38.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509976.78870.2847307917157375162.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello Daniel,

> The DP AUX adapter is registered in .attach() but only unregistered
> in i2c remove(). Unbinding and rebinding the DRM device while the
> i2c driver stays bound registers the adapter a second time, which
> fails. Also unregister it in .detach() and on the .attach() error
> path, which so far leaked the registration. remove() keeps its call,
> which waits for in-flight AUX device users before devres frees the
> regmap; drm_dp_aux_unregister() does nothing for an adapter that is
> already unregistered.

The drm_dp_aux_unregister() docs don't say it is idempotent, so is it fair
to assume it is and always will?

I think it would be much cleaner if user drivers took case of calling it at
the appropriate times, not more.

A flag similar to it6505->extcon_state used in patch 3 could allow that?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

