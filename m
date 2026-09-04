Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97D37187E;
	Fri,  4 Sep 2026 08:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512020; cv=fail; b=QpZncWWWlCClGaPkLLWaGYVIJp/958o5gdk5HA50ZBCncWjec87pL4O6S9Q3nV/q1ISVEMHxYJqe31gYk4VKN4eQH0Dm42Wzix+UlhpCc3KMhMjqsWpFhMX+Ja4WPc15YP0Mo+6dIUaKw4mbnKzH9DdlEb3OMbG6Lo88W3wYqyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512020; c=relaxed/simple;
	bh=P6/rScBBnWn4sbcRzeISRsdOSs8qQIa+F5H5GOFc8QI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FDnHMizig4y/H2rtXze7alBM9sWPG6xFIMo7M9YKKI/w875+O3YpV7JUR3olLUd7lq//AFfP6eUgjhIZ9U9gKyvb0sKZRyPzOQgYW16Jd1U6f7CVGDUVpPY2o9rdHiJI0It9o5Gexw7hZjErLkr36n6S9/VU+TqZJwORaqfspzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ZUg4iSne; arc=fail smtp.client-ip=52.101.85.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ZUg4iSne"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgE8VOkjQYGjuiCNhg7Vd+16ZeiUcPKP1Whc2f9AtpGC3GuvJY29ysGtZb+lYtdrNrW/jHSDNYWZpgKLwI7Ww2mp57Eb0pFg4+euvqZ1o4lK8ZVQsWID0SoDQGW1UaSuD0Ji9MPlcDA8RrcC8osoR29+GngddhXH6C+WSscpHswR2w+kE5YQScmqkeGJ18BrBYtKY7mNmvzIEY+Dz5SpT7/51HVBvbGBngpDbfaOPFYbiZ3/G/7TQLVxc6hLwhPnPbNvWoP1XoYaikpfsZf6jCIdozqjTjQOxzr3RBZlQeCqTBz6RV55jHjUVDe9igs7vlACBgUJqsIaBYbFYFHdbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16SzUWltQdaDxpK5kg19GJD4OPQBOuv+8SHqvxbUBQ8=;
 b=dENkBs0eJzDcBqQdXT8rZUEnV1BEnG8rgBUUfHCRhweGNUdv/tnySFIA65QC46silTQaRlSEa7w4VKFuWZGSswWUFChT9bq6U/dsYBmySL6LQGIkKY7XlYEFrW3MDGvcZPqxbmY4d6k2C3XKoq3VAEk7wrt6UtnnmoSTv088/OUv4ICin9ekEEMkrgVzTVAl+9rV28eZYuRITjxaJ2KXhqiPCAnGKQM49uCofmh/b90XiiUNTpq/HgIR6y5Ae5dwwPwFTFIpqIweBtU7dJEd0/aMbpJZTBND7LWVbrzxtFvbjMAo3l8pvKS+DW/vuA6wMiI3gF+Hr+1qu/HQT1M5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16SzUWltQdaDxpK5kg19GJD4OPQBOuv+8SHqvxbUBQ8=;
 b=ZUg4iSneulosAAEfowiTmHO1i/02sXJkB8dK34qny6msbgDGQ4+q2xfU/Kyp7qgrs4h0P57jWANS2KO+4s7Ho1ku2vRnnVQaO7z0qPt/94WITjwAVj2LZsPepf0YGRo8xEVL7hMg2R0rbWsctA62bypl/xA7WpJD/urLFsmwroYQ22l2+Ie0VnRy+tDDivctYr4znsaPCjxje6oNwEvlZcrC/CHkex9lZJPSmzgaOVwvAybJuLyH5eQL68JTx+hB0qDxTwcN/TGmo6xxRmcrdeT3i5FtJ3DGHqWT3SWNeZLrBV1X8H0IGnBIzcfevujMjg/498CuU3Yp5EzvKPvsTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 08:53:36 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 08:53:36 +0000
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
Subject: [PATCH v4 1/4] dt-bindings: usb: add Altera Agilex5 DWC3 controller
Date: Fri,  4 Sep 2026 16:46:10 +0800
Message-ID: <56c7cb879f6c1b8e835a34522a02f55b9178c3c2.1788503540.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788503540.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788503540.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM4PR03MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d39ddf3-3797-4d11-b838-08df0a6201ec
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|3023799007|10067099003|56012099006|11063799006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IkRmmQrmFE+FLbjf8JxCOvaep2pyXAn79TJpz4ThAbdEk5Qmi1OberUTUwAXPhlgTtTxmtRwsdkp4OatfO8nAEKI4XJhb2qtcfrkE+I8dOAR76X9FjanvV+96VK3vFN918vBjBjhiYX+Gm09c7znbmDhExeYCHNphPSGApajK+Jtf2673UEL84mHHVuIw+9NKYMJNGwmAYiaHeJKI1A4p/OvEXaQQ5AgdcczEryMV99rtLvkaoZ5FS/nvamFd5wgLH8xTHpwXwA4lByYYWWr/pbmJPRKSYJHq76F7B8sIM7MUbWqtWM2yrbrzwfUZQrFOxg+woTF1xWspTlHwNhIQZrUWFCVQ6GDV88xxskBrgF8I594sEeX0gPH2u9URZwIv8ime1+CD3+akOmrvS6DHsxtxEOiapICiHlLrWO4f772K8yQzpSRqCAnCHZ+1Msz+5wzAYMh9BABBhClb97AF5tfTh3VI3dLVONd4hKMvX29A4eGlCtf7wqnO/hxdL3GRpx+8EEcyx0EHWE6U5UlTsMSzGmrnbjT+F6qg8tsH8xdXw2hNpNTK7QPgIDHQiVdn/sLJLd5/Zm2qbA1mQ6uIlIOUUM9w9hFojuowMSdBzs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+KPHsSX1r776HHLxvCOCH/nIxdJeyHhBVUr+uBOkHJW8C0elKojVNxXBbbbz?=
 =?us-ascii?Q?LvjSeDksphLINRiDUKTElUa1ySNZXYOS8u20ydjTDLstE6nH5jl8/S0z+/9m?=
 =?us-ascii?Q?wYCyCQCnDNUrCdMBtSRtaULA55MKk5cXdX32OqQJFM3Mu5jrG48p3nd9GgOv?=
 =?us-ascii?Q?qyyaly9FvjRLz6cAw/2ljApNvsrX4rnfk21nsu+QicX/BDkscQckpr6oyuDY?=
 =?us-ascii?Q?tOtLWoChXiq8krqIH1pxr9CnRPfExgwM80ZkM9NKH1q/3I2nDyYIxJyGtUeL?=
 =?us-ascii?Q?1eqeuWNY1VzXoM4vBVMo0+zvOhIXpsr+6rGKTOOvu8LvG17/wYdinYb5UT8A?=
 =?us-ascii?Q?PxgLq+ahG0VWvqamjUXxtlzfucvZs+pqbAPsyp4xewBz9Jhcf12Mi+MCcsAU?=
 =?us-ascii?Q?+1RAOPEv8k924UDjqEoyGR741nWuAUXl9e1W4OMkqEgHPI6iK8L/0dLJTvA2?=
 =?us-ascii?Q?zJ5Io+iuky/3B7T1Hs8XEVbTaqn4LUouqde24ZfHol3YE/6M5VM9g/fH6IYv?=
 =?us-ascii?Q?6akkWzPa96juf8ah0iQ/n6vgVHp9UaDsy8BgLqERUMZXUw0dp1B/7YbBvX6N?=
 =?us-ascii?Q?5XUt2D04ri3rDwN6YHGDe7PLBRXylzubQdmAtriQ/H5DWWMmHbdox69UklQE?=
 =?us-ascii?Q?V0j3Y2GDkeLt2uJHbWsjybdKmT1lLyuy5PkS+mjSmMasKL1sga2fM/5XXoJ4?=
 =?us-ascii?Q?b9FTYXSix46uP+3lB6HqadfBMywMIOWR8iWpmp3UOmeOWsn27W+OsiQJjBcO?=
 =?us-ascii?Q?mILtejVGvAUY5RjCn9pynyee0j6vu6tGdMQRKvDzbseoo0bpW3F682JZIsYO?=
 =?us-ascii?Q?nMoCYOqvvfp6aMF0vmvSFoObH2KVUNpEA4YZFHAtwDXcdCt6kDt+PxuYiBUZ?=
 =?us-ascii?Q?aC2lWsEL8QqpqynBm/NuMzLzKXtt2/4ir95S3LCLF4yb+2bdv6VC0d44/lms?=
 =?us-ascii?Q?G9aUY1WZ6GmoYvour1KGc2Yoiv7MWTIXBqpAFe+Umf6riIunELItYmCiMj56?=
 =?us-ascii?Q?fMSc8vWO/WMYRUTu14Eeh4N7VqwLPF44rG0L2isXcX93VooEBASFEt6SfXbf?=
 =?us-ascii?Q?CcRyFnVgrqqVH/1T93XYx1goM1gDc1el2vp+h6WZTphSvsZADhSrlmdAyb0n?=
 =?us-ascii?Q?bWFmOqk2P4yJIWsF6NdrRLP6OYBG/PeywI/F34iPWpl5f6nffy3aVrZ9BKV/?=
 =?us-ascii?Q?+ncL/dWubDPJzjaJz3IBZF3b+SQJQoPqjhCmeo540uu33ov9RnRkzHehfAtq?=
 =?us-ascii?Q?e29Cq85OuoRZ/PTNowr5XU4Ji8anIqvi9fCu4Kz3DvMMA3FT+R2wgMfBHiGs?=
 =?us-ascii?Q?p2XzWLtqB31mgOhQJcKcp9Bmedb8RdOSMqcR6sdkgaz93CPFQUcpb9LvOkvN?=
 =?us-ascii?Q?5elv2H+lLiLBV/JPoAMgNJk8z2B/FmbvMSlMA7SD0nC0YPPmqoIPz52nl3Pk?=
 =?us-ascii?Q?TT5IyVK8nkMIMx/v0fvGGwS3UPgo0Q3M7ISZeiZaYw2HbQRRmOv1214WBI/9?=
 =?us-ascii?Q?IkXg8BOpypuNAMNa2nmEN8iVO6c/EgN6qvNQrlUMzb/MPxIUvhW4amV6DPNS?=
 =?us-ascii?Q?QCOyBumLfUZ11+A3ePFswyQIc1mp8Zp7ljwd3wTzCIwz6jjcPa8E+WdWcO8V?=
 =?us-ascii?Q?9rxVu7VwnL4SbaFghkZsGsZ5/jSMpyvMGRgHoK13BMLKIjqDjkQtYPQqQlaB?=
 =?us-ascii?Q?i1GDvvXYgF9geQFgxb2KvqZ/7V0UQLCT71fWFpKPcFAmoc4eEwRwTD0G1jOu?=
 =?us-ascii?Q?wAffajPg5T6qEfAZWYm3cQbwNyp5lo4=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d39ddf3-3797-4d11-b838-08df0a6201ec
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 08:53:36.6119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydYdMi1sGgWzymIpnwteAREOOjJWBauggxO3BsMwAvLhp7ymal8K39UZ/fv6K00JQGwjAue8CCm16+JwglK4m1mFrBdG6ZyJ2HrzgD/OIbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5981

Add a binding for the Altera Agilex5 SoC integration of the Synopsys DWC3
USB controller (compatible "altr,agilex5-dwc3"), covering clocks, resets,
PHYs, and optional IOMMU support.

Clock names follow the snps,dwc3.yaml example order (bus_early, ref,
suspend). Reset names use core/ecc. On this SoC ref and suspend are the
same hardware source, so the example reuses AGILEX5_USB31_SUSPEND_CLK.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 .../bindings/usb/altr,agilex5-dwc3.yaml       | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
new file mode 100644
index 000000000000..e172706474f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
@@ -0,0 +1,100 @@
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
+
+unevaluatedProperties: false
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
+        };
+    };
-- 
2.49.GIT

