Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1E61E1A3D;
	Thu, 27 Aug 2026 16:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846611; cv=fail; b=Yc6RsX5YiGgK9+0uzVRtyaAGmfvUydrxtu5ygBQpaMadp94VTvaEgK9xs3GHZKxx8aiNbNYgjhWKQAOfgWrnImdwWSmTNV96fHdt1pdPCWPkVtha90FWjxTB36RQlRv1M65fg6OKWtTiqWSeECRBajtZV16tV/WPbsBIkxuHXEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846611; c=relaxed/simple;
	bh=vP1tsGBTLDsY16WfZTUqpuROL4qcK4OrgY5ozMBceQs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bRQVzgfMNlBcTXBPJkiByvOgqr/HZrOUaD39do2A740uvXZRBWC5wNec8JgoTFangJr8xPqETRBrxYtlTmFXy6AWdZ6C3v7t0CnLSBcvtAvQWEz2RtasaoRkFJiTkyiEe7i23nboLtUX2snWDWVTvxSvkNANKHMJu/rB3o+ZzLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gRzBU7VM; arc=fail smtp.client-ip=40.107.159.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gRzBU7VM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAE6qF9jQjw2dvY4kuvc1dspD78JSwXAykh3U6owSN4OCiGBiGrTti0tlBuxQBY9gXQWPCy4yIu+5mv+r7gUEwk45V8NIlL5Im7lLqLvA91CaJbkdMCJECoDbkcsydp/s8EKQqjgy8P/6MYTewNTieq4MdaD7hdJw8X8dBfYjx4eWiQKaaC6ALRHNwv0uMQHYfVuT+7340Kj0yu2vJu830p22GjMwxD5OmDYGhZXIiPbjOk2cVRIxM0lhiovRyRtZ0ramuMP4DeZprMZWdvsFYTnrhcLr/qfLLgNUu9RsW9B31ia9nX/C66lUJ/Biu3ccKsG7Z1SVt7yBhxcBcLEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKNjK52vYZgD5oUPy99FkvuX4ZAhDME6ywfveYU7b/g=;
 b=yF1jcF5wQeCh7nrntCHO64ahOEYpHUW+VDeJ4S+nOtmhQUB1fjeFZPlnB+r+efYYQ4ngOwmaCMtgz5Uqv2BhqTm1iGyDArsYm/dff1wk78w7J1Gp8655JD4VGTsmK2DJegL9IpPiwCgHTHzN/5kthf/R+UOmOKG5eaqH2x3wT1vZczt3T2hDfhS4K0vYnO94NQqzqSwgTyvZFNS0vAF5YhYrfmwm/2UxBCrmR5x3J3P99dcTuIHHzCgpPrvHBGHERAfX9ergZpr1RtfCPQ9KMtl1rcJPCLbWuha5q2gzBgdtmm6c/Ovb3LxWHf20nyhXqk/25UQ/IudXumap3QcQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKNjK52vYZgD5oUPy99FkvuX4ZAhDME6ywfveYU7b/g=;
 b=gRzBU7VMYJSjfeFTllN+hkT8yyak4zXqZgmQr7Bgw5pKB8ohgENuFaP0FrK6NcW1GkPRpG11Gc9P7tOMpchqnjbEoGu/2ktK4PbwBqpdNcQt+EEN6Z5aJq5iAExedwlCJuVxok9uOBEXzKrPXmuMwRs5FAoZrtAxrYjangy5VSyWAc6qdSgaWnUn7aTHgvdLP97yCDnzI5Ah22zmqaEV8xIy8RKRzITdF4jUjKHkP8SbYAlcLQyvTVKUyklbkIGCFcCu+Jo7wzGRtJUq0jmelXUyqGBGH+aO5Vc8fLTuZ51nuhJ/X79wyYz1Pxr/gg4v3lhHizuFBPlPu4UJGdWq2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11407.eurprd04.prod.outlook.com (2603:10a6:102:4f7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 16:03:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 16:03:25 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v1 1/1] media: dt-bindings: tc358743: Convert to YAML
Date: Thu, 27 Aug 2026 12:03:07 -0400
Message-ID: <20260827160312.4113159-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:510:23d::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11407:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a76bfc-c542-4615-401c-08df0454ba0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|10067099003|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	8PVFmT0qJi+EhV4AbzuGTObY/wkknwKkXUcvlLjZZtJ1/R39kTJSamKYsasNh3qGK4K+4d2WHpV6v9639xdYYp54Ow5V5bE6PI+wCViSMaIPoRPsFOWs0o753wccd2LHMzGXOZcXIC4uTnB+WEEivIM2PVVo1ld6omd4YuLSNGLI273OIcQrrl02iIWkZt7aUi8fTT1OadD1HTkGA/fHUqLVd/+9Ej6AsNb6Gbru1RaQkBcKCtM5Z7ItjtLY6rwlxhmepu0NeC1CKjOy1RQeGI3zIjjhLCA3OT5hy1Z1c8PXey4zt9O9ls4M4rr3e8TWPEL0CUrLuwyxak512T/w27ArzGvSbPKBUaNccDTgRYkMlWflFtatqphfTMJL2+NyGfxNY5xl3Rfg0Z4w2PIv0fUZkO4BtKX6EjBXj+oYPMMeHYgl9WyzvFAQStBl3yrXNuTj35ZBn3KYKDEDYkGA4zosy6wR3T6aCsmkXZI8LVz5yRwTpyWShblB+rzE/B93PSiVz95SodQIhWTI77APWED/n/kPlGPPPzWXfM9oboOX/WH87VqayUeFHOaSMHQLfMeA2Pyj37DexDIYPmwmBvhLIUMQc/PvKxY5cVWCBejL9VMfRLGHYpiNUcuLgqkh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(10067099003)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y9ba/DnDSpSOdhB8efU0qND+Lzf1Y4Blo8Xe/GnuBm1qL+ewFfuSObKIjBgH?=
 =?us-ascii?Q?dlGH6EfXXKJVA2pBEJ0mOrBvlrpFoof+eEt6i/ia31sN+vnxut6spxulekI7?=
 =?us-ascii?Q?MDWRmCasH652O2Ent02WTFf5Z+HU9bQJsoNkQgHDtPRWzwfPFtTk0BB+w6bE?=
 =?us-ascii?Q?jTkew0gyRAAIZAlzUsaDDU5eS3KiU911+NLfKuocNnpqN+ntD6dndsmwxqI9?=
 =?us-ascii?Q?48H2aFpxRxw7jBkY1ByNGNH64rE9zkLcQ+7irky0/x6Ah+VSGxgFs2AdbT9L?=
 =?us-ascii?Q?6kgJTBxbre/T0w3S6yq2LL2AfgViDfp3DLUpYbED9nrj9PvBqhEYoBTnyI4V?=
 =?us-ascii?Q?qE+9KpgvMFN62XWKt7ePXzFM1IL7vocv7J522pABPofpqlx3VGqTB2GrTkQr?=
 =?us-ascii?Q?xo8w+5Fhz+2t+x+ctv5bsmvpLwUbqC/JB6ckHX1gXXDXmtPltHbRiVBHGVFk?=
 =?us-ascii?Q?pEj1+JlbmMbjngmlFjrWAqsL8h9NN0XwgDwef5+Osd6iYDbIEDAaR2VTo4WQ?=
 =?us-ascii?Q?FqBGIFiPO9BjYYa7MQTDd8SXaE/mBJG47nx6jMtpFKKjosqYtwrj1kpt7KZa?=
 =?us-ascii?Q?BpFqjRWf7qzJ3Yw/XTfkEyGmASnPHYJpNqPpR03Wczo/oGKhsKN5r4usS9IF?=
 =?us-ascii?Q?3yjEzhVOwH3l6WPNQT04mR70sYb43i7W5ux1NHHaF2tKuu7D4P2B3KhOePLw?=
 =?us-ascii?Q?QTiCFW2Y41xZo9sLWwYGGtE7tbm4rNuXJ5Id9IMZ2/3tWhIOiqN4f0mP16c3?=
 =?us-ascii?Q?hIjCdKiZRFDWnH8xq83SvESXevoX5IvmsmwphYQu3/4ssSuxy4GknMBcvdua?=
 =?us-ascii?Q?NgRKPDvr87evZJamFJgdnknPwtAzrjeN8ObLs70b1015HQcRDW1vzgrxXsxH?=
 =?us-ascii?Q?wzm5Ux/WH9Q/eDHTJq5tQFReL2X9n/BXsdQtZQ6TWI+438+zr/31yJpMIURF?=
 =?us-ascii?Q?OQm7n6Xr8vjvmVHaDESElBIS6gbiKQYZI054HvjLcV+4NWcJgggYMrfvuJbt?=
 =?us-ascii?Q?aB8K3uKBNPUnEcYNaCKzAIcOCooQsPjK9c6bkkzjtriPjtgT55JRB4Yzi2z+?=
 =?us-ascii?Q?9pUoOjuRz+OTUdJkaWVVKpo7jVYQS2UZM2dkezWjRwqujmW0aSmqpQXwpa9G?=
 =?us-ascii?Q?4DgHeYsySjpRL4mJxhOP4s02FSHGSbcABHRgYI9oGq0tgdjouEr818YWYUwy?=
 =?us-ascii?Q?nQWytM3/eav3I1p8jFtdivc2PxVzPqNCKMtKnC83X2K3oggoLlqBRvDWKpWe?=
 =?us-ascii?Q?OazGeQviVGkZ0XlkYG3Lw8bvusBCUoGkvfkwiwJJoDGNNhAuKiXtOfe847t9?=
 =?us-ascii?Q?aJQw4BmChXOasN9M+TcAFmuX9EthuC2CBbE5nDN6+ZuCfStfO2X914gu8Hyc?=
 =?us-ascii?Q?eefiArJBL/IpjLe4cd5BKsVjDwXZkRTGzjP7Va9ihrg9wV5ehHubrHdlHDKr?=
 =?us-ascii?Q?oB2n8UqRsl1pbLfsgkMgnlkx7dPGCiUzyt0fXydO+RSUqLCez0rcJ8YJydi1?=
 =?us-ascii?Q?yFIcumf/396yJRBpPXEbciHvQH1OxvKres5gRtgIJQEpMqOU260DeJEZhpCN?=
 =?us-ascii?Q?EEBuO+TkIROZsa0tF5j7WWIRqhTVIWtMTB3XjZlsu8so0y3plYUXFzglxAJN?=
 =?us-ascii?Q?X8nsehY4xTuQVr0wk2pmsqO7zprtT7eSk8dpstpNjVNvS1Z8hOrpBB4FxvIZ?=
 =?us-ascii?Q?AdJ7d6MgPfy3Rz0F07nI3eA+PIaUsQLg1sf6dKnPUoaVZfNZK1EQc1T3tPpP?=
 =?us-ascii?Q?4CpcIJX1tZHpeAGpX1xubW96prUGICM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a76bfc-c542-4615-401c-08df0454ba0e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 16:03:25.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mz5GG5V5eu7V7ZDD7AO3MXDlfQB30UHRH2LzFMQ+O4NSHK+QNXgfU7YnZCBBTpooio0giC5WYq5AirbB0CST81kAHf8VYhNIPNbT445BkHI6ZqCT6F8GlT6tKGbRQCcV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11407

From: Frank Li <Frank.Li@nxp.com>

Convert the Toshiba TC358743 HDMI-RX to MIPI CSI2-TX bridge device
tree binding from txt to YAML format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/media/i2c/toshiba,tc358743.txt   | 48 ----------
 .../bindings/media/i2c/toshiba,tc358743.yaml  | 93 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 94 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
deleted file mode 100644
index 59102edcf01ea..0000000000000
--- a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-* Toshiba TC358743 HDMI-RX to MIPI CSI2-TX Bridge
-
-The Toshiba TC358743 HDMI-RX to MIPI CSI2-TX (H2C) is a bridge that converts
-a HDMI stream to MIPI CSI-2 TX. It is programmable through I2C.
-
-Required Properties:
-
-- compatible: value should be "toshiba,tc358743"
-- clocks, clock-names: should contain a phandle link to the reference clock
-		       source, the clock input is named "refclk".
-
-Optional Properties:
-
-- reset-gpios: gpio phandle GPIO connected to the reset pin
-- interrupts: GPIO connected to the interrupt pin
-- data-lanes: should be <1 2 3 4> for four-lane operation,
-	      or <1 2> for two-lane operation
-- clock-lanes: should be <0>
-- clock-noncontinuous: Presence of this boolean property decides whether the
-		       MIPI CSI-2 clock is continuous or non-continuous.
-- link-frequencies: List of allowed link frequencies in Hz. Each frequency is
-		    expressed as a 64-bit big-endian integer. The frequency
-		    is half of the bps per lane due to DDR transmission.
-
-For further information on the MIPI CSI-2 endpoint node properties, see
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-
-	tc358743@f {
-		compatible = "toshiba,tc358743";
-		reg = <0x0f>;
-		clocks = <&hdmi_osc>;
-		clock-names = "refclk";
-		reset-gpios = <&gpio6 9 GPIO_ACTIVE_LOW>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
-
-		port {
-			tc358743_out: endpoint {
-				remote-endpoint = <&mipi_csi2_in>;
-				data-lanes = <1 2 3 4>;
-				clock-lanes = <0>;
-				clock-noncontinuous;
-				link-frequencies = /bits/ 64 <297000000>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
new file mode 100644
index 0000000000000..29dd1d58f766f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/toshiba,tc358743.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC358743 HDMI-RX to MIPI CSI2-TX Bridge
+
+maintainers:
+  - Hans Verkuil <hverkuil@kernel.org>
+
+description:
+  The Toshiba TC358743 HDMI-RX to MIPI CSI2-TX (H2C) is a bridge that converts
+  a HDMI stream to MIPI CSI-2 TX. It is programmable through I2C.
+
+properties:
+  compatible:
+    const: toshiba,tc358743
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: refclk
+
+  reset-gpios:
+    maxItems: 1
+
+  interrupts:
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
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bridge@f {
+            compatible = "toshiba,tc358743";
+            reg = <0x0f>;
+            clocks = <&hdmi_osc>;
+            clock-names = "refclk";
+            reset-gpios = <&gpio6 9 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio2>;
+            interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+
+            port {
+                 endpoint {
+                     remote-endpoint = <&mipi_csi2_in>;
+                     data-lanes = <1 2 3 4>;
+                     clock-lanes = <0>;
+                     clock-noncontinuous;
+                     link-frequencies = /bits/ 64 <297000000>;
+                 };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fe10d29b7657b..9abeaa3f31ca8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27673,7 +27673,7 @@ TOSHIBA TC358743 DRIVER
 M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
+F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
-- 
2.43.0

