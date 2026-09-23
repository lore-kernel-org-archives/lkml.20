Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11448535FA3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176293; cv=none; b=XbzMvYrX6UB9oMhc2OQBTFUq8SMsN0hNYlBs6WfdlU+zsmUNCedRLVSKkjA+JEIvXpauIXUnwFKqOHC5VR3Tvw/rW4K/WidijTpCX5ZErK8+qPpBOXgZaP93EYBCRah8OHshvXj8zM1QELngDRNppjjlixH6Q3/SSlR/wldeqaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176293; c=relaxed/simple;
	bh=pZ9PpJiZh12Hwh/7XmEn8qQxKjkEk7eQcjPzfGPj1DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQYmAI9Ib2oPgGE9yBvpcKYracV34FYX6YO20j/Z2SrlFU+nC2TJ6KrvflCt2JMXykzuoLnl1/pKb20zdte6lC2vKmU5pXlCfj4kWLJJN9nJ6EGvdI9FJWQcHFqC5622rkL91u0r9FiK0j2B9plPPldKavXCxu3PoRDBeUV0DHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e194227so439243e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176291; x=1790781091;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+skuiLYw/IgGtWcdd1NJ+Hgm0E875s4yIqfpBxdBYoI=;
        b=T/cFG+x2mMDO0FJnzYsnWDj8IL4wVZrWCvFsgiVnJms8h82ay9us3Smeo9M/HOZ+g/
         2yvENTWcWlWT5EqGeTFcIXzXAlvFyCMSMikYFPJIEpvW+XHbrm2LKaP9BwpI9iXIKJhQ
         bGRxWESziTljfDXXz/fK+fWzwW4wwmTzJXPKXp6GSBNmcPNqn7xqEohnoHOEnCnDC2aB
         CEj1oXGbLGJKZL56DfwwsezDnl7kPKSHa/sk71q0je00JwzjuzD36b9/FaUPf/wduagN
         lVDflgR6V5WncjSlie+9k1QYbLsMwnozPkOUzISakVYWR5P93+G//Li44+urNTpRoj8X
         Dm2g==
X-Forwarded-Encrypted: i=1; AKwUvBxJUrJ+Q1brY63wsSWZC5EsiPq6tw8VO6eOcn1ET5wxhrZwb4e7SwoYRlnWLFyfllh7BLF066vflXbtzmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lwE+4xMoU8Itay+FcgjdUmAzjbKYyv/dSV24sKXybXGEo0cGtK
	39c/ELi9s+XlUqWRI1lpSI47ylLQoLfwXVX6jWE3C4wrTqiXD2cfdCP3ejI0Dcfc1lA=
X-Gm-Gg: AYBFou1iYmHFPspNgKRGTegA+DbPfWApihlohDs7z7Cdm0ul6vKWtjk0Gq6S67I7cyW
	dwe2VFXBHrBmoES0WW8l02WeJgJRH3byBb2VljLBE0YxP0h6j7s7lbyOPUeUveKdb17KFLcmqjL
	dqbewSHxuWwBUtd92AGqz4w92rcM5efuSR/Vp7rvHqXe+8JnsYssF1tMeAfkvgGdQ8q3LcOq8k3
	xQttZp5am/vT9rEHijRmH86saZBdOpLqYEsFmYPkrxkCGTST8tx0e2FnixCPj/72QURaG/nbmd9
	kd0VKmsG53dbkwBM54RnNabuxrnwgZo803FtSTOrnSKAxu96F0AsBkRkS2MJOk0//lxM+7zZyf0
	6I9hRMQGb7g9KdWkJKT7unwOoVpSJRvDBSAwMhyZ4cxfU2QJ/nzz07So4DEbciA1K2irc4mHGCO
	G+TsjJjHqOQ2n2P0kYl9mdiDFh2uA+IKXuzAUNfjKtDIXJzJafdJnVtkEAxQnW5sEmWoz9yLvyH
	O55U5ty2tS2HYdzPvQDchBrPW3SJenbXPAN1Lcu
X-Received: by 2002:a05:6122:1d91:b0:5c8:32c5:4296 with SMTP id 71dfb90a1353d-5c9f154f013mr2915432e0c.1.1790176290856;
        Wed, 23 Sep 2026 08:11:30 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f03c7966sm3602664e0c.2.2026.09.23.08.11.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:11:30 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so1607964e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:11:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByUpo2ScWMTaSuHYg6uyu0Pha6d+or9LeNWT+qQR9P99O0dJu8ukB0bb1AAxYFRKLekFLreCl3Caz1eI6o=@vger.kernel.org
X-Received: by 2002:a05:6122:2804:b0:5c7:c898:9817 with SMTP id
 71dfb90a1353d-5c9e3481de1mr6395425e0c.7.1790176288382; Wed, 23 Sep 2026
 08:11:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-11-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-11-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:11:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4K8GbT-=qUzWTdhq4bayC3ktE1F+X+z2XnXDi9vCAfA@mail.gmail.com>
X-Gm-Features: AclHuK8E9qilobRH7fLrZ_B96xKE8A0mTA3qi9_owW1vdBVZD4FYLc3dsbXINdI
Message-ID: <CAMuHMdX4K8GbT-=qUzWTdhq4bayC3ktE1F+X+z2XnXDi9vCAfA@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] arm64: dts: renesas: add support for solidrun
 rzg2ul som on hb-ripple
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
> Add support for the SolidRun RZ/G2UL SoM [1] on HummingBoard Ripple [2].
>
> The SoM features:
> - 100Mbps Ethernet with PHY
> - eMMC
> - 512MB/1GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 100Mbps RJ45 Ethernet
> - micro-HDMI connector (not usable with RZ/G2UL SoM)
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> RZ/G2UL SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
> board. Provide dt overlay changing pin function from uart to gpio led
> control.
>
> While the variant being supported here is named "Ripple", the overlay
> still carries the "pulse" suffix as it would fit all its variants.
>
> Descriptions for eMMC and microSD are shared with G2L SoM and
> HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but it LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
