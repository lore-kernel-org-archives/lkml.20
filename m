Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1BB522F05;
	Tue, 29 Sep 2026 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685206; cv=none; b=JSG1/gPkgIKMfqBBsyJxzLUtoOjYopFa5AYAnqocGAgWE/UkdPct88pqvD34hw+2WONYHD7jR33xGSiMxdnQJ9uvYtPtM991qP/Q2WvB1x8SNviYEEzwVSFoqboRMo05fkoYdzH3nVnCHQwm/mJUm0i8ngvDANjg8aHCiGaXzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685206; c=relaxed/simple;
	bh=KUwUjMVBP3vS5uVD7JFyXQM3OFGJ06H6GRm6/a2EbWI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ggR0ECjNRVE7mu3QA/f0H1k65qaYdLhASb8lK4wEgYCVQuH/GT1w2vW5otbRMK1OyGuAREgrdTM7LoLMPibPiyI+yPUwiXYa6tPwrf/kNt0vx+f8qXGvDjIRvekrnLtsxcKmqQT2cA7WYSLcMjvcmC16ieWwbUj4TRA0fnTF9uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+A3HWkd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+A3HWkd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA111F000FF;
	Tue, 29 Sep 2026 12:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685204;
	bh=KUwUjMVBP3vS5uVD7JFyXQM3OFGJ06H6GRm6/a2EbWI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=C+A3HWkdKO81/B1Q1XFktA3cbzqSOwj9eFQnuyH1QhF6ABihMg5Jd+lFJELVLWDUb
	 bIksCr13OHa4mrpetUxgiwbW6P8UWdbuASa1OZLd/KMEPEjHqpG6fh4i7dDtruj7yG
	 iAGFJO06run5kQDMb0fl880QTkb6RAW6GlNh2qXr3HtK5MQu/tSyDuFgCyYY8UDY9R
	 IVaelf9cJFE878R2IqyJ9IR1QxqFONbpdryO2e/Ml+nfSenAoXxM3fewEqC/aPysBx
	 dRIP4pDI79mmHHA9t/yHsb6aU0H9/LIZ9OVtovmpoW4e2hq9qK1ShP7D6tBfAPvZOa
	 UdcEyA4cUBcXg==
Message-ID: <fd2f689afaecae34de3b027ce19aefca@kernel.org>
Date: Tue, 29 Sep 2026 12:33:21 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/7] drm/imx/lcdc: stop using deprecated
 devm_drm_of_get_bridge()
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-1-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-1-ccb7e602daad@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Arnd Bergmann" <arnd@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Doug
 Anderson" <dianders@chromium.org>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Icenowy
 Zheng" <zhengxingda@iscas.ac.cn>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Tue, 29 Sep 2026 12:36:33 +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put.
>=20
> Fixes build failure when CONFIG_OF is disabled.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
