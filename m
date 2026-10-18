Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC244C33F9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792333397; cv=none; b=Qk50z06dZQ2kFW42pHb7Mxeujmll/8ZtUK5a2kKdJK42pM2wVZ+vBYTtq3dczxrcBnhNWiiHdXtI+nJHQ3cKZFC5M5JJPY3g708hzb0ETi62kcss0OBHWbItmGQAsx3dzE5E2HL8dYrHFdlIrQEbd/D4TJiZBK+1KQf2e1LmP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792333397; c=relaxed/simple;
	bh=DehZpx2/K8ju4VpADuJdHXsOH8lGOwPvHMyPcJsyyKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n5DTHhIe39Om+qC4BjLChwwNonf0x03pSsMWiOWnapKgt4JlCFtJImqdmehcvC1/5l/aaQD44A8IBMIlM5hhLTZMI7vr3VRd0IlMH8PlxFbefVxOIOPMYiQfaNXZlkAFmg5Wjae0/gj342+5+cfraR3G2JKisx1e8H8rfZe4HB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzpbPE+0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzpbPE+0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b001cd92bso653258f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333394; x=1792938194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A95fhrvfAAlu2Cvs/sZqanN19o2eeng7TB9Tzs9GgKQ=;
        b=DzpbPE+0k+5+uiSp70vXXau8zR7C++OcT3waA7+NBGhSoLa/BzyH67v2I+TzqpRNLt
         uN1GF7WDN3fzAZVJyHPckSp724E98Q5PSh+zAC9sWm2ZU4rrP6f4MT1eHk69lUG7/7dQ
         fdvK7Lb1vrec3fg8q5+CJbOB6gRFeihL6hl6QSaUe85edhlwHN9Uxz1FU9o8W4ac5gEl
         4wlPNEKdBlbdRfzTuHoflWoZtX8BG8nxSWlxFP5l1aEvtHSc+nZMx8HZiFJF5YfI+tac
         3glT7DN8GFdIOriYgvl1zrhsTGNEem7LiasVEdWul6GjYIptHuYOdsK2Mx3jPFNVaOq2
         Bc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333394; x=1792938194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A95fhrvfAAlu2Cvs/sZqanN19o2eeng7TB9Tzs9GgKQ=;
        b=ozZfxSIwVqitUkrRMhjPu2FFxUWgnUC4dnPgnRiIzdlB5AYgcQhd7kaymepkfX6hyk
         QwGoX5SXPwbBExdgr6tChZSKzl4iI+1KU/Cms6dbMiPOAUoNnHNpkXwWLBJzsyh0HVKr
         8SpXFA/2js0qzQIJMLbdPikL29dGRKg7nji9DebqAVyxzMrfM3cJ/pk2XzaZG2ocgA7b
         0DYDTCkAyxwG3Jn5udE3QM7Vlz9ENlPIyHmCFIfSCTaebvZABYtTsk9JlZemHNvCjmFG
         TK910LOu7Tl02oY1Kc8dQfhMkq+muJdcjv/Jcxlef2vOceRsFE9UffsNjs4F8T9H3BQi
         p38g==
X-Forwarded-Encrypted: i=1; AKwUvBzItjkUCBqCllTLL6i8sT3Y9Snqs4e0Lg1x9KUx/AJN6caCLHSX8IDPR8l3Otds7izD8GHzpP7PDqvIARo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhwlo1Yvl6gWF3OL3+nmd1zXTDIMoscnq2VZPqPTONZindR/LA
	Y5wpdhFf3Jx6rfU0js7xc/FbTxlbl7JG+CBVAPD6eynF66ZQ8H2SA4Aq0HxrSA==
X-Gm-Gg: AYBFou11yWcGCIXxiDGaTu6Qj2e+A9Q1CqFeFzOjX1NlD8uIk7SfT0CU6k1AXZECnpX
	MK20VdnO3YDIzLHb6ID1Fb1QHIJoZdCbcfIdebD2OXGWnugZr8NEzExt7X8gQBiuNkRDz4SQTrZ
	sRcn9wRaCoU9ktyrZMYyaq7IskPcMJc7fM43B8HJEtl2pnOGod+mn63Vh7AR7IDOR3Y641NDKBp
	bS2OUmZ/JyRi+E7icTGBspkbeyAk8iMX5er7RrdwEtm5HU/c+x0/EsBExoY19vHdN9Zv0PGRC9A
	2zDHfPEnpWP2p5gvpAk1kNMCv+dTTaY+Y461FfqxfzPtw/4PBnrBcetTmhA87McUq2gjC1d9ED1
	zVpE+YYf8xPKQxB/mJTzYN2jGGWwlz6TK19I51yh6yGJnnYCSxUCf+vGvPHLwJKgqgyRlbz8zNN
	PXTNxAcK6HYTCWqOMO61oC8BONOzRljx2BZdEz9QuYuhrpKhFy1UJm+yRGV0n455oNrG1m1v9QJ
	xC3/eR9YPLvIQO5t/1cenO222/zigyYB5dG8enhHyZJvxE0Tok7OJvsfli3aaMygfbB+MOKTh48
	yYON5aAR+6e2FATQUZxWVw==
X-Received: by 2002:adf:e18e:0:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-48e07fa0252mr10691595f8f.37.1792333394198;
        Sun, 18 Oct 2026 07:23:14 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8cfesm14971909f8f.37.2026.10.18.07.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:23:13 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var-som: Use the official product names in model strings
Date: Sun, 18 Oct 2026 16:23:10 +0200
Message-ID: <20261018142310.28242-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Replace VAR-SOM-MX8MM with the official VAR-SOM-MX8M-MINI product
name and identify the carrier as Symphony-Board.

This aligns the model strings exposed to userspace with the product
names used in Variscite documentation.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index fd0a1862ce90..d9b588526542 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -11,7 +11,7 @@
 #include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
 
 / {
-	model = "Variscite VAR-SOM-MX8MM Symphony evaluation board";
+	model = "Variscite VAR-SOM-MX8M-MINI on Symphony-Board";
 	compatible = "variscite,var-som-mx8mm-symphony", "variscite,var-som-mx8mm", "fsl,imx8mm";
 
 	chosen {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 514cc568fb71..e717bc229d3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -7,7 +7,7 @@
 #include "imx8mm.dtsi"
 
 / {
-	model = "Variscite VAR-SOM-MX8MM module";
+	model = "Variscite VAR-SOM-MX8M-MINI module";
 
 	memory@40000000 {
 		device_type = "memory";
-- 
2.47.3

