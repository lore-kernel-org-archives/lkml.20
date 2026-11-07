Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.106
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794013820;
	b=nbRPnO+TGsGOqBuFuldaANAQkDpBZzGOgmR9MMm0v2rrAy8b2PM23vdqWAEJp80UL+9Y
	 +HTHcEama+eJFF9G7PQ7p07jdSKK5+3qekenMzgo1QxrJmHFf1o42lX+uHF7dlUOGdN5a
	 SIyoCqJSNq7pM/NvdWVyYzaRgGuSpNuC7Zvul/Jy50HjZq6JpD+oymx/uC3cbnrdm/iyx
	 ZQBdSy/i/hKMA13V+JjnWu7RVgojOEyM+evnvvmPNe8vBdBRCxC33rFXM7cPK9diDja4h
	 YGq+YLI4l88EaNnmn2j8sScNhMc+zYGd2ve5yJHEkZ+bDTIzwcd7ItyK32LAT3PLLwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013820;
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
	bh=ZjO/okU8O8RF3Kc0K7cy6eiLiDM3tFU1bfA8k77w5tk=;
	b=ltY6+QQpmYYguH6nuG1jPcBtHgOT2ReOGbHWCfsPz49CIe5C/ntp3939igjCFJASAUnm
	 MU2DEfWyezOkOMA7JHaSKVYi52QgOoD6B/OYm5ipGkUJ8CeFBI8YuWjFVNNBmaWKDuIpd
	 Wqy090wEwzsL7GVYOu/nmTnQOl3sSBNgCiEKk2mL6Rfdv1dJLC9mZN8UGvqk2BA+Ha1Wt
	 HXZx+g+gARyE2Wslf4B9VaMmjFxDYZNwCJdDjC2nVoSh4thsHZraUmr7OpwOUzHs4Z5cd
	 L/rYwe/cSNgCKtCXaPDW9xdE9l/NDvrU9qapQGSerCJmhh3GcKn1U9SqtEIMlKWd2aA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.106
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023106.outbound.protection.outlook.com [52.101.127.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883BA606A32C;
	Sat,  7 Nov 2026 01:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 883BA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUpR5L8zA71fPVje9DZXg3t8ifRV2mDKA+PCHkA+QBCx+g7ncew8hG9w7QZC4C1QONldxYr2mNNCXvr32kWgb3ZI4GslTfFf/K4j0mISCuSWiVJ/+w9BtkHIQ0BfvqNVy8ayut6Q+jB5iqn/KITegVfs1eIszC5kiXVpH7NK9uk28SdfRCBMOwXjhONBCKHgYG+/0V/jo5L5mpr9xbYXq3JuKUWxnGf+JzfLa/U4B+JqTY6Q1tLDhTgOLin3ad5cKsU+8wEHcHLhOvHeGxy+ZOPign/fDh85IHaEma3sLPc+oI0FIUM+4VZclPHm9B9fshPwQTEjJXLmWR/78yNhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjO/okU8O8RF3Kc0K7cy6eiLiDM3tFU1bfA8k77w5tk=;
 b=rrBOOn645ahywF6YgJaq2N+gVqEfAYxesh8Fty9xS7QxUVGtEBizCX+D/VB1CgaCBEIfRHvDq+kfLkf2Q08Y9hVaWamib+w0TqW0H+w4Qxk4ts0mVzHh2CPyUyrrUiptJSvIjcC2fZ7xHsE5+IlSWU+dPeM++oaMi0C5sNEGWi4h6pm6s5BssISPPHlJION4v9617adr5F9b0fujwVlnapf9tUz6+2r3X9GzqxTgeIvqvWI2rpIoAR5zd4e0Fy1F+E2ZuJmPa1Gzqrp+HA8HYd3GFjwzsONrYvSm02Ap+0HwFndFTZolz+OFimrv9jnTCo7PwqnWZtcsXavanERfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0051.apcprd02.prod.outlook.com (2603:1096:300:5a::15)
 by TY0PR06MB5778.apcprd06.prod.outlook.com (2603:1096:400:27d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Sat, 7 Nov 2026
 01:10:14 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::6c) by PS2PR02CA0051.outlook.office365.com
 (2603:1096:300:5a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 01:10:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 01:10:13 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 00C314102E69;
	Sat,  7 Nov 2026 09:10:13 +0800 (CST)
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
Subject: [PATCH 1/4] dt-bindings: usb: add Realtek RTS5453H Type-C port controller
Date: Sat,  7 Nov 2026 09:10:09 +0800
Message-ID: <20261107011012.3655873-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261107011012.3655873-1-gary.yang@cixtech.com>
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|TY0PR06MB5778:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 465b6720-4b57-41d7-9e22-08df3c6be0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|18002099003|22082099003|261022105027099003|56012099006|261026121527099003|261022075727099003|3023799007|261026140227099003|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	jaQtdCF8W7tUK4wAw3M607zBASVx7EJF52IxZSoNU+X6A8/Wwiyke6NCvoT6Uw3FGjDOw11kiTrtOs6lu9QFP4pPML9dt8kRKokbq56X5utMHWwCgaBib5EdFs0/2DHLKoG4wAnI4VI9qOGgMRps89mkF1nWjJuqBSRN1mLhDr6cMRxw2apiaoXMwLVCtG8OcRksth//ESezr1tjEpvdlHMd+srnfsyqR+Qq9qYKEoe/rpmCBh/MHnOTi2I9C9c4o0d5tuomFWXYvd3MyXqaOoEhFmun5xUKELPOxqACs6PU/BSUkFYaPdVA00oIbkmJ9Qela1RAs/YZTalpeG8ni6bcW0EZM7WUwSKaJdDEFkphLId/2zCQAENM/ReH9Z3GsyUZGDUAbHbKrmLQZ6UIVDfz9N+/OOrwXreZxTSf+oOJpHXexBTLazhcr40buxdCQGWYoK5Spso8r4LnGKnY5q6a0bboTrAZ0t+1rYisW9sYJEWCvyTjhe2oX73XWoECqTizA9p2RFVWNiSeAsp+v8lWTDY3CKf5TpWR+av32PKDfkS5F9B67TFWoSiWZkkIzpbZR+CgUBRgVnOMiEkCTl3GS2xU9AVNFHhqOOeUHLbOOefJiXHwgIdpstqHK/oz6XKz8JMc6LgWC4OStOnIlg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(261022105027099003)(56012099006)(261026121527099003)(261022075727099003)(3023799007)(261026140227099003)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kf56y/Dt6qMD7qWgl2Ikw1dV65D3diu7wvJ2i0Dt3dKXBf4fYYY+IqqqylSJBzz6V+H9UpyLs0erAcmdOOMR2LEtH58J/wVN2Ugb+DSUE9wHC8LBcyYZNnL2w8zhi7biqIi9kfyoNu0aMd1hxkX21ech7tEPS4b3GA9XErPCeUBeN0HFnDRWHbE8AXiL7fJEJ0AMnosKeWpPDOA3Bci0PvOH9LyrIgRh5K8C0/CKTLcwMlEZ+BkOaxXCmNL33EK5qsuCY9RD8GW5e6kOHb0TicusY7NJJsgXipy2WW7yk5ORmc/3GHNZlzl4q/zzfx3FihM5gCwTALQO5Xz/xZxdWp2tMbnSVvZv+xX5ilILCyFPlP96u1KY5PrnDu9aoI9pKdUeF8FPzNyV7eANDdlhdOsuZvVKU2u5e9KsAK5RvzP0CleJRfqfPl5zPCcykNG4
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 01:10:13.9838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 465b6720-4b57-41d7-9e22-08df3c6be0ea
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5778

Document the Realtek RTS5453H stand-alone USB Type-C port controller.
The controller is connected over I2C and manages a single USB Type-C
connector, described with the generic USB connector binding.

The connector's OF graph links to the Type-C orientation switch and
mode mux provided by the platform PHY.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/usb/realtek,rts5453h.yaml        | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
new file mode 100644
index 000000000000..535aa2379427
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
@@ -0,0 +1,126 @@
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
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+patternProperties:
+  '^connector@[0-9a-f]+$':
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+    description:
+      The USB Type-C connector managed by this controller.
+
+    required:
+      - reg
+      - data-role
+      - power-role
+      - try-power-role
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - interrupts
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
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                data-role = "host";
+                power-role = "source";
+                try-power-role = "source";
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

