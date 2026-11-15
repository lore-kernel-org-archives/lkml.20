Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781692;
	b=Apilzd6HWv8zfy4AmCNDgtK8+KZczk7QwksRTz39qu0ZZ66RZOk7phIEPKdqbxgAZeYC
	 H35oVr8OLPCqO5EYyHyrA+4hnTXcXoQcT1WUSlimuJ/bw6Dab4iNGf0muvsABsijeDR68
	 IImhTlvvOKGtxCZPGDc6dCkS5bprmW+W9q1pbp1RbeFvyfp3sQCFdrVsnoQXjwkyCEiUr
	 g2dFd0WHqC0Yfonm8KHOyO+d43RMegTweJSnGnbdrtbZ6SGHeyH2OyUVVxBzoa3w6FiR1
	 adnkhOQlT/v7ioRCE5SzXLazJegsWrQUYKy2ctKyLobwv3Ri4VCfJTHX3uh8n3BYNJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781692;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TEYwC0yd2Q6rJp4otTipe3rkKTLSLdWxD7WurCB1Zgo=;
	b=OPO1Ojd5sdPbVs8p/ob+SNHLjttRM37Q/fnP22X9gCdVVd3Cwx0P55a+LhWoOazlZdzk
	 zdDunpt7blwzAfz+Uaw9VLLGKIQHeX1uOTrYX7aUE2R5BOh93uHyz/MGPk4VoRAQym6uo
	 hkg/f1t5DSKhMxzn5PmiN/nPtSmQWiTa45PGRvNRI778yT+0Bx4Q8yaoE7HSzGJBkM1mn
	 9okYkiqOuTt+4ecxzw9FhZ5UK3DTQzl6Yc3r3I2lJxf42zjE0SNZeH7jmFWPJduB34kSh
	 OkhpjfsXvbVaAj5uCqOZE1T+9CK7Vb20nmPp12EwtDs2TPm78n+/K99M4QdOdP3ScWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NWVzejUX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013F9606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NWVzejUX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C211F000C9
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781691;
	bh=TEYwC0yd2Q6rJp4otTipe3rkKTLSLdWxD7WurCB1Zgo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NWVzejUX9qF0XoM4VmEyXPZSxIG5Fs6unNadjPRXKBSH+vjBwWuW9IwsP2UD1Jyxh
	 N4DWmQdek5RNSEdOLJueNW9tvqDthvnNazJBw0TiF7oKW+Ke/20zMucQiLpYLKA5nO
	 3jDVSQIj1Uzg7SYszycMfFEzP6fakMh9E/SFLUMyyl3Pw1POrN19p3pgZdlMG1hBfl
	 uDu2Fs2NFFfeBArnwiJLuecqZC8ijTgMvmd4rCgRDyv0DuRa4QKIeDtU1FGrbDm1fT
	 9x3ewZn0T3RJPSLbtwwWddaebGc7zSZ3YdLKxYfaWHR5eABuub1dS5nx5aZcMg9Q0s
	 IUuDfWmSm/WOw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1895706e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:28:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErES4p/EUeTm17Gmq6fTiSh0kWR0PfRgCYpPev0GJGL/6143Ty32AIFd8BmIJ62NzSCgTUPgeBCkWv1Ozf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YQJcba4jwgtJoBbvt3Yb9N7zdblUDeQNr2wg0fJ3odBP80r2u
	gEAxdROl3nHThUQVyMh5dJx7WjFrHtQtx7kVncFawNXpOi+/Ws+EMmxq5mGlNDUgRkHB84QiCRZ
	G1MBLQ9o36BtrhgK3g7nmv2/x7g44g20=
X-Received: by 2002:a05:6512:3f04:b0:5c1:4cab:2d03 with SMTP id
 2adb3069b0e04-5c170b2ecf5mr3075860e87.63.1794781690375; Sun, 15 Nov 2026
 14:28:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com> <20261114-b4-cs75xx-v7-4-8f17f38821b4@gmail.com>
In-Reply-To: <20261114-b4-cs75xx-v7-4-8f17f38821b4@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 15 Nov 2026 23:27:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLnu=ycR+_ZXW2K54oeDJMCfybdSUDVOTJ5B=rFTiOnjLQ@mail.gmail.com>
X-Gm-Features: Aa3M54oN7V3Y8V-EQUC0vRGZ-PhoQTaP6aUjOIuJowZCATlHdfiiGxoj1XFGWNs
Message-ID: <CAD++jLnu=ycR+_ZXW2K54oeDJMCfybdSUDVOTJ5B=rFTiOnjLQ@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] ARM: goldengate: Add support for the CS75xx SoC family
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Jason Li <jason.li@cortina-access.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:41=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> The Cortina Systems CS75xx ("Goldengate G2") are network processors
> with two Cortex-A9 cores, an SCU, GIC, the Cortex-A9 global and private
> timers and a PL310 L2 cache controller. The family includes at least
> the CS7522 and the CS7542; the CS7542 is used, among others, in the
> Securifi Almond+ router.
>
> Apart from the vendor this has little in common with the Cortina
> Systems Gemini (SL3516/CS3516) supported by mach-gemini: Gemini is a
> single ARMv4 FA526 with Faraday peripherals (FTINTC010, FTTMR010,
> FTGPIO010, a 16550 UART) built for ARCH_MULTI_V4, while the CS75xx is
> an ARMv7 MPCore whose UART, GPIO, interrupt controller and NAND
> controller are different blocks. It therefore gets its own directory,
> named after the Goldengate codename like in the vendor kernel. The
> Kconfig symbol, ARCH_CORTINA_ACCESS, covers the whole family and is
> named after Cortina Access, which last sold these chips and also makes
> the newer 64-bit parts.
>
> The generic DT machine is sufficient for the platform, so only the SMP
> bring-up needs code: the bootloader parks the secondary core in a WFI
> loop that polls a global software register, so boot it by writing the
> physical address of secondary_startup to the register named by the
> cpu-release-addr property and sending it a wakeup IPI.
>
> The CPU is a Cortex-A9 r2p1, so select the errata workarounds that apply
> to that revision and can be enabled on a multiplatform kernel. The PL310
> is r3p1-50rel0 (CACHE_ID 0x410000c7), select the workaround for its
> erratum 769419 as well.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Looks good to me.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
