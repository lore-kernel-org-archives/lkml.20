Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794241555;
	b=jhairLOmwhT/bV1fb7FxefOsfE4YVRZR4JigvyMPKPyJ5oixOpgZZYCZ+O5w6l2Ds3mM
	 W1ITNWM20cjH3ItiJZr8ao48G5SnpdsVGA9pWQrtHsu1CAT0rCY7obBaiOeu9x68lCoK7
	 GMlHwnMqfC9iOOmsv7VMgBczoGKqkG5QIofoEKaeW+tcsy4h5k0lhASrOPUSLc1av8doj
	 s2jNviEyjRcWkGLPhXv6BDB+InQeN7mTRCaMPBYNPMWs8vOuP59FeXqRGrkcopLnR24Mu
	 3YUJXpFb2+LKlfQiwjmCU2TEBLUOm9ZzlmI7ynYXhc5sw5AZhVMxUo4IVGDaMU8s9MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241555;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lasDUDTx6FUQUH/GLVbxxu7IlHIU0qVp5B5EecGqDfE=;
	b=hQRR9xvS7fXI5Goa/rWM2oU3BcLfFMqCHFUiNbRmszFNBTVW+GMSuLb2aqnIUzdgB9pS
	 yAhKAVSLr/XX+IO70eRcdNufceeLNz4XVe+Va/QJ232uDnaYFZeaJSNF0Ajg7yzq48ir2
	 xQgWyTPDTuLH2ABSEYxAiNjyjbrcSNhqR4vWdTErqE9G59+6b8Fa8XG7PPkaWLaSL7Uvm
	 s1xh835H99hSQhbLNoIJyuKhqKQPxR8DhS1egcbimhAN8O0dMnUS6LAZYxPlCnKNylpgK
	 xckNQ1pDeRuAlHjh4IfU/ucH7utUsAkUFjqyc0ig00190Lo1bS3kOfcFod/0TNlaIvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="hDFpMX/p";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.28
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14386082BC2;
	Mon,  9 Nov 2026 16:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14386082BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=hDFpMX/p
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WisJzk9Ob2ekaMeDGdd+MPb3dt45umdhkwzHLjilzzilNt9GVvBmP4Wn0s68GbEz7cF+tzk3mcaEpxp1PS0dzFyGPZ/XZtGmRUhLfZZna70DMKZ4iensm81tIn470FjaQMPo9cZz2v/eHryejCDdqM/3oACVDrA/SkIJU0C89qKc6xklx+XoOp4+GzYQe2qDrRSg8ZUfMc02sI9gYlJDxu2K35f9wdpEaibJiZuzUWYmZdTMSqbRvm8uUVYb4WE3eI9WNLLCRoOQb8Av/dZjeVzKbr6SZtrDM3T6VgDt84ECXNFJH1PjLZWbevjwuJ13Ic0Q6XMQMMAI8u8UudpgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lasDUDTx6FUQUH/GLVbxxu7IlHIU0qVp5B5EecGqDfE=;
 b=fKrXHkDeBlUznPLB5JkPSK+yLK105mJozxNUbcxPx08Co9lYkyWEN/cODpCYUKtMQnlZE323ZaEagfYE6Gpb30mmYz8GDIfI7zWWc0mmO0M3AcaGUZBUbWKqErbbeumIbtEfX9zpnBzEjMRpH/WPs19xYXFQma0bfdzxhrqh0cs2/LbsT/ksIb81Php65owYLFfp7xmILtPdhjipOQKwiJTUwxeM3Eium9VDF2kAiFE8BhM6JUrn644iMqnOUgcLm0B8Nz1hLjQqyXV1/ei+urTCcAtfljI1v2GMrKhMX1Tz6m1EKueVQlDTQOHJBWKryUlFqrwZrVpfaBPh7/OSXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lasDUDTx6FUQUH/GLVbxxu7IlHIU0qVp5B5EecGqDfE=;
 b=hDFpMX/pUZwLt7srXyEGUQfBRz4jIRgyDYODcB5NLOHn7OAbSBBhlXnJPDmsMH422zGuE84gReBO4a2557dVaZVp0mBwzknuCye6K4vRymo29cF6NzKxCNCiYUJ3Ntf0G1pMjXonTXiZieT24faS16ch1n4ZrKyYmBbxcmfCKEjOpIAFh8bkaf0tKBKNy9whFYBZckA/F5KngcQwH+atInB9hgwIpHeidVvwAuGYdpxbj00dzoIugELimLN/bp0TvjdFvJcEMDPpHqM5dS+n15DzOT14cGIxlu6zdbTV2kyzbLGFA5P/jJgcejpONGOd8Ax+a8MOofEgGNjNKORXaQ==
Received: from GV3P280CA0010.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::11) by
 GVXPR10MB8842.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1de::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.7; Mon, 9 Nov 2026 16:25:50 +0000
Received: from WA1PEPF000099D3.eurprd04.prod.outlook.com
 (2603:10a6:150:b:cafe::2) by GV3P280CA0010.outlook.office365.com
 (2603:10a6:150:b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 16:25:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099D3.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 16:25:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 9 Nov
 2026 17:26:29 +0100
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 9 Nov
 2026 17:25:48 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Mon, 9 Nov 2026 17:25:05 +0100
Subject: [PATCH 3/4] ARM: dts: stm32: use hex reg for timer2 on
 stm32mp15xx-dhcom-overlay
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261109-timer-use-hex-unit-addr-v1-3-b4abfa457adb@foss.st.com>
References: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
In-Reply-To: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut
	<marex@nabladev.com>, =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?=
	<goran.radni@gmail.com>, =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?=
	<boerge.struempfel@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D3:EE_|GVXPR10MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: 8644f3b9-de54-4e54-67bd-08df3e7e1dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|23010399003|1800799024|261009223027099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261022105027099003|261026140227099003|11063799006|56012099006|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Kdgcie7xyY2cBfzZ7yNZUKU4ibLqkD4vJzisKnbdvHPsWIhWK42VnqY3IDyAV6T0f9atSHp/dd6e3jf/QckT/PZvP8qwN91Y9t9QscOMPI/whrhn1k8tz7cAlnrl8GXgYUMeVbaCbZixrDgHNkOMblRgi2KK3ZdLg2skkc395H/er5lfNnCOnDrcnpag/Ol2xiZtdsEFvejLmrQ/AhUOxUWL4HWD9UKC8PWxty5ry9XcarceZw6rLd65atSwbTLS8fcFYAGqu8lQi01eYOlcwD28RvauGaSrtTBHRG6CSCiMy+FHht5u1JnzELZFuE+QP5DbFSxePZ/bn0b0OdzX6iiPW4cTPd/tzLxa+edwbznTMmytiOCVcHP+/LUpBNQ9+qKyyTvSsqopCQH5SYBFY2K8SFOeJxTcdWmpCMYQAu8rcfX5eBC7K6fwBElciHP6BEjZ0zr/iSnTh45vM7SxxSoLkMtaljZ2NjPIXtsMXQmsTPnwPJS3Daweda61He6uTDGZT3MRI3cN4RwO4E1Msih5/9jOYRCF05etscGN4UhymsGdy2AMkDOyAMBhXcKX+wEkbSLj4RQo4JMGPsIITK0S7+67toeudxMQSj56o7bJq+BEY/e2E0gZq883vM6vkps+nu3d4qB4CIVpkm7waoeA2gJMPMW9TgZ7ySfl8Dg=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(261009223027099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(11063799006)(56012099006)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d8RRbKV0Z2x+mYO778nKuxszzZ+g5p9NhYpvDFkG+DAfpIu4LaXcOjsVkxdw1PXMHyYX0fLPrad/9ZGr2t5GPSoh05L3GWpCYW30Pu7gJ+5FCac6oTPP3a6JCyM6aOXsEIj6nGwzu2rhlF8CEOEKff1V1Xl2JIAXDPeYPiYcwA+mMYZOCpTFi5D0FJl7aCE0bPDjfyowJrKkjECg68uxfVYYMw9ey2ZSGYE8elMEPZ25ZE4FZI/tG1cEtly+976brAVRhXef3x8w/rNaFyH9coFKUzVpNE1qAg6QVveBge8OiwCbiMvKbR14jVcmGlMS0kdy3DTwQ0CTkrGjHey4WU/P3Zv4rtvLla0dnb5Oy061R+SyI8cuPjZx9eTFkAtRkQWcFhiDT92puDWeW4G6LIuZenqwFzumooD7tGpchX1Pu1UfukB0470JJ79qcsqJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 16:25:49.7717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8644f3b9-de54-4e54-67bd-08df3e7e1dec
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099D3.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8842

Use hexadecimal format for reg property. This has been raised since
("dt-bindings: Use hex unit address patterns"). The SoC dtsi file has
been updated to adopt hex for unit addresses and reg properties. So
update reg property in stm32mp15xx-dhcom-overlay too.

Link: https://patch.msgid.link/linux-devicetree/20261102135330.2493332-1-robh@kernel.org/
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi
index 41229ec680cc..e9a58a8ea61e 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi
@@ -56,7 +56,7 @@ pwm2: pwm {
 	};
 
 	timer@1 {
-		reg = <1>;
+		reg = <0x1>;
 		status = "okay";
 	};
 };

-- 
2.43.0

