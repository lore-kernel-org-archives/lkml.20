Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD5C500AA6;
	Mon, 19 Oct 2026 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420808; cv=none; b=I5khjkKSwU5ikfKakXkR0os3k5XbcSbeH0+Batl5ng9h3NE0zIk989OefGlvbHOfNEQRPGjwH3IAY5vZp3Wt3mii/2GhfCDW2z8VhGgTyazXmdHlrM2T5Jbb74T2Pw50Ma48uIL2Y4/F5kCJfkEVgDmTKFyGUq74aQyJrUD9N5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420808; c=relaxed/simple;
	bh=pwjAxSjLuWoCyYAVhTlWcCU3k6IV2ZHDLx7Jj3Of7nw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oZdPJl20EQ3kUL5Y7t/lQkxCozV+RtkXcS817dID5J0WFQamrPvyHysIBAZfukkHvKkXh38SZFhjsXgcP9A4fq4Rz7r1k8c318niqxhXncXbWdqcEnh6IHD74f7zjLF4J/UeImYFyMPI7Jv2NUfmHTE8g29IoJY0VJL2FPGcBsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=imR3VF0H; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="imR3VF0H"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 554EF4E4120B;
	Mon, 19 Oct 2026 14:40:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26AC460582;
	Mon, 19 Oct 2026 14:40:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0BB110328E21;
	Mon, 19 Oct 2026 16:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792420797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2558d3oEif7BHNSpDFXjjEfEGVqxe4R6m3rNhXBFMy0=;
	b=imR3VF0HPWrcZd2WKEwd1C78YgVYd0zoxoTXE522efmJm7XK0tnfdjOO3ZJMWFBqZgn2rO
	XSkJ/DAJYLBxgbOrFryJ782qM0Y+YCZf/9LdJC0ahRouAEPv5NRaJFl/m7e1Pqu7tx53yr
	2cg2OY25eGzx1PqbVOOAhm/Vaz9//z2I7b0zbe2kVirDp5P7DvvLfFAZV+UGhRfutMrQl8
	PnNe7swRj8exnKxuJEfq/dpVFUNuozuBThvPGgVpe0Gx7IJXsDUeVf1yB4ldkbVAwOgxQc
	CKYzfxJyW70r+kk+erxMGvQIdQwfhZCaLRKzl4TILtA2DSzrDoZJg7f4oCvg9w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 16:39:50 +0200
Message-Id: <DM8W53QHZGGW.H5DPDQW3OQT9@bootlin.com>
Cc: "Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v6 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com>
 <20261013-paul-v7-3-rc1-edac-v6-2-2f1d6f2f74db@bootlin.com>
 <CAMuHMdUkhM3OtWnckc-ou69ZYFMfRT+DmU5AgUctJ0uY9w_GDw@mail.gmail.com>
In-Reply-To: <CAMuHMdUkhM3OtWnckc-ou69ZYFMfRT+DmU5AgUctJ0uY9w_GDw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Mon Oct 19, 2026 at 4:21 PM CEST, Geert Uytterhoeven wrote:
> Hi Paul,
>
> On Tue, 13 Oct 2026 at 12:45, Paul Louvel <paul.louvel@bootlin.com> wrote=
:
>> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
>> The memory controller supports ECC, software scrubbing, and SECDED.
>>
>> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com=
>
>
> Thanks for the update!
>
>> --- /dev/null
>> +++ b/drivers/edac/cadence_edac.c
>
>> +static const struct of_device_id cdns_ddr_ctrl_of_match[] =3D { { .comp=
atible =3D "cdns,ddr-edac" },
>> +                                                             {} };
>
> Why this weird formatting?

Clang-format shenanigans.. It will be fixed in the next iteration (coming
today).

>
>> +MODULE_DEVICE_TABLE(of, cdns_ddr_ctrl_of_match);
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

