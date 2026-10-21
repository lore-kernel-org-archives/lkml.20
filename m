Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571532;
	b=wiKRjMh+2YrzTK4gGNObgSC+kW2tGXXl9JiCa+1DOV7f2nXhLcqbnR73hzc9hMvwx1IQ
	 oB/dpB7KmSq6BDMw6J+T+QustOPDuHHMyC6IUR0eltR1duyYpkZxe8raExiKXmut5E9Gl
	 sqB3t4OAAnpwLL+SXzTrWrIqXaHSOBqRfthZRwsGq0dgOr8QHFCuBL7Y0Io8MRIUj8cEn
	 ZQwstY6JFtfsS2vjftVca3mK8AtUcivEpuTlS4T3TD2Efr99Vu5y7J7exbAImN3X/sWSz
	 fUKP7vtXohGI5O7AkO3uA8fsSs1PfzWUiA9kSYNfRyqFd1PFiQGMGbUUMpdpju+jCiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KdtZs5yQ0gfzkZioTR0NXAt7OEmNZc3GQ0ICx13Lmw4=;
	b=GVsbdYwgfeSD/pGJyF7FFqptkU3CmlAYB3KGS2Ls+5WmzWgX7IKv0TRz+HaradtfZwDP
	 rktEXmznsywHZS8MMoQDyCO1Ra+6EUixCzGSrXsXgzY3vrmcUrYK13whnkj0YxobMU1mM
	 vdJWDbs0XKxS+uS5AhqCF9K3ThEaIpZlpZd2DXNwcwigw/+cx4dgMbM6uZdOrABxjQsFJ
	 C3dhNJwxG0erTweTCjdy/cF7kURI+U2awgBObz6d29K7xPm256BpOaUVDyGHEua+kisqX
	 naCrkMu0pvSsZTWDNqs2sf5jUmKKm1OZlVq23qhscUvXU9OJzFw/IEOm+NsVZr7O5yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y8uIgJUd;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDB8606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDB8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y8uIgJUd
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so2909275e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571530; x=1793176330; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KdtZs5yQ0gfzkZioTR0NXAt7OEmNZc3GQ0ICx13Lmw4=;
        b=Y8uIgJUdOgZFBBhxNjfUhdZtiZnQVL0ehbAHn1ZJws1zHbjdt+SnFEdFBg3xkaWjHV
         zhUxljw71zls7swvmgMQdOhs/4f6htNo0RO4xP54GtmicFtP51UnMZAToG1GUbgB5kBi
         gxBKSTEU2eEQeexcg6csolsSvem1YjJmXelUmQjkW8cB5jVe8s/U3nHVBy82Xr0N4+lF
         +6CqUeOO4PPETjajztvOd81R/EkwrR6aqTJ5JK2SUAd2sLHi02tMPq2aR7dmX9ADypfD
         /oE6+ux+IqXxdRIXQ1iZC/LrnXNKRpWqeCER8GHsJ4n7iutNR33kUFz3a+xabQDCy7Y0
         0NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571530; x=1793176330;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KdtZs5yQ0gfzkZioTR0NXAt7OEmNZc3GQ0ICx13Lmw4=;
        b=zls1D75wgkJcYV2s2fAtrRTzkAm8Xyr379oVhSa8WpLNQgZ0pB5W56fbzdjrQOyT3+
         kUUpNXYxv9JmC8u0yzmlLmt5NlBAVz9BCoqG6qLLlFPM9TAAkq0KP3+gGkH8bwryd3/E
         oBFIoknJWm8F1xBIcyapLgHwOSUruQCaQYiBM4CnoInJy+FpU6kecB6ObKUCGZAMc1TJ
         ZgWDiLFxNpBUIt2Z7nWq2eWkk4zXXZMhNTyzSaboyuSP2uIIc8PNXnRJJC77xvImwK/6
         YhG9bDeVhPas0Tf/omDobwBLAPoRRIrKZZq4SCmKfDGalUdRq7Z0VgmfhpZe73f85bFx
         amXQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2vR5h/VBt4Dp5R1oN8us+QS+OC8JwSL/J75ZaLIvFrn2cCjo1qTtdJg/8tFRzAwuLzwT6ZGYlIGAsdr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL0KkULdPPk+sYOcEFycB02IG4vd+UUXFSsKCRfCPMZkedrkMI
	9yrY5i/GPTdSirnv+Jm5J45Mx1D/lebvrwASl0cSUKzgAscslUAv3Wlh
X-Gm-Gg: AYBFou0NGhX86W2y5lFwUfa3iOJLvpAzASKaXX7QYp75MF/KpimjMA32s860XBjkIF2
	3DMDO+/e0gBzvy6prwYCdtR7bbIkGyy2CN9WCAilt5TdnDGmxwaxx+9TybJegZmhOYOk9LenZaD
	wWblJYsHTvdrczyqrNVo4rndGRL9DUys47fpxafsaT1xvZTpZfu0xkKxqP8maEMyPcKfvdgCa51
	fgDqxQAhb4ooQyyhYMKjamCiVwv/EybX4FZ09JemDP+8sQ86geZd83op4OohCD9SSZCMYi9N0aC
	LN0scADC6fvZI1Mn40hDb2NoHYGYp5Ras12/nF+1W1aSYfShxdwM7Qawo08nRKKCfctH95Z6kqV
	hgl3caJsCoq9psAxwK6STn90wrRUaqdl0bwXElqlUfsuCBf1ra5CJIRwCCOmdv4qRQxZqvAqcxR
	L9yoQXfuwWCpNkWvLEZC9USyVA2ANsFXuEDVa/i2z1TbGli77wr66jlE6sdm4ieokcYctox/dX1
	XZbrcBgUkk4UcZBHTHDDSpeQnYr6GvW3LB1dAfjdYNKOns1S9Jph1jnKrYM1esMym3NEQiaNNPD
	CCvUFp5S52JDg5cBKuM4fuHD
X-Received: by 2002:a05:600c:c04e:b0:4a1:fc66:b62b with SMTP id 5b1f17b1804b1-4a1fdd417admr15959935e9.35.1792571529448;
        Wed, 21 Oct 2026 01:32:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd2eff9sm36250145e9.4.2026.10.21.01.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:09 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
X-Google-Original-From: Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v6 0/4] Add support for Renesas RZ/G3L CANFD
Date: Wed, 21 Oct 2026 09:32:00 +0100
Message-Id: <20261021-canfd_rzg3l-v6-0-b4abfdba8e70@bp.renesas.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIB42GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDIzNDAyMD3eTEvLSU+KKqdOMcXSMTiyRzoLBBWpKhElBHQVFqWmYF2LTo2Np
 aACrmW0FdAAAA
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792571528; l=2403;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=U2NizDx5e/ZaD4R2wi+ffJ644tq73i8imRwCaeagpUo=;
 b=KtxVPj9hvLegzG5upX5EOnw3PtCx418FqPvfZoglAt2bhk1uaBarM5Gcppkjjfim4ghOFnogD
 6kngtyDTfUPDOGw6QsefAC7QlKLmMXtckj9wdbtu/edTtrdzbPJ3lnL
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Add support for Renesas RZ/G3L CANFD.
The RZ/G3L CANFD IP has 3 channels and 11 interrupts compared to 2 channels
and 8 interrupts that of RZ/G3S. RZ/G3L has 288 buffers compared to 192
buffers on RZ/G3S SoC.

This patch series depend upon [1]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git/commit/?id=2b4a5055d517b11bf4a5671cef32e4d77bc45626

v5->v6:
 * Updated commit header and description of patch#1
 * Simplified renesas,no-can-fd description by removing the mode list and
   keep only the statement of what the property does.
 * Updated commit description of patch#3.
 * Dropped adding RZ/G3L in the description of renesas,no-can-fd as the
   description is generic.
v4->v5:
 * Added patches for Documenting RZ/G3{L,S} SoC has no Classical CAN mode.
 * Dropped the patch "can: rcar_canfd: Derive max_channels from the device
   tree"
 * Dropped the tags as there are new changes.
 * Restored maxItems on interrupts and interrupt-names.
 * Added resets/reset-names required property for RZ/G3L.
 * Added r9a08g046_hw_info to device data.
v3->v4:
 * Dropped maxItems from interrupts,interrupt-names and resets.
 * Collected tags.
v2->v3:
 * Collected tags.
 * Added check against RCANFD_NUM_CHANNELS, to avoid overrunning the
   fixed-size rcar_canfd_global.ch[] and transceivers[] arrays.
 * Fixed typo 198->192 buffers in commit description.
v1->v2:
 * Added support for deriving max_channels from the device tree.
 * Dropped clock patch as it is accepted.
 * Dropped devicetree patches, will send it later.
 * Updated commit description
 * Dropped RZ/G3S fallback as there are lot of differences.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Biju Das (4):
      dt-bindings: can: renesas,rcar-canfd: Simplify renesas,no-can-fd description
      can: rcar_canfd: Document that RZ/G3S has no Classical CAN mode
      dt-bindings: can: renesas,rcar-canfd: Document RZ/G3L SoC
      can: rcar_canfd: Add support for Renesas RZ/G3L

 .../bindings/net/can/renesas,rcar-canfd.yaml       | 31 +++++++++++++++++++---
 drivers/net/can/rcar/rcar_canfd.c                  | 31 ++++++++++++++++++----
 2 files changed, 53 insertions(+), 9 deletions(-)
---
base-commit: ef2fff76f76133f4f02bc4bd116858b040c17fef
change-id: 20261020-canfd_rzg3l-248b76100fb1

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

