Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A8551EDE8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679065; cv=none; b=P+SlXxsfUQjTc57tA0cVSSfJIzlhra28nIb7xA9TdpGJLCHV+l2NAcfNnQtCwoTp1PuHlOzs2nkdK6chYQdTZIMvb9D3M45uWXsnVLnB0nQKymdUdK8TC0VZxuIa/93NofATOhL1ROV7CVsp2+8r8OKGQG8fCc6hDGLADCepzcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679065; c=relaxed/simple;
	bh=TOovBp7AJBZftG0dksjLHjN9+gQXUXQNB4O63AGk+ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUAvRhylkTp6OMNTiGGsarr8Swh2b7sP6e7bIw2BXmdT8u7e/iRnRo4vjx9vfuIPirVrzQhvloZMhs7ok0JXextPVmq6zrcjFa1fnR2deKe0y4LyheQiFmaqU+tnKmFZHNLGD3O0toMLBXXGMsaD9URQe5yj1iCzlgULPCeCTVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fy5Z9o1+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fy5Z9o1+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so23650075e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679046; x=1791283846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeymYWRbDO3OTFfGWiJn5j86DHN1mxMvxZVS6ZWxjik=;
        b=Fy5Z9o1+6rFj/DLN5HPvef30XCjxQw8YdkdmsVgTljsFa8YSVTW4s8OaIyKKA/LCCU
         K217Q4NoQglY4O4T+DbJA+BZAs1Sa3+nta761vifETRk7P40b7tZOSyVlzecwlIdRU+j
         xHFetuSDWUJ3JVi5gOlfcBZtt7tPoA2qHbt8sax1a7CWiv0v0b+1paUawzmjvWtuvQnG
         FModt5W7Imw7nzlKa50hQ5QVexPTxmENbkw85PGc7ZuNR0iBgKcODwOSZzcHyeQXp2QM
         Qofa+MWsuNJh7vwStLC4QkK31YcY51PaGXGD5wvgJbpbmgBp0Htv81ilKHTBC8/iAOlt
         mGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679046; x=1791283846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZeymYWRbDO3OTFfGWiJn5j86DHN1mxMvxZVS6ZWxjik=;
        b=Rade7+YQHRpr8usxCeOMcvTfOpFVIiWht0TGhlXz002sGgY2iDPdZkGFBoklvy2WyU
         PZwCqnI4yqSa/PoQUTp1aDbk6TcWYbF60Bicbo7gxrpiMq33FUSGFoIcSUhKJCpORC66
         isCRVd8eJEISxYebtz6RVoKxSRO1krBkE5a6N4LTWp1ikRdznoIY/NWqRGcxXEM/swii
         22AyhVnR5fZ6tQpKh8U8lPf9m0gJbWmUjKTYRfchGB0Il/FpSrhdr0vwxg8yVzxaf5Uc
         417/UpsWkFm6h12VI7VNBHNZNLgtqX4uEoLHvDyA2yhaReaJaAL4UjanYaH8+4mtSf88
         DWdA==
X-Forwarded-Encrypted: i=1; AKwUvBwGtAxNsD1BIIqN/4ISPs/QrgaHxTVtMS4UV+B8/h96nBKCt+IGGOCeAaEH/GDyyx9ylIh7qj7N/QDQt0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kCVm/J3f+6618ELQSM1NTlsi2zE28HZ3KjMuTFdx56uChtuXjD
	MPWP3IlDNbrK0Q+KKttK6l2w4+WN/8sUcITv/ywBqGDKrAmunmAwVYdY
X-Gm-Gg: AYBFou2IvBRXvOxxENU8DZIUSBOtn2+5P+5i1P4Qu9p3taiE0rTNVYqiWqi6vOCs3xY
	82cPL10Jr0bb5ohvcgPeYriPAcThESNV4yrkQJx7lctLkwmmAFEv16gY0RkvN6YB/Kb8A8naShz
	2fiXTLxwRO75s73eTZftkHr70TOko5Bf31SN7sN7YuLB0EuFzB2HjV4ckA5AVrzR4tA6QiB6Q0l
	lPr9FvyLR0B4ijIcNaVKv26K61+FjPIec2R980kkID/j8xIifKQegQo91KF8HzQvRLuX7kIxYXt
	mGZyOCKywfRel8zC4PjzX6Tpp90poG/lxqIfEL2K1wKFVIHyqRL+mi0tsfLM6v4MStMDRvInvlH
	kgyMpZ6QhUHQAD6lgMncW0vHty1ixp9BvNbLz2RK3v0a5TF2rl+E0l6Fsqb2ppRjjfGQJ3BuF+3
	E9DD64IYpVrQ0x6EgNFB5d0K7f1MaGHxGD01FYArQrBkS/teWHP73zhAybOgpV5oYCM66v6Gj5P
	ZsTT8MmqH/lE0OEEQFU/TCCHz4l2cxprmaW4KIJo9TQV9/QWaWvATYuFcQo2PruTC/Y8Nd+vCuy
	iOYc8kZ6JGrd5eSDro4/7rJk6SG4
X-Received: by 2002:a05:600c:c48f:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49fe66bdfdbmr282392825e9.2.1790679046003;
        Tue, 29 Sep 2026 03:50:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 8/8] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Tue, 29 Sep 2026 11:50:21 +0100
Message-ID: <20260929105021.542730-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v6->v7:
- No change

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

