Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865421;
	b=wvDWLXhyHwHg6Sp0uBxrfpQgwuC0thDVG2tK0zXZPoyuGk7kIkdxf7L8B2nGVetlwbg/
	 DEyRb0a9M6A/P8EKu7bDTUP36slHSnCu9Lgda2j1/N4Isc0CATkZJb+ciy60rUUprDTCR
	 k8K7BjSEknRl5JD4eys/ZLeqnTGLhyRngqvISraf3/P61n7ju430AtCyO5ximsHQOpz4D
	 KsbrjhNTBtyxedaiFFQzyZoqLpWdGI7BkndSgtckIr6mxnayERJDtQGaTDaxPAxNJ6mWo
	 VMbcC4A7xXCb7RXrSDvJAxhKkRl4abckwz3XLWUGBug5NPNTTwnAW6zvaCgO69+igVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865421;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=HXdQdKGkpxAzk7wWxbV26AiUxZP5IjbO1/tuui0e0tU=;
	b=nywsPQ3R1qo7uQ1wADxDDqbX74knuNy6exgYTFJeNjInMbryoTFsR/Y2nP+IaBivjcXk
	 Cpi+Ljb4yZA878gt1sO/hcZ9iN4p16SpkjdXEcsPjp2nPO19oxH81MAjefTcCpCObF5kt
	 4ypj6b23z9oEPcQc4qUEDi61WO5msBiTZPG2O6T8wkOtgSbfiETQClC4Ns+ahJMOMpqRG
	 W7p75MHXpdJtAvY2Qx1b5Eq1ShMZCSE5uQWNP2gxkhNVuLF5Blis2bTWem/Qkg15T2DUH
	 qTdiRAq46X33jmVOrfr3RSVR8ku5alJ4VJZAl/gpQZzTKqKmy4lWBtaRep+VKTZ9TKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YHGlFiX8;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B34606D80A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B34606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YHGlFiX8
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 70DFA4E40774;
	Thu,  5 Nov 2026 07:56:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2BF3B5FF85;
	Thu,  5 Nov 2026 07:56:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4367C10328E67;
	Thu,  5 Nov 2026 08:56:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793865415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HXdQdKGkpxAzk7wWxbV26AiUxZP5IjbO1/tuui0e0tU=;
	b=YHGlFiX8f1PGxqg5IcKDvgND/e/tgTG7BZ1U7j7r8WC0rlQmn4/eS4Gx8ZeHqOQCxod6kG
	tDX+QJgmfqoY889/r+FZiTH5nPuHqGcaNFHKy58Hm+jXirXPsS4QgQwk/aqNv23LCLoCvb
	NlIQBARCz79v7mUWBrlqUhj7ngV5lk6odzlHOV4I3adFohGPM47RcthLqyggKZ4OsU72pH
	z9ugz0yWevutyGX/qZ1Cs9jJ4GnGXwwzPl0Xx5WlWLBMg57VUm7NUFGVrw0i8X23E/TY0S
	14BQxKlzkE6Un8zZodkv+0xDHyzG2UGCQHHUWicxATYR3Nz/T+vtSDuqqbBFRA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: dri-devel@lists.freedesktop.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261029144132.572020-1-dario.binacchi@amarulasolutions.com>
References: <20261029144132.572020-1-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH] drm/bridge: fsl-ldb: return -EPROBE_DEFER if the panel
 bridge is not found
Message-Id: <179386540880.926962.15452112879509946789.b4-ty@b4>
Date: Thu, 05 Nov 2026 08:56:48 +0100
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


On Thu, 29 Oct 2026 15:41:28 +0100, Dario Binacchi wrote:
> of_drm_find_and_get_bridge() returns NULL if the panel has not been
> registered yet. Returning -ENODEV in this case makes the probe fail
> instead of being retried, so the LDB is never bound and the display
> pipeline never comes up:
> 
>   platform 32e90000.display-controller: deferred probe pending: imx-lcdif: Failed to get bridge for endpoint0
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: fsl-ldb: return -EPROBE_DEFER if the panel bridge is not found
      commit: ef08ae876d0641a5c8496008d35ceb0d6b1a92b9

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


