Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20C3EDE63;
	Thu, 15 Oct 2026 19:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093318; cv=fail; b=ZVmHTkehPKIcozVUB9yt/tO8uQZMf2LlZuEfGtg3JL0oj6csXN6vutMyjV7I2Q01B3XRucX9sxdfhdZ7uG/SbFkgypajz2X+jWYrdRdsSCVlzNpdHsnkxb1O7YOVZK3njOGxoSX6bUY8o49Mvgfp4OAiQkHmS0ZUrpEW+2kJfmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093318; c=relaxed/simple;
	bh=FBuUNxtLBw21UF9Vq9hQHRahictj8DOnQ52XFbebWnU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hc85rD7uDhGnf/XWRtCu03ic9moUJYO9kZ3oQYWg9nTEFsosLN4jvXfjhifShgqvBR9G5S3ZnVmRa80HKkMywgf1q/0mmEaNQoZEbFQsec6CKTjnLQTJBg+yvMxgXb2NT7RoYw33TR7mc1Fix/1bLTc83aNNxXzlLfcjszKhjNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NFJ6ZnE8; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NFJ6ZnE8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjMc1ueKcq3ejp8ugkj+RpiZkqAzC6vSrikw0rbStgTk5Lf64h/H7jBP9rQzmbzy0mexUN+2ThgaBwIvA33myf8TV5NMie2hWAGw2qr+7/PlePQaWaQHakbh61F5LkEtVg+TBpEzjWCe6WZO+lQtFfxOZn02MNdPrAlJ2/sEVa1Ml/v5kFKH9NjrxP7fDOtlh3U59UMfPQYnRwPBtcwvsvmdDtkun01NtZoFxi5/5gllxVoibFTm2lvpYYyHARRfmzLINZjUoimtHzWxipBqZ+C7NfMceQb4Pxas09NdXi4Ury/yKq5kgkIma0yCgxieopopxsQBdGEHwaexnpDAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJhpzAKNodonmgKRnR28gk77fmqE5G+jO3A5q1y9Y24=;
 b=LcLtDkRr9vbSXTXB9tZXY6LB0kw0ggu2cesse3tIJi/0HzDLbjWC89mKJt2RtEXsBi4tDjt0DfDs5TMzOOATV7yH2kjRFHabJGdPbdcPqKbD9Mfd+i2fi4GIh6fjlvEt8JVqbZ6IKVFdX4lYYVlGGRonmZS5z2zmVLnSw6K77OAzUpniMALiRW0jew5K4EqYIpvs8lmxyWhVq2FbzTxuwYV1OBdJK2GZzvO8m6dpPPZys53oIO8peN4pFzfB2XpLsfS1q46FiyTBf82ADK0aJEPCG4wpI2XNvfz93XjG85ozHO40Z146XBl4cM4U8yjcfXQJ4T38PJ2mQKT/Gzz1tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJhpzAKNodonmgKRnR28gk77fmqE5G+jO3A5q1y9Y24=;
 b=NFJ6ZnE8hAY6G6voUsGJUCq09NqyDV7DxEE1dpPw8clUd/hqfMyZWWqZPdPmbrbBdbv+EHSOLfs8GMWcaKgjc6G7HrqPCmpI7Fn5EIcpT6LHtA+nNI4eHpooiMSS1i2euW0GqSp28g2aSkh9Es98ni/0jgKJ6n6CSlwXqJ1Io73HpadBST4KQcWa7xNdkUzzBwS7zjTvvVZ62fyu66zS1bychyHWZx1puuer8wkGS1uU+wl9h3QGJ0TjUf6B0taU9nuY7edCh8+bKqpXYcFn6lo08Moxc/mws2UBDr/dfoVkvxLFH7qh2d1WsqbhHgAS3Wgw6X7u5dFqCHSHKjRNSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11500.eurprd04.prod.outlook.com (2603:10a6:150:288::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 19:41:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 19:41:52 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v4 1/1] media: dt-bindings: convert ovti,ov2659.txt to yaml format
Date: Thu, 15 Oct 2026 15:41:38 -0400
Message-ID: <20261015194142.3488169-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11500:EE_
X-MS-Office365-Filtering-Correlation-Id: 45db18e7-6b1f-4752-3a58-08df2af45c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|6133799003|18002099003|10067099003|3023799007|11063799006|921020|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	A3rwqqE96ouhpva5cl8bWvY5pkhi3bLgiq+lX0Zl+thg80SJ1F/OzS2KRqUs4hIZq1xmqba1EVWzhg9eGonF4l8ZoDnXV187gVcpzLO1TKZqqIpruGFlnQ6UUrPIVTRO3G9CAZGwjzT7sNOHiPHTBiG41c8YRNiDLVsKm3tpNBrLyQvpuyKChwk1qYIvpw/PUgCN94LlRmshlA8DB1Bq3n2XlAaG1w3nGOd68dijlf8xyeHHNp1hSwM2RQ+maVfRU8jQgHhWitXW1ZsyyLPY2awqpor9pixyCVynFzNzxAb8DrkE2xmpY7ZWq3Pfq1YGaZ39YvGUnNQzNeCqWiESUyejutGPEqWBP6LaZUnfy7jfs6SX+ZfyIsa6Mfp1e3vFtwp9R1JXy6FocMWMZbBwfqWlDebstk67zMDzmQQPH0yA8GVWIKyc8Co7ld56XPRG6MCn4vMnODYyIqx1UxZLfjpKgncr5BRKMiZ0EQ2bqKgtCtCBKvIIs7NgiGCiT55icg4BidVseAX5yOSI2nqzNzaeZu+G1s8KnMORLBABfxkhkH2LOvdliC9JcO7WcHdUycduZW5C9UomK+7fc4HR9Sss19ccN1vmOe8t7VNWJy4zlrm6f1xAMNkvpGctSpNpGWowEkCXgo4HnQM9Mld6OssUPaOPq6wLqt9gvArz1Wk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(6133799003)(18002099003)(10067099003)(3023799007)(11063799006)(921020)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IgTGIfMSGc/NDUbJeSyTAQwQB+GlfhAPHcNQMVUKGmmhYwPElqvW8uTK4keu?=
 =?us-ascii?Q?YnxoT0A6dN6kGpXLkA3e17OawKq7JRqyKVEtroSIqdoWH/Fm+NceedgcdccZ?=
 =?us-ascii?Q?gJAibUrCvF2YJlzxJ99GbpyEakDvlsXzeXFk24SGptdxV/yUjaGXI3TeIzN4?=
 =?us-ascii?Q?O9g98yHkdyve0aDbHggwqmbaTbvlyAC1/I7x8nGg9dOesKMV7teaLrNRW5Rw?=
 =?us-ascii?Q?V+GlpxF00jzc/2rc0woLw6+bPpzLHCWvxG4arNssShDeZ+h3jPTPFb8ugAos?=
 =?us-ascii?Q?SjO4tEAZQLi1NXJbaM0DONUXWZDeJaC/qkZsHumyFITnUXOePySI+2RhYSqC?=
 =?us-ascii?Q?QlY8yj+YXlzs6nXXM7hUDkqif12DyCEmvFGwVVVh61ZeDQGszAgF11kgRwkP?=
 =?us-ascii?Q?eFnyRSj5n2aAgWYjpejg3R14elJH+h+9CeZ2vz1r6gbmMrlR7woq2tLOSjMl?=
 =?us-ascii?Q?VkeCaOuaJATwnd4IH+mwy7B+ZiAzyj2TLEIZqVHbPtCMguBAxOe8vKn0jXF8?=
 =?us-ascii?Q?q9EekT06F5M2nMNu5KiRiduNXxGZ6vfuffji64eSkHqItyECG/r34EmeHd06?=
 =?us-ascii?Q?ai9cfYvdw4jRJTfCT3h45EyJCzm7fc2cSnvRh8sQOr1MpiSjdaQnl92PiX78?=
 =?us-ascii?Q?IkoC1iyxJE5C2muGZ0tu95zuo1rRy5wIA1wiEHKCCMd22Y0VFmKvj3Rsc7BI?=
 =?us-ascii?Q?1fAG3gDfjjhDujZqrHPcds7+TiVProCUoFzuxYnhSCspYr3+95LrbNRV0DLK?=
 =?us-ascii?Q?CNk9OUE0rwlZN0TlvmCgo44My0Llt+xNpKeCLnc3bO9H5TG+ci4t7RKNkSc1?=
 =?us-ascii?Q?eQz+2kAT+xtcHjLs1YSm0LiS378y6fuhOiCGNaYk6NR9yi9zfNLbcU2Ek4dz?=
 =?us-ascii?Q?ru8XVY56nzbtOlX5Tu95wAW5Wlv/NxDr4VTkF2/VsI5MHDq/fbqzRtx2RyMR?=
 =?us-ascii?Q?xmqS0ub2w46qcDw6WY2BGxVX9SI65D8OewbFFCiTOVXLX80l+SX+rbyX9mUk?=
 =?us-ascii?Q?0BtNB3Vr/lxJqTghV2cwwQ3e/i57anb7gjDAQiGy1n7Uwqiqr4HR4rpeBWDC?=
 =?us-ascii?Q?1Pglz0x1Ch1TXPgFSbi8ddrZbsG4aRuKENXwwvZ9ZwYiDmrz7Y8Vj/5Mu75w?=
 =?us-ascii?Q?erY5sPIlp9O0YWLjr883ZASNryP85OcV97jwS7LbaoOiqtuEB8OnrC9r9icg?=
 =?us-ascii?Q?Nwj4BvWt/zfkGx8aE0UrY9847q8aUxtEv3lvUWaEdEucHeZpVHrdFQah6414?=
 =?us-ascii?Q?8axMqL9ONOgVvNRx04il80KTi+temb+gn5LZOBd5KqbfCKp/1JegBhZ0YTLD?=
 =?us-ascii?Q?nypfavUGutLL38qvH+neDFWalZfq2K1lLvM9fNndv6RdFftF5VyVJskJdjCz?=
 =?us-ascii?Q?4KHP7iQRsFRjnTYgmSKc6GqZPkoy2ig0q4TP82nyIwbqdX1R4KKZdhaBTVb/?=
 =?us-ascii?Q?A0V6fGWZIFXZuAQkgVNkZnGqRjZY0IkEDDoNFyAP/qvS3b3TGaEIIzkNjlmR?=
 =?us-ascii?Q?vQoaFv7mc1CIyOaWzuz0UcfoFNgxzS9U12nNs+Cr6h2yEErFPcGLSf1dW69u?=
 =?us-ascii?Q?OkE6PQP0tQGW2+o/1GSQJ3QAre7j0t7ITGxO3br1JfFlDzuo/CMu0k9ncL5K?=
 =?us-ascii?Q?7rUyejvTDN9LNqH2/a0b72KnTR2OXyyxRYu5wOmWO7Jdu/QXVLmqIhR2RbpD?=
 =?us-ascii?Q?XhEnUIztGcjIml4lP7405F8Pogp9HirExReXdTU2G4hNLxUaADGp3YniqpXD?=
 =?us-ascii?Q?4S83AwZTz7fVyJG3/jsJdlD2gr+Cl+E97mAnJ+txW70M4CbzRH82?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45db18e7-6b1f-4752-3a58-08df2af45c6c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 19:41:52.3039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfXrBuKkwWNqS5cMbyOZMB9GiI26fVFtIyXkQsHeqtkxNbuqg5SkPUl/yVYF6Ji03iJC1tbJCPJuKuUxeaSrpZQ5RfnBWQOeaId9RunUv5d+lVa+pjpO5O4P5xXT1Y1R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11500

From: Frank Li <Frank.Li@nxp.com>

Convert the OmniVision OV2659 camera sensor binding from plain text to
YAML schema format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Chagne in v4
- update MAINTAINER files

change in v3
- update subject.

change in v2
- drop rob's review by because use new file
- use new file ovti,2659 according to sakari's feedback
- v1 (2025) https://lore.kernel.org/imx/aPdHqCWNdmVkch7S@valkosipuli.retiisi.eu/
---
 .../bindings/media/i2c/ovti,ov2659.txt        | 47 ---------
 .../bindings/media/i2c/ovti,ov2659.yaml       | 95 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 96 insertions(+), 48 deletions(-)
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
diff --git a/MAINTAINERS b/MAINTAINERS
index fe10d29b7657b..585bd3344a9e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20591,7 +20591,7 @@ S:	Maintained
 W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/mhadli/v4l-dvb-davinci_devices.git
-F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
 F:	drivers/media/i2c/ov2659.c
 F:	include/media/i2c/ov2659.h
 
-- 
2.43.0

