Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5FB365A14;
	Fri, 18 Sep 2026 06:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713631; cv=fail; b=QmAUZPbG1UsLzcASRScGrouTbJgN1HYQelIAPsLYwLtsR9kerH4Wh2bOIR/eg2k/CfErR/LmD8z0YyLMROZBH/zu2pCJMM/kqQwNZGoXAUTaSuMHd1by2sGKrG+xYmkmps4GaQITd28wWNvxMoAPm6e8hFNn3c9ltxG2NJz11rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713631; c=relaxed/simple;
	bh=qs+RJGX7afVx1/bACZN350qWgMS6MMc78bmGZgnGCU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tLf3ulHsMzvjztoUKTuKCVpuMCrYD9/QvRS5RWfJpDZTLIyJqL3MPS3TxkPbzAAe1rIZaEIFXyAMAaqPSnUcdEUXTl6KsDn5O1eqdL1OZVwlBoajssWEvDsbufHIK9+Js8iapMSCMHbOWR2tCg9hrZudFU6PmX5TP41/VEmrl3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BA/3GUwP; arc=fail smtp.client-ip=40.93.198.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BA/3GUwP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTUssENGKYnfPR4BRxtVIiSCOF5oV/3BO9HZ4b4O0LCWRh7MfVJhhxmub+yGPI2a/23vUb44rHwGwNWHLnoZQr+7MKUqKLdQLU8sJK1NL2rHcb/kC0m8uj+NiFMPslzbabtc5DH0Vrk4N1puwzoD8Jp3M63xpZsN1BYhiFBb6J+wtqTsEHXHIOi9xiSMHWcPu5lF5dOWGlsOB5IY9KZJTW1g0Yg29W2s21Pa5JsFLRaeYnZ5mOAntB9qOv9Yrh+pPzVmKwJvH350z6fa1w35X7sYUljFYhHkNY1wakXSs7N02gEzS5raFxXReMTVhDGrhOfV6HgFHM925Fe4Hn/Rfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b28VSkaiC+H5BMGCTosCuzPJZTw8xeVONBmQ25xxRQM=;
 b=dp5LsAOE4uWYPHwgTfSysgtxjwU6QnLtz2k6r7Xpam6uJFeugucZkZe6sCxeauynI1/1HECIUYjjllMf00SqmzZEBy12q3o4C9GpAkXNzmePna0LLBvwAeyUDJMDEMqoMMCRjflQEjSVfEPGxOj4wYADUdvuAaNjBnFnZVyKUFY2lLYx2ZlYL9/Oi42IXQiB5Nxa7PYHQQHwkVNLRgX7iRFR+3mr69M0xXQ2LKrKwZyyNXbIcww1uFcjCIvG0yBiYgRP9QeJAxgcfU1eVKMy5lUp8+aY2GNqdp+BEWfeTAut3J9ssilLBF5l36rjblUYwL7VGkpVf3WCQYGeTAWdGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b28VSkaiC+H5BMGCTosCuzPJZTw8xeVONBmQ25xxRQM=;
 b=BA/3GUwPkPE+DA5Mj7N3TdHlQu9S/4g8qK6oNfpHJy8pQrf2/fpy6XLVWn6TsMNOEOtX5xDWsjDnys+8GciTwBaeoATZFNd/hBzj386WssKIodBOJ0u8dT+YPqREghYeDqpFrpqpjRRP1SWr/Kllst/ebUfPKE+aN+IxC2Jabd4=
Received: from BN9PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:fb::35)
 by SA1PR12MB8946.namprd12.prod.outlook.com (2603:10b6:806:375::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 06:40:19 +0000
Received: from BN7PEPF0000009C.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::78) by BN9PR03CA0060.outlook.office365.com
 (2603:10b6:408:fb::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Fri,
 18 Sep 2026 06:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009C.mail.protection.outlook.com (10.167.248.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 06:40:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 01:40:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 01:40:17 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 18 Sep 2026 01:40:14 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
Date: Fri, 18 Sep 2026 12:09:33 +0530
Subject: [PATCH v2 1/2] dt-bindings: interrupt-controller: Add Xilinx
 Versal NET SMMU CSR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260918-smmu-changes-v2-v2-1-adda681ab983@amd.com>
References: <20260918-smmu-changes-v2-v2-0-adda681ab983@amd.com>
In-Reply-To: <20260918-smmu-changes-v2-v2-0-adda681ab983@amd.com>
To: Anirudha Sarangi <anirudha.sarangi@amd.com>, Thomas Gleixner
	<tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Tushar Nimkar
	<tushar.nimkar@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789713611; l=3182;
 i=tushar.nimkar@amd.com; s=20260917; h=from:subject:message-id;
 bh=/X0Y481AIlfdO5p17knYhpEmuAu/GMNgPmVrgnQCZKU=;
 b=8hJP1lZ5qCkJGK34JwLGsfgBn+w0r0yV7nHCRtoCNB1iy9TpDlUeqZs9t2NGnDAKrcsgmTE2v
 VRAEkfoWzzYBdYlYEX7ImQyfFCZY9aVRx1oRw2WW3/Wdb2wy0BwKqq2
X-Developer-Key: i=tushar.nimkar@amd.com; a=ed25519;
 pk=Uirerl/gKBwPgdWL9awJAJkw5FM33ZF2TlUTJ58DEYA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009C:EE_|SA1PR12MB8946:EE_
X-MS-Office365-Filtering-Correlation-Id: 596a6c10-534b-4290-a48b-08df154fb4b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|13003099007|22082099003|18002099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	6lz4egsBSRcaDr47EW1y5ZOkb04k6Ch/ZBhNEPR8yLDgINTRKCdlnqWzItgmAks6MvjG1rcwleXWQ+t+LRKSH9f272EXAa8P47lDhDx/obsOaLtvfZmnHjuTYW19APU5NGczu9CthpbfugT0yh+QUKX14+fPF1vvZXaP1J8yooLZW2ERxqJAkt4pwHsyPthCMKFM74aekSgK+bf3zvTBTtF1ZRz5bHv31kje2ZEhQA8Pf3gP+eDxFnc/Vast6z5/0xiUutf9EdXadXItqxe7KR+JLrOy15KKnl1DSCkjPmmIqRBKaotO4THv9BmZEObUStfemte+nF17kilhRstr1QlRg+cIqIdFN06J8DuP5Ewaj6O+LUUVclxa4U3gH5t7HqkjtI/ql+oe+cAd00Mkgbawe4RtJcdi/r5nHOu4pH529lrXy1C6/29v6kSJXRab9yaO85rxaVR9b8b26MhRmXBMh0e3LcuMFLTv67mPRQsClFmTwZUrx4fzjynZbMvF81+HJm/KrePCGRLysJjZIdM6HnyQ7RozhPf0Wy2Qx72KRC3j7k88N3TCtHDwbAmyCYMKrvFPUagzVH8xTF5iB7yXXhlZrabZ9eCd3JNWbZbW0k3B67wOqNQQTEO1CtdSMstYCkYQATSduMFbaf265g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(13003099007)(22082099003)(18002099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AEmKbmed6YXhLONNN4LXGqjifdCQy3vws8Hsh3f2EkQ2h7X7ww4rB+bXbTDWkOrGBJArgOip+dXS82rli2mUq0iYrvaNiZ0dUCML3Kyhy6mfosfpZbePXo8ySjaPZvcVDCftxfAAV54PQ3wo9mWkhuJCzjeD8LaKkC/+kGb4KUCeA5B2zOuX4tm4L+8fS5FFVe2baKDkOobxdSfcczV5Jepkk31pbMMRZDwaYrIl4KuJ/iVcemQ4xaImWMsHDu2/b0OHS4eafjffSZIBcT6nFecjmwspQBkq9hpRnu3Qa7Yhbj/L1KYPmHQDemlIvlZyP7lTtC44vAgmGOVe9D/zw4EjWNvM4X/BO6ADdaFHCia7hvaKu6h1TMux69xybnm87enMFAOjl6EcsyBibyDrC9OKRvlioYF36B+RKBjKv27mwk++G4DtvnoOwhvKMudJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 06:40:18.7851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 596a6c10-534b-4290-a48b-08df154fb4b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8946

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

