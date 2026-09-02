Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5528D4A3D34
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373581; cv=none; b=U9dRc3W8oAK6sLIt9sXGAfaqjXrTgnlqT+3+IK0/J2Zp9EjKA53M3SKwHfmOJ46uOTix4oTapPSxkvR66D4hZPnZr7kAiNRHHuqQELcnuYhIzfoasPcPTka/VgR6Ao0PCd1JPNdwUBgcekXVf6YQrjsEkwIxVX37VXUyFH66HtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373581; c=relaxed/simple;
	bh=gCApV5Kok+BQRsw8rttt79VnZGT1SsQmVJ70ICszXIo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rgOCBPIBPQN+LTqodt1T1w7qGegAR8nUHaHtsm8SdhA3AqpoMZJHOs7vIr5p0SQklwWX2r3XI2PRxaPn8G7aev/53TBAtnkR9V5pGzHvUeaF11gWSnCIGG3MxCR8wrCCjsS9o4By2u3a9ry9F/XXaDodJSdLogBEgKpgUMmcI/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nbX8DEx4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nbX8DEx4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 47AB54E4145B;
	Wed,  2 Sep 2026 18:26:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C4AF6053C;
	Wed,  2 Sep 2026 18:26:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D58D311C795A7;
	Wed,  2 Sep 2026 20:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788373565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p03yiwsq38j8TPrIFwJ6uLWAobpLTqLwpi0gup1+xQo=;
	b=nbX8DEx4dXIMMnr4Z9CsBI5CeXMXiXwYc0nKt9WsCt+KoByT8ytPW+DVzqZEVvC+kVpb8S
	uFeaovux2LcHJT2uqwH0WLx12ZBme7D2x6hZDvV5Wq9wjWWHTVPmFkZvHLbDWfUA8V/IZ1
	3u5OxJe4ZsWQxAvuoeYVzyN1PgrhYeAZGeNfNvm6BdRyd5XUoAGJfw6h4zsG2IsPq8QTFo
	nQzOToE9yjmSyw60bNO5WR/Q0xMTP+yG3zkaZpX6lif4UYweZcizk+lGBggRk0rAP0vRuB
	3/sTXL+nKy+C7ix7JtqcMn+bWyf7EdDrhh5C+Y6ocwCbLl9kxcK/fzt8yaJMow==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260814-drm-bridge-every-panel-v1-0-19cd5277cc8d@bootlin.com>
References: <20260814-drm-bridge-every-panel-v1-0-19cd5277cc8d@bootlin.com>
Subject: Re: (subset) [PATCH 00/11] drm/panel: add a panel_bridge to every
 panel
Message-Id: <178837355762.1178469.9866687339968107247.b4-ty@b4>
Date: Wed, 02 Sep 2026 20:25:57 +0200
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


On Fri, 14 Aug 2026 16:05:48 +0200, Luca Ceresoli wrote:
> This series makes every drm_panel create a drm_panel_bridge wrapping it, as
> previously discussed [1][2].
> 
> A panel_bridge is currently created only afterwards by the component
> accessing it (such as the previous bridge), but that creates a mismatch
> between the panel and the panel_bridge lifetimes and devm ownership.
> 
> [...]

Applied, thanks!

[01/11] drm: of: drm_of_find_panel_or_bridge: simplify freeing the remote node pointer
        commit: 5a859b820ddf99e084b7fef2ec520b2df90a0a19
[02/11] drm: of: drm_of_find_panel_or_bridge: simplify error return paths
        commit: 97c594f71fa71dc30a0583a76d8b6ef5c5ea10b1

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


