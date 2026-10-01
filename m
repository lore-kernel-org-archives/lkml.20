Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DA53C945A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872300; cv=none; b=dK4zYyvieWJ8npQxP/L2zMPK7IShdyyD8KZdKfM3Zeq3obVScuSwODVg/bZrEmJjX8iQkB2XPweo+z7CsWTM3i55w+PoiU6TYvl7k8plJZ7LXCeNAsAv7JQCIuv2u4bc0p5TiYerMZ9bGBh0riblZhucxQIZwvxxNODr6TjYfnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872300; c=relaxed/simple;
	bh=s8e7TUX7IG4O+szpBmaWnlqJMsPjMzhApAmHkWPg+PA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=pVzm1JYa/c7mConle2FCfDDjT6+4Czm/FMfpLRgFiBz27VV4M/eZ2icF815W1gBqUCvZFr1vFQnhxMgSf5Xh6yd8Hb74o0YlbQj15tuLyMwcuIDUsnzHFsagNsFcS6Z1lVy5/KIDlojoj64nYX4CaneMqgtPR7Ptjy4ewO1eHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WmZEvWTg; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WmZEvWTg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 090FC1A138F;
	Thu,  1 Oct 2026 16:31:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCC8960343;
	Thu,  1 Oct 2026 16:31:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6BE3103282E5;
	Thu,  1 Oct 2026 18:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790872294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s8e7TUX7IG4O+szpBmaWnlqJMsPjMzhApAmHkWPg+PA=;
	b=WmZEvWTgoyKaH9eLLiGFXxWcDUU0dRmzLAsatremk9U+apJk/cTbE1sE4O2BoZSUKoGqn/
	T6m6tLTnTYwvNgyHE3fJflIwRleuWUiGHM93OrdnncLS7iCcceIDXQyE+2qScx/2vahm/Y
	NofBYIRFEcLhJS9u9XHCF8kZepjh1fok7dKmedCoE/3CodLERISCHKfYSWaQlBQZkp8E/t
	HnwnjfoAFPLQWBG+4qpS6/nx3ElUZMD1Wcb/6CstoethefYeFtjKm+hOZObzIn07OlYTyY
	X0oQrSBreykAJ06OrGaZ5kSfQiMfF8XEVB80tgJ8mRrOV6WYz7jcAFLpIy31bw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 18:31:24 +0200
Message-Id: <DLTN8PZ4UZED.27LK4TI5T5GXA@bootlin.com>
Subject: Re: [PATCH 1/2] drm/rockchip: rk3066_hdmi: Convert to
 devm_drm_bridge_alloc() API
Cc: <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Sandy Huang"
 <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
 <20261001-bridge-alloc-conv-v1-1-f0a1fe040a86@collabora.com>
In-Reply-To: <20261001-bridge-alloc-conv-v1-1-f0a1fe040a86@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Oct 1, 2026 at 10:25 AM CEST, Cristian Ciocaltea wrote:
> Bridge drivers are expected to use devm_drm_bridge_alloc() instead of
> devm_kzalloc() for allocating and partially initializing a private
> driver struct embedding a struct drm_bridge.
>
> Perform the API conversion and drop the now redundant manual
> initialization of the drm_bridge funcs pointer, following the pattern
> established by commit 9c399719cfb9 ("drm: convert many bridge drivers
> from devm_kzalloc() to devm_drm_bridge_alloc() API").
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
