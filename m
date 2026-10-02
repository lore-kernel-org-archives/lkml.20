Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4B11DF98F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935324; cv=none; b=UZMxHAdU+mkcFcO3sGFtRnRZbSWrXo7pOeWaylA6Hc0fFDqx1rW1eBKsgBsdzDYJBr4hY4tnD3r+6fKCvYL4riP8KMdHiH3LmjMfmTUwoKPvYqNKAoFqUVo1IBc3cyRHnGen5fJ/9hjkO+D3XqpJKyoimF01ijXTQh4nzwn+8pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935324; c=relaxed/simple;
	bh=GzAnx2xBXfEPO5tzd00AnUoKCvkCiQ5XrGLMnwGIK18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maHA908gzOvLSAVtAuVvzOI5uNH0tWNpBZQzWst7Qo/8F2cQyMSQ7AyEqwogliiIzSCWq7kKmCjJwdnptIe1FmS8FBk3RXQje9OOQ5+YDvSiVs9nXi3BmaPdhY5qmYXO7qqwTQMx7DcYOaYDMYdU58k3NhCEY2+NSzaI2zw5whQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49e0ff50821so669910fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935321; x=1791540121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z0fxwGjBjqcCfabEbDLAIlWYoRpsrY3klbqZYJ/Lvy0=;
        b=nP/x16/ht/UujXbZkgBU2EH9Cp/n0pg30ZHXHkwwoUNvKW5mpch/Nn/epXQXiRocum
         rguBeYsoA0m5YIhGoitkA9pBf26mqIxGBzhqgXzchG3+W0bYTXvM3l/InzfDjwPNKs69
         Rycyra3OiBujcA+ffCb6Eeh+jZkBvuvzN2wdMmw1DYWwAz5N1wYyPw5lQ7+4td8YOx3p
         aLuluYwvT4dCGkHFjy3W2HfRDB3WSy0rXGPcTWYFCaG3QPq2XLLC1REJ9ClCmjcrnfJQ
         1TEKMcOie5J4/21eMBed5VJ1NjKVD8NhuoicCpWKrJ5UXL/QTb4ITKvXN1wUtcayTuu/
         D2IA==
X-Forwarded-Encrypted: i=1; AKwUvBy9KQiisvRpg2Y6w3q+8HE6zoq8f+48g0x0nTOkeP3/O1sIUvb9i4aeln/S3k4fFnUukBbaqxsI+3XiZBs=@vger.kernel.org
X-Gm-Message-State: AFuF++k/w79Jw8knwzofH0fk8X45eQB0DIAvxfZ7FNO0EN1bIbAwwEJ5
	dqBL92Y74FW18hehzhFUcT1iO7PBaN0Bo++dHtcEHXLCfSzf4h/rymJ7mfFG2dzz
X-Gm-Gg: AYBFou3XdDlOhgdvb7WKXVsnHfhw6zrLWpwRk4CKLMroNKZ/H15JQAeGYSQOhWIrtep
	zG+/IMJcUtUzVhCAoz7LHqVY88RYDCcwGnD+5dIP192jh2p96XR1/eI+4FY6c/5cBULp0hHpvBL
	uorXgj5XdyEHDhhFzo27N2s7kgP9ISjGw4b4WDJGsY0e1IDt7uHF+0CdO+QCqjnuo4Dey96IUqd
	0Ehc3IvH1SJl/tsJ5zV1YEblXIfDgXHdEfrWZHZvWTzoH4DEAfWSQDccnDwnbH6hpm41tb0S1cV
	PuEOxb4HYw0i+ECzpxgziq7fakTQyO1J/wCOZ9alfwvHXCieoucAA+8ieD9TDM9IZ9X6eir7VN7
	fbb8+g1iNriWR0Nvv7UgNWy6iM4r1/klkWrhpRbF0n83JpRReE4OdSOmm3+q+ZjajdffHa/mm+f
	OjR3dXSYLVwGZaFHXiAKq0XA7h9hMhxBpo9efIZ43M9bVjTHGn1vGv1AhTZg7FP9/2MNCrdT/YC
	jS7Ht0Yf1fNLYjOva1AQ29uxW3LwBDMjj3iUA==
X-Received: by 2002:a05:6870:a495:b0:493:d7c8:c71f with SMTP id 586e51a60fabf-49e15d15f69mr1726640fac.27.1790935321236;
        Fri, 02 Oct 2026 03:02:01 -0700 (PDT)
Received: from mail-oo2-f35.google.com (mail-oo2-f35.google.com. [74.125.231.163])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16f3c571sm1705997fac.15.2026.10.02.03.02.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:02:00 -0700 (PDT)
Received: by mail-oo2-f35.google.com with SMTP id 46e09a7af769-821ab84c100so932585a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:02:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBhKuyG7KH85qr/NFB5sj3Zgfmcw2LO+qJfGcTzptRj5g6VRlw8UrjtmFeeZEyXpgDkwdD+BzRxabE31k=@vger.kernel.org
X-Received: by 2002:a05:6102:162c:b0:7b5:6bb2:53a3 with SMTP id
 ada2fe7eead31-7c0f498afacmr661636137.10.1790934890369; Fri, 02 Oct 2026
 02:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com> <20260928-rzg2-sr-boards-v10-4-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-4-91752ea39cbc@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Oct 2026 11:54:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
X-Gm-Features: AclHuK95-pOI_InJ83kxtHngxLL78Cpy4C0cuDPVuyEs-ntx9z4X1Kg0cbn21cw
Message-ID: <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
Subject: Re: [PATCH v10 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
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
> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> their dependency on configurable mux states.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi

> +       sdhi0_4bit_pins: sdhi0-4bit {
> +               sd0_ctrl_dat03 {

> +               sd0_dat47 {

Node names should not use underscores.  I  will replace them by
dashes.

> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
