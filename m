Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B053492E2C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764784; cv=none; b=lwOjK+asKB5QOUXtHKVpP6zta2nPI7USxPzi2KMldKq1MdUAUfarO7w0Bvjav3Cnv2L7SV8CTCY4M9ua2oX6CGun3h0zi8JiPdb9XRzL3XD4eqpNuVeuE2c9gBtUlN3FyqkF7vKuoluRMaTyndY0m6hh+xTshKXB1RDuLD5hhyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764784; c=relaxed/simple;
	bh=MljuINYsDSt6Mx+ws1xsI7mhRVCt9e9IkBdqLRkBIaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9wBmBQxuwWe10rkJ8M07++vsDE5et43GTglx+j/Bqny0YtYKbtA7dsXVSeILUkuaQTcW1kkfJtgV8jbsG0hVF8bfXcGXEP8cixw0fkttjW8gjbHIxP+iUc1FhGdKAUDWB/9thO4ELYeYI+JOHuXTentwT8TBPUps1eO93QRpCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdgVkpsL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdgVkpsL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D4D1F00893
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790764775;
	bh=MljuINYsDSt6Mx+ws1xsI7mhRVCt9e9IkBdqLRkBIaA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kdgVkpsLTN9PPbjs/FjH2VDONRjypKtQS7nnwPHqxETnWJr/EIYoC0vWaOAom+X6Q
	 q/zx7TavDdPeNeYWqJKLZFklyCeqbRF/FaACp9HQsP5uUz1EaSukQVe8Ykmph+J6r9
	 INE4KIbUL8xxS+HpCOYkNXcFiQWa8xv2aIitnFk0E1Sh36ZsFaTh9O7kLuFogi2Uhw
	 +Slc9ozKNkyEVuolDNZgpSbjVB0MpVVp0yYGAprl4+cohLWTbMr94e7A7QeWLhBdpa
	 nKnMDMc0yjuINPA9O33kKCcKB8r6l6lo5mKCQiY5K7qf46sUWG9IpMqj52KRAepNww
	 x6QzfqAMVZ38A==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5b2864f1cso44038001fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:39:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5ywNig0yS04jizYFLBCgbYc09nK1IWYTibs4Zadp+c6zBPQiOoKJMSJvfvc9emWK9DbUrvfLOGC4AuJY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkOXmXi4rfwCbdG4x5Z824b0sSgHqEVX1wlkzU4nQ5SzgFrXsQ
	IMOo5Ba7lJu9E31SIcFa8lYs4OnB51Bjwcm8AFWUWlUFop17Jdfui64ansrjRZqwUwGLVngqsE9
	p5WDhMUCZg5dQ0V2WtNE6LfOxLjfkjL0=
X-Received: by 2002:a05:651c:418d:b0:3a5:afec:9cf9 with SMTP id
 38308e7fff4ca-3a7791923f5mr3833601fa.7.1790764774294; Wed, 30 Sep 2026
 03:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 12:39:22 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0Zc939o7UaFgtx+04gLRmgmPVHTAeuW6OS9nPP5Xt8Q@mail.gmail.com>
X-Gm-Features: AclHuK8pjnujBafapCpTqZDZIjiOhJbKtLdqSmgcu4GAW7cTFljMh260Y9sM-wQ
Message-ID: <CAD++jL=0Zc939o7UaFgtx+04gLRmgmPVHTAeuW6OS9nPP5Xt8Q@mail.gmail.com>
Subject: Re: [PATCH RFC 00/10] ARM: Add support for Cortina Systems CS75xx and
 Securifi Almond+
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Filipp,

On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> There is no public documentation for the SoC. The register information
> comes from the GPL vendor kernels (Linux 2.6.36 for the Almond+, Linux
> 4.9 for the Verizon FiOS G1100 which uses the same SoC) and from
> disassembly of the stock U-Boot 2009.11. A full out-of-tree port
> (clock, irqchip, GPIO, I2C, RTC, NAND, PCIe, MDIO and the packet engine)
> runs on Linux 6.18 in OpenWrt

Is this OpenWrt fork public?

Actually what I'm most curious about is the packet engine, which may or
may not be related to drivers/net/ethernet/cortina/*

On the Gemini that was the only part of the SoC that was actually made
by StorLink (later acquired by Cortina) while the rest of Gemini was
Faraday IP blocks.

Yours,
Linus Walleij
