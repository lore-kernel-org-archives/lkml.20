Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794936080;
	b=Zx8Y2J3SN+sA0ev38QHdcVL2Z0G2wm+rvYjDYO8bjjToAKFhHz9pqoqKjcXL4dGQe96P
	 jtYfuOGj9kqiIAMiBlZpZAFUxZZqa8HLKITcvEhJQfdB6yjOc/7Ub97w9xa4Gy2/t/8m+
	 /FkKw23F3HvfKWQkiWo0HiTt+iXMQP1d3a829JH3dBdAGqfdO5znwYTcKRjiDhQdHi0Ld
	 PJ2qeCARBWJYMkOeBgGrdNjbgdRW9ks2pS1HTMipllchbKuJDgaIN6Wz2KUQD7R9KXdP9
	 wgpdzJQk0Gws0isEgCkmsIxKv13J+7ZejLI/7o9hu5iw9bMU6opGSWvjkspLrpWmSOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=;
	b=JZwxwz6J090vPcADsocBMJLwDq/V94nngBUoo8mH5PR00COrghccxszX/XIghD6hzu8f
	 V5b9wK0r8PQdyoJCQAstUqdIdOQNEY6X17x/iKr2PIA1ZNaA2kGnQQ7WqjKZItnRAcE08
	 9zoMDt2BUi3h3o4cJ51/17tNm7j6jnrCbLTyg5NFq9h5+Wv6oSuCn+2arOpr8GekkzR8s
	 EDh7+euYOk4rAStC0MCz8vQoxb2mm+Wg7hPUeMD/NzDQaOc1LviAZy0yCwyahf7XyaAPm
	 3Cdvo215D7XkCq6dFTaUIfeHXDw43F7Xn3bePHgHkrH0ioKKst7ZpHnwjHIR6QV6WSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=A69UnZxS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AC460A3804
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31AC460A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=A69UnZxS
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4f3e22bdfso6976307b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936079; cv=none;
        d=google.com; s=arc-20260327;
        b=BFC8igemhPAWdFPqXp5xQ6t7rB+QFCVjkPmoooT2KridocdGB1GZBXri9/FB7B2Iye
         yHUJnnDWXQB8Zr8IRM7Aq08LbLcLq5UjHUtlYtB/8Hla/SfFO3Hc3hcn247HZm8phinH
         Nkq8yBdVglYJ064sukMzBSIrO/bJwMOXpfZ3BNTpJh2CPW2kfbPVN6FXBJj1IhgGCBeP
         RAymZHXnYbQprm/l6f28xML71GSx3CdA30gyMiljKHzVJu+iKTqBi228TV4LzDReGSZ6
         Y/rn8Vlv2s3LFtzZ2TkdoqBBSyzZh3XHIEpJhjYubUXCHktgy507k44tl8VB5Wr9RkWZ
         45Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=;
        fh=6yTgili/BAr3DMPZEA/CL8DdMwokGRS7leHOpRGw53s=;
        b=hJfsyC7djg8zn/VJzpM3yAxN06QDKUa4xrC7zA7Fz6CQgSyWvPKo2G0I6ugwFdSu60
         16v2g6jsBBIb0bWHEQUkfuM/j2FKZDsHgyDu26Sqjr10C+g9Y9X2dx3kG/7YnzdgRwG8
         ypX/cU/fbXTyDjys3fIWoONXjtvKRlHrn0rHA20xffkKcGw5ftSyWIykeAWCUJDmqXs9
         yQ9WH6E9AaSreu/OHQ+bDY3wkbosxrQ4YoDzDNUPAwQcT7kW2ve2D8P8VgS3eOixhh/K
         vMERCu+0huVgM+dLkqtIGN4Kfwb8WeVWQAEAGM6AHCkbND+KF3NzRw+DguxlgmpdSmLI
         lUmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794936079; x=1795540879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=;
        b=A69UnZxSgZpATkrI9vIUDUXomeq84m7quw8KG5IeGWevfpiQe291q4HB+eRF5BNk4P
         o6qkn4CNWByuaYVqlf1CCBoqwu+DsnBDXSl5TsO4diuoMk7fN7pjE84nJ+ZWYpCc4R1H
         XlSAxo55M48/aCNDsZ/gdrnx5//BVl6EJJyZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936079; x=1795540879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=;
        b=OfgIBeB6auOpbojESr9bak3FeE4oHm1JfQdmAhBy62F8TgXjb9Ba9wg3B8FWncBgVi
         Omm0AWyNM/ymXQ6VyksI0NXXEZjgYkO4zWqQvRiooDNvCSa1zo9hxdH8TaFb8rlr4bAZ
         QoAJUvtgaV6NGRaVz1X6f8CZKwa0Eneo70PfqVsRnQ5OF0B2ACoeUs21/cVq2HQy+VML
         C14iUPzll3mb9EeCDISPo4c0StlD8NkQgYYUocuspE2p2A4nSSvcVOJlVn98/xcS0saK
         p+yY/xKLPWj9sKQTcH+DRcMXzjlgj7sqVmO+U7rwfBfpdze80i8IA1o0r1Lf1Z9U/8+L
         tW0w==
X-Gm-Message-State: APuU4Z8Oi0ezbRLb7I5RaAl3g5RItF1rEX3qiIAlnTfyRKv/fRICLkP3
	j2zAhEkWbAJwAK6Sfzzj7nRc7XX6XUuiFrHfKmlimVnfdxgnq2limdScZQvKC4qoLPRVMrHdGL1
	YC4j/TRxCW8CKsTefISnXtp95+mYhTl5rfI5CBxJCQw==
X-Gm-Gg: AZFdTZe4odieLHHtUOKNeW1kBqhPWZ9YGm0j9K8eWdkHj4EfSEpO78Mxyb3WVQwvh7e
	9yvkufS/LwP+QwYUNYhxjg1YSLmSiNk328+0w7PeU4jPOK+3Ha1qNJOLbJlZzVXtxpff+sbtPzC
	2+mvdp6oXFImwgJm3R9v5DUF8KfCSiaZBlmxJxCGEp/4W5c/OtuAzT9lpWBhfYbfp+98shqHWm3
	V79yUaveOlV51EfliCvkDAGEHoG7TuNLhkweO8RUgrU9XNvd2NfidcxejQz66yfk4U+FtoVXTgb
	2AwU/axpt8CNXeMiJWXqF7WOoIGGqyfk+yjYq5zuJQP9My3Gmm62ruMVs7G94ltXYO1SUgGIR6W
	zAPr1jp3L+pKUXTbwKvvu7XafGWpvbyTL8GJuHKRkIarNhqjDTI4ww/BaDs9+x/nDXw==
X-Received: by 2002:a53:a201:0:b0:675:b778:a423 with SMTP id
 956f58d0204a3-67dd400fd64mr68936d50.142.1794936078854; Tue, 17 Nov 2026
 09:21:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com> <c936336b-04b1-4860-9eba-4d1ab002adff@foss.st.com>
In-Reply-To: <c936336b-04b1-4860-9eba-4d1ab002adff@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 17 Nov 2026 18:21:08 +0100
X-Gm-Features: AclHuK9vIKNWUheSbkNa70jfkA0aQPHHOtq4zZIwHrtQ0QLNLTppD-5SEjbbfas
Message-ID: <CABGWkvrnq7Z-nO2LoJw1M833Mqbabn6M_r+okrJ4R-eQ-sR_SQ@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] arm64: dts: st: enable eMMC on stm32mp257f-ev1
To: Christophe KERELLO <christophe.kerello@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Christophe,

On Tue, Nov 17, 2026 at 5:58=E2=80=AFPM Christophe KERELLO
<christophe.kerello@foss.st.com> wrote:
>
> Hello Dario,
>
> On 11/15/26 17:34, Dario Binacchi wrote:
> > Enable the eMMC connected to SDMMC2 with an 8-bit bus on the
> > STM32MP257F-EV1. VDDIO2 is tied to the 1.8 V rail on this board, so
> > the DDR52 and HS200 modes are enabled. Tested in HS200 mode at 100 MHz.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/bo=
ot/dts/st/stm32mp257f-ev1.dts
> > index 782b4bb843ee..9c38c4fe0c1f 100644
> > --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > @@ -431,6 +431,23 @@ &sdmmc1 {
> >       status =3D "okay";
> >   };
> >
> > +&sdmmc2 {
> > +     pinctrl-names =3D "default", "opendrain", "sleep";
> > +     pinctrl-0 =3D <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> > +     pinctrl-1 =3D <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
> > +     pinctrl-2 =3D <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
> > +     non-removable;
> > +     no-sd;
> > +     no-sdio;
> > +     st,neg-edge;
> > +     bus-width =3D <8>;
> > +     mmc-ddr-1_8v;
> > +     mmc-hs200-1_8v;
> > +     vmmc-supply =3D <&scmi_vdd_emmc>;
> > +     vqmmc-supply =3D <&scmi_vddio2>;
> > +     status =3D "okay";
> > +};
>
> This source code appears to come from ST's downstream Linux tree. When
> upstreaming from that tree,
> please preserve ST author and Signed-off-by tags.

I started from nodes already in mainline:

  c5ce8d7bcc78 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM")
  94911ce62b45 ("arm64: dts: st: enable eMMC on stm32mp257f-dk")

and only adapted the pin groups and supplies to the EV1. The first
one is mine, as are the SDMMC2 controller node and the pin groups
this patch relies on:

  513410ae43bc ("arm64: dts: st: add SDMMC2 support on stm32mp25")
  17d813da1689 ("arm64: dts: st: add sdmmc2 pins for stm32mp25")

Given the hardware, I don't think there is much room for it to look differe=
nt.

Thanks and regards,
Dario

> https://github.com/STMicroelectronics/linux/commit/d00ddc95c630ebf948ebe9=
c22fcbca145d771afc
>
> Regards,
> Christophe Kerello.
>
> > +
> >   &spi3 {
> >       pinctrl-names =3D "default", "sleep";
> >       pinctrl-0 =3D <&spi3_pins_a>;
> > ---
> > base-commit: 23c62304dde29abe92013d85910d03a77dada35d
> > branch: stm32mp257f-ev1-emmc-aliases
> >
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
