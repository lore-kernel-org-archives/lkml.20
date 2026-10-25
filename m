Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792938982;
	b=Oxr4H+daB99z1jawlfORx+ezBGDI8qxrdMUiJoYm30UAYC50QWds347jHLYwxt8jnVzT
	 OkVsNIWBs6RIzFLuGia0E7Bg5Jynqzp9Add82wW7nUd+osIr4HwAfaw6LKsLLf2hPET6S
	 YPydLtsAeZKWs3bVwKQ1Dzrv+/jXka781Vyzx8mVDO1W6IebwJx1fT2C0gz/CJvo6vU1H
	 q3Y/0Ew8V7AFGaeTwwvkkdiVgeacSdZjDiXEMUFEf8WXv8DEuN5YahxzqS7nFh+j2DbPL
	 DvkzFOC6bXd3utSHDkI/N9pwHmmIKPkqzllxplivM0wuZebBCkWa+Q90My0EyEukFzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Po2NCbgcvrmtddNbEBL1t3twpXIAbb1P85qqX5tTEyk=;
	b=1cDJMrlPW8bNX4LhZu3y+t6fpZaUT563JPm/MYEDoS0Udx5o3dKXlgRjGkwSufTsGOOm
	 q1NcYQcl3g8JespvrPWuWePvqpdbtr9Pizo+aF4wAknjSOY3gmraPCwY3iuGsBWuNzAg7
	 tgl9v9eO3e2Qk9RR/ldFcofXOgbB0EOm1Igxr6QCGESiv42vmQZqiekSac1Qp/cKqY5Da
	 gzdfoU8U8yaiN12irZrKO+jqhWe9O7QNpeeHEam8cdWuySORlf+7wnNfonJrF7psb5sMA
	 SHkHzYRG2anpwQNEJavfCRT16nZF+AhJI8x2ZNmwvXs/Rovey86lAhVem30COvXO59w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n2fIMKE8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F328E606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F328E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n2fIMKE8
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c315869241fso265582966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792938980; cv=none;
        d=google.com; s=arc-20260327;
        b=gJWDBCDLYWaUPP59zhwCeJbiYfeQ12bDCYT/s1KgbM04JB5ZEg7R20gHncQ8oys+As
         6q/2/OhLR5QxkI2xlCkdas/00xx0/GeP7NPF3teIIMHgV4tcGfacg0H59bEuTapSRVvs
         05gFKZ82OmBA6LwTwFGj6jcyTdKai2hXY0C9lj5g0esN5sXqqS4KHLqYkXFuH7T/x/ms
         +JKYFsF82pye4xIlH9UjXYGNp3QnuJWajdvngK/fxLCCssk5xilFsn/dP8QNeVqjeWUX
         dUv60+q/uxemjfzYrZkPSegy0t6vgSvHyzjYk+vBLCtrJ/WK+Zed+FdScVaUdI1dDSxn
         EBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Po2NCbgcvrmtddNbEBL1t3twpXIAbb1P85qqX5tTEyk=;
        fh=gOsqadcdMHm1ulqRB1fdLD6OkdwZ2D3GYRdL1SOb55s=;
        b=HsOnIAtvU0WHAJKvyg/xHnogA8YOpB7WNfJwEr1USJ8IxapSEYVQQM0vSNwapKXOhf
         4SKksqPH9HsjQrG4KFtZpib0Y4cTMymzOlc2/LE058XnP1SLD2IZeYoaDkd+cxk7S6w4
         8UbaRgXWGLis/VJd7kom7eHkbJu7vTXJlRxhhxZQgDau9nyIcb0Ld1gVOov+6amQokdX
         3Vnzyem3VQOIw+PSv308GH83sRq+NSKkgenLFhVVKh0XD3QHG+FZfqVR/Ssl7ZfWzKp/
         b6HGaTgTg6XVL1V/oG7tCWwWVoAlot+hlEkbAqkmrkJb8Ub7A98zOYagbCyNDNPJm33U
         l/Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938980; x=1793543780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Po2NCbgcvrmtddNbEBL1t3twpXIAbb1P85qqX5tTEyk=;
        b=n2fIMKE8bhvhzUF3n73ULQhb1N+A/1GLW0UOgdEcpGWlJ6+IaJ7KBsNlsWqFtfC4v2
         Ae2GaG9SACGgD2rLglbw1s9w0T4Mb5RVgMVcYGSDQ1Z51YSFtbkLEyNcIVojtY/AVwlD
         xhzWbxtMBxE2f8qHhgmgSVwCf5AI/vw9BJZrWQI44624v3fNZIw5PKsBMCsjnAI0eRCR
         C+OR89H+cBnVH3/o5KTdgCIBi8vJPlucvjuMDX6e6wJob5U19VosB4JCAum5xpkEs6CN
         h0R6ARTJTyExr6bGxPzLRaYmnSQ/xp3MdHRMm+pUT3ze+ub0b6dbBVifyvq4dy4sCctP
         5Fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938980; x=1793543780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Po2NCbgcvrmtddNbEBL1t3twpXIAbb1P85qqX5tTEyk=;
        b=ZOQIwvGYj51grQQhjp6ga+MIFp+YKZK5WsD8o20tZiWQWLMrWyXd1mRBsBf02s9u0a
         b5Ii/fz/eE5oEXa+pQTJbK/DsQWNNhqhgXv5QN2rGhAazCjNYUeT4AR/eBxoovYiVr9e
         LkhzSU+Vqf6bijLHvvjcPA8wsjEx0DKJYFIbeIZw3dy5yha9CqG9DF/fVW++nYMfYW8k
         L+qR9pqAjjQ3ou6vg2nEnPTxR6yrx9Xbx2kbFjBrMX2zZrci8idMSoDwY0H///1MBo7b
         UAHCJLGj5WILeBk7pRZft5w6tTSNagPQMy3Ikzzxt+BWFPZ+8O6erPkngf0EnQC9UOwB
         bBqw==
X-Forwarded-Encrypted: i=1; AKwUvBy2j8jezZbialcro2zl2B+RzhVazoRs7Fa+iCgSFZWnVvv1M3jWvRwCqjZIcLm97VeEHNCKIWkvgY0hbmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9IyINEN8itRn/M0fSzhqCPFPbC+tlLrs4HAJ6Zy/KXOiutzth
	8C6hewT8TBukVnSc9vo3W/l1BcRFOMRLUiOdiylsyAMySaiubFAyIGb0JoFA+UdfsGZtw9cqtzI
	ursJjupaBTNDdJFGPXvdjrWGtPGYRYE1Yr3R7
X-Gm-Gg: AYBFou2AlyDQgSOYnyBaBo1AcgVBIc+ikvMDNnW1TCAXXnCuzVaUiq4tYMS4fZkTBZ3
	sO4l6n0ogcTjm3MEz7pr8ssnFZnEThm9RPRu47/8RKIynVbgqWXy+Wh2iR6e4iUXeZvzO8wkTP4
	wGjHXRNxf7R8enur+X+Ra9beJmI0mEZwKaqxyAP6M9qM6OrfMmfkoVSx3hCrTKlHj/r/jhVFrE1
	v06XGTfy4OQWX9MdbDrAl/pc3xjtNTIceOU5zfa2uaoM+De9qGk+pdX3KPbKBEo9Jmyg+mZJbBq
	A4TLhtuO3AferFZDaB/+1ilGxeBfyQdtepk9rMqKRKNiMJdlZ7xVVDrCuQrabMGr2n1aaHj6ZN6
	zmBG0KmxYsBisIg11vOjQQeAjaML+75wCwNKznrrMKH5Xe3jsQbaQ1MWMbfCo
X-Received: by 2002:a17:907:86a8:b0:c43:6fd8:922 with SMTP id
 a640c23a62f3a-c46bdaa7a52mr542836666b.1.1792938980213; Sun, 25 Oct 2026
 07:36:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024140854.25664-1-a.shimko.dev@gmail.com>
 <20261024140854.25664-3-a.shimko.dev@gmail.com> <20261024-dw-wdt-shimko-v4-resume-imbalance@iav.lv>
In-Reply-To: <20261024-dw-wdt-shimko-v4-resume-imbalance@iav.lv>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sun, 25 Oct 2026 17:36:09 +0300
X-Gm-Features: AclHuK_290JbiBCCRDiz0hbJon1lNZeyrcj89Tr3YD7jXvELikUFKEPtExqBoIY
Message-ID: <CAOPX747Y1pDm-3TMmnYiXgVpt_jr++cQakGQ=cLt96B-FxWWzQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] watchdog: dw_wdt: manage reset line during system suspend/resume
To: Igor Velkov <iav@iav.lv>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, p.zabel@pengutronix.de, 
	Sergey.Semin@baikalelectronics.ru, mika.westerberg@linux.intel.com, 
	andi.shyti@kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,


On Sat, Oct 24, 2026 at 9:46=E2=80=AFPM Igor Velkov <iav@iav.lv> wrote:
>
> On Sat, Oct 24, 2026 at 05:08:51PM +0300, Artem Shimko wrote:
> >       err =3D clk_prepare_enable(dw_wdt->pclk);
> > -     if (err) {
> > -             clk_disable_unprepare(dw_wdt->clk);
> > -             return err;
> > -     }
> > +     if (err)
> > +             goto unprepare_clk;
> > +
> > +     err =3D reset_control_deassert(dw_wdt->rst);
> > +     if (err)
> > +             goto unprepare_pclk;
>
> If clk_prepare_enable() fails in dw_wdt_resume(), we return with the rese=
t
> still asserted. The _deasserted devres then asserts it once more at unbin=
d,
> and on a shared control with deassert_count already at 0 that is a WARN_O=
N
> and -EINVAL; the next suspend hits the same. Deasserting before the clock=
s
> are enabled (or on the error paths) keeps every exit balanced.
> Not tested on hardware: I can't make the clock enable fail.

Agreed.

I=E2=80=99ve examined several drivers [1][2], and it is indeed normal for t=
he reset
to be deasserted before the clocks are enabled during the resume.

There is also no requirement that the reset be deasserted after the
clocks for dw_wdt.

I think we can move the reset deassert before the clock enables.

Let's wait a couple of days to get comments from other folks before sending=
 v5.

[1] drivers/usb/dwc3/core.c
[2] drivers/gpu/drm/panfrost/panfrost_device.c

Thank you for testing and review =3D)

--
Best regards,
Artem
