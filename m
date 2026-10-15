Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A872731ED93
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028384; cv=pass; b=foPkgJYquOQCglHDoJoOumNIUGOJfoUY+K6ftFE8c+bkZRoDi7XspyxNXFh2VSIMo0HxwPddHuSFx4YGqUpbNfpu14Ag6s/jbssplQdlfQzpgTWILrV/sTNG2IXQnY2yYr+0Ua53ifVYjSfT4kV2+ioM1gGm+2k9M4KMnFzx79E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028384; c=relaxed/simple;
	bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c62JugcdCHigiKu7YVuF0joJrwa3+pZ5mubYAfqY4X0tOlBTTTABHffOmoTzCf110hoagUhsQlBnlxn5urtzbZkXY01JO1ZTWuBjHUDJ4uZH1fOUlbAyIdDiydNq9q5yxwplm8l0GutS/7q4KfHCW7xamQpqSxB/ZHJhplYC4P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1n/68Qs; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1n/68Qs"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so2105856a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792028383; cv=none;
        d=google.com; s=arc-20260327;
        b=HH52AgNk+GElM/TtK1vInIfF0h8gtfLJS76G7Ka8s0pWP/KkSzhnqXpzbjWFIJhDy1
         PeafNl+Oit8WG73zIO16EUXoWq1WgInpln1LXDNw9lZwrwu75DJMDn6DCu8upDYL0b+v
         BdZ1sbi9v3GsIDV1WQht+reRmg84o771uzK3GLu7KOvMzDCs1x03O2oA01tJqjWkqD3P
         JnMODzmOdRBZDoAfp3SJWAk4q3+L1yNl4RB/PPHXEqvVIJtwAcd/6/PnU5n5VhqwHTK4
         xxcQOnQmziA8FEGr9mNpnM0KNNNNoSKJ8k2V5DYnybJO6yWBtVBA5oPDe26T1U2nMkWI
         bCfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        fh=a0LoEwU4UaYyqX3EwRaQty8nAQRp85Yx1wMEh8hjIjs=;
        b=kooAJwRBqGtLyfeDgIN8WRu5fMdaWMUB+OZIpB3BQ32uh8SORAWj4nl2Jmbq8Ms+rq
         eD9a7/XSnDpfHlZbDn+JTR100ryYazkeXHMO/VgJ7+XIsjK09V7wI+9NffriHo10Qp9V
         8USqziG88sANmX3Yio32lWjpSHxwwSn596FerZY3mEvXRVx+S0LZi9YFmiJ9eai1JCmA
         wEjklSYCsFCf/d9iY8E3f5ZHydL01eQ76VjqzD4+giB7L3wFB3hYk4TCenLXYAfKiKsd
         k/eqZgmvhvfNqs1XTSCox+gpkkLwrfL2a6jswUDNAHZSyelzKfYy6EanHjUBz8/7Bazj
         PZSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028383; x=1792633183; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        b=i1n/68QsX5mSayOSTyq612muWvig38beYybjN53xxBowSpgKghyZ6wLe5SrKRhhFLN
         z7VEKfLPkGfG2/zX+ux25IZEL7f9Xi3dx+zNQtEhna+Fld8jir/Y0appgbtwM9AhTyTn
         cFtf5G0MM3ZtF2rOfVXOL9T4tCmaBtLml2ExD+NrV2AsIUd0uiADbe6TMwAseyl0fs0l
         ME3EELltZr+tcP01gHbOPNZmdvrjYY17UkYzSdaZZcxx08jvN5RXef9ZV5nyBLR7zKsL
         a0OiB70a0Z73i6ukXnGBCyjqZIjM66xUfkL5i1e5QHQSTD2ujy256iZQHFetz10tWtyS
         hxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028383; x=1792633183;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        b=BiffjrE2Ni2hoVB8Y6jtB6nwUiqSsgAOhQ+MSkhpcm3MpljuEYglSbiUxwOukDvo7y
         Z6toSKUvTuFeByaP0/o70Ty9IJJ1zj4hr66f36guDFhoXOVL/C4fcquoFhIWcuibesVT
         5+wCKRqzq01MzqkDAd1g4Qjw98Uw5oOxrEg+YGZNHSFoRRZ/q7yE3VJuOAGf6VP8EfSe
         9TaQJSekXC2W8PaqA+vheClKwxlPbgvC696aQ2CDzK+68xklYQnV7kDmyW5UolnS3JJK
         4usfTmWeXCGkIgbKMkmT8G8EZODETwdBI2EKWM5ffRwYx/M1N4SLG1DDzH8zSzdvZMZS
         2J7A==
X-Forwarded-Encrypted: i=1; AKwUvBwjWIZUvvC5xpwGY/8ESZUA9KZdvOZr7iM8CenOof+bNkBgA/o5yf4O7kj7ff1qrgDBP2U2w1ASJ5nlJfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGGDTjvkh6jG38Q6P/FOCJkPbbu4uTxH64UnbbgnK/wlY8fRX0
	9aWLa/MjGxwn8Zd3zyGzNddh8WtgaEVFH6MiQZHQGUEkUcUEtoJ95PnTSAGbI1X9C3vRegxLz0d
	QSA/siAssvfooz/ZEzwqOWIngqgXbR7s=
X-Gm-Gg: AYBFou2daGiCrzeowkQaPcy1velqQ7q5WCu3q8s9wIQsbk9m2kB/DARAxk8FIcw2E1k
	5axg/ZlsR1CI5M/ogXJIquWFGXPuKuBvTbP+YSZx5n7EwvjP7ZhjCPxnBbW3HcBah78KavL5Ju3
	VWhwsywJQglrLaZGzy68D7F8EVzwyZzCzKLMPAZvzEBVPxmsZSaIAe2p5TiBaDrEecv5tNDZX3R
	ElLQW5HpdLyjbbGtnqozLAyR6Y/STDCxqZ4lg0h+/9Tqt64kCshj+5SUrLBHZCIFrWENYzi7RVp
	9BYdn4KuexFxwv0LVIyhakdhvBO8BF4IhLYK+ffh/R/S6MWzzCI4uxy3YQK36177I6E2BpMEPiL
	42PBlkrc+yC7sJoOOA7qx7QzYIuAaBPkgDHRSd25taPi5tWqhRcanfDquDUhZVKOLN7E=
X-Received: by 2002:a17:90b:4acc:b0:3a0:e1f7:9b04 with SMTP id
 98e67ed59e1d1-3ab3a60ac9amr16312045a91.12.1792028382966; Wed, 14 Oct 2026
 18:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
 <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
 <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com> <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
In-Reply-To: <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 15 Oct 2026 08:39:29 +0700
X-Gm-Features: AclHuK8C1u90VDPCucQhY3afyuLfcxP0SCIJrlA3M2hLxVwcjMsqinLCGr2nhSI
Message-ID: <CAABR9nFA5p=5hnMoxFHLtmGEj4kvfrN6M6UFPnm9hRQv_CAP6Q@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, 
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, Bo Shen <voice.shen@atmel.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu, Morimoto-san,

> >
> >> For rz-ssi: in DMA mode, the driver registers the generic dmaengine
> >> PCM component, whose .open callback already applies the integer
> >> PERIODS constraint via snd_dmaengine_pcm_open().
> >>
> >> Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
> >> value fix only for rz_ssi_pcm_open_pio()?
> >
> > It seems fine, but I don't know detail of rz-ssi.
> > Claudiu, what do you think ?
>
> That should work. I'll test v2 once it's out.
>

Thanks for your help and feedback. I'll send v2 now.

Best regards,
Phuc
