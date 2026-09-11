Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C6346A607;
	Fri, 11 Sep 2026 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117552; cv=fail; b=XlymfB7EVcQ7DIBa+Cye/9pJEyCh0ZE4MyjqFEtQanE/E4An91v62NG2qA3emOVUs96N6NzYjrXlkraXh8Rx9iUBffrJQZq1COtVWNKzAD+SiEpbNc3gdq9iS9BpdMX72hrpCs4Z+NAaz3glQrpmJ9iDiaIsrjvr2tFxskev0xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117552; c=relaxed/simple;
	bh=KPk/7rysKpWJZ/sDr0WYDyjZPRV8OrXVtNLGIeqrw5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JtYIfNAzfmKRL4FzqHCBb8Fg5LC4ryfpIg34y36tpVO1efQQ36GVrdPQbijjWmGu4G3UUjc6qhh0VIJRlGbgnAFcsqJpOtP1jpNPGVhyKNVMvcPoitAuFWHXcxRJkacYkrjVpRTMCSsD7r3sVMUAjprj7uh/f2n1xBl4FD422ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=hrHE9g8s; arc=fail smtp.client-ip=52.101.46.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="hrHE9g8s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buOdnjgLxKaWg8xdGxJq2apwlrgV2Ax/SS5RlZOottg+JCvav1PgBUu9ECTEkhS6qQq5uqic0AxSjqgO7Nu3lhK/kKklOlWYU0NBSE4pz0YNNgkvIZCWdyDT4j0AjY0OXRwomES4pk0qfNO+R8LSY0Y+ZbEUi6Z0/5JYHvrU61Odx4yNViTscW/xGhP368/hE6ZL8qi9J0r/7agq9qmXnXTYtFh+3p7H490He6chgOmEzvc+BpeTt3ApF4gRklDsv1GMH3Fb8p9KPEf7GSbiR737EkQxFiwZ1CNGEIuXq7mZPMnjQ3lFgFA7NIxCaT8zyAFI0SRRxx7f6tw48Vx0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPqRnKXt5wErampy4yZZUGd9dTLD+L8QlkhGLC9Yhq8=;
 b=ag0aBtBH8nAHKpsKkArimSe4w6UfwGlm/NUAvnB5vezJ1RpwcYZeUD0lDVeDfy4TQhtxlwa+8H41iTpLAYMqwQQV3h5Tt9xFVNjHZqJ/+p3Pa8wak/UuAn8yDYKPr3CB6wQHaPJoXszkgtvgqJKUUIOZrkvojbY0pt9PtyZ4aW6Pk5q56nOsgVU++7ONsFrSkM5FDObBYMTTgUBX0qfukCwJx6RWLmQGLL0OJIFkBrnEdY853TGozb5Rr4dHQBzvHpq3t0ekdcKWSGbCDhC6z2lTa4/Gl8vAbMtXPNPJ6u1ih8GesqNzWRYq4563OW877zKVPyvyoLfYUy3G4OHarQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPqRnKXt5wErampy4yZZUGd9dTLD+L8QlkhGLC9Yhq8=;
 b=hrHE9g8smV8ZuuFOeg3vHJEKyU0bP37XhB7fuP+QYIUdmGuB8mCQf2S1tN7a3nHF07khKcDFBXgziDS83KLIJ6fGa37xIrNhPkqsTnFLMOgV0kffyTadl1vUel2FsIePzH9lIqCXsiMhUIUhoALcePeqxyCNp0SUMXkVmrZJFBdGo04VTIZhvMGVW6ZCyhPt8IHao6So4KcS/TJgRLPw1IxPLRdOtLW+nzs0Y78U2E6ZJWkR7Z5qyYB3qqnPi39Q1zAPvTGWcQIoIVGe71FRDl/hpYCL5XYAqfXLfOybJOzDsHg0EurFMUGQ01tfvFcKgGcz5D3mUbBOx95tOPNOhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ0PR03MB6326.namprd03.prod.outlook.com (2603:10b6:a03:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 09:05:48 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:05:48 +0000
From: adrian.ho.yin.ng@altera.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: usb: add Altera Agilex5 DWC3 controller
Date: Fri, 11 Sep 2026 17:04:52 +0800
Message-ID: <0fbda23eb4a22a56e455b5e89125813af60ab0cc.1789114385.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com> <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ0PR03MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: cdeaf41e-810e-463e-673f-08df0fe3dec3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|3023799007|22082099003|18002099003|55112099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	8zqTtgmwiECFakFc77I8OqkSuxxxL4tfsTBQZhPs1OSPkJ5SdUTQCODg6Kgd9JuhpPf668bIDPkLPfoU+F//cRpzPvFiL/IdZwPKoqG0kLhwELL5RiEzolUngvZiRcax9c6P2n6ynWAKtLqJzKiAOY35mFJpnXuB1WjcV6l+ZFq6l05PiXscOOIhlJxfOK0dvIZFSZLxxfJdz8QWUUnYc+tfXpSCAbIfnzB1UQPPaCx0WRjU1gkUhbDgfHXDqZm6An6wJ1xI3z0uJJjDYr39aPniUsqIc6VFm4scIYkINgfaAdP4Rm/mDH1O4jQTUcezEyzpRv0KOVZs+wxZofaHYxEf5W+YVstA/n4lYyQiKt8QNu9cE9MF9lrSwmy+2uxfZkhYe/78bnVQr5t9qr0/+eT3NTrSTfSekZKGfU6QqNztEJioWBnTay3gdJ5gZOtkg4EoFtNwwPLJbJvpgK03k9RKF6kcId8TTK9+vdfJ2c3DYAmpjyWV3ynFDKB7h+L4MZfyVOFlfJCSrmOMeGFj3buMiJvDPS9r9XPGYOb2qkx7X3UOLul9RiA5LHXW6CLqGPfwIlt8e4mkSz+Y4XpFFchbOCORgst15rKZxcono/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(3023799007)(22082099003)(18002099003)(55112099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W18oMP1UeCZjvdzT5XyJqxRNjhnGR9rNtvauN6Fn23dhIZrGLHfWsbFNvyy6?=
 =?us-ascii?Q?7OxeY7c1xAM0xDIl4ldn0PyUAifbR3Nk+PNI3poTKZLMyL3GjSYE3UfLfSry?=
 =?us-ascii?Q?Itos0vtrGYxBAlKmS4dZ543qfhdv7gwm5yYBVom+dOvkwsvC58HGKxh4yeN2?=
 =?us-ascii?Q?pwxg7yaJLpF9WcIPWQGGhfgDNC6dMcIcNDrVhaIJ+X+9u+0loUuIUlDDERg1?=
 =?us-ascii?Q?Hd71wB8OTvu0NT2Op1EDJCEaMnZB4gcmMrbms+a4V+ZO3juMJ3OZLmbCdO0E?=
 =?us-ascii?Q?i8rOGNP1KB+IQv5h7WToMFTbjnbchTUoXbyfibddAMfZjgQXgWoK6GL6TMNa?=
 =?us-ascii?Q?glaBLLDEPzGoL+mocUvUYt8KojazEG4fdj+pvtM3U5Nsrw3gUt2W0bn05b0l?=
 =?us-ascii?Q?Yu8FXQih3MYPcoQxp12jI8u8fWGR9m5WK/Zd6KUt3FC+59rdgaFTCQ1/buCH?=
 =?us-ascii?Q?Qaf52pdglwWH54An7epVO8NhzCT4GFaLmgDjHnwT9i6pCuaVd/vp/BuXKCD+?=
 =?us-ascii?Q?/Fgr2JOxLghmtZmrHfk4altvCjdKY0+D9jqrN3yLTLGSgb9B4tPMbCth1zzY?=
 =?us-ascii?Q?igTwUdv4FBgtcR22lOUl2laQguIt2AZr1WgxjzUUpScHerFQZz3FqAjh9UV5?=
 =?us-ascii?Q?nmwVvbWsUOo6DY2E73jv0D43hZbokP3ZsJv/gK3jke97l17HCd8pCSWqJvqD?=
 =?us-ascii?Q?5ltW2XLYf/W9WCQKfKDWUnWGLzbN6p3kbCRWZhQdaWd6ENJNP9/2XngzKG1M?=
 =?us-ascii?Q?Tt+PKSYQeTqRRigRQuRhJxBamMtXFh4SPhqVz8dyViCVDaX0KkUm+tKvSKQj?=
 =?us-ascii?Q?NzMpW1MvtBIXmm1Cv+W490pNer8whdJkvPsPYIMwWgI4wa0LPeBE7PBYoo/U?=
 =?us-ascii?Q?qHQ4Gl5o1SrjNsSuCvyoyC4vmUhQe1q8oBocG2LIfkCnvL6ld9qwYou/4Q2m?=
 =?us-ascii?Q?E35NPxS4HiHD9zj8MmABhQDO3iX5NoyrF1rqr4lUxSOeZTk7lHlh1CXFKVV1?=
 =?us-ascii?Q?96hZ/neC48IN/kyx2GnQdsSzxd5gvLvfGOp9z/jspLDokxX6L+S43iugojI4?=
 =?us-ascii?Q?IBo16oj5rLD1j04FZNSdk0MzCdaMDR9jcSpAL/0waSrsiCoPwCBMyd6Itwly?=
 =?us-ascii?Q?9r9CpUvFeECZx+dVSf0EVAzXvF8Bhv7VY79PYoEddZnqehG+N9KbFVUn7OAq?=
 =?us-ascii?Q?Lpd3qt9HX9HT4iZNubZDWQeiJSn/PWXSn7dBvIwKdQpA/tIWsBoex9NtNiLu?=
 =?us-ascii?Q?tcc24oa/zK2MXojeFdJHTEiO1bb32uLIBxqfyNHz3E7gHZG4+t0QOwMle7M6?=
 =?us-ascii?Q?tTI/IBz41dZ7hhIVaZkmtpd5SSklAGbDXzfIvqvypwNvl5X10YW3c3Pm5BnO?=
 =?us-ascii?Q?u+UVBnE1DTgiIg0OQzPMsRmif3Gq2BE5tfrGC+yijkeZBQvh1WJM0QnXCZuB?=
 =?us-ascii?Q?pI6MS7HaRBw6vUWL0CYNxWG3h49hBOopc9yKi0X8eQFqH4IZe9svRuex5IR4?=
 =?us-ascii?Q?kzIg8L+ZjY9SayWrQfUhC7RiFTgcQuw/ra23QqvBuVB+87wiTbvus9ZnTqv0?=
 =?us-ascii?Q?srxU7dlZFbPFEKwD0cOi0Z8yEFQFBF7hFYUCcM+y45/R7+opf9/OzwStfrFB?=
 =?us-ascii?Q?INFs8AU2gY615LrVF4z/4XiBzEzu8hb8bG9lZbzQ/5r3Kk0yK8pWNMJRNwUn?=
 =?us-ascii?Q?6ZjAviRvvjQhM67b5j572yydkJaI33+RP03ARcERVj+Epy+UZb6J+UC2nW4q?=
 =?us-ascii?Q?zmQxZ0zmtCYpAyCSoqDYb3QI2Ef5Fek=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdeaf41e-810e-463e-673f-08df0fe3dec3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:05:48.0139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAuHQqInhVl3jAQROJp6F3HSJ12vsaRvSDloToF7/8DiegjQ2c7P22m4Deh8lZx8O+loQDnwkAlLsY7geuEzt28az7yJyWlrfGAtvbXYwWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6326

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Add a binding for the Altera Agilex5 SoC integration of the Synopsys DWC3
USB controller (compatible "altr,agilex5-dwc3"), covering clocks, resets,
PHYs, and optional IOMMU support.

Clock names follow the snps,dwc3.yaml example order (bus_early, ref,
suspend). Reset names use core/ecc. On this SoC ref and suspend are the
same hardware source, so the example reuses AGILEX5_USB31_SUSPEND_CLK.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

