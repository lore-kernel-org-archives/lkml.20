Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31476475340;
	Thu, 10 Sep 2026 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053279; cv=fail; b=Bg9MC9ym0JxdUh5waHXdslrsvfdrQlEEBh6ybuCgqikJCZW5+bxgN7bPxHf3nPC7Gwfh4mnNk9HtzRrsV1nEdfdEabbBf00Sc8oXaIsANEec5Y7DcPDFczdHyFylxQfe+WoRsdI1pBjWlPlzcWw+QBprIfFv9FupcNUnLZW07nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053279; c=relaxed/simple;
	bh=DxkZYsqgx8subcdnJ7ggqLAPyubIO3Z5kEFUHZGPKDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=s2s8kp1RaOalMSz9kkYcyNz2C5jAbFIQXKm7w4277TX0H7ys99JKbe9I5XnAP7CCbo9TWEsen/JHzd0z0DghqFYnzwcc1paEqWoo7GkhizuMosQTefb3i6JBdlAybP5l0Vj8AyD0Ys+DE6LPCqBXIoPsCYA1grWOXWN9VYztZcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=iTcwpS+v; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="iTcwpS+v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjuKy7A5I57ZsgD0WZMdafgh62VxT9j0+RQxq29iJHrmDt84hNkjqO8orXMbX231yX7Z4W0SP7Odye2u5z50dpv+/c7GUBCXbVRbcRFYPFHr4yl+amV4Rq3SKro6ampNUSZ9gKfBagMn25oOCUCwx9SS+IHgdMmIu0WhEnHfCnn3nXy5tMCtAaALlW5Jmo5mYWHjciMrvYzBJdIiO/fiPiOIjrzpXIIuHWK6mL8UskFVgGtmRtvQLQgkp/U9HMf6W5ppTJWTCMywJCdX/rdIKSq+eKJqt5W2IaEFAzAU6R8d7wEPSh4fI+Zbl1o0HA5gHgXoXD4BA0calQZoM6eoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfJ+CKejSL0EAmi26pT8KqNbxCSGDNQ7rlNnRubo6JY=;
 b=glbIHaEj+wRc7qq8ZckFWJFXQKUuR9bLFrN8Tv6DfG+6jm2bJwLDFHd9gzmgcThgsRFEUoULLAkNWQqhh5DPU8dJtWVF2QvaMso7m/Xm0xuntwFKnKfX0yojIsb9af1s3ayOUPc+gzW6wgoCSfA3gdooZv3u2PiF5C5Q4jv6gSc+PGyzbfEq1ukRyGzJK6cQ/ehmaCXSyrPbilK3SlLZwAfiN0AiS6MAaUgeWLeEvwIrJexmVEidDpzdUG2eukdillbKRFOcW1I4Jvhj+/e4Q8oEnNH5w2qHmRYowtuKlbP9LWKLYZij1thskS2f9RMwINh6ildvTcK36MZQMejuLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfJ+CKejSL0EAmi26pT8KqNbxCSGDNQ7rlNnRubo6JY=;
 b=iTcwpS+vweOR24dRrADbpagVf0k671pyNUjXNpbLrm+hcvkgA8S4OpbjGybD/4qGk8+1p5KCfjESRKMiWzHmh2YDcuZcU+tDcwCCYAZsCHpWDXaIVOk2wYGwkScrPw+pyIrvT10ZVK1jBap5iE8oUWZp6aaCcrUzRmBQcBsqd14F7rvlkrcgfafbClNlEEm4Ljju6ob6mfiFzgAZkfK1kL5HGlopbWWhd4dPUEbstggVr/haSkH1MVlstCSccXqWUUvVkLNveqpJTy+B4KnTjtXwSdXPdG5K2SL102ZIKImoOuPsgGaAhKDp3XjN8bqvhuHPdZAsv1aDLsOv9Jlrag==
Received: from DUZPR01CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::9) by AMDPR10MB992292.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:750::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 15:14:30 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::6a) by DUZPR01CA0049.outlook.office365.com
 (2603:10a6:10:469::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 15:14:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 10 Sep 2026 15:14:29 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:19:57 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:14:28 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Sep 2026 17:14:26 +0200
Subject: [PATCH 3/5] arm64: dts: st: add TAMP backup register in
 stm32mp211.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260910-upstream_tamp_nvram_dts_part-v1-3-e2bca58a65f4@foss.st.com>
References: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
In-Reply-To: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E5:EE_|AMDPR10MB992292:EE_
X-MS-Office365-Filtering-Correlation-Id: b8706383-9bb3-4e02-0e4a-08df0f4e3611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1p3vkbBqjfawuz3K6LURUZAiFh6Cd7WrOC+KgKaaPCCR1WyWW+yf5a5Z5SABWmBL8pzqSGm9Z3djC6Jp9vLrt8XnbRKxA2D+cE3syFvlS31G3+Vd+zYGmYyQO7W5xlS6ixAhrsoExNw9sNBiOrk562/h/Ior6TURtIuMVqMb76yX6GHtyos3wy+bzdNZeviVoAn3+gKt9O9JbA7HaPDPD6pLlBJY736KvcK3LNiw1+yzciTWjer7rL4LvYQ5FozvYMM8B+acf12fb9Hzez4Aw5I0/GWghbAi5lLQ2igZC8WmxF92y1McyY0VsghbTena85Q+Tac+noKmy8nXWWihbM/nJYAcZKh7t6UWiysiJsCcBMC/MRqEp9f2B68r8p2NI3qUmH0sRkyVxdzPK1p+Lb/O+OHfadzVgivXcnu60a93pF5uspXnaNN4D58ZaDSi9173+v2Zw75X5HPxWQo60O4k5swarnHJeGVdiBZRHahxg0GzF77jTFZlbxpArVB+dyhWV5Q1/2T6n00OIl9P3AtxzYGjVDp/NXJQKORoKSQ2Qb1FBo9oZrHJ7ceHNPNthmHLkOJJ8q06LbCtrxYJcwuJzqdwOEedS3F8ixHJK3dBVARdDnGNPcXh2XEU1wf8cWBM+aQjgPRTAfNC4uWJCN1AR+xUU2zRdlgODUrKeJgtU/VhiBMS5hepOe8xCR/amu2DzBqxAplC79ZwdbaSmA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4XVt7N7bCT5OxY/DjS6DzMGVDS6cdzXv96Mb7AWDiEz4txWazdZvUCG6SisOviy5vrSAeCBsRaR84lJR5fZ6+BXiPnKsDTS5e0Wk8uef3BDuji9m4DJHHfsDEAW8lCWkA4Tiz+AW8VJuE+5FPtU7Dd61S6eX/+/WQUp9DYbRIBqTmBs37MEhskYbEUJ0nxmtqRCe98+nklyG4O33v4Yii2Y2OueuMGP579y/iwch2yTpPDyHEUVKrEBIg9REUcKuAseUvX/i2iTUuIM56jQreNvhZDz/vD2LBy4pdmfNEH5cHzijZItULv4GyROZn9VP5pl/kRz1v6P0Mw4tx3fnQo6ojlvDETUoiGSkYFI8Ww0PBl9q1wIti4nGaZFli02/ZqMESsPyGiFKhk2Q+L+Kc8HPNt2A0qrmEdxHipr+8x7TrvbTgvaFJkVvOvTHSbhn
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:14:29.7669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8706383-9bb3-4e02-0e4a-08df0f4e3611
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR10MB992292

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..764a9a3d108e 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -133,6 +133,36 @@ syscfg: syscon@44230000 {
 			reg = <0x44230000 0x0 0x10000>;
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <2>;
+			reg = <0x46010000 0x0 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x0 0x200>;
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					boot_mode: tamp-bkp@180 {
+						reg = <0x180 0x4>;
+					};
+
+					rsc_tbl_addr: tamp-bkp@184 {
+						reg = <0x184 0x4>;
+					};
+
+					rsc_tbl_size: tamp-bkp@188 {
+						reg = <0x188 0x4>;
+					};
+				};
+			};
+		};
+
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,

-- 
2.43.0

