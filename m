Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D50479885
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149971; cv=pass; b=iwIEyx17x6eaGwejxOx/CMXXY9lCtZahbfdaoN27SumUY8Yz1HyDehKvkEn8y9nGGbgY24+MN73pj2Le+biLimUJWG3D1DqD8QK1KvBekVWQjExegNzSlLRrcbjISfE5t2AexgHZYy3Ef1gwY3jz2TQXi0wV7yGheLtevchCeMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149971; c=relaxed/simple;
	bh=R7fc9o/O4yqhA3W/kJmDsBhaIBU4bJflgTG28U+KE44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEkN45gGdlseiVrYi2UEoCDgVjw4JBWk7kJ3dREJ4kV5Uu7Y4w/QbP1274eQsGrPUnVT35Q1/7z6umW4naaeSl95B4cLqG3m81rQBY/N/NFHpTIGCvmdkc7eLR7UL1oj+H4JaHUc6eiuzlzbifcmboMBiC/iPCFh1WPyplEHMxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDUOhPxJ; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDUOhPxJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db80fcdf8bso37339615ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792149968; cv=none;
        d=google.com; s=arc-20260327;
        b=kbAgRY/9Vls03V8W848aGxd/XZid4ZpX9182tdQ4/l9Cxp8b38AuD6VxrFsmnPy1Vi
         8tup0mB7NwR9VwPAQhRu6KymUTsiX1DJSn7nkUbqunJoIvnh7RZOO8cqxCxyZjWGfrrM
         Ue33JRR9L/CP0Sw420okCGoimbB9wWOlWOPS9XEJ9JGsm/mXUf8ZMTmtO+vQn3hAwK42
         qJaKf4MC6WpQTAIcyxiUz+c0IqTM9eW0CMnBwrGwjdeL0aAoDy9wMmus64dKJBVwghwA
         hjoA94LKIVpsjQlATiJZu/wdGsnCzhHRl061fXuAgiQkmsPkpe0jwLOeKi+/1kwdpP5l
         YNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        fh=fKqNcj5AahCvsECB2hotvkOQS9axacWiZ0Ofcec1u0Y=;
        b=XMWcwkntzXTdaJNj3wI8QDokWhJv5iK8zOGoujUUk0hfsb9lg8Epw32nfzx3pDrjOP
         6iUq8xc8jQ4ECv2EUGTkDmDT7c7INQjxrtguuh3BDCIHHE4qHATA3NLJ8cisuIzmZYBX
         AljTU811uxIBFDo4gHCg/GueFZDyTmWjMkprDbmjX1WxHdl5dMCA76ic0jSSWzysOMZ0
         lbwNHo/qgiXBHCAcJEUcyB/M/hyKj1seFBZuCiAIFdo2+DKrBpV8/MZzrxSSa/enufF9
         yKd+sDL2cmzLQQVFLbEU3yvYvpw1zKoDNPuMREKRBf3pqQeCUjeEwyWJ5ggW1bGGVuma
         bWVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149968; x=1792754768; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        b=JDUOhPxJFfNqGzF6qKagGJ9RdRyuEtlDsg+3/BmwOi8JRKOFv69C/T58mLShzd9MLR
         P4lD88hLeJxqC/81P7wQ53ZoLv+i68KSQCpKcKcJfrTplRaSwkyHF9JOQS+TRyVtR2GJ
         ynQGWzn8Zc8IG6In2A46KxGeym75SzVyTOUSEG3ZzyQLMuuDdyep816xIYjogWDEEwp3
         3LywSes+jn2igaxBP5OqlRJ5hZLuboyXNJghCSwRjbQkzKZ9TkR7T/Hw9iZa6V/FBa7G
         JsLPrG8QIVh1537rgYtGIKaIpXnlHN3ECjvINIepxb/jmZxy3P1u65/S6l99rhkiF2mE
         3sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149968; x=1792754768;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        b=lH+gVhFq2gqP0CI/VxwXcV10HX77uX7jdo2aixF5S7S2GO+eK4IyQZsHoZS/ht1+Y0
         aLw7UvN5PxQIh9YFMBORaIfUr2/csw/qWifB7HKecpn8h+5NVF6vISV49+kFxlQzo+Zv
         4vXDhZFy5ObCsfsiPypyjiINnNv6FUObqf7GlcM5dOFj/oMHYewsLtylQcystF9Cx6gK
         HbtRl1Hl7eJ58zJG1AieEHafFm7Zr8iIbQJgvAMKX1A6dMkJtuBm6yWvhJw+/2/muygG
         IHb9bkoDhSowzW+gEVv1vX/mbOHnDbTyqUaYHYZA8sZ7DSFvxaTGZ0qJcTPz+uLkM1wy
         t4dw==
X-Forwarded-Encrypted: i=1; AKwUvBxw8e2a3Y+8cdcctiSkY8MafdUzp3sEm/9x19rq/ikbGJwGcBhWGv2ppFOGqof+TZbIGr3uMlQNUrdl07g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD4eZ6UkyQ/kxF571Mi4vED2Y3h0+C5sIbL6zcBIhLm9azAKXX
	XROjflF8S2M3Xz+OgR+m/DALRwap9JG4IPSsTGOfSZMBZ2v1g5XXLEfJXouJ9YXhC7MuHMWCd49
	ZNL07KYI/E84giO9fkwJL1EvafVZXTyE=
X-Gm-Gg: AYBFou260y1ArDMOTrVr0YzPe6XjEJTPQ6IXTIXX6WGCtSkX4Lm9nmhWXk5OTAqN6d3
	2cJEQN4hQTGJkjj5kgdJG0MeIzK2tKsCGzMdSDUMx9XDRd599m46rEV0mvphytd9OYCRzY50RPr
	rNPi5wOTInO7n2ZDJy+JfzotUdVpWfTc8UDl7lNtO0L1MJpGrj29TR2ZOmmLLsmQh0Z/T3r1B6P
	+vAC61FS8qjMUuCbWmHnLlsumkXOioPL9Y1VrfsWaqP3A40HErSCT9Qn5iy80Y5KF0e5jzXoEa5
	XVPNmxb0bWIr8ZyIaFo5L/vI1PNhVkGSZamHaQ1XraX/ktZdkCvPyJpo/x46XXhi1BD0dN1gQHS
	8D8tZsBxiIROJ2WnEE1ugA/NrExbqn9Z8FXWA5cC/Zk7vVe5OSvCRW9PdxGgkztc5bjw0
X-Received: by 2002:a17:903:11ce:b0:2e9:4e83:1979 with SMTP id
 d9443c01a7336-2e94e836527mr62789995ad.32.1792149967287; Fri, 16 Oct 2026
 04:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <20261016040048.506531-1-phucduc.bui@gmail.com>
 <46a96bc8-2ee7-4c6f-ad8e-94321f8b9630@sirena.org.uk>
In-Reply-To: <46a96bc8-2ee7-4c6f-ad8e-94321f8b9630@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 18:25:56 +0700
X-Gm-Features: AclHuK9bobvuHZz0ZvKJfKfhAJdiG3c7XQlmqU2uHEyUuNfyFRrkKv-rn3SiKZ0
Message-ID: <CAABR9nG8PeQS4GBGwENfHTRBUnroKYQiEu29iztix+py=Arprg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] ASoC: rockchip: rockchip_max98090: Mark the link
 as started on success
To: Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, povik+lin@cutebit.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
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

Hi Mark,

> Can you please resubmit this as a separate patch as a new thread without
> the series numbering?  This is really going to mess with the tooling :(
>
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
>
> Series numbering only makes sense within a series for ordering, if
> you're sending something separately to a series or a new series then
> preserving the ordering of the series just causes confusion.

Sorry for the inconvenience.

This was patch 25 of v2. I had only managed to send the first 24
patches previously.
Patch 25 failed to send due to an error, so I sent it afterward to
complete the series history.

Link to v2:
https://lore.kernel.org/all/20261015014324.5569-1-phucduc.bui@gmail.com/

Since you had already applied v1, this patch does not necessarily need
to be resubmitted,
so please feel free to ignore it.

Link v1 :
https://lore.kernel.org/all/20261008103831.542533-1-phucduc.bui@gmail.com/

I have also sent the incremental changes in a separate thread, as you requested:

https://lore.kernel.org/all/20261016040946.521195-1-phucduc.bui@gmail.com/

Best regards,
Phuc
