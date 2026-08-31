Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4529147DFA0;
	Mon, 31 Aug 2026 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192695; cv=fail; b=uTtttnGpIWSJCKtGO3aRxPs/rejav2Ta0MRKL7I7/C2mDjICGp96J1Ov401vPFv5VtTIK7OrCa95LJHiop95nKUInb0MnfE4sWK9HOA/SMnEvWdV2J/JfmZPiDGc6jxV2Il///g+bxj34ZzNLhUvvxAr1GNDLXwoa8TDPBguBmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192695; c=relaxed/simple;
	bh=YWpy5QZbFcemCglnLza/bUX4kAS/g9XT6fIJZ67RY8s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EF1cAx8bEE9xfowlSSw/84eW5r8mMQqvpK31Rkdx3DArOQn4ML0/6frpBfNettOPzW21eC07Nm0V6rsogoQJTZ7ra0KGqzo2auIBWgRML0mwa18rUVq3DENTfKlkOkIuScismFyVK/W9/8yLWGKyOcqysXxG+WYXKh7RV34co6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M1oXlb/j; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M1oXlb/j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A944HL0njLq13JdShCXCdlkHSe4tjMilfSoCSSWKs8oI01Lobgdb3BwE0BYHTCyNqJq6la32Xlz5sKd+fxWcoFbS7FbYQnr4tzA+B2Z2F9+AsuLu1o1uEw16rLITJrolw4nhONYfmv7cH2bDe5qhXGbTvL+CBBbaRnwkF6+w3Et8/d8xzq6o2smu3Qe13ZfOOzgHUgI+xi4hRgo81aGKpr9BsGkRHcyQzEnvLPrbvqsdAJ7Pm51Ju69yDxjfZB6D38bhaXzzZ00ypU4HB7EUOuS3rmf2m38DIXKqUL8LWH8lBkG6G7Xpg0NwXY+HYB3gr5K08GCai+iotVKVQ5wsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lYlyBG5BX869qd+KbywHnlQ4C/x5m77GSngPb48Ta4=;
 b=lUFz2c0JNS0dDpwq7Pnnqjgh6qttDglRpW2+zS9dTGdjnKjLg4fnO3DY9oBpWN7+weqqRErlgcjR9ttYHnjk0XgMXOPtwLHj1pEtwkw6elfiQiFSYmeTF4K/eEEHs1vsyOuixKQt2b0XZAOLT56S6k98a6qlpUJ5Y4fUlsZHn5wIPZ3I5MeRvpu4qixk1NNyY+cjLb8fqKXhab8AZ4smprAOjRsyQ+p9bOlX0zQ9N2dp/RK+KJ6cec0OvfWdZZRf2vQnAmNrN6zj0leod9MJ1daFfKraUZ2y3ZUBpOoHFVqJYWefShsOpV0I0ogLYJSyBLAWKjr4ED3sPmjbyPOXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lYlyBG5BX869qd+KbywHnlQ4C/x5m77GSngPb48Ta4=;
 b=M1oXlb/j7Ms7fHp3HihzbKxl3PbO39IqDmGOPxKhsHvPmKwHNyYxdYQip+gNL8LyzxsMVYVy0jm5JC5YnCBdBoczPF/d5rzX12BAOp963DqPD6zkoZUtxfkKCNRhMCdWS3EYOI7TcmtqcqderSZ9ngP8Hnf115ZNNz2ZxxgFoL2XNa8QQM7IdDUqxOYuZqBL571aD5VkDoIhXN6G9RGBApGJKN01dLRx5bE8e5qrzvlUlUmtswRbz3KV3ym3fzi6QYF3eMhk2OKibTcRp5uuEBVLcxxdX0k3OzJMtH0Y4ChedK96myU+cE+FVFN6+ke7o/0//wdi6//s813v0GOplg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10774.eurprd04.prod.outlook.com (2603:10a6:150:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 16:11:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 16:11:28 +0000
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
Subject: [PATCH v3 1/1] media: dt-bindings: convert ovti,ov2659.txt to yaml format
Date: Mon, 31 Aug 2026 12:11:09 -0400
Message-ID: <20260831161121.4048134-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0209.namprd15.prod.outlook.com
 (2603:10b6:930:82::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: 00411c68-6e0c-4361-0c2b-08df077a83a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|11063799006|56012099006|3023799007|10067099003|921020|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QdZMeL4ZeJIGBl4bzdDgygtJ8IbSxz2CO/VibL9lH9ExZTBob6DeSumSp//2TNFznBXJX56istc5k1RICkCrbxDsFtOOULn3cbqo8ddNb6EKhWC9YuUoNlQkbKdZNU00rW82ONLG1uj/xs1w383AETq+wfjHAqMfMznUKuvGqd/OVQdmjloBdMCA2/5p2Ltae0vbtsFG7x0TZHeSm1KV4tfAWZR8jzLAMlY1ZsXEcVqi6Qs9VDq5/oLeDuu1owV/Ze7+7i0nPy94V3CpAx1GAy7YXUCz45syNsCKWnV1cPbIDHfh0nOlwWrvCm6DyMhB2wfR0mwftJDChd5qiOac5+LCGij29XxN3Vc8ulNDK06Hl7BQHAkcWpZ1dGdg+jF7llMV2hz1NolK95K1ye6bAYI1rNruCjcwaE4rY7oPxRCsd4484Nxds20r85RLIKLfxgGbG0sgghRduLodGsThh1pCeqfdCf8wicBIFZ/FIx0WHCHNPisDF/cH1JypCkcMRxIAL3xcheuxLgBFSMHOEPTNcevuMeL5lt8JcO8MzQ5JD93g58Q4Ce6LnG9rC+MF7UrxLup725eMc5wArKhhjY9H7bujdT88b/2RV2nfGGeGlekLpU5vHS+JPqZjX/v361Dl85+DOvFdNOSgHv02PiCJf6O/ufbN1wTIP48d2ng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(11063799006)(56012099006)(3023799007)(10067099003)(921020)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xAPU9Q4DHb8ZmZ3v4Mfg4b4YiQKhF7GCz06XKBotq8fQHb2f1DipEc8FJ36f?=
 =?us-ascii?Q?71LZuAKM2bBkqPkdeu8r75VKlxuB8HvEq/hh62zJR0u9sWUMsbEN+5YQ7GEp?=
 =?us-ascii?Q?zMpkSG8EydF87r/rxurJNqIPHLX45qIvaqZ+JaFMwcyDEjgYn91Cix7UkQvO?=
 =?us-ascii?Q?URw5UPAzCJPZ63TvktGDbdqHgvESKDcnBQHDz0TrnsTyF20PxXrM4R/F+NY9?=
 =?us-ascii?Q?5dlmeGZ3LetAtUXKMz1Ccds6cS6k9J7e0OAUxh7w6H7WWSdcGe7yRb4GHL9C?=
 =?us-ascii?Q?SvOKT4LWaVJWcWe7bJ86LXBL0ifiSuL2ZS/5KZPZ48tOqDDs/MRgd1Gv4C1S?=
 =?us-ascii?Q?H8mHyrXZ3vthidzV0ZXcksm6KGtYpSuqoTCwrRrOV0NDfQLSgNW44znPhpoX?=
 =?us-ascii?Q?N8OgLq5TsTWmitJjTFus7+QQHVBcxaLTIz8cpCUW5asXhAgJlXU5yK3V5g8k?=
 =?us-ascii?Q?Bagj+8WFMe9emNXeDDqYCwT2GuhjAX6dc4Ag/SwMgGHENi9m4ww7Vju2PuVV?=
 =?us-ascii?Q?SRKTbW9PYWQ0+1jyd/pI3YWt1ZWdsKlOIYC6Bd0YklXjM+oedvaAVy797oUF?=
 =?us-ascii?Q?d0nzWSojR33vvy4nJ8mV4f8NtKkf/J/4wTEJkCjpaxHHfrH5A6wBuN1zvA7u?=
 =?us-ascii?Q?yLtiTKA5Tn9UAXU39mWeUtAtxHgq3WU3wlbg8h3WYA/BN8c/D2GRRorfUQnK?=
 =?us-ascii?Q?A1t8ME0e5aA2Cf8JYTlLFrMWll8gKF14E7NwLkxIvbToX/c7wV7vTaSm/ZKS?=
 =?us-ascii?Q?pRRRgBgt8ZMDcgj2AneKfnf9u+CGd034m6UuuDCIdrNWI3qpUsqBcwtXFElF?=
 =?us-ascii?Q?o7iR+s0b170KjvbFons7x9hWv6OFCHlTJkoRK6yIATgtomdig74gBOhoml8z?=
 =?us-ascii?Q?eYbzCG/uVc31QQaDeayrK65osCIStRPidck7oTpQTKOTH20O02qvx7JIKRYP?=
 =?us-ascii?Q?tzIGiFm9LN0f1oWiHGJcEosfVIwaqJ1e2CSPt2EbThjpU4ve6M4LVxvzsoCl?=
 =?us-ascii?Q?FY6yrocM0XqzWJ7fLvXijyDvfqL1Ty9YZSte+xNkXxydrrF+QRRngbjau0X2?=
 =?us-ascii?Q?TFh3CCK5Jc/zo4mgOOQjDoH2ZV7AdUwYZGnYMDLZSxFmVrh7olG5yw1+wuhs?=
 =?us-ascii?Q?sEOdl8dCkyb6pEqnf2AMaOQJspH1yQV7Nxx4MS1ILO4KP37xDsAihQnZ6ZsR?=
 =?us-ascii?Q?646V1CP/DsTyXe3xhe6cz7G1O3KDsREPMLwI7PyKT+zWPNjRc9deww7eV1yF?=
 =?us-ascii?Q?y3JzdMp1fdJ1kuKq4Oj+nwQHXe46hKJJPJ3kfHTUpM4rRwCMGaae1dce8ZNj?=
 =?us-ascii?Q?r1re2D1UUBaPRVxdvGQzMLiO7ENMhl97zuUtZaB/HBQy3eWyrXFVCC5wIsLR?=
 =?us-ascii?Q?6OAUwSI1iIOQvWEkpta1Fk3ac/jWpw06/hRgC2vGELXBxY7e5PD4aEgjSljL?=
 =?us-ascii?Q?HvzmI2aX/ffG23gSdFVH+DFJU/5GuI7bHwSp0BGqHV5I/mSHhY2jerZJ1S6C?=
 =?us-ascii?Q?UJh6mJJbvbNvxfpVCKe4FG1QabNuiEPh5GwiXBW542vbzeM9qW85JO1Dsi60?=
 =?us-ascii?Q?/gOo6cgDyWUtyU4dXKlLoXASXNuVeVOjOFAe9MA7iqsxK5XuLj4cKv/9mr2E?=
 =?us-ascii?Q?cjyWnVazNNxYCE4CmMkdNkAVh+5HH0Vikk0xdylaw7ZIjw2TDRw3hpEEhJ4p?=
 =?us-ascii?Q?Rh1n/Ww2JeFoKFsp1qhGF2XLs6cUhI9s+B4e2fpmdbyqXESrjkA8X2b0SxgP?=
 =?us-ascii?Q?E69b6so3NgiKlpQsXrrr04fW2VPJ69HsZRp/Oj1QXD9Y9Ga2aIX9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00411c68-6e0c-4361-0c2b-08df077a83a4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 16:11:28.7531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AASBlZ5+soY6lTzvtYErnF4rWJE8r72TvoqJMwAWJyTY2F75UBQPLQAutdlcE0QOHuX2k66jT2UX1pHf2moldhlS7w04rW4uG6tjTdrfnUIblM/cJKN40XBPVbCn/0v5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10774

From: Frank Li <Frank.Li@nxp.com>

Convert the OmniVision OV2659 camera sensor binding from plain text to
YAML schema format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- update subject.

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

