Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D95E3C9ED0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343026; cv=none; b=rInD2JKlsIvdrPUwAiiwqoSIcxaf3QXIChZca34tWPevA405xgtigO02hrPbjqddAaWgB4dMCfhf8BBHOS6+tTyllbXOxj4F4NyuZ8HG3o12v7dnXfIFOif8XTDZ9AfGbOwCIaAAsmJ7wIn0I2h9ZrCbybVcGdTtxzYtN5tEr+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343026; c=relaxed/simple;
	bh=/jFCjg6nDyLS94dvgK/EEMc/s+8n2QPDNYXmC3S7fXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=junmKRNyYgr8x5YVnfWdssu4AJoDTjNgzYIm1aMp0RK3pYJv7Q4jYcnioZ0hl/LMX4szl+rOv8M2FMpwo+6oQY0s3wdvwoL6yK1xEhoKJ89W3LE2Gj6YcX7xFtPpY25qUBc3lMFdFwD5b4DNJle/GyQaVR4rx8wgduCIfWF+1YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAXG6agC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAXG6agC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBACE1F000FF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343021;
	bh=hjEFWSQNzvV2cy7ibgDjEb2o00pPnzmhtpFfAirbXj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PAXG6agCyvCYWf/tSqGxDa9duEbYzyNcom1gf3z7PKaAHOcXVQq6dZEaWudWC45e+
	 /Fzo3TCxWAG9M8kZkBiOP+qvUXL5lI/R0RPbdgPJARPiwsGmJkElUbDQRClRd6nMt9
	 mxxZLuQMZNRX1LNmY++AmOx0uTtxjwvqjpi1MukMlfdSVo1MNleFQnbKcAkkrBh4c0
	 UtuDkvv94FAnLSvD1TLPO94o6HOCP+H2WEjW262DRJTXOSLBTQ9isCPvlFrAZgc7Fz
	 67dYwpSZUCDKrehPMVrvx4P7NtiMaud4UGH7UL7pluL3RqHEI/2FJ4DQDyWed96EyG
	 zR3Lz9kUnd+xg==
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-7f4f0d37f9dso383703a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:30:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzaSCAm0aYwhtUzk+c7Inpm6fosZqTr/KWAH4DnHBZYXX4bHWj+EkIPKZZ/TZKO6fyT7oR/Jkd7Rui57xI=@vger.kernel.org
X-Gm-Message-State: AFuF++m7KYJ9vSmm6wmgGx9fKNiEHG1nL4/oiKzj70mAQNffdLCB5I73
	TNMSzZffUbt7jmwuh5G7DPetxoczh7V26bqj3TRduZo2vuvMzq9G9SIHiMjzPQwZE8u+vL7o5fO
	fqwxQ88SyEUxvIgi2e1rcQPv74vLm7wg=
X-Received: by 2002:a05:6820:818f:b0:6cd:3ffc:ad01 with SMTP id
 006d021491bc7-6d441c7de80mr5856938eaf.81.1790343019904; Fri, 25 Sep 2026
 06:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914140821.1805449-1-arnd@kernel.org> <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
In-Reply-To: <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 15:30:05 +0200
X-Gmail-Original-Message-ID: <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
X-Gm-Features: AclHuK_tdwElKKmMYGPFlmZM1P8fO1IIRCqgIQbs7o9aMikBwWdJXpQ3EUUcqPA
Message-ID: <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Yoshifumi SHU <envzhu@gmail.com>
Cc: arnd@kernel.org, Frank.Li@nxp.com, aaro.koskinen@iki.fi, 
	alexander.sverdlin@siemens.com, alexandre.belloni@bootlin.com, 
	alexandre.torgue@foss.st.com, andreas@kemnade.info, andrew@lunn.ch, 
	arnd@arndb.de, claudiu.beznea@tuxon.dev, conor+dt@kernel.org, 
	david@kernel.org, devicetree@vger.kernel.org, enelsonmoore@gmail.com, 
	festevam@gmail.com, geert@linux-m68k.org, gregory.clement@bootlin.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, khilman@baylibre.com, 
	kmehltretter@gmail.com, kristoffer.ericson@gmail.com, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk, 
	liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com, 
	nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr, 
	robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de, 
	sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev, 
	stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com, 
	thehajime@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 1:06=E2=80=AFPM Yoshifumi SHU <envzhu@gmail.com> wr=
ote:

> I would like to request that the core Arm Cortex-M support be retained, s=
pecifically for v8-M.
(...)
> I am willing to help maintain this support, including modernizing the rel=
evant code. I can regularly test kernels on real Armv8-M hardware.
> If an active maintainer is required to keep the support, I am willing to =
take on that responsibility.
> Please let me know how I can help keep the support.

All right, now we're talking! Could you test and review this patch:
https://lore.kernel.org/linux-arm-kernel/20260910-arm-generic-irq-entry-v7-=
1-v3-1-5fd90f6859e1@kernel.org/

I do avoid touching the v7m path and it worked last time I tested
it  (on an STM32) but I'd like to see your take on it, AFAICT generic
entry is not really possible (easily) on v7m because of the
pendable service call mechanism but maybe we can think of a
really complicated solution? ;)

Yours,
Linus Walleij
