Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCAB3E40FE;
	Wed, 30 Sep 2026 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754624; cv=fail; b=jaM2DX8n0NaSBL05VrYNOVfGu66CKTKU0gd853x2G6olIKY4h4lvIYN0T5eCx1aeT0X6ZTCBoKO3brOC1NbUagHfWx6gem2u/owZYZQzFyCBt6eUWn9OuNOCZFBW4zWN4NK50pNKdfYaPZEFoMWPw6+faGv77NfTgzFuO7eUDRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754624; c=relaxed/simple;
	bh=W2JizqDB8ksPj87lubdKrOBMriDA6pZc/FaYOQvpJhA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=tZDqSDCK0HTYddMfoNqvu6iF8uGP1iV2w7YQ+8NSEbUQFKswrOGpUFT15Ix/r8HgWfjVg7xsR9yXGh+3J4PEXp0/PF/2GKIwR5Bf7qe3LsyEoKlPSrItbcuWH5ZONU2+uekhSDBLM+JQaamYkgpTW/hSVz8zL+tvWPgD1qenSNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DssruyWh; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DssruyWh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLL2pZEmaYlUlwEe4Q1R6af5hb3OYeLyR+9f4aqc2E5Q//kWy9OSAAvb50fK7k/M5RYWo50VLJV6JFBUJkhN0e3NH5bNc5JnnF0mG1Wf5oGdbeUR1hN5nwH+AM9HPg1FSH9lFgQpLq+Ut2oK+uQyEMTmN3FzjJEBrInJFzz8Ten20YyQQVn0CDG/VIvbB5CeA1O/ZxVNPIUFVPusew+Pow90u/01QBRusI4JrZdqghmQ2h35AXtKf7OFO8hxRcuBVLzDNRjpfysL9eEOa7cRMv8HhU9DZcHIC+CiA/wNm+cCUFdvJO7fbtuXiPg1zzf0x4Dth3Fs62wQmvf4hm7Xmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2AmTzUBXbZzO1xPwDND+FshwsLZyeOF5+VdG7j4HwA=;
 b=xF5DrlliQqKgvBFwgsy85GAHncmiwVWJjEzhxLlkTgk1zMd6/5CYxPSgoejOyht6UH4U8ACNLRBNXoM2jmHGsQGqTgTc9sm7a4LWnxp9nOGLVDBgQkVaoFcPj3nDufRKKQawyavGTYg3fZm+huNkW4uytR5Toaw5Y+dIgkm+J7GB1jKuFDH83Sq2IXi8nOKZWWyJB+QAz9eJT2rnfm6G255U3y9U96HYZjXMFhINZzElyJy2xNsMDar0AOaVhPvl+gZObIwM+WgzdJVogEd4xLsteo/x8Us6xl39bk/uXFo6L2eZGBQoFbHTkvKlALMAnmLO55LTYrg1Emft3NVYtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2AmTzUBXbZzO1xPwDND+FshwsLZyeOF5+VdG7j4HwA=;
 b=DssruyWh3BHwl7F9qfInfYNYug6WJyR725gEKtVYhLllfIryQA/R7bxNonWIQrTms+MGeZcfgVI/I2C97xOQbBF+V8ebi4++EEPyglt7YSMtrQbAiBAjW/z1Fl+VWjzOmPb7+8MItUm63Rtahd1QHLO1uhnNJKRWNoQEsSIbqGgMoXzMao48h+w+T/TbpHiBAwe/VmBCNoOeD/qK1obhs8GFW59AeHJ7J1wF+AAYplSzDdX5WYDDoUC5krFOF+35RdwVaU19zayCx0Rez/CZfvUf7oXdtxzkUYrSJqrUpymF5iSTABH0mGwd/8jZjpv4KuNSHv2J+G8d8zisulKDTA==
Received: from AS8P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::11)
 by AMBPR10MB9732.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:767::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 07:50:13 +0000
Received: from AM1PEPF000C1AD6.eurprd02.prod.outlook.com
 (2603:10a6:20b:2f2:cafe::7e) by AS8P251CA0016.outlook.office365.com
 (2603:10a6:20b:2f2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 07:50:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1AD6.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:50:13 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:56:45 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:50:12 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v2 0/5] Add STM32 TAMP nvram support
Date: Wed, 30 Sep 2026 09:49:47 +0200
Message-ID: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABu/vGoC/42Qy26DMBBFfwV5XUd+AYZV/qOK0NiMG7fiUduQV
 BH/Xgcqtcvu5kpXZ87Mg0QMHiNpiwcJuPropzEH8VIQe4XxDanvcyaCiYo1nNFljikgDF2CYe7
 GNeSxT7GbISTaO4bATKWx5CQj5oDO33f86+XIcTHvaNOT+dMI+LnkvemoEQMRqZ2Gwae2YLXWR
 imXiWCZboSSUoBTDBrZ8wqtlNyUvCR/fbP+bsuaX9tDNOBtCh/YU6cVKCNrzWvbroI85a4+pil
 87a9Y+e7yv6tXThlFYSyUGqrSqbObYjzFdMpnkMu2bd9Gwt66ZwEAAA==
X-Change-ID: 20260910-upstream_tamp_nvram_dts_part-df0ea0b68e51
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Simeon Marijon
	<simeon.marijon@foss.st.com>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1AD6:EE_|AMBPR10MB9732:EE_
X-MS-Office365-Filtering-Correlation-Id: f43a8120-fc5b-4447-b595-08df1ec775f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	u9RpU2YFt0uHPsdFkqQXo08HJ+Dy7QdoQWtYEp064seDfdj4trbsXNJbveT6ch2zgtA7Wb3U/b6Rshu+jepvgAzv83Pb4HuWzN+SrY/JDC3/1ndBxiLPb0a7C1aRK7DOa+5UlO0eY0bluzOfMeyT0G+SwzT00cRo4mSbmqCQS87OIqka5s4/M7p8ecT6llB4sA//eksU5zplp7xuK2KtQi0JtwyhYZf+vRh32zz8gMTkh7T3wJp3BtbQBhdxrrwKJtYctD1Bnh0QvLwUdsvUpjjCApjGlNapPsTTAJdlT01QUxmzUnTd5SePB1Rk4yTe8IHOBqQt2d505UDDxzv/0kgtykO0q/tYXwzWbdr85KoWXAHqdad19BFgiaeZFQcYzRksngnrzEaxNWkhpFQPNEs8agt9VX/CHdavQ5vEV88xewRXdPbUL4rKKWLk/1+xLjPLX7q7TPsK1MjRxD60OH/pw3HtSYYy+QiIKA+64jGmurMVXH5AgsGLb7L85HGDnXPHFM9da/7kMEm9x/KwyxBi10c3el9jQpsHJ55X9uOM2h+B8w1hDlAsG+5xNYiuqQHIXcqciXE3uWeLnmX+qYE6AJxBygKRZBk8fQ7UqF7CyVR7TlOI5nYwcx0fUoHV5fJOFsH4t76d/A/vua3NPkEmWCZQ9xWButS+zM0cHnU=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tUJcE3RaNjxeCxLhlqzpbm2Gcuo7IKfzgSZCYe8W5NjmJa8hrhtn7ONNKN/ZNyZ6dIKBSMiMuIdyj9N+vQTzhLDBMC03PaX14n6j1w4BprvVWjDzQbdcN1mK4niy3YKTsTp/tRYYeK5FuS2oBUo9+20JdnoYtMuKZL/vzKLdhZUokVI1esiU8v0U6YpPUBsnoPVHPcMKEuG9RnykYO7XYrOpm3ULUihxLJHCkc9UtXuDnngsHKaoczpGq1pjdL8Yk8u85+7SeyQ8PYqs8EJNkAnbkWAnWmPHdlAK42JdyvrHsi2vjUsqfaLs0UOTYUtWxsiirS3bU82u9Q59cSZRdmixoNuOg3GNdBfoxvD4mbGJbibbpE9CfgIFp55S4lexQrm94lC13C3TAB0o/18Xo96ap/bIppUl6ip87nGWnKigPX6mXPfRJkzVK7/WySyq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:50:13.5523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f43a8120-fc5b-4447-b595-08df1ec775f7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1AD6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9732

Add STM32 TAMP nvram support for STM32MP1 and STM32MP2 SoC's family.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v2:
- Fix typo for stm32mp151.dtsi.
- Add blank line between reg and nvmem-layout for stm32mp211/231/251.dtsi.
- Link to v1: https://patch.msgid.link/20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Patrice Chotard (2):
      arm64: dts: st: add TAMP backup register in stm32mp211.dtsi
      arm64: dts: st: add TAMP backup register in stm32mp231.dtsi

Simeon Marijon (3):
      ARM: dts: stm32: add TAMP backup register in stm32mp131.dtsi
      ARM: dts: stm32: add TAMP backup register in stm32mp151.dtsi
      arm64: dts: st: add TAMP backup register in stm32mp251.dtsi

 arch/arm/boot/dts/st/stm32mp131.dtsi   | 34 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi   | 83 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 31 +++++++++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 31 +++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 31 +++++++++++++
 5 files changed, 210 insertions(+)
---
base-commit: 0788b44f68eac08924332af40a93d16ec331b515
change-id: 20260910-upstream_tamp_nvram_dts_part-df0ea0b68e51
prerequisite-change-id: 20260909-upstream_nvram_reworked-f84a4b37817c:v2
prerequisite-patch-id: 78c1b344b0674b15e94a2d2da109a1cdc6d5feac
prerequisite-patch-id: 075c3892445aaec620ee9337ac9690fc31d32ede
prerequisite-patch-id: 6072aff7fc653ede87de6e43ae5d9a3e450afd43

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>

