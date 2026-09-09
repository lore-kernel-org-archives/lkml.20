Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFA63559F2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941301; cv=none; b=B9Eg8Li8xBf3REjdkZkvMvDQDQQcXAvjwaOPaC7rfC/6GcUpsfqMvHwJTppJVbr0nw+Pfx3IBEtFI3bVguDvU9YXwv9NeUXz2Ai0dakiVUEQ7HZsT/xXDNkflmrIV0PRVQQXRCaOUEKKpYImzeME1ylvvHxmEQpsBTdNxGeWj7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941301; c=relaxed/simple;
	bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6WJ5oMjYzDMN6hcYLufAmiJyeZV2Gn/xmyX38bq3vueJU3Y+WLTlHmKwaz5KLsedeFMWGT/tz2oUGE0ZmO4rtUj7LCd9wVgIIcDQLS3lTVRh/RNhVF4AgLt6svwIXFZqFSlTgxJMPKG9sh/Y4rP1HPvdQRyK7rx3sC+qDiuWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lljv5Bfg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lljv5Bfg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8687630fso46602335e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941298; x=1789546098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=;
        b=Lljv5BfghPEyAZdBHB7ojjxScB4j14WMegeylWwkxP7lkBcyZse9+AIxKLDVSn3/JH
         2W4G0KyZq2XtfZAyzv/Wl36qCZUiPIU+fXOwyqUPJlR9S3nHA8MhtDQlz2M9euS1WYHd
         xeZiESb+eNDcdLRSzah979Q3Ok6YAydd43ahoESBUqj79lB/L/IRlvT8d8XIIqimG5QX
         9uIRA+tOwa1YL1byuJGZmT5GPVGWkJzP8JQuaPljsHM5U44KGORKCav88fzRlRfE03h+
         WtwgarPJFGD2/SclFwjjgoxcgWocYH6Adw94CH9gUE9pmGfWNUZKIlKtjmZMzii4TMxV
         hBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941298; x=1789546098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=;
        b=QlDON9OQCRQBGs31pU4f41fkTIE/VxI/0kGBwe2LPsdfy7C02gPvxVGNr0kgK5C04a
         1jwZKxhg1YHv91RbMQEO2VN5OoxYtASgJhbQvfuP8o80HeGMz4XkaULXN+UgM2dyfCkM
         1KGQe03QfDlCLxgpVsSAq5nOQB3tOkRn1KHrFdCOs4M7MTCC4DWYRnU1Yae23QDAgi05
         qDrijf4MK/vF6Qo/Crp7dvO49GoqpmmJoTtJ9CFVxg5kULeqCyKUWbZ4n0APMHhyUTZl
         UXTutb6zTroveZqtP1Ni2yh654tzrkeeFMRFdj5D96SPg3mYvgG3sssPODFEgSST7ZqU
         yOyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFdIkdbOzENdgEcbVo576jcEcKs7dMz3D1MaLYJZfBUb2xzpHEL6Wh7vI/Owg8JxeQKilxTyT3CnXROR8=@vger.kernel.org
X-Gm-Message-State: AFuF++nzHWkc4z0fW7Yejdj2U5kguoSDjjc7Iy5yjqYq0YDmBrm7qGBg
	EcZ6KbbsoVb1FMU5RzoEa9upfYpI+Yv73X41+GIjnatFaLkc1vdGG48U
X-Gm-Gg: AYBFou0CC7gMbel3GP5ZrWq8MZ/D+8S6DF/vnO5zSDcoejOwnfwKbNsgsoSmw7H0ZpG
	VafIaI0WMUKC1CgRL3eM3zYJGFuG31HzidfncPBNU1/JKPKLS90/nBP1o02nDRe9k9S5bAX1pez
	wrkAvOj9Lk6A+f6ijBhorVawEOSMYbIgozUzozvXxirk6s1tpRsNIwGfcZsLpCc2MyOYnXNlSpT
	2gbn8MJTFc+ZGaFIzenPcWeq8JSatLDYfHoOVQiyo8ChA+vqf4IRSYpA9p0eM/FdF2TC8L5N9Jq
	y2fOdp7pbllLiwO8O//P2jF0E62LF7D8WNoj+qMq4mP+N7scLj/1gW9AcJILjtcI8PceK9RATpu
	GoG+kSYS+iaFKj5zdAKfy54uV9yVZLXYM7d2sz56P7r6kSaJ5bjZfHtrSblJZWlt/kYE5yVfmHl
	1P/pM8NThUWcBhqddr8dAa3icMxXBRAiXgjCeV36RU25ll9G3D5dMDePwZdSVHXqrdFs+Sw2Y2z
	bi2
X-Received: by 2002:a05:600c:3b1f:b0:49c:ee06:9c58 with SMTP id 5b1f17b1804b1-49cf821eff7mr338313485e9.4.1788941297583;
        Wed, 09 Sep 2026 01:08:17 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm46285355e9.3.2026.09.09.01.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:08:16 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: haibo.chen@nxp.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Wed,  9 Sep 2026 10:08:15 +0200
Message-ID: <20260909080815.2297127-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909063018.sajfn5vjk4y3oyi2@shlinux89>
References: <20260903075940.2089367-3-mehmet.fide@gmail.com> <20260903081432.278721F00A3A@smtp.kernel.org> <20260909063018.sajfn5vjk4y3oyi2@shlinux89>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Haibo,

On Wed, Sep 09, 2026 at 02:30:18PM +0800, Bough Chen wrote:
> > Should the pre-existing setter stub also be updated to return -ENOTSUPP
> > to ensure consistent API behavior?
>
> I think Sashiko is correct, better to aligned here, but in a separate patch.

Agreed. v6 will start with a preparatory patch that makes both
CONFIG_PINCTRL=n stubs, pinctrl_gpio_get_config() and
pinctrl_gpio_set_config(), return -ENOTSUPP. With CONFIG_PINCTRL=y a
chip without pin ranges already gets -ENOTSUPP from
gpiochip_generic_config(), so every caller of that path handles the
value today; the only other users of the stubs, gpio-by-pinctrl and
gpio-aspeed, are pinctrl-backed drivers. I will compile-test a
CONFIG_PINCTRL=n GPIOLIB build with the change.

> If changing the CONFIG_PINCTRL=n stub in include/linux/pinctrl/consumer.h
> to return -ENOTSUPP, then I think you can drop the explicit "#else return
> -ENOTSUPP" in gpiochip_generic_get_config()

Yes, the #else goes away in v6.

Thanks for the review,
Mehmet
