Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5E74734D0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373253; cv=none; b=ihfZsW9CZNoFMVz9gDdWl4qxSaletqrVtMCnucr/Rw1tWPZYQ3NvYWVAUD4DFE7YDD1W+6bNSmeB8pci6YzIx36VTARI3Y0akrOaZI8J3V7de6poURTVcFkBQW+QGAe7QhgWpyNyiXk37vispCimy9nIG1AH/kE3aQfDkeValkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373253; c=relaxed/simple;
	bh=fKOCvjoNQtwRqFI066qdcmZWGjZbp8jaY+FDxN7dTcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZajVfABINZ80Z84k5UqCeA+p0X/BwuQUVLBQUZgK2flY3bjKzSb/2AQ2QXLiVKpHbjpnw7EvShyWuyKsMBtCncv+3piuUrorU11jyLXH51eDmdqL3BN2npz7X5A3D902JhrvTVKbV9CUhaoHNrGpcE1NCO/6iHoMXIZzqfI8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i25gWA+/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i25gWA+/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDC31F008BC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373224;
	bh=fKOCvjoNQtwRqFI066qdcmZWGjZbp8jaY+FDxN7dTcc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=i25gWA+/BKLg3TJBUNxM9g1wPMz2Jd2k0rRtVH5gzvl0N+WAoLKmZgmomQI5MUIqM
	 QjhKugvm02ZHL4j71MoW/sn/NAtHgybdhk7vxmgchTSLfSrE8jSyX+I1RZfKlDj10v
	 jS7thfqmx0ZAh+FSeiez7fkJWNde5unlCkg18ttSR050jBqcvekEX7aeL8Ly4JXnkQ
	 A0cxXKUwk0X8WHPJ44sn6g3hI8HPMk9K6wEzTpBJAv8toRWbABUsd3j5exzGC/xWJP
	 2hCiKXjyoVxSoTIFIhvrSomoRqYtY3xdcVGOSApBa7BJJ0vnHRgKtJgmQCeaCwg/ST
	 SgEqv+I5eeTpg==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6df0b02fe91so1342236eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:40:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy80+6wjxJzMwWdsMXV2eIqjK9qdIQ+aScUMSESP/c5JdNpCC1AtH2EQus54QDTEAFUXQW4DWcRMfKOA+w=@vger.kernel.org
X-Gm-Message-State: AFuF++mNc60SYn+1fIn4F2MUJ5xObEcq9etnGnIXYIPGDJwbjLGcjSFA
	iAamHbqp1gEnEY3psT/mVSzt388AYoO5aSCVSXbhD0Ls3V92SANjylyWZsxlYvdlr2eCjyyvQLI
	3ceOxQbQYKA6FqH2YLvGvhNXxTnmR0Ns=
X-Received: by 2002:a05:6820:200d:b0:6dd:7f2c:2bb6 with SMTP id
 006d021491bc7-6e4a7e43471mr4207285eaf.57.1791373223883; Wed, 07 Oct 2026
 04:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com> <20261006-b4-cs75xx-v2-4-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-4-b7d6e1e24d44@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:40:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLn74bT_Fyr_Og-4UCHzesesgzDUe9UiFWNX2zQrJ92-gg@mail.gmail.com>
X-Gm-Features: AclHuK-Qje_8nYjYN9tMFCPYQzKct6wydoO2oDonV_Y-5ca_xI58bQphqW6iRzQ
Message-ID: <CAD++jLn74bT_Fyr_Og-4UCHzesesgzDUe9UiFWNX2zQrJ92-gg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 04/10] ARM: goldengate: Add support for the CS75xx
 SoC family
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

On Tue, Oct 6, 2026 at 8:17=E2=80=AFPM Fil Dunsky via B4 Relay
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
> bring-up needs code: the bootloader parks the secondary core in a WFE
> loop that polls a global software register, so boot it by writing the
> physical address of secondary_startup to the register named by the
> cpu-release-addr property and issuing SEV.
>
> The CPU is a Cortex-A9 r2p1, so select the errata workarounds that apply
> to that revision and can be enabled on a multiplatform kernel. The PL310
> is r3p2 and needs none of the PL310 workarounds.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
