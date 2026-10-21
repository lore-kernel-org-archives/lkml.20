Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587461;
	b=VeQFh2xP97Ljd4yPzK0CsuTss8cS3/cyQc0+bh+zOlk5+VbyDzbuOVBnFZXPY3MHWOlm
	 eve6rDJOOAQezE8CFP970K8HQ/P/OjdwinwBNUswPNNi49x/9febs+iUPNfI7Nfyan/Te
	 ZXm4pKbD4xtnjMxyPxf7vR3Msdd7IwekqryVArKA/rsZB+GunuIrzIburTZpq8+PkgSVF
	 Y+DaTj0mz8wRcD5/Xa98zMBdBSuw7TElSJuE08YNXeLuQj5Boln43mQdNJ3t9HbIX7zI6
	 PUR1kd5ZrgG6MKM0eyh+7yrlAz+0vjz3n964wh/crsmyYcRuNvJRFXt2au/a2oE7dtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587461;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:X-EOPAttributedMessage:
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
	bh=fu10l1/Okl7eOsc4INefiN1QUMRen4gczIg2g3SDI7g=;
	b=Ys1KY2ulZwAfCzt00YoX8rh3Xn5h7N0vPxHp8h2S2WNwYoGKG5U7n1Kv8IR8BMznhujn
	 7KqWFB9igOuzU2a1pxivjCsQoJu27EpOoFSyawf5brFH4u8kN3bwx0ZcamaEX6E/XaRPN
	 esklprB40ljw0GdldMaFvLB6dkIWtWeaQqiWMIC5QDF7AuTDZDW6VzQ1ag6hFwNy2oa8C
	 rJsI6qW+M5wO5ULmmz0xxC1adgfG6MTgWiup6lpBxRK6b0xeCm0FgoZM0b991qycCSwX+
	 6PuAZw0suufldYUg7xSnYDAKXE59ZRdub+obtBtQA77++CjdukElXyx9vbe+2WgnLVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lh8lpilx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.59
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB1F606A31A;
	Wed, 21 Oct 2026 12:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lh8lpilx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPCwm/WkQUvycdXnX7QkdgNTovpXNDPZJH2OIXyPiAitZtCbqAmeFWzUPMTjrkfXTyQNuwzx/D54t57AUqLPeA5CQLIBJ6RjC8kdRyqcoCwtz3vLQYmFO2HAsadPAh33CtorFzhbdj1Nzi3aXthmDrMgdSYo6TGVmPC96GukUS7ftSuUatY7V9YcxkyRerfz7XihJ1GMI9PQwjDAIs71TDdT3GSYfrGckWyg4C5p4AjfxcMQTvkN5HSJv0jII5TlTKJZwXVCmUScdFaKGnqjK6x/ZrJANSWTIaTno4/wCxgGFfMBeinDmXdFnVdAAiN2rJmHN9+8NuScoaFyjuhs9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fu10l1/Okl7eOsc4INefiN1QUMRen4gczIg2g3SDI7g=;
 b=uAFrbgr0oewZCRHwd+OiKi2E6Yeacd0jnnBIAsYxGNG580is7BVtwj7wg7c8vWSOhV6+7IRHy7xc6eCe7c10tulXQVCKyX47RwMw4zu0PdMlWVeQMWTJ7G2pn1bQdsH5yNdCsq0dlls4llfj8+GqLCUSA9gaW00bO98ACwugLsHtZbA0793Zu2TX+onOCM/y4v27CY+bVNUcHxqvI0kLwVTLLuRwd8TBaIbTRYQkO9LE1KJAbmHhvAUdn2pEV7sE/UzbkLpA9B2cZvsMTGnBnx6CMR6lvHbM8jkiGcwiDKbkR08cZf9q4TExfp5L9h0I9o//ampFb9GGmf8H7+tuFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fu10l1/Okl7eOsc4INefiN1QUMRen4gczIg2g3SDI7g=;
 b=lh8lpilxHZWVTlm7F7C1erP9QABr25PP22qH+5SDQI00vtGNHqctF2cXB/jV9gPDtoc3aXTpizXKZV/USPsqka4XIxXJ6uAS2LiSbrZ5XrLb4sEvhDmJx0BrLiLnfewajoIykTWF2sup/+ynHJxMy2jOLO33cOCcNtcIirJPzy0=
Received: from BN0PR04CA0031.namprd04.prod.outlook.com (2603:10b6:408:e8::6)
 by CY1PR12MB9582.namprd12.prod.outlook.com (2603:10b6:930:fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 12:57:33 +0000
Received: from BN7PEPF000000A5.namprd05.prod.outlook.com
 (2603:10b6:408:e8:cafe::44) by BN0PR04CA0031.outlook.office365.com
 (2603:10b6:408:e8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Wed,
 21 Oct 2026 12:57:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A5.mail.protection.outlook.com (10.167.245.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 12:57:33 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 07:57:32 -0500
Received: from xhdrveggala50x.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 21 Oct 2026 07:57:29 -0500
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add xlnx,versal-xilsem compatible
Date: Wed, 21 Oct 2026 18:27:20 +0530
Message-ID: <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
X-Mailer: git-send-email 1.9.5
In-Reply-To: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A5:EE_|CY1PR12MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e538bfa-6690-48c4-1827-08df2f72df83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|56012099006|11063799006|261009223027099003|261009221227099003|10067099003|18002099003|6133799003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	6bM6psMjA44ORYWvtk7VsexqaU08Wxh2UABy0iamNr697TFGjKoUuGdyycjX2HXZWdwvGeT2H3Rwc4+AJCbesPgpAGzAHPmPH8VXYaPD285BRgEts77jpy0hyYYxsYfcfrgHXB/3gXIroPntXTimCzzTspbiTgIRlDKwzIaJvqSKI0qHQalja4YyXjHV8JLHhJ0xJxJmDwYVnjgbqsf2Mn1dJ5qIjtY25GTfrA1jBRfwj4UfMBwH5iklwYYWkYWMMirGuCa/e0hc5deFxNFQvMUM7pFqGp2ktvYB2Q3Zy0vJck0/DWQFNctF0rrh24ZfDQx+5WsKXDYcQAGX6ULn5xqgY053zHFWFt2mE56F2vee2rPevi8Kie2Wr1UDBaBzq9ooGHUJ8XesWrLcw9VaD3M7PmVuzaSxsiXE5QlcPrvxATsMg56JwIWGpYfgCCMlGWPEMiSstYS1h3mCwxkMX+XLfCce67LaWo6eTozBaXwpNExVfNh12fVurhhkVzsgj8UezftXfmCGWl60D0yz94wp8QBc+cYFyDDEnWRGnPkJ3FHOqO7onIiu8rIi9EOPTRPieP5tUIm4x6a2SjVRdGMZAqK6pQYvRbb6eTKUhGULo4ZZqWLYa4rg9TmI5eSPJbdm23RMcwUSBZnLYfAjYg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(261009221227099003)(10067099003)(18002099003)(6133799003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	24kmnBB2CcMiuGdmMzP8fhfuCDSDnzX+iMfqW4MqJZBOr0JI+JevFIB/zd7YOYlDIpgy9f+tCWIsc5fnsCR8d25IsfNZdh/uDG8znZ7hDKHYGnSPFAUffgcPSbadMhn2eXEK9qZitGYb0k0DkgKyk0r4PR2c2gDUo4VvwnwAC3myghDdRQHa3VUaminxn3dZQ6HIIqUyHYVMtIDTwjXPWxhxAgOZfifOU2YV+RrWA8rhyVDI9xlKSnlvmxNuWmrLt67G1v0m+jxqDiCKmaOHjR3VbcaunzZHH9OaLdJ3E6mTcdG7jTtsKzTlThFP0LSfvDqYGA7u6aVsD3IoetYtEU2nHmyjERK9PYd7DlEXTaWb1scUY7Wt/9eQLrZGlbID3dFOHptKPHU4KCa21Zklf7W+zCppQtbqfKW8EPTxVcqQu0Gj50oPEU503L72eDBz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:57:33.2148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e538bfa-6690-48c4-1827-08df2f72df83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9582

Add the "xlnx,versal-xilsem" compatible string for the Versal
XilSEM (Xilinx Soft Error Mitigation) hardware block.

XilSEM runs as part of the Platform Loader and Manager (PLM) on the
PMC and detects (and optionally corrects) soft errors in Versal
Configuration Memory, notifying error events to user applications.

The new compatible string only needs a single register region and
does not use reg-names or interrupts, so the schema gates these
requirements per compatible string.

Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
---
Changes in v4:
- Added a new "xlnx,versal-xilsem" compatible string to the existing
  xlnx,versal-ddrmc-edac.yaml binding, gated via allOf/if-then so
  DDRMC and XilSEM requirements (reg, reg-names, interrupts) are
  validated independently per compatible string.

Changes in v3:
- Merged XilSEM edac with Versal Edac

Changes in v2:
- Changed "xlnx,versal-xilsem-edac" to constant
- Removed "compatible: in required section
- Removed "|" in description
- Removed "items" in compatible
- Fixed indentation in examples
- Updated title and description
---
 .../memory-controllers/xlnx,versal-ddrmc-edac.yaml | 64 +++++++++++++++++++---
 1 file changed, 57 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
index 12f8e9f..b5dc320 100644
--- a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc-edac.yaml
@@ -4,25 +4,35 @@
 $id: http://devicetree.org/schemas/memory-controllers/xlnx,versal-ddrmc-edac.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Xilinx Versal DDRMC (Integrated DDR Memory Controller)
+title: Xilinx Versal DDRMC (Integrated DDR Memory Controller) and XilSEM EDAC
 
 maintainers:
   - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
   - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
+  - Rama Devi Veggalam <rama.devi.veggalam@amd.com>
 
 description:
   The integrated DDR Memory Controllers (DDRMCs) support both DDR4 and LPDDR4/
   4X memory interfaces. Versal DDR memory controller has an optional ECC support
   which correct single bit ECC errors and detect double bit ECC errors.
 
+  Xilinx Versal Soft Error Mitigation (XilSEM) is part of the Platform Loader
+  and Manager (PLM) which is loaded into and runs on the Platform Management
+  Controller (PMC). XilSEM is responsible for detecting and optionally
+  correcting soft errors in Configuration Memory of Versal. Whenever an error
+  is detected, be it correctable or uncorrectable, XilSEM notifies the errors
+  to user applications via the firmware's event notification interface,
+  rather than a devicetree-described interrupt.
+
 properties:
   compatible:
-    const: xlnx,versal-ddrmc
+    enum:
+      - xlnx,versal-ddrmc
+      - xlnx,versal-xilsem
 
   reg:
-    items:
-      - description: DDR Memory Controller registers
-      - description: NOC registers corresponding to DDR Memory Controller
+    minItems: 1
+    maxItems: 2
 
   reg-names:
     items:
@@ -35,8 +45,39 @@ properties:
 required:
   - compatible
   - reg
-  - reg-names
-  - interrupts
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: xlnx,versal-ddrmc
+    then:
+      properties:
+        reg:
+          items:
+            - description: DDR Memory Controller registers
+            - description: NOC registers corresponding to DDR Memory Controller
+        reg-names:
+          items:
+            - const: base
+            - const: noc
+      required:
+        - reg-names
+        - interrupts
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: xlnx,versal-xilsem
+    then:
+      properties:
+        reg:
+          items:
+            - description: XilSEM (Soft Error Mitigation) register region
+        reg-names: false
+        interrupts: false
 
 additionalProperties: false
 
@@ -55,3 +96,12 @@ examples:
         interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
       };
     };
+  - |
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      edac@f2014050 {
+          compatible = "xlnx,versal-xilsem";
+          reg = <0x0 0xf2014050 0x0 0xc4>;
+      };
+    };
-- 
1.9.5

