Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C765E51814C;
	Tue, 29 Sep 2026 12:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685224; cv=none; b=tq09LKXn14G1MIm4NyoXR6016tjAXV7vyyPBr7qRbuMKSDQIUy1lVyFVLu+ifoTPinfAhdduClvVD9B/yjipg9zwN9db+gCSFyC9DNcPLikLJLNWWpx6jcsmuOh6tGppj+QtggFe5im2RhYGaUxFRC/bdE7uuU/6lx/ybpYRA0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685224; c=relaxed/simple;
	bh=FD30Hf4tvtRlOhi3ZD/pZkldTc7PRNkVxsM8QYaofPY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=EpzFXnbXVGEzY4hN1Wh5XcDL1DxsMujUwwzoN4nagsnCIqocYzbU6iLnLYjTAIcdVzBfs/B1Rp2/mB4ZdK850vVe9WkFBQJQ+J7hlF4Rkry5i5OcQ0boTV7ebNChSFafRrLyzw4tGVBY4uknxBu7SCyXTrVnBzDkQokHX6DF3fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAl7W8CA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAl7W8CA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EDF1F000FF;
	Tue, 29 Sep 2026 12:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685223;
	bh=FD30Hf4tvtRlOhi3ZD/pZkldTc7PRNkVxsM8QYaofPY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=LAl7W8CAanvxK2JbnSS59vy/6oHtMRILAYPk2wnD3UBrkiXBNhNX5WN+0y/HWopcz
	 Ek5c5deSqU2SoYhwvpwNXnHvCfi/I9D4zv+BsV0yq5k8JK4bfNhn/+e6yGvdFqsKev
	 0YPaDyARWYLhkZRCQBYavr7LBOHVvvOJVLHngwlfMsZ/i5WiGhXP9YL5y+yvk4apNj
	 i4i6CGdt1sv/YA1bsUAvl9/Awvp0ziQUqrxmj3H+ccHY7NyMuEXUndEYgtEDBKErXk
	 A04iI8d1x7SXFnT42MH5gYjhAURTtecoheQsdKb6aqCAh8gad7rvEaeBebElpB2S7E
	 OuUc65yJLsagQ==
Message-ID: <d6b673647ec1175d4c9ab112a47497b8@kernel.org>
Date: Tue, 29 Sep 2026 12:33:40 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/7] drm: verisilicon: stop using deprecated
 devm_drm_of_get_bridge()
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-2-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-2-ccb7e602daad@bootlin.com>
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

On Tue, 29 Sep 2026 12:36:34 +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>=20
> Fixes build failure when CONFIG_OF is disabled.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
