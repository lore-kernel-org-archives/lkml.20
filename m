Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.119
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794816964;
	b=0MEflbUhu+SUljmYBXpHKfzFZkieY2PKT78faWOVpm48kuCbFqwtlZOBOW38ZuYijiVD
	 kmGNlRA3fHG+FXeY91myalzndj33DH/IOl8UoZ1eamTe0PAKWvqvwSC3C1SFKPCxmpRMH
	 9cqPpKTFs2nAv5/VLbJT4dHa7I8vx4oNndznEidjWey+bLZCyTXv9Kbu9pMQv8WXIDlqJ
	 /cgx8MEjH/tvnbBygLrDYsxVbXaxlVS/WWHmowQKHa/0UCz8Nyvav+56vUM7fJ9dD+Sut
	 EHDDhLhlPvzgquewLOU2knKMk1dqgPj55JIkEYSKFEO5IC1vOhaKoiLymDcmb1aAlYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816964;
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
	bh=N9Qm3A8bGct91pQAFjQaueMRvbZDmcOUYFYbVjAVjAM=;
	b=rGpRTMjgNPJ3YUx79+eu9g4g3cMVI8G7JqGCBg8qdnAESo61PuUUiumuXlx5ARBpBkf8
	 HmjGuf21iHoJPAtY5cLZxtW29IzHM1Awfb7gayRCNoV8Z11tzs/AyK90XGMaukU37WdoP
	 uSC99lqqG/7TjnZtpn4MBjHbKxwcHMIgybfjGsUXprBylXTUeUUaKLGQWYa1eulHbopQ2
	 gswWwddb2cEdPh87TNcrhg4KrUeEEk6JzX14fArJ9yVtg8m22V/Ua26huHJNGdLqhkK/V
	 P80uHQ6yXsjS5httIo2pxmu/74M6WS3XyDfOvRmxoZWINZYmflEmc2YG8ddQY+uNonw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.119
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023119.outbound.protection.outlook.com [40.107.44.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C26606A335;
	Mon, 16 Nov 2026 08:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C26606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayji+CU6LX5LJqPUoOtCRhQtSVA/2O0+3kg8agHEcDV7z0CBZA7eUBZOfNLQcz5WWAfDHghQqbvxKqOsKCoinFq2GTohYyRXys9bnZc/+qg8oyKiJWDuEvvtQvHEYJH6uwyw7ZdgjXb0l/wNDA4qbZhE5z0qEbsnUgfhRvGca1XdJbbZTqsxmkIm5CVWG5EuxGKRkFf7JnkTnFyFi1cs4jEk5UiMl8Pz6Xw/IAS9dEJI28dBpmb4WSvl/8stFBdaQ/T6n7A6xAgpeoxa1i7Oxix0ksjC4pjErjgTn6qzy2NqmtMULXAVOjf5Iz7eomsUudbZX3Lgp2uCrW9Odok/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9Qm3A8bGct91pQAFjQaueMRvbZDmcOUYFYbVjAVjAM=;
 b=tAQQma7u+TRdJiSAbZSqUQ5+trWFPjf8UjEIHCF/Ptq1XlZUx1qJwX0Opq1LCDeYbv3tzxBryioRVHa6fEX3V662RtKRd0sMyu35Rv8hR2Dcl9RsceGPOEI7IlcJoQafds0ISUNAUbGOpufjJJ2P5md5oocMZeiUiKo0ZG6u2lLjzVxtSoqSJ6CRq0waSReMBgf35W14RKmnk2N6wZZbz6MKlrVFdJtXAuNguB+Wn2Lwi+RjoROFfC6YgpDr6l8DNflMAymjpjEtXVx7LvwGPPtvtYsmLTBkPw3EwZsTam/VRttbROPoYIPm4YoD10ZJSbaDv40Ts5I9bUL6TLFflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3P301CA0019.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:21f::13)
 by SEYPR06MB6251.apcprd06.prod.outlook.com (2603:1096:101:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.6; Mon, 16 Nov
 2026 08:15:57 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:604:21f:cafe::a5) by OS3P301CA0019.outlook.office365.com
 (2603:1096:604:21f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 08:15:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 08:15:56 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8A0EC40920E7;
	Mon, 16 Nov 2026 16:15:55 +0800 (CST)
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
	gary.yang@cixtech.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C port controller
Date: Mon, 16 Nov 2026 16:15:54 +0800
Message-ID: <20261116081555.2670878-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261116081555.2670878-1-gary.yang@cixtech.com>
References: <20261113125304.1693911-1-gary.yang@cixtech.com>
 <20261116081555.2670878-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|SEYPR06MB6251:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1dc2ee92-2449-49a7-3dea-08df43b9d78e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|18002099003|22082099003|3023799007|4143699003|56012099006|261028144727099003|261026121527099003|261026140227099003|261102123227099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	3Y8HI6y+sapxunK/bnow+Pr/Ux2Yhqu3rPPVsq/POVrHRqIydcVfHL4GG0JDJ6keU68YdZY8kB+rncWOzUAio0KfH2aEHR/I7kjCnr8FluSRDavoXfwkemIYQq8YT4/wVjp6Oy3MR0ladpV2OoKWgqyZNqadwHHPhnjscPMQ3Kvp3cOBWeyJtGaZBuW6liceJVESDQlaQ1X5K076FWzXoe/E0mEda8anUXnvcW0I2O7vlrbuh6+wIDweUzn9x0qrdqSQXUbZtNwkmti9T3ReZBYKuaXDAjAWDNyN1kVhEI5QLE3uW39reEJ8q1mQDIz0g+bfXW9B2EPVRx4FDmEMobVBYCL6f4e8jfdIurkrKYT8QhaD6mYuRmFsyvzTH7dv9FAMxwVpofCEVww2harGsVvMPtObQzUc+QjWdSt6y/5Qbdf5wX7NLk2wTcikVXVZlI0JTgsf9/ycMaNwsDrtrfTc4UWqgRzQitgnUkc5H8E+wd4qiey7YQx9zDlw4NdYqCSnqrRh1cAS8luhxLqkiRw/W9jxY7AcDXhwAPU+ChJGgXUEmY/P00en2UdiwHsbG9r6I0GLfW7KYFyNe+/6MGPq4x8MxLGCtgXjt4qIP/SwQe0vmM4qL4gMbpVcoUNNVAfuJKjsLdIn14W7g5y32g==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jpfwR7QaI0Cu10x8+gyvTxPEnyT8MX5he0C2dJ0sS2/xo/yA6zKS5noU5sd8fM69jlqyyW+Tjb6CmDbS9Kf3kNe+wnQl9+vdx1A89zU3XFvqC03zLOQnNS1ricsxsSNruS+j9dAkwSyL/mbvl9uKS6kqvYIzsC5aP7ET0fzSO6+A7s8rzLloE5p0fSw0+guLFpU/qI83bOtlffrNmIzI6sl1VRIfqOBMyWJkOiay/MoqO6pMPaWEG0598YC6ahKrDgmHLAgi/mDt6y79LDOHbb4Jk0255kSPjyt/0O1FhzkBMMHGZNaS7vLrnk1L9YFIu4l/2b+Zb5bgVrrThjgSgJycvW+LrKDsEqOk8myeY9jlyGEdAtLZJ4KOkdBwXU/FwDNAAAoGCd0Gr3XZ4yydOdFybvaWNKQFu3GKoWLkZ1sFFlrQc4uCh+x1Hgf9gqIm
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:15:56.8814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc2ee92-2449-49a7-3dea-08df43b9d78e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6251

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
-- 
2.50.1

