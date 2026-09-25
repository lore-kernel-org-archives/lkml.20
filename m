Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767DE36A01A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354080; cv=pass; b=kL2YWF5JcVhHc6tTbSRiPji748PbPt56tpf5x6wENuhk1y+lf266jCV8Ouad28Wt8yaQXUnvLstEGEaVM9uSxnVVbq+ZuEM3DcrRSWDIVnwfnMEcAIhzQstM9BS6G73U9rr+NMgqGFG1ORUJbjNLvqtm1yCoqMTAU/ES/fxuehY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354080; c=relaxed/simple;
	bh=CQ7qsHIFOBtag8p/PNJNlg/bGoC/DNwftXw3msIkays=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/NNTQwNxu8am8m2E0clfuduWsOVlKDCVwQh13nyUvho0gIuHokXyGTVdRtoewo1rx4gFgW1/XiGnCpca7X0+YSB4NPAoiNJ9nnO27vOXFO4+6USZR737HXjSH/6aCIh+DZB/HXoX2lQ8437FBFRRYO1T7mga4w/Nz91vgrCE+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIj+qW3B; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIj+qW3B"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so916626eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790354079; cv=none;
        d=google.com; s=arc-20260327;
        b=i003mto34YwAcVZuMsZ1rtj7x3UVss4xCgQodBNSeDG82sSsLvPG8N3hdTTXXsPtyL
         Wv/ZilOgnIlqJ+hhBcCX7ed+1t7qBZ+MfKLk0zchTTRaTDtbCegBTbm6r5fh+7Igy7KN
         PtMbNWtWExMRVHvbiemm/VegXqY9gBXgkOme++LfOVWYW3mqRsQ0tAPt/QTj4aWCaG9D
         8g29s1LoOMIcYYvUY5BWvSsYsjDfPpB3shEUk3G2e58Pt4dPN4QSLY/WMfUukuElTQJ8
         sb37Xp5ig9vVFQy5IMa0Y719kOQtkAMR7ZrO/+NWaPjjbuEjguctaRePof6lfde6SLfa
         Aaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=139BCYZD2iq9D0uvWIg5yy6OHV2Hpl2eJJpr+lFqbUg=;
        fh=p2aCVUQ5IZJtUjswsNAnefZ+JZNHqF7YxrHNa18boH8=;
        b=i7+nMruPXTzjse2qu/6V643EL5UgCvcxJc6unli5cq/H8gyUvGvMs/Cz5t8IIh/tVO
         K57grfGSJFC9Q1736HJ41Um+Nvnx2MOXoYFCQm7lyzyYp8trp3gy29xTly8mjRSQOly4
         50yONlHRVmYmFpB2Df0/NDgq0womyOOFlooQAJw7lQ8FaW5lYqpmz49vV1oIuZ7jNewZ
         wfgzSCa2O035kk88hAd/aljB1ePSYp5YHZ8+t4xA3wDynrpM6sccmlK1mPFjp6/Di/Fu
         IdecE/SvR1om5AtwuOgU4w37Cdb4Qu6l5/0FO3PQNR9I8n+G+A9KO7MAjUx8dSn89S25
         Q7FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790354079; x=1790958879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=139BCYZD2iq9D0uvWIg5yy6OHV2Hpl2eJJpr+lFqbUg=;
        b=aIj+qW3BfQ4gh91MmCH2VkB84hvTNiCYQ9AMml6ZcwoQZ5pnUfsLSo/aesRvrB0lKv
         eMRNDjHh+jj4R8MjKblfqPR8gp2hoOI15fVz51s6ykZGG08FNJVwAhFm45g8CGlbjlXt
         DjF3tf3sRJ4iSWB4bXGX9X6Vy3CLtnik4JqRYrWu9m6x/3ZNv67T1osQRqxV76UhBQb8
         uukCGom7CnVrTfhX/442b8sp15OWJGWX+VSheDjiWimUnYYcJnsYDyNlUPH4766eY03i
         ILeLj72vM4A5KeeYnIAfxNTacy6xaxQ/aswf4GU11RkIjaKWGsxMetWPgR5nMaQlBOWH
         U+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354079; x=1790958879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=139BCYZD2iq9D0uvWIg5yy6OHV2Hpl2eJJpr+lFqbUg=;
        b=jB5C+Y3Yps5apLQCK25zcue5HOSR11l7T/nmutBxwyh+KCqLhRUN6OU8lmfFpsImgs
         uj65bWvSBC7e7TS6zAp42mrh5DMec2q1N8vSt3o1dMsQPHkbLwVgdZviyjRCtmcjk5WI
         sA/F56INktl43OI3Ey8PeCZAZzYF91DINqQeU0Vtvl1qZaIvmXUUk5QLUJvGxoMefHbP
         eez6GClqAJK9O8vFuhq40dNkx5Wz4LMhFeXaIv5bzbyhjIRSocOINWTQSNm7jgsAm2ka
         MrDboHJBXmIsucuC5leb+DdXjOAayBw00xUsQRg+zoHgGUEyFJnhZnaxImMxGavwf5Gf
         6lag==
X-Forwarded-Encrypted: i=1; AKwUvBwewH1kENL4N/t4Np7fwJBr5vWiIUW5siQuWO6aE66An23RZT4xmlKsruRmmaDHRBhJkvd9kZ2RiR2vJVU=@vger.kernel.org
X-Gm-Message-State: AFuF++n4QPmUFaVIbWjV7/9eCzL7aq1PAVo0lCSdvpiLxArBa/9h0ucV
	tCgUe+JNwzFz1ADxPVDffQQOJgvRFwqL//fepvfIsRMzGUX6iwu1f18jNMHJoLnhePu7JYW5Ptb
	7V+WWbf0XBItdI10SF33qgiycpF8Z8E8=
X-Gm-Gg: AYBFou30blOPWgpbZsi0ka9tbhmnR3XplQW4oe7nXUuGsGRr1d+TCIKu2AZTlJ+vGNS
	Z9wuxv3yvmaOrJs197KhPfHfDIMOrMPf6HjjhqZsOY/RE+Q3OqgXRYXcHOXf0bBmD92T6SwOyZ5
	j4LGCbKyJxeL65LH1jfpJs0ml6SWK+3ZszPXTK+PM39Pe1oIVWd6ctS3MtO+nNzDWTmbQhG5SXK
	1QQz5w4slHG4uIUzDvTN/fHXc7zsvteU4Y97OKkA+hPl4T5mSlFIdZjQyKdMOLV5c5gRiRmHfPJ
	NcqWEymjGOGyxVDLB5xLDz0cQBo1opWJTrnlBFHRCJoMAjuPs4mdPPaqebRTzgqfeBqc2smirkk
	LeX/LI5BE4i8=
X-Received: by 2002:a05:7300:d10a:b0:33b:f062:a674 with SMTP id
 5a478bee46e88-34271d8d329mr811361eec.21.1790354078475; Fri, 25 Sep 2026
 09:34:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-iio-bmc150-check-reset-error-v2-1-b6dc74d7aaf4@gmail.com>
 <20260925040500.0f637249@jic23-hlaptop> <CALnzk4Uz1ru-_u-SgQXszHW_PL5DbY20J38v1yGCnwBafcwgKQ@mail.gmail.com>
In-Reply-To: <CALnzk4Uz1ru-_u-SgQXszHW_PL5DbY20J38v1yGCnwBafcwgKQ@mail.gmail.com>
From: cdcp 206 <cdcp206@gmail.com>
Date: Fri, 25 Sep 2026 11:34:26 -0500
X-Gm-Features: AclHuK9qlma8-MwlzT3Kkwr34_PV2GGYQIzDc4ucsfN94285QF8ZXl_GiBTZe9U
Message-ID: <CALnzk4V6hjv5OPrKiq3epFZ7q_KkE13pz_z+_V_u64oT7jefJw@mail.gmail.com>
Subject: Re: [PATCH v2] iio: accel: bmc150: check reset write error
To: Jonathan Cameron <jic23@kernel.org>
Cc: Carlos Casadiego via B4 Relay <devnull+cdcp206.gmail.com@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Olof Johansson <olof@lixom.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have not verified this on BMC150 hardware.

The datasheet documents the soft reset, but I could not find a guarantee
that the I2C write is acknowledged before the reset starts.

Given that, I agree that propagating this error could cause a regression,
so I think the patch should be dropped.

Thanks for pointing this out.


El vie, 25 sept 2026 a la(s) 11:26=E2=80=AFa.m., cdcp 206 (cdcp206@gmail.co=
m) escribi=C3=B3:
>
> I have not verified this on BMC150 hardware.
>
> The datasheet documents the soft reset, but I could not find a guarantee
> that the I2C write is acknowledged before the reset starts.
>
> Given that, I agree that propagating this error could cause a regression,
> so I think the patch should be dropped.
>
> Thanks for pointing this out.
>
>
>
> El jue, 24 sept 2026 a la(s) 10:05=E2=80=AFp.m., Jonathan Cameron (jic23@=
kernel.org) escribi=C3=B3:
>>
>> On Thu, 24 Sep 2026 09:48:45 -0500
>> Carlos Casadiego via B4 Relay <devnull+cdcp206.gmail.com@kernel.org> wro=
te:
>>
>> > From: Carlos Casadiego <cdcp206@gmail.com>
>> >
>> > The software reset is required to bring the device into a known
>> > state before reading the chip ID.
>> >
>> > Check the return value of regmap_write() and abort initialization if
>> > the reset command cannot be written.
>> >
>> > Fixes: 1c500840934a ("iio: accel: bmc150: reset chip at init time")
>> > Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>> > Signed-off-by: Carlos Casadiego <cdcp206@gmail.com>
>>
>> Just to check: Was this verified against actual hardware?
>>
>> Quite a few devices get going on their resets before sending
>> acks on i2c which means you get an error on that particular
>> write.  That is often why you don't see an error check on this
>> particular operation.
>>
>>
>>
>>
>> > ---
>> > Changes in v2:
>> > - Remove the blank line in the tag block.
>> > - Add Srinivas Pandruvada's Acked-by.
>> > - Link to v1: https://patch.msgid.link/20260923-iio-bmc150-check-reset=
-error-v1-1-b8c1ebc4c947@gmail.com
>> > ---
>> >  drivers/iio/accel/bmc150-accel-core.c | 8 ++++++--
>> >  1 file changed, 6 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel=
/bmc150-accel-core.c
>> > index 46bb36d9366e..43a39e1ccce5 100644
>> > --- a/drivers/iio/accel/bmc150-accel-core.c
>> > +++ b/drivers/iio/accel/bmc150-accel-core.c
>> > @@ -1561,8 +1561,12 @@ static int bmc150_accel_chip_init(struct bmc150=
_accel_data *data)
>> >        * Reset chip to get it in a known good state. A delay of 1.8ms =
after
>> >        * reset is required according to the data sheets of supported c=
hips.
>> >        */
>> > -     regmap_write(data->regmap, BMC150_ACCEL_REG_RESET,
>> > -                  BMC150_ACCEL_RESET_VAL);
>> > +     ret =3D regmap_write(data->regmap, BMC150_ACCEL_REG_RESET,
>> > +                        BMC150_ACCEL_RESET_VAL);
>> > +     if (ret < 0) {
>> > +             dev_err(dev, "Error writing reset register\n");
>> > +             return ret;
>> > +     }
>> >       usleep_range(1800, 2500);
>> >
>> >       ret =3D regmap_read(data->regmap, BMC150_ACCEL_REG_CHIP_ID, &val=
);
>> >
>> > ---
>> > base-commit: d8c0f48f0b1583308a98401c0c7b1a65d1d43a6c
>> > change-id: 20260923-iio-bmc150-check-reset-error-389b096b0ad4
>> >
>> > Best regards,
>> > --
>> > Carlos Casadiego <cdcp206@gmail.com>
>> >
>> >
>>
