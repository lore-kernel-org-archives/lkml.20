Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5D84825B8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988524; cv=none; b=tjcYb+oCl2t8KgycNjdbgYWiFkKFEqYxsnFojbcL6OWX0QYYS+sPMOtLvamMB2bZULFNj4G6/aiboPmNpBVF7vp2eWSFW2uqfzUtMtZxGMSe4SaqweuNMtT7x2Poofdpu0gz08btriz5nZGhFVWRLBgDjVJIQ5HG082kPaXcT1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988524; c=relaxed/simple;
	bh=smbOHgTnDqLfvUfS8tyABi4Cl+89CAiGSJnYdaVQpYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kP2Ug71r+StD7alRdoDrDTqmZtyougMpT/xtjpl86ARnVCWndma1hHxJsf2NG3cFl6ELJ1uF2QXPAAjiHKCAc0ws2DlOFpe6GdETGvp1zeY/eFmyOgLl31PN5wzJTgwN2Gsqv64Yt1CdV4ppvJQTzBrBV19GLdXue/x/h4rM2t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUScAqG3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUScAqG3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so15402475e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988518; x=1790593318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9+sP23Ww3lq9DKMamGJva2CDC1gphzBkrBVWrhACZE=;
        b=aUScAqG3T/cOKuT0ndJQZu6lf+t/4aGU7YpePoW3t+lgyWfAQpB9oj+j3k6GdIEsz8
         U68cf27M51xPPOdHMIyjnRSmm7+5+0B59bzCIlaT/vam+rL19Oaf/WzZbhfRR6SG+8p9
         Xyccg0S5Raw5QrDU4DJ0PKsDLF7R+dZ6+XxwVSLP5Z7ttUOy+aHAvgWX3Dw4BK7eTrPB
         0yrsHbbDgzz2Mexp5Ak/VcJqD+4GCqf33goRFVNN4quEFEpV62NM06TecdoyahtYlHvJ
         CzM8suNSSzgpLK4P2akrWfMy27kAVLQ7hSDVFwGueH4abDmfqH0vWLLnCLG09+6PgfRp
         9vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988518; x=1790593318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s9+sP23Ww3lq9DKMamGJva2CDC1gphzBkrBVWrhACZE=;
        b=Fl0b7Ft72pYb3GHEw38gssDRHBf47N8GRUF3BT8WNt4LYNBKJHEWWKrAs3NvvaBCdW
         DnWQye9u4ifJF8IoQdJ98RUH2iTwCT+j2O2KIRU/r+DyjhNGyGk3iFTPC00d7/U+Valm
         /7rZzCu3OeugXgY1ZaYz9KNhpXnp902FLHigrf3aImVru4h/OhaMqHQIb79TWyCSnZNI
         W4ws7zrZqb8s0CeLA0gQHFZ8vItjZZF1CYJ6dF9psNz+LvlaPLVzz7p35y64pQF+sYjZ
         8t2mxGoejy1zUe5NqCr366hWHd3Bz0kjSNt3kcjuPP2bWSP34Bk8k0vnl/Km8FS7muu/
         rR1g==
X-Forwarded-Encrypted: i=1; AKwUvBwJZ1IA47QS/nTrSH9G2ovTE4PBnQ28MZ8/sgVE/lI95kQGjuT8HoMJSNcLZYGDr//ArZwmX7CynyxRsQg=@vger.kernel.org
X-Gm-Message-State: AFuF++nAy9b7z3eNn2sX710yZ9mJKgQpdoFW7W/8vSp6/KMVcdrd2knn
	I//Soc4U91UuNekf1cI9CdnTSX3jFkm2E3TPdO/bK3B50Wi+f9EUQy/q
X-Gm-Gg: AYBFou3ZMn8wTTUzCsOXdhMRgWatfe0BH5GVquqsMUUBTmTg2czOOrj/ATOjLjH4m9/
	l5O0CGs/xqsUaC1dfUPjpzEKCUFSlmWRyfD5ivxgCFLNGA3u/nfEPMYeJMjRfYewck0jwewHw+6
	ZY4pT3Q5iYiEwT9GVt0+T7SS4IqUeeOO+aVCYRWKriEWyXToGxSPkdnvjG8IqNkcgpTM/kMuZGz
	Ioe9Xj+cdRokCqiHZ3fxzqyEADSPYR/g8jj26FWp4LVJ0FBNlkWy37p7E/9CxE+S0apQLfD3neY
	19G4TfY5hB5eu/kOSP/0MBbMUrdFzVG6UXOw8zv8xydkvv2VvVrvXFgSMdCQHYbKwky+fxI02o0
	KR+UCjNA50pPaidkHz0jphdeVMXdgV3F6548w9ngfWGzPGfYNMWdToYYv8UYmjPJ6R7Gu/iKA6R
	JFWkNKT8vPhbKC4UhdVCB45rncqClR0O4fMJ3PCys9g+e47Ft2OYyvf7soGlx+ACIRR7c+4Q6Ux
	WrtEaBndqFgLs9R9ab0O1SPhvRLoo3sSAr0doiuK9XS+Ts4JlOiETuvgJ44/J4vtHA8IZXgNBWW
	181/OIw=
X-Received: by 2002:a05:600c:3586:b0:49e:7d69:83b7 with SMTP id 5b1f17b1804b1-49fc56f7376mr183862295e9.13.1789988518301;
        Mon, 21 Sep 2026 04:01:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:856:ad4f:1ab5:71b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bc34sm214267425e9.10.2026.09.21.04.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:01:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts
Date: Mon, 21 Sep 2026 12:01:44 +0100
Message-ID: <20260921110144.44425-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the compare match and compare mismatch interrupts from the ADC
device nodes, as these interrupts are not wired to the GIC according to
the hardware manual Rev.1.30.

Fixes: 4ed27b4fdeb1 ("arm64: dts: renesas: r9a09g087: Add ADCs support")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index bf81ab9b64c5..68c8daed557b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1274,11 +1274,9 @@ adc0: adc@90014000 {
 				     <GIC_SPI 699 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 700 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 701 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 851 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 852 IRQ_TYPE_EDGE_RISING>;
+				     <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "adi", "gbadi", "gcadi",
-					  "cmpai", "cmpbi", "wcmpm", "wcmpum";
+					  "cmpai", "cmpbi";
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>,
 				 <&cpg CPG_MOD 206>;
 			clock-names = "adclk", "pclk";
@@ -1298,11 +1296,9 @@ adc1: adc@90014400 {
 				     <GIC_SPI 704 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 705 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 853 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 854 IRQ_TYPE_EDGE_RISING>;
+				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "adi", "gbadi", "gcadi",
-					  "cmpai", "cmpbi", "wcmpm", "wcmpum";
+					  "cmpai", "cmpbi";
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>,
 				 <&cpg CPG_MOD 207>;
 			clock-names = "adclk", "pclk";
@@ -1322,11 +1318,9 @@ adc2: adc@80008000 {
 				     <GIC_SPI 709 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 710 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 855 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 856 IRQ_TYPE_EDGE_RISING>;
+				     <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "adi", "gbadi", "gcadi",
-					  "cmpai", "cmpbi", "wcmpm", "wcmpum";
+					  "cmpai", "cmpbi";
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>,
 				 <&cpg CPG_MOD 225>;
 			clock-names = "adclk", "pclk";
-- 
2.55.0

