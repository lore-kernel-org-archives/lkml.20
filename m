Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A923806AD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387929; cv=none; b=Ldvx8mPzC0Y1KTGp3Xd8d14b4O8U8AlQiZmN34WUe78fFfaaLEV1zNh2ghthiOfaSy4605hOJOBChHiVO7CmUoYK/WvYiTHA9KQJTg7YAf8mzp/9OxAN/0jn6TdFrWS1vcp/FI8WNgRl7k8IuyRdDIz/Gke5xXEkSpLM6zBMQDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387929; c=relaxed/simple;
	bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/Kx9Ox9b3bvU2i2DnsUMQN3eC1M4qXN0alKTQYSqsqdyUpP10sH4eQn3CISc3ZtNsSkLp7Wl5XAyUI9UhE796gMU9KMIMLYfEgZsP24Bs509B/3RX/As6wsfVYP9k37jAVMk1A3KuVOSnyKjel3PUoCDWIc3iN1+iN0Kdc8t88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb3Ayo9K; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb3Ayo9K"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so12394885e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788387923; x=1788992723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=;
        b=Yb3Ayo9KHdIKe4V+rNGUL0qGvJHx9YBFlAjjC36OB/kyCg5rawY1Wr1W9U4m6D//YY
         Pxkfnpne3X4nD/2kalDcInPobDGDgSQMjVjWUWUPNvCTi3FWdaSD2z4ACZ3hOe0xfKKZ
         E3Mqp9hn+Qm5+/DzAiuW2BUDO51EBp9yq4FsGErFFdSPpcZU2e7IMk/Gu3+NkYOtVAaK
         yM18jTIZg22G0UpgTYQLosojkYDuqUq9+nPazXblvo095cT2RF2RQvhytfWHnS4DfNns
         8qPEi9noAtnvdPmtueBEvFwLjpclJnvlleluikP3JikvXE4ExFGeA/qrQU1FkmxRCX9I
         w5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387923; x=1788992723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=;
        b=OS/fPNT7vrRxGmiwyY8547D0rMToW3I5h8SX2tKDtfDE8I4qiUXIOpQ6MHjFFdm/7R
         siX7WTBGdKBCz0Z7Go0hx0mMrBRn9UEBi0OTMqqjcuyRydyRNSdSNkpyF1kBmg7dQ/iA
         P0Se9o0jI5SF0KnDPeu4MvJAxUPmpVAIYbiT5xfrTeHM7frgy4cYua6jW8C2XxuFN93v
         fD6vkBGf8H+xA0FrNNI9uKmhKQRFeFFf8M8G7ob+M5TbHU3nd+OMTOw28AH+aI1sbmlv
         c3FrSV1xZNBbPZJnRATuX4nOwo/WTzpdEwwLzowp9UvZX9EdModEk6tfHvYuYT6heBn1
         T9kg==
X-Forwarded-Encrypted: i=1; AKwUvBytORM0mrrjoxpKjj4kTr3rTzUklT7qBTngI3V6hxolEY4W18YgHLvAntG8CHP2tZdgNhCqzgYPzTYWpeo=@vger.kernel.org
X-Gm-Message-State: AFuF++k5cYT3wfI6J/i2C9oXiW0HOX9ngWT0deIOH3hWMPYzV+/7yTp3
	ImboE1cZe5/XJhA4n3/+hP0OdalHE1+/dKH23Gxmm6jN2rFuP7WzSeO/
X-Gm-Gg: AYBFou1G7yzjyK5pEEg9CtVn6co8p5e3stug2vhSltN9wFB3SYgmFkbqLfFNiGqpzaz
	fSMaof6Ib20+S2zWsf9CgG4c4vPZ70zjHrv04J/dg4o9d+KhXWKGFHfHE6qxPid+Ph8YCy1odnA
	j3Oj2sTtU78tECx0J58Kb8Xa5BDeS/2fLGNX7IKtGPZ7WZyHxsF26s9JEU2ZdZP/Sh3tzULfFYy
	7gzbM4hF5/aaY1uCcEx1D2ZahXASs2ChJooJTcYcTPNYl3pIQk3k4ktPBE+zC1GoENncO5Pyqhy
	16EbDfjq++wOmn/9IAX1dG7JNK/m1DVdgAVyyjHNwppMlhAyIZ5vvEgjkFSbm0WTVFtrqYxzURD
	oJxMkBtI9xwxA/YjO1/bbSN6XXESxfQcXBWMumGFfAQVxssw0fH6wSmJJZZnnDuSHQJNFsrh1va
	wz7xBVOhhmJZqH2d8K6cpblx6ZMk5qGsjDzGwXFZ2fjQjQhvDCharo4WDPTPYJOrXB4LD+Fe/bQ
	/b7
X-Received: by 2002:a05:600c:530f:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49ce55ecdf2mr157349195e9.3.1788387922631;
        Wed, 02 Sep 2026 15:25:22 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm20916915e9.8.2026.09.02.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:25:22 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v3 2/2] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 00:25:21 +0200
Message-ID: <20260902222521.1752085-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAD++jLmJ1+ZT=j_L79SuOzZS3PjOBgrCwhO8egaHfOU1ScLPkg@mail.gmail.com>
References: <20260902154525.4090276-3-mehmet.fide@gmail.com> <CAD++jLmJ1+ZT=j_L79SuOzZS3PjOBgrCwhO8egaHfOU1ScLPkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> What about just implementing generic optional get_config()
> in struct gpio_chip, implement a likewise generic
> gpiochip_generic_get_config() in gpiolib and use that as
> the fallback?

Yes, that is cleaner: gpio-mmio then knows nothing about pinctrl, the
same way it does not for set_config today. v4 will add the callback and
gpiochip_generic_get_config() as a mirror of gpiochip_generic_config(),
with gpio-mmio installing it for the pinctrl backend and seeding the
shadow through gc->get_config.

One detail for the generic helper: with CONFIG_PINCTRL off the
pinctrl_gpio_get_config() stub returns 0 and leaves *config alone, so
the helper returns -ENOTSUPP there instead of pretending it answered,
like gpiochip_generic_config() does for a chip without pin ranges.

> I don't think it is necessary to provide any consumer API for this
> such as gpiod_get_config(gpiod); as no-one really needs it, we can
> keep it as a private thing in struct gpio_chip for now.

Agreed, nothing outside the chip needs it.

Patch 1 stays as it is, minus the npins check I already told the
Sashiko bot was redundant.

Thanks,
Mehmet
