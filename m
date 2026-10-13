Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC553BFE4F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865122; cv=pass; b=bgU7kI2vfVyEo+Sp7pJe4tPvMLDxaG3W8unz+865I3kBszHSI0fbZDvjRylvNzb4eTEcGPSeAMYs/3wP1gHrlUpEYwb7tWsbJc9ueqTtYsjDk+drnz7AG2CO2Po1aesboBtI+U1bEOEPw1L5zMgXOuByUhzPrJT37owgIXbVZgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865122; c=relaxed/simple;
	bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftBahvTLq5QCZ11RrMwlvP8JSkMeSvwu8b0pDc91Y6ACeL+49igD/mBS9yRg6niCmuMfj4BuhGZ6pVq2902sFBKENpafVas+uRjjp6FLZOb0lNT6QkBIM8pPK6FnC1pCjdoqdYgTC4sjAVrayOL4FpnhHAr0huuvGJmfAGTTW2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAnGxwWW; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAnGxwWW"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-884062f3296so1589876b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791865120; cv=none;
        d=google.com; s=arc-20260327;
        b=LZeiaIfGnIeFzrsgv7lgQJu7FwxO3XSsFbb/sSWzhL9BZ4CgAzU20ftXQ+7KPJhrHf
         xQATR6/2/5o3nJLy4nFQm/Z0Dq3TINagQ7RAfUZQ/Vw/GC3vplmVmnNgcFx+HvMa5Z3P
         KsT0xUjbiUC3ZXWmIEvP0hR2fMdhteT5b+xmwKNnWOfZ8RBhLt9H90bQte86uJ7Y3Yjp
         keqBAkXZ8hQslE0eQKM0GZAKcLcqHs9Fz91pq4bbtpr/QwsCyZKcA3fcRY6pLq3cYGGH
         BtYx4X+Ivgwa6GZ912mZtjcXxU7wqRM2b6UyplxtQ+JmcWrDpVVjhPYbJCA2+DhQ73S+
         6L4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        fh=SmUW6XrM7kZrdznkd9edleGrBklbpyfBhNX19kln2UE=;
        b=sXKD4KNWsUB+tp2CfZGsEkjYiUTO0lBU7UODM9XALQ3HoerSB6ZLvG90UUoSZyFp1R
         Tm4wVfepu8vL4BVEMdGw8P2HAy0SZmTPB/1e8q6d6yA+VMqDgfG8pAjOY8WhH3rPNKK3
         72TtoKHLG28jgwO0A4LB8cc3PRGRyZtXJ31vcCcyS7vXTwppc2LY4gS2yNSaYLu/8uNB
         wB+id6Ez53yEp3K6K7dJVEph0Z/8ppBTGGhZqu1wki2d4eOwagLdihFld2Bu7flw15Vm
         RXiP3zGZxCYMjmHBf94hEC4djVK4g6Nu7zucqfcHOji1Nd6Ngd54yH5WVZoZvVTzqt5t
         HtEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791865120; x=1792469920; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        b=gAnGxwWW1NaLFGFjjBnWuN9tTcCkvKmMsKgTYp6veCaJKVQsFq8Bo4JlG/FVhatgGp
         2e2cIiPAGB6Qb/MIIA3ZWwBoAGg/ZeVaucb08SaLqLszvh52QBG5vD087h18Dvxm6SJ8
         +R+HNrAiUOKoQwJSAZtrGhhXqcvbBNJiia+Fzy47GLEXCwTJ11PkKAv850DxYnirs6tv
         qsbdxYjd83MqOKRm5qRCwUMGQRmoJkaDp8HRpK/PSW7Y061ASPNTrzWLdH/0PLAfDyab
         PY+ujhonpKwMOnSGLXKjMfMxvpLtjbXyoi3BoRIKNtCojJtFG1FJI5uNdCebMM/aYgH9
         WR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865120; x=1792469920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        b=Oyr8y3qcfq2n6kcBp1l4qJoZQDhwTNvuzseHdMhqCDnlIiS3x+z+xzTO1Njz5dU78X
         DyUi/P4BNTBRUW+sH4mjjLTa7DDAizUraYv8k1/N1WKFoust/742JsHZr5iWyZZp/fJu
         mf3fPI/fLbx5BYI1UFxoJgJt8wVvTo4NEKDrPnajrGlbFJUCMsEg3CTdYGS+K4C+8CMX
         6mPrZox5ejA/ZIA1mqnXB1caFW7X4UFYjPyR/YgjMliG7aPUdqPbPy0QEIbEG+Tp2aOE
         lUTQ3kOiJetg20HOwO1vMN9fdvGbp9udxW/5T/xpTlUpw6TqkWtfoDe9ucdueBYKacMr
         KPXw==
X-Forwarded-Encrypted: i=1; AKwUvBwI5SbTAKCjQxbBjFXSgA+iJ4Hd4ZJgV/o4OWfmt/Pm0PcsPu6BgCb5IpUsEm8PdR38O7TSroBWDL43g1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwKFAEk1O+BQ0EclKk+ZzhtsU3QYH5wIJxVO0XJiOc57B2hj6u
	qizpyX54dFuilyqxyR/lfxeIhMPdx6fkpB9MgPqIQ8wbwO0Iu+w2uP/Dn9W9cu5+LrwNuKh5wok
	NvYPnW1WAd8yYeACHpT4QAUnXSm8xzR4=
X-Gm-Gg: AYBFou1I7YTd7MfcVAwbMnOdH5mtcS5pFz1lMyi0i9YdvE7quwe2rDZx4j6inZL9ech
	AesJq5L4+lp9k+IdzIqANLQmDZvvs9MnCEKHklvkzMzdXCoCFX/yW3J5NPifAVJiV2ocijmQUTw
	g8zPA0KRrE5uYhYapG0mMcGPMKtiudEVOTwf5nUry2bM78Usw6CLlYdsFZ63G8UoJ6yDt4+w11p
	getEekFRX1Nnxj6PYbYYsuktPv8NK/o5kikaOzIK28EJ3Z8lNNESj4ay0G3HXvxlvIZcO/Xvayh
	sd0aOzGq5Ubvjq4GPfrP1K4wBPSfGbYgTt2A0AAHYCNdgPs8V5pSQCgOwnE6Y4UE4cldl45KlMy
	MYQkwQ1kfX08Cj9pvvPoYZQcO0AVLmBEv0fAhjoCWNHf3eR7w+8ZK2wuTAe10rInPJ4Q=
X-Received: by 2002:a05:6a21:4eab:b0:3e0:de06:126b with SMTP id
 adf61e73a8af0-3e16beff287mr10686193637.66.1791865120247; Mon, 12 Oct 2026
 21:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 13 Oct 2026 11:18:28 +0700
X-Gm-Features: AclHuK8E-95w9dmy_Nn8Ii2RGxOq8D0J-l4YT38o4WK2kAtoUqqhMqA48tZbgYk
Message-ID: <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
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

Hi Morimoto-san,

Thank you for your review.

>
> If so,

Although I don't have MSIOF hardware, I tested this on FSI hardware.

I added a .close() callback to fsi_soc_component and forced fsi_dai_startup()
to fail to trigger rollback in __soc_pcm_open().

When fsi_pcm_open() returned 1 from snd_pcm_hw_constraint_integer(),
 the .close() callback was skipped during rollback.
When it returned 0, the callback was called as expected.

>we would like to have such comment to indicate such background,
> because it is not intuitive for people.
> Otherwise, someone (maybe me :) will return to the original code.
>

I'll add a comment to explain why the return value must be normalized to 0
in the affected drivers.

For MSIOF, I noticed that snd_dmaengine_pcm_open() already calls
snd_pcm_hw_constraint_integer() for SNDRV_PCM_HW_PARAM_PERIODS,
so the call in msiof_open() seems redundant.

Since the first call succeeds, the second call should return 0.
Would removing the redundant call be acceptable?

Best regards,
Phuc
