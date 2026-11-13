Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592331;
	b=ruZliDpA/wDgPGMCqp73FsAZgPcw/EybDOUeXxnJiLVGONTWEV7DdGYVvCV4cGHE0yKV
	 KfWU3h2KOoOx6N5/8+K35UTF7GqTLOBVqFWiz0NpKQrgROUzAWAlhu/OzNmZLMJJvtGqz
	 TwxF8MMuPpg9k9pU9qm3Qfa2ezRSQK0s8gJ+zmJpq4A3WE7px1vrVeMErd3Jfnw7KqLGy
	 id/jdTeZxxKVL5ZSy6DB5/A8MdLNA7w3ydFj8ny7iZipRw6m7fD+qmlZfCncIHvDW19g8
	 SVFUTukK9PJEejt0xKotUPpdi7cdIhJIOZFk2I0VKREFK88E3Tmsw9ErTajWAdE7nLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592331;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TLfdLaAUVLYd6fQ/6w4Lz5M40jHznIS5PWWPQ+bnEik=;
	b=Pm2b9Kl96X5CUINLV1aqDdpCvZM4KAtG/QwiivfzYXOvbSsfgmj8RN3+9Vb+OZGzZVpb
	 idolin9bM+7ZaKTRHjWd2pV7UIQKV4KU2tozCzW1GTl4mG2Fy6n5wodauCCawHgPVTSqV
	 oVhD/Bv7kxB3p1CZ/NBWrr3jU7uwcoQPeDL62EVhI3jf/PbZ8zmYdyyEoHUwleHi6SCPr
	 Pj+oYMnq7Rs5A2m7rh4FkF0pf1Hvv7p49WagGcbCcMUxtrsqKyM1IhLxmPoqDESTaFyxZ
	 W2FY++yTO0SJl0Nltr6ZaXDpqks/NHq8ymjmcMaaIHaY3XxDPxoNdWRU4Rc0etYGpKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AHOrGHa3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9A8606D840
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AHOrGHa3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6731F000C6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592331;
	bh=TLfdLaAUVLYd6fQ/6w4Lz5M40jHznIS5PWWPQ+bnEik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AHOrGHa3RR3bIuxBKQb0usafo01oLa4TRvcYVtcQ339CdsVDd7oKDUgRKahZ29O1p
	 Z88zPIcUQVGNWxWM/uSxjDpHB4Me3EHuulsHzsWSEKjVHWafiFhgwDh8dM0Ie40Cl+
	 9YA6tvNpWvKHTU+eE9XbNOn5SR0K6I+7ce9GJhRzSv/rdKeOa6MvhC3f45xs2dXR18
	 LRsVPWdFHurRzqNL0DYOJb2yAT8bpy8wjwX9AJM5hdTSCWeILYyU5V07Jb+DLFBuGZ
	 Rb7JsG+DpG94KdSFCIMyf3MioSGYROhyq2dSU0bm1DOu2oAT/04w68Lm1K56Fz4PGd
	 YL87JkOe8tSmA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be416e603cso1309483e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:52:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEMMwDV0puRSi2c5+wqeVG/pXktp18HBF3H6QoncIqMtNdSpxcW6MkFGiQ7bMWxM8hQXrcm7VoHA7bQVyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CtlenUsChyCeZT6dKXk89K7y986+s76lWgeU7xx3o5If6efeH
	sUWkKb+meo+wFSGEkVEVl+POLUbCDEt54nJFWREjbYWockRuurSgwvd33GnXr/Ef78SyRByaYDR
	jxPkBk4JKVOTmlFSPsyvtyde1YxHFIV4=
X-Received: by 2002:a05:6512:32cc:b0:5c1:4e17:1ee7 with SMTP id
 2adb3069b0e04-5c170b67a73mr1455562e87.57.1794592330111; Fri, 13 Nov 2026
 09:52:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avdHa2nh2QNmbiOM@sirena.org.uk>
In-Reply-To: <avdHa2nh2QNmbiOM@sirena.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 18:51:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLnitCp=jodR0r0ndEjZbkpZeNBdJYzNtWStHXnVdCJoYA@mail.gmail.com>
X-Gm-Features: AclHuK8MLdUCyhFEjv1MkVZK8OPB5YIGVQI3u9mpreDZXUHsybRiZjbCSCzAgfQ
Message-ID: <CAD++jLnitCp=jodR0r0ndEjZbkpZeNBdJYzNtWStHXnVdCJoYA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To: Mark Brown <broonie@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 6:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/drivers/pinctrl/pinctrl-scmi.c:425:22: error: no member n=
amed 'function_flags_get' in 'struct scmi_pinctrl_proto_ops'; did you mean =
'function_groups_get'?
>   425 |                 ret =3D pinctrl_ops->function_flags_get(pmx->ph, =
i, &pin_only,
>       |                                    ^~~~~~~~~~~~~~~~~~
>       |                                    function_groups_get
> /tmp/next/build/include/linux/scmi_protocol.h:806:8: note: 'function_grou=
ps_get' declared here
>   806 |         int (*function_groups_get)(const struct scmi_protocol_han=
dle *ph,
>       |               ^
> 1 error generated.
>
>
> Caused by commit
>
>    b5848e117035 (pinctrl: scmi: give no groups to pin-only functions)

Argh my bad I wrongly assumed the commits were independent, not so.

I've backed it out.

Yours,
Linus Walleij
