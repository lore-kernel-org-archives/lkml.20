Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF94495056
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160085; cv=none; b=Nc9mgyR+sBt/pC6tN+LhxGNA60EGcYeJo/euPjZJ0cSfocAh6eG8di1mXQY7qlkoyhGy0pN9QGWRS2LS1W1Pw+ghAP5OJmZkSKmglt/1sinv8d01rxTDCvSZF/qZ/RIXEtVge/LWhvfex+wsXXKAubBq3AScZSYZaZnwnIvWEck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160085; c=relaxed/simple;
	bh=tXbNh+yp4d7OYvEr6iL9Urt30LNuiyNLWr2xkFpYX0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lS/aiPp7mkJqMNMMT67S7Ca8H5mBzceF8AnQIqU3QLhl7Scx9449Xm5TRDbEAFlHEH0rh393eeIXtIphPxX1/XdLws8i4IfOXbwxsMoNS7emxi6x3LIlhLEx57Vn6uThve6+ib465zBDv1Elb/cqFv2G3vGTk4SkjVmZdZu9w0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qEpO355A; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qEpO355A"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so2499065e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160065; x=1790764865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3YK9ZqrOI8tvqhJDLZg7k2Geye6C2Ui46D9pXHp0YU=;
        b=qEpO355AcaED84RlQcP9EfPBQgGB6WwrdQm33rBCcCjXgy3g9uBjIpdvkKt7qo9b9J
         AIkBXmsM3gBN53dCR5a3uMIJSMj8dJYuia9uYZGPznPaMLWWzPZfaEt4IX4W4zdTQQ9z
         HpxTsaeRaJ9riX+OD8WbPvFiQuFsEYlXYRoUV2krSh55OljviI69kNqxNOa9B006ZwIV
         jEo0JKotUUZetv4q0/dIows9Se1Y79qJICGKMBO4LPii8KSO+dvHNY8EhDIRlY783kW9
         xIkGwu2J9jvKET0/Bn+5vqYysRIZXfgsZVuu68BNoSIlAF8X2IXQcp0AU7lB1cLUmKjX
         aBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160065; x=1790764865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d3YK9ZqrOI8tvqhJDLZg7k2Geye6C2Ui46D9pXHp0YU=;
        b=EX9nq2LW1RctpmyrL7v/3nGmo/tCiAMihZxn4D1PjhAxlcN8eVgxFGQWJYBN6fNuVO
         X1GtL8d7cgMyTN/NiToNEk7S/1DiD4Wyy5txYb9LHOBIEuR9kEcFc3WzAUlBW/GN0Hj4
         JieG9nzMe32m4jBzZp70GMaGLj8YF86I7NtXLOG859w2uM94H0el+1+xSTPA0fCp/ksT
         Otb07Qz27R1Zbe+EYKPCQncuG/AuvBtPFAwdch5noF40OmHNWVOCIk/tL7X7xkF/85T/
         +HwEB1Ib2TRRg1NT6QOv4B7m829UCQVJ5TNfHMmUzOyZ/LQmbAKHQ8s0pDJbrkaP/GC7
         yYXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzre8XYMGDg6lcMTwDA42FI/GKuyo30ByOylqV0MGqBtDxCcJt28fqHvsAHJcneYrM2QnurGGgo7Kw1/zU=@vger.kernel.org
X-Gm-Message-State: AFuF++nHo1iX4M9/Mn++APKRkH0D/SiQEsPKaS3VQwKBWpBuDnPvmY+F
	xYADbfn8D2PxLgIUmF0iKLwCU4UIL+qbshUOAnboT3n2cQUaqqTSp1KA
X-Gm-Gg: AYBFou11R/rh+KxIrmzk/wibNQDLfaLouiHm9+qXodvXaQHAsi5HnCO4Q25kmrh+pf+
	YJlgGYQj07VC3BwVS3Mw6eRSZOGfEis76BK+9pHI/T1KN1C69eQIXH6d0MzkZ+mVkjOTw3o3OUn
	H8JAxrwUEccqXVz++PT0/iveFuiiqmD9qpw/wn9Zp5DZQ2mxM04GNZudf+FxnXpQQeNopDUjvXk
	PTQa2Jr5q8hh1li+vkGVAnTZzBE5Lc9rY6zyI9rVlM2ouEmDdOM9jdX7oVSBGhNOa2fezFxlf6k
	EJ+NjYWtFEkfFWmM1NNKbkEkFabWoTuzaaXtZ8y1Bf7mR1BDtKWEE9coZaeRNoY+yRtwPccCwAC
	dJX1X9C3tFwvjY6ZnQI9OACbChySts+7ckIAjpDWEYK7FBwbeN42CbcgTojtyomy5eDgOglPQ7I
	JUtvgTd8bUd+GnLILvRP5uM++86fl6mXZJCqfbF1ixNhaErFiOXe8kl5nWAB62x+GrvyU3+CS8x
	788Lj9msenK9a8rJsQMPJ77CuxwpCYlW+oRwlECqnQYt+zE2tvjPuOBp4UmxoCeSyR+vU/q1bkg
	WDpLklj/r9vxzJgOw/8=
X-Received: by 2002:a05:600c:3b23:b0:49e:6ca6:d40f with SMTP id 5b1f17b1804b1-49fde4972admr34153775e9.9.1790160065172;
        Wed, 23 Sep 2026 03:41:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 8/8] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Wed, 23 Sep 2026 11:40:54 +0100
Message-ID: <20260923104054.3324830-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5->v6:
- No change

v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 68c8daed557b..abca7aa89458 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.55.0

