Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D2843DED4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125491; cv=none; b=eplWc5gq6E88cqcmo5eEnXJeUJpCB+ZV+IqLj5fgKs6V5vGz2pV7J76KJJP8p04r7JkTiMi++0tmrC2M6cucBfMmPKAYVTdsvmMQ0fWGqphFWE/RXcJKHfmEs3wYat6m97nwE5A+i/hmJPLGCrS4xtl+o5QgghhCm+n47iINPPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125491; c=relaxed/simple;
	bh=mhbdJjLcWcQrWxoxCQqlUnOAIweP+fW4TKcbmVB9Eig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qesp5H1JY6vtSFHj1kCy8xRFIDsi1nEKZLcewB5s6EWWwAtsCzn6bMiOqi3mrLBicse1zxuJRqv95NEwQETlHubKeOiaOo2QObnl/lee1qoUYqZj3gFMxLB64DYIakQakSflWB+40YHf3vF6mR/yaNv5q7nlsJD9LJ95j6wI8+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErXaCt+k; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErXaCt+k"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4859b45abadso89060f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125471; x=1789730271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W390DCGBG6P5p4/mz1YZbyKjCuVONBNojwF2gHmC2H8=;
        b=ErXaCt+kNp1vI8oYkkLEyUfI99AKypmjL7CftTqJl7kG1PXLRQ3C153MzSFyipEzdL
         AbcNz163gszA8czf8VqJp8zcWgDGQTrX3X3Yuej2xNQdwoS+T4HZl3PdLLhvEDHgw61H
         DxENJd51k7d616osbajPG51hlKDqfSoFzqAB7+/Vqqx1ouJJMYDA76WbcMPJwzQkxN9h
         48ZUKNiMRu/NyGzZEw2mIMnqBWtSHSezI607NrGLQSA05JUnUWgWhyDGCCpYm2SPZ6O+
         zaLak4tfq1KCgCGHRCRIIrt/eGhA+DVzhoVnmi8H47lx4Es5IGoAQ30FfH1fEanaS6GR
         NR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125471; x=1789730271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W390DCGBG6P5p4/mz1YZbyKjCuVONBNojwF2gHmC2H8=;
        b=UDIBz2J8SzVUjiX57WyJ6jlP1v4/qcUK73oMURWpFegXapMqE03r0pULGUzYvBUZGL
         sWiInzY8GWBzCDfnnPX/ZMSQ9PUG2hIp/KhQKWqKqUJiteXibTWDZjvTkvS6ReO8zbN1
         pFuzxvd/eM9uu11gZrTlTjJ6ZrY1dtcmbZJELE23G5izbW+xWL71Fn0TWZaT0jikltvf
         YmcexbTTyBbpf5DorNFzrjwmluy+CNr+QYst8p6hbpyEvmLzASSegOcGHM3oxeyYUsM5
         U2+B6t/k5h64ddQrzVAa1xKxsL4MEA+ORdyYHe6CtER0bUiTYAT5vUt3uBBEm/PhHxcU
         Pp7A==
X-Forwarded-Encrypted: i=1; AKwUvBy2rcnZwwiW0V/26awuzltLyEiRZAhKyheg1Oo5j8ArVh9U2Mba4VcxVini5DVzRetAyZ3p/k5DzJekuYs=@vger.kernel.org
X-Gm-Message-State: AFuF++nVdDX5Hwa4xNMxtZ7JNHIw0zCJV3c4raW/LqAu13ky4aOQzNJS
	tIS0pEvtvyXxVCXJ80al2Lo0kODuHCtQYpFUBJLkMhwtso8YwHC8P4Jx
X-Gm-Gg: AYBFou0ETuNCALonUx37ezbrMZWJut1rO3iIOOoJORUsHb9H36bzQzSGbI7c0g5k+9Q
	ojK3FSlheCz2x6WIy3Us/aHuQM4lImKEG1hevS2+83wIw1g1B4z31gUiSBy8VIOppU2nYiGgoEt
	uN/2Stox7foj25QifJQYdpuYqGMx41ot09QVEdQKAGcc1eNYjzP0LABGhIwwxibGgECzcZHJY3e
	b6SiPJGSRa3YXgCCDaGpBjI4doyLtPS7daqJXY10Nc7NAlebYkAljmApSU/gkNsU25iYZ7dFc/H
	BEqfpTZ4qZmvy+gu1sTvprbgGRi57zwomyXDYzAb1maa/vSWc2jNMcMu+MqbotS9VB6CHMso1bF
	e2E2Wfn9siz0OwFR4nEt01hu2CDXp6MN1RTFqo8gXsy6d+YszRnDeS+iaFb+44WbLcrcfc5mABy
	yn7+8i+2f6i0jjmwo9JFPqK8QiVCuRHo/HRNuXJpLkBh/hFx33CBu3r/vUzJHLKQKtGk73r1VRj
	y+DPgUtVWIWdB+ODSz0OjwG7ZZQDgpPpex/j9buJxsBcILlOP8VigEMyFTREONn6rqYcz+HTA9W
	zCh76AH8qsjEcviCtv4=
X-Received: by 2002:a5d:4083:0:b0:486:e9b7:4868 with SMTP id ffacd0b85a97d-486eb2ee556mr3524487f8f.20.1789125471098;
        Fri, 11 Sep 2026 04:17:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 8/8] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Fri, 11 Sep 2026 12:17:31 +0100
Message-ID: <20260911111731.3404308-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 813bb0cb021c..3ede2e89cf67 100644
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

