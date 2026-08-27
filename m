Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011041.outbound.protection.outlook.com [40.107.130.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EAC342538;
	Thu, 27 Aug 2026 19:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857594; cv=fail; b=D4dTI+t0Uu2X1DkXO7wfRIn0Pg9hAJo1Mz2knQbOWiTySl+ZSxuTJHswhL692Nsd4FcrGLqp5sZD2zVMlFLpNs4NmZc2lJVWz46x+AyclKCV4wDRqg9JaauAMHRX3kosksUggDmNVt6lWMv+sFsFpjpH8VCP4DLc47zOQNrV4nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857594; c=relaxed/simple;
	bh=P7k1hvrwzc1DkZUviyq8xaUaZJn03MduiVlujJIbfMM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OurFXq7KC1v6jEpfLl6kGnm3Jl9iSC9egAWo77pZkstoh7Y3hakbVgrHFvT1PyEBtM7QPFqb/zaegu2bAXsQLUKxvhvhZrvbXbSq76wZhXpcrO4WxGsatWe8Pvu0uNeqPH8d+GTp/s5awz6dIVVmlKbSAQK8e/F1YCBiUhHIXGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QyRqXiPY; arc=fail smtp.client-ip=40.107.130.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QyRqXiPY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIOGTFA5jvl1xsFUl5lRA+8vLcooyBqNc+18t47PkU33ZKnXj4Zr1hvTcsc/WW3dQk1OGT5xfWejyhRVarLdPaPfqAtq+7ocByPPRtEhjimgBLiKYTrF2nO4Cu6N2o76OYkLeYQX4QVi5qj98kW4hAIi8E16iKxarTwlpzgI5d3bV8FYxngT4HjdKqCnXt4QOh8n1Yi5atlAdqAxoB60JO4bEOstLHx/H4LIETXcYFDIzS5gDC67LxUqepThKqBif8TB/Q5/FRJYKGeHSV2vJmbhGO2Vp0vhNZI9qJ7PhOS7RNTD9trn0KoQyGXmmAXUaIqJ5lGtldoyu9d1X7wWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJLTKFL4QygYLTosk5irzoAhNnR5UWjGu9zN+J61qTI=;
 b=T3f9RNUy0hjCD4xq1j4b3c9v1mGW5c68VDUxn8sNXHZGYltQRluuPpXc7XYxMLdvPXpgiBDc41dx9YvGpN51LUeevHI1378keKkqt4qStVTayGMY/QcQy4cw8rU2lifQMbEVtd39a4VSXCbtXDcVqEtCdQWMwv83m6SMpF56X7QF9FlCGAEXoE7c1Jw9Et+Af9gChIDiP1Vp/jcuPw2IDeep+9QU7FwjxyKQ9MWltT/SMQDMBjY07ai29CjcBVKxSnb29mb8yWnd78ms1MA3Mh45sj7p61HIYhTW+2Y31lBHxOwLMqMJYAAnodj1lCMgYjb/3RY6/J/gvxuMLf0v2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJLTKFL4QygYLTosk5irzoAhNnR5UWjGu9zN+J61qTI=;
 b=QyRqXiPYOwpKKN3Reu6QP9r1Kr4sWKTyviCgNYJftdp7FzNKSbNbdDLwkGgsadRS71osq1l5ZJ6KNIyTQOEV3tSZKvffYlIRQVLsgPr9EXftKWdZozGSS2M4kyz7EkYKd9co233Ji3Bg/Orey7cpXN7Zvm5NNSix6jt3Q4RjRkrZNir8jen6+rxkKc+AAY52sZhlxvSiVO82BRQ+DNRqpuGHhBwaThiDnJHljBnI+mnExoVQwQUeKJYqTFfNg4YvW9qzEDtI8FjBO3wHEwDpi1z1NHCp4k8tRc/hSHmOVtzz/IEqoCvzoONixw+8IH08fx5fOaewqm1Oiswp+GxG8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11374.eurprd04.prod.outlook.com (2603:10a6:150:2a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 19:06:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 19:06:26 +0000
From: Frank.Li@oss.nxp.com
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org (open list:OV2659 OMNIVISION SENSOR DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] media: dt-bindings: move ovti,ov2659.txt into ovti,ov8858.yaml
Date: Thu, 27 Aug 2026 15:04:50 -0400
Message-ID: <20260827190501.56673-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:806:d2::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11374:EE_
X-MS-Office365-Filtering-Correlation-Id: e34f40ab-8a21-4062-bc61-08df046e4b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|23010399003|10067099003|56012099006|11063799006|6133799003|3023799007|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	HN39liXj7gKjQzKT1xKe99beKRynBPRgDr4grXh0g8tDA8pXqq/kuPNv6GJbtimfgq5vW5TRGzSpIbGiK6GShFhxbCrm0dBjIc+CgvTuMWXS3xceL1lenI9ng9Fvrxn8CpmwrQ+V1cYaw7La76vOm9l4hnKqy6m7xUs4RU/ct1MpJ2XOskjR0NwGsPjiw/ptBw2c/DYmDB/YO8UXTxoxzu6DhPGe15v1xlrudUml6yNPOrheE4TokKffNAbZhGs+yDd8lMwUM+w8qvz3doiNqGokcheChBhLDO2DRLouZTVhw5lDrCp82VB1MUPes91Nva9ALdPJFjPzL70pKppqRTdm63u8YH1k7J3w+mtqdwCN2t+8oa4xdsMwdoW/mW/FmdUALxrPbV4jorH+LHipbmquws5thfw+P5ZnNxe5a7Dr/HAb5EWG4neYNnC5oFQtPCxQ+7GDkAcJ7xjoiHkVckP7pUIfkRdjdZeYmnb/VfegNZU6njus5X76vkilEpSQfOWLjoLIyzHU69qJtgCXgVNGsRupSh7+f+Y9Iz/jdWgXRK8/NUyMvdMoBoxGbX1G4P/ciOVGCwv3K6KDVNL4FuMkN6Q34xaGVFblBxdImrR53PooSCAV8KTBsFkzqajaBSeHPNcVdAZE0etrVev2/s5hVV0REfmHfVH82hbN/eo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R28ildjXQOVv0U9JpSsH3iIFuO7blgEYSi7HZm3ba7tePtlY9TXuGOMgqrMi?=
 =?us-ascii?Q?cg4kPGJdOXPUC1apqDkBptuZIe3VbTPXIv6sUwe3ZU1+7THmXnMe4kriouqT?=
 =?us-ascii?Q?C+rdl4+B7xnNX61ogf1KCCvacLMsUVDsPHO4V/05qt31Yn0SblGZUkk8sBJR?=
 =?us-ascii?Q?BEbJgyVhpCroQH8USE6DePuidqpi8cxlK/sshVgV+Bg+hmyj2YK8i4Xi6JjT?=
 =?us-ascii?Q?wphebQzrA0v8d2k0SCOKP33c9e+zz+TQDoMdMSd5bwkfl5frO52V/WWCVXjF?=
 =?us-ascii?Q?lFF9CMP033CTGsbsmdiuWHgJ4IdB2U68HLfRIy/lKq1S56u6ne5ciUW0PPYs?=
 =?us-ascii?Q?7c2cnHQ4mcfQhxJU7YbpLJkCmoFaBw98t80L80QbI4C4JgYvJpxtVa0TU4tt?=
 =?us-ascii?Q?9CuSq7XHNcScVRRxeT1WRtzxF+Zas3WkRQT3Z8ITKQM6KE1FwojHl0QEgITC?=
 =?us-ascii?Q?OPBxN9BZgdJRo3Vgx17NVxLL/IuKW2xEatKoeEjB2LWHXReZGSyPOjMK0i3l?=
 =?us-ascii?Q?n6Y8v+XdHmTDRmryfnlvhdPcBBBfbls0exTuXgOoxPBVcEUXTe2ibyirHu5c?=
 =?us-ascii?Q?OxLuGv+1Jev/1/VxrI317mJLUEMO0Q02gLrQX8qlc73s3axQg1CQ63nOy8yW?=
 =?us-ascii?Q?x2T+FTD9vZuxRZDAD0RFBvhaBK7O3nmN8jNsa8Afh4qs3PRIFYAMJuS8JYae?=
 =?us-ascii?Q?cZNMc/2VjuSWLCfF9kQWHrfDqqp7xCTfq3/PROGXVT9Yh5L0ZUljEBdzBWne?=
 =?us-ascii?Q?RY5THnVGSzVXvDY6Q81y1dUCdS/kQCxeCELz7JwbL+B864twc+tvfoJYi/Qj?=
 =?us-ascii?Q?uNVYRi9HuhlHrWy700r2Otc55PiNI5GLHi7qDpPS8NNe9lb7rdB95i0ObW2a?=
 =?us-ascii?Q?JGpNPq+JSXzFhOFHsZbJSstQawpRcISb5bpr9H948pxnQjhIZrYKc/CznvlB?=
 =?us-ascii?Q?EKQ0Fu5YMBj+zMNJKFuaFznE84Bk3keadDP6oIOammevy5sDITtH7A4Qb6Ot?=
 =?us-ascii?Q?o4xTW5wtcMQMD4wyjugwqLf8TZwKybgqoO+LNXLgjyJACkAj4d4Jt6P9oXmB?=
 =?us-ascii?Q?xa7xHCEQtJDtCAMDjAR2NHE52JvFufSG4B1LpuE8frG0/tfGpceCsyNLxbpz?=
 =?us-ascii?Q?RCdUagM1gXh9jNCgKrdoaROh4734RBXhvsPll4YWIr9dmQaqV1QL0m4RN4cU?=
 =?us-ascii?Q?Pej2B8+uPLZCRLbz51mgReLjjZt+FTuvqwdDeY+laoNIdAdYvIbEC9kOrxP3?=
 =?us-ascii?Q?fXhAtBdnPmMC91TKd5+oD7vYOLShcFBE5zLsbxXNiABUAvG92hbqfm8cmqDb?=
 =?us-ascii?Q?UEnTyk0QvGgeQLiLszxRV125PnzvGJT9GvLJVWD1F4yKHkQ39BQo3L+vG7hO?=
 =?us-ascii?Q?sQ75KtCW+PC7XUjl+R/OO2hPJxpqOZqN020HovOyMGVCZHunwoah9a3UIXo5?=
 =?us-ascii?Q?GrPs9gNmYBvFHq/j1XwtAlwmKDgopK1zo3aYJ3unS6zcEyGvCgHNZwhUENti?=
 =?us-ascii?Q?sr853vZ6342zK6CQpRRsElAXil4h0SWIxgGSnAOrY+hLdO7sHT+UJde7wdKB?=
 =?us-ascii?Q?REiDiX60FMjZJKyuIyNlnlb66laCcn5qaIv8hUJdX8j73XmoglayXNF4bzIu?=
 =?us-ascii?Q?WO8lQFpBSbpPWZoxHFFUKCPiSZBlb1Ops3CDEAQ3VOShekYsvB/14hTtFdIp?=
 =?us-ascii?Q?qNX6vlw801l/44v2Yw01HK22edsJzeP/kxdV+sDv0v08bjqBrA63v7N2FOCO?=
 =?us-ascii?Q?s5+4zJTl3njrOQlDeovb/6V3zbZdndf0ooDM48Xv/GXDP8UU+1s/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34f40ab-8a21-4062-bc61-08df046e4b1c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 19:06:26.4956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lcUp9jfcEbaTJLVDWRa8B0NVFoooB9Y1g9x8dZfVUqGqzf4ecg+jBxq2K3Gu1kpicNiOqwDzmdhWbVAzuYh5dB8GsfKXzf61yetY3fKZTkenb/VThjH5XXnX/8amQkJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11374

From: Frank Li <Frank.Li@nxp.com>

Convert the OmniVision OV2659 camera sensor binding from plain text to
YAML schema format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- drop rob's review by because use new file
- use new file ovti,2659 according to sakari's feedback
- v1 (2025) https://lore.kernel.org/imx/aPdHqCWNdmVkch7S@valkosipuli.retiisi.eu/
---
 .../bindings/media/i2c/ovti,ov2659.txt        | 47 ---------
 .../bindings/media/i2c/ovti,ov2659.yaml       | 95 +++++++++++++++++++
 2 files changed, 95 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
deleted file mode 100644
index 92989a619f292..0000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* OV2659 1/5-Inch 2Mp SOC Camera
-
-The Omnivision OV2659 is a 1/5-inch SOC camera, with an active array size of
-1632H x 1212V. It is programmable through a SCCB. The OV2659 sensor supports
-multiple resolutions output, such as UXGA, SVGA, 720p. It also can support
-YUV422, RGB565/555 or raw RGB output formats.
-
-Required Properties:
-- compatible: Must be "ovti,ov2659"
-- reg: I2C slave address
-- clocks: reference to the xvclk input clock.
-- clock-names: should be "xvclk".
-- link-frequencies: target pixel clock frequency.
-
-Optional Properties:
-- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
-  Active high with internal pull down resistor.
-- reset-gpios: reference to the GPIO connected to the resetb pin, if any.
-  Active low with internal pull up resistor.
-
-For further reading on port node refer to
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-
-	i2c0@1c22000 {
-		...
-		...
-		 ov2659@30 {
-			compatible = "ovti,ov2659";
-			reg = <0x30>;
-
-			clocks = <&clk_ov2659 0>;
-			clock-names = "xvclk";
-
-			powerdown-gpios = <&gpio6 14 GPIO_ACTIVE_HIGH>;
-			reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
-
-			port {
-				ov2659_0: endpoint {
-					remote-endpoint = <&vpfe_ep>;
-					link-frequencies = /bits/ 64 <70000000>;
-				};
-			};
-		};
-		...
-	};
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
new file mode 100644
index 0000000000000..926e5cd966b8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov2659.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV2659 1/5-Inch 2Mp SOC Camera
+
+maintainers:
+  - Frank Li <Frank.Li@kernel.org>
+
+description:
+  The Omnivision OV2659 is a 1/5-inch SOC camera, with an active array size of
+  1632H x 1212V. It is programmable through a SCCB. The OV2659 sensor supports
+  multiple resolutions output, such as UXGA, SVGA, 720p. It also can support
+  YUV422, RGB565/555 or raw RGB output formats.
+
+properties:
+  compatible:
+    const: ovti,ov2659
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: xvclk
+
+  powerdown-gpios:
+    description:
+      Reference to the GPIO connected to the pwdn pin, if any.
+      Active high with internal pull down resistor.
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      Reference to the GPIO connected to the resetb pin, if any.
+      Active low with internal pull up resistor.
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          link-frequencies:
+            description: Target pixel clock frequency.
+            maxItems: 1
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@30 {
+            compatible = "ovti,ov2659";
+            reg = <0x30>;
+
+            clocks = <&clk_ov2659 0>;
+            clock-names = "xvclk";
+
+            powerdown-gpios = <&gpio6 14 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&vpfe_ep>;
+                    link-frequencies = /bits/ 64 <70000000>;
+                };
+            };
+        };
+    };
-- 
2.43.0

