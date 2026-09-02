Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1AF377A95
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369492; cv=none; b=FoPKoI+gfW4No91XYvb/AryWGpS4kqQrsbRGHW1wWZDBJ3sppTUJRvEmAZHYP4LTojIIrfsZFF2WvtZZTrjlVrO8JTDRSJMGDMY/OXE0JpmVTDKNbLt5dIoiJ5XVrGtA3WtTnugPwaIiVsUjPJ5iZJcYjkvJhRCg7LYcZdEx+zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369492; c=relaxed/simple;
	bh=6Tn0OaGLRreTIGbEtttcTbq5pI0t6SsPxE+m00j3r9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhJ8e4MRxzb++INdD/ZhCGw6c/GKZLC3cAphsWWhbTGfn0sLr3nJ8LpCPAwN5TRnFsxV06M8NUQlkecbm+fF/pqzTMHXE5HHpkG7M8V/u1qQV6tRQzzkG71WM10Vhksgv4Mo2TUJmKK40KT0JRwA7wffYXaSWxQO/Upf2g0tZaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQiC2YgF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQiC2YgF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so13793415e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788369489; x=1788974289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6u2dskLwsFp3RaJUgt1/pKQoZpVju/VbValCvllVzDM=;
        b=sQiC2YgFgEaWhWqjDJnEZw5JlPXTqPt3V2KVYB6+fXZ3J2DuDP2Fv1ryk5YfiSY2Mk
         P+u8zSeH+Yc46/fa8RriSUR5ROSKY0cpZW0XTNmNVuDxQu6MdcHsWov2jqFLoLBPm2cX
         HUx5xi5zkMGLPShVJfjUWDCMYIohFBcFuLPujWcxh3+GocjgL2ooOJJwcuz19gr6uDgs
         A91cllbVqj6Fvkx0vNOU2X7gYFtNE99F9zGxXz9cAmqIooFaEb1rNAfTeiG0OS01CgsK
         OzvCdiKJrXyQJmw0IoPFb1J+w0YNQQmbvu1iIwJ4jeWzdNWw4m2uaEG0//urxuBsh+cU
         1zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369489; x=1788974289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6u2dskLwsFp3RaJUgt1/pKQoZpVju/VbValCvllVzDM=;
        b=HUiZh3hY06D0o2ucMV8H34mp6oR8NDUzMt069rJM0UGkoUD1vgwd4A3cOvncRPDxhX
         lDMJ1L6grNpjy4F5qwxPRuuUW28kBsdVlr6s7o/hH7qtJXjvCQDijOC0s/cuxDKlqmW/
         aDZbMuGxM9vxvks/hmug2i4KzciOIH24vHFlflvVj6M4wUuhVheSjxj+AirPuRukdZI/
         zDuISG+wBRD3KXkggeul7ENaFUjr7BbCuGjN2RL/qsB9tCKSCT3FnrSgaId3ya2U8zEZ
         Hla0K9DrkXIZ6DuXkgch3Tbs17vJMJ5gm1K6RKuicZigxLInw436K1TjB/IWCI4u54DR
         KxHg==
X-Forwarded-Encrypted: i=1; AHgh+RoY38XJ5BhwUkdVWc4csRNvor55DY6C2xJ4oAoqks6NtP/2zbgUHfQ8Sp18sodKpUcdqVzFiPpHVqU8Sro=@vger.kernel.org
X-Gm-Message-State: AFuF++m1f9HLPMCGYRaEmey2B4q+PV2WWoEnwqIa43vxj8xuXKvMSO3r
	QDfKJ4zCMmmo8xWtQMsmAnz7ccN0Es8PqeZlkLC7ITGJVWLXMDN4HVIy
X-Gm-Gg: AR+sD13J9sU5Ni7tyk0B9v7dTW4vwYUBhlNZsw4moRzZkTrcuixqz+OGaIxleAGzHXn
	hP98VaPz/BSw6de7u4L9wtFxwrhGx5KbC90HBTnb3r97CeGFQz3v/gvxUOOEDDoXqN8tNY904vp
	lIc6Z5zHwJZKx/M02tJ8KusynNbkOBUhSIdEu9SXaUIGPrweU7F6yLXlc/6q1IFIofAx/QztHQO
	v5kNez/Jmp+UExvFopuywJlmEek48N2AkV9eTtNQ4UjPHXsdTA8IEM4JOapNFdhg3oQzyvn5kr/
	o4rMg/dKqoQhrMZGYiJZBpBRcyd/nIQc/6pDEGumxQPYzeJm++Q2ce9BXAQhlL8YN4znraWkzgn
	zgxA7FrB0FPe8Jq5Of8K2dnH4phwDspzsBix1awyaCxh6tenvSaysqZQVmXpp4TQrnqldyMgUcd
	0WVWTZu7nlZzm5bocR2A1vatK/UxSVXo99sw1lqELNzQXoQ1yjd9pgdaqMtez6KIsi51NC0Ofz0
	aga
X-Received: by 2002:a05:600c:4f88:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49ce58388demr95277025e9.10.1788369488491;
        Wed, 02 Sep 2026 10:18:08 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80020sm8076593f8f.10.2026.09.02.10.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:18:07 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
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
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 19:18:06 +0200
Message-ID: <20260902171806.4141524-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902155931.38FCC1F000E9@smtp.kernel.org>
References: <20260902154525.4090276-2-mehmet.fide@gmail.com> <20260902155931.38FCC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: High]
> This isn't a bug introduced by this patch, but since you are adding bounds
> checking here, does imx_pinconf_set() also need this verification?
>
> Without validation, a malformed gpio-ranges property in the device tree could
> translate to an invalid pin_id. Since imx_pinconf_set() lacks the
> if (pin_id >= info->npins) check, this unvalidated pin_id could cause an
> out-of-bounds array access in imx_pinconf_set_mmio():
>
> 	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
>
> Could the same missing bounds check also cause out-of-bounds array accesses to
> ipctl->pin_regs in the GPIO direction callbacks like imx_pmx_gpio_set_direction()
> and vf610_pmx_gpio_set_direction()?

No. Everything that reaches the driver through a gpio range goes through
pinctrl_gpio_request() first, and pin_request() looks the pin up with
pin_desc_get(), which fails for a pin the controller does not have. A bad
gpio-ranges entry therefore fails the GPIO request, and the direction and
config callbacks never see that index.

Which also means the npins check I added in this version is redundant
and its commit message overstates the problem. I can drop it in a v4 or
keep it as a cheap guard, whichever Bartosz and Linus prefer.

> [Severity: High]
> This is another pre-existing issue, but does imx_pinctrl_parse_pin_mmio() also
> lack bounds checking for *pin_id during device tree parsing?
>
> The pin_id is derived algebraically from raw device tree properties:
>
> 	*pin_id = (mux_reg != -1) ? mux_reg / 4 : conf_reg / 4;
> 	pin_reg = &ipctl->pin_regs[*pin_id];
> 	pin->pin = *pin_id;
> 	pin_reg->mux_reg = mux_reg;
> 	pin_reg->conf_reg = conf_reg;
>
> If the parsed *pin_id exceeds info->npins, this uses the unverified index
> directly on the ipctl->pin_regs array, leading to an immediate out-of-bounds
> memory write.
>
> Does imx_pinctrl_parse_pin_scu() have a similar vulnerability when indexing the
> info->pins array with an unverified pin->pin?

Yes, that is the one real hole, and it is where the fsl,pins value is
turned into an index. As said on v2, I will send a separate bounds check
for the parsers after this series.

> [Severity: High]
> This is a pre-existing issue, but can concurrent driver probes cause
> hardware state corruption of the shared input_reg in imx_pmx_set_one_pin_mmio()?
>
> There is an unprotected read-modify-write on shared general-purpose IOMUXC
> registers:
>
> 	val = readl(ipctl->base + pin_mmio->input_reg);
> 	val &= ~mask;
> 	val |= select << shift;
> 	writel(val, ipctl->base + pin_mmio->input_reg);
>
> If two drivers concurrently request pinctrl states that share the same
> general-purpose register, and the pinctrl core calls pinmux_enable_setting()
> locklessly, will these RMW operations race and overwrite each other's
> configurations?

The core does call set_mux without a lock and the driver has none around
that read-modify-write, so in principle yes. This series does not touch
the mux path and I have not seen it on Vybrid, so I leave that one to
the i.MX maintainers.

Mehmet
