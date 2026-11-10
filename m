Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794298340;
	b=BGPd87IxhUHODMAzouFssP1zTAJkfU85IfEdjqnvuhBvP5U4JNHekrSvd3I0usTdFSUP
	 n5nHd9GTAoudF1rhkiuWYli/qHTyKZcSKpl84QwiTLdk7VD97egbgMzerNk2dxDSdsgS+
	 7K0jPBsvfX+O/ioFxf3kyUk0oPPld6NFG/2U/ETY3DYIEmAiQk93OoFXEHB823zSLmAWC
	 rL8gXuxDmYLGMCuDvjxEpxl85Uwk2Akko72wkLpr4HQjAJi17fEWkpheurjc7PB4tac84
	 Nq+LJ7KpSpf3YAMjKr3U7ZEVfzdfSeEXBq8WBQ7FfRnG5SLmmMEPgvEqTTlvP82RA0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AB6UUbBEZNKWF17VDfnEudBTR1GYMwvjJYG/9/2B+hM=;
	b=kdQCo9lUYAGPF5EMWEDGEeys4zXO8MkMTODRIaciVtv7qZCJEqLQOuAucM/OR9Cby1iS
	 gs6CrFm0U4sWqxMkCahr1Y8P7MnpcVa3TA6mWPtoU4NnflPjWqX/Re2zOw26oKbQAv9I5
	 xljgKbwOKidWBslw8Gdapyc5salS3AVV+m21V9Hl4MpDSnAvji3dJVssdxII2wiANJb8M
	 1OpLXt1rOU0gSLWYCneZMTQfbR+f9QJRJJ8xPwfsx+zKCBAHYFTRKELkBcebSYxGaAyOE
	 KNJWx7MHdP8MK+Cs3VycYK1vhoKZnq1oyI/0k+mc4DyGiv8cIyNR9COL9xCLgwCFBeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PArHeiqL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14013606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14013606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PArHeiqL
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso2182309e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:12:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794298338; cv=none;
        d=google.com; s=arc-20260327;
        b=OR8+iJyODU/BG41/vMFVFmPn9s+huH17XNot3ag1hO6CpM3ctknJstKXGZ0M3dp2FI
         jjigaI21YK1ABNahfgg1rbQHvktxAIz2ALHj1C00ubdOKv/o6eKXhL2B6FdEVTCE9IiD
         Sp17lZ3o8Wzwk2Fv+b+OoTfUvI7BGMYT+OEpKbCJgs7QDIHttB2r9Rr4kQX1jnpaNpSB
         ZCjYcXcym+8NZ8ODoHUuIVDXRQgQ/euCVtf4gCw4SUtTB+X0hklNKzqyTCxud81XiSua
         Tc3WvYco93VfCIwjeRC15pT1ZKV3HGyonw0k9/y4rto+Bgu9DhIflGRjGFL6Y0KGtQIq
         zBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AB6UUbBEZNKWF17VDfnEudBTR1GYMwvjJYG/9/2B+hM=;
        fh=QA50bGq5calaYRyWApACcSH548Q+P9NDoXLe15lXsmI=;
        b=iNbbNQkIHgBL07U8Dfif1KGMJ6vINgvSmAQedWyvqbbRZye35pcXSMAVnzK/cBv0qI
         vDCbLGmE0Srp6UITfO2sR0KtNuOt+L9Tgh1NbOIY/g0cxTie8wQoNctPeuOK1FY53HjQ
         2rPbJr74cejiCxrh2Rhc13yd9IUmaj1DTPbb82ibXvseEy8IhxyQgvmr6aB1c77XZ+v/
         mXQ8tQm/BhIEfnGt2hNCLiYm0U159fwWv0YRHOrsBZiSpnRul8ELFGzx0y2dLsmild2n
         ik0jfwfwlHRZsw11iSTvVPpho9bK+M3iN0VHoy9oyCZ38IDBenLAC4o0QzDtoPQRc2IR
         +Oww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298338; x=1794903138; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AB6UUbBEZNKWF17VDfnEudBTR1GYMwvjJYG/9/2B+hM=;
        b=PArHeiqLOIqDA9K5txiDBN5A9Res+d70jB2RUUqytoPVSEhRmJDSGgR914oRUzvAwh
         fPd2nhIThsA0S4wUXzVP5IIbi2WroJK8kx5XrWM5lRiOjP5MKvwtxL0ZKrPpVAcBJ0jm
         9B1QZcIHUROOvVSwjYfWfnzzvwpG2IMvg9Ow3ZioaWxqIuGjOBIdOj1n5Ru+eZNx9TjW
         e/ARDi0E8moZY9tioNko71nfl1ldU4/iv/6h9fxSGzVIBY5Gf2EU1goVZYyZdgR58Lfu
         8D2A9McEpL34LunlVRyabP0xFKNUgSHCBFuRfzI+eOcIfZbWXLWk7sHeIyIUl22DvHq5
         XDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298338; x=1794903138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AB6UUbBEZNKWF17VDfnEudBTR1GYMwvjJYG/9/2B+hM=;
        b=XZV/fjyHU6sa/LHj4OVXk/G5zF92/nM0YqepGEOc47h3Yy1Y5rmR9NCpPixhSddab7
         oUroodZhO1ZhcPumEDCkrFzUFOIq5Wfx+rdBCk225cuhZrEWVpDdljkYi+RWCvf1GUiz
         1Ow1DJQ1JK08HFTfHkWV+4717xviHbJPt3/6XuPn8nIpjJBtFrB9AQcCjwOReahI3TWq
         JpS2CYPDVI8C82qSeihXvNY420u44eh4TycivV7FFbUxyb8cLGSASdUEVb0QPBtNoNIg
         jpDx/iQNhg/WPD2hdVsEHiVDrN0BKPhpKlWzhR6YKlBG8AYjY5gwfhLNERP5CKrWHalK
         rs5A==
X-Forwarded-Encrypted: i=1; AL+hErGif/DelHiNEZ6p36vlMhJZwTsuoS7dk0QytAnTZIjSeEV2mQkav0SVmFMlJ93M71ZUAt64mXzlnzWbV3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dP4fBPE/tazJOP0qixxU9kI6iKZW7nmKwtCAdkWo/gFvK7/mk
	EY7/M3ubfmSdCr5loFKqocnHgZHHuOGl/cFL+E65+yWB+IuH6uYg+gNJkLROdnQV5clEX9SJry8
	2A3wVeHUeC7uxD63A36o9gv8758xVM+w=
X-Gm-Gg: AYBFou3LjvoLM2dY/FJfV2LM2m3zdkLCJ4jxmzqK7e7u/lye/jlTdH7CU4THS7z/p9p
	8uHBM2+jDAa7XxY61YyJi00aHXvc5/MjbTCBV0PUlnq/cmAZjsNYCeM69wdZEZl+B6HAZiGdxSF
	d9WtQIu1u+VHBU5q8GJDZAmFr2b5rM5hKkffPebvMm3JWbQjNCogr+gwg5yyUb/fYFs/lEDMnea
	3WWG7gN9E8S90iu6DeFO2fP/6eCmhSYctOMFiVj4vR0oyO1KyVuPL4XlGaAtJ12pdyu0dgbpWYp
	gmeCoJTYN39pVoP4R3BngEvhsOFYGioJF/odaBiBqQmoLlxoOvXQFoUnSSViaiefDUChYhbJdvg
	+lX1sabhIfyA6I7ojfP7w52enTE0angXlRhg=
X-Received: by 2002:a05:6512:33cb:b0:5c0:b5c:408d with SMTP id
 2adb3069b0e04-5c156e3e8a0mr461922e87.6.1794298337806; Tue, 10 Nov 2026
 00:12:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-adux1020-measure-fixes-v1-0-fe1ba63f28bc@gmail.com>
 <20261109-adux1020-measure-fixes-v1-1-fe1ba63f28bc@gmail.com> <avJcESOPo2nGq5wy@ashevche-desk.local>
In-Reply-To: <avJcESOPo2nGq5wy@ashevche-desk.local>
From: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
Date: Tue, 10 Nov 2026 08:12:06 +0000
X-Gm-Features: AclHuK--YL6d7XaktwHV0yo6D6aDe9D2JvgZjf0sRInSEUEsIp9kqMvJFxZN6Yo
Message-ID: <CAJsKa+6JDCVLtWsfQ0gJzX185ywWiYA_FwbV52q=N7vzgRYDVA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iio: light: adux1020: fix interrupt clear value on
 SMBus-only adapters
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux@analog.com, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 23:49, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Nov 09, 2026 at 11:39:02AM +0000, Raffaele Tranfaglia via B4 Relay wrote:
> >
> > adux1020_measure() clears the mode interrupt by writing the inverted
> > interrupt enable mask to INT_STATUS. The mask is a u16, but integer
> > promotion makes ~0x00f0 evaluate to 0xffffff0f, which does not fit in
> > the 16-bit register.
>
> Huh?! Where did you get it from? the mentioned promotion may only happen for
> a signed char which may not hold 0x00f0 in the first place. The above is some
> nonsense.

The integer promotions apply to all types with a rank lower than int
(e.g. char and short, signed or unsigned), as long as int can represent
all their values (C11 6.3.1.1p2 [1]). For ~ the standard says "The
integer promotions are performed on the operand" (6.5.3.3p4 [2]). So the
u16 0x00f0 becomes the int 0x000000f0, and ~ yields 0xffffff0f, which
regmap_write() receives as an unsigned int. sizeof(~v) is 4 for a u16 v.

It is also what I observed: with i2c-stub (SMBus only), every read of
in_proximity_raw fails with -EINVAL from the val > 0xffff check in
regmap_smbus_word_write_swapped(), and succeeds with this patch.

That said, I can reword the commit message to make this clearer.

[1] https://port70.net/~nsz/c/c11/n1570.html#6.3.1.1p2
[2] https://port70.net/~nsz/c/c11/n1570.html#6.5.3.3p4

> >       ret = regmap_write(data->regmap, ADUX1020_REG_INT_STATUS,
> > -                        (~adux1020_modes[mode].int_en));
> > +                        ~adux1020_modes[mode].int_en & 0xffff);
>
> On top of that regmap should limit the value to 16-bit anyway. If there is a
> problem in regmap to cut the upper bits, it should be addressed rather there.

Currently regmap is inconsistent here: the SMBus backends in
regmap-i2c.c (and regmap-fsi.c) reject out-of-range values with -EINVAL,
while the formatted plain I2C path silently truncates them. If you
think regmap_write() is the right place to mask the value to val_bits,
I can try to fix it there as a separate patch to regmap.

However, even if regmap changed, the driver would still be passing a
32-bit value for a 16-bit register. regmap_write() takes an unsigned
int, but logically it accepts values of the register width, so I think
the driver should be fixed in any case. From a quick search, this is
also what other drivers do when writing an inverted value to a narrower
register, e.g. ad4691 uses ~BIT(chan->channel) & GENMASK(15, 0) and
zpa2326 uses (u8)~ZPA2326_CTRL_REG1_MASK_DATA_READY. Fixing the driver
is also the change that can be backported cleanly through the Fixes:
tag.

--
Best regards,
Raffaele
