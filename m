Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE5D30B50D;
	Mon,  5 Oct 2026 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222145; cv=fail; b=GbKP5fFFF3zhA46WDW2jX5vRdbfw8cL1nkbRtPxcnwPenDp4Zu+dph3n8r2PFjNqemyhUkpcCAGq3+ycve1Nrp+I92jrJI9Ia/mGRJ3Q6lf2qeQlaETwSD7QU4LFtDsIfEQVZhiOOz6CnBMguQMMwDyxg0WtOuJ0ZG2j25oBPO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222145; c=relaxed/simple;
	bh=WglqGWRgHQOrA8OG5ob6crMQ9eDShPpdK6CLvTaDhj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SbBA4gUZVamNdPNZG8eoTMAWNPR1a0+D317NEQu8GWu5fp/aQG48O47YmepweghmeWz5bNfS8ASwIHJL7Hrg8pj2wWAelqubZuPWlwSBrYDfmoNZiuej84cPxwvMt6sE/Gt6tyErKZTE3KU7NfsrKy7Oucg96yY5VK1wtswyxq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LD0oY5LU; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LD0oY5LU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPg97QURqxjgcDdMKe2w/6VsGNsDYnREJQfzljTkAt6y1G5/oTgLLrdRKb11+7YRxzSs9goSBaiDto2XdQPYSmi3ZpJCfbtMPq5f5Ax2pFSfXB3U2viUm4CofZh6nSG93tE/xY2ONlcNd77t0WhO23Zt0r+ItKoPQ8dhDO1lpfz+VvyyjK9aauxoDGXgRzPxl3PFtTInBXQPJShViK49wbeRT25PJTfgKn59kA+DsO6LbAsB7vHNV+ru1UljEPijYFmK00kDQBpGobcoxRtN2KdwoShaqG1xKMu5ettIXPrYFkciJHYbBXBCVaFD6xquZ6DFuzY+XeZeAqjUrECx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ar+xngBXxuVlCmQw/z1figTRUM4txFPT09555OSvE5U=;
 b=wlYbnRFwm0E4uOuOqBbYFEqO83xRziy76OppZhtEFUPlHW5LLDF5JTDKEQhzRsV2Xh5bMadVlJM+3b/Z+KJTjKvepvWoTXTYVYI/d5dHUcbIvuuzgviAszo0dEhA2T5ZoaMIjjFLxCF2DAitJGvj5naunLt0+oAx3dT3z9OfIiw793TfWZ+iL38+3PLLILU/6CFd0VGF5dnJuihvNZbE+dksBgfRFOlP7sOfscqR/y9u7rSZ5+OleZJ8Xi1QA/E4WMo2OklZc1QETQooQk66Fi1aWbCYmj9aMVuuXng4J+18Xr7RaVAvvvjyhrzA2O0NUFOazfdv55R3kCNh9xv3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar+xngBXxuVlCmQw/z1figTRUM4txFPT09555OSvE5U=;
 b=LD0oY5LUCGiTXwISsvhoUdHFwtG7ECGkdDsiAm67yNFd3/vTeVjQ8AijfoKPB/tdmy8W+bxbMiKgYFMOlh7r6Fe6PvbR0DaoElOJ2f3RV9ADnIATAPV1qdUtBdBhwoEy8FPlaCmQnUIzFOA5Hqgk9+5ibuJxJ2a4ogd5AfovwBOAD30Q6vR/b6cWtLAFteTrOfivmYbHrD0hWSx5JjbgSfnMLVWSHTZiWi3Z18G6vYEIsXFPkquHSSIkBj+0lQnWPxH3Apsv1SnXYN4vxDRcKHEoBb2R10ER4RIPHFh/m3ntsK6vmxT5s6Gqll1QIBhYXzgufAm1tTQdHUfNsXKArw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Mon, 5 Oct
 2026 17:42:17 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 17:42:17 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	r-donadkar@ti.com,
	jai.luthra@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	laurentiu.palcu@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	johannes.goede@oss.qualcomm.com,
	dave.stevenson@raspberrypi.com,
	devicetree@vger.kernel.org,
	robert.chiras@nxp.com,
	tomas.babinec@nxp.com,
	daniel.baluta@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v5 1/4] dt-bindings: media: i2c: Add OX05B1S sensor
Date: Mon,  5 Oct 2026 20:50:59 +0300
Message-ID: <20261005175102.2358881-2-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005175102.2358881-1-mirela.rabulea@nxp.com>
References: <20261005175102.2358881-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0134.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::31) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 498748c5-61c4-417d-01e2-08df2307ffb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|19092799006|1800799024|376014|23010399003|56012099006|10067099003|11063799006|3023799007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	dCt3Qbq5fDVvoiHk22RJNdxiqTN/uieqhAE5olcFWNrgSOWh+NtsomSR9hhCOfxBj+pTRP4mxgBBiRvo9HFq510e5UboZLoZmqIrvdqEDgA5hpQScOt6YgYt2gH7cowPqxEmTzypj/ySevx2RBy20QoL8OOyEwZyvFuTw9n28mBGoOrp6pt7rO8qL1GU6lrnumI0CBQbpcbkW3eXyAnhQ6ZraMIG/p27K2XNS7YhRoGly0yW/VO8M9emX3DOGChD6wlAwLglEnO5yCBzwo5Ggv+f/Ysk8KCc8aR/auYGFBY5GplcIE/lJmEVgGK/RyTkUTUrdPW7eYdnKBVTQ8M8DMGKclO564WW+d4tOGwy5M0axH1fHOXm0Y9GkKQdHcsrDpLn7ClAR0D0Pr0ljuojYPXJdxIFNhlJaF6j339ipYn4EET72E1SqCt9J9IQRLJStKjL5k/Z9rNjZxs+9FM5IzptoUMd7BIMIQrdUnddpgSmd/VPW9e2oY1xf+IK9QarsdZyiVjWIegvzogn+STceRTWUIV6s98RhvzGdbEMDzrWvgnWmEx/imGmZBRyAyTw5CdnNH5uxz5drDbS7mlqZHJoq/OTVFBlpdGRQhecbEHE530y/JIbUBqS9XThrQszBqBp1zj8iru2D3wH9fYYdPNEY+E4qTRpLeY4JSQXM4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(1800799024)(376014)(23010399003)(56012099006)(10067099003)(11063799006)(3023799007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aA7g0+lS8Rm5LSb0nGMsf8DWb3mkbpMGI+iRHMIQqv6/0dnVMhn1xzzDeCzR?=
 =?us-ascii?Q?Z6b7p8BBqyiBas84pg2eSdi975cgd5mXcaXKtRtdba6dS1ux52z1xgU9QlZU?=
 =?us-ascii?Q?RpcRfVHOYC4U0hScJL8dR662QIYg2QcrMMwUaHdkhIGpAAMAxMJXM53q8jZ4?=
 =?us-ascii?Q?Vnxc3ygu9VB9hi/viVEV03WNYJoUox6nhjL21Wc9vhX8UOptvdDKl4kj+JIc?=
 =?us-ascii?Q?Wn2D7Aq3AjI1uKSyZPoOsOYnayNvlvWW8GhvrnUNTYpAfsciSVg6Z9QGn4bL?=
 =?us-ascii?Q?9LiqLuccY9Ay/5iI2UdSbq45q8qrljKbgjVPuckbiiex2vX8L86RyV9y+f9G?=
 =?us-ascii?Q?tJ6WwjJw1++gS+DyZOukTgfBmHdojwZCBcg+fL//lUYzrf80rBCBPQtaLlBC?=
 =?us-ascii?Q?rKZZPPI72wMRRDFQDE9j8i7BPEdeeRCGlmfwZ2TysUa8KS9AqtvoA4xSmuGB?=
 =?us-ascii?Q?7/pmJRF5ujEQ3FMETP02KFE2tjy3cgGIaPAMptJwgvKvVwxMr80LeS/FG0y2?=
 =?us-ascii?Q?UXV5TAxWw6CmrLXpRkpcbZCx8BZA83FKhaJaYdOGz1QZacR4RrcXneYHgBAf?=
 =?us-ascii?Q?9ZceBI766Fj+wB52A1Ejln3CoPknlfKf9nZynG50W3lk2rPOSkPKf0Q57m/f?=
 =?us-ascii?Q?+WRa0uSSNExG3QY8eSbo/Xt+bhAhcXH3jA3aW+raIaorOrhU0Pdswqg4RVUq?=
 =?us-ascii?Q?g7gKo3Saq+biUv6N/3/55rNUJFV5RKUZUNUQ9fow0TOY3btNP9uxlB4SP/DS?=
 =?us-ascii?Q?GSqUE+H9nfpXuzvNpRh5jUQzCIuT7T5Ph6UVA/1vwA9p2LxhRtVwehVTslUx?=
 =?us-ascii?Q?EeyjcW1ZpeB8vL2dPKH4TVq2gBVwksqUSfQjDzpAiXR6yFoGQMRwwSPKsnOP?=
 =?us-ascii?Q?0ogiR0F6HdNukEQngmYdQfQX619YCQG0CekBdcNh/FcJ6wD+CDYX9a0x7k7O?=
 =?us-ascii?Q?yx99WsUe4HvBxfdk02gGzd/irjD3eANV5tNsQlUn4BVy7aDrtQjry6NlL/dN?=
 =?us-ascii?Q?ufWSSt+SfstOFP3Wd0FQW9F11HZH47nMBSCxh6k+2PYiHHhLPTO6KkG6P4vp?=
 =?us-ascii?Q?keRQUt/PvkyeT15iEjfXjZUwkQeTAaokK+eUBTF4x4c7Z0V6IQRuNsLq7jem?=
 =?us-ascii?Q?TdCVJqe9Cn1y/OGLQw1B4+d+FOwdcjxCPJK7tOO5lh+81CgCA5hduSTwsdHu?=
 =?us-ascii?Q?cPGs+MuRHnF+eFj6AUxLzJkM6oBbw3vrt5ECaLWPfz8y94AeR6U48uEhXoWC?=
 =?us-ascii?Q?MpN0kRguZ34soyonD6hMeU/aBtzz4JT5oEedQt+kYv/k+QpPZ1WA6j7mCciT?=
 =?us-ascii?Q?zWUPr/mkEVfx8p7AH+fHo0vu28MkhYqfg5cCgAYIJ6pG+VLOL3qO9HeVK9aU?=
 =?us-ascii?Q?zKrDd2CeYXpF2oXVAxvnhUHMf8QZ1Vrtf2dNXzH0hn3yEOgUQC0Xe9jVknO6?=
 =?us-ascii?Q?DFDILnJiHYnXwFwjbc2FBX2ZOeWHTJrjxvt23NMZL0FrM7Ia5maBaIuwRNJc?=
 =?us-ascii?Q?Z+7W3Bqnpq02Z9Xa7gqixsM9G1pMTIhvQg0jwSngvLs5kDD3iHHq4wa05i9h?=
 =?us-ascii?Q?4pjJQ3lOmrSHdopz1XjdBG7ISmx9P+dJ/Uq+aSWJ7z5IUWl3rgKS89/ceLUN?=
 =?us-ascii?Q?ZCmVe3XJ9BL0h8BBZ+i1GD3H4w+YL4F/q4oR6A0kRgzlR1UyOB3FTLLdTaTP?=
 =?us-ascii?Q?sL32qpCiOPo1XyTwXOF3YU1sljHk/FDss8yqO/y3YT1hAsD/2dq8CmKnk8P4?=
 =?us-ascii?Q?LftewPuKoQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498748c5-61c4-417d-01e2-08df2307ffb0
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 17:42:17.3125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soGzmb/kCxJR1+yuc91bVEOJ2tKcc7CxNwkM7DO1iWMfpWtYLkCieyDNM1pMnkRguSkZiHVnqe6T66RnyfQpFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8096

Add bindings for Omnivision OX05B1S sensor.
Also add compatible for Omnivision OS08A20 sensor.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v5:
	Add OS08A20 info to the description, alongside OX05B1S
	Update clock description, replace 24MH with ranges for OX05B1S/OS08A20
	For data-lanes switch from anyOf to oneOf, add 1 lane possibility (both OX05B1S/OS08A20 support 1/2/4 lanes)
	Update copyright

Changes in v4:
	Collect Reviewed-by

Changes in v3:
	Use unevaluatedProperties: false and drop orientation/rotation
	Drop items and keep alphabetical order in compatible property
	Shorten the description for reset_gpio
	Make the supplies required.
	Use generic node name (camera instead of ox05b1s)

Changes in v2:
	Small updates on description
	Update subject, drop "bindings" and "driver"
	Just one binding patch (squash os08a20 bindings)
	Re-flow to 80 columns.
	Drop clock name (not needed in case of single clock)
	Make the clock required property, strictly from sensor module point of view, it is mandatory (will use a fixed clock for nxp board)
	Add regulators: avdd, dvdd, dovdd
	Add $ref: /schemas/media/video-interface-devices.yaml
	Drop assigned-clock* properties (defined in clocks.yaml)
	Keep "additionalProperties : false" and orientation/rotation (unevaluatedProperties: false was suggested, but only orientation/rotation are needed from video-interface-devices.yaml)
	Include assigned-clock* in the example, for completeness sake (although it was also suggested to omit them)

 .../bindings/media/i2c/ovti,ox05b1s.yaml      | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
new file mode 100644
index 000000000000..7b24f35a6344
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024-2026 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ox05b1s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OX05B1S Image Sensor
+
+maintainers:
+  - Mirela Rabulea <mirela.rabulea@nxp.com>
+
+description:
+  The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active
+  array size of 2592 x 1944 and raw RGB-Ir output. It is programmable through
+  I2C interface. Image data is available via MIPI CSI-2 serial data output.
+  The Omnivision OS08A20 is a 1/1.8-Inch CMOS image sensor with an active
+  array size of 3840 x 2160, raw RGB output and 2-exposure staggered HDR
+  support.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ovti,os08a20
+      - ovti,ox05b1s
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Input clock (6-64 MHz for OX05B1S, 6-27 MHz for OS08A20)
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low XSHUTDOWN pin
+    maxItems: 1
+
+  avdd-supply:
+    description: Power for analog circuit (2.8V)
+
+  dovdd-supply:
+    description: Power for I/O circuit (1.8V)
+
+  dvdd-supply:
+    description: Power for digital circuit (1.2V)
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description: MIPI CSI-2 transmitter port
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
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+        required:
+          - data-lanes
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@36 {
+            compatible = "ovti,ox05b1s";
+            reg = <0x36>;
+            clocks = <&ox05b1s_clk>;
+
+            assigned-clocks = <&ox05b1s_clk>;
+            assigned-clock-parents = <&ox05b1s_clk_parent>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&camera_avdd_2v8>;
+            dovdd-supply = <&camera_dovdd_1v8>;
+            dvdd-supply = <&camera_dvdd_1v2>;
+
+            orientation = <2>;
+            rotation = <0>;
+
+            port {
+                ox05b1s_mipi_0_ep: endpoint {
+                    remote-endpoint = <&mipi_csi0_ep>;
+                    data-lanes = <1 2 3 4>;
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

