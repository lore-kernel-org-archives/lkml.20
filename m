Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7684EBADC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787606; cv=none; b=WPFZUIRzFsGJ6SLdapK3gdhsvG7GasKNsOlSmw0w5YvkdH3GDInx4AcaB3ZDIDtEo14qn/Ut6pW7nmxZsC0qb3F2XUAPW6xyU3GQhhX1rsUGo3Q00fnQg0aSwrV9O1EYhA305oqKirfSeNX9B46E2bQl44l8pMSZNv1IcD7ry/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787606; c=relaxed/simple;
	bh=G5jXm9KUeZYj2Bl7i7D49ZYRWMRfZvF8D6J8EGNejlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFa6H/CNTVJts47tHC8QYuFlzbKKJwT1drZW+tJg1/wPpG+YSRmzKyT0NRp6XbKHQEDxv9tYUIPxLwGy98EyKrmMvsY7ZRcyfNhW7VJDlB5KLYd4dbOiwfmNA7WGk/PpeKJUjRvtfL9W2RJ+IEs2yMvWpdmj3r1g27pt4ytIEEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=c3PMpTJ7; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="c3PMpTJ7"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c252c7270faso506685966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787596; x=1789392396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+tecQI/RAFJySwtEv9OqcvDunXy81vhadYC9Bp1rn4=;
        b=c3PMpTJ7uV3eUQmqwJKZj8MU/BCxWMS/FlDW05chphrUBbMxw/LTrkBm3+m0BSN22F
         rLMOBq6KAtAaQcfajZOsRxi3/+GYrugDHvwnG3Okh+2+sUE+TC6MAHsQ3eDeG7P83x4S
         PmB9aSciY/WcAWc+bMrQFt33zjeTr+Z7svaWILoPEgXLlJhAZWl+ty/6PoGUc7gak2Zg
         A4ZmJGQnKApCkD7/DN+aQjeqm5xrKBcBELYq2cBjC3zd559RScw67SCWDxLkUT6a563C
         K64RNT1vUDzsRvxCGozY9YI7OQaBE422SsTGDUNAvk0OpIyDjSKZoTvlLmY+IEK/PQvk
         ZxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787596; x=1789392396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+tecQI/RAFJySwtEv9OqcvDunXy81vhadYC9Bp1rn4=;
        b=cU5zoci2otkGzTw2M30XDOGf6PyY12ipSHdX+kJ5+SCuo404Zds0JRQH0kPPxZsBrQ
         ZmvhcYdq7A8EnNc0V/E5ZJ0oLuA8WZWWH+njWEcOAg7oUT77S4CDiAjBKJ+Kz85lkqR8
         wuLYt9ar8D/uWDS/2TcIU0DJr4rTynX+SAujvrRDiWYtDeca5M1IKEHQXJWZ9bwdIAd7
         koSQA1OwCg4iZUm3GUOsug9B8IOp4pyLXP0ABSSUyLOpto1jHhdyfIuB8W64gO8d/8Bi
         D9Ojcj++BMsdKO47fZFKPpSUF4YmtYa81OuWGDwtWCfc3U/+JZpRGg4Dh5DGZbjA2K2e
         j0rA==
X-Forwarded-Encrypted: i=1; AKwUvBxa1WQ+lKRQpuxJeCCpCSbs6EXOSbEiWYNdZ50vWycRyJ3NFTmVDe23HNyAS5RSn2cexlCQbhgYfwEiOF4=@vger.kernel.org
X-Gm-Message-State: AFuF++nP+O/pLtx/tYtyhU8e7lSiQwEvxFYHtgZYtxF4ixENx7w3FpdU
	xQ7vGTfe9+cQ3QlbnklBIvBmt+OfBqMg+0Rx7zJBP/v3jq2cRZLJeGZkcOO7XPsUX1k=
X-Gm-Gg: AYBFou2FTkg2LMXGjtf+ROjWUhKwdRS0Kz8wjDRc1WVB9sS/pjKDwZjG72HkrP89M5q
	Rtq5Wa83tH0Yo8bNia85obahHbMwq66yTxiTHAOeSzVkJhbp75u6GhLFoqaC85H4MttJaxB068o
	k9LsNasUpb4ipXR3RhWdnyjhKEnVkZGgLO3EIh9dcpxCLOYPkLo1Wwg3rYjnoEjK8StwXQq/KzA
	GUWFFyqTqTtf3mZHoC4Xk58KKtyMlj5z4MMe8h9vkDLA4nsUEPaJSQj8nit42NYKbQ8rRkbdA5r
	mbjswHTAVvCzmV8PR5MjiugDmNUI6ir3uQY+CKkhtZnrkLGI34wb4Lydt88ma0FvPHk6U1dlgFi
	DB2oqgiyAlxBGfSAtBDQr+ZAefCKivf67Wi7xTLau+2GRuJroap72hn8asO4ikTfQySiLCGei1Q
	4Lq0XTLf3gHILVh9rQ/uD1TLOcxCInHW2VlxOI0EKsO8Zs+P/9HhawJ6+CRCiYUCq3oRGRq1Iwb
	qppnHfFpncxagcOPYof/FtB1LJjqvq96TApyc65LNFtY3+S2AqoCnIuljbMBbjB4IOlvycZZUNv
	cbfBrB3Ts8SBYxxE5MfpcAd3DTxpZr4yst3IIBBs1veswbyg
X-Received: by 2002:a17:907:d28:b0:c25:8eb7:f388 with SMTP id a640c23a62f3a-c260cc0bcdbmr1608993266b.17.1788787595858;
        Mon, 07 Sep 2026 06:26:35 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:35 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 4/6] arm64: dts: microchip: lan969x: add SDMMC nodes
Date: Mon,  7 Sep 2026 15:25:32 +0200
Message-ID: <20260907132617.1198548-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for both SDMMC controllers. Connect their bus interface clock to
the fabric clock and their core clock to the corresponding generated clock.

Configure SDMMC0 with a 100 MHz generated clock for 50 MHz eMMC DDR
operation. Configure SDMMC1 with an exact 50 MHz generated clock so the
integer base clock encoded in the SDHCI capabilities remains accurate and
the identification clock does not exceed 400 kHz.

Keep both nodes ordered by unit address.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Use the fabric clock for the SDMMC bus interface clock.
* Configure SDMMC1 with an exact 50 MHz generated clock.
* Move the SDMMC1 node to preserve unit-address ordering.
* Explain the selected clock rates in the commit description.

 arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index a8541c6a098d..5e330d5fab50 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -414,6 +414,18 @@ qspi0: spi@e0804000 {
 			status = "disabled";
 		};
 
+		sdmmc0: mmc@e0830000 {
+			compatible = "microchip,lan9691-sdhci",
+				     "microchip,sam9x60-sdhci";
+			reg = <0xe0830000 0x00000300>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_SDMMC0>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&clks GCK_ID_SDMMC0>;
+			assigned-clock-rates = <100000000>;
+			status = "disabled";
+		};
+
 		qspi2: spi@e0834000 {
 			compatible = "microchip,lan9691-qspi";
 			reg = <0xe0834000 0x00000100>,
@@ -429,6 +441,18 @@ qspi2: spi@e0834000 {
 			status = "disabled";
 		};
 
+		sdmmc1: mmc@e0838000 {
+			compatible = "microchip,lan9691-sdhci",
+				     "microchip,sam9x60-sdhci";
+			reg = <0xe0838000 0x00000300>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&fabric_clk>, <&clks GCK_ID_SDMMC1>;
+			clock-names = "hclock", "multclk";
+			assigned-clocks = <&clks GCK_ID_SDMMC1>;
+			assigned-clock-rates = <50000000>;
+			status = "disabled";
+		};
+
 		reset: reset-controller@e201000c {
 			compatible = "microchip,lan9691-switch-reset",
 				     "microchip,lan966x-switch-reset";
-- 
2.55.0
