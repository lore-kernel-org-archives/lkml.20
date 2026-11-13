Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794579096;
	b=qP5dD0wgQ8BgY9sCdBjNmhtOtZUQdz4Zg5kKw1kEempMZm3FFw+0NT+8alJMVAOLfvRH
	 5CHNYH0ljmU+NAyYncIHaxQCWjMOKmu8eTHLgApuK74+Of7fFxtoFyEyV0uw6hlTH2G6w
	 1h97DBafieLxkYwCqzIOMj/C6n4LgfQJEoRm7u1FhXPNeB+92q8rHbgq83tNUX1erFBQX
	 I/Glbq2yGX/sKpcpTz6WAUSYi+3q3Cz+2SM38Sxlfh/syZyWWvD2vMC0prW3aYMcPfyVq
	 //kXq3PJzBXjgHVrHV8QKZF4L6zpmTh2OyFy2wpbJkJghb3aF5hefF2H3LGuSNs9SVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579096;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=OJtiS2Y7Zca56k9Mb8O3qoVaxD1T8c/BENEUZP0RDIw=;
	b=iK4zFNlHDUUMXVbz63Be1WijUcUN5+Sm/qquCGtcoZDykIhKEEHddGOQ0CDIHwNr9+dG
	 Tgp7/uXHnT4JBqCdsfpOOA19QUjcGcqfHDPQVMIH8PLQ4SV2lBkPi8XiFchv4YKENbwIo
	 KL+1WT4cSZ7RiE4VOQtKJbnpg1zy0G2wpSyM90Z4kyeqOjmkGL8uC97+d31YFlPtH5VFg
	 orhPqgTNUQffWnZv8YtF5Zkb1kcfppVophz8OJsVIuhRNA0vnXYYLUGL16abmqxl2BBnO
	 Mg8FsBZ9j/JIGTdLFwbYe2eaDdCyU0FoDCz9TOV4bX4Zf7zv3qa3uQAdKZA7+xJ7vkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.139
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022139.outbound.protection.outlook.com [40.107.75.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEFB606A33E;
	Fri, 13 Nov 2026 14:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BEFB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWxYJZ81nm4jzR3Hiy/h+pXK/3Jhfy1TokKDMWZxZarTNUfm75NXHiPeXhuezO+qqOUPaq8N7srSo/ZwRf2USQJBAw/26+NrP9RFTZKi64Izrt3edX0GkHUGNg35EDHh87KgnyWbGx7F6rmAEYTMEHUSvwlAZiSTIklQS4kP8h+g6wveKrN0N/X/X46vsT8Wih5rBCqmytT0Uv8Owtuez22wWaWvQBv2mCK0RO+N4xkWZKAXWvGr7yUmxFVLxy4O2ip6jyBcsVwkTrkZZISOcK2o940oSwLDMLT+UDfRdEvJs+ozPxLWVnr56KHIIKTknlARteFuVXoTtW1lELDHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJtiS2Y7Zca56k9Mb8O3qoVaxD1T8c/BENEUZP0RDIw=;
 b=hzE43GUeia64vuBBXcxVZVp4AFSQcopvHqU4CB46PlnT+871iH/2n7YlIzBUix/7RWNma8rNSdskP98GaF8isOrZvd6lo3mFRcBk+paAQn1GqWbsyw8XpOEXsicwiC+2d5saJiDGFI2Fp8v8kegj8la/fs00w1WGhOZf9cGV+sCiCKO2ne7KuKrZ4IulrnKyA/XR2MxeINPCCNId4d0bLupTYhIFILCqxhqlJKSka1NPUVYuqshpGe6nzFdkd/rBvjk4GXJCwjxfBburRhKrbJC5JBuCNKr2Xup9ZB0uu4rY0LsPCMMyswaK1TLyiql5FRlo5s3RO920Wg3r07qthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0033.apcprd02.prod.outlook.com (2603:1096:4:1f6::14)
 by SEYPR06MB8310.apcprd06.prod.outlook.com (2603:1096:101:300::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Fri, 13 Nov
 2026 14:11:32 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:1f6:cafe::b) by SI1PR02CA0033.outlook.office365.com
 (2603:1096:4:1f6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Fri,
 13 Nov 2026 14:11:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 14:11:30 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 627F25077DEF;
	Fri, 13 Nov 2026 20:53:04 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C port controller
Date: Fri, 13 Nov 2026 20:53:03 +0800
Message-ID: <20261113125304.1693911-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261113125304.1693911-1-gary.yang@cixtech.com>
References: <20261113125304.1693911-1-gary.yang@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|SEYPR06MB8310:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4084ec58-1ad5-4538-5f26-08df41900412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|10067099003|56012099006|261021121427099003|261026140227099003|261022075727099003|261021123027099003|261028144727099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	y8IR6E8xKk+zyB8QA4u29/1AGeOSwMA+la6TvMFlsnKXlqRaKqakvKjICTrHqY+EknUI/GeagdaBTPagtjjJ8ehMTKl90tQ7v88xjS6QQfehuViyJpvQg0MYdvbpC39Txt8C0lXhMWJfSoX2kvpy9nGHe1yq/4EF+mQgD5baPJijoKkkl2kRRr7UezslwU22zrxSdw/vsUMet3MggR3sF9IKooF6N/iIElhbEn1JVO5R7NzoBnzmNcLV2M3wrNDjO3HM21uOe1QXw7br4cdo1M9FOKO0xSas45euHkUBqGzcaHtnH6N0+6HpRfSRxgSNOkQxDUlWz8qXZuup3KWvCzYejG+R6Wk3OhWWKzQXPMMTQC97AWz5LbYfSC8Couu0DOPgpdCHJNDjF3jZ596FaUEJL5mwr3j3NjHQ9/QGHC7KHAfWm9Bm6VoqDO7c+runWgUW9tv4tZsxO4PwSwouVMSzljluBfRLoLx8NKwsDS6ICT6t3LoDgC3YIs5YAeuK4NatggGaxJVJJH/fyuishtGYqoKLuodCJmEK2IWvONsRgdmg3Wkfi314WvZ2bMlo366skfBsSod4tm+lEyO4xT02tBKSgT4zK6McnpFpTyTBGE4TDxauzrk8K1gG8w15kqIwsL+gQkatpXugjuwRQg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(261021121427099003)(261026140227099003)(261022075727099003)(261021123027099003)(261028144727099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xPqRuC5dgX5Ktx58I321i1R9U2vjM6iRgodf2F1udbNAyMOV4EwDn7tPMD08wJIwjQszdiKVtCtHx9aTFKdcP/5Wr7SwAWsfIAcOupDsCUfL68HzDdH5mErrc9uDCkKBb7rT8OE6lxuMD4gN2W2FVhqTe0SLVBiE/Aj3drw2axMkPIRGihzPCnIfLDIpkpp0fJvZVEKU5yP+Kxz2JAKdWA5jmZwdJpEovlIHC+wyYKTcJPGmegJr26zwyWh7rv4iAcJvzanrvjm8dg/YB9O9pTN3bzt9ya66wzZ6vtL1lFVQ9JKD77O8FnzQ1ONg9c0GyycIeyKrrx3HkeRoAOx+IRXCGU0FkypXAmhg95sbSU5WPBlDnIaBeCEXGsa2qaMClNVk3pC7KsiRdsfNR0YezwDEBiIorOdcei+/T0NFubr0H3rVOldHWmB7NuR6Q5lr
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 14:11:30.2723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4084ec58-1ad5-4538-5f26-08df41900412
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8310

Document the Realtek RTS5453H stand-alone USB Type-C port controller.
The controller is connected over I2C and manages a single USB Type-C
connector, described with the generic USB connector binding.

The connector's OF graph links to the Type-C orientation switch and
mode mux provided by the platform PHY.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/usb/realtek,rts5453h.yaml        | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
new file mode 100644
index 000000000000..f7c062ba1114
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/realtek,rts5453h.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTS5453H USB Type-C port controller
+
+description: |
+  The RTS5453H is a stand-alone USB Type-C port controller with USB
+  Power Delivery support. It is controlled over I2C and reports
+  changes of the port state through an interrupt line.
+
+  Orientation switching and USB/DisplayPort lane muxing are performed by
+  the platform PHY. The controller finds the Type-C switch and mux
+  through the OF graph of its connector node.
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+properties:
+  compatible:
+    const: realtek,rts5453h
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+    description:
+      The USB Type-C connector managed by this controller.
+
+    required:
+      - data-role
+      - power-role
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - connector
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@30 {
+            compatible = "realtek,rts5453h";
+            reg = <0x30>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+
+            connector {
+                compatible = "usb-c-connector";
+                data-role = "host";
+                power-role = "source";
+            };
+        };
+    };
