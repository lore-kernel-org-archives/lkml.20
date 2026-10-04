Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1F1346FB3
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130345; cv=none; b=Nja8EkrtUmEVZgUWNM1oSuJiZZ/d47yYOGl1GTbWvq3JdnofN+nnLrsxvDfryi0ImIz+pIj1EVHJfPEnVxyQPOz9vCHyYzUPc8+6AKAzaRxxxy3mhVhKeATfyTU6o+CGO8/PXhvNIE+yrd0xeGRIpiulICtSMjB+beO2lXfh70k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130345; c=relaxed/simple;
	bh=ISBUPqFw7wNmmwSKd/t0me9jm+A7Arcai1rEaWlJqlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TKR950LTZhJ+TFAbnPqOftnyBhhpXobWexlrFdhPThrvbXbCtQqeRXtCmIqmDgxWmwz+p6MhObgmCf2fngomxN7wz/ky0+L1tIGPm/a9GyroY//AYg2wciyuS2nkT3SSzKEFxRkYY+gM8SAOV2T+7tZbySLMsX9Ne9051Dlb0Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oaImtvPC; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oaImtvPC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so6423135e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130342; x=1791735142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Ta+kiTYB3jF6AJ+xesMAUOcOgFo1sUTMQNfw2Twlgo=;
        b=oaImtvPCmMJqVUkuUvdwuve+EblECKDB0CsTWmFMpbEnBMPgL7Ie/J5oOEheWgGk1R
         0TEk6NhMKOiZeBRiYUs/xm1yMzxami5lXIAKbJbDgah/QniZRW7AsPI+/bU2ACeTiaSA
         IE73j2yJZ5887WCDn/hnMoBBC8JA66UMdJ4Ueo5j1hFQvCA8gfiP19CWHAUPkG/2dmzx
         0STScztkadYO5sqOSqsRQvFcQDUFz8ovygq6PcYBU1syEWpAA7PmjPb4g0ugQjbjIOK2
         jU15RPe+evmux2n23engIOFUcoZCP2z5P3s8BrUnJglxIlH9psDXSgw2yve6ZO6c6Vnk
         MpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130342; x=1791735142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Ta+kiTYB3jF6AJ+xesMAUOcOgFo1sUTMQNfw2Twlgo=;
        b=sBGtLwKdRomlGbo5kVrl2pvg/0IMXS1habxzhggWdGYEHjxgIs4yeL1t5HxjOlCv/F
         8manFcgrjGlBzepiFB7eEsPNyO5Kyz2XSOvnUILdmIawbn4G6blCIHACt89Ta9iIsgjg
         prXbvUHwxxcj02/zAXgL8VwZhfyuUfPM6bopj3aFclH5THkB+vkZdaUvtLgS+gouadER
         FRtqNhqMNZsG+FUR0AtJlSI2y2vjkrHpjs6jbG8Otvh8toeXIP5+5pbphlN5wz6xc1q1
         8bXhsXib0QDicJptEgwUtTCs8T+X6RfrQGwe+BVzciq36pBx6F5oVQkWUez6vE3aYfn2
         DomA==
X-Forwarded-Encrypted: i=1; AKwUvBwOTgmqgFttyNvKaLIc4QFsVcExl39DcgFbYk12059NHjEj1iBA0ML16wLUfWUZm2crqkJBRHvO2XD1cBw=@vger.kernel.org
X-Gm-Message-State: AFuF++kESOxZQ2bQW+DxNBogM/fdDLSyyQJeqCCVn1YRTlV0YXSKnrpQ
	GLdstuZDIXWJKDthiEWlN2fFwRGqNZ4UwzguuFGqhmSyci46LuOKWXjQ
X-Gm-Gg: AYBFou2nK7g3x8nLkCkPnwozOOPGteERoW58ejbe78AQg1lZn+yQyj/Ick4Ieqi+Nlo
	27fjbZ5Dw9f2d+n2GLqBzHHxtm+JiKhs1Ni7nL1xpbF9k9/vrrn5QLHjKWuSDMLTHe1abZId1vj
	zGmXoeilD8VcI1Q6ZEgsdHad5WV5/kYXiZjgrfcsF9MVKjkIA24shSTzeBGkfJleiDvVq/cVH9o
	G3E4uScrlj1ir/C8NZn9yERKD0HtGNcDKkuIB+PD2vRpKz+Eo6CSKYla0rkZQG3gK5RhrwlwqdT
	q9chqo56qGbTNj+QFf/SSdsCB0ErFYAp9U9Knz2FfrcPVNNrcCzfxR6Cx1u+PVXUuegFRN18yIb
	Iu3ROomLPlvAKGae6wX28cn8NN9d/+8SWsxlLB7hG7tOatt2hVdmhiKNPS8GggZvlhEEHo3XpQZ
	vymwr51nLiuwfSmlhfSBh14zyf92BpGHy8b8jHn5rofReAc9+fLG/+p1MwYz6ksFRVpWlPu+FFv
	QFkN4+e0O3Mg58i0q/pzV9FGBk=
X-Received: by 2002:a05:600c:8b81:b0:4a0:136d:f721 with SMTP id 5b1f17b1804b1-4a02759b013mr132352105e9.17.1791130342155;
        Sun, 04 Oct 2026 09:12:22 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:12:21 -0700 (PDT)
From: IS20 Tomer Maimon <tmaimon77@gmail.com>
X-Google-Original-From: IS20 Tomer Maimon <tomer.maimon+nuvoton@nuvoton.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v10 3/6] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Sun,  4 Oct 2026 19:11:48 +0300
Message-Id: <20261004161151.803563-4-tomer.maimon+nuvoton@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
References: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomer Maimon <tmaimon77@gmail.com>

Move the timer0 and PECI nodes so the APB children are ordered by
ascending unit address.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index a92fbd3..542f27e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -58,22 +58,6 @@
 			interrupt-parent = <&gic>;
 			ranges = <0x0 0x0 0xf0000000 0x00300000>;
 
-			peci: peci-controller@100000 {
-				compatible = "nuvoton,npcm845-peci";
-				reg = <0x100000 0x1000>;
-				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk NPCM8XX_CLK_APB3>;
-				cmd-timeout-ms = <1000>;
-				status = "disabled";
-			};
-
-			timer0: timer@8000 {
-				compatible = "nuvoton,npcm845-timer";
-				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x8000 0x1C>;
-				clocks = <&refclk>;
-			};
-
 			serial0: serial@0 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x0 0x1000>;
@@ -137,6 +121,13 @@
 				status = "disabled";
 			};
 
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm845-timer";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1C>;
+				clocks = <&refclk>;
+			};
+
 			watchdog0: watchdog@801c {
 				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -161,6 +152,15 @@
 				clocks = <&refclk>;
 			};
 
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
+
 		};
 
 		apb@fff00000 {
-- 
2.34.1

