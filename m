Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24EF5304C8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176260; cv=none; b=Xx2YUu9CAB5Zm1hBDSQwftZQ7rAoMU3Zl8TrKe1as6fpQQByLBhMPkeYdhdReK4vRD3mrohnZgNBk0c5NWQJF3/6R8o3WqY27fYFBs6PjYepkHNcZVFhOWzplbwObDweQYKD3hCK8n0+67VmIp9VUOaijVG72KPX2zczBtVou4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176260; c=relaxed/simple;
	bh=4At2W+U2/moj7AT8T+hicJRX9oknEhtMUmhLAdjqwNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBVMeqrSom5UFd1y1wLkfawByyaGwxnqxDUTMakhiiRBRztuzDokv6NSodqLS2Ay5VLsOpKrrHL/6afs27ryLkXkPOOUPMmITUzVrrEDu9alyE/c7UPELzxfOjf/DdfN1g2gpcXr5yyhzeew58cmoC0Tnb7t+yZ8hzAwU9Yc6wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963d7503fso429560e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176257; x=1790781057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cCnq/zzLYRUWzxPlHY5tjdaCgBAl1dYFcApPP+PgMMU=;
        b=ooyf6eyN+dzjTlWY626dhRXbeeX0ZGjmNmHwbFk51S4b4hPI5YLDQ7Yo/VStRrFDoy
         KmXcBs0dvJLqGLHzDDg3U4EA2Z6v/fJ1egMAYb3QlJQ+BAR1Sw9uQ7VJDA1Wdyt6ywgp
         tVNSrJJndo0z7NjLyo6uglOypAF/YLDZbCb7c/Gkxz7ldQwvsSZsWpD1UlbqE1Btm2TI
         jCJxuvPFu3AbV+JoU2MHzxTpT6G1K7d+2r9DMStkAwX6S4H4n5dUWGnRy6CTgm8gNhQF
         6+1cKS8OC13q6H0V8Abb69lMuWnbBcPSqxp8b+zdCg7aXvvotqZ3e19KChYEzyg3st3X
         hnSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwD7oWjhK/mroFttcvGCcpL3ALK6guLS0dRK7WNkrrKKLioRTQXfVyvmvjZZ+xd6kBXT/HpkwBOqX4qtQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kJGdcfr+Mfq4opnK5O2QfOfWEH12UV1pLvZImLUJ4PpRHRQ62f
	nzla0oa+NUs+P1jzQOma35tnt3AVoC/SKipWZXpsrywTxBSE/+YESQ48E810ncqeKEI=
X-Gm-Gg: AYBFou16Autp8D05BmFKr1Z13hazVrmh0Q07l6qXIjR5QYVH9qV8haLBTXYKJPu9jFD
	o8F9cq7XuB3MF4RhYgyRhz+AXHgnV9broV1E3WU3nGHB7BFqYi1Dl6UYxx3optUOfgGPvOUmvwH
	qyy/24V6OqBeIggLb9LMdkLzpZW5qSVX0f5CaNUzjQcGH88R+dOGlv5TRyPrribQyRxMPW2HYzm
	OHUuCHkl901gVlwlg99G2I6FWfKo73QzdpI7xa0dJDaOXzu+Xaqpx+kE7FE0vJCfu3W0OoSGHnP
	wxKYFxHsQiu/sy3jyYVRLKB16Lm6ghHQBFnCsGf4H9c34pxHHIl6UqLaHOi4lyaOkmsU+S5oCca
	NG4lqnogr5CKMzi/fyNyRM1EzRvLw1DTAlqWGy7C478bSORQ3nt20WAPWhUjhFTJv/derPI3CWT
	HIVty/Yb+J8PZFLuslgL+2KlH/UZtZ57/EBkJreNb6BTgb4iLcswVQGIOVRm8JENo7Z2gm2bGQG
	etXSBS/aHQrQ/MgD6qxmhtU6KJqUKOCVinhUg==
X-Received: by 2002:a05:6122:1d89:b0:5bf:8955:a8ce with SMTP id 71dfb90a1353d-5c9f157d823mr3443044e0c.1.1790176257265;
        Wed, 23 Sep 2026 08:10:57 -0700 (PDT)
Received: from mail-vs2-f27.google.com (mail-vs2-f27.google.com. [74.125.227.27])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851e8c4f2csm1228383241.10.2026.09.23.08.10.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:10:56 -0700 (PDT)
Received: by mail-vs2-f27.google.com with SMTP id 71dfb90a1353d-5c963d7503fso429540e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:10:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxdyFmjm0eh5E6EeEsyagbG4Fje9nF8VVxdByXXjKukpcjGjnzuflnBrPaTFas9bmhP494zWcf5J4WHkEk=@vger.kernel.org
X-Received: by 2002:a05:6122:1d06:b0:5c9:a60b:e5d1 with SMTP id
 71dfb90a1353d-5c9f165640fmr3422858e0c.11.1790176255382; Wed, 23 Sep 2026
 08:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-10-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-10-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:10:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjRu+cPZo7V0jErowLp6n2xinAXtw9Pt=On-nshBH-Eg@mail.gmail.com>
X-Gm-Features: AclHuK-BF50Mc9e7D97YaSRELj5RHb8ahiU8YbPOF3bWrJ1zKR2oLG_CwN8d9Yc
Message-ID: <CAMuHMdWjRu+cPZo7V0jErowLp6n2xinAXtw9Pt=On-nshBH-Eg@mail.gmail.com>
Subject: Re: [PATCH v8 10/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2lc som
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
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2LC
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 100Mbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> RZ/G2LC SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
> board. Provide dt overlay changing pin function from uart to gpio led
> control.
>
> While the variant being supported here is named "Ripple", the overlay
> still carries the "pulse" suffix as it would fit all its variants.
>
> Descriptions for eMMC and microSD are shared with G2L SoM and
> HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
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
