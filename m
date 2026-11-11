Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407719;
	b=BQaruubXJW/D0DkfqB3MrqUmljtmB3fVrLHQMNE8Gg+ogBuBbUUNvyfGBFS5FYxawCWi
	 7AMSj7jiSIB1hZ5djGb/AxoVkDfSxLlWxRlayljRQqvkkfSMaRe2NSC+rUgXYfGls+s7L
	 pJkSv9wHCW35jKtBv91U0WTDR59J1uk7mcqq9U4dZF8VHv8I6iBMnUVkOkx1606iIe8F8
	 c0z+UGyDhn42XUBqGAcxogaPYK94Rki2scgF+tMjjsTpOSnNdoRboRX/snUiGoZsHgpcb
	 KjXOW6gtCAeUx+Ilha8WKt46n5YpB+IpqIibZVasvKJoZ7f4BgCRTBsjbY9L7G2GQ/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407719;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9Q/hXxN4rvNs3UDQ3MT+UG0UyPwYQt/ekw3a+w3cLnQ=;
	b=xZRAQX2gNBHMdLqkSbQmXM0l4W9yOyl34TZ18xLshLhf1WLzhI55i0hZFKoG8nOogW2q
	 waZmbv3ILQnqPFf+vYyqwR5XLroxbHVTrh+xGELODR2q78vBB8V0RhV0ZuYBs6ddU1833
	 zs8B7beNlRkArjuXrBWel6s25Zr/MUtCg3Bxzb+Iwd42lbSKx18KECPhOCRYDnhbzaSN9
	 f8Dx0KjvXlR61KU+VIssq5JWItvTrjmwI9j30MEOTrKAqSPQO+9X4J+aG8z86tGmJfxJ/
	 k1loyfvhxMtc9/zHCq4cfF7uRKTB+H8wtKCMndLEsDp5ceSAAdJMtpq57tteeKTDYHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=COU7FLQv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D2606A889
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=COU7FLQv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BCC1F00A0B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794407718;
	bh=9Q/hXxN4rvNs3UDQ3MT+UG0UyPwYQt/ekw3a+w3cLnQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=COU7FLQvxdhk4C8nYc21n25kqj3ApGY8GCwZq6s0xJauuPIzvmEZsSTUNbby9RBjS
	 737QUOwawy0JypJGpH74Qt3ejgp9WnqFFCwg3JbLZ8R6dEj0z+iu9AqtvONsPWBuQa
	 t+nxCMaD1bgwJM9ojt9FMcCURu5e5wEAXSlrVNBOCt/2Ilwevm+70BQ3MB25B6p9a2
	 5G0PpDNjfsT0XXGNnc3A522PGjAAAvb64pVKhImXDLvRMWG9ArFTt9q4HrN6qpGCUl
	 SohRAco0dyT2TpTdA2qaUTg5qkLs/v+ioCb3elCF5yprZtyYDUwW0y1ekXkEiwSOBf
	 7+niM+gSCO13w==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so2213107a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:35:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG3AIW4I4Ff9Rjlm5rm1M5eVLSoa7RIKN3v5t9eSkuNRIMLUpwqXQxdhzLH42dBnpF+4NaiIatQ+KoW12s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wP2WLUjkADGOB9rE9ScC+xC7WpzHIpUHr3/Z7SoW3vyMDa6Uo
	CJUQsKZmORpfclec6f1rzavsdrVgsoqAM/AA2NVlcRdSTpzh0wYQrLvjHdSx3V9pDdhux8mmkGs
	2EQrMBclO5PtUFnkv69HVOdu3ItEWkA==
X-Received: by 2002:a05:6402:1d4e:b0:6b7:78e5:3fe2 with SMTP id
 4fb4d7f45d1cf-6b778e5412fmr1833663a12.8.1794407717277; Wed, 11 Nov 2026
 06:35:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com> <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Nov 2026 08:35:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJYx1TJA7aWUi=XR20Bn7ZqFZWG6jVT2b0+ZLe9RWoZMQ@mail.gmail.com>
X-Gm-Features: AclHuK97dhZ8RDnOSi6eJDa7cXf78Q2-j_uGZ4_1m7mWgziIuwSZeAEy4jr55Z4
Message-ID: <CAL_JsqJYx1TJA7aWUi=XR20Bn7ZqFZWG6jVT2b0+ZLe9RWoZMQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: gpio: vf610: fix clock requirements
 per SoC
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 9:56=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
> a single "gpio" clock. The VF610 controller has no gateable clocks,
> so force clocks and clock-names false.
>
> Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatib=
le string")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)

Now a bunch of warnings in linux-next. Breaking binding changes like
this need to be applied with the .dts changes.

arch/arm64/boot/dts/freescale:952:50
   Schema warnings:50
     60 gpio@47400000 (fsl,imx93-gpio): clock-names: ["gpio","port"]
has more than 1 item
     60 gpio@43830000 (fsl,imx93-gpio): clock-names: ["gpio","port"]
has more than 1 item
     60 gpio@43820000 (fsl,imx93-gpio): clock-names: ["gpio","port"]
has more than 1 item
     60 gpio@43810000 (fsl,imx93-gpio): clock-names: ["gpio","port"]
has more than 1 item
     41 gpio@47400000 (fsl,imx93-gpio): clocks: [[6,116],[6,116]] has
more than 1 item
     41 gpio@43830000 (fsl,imx93-gpio): clocks: [[6,119],[6,119]] has
more than 1 item
     41 gpio@43820000 (fsl,imx93-gpio): clocks: [[6,118],[6,118]] has
more than 1 item
     41 gpio@43810000 (fsl,imx93-gpio): clocks: [[6,117],[6,117]] has
more than 1 item
     40 gpio@47400000 (fsl,imx95-gpio): clock-names: ["gpio","port"]
has more than 1 item
     40 gpio@43850000 (fsl,imx95-gpio): clock-names: ["gpio","port"]
has more than 1 item
     40 gpio@43840000 (fsl,imx95-gpio): clock-names: ["gpio","port"]
has more than 1 item
     40 gpio@43820000 (fsl,imx95-gpio): clock-names: ["gpio","port"]
has more than 1 item
     40 gpio@43810000 (fsl,imx95-gpio): clock-names: ["gpio","port"]
has more than 1 item
     34 gpio@47400000 (fsl,imx95-gpio): clocks: [[24,54],[24,54]] has
more than 1 item
     34 gpio@43850000 (fsl,imx95-gpio): clocks: [[24,119],[24,119]]
has more than 1 item
     34 gpio@43840000 (fsl,imx95-gpio): clocks: [[24,119],[24,119]]
has more than 1 item
     34 gpio@43820000 (fsl,imx95-gpio): clocks: [[24,119],[24,119]]
has more than 1 item
     34 gpio@43810000 (fsl,imx95-gpio): clocks: [[24,119],[24,119]]
has more than 1 item
     19 gpio@47400000 (fsl,imx93-gpio): clocks: [[3,116],[3,116]] has
more than 1 item
     19 gpio@43830000 (fsl,imx93-gpio): clocks: [[3,119],[3,119]] has
more than 1 item
     19 gpio@43820000 (fsl,imx93-gpio): clocks: [[3,118],[3,118]] has
more than 1 item
     19 gpio@43810000 (fsl,imx93-gpio): clocks: [[3,117],[3,117]] has
more than 1 item
      5 gpio@43870000 (fsl,imx94-gpio): "clocks" is a required property
      5 gpio@43870000 (fsl,imx94-gpio): "clock-names" is a required propert=
y
      5 gpio@43860000 (fsl,imx94-gpio): "clocks" is a required property
      5 gpio@43860000 (fsl,imx94-gpio): "clock-names" is a required propert=
y
      5 gpio@43850000 (fsl,imx94-gpio): "clocks" is a required property
      5 gpio@43850000 (fsl,imx94-gpio): "clock-names" is a required propert=
y
      5 gpio@43840000 (fsl,imx94-gpio): "clocks" is a required property
      5 gpio@43840000 (fsl,imx94-gpio): "clock-names" is a required propert=
y
      5 gpio@43820000 (fsl,imx94-gpio): "clocks" is a required property
      5 gpio@43820000 (fsl,imx94-gpio): "clock-names" is a required propert=
y
      5 gpio@43810000 (fsl,imx94-gpio): "clocks" is a required property
      5 gpio@43810000 (fsl,imx94-gpio): "clock-names" is a required propert=
y
      3 gpio@47400000 (fsl,imx95-gpio): clocks: [[25,54],[25,54]] has
more than 1 item
      3 gpio@47400000 (fsl,imx95-gpio): clocks: [[2,54],[2,54]] has
more than 1 item
      3 gpio@43850000 (fsl,imx95-gpio): clocks: [[25,119],[25,119]]
has more than 1 item
      3 gpio@43850000 (fsl,imx95-gpio): clocks: [[2,119],[2,119]] has
more than 1 item
      3 gpio@43840000 (fsl,imx95-gpio): clocks: [[25,119],[25,119]]
has more than 1 item
      3 gpio@43840000 (fsl,imx95-gpio): clocks: [[2,119],[2,119]] has
more than 1 item
      3 gpio@43820000 (fsl,imx95-gpio): clocks: [[25,119],[25,119]]
has more than 1 item
      3 gpio@43820000 (fsl,imx95-gpio): clocks: [[2,119],[2,119]] has
more than 1 item
      3 gpio@43810000 (fsl,imx95-gpio): clocks: [[25,119],[25,119]]
has more than 1 item
      3 gpio@43810000 (fsl,imx95-gpio): clocks: [[2,119],[2,119]] has
more than 1 item
      2 gpio@2e200000 (fsl,imx8ulp-gpio): clocks: [[41,18],[41,18]]
has more than 1 item
      2 gpio@2e200000 (fsl,imx8ulp-gpio): clock-names: ["gpio","port"]
has more than 1 item
      2 gpio@2d010000 (fsl,imx8ulp-gpio): clocks: [[19,22],[19,10]]
has more than 1 item
      2 gpio@2d010000 (fsl,imx8ulp-gpio): clock-names: ["gpio","port"]
has more than 1 item
      2 gpio@2d000000 (fsl,imx8ulp-gpio): clocks: [[19,21],[19,9]] has
more than 1 item
      2 gpio@2d000000 (fsl,imx8ulp-gpio): clock-names: ["gpio","port"]
has more than 1 item
