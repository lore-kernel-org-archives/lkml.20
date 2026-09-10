Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013032.outbound.protection.outlook.com [52.101.83.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234E249DB9D;
	Thu, 10 Sep 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049504; cv=fail; b=NrhlUBpFhGmStprFswdZV0cvjRYIPIFKp6ex9POvKhuYt4PTCGyMWLHdiebNTv7yDzpMMqIyoCHq2a0GAO2EWO5I4KkbSmQeHuHiP1f8j5RrdCtaubl6zvHDEcghKkDtxafLCxRx2a3lEMjys59H75VUDXviDEocKcpn7EyPtEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049504; c=relaxed/simple;
	bh=oX5wImAFpXcuUUzGOEClkw2QE8m2Vl8tNi0/UF3nBB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=I3n/rnKHqYT7XwRAKhGjkRFBBiM7XmVGK3V1NkmfEw9dHXQYyE5/nQai1EGb61shxytcg5rIxlXW0C4GYfaX1P9uwZIbrEgT0G7Mtvk3CCEwqSdv7JY6awESCZI/WQLyfYYZrSm8pjMRihaEyMhQX3fnJRfuVsEzRwxNVid2FPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TKMKhhXP; arc=fail smtp.client-ip=52.101.83.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TKMKhhXP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWBBLf0uXMPSD8FaX18V1zFVuNL7KwjnHC+htoTeeHiqCPaCZPdlYOXn2H/tWIuKDbmA6sFgO5+AzZujTvjsaVOtc+T9CKb5NZYUvBVJDwQGefnVcPQIh05n0DaYWZr1Q+9ZruW4JdPQVQpot9Nm0BZDOF0M5OUT8uOSv8yEMQHWgAWIuupH/C0tsPasq0vUNS6qHa79G8JPQn25IW2ZMBHk1cyz9vBQ/5ClE3XU/2PLJsxGtpEksvisWqaSThCHXXSyGsp/ROEDWcVYaD3OyJVnwFj4Jlgw7SdGHR2Mkp+nx479UW8EUaO5fb06zplZxVSYyLeaYZdg0NLy6xC6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sACEsocuIMYSZAR84plwhGxHnJzEHPHQGooOE9frC9c=;
 b=e67cl9RHlqQzqTPM4MocMVhzC/02JcdeXjvM8wpBL+KhXtsajLwv9AuZiwDRBQ0yRQTs/dNi3H8MdMTJcTnBaHizpP+0QkeCRfcuNDQsxGFjuZWAIdv9PQ0SCRxuf4Ug78RD2/TAv1CVNm9HuJqfyBP1Wc60CPxg8HY4I89Sfu4yfWymUKW8cOnHNdjZGrgYcQtHNW73Y70izwzDnW91sMNI6lXPGT0ywuYRMOUeoKuSIUphlqHbmz0y4tLm72kjf3BiyyT1ZbvkF6yIoNYzf/k0FNOw/bdcEVF4gesWlD/IzPyjz/QLPGODR6JZD4KtqCrW44wsRDUFnzlhYZB+1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sACEsocuIMYSZAR84plwhGxHnJzEHPHQGooOE9frC9c=;
 b=TKMKhhXPLZ7kIRmNbKz5LCqb1wfg16NfEAKF2mIpFWujRmzSWrRJCOMCEmOiXeIc95Eu1KbS5LulsN2Yiggp6ucPJ0a67VHspI4PLBuF5kwy/B5Zjd0s8lSSsHk3qcJvL10w/QRXduKZEcEIs0b3FUd/ifTde/NwksHJRiVSKkRsmioSvGSSM5ym7bJ+it/WHdmIJgZ4pAqBojnrJID27vzZO/JjPJaLRxquGxKbvqQAO2souJP8KeQKIYgn+KvD3tKvd9xOxdxRyZIupQ1b+0zAl2RfS3hs8v6gyxf3p1Jn84wzpfK9OAsxqjNYo+N1iUguFSVtHHjFGDsQE98P3A==
Received: from PA7P264CA0358.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::14)
 by AS4PR10MB5647.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 14:11:38 +0000
Received: from MI3PEPF00008481.eurprd02.prod.outlook.com
 (2603:10a6:102:37c:cafe::ad) by PA7P264CA0358.outlook.office365.com
 (2603:10a6:102:37c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 14:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008481.mail.protection.outlook.com (10.167.240.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 14:11:37 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 16:17:38 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 16:11:36 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Sep 2026 16:11:22 +0200
Subject: [PATCH 1/3] dt-bindings: nvmem: add binding for STM32MPX TAMP
 backup registers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-upstream_nvram_reworked-v1-1-521c16175cef@foss.st.com>
References: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
In-Reply-To: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008481:EE_|AS4PR10MB5647:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fceb9c1-4ede-43cd-f707-08df0f456dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|56012099006|3023799007|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	rgLLkIKVSX3WykRnoBcc1/1nEN+WpQz36m4ECi442Z6ekLXpJvTxgRBFvHtKBNXboqNYumezbMbhnHjjiYzk/ZRQbtyq7/FKiv5HjJGMhO1PPD4iJJbtfSYF6b3W1zxII15t3DkyrLVFRqa4CXZYoEE5pY9FQZq7si7nucNaBglzc54v/7VNWNk5MIBxCmvrV8X8hsJOKmAiHT2V2qYmtZUkGGFA4991nT0374agmNOzi7s2szLJvJu8c4HviLXvrv+2jY7sbdOiftrvzfw0HhMawUpLoQ48td0NQC2STweaKkMDBcIoQgLM19mGGP7zybQ4+7nopeakYO3kUJJ/75E70kUkCKK6ZcHY962o0M58T6umF/nRZ9zUb0vbrsnUo5OamcuUizLWwUkm8nenTBfns+OzihFVg7lqcPok7EH4C6em3o5mOZMoxmNDc96vb0etsgvtKPPV0L+IPO9aD0Wc2ttl5lqWP/7BGh3CBEs+Xs8dCbds+jwYU6cHlOg2gkh4SlSkQnMrYtryKMe2Jn4YhxFDeyhdUHGSquXk30AJ7pRmViKSgeYfb0kyAAL5sqcuVvuYeN+wyF//YHwaHqIkpb7bEhQ/kx2a1Pd/iRaJBdSingAVtmLOTq7mmT9mg69955oETCEbSYSnqUoyMg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ly9WkuSLXExz9wS6g3lUyXcD6t+ymOZnsfoZWmmbnYEEMYxNkVXhJI7bDLXevEymeJE6uZHAUXK/lifCCDAE373wstmwum0VrBvoEMzEXtTWIotPWxgVS9necSpeBGI+uXdSCjYrOFSLiAtbHqTXYbzGARkmd1dN24iFSb2PD0OitpPVzEHXTBhI4oNqcTkRREiQ6V2VCBW5GOKBQtMep5g8MXEiP1n+TfCEXY6sFGOg/WJRm06ObnY686vSY1LUinm75EjVne+9G5vOy5MRp8sU/nNrhv5l01c0zvYXZIaBR6TrEOQwNjCOIhqWFZnPcCXMX/dIVI7Mzfgtk9p6dfQtEJGtf+XVoVn8U7dYi39i5xBSf4gZE3/GhfLtgsLDRojqmsIudPHbDr5cgbiQq0hz4hozSTynw/jJ7kELQ6t+PKV3ZphFSWR9zt0gppEE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 14:11:37.7541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fceb9c1-4ede-43cd-f707-08df0f456dbf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008481.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5647

From: Simeon Marijon <simeon.marijon@foss.st.com>

Adds the binding documentation for TAMP backup registers.
The backup registers is a part of the TAMP device of STM32 MPU.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        | 57 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
new file mode 100644
index 000000000000..4af3b88db566
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/st,stm32-tamp-nvram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 backup registers as NVMEM
+
+description: |
+  This represents STM32 backup registers area presented as nvmem cells.
+  This contains various information (e.g. boot mode passed to bootloaders).
+
+maintainers:
+  - Simeon Marijon <simeon.marijon@foss.st.com>
+  - Patrice Chotard <patrice.chotard@foss.st.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp15-tamp-nvram
+      - st,stm32mp25-tamp-nvram
+
+  reg:
+    description:
+      TAMP Registers bank location and size.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvram: nvram@5c00a100 {
+      reg = <0x5c00a100 0x80>;
+      compatible = "st,stm32mp15-tamp-nvram";
+
+      nvmem-layout {
+        compatible = "fixed-layout";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        /* Data cells */
+        wakeup_sec: tamp-bkp@0 {
+            reg = <0x0 0x4>;
+        };
+        boot_mode: tamp-bkp@50 {
+            /*see boot mode selection feature*/
+            reg = <0x50 0x4>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..b634c037c229 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26261,6 +26261,13 @@ F:	Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
 F:	Documentation/devicetree/bindings/dma/stm32/
 F:	drivers/dma/stm32/
 
+STM32 TAMP DRIVERS
+M:	Simeon Marijon <simeon.marijon@foss.st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
+L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
+
 STM32 TIMER/LPTIMER DRIVERS
 M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
 S:	Maintained

-- 
2.43.0

