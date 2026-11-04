Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778103;
	b=KBYNqbOkaqFW/DX7P66LqMry3psQMK+i6Vq0hqLT974z/uetHx2GHv3+Qd859/+o+uky
	 e3eJGl9GjyE6EZwimVLiqFPTWhqaLtybDtAyI0/uPoJ/MeOHm33205t/oTgtu74YtCCK3
	 23oueGyzLCaf6MZCKNoppCVrl3XXzUv95oWuXNGpQW79aBUS5HfM3D/pXkmZyyNa9HwIv
	 uHaeFUAi6ULzjvIdDxDciWiRva154ClkxV7yQxSZ9usZ4WAUXBKQyskTdIouOoql+H4XQ
	 QR5hL8TvXSrRuQarhbot7usi0RdvQxDTagJuOz/PTxVMaQ36b1ntNWeNYZbDmYULTxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=COWDtAifNxy9eheKajXdjw2ArjUB6Mu5k/ceulB+33A=;
	b=EeNzCmJaHixb5nGOpF8isu2VKPCsRbdSNeixhQi2OX8YygK6EXxY+ZGTudV2K/r5gozC
	 iBgm1Qc1sCldohtWdm6O6xkU5ZCaKaeJ7xFDF3uokPKTzpdv16pQyLjoYCcEPQsRkzyNc
	 XdplShwUV7hzE5GNPEP88MJxHcnL7ay97SuFhxpj3ZGJAQXeC0LaUBo4DHm2yK9tK0FtT
	 DdHDe0J77Zz25aXgOAYpwfmmFeY9bkakqed+cTGM75cXFggVGDQhyvWbvdKCSDfWaXFRW
	 rd4jNLZm8FB1ZQlxqs7AIfeZyJPJGzWUhbcVrBJAXqAe9XYn5CpPYY+SdfcQcIpin9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JiNghS0W;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC2606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8CC2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JiNghS0W
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6aa77d4d968so71487a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778101; x=1794382901; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COWDtAifNxy9eheKajXdjw2ArjUB6Mu5k/ceulB+33A=;
        b=JiNghS0WbjBhBjplbOoFlqjxzZeyvtmCJK69gYiV7tEtoa1I+21q3J2Ylf1p7L/tDZ
         lrJVG/LZH7mUuENylhmMwA5PqSglaKNrvi7WgywMzZEUdK5OughJlpokHLxmqqgR+eeE
         DqzpNug6VzlkuOOVJbS+nTHWlUwVdNc/GUgrFZiOpP98FV4kD9oArKwb9je036+TbePJ
         WvnbLBZJ+7JjzlcZ4zBxZ++HpBUSS8FPfGI6NmSgschT5c0czNGij65Bn/PTLDYL7B/L
         +Yrqk+LHo7/i0oc21yRYNeFJ50INTNV0xB1sP2/+YcER0e4mNHkF16U0idnDASxuIOfF
         HsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778101; x=1794382901;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=COWDtAifNxy9eheKajXdjw2ArjUB6Mu5k/ceulB+33A=;
        b=e4D981ca7OTn6z2Rbiv+oP0IvxFjDSFYr5Hb+ZNpd+JI94bnIP+4q4bY8U9IYJ5vJf
         Jpbp8JjKVFPRlEdy0ZprUFwfNF9vOQuV4BUYkqHtBYn8iSwbwqIbAZwP54aNiA+hwEV5
         Yapg/ZI0IwA1RnjP7S9Z4r9u+fOiWYzTCIbI/q0xk7AeIaa/6OIS0gkqoO5eK+kmq1rt
         CS1ELjRYor3CQlR6p2iB9B9pS0sH2I5KZQm7G4tHgoi0RZW//cRNrC9mSIVULsIMekBw
         uvHQqYMPweGkkGto5NU37pxQJd9dlvDfuQOPa7lINn6mBYTWUWbSKW2SMhyfER6gC4fE
         dHlg==
X-Forwarded-Encrypted: i=1; AKwUvBxaDUhdZuweLjlaQX/fb8BWvZcQjT1epPp8PAKZ3bEOQIiNWrw7mMB/Yh1SrBy9FYTny8GhrXeTBHP9kng=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CeQhdnYKIXdZGS+v02AnHJgqn2VSADkea+MVAswnK5mnI1v5E
	byxq3OswM5q31VLuWQ/AGeH6JApeb0CJy0vz+bPS5g4tBKkZ/ts4K4BN
X-Gm-Gg: AYBFou02aIIxBThuhcv4gP5Sy63YYDVvx55pxq7CE+DpRygwFUmkhiQjNS0N5aFDl3V
	w9f1ZNuBA8aeDnnumat4zIcwG1La5YWFxtj6k3XKdnHPgOENjGLnY9vmOJQXeg031794xGwtsuP
	l9JOmBmvsv3fbyGvQL4EKrN8WTdI1IWb8+o3JCLoW4yR0a6qdiTrz1hX6s542reYUDMOYHWN/pI
	7OT8SZ5WyJfKJTD6pQ6Ti2cGwwlD6cOZ5K0sQK7PfH/wAGmoMqjLWfOhO9qCmIwh7I6Lcy1jK+X
	YO9F5CxKOWZ4SQeuln5uV+sD1vIm9hrIiPeIaDN37hfKuZ6s8hTwKa7YGEUiqslnRD8b0yWCJio
	luhRMv2Wh13CWjeb9LWnMEsuj06MBn5QbortZLfnkESbxiw9F+x1y0xhWq06wpg9aiwoVnqGmyB
	//BhgDoVEveuRN7ZWHU6ZglbJtSQb8epMopNlcb3t9PpDdk8IeSKbPndGI2jAc1yPvWsCPbncyN
	RpRKCYRq+LfxBLpF0H+LPRe0/DwJZVYgNFtMSevfJ1DWLtZGNtldyPZga6ELo37Tdd0IQL648TT
	M4FDQuCGuH3fhp3sruw7Zu35UOxZHvoRe4dbM1L+fmZja5d383H6jh612OehSKMIDMrBPXhEUih
	PV1UhbumE6m8U2WL+MxLUexl+1/45wXkunF0=
X-Received: by 2002:a17:906:f15:b0:c43:f1ab:167c with SMTP id a640c23a62f3a-c4ca7970666mr1286785766b.1.1793778100876;
        Tue, 03 Nov 2026 23:41:40 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e423a48sm43450366b.27.2026.11.03.23.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:41:40 -0800 (PST)
Message-ID: <c80644469f01ae6d2ba0339a7a2fcd7c6080c310.camel@gmail.com>
Subject: Re: [PATCH v3] HID: pidff: bound the unit exponent rescaling loop
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>, Oleg Makarenko <oleg@makarenk.ooo>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 =?UTF-8?Q?Micha=C5=82_Kope=C4=87?=
	 <michal@nozomi.space>, Paul Dino Jones <paul@spacefreak18.xyz>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 04 Nov 2026 08:41:36 +0100
In-Reply-To: <20261104-b4-pidff-rescale-exponent-v3-1-f45e64cf488c@cherr.cc>
References: <20261104-b4-pidff-rescale-exponent-v3-1-f45e64cf488c@cherr.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-04 at 03:44 +0800, Shengzhuo Wei wrote:
> pidff_rescale_time() walks the device-provided unit exponent one step
> at a time, allowing extreme values to cause billions of iterations
> while ff->mutex is held. In a UHID test with an INT_MIN exponent,
> EVIOCSFF took 3.1 to 4.3 seconds to upload a finite-duration effect.
>=20
> Stop rescaling once scaled_time becomes zero, since further
> multiplication or division by 10 cannot change the result. The u32
> value becomes zero within 32 multiplications by 10, and the u16
> input within 5 divisions. This bounds the loops while preserving
> their results for all exponents, including wraparound.
>=20
> Also warn during initialization if the duration field's unit exponent
> is outside the range -8 to 0. This helps identify unusual device
> descriptors without logging on every effect upload or changing the
> rescaling result.
>=20
> Fixes: 8713107221a8 ("HID: pidff: Rescale time values to match field unit=
s")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> ---
> Changes in v3:
> - Declare and initialize exp at its point of use, as requested by
>   Tomasz.
> - Remove Tomasz's Reviewed-by at his request, since his v1 review
>   does not apply to the updated patch.
>=20
> Changes in v2:
> - Following Tomasz's suggestion, warn during initialization when
>   the duration field's unit exponent is outside -8..0.
> - Add Tomasz's Reviewed-by.
>=20
> v2: https://lore.kernel.org/r/20261102-b4-pidff-rescale-exponent-v2-1-a75=
bcca65fd0@cherr.cc
> v1: https://lore.kernel.org/r/20261029-b4-pidff-rescale-exponent-v1-1-3ba=
54accf767@cherr.cc
> ---
>  drivers/hid/usbhid/hid-pidff.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidf=
f.c
> index 22951b7ecd17..7827b366fa5f 100644
> --- a/drivers/hid/usbhid/hid-pidff.c
> +++ b/drivers/hid/usbhid/hid-pidff.c
> @@ -354,9 +354,9 @@ static u32 pidff_rescale_time(u16 time, struct hid_fi=
eld *field)
>  =09int exponent =3D field->unit_exponent;
> =20
>  =09pr_debug("time field exponent: %d\n", exponent);
> -=09for (; exponent < FF_TIME_EXPONENT; exponent++)
> +=09for (; scaled_time && exponent < FF_TIME_EXPONENT; exponent++)
>  =09=09scaled_time *=3D 10;
> -=09for (; exponent > FF_TIME_EXPONENT; exponent--)
> +=09for (; scaled_time && exponent > FF_TIME_EXPONENT; exponent--)
>  =09=09scaled_time /=3D 10;
> =20
>  =09pr_debug("time calculated from %d to %d\n", time, scaled_time);
> @@ -1433,6 +1433,13 @@ static int pidff_init_fields(struct pidff_device *=
pidff, struct input_dev *dev)
>  =09=09return -ENODEV;
>  =09}
> =20
> +=09int exp =3D pidff->set_effect[PID_DURATION].field->unit_exponent;
> +
> +=09if (exp < -8 || exp > 0)
> +=09=09hid_warn(pidff->hid,
> +=09=09=09 "duration field has unusual time unit exponent %d\n",
> +=09=09=09 exp);
> +
>  =09PIDFF_FIND_FIELDS(block_load, PID_BLOCK_LOAD, 0);
>  =09if (!pidff->block_load[PID_EFFECT_BLOCK_INDEX].value) {
>  =09=09hid_err(pidff->hid, "unknown pid_block_load report layout\n");
>=20
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20261028-b4-pidff-rescale-exponent-1d5c4e218e6d
>=20
> Best regards,
> -- =20
> Shengzhuo Wei <me@cherr.cc>

Works as expected. Thanks!

--=20
Reviewed-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
