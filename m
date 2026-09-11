Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354453D45D4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128020; cv=pass; b=jwUCaAtdjQreElC0jRVb18vRChdhu7N/jdDXcBvvMbM56C8WMcfuvXGExTRCeKyWo/f8gS5Kfn+2DqzmwmCiDeFOdmAMQyJ3jGZbwPDneGyycAbINJEi5C+UeOR1TK64m5SbbXDsuGDqOKqIm3Ig/Vue52PhiCOipkwzyv0VUMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128020; c=relaxed/simple;
	bh=3SyHymAnrjlvPO2mb9pb0A4ZCmnI2yTAOAi1u/9obmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgEFGQwBKI95n7UyCFTh5ELSje9FkyPd4I4bQT0LB/pTFg54wptb1kIaYtcpdoLXVqgI2FSjtDmkab4BmcrAS1ix4XOmhLCJvjC5SjyMKM7o4RjaGuUW3LL9Hlgq1FDEDkhdBWRsSspheEIqqxq2HcTYrmvpCYwwJCQalR8EYg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsjxNPWK; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsjxNPWK"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ab4fe290so228758a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789128018; cv=none;
        d=google.com; s=arc-20260327;
        b=O0LPJWwZad1j9OOo5VJBiZZJZca6tz8AUquLsxXGNrq0B5YCjaJEEJp/npv5754lwi
         xJJtECx4moDgMXZGYJJj+0kKISnCGl1/6M+oAgRLqe1UV8NEycYhEWZpjMmuWoyeJQ09
         rN5RLpU1jVaut24KtHBwV1hPYaEv9QX7VHgr7MbTLI2nH0gQiCa6uw6E6NOBDi6qEOcn
         aQWMETqfw1Mb1Ev+8nUxXNaQF8t3Ay3pXJGJ6ZEuQ6GWm/v7urk+5/aTV6wQ3LOu4kcI
         nArFbS7pGKOjqAkbMxvdcs1YU7dXzHR9YlMj7CGkJ66VSJTV/2TVfwhBMFuIw7kgrafc
         I8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        fh=PXjQYMwF8+h6LplZpea+Gg6iokgI1aakeDbOVmCrWfk=;
        b=Imn6gEG2tZ68eS9wBF7tkLn2tT5yMe/Y4kbNZazIkLnekf6OReoXPZL24+9lCaJwNe
         zbGPz0YNgzd2cj1cejYDgN1I7sg0sY4UXWSHlwC6vd28VD4bHg+eEUlyj4uCR5aR7614
         nXZSO09BK1E8Bn/Eh03SeD7dIVGft/mDoom3Sg6UmXUYQUml2mbXJ8kG3HRmLjdfply5
         8hOBxXNS999IsMpz0ISJUA3XgNzrZdCUNYMpbuzJ1v7SDIqJJUztc81+1h9z1he7gP9D
         Ppq4YSPOgpcxqsQPbTge5u3hY55CCUs7TL38s9d8JCgw3sc+MaFwudxeEkMeQKwUh8G0
         KdmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128018; x=1789732818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        b=XsjxNPWKVU+SEBQ4ttILvNxW1KOKWAyxwUkq4ow+OPnVU8LDga3zj55RaGYg8ikKXB
         pgG5rYGLaEi88C33CMbFLS4X7GO2lfDXcFTGeJ5q/dvM5QMooREgH7dm1vMCmzF6wWLf
         6/tBMFihkrnnaTn0lILpm3orBG+z/tHpZj+7NajSMUWhA0TJgbPnBVT+BB67vAVCtxzs
         UtlPpBYods1rLXxvo+ws+5v5KbiQW4mc8iurg91vXm6Gtr2JBsRbAvdK7QLWCpBuK++d
         9K9vy5O2Od/WRtoCyL/tWdSvu6M8yW3HmKFXmINI6GNm3zdf2zfkZZQpti1V9b4N0woN
         US7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128018; x=1789732818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        b=FzjlO16rVWEQHqfASVEYINVaThTI9cKF2QU5C3lonUpIMOWq8FOmwBQtTKr9LZu2D5
         ZgeMYgwTpnbhJp+ACkVVtVRC5CVn2RtKXUeHEQWRKbysc2j6d2n+5uUcFfgDK6J41qCu
         WbciT0fjSvMAN4//y3KkOOHtO2U2/qBKHmcnskWHHT0E06H3CLOGKtMkGFei6zkxNXmK
         cVnFdO/JEgTRq622ai//I0PJAhBU9eD8nTJmqbNAq3j2Gg1QZfNvgUfOqZtM3OZXwUxX
         A4Cn5tcL0EhPvfTuBO9IEPxyGuZrWIppsKokHfi5TaDYc60nOzVI643XilfcSJyi0dSX
         zQYg==
X-Forwarded-Encrypted: i=1; AKwUvBzZZuguearkoV1Ffglp81yS+T9rWdqZYew+ucHYNPxtHZ6iKF55KQIZgII6BfikkKXIvR6RuUNANmwFiRI=@vger.kernel.org
X-Gm-Message-State: AFuF++nRM4IcbdH17RZqzl1nT3fJx5UzHUzbEdP+KIxirwF81eOjo4TO
	qkFZLFWRq6Z9SiJgQtUGk1BLZ21TZD+KJvorGQTT1inCud2LK3LCR5gmdjnUOaPMRvRh5x88bo1
	4w+Gl4+NRmvu6WDP+jJ/x7n+ZMe95kgo=
X-Gm-Gg: AYBFou1cksnPsm/3ZHG0b2ZXbCo+HV5tUJSEFwIYpKdtL1kH5V7Gn4Z/QmhZQxuYuMi
	Pv2ginyAM/AhwJE/SOrEnnAXt286ZjwVxD2hsF0bTmyb+Z3rw5sVlnFQAy8lnKiqWPDJW7VDVur
	SBg0x2VBGAVkaE/0qsDER+FWX+vMqynmW0DfeqxeDOKYtTuuEq9y4qD+d/OTPQDN3I3hcDiLesU
	gDpuwFMunkvWg49mhU9VQVn4r7+zfhm/12mi7DcVqHhvAZ33+S1QCSjLwaAglRaU+kLTa7oHF0A
	RU4DXkJ1MAp9MhhVDJfRZVD38g9T0XaAsv0lRwB7uqgi8wFdUUIdxTqJvvXcLShu6Ws4DffMsbR
	jIXiMCEavx7S8rNlJy+rkxfpQJWd3G6LZIeYk/3rlInBHyxX6odhl/e+yMhbZsoNFt4A=
X-Received: by 2002:a17:90b:5108:b0:38f:657:6823 with SMTP id
 98e67ed59e1d1-39d97f392d3mr3889515a91.8.1789128018117; Fri, 11 Sep 2026
 05:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Fri, 11 Sep 2026 09:00:01 -0300
X-Gm-Features: AcwNN1UryKTs1Lw-KY6R7BmulMcgHb-91PJOnn7PiBP850ZNAVItrIcXBzp-x6o
Message-ID: <CAK+owog22cPgYj9muDUJXcTx+k9eBmPz1jfi8D9cx3H-xo1mKQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Judith Mendez <jm@ti.com>, 
	Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Beleswar Padhi <b-padhi@ti.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Vishal Mahaveer <vishalm@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>, Sebin Francis <sebin.francis@ti.com>, 
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 9:40=E2=80=AFAM Markus Schneider-Pargmann (TI)
<msp@baylibre.com> wrote:
>
> The wkup_r5fss0_core0_memory_region was reserved with
> 0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
> AM62P defines the DM code/data DDR footprint differently:
>
>     /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
>     DDR                         : ORIGIN =3D 0x9CAA5000 LENGTH =3D 0x1B63=
000
>
> which results in an end at 0x9e608000. For this memory region which
> starts at 0x9c900000 this means a length of:
>
>     0x9e608000 - 0x9c900000 =3D 0x1d08000
>
> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/ex=
amples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti=
-arm-clang/linker.cmd
> Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-A=
M62P")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/b=
oot/dts/ti/k3-am62p5-var-som.dtsi
> index 8a8dec80cb30..3d1a2c5bc464 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> @@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c8=
00000 {
>
>                 wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
>                         compatible =3D "shared-dma-pool";
> -                       reg =3D <0x00 0x9c900000 0x00 0x01e00000>;
> +                       reg =3D <0x00 0x9c900000 0x00 0x01d08000>;
>                         no-map;
>                 };
>
>
> --
> 2.55.0
>

Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>

Thanks!
