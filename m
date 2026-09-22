Received: from mta1.migadu.com (out-8.mta1.migadu.com [95.215.58.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5C7550DC6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084219; cv=none; b=Dy9qlAMW76meD2lSvwcoEKJXy6ZuPBLM+WylYzTzd+ehpO9u4QrlXTkOQeBSX1OkPXhuqNP1YQg1wyF+FmaL1d9hGdMU6Tl8IK/ODd89ZxZCc5+uGxmi10TrOe2ZCx3JLRsceUbyrQhwj+xZ3lFwaJxkVsgxFDJAtqqg+61clH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084219; c=relaxed/simple;
	bh=KPcw/ZopzzaYRfLPPDrflpmk4QBwx4LnGR3aDrupdxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNkA2tCuWMYMmWn0FmoiI5AhIRp9Aq7i376rfaDWSJ6fVTahA7wfXYlg9r3O15Qklzp/hldDEUiAvWIFDTS3DwR1emZdSGu+anaLkY12ntnCMRnirmD3HNmHdfCiCHPvmv24PYwgEhDao88yHIwWBZlKB4lM1igjjvhBwFtEgg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=mytQzUPC; arc=none smtp.client-ip=95.215.58.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="mytQzUPC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KPcw/ZopzzaYRfLPPDrflpmk4QBwx4LnGR3aDrupdxo=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790084212; v=1; x=1790689012;
 b=mytQzUPChl6RI9SOMaciZMYxfL7vGNIqfMcK8xQc58dqszJENvDv0x7/OPaQJ7pL7SOP5eHF
 5/MZLfGt/4weXmHx91dLkS9hF0jbh49Zr1qVCS9zP+Dnm7PrfxkJodFf9gq0WgGgh6TBHRbuduq
 ViD338zM3jRxwngvRJ21Jxf3rH8S0HoqUXNweGygvoJh4RgjUzTHF1oRcYN92uko7wFv3AEhl+C
 6LwvLJ0OMPgsX0nhEAK0FLXm3NCcNHB9L0EDpaFHMNkk2CQaqQU11NZlCqjBwE7afd9oijbCr6q
 FXX7SXAe5M28NPEhXcmNlH0Ex+vDvPmwRwZTKOCF/x7zg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f43a4edae3204aa3;
	Tue, 22 Sep 2026 13:36:52 +0000
X-Mizu-Trace-ID: f43a4edae3204aa3
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20Jakse?= <raphael.kernel@jakse.fr>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] arm64: dts: rockchip: Add supplies for es8316 on RockPro64
Date: Tue, 22 Sep 2026 15:36:22 +0200
Message-ID: <20260922133643.2730265-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT binding for the es8316 got 4 power supplies added in commit
e9966d450b46 ("ASoC: dt-bindings: es8316: Add regulator supplies")

Page 28 of the schematic for both RockPro64 V2.0 as V2.1 describe those
various supplies, so add them to the DTS's.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts    | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts
index 883d9bcfe792..37124ad548cf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dts
@@ -19,6 +19,10 @@ es8316: codec@10 {
 		reg = <0x10>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
+		avdd-supply = <&vcca3v0_codec>;
+		cpvdd-supply = <&vcca1v8_codec>;
+		dvdd-supply = <&vcca1v8_codec>;
+		pvdd-supply = <&vcc_3v0>;
 		#sound-dai-cells = <0>;
 
 		port {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
index ae3ee91dba2f..144988515c62 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
@@ -19,6 +19,10 @@ es8316: codec@11 {
 		reg = <0x11>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
+		avdd-supply = <&vcca3v0_codec>;
+		cpvdd-supply = <&vcca1v8_codec>;
+		dvdd-supply = <&vcca1v8_codec>;
+		pvdd-supply = <&vcc_3v0>;
 		#sound-dai-cells = <0>;
 
 		port {
-- 
2.55.0

