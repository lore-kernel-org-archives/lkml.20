Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0304642DA36
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246723; cv=none; b=mq4SXgzjNY6lojN3SrCVkqGQPxioBPONjw8YOckgGs8XHsTVEFz3CpU2z46q19+sv8F8COqHvvYiqnavaJLJ0CcrmvySmreMk0LYKVp5p1b5+38VuYWqj4RSEQ3v3IMSx7+FcC2eizok1U0vj/vJxtVdcYvXD6Km+Yxuxy8085k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246723; c=relaxed/simple;
	bh=IJV+cJcfZdPXEq3nWzfJc7AtEYY8y/J55FvImPI05W8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EhMl4sCCtOvohGrnMpUOmiZHcogCW976455liMy2Kf3voHK9gSZ2Cx0PrX2Z5hI5kUBCtK1xc8JfNjBx5zbpXZHIUejZLTvHGqOABkyiIey556ceX5e7Ik4u2gGpFwPtEioafZ1B6FlQzLYuhOVsZQEigrqu8SHPhIQjNh9rdmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2wyTHf9; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2wyTHf9"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a12ffc112cso6433901fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246720; x=1788851520; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D+CSScneE3PY8jH7ppTyN3wkhx3v10vl4wTiv7mZ0VM=;
        b=i2wyTHf9Ug1aLOmqRa8KJKDwM8X2VIit8xPzj7+OSiYuEsBhQXRWF9a4PzzQR79dXH
         5AXePglGLVB5sKTm+kBtYlGXelJLfHVmrr4eC1mecpfJJXDZ127i5vODOKpZ5qrwUg7c
         6qar0jg9KInXX3AKcGJNy0c++Cj7xyMBdIZBNisU/Ja4Ht2MCRzyOEAKaZzkn/krbjKA
         O//0a/f1n+cz1DTxPVv/5O/PUXzV7CJ2u8FJ+CJcuyMLeW/0eIsXpkt7OILDqURmpnUv
         JE1Pu1DVuQpGwT5+bGy9CDUcoNy1QVjpBuJ33xCXsyAyeS4peJCFIukmtrAjIKlnd4xp
         KaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246720; x=1788851520;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+CSScneE3PY8jH7ppTyN3wkhx3v10vl4wTiv7mZ0VM=;
        b=Ec4CyEFTVdPsCRG4FKaqsY2zQlzwdwAG6dEyIXyY2S6yj0eKSmUQIbmebhn2ALD4XC
         6B1Fb+nLDOlZ/igOPFXAPYsuaZ6E41ftMyZnxyxy/OIrN5E8kjdzBDTi7hrsYRkD1VWT
         ONOE5hK8/C4jt8UsSk35M6XnR+wHYkIuqUCykKdyfkA0rIWMCp22wY+SMsNBpsb4/vg0
         vHIx5ef1PE4my/hQg5IBMvAAzochFsP8d9DyYEhW4fKiNEC/8LDdB/dOD+6a0bEEyNAI
         Bp0aQL71jC7wPEUjlzK2YiHCIsIibbaxOFRn2o0sGc/1coe/dP/UxclCItWtq3G8HCjh
         S2OA==
X-Forwarded-Encrypted: i=1; AKwUvByNCQIKeh84tTax9UtpfkApy1xAByHQazlB/mX+tHN8+96wLBmpLj8lJ7PbNrlvQVE8oF9VKCKRI2pZahs=@vger.kernel.org
X-Gm-Message-State: AFuF++l0V7eJUeqLTp8s3S8Fxt359e2TpjfLm57p9iJcE2LAPOqiSa+Q
	asKCYP0gfbVjqF4DNkQei3ToF6mB5mabU7Gd5m/LmmVqw0HOue5KbtMp
X-Gm-Gg: AYBFou0gww1vBmMQo+4/F6YS6XiDl3A3kZ2bJU1aW619h09eVACU+jWn1iCbK00JJeb
	EmaDqgN7r3NvzPwnseeEQDN4lA0jrxQ4ZTeQMuH4OndJWG3H0lRVXNcA/nEsc6Ipw8a/3y7vhOZ
	1ACH7rye6JHylm6rqwvfbXPoeXrrlkO5+l7gDsXlGv4Tqxvicdnk+ZCFQH8/BpurzxhxISmPAvx
	P/EBTLr09+2cAb1bmmMU6XQpNZpNbmtwPTadJa0/JhVa7v0wQdVmQ09HfEy/+MfjGD5ebQGUomt
	JozwpIcOEnfKp19YdXPEYUdrpzO46frYM0kCIFFqwyoIu40UoHgzPyyWvB6pug01vZg3fX7ecxz
	cV4Sgj57AtypcQc0hMQXhuQMJXnHQQXwVtmp+QOnvl/1oaqblpdKpIZ3zFpqQSn3x8mvYD5xNQa
	L2+e5+Zr+9Ycn/kdkNwayV9LW2rzT/x2nu+gZBJcj8rg6f0mEI6AlcVBSTA7tWb5g=
X-Received: by 2002:a05:651c:a201:10b0:3a3:3fa3:25a6 with SMTP id 38308e7fff4ca-3a33fa3324cmr3629011fa.3.1788246717606;
        Tue, 01 Sep 2026 00:11:57 -0700 (PDT)
Received: from [192.168.1.161] ([81.200.11.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5c9asm2754562e87.11.2026.09.01.00.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:11:57 -0700 (PDT)
Message-ID: <5951b1195537558a5e93cfd44bd24fe56d446f81.camel@gmail.com>
Subject: Re: [PATCH v2] iio: proximity: vcnl3020: fix ISR bitmask check in
 IRQ handler
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Salah Triki <salah.triki@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Sep 2026 10:11:56 +0300
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

Jonathan, thanks for pinging me, yes, address still same, I'll check
patch until end of the week.

Thanks.
