Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023143.outbound.protection.outlook.com [52.101.127.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640870830;
	Wed,  2 Sep 2026 03:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319305; cv=fail; b=YdYO7bT+feJrSqSCytwQnkj+lJufEk3N4HyL/pcsUlN12W/Z9NwR9o4/kEYe03KePKPz+6TPqgG7nYDia+mxQ8XSKyICpY8l/ZII3rmNau6prhbe5KpzkFB9jpwbngTRaMpr+f8NTJIjMOmCy0HHneilRV1NdpBksJrsMiSbai4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319305; c=relaxed/simple;
	bh=hv+IrMUbkRdQmPk9mu0jDmITKr/DjC547ipVw+Lf8Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ol8N+Rl3ULgGjSWffc+yXpATW+fW/PYfkyzfap8MUqVGRkdl3eFO7E0S32JJm5aNoOLKqcUNixE8NIeKq4PwjM575lSU2neZMwqC/oo2zNSah/jS3CsjYKokoEku4KWpwVEvDCEjscNKgBnzcfiJGKD0cboL/g1DYlD9WMUsApc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyc0XBrQBrchcMNAZSt+eutHOM4vp9/XqeN5YNvkwXOar/waNTvd4KCrg6zzLWHtSPtxGHqZtWBIhbr+uLdzcUrXl8DN9R2enXmahL7LxNU7p/hg5BqHpl48/taqZPX+ljIDPdE2h5KP74wfB79IhLzLTi4bR0qBIZ8W8Tumu2Eq7ArZc192whL5U4MyFHUC/cDYJ6or+wqbx3poC7jAyQCTv71rfZ9fa3rdOVcU7GFUkxRYYwxnaFwtVlSD7j/yc0HL5kHvQ0V5KPZ80Sfq8dpBkefRLI41mSEH5ZDuP0XwU82Yt4HhL8+RImnvFor+hr3rMPB2WGQqklJ13w3BOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8WtX0k4EqwDh/TgPkcMz1aEkAtxppzLjZYw7yZxlbs=;
 b=IUSRcPN2PG9K0EEDfnyT5o0uQd9o7tsMGxhzeRKO2MSpbpBm74ufgY1875KY6qiM9VpsUyeL5BYb9xxfDIj10aefeH5k0W9edkknI0Ku+jB2hIwkLQ7le6RByXnf0y+JAvMGEHi6MPEceHvMNt7uQizqE8u6AslxLdlPD40oeFxRwJFYOOZXNWFXd2fXMUn4loszpsw9YdwsnSJRqNyOdMgYXoD3Er6RDJps2Xv08U6uiqMFUYuGDTaZSy1xgcoUW5DwAMISPHcFh3Vo21AVpBlwo/HdjN2+LD8Dz7stEPvUKqphZwR1Kxa3jiTt86GuZcYG9/gc62/arMwIu5devw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0006.apcprd03.prod.outlook.com (2603:1096:300:5b::18)
 by JH0PR06MB6740.apcprd06.prod.outlook.com (2603:1096:990:37::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 03:21:38 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::95) by PS2PR03CA0006.outlook.office365.com
 (2603:1096:300:5b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 03:21:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 03:21:37 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8C47E4092106;
	Wed,  2 Sep 2026 11:21:35 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	pawell@cadence.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: gregkh@linuxfoundation.org,
	rogerq@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	fugang.duan@cixtech.com,
	cix-kernel-upstream@cixtech.com,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: [PATCH v2 1/5] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Date: Wed,  2 Sep 2026 11:21:30 +0800
Message-ID: <20260902032134.1182634-2-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|JH0PR06MB6740:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ac051b3f-0dc2-40db-a7df-08df08a14c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|23010399003|82310400026|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Fe09M9LcpZEQUHsd1489xfEB0TndOQAeUSWJn9BQyU1RBFYnnPwR0UYCyu2sq28Cl8ymKrIXe9ZJzCso0Asd3T/60f0IpztNkA2wh7QNMSNTQyCgUEwmxlnvRaELxNI4LIBiKiO3ow01ID0VoLZB84BgUSV6GzYbMuNYgciT++E/qmX6npZKZ5zvOWw7+ZdVFP4bp6Z2AP28ctpwyl+1Ay8cQI7Ix4UZtp2ITx1UD2CGKmiPzcFMEniHPbTALB1ZYxpqS8XKGgxWqNnNYhKRWRChQbS1BSWCVfSEILUZ2Rq9qt+W12w1edeW/4gVkc+/8elrfRyBG+f+07YqANKOC4LMTOBEJ44tGdHhn+SxgyHXlw/twOk0W3xj5c1ws5LvXCRYWc3oldhGuTW/g/jYJHm7y+B31zRvPHmsan1nn/2cfxli/Fcv7SGdvyHLoq6cnWpTxU/Dj4JHEkfDNogds4FuwWJEULWM94Qi6exBCwEhQS+4fd5dBDeueck226Vdx5ATgyImXXubR88wVHNEJTxUe2/wz0rvWXl/dsnY6PTQ37a6U9UeLQ+i2cbWJRNWyjni6aVGU1ieggbbY25DkSW3p63UaXnTG+0lypvDqKmHhQy9R8bzfqIMP6LDFG1RouwXSNMGKaAjFpjp+bJajQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(23010399003)(82310400026)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fkvGPCXzH2wZ6lMAeyi/0/GJYjDHHlvD46SoAfcWJHIWlOnvzeaOxdL3QsXDBiwCSgg0pUJLUtXnZo8biI8Xnq6SQflYzL7qzB4kteBlipq+s+1OJ6jch80pM8qJaTwE7jvfMmK2regw2X0KkNuPItHrxZQYAvmcjIyeH3+rgfMSURZu6kNEFnUaJN7M77pY+eUUbjHjKyo03ynJNf9nQRXjr7UMMfu2f9EsS9wxfIQ05Vwr0gVOBqJLI+UM4iMWpjVTbUCwL3+2qUSlUruCnk8JTKbCQLmBYisWESVXdeVho7cOfhdE5OKb83b0/yXItTBVXswiNb39IxGgILxLp/GzvGUsyiVf3irA5D629zdzj5P2Swi/POtNl8SCyO0g2oyB4I+Q6bUTr9z0/ZWWYToM1hIgx9RpKx9/TMSzLp3/xDHX/HLCjfvPOcbNCb+F
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 03:21:37.1229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac051b3f-0dc2-40db-a7df-08df08a14c54
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6740

Add device tree binding for the CIX Sky1 USB3 PHY, a multi-port
SuperSpeedPlus PHY supporting up to two USB3 lanes.

Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
---
 .../bindings/phy/cix,sky1-usb3-phy.yaml       | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
new file mode 100644
index 000000000000..5b025a48c844
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cix,sky1-usb3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 USB3 PHY
+
+maintainers:
+  - Hongliang Yang <hongliang.yang@cixtech.com>
+
+description:
+  The CIX Sky1 USB3 PHY is a multi-port SuperSpeedPlus PHY that
+  supports up to two USB3 lanes. Each port is represented as a
+  child node of the PHY controller.
+
+properties:
+  compatible:
+    const: cix,sky1-usb3-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB register interface clock
+      - description: PHY reference clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: ref
+
+  resets:
+    items:
+      - description: PHY reset
+      - description: PHY APB preset
+
+  reset-names:
+    items:
+      - const: core
+      - const: apb
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^usb-port@[0-9a-f]+$":
+    type: object
+    description:
+      A single USB3 PHY port/lane.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      "#phy-cells":
+        const: 0
+
+    required:
+      - reg
+      - "#phy-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    usb-phy@9210000 {
+        compatible = "cix,sky1-usb3-phy";
+        reg = <0x9210000 0x40000>;
+        #address-cells = <1>;
+        clocks = <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
+                 <&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
+        clock-names = "apb", "ref";
+        resets = <&s5_syscon SKY1_USBPHY_SS_RST_N>,
+                 <&s5_syscon SKY1_USBPHY_SS_PST_N>;
+        reset-names = "core", "apb";
+        #size-cells = <0>;
+
+        usb-port@0 {
+            reg = <0>;
+            #phy-cells = <0>;
+        };
+
+        usb-port@1 {
+            reg = <1>;
+            #phy-cells = <0>;
+        };
+    };
-- 
2.54.0

