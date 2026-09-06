Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022099.outbound.protection.outlook.com [40.107.75.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83DB379C40;
	Sun,  6 Sep 2026 03:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788665091; cv=fail; b=BXDHTzuaP6Zy0lm+le7Fog74PLLX6g7N4j0WXRWh8W41wzbExDPvZ2L8E+soHDrxzD91hQl3nJZFkqcZ35nWgaU7MgHE+bOn436ePaPQ6PmTdte9yZO2co97+7pukmeWGHFpFpWH8dkoz/jgFTEstOvcAQYn/I5UdJVpZWZ7JuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788665091; c=relaxed/simple;
	bh=1fwlpoYa4UFGXdUnKcp2wE8vjY2wYUKtdh18hDAe+uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aUu/p3RiGVwSZz1QWeYbNk7Ac4OHMg5wHaxaifEXgdBKHpmIaq7/+D0xLjXR5OJiHmAl2GizoHuRQ2i/kQ/0vlxWBknsqKYS8A+o2DcXgpJpV3jKr9l7gp95wrY7pr5Cv0jYe3Q897nHMy8r4qKajaRTym142yxTYkwvTUiSWlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1EGupvZFOBArOpim+aAH187XiaFL1YQ9pL8IohnpHO6LjN2r4/TtLF68ZX2wUzZQM04W0tukhl5Q+bBud7SBm6jIiNP4pZTUMVkLmkgjo7O83efIFD0GmEowdB9XMEwq2XwjWPRH6dY6HI1zCTe5GD4xx36faSJiKXGiVCVAihTe7WuU7zbT8xdbn5txupMm4ymdvVE8AoXn6qNYMxF0qpQUMrtXGx6H/OZL4beZobfTuzR4PWv9qmbr7qoraBOIjEd1Bq5KCExbUFNm01gTCLXcd411xLEDZczC9IxNXcFqiSoV83sEemlgSv3QVvuwfVI8v6FrOLZtcjvXmt6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32N7Fz6kmzTy1gOVv8YA2h5qBBDXR/FRC6RyLUuXg4I=;
 b=QK8h/Lxhh3DZuQCLpkRb99KOP/rhNw9sQZPYLVsurN3CArt8Q+kzy3nwO9dDVJNynuG4e4pWO895BFwAp5P9ci068iNA2NCDvaE3VF1cRrviFucEKsDctp91qa2Mb7p4vCf647T4/yjHDjJNczDyNina4GsIlw5oPhiBv3xBaCZrjyYD/9YeRNFHsmudD1hjnuqTYF7QmlAHDCddo+f+AcIXGINlrPvcvv7zLkeK2R5YZvDf/LnJBeNhpyImWANTaJ+qjwjzQ/jcTNdc87pbf11bOu5i2KSFxbh6LQhfCDxu2MbjcMGdobmyOHCgp1Vbw2cHE/WH//IwnMprFIxMIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0037.apcprd02.prod.outlook.com (2603:1096:4:1f6::13)
 by TYZPR06MB7074.apcprd06.prod.outlook.com (2603:1096:405:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 03:24:45 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:1f6:cafe::56) by SI1PR02CA0037.outlook.office365.com
 (2603:1096:4:1f6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 03:24:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 03:24:43 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AB8B1409210D;
	Sun,  6 Sep 2026 11:24:41 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	pawell@cadence.com,
	rogerq@kernel.org
Subject: [PATCH v4 1/4] dt-bindings: usb: Add CIX Sky1 USBSSP RCSU system controller
Date: Sun,  6 Sep 2026 11:24:37 +0800
Message-ID: <20260906032440.470788-2-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906032440.470788-1-hongliang.yang@cixtech.com>
References: <20260906032440.470788-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|TYZPR06MB7074:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 12980d64-a975-4efc-4c87-08df0bc66543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|1800799024|921020|6133799003|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8VnM1JZvUvfDGU7zsQcAKqgHVxLesL9ipL5x+3d3IMBHMqzQn/1VqrtqLQqstrYZahnlkl7bUVvXTOPFKrhhQKDz7EtSdjvAJBajBIdbapKaYYDhKPzM3WCWd0DCqzD3mrm3fUUS2S61PkPqz/M6McSilJfxvWxkky8TsmXCBolACEgZyuAwgBTG05+bck6BtcxemUKchYPGuj2MXxHIv4USTYUVrOUmbhmHRUXAL2Y30qumUU5KK/kvCT/nEy7E3bGClO256Gput6uvZWRE0CEBNgdU738R80I5XMqI1u7hLC0QMKNSRqB5jDU2dZwYIc1HuAiBPw5WTSADQ2eiasnxgRuBSyYh4dimDepYAVwUx2HVVEO9054QBzfx63nB8j60hZLJLWHdzYQsrVnlZIQwb2iUS8A+jNUGWe5DVplxgLAC/yVGnyEGVS2qid0mt+Yxd3ufDt8EFIXOqI8DhCqsRxVQkv1GXK6ghvE32vpzCGNcLMaZxmH+u1wrk8CvmUTnRMQqGtT2t7VJWaDft++NTvd2EanzYkgy/R5KpAaIWNuBb+FIjAY27mJHUZMTFYzJsv8URcgSw+Bj1eDNAu/Ko9YipC2d3xYH5/zAqaPVa3Me5O8I16Imk+iFi9YjaMWnuZx2Eg94aWKp/hApOURX7ML81HleO+5h5CqA/SF+4hifo/uQls3+vTHDf3bU
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(1800799024)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dIj9DBvAzzW+x8lRiG4es8YPvCwqqo0CoM9gfrevLX89MRo0bQNRiY7hY1gVV7PnXL7ssyoJW0vlnEdL66lemX8FWvwf/UqbA++H+LESigRI94NrnzSpQTVIK677vZ/HfVMNgJ1oNytJFcNG7RcL0wqdKGJM8xBhMEEDJZtgGnD5iJyPFNKzbV8+Q09WleGCnc6zk1g0/9A8DWPuW/ZhLvHvWbmkDpOiO9wMiXl5p+vP4WSX5NVf5PXuud1Dk5CAItP9coup/3aMif+Hvpn5XlH86hmnN/JYItgNU4ZBdsu3kgC7GUHjWzZ01UvA52AR1073RFY8hLrxUfthn05Aor2bMT6cjBla3a6NSf/g1D6urvWzp3V6m4Utf6NsCmfjsltOTizdicFqSUY8gUOWEiJ6p8kvnQPuqGu1OQzHxZna2zwY2GYFucz23iSNUbCS
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 03:24:43.8405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12980d64-a975-4efc-4c87-08df0bc66543
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7074

Add device tree binding for the per-controller RCSU register regions
of the CIX Sky1 USBSSP controllers. The regions are exposed as syscon
nodes; USBSSP glue nodes reference their per-controller registers
through the cix,usb-rcsu phandle with register offsets.

The per-controller RCSU control and status registers live in a shared
RCSU region described by the cix,sky1-usbss-rcsu binding and are
referenced through the cix,usb-rcsu phandle.
Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 .../bindings/usb/cix,sky1-usbss-rcsu.yaml     | 46 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbss-rcsu.yaml

diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbss-rcsu.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-usbss-rcsu.yaml
new file mode 100644
index 000000000000..d0c54fd2cd5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbss-rcsu.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/cix,sky1-usbss-rcsu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 USBSSP RCSU system controller
+
+maintainers:
+  - Hongliang Yang <hongliang.yang@cixtech.com>
+
+description:
+  The CIX Sky1 USBSSP controllers integrate their per-instance glue
+  registers (AXI bus attribute configuration and controller status)
+  inside a shared RCSU register region in the SoC system control
+  aperture. This binding describes that region as a syscon, so USBSSP
+  glue nodes can reference their register offsets through the
+  cix,usb-rcsu phandle (see cix,sky1-usbssp.yaml).
+
+properties:
+  compatible:
+    items:
+      - const: cix,sky1-usbss-rcsu
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        syscon@91c0300 {
+            compatible = "cix,sky1-usbss-rcsu", "syscon";
+            reg = <0x00 0x091c0300 0x00 0x200>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..1408b89607ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2775,6 +2775,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
 F:	Documentation/devicetree/bindings/arm/cix.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
+F:	Documentation/devicetree/bindings/usb/cix,sky1-usbss-rcsu.yaml
 F:	arch/arm64/boot/dts/cix/
 F:	drivers/mailbox/cix-mailbox.c
 K:	\bcix\b
-- 
2.54.0

