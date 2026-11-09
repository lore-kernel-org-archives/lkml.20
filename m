Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.118
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794216247;
	b=rFCF6gL69kFsd9bW4j/ANac0lIDJyE+jne6kaHAnVC/tS49Xugy5I3mZsUr6s9Gg069R
	 7KZzOmptPn7O4uZ+mEfwNXo6JYUxL3SBp1ZVdkzvXn773iinmNsldUGzi4zyE4orGFJ4V
	 0TApieWpBS7Jakgf5XehVhyakGrMqijzVXG5fGqLigWPegDZ4uQBE7ESJv6SPn5BN2Wdv
	 s3qDb5sk65VwLGqepjjkWmycsT5cvZbYYV70ssDhl4jOMB2nk1+b5f/q15jR/RLtPwXWb
	 S3oSQqSKsvQb8V3zlqjUBwi3Fgu0kURSiu9vsb7WhLhs2oH+LknfG/71L6ZqWM6ePkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216247;
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
	b=DOMZtjwhZ5s8/piI+MsKzuF34igf2OzF08oDKXuhKWbgyI3bKTh2hyk7xYiXFUbziI7z
	 GlzsE2POLEoT/ETHX/v+nYeXxHrcZtAI8QyfBe6jwGpZGVZgYk3ubLkavBKSG556lxnyN
	 jDkpF4bCXc8zjYWrLC6SgBCLIK7FbFbKo4aGnZx9kS4LeNDkFYUpf6OqagAta994rt8ZA
	 2sbkbXa0zmmk8KIKLUzN5xBQsn3LW8ZdXZR+Cl233166Y+Gm6cZvyMxtmVfCHGhHwHrgm
	 tbYCFIfUJo5t7ZYDeTPfgk+Tt0cObBI/pGs4OP/9A+NvmSv/yL26t4l2qbYKWVV5e+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.118
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023118.outbound.protection.outlook.com [52.101.127.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ADD606D817;
	Mon,  9 Nov 2026 09:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02ADD606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGrfXzGJ6b66tCXkuM/jHEWEAeF/1rzR3jAxNe/LXfXdAy3yPfYjt+vnB8z7i9m4mliE7laIrHLRUOEevSC1jsZsdC9TEwZ2l+6McrEtR43J/NSZRTHf0zA17FRIJToC9np2g3eRRMksXVkXimgEDh6Wu5p7y+p+cVXjsdgntr71fR8+vvLTAcUaHvsFT7BcBuAJ9JDn+hbm+RetW3cySMktk+vaqySpigMT86hVYTIIaU8Ci7eFlcxBsJL9P7PIvlOcfBYvokEwR7gQugh0nFTZzGyZk8xhnjSitL5eLF9Zt2B8wgIDb6mu7Dt7fFo9JWf87tpd9Vn4i/nZDRRxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdIE8R/bzxSVd2WmbbN6K8nNATk8upKcAMkubt0TIMI=;
 b=dz3LJy7jhY9W4I9x1hhAj1/tFVHV4K8TaFsLHQtimMLw6kA9tPOaFL7TheoAo2acZgs1N+EulZH8+p2TNY2YJzweRW8HZT9z/KWexSXjFeZzf2MnzU+IKfLcQXtpA1IQA0OcFDLMWDFcgIroNsHQaepijoQIzDm1mRFIceIxsFT28JqHf3QRpPrNN0Wee+l8PP17bdnSUjEFxz6qiX13/wpI4+j63xDjGfMNYl9c9zm5OwOvKLZ4+vUHEbih0puqC6vbeCeu8Zmp13e58qzLA4748aO+XW2V8FL4KDw6Ji5119wnnyRiCsm9zCJqMCOaok6wIO6jBQYp+STTgYNhrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0023.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16e::12)
 by SEZPR06MB5414.apcprd06.prod.outlook.com (2603:1096:101:65::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Mon, 9 Nov 2026
 09:24:02 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:301:16e:cafe::a1) by PUVP216CA0023.outlook.office365.com
 (2603:1096:301:16e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 09:24:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 09:24:01 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6C52F40920EA;
	Mon,  9 Nov 2026 17:24:00 +0800 (CST)
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
Subject: [PATCH v2 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C port controller
Date: Mon,  9 Nov 2026 17:23:59 +0800
Message-ID: <20261109092400.202219-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261109092400.202219-1-gary.yang@cixtech.com>
References: <20261109092400.202219-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|SEZPR06MB5414:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bd785c99-bac2-4afb-4198-08df3e43314e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|261009223027099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|56012099006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TRWJKw4vF7CzrkcscblXrryEl7XDlrq4T8pDqlDqM2Ca4IO350nXRCwkfJaVUQArbmnmzt7Sp6ziVE3GTA3O3GRGOXwCdLjGudargvtkrhN3TuMlpXUtlmxCagV5hZN4Y8OeqDuQU8vbIVyJv8BLlOwbp2+O6RiXVJ7cY5sw4GN6lYwR9rbVspLgZ8bJrT5x9luRQkwuQs+RAWMLY29QWVxtdEl3uv+XH8bWrF9KoLTlSGMtwP5LcveOulpwLrG3f5NqbhJAY2I5lk3H/w06ZirqBcm13m8tF3aVdTnpwVqwQbRUWaGhBFRNmCXXx33MGys1+ZxbRN0EZbvcAXH6SWMR5DrprxqC3sjo1wEIf+mltauOVs4WBZOG8LJPFWXEflLT+FFLdKY1yo+xDEeMY2gyOVIfnS5UqYyQagY07iafvP4H1JIoDYEEof7WQ8kEFXIxM8bsgHw6vYpmoyF71JxHdHeDsWz7REN2+EOtdyXAflBkc9o6JxLhh7RmgG1j+lA3MRaeL6lECCYjHTm6+CojJbaHKSc6DykAXlj+5/0jWNC2yUAGqkoeRWo14yQhg0n6o7zLi2afUp0ktGvNkqTQLLdMuLq5WI87QUzvzdGIJuvAANEYycNpX1ySDs1eqR3emUR81XhHxIru1mcJ9w==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(261009223027099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P3dNWpgiFkebTKgQTVEMfM0eKb34uHvGhq2dVykoUTdX4J/fDA+XUXR7ZWA1TCF20EkSpKIKgCGWwoEnLhHHv1YZ3IIHfZsZ+UtD7eygBWssaWGqIZJO9gaKRI3cDddWo6eEyjI/npUVJebkJOqj+GDe1xTe8xZ0ORhty2iwUGZAURfSfZM+13e+pl0YenapZszKtNBWaPBzQ7TavOKrpzRJBTUC1bi63edf3i0AZUPkt370TCS8Eq+OOL8Qb10Dwavb8l0HZK602YQKLffNV8la3JA2hc+XB1uT9lBuDPiAbHgQj5laSEsrr/1kVQuLMGUYZFUgo69zPnB+AzCgH6gXV6Wd4J0vPpabtdp3B6z7VB7POxP/zq1HeoS6QA7Rc3suYWZHmviw4p3p9lcyEf5hYyUavd/BZobuXENG9xuzNS9IKHW3pWRDLf0GyU53
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 09:24:01.8278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd785c99-bac2-4afb-4198-08df3e43314e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5414

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

