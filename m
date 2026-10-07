Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC443B9DAB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373361; cv=none; b=M2aOCrW291MAY8KVRdcBOwZGQKZ98s4HT5isyunY4TbtTvxjEItHbsFNVUS5Er5wCs1lfDmbM3WvEtkqAV0PzXlswye3pdn3yAhjXb9PivKCP5S5rVYZvtVVcmdzjCt89Bd0R/TgwAJlCKMZoITnhsfQFrVgqotUFGFdtRZTiSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373361; c=relaxed/simple;
	bh=ZA9NOgmrvX40bJArbpwfW7XATqFagxk7+begPN1XXr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRVuO8Tw5mlTW3w6sVrNgqnkiGxolHC76uFX15Sk6mavZMHUT2UiGQDr3loOuHdYbqi19r+cQgPR44/VZkab2o3uwJ89mQ/IaD7lfr5a5UityyC9c6mMmeH7qHDd6rnv0TaKlN7l5swmWJaNPKLADMav/ricQXhhV/BZhumxBWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coPLoxwi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coPLoxwi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CE11F008A4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373333;
	bh=ZA9NOgmrvX40bJArbpwfW7XATqFagxk7+begPN1XXr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=coPLoxwiHy/rhvSGNptLPSOdnfM5FeL9O7GZwjRhdIyKzpAauG0qxwlNYpBn/tr5/
	 fm0HPfKqb7ugfFYuZG4xlmj26ljHAfBmiDpnl1e14Cqqge3pTBey2ta9thqud+4Csk
	 WCC4jdYpWsTvHteeHz9HwedTM5t3yUBwnp8bIvzSCaZZzxQDRev/VJrPIODBSDspGb
	 KuiVc1p9s3OUIo6jIt49yWoTJtth7343U3cBglgZXb4nBl1Lx3fPLoP7Q/UtgTwyBr
	 1BPZ7v5O2yUb2D0BPWG7fa4gg4W7Ae+wl+its76AxpjBhBeW6ZRs+DOzjUhn35z3IW
	 JpxQbwGtnnC4w==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bb7c8f6501so993261e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:42:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBQO7fb5e77/PvASMq9vprvBNmC5F1NUUEfTBYDQqnZFehppiQOsINL5MRnmqjmJP3klG0ZBHrw2jDsw0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlTepIUwByJUkTUR/ZOGAlJMxfIsdPw8a+9sWH4Qy/abqqSFVS
	cXV7wdiK0vEt0MKdyEn1hzay/YP9X/o8KhfTWPKDqA1uZCh079VAa6xMM7xJaSq1aUD17wwf00+
	hs+e/WW9KLxhxlUDcS9GxoiNrPRzqHew=
X-Received: by 2002:a05:6512:6d0:b0:5b8:f3b2:429b with SMTP id
 2adb3069b0e04-5bcd0739e4emr797570e87.52.1791373331700; Wed, 07 Oct 2026
 04:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com> <20261006-b4-cs75xx-v2-8-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-8-b7d6e1e24d44@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:41:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLmnhSoEoXRZWTwFXmH=5rXXj2-LVZEtXNnEGK1W=BJhCQ@mail.gmail.com>
X-Gm-Features: AclHuK-cGfMV3wC_JnZ2yidK3ahYmAJBUguZTaFkKK4-5UvxJ1sv8QtWH9lA1fg
Message-ID: <CAD++jLmnhSoEoXRZWTwFXmH=5rXXj2-LVZEtXNnEGK1W=BJhCQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/10] ARM: dts: cortina: Add CS7542 SoC and
 Securifi Almond+ board
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
> Add a minimal description of the Cortina Systems CS7542 SoC: the two
> Cortex-A9 cores, SCU, GIC, global timer, private timer and watchdog,
> PL310 L2 cache controller and the four on-chip UARTs.
>
> The peripheral clock (APB) runs at 100, 150 or 170 MHz depending on the
> boot strap pins. Until there is a driver for the global control block
> that reads the straps, model it as a fixed clock whose rate is provided
> by the board.
>
> The Securifi Almond+ is a touchscreen Wi-Fi router with 512 MiB of DDR3,
> 512 MiB of NAND flash, a QCA8337 switch, QCA9880 and AR9580 Wi-Fi and an
> ASM1042 USB 3.0 controller behind the SoC PCIe root ports. For now,
> describe the memory, the console UART and a ramoops region, and reserve
> the top 64 MiB of RAM which the vendor firmware hands to the packet
> engine queue manager.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
