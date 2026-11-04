Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799233;
	b=rJj3qNsQei9JaGa6TfFzIogBNAlFBdh+YK71wVh6j6bgHEd3q/VtkAljTOHf5t9Dbc3Q
	 0YoauWogJTCQfzg0aEMqcSm02+VmxrdywfhA3KgMBKPRMb/uvS/FrI8QEFGEAkMscYUnR
	 RIcacTjMSlxTjBivUlDusQscnXX1BslA6kAl0Y+07phi1sWTKWBULzekk6bOvTYxkr28d
	 qPFifrMVSqLMFfKAlYJUDKXDsSE66PcE/bmUQPNd59A0MQt7KGT8hzGOgl+2Lz0wHQdIw
	 XSdlJp9qbWcozDkvixyUzR3Om4m67o2m8ziZT5bwpYIuKjcUzZrVM+jc3RDM1QwWKnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799233;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PVt8UCw+TfAqWXt7c7OPgRoChv9ewjCNpbQoQTiOBig=;
	b=Sis97tRjiMv/deBR5uur4yF1TwXsTzTP2I4nyH/9fHmYyt26mvKFuGGFLX7WuGwQEC9c
	 YE7hJDnNun7bVyCHAqxbvEvA9XSC4gv/LOdYhiYlg6MnUxsHESdpLbAQnMRGg1sgfMtff
	 QLt3GdyyK2wjrxJ1Ut/3zfLL68tM4fwxBqTYUm3RQbRmQmDj98b8qjwJiqT0FQoCq7yG7
	 dv7e01/h8JorgLJRmbynQa0L5rOzTwEsAxqhIMjmi3mxvhyR9X/v/dY73yvZ2LQeZHMSJ
	 pVN1tu6q+qLUHLGpUPkJrURJ1Y50UCBqm7jXgnxloPPZSXRmKxuWR6OEbTkuOEHsy0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGTSKrQJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7265E606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGTSKrQJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2ED1F00A18
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799232;
	bh=PVt8UCw+TfAqWXt7c7OPgRoChv9ewjCNpbQoQTiOBig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QGTSKrQJZwvpkv6xFfz0xFpKlNVtP4IK1BfiXeQlkBVQ6YpCZb+4w+AIpjnfEf1tH
	 VW7jpzxPeJR+cz/0mhnC08zU0vb+858lpSZcXddoeFFmXxUh6w5fcTMeC+OFrg3rwa
	 rLWF8zSLHdoHy1ZMl8Mhm1Z+bUHsQ+qku+EP7tcsa8ZsfX2fGyHma3QOt9YCNDlRUY
	 D0KmuY1V1sL/d81SulJ0our/LUyNUT1SMhVbuWXBTQ6tR1hZsJyBEYV+w7pzgn6v8K
	 bdTsAvciKTRf+2QE1Bxgt9XIYIoiEkgeVE0j96kbjgpfpiZ3FDhAxYXKxxtyTMqPDS
	 EdDuOZd9oFwJw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso8483771fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:33:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwjHXb2hwgoAYV3vryMEfeiiVyhOH9USU61/gh2ci0xx7EToCn0OyRBZVdPEqU/vLyr94yNcAWJD54ZFV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+BTPnnz0qEzOXoyNk7qiJ2QsmfG/n4xG/GXP6VvyJN8PjGsN+
	qtaEYsMyTKahpLAjLwwRgcjm9gL8xTyzA6M8Iz44j+EhU2nyLWRH8SZxez12Qu4M7OxDpbP+LvX
	bOOYW8KW+fRgldKxlLIBTSNW/TQ4zWDA=
X-Received: by 2002:ac2:4c52:0:b0:5bc:e472:12fb with SMTP id
 2adb3069b0e04-5bfd957d05dmr5285778e87.63.1793799230807; Wed, 04 Nov 2026
 05:33:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025184335.447963-1-mashikiselby@gmail.com>
In-Reply-To: <20261025184335.447963-1-mashikiselby@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:33:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLmTOFRxSrnq3eXYR0QhDRGeRuPYNh141pByURXYv2CdHg@mail.gmail.com>
X-Gm-Features: AclHuK_037ZYLwttHJYLlMk8ibW1pzsmDenfg-_6QVl2MfQ5g6KsS7LCgDFaJ_M
Message-ID: <CAD++jLmTOFRxSrnq3eXYR0QhDRGeRuPYNh141pByURXYv2CdHg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: fix fwnode_handle leaks in
 npcm7xx_gpio_of() and npcm8xx_gpio_fw()
To: Selby Mashiki <mashikiselby@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 7:43=E2=80=AFPM Selby Mashiki <mashikiselby@gmail.c=
om> wrote:

> Both npcm7xx_gpio_of() and npcm8xx_gpio_fw() iterate over GPIO bank
> child nodes using for_each_gpiochip_node(dev, child), which holds a
> reference on child during each iteration. Returning early on any of the
> error paths inside the loop leaks the child fwnode_handle reference.
>
> Additionally, both functions call fwnode_property_get_reference_args()
> to parse the "gpio-ranges" property into args, which acquires a
> reference on args.fwnode that is never released.
>
> Use the __free(fwnode_handle) cleanup attribute for child so early
> returns automatically drop the reference, and call
> fwnode_handle_put(args.fwnode) after fwnode_property_get_reference_args()
> succeeds.
>
> Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driv=
er")
> Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driv=
er")
> Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij
