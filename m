Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564885;
	b=PIfnWzvB7ok22fofub0ZEXBAXXW38nyLxaCozIy0dz9t3e2agIEj2J7Y6omID78h1es9
	 UzLwtyojX36eDRLz4CDq3ntZZwG36Th161riqiY7XBFshMkxVj/vLd9L8z7U/xY8bvgWw
	 2RF77pPtzGxC5HUqTnfaNWu757cDSBdXNe51oMBMBFZh+GgosB2RqzO7zpQmLtF2wP/dB
	 O1J+R/00ZwqHLvcZVPGKejYbozJ2sDDzpy2Tyd7pr9jGEVrMKdg+v4uZ9vI9r7eDtUHXJ
	 KKAT0oWgonCj9gK3Kj5zV1cpWL1k284NaRQzgS7UDvGLnuka7MhmAyPl2lhHu2T3K7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564885;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6UCpMdG17TsBHLaWxB9607jb57trolViWOW8saSDFIk=;
	b=uLatb9H5qP6Vx3eju3F/Y8IOS/VWgdQ8KSHVniG7fBy5/aiFuowP/7UTh/gn9WIDbQxF
	 FCT+Lj2rl5kt4KJ4gypkr+w4TBQBGkMv/7vwVKHshdyFI6UFCTaX5jP7H/pcx58V0hkeG
	 /uOXXuXOhJ4NW0MA4+zfXpMppGUXAu6rzSnnM7CjqxViwzxc+uXROu8SZY0rMHCX+PcN6
	 JTLsTK4aCXwjKznkz+Crztj+PuwBuRoI9P6DH326dsY5nPuxP9N5ZZvd+ynReNKtk6xKX
	 gHHSSpjBw/EMWnkS5l7AAVlYd4zZUnA0Btjv9zUG3xRj47S/DPSGG6h90sh9ATBJyzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bt7ogS5J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B725A606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bt7ogS5J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541E51F000C4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564885;
	bh=6UCpMdG17TsBHLaWxB9607jb57trolViWOW8saSDFIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bt7ogS5JyehS4JxScQVm0sHvkUUYe0Eu1k1IZvY+sEkc18DyCkew3RhO3gVzHlzT9
	 WLHSXtT9W5jQvAk5e1xQBvW2LOcWd+Z21NIoRkbz5CvnVNvyz9ILDbjx+5fdhP4vPJ
	 ogU+oWqvmfK5bVZfEDkuMwbrsXeHYZL5Xcj6kGkJSGlCtrQ4lRzOy7p/Mm0VDdqlVN
	 1DBZII00K0HDkdiXme2fW4VM4JdkL1BYS0m8SV2n4n58Yxv72hlxmh0YZ4xQ+2QDRo
	 UTGnYZvhbOmR8ohAermOtiBnC62kDFjE6z4dTvrBnyqTKr/DTD85RsuNlGOJMlKNDN
	 xGsVf+AWLG0FA==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-716ea2598eeso1039284eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:14:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHzy5ROkWCs94fZMwduKqLQZYPW56zWcewry0GdHb4272LBJTT/VJE0XL7BTxfysOGsNTr5cNBunaw+UCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z80JWoPfvhFBomF+oBMKwUV/VZifJBEoM8CbhfFa6C7uHFXpuJB
	Hna3PNcoQDGeknSgBN0XbXs5URxTWqfRS//rSfC6fAJvANQ0k7sz7nbiwxkOkYbRtxT95TRmtYI
	zyBg9Ib/j3V1muBrUcLwgkMtl4Z/WId4=
X-Received: by 2002:a05:6820:6fc8:b0:714:b51d:f512 with SMTP id
 006d021491bc7-71ab4fe25a8mr1039390eaf.17.1794564884552; Fri, 13 Nov 2026
 02:14:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:14:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=+WPam=9kJgCcxjTUDh5AD54GCAjQp5uyNt+gqsVxsXg@mail.gmail.com>
X-Gm-Features: AclHuK9TruFFk1ZreyNiLZ_y6WML95I33IY0-K9MfVGzsVGUebv2rlx1RB9oHqc
Message-ID: <CAD++jL=+WPam=9kJgCcxjTUDh5AD54GCAjQp5uyNt+gqsVxsXg@mail.gmail.com>
Subject: Re: [PATCH 00/11] pinctrl: scmi: fixes and GPIO function support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> Five fixes: the drive strength went out in milliamperes, the schmitt
> trigger enable was mapped to the input buffer, the settings Linux
> carries without argument went out as disabled, a setting the platform
> reports off read as set, and the protocol layer read past a
> PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer.
>
> Then GPIO function support: report the pin-only and GPIO attributes of
> a function, give pin-only functions no groups, mark the GPIO functions,
> and select the GPIO function of a pin on a GPIO request.
>
> Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
> the schmitt mapping, which the platform does not implement. An LLM was
> used to review the patches and to set up the tests.
>
> ---
> Cl=C3=A9ment Le Goffic (11):
>       pinctrl: scmi: send the drive strength in microamperes
>       pinctrl: scmi: map the schmitt trigger enable to its SCMI type
>       pinctrl: scmi: send the settings without argument as enabled
(...)
>       pinctrl: scmi: give no groups to pin-only functions

As noted:

These four patches applied as fixes and I will also get them to Torvalds
for v7.4 ASAP.

I think we may have one or two more SCMI fixes that need to go into
v7.4 but it's good to start with these.

Yours,
Linus Walleij
