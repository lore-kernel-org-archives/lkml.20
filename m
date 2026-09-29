Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5504FDA55;
	Tue, 29 Sep 2026 11:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681232; cv=none; b=dneC5kw3Cfs9VpDEhj34cvQX9zBqaEJs5ppU/AN++JGjYcxecIV6f6QAHOJKIkrMK6ebCkWrFYgtMhaBo86z/W5Lm7N/cQylJOlnZ/TbuOhNEkaBg6jHmmoSgPA0MJHY0vsn323esMlkwiwPuLqxXiViObfzp1eOZhWUFuy3d8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681232; c=relaxed/simple;
	bh=YM3+c1WRIWYb+SV1yQ30hgqvyfKEvXQJdImu3QeAUdI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=D8yfnLyyWOhtosp9iOEnO+hw4PeMlteJ7kRvf8MgI7SR33x0kqlm53wO6lHyJO4lcVvX4n71mGe+7FVkeaZIOJD2BTXwu//QRW6cFYUcSZIyMTU8PYFfPJZXuDb8rjFAypciWubyKgeBmaYqu6tE5uq/b6SBQ3oIh2enL0yABPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=lqrhs3ji; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GTy+dqgK; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="lqrhs3ji";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GTy+dqgK"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 6BFA1EC101E;
	Tue, 29 Sep 2026 07:27:09 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 29 Sep 2026 07:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790681229;
	 x=1790767629; bh=wTvvV6l4+D0DDEvQZ4FQw43WlY8/FKGuhNm/go7qrHc=; b=
	lqrhs3ji6e1nUSfWDJcN7JlzJ7kA5P6e9t3O+qreOZdMk63ce3LXKkAi5GlB6Lyn
	QEccDhnvycoD3M+GxpPDF4xgRHX5IZ5xDcH9utzuAqTLVz38y+t0XTJTGw5cN510
	4cLIKRo5YaBQp4SHy243pLZt5gBbeIfFlXJNhnrPoWIdRaxI4FbBzyAWyFUe2hLy
	w0Xvfthg6bDGSRo5iznRmpwsbFHAQDOFTArREiCDo0rFsaUSqhrZduuo/TNQLY1q
	XJ27axl/nB5bEXOkFBohpxrZx3sOmU4C15MRRMtYcJb8Uav7NGQL2TOy+V0hKDJy
	Txpl7BBBn0OVhXe95YkqaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790681229; x=
	1790767629; bh=wTvvV6l4+D0DDEvQZ4FQw43WlY8/FKGuhNm/go7qrHc=; b=G
	Ty+dqgKXb8w9sUdgVZqI1XIO9oNUZ/E6FiTXSNpB1FBpCLm6BsJpdtTEGI/CZgUZ
	GkHHQdF/AGX62cqYzFws6IHKIJchP29xOy6e038AbLWObRhXcyTApDeRnWh/he71
	RE0WDnUjOHBwNeKVRW2IBNpyfkB0FBPV+HQ9TQ5P3SxHmmABDD7ER+a+PoTqSzOA
	CVUgFgZWgRNjLkB/dKhYCnqTEDvpK7IwVQJh3MMAcIaOliSvprnAAxtuh4lwLqca
	5E2ApylK8f2pZHLbvIsmtbo4ZA4VgireH5uPVuPx1hMa/Pqmf/bFxMLbb0492qP7
	fbWEsEfavarzJ25RPYvXA==
X-ME-Sender: <xms:i6C7agSkBg8tMVWHBEt0HUcVOIUxly0Y_-GJAxOGHzR4IC_uAmOjTw>
    <xme:i6C7aolBbuRPbCxqAimidKEJrwa5e-ILmzRP4QQfY2viwM3o1NBcdRZveWP6h5PpY
    J9rANTqfM9oVDKytv19XnmeaahxYC1XCh4hw-Jm2NwPlfoxb-rkdeHd>
X-ME-Proxy-Cause: dmFkZTFaYJ4UOaM/YCwFiIyeO72OzZZ8wJwxticpHL2lx2SgcpWhfgewo7nqjzKR7f9Uco
    nB6ZlTdwqZRAsBFF18rc6sG3HoTsR86SFyOpwnXQKDk9Ksip61QjkS/pMBs0QtJjioql8z
    2FRl/D/+O00NkE+AMunJHXDpv0i3mM8+Ryk1Ck5NWCA7zFF/ltRfTHuGCd9/SYiFxl4d75
    BpyduVe9BfJO5KhE3HYOaXLC5lcflKLiIbr+PBRGaLKmD+qjc3NQ2A8+2wZTBBeu9rmiT7
    Bibq+XdHiB1vtSP6z4BIEfpKuoZrPYS8kWvXjN+kLgwFC0fFt2GuA2fk5tV5Brmh1Fl3Qq
    ch2qJc1CFaEamJyHJrHI+Wk06bCDpQBDtjneT1j2ICExQ8RSl108X451KBq6rA93yDLwhs
    PhUlM12nqy1YPGxvlRPE9teorSEcMI7+jTeS9QEri1/4ch7s19XoOdvjs5GdrVLj9Ilnhk
    Rmlw3NCPJfDPDY+3oEfb0EVCNF6DYelmxzSfA9kuNtt0c7g34BZCRhlOU0ooY9uEyJjWBl
    7DbHdhZ6vdKBYWQi5w7s/JhxwtbXFBD0kkmvRCONNIg6AKyoUX432oigZr/m+PClcPETaH
    Tvd/BjpwcoWsk92hpPlI/3dA6VTyASJlQZD7ABeENHmUEI8wtIS5VbY+J55Q
X-ME-Proxy: <xmx:jKC7ap3o7SuGCfUYXpctuk65s40APN84UG5IEgTEUrRDWaCa4Ery6w>
    <xmx:jKC7agOalhSB5mDxMkgF0ovUbqiH4OHCUl8OIvKh_VAb6oWvlF56Dw>
    <xmx:jKC7ah1PFRVSd2W6k_EFpS7iim1dU0CToYzzGKKdEQreJ68Q25lLwg>
    <xmx:jKC7avF9EZeoDX6JcA10U0XVuoA-gVhF5V6L5HxsE3WiM_z38KT-Iw>
    <xmx:jaC7ahr43dR7CAohRep2N3abx2D0FMKS0tlHIIqXcvUyveeM2Cu3FMVV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2F97632A008D; Tue, 29 Sep 2026 07:27:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AxWFZG7AZFUJ
Date: Tue, 29 Sep 2026 13:26:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>
Cc: "Sasha Finkelstein" <k@chaosmail.tech>, "Janne Grunau" <j@jannau.net>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Manikandan Muralidharan" <manikandan.m@microchip.com>,
 "Dharma.B" <dharma.b@microchip.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Jagan Teki" <jagan@amarulasolutions.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,
 "laurent.pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Liu Ying" <victor.liu@nxp.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Doug Anderson" <dianders@chromium.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Rob Clark" <robin.clark@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>,
 "Jessica Zhang" <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 "Marek Vasut" <marex@denx.de>, "Stefan Agner" <stefan@agner.ch>,
 "Orson Zhai" <orsonzhai@gmail.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Chunyan Zhang" <zhang.lyra@gmail.com>, "Jyri Sarha" <jyri.sarha@iki.fi>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Icenowy Zheng" <zhengxingda@iscas.ac.cn>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Message-Id: <4a566036-af8c-494e-9749-cd713d952d39@app.fastmail.com>
In-Reply-To: <DLRMF4TI56I2.3PTB24KN9ORJ3@bootlin.com>
References: <20260928161605.2271412-1-arnd@kernel.org>
 <DLRMF4TI56I2.3PTB24KN9ORJ3@bootlin.com>
Subject: Re: [PATCH] drm/bridge: add missing drm/drm_panel.h inclusions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 29, 2026, at 09:27, Luca Ceresoli wrote:
> On Mon Sep 28, 2026 at 6:04 PM CEST, Arnd Bergmann wrote:

>
> So I see two option for a better fix:
>
>  * Option 1 -- fix the really affected drivers by switching from the
>    deprecated API to the one they recommended one. Based on quick analysis
>    there are about 6.
>
>  * Option 2 -- a quick surgical fix:
>
>    In drm_of.h:
>
>      #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_PANEL_BRIDGE)
>       #include <linux/of.h>
>       #include <drm/drm_bridge.h>
>      -#include <drm/drm_panel.h>
>       #endif
>      +#include <drm/drm_panel.h> /* Temporary for *_of_get_bridge() */
>
>    This can easily be tracked and reverted once all
>    devm_drm_of_get_bridge() users are converted to
>    of_drm_get_bridge_by_endpoint().
>
> I'm working right now on option 1, hoping to get a series in a few hours
> from now.

Sounds good to me.

> I can switch to option 2 in case of unexpected issues with option
> 1, or if a fix "really right now" is wanted.

It's only really a problem for randconfig build bots, so as long as
you are fine with getting more reports (and possibly patches from
others) until your fix is in linux-next, I don't think we need
another workaround first.

I've added your new series on my randconfig tree in place of my
patch and will let you know if something comes up. 

     Arnd
