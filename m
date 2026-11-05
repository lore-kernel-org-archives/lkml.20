Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880188;
	b=UsWKUeHEB3UmbexARLw4lrFg65rhvSS8HGK2gTEQhCPywcndUe8cC7CG7PT0/ASrl6ik
	 H9p8JbnISqvykE61CRFUdCPRYJIUq2kucnKStibK1VGBq+7tNfxW+PZd2L6lBXnM/vjL0
	 DkasdHuWjBg0XD1J+y85QMCx82hWE27U7FNh6eLKV6d4RM4wTj2KLIk3e3J5tza6Nnx6D
	 pQUJvucuVL+LwBRKcTVoegTF6IfQMOiou3NdgMotCh/7MrQyuG0rW//dg3zjGUbU9xJjy
	 SoHJjEROwsbCSioCBvKva2BvgFmG1I/05vLw+ktHDLjApocuBw7vtjOh3LC8a5fQVfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880188;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=5kPNcEfnqjNQ1ORpUXeWGUi7Yiwvvk8APLxu9PKpCXk=;
	b=hV5Z0pzFeosPHdvZw8kB8XD+Awu2GD7P5GFmzcfDtGzhC7wCzrrzrHB+3hVvt7bOtTzz
	 0WnzwxRgPeU+aQsUmWFhbGG/YndOqFqWx6TYwwcVxcf4rPyTmBU0QoiPEanRTBYdJvXj7
	 t2HIKrOnKgZR75jZfJzUFQx6+aGf3Yx7VqTWZ6+Y+CcfjZtfgjyplhY0KiNjrmJb9FHC9
	 zFoJAXlLsASr5u4k5rTNBqXO7BfGa/3YvaiAurjJPn/sH7KFSQpVIKICzgi2JiO901ED0
	 72tDL3qSvL9SqkvN+eMVm8Pffx84AIuL6rWwgqaWE+O+OP02hSYy9wxNCE+a/Y9L6Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=j6uwaoiM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.65
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19478606A31B;
	Thu,  5 Nov 2026 12:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19478606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=j6uwaoiM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDRKJuAjgfMJx79Y020gKSXFf5kkcGPmB12Bu+HBylHLTk7ySn+N3pg9iKYFg+mz0M4zRYDesuX/GfuQxoG/ONZQIJxEsYvBbAmZ4zvL5iaPfrUlnm3/0XouPhRujS88QUpXmR5hxtCM5k36w+CLPPgC/YWzcpPMQBJbawbN8mIeQ4OYvrOZU5SYNxhqpB3998GOIhq1nbbuTk6QxlbCMX8jXqJClmFaja7Iq5kQepGVKtZvynGFxffowGTyvLDiCadbAW75AQtd2WJpYQQw97CK3tJvJkhCoJntxUvB+0pZI8CzaHQSUz+IMgsr3aZHTHKJJPhMmzeBAmZeNs0uRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kPNcEfnqjNQ1ORpUXeWGUi7Yiwvvk8APLxu9PKpCXk=;
 b=P0Z0Jgr3NCiMeWtV1JJztUr3VYMN4vyIlM5u+HvQK48E4XVJFsD8872qqOfUbTVhdg19zQPVbTugVWePe9KvUzmZWmZok0yRbV4Uyhd//h30DFlqXOrHhEIXMzAzUELSfOHF2DEffqzI2IkkJrGSmdYR4rn7aVSZ3vSedRo8gc2cHlRnc98NcKDFkQDv9poeQwdBT4oPF/ywesqsnnMWXCy2i54hlLcZiIgpRTqbRnfd5BdUMt4vrpLchAA46pJK0E1Iz9CUgxb2wDg25Zwl+xPYiktJD4MBW7NHDyx2IBN2PhyPTDP+5ML2/r/hb9klLezkQ6QKzF9+71PGCqLPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kPNcEfnqjNQ1ORpUXeWGUi7Yiwvvk8APLxu9PKpCXk=;
 b=j6uwaoiMnBru8c7tHtzledxgx+kCdxDC0i5rmmWYtUB33sgF85NAj2LfvdNRQtoO7qi2/xfhLNI7aeiX7fs+4b3fueJXJK4upDfS42MgbjHmU63DkRLnBab6UlDOE8/nBe7PiVDWGAwrizLnvcFd2vzNEIum9QItmLUGhTzTRGbs4Rql5B/0Qc+G7CezIvV70nlU248L55z6tLsQ8nIKTFYgnT9f2K8Ou9QqKT0HXP+0fRQ7KSwLtiWjoRgtU5MpwSzluYpe5Xn1zuAa2DprD9EUcXbe3XG4i8UKe/jLJV6bqnxNJjZZrlVgzV+v7g5cIroAt6KMw1+pqQzUCuiPzA==
Received: from BE1P281CA0030.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:15::9) by
 AS2PR10MB8035.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 12:03:02 +0000
Received: from WA1PEPF000099D1.eurprd04.prod.outlook.com
 (2603:10a6:b10:15:cafe::94) by BE1P281CA0030.outlook.office365.com
 (2603:10a6:b10:15::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 12:03:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099D1.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 12:03:01 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:47 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:01 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Nov 2026 13:02:59 +0100
Subject: [PATCH v5 1/8] dt-bindings: nvmem: add STM32MPX TAMP backup
 registers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-upstream_nvram_reworked-v5-1-ddf7dbf1b298@foss.st.com>
References: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
In-Reply-To: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D1:EE_|AS2PR10MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5bf1f2-c24d-40f9-7baa-08df3b34bde9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|13003099007|22082099003|18002099003|56012099006|11063799006|3023799007|261009223027099003|261028144727099003|261022105027099003|261102123227099003|261021135927099003|261021121427099003|261026121527099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	gFuoRsgPYWsYapLJryxBCydl6w5m5vDvQCXABEOiY+TTpZ18j3xD3vsboEBAesd7j45r0qLrvHkXmmMSJEvv15FdvuxRRQsl9WJ8bMlV3KS0mTSL1SRfRurnqEjwJUvDGbpEstFY81tCD+vTr6Vp5306s0Us+PTr5C4EualMlX65HOMV010EcGaf3bICn6u6s9APlPkGD0ZOKk/rMWrxmVx/1toX/AASBCiSjXQW+fTN/zn1T1sjuVEGmlg2ApqTxiEP/NQR4qI2JgyXJZFsknG9EHVpUexhPb19D/eoRHIOxVWWc1Uhopi7u5Xr0k7p2ZXZ9Hm6md1KdK+upS4A/kD6/bsNrDHkHlfENdV8eHnf0KLNNT4kLYYvG39GPhjjJoxS6Tm6+Egxkh5h59e/3oaaAvt0pKf+N78A0OL6aJk7akwj4uegGGfo6sO3FZmXJ5Tz6obgX1RkPZf3MUfizo/FxaOyfh+1AGKtOt33NQS0WDMpWauYzhDxRm61b6P70Lon51yH3JjKLHxtxLEAxiA/zYsmtrYx7zyEP6G8fSgeaIMR8ejHVDjwK9CfE8sR8PXlkx/BxIXUqqNNp5x18VSQJU4/cHLrdI3DHerYItDcJWOk8CWJNDm+NYBsHx/RNTdkUz5GMZ5cWgdkVkaBpw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(13003099007)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(261009223027099003)(261028144727099003)(261022105027099003)(261102123227099003)(261021135927099003)(261021121427099003)(261026121527099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z9sq1azIGKPPxxqYGr6UClujxLzm/SrJG+a85G1EN2tZPKwXAozVOk+udFMnwfyx9c1wOmJzHndQLJXiwayaagP+5GxEgvP/Pi+5evw9vWkjQH6jrGJXTEO9UK8O84O4KXe9T01rA9GoPmlL9tKwF9PM1te6jmwCjBFhotLJe2hXG3We8+vkrCfYKiJOUfSLTCF7BCIwYyVejaJ2DvQ/LZJ2McjyfPk9SLXlXzdN+3q8FhERBwmfA7nQidgehC7bGIltIyFWOtAxZInnK7Uni06kNAPcnGi4HFTr7+PVWUxj+UxmIwmPw7IhC02uwdmrPylhmGyJeVxIudjjl5/r35VpmB3HvxBhFnRmhOMNbMJyKbZjk6lSEwcFzTsYBqmWd0C1AZupkpYpzJ2YyTPyAzvyLpz41oBVIaIxgbVbJ6Itd8yUYBju6a5UqBkKeGET
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:03:01.9319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5bf1f2-c24d-40f9-7baa-08df3b34bde9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099D1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB8035

From: Simeon Marijon <simeon.marijon@foss.st.com>

Adds the binding documentation for TAMP backup registers.
The backup registers is a part of the TAMP device of STM32 MPU.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        | 57 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
new file mode 100644
index 000000000000..4af3b88db566
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/st,stm32-tamp-nvram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 backup registers as NVMEM
+
+description: |
+  This represents STM32 backup registers area presented as nvmem cells.
+  This contains various information (e.g. boot mode passed to bootloaders).
+
+maintainers:
+  - Simeon Marijon <simeon.marijon@foss.st.com>
+  - Patrice Chotard <patrice.chotard@foss.st.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp15-tamp-nvram
+      - st,stm32mp25-tamp-nvram
+
+  reg:
+    description:
+      TAMP Registers bank location and size.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvram: nvram@5c00a100 {
+      reg = <0x5c00a100 0x80>;
+      compatible = "st,stm32mp15-tamp-nvram";
+
+      nvmem-layout {
+        compatible = "fixed-layout";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        /* Data cells */
+        wakeup_sec: tamp-bkp@0 {
+            reg = <0x0 0x4>;
+        };
+        boot_mode: tamp-bkp@50 {
+            /*see boot mode selection feature*/
+            reg = <0x50 0x4>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..13f5c94b0bf8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26918,6 +26918,13 @@ F:	Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
 F:	Documentation/devicetree/bindings/dma/stm32/
 F:	drivers/dma/stm32/
 
+STM32 TAMP DRIVERS
+M:	Simeon Marijon <simeon.marijon@foss.st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
+L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
+
 STM32 TIMER/LPTIMER DRIVERS
 M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
 S:	Maintained

-- 
2.43.0

