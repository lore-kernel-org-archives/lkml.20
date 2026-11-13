Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557690;
	b=PvmYsvCbSGKbNjAMbbkhSVlGDKxbvJD01bEOFyqW4DX9Iv5L8k867eBnJWU7Dsa2X3dP
	 +PTk1DfeK5gTzTanx90fB+cwpsbnoEzCux9MahkXl+6ui3UuXgj0ZesXdvPBbviBGecyj
	 8Vx4eUGdYjFhV6AmRnKofywMpg84Lqm7RLeoLPCzArlazI/tCNZ1HJZ54Mb1xsV0N0+YW
	 6zjgxtrTmnfNgYzzMakVxDusakRez/XH8okz2h13v7rc0Axz7AOprvVZfJ8oKSMVw4jvO
	 ub5i/KYs6YjkscUBHIDnk0Qg8phzrCX0UneMa8rM6WhU0utwRzYGSgw3TWJQDuUPrGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
	b=m1comOeKouUcW1bJsR11GGRgUJaRemRlEIGULt5fARZlcNCj9T8EiatISHFLSlBB9drC
	 r57mFYCLxwhh//IiKvT4/CiaSsc8sdMnLkQ6GLl4TpqiCtsuOujSenOe/ZXQoKpBNGKNv
	 9pr1rxUlnwbh3hBwIwZuecrTOBd+DcSSigi/px3Ly6uBJnz/X4ebKSakjyIo+OL0VPz/F
	 uvqENrOV6qP5MTQArkjdZRkgy8ftnsRQjwMRKn4UHggbe1w3s7D55G4B56fKsnKLh0ujI
	 uIRGrhI7p+QxYutnM2bg3P+gJreujyYi7QiORlzjyOsuzQS0CYXWp0gesZewTFMOXNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uh90lnyN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7860606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7860606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uh90lnyN
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b3b57a31f7so5977507b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:14:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557689; cv=none;
        d=google.com; s=arc-20260327;
        b=U40B/pXTVCrrSt+xs6xCh7PaM5HYdQhC+bJ1g6oc7EEokYCYEsmvqd/yh+P58IDSlH
         VO93WEy1JdS6n4KxCGqszRJU54V424GkRjHMMumBINUMY1pdjsXezo0KpG4wCjXGIGJo
         u4ueJI7DEtfGEjq/L0BMU1ePm7DEcObjrSi3LZ/jIqjDWE5Efk7Kt7sCyTJgL0VT6V6/
         orj1QGfyKmxACsWb52EQX+k0FhJbUO15TwJQMd5It8Fl11JEvRXdMMan/+2HWVhLmBu0
         tsrDo1gMOCfDIxVvBMDuiam3Yad1vS2WwRZn0oTWO0FbUxTrUHHmeiC85zI0CDATFZ3i
         vOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
        fh=b7vsRqwTZ3GG13jVZJlxIv5q2Y2fRa3ITMc3SkHSRAk=;
        b=A2kHy/rtm1xVS9vlkGrZeJwU/7b6tbFlmnOqIORycMknm4Ntky0gpj7MsHrTUiGB8k
         ABaHwTrGncfOqvkoFi3VNiAbMdRJu2SW7TXg36bYWFr7EO/sd/6qRQaRiM3/bdtuhCf6
         zyaqmrToZql9AQrtKKkXzGJ06c5AYQAB/kOnRtvDcMzudY5FFef1rkNEogZBsvPuNOlx
         CWs+CpY8vr8k+O1DfwdWL6e/xJpaWvHq3Tx5tkeXUDMiLw7t/uNzDR1++BsNtIhunvRR
         49+wnBoK7IgOym24LSHXz1dpFwnGOBdYrGAB9AmOKo2NCfgvmPTFDxi8yUnJdRu+74mG
         Peww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794557689; x=1795162489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
        b=uh90lnyNNe2LomdS17bHJkvNG2Ku6NncGYaZLF3kHYinZQqPwqSNvG1OwZBXfA8Sya
         2Jul9kazkfrylBNQpcLzj0muX50PgNj4NkweAR6JUPUg89zg/AR17OE+IlEHY00vgSf2
         ekcf/sket8aNcY3bw6fDhJQPA6NWb7QcP45IbzG44z6R7pFaDQzsAr1o+cNrAVpL8d5L
         M16NWo8waq47Fs1rSLR8v75XzEmdfo2S1cMmd1FL8JSxlAl4HwlnuqfN10K2IRG94GY2
         U7XMV1kJ+lVgQtKAHmEeywrsCa+q3At/VdjOEwRHFMldnDgEZnoC11HUXt7PkT6OE3ra
         g8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557689; x=1795162489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiCNNSwI5Nypfmnib/f95ZI3hAxnRLqbOlfAgs6jJ/4=;
        b=XlE+tsD0mGMGbiG4x1gVzinsI+oJXx9XHjwpOSPDdiFF9JTFW79TspxfqEsgdsqySU
         f/2uPvLHSWsCsvH9eYjvchvhcG+GNrRo1K25uPdkmC4RksO35PBFy8Up5NpYVs0AIEUe
         2BxDM0A+itg0Kv27ON5l1xHqd54WP3bcB4NtmHzEu0/x9jq8vfWPtQcHtc00zfUhNTI1
         OmjMoP+2zKp1Rv+TUA7ue036vh27pHgDIrDWGriAYSVyrlfhFQD3a8Kya37bo8mdO7VU
         m4vfzdSWPTHS0mVxspCtPze0pYkYLLLpYR7hE2Skfypf90q/cBZsEZh7umTShpF8P1YL
         HTVg==
X-Forwarded-Encrypted: i=1; AL+hErHakjELebnQLmCq4GNdt6Ib57+0zri0vGiLfHSjb41uQYCeDVaMDEGC1w9J9BNVE0+zijE3djE2Pvw6J9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TRBgDStdshzX5BwZp0O2LBQS6qt5eVKxVquijTwxQTcnuKCz4
	jHMv8EvmARdWMmcsndA6sE8t6j7zOwoyAqlePcYrMF/7iPKQBpX/vOSrHNL+4YIo4d+6m7BWLwN
	Flabk9ZcPDIzTa58P4va3ZLOXTDxhBKU=
X-Gm-Gg: AYBFou28yVPw63ru2xnRBLDkpz0wJzE08Szpq7fpiepBV4u8fyvKqX3ECBQbjYE4Ipa
	QA8okl0eRzKeBjOdyWFcTJyvOs2cmhinLABZ7uBJnUQ1JBihtS9VA8RauxU75A3yZ/pvfjwJj90
	q5CK3DztcjCqu6Y9sx71IxBm41UATPD/y78PSKQt5TqbYksj5OGAVDapQVatDN/ABt4+4EHE/Re
	PXZaS98HAaCfVaBD0CLi6UXkYs0XQpMweieXsUa5qcQEg3d704HF5CixVCIT3/IZDdyr8Uoyxjv
	Grs7mC08nMScbki/EUT6cLvKuQuwdzvhBpZ7GluWy5h2tUO1QbgxJxKGKmkH4b2rNMYJApB2CaO
	k21XKLkkv2ag3vpXmdZb0sVHoU4Ogr1aJdkzpgPf51j+9GdqTSn9doK9SBxR+wQRZgHq2dOFavg
	nXivE0h2ISuPrced5pygL6hPig/UQtYXY8T/CcnGYLcFOay7azfUoqkbxyzoPfZ4HjeZ6GJrmgj
	87YRlVvOXia8tI6wRSyzSoeSlNpLtUhR7M1Qgjtce4tZpRRTz1+vIlMA73T/g==
X-Received: by 2002:a05:690c:3181:b0:8b3:4b5d:b27e with SMTP id
 00721157ae682-8b4aa305e99mr10167187b3.97.1794557688698; Fri, 13 Nov 2026
 00:14:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
In-Reply-To: <20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef392ccf@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 10:14:12 +0200
X-Gm-Features: AclHuK9qbW-wyynTctV_3zFfoGINtBxA66oHn6uimxFXxSc9GV_qnhsXF2XNvyk
Message-ID: <CAHp75VfHn8op1UqAwn7Rs6SxnkseK0i3GxipFpdAnjL1mJGAdQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Only change the PMC clock
 rate when needed
To: mlevif@gmail.com
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:39=E2=80=AFPM Manuel Levi via B4 Relay
<devnull+mlevif.gmail.com@kernel.org> wrote:

> atomisp_csi2_set_pmc_clk_freq() enables and then disables the sensor's
> PMC platform clock before setting its rate to 19.2 MHz, which leaves the
> clock forced off in hardware.
>
> The sensor's clock is also controlled by ACPI: the CLKn power resource

Would be nice to add a Link tag below to the ACPI tables

  Link: $ACPI_TABLES [1]

 and refer to it like "...by ACPI [1]: ..." in the above text.

> in the sensor's _PR0 writes the same PMC clock control field that
> clk-pmc-atom writes (1 =3D force on, 2 =3D force off), and the two do not
> coordinate. If the sensor is in D0 while the bridge runs, the clock is
> switched off under it and the sensor stops responding on I2C.
>
> This happens when the sensor driver probes at the same time as the
> bridge: the i2c core powers the sensor to D0 for every probe attempt,
> including those that end in -EPROBE_DEFER while waiting for the bridge's
> fwnode graph. On a Lenovo Miix 320-10ICR (Cherry Trail) the ov2680 probe
> then fails to read the chip ID in about 1 out of 10 boots:
>
>   ov2680 i2c-OVTI2680:00: Error reading reg 0x300a: -121
>   ov2680 i2c-OVTI2680:00: failed to read chip id
>
> The sensor never binds, so atomisp registers no camera at all.
>
> This can be reproduced on demand: with the ov2680 runtime-resumed
> (CLK2 on, chip ID reads fine), running the same clk_prepare_enable(),
> clk_disable_unprepare(), clk_set_rate() sequence on pmc_plt_clk_2 from
> a test module makes the sensor NAK (-EREMOTEIO) until its power
> resources are cycled.
>
> The enable/disable sequence is only needed to change the rate, which can
> default to 25 MHz on Bay Trail. On Cherry Trail the clocks already run at
> 19.2 MHz. Skip the sequence when the clock already has the right rate,
> so that the bridge leaves the clock state to ACPI.
>
> Tested on a Lenovo Miix 320-10ICR with the atomisp driver from Debian's
> 6.12.116 kernel (this function is unchanged in mainline): with this
> patch pmc_plt_clk_2 and pmc_plt_clk_4 are no longer switched off during
> bridge init (checked with clk trace events), and both sensors were
> registered on all 10 test boots.

> Fixes: 0af9078315c1 ("media: atomisp: csi2-bridge: Set PMC clk-rate for s=
ensors to 19.2 MHz")
> Signed-off-by: Manuel Levi <mlevif@gmail.com>

We might need to have Cc: stable@ as well.

...

> +       /*
> +        * Only touch the clock when its rate needs changing (on BYT it m=
ay
> +        * default to 25 MHz). The enable + disable below leaves the cloc=
k
> +        * forced off, while ACPI controls the same clock through the CLK=
n
> +        * power resource in the sensor's _PR0. If the sensor is powered =
up at
> +        * this point, e.g. by a concurrent probe of its driver, it would=
 lose
> +        * its clock and stop responding.
> +        */
> +       if (clk_get_rate(clk) =3D=3D PMC_CLK_RATE_19_2MHZ) {
> +               clk_put(clk);
> +               return 0;
> +       }

Hmm... Wouldn't it be possible to actually avoid any clock rate
settings if we have respective _PRx() methods in ACPI for the sensor?
Hans, can you check your DSDT collection for this? I mean the presence
of _PRx() methods and if they switch any clocks on or off.

--=20
With Best Regards,
Andy Shevchenko
