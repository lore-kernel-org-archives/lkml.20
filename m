Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FAC12B94
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133553; cv=none; b=oAK61U4Xz9brXLgXJ6kSm/EtSjW42T4AGaP62J/vSqXIEbugvPJ620IH1XpGJCR5m7Yb/FrZbhzlRTsd+rJ1VefX18wZcsVy8b9qrLoQETDTSX5DfWViuYkwzBfQAdZ5j0ieDkMzSDwBMKXn6kKOa56nqshL80x3qTmmeKuRFbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133553; c=relaxed/simple;
	bh=KisVbqPUntzABYy9mOnymfxJe29vSb9aRoxLvpZIzbE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QgieK7uyzTV6NTGLvZmBLY/Z7wy3bhwTUMlAXWfoglFDfEwmwkYTyLR/1INscPlBbxpQzf3YpFEE8jIjHXcCTpbx6AGrFgOOGshF/lecE+tnw3UaEFhyK5aeA+FzViXleO0mmePvNxxeb08+4IFgYUAaZ6d0wDfumWFU0wz0fLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MmHOg1dx; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MmHOg1dx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F9E51A1250;
	Fri, 16 Oct 2026 06:52:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FC8E6075D;
	Fri, 16 Oct 2026 06:52:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A223710328C6D;
	Fri, 16 Oct 2026 08:52:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792133545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WlHkJSy/ba8HvsmnfL4B23mq4zTFKgnNgEDVV0rE7SQ=;
	b=MmHOg1dxGfArn2jR4L+4z8N69tqpP0MmBy4sJp2si7LmksA8mvQGFkkq7FnBXFMzwVNRfY
	61RAPOkOfKFPSN8kXzWbAFLaK8DSItnbpMvT2nYKPNBaA9In3XZ1MJa1xiTGKZOwsmnpTo
	RwG5fjDdQ41hdpSJ26d7UxkYhqpeCT0+6r9bq0WNajqFtq3xZuQ2t+D0Jy3TLIOvNztrqk
	WOOLef/mwNkpOT0OIT/iQCYdxkWGEhAZivYtWilhTFOxrBXbvAhyFzeBiZ7KpeBQLppTrc
	vX0CU1whmU+hccR/PLhek5yNVtm0R4FAC9chMmopkn24+iGIXocbkvMbH/BuZQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
References: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
Subject: Re: [PATCH 0/2] drm: devm_drm_bridge_alloc() conversion and
 cleanup
Message-Id: <179213353665.3058528.14437637653539699061.b4-ty@b4>
Date: Fri, 16 Oct 2026 08:52:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Thu, 01 Oct 2026 11:25:10 +0300, Cristian Ciocaltea wrote:
> Bridge drivers are expected to allocate their private data via
> devm_drm_bridge_alloc(), which also initializes the embedded struct
> drm_bridge, including its funcs pointer.  Most drivers were converted by
> commit 9c399719cfb9 ("drm: convert many bridge drivers from
> devm_kzalloc() to devm_drm_bridge_alloc() API"), but a couple of
> leftovers remain.
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: rk3066_hdmi: Convert to devm_drm_bridge_alloc() API
      commit: 5c0cdbee4fa4a621f871d6dc825e759db08a1a4a
[2/2] drm/bridge: lontium-lt8713sx: Drop redundant bridge funcs assignment
      commit: 382c1e8ba409d1611cd256dccebdfa828c832bb1

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


