Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D5E381B16
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551747; cv=none; b=mTqakl1irqFZiD5tCzIQYphE03JUzwS8rsJQ1K7x4YTtc2u2li7DIeEjWxKR+tpNpvRTgrJHesx89waX5bJJ5R3PMGgQfnv0PaMvSWvaO8akdpwNowpm9PkJbyEK5/SH+Qa/dX3nXHD4Z9Gy6JKZAyGK1D79CdUu4HrVf8obbEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551747; c=relaxed/simple;
	bh=Fm256tq91TUWQaafWZns8i3ZkfJXNlZQWe3ZJ2PDkCI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LUfNLC8FGPdjxzzuotJF03WyFjSnk7MEqD8p+D8N+E9Oq4uH69D5tp5gIOTR2kJn47hyoB9OMwq1Az5zVuIzavyxZzRCq9mKyC4o8IdziK2g+iv8MeUzzdLNiYIcXZiPrqhUxOLMSunPezvxbv7hCEHn3+dpJu2XzV7KsaRff7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oi3G98MY; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oi3G98MY"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a20367cf82so13776771fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788551743; x=1789156543; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l7n4A+uF147D/0NDMH7dKmo2I1pASLVpG/KlQAymluM=;
        b=Oi3G98MYKvUMVLZkuRP292oTmr5pDEQga/DNqSDy5Ejv81EUNJR9YJZ6fz+IoX9bkB
         jH580iXxuowgOUjKitUAWsEkGYygJzjUI86BFvOqEjXIBrXBG/CAE6CueMNB1bkhq1yS
         RW4pLxQsw7ak9gQd1U9rm/jJPFwYWM/ekHjDOA8UOuK3vOaYZ6MDEygWZnOroUdlY91j
         ZJHJkMinceL8UiRtFGsFhG7coQfPk4aip812qghpvCZd8F+/+QjoBed4T3j90FefUcun
         m/w2GLUepsTS239JyUC9zQo+GnrArU1vNXSqL2pKSlFlevdqEi9Ym3AO2HtrIqVOElMt
         CaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551743; x=1789156543;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7n4A+uF147D/0NDMH7dKmo2I1pASLVpG/KlQAymluM=;
        b=BYY11oKSo3Ck0sLXRDOcga2jDcCO0SbceJ3xsOuFkiPkKBPUXDcmOQyO3bzxCk7T74
         tC0vzmvPN22zNC7fapuoeY+fb0L6Yl1JgQjr/JbGgSH3Qmz34acyg342ZuRU0iGECxdC
         8Ap4sio10D8wUxmLeWs24i4mYKfGLlHXd/h5i/TX4N3gcWNMlF8bcHV1P2Cpy88ureQK
         6z6bIroUWtPuP+s/Hq3zrFOOdyroMhsCgpq0UyMD40rKJtN5OfBxmAWS2uROhzT7uHeB
         NjtldfMzGB/pffzbLP5C1/IvjrOdiSDSMws1Hd1WX1RqOOb2UbO3xsLwH96eChbuyfgm
         /N3g==
X-Forwarded-Encrypted: i=1; AKwUvBwpSqQU1Q90+swnZcAArOJLTbnEwNvm6ldV8bMrXuaDaD3C0xUdfdOs43YMN41RhqNRg9hMujpL5fhbPnk=@vger.kernel.org
X-Gm-Message-State: AFuF++nSkytqksBqi3Kguv4u/EGNtZRtNgX9TNhornI/M3giQ+g9yTS/
	Uqp3fgscgY0YfzMWdBodOCBiEo4P9xC80VS+Igf3OfZ/4vFE1OMM+T2K
X-Gm-Gg: AYBFou2OjJ4YzAcqyTKNGelKn/yQX/hoMxNjFWt1rEnf8TVxOAeG3GI9//Uv3Wz1edO
	Y1yjQIgDlK7/OdME8XyfcEaxDfs/+0i162n1C5W11OZnveKMuOnSPam0DmTMQhvN1gGqjMB1fZb
	lyx+/9qLLqWTGj+ZR+n5/OY7y3IdNn/Y89Mps2EZAUksai377oMPYFZhxzy1n65VOlStW1+JRfm
	DghXxh9WaijbcuxlFfCeP3OtTi3USXJiBc42NvZI4G2kMc8uOUe3/3PWh0PuWbuZz/l0T9py/W+
	79Gz1lQlCvyvaDiXzhLHNMUACHI/lydNY967eTrz8bCkXaXKEagqZcR3K00K8avzFNXzzhy7w0q
	Vtc+tO9iWdvBHm2g6/MzNvp+i9Gq88AnXh7Y1sovP/xmKtBDlgCrTMoueRzrQQzZ2w7TDwDw2un
	A7Fp+qzjzA9I3GlyCvTtcEQsN/DklP6locySSwrYhhs0q2/4IC1dugaLFUxcw+U8o=
X-Received: by 2002:a2e:bc09:0:b0:3a3:7680:67f4 with SMTP id 38308e7fff4ca-3a37680699dmr6294231fa.19.1788551742967;
        Fri, 04 Sep 2026 12:55:42 -0700 (PDT)
Received: from [192.168.1.161] ([81.200.11.252])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705cf03bsm8447591fa.36.2026.09.04.12.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:55:42 -0700 (PDT)
Message-ID: <980e6203d73cd05429ff0bcf48c192356e349616.camel@gmail.com>
Subject: Re: [PATCH v2] iio: proximity: vcnl3020: fix ISR bitmask check in
 IRQ handler
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Salah Triki <salah.triki@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 04 Sep 2026 22:55:41 +0300
In-Reply-To: <20260901022731.10771244@jic23-huawei>
References: <20260824042908.8887-1-salah.triki@gmail.com>
	 <20260901022731.10771244@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-09-01 at 02:27 +0100, Jonathan Cameron wrote:
> On Mon, 24 Aug 2026 05:29:07 +0100
> Salah Triki <salah.triki@gmail.com> wrote:
>=20
> > The threaded IRQ handler contained multiple issues in handling
> > interrupt
> > events and clearing status flags:
> >=20
> > 1. ISR bit check: The handler incorrectly checked the Interrupt
> > Status
> > =C2=A0=C2=A0 Register (VCNL_ISR) against VCNL_ICR_THRES_EN (BIT(1)), wh=
ich is
> > a
> > =C2=A0=C2=A0 bitmask meant for the Control Register (VCNL_PS_ICR). In
> > VCNL_ISR,
> > =C2=A0=C2=A0 BIT(1) corresponds only to low-threshold interrupts. A hig=
h-
> > threshold
> > =C2=A0=C2=A0 interrupt (VCNL_INT_TH_HI, BIT(0)) on its own was complete=
ly
> > ignored and
> > =C2=A0=C2=A0 returned IRQ_NONE.
> >=20
> > 2. Event direction & channel index: The handler unconditionally
> > pushed a
> > =C2=A0=C2=A0 RISING event code on channel index 1. The driver only regi=
sters
> > a single
> > =C2=A0=C2=A0 proximity channel (index 0), and low-threshold interrupts =
should
> > be
> > =C2=A0=C2=A0 reported with IIO_EV_DIR_FALLING.
> >=20
> > 3. ISR clearing: The write-back to acknowledge the interrupt only
> > preserved
> > =C2=A0=C2=A0 BIT(1) instead of masking against both valid status bits.
> >=20
> > Fix this by checking both VCNL_INT_TH_HI and VCNL_INT_TH_LOW bits
> > in
> > VCNL_ISR, pushing separate IIO events with the correct direction
> > and
> > channel index (0), and properly clearing handled status bits.
> >=20
> > Fixes: 3363fbbe19e5 ("iio: proximity: vcnl3020: add periodic mode")
> > Signed-off-by: Salah Triki <salah.triki@gmail.com>
>=20
> Trying an active address that is hopefully the same Ivan!
>=20
> This looks fine to me, but I'd ideally like input from Ivan.
>=20
> Jonathan
>=20
> > ---
> > Changes since v1:
> > =C2=A0 - Extended the patch to fix additional bugs found in
> > vcnl3020_handle_irq_thread():
> > =C2=A0=C2=A0=C2=A0 - Corrected event directions (RISING for high thresh=
old,
> > FALLING for low threshold).
> > =C2=A0=C2=A0=C2=A0 - Fixed channel index from 1 to 0 (matching single p=
roximity
> > channel).
> > =C2=A0=C2=A0=C2=A0 - Corrected ISR W1C clear logic for both HI and LOW =
bits.
> > =C2=A0 - Updated commit message to detail all IRQ handler fixes.
> >=20
> > =C2=A0drivers/iio/proximity/vcnl3020.c | 24 +++++++++++++++++-------
> > =C2=A01 file changed, 17 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/iio/proximity/vcnl3020.c
> > b/drivers/iio/proximity/vcnl3020.c
> > index 7f417372566a..d0b8f429999f 100644
> > --- a/drivers/iio/proximity/vcnl3020.c
> > +++ b/drivers/iio/proximity/vcnl3020.c
> > @@ -584,16 +584,26 @@ static irqreturn_t
> > vcnl3020_handle_irq_thread(int irq, void *p)
> > =C2=A0		return IRQ_HANDLED;
> > =C2=A0	}
> > =C2=A0
> > -	if (!(isr & VCNL_ICR_THRES_EN))
> > +	if (!(isr & (VCNL_INT_TH_HI | VCNL_INT_TH_LOW)))
> > =C2=A0		return IRQ_NONE;
> > =C2=A0
> > -	iio_push_event(indio_dev,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IIO_UNMOD_EVENT_CODE(IIO_PROXIM=
ITY, 1,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 IIO_EV_TYPE_THRESH,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 IIO_EV_DIR_RISING),
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio_get_time_ns(indio_dev));
> > +	if (isr & VCNL_INT_TH_HI) {
> > +		iio_push_event(indio_dev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IIO_UNMOD_EVENT_CODE(IIO_PROXI=
MITY,
> > 0,
> > +						=C2=A0=C2=A0=C2=A0
> > IIO_EV_TYPE_THRESH,
> > +						=C2=A0=C2=A0=C2=A0
> > IIO_EV_DIR_RISING),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio_get_time_ns(indio_dev));
> > +	}
> > +
> > +	if (isr & VCNL_INT_TH_LOW) {
> > +		iio_push_event(indio_dev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IIO_UNMOD_EVENT_CODE(IIO_PROXI=
MITY,
> > 0,
> > +						=C2=A0=C2=A0=C2=A0
> > IIO_EV_TYPE_THRESH,
> > +						=C2=A0=C2=A0=C2=A0
> > IIO_EV_DIR_FALLING),
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio_get_time_ns(indio_dev));
> > +	}
> > =C2=A0
> > -	rc =3D regmap_write(data->regmap, VCNL_ISR, isr &
> > VCNL_ICR_THRES_EN);
> > +	rc =3D regmap_write(data->regmap, VCNL_ISR, isr &
> > (VCNL_INT_TH_HI | VCNL_INT_TH_LOW));
> > =C2=A0	if (rc)
> > =C2=A0		dev_err(data->dev, "Error (%d) writing in reg
> > (0x%x)\n",
> > =C2=A0			rc, VCNL_ISR);

Yeap, definitely mixed ISR/ICR values there for ISR. Now it looks fine.

Reviewed-by: Ivan Mikhaylov <fr0st61te@gmail.com>

Thanks.
