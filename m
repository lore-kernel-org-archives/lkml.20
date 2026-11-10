Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.98
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794287851;
	b=aU5AznybtA+horTFHx6wf8c3zCJxQ80EWAObViwhzFbqEJxT+tlX4CnRhuZdw61q4Cfj
	 DYHzYy0Hvo1Eaa830lwHBOPfG830YLxMsqLGX/LcQpWEAkvWe/iNTBrLi4eKT+aLav7kL
	 R8w3P6+fLBbH/JkKZr8XHA3twtfqSDPGeqtvnaGf+FU9K/EF8gY9eWV+Wt5IXEvO7ZHCW
	 o9LzFiMGlAhZBo40VH7neQB6DAtxvPpnDE+8cDJQ0eH7EvhlcMmSF3X6+kSFKYEke97H7
	 DvkSIHM83qWlu9YZsGH+y0qd3FU6oIZBqL4q5iduJIOJm1Hf875nc/okN+honvDz8pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287851;
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
	bh=BdIE8R/bzxSVd2WmbbN6K8nNATk8upKcAMkubt0TIMI=;
	b=QB4Q/H3z6w4Y5BZvtysl2/VAZ6G5vUIBuyDytJZ6CBahRPboY7gmmbRsXPbAsUfGHhpr
	 1e90edfqm+Y+T/hwE3x58l4OLcyQl+JzAfPc3upOyCYiqWbgbNr9m17LVcd/G6vk4meLh
	 qgJlgymGZbUtsZ8iZmfixM3PkJDoAqTZ+UMWqjTKBYWDAnTNecpF7DLe1VTIId/Q+gCKD
	 5RnC++rILX7eOnc24tbv5Inym4k/cA7a+TR28CzJ4qJd0nqP27EO6LgzABIdDF8cVLHuF
	 YgtOclO3Eqmj0BnPrL+s26/ffshI4f1otyK/ryzcAM9EeUZ6MlQ+hqQAEtRRgQnpgBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.98
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022098.outbound.protection.outlook.com [52.101.126.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D17B606A321;
	Tue, 10 Nov 2026 05:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D17B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVxekQt7XS9sQR/qUYTp/Q9pOjNe7hCaEfShlgMCHUVkDK4FkR89thRtILLG+26d4mS++rAYDylWwyl6X5h04dXtR3wJ4+WC5Qd1Qy3eXyg5TgNCNNpkKCgP6GlSjPwKRamP0NrNkcP9zJWrYHyxCERuicy2WX1mKFEtToxBUK1hIFz9+zxan7S2Aa48k3lu0/grQ1TjAKZmWZWPRmzdnJHWQTYO7A5CnQ/2oOFZRkq9ROq9XyLRDz3Q0RGXMSTr1NUb17VU/D1W3jUSdATtyZjvE20bmjCkEdXH/wZhMWG1i6G0dJoIMjCjVqlQ/SnFUEZr2Ucjpwndh6CsBmH47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdIE8R/bzxSVd2WmbbN6K8nNATk8upKcAMkubt0TIMI=;
 b=uYeW7jH3VsZVCC4YMJTviIzvx4KdRDtAoBb2SoQnk8542WC9mnFyX7S5K6rXoCPgrllkEaNA4hFMK5TM0JR/DnEdwRZVfgiY3AmmSLzpvpYRSwv5dIP7XSsTSuGG4K4JHm4E5FZQZBGm3ustFqtC7r7YF8anZb47pcU4Ica3tNQY1qW3pYSVCc2XSnMWASi1tOMobCdhicSoainc00MUrXlXqpPJMSef6JnCkUeoHxOjM4ZGTX048OXPHm4ugMn3aSaJlK83DyS7OycSEpeA+Cr91v+zwAJrRUlanxJiB1k1garwQEg04rF1ndICAtAhFgTQbk+bA4XIwiYtQdgkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0005.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::16)
 by SEZPR06MB7289.apcprd06.prod.outlook.com (2603:1096:101:24d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Tue, 10 Nov
 2026 05:17:25 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::9a) by PUVP216CA0005.outlook.office365.com
 (2603:1096:301:16f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 05:17:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 05:17:25 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id F20124102E74;
	Tue, 10 Nov 2026 13:17:23 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	gary.yang@cixtech.com
Subject: [PATCH v3 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C port controller
Date: Tue, 10 Nov 2026 13:17:22 +0800
Message-ID: <20261110051723.434009-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261110051723.434009-1-gary.yang@cixtech.com>
References: <20261110051723.434009-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|SEZPR06MB7289:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b942ee5e-2917-47e8-f437-08df3ee9e844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|261009223027099003|261028144727099003|261026121527099003|261021123027099003|261102123227099003|261022105027099003|261021121427099003|261026140227099003|261022075727099003|56012099006|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iGCP1uIjuaUhOrvGPqIHKbW7QA9aaZCCJ65BP56H+YhC1EVRa9nYXR1FB00UWgJuti/HWMgbUtZcdYEv/ghdwknT93HKQ/KpSS353WXgkaiW8QheRTkzdlwZF4BiUfb/B3z7S9lU5cXuO68O0F2cQQYXUJFVDL5yW/of2ICxw0X6JQTR9FEhOmy2PI1iV+mcIScHlnQHZrHDf4L+6CVATFsdhwdka3nMgStvOt8v5oI2oxp5IZSFdkzbhjPKy3hIjhGAtjyMVKQbqzJCWoi26suRcxh0U2sFmw7Cvv/jm8J/oU81EQNa/n/6Sk8Pm3sdK4DXTklOpLcfNbad6QESSOSiO3ByJl8/oCsItdNt6d3TWBAlB9wq+dfeJROpfG69QZdpoCOEwHDcrDEczxam4NdZ3rTT3l8X5FP2mrnM70LOFIlbhhZgv/eSOyQ8jTRpmcEhJJwaOM0efWQYkhc5hHadwnXClzE4DsT4FPRknX2uVS1Gro9bLAAvONSrJ2ZeXKxgkuLR+pUNVhcy9lxvUwctDUT7ocjy9w8jBnR84R6Wf9o4IMvf0oKiZrMwSWGc6xXg8tt6ob3C4FKP4kdwK9vSKhEUe1O7d89Svgkv9+TvcfMbKw4MqSC4xaSg/2muiUmzBotNeSsNdg/7CTm9kA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(261009223027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261102123227099003)(261022105027099003)(261021121427099003)(261026140227099003)(261022075727099003)(56012099006)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jYSpRs5/ocsNK0ZA5v+BWDVvgkljnw8+CYtACuZ75s3SJFzHE6GJwB31/qTplthvVU+yJoN54RtzXiSKzUnXY+d+Lxk99Tta/ZHUKMyDYPAvuBbaAqQcLZnVgEmouTMLksDwIXMJ84Y9/nzsOO/etshnI7gXfbHOo33vViwnkM8Ck2r9NJE4wIl7VD/HV9qV660rdTEV30VgbieJhWRPl+q1EeTAlLgMsTuVeiL+Th+PyO/pcbXs+H5tmWkzmTsxklWJDFtDx5t6mt14Pehu+1Mevy2Fgtg4UvokDm3WD3cH0oiulL8yHqToVnojj3bTpn6qxwgHpGEoqe7+rYL2+tuXnSwUyc7Ww805sm2L6Zmr3AiLoij56bSPc4/CG+kXUvRJ6mj4gEfwCTjfoqn8stnpo6HPFYQUGUyAfCgcy8ptFtVka5Q+qEVP3xXZoX//
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:17:25.2616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b942ee5e-2917-47e8-f437-08df3ee9e844
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7289

Document the Realtek RTS5453H stand-alone USB Type-C port controller.
The controller is connected over I2C and manages a single USB Type-C
connector, described with the generic USB connector binding.

The connector's OF graph links to the Type-C orientation switch and
mode mux provided by the platform PHY.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/usb/realtek,rts5453h.yaml        | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
new file mode 100644
index 000000000000..14bbd563e66a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
@@ -0,0 +1,112 @@
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
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        typec_hs_ep: endpoint {
+                            remote-endpoint = <&usb_hs_ep>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        typec_ss_ep: endpoint {
+                            remote-endpoint = <&usb_ss_ep>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+
+    usb {
+        usb-role-switch;
+
+        port {
+            usb_hs_ep: endpoint {
+                remote-endpoint = <&typec_hs_ep>;
+            };
+        };
+    };
+
+    usb-mux {
+        orientation-switch;
+        mode-switch;
+
+        port {
+            usb_ss_ep: endpoint {
+                remote-endpoint = <&typec_ss_ep>;
+            };
+        };
+    };
-- 
2.50.1

