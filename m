Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEAE5964E4;
	Tue,  8 Sep 2026 17:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887536; cv=fail; b=oGru/XgkLNyJespDK9IF7l3dW0JwQW4DJYmUm7KpCGlhFOSCQJHPBcHBPrUDrReZmv6YXjYyRWgx6tH8LK8r7Tsg/1O7+R0jpWs9n94zaKckHhYlf9lkPpVr7qnKn/g7ha7CK7V3P9CtyV0C3Pb4n7PsfKmGWaag+U3cuUOvF+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887536; c=relaxed/simple;
	bh=vvA9iofWpyFfYhGD+IBTa02aUL1Ln6qQYNWwaH3VbPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XgdEahMYwPWlt5Cij6ER110iaZFmjiMBQ9/yOeOzlHda2LWjyTWs/S4NPeeBs8KI6/4qL5AQK41RCSzAKlFlsVlFKNQKpltgi72FY9Jw447QdOoLiJ7XfZgVSJsZp4CWhab8ICtsrDIz785i1qWVQe6OJLelLt+1G+/o+wqJLa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=PwrI+Kkd; arc=fail smtp.client-ip=40.93.198.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="PwrI+Kkd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJlgQDWrJK00vaEGlYYd8XBYDNZ4wMPq5faDRBPaaNE52h9pNYg5559kH+eleTp7TeSggauM6W5/2bkO8A4PuYyGKiT74M6m/BX8ea3OWpgABE4NrzRGzHt2vErfxBWVGBo49nQ2ZG/ztypB60Nfod/Mr83uIkIukyUUqw6CphBEg1qoWH2Vht3uPDRrltaIL1nMt/9WzXZdq/bPg7PLasJbySmlh0MeyA3RkuVUYwnDiUNAiT4AW8FDbsFCe5ZMediS48C+1pEIyhzPT9sAbKM7hC+wBRALDS+ta/DflKPn5i1PgcVMFdVQf/VO9YftKY01tP/F397cC/daxtlaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddaH/pSq7u8Glyb5umhHMwNJrp0YmY6U9QpkUtKsmCk=;
 b=ZkqlIC7pJz+NJbQyx/GIctA0P4Om2Iw15wQzapFPcXwbkAaIOdiIpyweesy0H7YCvvt5giGQXzmHOqNWZON17mmqJPuuVwItw7izaRybx3XmsGtSwB4oS+55FvcCwkua1OjY3eaFYThB22BB4yIr292tKYbJec/qsDNfoDiS5CKjFtkLNlRJXK3a5V7juPiXGPyAbHYi1s8qMHJ1LKxk8+5VKU6pHfVt7f3wl2nrFSiQyLucmot5+R0Ic/IRkpQp+/D60xMeyK8uM3scNoroz1B1bde8zaRWFKgDOdBpAfsL0IbLpy75r3vHb1Sa4B2KFNIQ8vpABbZvN8pe7886aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddaH/pSq7u8Glyb5umhHMwNJrp0YmY6U9QpkUtKsmCk=;
 b=PwrI+Kkdcys50/S5yTLUBQrsaJDfZn1hBkY7v7Dy6OSipthijENGxotHqsWueP2SChTt5IaEOcowVfUX3sG4EBbaCk5XS5uA6ZJa2Ea7lTL+ezsBKh8SINwFKNrpafZlTxDjtYNf72W0Bk72rm1xktd16nAu5sMFIPaOi7ArsQfjB886Jtj5jDeiC05iiyA3fqPLux5LpSRPm3T3cWBoPRD6icUS5EB49dgfeS/KpAOheGboz61LlMHMwyDFsyH95toEUAKH6okkgqs9zHsbr3rYt32Y7i6XCQVnwtjyo37gIef110OP3q3JQhoIkpnU2Vj+KhUEeR7GUtvrqLrlbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Tue, 8 Sep 2026 17:12:10 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 17:12:10 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v6 1/4] dt-bindings: usb: add Altera Agilex5 DWC3 controller
Date: Wed,  9 Sep 2026 01:04:37 +0800
Message-ID: <44ba8639fb41b7c576c0795cb1474a6797754600.1788886615.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:295::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 23069ab0-52ef-4937-e2a7-08df0dcc518a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|3023799007|56012099006|11063799006|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	1KC/U8Afk5sWZQx7pfVdSZCewmVld3JNkyubhRn+uHpbLloLi8ZstAmegNyHq5viBCh9GXRhNwKpwxwXO5avowap9eElhqUfjwkh2npi4ZMNTvxOc9XgCkM22egll8kIBUukejgFMSU3pmIrXqwBFbxImsd/nA2hH602xp3I8EX6qsI+MaZEURD/X+jXER+kXe9rCDC9Hn5jZic+YayedhHsmfRPbCsMRyqDq1zJAEKqzQmkK5JlvVb4o5CGYikVN8WmsZQu2TN6G9WezK2gf6qEc9/0mvXO6hyi0bj56jS805eFk2Y9hassUqlYm0BiGfPP9/groCuPLFO2BGf7nNDap4yPviRVlZTDnulmbjPasallD+fSLfFuSLGO8EpfMn4GMFA802aml1V5ePgkhCi1a1127vfbJggXZftv6KqwraiiAP/taMYQuvypwWgQ5EvbBR9Hd0od2SoxzR9jlMb+lAtUja1vBZdsJoT1eOd0CRQeu8v53nu6aT+tjDrV2oGNCngfxI9uC/fPDjxQuWQUVfK5lUw5ltjgavK4FMRh8Xesqg6wSauRZ2sH3JgXtQUu3sK7OW1/yJ2nd/Q1z4185HkHKoRCd2MJ+fQwijU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IgFts4RwR4OCI4YUL63P1i9xmT1leMxXzA5NWBO8+5KuY5e7198qmbcEqgvI?=
 =?us-ascii?Q?Nsc7XtVPxZsu/7ShAOiiIBenSpD8cCgInQXgm9YTsprMkSH7i43hhI0cFunE?=
 =?us-ascii?Q?ty8LA/JVaqxpAhfO12ZmowudG40xCN037O25TweO4HVUswlhbo+MWlyEct+Y?=
 =?us-ascii?Q?F0WP0Oz+GcTptBYxcocAS83kLEP7UJCEaTd10g1+8RqlqQtp4o+NSPPXggLO?=
 =?us-ascii?Q?oxxU0NBbvBT370ooUJhw6UzNHsGdeGNLgAf7RK5UYCieNqEcGxMktzBxUisA?=
 =?us-ascii?Q?uoI5mjkXxPrjFjK0t8vvxAY4XKE6MEs8YKq6uHYwJS5EmUU22pR9mPdlKKNt?=
 =?us-ascii?Q?jVfr8j4+xXAVnD5cVB1+o7FfYUc89/BPOB58ThwhLh+R/lysAs58oCyb8i0r?=
 =?us-ascii?Q?MSkDdKo7I43UvJiRh9YlzaOk6ibOEMnmqarua7Lsx+AN5dD0VsulBw6Xp2y6?=
 =?us-ascii?Q?h2DYZfh+70+uBtgP9Bg8mPP3HpNjDxowqL227i/Opd4asJ2cMaG0NSOPgxAU?=
 =?us-ascii?Q?IYTfqmYJmpyMlJ1RiHyxx0DgAWUA23IVDo04xasQk/WUmgI+B8QRK+MSS1J/?=
 =?us-ascii?Q?yitq6jMuYXYetODO2h85e0rs/fVBwcb7kb5MVG05SMugsrAAe+VdCYgIEeZ0?=
 =?us-ascii?Q?Y3eBAeLQWjuthbFCsexinModOWaI8g9PH2xMfAOMUGfo+wwNzqy8EFQYgmYM?=
 =?us-ascii?Q?Pmxeq0f7JRiL8CfxBIdQvTpK/GpYY4fnw5O99jJmjFYr2hLpzWiUqDHrN/48?=
 =?us-ascii?Q?yN6Yf1gfPckSS7CF0sns49IrBEPA5bxuc+nPeploZzRz3pLo/4k8zk+D0dlA?=
 =?us-ascii?Q?2F/7pAUj5PEvPQA1hVp0Ys+NSQFmN7v7mtAs4DznA5BMkbPCoDIEiaGs97vH?=
 =?us-ascii?Q?ITfLVNBz1n5aO4ePqsZx/wITwz6vob2ngR95/9NvQr/K2AWcydOGfddramHV?=
 =?us-ascii?Q?bQdrXUmRAeJ2p4e1ltXwOMT9VuJBQUR7mA+icZCck+MZUDmkJkzNwLh8IrBe?=
 =?us-ascii?Q?l5NGLSu2Z5/NU1IsTcrYJ9qZOmfZM0ErRpz78dI3BGuzDIYhL7DfQkY97Z/S?=
 =?us-ascii?Q?LkuU+4QNS0V8kM8f38yqdAM+Twb3nS0c4xduZTTirUm7g7Woa3GES0pb43XG?=
 =?us-ascii?Q?foBpL7RqIqjhdvaVRz4Sg4hhc7w50dILUyqmQvpOGlP2Sm8KAEK44vGv4CFU?=
 =?us-ascii?Q?EpZvO2qD/S3w3g9LuijZnMMQORWbxS2C78s52Xm4qoa8UdNN6uWPKTlmYp+x?=
 =?us-ascii?Q?KLGBEW8UVvRJGQeuGuJc/nG+sOmXTIIvooc62ewRN0T00bkg2kmTKOHCtOoL?=
 =?us-ascii?Q?bWrRKHwr+pj3KegIT7Ai9Ipj+OIPsJ364pi8x45LqVDl/SJpU7fN42w1/8BZ?=
 =?us-ascii?Q?CEPT6zATkILzwk5ACv9eiPgqg5w0ipFizveCytrcXyO8GuCMhmAeWwCu4IuZ?=
 =?us-ascii?Q?C8hdWNoxA3UXWKPmIo9rCAKa9+WUyjKwyqCuuwyfif7D7uEzG8siMWg7hqYL?=
 =?us-ascii?Q?+51W9pvr7T8JXNTlMAMinaK3JuU2sfZznZE9GGZosAuIlmUM48ZYkO5OfXIE?=
 =?us-ascii?Q?lr/LWkNqOX9SrkLv6WpHZQznH/ujFaWP9oFExSMWuTYHHbp3UxGMqGjlNcNl?=
 =?us-ascii?Q?lZoK/qWsRrSdlyP1lEtUkcszhuwQqjeAMtGKSuWk80UVeYolJRP1Sp0vxZ9B?=
 =?us-ascii?Q?A9tb0zV9izGmm0RlB5nZf/XZ6AB2e76Ox1o6T5NIljjHhesTgtYG7MDf9C2e?=
 =?us-ascii?Q?RyTbmb+Fmoq5sME8vd8HZl74QnaadHQ=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23069ab0-52ef-4937-e2a7-08df0dcc518a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:12:10.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RhYwwtC7I9itLujFO7VvJ4xskDIUQSQfYYpjK4E+6NtN+NG5psWQILnRW43diMeGqhLntyFfwwQiq3q9Z827iUxYxK8zGoSuzJb8qT/5gY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6560

Add a binding for the Altera Agilex5 SoC integration of the Synopsys DWC3
USB controller (compatible "altr,agilex5-dwc3"), covering clocks, resets,
PHYs, and optional IOMMU support.

Clock names follow the snps,dwc3.yaml example order (bus_early, ref,
suspend). Reset names use core/ecc. On this SoC ref and suspend are the
same hardware source, so the example reuses AGILEX5_USB31_SUSPEND_CLK.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 .../bindings/usb/altr,agilex5-dwc3.yaml       | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
new file mode 100644
index 000000000000..610ddcb632e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/altr,agilex5-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera Agilex5 DWC3 USB SoC Controller
+
+maintainers:
+  - Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
+
+description:
+  The Altera Agilex5 SoCFPGA integrates a Synopsys DesignWare USB3 (DWC3)
+  controller that supports host, device and DRD modes.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: altr,agilex5-dwc3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Master/Core bus clock
+      - description: Controller reference clock
+      - description: Controller suspend clock
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+      - const: suspend
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 2
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: DWC3 core reset
+      - description: DWC3 ECC reset
+
+  reset-names:
+    items:
+      - const: core
+      - const: ecc
+
+  dr_mode: true
+
+  maximum-speed: true
+
+  snps,dis_u2_susphy_quirk: true
+
+  snps,dis_u3_susphy_quirk: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+  - resets
+  - reset-names
+  - snps,dis_u2_susphy_quirk
+  - snps,dis_u3_susphy_quirk
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/altr,rst-mgr-s10.h>
+    #include <dt-bindings/clock/intel,agilex5-clkmgr.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        usb@11000000 {
+            compatible = "altr,agilex5-dwc3";
+            reg = <0x11000000 0x100000>;
+            interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>,
+                     <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
+                     <&clkmgr AGILEX5_USB31_SUSPEND_CLK>;
+            clock-names = "bus_early", "ref", "suspend";
+            phys = <&usbphy0>, <&usbphy1>;
+            phy-names = "usb2-phy", "usb3-phy";
+            resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
+            reset-names = "core", "ecc";
+            iommus = <&smmu 7>;
+            snps,dis_u2_susphy_quirk;
+            snps,dis_u3_susphy_quirk;
+        };
+    };
-- 
2.49.GIT

