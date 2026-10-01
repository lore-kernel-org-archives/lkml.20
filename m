Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA53351C27;
	Thu,  1 Oct 2026 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869800; cv=none; b=eiQNESxguCMS7hbWZD2Wj64m9xbBFSHrVWaDhEQ4MXFmtAdDEiqStj7Tcv7ZuYJhvO/bxD+0SpjlI9NJ6dHI6jCoHVvLlW430joDuhM/xLPud36icHYuuhXucYj1OWT5klJ1nEpLTe1KDBYAMA/Y97ueZzdJ5IObhOPDRirp6BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869800; c=relaxed/simple;
	bh=d5wjsmU4iwodPmCvT+NJtftx88hL20Yv4nRXnfEGQzU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=iV5VDoLN4+mPQLcV0yDNe2kFPOHLot8LEG/IlmUAYaA3CyKaTD5bB67AoP/UIKb9H3KRn43lQg7p1BpyUP+NQ+5vde4sPg+UHFIRZH9auEetqqmEUkVUxyDOLJ7YJEcsBp2+dlxUe7BFPGVnR/IpPgkWFP23xFEjrn/6YzLzz34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ieDfAB85; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ieDfAB85"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 29AB14E41115;
	Thu,  1 Oct 2026 15:49:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E56BF60343;
	Thu,  1 Oct 2026 15:49:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAD94103282D5;
	Thu,  1 Oct 2026 17:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790869792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uGiWo6C+ycX09EU8H32CDb7AmZmrCKj9IV2lN2Mp/Hk=;
	b=ieDfAB85stwwyZZSONxP4MucbdJVdGaD4CpTNy0XtKFsHuWU+pNP8OS+xoLFHBrWXaM/Vp
	1WYzN+Wc8w6iie1fbCnX32LrMk6e5YzcWJnq1SKuenvHkWs0XZytGUfVprH2foGRrwKqBn
	ZWNyWpZxptuyAsWuQ/dcVlL7W+hgLx0KBfqpf8PflbL0Np7aC6MD86rEJaMHhGC2TF9P+T
	pzorWpQcNQpiRbvbXIEUJXHGri4D5wGd1qywEMeZGLxL3XLDuoBwXb6DIiZNK3lK0/BF0j
	PPDx1NfHnVBER6DpUYsTEn45LfFjbpasGktZ1AsxhDb/j1/C1zMS+rJOgrwA7w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 17:49:39 +0200
Message-Id: <DLTMCR2DR484.2J56NLPQEQO3M@bootlin.com>
Subject: Re: [PATCH v2 0/7] drm: remove deprecated *_of_get_bridge() from
 non-OF drivers (fixes build regression)
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Doug Anderson"
 <dianders@chromium.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 "kernel test robot" <lkp@intel.com>
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
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Sep 29, 2026 at 3:39 PM CEST, Luca Ceresoli wrote:
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

Patches 1-4 and 7 applied to drm-misc-next. This includes all fixes to the
known regressions.

The two missing patches (5-6) are improvements, not bugfixes, and have
changes requested. I will send a v3 later on.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
