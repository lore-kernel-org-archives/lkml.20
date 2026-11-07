Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794046219;
	b=Xu/d1oPG0c2SlWVKIua4x8KIn5woWWWrXBA/0D8fUEsmTOo7eAu3Q9Fe6X3MHSg/GP6I
	 6r+UhAOJNaJZbgz49GXrrIY16jIr5dlsmZOqjWUDEjXggomvivCwa7M4n/EiOsg0kwRfY
	 wi5MG/IHJJNNx9LCXO1ZqStqBXKO/hLwr0a4rNtXdGA1naG7OueDUlH2oiXFFF2xi7GBR
	 NklLpydm0HzhnMM9CzbRNbqRoaVFYijNH03CjDg3/7G8P47vxh2lA9+LwGdttGm13w/1L
	 qwWfJSWm2HFgMFf1CGd2I2sivjLlQlm+8eMDL+CooJzvc2xeCPASY7uxvcH7AFl7olQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hCl9zuACLpk26Br6YG5VYwrXg2uXCdyvVsty0gFOsYM=;
	b=F2OwwrjB93y8vENPTp/ugOq0QWelDJ6oL+tDmbkvKLty2b2Cxy6/sLmkEbmc6SWU35BE
	 frbJfGBRVgFvPRcvagYkS/UdQwOs68kRZZVVfBgYJQ4C5clYouN1S3WqZj760yV6n6gPM
	 p9MZNwvVWr/tUver8r/e6goWMik1IBHcEbitlJMw97pvzFHnuGkfDCOTN7jN+X3vd2inF
	 +HnCrt3Qoluzpq//xI5UpHM7Fp1I3HOtxTPj7s2+Bx7EQ89TEtvtQMbhjuH+BNNFYHJqu
	 3H765yYCBsxndhhqZUZY2uae6W24Z06iVcpj70ygFdMKTFDkFpxHeH+iNqctmfQtNoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mqF2/7px";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A22606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A22606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqF2/7px
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37071c0f42aso1926639eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:10:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794046218; cv=none;
        d=google.com; s=arc-20260327;
        b=d3alepR/Dh5ltFxik8kMmJiTFeXddw9gCIRA6k4QOLgngpAiSe2/WaSDvHWo7t41Tf
         VFM4AolEW5o6JPGEthnfiFsoXliZToavtHPkQoc1MPfrvCc0L6cBHdO9yL3/q67fAAaZ
         4mc4J/04xS8yUECZZLYpDQfHCy7yMv58XOZ3hbF8Y5aWcKyNPxhewF231a3PDZ3z2MIL
         DSe9E283f8tTBCgZ1SSCU07edaRp2/CScYNHYLpgnF+FRJmBUvbJUUSdHn87fnltlfzl
         fPe6gD612ibLmpqgzNjbx/HWN/7MiGCf5RGZvh5ElKIZBrSjHkqTM+52QK2+KZ4sz0Q1
         pCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hCl9zuACLpk26Br6YG5VYwrXg2uXCdyvVsty0gFOsYM=;
        fh=p2jbsoDQkfhhY+rkKErDqAM1JoEvKXgykxLPSGbfZyc=;
        b=GAEecVMdjbnBLJBwwH7n0CSRQBhndqwrMqY0U9GzlZWAnQbMTTT3TC9ksSTOpXubch
         YWPwM7X9F8ka83M4IXfOK41FTRr3poIcqT2CITn3H+ivuxdthT0DnC2NiJFuancIaITX
         G6bEV0gIEL0pdhqzFYJDQ0mzWmGcCa9v2F7wEMWWo1nYdoBO+cLkNqbjMLYCRvFOMkYA
         8Vu9ErIpscWB7MwF8talAwYHWXT3BeEliJ/3R/5jQbdUZA5RapdKFPOZsXqTqOQ1GkfX
         U4J1vmJEN0AFLQeergahb/vNfJmoOxOmLTs9BzbzfukYV1LaNxxj5CXEd2LBHd9QwoXG
         7RdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046218; x=1794651018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hCl9zuACLpk26Br6YG5VYwrXg2uXCdyvVsty0gFOsYM=;
        b=mqF2/7pxuXrGosqT4DSNgVNPbzJ1NtX5iQs53NhZwR8xxSI+D/6MVM5o9f3tM6ezCj
         HFepsPHsxY5rx7ezV1SRLR0YGB+WJbLgrd7zYAwnJkQNV60XYEX8qaVUMIw+JNYBWSX5
         htJ8T56C5i/RPYPGMmqpVY3yLilgi5V0zbGaDu9QSJ1F+Xv9kwZhW8TMj0Eg+jXr8G2B
         8MB0Jj3py6gnDGYajJ9nwG4vk1rQMTLbMYIFRY7b3p38oXFyHz3uhdh/xRw3TKXc7ke9
         0JT1LcdgMqyFUTgxmTQov5ZeZp86W90n0xUqnqFr+sTiC6RcdYUVMf9MiVyOjvmopNDX
         r6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046218; x=1794651018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCl9zuACLpk26Br6YG5VYwrXg2uXCdyvVsty0gFOsYM=;
        b=wmy2QnFVQEDcUoknJLYpclhN6+zcvxJjU5bW2PlSfLe50miz+TLDBlIDgIU5fZgq3g
         T/ar7ihnJ0+dZ93lARdcs+foku99UmuebrUdI9MBE6Pb62BYAmXLywY+hYbZlPpTkfwx
         GGrtmtq3X3IANzobD2GRfLZrSGScm/nm2EcYLguB3fvV+wQ0aMvRH137JBjPmUsbLO/3
         Q41qHiqvEfScdC7UJ4wKbFtzgks2YIb9HodJjgU106rlMI6yUulbWRQ4g7KrLHHAxc6Z
         WN3IVfBT5EhjBSjGA/bVMp0wTVihqW/sOaFj+kvmDGfS0vV8D9ZEDrIRqaIRbBk9aqbV
         dtzw==
X-Forwarded-Encrypted: i=1; AL+hErH+lckce/Z9GoUUtMjnFksg4pQ/L6mkIlf/F5vHsjaCAubuGTGs+/mlUPqwazcEv3kWQ52ZNuK8Jy5EWPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n6Q5lzXpb2AduZoujWACeuLUOWp/JuYWRzAXA7fbO6LcFLtDo
	+vd1fnu+aFrwWT4UZWVTAiyUwjvEBugXI57rRlpqv47B4ojv0+qAgK3kWF6U+rOj/gsa28sMH6S
	ggJKumkl17DZ0rkm3ctzDJr9AumcWtkQ=
X-Gm-Gg: AYBFou1dlOjefg0mQq80OfF/VUuDQfybhEbRi+Z9hJS4DaR2V4Ezl3kvpuVCDhg2N6N
	TIiC21Est3BaA9PlaiUvstZUOznTkRPFlWJ6eyhloXfk5/N0hwKJ+RNR4JMzuQItZ8MbF6+yjr2
	NsBaSui0Gb9m1oUZMW9kOkterDvjUligDGzCCuTBFZ8dsZSh1AgQmWgaeSuJd7DXBvzhVxpfsc9
	G+BJjOCO0x5+8orJMPubSOiFf3AgMwTbLHlTC5EhYZCceYfk+bJxPoAT4CsF4iehTGj7L1dU85B
	8Y/XtMfr2T0w7Z7DxU8ReK7OgBRXkC+M8QqKU6qq8BCvR48Hsc2N23n0flpuE3nUnircnr6prtw
	EzLadsRJkOuHyPYTJnDcGMWvn4YjiN0BQ58oVAtYgoaBv7jVBUHWTL/ACDAsnHKzzhsJz8BcA5T
	QmLAXj3EDhVj+0SoIYlZtZK2U4ABtREg==
X-Received: by 2002:a05:7301:da8c:b0:36a:6106:4f63 with SMTP id
 5a478bee46e88-36f74e581c7mr6838802eec.16.1794046217888; Sat, 07 Nov 2026
 02:10:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106091943.35783-1-clamor95@gmail.com> <20261106091943.35783-2-clamor95@gmail.com>
 <20261107032042.0dd311fe@jic23-hlaptop>
In-Reply-To: <20261107032042.0dd311fe@jic23-hlaptop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 12:10:06 +0200
X-Gm-Features: AclHuK9Ans9GsBXt-Xcq71SJaLUNKPLtu1bbEbUNSMYW5pmtGCOH2bEC3JfY9dQ
Message-ID: <CAPVz0n33sktTgdWge64c+XVSDiijXgyY-uRfcpywhJ6LHjPPEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] iio: light: ltr501: Switch to read_avail() op from
 manual attribute registration
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Pan Chuang <panchuang@vivo.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Nikita Travkin <nikita@trvn.ru>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 7 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 05:20=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri,  6 Nov 2026 11:19:40 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Switch to the read_avail() operation from manual attribute group
> > registration. This eliminates the need for per-chip attribute_group
> > structures and related ltr501_chip_info iio_info entries.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Given you were quick off the mark on sashiko on v1, I guess
> you already saw:
> https://sashiko.dev/#/patchset/20261106091943.35783-1-clamor95%40gmail.co=
m
>
> It seems correct that you'll only get one attribute where there were two
> before.  I suspect it's as simple as the mask should be set of
> shared_by_type_available not shared_by_all for scale and shared_by_all
> for only sampling frequency and integration time.
>
> The current code is odd in having per type sampling_freq and integration
> time as both apply to the light channel as well I think.  Not vital
> to fix that though so I'd just split the mask to make it work for both
> as it does today.
>

-       .info_mask_shared_by_all_available =3D (_shared), \
+       .info_mask_shared_by_type_available =3D (_avail_type), \
+       .info_mask_shared_by_all_available =3D (_avail_all), \
...

 static const struct iio_chan_spec ltr501_channels[] =3D {
        LTR501_LIGHT_CHANNEL(),
-       LTR501_INTENSITY_CHANNEL(0, LTR501_ALS_DATA0, IIO_MOD_LIGHT_BOTH, 0=
,
+       LTR501_INTENSITY_CHANNEL(0, LTR501_ALS_DATA0,
IIO_MOD_LIGHT_BOTH, 0, 0, 0,
                                 ltr501_als_event_spec,
                                 ARRAY_SIZE(ltr501_als_event_spec)),
        LTR501_INTENSITY_CHANNEL(1, LTR501_ALS_DATA1, IIO_MOD_LIGHT_IR,
                                 BIT(IIO_CHAN_INFO_SCALE) |
                                 BIT(IIO_CHAN_INFO_INT_TIME) |
                                 BIT(IIO_CHAN_INFO_SAMP_FREQ),
-                                NULL, 0),
+                                BIT(IIO_CHAN_INFO_SCALE),
+                                BIT(IIO_CHAN_INFO_INT_TIME) |
+                                BIT(IIO_CHAN_INFO_SAMP_FREQ), NULL, 0),
        {
                .type =3D IIO_PROXIMITY,
                .address =3D LTR501_PS_DATA,
                .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
                        BIT(IIO_CHAN_INFO_SCALE),
+               .info_mask_separate_available =3D BIT(IIO_CHAN_INFO_SCALE),
                .scan_index =3D 2,
                .scan_type =3D {

IIO_CHAN_INFO_SCALE is by type and IIO_CHAN_INFO_INT_TIME and
IIO_CHAN_INFO_SAMP_FREQ by all

> The current way the two Intensity channels is done is very odd.
> The .info_mask_shared_by_type should be the same for both of them
> (only one set of attrs will be created).
> Ideally fix that as a precursor patch (don't label it as a fix
> though as it's just a code consistency thing rather than actually
> resulting in a change.)
>

No more precursor patches! I am just a random contributor, not a
driver author, not a subsystem maintainer, not even a random code
janitor. Stop using me for random unrelated fixes!

>
> > ---
> >  drivers/iio/light/ltr501.c | 153 +++++++++++++------------------------
> >  1 file changed, 52 insertions(+), 101 deletions(-)
> >
>
> >  static const struct iio_info ltr501_info =3D {
> >       .read_raw =3D ltr501_read_raw,
> >       .write_raw =3D ltr501_write_raw,
> > -     .attrs =3D &ltr501_attribute_group,
> > -     .read_event_value       =3D &ltr501_read_event,
> > -     .write_event_value      =3D &ltr501_write_event,
> > -     .read_event_config      =3D &ltr501_read_event_config,
> > -     .write_event_config     =3D &ltr501_write_event_config,
> > -};
> > -
> > -static const struct iio_info ltr301_info_no_irq =3D {
> > -     .read_raw =3D ltr501_read_raw,
> > -     .write_raw =3D ltr501_write_raw,
> > -     .attrs =3D &ltr301_attribute_group,
> > -};
> > -
> > -static const struct iio_info ltr301_info =3D {
> > -     .read_raw =3D ltr501_read_raw,
> > -     .write_raw =3D ltr501_write_raw,
> > -     .attrs =3D &ltr301_attribute_group,
> > -     .read_event_value       =3D &ltr501_read_event,
> > -     .write_event_value      =3D &ltr501_write_event,
> > -     .read_event_config      =3D &ltr501_read_event_config,
> > -     .write_event_config     =3D &ltr501_write_event_config,
> > +     .read_avail =3D ltr501_read_avail,
> > +     .read_event_value =3D &ltr501_read_event,
> > +     .write_event_value =3D &ltr501_write_event,
> > +     .read_event_config =3D &ltr501_read_event_config,
> > +     .write_event_config =3D &ltr501_write_event_config,
>
> I'd prefer a precursor patch tidying up the indent as that should make
> the diff on this patch easier to read.
>

NO, either this, or I can drop alignment adjustment and you can fix it
on your own whenever you like.

>
> >  };
>
