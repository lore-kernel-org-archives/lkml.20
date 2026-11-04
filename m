Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793785049;
	b=wRDY2qvSAxbC4aj9VhmnkHZxKESHvBVLVjPpvrYTZVEZCSprsaTnlvgaG3bikaCpXQR7
	 wS/yOAKN7VeNkqAIWyJ5xqljdoRIuagfOogc1c+T+ezs6ce1kpNsgytTeUro2ZFNyb9Ao
	 Y74kgQc999toj7rnGUuBnktkXx4tO6Yuf3g48fkjielpklr1IPKZFrsDfIvxVEH/x1UpH
	 cyZqgQwDOrdDSpSFv70cpvwukV+bMznkx01lx4exO83D7iF1U4tLrdT2e80bvaopiC0P0
	 WOCB7RCv1cTHd/CsaiwwUGXaC47Z3JmoxhGngpu/JV1LbUJrTE1LiJ0P1rTNSldsdtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785049;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=bCKYtV7nj513bzTDnSiMLm8z+PTZiQIbO4y9+eS9Vv4=;
	b=G6E0Unm1Lr7ia68IkI47c/MN+3s5xNm+FkGlMy13QYYK0NS+/y0jcKsuFnjNLrfo0i3y
	 hjkUtIgzsFp1IiFr8JShvbRl6V6787hF7eIc7PL2gBJYIUM+XgxOxxava+U3K4hT+3xPD
	 sxCVfqeAdS0L7nwyhVggt0Fa9KTkU6uWmjfk12xOg0/CKxyFW5xvJR7zQOB4/gDg6ka1A
	 PxWLkKJyIwW4JLkSa8xTqoeUl1mpvW1Y+vXtf6kwANpmPYnS80prfbUVbaAnHjzKlc95w
	 y3gCqu6d8x/D3PVEPJtjWBdTNg1Miys0lltNhsnh/5J9nVqpMOmZPdWa8ZClV6bLYpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bP4EmsKc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.11
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8717606A326;
	Wed,  4 Nov 2026 09:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8717606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bP4EmsKc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZZq1+ZH0h9aDVOGntk7izLdUCZpn/jgzzEVEZA9p/yfdNpGChZ9BWmWpUlTOap7iHGyfCl9G/fFTrLIqHwDvzj7CPFtCbZJQD8Zhderj9yULFT6WoVGLwbXiKjiid0PNa+EOQSjYrglVr2CKyYo8NTQBjZCXvq5UIr8W3++4HrwR+TWaDQO3ts5xjiP95DUhbxVgANDvt8qJcdsM5PIyWCdt1dBxf9+VUSqy82L2VJ3yu1wkSMIc4w1A4EH3k2kktkc22I5fkGsKbtJCrcV87PelBtyYU9Cz4/8O0Mlg0h9dNyZ0d+I7wpDXow2SdRetEZae85E6g9qzTAb7NNf5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCKYtV7nj513bzTDnSiMLm8z+PTZiQIbO4y9+eS9Vv4=;
 b=qBjxCh5TfSDgsWA6+x6al49m1F3Z5rHg+A++F8pYEXgYNAOYoXw+CfjvSVCRmLs+3A4rgjDTKfUZZlGD3ZGSf6HLQSQxXqgpxR89zTv4uUjBzxLKpgzFuaTHZmc7qwsb3CTp7LoU+3JGTPbeGKZyNe+/0h6q4W3zwJolfmrqWFBmSM+N6Nk8gOGXyiZ622h3KCFWqUpLFVcVlajCpTp3gZfcGfMRX3DqjLDNVesF/T7Gtzr14UJYofVXKIqwCRSflrNbVifK78xNoBtrzvmS0Xynh98FG+O3kIvxjorGEcR41fe1vR4SCTw658dNRcrSKnujH9QnL/JDqY7hcjunhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCKYtV7nj513bzTDnSiMLm8z+PTZiQIbO4y9+eS9Vv4=;
 b=bP4EmsKczLM+Q8wPT4SxzZVNfqLy1Jts6g2wy6P95M6YCyw0bCFfoWIuLA3txjft/LqGABHvcy6wPl4punPwcNXAjNKcnJ+mjjhHNh/F+rgnSPKu7gMp1dh1rt4m7F7WQTBzQLm6GK82/f0Etd6fpyG/8YTVbiippLEKJo71Y0Or+YNt8rsD5egQN3uhj6fMyWj9HL3feINV2qWDHzj1DBrQq4mrOFtrIVVO9ofL9CMYKQtDvd8Kkx03wyjnqcvEaphw92MhHcOc8soiDekTlftRolSnuNa2IpXGpEkXwf3kzx9wK71y0h7bk730VycTxBakt3b4JkwH2mlK7W0sGA==
Received: from DU7P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::28)
 by PAWPR10MB6877.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:33a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 09:37:24 +0000
Received: from MAD0EPF000008B2.eurprd04.prod.outlook.com
 (2603:10a6:10:54f:cafe::16) by DU7P250CA0010.outlook.office365.com
 (2603:10a6:10:54f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 09:37:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B2.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 09:37:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 10:38:07 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 10:37:22 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: st: add PSCI idle state to STM32MP25 CPU domains
Date: Wed, 4 Nov 2026 10:28:38 +0100
Message-ID: <20261104102837.1.Ia5e0774883d237f5825b7090962b454294922558@changeid>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B2:EE_|PAWPR10MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: f3154091-380d-45dc-a7b3-08df3a573af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|261021123027099003|11063799006|56012099006|261028144727099003|261009223027099003|261021121427099003|261026140227099003|261022075727099003|261026121527099003|261022105027099003|10067099003|18002099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	nvkPrBMrn5KmsXmhGR6J3qpBDXdap5csZPkLjk+Dv/IdxkNyf3XNIswax0Q8XBrllPBK/C2R6pAFP0azuRs5XTM21DIaoqQ4GF1erIPxoq6ty0rF9FOJ8vaRElm3Vr8DE00OXKmq8Fsy24VnNO/wf1T9luRD1INM85GP2bcE6G88Hdp5AXleHfOryQcdaCwqPZv28+3kxwL9JeUD5e42hbvdhcG6XoMPEnA/JZ+U2NuscFsJbZ8tzblC8ICjhmy9dQLq2SMbP7LxwoLbvSZgt9RbzCTT2d5OmmUvfrrtoAtCegX8qoohcKInfGzFRVRHeFmaY2tc1u3rv/ucT9v52uoi4orOWP+ns0BC89mMJrqwRll1STqGpAJeOGWeg3WmBuON6RPV0Mr0tGveoC2XXn5P4XswBcmGN2O69b3ESKEspCVfX7HxmqthUfQGuYogIyJC8dTdZb2tRKP0tPtG2//jnN8WiHfJxh70Z6KkFeel8V8gZFtz4kPBslCEhk8GkicTWlo6LmAzt20yxRThwzh0GLjt6KFBrYZv7WlfilFgVUFxNlKOkyrjaQWW1KrRj8FiCQqSuHxjN51zGsOdq3JKzTDOhk6MrbElmI8gkzYNCh9a5Er7WjZn2IoKPdnJTPz0Sbw+Wu7ql8UjfWEpQuJhzjGeIBP33wvYrKUKJo5bT6HESfZWm3tAx4ZZxHKuoCU5zM41KkPlCfC57bZ6xQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(261021123027099003)(11063799006)(56012099006)(261028144727099003)(261009223027099003)(261021121427099003)(261026140227099003)(261022075727099003)(261026121527099003)(261022105027099003)(10067099003)(18002099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AxVbJ8YSJl7sTCrHhOxDkrh/VBcErOl+cHpv+d7VCN3TPjK6mMmuKVUnGVvS+BiByIHIMcQHnRNowPSC4O+oT5vtFZQxhsG6Y+T9sD5CDTw5KNALCgHTmMQuBY9twCW7HL3OfoubkhgguRPXc1jNpr/7AYKhP3uyHdeJdjyB7/5aqYyyyEeORbV/UbbuQAP0W2iveOH32Bty3HxPwT2b3EGEbjwp21SJtfgJBEDvMil+Fxh/EsFR8MR8z9/NNKxvKxl7C1GzFemdLBB0hswrUM1HddjrIcGmfUmBoe48TmYXLs8AQ+xSL6u4hk4cwvIKtrKD1pGst/dAcQhLfkOr0Tpy7OWZMBixkMcVo3wNzieF+BodQSOIpHZu1CvnD1P579ZsgZyi9/Mx799mvQ2aJJE7gPw+9USzZwCqiDQMC7ZDkWBy5KOOnlfsmteC8l/g
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:37:23.4324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3154091-380d-45dc-a7b3-08df3a573af2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6877

Define a PSCI CPU suspend state and reference it from both STM32MP25
CPU power domains.

In OSI mode, PSCI power domains are initialized as off. The idle-state
allows the CPU power-domain governor to manage them, avoiding probe
stalls for devices that depend on the cluster power domain, including
SDMMC1.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Hi,

On kernel v7.4-rc1 and with TF-A BL31 compiled with the PSCI OSI support
the boot of STM32MP25 boards failed because
1/ the domain are OFF by default since commit 6d3080bfe007 ("cpuidle:
   psci: Initialize the PM domains in powered off state for OSI")
2/ the SDMMC1 uses the PSCI domain cluster since commit 4f454e51290d0
   ("arm64: dts: st: add power-domains to sdmmc1 on stm32mp251").

In the trace we have:

[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.5
[    0.000000] psci: OSI mode supported.
[    0.000000] Zone ranges:
.....
[    0.242188] CPUidle PSCI: Initialized CPU PM domain topology using OSI mode
.....
[    1.604962] PM: genpd: Disabling unused power domains
...
[   11.833535] platform 40130000.i2c: deferred probe pending: (reason unknown)
[   11.834888] amba 48220000.mmc: deferred probe pending: (reason unknown)
[   11.841607] genpd_provider power-domain-cluster: sync_state() pending due to 40500000.ommanager

When I remove the power-domain in SDMMC node, I can check the
genpd state and all the PSCI are OFF:

# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children        performance
   /device                         runtime status                  managed by
------------------------------------------------------------------------------
power-domain-cpu1               off-0                           0
power-domain-retention          off-0                           0
                                               power-domain-cluster
power-domain-cluster            off-0                           0
                                               power-domain-cpu0, power-domain-cpu1
power-domain-cpu0               off-0                           0


I can confirm that without the PSCI power domain commit 6d3080bfe007
("cpuidle: psci: Initialize the PM domains in powered off state for
OSI"), I come back to previous behavior:

cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          children        performance
    /device                         runtime status                  managed by
------------------------------------------------------------------------------
power-domain-cpu1               off-0                           0
power-domain-retention          on                              0
                                                power-domain-cluster
power-domain-cluster            on                              0
                                                power-domain-cpu0, power-domain-cpu1
    40130000.i2c                    suspended                   0           SW
    48030000.dcmipp                 suspended                   0           SW
power-domain-cpu0               off-0

The proposed patch is the simplest solution to allow boot of STM32MP25
with kernel v7.4-rc1 and before upstream of D1 power-domain and full
PSCI OSI support.

Regards

Patrick

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/st/stm32mp253.dtsi |  1 +
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dac3d2d23ff0..bf1542818be2 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -25,6 +25,19 @@ cpu0: cpu@0 {
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00000002>;
+				local-timer-stop;
+				entry-latency-us = <150>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
+			};
+		};
 	};
 
 	arm-pmu {
@@ -145,6 +158,7 @@ psci {
 
 		CPU_PD0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&CLUSTER_PD>;
 		};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index 7e82f01fdc10..19b3e55a4414 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -26,6 +26,7 @@ arm-pmu {
 	psci {
 		CPU_PD1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_sleep>;
 			power-domains = <&CLUSTER_PD>;
 		};
 	};
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
branch: master

-- 
2.43.0

