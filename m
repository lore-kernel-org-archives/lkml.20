Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EE044470A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388610; cv=none; b=Sv/65Ep+g/BLxU19PSiBKSrM2uyushCmBA0+6BRMIW/hyMXV/VAedMsVX6SgJDaOMopeRR0+tdi95HF7BngYmRSl34bcsxppIrsnDxB8TQktcyKZcpECyuJINcOJx1LV1WtHC1YMCvIYsK/17EmidRVNslyxJAWzZXHjk14VN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388610; c=relaxed/simple;
	bh=xh/h1a9+AEVQdtdCPX52wjftYDfYPBwVyd1n4MqElrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P09f7MfHCac3FUzaXn6Inxx/glmj8E3b3x1E1ITg4CfBUG0cYlbMx7lDwr7Ysx82YvQx/tTKRejKauDPb14AhvILS67IKa9rtu4hU7BGtXh8ui6dKuv87Y+eYQsuyxnYNdU8mPg7nWuHQq1JT0x/PEAOoyGC3wgD1cWzlJNbWk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtaFrVrO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtaFrVrO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B0D1F008AB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789388608;
	bh=xh/h1a9+AEVQdtdCPX52wjftYDfYPBwVyd1n4MqElrM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LtaFrVrO54HzwOWHQ17zfSEzdcFKSXWoJ4iRtY0paqCoukyW+5i5ZqYDkoNpPY3eC
	 pdJYhbhNfh+Pfc46+kS3xYA0+eNCBZrBUhXkb6pwWbaJr7FhWBiFwtr3crMhNZGTia
	 qVOISC8inXdosWzHjRPkelpXgQg4GsA8Xc3cZg4ibmpptb5u411C9auHF77A0nmjLz
	 DuijKv3b+pv2I7OnCfYFleRxaHKO08LF4GlLos5pXpTS1UG3Sn8sDNANCEUTBNR01Y
	 iYgEqCd9OfUzeoOkrkFcCFIsdB7D+/3Zj49xKLxlpGBpSURdiNezOljOp/Q+3NPMpr
	 ydOCveyRoJezw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so2130091e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:23:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwXhq96MfKseT/pVaVjuErWz9hc4o6xkLDgYrnyz4Xa3jN8UMIW/Z3Gbw+QWEfuJTUbcGpe31e5m5ZaKyY=@vger.kernel.org
X-Gm-Message-State: AFuF++mWjjx0m93YL3HAhEgOhGY0suVU8THzEzniRXAENlI7in+py+yJ
	ay5pW1yMARNmg15UBLfgA0Kto73t4kKm94w+9bA20cKS0a2x4UywhLoc4ZKea1EYN5EuHgYLFfc
	mW7jEOCfahjVED+jgD99UDkxjcIjnwU0=
X-Received: by 2002:a05:6512:2256:b0:5b6:422:a61b with SMTP id
 2adb3069b0e04-5b8ae6b919cmr1225861e87.27.1789388606808; Mon, 14 Sep 2026
 05:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com> <20260903-drm-bridge-every-panel-v2-10-2ab8ee24538e@bootlin.com>
In-Reply-To: <20260903-drm-bridge-every-panel-v2-10-2ab8ee24538e@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 14:23:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQ_APuJwxv1f572YNHURG2ZRBNLP2Lob1vtb5uQNOWUg@mail.gmail.com>
X-Gm-Features: AcwNN1UmOzAhpMF6R-BINpe4Y2w_L9NY2N3wgg-AOAvIXgsgHbEmBWIvTK04h4E
Message-ID: <CAD++jLkQ_APuJwxv1f572YNHURG2ZRBNLP2Lob1vtb5uQNOWUg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 10/19] drm/mcde: dsi: don't create a panel_bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Albert Esteve <aesteve@redhat.com>, Anusha Srivatsa <asrivats@redhat.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:12=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> Now a panel_bridge is automatically created for every drm_panel, so this
> code (similar to an open-coded variant of drm_of_find_panel_or_bridge())
> would lead to creating a second bridge for the same panel.
>
> Update and simplify the code by just getting a reference to the
> already-existing bridge.
>
> Also keep the "connected to non-panel bridge (unsupported)\n" error logic
> by using the drm_bridge_is_panel() function.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Okay then!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
