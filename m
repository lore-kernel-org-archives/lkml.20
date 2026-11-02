Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.44.109
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793588672;
	b=X+9qVhqWHej18P+1/YhntJ17TdqN7F4XORh056V/nDEO4vy3RDQO+PJyWMkxWgK298yy
	 U7XuR8DOFneJYYkRqTI7tDVG0kJu0M0Al+Slw5exOSrKZ6Wm8ZxoPRDWWGGHz+kn6kaGU
	 O/XL2F72c6HCXICQMT5u5FBORsGaZyqVtPzSKafPjakki8k1n5srztKgeRys9KkeOVgXk
	 qAUavfXudgRacSJSgC7mcYTsIICOZpX6YcnhJWUhUilBZqa+XFyB8Oz43h3OGsnthqP9U
	 kJJhaNqLBY2pGdG4gO39VFPuhM6h1RIeT/h93DLCTc41+BQkgtxtbZy5Gu/9jXNrQKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588672;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-Id:
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
	bh=oshhTtTAIEEjN/mrpPYmkDIAn5Lu3NZFglnc0Hhg0Jk=;
	b=b3jBEEdVBW9aSap4X2UkaYzzHM6avBZ7OFkrMvO17FSTZBgc3FiMktQunpSo2rik9ZOt
	 LD0KF0w+yjtc7jeE2QTtZWva//DDRWL4Gku6Qsm76Svh2EML07Uf+9EzKShV/UD9n6KOt
	 pz/p9YqZyt0toOSLRnMEELGUr/Itef206uSsaWoSA2xrmaXcJANI2UfESa5sqSnl8Y2GK
	 quB9J8Oxs+618jA6J6LYxh7yQMDQ0K6R3P56m/Za8bj7wYEgFkasTGk99pret8btMFd5I
	 X6azdv6LQdvLi7UKIrifZ3CSGEOiQkwKYjo30JgOXxu6BgDkO8om6jh3FeY2bidlC+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=fail smtp.remote-ip=40.107.44.109
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023109.outbound.protection.outlook.com [40.107.44.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54081606A327;
	Mon,  2 Nov 2026 03:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54081606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qk4U0Ldqhqaz+Yn7JMsVZCnoMYMVYBTerR4bdk1FZ0cqD6UGSTNbYPpUAFzrjmz1sKQNAvngTm6q9yymtvwQ9IVgBPtExPQ4jsXoF7wh2l0dskxxCSSyaKGh/89NsbSRB6TpbM3o3Tu/TtluQFO5V/zEetbsu7K7SlPcv7e/RDJ3mCPHMtLhrlu3sXFCcY7YnmbF1q1kr+jiXz+c4aHQ7EOme0FVXo/6p9eGY7BeLL9vANZjR9gFZEYG43GAElzFofl/f1Fbm/9Qm3APmJlHTSR3yM6d6U2wT5hi8SYvBceIgebjhUDvkqkj/TK9IJ6rYyf4oYbFD2KcBM+jYRrs1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oshhTtTAIEEjN/mrpPYmkDIAn5Lu3NZFglnc0Hhg0Jk=;
 b=PH+fOOsM9gCZONNLr5dIHCbrMnow+oBB516c+wishfZ2rim+VOLpKNSQ6YOL4mUowkq1KE7tX6y+lkf4uuXK4GZDhkzQT7hoiZh30N4izef9/DDbZd+CCtdz3Shwli7aOgSielJeGZKRMCdpDlVloWesQRZda90Nph4XQuBM+s32jLQgEPdjAz1LeOGn/4QGiigOgkArF98/+cDWZ53rv+QmgTMyz0EZXRTgLomAyDEQUdmSwVsI/5JyxmUXrK6rpbkkrSWdT5acl2yv12n0fDuH9pr/QCrVh7+mekINzR6pcDIx2FmRYhaqMPtXdGx04frLYpLKrZr63vtVqGFCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:990:54::19) by KUXPR06MB8293.apcprd06.prod.outlook.com
 (2603:1096:d10:5f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 03:04:26 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:990:54:cafe::5b) by JH0PR01CA0128.outlook.office365.com
 (2603:1096:990:54::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 03:04:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 03:04:26 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B489C4102B4B;
	Mon,  2 Nov 2026 11:04:25 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: cix-kernel-upstream@cixtech.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Luo.Liu@cixtech.com,
	Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: [PATCH v4 1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
Date: Mon,  2 Nov 2026 11:04:23 +0800
Message-Id: <20261102030425.1957585-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
References: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|KUXPR06MB8293:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ea2e3d10-8946-439c-26a4-08df388e0155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|42112799006|82310400026|921020|56012099006|261009223027099003|261028144727099003|261021121427099003|261021135927099003|261026121527099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mJp2Wd7iC5oP3++eCnwM/BMJ/AuN0xkI/Ho4SfK+DMHGU2lYittdkWF9JJwH9QAvZqqmcZvS+WaAmYt0Yp4Mz1O9x/RIAS7dBLY+NF86zj18AsQqv6HOQjXZYaAgYJeI/b+aBUwDNJCSB/l+aYOOt5Z/mK6Uqnkswfy7frpkCuC/pfpjYNSouTbdZUloqcPr7LbfdzGpVL20ReGULRi+YapruMxIdBEDMwuXT4cG3ahUqLgDI2M0copHy6MHW/52kCpl6YHuN3b4Yyvfzq+/G8eMYgLQl6bHlLj0cDZsM1gqE8cv62EEHJq99PElxjyN+QZT2SfAggMo/TCc/XCvoQYv3K0Qs4+qTKqUocy5T+Q8KAHU6lUtflNvj4WxUe8dGSxI1/uQATEu2hJ5AmMKZBZIMsHNlgtFovdgsPsV88596G/5aP61arClmMWe7ucgHJOcAYnX+4gEqBYb7iweNYFWUw9u/b9t3BsmJ6TdH78HbL862L2KTfMkvaXtK5XMnr48ixr0SOCr1rtTLpkY5HO7A+757GTdDWU8xIAYv8PSMgiCgREB9qxEk5sDh6ijvsqJGFFblhFbu8N7ZjyBqpv6AHM51AieG5dgePDTKGmw8C9CzpdRmJ+8YSLiGjhBOr+TtfJMQT9iwSIqUPkj76q4mcVVDx3sKk5f+z7E0Ko8TDHOXKKwI5MRTFywe5rC
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(42112799006)(82310400026)(921020)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021135927099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jPOg9HfE7fNlTJ8kPAebE2DBCiadl0C91e4BqJOnoeTKhtfwrvaUFZLT0uiizEU2MyjIRr+UkV7O9BO2vv1wno9/gUTe5YUf2WVdDXRblllZbiP2Cmo6wqgbet6OQZWcd+6eFwK7WSFTIk4n3Q5DNM8SvMo7innjKioGps38U9XbDFj2FHXbs7KW6e25YY5yuH68aKOf4z77vJbDFoak8keiNreN2wOeiGHr3/kpU/uAjqyDg94pQHoL88R6Tse3I1WbQ8ND8zVM71C+n1gDQtFUFrvfoPj8k04kvSYxmEnJnizvXTLQfk/MvIzmBjOmfv0VYhuU/cDR9I5Ry/utWm+djzkIcVIAiObpE5FwVy6PqUPdquivnxjqychoIWCg6ZXLySLpNdoy1/YSG/CyKOk6rl11wEUUOFIzaNYcejBoHCQqK2xk6hGIU9FXx3Vs
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 03:04:26.6861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2e3d10-8946-439c-26a4-08df388e0155
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8293

Document the dedicated DisplayPort PHY on CIX Sky1, including the
required APB clock shared with the DPTx controller, reset, and the
optional cix,external-dp property to select the external DP swing
table instead of the default low-voltage values.
Add a MAINTAINERS entry for the binding and driver.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/cix,sky1-dp-phy.yaml         | 67 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
new file mode 100644
index 000000000000..ea19f0aa0b1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cix,sky1-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 DisplayPort PHY
+
+maintainers:
+  - Luo Liu <Luo.Liu@cixtech.com>
+
+description:
+  The CIX Sky1 DP PHY provides the PMA/CDB register interface for the
+  dedicated DisplayPort instance on CIX Sky1.
+
+  The PHY APB clock is physically shared with the DPTx controller.
+
+properties:
+  compatible:
+    const: cix,sky1-dp-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: APB register interface clock
+
+  clock-names:
+    const: apb
+
+  resets:
+    maxItems: 1
+    description: PHY hardware reset
+
+  "#phy-cells":
+    const: 0
+
+  cix,external-dp:
+    type: boolean
+    description:
+      Use voltage swing values suitable for an external DisplayPort
+      connector instead of the default low-voltage values.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    phy@1414c000 {
+        compatible = "cix,sky1-dp-phy";
+        reg = <0x1414c000 0x4000>;
+        clocks = <&scmi_clk CLK_TREE_DPC2_APBCLK>;
+        clock-names = "apb";
+        resets = <&s5_syscon SKY1_DP_PHY_RST_N>;
+        #phy-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..b46d0f4220a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6360,6 +6360,14 @@ M:	Satish Kharat <satishkh@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CIX SKY1 DISPLAYPORT PHY DRIVER
+M:	Luo Liu <Luo.Liu@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
+F:	drivers/phy/cix/
+
 CLANG CONTEXT ANALYSIS
 M:	Marco Elver <elver@google.com>
 R:	Bart Van Assche <bvanassche@acm.org>
-- 
2.25.1

