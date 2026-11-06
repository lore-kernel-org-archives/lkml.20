Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793963900;
	b=dHlU+yFuAV+7KXap3LkLOIwunnoNPIUrAGV6i5yp4EDrG7Ex/YyK6CphHB+jYEkZmC6U
	 N5ddypwBKA7WIC0YwyUkpxk66Il/U2mWOqW26xgT2D2AV5uT/iprxl9JrsUdnhlqc2m56
	 WhpHCtzngA8UJNwmAhd+E0S6S8hKN5ZXeT1Pjx+wO3Kn6RnzrrvJCPLLo/RYeWeEdTgSb
	 rOw+13w3ml1duuQMqAOM7qYfnNtUhY3VcM7Kq5ymLfP4vEQLL0T7Lit+YUC8F/uMXecMT
	 tOzBaAVuZ/I93fNl15pYSJigC4InFt0KXm/Ekl0QIpc9BirFCwT5Wlu32FUsfbIt4eQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZLt7jt8i345P9wZ+mNo/dBO8fVAH8LrDxPWxr6MmXNo=;
	b=nnlOfcLmrUtKs07gpawpCmWI63Rd6307deAeGZcJJxGd15V3x9Ko9gppabQutkFpx6AC
	 ewt9x6+ZZut+l8Ztx1kuJjQ5JXoEtTgv468BHxLgiEb8zWs9UDVacVvjbAI22tBXvxMHX
	 S93aCcnqQvMQqkkrpDEwNjKa/3FQgn45W+pMsuiSJlQKyOqoFycEyVnvia4OV85L2HZpp
	 USkoIcVEE4gSJtLRgibWiYxesjKw+MQZZNoQGWbUz3aHZ0QBipUkPG/CUMr4VR718jqlu
	 zHOfgmicB6OxV4TrChYKFzkb197nMd9qR/oPSBSuPCbMMJ56F7kERIP0To441XsAnAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Y+rgQf+J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33877606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33877606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Y+rgQf+J
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-51f2e9e6987so1040699b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:18:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793963899; cv=none;
        d=google.com; s=arc-20260327;
        b=BoOMK8KAtEx0bQj2VBliGB7v9ny2c5KXmzJvBNitBKNgj9Rc5I1aQxJWshVipg1VUd
         pBa16j5+i4zAi4R9O/t9ERdZrf8LyYLBW/6ni+dZ4O/78aotJjvUPuyNiBAgz5zEeupl
         s73XA4Jz19k3brYSWRgtGPW7L/MXsrU+wHEwNHkZ/8NYI62Lj7BcljBkC9oT3PNTyLdR
         zTNMO0OIrT99lnaqHw53kiVCxjuC+uBaWv3UWVXdjw0KLfesw7rz1GuLKUTOr/L+RR0u
         McXpCHSBQayAR6PP+OEdAUg9p/OQZL2ZyozETMLPoQaeGnUJGOhUYmDvoz+SgeaIKj5h
         34Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLt7jt8i345P9wZ+mNo/dBO8fVAH8LrDxPWxr6MmXNo=;
        fh=ADzK/uKgEWjZbu8iTZBMUbjf5k0a7BKedRQ9kQoLkMI=;
        b=OeR9+8Vso0l7IBUOJ2Mxr0fcJjlpPxntTWWMXHYg07NE4pEKqGZ2JyOOu7V0/zFWXc
         461bdcTKyaHe1yi+1bmX77Chfs0Lf3dB4dSH1kNbz+4ig3zwIi7vwpxlr5OB87xXWQu4
         iVNUagFkf9qni0vt3fDhHEoJX6DbL4hbtPdcH08GCM7V5Md5FKToLDYDZRyeRKrM8pFq
         1nqbUIiXBPK87k3hyvsDJ/qz3sAK4kGqaRmUcRLyFUFsrGB/OkH1CPsL7mAvWPJ4KNSh
         jv1q8otjrWEUHjaHm/lJojF8g4yfyZ3HJ+0qZ5pLFPsGBlRIy2ItKgjm39nPolzyTOG8
         tOkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793963899; x=1794568699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLt7jt8i345P9wZ+mNo/dBO8fVAH8LrDxPWxr6MmXNo=;
        b=Y+rgQf+JMpNVGmwxsslOl6z0HTmP6aJFjJop+Kpl2m/4+yqmRNUmuxPPb0hxFOTqZ7
         8k6GRGkC1vH/g4wUQN8Ns+iMKoUN3cjPYvOWJVCdguRjlo1bVp1tIG6B8+z/0XbaZxRi
         /wQyZHVrg18UFIwWsFj/5BKfPU/5ONRKfg2jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963899; x=1794568699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLt7jt8i345P9wZ+mNo/dBO8fVAH8LrDxPWxr6MmXNo=;
        b=OT5iFnn/qeZgsg8Bg4I0m4746+hqlBv2YBy6cXM8H+/6D1JwRY50Dql9UFEe71WYyc
         Au4i+bSzG7347egfV3MyzQicI8QhHqfL7F55wFBKcISPW9PkE3PmPywRnu67c/70CFmR
         CEtK9xUrbh/IlfGd6QDwnUVrYIu3aFQk8DhEroV1rFekYau7Cc++hMemE/TA30QfSgIO
         UhwtvX7/5oNVmpp9YqapQeJVTNKJIA5me4aEupEkWiV6Jgh6OJQwgDjrHfNb3yuB4OQI
         k8LmJuNnb1Y6HbYChd4CNVqXgVJQUA0n5rb8uH42LQ/NkQrdrUKQv9ZkYsmcsCx1IJAu
         gdew==
X-Forwarded-Encrypted: i=1; AKwUvBwNK99tsIKtJQI4UKNkeGXe0Ihgx/Nkzwh8IpAkhvfIJJwRBwCmsMzf76waxKCk4zCV+S+Q6m72HHyjOWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gAoYB5DayYkCm0AWPh4R+A1vSGw0iHoibrdom6OiBsHQg2g4l
	XxG7lX2q4PmmO0KBKSROTs8cwu34MvF7GKdZfl1cXGU9HMr+4VSQ+a6XKtlALFHqfpKrFvRQdDP
	/ohVAw810/seIeY+eXe3fFesLMq39d8y3Upt64MYzrQ==
X-Gm-Gg: AYBFou0n3hzqvAur0kSo5ehwplB9lY9WytgsxIrVyFOv6x5tSrhqBXPFI0Hh87AhFHo
	EQ1NnM4F29TuCjeY0uAnCMKs1LGErzre78lFkQm4UBeWHmVMjaNtPynoEMReyCIpXcScw7YQHxc
	3Pa4lM/4sc48e61RSga60m4yWkmIr+c9MHkcTzfReuhQ7CKtitslcGBdIxxDu3Pb7xgRhieV5Yk
	1tPoLGNc0os+dvPnqCIARTcpIcwKIO2PjJkmP4gUV+DSUEgjROvw3gJFF8SeVtv8j3g/jzrrALn
	GbRO7jb2TRsoyTroqwTFNHnDRO78ARkqVzzRV0IeFDAhRPHKHsO6yJotm63pjiLMvc0xzmXuFCd
	poQ6CpuAVOVCLx8HQl7kmYvCknMBMfQoAtqJVa944I+CE7FM7IiBRbLz1LHEc7ahKTNKM8Q==
X-Received: by 2002:a05:6808:2228:b0:55b:fc1e:bcdd with SMTP id
 5614622812f47-567e15a5a4cmr1063799b6e.14.1793963898884; Fri, 06 Nov 2026
 03:18:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101161814.1325847-1-chris@miget.com> <20261101161814.1325847-2-chris@miget.com>
 <3e44b454-922d-4a1a-8ffd-f77b4cbce654@gmail.com>
In-Reply-To: <3e44b454-922d-4a1a-8ffd-f77b4cbce654@gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Fri, 6 Nov 2026 12:18:04 +0100
X-Gm-Features: AclHuK-WSzaOrVLwR4MSd8v_0fzWBE1pOauYeKH0y-QEzFYWMzpSopPRYHhHWcA
Message-ID: <CAAcRvKPX5i1BmdgkB_Rd=vOr=4+o6-=0SdVt851oRK66WS_q4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book
 Pro 14 quirk
To: Mingyou Chen <qby140326@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, KentoNion <kento@kekto.ru>, 
	Matias Civadda <matias.civadda2342001@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Nov 2026, Mingyou Chen wrote:
> I'd prefer to have this applied on top of patch 3/4 instead, so the
> infrastructure is in place first.

Sure, v4 will add the quirk after the battery support, with 0x03 as
the battery entry from the start.

Thanks,
Chris


On Mon, Nov 2, 2026 at 12:31=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> =
wrote:
>
> On 11/2/26 00:18, Chris Taraszka wrote:
> > The Xiaomi Book Pro 14 (board TM2424) implements SystemPerMode with
> > its own values. Its firmware ignores 0x00 and 0x01, and GET returns one
> > of 0x02, 0x03, 0x04, 0x09 or 0x0a, so with the default table balanced
> > and balanced-performance are no-ops and reading the profile fails with
> > -EINVAL whenever the firmware is in 0x04, 0x09 or 0x0a. The failed read
> > also aborts system suspend.
> >
> > The firmware passes the mode to Intel DTT as an OEM design variable.
> > The DTT tables in its data vault name the modes and set the sustained
> > package power limit (PL1) for each, by power source. For the H484 CPU
> > variant (H404 has the same layout with lower limits):
> >
> >    value  AC                 battery
> >    0x02   Silent  15-25 W    Silent  15-25 W
> >    0x0a   Silent  15-25 W    Silent  15-25 W
> >    0x09   Balance 35-45 W    Balance 32-40 W
> >    0x03   Smart   36-37 W    Turbo   50-58 W
> >    0x04   Crazy   50-58 W    no entry
> >
> > Map low-power, balanced and performance to 0x02, 0x09 and 0x04. 0x0a
> > selects the same tables as 0x02, and 0x03 gives on battery what 0x04
> > gives on AC, so report them as low-power and performance without
> > offering them for SET. There is no balanced-performance mode.
> >
> > The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
> > so skip the AC type check.
> >
> > Signed-off-by: Chris Taraszka <chris@miget.com>
> > ---
> >
> > Notes:
> >      Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A, H484=
)
> >      with this series on top of v15, loaded on v7.3. Firmware mode (EC =
0x68),
> >      DTT OEM variable 1 and PL1 a few seconds after each set:
> >
> >        AC       low-power    0x02  ODV1 2  25 W
> >                 balanced     0x09  ODV1 0  45 W
> >                 performance  0x04  ODV1 4  58 W
> >        battery  low-power    0x02  ODV1 2  25 W
> >                 performance  0x03  ODV1 1  58 W  (with patch 3)
> >
> >      With v2 on battery, balanced set 0x03 and PL1 went to 54 W.
> >
> >   drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> >
> > diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform=
/x86/bitland-mifs-wmi.c
> > index a431d3fef774..63fae12ebd83 100644
> > --- a/drivers/platform/x86/bitland-mifs-wmi.c
> > +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> > @@ -113,7 +113,28 @@ static const struct bitland_mifs_quirks default_qu=
irks =3D {
> >       .num_profile_entries =3D ARRAY_SIZE(default_profile_entries),
> >   };
> >
> > +static const struct bitland_profile_entry tm2424_profile_entries[] =3D=
 {
> > +     { PLATFORM_PROFILE_LOW_POWER,   0x02 },
> > +     { PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
> > +     { PLATFORM_PROFILE_BALANCED,    0x09 },
> > +     { PLATFORM_PROFILE_PERFORMANCE, 0x04 },
> > +     { PLATFORM_PROFILE_PERFORMANCE, 0x03, true },
> > +};
> > +
> > +static const struct bitland_mifs_quirks tm2424_quirks =3D {
> > +     .profile_entries =3D tm2424_profile_entries,
> > +     .num_profile_entries =3D ARRAY_SIZE(tm2424_profile_entries),
> > +     .skip_ac_type_check =3D true,
> > +};
> > +
> >   static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
> > +     {
> > +             .matches =3D {
> > +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2424"),
> > +             },
> > +             .driver_data =3D (void *)&tm2424_quirks,
> > +     },
> >       {}
> >   };
> >
> I'd prefer to have this applied on top of patch 3/4 instead, so the
> infrastructure is in place first.
