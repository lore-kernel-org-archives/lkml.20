Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4295C48EC62
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871477; cv=none; b=sK5M8y671btxNOJpODaiUCasAAxIb7KmGI6ffREcSiH8xZ91LLCjcJXwngwVkTOCjd5F3RZEqnKEmGtq75qMNSIjGT4TYlHThr3pUScNhOhzmr3PUkIrwVV2plkt4mqyUmI8X02jmOaKhmR8qCDruQGGaOHAVFW+VJ9E110b67Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871477; c=relaxed/simple;
	bh=Rjpe9v6RRYU+NG7RT5Zptya1DV0KrnwiYyeVJX03vKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hj9gKGxRdJOSIDBM/dCXRbgszMxC/6TX3qf+ZYaXj8QN1MycBIpKKrpHdcXAjMu6H5FHdxJhDKuiV5QelUxJOfaJuLsZwXQnzNCf9NrY68u55WYGSq54x0c2LpNpcssjkhy/VDb11v0qheyD2HYfetuuLQ0nsTGeLFUqvluu8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4hbr3ff; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4hbr3ff"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2088507a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871475; x=1792476275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acEtVgfuadFdXlisXUuNZxKScLo0hQqEFXfuOZQe1a4=;
        b=q4hbr3ff9+S1j+R8AimLPx1f70G9+88Mad16Fi+2kjmlnO8Muo4ejlkIYcpmiO/AqZ
         YQxKNykLymkr6GhC1rtdzxwPb+ajPnj+VSY2anvgna8RaUkG2BYnGXV81+wWSwwMb5KT
         k3vHc2jN09FhdmRZyxuBconP8xia5Mm5SCYkaJUQlOgwwNwrJNNLCVGKyJNVyWnVUlw6
         gjIU/cCMjxmce2di5+I1JstYEs0KfQW8vf1lrfodYYxwE27dfz/hy7fNeoik3p9rLqmL
         ToKrpIwTbXt8NOf09GntKF/swwY0uIXmZg7MF4JHE2wFwcXN/FHZRcgdPvSGgjOWu3kE
         afHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871475; x=1792476275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acEtVgfuadFdXlisXUuNZxKScLo0hQqEFXfuOZQe1a4=;
        b=W3SDIbsz7pAgE93feEMfEv5jnThfFEtHr/ErebI693k0UCJfKq6zZDjZcA74TdDAOj
         mUAhIeVlKSCxX1FraUidio5AfAQrN8KpNhcoyxYBMhYCSG0tUwwZLZK356HPYa4tbiol
         7BeLdox7Jfg98wnaU8ZM/YT51APIkgOLHJ+qENHnZcvDZuE4oRo9CbDUrbSWVcF6qic0
         nxalkIuqmyX6XEhTv1ADjoq9Jno+O4stwrTL6POzkKQ6aFPaxGXfbFDTCXz6bMhjpNL3
         xp9y4NUUuhMLvYltVyJxYwmA+ckkCAmh2HPTDkqJojFANPNOSY4+z77nmBaQrZ4IVhg9
         BeUw==
X-Forwarded-Encrypted: i=1; AKwUvBwsxta2SVN5tnhLz1BOUmdskId70+uBaUoiXxsARqGncl6W16MIsor7DMb0dTbWl76QU8jIzkkInOwqQJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHfvgPoURmktTOH/rjettlOIbHbLkX8U5Q23ITDN41tte7JYsv
	w8VwYPx88XVCnAx1tIi3Xj7PFCnJVP8StT3fijfTqaGRDwhVQl8/gaH2
X-Gm-Gg: AYBFou0C2OxKFY33YOyU74ebealHMyWwfxKC3tCLbuNBKMvx7899x3rQ+K41q++sI6F
	ho58AbabsFI5xHtpCv9el4UPbliAMi0y/KWzPWmJrEmBZ+apm0VEFxWsIiwf9vYCpgO5trE7wSK
	6zKxOpI3kVYKu5RV27MFesD2xOn2yHco0Z7NLJofw8jQVqyWKInT9jr989bHbuG+DF2tXoeAKW3
	b0MvfZNYRsAuqpmjhhXtMRl5Zq4x0z3CyATqROaKH8QWJTnnbLkKMCv+IfNfI9rwT9L8fKoSd8R
	y+xxEU0tyAqEk9nmPupATEcUIhd7bJVGpTnq6ZK+9ud0FobvQobo+ABra4mRWfKL2hvxVdQ5uQi
	pb14W2YYatY5v3layzJIpKET5xzvB/rQGuY8zyc3flzMrvOo5UKcfFs/o7U4it9L3wWoKJZfKOD
	Q7c47AN/zjwy/YmIN+t1PUiHNrKPTnI0A2jx5mu/0Wfq66O6pjvYQmIQfGLPlaABk/NutcjX/o/
	2osE4lzthEWGxPOPvE=
X-Received: by 2002:a17:90b:4d86:b0:3a8:6571:b43f with SMTP id 98e67ed59e1d1-3ab3a9f7f28mr9589394a91.29.1791871475585;
        Mon, 12 Oct 2026 23:04:35 -0700 (PDT)
Received: from [10.25.160.252] ([165.85.154.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23035084a91.11.2026.10.12.23.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:04:34 -0700 (PDT)
Message-ID: <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
Date: Tue, 13 Oct 2026 14:04:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close()
 being skipped on rollback
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>,
 wangdicheng <wangdicheng@kylinos.cn>,
 Chris Bainbridge <chris.bainbridge@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Neo Chang <YLCHANG2@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Hemanth Selam <hemanth.selam@gmail.com>,
 Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Zain Aboobacker <zainaboobacker33@gmail.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>,
 linux-sound@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-19-phucduc.bui@gmail.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261008103831.542533-19-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/2026 6:38 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_pcm_hw_constraint_integer() may return 1, which is then returned
> from imx_rpmsg_pcm_open(). ASoC only marks the component as opened
> when .open() returns 0, so .close() can be skipped on rollback.
> 
> Return 0 explicitly on success.
> 
> Fixes: 3c00eceb2a53 ("ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu
