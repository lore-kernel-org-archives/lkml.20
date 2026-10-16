Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E4F45A28E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141528; cv=none; b=fvpo3jaPjiapZKQiGcDNnS1i8+Z8iFWNmv7Ps/08GuF31UkVCmX3S0s1uChr6ouu4uzP+A+jDQcwxJWhA9vpMmWKZdtxdK2Ztg3Rc016QgC25lVtzalWv014gn3SqR+CCvuxwLxrs5yxKoZoYZOSugsmDsXA4ZhBxvU8axu7qRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141528; c=relaxed/simple;
	bh=Eo9WwXqvDCM49chcBfGJpbXusjDoU1ewi49ePAmjZdM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=desoJyhhEcKa7aI9jr5MtHYVC2o6MO8fpGclaBqOVjs4VBBCD2ODHMQhCFETzwHugZuGaJ+aqmq4/uRjQFXEkXSyQKbhW8uvAS6n6CT3mg8mpt/2nEMi3DRiLwYyzzQOyMedftvE9CIRLbLIKzSv7tmtzXlOqco23T46S6wB/Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JvNL4I1G; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JvNL4I1G"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7517FC6220F;
	Fri, 16 Oct 2026 09:06:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 991A16075D;
	Fri, 16 Oct 2026 09:05:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 351DD103281F4;
	Fri, 16 Oct 2026 11:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792141516; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jCdlTsgAIWlVV/nbciw4oCCYrsIamAoo02qs3IUr8ls=;
	b=JvNL4I1GFqj1N6rLJYaDTiAX1o1PQkUdS4oGWRv5kj7C/UAGbv3VABGAMLSyIstQUFrO2A
	QOS/iSZ8T6R2tQkG8HcSN74yew58DcQiq2XsBCxIVz0Xxi2KvI3KQ5GbhmmcpfaILw+idO
	lsiUoMmfEg9Kv7FwRdYLYXRJbj02o17TxE/boDZtk2qf+QNTLjMCd8aKczzDp3ZNHZJSWi
	yYNxb+q1dabTu60SX84PI9KjUY8KTXK11qt4Rk9OI4y0cxt7eWDhf2J4mKKTy0/okZR2km
	rCEK2VU+wvSkA7kQyXgLZ+UwNZqtXNrEH3G+qNb8qO8eEUGSWfSTkniXrPdcSw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andy Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
References: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
Subject: Re: [PATCH 0/8] drm: Advertise supported HDMI version in HDMI
 drivers
Message-Id: <179214150460.3306936.7520883316826804246.b4-ty@b4>
Date: Fri, 16 Oct 2026 11:05:04 +0200
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


On Thu, 01 Oct 2026 04:14:31 +0300, Cristian Ciocaltea wrote:
> This series consists of patches 50-57 from "[PATCH v11 00/74] Add HDMI
> 2.0 support to DW HDMI QP TX" [1], to set the supported HDMI version for
> the HDMI connector/bridge drivers that currently leave it unset - except
> the MediaTek HDMI driver (for now), as it requires non-trivial changes:
> there is a core library shared between two variants, one being HDMI 2.0
> compliant.
> 
> [...]

Applied, thanks!

[1/8] drm/bridge: adv7511: Advertise HDMI 1.2 capabilities
      commit: 1f132660fb27da37327fed3d4fdc617f95c1431e
[2/8] drm/bridge: inno-hdmi: Advertise HDMI 1.2 capabilities
      commit: c132910e9d13a0c4c3476f55ad7562070d96c19a
[3/8] drm/bridge: ite-it6263: Drop redundant .mode_valid hook
      commit: 31112c84ca79576b8c62316b40272106ac39511f
[4/8] drm/bridge: ite-it6263: Advertise HDMI 1.3 capabilities
      commit: bd66cb40383b43cd4ed4b3ea1a39779161fface5
[5/8] drm/bridge: ite-it66121: Advertise HDMI 1.2 capabilities
      commit: 3af64ea1229dab57233531feda8908486cf9dcc6
[6/8] drm/bridge: lontium-lt9611: Advertise HDMI 1.4 capabilities
      commit: 3c5e687fdb8cff644c700b145289a36400d1b04d
[7/8] drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4 capabilities
      commit: 9283faedfc5fab0a47ca41ee6ac7b2a556da7081
[8/8] drm/sun4i: hdmi: Convert to drmm_connector_hdmi_init()
      commit: 101bd6d1d0aa2770129b47d03791a7120ba0cad8

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


