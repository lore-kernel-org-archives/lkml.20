Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393446;
	b=vJFvlRb7NDCbNa5xM14yg9b3TCOcbm+bIV9V5P713Kwg9WdIDyxCGddnyJZJuBHzh4ou
	 UMb0q81JeoLO5UaLH4yxTj+Gpqk852sE0MJ2fK5ydEV5CKU3hQiwOxEPiMPqy0QG64WsC
	 0Wv50Ouz+MI+ZlNpB0p9D/mid2swiEs1dU/uMPEukPNb0FXBRxGqCYx1DRGGzaF9s7B1N
	 2vWT1YRiB/OchwtCzor7x128J1GA1TUEZVzgqD+FZVuwh15l9Rnxoq9gsgrYXeDzy0J88
	 SY59LWkpKmIBZAUClJyGBFmfPJ66m1QI2fGriaXu1wvrPW99VAOp4kSt6IzZE0apl3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393446;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=qbvOK4wGLvq6MAbrIiYOQK6EHUzZB6RXJUnU4xqfb1Y=;
	b=mWJGy70x2/Oqew4JO+0DhFxlROfmXhr4DdGYFAphmQfaHvtCB6EtTqvhaPl4sa1Ck++K
	 UV6+cKHcfiztcmWd6PCQcMmOo6NQLE/8akexF2AOgQnGram8KRmiYX2Ct5iP36rsbRoa9
	 zIZBTYWMOlVpWQ6+VHddegxhUsufmeXD3/TdcWUTAYEWidBVh9iL0i/86Jz86w7Pe2TsC
	 465tplI/AaaABlPVyQJWDFF8ZEbAkntFpb+Ce/VsLSAPlIZuAfp0hlIGczG/dPMNhca0I
	 i0vO4dEUyTWA7c04DPoQUAjV3GOVqt0a59sajwAQlO0PXy0mj/5uPkpFEb0s7yxU3hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kLItfe7U;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E75606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44E75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kLItfe7U
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E07991A1609;
	Wed, 11 Nov 2026 10:37:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B57326017E;
	Wed, 11 Nov 2026 10:37:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10B5B11BC10EE;
	Wed, 11 Nov 2026 11:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794393443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qbvOK4wGLvq6MAbrIiYOQK6EHUzZB6RXJUnU4xqfb1Y=;
	b=kLItfe7U0H3r8+ahfhHE4RMyE3GB7QPGfo6TZx+IIVB7GZFu1bRFe3rNsFikTdIy7nJeNa
	YPw3AEFP+F6Vm2D+qpNW6w3kAtGy8DhbWjxIkZPiAP1LLBEKS9VrZoEvRScs88Izbp3aQq
	bufiNV94Acg/GWCNvat5cd/kr9DevU//zDgD8i3fl3WcRNvW0u0QHVjJiGqf2BC1qUoeyk
	mZiQHpj6p4eeb00GF2xPkjNugVHy7W2smZ09X7YrSGUGpK0lia10BZroiYrjwAJi+crgdo
	Eqn7im90zdBW7ABoCpkotJDIgnEi+b0cbq/ILLMFTbhT7vdRMbFRWLOxQ9ZHHQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260929130701.1029644-1-alexander.stein@ew.tq-group.com>
References: <20260929130701.1029644-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 1/1] drm/bridge: tc358767: register DP aux bus even
 in DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Message-Id: <179439343868.1617651.10273802266437546850.b4-ty@b4>
Date: Wed, 11 Nov 2026 11:37:18 +0100
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
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Tue, 29 Sep 2026 15:07:00 +0200, Alexander Stein wrote:
> Even if DRM_BRIDGE_ATTACH_NO_CONNECTOR is set the DP aux bus has to be
> registered. Move the flags check after registration.

Applied, thanks!

[1/1] drm/bridge: tc358767: register DP aux bus even in DRM_BRIDGE_ATTACH_NO_CONNECTOR case
      commit: d360c8eba0f174ae81d2a1343a7371bd7514429d

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


