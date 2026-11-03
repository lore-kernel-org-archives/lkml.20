Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697621;
	b=mmpYz+KBAY9kgrwVZ2bcogrbn12x7DSiWuQ/S9yLpXxfjQ+obuvVQk6O0UUhhYR+J1YZ
	 jyRrnme7Ke42ufElqXxo8ToHL51LTHfYvL5o6reyYDs4ygaNX7042Dk02kJaY+8Gm07qX
	 TXS/tqgsNaxFc23yAy6t0d27DknQMhgz2n9rjml/XuzLb8iOx5GRAoNNeM8yOGFIbJyTy
	 H2BVhbJtSEixK8Anj5wypeAWw/+AwK5mLhA0z6/F0Zl8W1IDro7IW+PKu/kwYUJWPUA7q
	 haQknsrCE9VGMFMgMWzNZeeXbkh1VkWVQUGRysyFiF/+qFyNMIaruVVviwkZZ3/24lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=TNCUkOdrDNw6Y0YerpyggbymdScac6P000lKA53Qu5E=;
	b=WoiMHWNg6nxuSnm+rVPrmEKx8ylBvQ6/zerNq1YBZ4IBH1LuN0TP8Q8k32J0wkWACqpO
	 /WvHy/kHgXOVQiB6r2gMgCSYT5ricuYcTezM71rq6B/GR/ydJaldk7WSHBI1xkBXMSWFZ
	 RecaAIQ2l+fNzNsSqyP0dbMJrGXDyyC5Q7b493ZQsyJsPwBAIhvPGu7pptxECCpC5KvD1
	 VgegeoMBoKpPl7oae5U31Mwj7qZ99iaoApl8lV2j+wuX4FURGV1fNSuz52BN7mZVBo7Lr
	 1TfibKywRSHfA30CzlN6umSRwYvEr3/eg8j9F9xtyruvQWCt9LC5BISnLzbVILG6BXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgAXlGvt;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5478C606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5478C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgAXlGvt
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c411b7a2710so71342466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793697619; x=1794302419; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNCUkOdrDNw6Y0YerpyggbymdScac6P000lKA53Qu5E=;
        b=MgAXlGvt3N4HPmYe4BFyl00Qw7aY4cTpOPdLrts5i12nDmokkC38bTWwSetKa3NoYY
         JZqP5sWhuckQoSdqZ0yZvL1x1kKXVozy5G9oAHmArdJizqr+uq7rA5706M7tSOuYs1R7
         RrVysGMeJe22az4/DYIain/haTwAwwdi3exTWR152z4dkQx8qDcMUj9/P/JsScc6kq13
         JxYIwmGHjXIIitvY0j1zqJlwy8BFd3BiEwOGTBmeCUr0yTm7A630uFw6YvKzHNpzxkIA
         qevdaMPZz5TY7i5N8wlW0BN5Yb5Y/81WvJ2GT0A1XVyxSShxQMP19kpKSDJqwPAvBbWu
         xPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697619; x=1794302419;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TNCUkOdrDNw6Y0YerpyggbymdScac6P000lKA53Qu5E=;
        b=Y5ZY20Q/VmDPNm86ws8TXUwlyOD1LUMme1GIDaTWK8GODRc/9IfCMY1m8m6E+l/hWT
         ykRf+uCjWJ4b8rclWGh9fQ1jmX8LoNcDTQ8F3YKJRB0tFj9znGQgMXUpZoZDPkqCoidc
         FBeRuQbE1CfklLCkjh1XQqjcuBa95DPqF8OFNmYhMCbHRdxjsrlmj/D7SYE9fQLNl5ce
         B3W4mojdluUh0fPuq4QLFBQZw0NGREzVlBuRfPjzyuG4VbPgsYPVLL7sOLOWe/VejCju
         KEGdD2mGwnzrBOgXUlEofUTXrS/mdXisDO6v0GP9kVdwNdRT4j4QSGqHl/LT7ZEEsRL9
         eFSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZ9IrCYwTVVwLzjduPDZzJ0/vS40OJb/7DbI31u4GSEvugzgABYSPxioqEnViZxKNMkAI8bvE6/6o0T/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcC29gLrVRZdUBedbmUwp236lJJ2dAPMtS8P+/HYOL5ro+tMSV
	5sTc9iXv8CX60aeMskBiwA/TzxfnofWkM7foc0ZmXZbHQBDfdURsJT3D2ddC9w==
X-Gm-Gg: AYBFou1XURtlgo2uhmKGMVtRWND6UGHN+8OuWPxhjL4t8eJLCYteNNuhbD3CbQMsija
	t8AXxKqcStjKzGyNymKAsfyVwdpHn8244YGd6WdN4xNK5/RXxCz1E5VXITWEj2WRwMFpS8owNmn
	tC1j0dttpgaar0UQAHxRd4mseWKL/j6VYp2T2TL1TQ1f8WawIbNQtK1QuEagGNRnD1TzknVLebo
	Lad7rqy87JSfXpAzZCPWDHaObLibx1I2hXqE7F62jGou7ZmfP1KzLrugy81/GWponoDzjrupomI
	Ya0Qvrf8AFCi1iyJ0e7llji0NZKfYII8rHcI2IxKwJd/jE3+JHdfglhv6wWhilcGJHQ30y1O0B7
	mgeSFsjudohgVxqYlvueiLLCffarf09mLKvgDGS9xN4mHj0WPyONSIxtVP4d7H6k2dT19zAC3Wj
	Ty4ZDExa+9CovD27DLUg/GZu9pwJnedVsW7I5J2nGhcdYbYvgjlejefSAasBrVKLz0NYmF8oZ1o
	rE+75tCWfMzJ2yeqRljJCmiQMpA78sW/tbJO4yv+KXCjwXQ+LjXiqa0XlKq0LvUQ6nAWKMZtUkJ
	/zq97qkYZ6kKWuq7dLPvVU4Bgb3vAPLE5T9UzII8O/bZASjbCQIfkGjjzAW+UHCIJ8x7rcvb05T
	p36hCpLNYclhtdg==
X-Received: by 2002:a17:906:351a:b0:c34:db91:aa1e with SMTP id a640c23a62f3a-c4ca7aa020amr977638966b.4.1793697618437;
        Tue, 03 Nov 2026 01:20:18 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf37c9bsm67920366b.48.2026.11.03.01.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:20:18 -0800 (PST)
Message-ID: <86a644201b1938155af01f3e2b7dfb71dcca159d.camel@gmail.com>
Subject: Re: [PATCH v2] HID: pidff: bound the unit exponent rescaling loop
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>, Oleg Makarenko <oleg@makarenk.ooo>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 =?UTF-8?Q?Micha=C5=82_Kope=C4=87?=
	 <michal@nozomi.space>, Paul Dino Jones <paul@spacefreak18.xyz>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Tue, 03 Nov 2026 10:20:14 +0100
In-Reply-To: <20261102-b4-pidff-rescale-exponent-v2-1-a75bcca65fd0@cherr.cc>
References: <20261102-b4-pidff-rescale-exponent-v2-1-a75bcca65fd0@cherr.cc>
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

On Mon, 2026-11-02 at 23:23 +0800, Shengzhuo Wei wrote:
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
> Reviewed-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>

Afaik, the tags should be in a chronological order (my review on the
bottom) + reviews should be removed if patch contents have been changed.
My review is no longer viable for this v2

> ---
> v1: https://lore.kernel.org/r/20261029-b4-pidff-rescale-exponent-v1-1-3ba=
54accf767@cherr.cc
>=20
> Changes in v2:
> - Following Tomasz's suggestion, warn during initialization when
>   the duration field's unit exponent is outside -8..0.
> - Add Tomasz's Reviewed-by.
> ---
>  drivers/hid/usbhid/hid-pidff.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidf=
f.c
> index 22951b7ecd17..4540f49fe6e3 100644
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
> @@ -1428,11 +1428,19 @@ static int pidff_find_effects(struct pidff_device=
 *pidff,
>   */
>  static int pidff_init_fields(struct pidff_device *pidff, struct input_de=
v *dev)
>  {
> +=09int exp;

This driver no longer enforces C90 standard (in line with kernel) so
please, declare the variable where it's needed.

> +
>  =09if (PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1)) {
>  =09=09hid_err(pidff->hid, "unknown set_effect report layout\n");
>  =09=09return -ENODEV;
>  =09}
> =20
> +=09exp =3D pidff->set_effect[PID_DURATION].field->unit_exponent;

So here, int exp =3D ...

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
