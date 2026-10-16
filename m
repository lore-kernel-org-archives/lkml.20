Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazhn15011020.outbound.protection.outlook.com [52.102.161.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEC34749F4;
	Fri, 16 Oct 2026 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.161.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164379; cv=fail; b=YnVi2fvXOZjJy0wyI8wWZapDevdCxhLbIKvtkeGQZT+9uv27932mvzrUaRX+ocJKMKhY2Q6ltQ/TMbV694TFVesC0YXQXNcacrEbhcx5H7krpVmCsCGNWFesamjeNHzvPDIf1mrpJYLhhGkpROvZ1nTa887kDhVqpjx/Fo/5EpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164379; c=relaxed/simple;
	bh=4eQHbdcaV3TQZDNhJymo+hJGiEg6gsF/XDDLOyTyWfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dZSvg+tssUW0R11dBfu9agygZiGUV9HsTj57O0rOdmJsVjaLMuNjAymlh0kcOjMwGhwRF+UNbjB4FKPJr/knAsJ8mcutv58MPqv6OXTiZQQp0CR+kH6KszsOZaq3mPOUxi3almSQjqO2qTZ4WDj/n5Mcc2l0o2PCuhkPYTkfuvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TwBbl7pO; arc=fail smtp.client-ip=52.102.161.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TwBbl7pO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWRJGL6bGOiNPcLQKBdN6AkErtAgFjdTAIzQhXm0uBpo3Zs9XR4F4waYOwe3u2nogAm3Ccd8ZALPXXsxJ6OAlqlBA0KTNSM7cQBA4HqfVDvgxitTk8VRS6u0BzIU3vQa59UYpdwIsmMIcN/4CIL3eStRKCzYxROrrBcLwB+zE+eUlJcMAiFYK667UHIt4jSjoEkX1FcPuo3Ubh3Vy93+/Eu8v4CQDwZT1OGZwo9bGaXBY73/E0Z6eftLzzGyN50zXl38jU3yOVwoVpfWOdOT2tYPqfNjJrVkBHuoQuav9iOVvKN1oGmIcRVJ6BvWAPE23ME1HwAZQc2zexXwRW3K3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCnC9y32ACX//JDPXdBN4Rcze8igdbe7INojLa5JDJ4=;
 b=Yt3todajDV5m9Qz23OBvxPkPfAa1FHFdlPvqS2STaGQKwCGQg6gE9PxX33Y9RSv5/wW5qwfyl7mT9Hs2FA+D8B8v2DB4e5r0VNCYRjXyD4wL8BcTGmDxFAf8RW7gzTUwVsl5weLXXWl/JA1Ur48ul4TLZTZoQt5uUfqOoO9Og6ljaQqSwQfB7CPT2VTDMARju+azHX3HI8YYC52UwYXdoMJAPC8GE5LaCqOjruLAId2RN47eA5HWQz7x46JHDpQK9sufPQB50b1xSjL2ySUuezljbhuoj5Q5oGVhqU7l35HVD8dq7O1W+LxV9QGDicWH4PVx5XSQ6IOJuwBnkwBtAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCnC9y32ACX//JDPXdBN4Rcze8igdbe7INojLa5JDJ4=;
 b=TwBbl7pOl697H/4D9OmCxV9zDmhD1GI5+PcWeByvuYzWabohILzx9LWRsxHECCMJ5jL5Po8ZR/isaoWyOi1vrYG6Jusb0efKB/DDKoXcoOfpb+m6I6TLf/IsOQzwSBog1OI/9BEAKhf6INbBhsv2xMjoR1WrMTpOYqRLrRLQPBaonEDNCMSHMbpu9L3PzCH99lj31aI8hCrnoe6VSoIJL9MF7aGDMy+eDWTkzBHZosY4f13R4H4Q70VufPcOxHDAX141yO/MHwJrseiU2lAtxgh5qU/M5gFfWyHEsjHvXSwinmVyzNQ3b9a2Z2mBDiU5PDdj98LsW68Keg4M2fTx3g==
Received: from AS9P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::16)
 by GV2PR10MB6453.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 15:26:12 +0000
Received: from AMS1EPF0000009E.eurprd02.prod.outlook.com
 (2603:10a6:20b:532:cafe::59) by AS9P250CA0017.outlook.office365.com
 (2603:10a6:20b:532::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 15:26:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000009E.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 15:26:12 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 17:26:27 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 17:26:11 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 16 Oct 2026 17:26:03 +0200
Subject: [PATCH v3 1/3] dt-bindings: nvmem: add STM32MPX TAMP backup
 registers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261016-upstream_nvram_reworked-v3-1-f65908490cf7@foss.st.com>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
In-Reply-To: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009E:EE_|GV2PR10MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: 447fb59a-d28c-426a-bd84-08df2b99cf85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|34020700016|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|13003099007|3023799007|12100799066;
X-Microsoft-Antispam-Message-Info:
	EHM+yW6O/WWL1VUPRz8wLeNhs24tXhFyak2GddH3Zs4Em5+Vg3ve/ibpN8FDOoWqjXUKyrxs4lOj9aCeS6r4Z6IZ6gjk5ijm7Fdab3Dexq8tAe7mD+OhtS8BxxEAyukiTm/eJarquNC7dURKliTOxKrKpekU1TCBi5v/cnZz/9bWCNWgc0svsyovmHl+sIgjRTnkjMt/nNNFcTx0h9aRo/fPOxHqh3RrQbWd2WcXb3UeQ30ewL5LG6kBFzdP4+hJafd34XFIvyKdMiICBnDwiwDhEEDHzhuo42FwJxyfsYmzh83MMingwkJIvpz5gTuw5P+c52D9lSNwM68Iy3GqATcasGOi1tj80/lMCc3qN5x+43bLrg0xowQpP9kdr9sBD0msX+NI3kUd2fc38WxVlkdZcKj9b2GtMpH2fdo8taEy2o7w8b/WVIYoFQoMahB9FM3LMcGTXUEPKagVAIA5u76/HCA+lT6vLRngmFhte1H/vIpFHDBJt1gDxyIWj/kBH4fKgK9QeqyhNv55i/DWuufSaf5NfxdLT/kjDoQtsNQ+ha9D/PoPnWxerFfRdmtsnQ3RzL+3WJUY1/puqCmPzG3j1npB1OKbwE8l8wpZ2qC37+1FsfDbYtt1jXF5mdg0qyZgQe1yUb5j5dCKYkh+1A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(34020700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(13003099007)(3023799007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kizen8RW2xOrBl5yfzMaHlinS4aYaiZudu7fVJ5Ns2FyEotPGp2pe74aLpxHWqBWeU7S8jvQP66l/bNvStvpr9vbizihx9VOThUbXZSo3UXkcIiT0Z9LJdhsSPwoG+K57cIYQUkBJfFYWpnAFGugWatDySfF3KxwH2v8eFUoWrAfQGHMj4vzIYxi+OCv4FzgI8ftY2OFVOPCuHq+EDMUfKeH994j4Zh+jW5B1ieZ+8YDKlU5hzGHV4XFkPNdFY3CW33idWGchMdUxdd1gzsNT8RYC+YuuiYIUnj1npN5LxAKhX9b/adQenZUajPvf0hvxTcq45Smut8zlWJol8b9T2psJugZFVCT79j0BN1YNIVsI3nMXiBbYAI9psCGjjaePM47UfXTXmWQ63bZ0auszoyTo4spXGpvY2f9pdYbR29NGcm4WN0KhMa901M6AVV8
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:26:12.0636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 447fb59a-d28c-426a-bd84-08df2b99cf85
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000009E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6453

From: Simeon Marijon <simeon.marijon@foss.st.com>

Adds the binding documentation for TAMP backup registers.
The backup registers is a part of the TAMP device of STM32 MPU.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

