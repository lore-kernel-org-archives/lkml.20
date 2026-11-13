Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794565755;
	b=YYK919fkXd0hItYPvPBfDKrUhjnK15jF4CXBl9AasuxL3kkvFwIerB4Va7cdLBDmiBpC
	 rYbmIOLx1fOf6/x6Dcb6K90XLYIfInEu0tMi7XNhPh7QCO/1+QYFU5v6pTtk98bkMl3MD
	 0UVNycZic+1Hc8pzCOScms4lpwZxnnWz12m7YYnL7m6zidad6O+mAnMEISAKNMmzx5aPm
	 NmA2QDObH0LE+yoVNFfNIkE0PWnza9Gh7QLl1X7Vbo7xiaRKI+Lcd42gKl8Mxnij9DW4O
	 +mMJ4RhJpveozyVU4XRcavLrf7zhzqe1vmgaHhEq+snp1++AJGzUKQFKNYaWicxurOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cLlqqY0k7diIlhrzv1M1aVJOoeE1a6tJkKZXoZP0rU0=;
	b=NytRiyNiAGDqhM6oPn4Hgm2Rq3P+h5lXrxb50oGPgNXQkYjdiP8Ii8SmkgLVbstDP++/
	 2J+X1qIUIQEIOvxQTv2slGiAOhG8kRE6AeO10IXzqQoAD1rUOmZGpoobRIfWlu3QYQ0aH
	 F5/zPgpg1IoqRUZFlb6PTHQjvRKkT2flV/UpAk78c5p9JrCQLiEObBENCcn7jehozrKCk
	 qND2FXseY8tDWy0GRxdM77cLk7vhhJSWf+DdjGYEauuvfePIHMxvTOEsgkkfS2K7N+R+W
	 NSkFQmGAjzcNo0aAij9UVM616LmyrgNfJMxm+1perxxFWRKpQw+CyZQAqWWe3vPZqXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDvS+YtY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72010606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72010606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDvS+YtY
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso1194356eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:29:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794565754; cv=none;
        d=google.com; s=arc-20260327;
        b=eeCOWy/QS9TdF26ugwyEQuHMI2Q6CD6g7bC5l9JyNNogV1sMxE8msp4MzdhQ8whCC5
         Ykm0ZanKlKNNQfvm99lge/6XqPN05kcPr5vjbN4FDz8UEiAUFLqIEap85AkS6toPLoxV
         oZvi3zvwNjVMjl3clufnsN8qB66x7MpIjVHJedTFdwmlYr7E9eTA4oFJu0juKrVX/zTv
         Hb3TJHooHvsN++l9RqYEWaxRN6nUskN4C99gQpCbyZIp8YmcfMxr5nzW2wSxwCOaLLXG
         85Kc2K7PHDqkW+sUkWnizBZ19AgjS3rwXW1cSPRYV6yvj9h0BtkBr8pj8TXq7Vcl6yV7
         j/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cLlqqY0k7diIlhrzv1M1aVJOoeE1a6tJkKZXoZP0rU0=;
        fh=7a/rizYeEp/H45MApMHC1DQE1mRV/lfvfGhZJsO89L4=;
        b=pRmoKeReL9GAyUg2BbsmUbPTf28goScv39HDSML+mg61hqqVyF9DpF28ikC4AOhStA
         B59Y+MSgyzj6ONpjl4wfyGQOcDe+bToj9Y1Jd1nW1iKwAqzEZW0QAXwf6vJnaSqtt3Si
         82vF/q3720MtXt5uYc6RNpqPB72S3/C4CLEyeriKZVYwM9EdEIaP4xfs45I6CT5CQxU1
         yQgY716sgVNtZ7rBssBOH2Qq94f5KGzdvbkqmrxjU+zKJH4YrSLlRMgwcExY74R6p8kb
         myPxCgRaU+mwgxl/uz/LYiTXPk8XLGU2JKak6P2NGxCxg/yQOU2ewBW0UAzk/gAWcGPr
         PuyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794565754; x=1795170554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cLlqqY0k7diIlhrzv1M1aVJOoeE1a6tJkKZXoZP0rU0=;
        b=TDvS+YtY1AbTqAyGZ1p120oYrqqEBQUua5EF2onSOkfyB/igjcBk3zHmxtaBIRmn6m
         /cUajT0QY1fRwVR1QGJm3pufwc+P59LwlfISZLTOlcmRjhS6wM21yfW30POC51d0yD53
         nJ5KZJ1F8EvA2NWXMe77ZbSnv1tgaMkch19sjHlswpQF299Po21Exby0G8lgI2WosR+d
         gmJQJphxlR2jQf1/f7DYhhNcHoYeqdSCeM4GbVh8GW7YfM2+U31//1elpRZBJMEElWQi
         6mNISV/+yZ1T1N4f2mmexYBdxnMpxWX/2SD4cLqAXQo4+bR6UIaK+ywFgs749NOO6uLM
         NDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565754; x=1795170554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLlqqY0k7diIlhrzv1M1aVJOoeE1a6tJkKZXoZP0rU0=;
        b=KWKtVzTlb6vJ1QnBUgwVhYfeeX3mc3Maq7yXkfbTn/6QGczRkeqXko6cHXKK+fAPVT
         peqBmwRK4s6gZLQZKORyHcLbkRIInQXWrkLK/THLG2fGeEgJDMvm2gmsQdH1iymbP30h
         i5QG9RDEkZ2/QqwK0FEMk9tsElqSHpaDN6DtdnHeVVxK267Zr13Lt199OfMzNLTw4vly
         TRKacxhdQZo04i9a9NgODgWBJUB1kTK8VlVKzPbC2sb0GmgPQGDXp5hAdZ65T7toDanD
         cscSOnd9UDdgYG/rO0qC5QMKEmwYJIn8L0nENe4/uGTinz0FNGEb0VowcpzBORXMyxlL
         BDNQ==
X-Forwarded-Encrypted: i=1; AL+hErFEUwoy9csFQYGMGt6ZzncQ57tbPNw+DnEGrkxa4ulVCJfaEoknoUet1IOuga280aW8BGrphknh0/+MW2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NejbYZu8MqO1XwPQ7A3lIgemy9pm1pzVie5ku4edS/BLwj2co
	dQPysbupqWmJbJ9DDnqMGYaC7+SfZvBtJ4ZKOxFlutmP8hdpTfVPisMs4X23IUka2x8qJ1IQK6y
	iVarx9hshVttsbi0gkfgHpgyYDbGx3NM=
X-Gm-Gg: AYBFou3nK4bhETR5XrThOv+0waHiFrtLL0GX6cylPjd/uQCyciFqO/bHXuCVPfHGrkC
	lxIUbdlpdqLvEaXR2XEUOiUzZjNgWazWpnHEgKFy0vjMjxyXFC2rNUKx5Hj9G+pd5J7UNBsHel3
	vlFs2B0kCHcCH36zeakgDgN0LSOn/Hs0gA9HKHJnfvma1DNsGPUcu6j8kQZ78P1u/XTcdN1ytmY
	E0TZwRzyd4gkJzoCsplpxDLMEjUVBopE2fBEjpBRf6nUZWHD09mGkkyhYoS/E00RSag66A+iBre
	p5u6sE8ih3LBHGD1aDE+OcXevpzpSQcr5YRkP7Ad7TDtsSAfbLZ53QSYq7I5Ft3C51YHtGAZkjb
	QlQwvfeTsSwA63jlLBPUyX8Ipm40bYCztThIVkZqkTsLP3XevOL8SlLjbeSrFTUP4UQU2ggYHtA
	ofKKtYJemPPo/V3Z0UFKJq46h3invEnKk=
X-Received: by 2002:a05:693c:8813:20b0:376:77e6:a66 with SMTP id
 5a478bee46e88-37967315a29mr1873378eec.16.1794565754508; Fri, 13 Nov 2026
 02:29:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
 <CAPVz0n25-LyOFFu-h7Sc0iUcjLMk0njOuAAHr-NepQbnZU6gxg@mail.gmail.com> <5e3fbef26b8500de7c4192bd6cb6eb5248496e14.camel@physik.fu-berlin.de>
In-Reply-To: <5e3fbef26b8500de7c4192bd6cb6eb5248496e14.camel@physik.fu-berlin.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 13 Nov 2026 12:29:02 +0200
X-Gm-Features: AclHuK-Fxw1Wk4d0-g4CX6-_wsdY0XEuPYGBEZCmvji7RJCYCeNHh-w-hBV3HBw
Message-ID: <CAPVz0n3SU1eJ9=zzXmaB=y_c8faNMFB2HZfUwZQg6jJkNgRSjQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Input: tsc2007 - drop platform data support and cleanups
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Yuki Horii <yuuki198708@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-input@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 13 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:5=
5 John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Fri, 2026-11-13 at 11:33 +0200, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 12 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
08:50 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Now that all in-tree boards using tsc2007 (including SuperH ecovec24)
> > > have been converted to generic device properties, this series drops
> > > legacy platform data support and its header file, removes redundant
> > > memory barriers, fixes minor coding style issues, skips registering a
> > > non-functional input device when no interrupt is wired (when the chip=
 is
> > > used purely as an IIO ADC), and uses IRQF_NO_AUTOEN when requesting t=
he
> > > threaded interrupt.
> > >
> > > Thanks.
> > >
> > > Dmitry Torokhov (5):
> > >   Input: tsc2007 - drop platform data support
> > >   Input: tsc2007 - remove unneeded memory barriers
> > >   Input: tsc2007 - fix minor coding style issues
> > >   Input: tsc2007 - do not register input device without IRQ
> > >   Input: tsc2007 - use IRQF_NO_AUTOEN when requesting interrupt
> > >
> > >  arch/sh/boards/mach-ecovec24/setup.c     |   1 -
> > >  drivers/input/touchscreen/tsc2007.h      |   5 +-
> > >  drivers/input/touchscreen/tsc2007_core.c | 183 ++++++++-------------=
--
> > >  include/linux/platform_data/tsc2007.h    |  23 ---
> > >  4 files changed, 60 insertions(+), 152 deletions(-)
> > >  delete mode 100644 include/linux/platform_data/tsc2007.h
> > >
> > > --
> > > 2.56.0.567.gdb80ae8cd5-goog
> > >
> >
> > Hello Dmitry!
> >
> > I have tested this series on top of the latest next/master on the LG
> > Optimus Vu P895. My device uses this chip as an ADC for battery
> > temperature measurements.
> >
> > Your patches works as expected. Input device was no longer registered,
> > ADC part was present and worked as intended. Thank you!
> >
> > All series
> >
> > Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # LG P895
>
> Interesting. What kind of device is this? Is this a SuperH-based phone?
>

Quote from wiki:

The LG Optimus Vu (Also known as LG Intuition on Verizon) is an
Android phablet smartphone released in August 2012 and noted for its
4:3 aspect ratio 5.0-inch screen size - between that of conventional
smartphones, and larger tablets (sigh). It is powered by a 1.5 GHz
quad-core Nvidia Tegra 3 CPU with Nvidia ULP GeForce GPU.

> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
