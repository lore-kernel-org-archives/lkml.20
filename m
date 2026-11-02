Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623474;
	b=I/yj/W54p/G+7ZD5BAxmwRJcFaOrcc5Dep+X6P4eBzMpgpUiOpjpwiaqRyl8xQZX/dBX
	 89vRkMJIvF6FytOuxNdC7Wp1oMoN9x7P4pB84Aw8RLCN/TPRwpUbLZS9bMPAw+FskyiRh
	 /mfUD8NhZsX2FBoKmpFkYD3RuvwbbyvgBPklJ0v8LLhrrwWiwcMc72et8mWblQtjxhqT/
	 geWgiHUPPT6SUkbRFPtjGIyExsIOLtCEvZy8SiXOl0mWPuqe4uH60Wyb4kJ35bC7b50K2
	 2Yl8/Lc9DpXtQ9e0+ueLMDo1ByTz0yIMtLJf9tll6D5LM46dw+e2RPxgLWeLl5umlUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=dYanbEJ7ydWKIVlseZIgyCbLcRNjwGo/7gUCZwqpJKs=;
	b=Y8M5L4gt1X+Wi+h7piE27oYQtPzuyrCjt/4gZU9HLL/azus+410xe+ynliPPKB70AaYJ
	 y8O6vZZOMzy190YA6iAJKFMI4m2IZiED3xElc+S5NfyC3OatD9Sd/rAwwIZW6EZPRkWhO
	 rGt5cyFXP94DmStRYRXyNC8G5dkxxXqsHOrUgZ/XXjDVNmDbUpcg2NkJidfgiH350lR5v
	 AKeuj9dLcgTin0K/rGV201ayfvarpxLfrHx6SSg7sKs3lJjz4PCy9yPq7yXEG+nSu2B21
	 HFVOyREKWlNo9Ugb+S7Ufxj21zdStVQt5FWXjEUefQs4XQoF9IQq+R/mPutGeJDaojg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ipripHyn;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD70F606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD70F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ipripHyn
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6acbdf8e70dso824328a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623472; x=1794228272; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYanbEJ7ydWKIVlseZIgyCbLcRNjwGo/7gUCZwqpJKs=;
        b=ipripHynXFhBUZYO3ONkgpAkySdmoxAaDbs93kVcEyX1tuR6xSxgQMnbjh+OfX4ozK
         3ROdQxJdv3Vh/6K70Ycd/gX7I1HGc+HbdWgEcCn281ZdUL5H66Hb2hfk1oIwK8OyZGCV
         YqFq0wo6Z48sEqRXQJVBxDPjcHuXWpPtINRmOjaKecvPs6TuwLfdDiPm6RuhX6UabD6J
         3PWpz/tm8vagnQFLxPv/SqjZySmGtt8OdhXGJhHWx0svC6YSsK4K/BHln98i0VrJwGQB
         +yYMwH2I5/K64IWYRaWxD1RnvziHZPS0ZDU2Yv7bxaUKh4hD44bxeluaiDP3p5/RpAKz
         ERqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623472; x=1794228272;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dYanbEJ7ydWKIVlseZIgyCbLcRNjwGo/7gUCZwqpJKs=;
        b=Cn8ZKMfLQpXHcVEDdI6Tl2cpbQNkMyKTaKdtukA4XoeGBJ+zWkm8i7BTpgeraJXMlP
         NlIE0LGpddX9/GchI/7YWeuYt0uuEWCyvn4wn2i/sOFKZAfhwkFmZGIVegNtdmpsqKxN
         Lvks2hudZC/20VTqREyGw72nl+eZO/KPoMZ5INf4YKHOykRS2S94PboHX8LcElQLlsnJ
         by2M15mZEzvDpPzW2963giydjRwMSgWXwXDYumFr09N5QfO8aZvJwzyUXl7rOtMRwr29
         vw4sirjHyCWJ+XOyM3oPAmm14THu1m8r6/5r8uc8bEmoFumvLB1KE3C+w3jIoIUhpd9Y
         bfPw==
X-Forwarded-Encrypted: i=1; AKwUvBxFrSWIcTwK3kWONTIUkipCinvhRTuzV2q+MGGHXBijV35QG72aYrAJN2Ak6jRS1wczrN6cOpKw39YGZps=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rc08Qws0TqPGL0lR+9oOP0DyU8SNTiDTjWUJiAv5gv7cX3PoK
	7MIzNVD+tLN/j11PV0h3c8j3/MvMoEnPghmoz5UuKeSzVG+ON2hQM2UT
X-Gm-Gg: AYBFou0LcGVnd6yFsqk4OHuXftO3Ej2Q1K3hjhyCB23AICVje4ywW2sHycdTKAyen6v
	RkkpB2dQgLFuSW0bhkIdqWmu5HohsUl47u67OCji+aQf7bJ+ZDdNtISs0AJGK4fwjETmO4zHisj
	+5l6MHwleADqiiNtFIflDxBa9bzp0V/dmGuDPqP/sNS+YsY3//AvIkNPGx/YqEyPZcXN62j7b9N
	NZ3jiiUurXkER1RkmNf5PHerF/3tfQNljW2qK2eJ0ezsO7tkceEYf9JZL1Qa9IZonv6SCAjiNx8
	pHEaANXvp4QLVP4y9pB9WXh4WanyIfWFB1AicgskZoviorUIx3bNnyf3dxThzJnhFrUZ+xlo3uH
	6jFkERvfSVRnv7Pb1r3XEG1WMXEvZ3J8/bCxl7k4sc/U/76q8kmXYv3iiFE9qLeLpoaZuCKXDFu
	myydpRZFmnAvtFBqKlqL3GrCOL77XbxQ2f+uCbYcnDYuHzeA5rvLsDwZjGFz5gY8HMyM3PHacbB
	SslKSykfMRiwbs2Db4jCCTvEg7dQDzSzWiPvtQHQ47RsFgZk8PIUG0kesoRCYWePrLbu75U1HDw
	zEMsGkQPlfMpl8Zk3fS9B0+KtGLajOwRXPFuZ5UWvf77FqwXiLYAG6QQ+4DXs2/jLmPLfRRAAwq
	nGGDAPvaDhwee9B1bn/jcKJjZgRl6aZ6KcQA=
X-Received: by 2002:a17:906:178e:b0:c46:b5a7:5b29 with SMTP id a640c23a62f3a-c4ca7a50798mr780727266b.2.1793623472076;
        Mon, 02 Nov 2026 04:44:32 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca214fdsm3152504a12.36.2026.11.02.04.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:44:31 -0800 (PST)
Message-ID: <bbd1ec87a9fff50b189f74cbd21e1d5bddf41136.camel@gmail.com>
Subject: Re: [PATCH] HID: pidff: bound the unit exponent rescaling loop
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>, Oleg Makarenko <oleg@makarenk.ooo>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 =?UTF-8?Q?Micha=C5=82_Kope=C4=87?=
	 <michal@nozomi.space>, Paul Dino Jones <paul@spacefreak18.xyz>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 02 Nov 2026 13:44:28 +0100
In-Reply-To: <20261029-b4-pidff-rescale-exponent-v1-1-3ba54accf767@cherr.cc>
References: <20261029-b4-pidff-rescale-exponent-v1-1-3ba54accf767@cherr.cc>
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

On Thu, 2026-10-29 at 00:04 +0800, Shengzhuo Wei wrote:
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
> Fixes: 8713107221a8 ("HID: pidff: Rescale time values to match field unit=
s")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> ---
>  drivers/hid/usbhid/hid-pidff.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidf=
f.c
> index 22951b7ecd17..1a2fffcf204e 100644
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
>=20
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20261028-b4-pidff-rescale-exponent-1d5c4e218e6d
>=20
> Best regards,
> -- =20
> Shengzhuo Wei <me@cherr.cc>

Tested this locally and works nice.

Should we maybe add a warning to the driver that the time exponent might
be out of a sane range? Sane range being, say, 10 to 0? This of course
would have to happen during init stage not to spam dmesg.

Regardless of that:
--=20
Reviewed-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
