Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013046.outbound.protection.outlook.com [52.101.72.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FDD342515;
	Thu, 10 Sep 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053284; cv=fail; b=O8YezIu3vkPmkocOHKfaDBrbWUGK6Me33ocpJd2TJh/xV2FErxw0asHbWhuh5CHYJsDYkk5YAWU3hyFmEByAz2gE3SrpJ61+YoAL8y9JNrOoos/i99ZVDkkdfUIDNCxmCrT9Fqi+YzkyBXnAvmYUXb19BeIl5PWZkYR7/iCMd1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053284; c=relaxed/simple;
	bh=cReTAGMM8D9OI23tRHlJbD6ok8iMVrQBIk+y/Rq125w=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QrgeAEcPsWApsOu0LIV7A39gN1jzT/5A6jGe9c3AHBbKonpHrL0nHzjsEG8XZVzRwHntSGEWrTEunyOfdLoHk/WvzL7DNqWlI5rB/lTwLh5bi10L7/ZgAy9JGn+U4Ysd0EF/uFlEJZw1KBx7kkop/hqVw0SO4SnqlwJ0faU6TNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=h2ciQP6a; arc=fail smtp.client-ip=52.101.72.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="h2ciQP6a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRforTxr/OVGdRxnVyPVuwfkE8L3zGoj8MY1NAiaT1i1U/bmqsoAK9jdioUGHNbwoiZtKSVXr+gI6Xaa1zyUeLuFge4XdhB10Bhs2osr/7ejqznRRN1RAkA4nBI0vcFRGfKOgSqE1jTfpS/0LRcR8kaWxBTbiaOzeMtE/Ndzf83oDo08feNzX7gBU2oFqQFXnr/JBMbffL375tAR6mIT2GvhSMhl8lExlNUvGsS65mKF35bUo+PPeVHZiWAX8X7NEEdu1Rw4t6djcjCgpKK4K3+xJDyuOwQabUCuxn7ZDfAeZGLYd2tZDfdYmIz7t+lEk8PGoWBkA54FDFegWIgMKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlxkdhlR+9xO8GlTFF6FoCXcDaqGhNdaIwCDA9tXqQo=;
 b=UzVBhi7P2M1U51O9bGibtOyGLYDA5o5VP0xvfPdND/Fj5ZFSAEK33VVkfwQkENrWSVwYzByjZX0D+2f6mThWVDcDlQxtt6dPrmjknfULSSKjhiDdfthcPSPOa564XnhkrJbXCHD208HoZgwv7VOdvF9+yqFor05nxPuUGOjNTs4x2+Z1W++nL0tkVc5MmmcbpkJ60XIZu1cXyG+JrFVqMJHKciNsYV9Uah6RWZV/VWOIBu52w7xcR2s8mGVXBfCZt8slKxDer16f8ON94Ro8WpEZ12yz/LD8TkVNzPnLU0cybdWDyBpVxhU8OJipiIjSQy+0hGsK6FKD3b44Tvo7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlxkdhlR+9xO8GlTFF6FoCXcDaqGhNdaIwCDA9tXqQo=;
 b=h2ciQP6a6moozCDOPO8nqAk25uR+LtR41C6Bl3OOpuzVij1RKvnbne2QCy5+OLOlXJS2rvhjoQ54vBEgd30+Udmfhuq7Qll4yusak5etbnXw5OFKY4q0BUMfFyp3IyNNUQFUWMFB2sKzfEebJHrmkpJ5jhjHByZTbPphlqVWjUnqIIGLNnRP+cv9lSmJOGerIR6HdhVPENjkmtGTyUcIA9FJK+zN4Ccl728WGqMYgtmiMr17zjDl9MbZvHvpGQnmM6UZ+lvkXN/3mKSUg9S1EMF5z6tiyyLkuWIZRrHAqxE0vVQ9tOGix5JyooymK/FeAlb0D1M98EAVCsXx7LgEZg==
Received: from PR1P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::11)
 by PA2PR10MB8549.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:41b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 15:14:30 +0000
Received: from MI3PEPF00008487.eurprd02.prod.outlook.com
 (2603:10a6:102:19e:cafe::3) by PR1P264CA0006.outlook.office365.com
 (2603:10a6:102:19e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 15:14:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008487.mail.protection.outlook.com (10.167.240.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 15:14:27 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:20:28 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:14:26 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH 0/5] Add STM32 TAMP nvram support
Date: Thu, 10 Sep 2026 17:14:23 +0200
Message-ID: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE/JomoC/02O3WrEIBBGXyV4XWGMJjF5lWUJo46tLfnpaLaFZ
 d+9tim0d3Pg48y5i0ycKIupuQumW8ppWyuop0b4F1yfSaZQWbTQ9jAqkMeeCxMuc8Fln9cb1zO
 UPO/IRYYIhOB6S50SVbEzxfT5o79cT86HeyVfvp2/C6b3o/4t50w4zCT9tiypTA0M1jpjYjWiB
 zu2RusWowEcdVA9ea2V61Qn/vdOzVkL41/tGcr0sfEbBRmtQeP0YNXgxfXx+AKH4507CAEAAA=
 =
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
X-MS-TrafficTypeDiagnostic: MI3PEPF00008487:EE_|PA2PR10MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: fb43b3c0-b9ef-44e6-1983-08df0f4e34e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	P1P1Tvcjv0VxEWTdkbmbCU0x/svsTx2v2Logj5FyVvTZ5HvZSq7f9a3Bcr6RnDGJbUBMfPF2tM2ZqCzHoXTroYAQjbd/8uNBLRoXzNufF8a6cnywERlnLfoRuQGS/WnrDTOiPlHK3ZXFkLXFsNcCXp+Uf4WOvJ+qo1cEFcm1MczYm30H/099mQuIWy1S1JB3gVY3LzuF3xaK6ZDFsKen4m6G9mknU+JGBx/orJUc0hdQ3lryuk0o04zQyVFAKRM1I49JzZF1Ah7NsRin/CrF56VGrakdGDQRdKqfbLM+FIsCxIR7sD51GD1Mq38NSKJGFhnYtKgWHO/HbPKN0cVnRAbZAsNGJG58McKFc88AjlwpYqzzp3M2eyugXA9kV6GbQmYEtpTRTcFIH4610aF1FeuOySM6Pamb4dksveK7n47GdlMz6hL/jySw5jou12ZOlIW2mGUUlDmnpd0H1OPCNI2150vLTP1qV6lwnpjpBI0k4+DUm0Q8wwwf6fj8rIdneN2jLywONu7PMSSPj9mbTS3e1rSFmsXx1XtmOxH3ylvEWL3s3LwjN+aWlF1JU3jwtBbj1ZjixQJUflbquF2Sygo+QRr7YF7CM9EHtF4UQGxeZJd1+tTmuqC+n1q4HFZR0L1xwOQYRrTqeXcpLqSw3vTvHOKWrJ3KsIch6E5hZ4usnxE/QvSh2DeQrMh6oh7pz5BQwAeMfcTWWAq4ASDL5A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hU/c4CboszYLH2I3ieN1nJQOhnyBLCr4TPl9UL8dxJb0QYOcNr9SndW6MegT6RuJs0iLG45RmJIeUyyum0I/K09py3TRpN36i1V5n6o7SzS1iU5NKAFsdIygG87xKNH2777rByvAES8URTfz1qehTN38b3a4agnjKg8AmzPcvWUW2SCrbr5Z4LBgX6YzmXlAUThsvxlGWAMirCS7YGElzTB6nxtP686YmvfJGa4GROYawQQqKI/cnur8U8DgQUD2G+I3684IkZTNZBkSnZEoB620ok4LcsR4v5aimL+U9tsDnTyv7MV8MsM6JEYjh2SUD3SAK6faNdRCvMOupaVdk/Ii01rjV3cJHpw2gDE1VdJ85hwFWIufDIGjBOLTScLsbHKl//1li6KaBy3oU7TvdnEMQCOosmtRWxm9XjOiTU95+Gv4cibxf9wnWe05DtF4
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:14:27.8423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb43b3c0-b9ef-44e6-1983-08df0f4e34e6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008487.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8549

Add STM32 TAMP nvram support for STM32MP1 and STM32MP2 SoC's family.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (2):
      arm64: dts: st: add TAMP backup register in stm32mp211.dtsi
      arm64: dts: st: add TAMP backup register in stm32mp231.dtsi

Simeon Marijon (3):
      ARM: dts: stm32: add TAMP backup register in stm32mp131.dtsi
      ARM: dts: stm32: add TAMP backup register in stm32mp151.dtsi
      arm64: dts: st: add TAMP backup register in stm32mp251.dtsi

 arch/arm/boot/dts/st/stm32mp131.dtsi   | 34 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi   | 82 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 30 +++++++++++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 30 +++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 30 +++++++++++++
 5 files changed, 206 insertions(+)
---
base-commit: 0788b44f68eac08924332af40a93d16ec331b515
change-id: 20260910-upstream_tamp_nvram_dts_part-df0ea0b68e51
prerequisite-change-id: 20260909-upstream_nvram_reworked-f84a4b37817c

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>

