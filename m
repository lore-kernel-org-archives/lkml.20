Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9229C521891
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174815; cv=none; b=UNR0Fr76YI5EbJzfSRS25BhnXBq5FkisJJp+CLOpMypqdp1+iRmLuYx6KcCoc/CO9DiiOyyGKW/XFIpIM6U2zViheKQPzyxxBH1QmFgPIvkxctN5IrfeS6Z2Fyoaw1PIngk/Tr4n1oaqlJSLndgIUxk5KllJ/zBho0sIvOlnEH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174815; c=relaxed/simple;
	bh=FXzg6hBNBXZZsScdwtGeM5Pmqbhre7BC03zd4cLn0Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KS9lMSLLxdyWXRoE4WDgqdbRdnfFB1TlRYESFpy5ks0fhxTHKmSH8Qzp4Vezs2FIUtHruQimlZGlw4BeBbOiEIdNJKTl8FAh+KIYs2vz750XV+vfxLpAJVkrq3WXOvtUpokv8u3iMphzIB0aRxrwTsZGieGyMb7+UHYBoJrL3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e33b917so831651e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174812; x=1790779612;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ONYGJu27lrhOYpsTIFykGbM1Hkv2j9YTc036/0zk0Ug=;
        b=c3ul/s6NUc5AaVGkPXGzBn3MuTGhgqgn5LGOd77yoQ5XFp0ntDKiPP5bHk1C2yk+kx
         UUuJ6tu8l0D/xX/xrAl2qYmll44pjcMuWRF0H7T9cQh9kLbtsO4do3pauy3gRe8mJBNU
         vcGNwjmqtqPfAoOqVvm9+7UtnOqc8Ii9y9cgbwgVlzB/T7vZ35TvJQacfi6EDUJxSsN0
         lUqE3tJrKcc+mPzAQ9Ebx2X60QBFp37ha6xeWnQQ1YQLpyM72wvPim5awgGGuE8mZXO4
         JXDdWp3fYIm3qIzvkp2KZlclYrRRr0Q7SlFj/nXrk4+2fFk9DPR9gO/EHgfsA+KzZzLG
         1NoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzsnVwKLjLVBUKIkRQMMrqmhsxWjBVzcWooII/21oqHSglvoShqMySx9Dwvjj6gHerSLRD4FwPIexXUus=@vger.kernel.org
X-Gm-Message-State: AFuF++nVCj1oBcUeE6cSXoTb0K+9o7oHj+xRL5KywXchkVA0JaFN2GIP
	Bso3Gt7Xt1W438pDTdIUly/7feyuLdRtR6x9UHfgCqw/qQLGaFSHltOCIPCv8lnr/Do=
X-Gm-Gg: AYBFou2/f98kojdzDEpU1AEa7s/fM5CIY7RSHscsKKFeVOAy8Isq3avXSBdTKWVncHv
	yZ5bKCDiW7JaMSn3RTw9WNX7SCp+yPnB85kqF4ZR/H9nbnclrjiFhT/cd1peo+gWbTSe5nmP2ty
	I8IkE5GwoMfSx5OROivrJAp6i3omICczk1mIN93gZDI3UaG3owPMsFrRb0UmJ18ZDFlJIh3hTC4
	3BTxUvA4ywrzm7n0jQNX2kE/y4sKBCRJqO8DngtziU0siAr5gkXwUt3aWgE7uYK1GuHBbQdpVwg
	6/SoEkDoXt6Kq/allwcyJeueLiRxAYKuxOTdzkqs3KfrQ60B0boAiZPH7f/EW8iWQEn5PD/sK91
	UsJO37g9TQmRK/O91On2Jyj73ca3pwQYSEsRzhK5qjIkXEDYvO0H9WZUwJB+FfTJNLJtbCFvXRR
	DAURDSQjssV3FTt21hm1nFXcPdmM0+6tY7TpRuGdi9Fo670X9oe1KNgeVf6xD/zgYts2PVCK89C
	kGkx4LvltkImT/BdTm1W+ZxYcP+TqWwQCOlm2J8SjmVYzd8
X-Received: by 2002:a05:6102:3f16:b0:7a5:673f:7a2d with SMTP id ada2fe7eead31-7ac1b000b0cmr2800619137.6.1790174812184;
        Wed, 23 Sep 2026 07:46:52 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf35bcb07sm3870633137.2.2026.09.23.07.46.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:46:51 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed1so532052241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwcjEVPPd5VNsnXWsXib/xuObzWhbEoxl4NXn/NpJsOb0XPu6jjnKX4UZtpOKNF8zErEfoKd3Hp4mgKX1E=@vger.kernel.org
X-Received: by 2002:a05:6102:5709:b0:7a1:f7e2:aadf with SMTP id
 ada2fe7eead31-7ac1d0cb10emr2412732137.17.1790174811407; Wed, 23 Sep 2026
 07:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-5-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-5-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:46:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUt7w8Y=fmX2PtdJhZJ0k0YaKkoaC2ifx+LSYL5PijHg@mail.gmail.com>
X-Gm-Features: AclHuK_0TFDwROATeFWc5QcEb9bj6YWPyy6x8RXwybT5t7YWLi1_s9QYUiwmNRs
Message-ID: <CAMuHMdWUt7w8Y=fmX2PtdJhZJ0k0YaKkoaC2ifx+LSYL5PijHg@mail.gmail.com>
Subject: Re: [PATCH v8 05/11] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/V2L [1] SoM on HummingBoard IIoT [2].
>
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
> RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.
>
> Due to the similarities most code is shared, including DT overlays for
> eMMC, microSD, and RS485.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
