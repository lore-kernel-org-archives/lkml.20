Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023090.outbound.protection.outlook.com [40.107.44.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B66430C345;
	Sun,  6 Sep 2026 03:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788665081; cv=fail; b=rpqtkmY0rH+nt/xmPm4ase2ivbxUQGf4OePQgN0aCkhAGSaXO72g0wmuGVh1fejxwqm/eQ7UOYTfGBm2Mflf2WW9uPMkDuMpznCTQX4RL0ZSH/N8hgvX5f7GFl9Et9sUEme+C3txazsb7GOotZtjYu1mQrp6aqQ/fxdM028Ectg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788665081; c=relaxed/simple;
	bh=hv+IrMUbkRdQmPk9mu0jDmITKr/DjC547ipVw+Lf8Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sitHNWRUv03czEUMJd5cYt+NGlNCW/GGDS4GK4iDO954KoD6UIxOu0txAkdWvdklODFBYv0smT0p6uJWDJlVVwF3Gll/kxxaGVa7TBzu5+QKr0/DMfEgZpML4yQqcBiRvlYTwWfOnFpbFqktmIcsKPgqgjJ/X++vFnP7MjcitXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBRHgoTddTqI4oY4If3ITxexx6efEB32KEtREQg5DC6xE39jKlNybhjWX9fHb33i2XOSzqrZChul75tdXr7tlJ26qzuTlGJMWiG7uDow9Xyb14uLdEee1eFhgWRMj09X7pBNkVg8GtdEC+u23E+GsE7M/MlRaWE0UiQMIfqNaDh3RLqh+iqsuOcHR9B+KEDXvaGqRkkYbvPPY8hVsiOnUb4pKaao2lH/RnKcCzDJJyn6aWYR4AEPtdQecoF5oVvKaFRanFlRQDyZuJZq0EbYr2WnNN+BJRVZ9DRbeRaup+JCaNBxbAoRYn8m3haAJ6fqIBCE/cOOAJIM4FQYs4AEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8WtX0k4EqwDh/TgPkcMz1aEkAtxppzLjZYw7yZxlbs=;
 b=UAurRuUhPiyOA2INqEPvnEr7zM+k9Q4N38CfOp7TkIKMLeodh8qo4N6YBIddi/oVI13WmnC2gYCtpTFjK4ewgX7Qk/xm/o46B3zLUiLKB7s+4ATPNF8kRim2/gI9EISl6uWZ5GtAHVgNe9XhQOZU5wFjY1SPZXD05RYToNOsv46lz8aFkQFJxZ/2jou5aTuyMM9uKbSDOJiMmUhfg10b22fHyRla7g4vQ8WRp5P11JCiHgchL7gxWTCViFJ75YHTqzVJoM7Kg6Q7t/YJba9bNtDyupu9HYw6JAesHqisDVi0c3y1UvuVzttTeCTDPSXJK+rkJVEngvjBLziUkhYMDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0032.apcprd02.prod.outlook.com (2603:1096:4:1f6::12)
 by TYZPR06MB7255.apcprd06.prod.outlook.com (2603:1096:405:b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 03:24:34 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:1f6:cafe::75) by SI1PR02CA0032.outlook.office365.com
 (2603:1096:4:1f6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 03:24:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 03:24:33 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 780EB409210D;
	Sun,  6 Sep 2026 11:24:32 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	krzk@kernel.org
Subject: [PATCH v4 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Date: Sun,  6 Sep 2026 11:24:29 +0800
Message-ID: <20260906032431.470744-2-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906032431.470744-1-hongliang.yang@cixtech.com>
References: <20260906032431.470744-1-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|TYZPR06MB7255:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bb820fb4-f32f-48f1-2083-08df0bc65f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|36860700016|1800799024|82310400026|376014|10067099003|3023799007|22082099003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	kMR+HorKy+ckNCTCQ2uB6XT5uDoDyn9u2ihs0HFY0Mkp5XoMhOvWb04Ih7CAh6M7TAmkcpAmhX9yeomyXpbqeetJfVB9V/MNJv4ZEEx+bjaHCbgPJcg0ucjAg3wpOo5HDh4a6MtuuOe3nutXPOWTPf8gNFkSJfJuYScqNpLz3fMm8IHfh2GVYfdwgEnll8BBD91b6ij1p1PLeZzO0DTf6O9mwciGd5sfhtFM/IX4wZ9/c2mQL4ZN4vZYuVaLtyAGLEqjs0v9RFVoK6pmzm6FIW4WFYa9J+A0BpF1KgZY/mfECrqk1sJZ7XXpWfLNr9t1sfIC9OpnMWfopjWziJQXlAooATqWpOljzyYJ+xF8nrFFzY/gKPXMa+WdnJO0Cpp/1aMpujJ5NEAgOm/0aCOY86cuLfmA3SE2X3+hy609Zw9DO7hwe3qSyO7xcViThj/mnv8IO/wuSCC5FRW+kYjViWgcs79OgEs24Ch+vWpKNIkJuuIgnEp/PlI1oylKI+NvC/xnAiorPCNjOVl39IEha8XBvF6s+BidouGk+mhG3gLOwjcprR4q+tITJjXoCANkboNsoiBPcpRgSxA5ZQPoo5i7DHxKUmqVnLygSx5rGgWN003s3FsUU/fT2iZDsT0cOa8AT2v52VhF9EIZRmc9VPcnKTMhNLYO/NPIqnwTRRke5IM+s3ntrL4Uug3WPiV6
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(36860700016)(1800799024)(82310400026)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uZIKA7/liVLaU/NqgMZai0htk5J6F8RTOIE1S3ftLmTgTEO0x6tTUVUsQOXDCqsZVzHB4PRG2GXOOImEOaA2VMHmMheRWhkTH8De54LieztwfZ4sAVJ1pdE2pAfzoob4CNmUnUy1zstVT4RaUohJESLBbyXUNg/3cjhXrzwvRnkdfBgA/JZX5oQFKmSxFn0kzX+EisFMWKbKImuT7U1QJz2J0VHzQ/g8nA3MO4g8tjmX2BO3R+pWams2KV5MUqq+KM/xdb+2z+bQVp8SFWolkGPGkSKqnVENSJiM8FW7GE3XXECk9ONKof5BFH7DKaVIYiRRbpN85ZWLQVgKGSL6lG4Qx6IH9R/eTbTsAinDHloLLCMRpqllVg9pL7+0Twsjyacp0T6/lxx7v9xwnXDendq5O/x/c6VW6ytYTxhY/lE+g6ow2ZIJwjaNDHnt6qm4
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 03:24:33.5089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb820fb4-f32f-48f1-2083-08df0bc65f1b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7255

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

