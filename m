Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAECC466B63;
	Wed,  7 Oct 2026 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386150; cv=fail; b=qc/72hKCBWGXyFqEOIgw0fIT5fgr12GRKvfLuDIb5O5QdeWIi1//535QDQr2u9CugDGdCETfwpUv8CDNijkgOC5Frjad6XmfkNJBiECqmKB/9oJsZMBosvq6RldHqajXjdWn1co6Ep8CO8gn7PMN8m+JfmLFLKSbTLJuw4RiiQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386150; c=relaxed/simple;
	bh=KqEC+E0Gr9D0S0WpOsk5v6aCqplxjoCLFXGo5SRau/0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2YRMNysHw1fVZZlHmqHUkbQgp7t2PbfQS1Wm++2BaxJcUHAhSbCKePl1ME/JIQiqLUCWlsYtDhveOAwF70c433R969prGhQWuf1+KkQOV9jenHflLIiKxv7qG6CqTr+6yKgVNMfwEWxjQA6JZ/4Ob4OD8VtNR7UT2p8yLATp0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dXw8icKG; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dXw8icKG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdS6lG06xca55X4QFMCtl9gpai595bcIdNbbKv0GOv2rPGgcymnZm45Rs1BqViLSKcW16fXjLxo1Ei/RfWcEQ6Lt5/R00t6kGK9rB9XGnLN0g5fL27sAgMwr2LWcv4If2WerdkpymEiy95CMmeENbugx20z1TPDbl3CIg/kV7qSZcy25aTtA7gDB4/azM0Xu/X4ApeFh+/NM7e9P72H8KKqjAN+FjrGz4p6KpwWRN+NtftGJ8xq4nzltwHMCJm6tSnYVCsdBDXsu9gg8atbAPo/flHGERi2Jc4sLjn6EPLwSfKaW7MmZ7W2g1q2hlfJ6xB89H7myFzVTdoXN5bxJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fifo3UpNT7BixDOL8bAjQb6970Zrc0cVzsqE0QMBoTg=;
 b=i6cE5H1zAUjK7ZfvbANM7sNGabJjFOeduA6TlNlroIlZunxxdg0/QbqjD35Vd/UIL+5BIO5xKhxEuwT2FMIXwUPxPbkGBhuUM+BDnELmdDko3Ez+fHQeTzDwUctcI//tzVyhtpOaMpp0/rXkK2EG77F/9RSnLkRtRXuBryEKiOs9tWZUHNCT0JLml4WFF0MM2rj05oJ57iP5zfyVR5x7y/R4ohGHSnfDmCqrExPNsPc7b0PRf8WBUbtfsH4+oG3XAMvsqwLUB9xGpZg1wbkQwUIZ53O/EH07dvh3NtkIBTBTv8JvjzrR8TdfhfYqzgXz+vTvtgMsQdoz9qld//JVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fifo3UpNT7BixDOL8bAjQb6970Zrc0cVzsqE0QMBoTg=;
 b=dXw8icKGsrpf+Ykpm7595F++kSGkyxPO17+Vm58oIpFRaabluTEeV/X/SlM8tk28RUbkfVqybuCHRwXZxiijDIIsTH/WrjAT/me7EYQojOCesrkGYzmcyU7vOhQwujrLWV1t3Zzq04adWTrklnp1S0B5urwTST2SAa0oyKOoSC+FFSGGQmyJNLKyIVu3HCKKX3KIKM0IcIxj3OULUgR8nNkUgNlUraBT8YOx3+YsyWSxofNWYV1j/QQyhZF9yRLAcBQuCn6uDNbLBQmrxVGXODvrCDV9a6W+LsGrEzkjE3+6FU52+j56VoQQZW1M8YvQM4Zg2qVjdqKxxZGBXBOHbg==
Received: from PA7P264CA0249.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:371::16)
 by PAXPR10MB7630.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:283::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Wed, 7 Oct
 2026 15:15:36 +0000
Received: from MI3PEPF00008494.eurprd03.prod.outlook.com
 (2603:10a6:102:371:cafe::4f) by PA7P264CA0249.outlook.office365.com
 (2603:10a6:102:371::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 15:15:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008494.mail.protection.outlook.com (10.167.240.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 7 Oct 2026 15:15:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 17:21:00 +0200
Received: from localhost (10.252.9.73) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 17:14:07 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>
Subject: [PATCH 2/3] ARM: dts: stm32: move ARM SMC watchdog to STM32MP151 SoC
Date: Wed, 7 Oct 2026 17:13:57 +0200
Message-ID: <20261007151358.1166329-3-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007151358.1166329-1-antonio.borneo@foss.st.com>
References: <20261007151358.1166329-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008494:EE_|PAXPR10MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 944c95a7-1f02-461c-591a-08df2485d6c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	bZQp3DhwFMkqsZp4Flf13QEGHRg2mzINFarfsqHMIz2FBgHkKRhebGoPjkHfcxmkbzNw0bKVV6PBbAGtagGukiedAFcLA7m6Q/qrxuYoYVcLUyxx3q92g11QVXwkASqlOaOceZl73IXEGlDcPcRShaE3zT+AwowlCd/KBwG7XQH5Oa+jZlSlNRnnoT135ACo4P+0G+4OIiEuxTtwQnYXf9G4MjN359aL4fIyzd/lAvT7VDpzIliCKy/ZDL+4R8SOLL4KcurwXINzXPQGc/1fKjK+HwQ2jBUhGwxZEotKQBMTUKjgWOMBc96vWQc4U1ov5/bvJG0S/hPXBP9jJ6bXz1uUkCl7WN8Rv24o4UntOI2SzuOrJpgomBfocMRxU6o4X6j/IYT/G1Gw1hY6YGo7ymrkzng/WaNHWRGzLSv9+eS/SmXiHUTd2ImBUenRNbNYaeJGQdDI8tGC+oDRdoWm/mtg+N8dlS37ZHWDssaS8YNL+XqncMNqj2sNCOkMFcuaEbgLuGNJqdvUQYgeRVgEFtMMBowsR1uB4ikgCxvh/evsBSJ1o5JdMB8SkOxKGs3bOg2KhTc8Oi+EHMQK+u6xMOUE9nFZf4Mm7w2PYD9VUiAQEIltkPVr9bY9h4XVrxtylz76pYskMSnQWmjGSg+0ipttD+ntzRbQMRlK+E3n0D8I5H1XOdcAOug06SBW8a3vCHY7bzfrRhzrX0aAq3kL2g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ai8WmO8DITIMbd3d1/bhigDFxB6eGZ9JW95zc66NFLUEfaHH2GvWzP1TPrqRWOyhjsL+1jj7A18NVfBemMt7OGHTYnkR1d0HR9i6rvH7UWBstCoPN2lSOVczwJj9sqbtDQfE148WUwbaFcaLjJc0DgjxNrswqBs2CtHfvvNuJvHlMBgXzkzILcO8IOUo55Thtm8xfYnWpXY5PsNJU0J8D1FFUiZ5gc991utXVWowM9c4ZOX8s0ezPHxSyoYWHw7Jwu/NiMo7I6WUTphhY1oig/VkJXEkepDgEtMaQiPrTgJZkHZrAG2oRPr/TgDLfkWlFkUhyPoKV9o7L40vQtu/0eR72s45rS/VGaPXHUwkGZS9Odja5pEJz37dfJ2s7fEUGtFwLDoOu3dRyzE/Y3J/XaFG7+fF8GgliiTEx6KpxWA8JpdTWqPSPYvwO7WBUw24
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 15:15:36.1511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 944c95a7-1f02-461c-591a-08df2485d6c3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008494.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB7630

All the boards where IWDG1 is secured and monitored through OP-TEE
require Linux to control the secure watchdog through SMC calls.

Move the node arm,smc-wdt in the SoC file.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi           | 6 ++++++
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi | 7 -------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 25f111c8aa7a4..f0b8c8f617bc5 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -31,6 +31,12 @@ arm-pmu {
 		interrupt-parent = <&intc>;
 	};
 
+	arm_wdt: watchdog {
+		compatible = "arm,smc-wdt";
+		arm,smc-id = <0xbc000000>;
+		status = "disabled";
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
index 172347769e025..27ea5e79efc66 100644
--- a/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
@@ -13,13 +13,6 @@ optee@de000000 {
 			no-map;
 		};
 	};
-
-	arm_wdt: watchdog {
-		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xbc000000>;
-		status = "disabled";
-	};
-
 };
 
 &adc {
-- 
2.34.1

