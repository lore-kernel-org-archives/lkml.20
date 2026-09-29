Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9060D5187E6;
	Tue, 29 Sep 2026 13:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687940; cv=none; b=b+pkWJy4POgbtFWywN85jyXS6oLb4rXo+nVLDbiq5JhwayY2B2cs95PINNIRUc++Sg/m5YLIO+K+NUnS/+mDN0+SmcWkYc5qIG1zTjhe8nUVf9NIl6n8ceuCAMLgeBvbfIQDl66bzC0IKqJ1UefupP2/cRIAyMXDAUlT/Jgwz1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687940; c=relaxed/simple;
	bh=TpyfktK//0FD3fzt2W3VOH+D4O6TdLUvy3qKZ2gg8jM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=gNuw8NTZWVnXc486E/yRii8cE+cUpOLCXR0w9xIcywmi3l4PolQT5DWecR3jtTbCh/hw1NlhbWMYcDW5i40XphvOyHPen6Vv68cydzsCY9EuxcthSWCqtBhs2BDL4YkZ4jhM8Js9MJKPBfmVvmgjp1DayIYiaGqNZecbAe9TqaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oQ3OHl0F; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oQ3OHl0F"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BCB231A1065;
	Tue, 29 Sep 2026 13:18:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B59C601BD;
	Tue, 29 Sep 2026 13:18:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8661210328354;
	Tue, 29 Sep 2026 15:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790687927; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HTahn3OCQfrZM5NApRyAEMP67DTIGs+u7+3aS8XJ5nU=;
	b=oQ3OHl0FvATBzcm419B9LA8f74qyf9KUlR9Ue7tTB/ndleZdO5uhgjuozrZKYrB8Syr3Fd
	EqOKL9eS3wSd1DCvdU/bGNtt+ibwe5nzKtn+TvDt9Pp0AyBzuvYLd5A2flgxD2t9e85VJ2
	Z+QzYx6L96UWbRVv5aCIwObWUGI77VGkxZHP7mq7pxferRqQPBEM0fBCf31UxCF4mcqOR7
	jFUkKJP+Sg9SbvQ7o4Aza0J0Nv+2r/qmVdbBSNv0UiPoJufJh0rM4CA8Q9Qe3WJBWnGdOB
	+4obJ0y6HPH8/53+1gG+BNlB42Z9vaRipb8kbTDCr9OL5mwzRRGMEJ4EG1M5yw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 15:18:35 +0200
Message-Id: <DLRTVZPMORU3.1FBSI0I9UQBM2@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 0/7] drm: remove deprecated *_of_get_bridge() from
 non-OF drivers (fixes build regression)
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Doug Anderson"
 <dianders@chromium.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Dave Stevenson"
 <dave.stevenson@raspberrypi.com>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>
X-Mailer: aerc 0.22.0
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Tue Sep 29, 2026 at 12:36 PM CEST, Luca Ceresoli wrote:
> After commit Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to
> drm_panel.c") some drivers fail building:
>
>   error: implicit declaration of function 'devm_drm_of_get_bridge'
>
> This is because devm_drm_of_get_bridge() (and drmm_of_get_bridge()) have
> been moved to drm-panel.h.
>
> The affected drivers are those which:
>
>  * can be built without CONFIG_OF, and
>  * don't include drm_panel.h
>
> The affected drivers are 3, fix them (patches 1-3) by replacing the
> deprecated *_of_get_bridge() calls with of_drm_get_bridge_by_endpoint().
>
> While there, do the same for all drivers which be built without CONFIG_OF=
,
> even if they don't fail (patches 4-7).
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

In the rush for sending fixes I introduced some bugs caught by sashiko,
mostly of the kind "bridge ref will leak if this function fails later". I'm
sending a v2 in a moment.

Sorry I guess I have to remove the review tags received. :-/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
