Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013026.outbound.protection.outlook.com [40.107.162.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C76457E5A;
	Wed, 30 Sep 2026 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754627; cv=fail; b=vBogmJ6dC5HPVLTnVBRx/OK8xkRDqDzaywSPgC2wI2zC8V/pEMpXCpjOjjAyOoUxsAUXTJjhV6YZEgPO314gIz8ayirQKV8SqxFWZ4/vjTBAj7ZT8Zs7IyhKRS8kqYzoLPiLLNZzMhchwZXva5lHhbrP+PGdiZ9rs7JaCMXEcPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754627; c=relaxed/simple;
	bh=GtLkAzejWzBBvvalZttM373NREOZKyxOgI9r/WAH3SA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Re6uFmpXOnxEGGLDTHvwcng0yW/vKrBWOVTglYVX9ZDn88JmadVXvP3k27d3Nfq5xDtCRXaOBzq9yYtuwN8aBZRDN2G0Jqovnogq2yYPEvulJirBHgjlsfhp70bt2hR85UiXdI56q+nlYTO6ZjA7xij7BdXWP7FQooZDmTrxbLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hTGPdWHE; arc=fail smtp.client-ip=40.107.162.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hTGPdWHE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gf2PMdnl7iGbLAhqaM1Fi8Tc18GTrj3WBSGGlhsgjb4J5Xv2eVFuRRt3dBb12lcJS2ZE6CvhRNv7w5TDvtX7SzKCDlzDYCIR5WGleGh3bRP0GsKhF4fAmTDRftiTxyXEw3gaLo9gartMFGXRx6+FIetga1OkvizmKNgfeICNIMuldU4C3bi2P5cPvXVPjX5DxJ36Ormsa01EOO/AKJ4/yZQZrZvnr3D5JrAiPjqFo9SFWWefdvzDrwpJTyq8WQDg7mjDhQHZdLlC4OuyyMj+ihPznoC8FGviqR9lhsCuGbvL+Bjbli9FW8JOEsl+sJzex+TwEV9W/gdx4/wbC+oIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRy3wvsncyyGuX7TbIXB8uDI24Ts27+T4Y86/qkpYGE=;
 b=hDZGXPSFyE9riVvj/KtIbewStgpIt8cP39Juc8Cn6/N6+sONBtr90dml0BmjPhCx7ZTwqOEOwFtRQjrfqqoisQqDXkeYKNDHf3SayJ5h+HdrdR4NDResGx0rcvQLXhpWpuD524QUVLyyuAWlbNkeLJRi18xk2DXL0PYB6v3rR817nwAXO1+J7kdPqbdNYZlHbTsXa5KJYD/wxxPhfq8Qv0M1hwauRJB/tKag1mqcayBA2z3NmuItpOaFQKXwO77Q7ttwXrucyL8ViSJvU7XuGh3L2jfhZblsTZog+vMKr15QGwH/KYH9iCNCAZcJKlvERaLtBj0gvUGOqq2dP2gLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRy3wvsncyyGuX7TbIXB8uDI24Ts27+T4Y86/qkpYGE=;
 b=hTGPdWHEHTJzeQhPdHNfpxZultl/rutlWvGwpHQlDnA+mv5O2hmeQN5ieAeuWZpRwEwfhyCD/x7IT4UKcRNozEyUChiPXXXq/E9CHKYNmyQ4bKtnAwshRAwglKJ38ELZCG0Ve3LPj59AXWSrDa7wjeDWee6VxrreWAJGMZuaFpMZOCQGFRZ2NVjJiXtiXB6ABtZZMWYtAmsvd0XlBvTZiWvIqZqO8gKlZKigk4F95JdFPXTCNC9WX+42sTFpZ2Si7ktrESq7t6XjwVRH8BRGeJHfknALfxQV1jBwpzJn88hdAmeHdo9ftOCoqYLQHi4h2JDIOSM9DdFFF+iIC3q8Sg==
Received: from AS9PR06CA0696.eurprd06.prod.outlook.com (2603:10a6:20b:49f::13)
 by PAXSPRMB0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:28b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 07:50:18 +0000
Received: from AM1PEPF000C1AD7.eurprd02.prod.outlook.com
 (2603:10a6:20b:49f:cafe::47) by AS9PR06CA0696.outlook.office365.com
 (2603:10a6:20b:49f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 07:50:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1AD7.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:50:18 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:56:50 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:50:17 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 30 Sep 2026 09:49:52 +0200
Subject: [PATCH v2 5/5] arm64: dts: st: add TAMP backup register in
 stm32mp251.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-upstream_tamp_nvram_dts_part-v2-5-bd73158ce46b@foss.st.com>
References: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
In-Reply-To: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Simeon Marijon
	<simeon.marijon@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1AD7:EE_|PAXSPRMB0027:EE_
X-MS-Office365-Filtering-Correlation-Id: b8902523-a116-4444-4373-08df1ec778b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|11063799006|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	tSVeboJVaLULOLsOhTw8xfr8KoHuD+w4kqkZrbjS9pyHv627jZfpVUbCuCgDoUvPXso1mOLRkMQ7K0389VCt60GJKz1crdsfJJaZViHCODJkMXxYkycYYR9grVVW3h44GYlFPHz2MnI9nwuidZ2yTcIZdQ4UsXeGKC4hvlL783s+z6fgmXfHTZ+diWN+vWCjIJlYN6e/lBaqqgdFZ6qqZJbDwj74tieGDP8QJHtV5LGM0WpwLj2zMN40X3izR155ZmRvogUSaq/iIW4ZDZohjmRVyDYZ1HgiOpMLWnIMLcm8nLg1iG2kOIRj2KyTz4i7pMV9YC+smaLEmAe4RM71XvfNCvtFDqhE66y/6+4qu6vtwc331bnGFRohBWMglSrFBC0H9iFrX49L4gqGeAajyYf82tCbHLmfeGMGIli7E8U4z2JiPT8wu3xIlJkr+aGBLMLtX9++q3qKH77ZDjHUnwDMoOu8kML+YjQ4MX1YY00P4t9GaklnX73CcstU1iqp/xMdvPUormnu0R/6fahSRYBP6LB/rLicZXgebjojX6pJe4G2w7EkxCZVP98474UgsuMuX0QF7xr0UuGEaZnbatsrby6k4VWl2TXUzDQfFo2P26tH9Ev46FB6IStkMnfagoKOsMyj34JNEKUYJG0Bm1V91OpF8e/8ElAq8J45ZvF/y7ysPB05znMQBkfHVoxR
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(11063799006)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HmFOQRimR70OTtu7PW5rJPyB3tHalcSyAxFdT7KHlSE+bo+cEhUNP6k/+xL8+lnlJPGdwXN14p8B4ACebMevk105nmSzxMvrGaVVMm5U5uIrEtAw6BlwoRryHrOBgjljNQihhxlGcs1ZQD0IfM6LXKCh/exKpIODEIUoEE9rhpgjkqi7OpbXqrXTiaX6xSS70nHP1VkhFzshejqzVfQCen3KQLKKi29xoefqKapIig/2gOgEXiuj4LeDYX8wPmOZJ5nhH6wkQk8MfruEuC7fkxXtmKcDlcJBkEMXAoSK+T8hJdEvSbiijZZ9LMGDRfN5NKmlEFgCMx+lAqNus6ewtpktrda1GUVvlyT51saPC8Za44XnHMFNIcWAresk6pMJw1XvVUBkZCatfWOGlR7gKt/6BANxiUjSX1wDxcUxDYLvJWixc+0PA2+gEjZ9HqSK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:50:18.1741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8902523-a116-4444-4373-08df1ec778b9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1AD7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXSPRMB0027

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..e98ac3374ad8 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -2118,6 +2118,37 @@ rtc: rtc@46000000 {
 			status = "disabled";
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x46010000 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x200>;
+
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
 		pinctrl_z: pinctrl@46200000 {
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.43.0

