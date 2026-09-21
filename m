Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCE74746A9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986711; cv=none; b=Qyw95rkFv5agKMIK5vX9BD8B3AWrkXW0IAoYAQj4rntHHn0aGUkhtXQ29eHr60Ar+J+pvcosAc61HSW8myGnTD6OdeTleNm0OTZbnw/+G7b/7UQIPYHdGVOik3PAe8qZizvZ9f0rJuZf6UZVrb4L+/Jj8dmAAJwN/HlRtX5KNLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986711; c=relaxed/simple;
	bh=wlyZp0Y8DtkcpxZgedsAGdv5R+a3YrLHF+oXTMTBElQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQZjxHfu5/PiwjtalFMX3ZinnRSuksM6UYEIf+ja1xfqRNNwQ45I4F6ryqKwWGdUMInbXAMP0vpypXrM/0iULgGrGVF1HLvKnX09pghdGj5KnHCXR0g14+3vvbOsyM6dnttmt+a+Z8ys0fLm/MSDmhI4pF8v1cqvVYtBX0VoKIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPU9tO8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPU9tO8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AED1F008AB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789986708;
	bh=wlyZp0Y8DtkcpxZgedsAGdv5R+a3YrLHF+oXTMTBElQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VPU9tO8HyjXQg9hPxqUgoZx3O6CP8/01/4vHCoV9a260fK4Edl4qoUs+qxH+0w9mU
	 /5PbomemBtITMx8M4jPCzMgYYqXJj29ejgQxRuZ7nfDXRhpvSCnfAfq0PzVuwTrsSp
	 zXUnpRfk0O7lMWJs/JP+bvv+OxbUdcmSMVhRYtRNjZ/sYH00R643AQ46wExjKB8MVI
	 W+OaB1cE9LYQ94n+pR3PBMMrsDzAAic54alptXlheNRDRm6xKvkbXgplTsQR7wCyIs
	 DRqjS7+wMN3k2cvyOY5A49srIrlgWXZUGdYkRX2KSEmgR8Mpx84plERTRO3wh5SgAJ
	 5V5AHaHTG1cww==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a3156692c6so18159421fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:31:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByfnCkFbMDS4ka+NRpRm7gM8OgEhGrDTeC3a/ZRIFlxHM8aqzafIyka68D1Or2V2FJiBUMA7aX3Iwzp6sw=@vger.kernel.org
X-Gm-Message-State: AFuF++lXkw4nwCpp6fFuEuahHSXOXAlkJsVbvh/psf/jCJ2JZ9h0AbfD
	fp9HMwEEsvZXdGgSNYyppDqYbg63IddeMvJ3ns3Of0hyQdKZGPYa5o8qVJ+x51IuR3eVm66G17Q
	lk2QXxLTpfdoOqZVZfv19QkIjcDm1h3Y12Anf1EnMow==
X-Received: by 2002:a2e:be8a:0:b0:3a3:74b7:fc0e with SMTP id
 38308e7fff4ca-3a5fc03636emr22688931fa.26.1789986706801; Mon, 21 Sep 2026
 03:31:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 06:31:45 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 06:31:45 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
Date: Mon, 21 Sep 2026 06:31:45 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mf-0oLOPZsPboE0dzOGE2AzNE0LXmv9fcmgWO47FtGu1g@mail.gmail.com>
X-Gm-Features: AcwNN1UZiDNcMAJ4MNmlX-UMIL58DwmKhOHQm7KWs4DW0jTpzuluxkWRRETFZSo
Message-ID: <CAMRc=Mf-0oLOPZsPboE0dzOGE2AzNE0LXmv9fcmgWO47FtGu1g@mail.gmail.com>
Subject: Re: [PATCH v8 00/18] Ambarella CV75 SoC minimal bring-up
To: longzhao@ambarella.com
Cc: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 06:23:19 +0200, Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> said:
> This series adds minimal Ambarella CV75 support for early bring-up with
> a serial console: DT bindings, RCT clocks, pinctrl, PL061 GPIO via
> gpio-regmap, 8250_dw UART quirks, ARCH_AMBARELLA, CV75 EVK DT, and
> MAINTAINERS.
>
> This is a single unified series. Please apply via the SoC
> tree; subsystem maintainers are Cc'd for their pieces.
>

As I said before: this brings in a lot of potentially conflicting code into
drivers/gpio/ so I'll need an immutable branch to pull or I can queue the GPIO
part myself and provide an immutable branch to other trees.

Bartosz
