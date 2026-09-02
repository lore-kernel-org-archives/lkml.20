Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC74D442399;
	Wed,  2 Sep 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345205; cv=none; b=DmWMYGQhSPYUlfuQjRHpaDq/2CWQV9NRFT6vhhpx020LAN5wr8AJPJrcw8UXccJKM534PVGdP/TddR+q4aKlNHY5dTgFXN04z36m/3Oj/V15+KSeP3Rp+tk/YFLCjwOKm21NYFJOaBlYprGphN76JguyRRLTAgd7MS/AXXHMXKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345205; c=relaxed/simple;
	bh=RWSRig3pEVMzsYGesmOpivAJXUThe/cZY50LLkR/vVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hiCVq8XUJGtK6nDlawiSJqyrwf4BgDLA2v8weslPqxv6XINHf1VqPlCQoYRUDuByYheNMF5w8vxKkbgUuoHN5mSEzWKoGVKQ/z/Jj4qRDexl1TErMB74dxuJH/cedur8LjQjSXY+dTaMFW0KyX+i/Pev0i3cEHpsH2A6A1qNzD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GsNmnDEj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GsNmnDEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788345196;
	bh=RWSRig3pEVMzsYGesmOpivAJXUThe/cZY50LLkR/vVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GsNmnDEja+/dvsAD/Byoo+V8kmTBCxw39zVyIdMfVNAqqNRkQKZFnUuIUyBKBzSns
	 Irg/yufqQovUVxekvB+mxWh13B9Qh14AaLsn/8YnfxlcE5G6llwE/87bLylJTKrZcp
	 Ui5fz+azhFf73xLUl5QyfihyuVde5JIX3sWZCgFECsey8nG38gtvSOVD7Y8AHF+R0Q
	 am2mEpFm5nqUJqT2ZYs9gRSJZOimtkzNmwbwNno/YBc3UKKaTvLS8aqlZ1dPJ7si3z
	 I2V3ymCkQ6qRNK23fA23OQXVZlS4dPs6vZB8Bfxor+hT/47hKx/yeNDEsyJr0w9JZi
	 kIeaYZw0CUQeg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A52DF17E0DE8;
	Wed, 02 Sep 2026 12:33:15 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 02 Sep 2026 12:32:44 +0200
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8195: Align ufshci node to
 dt-bindings changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mediatek-ufs-cleanup-dts-v1-1-7876e7a27a9d@collabora.com>
References: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
In-Reply-To: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788345194; l=2631;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=RWSRig3pEVMzsYGesmOpivAJXUThe/cZY50LLkR/vVg=;
 b=cDdCVSWaq4OT1Hmpzki3SR7PXBlNI28UIgCYCTTZup3GH5TN/84kFEiKNGs3tm2XetaMSYGYr
 UYEn/GTMQ70DoRtm68+MN8s146JXz1ljcHWiAMETKAGaaTbDp26zK2x
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

The MT8195 UFS host controller dt bindings now describe several extra
required clocks that were previously missing from clock description
and deprecates the freq-table-hz property use in favour of
operating-points-v2 instead.

So, add in ufshci node the rx_symbol clocks in clock list and replace
freq-table-hz property by operating-points-v2 one with a valid OPP
table.
Also reorder properties in node.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 35 ++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 9aaf8b6edcb5..c859f4283388 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1472,8 +1472,7 @@ mmc2: mmc@11250000 {
 		ufshci: ufshci@11270000 {
 			compatible = "mediatek,mt8195-ufshci";
 			reg = <0 0x11270000 0 0x2300>;
-			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&ufsphy>;
+
 			clocks = <&infracfg_ao CLK_INFRA_AO_AES_UFSFDE>,
 				 <&infracfg_ao CLK_INFRA_AO_AES>,
 				 <&infracfg_ao CLK_INFRA_AO_UFS_TICK>,
@@ -1481,17 +1480,31 @@ ufshci: ufshci@11270000 {
 				 <&infracfg_ao CLK_INFRA_AO_UNIPRO_TICK>,
 				 <&infracfg_ao CLK_INFRA_AO_UFS_MP_SAP_B>,
 				 <&infracfg_ao CLK_INFRA_AO_UFS_TX_SYMBOL>,
-				 <&infracfg_ao CLK_INFRA_AO_PERI_UFS_MEM_SUB>;
-			clock-names = "ufs", "ufs_aes", "ufs_tick",
-					"unipro_sysclk", "unipro_tick",
-					"unipro_mp_bclk", "ufs_tx_symbol",
-					"ufs_mem_sub";
-			freq-table-hz = <0 0>, <0 0>, <0 0>,
-					<0 0>, <0 0>, <0 0>,
-					<0 0>, <0 0>;
-
+				 <&infracfg_ao CLK_INFRA_AO_PERI_UFS_MEM_SUB>,
+				 <&topckgen CLK_TOP_UFS_RX_SYMBOL>,
+				 <&topckgen CLK_TOP_UFS_RX_SYMBOL1>;
+			clock-names = "main", "aes", "tick", "unipro_sysclk",
+				      "unipro_tick", "unipro_mp_bclk",
+				      "tx_symbol", "mem_sub", "rx_symbol0",
+				      "rx_symbol1";
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
+			operating-points-v2 = <&ufs_opp_table>;
+			phys = <&ufsphy>;
 			mediatek,ufs-disable-mcq;
 			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-26000000 {
+					opp-hz = /bits/ 64 <26000000>,
+						 /bits/ 64 <0>, /bits/ 64 <0>,
+						 /bits/ 64 <0>, /bits/ 64 <0>,
+						 /bits/ 64 <0>, /bits/ 64 <0>,
+						 /bits/ 64 <0>, /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+				};
+			};
 		};
 
 		lvts_mcu: thermal-sensor@11278000 {

-- 
2.55.0

