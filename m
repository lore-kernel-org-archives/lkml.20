Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC13BB12A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975455; cv=none; b=dXTjhFBEodW9eMkdTm4zAENcAFotztxI8Jn98tt4zS/3V0n9n4Gv/HTWkn33D1I52qGFmrcKHgDQg1rl0R/ewh9QXHKeFeY1Apokzm7XWamv9sYut2XMFKEzPGB5uJ77hG5RXekbik6ttbWZP+VAVGx78CiVk/0Snq754eJT7nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975455; c=relaxed/simple;
	bh=8A0HNg7Rdmqg9SqH0VNCznl585aaWC0dD0CDAwdQ0oE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=XZ6KnOQ9TF+pNy5ahAleAPZylIkyD+XRT7YLdzqx2Vb+Ac7sHubC1zVYq/TIgJj2Kra6fp+0aakdUglDYSTxEhWgHyLyzyDqTR2ZWYSOnnwUL5NMeAzyGMHaetpwoX72V7dfMLGAIf+QSQxQZFXZKE7EX92W4IVtdjHY0okeuCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CF4oYu2f; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CF4oYu2f"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C06664E40CA7;
	Mon, 21 Sep 2026 07:24:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7AB9F60339;
	Mon, 21 Sep 2026 07:24:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BA8610328F4D;
	Mon, 21 Sep 2026 09:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789975447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RG0d/rWWwG5EWi14PZmG5qQITNqAdcjhf3I0KoA9dFs=;
	b=CF4oYu2f2Fb/6/P7G2edz+XGRaxwUM5y+QalfFftYc0K9ACk3pKG19v1Um+gp+onLXLOAJ
	XIWebq+ZnBsUGIWQ/NZNNkbdrZLZrg9SmIbGwpb8GFep47g3S359CAIOawHvPUMBfq002u
	5YsxQvNUoAdJlltQ+8pJAMoO9OeuxcUunDnEDL25IhJ6iIvH4yM+gdd0dcHzAnw7Kf6JMb
	wffUF0B8jCFMuYKQjMW1VJ8wgJntfoU7V5WjeW6JE1H9DxBVy0+KgqXljo4rgC0CUOy6tI
	vl2QvKL5UETgKy276ScNoF4LORkAjcvyc021rRxRFh4Sb/93oVLYRy/9WfDKZg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 09:23:55 +0200
Message-Id: <DLKTC338JONX.CQ6L7JYQ4UDD@bootlin.com>
Subject: Re: [PATCH v11 14/74] drm/bridge: Fix unlocked list access in
 drm_bridge_attach()
Cc: <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-rockchip@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Chen-Yu Tsai" <wens@kernel.org>,
 "Samuel Holland" <samuel@sholland.org>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Raphael Gallais-Pou"
 <rgallaispou@gmail.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Algea Cao" <algea.cao@rock-chips.com>, "Daniel
 Stone" <daniels@collabora.com>, "Liu Ying" <victor.liu@nxp.com>, "Phong LE"
 <ple@baylibre.com>, "Helge Deller" <deller@gmx.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-14-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-14-bc12954a0688@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Sep 1, 2026 at 8:50 PM CEST, Cristian Ciocaltea wrote:
> drm_bridge_attach() inspects bridge->list to warn about bridges being
> attached without a previous drm_bridge_add() call, but it does so
> without holding bridge_lock.
>
> The list head can be concurrently written by drm_bridge_add(),
> drm_bridge_remove() and __drm_bridge_free() while they operate on
> neighbouring entries of bridge_list or bridge_lingering_list, all of
> them under bridge_lock.  Hence the unlocked read is a data race, even
> though it is unlikely to change the outcome of list_empty() in practice.
>
> Perform the check with bridge_lock held.
>
> Fixes: 76f1a9711b83 ("drm/bridge: add warning for bridges attached withou=
t being added")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
