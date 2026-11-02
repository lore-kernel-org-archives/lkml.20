Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622968;
	b=T6jEpi7H/YkkNUr9PPo9sjdjBSPGi6NQNO53d9slqwGqC8OcZc03mHKXv3iSZzFa7Y5J
	 yhnwMs6C2bGwTWpgjQOsv2RO4BC15zybMdw4X84JicLlBWFXE2AYV5wo6rRY8DaeDtFil
	 UQp81Sp9xs8Ya0bon/dhRQIAEUyzSrJOyUc3XlSFZ6eFevoLV5bGKIn+AdYUOy1E4V+Oa
	 4uN7Db8HMY2tiyU9VzE3mSG1uOR/MWciCoq81V4S1AA/XfPC/jEPQdMFn6BspQhSzjIcr
	 kbqyIBf3DN+6WHSWPxJbQrdAthPacn0b6PeTvQ1sXkkv9cEJ2bf2m72M4dgK7xtMQFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=M322gxN17KH2FpLbwEqFxfIE1eUVU6+ZQO7JUqapB7A=;
	b=oFamhgqAW+eTHfNR9eP/mdPaj2HT8VSjlFVhQoGCZ4wt+wk7byExSLy7oHrA8ZF2PUgN
	 gz9e/oJ2g2lno+0yT6UI6VzvEoNqCJxdABnZdYhzdrS8RKJA2y20Tty9DTRRn5LHvrSdM
	 9b1BEaEGmgqRpuOulRRQfeirNLEtn/YKg8Eu4Mpa2qHM2QZnwYJJEJ+A+9tOrtAGNQ61U
	 OA9mc7Gfy+PAOUZCHIgBcO4o2Cuzfktm6jJlIQrvNOGYOUAFuknhBC5Mr5cc3VOZtQPTf
	 K/CpAaSlbW32fUu2j+8q/YFgGKLx5b/PlrW1dYT6+mu8ne05ATcSU3Y+fOOA3jghlFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5CiVmW6;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE43E606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE43E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5CiVmW6
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3fc6e388so5782611fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622966; x=1794227766; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M322gxN17KH2FpLbwEqFxfIE1eUVU6+ZQO7JUqapB7A=;
        b=c5CiVmW6TC6wzhilCy2vRAOjt377rQOFvnTggK30VMkmy3zHL8cjaFj3kEfM20B7V8
         S6MqGtKCdWYPj+71NvS719/pZjRnNbji4M40tk9LAAqL9+2GNQrhs5ef8hvWzRxpKF0R
         Ypu7f+N2BzXigxVRJEM2xymxy4BYBu7CATH1NeSvlsJBu6Gqe2OobIDH/CUAcysBRDS2
         DUGfWArThmDBRC5zzEMfJ+4/MY0b7CT86GFT2eAfVaEL5ZE+oaIb5H1FO3wC/43PUVVC
         6FsrVSrr3GGlULr7XBfLYmaD8AJHuw20cBeP61bZj96ONnDPk0mdhObdLXnCjbxGcGVl
         IgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622966; x=1794227766;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M322gxN17KH2FpLbwEqFxfIE1eUVU6+ZQO7JUqapB7A=;
        b=0pQvoDiqiY0GomZIdq1vz+opE7khXHdJmonGZPda37t5JtnaWGz01alw9qN9um3mJM
         sHy/RhG9yfB25OCKEI1/XPQWnEeStxhHIUfCzNryGtDyMDxWvSruklF7Y2U3TDQlvCgO
         AoSa2LnzyeAkYi0RrOqkSMInnSCdLtv7b80bRntCIedfXEkX5pyj1EczDxcAVeT+RBKQ
         RsZgtJLch93wzCtEfvg999lpZNRRv8tm8fE9CVW3gPnbgEIn92QtMsLb3gkafWYqPMpg
         SGnhNLoGiPmuG5OFTFe2OdVfDcPjwzMWfUkXMKi3JgHT0c6QaB4aeUN80BYzhH1EqsP/
         Ipiw==
X-Forwarded-Encrypted: i=1; AKwUvBxXIy53YJcXcUxKjq0Ir1UTd6ts/COPggNmVz2i5man5/K7kikm2uux6HNfIgXYPHxdVVVsDSQIZ5rmLXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WpMuLtjOMQmF1SUVcs/mN1MH7s6psJafVS7dFgK22Xyso9/zl
	M+tXjbTBMrSofocuCJpu3oTrJKdlMOaJALDa4qj3ugC6EVNsIw1cqGFL
X-Gm-Gg: AYBFou2akFIbiPUzPybtiFCjxvjvB48LMcZzcTe6N8m+jWT0uvu5hqKepvYFDkvXnOh
	2fcYRGAq2JIVjcZ/BRi1HpWxgZEziFQvWfoF0R1vEvRZ2B5muCWwO+c0EAXSSzroNg9yUBf7/b9
	fyWC1UPK6Iw86ieiXlzr2buVlsSTeK0DAfnFPDMuzEBw6ZR0/TWkGXgE9wnT95qLEn7WIW7HZmv
	W9frHmQg7FlIb8utv4tEKH6M+ammdu35/SAujX4G7rr1G9G3c4yMGLKPAgcDcrwe2VuZAkMiLPG
	SxH2iEV1NZ4PLHV/Gumzm7/q5Mu3p+lJe7uIpsjZyTPrX1gwk/mD8wS1xyj1LiPLgtCMYNaCXAa
	UNd3g6jLS79WKxRBdi8XaJJELUeCFEfHj1Obv4D23IpOJHgEpujZS8PnqT2EvSvdDuh880Lez/1
	RVpL1mqrPRB+NzvaWbEmA/E9YlmE7xzI3l0f4jC1hmQ5/c/tO8uG8l4Sz/HyIoSE2/WnvLMbeoB
	zzNmWAtESvcuKyOEKziUmLGi4BtBQE/xrrNz0tQV4H4qj2ZRrzdHoYntGUd6owr11K/hmgjaYa8
	qWIWU0FMRXSa2eHLX0sut5VYf+LdCJPXxqtFRo75sUyDYXUOPLwENj7EG8x2oJH/eRHL+Uil5QG
	kxxBEfAROchwd1w==
X-Received: by 2002:a05:6512:159d:b0:5bf:ba43:fa67 with SMTP id 2adb3069b0e04-5bfd95989a1mr4171090e87.6.1793622965865;
        Mon, 02 Nov 2026 04:36:05 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07551e2sm1599770e87.84.2026.11.02.04.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:36:05 -0800 (PST)
Message-ID: <b27645a5948ec37836a9186f0eb4699b6d6fd87a.camel@gmail.com>
Subject: Re: [PATCH] HID: pidff: fix undefined shift for infinite duration
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>, Oleg Makarenko <oleg@makarenk.ooo>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 02 Nov 2026 13:36:02 +0100
In-Reply-To: <20261028-b4-pidff-duration-shift-v1-1-65028c6b4a37@cherr.cc>
References: <20261028-b4-pidff-duration-shift-v1-1-65028c6b4a37@cherr.cc>
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

On Wed, 2026-10-28 at 18:55 +0800, Shengzhuo Wei wrote:
> pidff_set_duration() computes the infinite duration as
> (1U << report_size) - 1, but report_size comes from the device's
> report descriptor and can be 32 or greater. This causes an undefined
> shift. A UHID test on x86-64 triggers UBSAN and programs a 32-bit
> duration field as zero instead of 0xffffffff.
>=20
> For report sizes of 32 or more, store -1 in the s32 field value to
> set all 32 bits without shifting. Keep the existing calculation for
> smaller fields.

Yeah, that's a good idea even though finding a real device that would
trigger this would be quite difficult.

>=20
> Fixes: 1a575044d516 ("HID: pidff: Compute INFINITE value instead of using=
 hardcoded 0xffff")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> ---
> HID: pidff: fix undefined shift for infinite duration
> ---
>  drivers/hid/usbhid/hid-pidff.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidf=
f.c
> index 22951b7ecd17..25b82e7d0b9e 100644
> --- a/drivers/hid/usbhid/hid-pidff.c
> +++ b/drivers/hid/usbhid/hid-pidff.c
> @@ -394,7 +394,11 @@ static void pidff_set_duration(struct pidff_usage *u=
sage, u16 duration)
>  {
>  =09/* PID defines INFINITE as the max possible value for duration field =
*/
>  =09if (pidff_is_duration_infinite(duration)) {
> -=09=09usage->value[0] =3D (1U << usage->field->report_size) - 1;
> +=09=09if (usage->field->report_size >=3D 32)
> +=09=09=09usage->value[0] =3D -1;
> +=09=09else
> +=09=09=09usage->value[0] =3D
> +=09=09=09=09(1U << usage->field->report_size) - 1;

I prefer default operations instead of if/else. Just a style preference.
Would you mind changing this to unguarded
`usage->value[0] =3D -1;`
and then the previous calculation behind
`if (usage->field->report_size < 32)` ?

>  =09=09return;
>  =09}
> =20
>=20
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20261028-b4-pidff-duration-shift-8df4f6451448
>=20
> Best regards,
> -- =20
> Shengzhuo Wei <me@cherr.cc>
