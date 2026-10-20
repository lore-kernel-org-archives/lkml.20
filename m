Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792462258;
	b=uMRjuhRv09SBeC26/aa3S97bV6bAI2gZa9GaVUOWvIg9BIO3ujuCQnlBRGVT0NY0DfRX
	 kluqoUTn1ra61CMoY8n0YwxzUlVS2EeqQBzzyqUhPTTp7GxiAGp3Ibra71Eg89ACat2Hd
	 N152BHkFfUzMncqhg5Nhljdw7HEgqvdSqHpngMLuoJmzFzSiX3C/AyEcRC7vnqbcGkL8F
	 cPjrwAct6OJs2z+74sC/Iv4tu15r5UkEFyjgIWPHhhz582DMgu0cHsnTzTyv1itMl+z6g
	 t6IbF3TteIkGIOMsadLkjKFGoFrT3MfhErN8ONPc5EfgtZOhLWPCiu5egaR5ny6LpCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
	b=AgzMO4AXxDbbcNWEp5EBGqgctXiK8NcK4c+fTiS/4X73tinzAD/SkFCzt+QKKf/v7e8B
	 qj8MiHg5+qRyCy2cDHy9GcYtnDjscr7HvWcMpQORngz/itSSzC7D6RdTuPFQBMFsF3MVU
	 YASF5y8KRealvQHx3KSqIsc7DTI+rs5jH/PdCEVNxanc47x3zII7Vr+Ttvdx0QNETSGrY
	 YXPBeKQAOjqnP9b5fIk7ayFM7lH98LK9OMY9+AAsg5O1a/cEaA4G+sCiGDTwobHlc7mc9
	 s8jRuXEtOavezjbWXrKLTMX2Mebyx/NVn3pkYrG21teVaxUCjzhfhRWZ3q1Ch6zcHrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hb/UPhHW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED12606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED12606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hb/UPhHW
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea138a3497so4883315ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792462257; cv=none;
        d=google.com; s=arc-20260327;
        b=lVx+nNSrvqlmsaw/AJqm/p2baqEGVhBj7OksN6Xyy5xdfY66PkiJo+sVvWTYDvk2o1
         BsH9nzsqP0TTHJMVNZGmYTSYD2Xq56DgrhtZJ7D0URj512/CHxMImc4wupZxPiYliNVO
         xR6akozmL7BWNvySddInEQbTpJrKWfFZzSPbBas2EvqFH89XGwyH3D8BDkr7kc6iMA1G
         2fQu2hkJacMxZoYYncVXFv0YZw7tX/lTu3HptSP70d2y8S0LM8bheURzu0yGLcxQ26aq
         xekSB8S++g7+jf3/rhcyL/geGuz9REwIfXP7jPJupqFg83NdliCnQN3+PzDsFqQn2HxI
         JloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        fh=3TQvARIAuadvO3WuOQno6ddh+XOaCJ3HI2X+/2+4GDM=;
        b=TBlOI3z4T8Bi5oSrIvnxUOdh/sfOaCl5dyg/JMAvM2aDTO4/hbZeNlfD8PP3xc1wfX
         M2BnYN1OLSADW69uHeHZWf7vvU8ctPAyinLRBESIoVVUKHMQvWcRrYzdKIO2TIOJT49v
         IE47MHnpurohFdajX1xixLr5DMNr130+GZtLOWyO7f/fQbwWd8IQLvAbIIaVG5Pj370D
         3IkwfWHxaMeH6ii9dcLni2eiZE3OX+GcriURFQrKjGpX8zenTY//2LKfzDgSCPjhjAI/
         k5+Mz7C9yqyUwNeQiXDprp4+iazEN+55u/kJVG5/KGuDoXEJh32U42+8Zrk7nsieVq3D
         3+Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462257; x=1793067057; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        b=hb/UPhHWEbBTw2Sv0j1Br3zlb1tF0v5WNhFa7htWdgnfMrEBEzsiE5hXvp3vrKt+TP
         A1iM4KW0YJYwxzG35H7vcpjnRx2CJW00YJ1JPRskO4JBnOwdM8+j0JMiVuFyDKqXxQqy
         IF8QO+DA9VVJVKNwvZA4wSa1LLQcm+FQ/mH3rTdFwZ2L0UY5SDtbjxoZ7bHzWztur0R+
         tgiWKShd9eA8WOCLKzI5UqagnrkJpCgp6xz+od/Wjdw1NYd1wkGPa32hCxCPRPI9iuRq
         vcv4YOonUtpCVRDWpIA6S8UcXFNuTSGHu3Bn+qGsMIkZDz0VzJrSfO3VjllcABlIUTXL
         UR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462257; x=1793067057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        b=QYzmshUURgp0XvicY7v4qyNOxPahOHOdWamouikLWfeODyGE+TZIqwfOCrAnDPu6jr
         E1Z86kN4ZFy/mye2NgTvUZrZUNm7nspVT/A22aMlpdVKECbYlchvUhH8abnqueKD/psU
         NIOQ6NSmIbHiiCMA6CfrA9Dp4leCI+XFs+36+7KxH0Rvst3ObaXkN0vN9LNnouQ2VhKy
         vo0vpk0vDJ9+JSfKqKGOxwBT4KLfTuc+PlEJcxRVBQoVHFNrqDzkmOlNj2mMLs+KfnNR
         9Bvh3LK4gAbwWcboTIAZPhpNxU3+iLKCB4Rz3mhjeZLoQb7/u1Iyp8OlM0tOQQncBDTv
         ouCA==
X-Forwarded-Encrypted: i=1; AKwUvByDVDjhL9skxImo5klvDoE4bIAqAtv7eDx58v7Zvr5MiaG6YKCLiQyHL31QQYq/HavHekCYe3B0eQ30WTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoJJxKdlX69AXNihsO6o0HsKeBwTd4PHe63wz55VnbrjFabEJ/
	/fkkC8AhZ55dKxFMUqsRspt1rdO8w1lYWFIIfcU+TuYLp5tGZtozi9ZrLm5XdKRCSApkMi32EfG
	J4nQltUjQ5kw3lBxNVcykBDXrwoR3aOU=
X-Gm-Gg: AYBFou2DzOjvL7fr8xV+2vablg04oZwHbQBxRljy9GzC2Kx8XL6GqEZH+PNEPTbptSm
	VaE6r/9AGa649aiJUon6nn9GjNbh9MWK+kiEI8R2yy9HW2/oR3WER1oaY/+7QdP8RP6gDG/oLn7
	bTjpKOz7Ml8wDCRFEY1kVBQg1Gn09RWG79RAAyyfJazKsmb1462n7f641uAKTvOYKzZUBNvyNJW
	xh/H5VgWHvvTkNR3CaWioWgh5goTDYdQ5kdXiSWkKbFNjW6Kj4/wX3PR4YvPhnWFZL9NuNLQng6
	Q9FOd98FmAN6q4lbYOL+f3au7YJ9dfXvCHE5OvdsVh1Mt7udaebIF22QqNjPE6VrBeA8hkBxqzf
	M5J3AY8ZRmKlbBduSKJHRSRxtK2q+GzO7ok83axFQ6SqG1rZC7KiNw2MidCsw6PHOdsk=
X-Received: by 2002:a17:902:e547:b0:2e8:93b5:c555 with SMTP id
 d9443c01a7336-2e9a6e5296emr76192995ad.61.1792462257434; Mon, 19 Oct 2026
 19:10:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-11-phucduc.bui@gmail.com> <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
In-Reply-To: <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 20 Oct 2026 09:10:45 +0700
X-Gm-Features: AclHuK-OxoOqEZe9QHO9PQT5BaN1GB4IUM0kwzQZDjYp5iThqBCJWYOaobvziFs
Message-ID: <CAABR9nGOmx6zvost-Y9Zd2nzQa+ZMYxt2PtZ8xYPLZqZVGHegg@mail.gmail.com>
Subject: Re: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component
 open callback
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,


> > In DMA mode, the generic dmaengine PCM component already applies
> > the integer PERIODS constraint in snd_dmaengine_pcm_open().
> >
> > Since rz_ssi_pcm_open_dma() only applies this constraint, remove
> > the redundant component .open callback.
> >
> > Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>
>
> FTR:
>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>

Thanks for reviewing and testing!

Best regards,
Phuc
