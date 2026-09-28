Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013025.outbound.protection.outlook.com [40.93.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7450146DFF6;
	Mon, 28 Sep 2026 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588015; cv=fail; b=I4zrBqWvXvGx1lLYBCrGXTDNYkxKFBH4S9H4w5joexGDbjV+dzhW7hAN6NssLBAb1s5WLNPBQnFck6bte7gtSfuktbcCQQhWCCod4giBkg0dHGRb36ht2P9xqHuY6TmmFS6BZ+vJ0weEUOa73q4FGlaeJDqh91FdJshHV1xmodw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588015; c=relaxed/simple;
	bh=Litpbl6s4tQEn499G8vEzHw5GcswdKr/ngk6wNpwfEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YsyrSVrCLFsP0sD3PxahChO3eRUiX2GDbTvTPmY1eSsh1DBYpBSx+F9qtXqJa3YssOo+k9lYE5v6aTN9vaDjGSC/9meI9zW5TA8mC+ZLNsq4TXQ3Gr8tj9yDYyjQdoNNtwZ03fth/l52A25/srdwZ1+Am7+QLMqp6K/7hRKhFvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qc/AnPY3; arc=fail smtp.client-ip=40.93.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qc/AnPY3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqoI8/JD+xkadXI5PVj3X0Y49DWlprXvkHVGwFf1OVklMKH0YBhh6nKQNGhJfmSu3XithflZibrvnU5SyyDZUyf01xw5McIOXN9MJS1WuUtmZjY5liXaZQtNbiEJ8nDlcF4+KXzMieZpOUggT+PIHYCB6/k7oZLYJcF2qTv0e1kKjrRJdcEpdgNUJmvhxhoFo602yztfBOVqbTLm0t3Snv5Uz9EdmJZS8VufHedWP4Ohbr8SmiHt8vb8NqidPwChbUO4bVcZ4F2COxrQpo8TXn1Mo840A+7MaGic0MYkMW9LZg6wS78sTanu44pqQWPK8FVJNz2MApML0SGIJtEMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3IACskba7f2NyQ884jfy8TKqSTKGVp7LWm3BRkHuDk=;
 b=ujizEopadh/WiafXgvT1SNIDet6dzRgffcP4gLmkWCMNsa1S1zWm+W/KnGFkzTxAqBt4GZQhC/zfZ4HcdhcyN1gJrHthL6Y0GczWKb0Cs9ddj+k72bwEBQ0eSpOS0hvPWBQT2i4Kvihcln+dmlP4nZPGa4OGKB7JnJCWgXAlFA38HA7v9pn9Ifv89r2dBbHWBwQ/z2xVktRyiThwDDFZQb5RFEccxm5smlh7UTKGbckDHwWL8UrR31PxZy4EWMv2eQ+/wqGfZWx02TlKtxcIhOyBp+W75f0d1QH8hbSyT1n/wLdu+y20Fbz23Uovq9tgCXhwjIEHFDMZl+vSfOZb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3IACskba7f2NyQ884jfy8TKqSTKGVp7LWm3BRkHuDk=;
 b=qc/AnPY3rPgtQXgmHoFzTZclVlqmWv+sev+I8befEJRPDgI6aHznQ/teNsV7XXxeokzgJfS5/IsJHVOV21XCXUamDRN6NUc07C3RfNwnDC3rDXw9tA80KAEe3/8zD/g0qtY/RAvRlji7yBc1VffMnZUAAyP3cgaekHcMX/pu0yY=
Received: from SN7PR18CA0030.namprd18.prod.outlook.com (2603:10b6:806:f3::7)
 by CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 09:33:26 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::7c) by SN7PR18CA0030.outlook.office365.com
 (2603:10b6:806:f3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 09:33:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 09:33:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 04:33:14 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 04:33:13 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 04:33:10 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
Date: Mon, 28 Sep 2026 15:03:03 +0530
Subject: [PATCH v4 1/2] dt-bindings: interrupt-controller: Add Xilinx
 Versal NET SMMU CSR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260928-smmu-changes-v2-v4-1-3c79a14cd806@amd.com>
References: <20260928-smmu-changes-v2-v4-0-3c79a14cd806@amd.com>
In-Reply-To: <20260928-smmu-changes-v2-v4-0-3c79a14cd806@amd.com>
To: Anirudha Sarangi <anirudha.sarangi@amd.com>, Thomas Gleixner
	<tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Tushar Nimkar
	<tushar.nimkar@amd.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790587986; l=3235;
 i=tushar.nimkar@amd.com; s=20260917; h=from:subject:message-id;
 bh=Zezb2vSa70oEHIQQJ1UkCYfkaeQB9Tue7zLzFRuIeAE=;
 b=ZmfL2gSAWNqfBEseIYJ8hZzXSwf+vp4b1gyQwPF658L7MILZDsJpnXgRV/DYXAwRfcbiI1gCC
 jiRJ6ZgalXsCoeuzG5p/R5mhHfEdAoPzBlpiR3JUdO9Ug3dfVsMEDWL
X-Developer-Key: i=tushar.nimkar@amd.com; a=ed25519;
 pk=Uirerl/gKBwPgdWL9awJAJkw5FM33ZF2TlUTJ58DEYA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|CH3PR12MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b5c432-af4f-4517-f3bd-08df1d438bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8zxontaQfXGT7qlrod9gLumuuqEhWUwV5WIEFXUo2PaGj9nVNRhpFhGq3DteTBPlEAlxEEmMSwqzZCk9IJCBtsmp3/z37myCduJoPzruVjS3UZ7p866C4IvUywW9TwXYcCEwzqLZV2gQ58PLe7QsEia1T0mae6/AHdjqhX3BGTWlDzwLAE/UBKEt5e4Qzo6ZCbmFpRRVB6H4vZS8H30t8Uc7s3r1cg2BTWi+Qz20pmhx87Ueoq57nOsGJyIgKSmDS4TzeKWzU42piT3adyfofZg5GR7VYm304awlcJwjf9lY5nPYHVlHQ8YDfus03R41izA750x+J7aU0+Qr0aRSr7AW5W0khTYvNBRC0Cn5kxgDOdH0y2/UkPOIzeFzWd+nv9F6GW57aG0uKyUGYq0EjGXtJ+1OEsEofq1Aziq0L9+6RNVEiizPJy4MNGMe92YQiGfHPb7zVhZOnZ+XcL8n0RHdb/8SixF3oCzCBSyOqQ+RQJKwvzBCWCi6+oWCc83bWvOp+1xFmq/cBN5XhL1yVgAy5iVgyct6DDtaDXfPMdmKi8nTrtydi/NuFzLMiIez8rFafxYbeokm55d+gataE91BXRUOso6lXjAI6WsNKPONOsO02iKIk2WeL3gUVRz2Kt/MQ+J2qaasHKtKemA5Qg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PBFzkbk7b+HzhzZre8wukSYMFgzU6dz7ZZabZoCf15dVaz2sB9kxaTHvi7QyYmYP+Cv6L1/+iR00jTg49kl+YHeDpr/wmohQpTx00Uicb5ULrm661qyETLpSkXFt0Gn3cB6c/HKXssx+hU5DnyM1TpxMsI9Snf39CISAOh/YBs913j1//yYtDcWgf0y0IgVFwWJ4ylsCeYwQste2I2PRhyq8taG+HTLSr9x3H7J8Ye4Ny/StWiG1VghZHKFEQpwsCc5jiJG9eAZP3LOpWpdoGMkl98UeZ9XKPuIT2++lmn74zX1TAD1uGHrBtv+akeKYUdrIc2Y0/kECm2pgnnfYI/DSgWcwMCuPeQaY24b0OH9EyK1h8hb6gQvZgyUQHm3F15BJ72E6sGwT2J7NEqScj90cYPqWNTEF/X/DXZxdk4bHOMfVQOx7oRTG2qpzhgTx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:33:25.4126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b5c432-af4f-4517-f3bd-08df1d438bbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500

From: Anirudha Sarangi <anirudha.sarangi@amd.com>

Add a device tree binding schema for the Xilinx Versal NET SMMU CSR
(Control and Status Register) interrupt controller.

The SMMU CSR block acts as a vendor-specific interrupt controller
in front of the ARM SMMUv3, providing registers to enable and clear
standard SMMU interrupts such as EVENTQ, CMDQ_SYNC, GERROR and PRIQ.
Interrupts must be acknowledged in this block before being forwarded
to the parent interrupt controller (e.g. GIC).

Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../xlnx,versal-net-smmu-csr.yaml                  | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
new file mode 100644
index 000000000000..38b63e51b732
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/xlnx,versal-net-smmu-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal NET SMMU CSR Interrupt Controller
+
+maintainers:
+  - Anirudha Sarangi <anirudha.sarangi@amd.com>
+  - Tushar Nimkar <tushar.nimkar@amd.com>
+
+description: |
+  The Versal NET platform includes a Xilinx-specific SMMU CSR (Control and
+  Status Register) block that acts as an intermediate interrupt controller
+  for ARM SMMUv3.
+
+  The block provides registers to enable, disable and clear the
+  standard SMMUv3 interrupt sources (EVENTQ, CMDQ_SYNC, GERROR and PRIQ)
+  before forwarding them to the parent interrupt controller,
+  typically a GIC.
+
+  The controller receives one parent interrupt and demultiplexes CSR
+  status bits into the following child interrupt identifiers
+    0 - EVENTQ
+    1 - CMDQ_SYNC
+    2 - GERROR (GLOBAL)
+    3 - PRIQ
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: xlnx,versal-net-smmu-csr
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description: |
+     Single cell containing the child interrupt identifier
+      0 - EVENTQ
+      1 - CMDQ_SYNC
+      2 - GERROR (GLOBAL)
+      3 - PRIQ
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    interrupt-controller@eca10000 {
+        compatible = "xlnx,versal-net-smmu-csr";
+        reg = <0xeca10000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.34.1

