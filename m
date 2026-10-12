Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023090.outbound.protection.outlook.com [52.101.127.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEFF45D91B;
	Mon, 12 Oct 2026 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808586; cv=fail; b=Hwg71UEVGcccHlNoQaJn4eqo2LM/X0lk2Co9btH9N/9Xvr0HD/9m580cGTbhHedqXg5bbJ4Jxr0TwjD+fdvpqP4DLT2P1zt9LiTKddG97SNemWrdyVoDJz0qN/9CJRMZD8hx3JL1OeBpAlTkzH5gWSkQKnjjhtMKk4Sw7yJmQUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808586; c=relaxed/simple;
	bh=AWgKaEIJ42x4ogdzMLHr9BW2LFdnAmjoLKWA9ekroAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cdnmqoDMJa7OUkxUZcujEHIiADUEpWyZmS1FghqozTWG8O0DmxuePxt6sxRePQ0SD7dImMWk72XLolQLfBH9adeGqUR31J+oQq4N7KXGcNobUGArio28gO1zHwpgit/eMRZpjxiFiKdn1BqxodBqUrcdyyCyrQ9ll2RHLXylsFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCrWTfW/aWcb8H1FDTgKlI9pt72uLCVA5+jaJjkHd3fvTuyjJP8bPMk1wi8Dp2le01TuAW/ANnOVoR0GRyM0VQvbW5YST+P5LB0tD1M8WxIayKeFTS/yfmIb8Jjm7Xz4Lu+UaF6XBdooBW2puZDrTdfOyTNDpsNsZs0f4kNp4nl9IYS01WVXcOt1M0nsEnAi1Tepz23PVt8k0dY3Y/kUvKOGEX5m2iVAbLIZ8dwC1yhqwLKJOr++CmZH9ZTa0grl0SIFh0S3VtoEAthWeKsSrZsycw1Thkhi84fC73pUwA4bS5Ur+Ma5psD3nlk5a7Ot6Cwst8RgyIjAMZyB1AA4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Oj94s/a3s+iclXHYEYuEhpKirP0ZL8mxufI2elU6JU=;
 b=cqfWZCi3YWB1V+P3pSru8jY2fEQ8fCnrI5bWO4x4LeU68rTkVaaNohftJBDnXb7GKmKA23DDfg4wLJSDI6L6aJqPl0SpncXsTt26xxvGA1FYoB7TUYfVhH85wh/6OjLtXaqaAKCfL2eh9baKdvK0WaJ7IZdRasECRIyiHOV4q7qLzilYb7mMDYd3ni7A7WJju+BUUgZ2gpBKOzGpw2agf5oY7Bj8pIps1+I2sBKY9w/7BW6ZLoaPho+8Ps7PV1Wtvk5HlN5SHlmoQtTKsKknDTX5XYj2inpkqfy5jOxIqdWmFIhkaQWsNR1iDh7m0+KoBR5Nu89aQRSMUcMtL4PanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0020.apcprd02.prod.outlook.com (2603:1096:4:1f4::9) by
 SEZPR06MB8933.apcprd06.prod.outlook.com (2603:1096:101:33e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.21; Mon, 12 Oct 2026 12:36:19 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:1f4:cafe::89) by SI1PR02CA0020.outlook.office365.com
 (2603:1096:4:1f4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 12:36:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 12:36:19 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8C6E8427E3AD;
	Mon, 12 Oct 2026 20:36:18 +0800 (CST)
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
Subject: [PATCH v2 1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
Date: Mon, 12 Oct 2026 20:36:16 +0800
Message-Id: <20261012123618.648930-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012123618.648930-1-Luo.Liu@cixtech.com>
References: <20261012123618.648930-1-Luo.Liu@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|SEZPR06MB8933:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2e67cdb6-9a41-4d8e-d839-08df285d6a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|42112799006|82310400026|23010399003|36860700016|376014|1800799024|7416014|10067099003|18002099003|22082099003|3023799007|921020|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Gx+n/Xll68T6jEh3hAdn3azrFlM3BDrDB15+u40QAR5OBUro8wxvT+yfQlX9h7IOFDSWMOkCsjZqDwS+eSntF6YnMBwI6THe8w7KQ6iMZzmqyOjqYM8C1fiAV32GTGMspWCP/Qv2XRYU1Qww1DF9ATCllQZhemmkd5srUoF1p8pNZoIOjBZof5qLZmsKtW8L2D4BmEAdRg19sCRAdnxfg452YmFsSS/a3KIBkkppCaq279aaiFETz4ccDKAsWA+GYtEtzGkuI5n7HRhMTL5E4oGotTq2BKmq6D9BVIL+aIk5JP5MaNnHt6IptZMmGC92bMsxRL+wiCZcJ0AMjZKmObIzjoW9N0RsFZdegrWfwDI5byWBmQ3TuXTusipO0tZYzBGYfKa8D3vb9HQFO66HcctrPRlSWgNpLXJPWnrnw++N78jpWzhC8JWwlNGcrKHN3apemcTgI8wumGaFtHxVRcDg8uoRytYtg1YhxYnB8Zb5Faq2ulj347H01Ld4p6IgJvcilknLlJOyz/O6pM+M4tyV2+IiXrDW19dB3tPtJnnpMC/9J/n/aCeCvrksIBG+cj3H/OTs0uVZjM8w5GBIf5Xwu+F9t2+aH/LEu32sJE8imfzazhOC8CAKW/yEPDe3GhvqKvh5S2maFZwctU273BiJ8Rgb2jWQZxbRNbKW0OyMi8Cc8hyIyFPyWFxT36Vu
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(42112799006)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(7416014)(10067099003)(18002099003)(22082099003)(3023799007)(921020)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8CZ80YBhh6sLMb3SuZ2dYGWllHEJKHDP0wMJvP8QVL1nAAcAQ90/3mZPu+xR4UcxReHNqlqhgr+Sd4QmK4rU5wZ25WAzuTbWE8zWtXAsIB/C9YKC13cU2VnIJWufCgO5sZzaflVEFU0lucKYSAGX1p7RxlCfdyKfjMPS0tzVjGnfRmULq3nh8snDCfFd7/H5QwmnOQtus/IE5FmCi3gUl6pwB51mt8G/r8G1d0HfXCHYO4ZUczgavIuynfJrLLibwJZLxap3h1FXdIhoPDZG961KDn4ImQrbRLnmKESb1sZ2wfQame1/ijuVFn5DKNkWbBc9Qt/HoljA+7Dd7oHL9H+OTBMaV0NseEURiR5/VwxrW3FNSF+EUFV8yIgC6dmt/lcZaqumuRackTxr/YEUe6ee8XfY6NUG5eWksNwrviTmLrxmhD9vXcSAg4R0b1nr
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:36:19.2302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e67cdb6-9a41-4d8e-d839-08df285d6a88
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB8933

Document the dedicated DisplayPort PHY on CIX Sky1, including the
optional cix,external-dp board property for external connector swing.
Add a MAINTAINERS entry for the binding and driver.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 .../bindings/phy/cix,sky1-dp-phy.yaml         | 53 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
new file mode 100644
index 000000000000..c6914cab74e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
@@ -0,0 +1,53 @@
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
+properties:
+  compatible:
+    const: cix,sky1-dp-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  resets:
+    maxItems: 1
+    description: PHY hardware reset
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
+  - "#phy-cells"
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    phy@1414c000 {
+        compatible = "cix,sky1-dp-phy";
+        reg = <0x1414c000 0x4000>;
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

