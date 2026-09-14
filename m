Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4102E37BE7D;
	Mon, 14 Sep 2026 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368871; cv=fail; b=ETwv7va/RpuwVj+q3MUTHYs51h1mWNb3QnnAEoPkbVvcy6hC96Dac7bA0PuCoUFwWTWUUYRRfMUmOeUvxR99W8I9x/JRNTUqVoKRQw6QajII6aAUsWzK+cTtN+mnysRXnUvVCZEkbDibARGP1xdX1S2ndCmyUA3rk2FeLztZA2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368871; c=relaxed/simple;
	bh=cMIyOgNDcUIJDUU6wCaXOMLk0JeEI2eiI8dWJvEBEIg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=GmeeBnLS/HH3ncaoJYj4qOr432jgDnakwN8Jkwya91CDJsndQwU/Nno/WLJFYDxS3uxs0W8V6PJtyoQiwM7u4JTW/qwEftMtJT9geoutLQFns0ymBBSxXjKf5wn2dGWhZ2rU1k/j5pAuPxIXWbZ1c3ZpJ0oTcxrvjs2s0xbDalQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=llre+1YG; arc=fail smtp.client-ip=52.101.66.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="llre+1YG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYyOl8N+30B9yqM2WYmHkyObWrHXE2TsbXYGHdAcor1fZ4PdwtCRbfvkN9aL9ozl72xl3Me4uTiXp63N2+VJNMytD2ipunHLSy9xUfoccaH7op7kaMMWLwYXg1k1Iz1tuu0naBzxdpBDUW7YeUPLSmtQCnEnkbdAg6pnnJ6zC9FLZqwm34a71uQ50NiC5WHH+g+m4sq10Wo+2RnWsVkM3PxWD8DHXiwOXlhwc0HNkEKQUQJZlZICmdtmjttXVHlnpLNiFXslsYZddRpaOBH95ww8tPpjNv2mx/W2M3WUdFzZ/Z7SZsTLh0+MpzD6SrR0hjIbV+tuklvb+qQ0EbwUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYdKMoPnIr6xMkK/Ze//gjbNP6hXZwXCDjft2PcPbIM=;
 b=VGENuQEvTaReTQHj+vkmHrWGt+mvBOjetShxqbAVXQL4c8uj9Su2KX8DuUDAYNn1x2xvbomqHyW5KWKR5r6YkrE14Ptpxug5m9Nhk+njffEmOPYsdKaSWc4cPPtll8XXh2N6CchIX2OcBbu3eG7Co4Jbp5ERgA460mhV8OUKBpiWxHnhBIkss0tIr4dFJ2KSooY8m0KNtpJ3GqQ0rZZ6Ob8hBEs4KTDwKXznh4dm9olnx26wuoG9KxVtebW/ipYxRTU5GwXgxqs3Hpbv3gQ0qHukAKzpwt0R+QHO1OpZnARPWy5cS9tYckj/8wuW7MJGDui8LFXq94N3kr8cUY/OCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYdKMoPnIr6xMkK/Ze//gjbNP6hXZwXCDjft2PcPbIM=;
 b=llre+1YGGC3v0S0Put7aQsBKjo1lzXpKbPKDZR4uwf4Kbi1nbJfKUlDXnvpg4++d9dGAo7hpQBxTqKUtT9QogKhBb/5JoOaFks2Kt/cFLfcmBYlYqrk3HdJ54EaZ3wpGNepSYLXIn1aOYfnOZ7g3/O2LgOBsC3ByGfg6tckvt7/Ek/zVEIIAfMPzl/lD4gd8jrh+gK4Gu/Sh5TB1ueQji1L329lmE0qE03/w4K0oPp2bpzDAQYd9xgHDZk+2AZVImSUFdy+IYZFoyutgVwIEm6boTkxO2JrIqSo1FEwWL6ivLJPvp2x9wPd8ls9a0mo5V1Zpzs6rDzqOcSJSeZQ0Fg==
Received: from VI1PR07CA0159.eurprd07.prod.outlook.com (2603:10a6:802:16::46)
 by VI1PR10MB8230.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Mon, 14 Sep
 2026 06:54:26 +0000
Received: from WA1PEPF000099CD.eurprd04.prod.outlook.com
 (2603:10a6:802:16:cafe::88) by VI1PR07CA0159.outlook.office365.com
 (2603:10a6:802:16::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Mon, 14
 Sep 2026 06:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099CD.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 06:54:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 09:00:29 +0200
Received: from localhost (10.252.27.156) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 14 Sep
 2026 08:54:25 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/4] arm64: dts: st: enable camera on stm32mp2x-dk and
 correct stm32mp2x-ev
Date: Mon, 14 Sep 2026 08:54:16 +0200
Message-ID: <20260914-stm32mp2-dk-camera-v1-0-2f2bd719bb63@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABiap2oC/yXMQQ6CMBBA0auQWTNJaQOIVyEshnbU0RRJB4wJ4
 e4WWb7F/xsoJ2GFa7FB4o+ovKeMqizAP2i6M0rIBmtsY7rKoS7R2ThbDC/0FDkRthQc+Utwpq0
 hh3Pim3z/0344rev4ZL8cJ9j3Hxbq7m12AAAA
X-Change-ID: 20260913-stm32mp2-dk-camera-7ad3ac8d3075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>, Hugues Fruchet
	<hugues.fruchet@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CD:EE_|VI1PR10MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: e9282ec5-4e14-459d-5d95-08df122d0451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	eYbbVK1f/QzlnZfpqtUh0HW78/6a2WaEI8bpCIMbZkdMEiFyJAGKseuigLi1zMnFmX7c5bvAmeuHRFI20TeR8UkoTbmzEEmEvp3EyfOG+0GtEqH9+b5RCx8//QVhY+8axDOceTnGzUnMb8Aiwrf44lyr3B0+rogu2kp2AL9Kl0PqCf/1kbBn1n1WWIO+9dtilwSc16P8Jkk2sZuhUVeRQ7bG5s7R1/5hnXMDv71yFv3CWTg3avmloqPVjDRNCPjQh/Cx5NeilG2VfZ+UVh9mp+tZC0YKAvTn/EbnZuyw6R5RZInRhTmYOm8uT+2CIpFlVhH5J1rFzT3fehsBHWBuMjY8UInilJwySVdUZmf3EjVD349CxfBREE1AUK91NzapinVNAGVOTumA43hvJIMKTvXLP2wh4tW6hAmOAhLfb05hqD1LL97Cmivo0SMv36YCGo6foXY5inJPlheSp6bfPkoByDfqagA5BMijiTcW29x+1euS8UgN2b9iSr5lYK+8cDBr4kdvYS5o/GOE2JTbF5oU+5W+jiXgaQmbKbT1fk/klsNvr6CZueN27t5o8SJ7ovlgr6HERIGSwyWcXXetKx/QLJFVqqI5PqqFc1w488ttPWq3R4/aOAqXzoh2AJCagUdp/mTXU9CqUXhLD660DcTfda9L3MaU1T7HP2JcFR2orPi5Eq4Gx6+lmbU4dtBjY2DktgreoUo619Lpfi0jqg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HWhXDBjdjlNhDBcaKWRzkT5BsMj+bZu0yOZNPrzEjy/wKTTQtKTe9Mu8/Ak1TnvlJSgW9Cv2GfRCHKRIBpOMIWZ3sSwPz7LWa33CvKnf/Irvi54TpOyzKUvhcP1UtGtlkQryjacTd2R45BZV2ZzdSsJig7BjFH+FdCDf0UWcfDrGe1SSS6nFp8HdRBeqE+6ZteHFZ2tv9mQRl78Dl08EBCcCadl//M+Rb+GGQ5tchm5yHV4YfUVtQZ6WvUnMYaYlhqqvfN1sXDOQP5yCx9dL1vFwOcRpj5DuowvrDx4Vp2l70E5hRlCyFogPnJcLls+cDXOM6F+kN/sU5fxbfr2ExOOmRFb1NusJOI0qHOjYKwKMV8mwemdjV3qjcITUIlD+cte32MPz0Y03OIE+sLhi58uEHLMZwRM6A5CKkG0tj7ZJaPIpiIb3kzVxbzYEN7Gn
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 06:54:26.4146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9282ec5-4e14-459d-5d95-08df122d0451
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099CD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8230

This series enables the camera pipeline on stm32mp235f-dk and
stm32mp257f-dk boards via usage of the CSI IMX335 sensor connected
to the CSI / DCMIPP of the STM32MP2x.
It also perform 2 corrections to the stm32mp257f-ev1 board to ensure
that the IMX335 is well enabled.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (4):
      arm64: dts: st: add imx335/csi/dcmipp nodes on stm32mp257f-dk
      arm64: dts: st: ensure IMX335 is enabled on stm32mp257f-ev1
      arm64: dts: st: use video-interfaces media bus type in stm32mp257f-ev1
      arm64: dts: st: add imx335/csi/dcmipp nodes on stm32mp235f-dk

 arch/arm64/boot/dts/st/stm32mp235f-dk.dts  | 75 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts  | 74 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 45 +++++++-----------
 3 files changed, 165 insertions(+), 29 deletions(-)
---
base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
change-id: 20260913-stm32mp2-dk-camera-7ad3ac8d3075

Best regards,
--  
Alain Volmat <alain.volmat@foss.st.com>

