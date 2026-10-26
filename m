Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793014102;
	b=zOHA3IxGdaq8heJIlB0iNWrXPG8X1fwWZuhyA8o7a0JvWD7luYHqZpSSn4TcI/z+d+P2
	 q7I9cMtRdYlm413ChwU1qHuVs2FEf7G3JGOWCWjxZ3aKlJZZavLWljtIlT/KG3/+6Ry30
	 u1qDBZZsm55cdFiyyQrRL6oKXQffXD68zbNMtoJbOIywG6t0Q4vLDmRZ8sL9a5rWzeu7W
	 tQ1mEKrUbvW4zQIN0x4ALIJUz2PFsmwdd1mILwGEtxu5lxychC7OSJ3VR7FlimFVia67g
	 W1PYH2sEQiY97V6tDkdNskfERi4wJMmn3oW9w65GWfmgbHygRiOj7PYfZdEixpAdHGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
	b=0oXd47VGWEWt81B0gAgHzWqtchd/BmN8io8k26z+hKxj/MzB6Y5Cg0R4E/EoeCHhCQUP
	 JjaqfDY/ko/ObZOe1FYpZFovldPgX6GBc3vsC2+LiqZaaFFcq8o8iOD8N5VTbgTYY3NJk
	 fJUYGm7VXUeVpEUQ4EHQLIeEnt6wOEW4qM410YJOEfJQGgDA38p1IUafZOUCB6Uenz8ny
	 ckBfzUV1gysN37orAFiMXXI3H/0LOL7yABe3iDaHtw4NcsD/HYgPc8cwzr+yBwzf3g6q+
	 VkIfQFe2JkbZWPXTd0tcf4PGX7mRqWekz6uB1tzHhf/+dH6Uw/njc7JXAY9uZ5l2P/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mOTUJ3xu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49330606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49330606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mOTUJ3xu
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a05b210703so1097234b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793014101; cv=none;
        d=google.com; s=arc-20260327;
        b=J80og0yb4cnjb6y9kja5k6mWgCInxSwa47Jdlh5zcwhRlEnIGAKzyTgiErXDZixACr
         9lgQEiqJFfPOj6iG3K4IxTPFrwQc72xtUgqKx8v50NobwfLEbfGnmUq3B+UgIuZ5PIxa
         3xrRPFHaKzuYydk12Zbwz2kx4VSlHJml2D97H2N4wYX+bNt2/eg48Q5b9V2qsXiLDLSQ
         VZYqjE7E7Y9uz6iLgCQbUw1qKfryIQvuz+oeeMyyW5U9B+eUpjid4Qlht8N6ZIvjPxAX
         p47Xk1V9uHtrq3dgshlYuVxFCj90C7E6ykyJKfWv0pE+57+G3YRoD8/OQXvHb2D16FZl
         iMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        fh=/W1Owkq6LIuxxp5mT2IzW8IwQz9IgCw9iGczUJC6a8w=;
        b=iYpQDpMj8qeJMizDubyI0rMoI45Nzs73Lux/qNDu9rz421tc1FLTtfBRanPYb35R26
         SS+cqfhJd1LrdBo+MZ1pmMMCr+9uXDdHuxE166cK06Swiinx6oXvxcNMZ2QdYfbTQewl
         MIsh1U0M4A+N97Qwb/rAQ6NBaKBWQ9BCeMI/mfXX2F2ad+OQkYOJiEC1b1Fcmh+yLlCs
         iRaA4zkL7vhZ/2zMWsXDzP/5/s9VwzakkiqQJj6+B4VXmgkMlvglTxbmNf/2BCZFRJDk
         422Zr00cTRKcbZqEmDk3Nv6dsNx4GcMHS4yMFIamJ96tIXb4YvlS3g5lfNNwQBYeugMs
         Admw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014101; x=1793618901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=mOTUJ3xu703cPmtcG3UrlXZWO65PcRz+Ljj4tHK+BkhN+Fuviyrzhsg03ja8kNLaOl
         +GkqBnRH33Xer93HUnKA2yFN3HNX/BNub3O7CG/xn47P/q5BqGu+igHhWNR68Jc5EH62
         i0oELWv55SBX8nbMFgxerKr7Pp4Sms8e3QKZrrzZRXHa1dep5xm8nLwGWML4jjio+ahd
         fkrT588vKdYvqrysAp74/NXD9ErP16ae6AjkdvdqIaxfiqJvW71ZDMhy5QcipvAD0aba
         k+gzAH/m06k0vq6eTOB+4poUEV3LEIUGYze7g3RquAhJE5tAH7HmehJbaNnnH3327v9y
         mUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014101; x=1793618901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=yOVvhCtIW1KSc5S5McNCaghWxXXYy3lI/MN0u+5oI+bm2XOyYh76zzTeTOaucBfvfr
         N9/MmDP8r/m5Q1ZLvLgDJF7vE8JEkVt5KoIrSa7vdCChcAme1+jP3yb6Nzm13Q+AmNp+
         9/orOOsLwfNw+qHYhQU82posjZEQiHcp3vwFv/oLBnqfi0m4Zxz00mqDB78MuNMzheyA
         WhodRrMCc+fKHAiFS0I8/aGLyRq2w5wcMNWbH9v6o2MxOHzYLPCMwHgG102gZf9tnJFZ
         MF8g3Kist+uT+M9Zvpw9xvs1WgN/1y2k61kgqlQs1sJJ32WVSaaoUPhRjO9QTOYhjR9U
         YJiA==
X-Forwarded-Encrypted: i=1; AKwUvByI8vkiIZZhVqSoujNHxtHAZXlM+hTk5+9ysyQf0UIdcvdcRL5EiK5EZtDDNjw9Ymhv81kh2kIepxDMgt8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9AZCobi+GjAPDCOOBktTO6ccH3VBzOVSlYVF3WI5ACIWJbHaZ
	0cTN0ss37WLXVMKW1mHJ2v0SydbHAnZ9hqaZ+dpCivg/qLHXZTOXmk2NwSRZeDG142vUaSkwd+F
	HrrQ8PY4bdr8XbuTkg/VSIWWK3be5jivWsxSAdppTaS06
X-Gm-Gg: AYBFou0WraOqVYuyEvLGjQYMlrhP9/MyFm2MfAhibwVd9JKh+jEQ7ngCZuvVcMY3Xg4
	gEhKAK5Fa3M884CG725rw0vFYlmn8fFAW8peVwYfO2cYHROIkNkYH8CtH9rENOMrHPk//j5SdCC
	lZVtKQFs69EyKmOdiwR+kYfCk+PcH8tOBgX+hVo/77/91tjoBw7Q1NBdhSKKBtMOSz0kqguEYr7
	EaEfcro6HpRwPBC2Y/UmnJpAoCVFV9IqRoPkWkplGzCJjySWOwbdfJdByBmlI9N2aqYzMPOSX5E
	IdxzS2LaMAAvyW0dM9xHVYxabj4bars393y9BGsZr+GUkpwGd3POx6xEI7CrevUhH1gplVjrLDg
	Z6zkg/h00uivGs+Rq0NFZjjwMyCg7e0mGmlmIkTCG0p8P3rqRclCY
X-Received: by 2002:a05:6a00:bd81:b0:89e:8915:24aa with SMTP id
 d2e1a72fcca58-8a367a36becmr5121820b3a.18.1793014101519; Mon, 26 Oct 2026
 04:28:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026103730.3a79c2e6@kemnade.info>
In-Reply-To: <20261026103730.3a79c2e6@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 11:28:11 +0000
X-Gm-Features: AclHuK_DqqwJbE8Mxuk5nig_6kiigbCl4FyLzQRmggV5Ihs0oknU8AOuwlyhfVM
Message-ID: <CAAxh=jtYnDNQTUOf-cBN=w1Km+cBFOgrW8moNbHfqcApwxXbgg@mail.gmail.com>
Subject: Re: [PATCH 0/7] sy7636a: power the panel only during updates
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Alistair Francis <alistair@alistair23.me>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mainline, on top of linux-next. I started looking at the hwmon IIO
bridge. Coordinating and cross-reviewing further work sounds good.

On Mon, Oct 26, 2026 at 9:37=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Mon, 26 Oct 2026 00:39:11 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> > The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
> > can not power the panel only during updates.
> >
> Yes, that is the common use case, power things on, tune update process
> to the temperature, update, power off. So it makes completely sense.
>
> > Read the temperature in the regulator driver instead, as the TPS65185
> > and FP9931 drivers do, and remove the hwmon driver. Boards that relied
> > on VCOM staying on mark it always-on. The regulator also switches VCOM
> > with VCOM_EN, gains VCOM voltage control and binds to the I2C device
> > directly.
> >
> > Tested on a PocketBook Verse (B288).
> >
> Which kernel do you use? Just curious, maybe some further upstreaming
> actions might be coordinated or cross-reviewed.
> There was discussion about in-kernel hwmon readout interface like it
> exists for iio.
>
> Regards,
> Andreas
