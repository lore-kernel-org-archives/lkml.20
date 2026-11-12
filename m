Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515222;
	b=tRmYNogdt0khIvgkh7U2wDhNUZ8JmT8FVwqL0DCY/BOAxCylZK7XyhBi1NOVw1nnUb9d
	 3wmlZd3mNz5/hm6Z8mhT9QsTaL+EEi37vA3DL4vbnVjZpUE6OruJ5CEZ+gjv2+kas08Iu
	 ZBKxLwBz7p3BqwZiv5YW08DyKtTdsFg7LBDLj+OxgFwCGl8y8S89U07K7kYwhelwSG7XQ
	 VXARVnflhsVtOSdoIv90Sm4cqgvyG64mh8oATqkCLEvwxHNYEbKjLz8dcmoyNO/tkxh8F
	 RW3UMs2hgo0jpMJZGUaYGwCvXSYLCHpZdLOWdddIlIOiRbsBX/B3KmH0e+Q1MSpA5+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515222;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Chb+aEEpnG9wBgADB7Efz085hxxOusSroeCKPcg1AC8=;
	b=XnwhKZouBEy1uncEuZaMM2Yr3M5phRha+hcOG08YG03492t5WijjUW2XJ5/uOe9PI/6F
	 NLyBJmWPmBuNWpGqROlAzmAGBdXPAC1c4g21B16HaTnfs/xQbE3wsTwOg1/NPDnp2Ebqy
	 9Jf1goNaWKQT/6balQrThHjjNN6N5kKdNrUE1MYKlAmgSydgpP9LlwKr0n5lsMMotZvBG
	 386QOaN9w6V31w63cQdtPp5TYbLCd5TNuz2HaVjVmjeVt6bgLhrwRvM4XSdquVdCNs/3x
	 dy4zts/Tnzr8EEyu85Uxf50c4KDm6upGmx25yDQzunSMpgAiLtTCiWZWO770lgyoGDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ATS7JxV+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4503606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ATS7JxV+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C521F000C9
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515222;
	bh=Chb+aEEpnG9wBgADB7Efz085hxxOusSroeCKPcg1AC8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ATS7JxV+6MOYwgHE/fLNQPwuG223tWr1KOngzRgaekXHsU4DJdzHclPmAbxImTcPm
	 0snevFacJ3pbQQmQRHAOlwm68Qcp2ol6/HtHkGUkiNQYM4vKHH2FAuhohEyhPQIctu
	 z1afVrI2bUrrq0yohQo+t0T+1o13gdkF8GyxO/Z15AEu4EVUb4j+JEWzHZdNRaGWPX
	 eET30KhaCHdvY88RiUcaKJbFk5XUcnotxW99pOfWQUUXPYUExxefQ5FSb+yPoE+asm
	 MYCF4D8+WJH5cwo9khl5KY496S/qJAj5McGOJFIzKaVLkIH7Ub2kBdOjOFRp0gUl89
	 1kniHJQKMBh8g==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ace304021eso1621851fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:27:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFe6zvoZpG0DT0SeygVN5zFOnVsbkvBewY+p799HeMjzPxVr6kgIRr5il0ar/4KUMXJK9fjS2aJH712XdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dqMIP49jvQKqG57uu1Waex5QKXuAfyDpkvg6ImXShxptHYNX3
	LdHx8U07WvLSCYwQXB3UKvOZdj6qp+HII2mxSJz1zOoyDC74nWa2Eydznb51Alxz65Bjq4kryat
	a4CpAv1hTnSxsOsCxvJajfI3aekjwxnQ=
X-Received: by 2002:a05:651c:a1b1:b0:3a9:a2fd:5931 with SMTP id
 38308e7fff4ca-3ae2b4a1ea8mr2084711fa.6.1794515221502; Thu, 12 Nov 2026
 12:27:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d9da17af-f49e-4878-a8dd-59a8919e6930@yahoo.com> <9b7b42be-6cc5-467f-bd01-62ab74de3523@yahoo.com>
In-Reply-To: <9b7b42be-6cc5-467f-bd01-62ab74de3523@yahoo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 12 Nov 2026 21:26:49 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6rq=+NOD9U1FZ+wnmzUQDzF7sbebp1qvrRTMYnET1CQ@mail.gmail.com>
X-Gm-Features: AclHuK_hp8KGOjg2fIYGYRM-U9txeKytgoHXjAulH_X4Z4aeAayp8jUpHXZ6IgI
Message-ID: <CAD++jL=6rq=+NOD9U1FZ+wnmzUQDzF7sbebp1qvrRTMYnET1CQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 10/12] net: dsa: realtek: rtl8365mb: refactor
 L2 MAC handling
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk, 
	luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvin.sipraga@analog.com, gusfmora@gmail.com, 
	kuncy7@gmail.com, fabianotassotti@gmail.com, gabonpivovich@gmail.com, 
	contact@c127.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:40=E2=80=AFPM Mieczyslaw Nalewaj <namiltd@yahoo.c=
om> wrote:

> Add L2 MAC pack/unpack helpers and use them in the family C
> serializers instead of open-coding the byte packing, since the layout
> of the MAC address words is the same for both families. The now unused
> per-field MAC masks are dropped.
>
> Rename the family C serializers to rtl8365mb_c_l2_*(), export them and
> reach them through function pointers in struct rtl8365mb_family_info,
> so that a following patch can add the family D layout without touching
> the family C code again.
>
> No functional change.
>
> Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
> Tested-by: Stanislaw Pal <kuncy7@gmail.com>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
