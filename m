Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515166;
	b=3LLqpm2hZntvgTrkPtOWeDZg0bWBWQv7vUMTKAokdlwkbDHZKuRz66kwDudkdnqtUZM5
	 CsmoW4TnRaFEBDXhRtOhA+7RWAcsNJbufqj6oaJA0ZoYf9G6mx0kthPRiWBwSS7FxJ9Gu
	 GPGjGrLujNwUf19bgiQWtl2bGCJ6aPORxmwaKcFBYPqEZo64tg4P/+CqLneZepgnnFsol
	 WIyKoaPpF8S1vgz8riHrRjUEFMU8T1NYtMuRHjlaj/KFHDiBPNOOaDKEWdoHPbJhj8AEz
	 TIj4CIIHNp0FZuo9fSVH5x7pIqxx2SDm6w2PhNJJ5vLHif2uMXwhypGo4Su904WsdDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515166;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JZns9HamMNcZdpHYP/qFBtvpz2do+0TqTxyWCFjtrBo=;
	b=MSK2FJp5W3OxXH7WgrtE9wNuezBYkq4p0ZMwhqtaySlEttxzJklVx0hTt0Ozrd09Xk41
	 6W1CieAM1fQ57TizPwpS/M5DQgN5cnIUk2kMhcxJfl6n8C1glsaEdyXNZ+lGjhGXSuhVS
	 GzaGIg/pqcC83Z/nb08rfCG23OUHt3JbWiYCYgmRLlYXvrWEgKFdjwY4EhE6FtVb5IT7R
	 EmlX+mhED6cyRhwJCG3ebc4RIzN4AU7zf12r/47ZM2ZJkXv+nv5x7ek4/L4aIKr6PeTFS
	 EOHBgPdz6j8hLg7ekbaWaSb+aMq5VentKIPVr6+q4MiZEZ1+/bi+3q7uMapAZEH0p9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ayvBxNnY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01013606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ayvBxNnY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23181F000D4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515165;
	bh=JZns9HamMNcZdpHYP/qFBtvpz2do+0TqTxyWCFjtrBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ayvBxNnYcfw7YYNC9qg6slBeEO0T1T3arnqugFZsmCBXvnvCOEmawy2hpAsEMrWRG
	 owH3E5b0hmwbDAXJdzYkwhfCQYjd7LK+5PWRYjCmAts/3Lt69HybUdOZL2c2jwVv+p
	 qjd0X1FF31/JIPM0tAp9R4iNaBxSwa3XL9abZXDm8MrLlzZjCfszczR8+wDz0J5kqo
	 oTS2AL1Tk9v0e+513akTwTQP4X98WkPT/ryTNkWwcDMV7EhuaTLWIEGA4WCDCn7QNx
	 3CUy1BmsNYe11TMo/KjoZCED4qMa9u5ShrMl16p03FTYWAz07ht2bHqSfneQRT6z4n
	 yBqgLbeuSQh3Q==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso172761e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:26:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGJshHtjtlSffyz8C+4gMorvFwOZjg4PGNtMcrrzfBqSbKfJk2Zfv8ZQ+DkPYwt6fMrMWpW2pqr9SD8HSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9laOHOgpi99FPjsRsxv8jCYQrwyJjzfs0BE1eE2GbOHp+/TdYi
	y2XUjrMhgDZE9rv17vRBNbvo54EzurJeyD2rwd1ZJGukOcoiXPMSWFttRpLDP82jhtWP7+VEpp3
	cX7S7JdxsV+EJ4ygCH0pT78rnk/LhaAs=
X-Received: by 2002:a05:6512:1048:b0:5c1:5958:a7e4 with SMTP id
 2adb3069b0e04-5c17077eaaemr175815e87.15.1794515164600; Thu, 12 Nov 2026
 12:26:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d9da17af-f49e-4878-a8dd-59a8919e6930@yahoo.com> <915a9103-82e6-4504-8d6e-3d12c4e7af1a@yahoo.com>
In-Reply-To: <915a9103-82e6-4504-8d6e-3d12c4e7af1a@yahoo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 12 Nov 2026 21:25:51 +0100
X-Gmail-Original-Message-ID: <CAD++jL=0AO5o_1vWb284Kw-NRvwzRXM1b38HLHbiBA+m39gS7A@mail.gmail.com>
X-Gm-Features: AclHuK_3uCaXSKEUAL81VQhKIbyG96aLPrYBXSXLkRKlO7m5dPPVTgpdDl6W-DY
Message-ID: <CAD++jL=0AO5o_1vWb284Kw-NRvwzRXM1b38HLHbiBA+m39gS7A@mail.gmail.com>
Subject: Re: [PATCH net-next v10 07/12] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk, 
	luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvin.sipraga@analog.com, gusfmora@gmail.com, 
	kuncy7@gmail.com, fabianotassotti@gmail.com, gabonpivovich@gmail.com, 
	contact@c127.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:37=E2=80=AFPM Mieczyslaw Nalewaj <namiltd@yahoo.c=
om> wrote:

> The hardware structure of 4K VLAN table entries has changed between
> silicon families. Family D's CVLAN entry is two 16-bit words rather
> than three: there is no third word extending member/untag past bit 7,
> and no priority/meter fields at all. The FID field is restricted to a
> narrower 2-bit width. The chip itself supports both IVL and SVL.
>
> IVL_EN (bit 3, versus bit 14 on family C) follows vlan4k->ivl_en. On
> family D, rtl8365mb_vlan_4k_port_set() enables it while any user port
> has VLAN filtering enabled (dsa_port_is_vlan_filtering()), so that
> static and learned FDB/MDB entries use the same key. Family C keeps IVL
> always enabled, as before.
>
> The stored IVL_EN is refreshed on the next port_vlan_add/del for the
> VID, not on a vlan_filtering change.
>
> Reusing the three-word family C layout on family D would read a third
> word that does not exist as a distinct table word on family D's die.
> Whatever data happens to be in that register would be folded into
> member/untag bits [10:8] on read, and written back on every
> read-modify-write cycle in rtl8365mb_vlan_4k_port_set(). Give family D
> its own two-word pack/unpack instead: add rtl8365mb_d_vlan_4k_read() and
> rtl8365mb_d_vlan_4k_write(). The shared code reaches them through the
> vlan_4k_read and vlan_4k_write pointers in struct rtl8365mb_family_info,
> so the pack/unpack code needs no is_d() check.
>
> The two-word layout matches the vendor switch API for this chip
> family, which writes only 0x0510/0x0511 for a CVLAN entry.
>
> Nothing points to them until the family D info is added together with
> the chip table entry in the last patch. Until then they are not static
> and are declared in rtl8365mb_vlan.h, so that the build does not warn
> about unused functions.
>
> Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
