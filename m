Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDCD4C2246;
	Mon, 12 Oct 2026 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826613; cv=fail; b=YJHazCh/JjZUSTaOlfq/YL0UJ1gNPdKImcthyJZdPnE8v3GlnQLxZBcsvdKs0jQ81pTW2ZRoCm19BpkFTfNucSxIlOfLye6tPxNbTOJWcd4vT3YTeJdC735ENYPAGkOXy2oBSl5Sy3DqtMPhsnCoHGX6IVMZjh039HriegjfCAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826613; c=relaxed/simple;
	bh=dFTqjqVHrPlRRZR9VNYnQuKOi3suXFPy4nY3sXMAIBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pdrb5LLKvlMJd2/7o7smkR+LEUx1QKqZ+OE8XQLmUHeLrBnR45jVqyDk8GHtziXoLgsdzawCDTrFYTfyldnLIKDOdbd54JxKssM6XGxW4FfCoXOsr3NdifOEhOytugqd5rHBB4bo5D+yJY7zBLEQOauDIBA7hAUwY/3c6MwbxdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j8IahGin; arc=fail smtp.client-ip=40.107.209.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j8IahGin"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRSc7fVzuCh9g7BF5Ra6itsSf6dOnq6yhxZ7BWmVPXa5xNN68jhRlm1PXzZryvjjBp8njiJMOvHOMgLoMs0LWOri9U3mxPFf0sZXjTWntArsgL7zzF+ZocBMd00ui0ja/LYY7fc8kUHPoZ3AY6Ax7rOnWQqQIJGDfDgWv8zqjBrtdoNwAjevEirGTBJ/S+cBtSDh1gGkuodmD82KdO+2eRAXUnX55riGKxxyafxE9WdGI7kNDyP7MI+kxRgsXEJQqm3BlVkGDIkDdiYps1B3IUu17q/bkqlhLeNn22wTqwArDfXW0yVS9CqIRP9Zd7HxRzVBLbdrf1XSaRH7ncc8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9lN03LeMeNKeevA3B2C8M5CZERxwsGkoa6Yq0WUWHk=;
 b=Z2Mm6fn8xBV/CJzzVFpGW58TK3Jkm8eEmI3GOP5jz+0NXFfGKDBdUxZ24FmSSrL0rN6PVeNkTNELK3d4o9M8y24oOUbIKIYH8eNOW761jStEMPMCIMclmEjtw/qL/f0UgrFGDIq7X3AaCjT09qenY+ty2oIVdtmUSAO/m9MN21UMHv/qAl1BG7ABay73GP1KdDRW7sHK4Qm17hQRIRehq9naidMzj6ngn1v5TLNGB1Ok8tizA4cyELi1luo+dk3rKLCkZBbM/SS0ASv4hXWdeZrl/2f8vdTtKOLrp4Gf2X19iHjJKOMA3KAZ7fIYCHjZqQc9nwm4AwVJIxUyzHNl8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9lN03LeMeNKeevA3B2C8M5CZERxwsGkoa6Yq0WUWHk=;
 b=j8IahGinxJjpfIY0YIlsByXaeCEbzZRoV6rN7cLcIk+JiBnY5VOrAoyQbiiAG0c+XI7sC3peEaPSdC0X07l0s2jR5G6anwVLVdRyhvhLXiyGz+t5flZjRV3MAkRgdRn1Q6jYjO9RZiZkQvsoB7U77AR2i8mntO5/OXbugYyIzEOUdLK1NkuB1mspOBIASWdc8ySTdk4r2h0QNwRoXSY0qtU9zeMfTpMB+ZEtc1n/IIqsFmhthGNeRoZ6P8/wSxp6UpRK1u3V74XuJRVhlK+Lnuk8WrIfuuQSf4ZeL40D1fwUqRKmH17jHK9cWUba5q4dVf2dHoGbXWaYIzSBvCnOzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 17:36:48 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0496.010; Mon, 12 Oct 2026
 17:36:48 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Donald Shannon <donalds@nvidia.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] dt-bindings: usb: Add NVIDIA LSTP USB adapter
Date: Mon, 12 Oct 2026 20:36:02 +0300
Message-ID: <20261012-lstp-usb-adapter-v1-4-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d62c33-33cf-4023-9324-08df288764ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|22082099003|18002099003|6133799003|261009223027099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	r6n3RoUZ3iPYWhRfrV4NnKrWlDN52wpFlY2vuTmu3EIg+yoi0JB5cnQ4JEIPRnwzH1bhC65FLyqEVVi7th6rRlSUjmwnpTljZCo3P8TzcDwMMGfm10tu1GqQO5XEAu6iGGEw9AMh11e87Pd8uW5uff5nrqKPNHlB209kUKCntqlJPqNFwxsFYDRP6bO/LHLGm8/gIusEMUYUX8whA93bpZeOqCHAplX7xgt2n4xOItYES/zdNwnRVECMUOuMF9S903kJ4lFX9hxIRHkVxHWG2eAIa/rMmB8dZNp+uYmOAz0mXbacTnKn4gFZNhE+qMt6LKFPmuxyKK11D0OS52rGf8NVb8z4aW5ADqnjfdt82wfQhYqDTmRfPC+Oji/ghEbkzcip8tMNVuFqcdCjhV0Oeh8CGDnBpg6Swvd6BNW5pCvVSKLlN0ZPvdP3NekSgybG/H/ZBNRCNBFWsPh6JdOXeS73ObEat7tZUqop0bQQlU8zV4PF8vdmG5H0NUMyUj5weDhjp86SqDpzj7bj6Wn4XQZGg5dra227HLqEujHVApy5Ssvn8yhkHii/U0wZOAMnL8kGjztggV1EtxP6yv7EeZkuBda8B7QojJzzYStf2WdtJOLcc5rl0OCBZK6F+AU2g4rsUW7wU+TBFbclqzIKOnzgZEXdSTenRghbt2n/mLI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cypdKNUoBvku/w5hMzPL1cOsKK/NUYQdr4AULn8o75h7r/5Va0VONzwJvvIY?=
 =?us-ascii?Q?fsR92jYIq4P6Wyc8vG0bej0M01rDX8ZdyABYL4K4DLl/zW0FBJTddH+G9quM?=
 =?us-ascii?Q?BgNgUPku16aryUE1hpnRXUZTkD1IyfgdtHdu40s23wufjDp/W3dTGWy5+uxe?=
 =?us-ascii?Q?9Dn10gMxpcwTUmNAMW2KseKLuJpZI/DjNl6nzsgCQnoFYTaVybHP4FYg3ql+?=
 =?us-ascii?Q?lZHnobrCuLwUTjOoEDvuhtoeNsoIIejetxrnyfiW8g4i3GecCoimjL98KaoV?=
 =?us-ascii?Q?an7iUQQft9IyzZQm6oaBw2RAs8PBvAuN0M2OrmoSWR9UXLcUe4952EKoXXyl?=
 =?us-ascii?Q?qlbVly2efjsDv+9NMowbNQl826M1+v7PMMNDDM7tOGW5nlvhMagOWk1wvag+?=
 =?us-ascii?Q?n65d01mkBDrnwXoXCnH05ilIM/aajTzZ7eqozqvO+OQghJoSMIGpSBxuizQW?=
 =?us-ascii?Q?lg/JCxvgOg7YodkJN2x51CflcnD5ZdPlk2eojTurtMWsAIL/IXFvDy7bQXCM?=
 =?us-ascii?Q?Qf9HHhAVRpaOfGq9nkNZmzeMqCLyANojV80NNKm46PDv3dCGbVfHI2ZJqVwZ?=
 =?us-ascii?Q?+qg+C4kiP8RUIxv+ugG+sbRmOxRidxRZDgwzyuvLpMXtejGx3PJ/XM6APc0B?=
 =?us-ascii?Q?uRL2IPQxun5ztxEU8Cek40OsN9lL4bGWvmYKBrTuIlOALTw5BCtYGZmojXb/?=
 =?us-ascii?Q?G4CuZgXLds/Dlylan/kgFpyuvCeAX0fJ1YW5/HkwMc22cnJ3e16csaZcRKRr?=
 =?us-ascii?Q?udvl0yydN4lZGQnG2Cn35madCqW8eKCLJLrgVWLJ0uG6VZTAYw/RMaejAz2s?=
 =?us-ascii?Q?a3hClgijxxHvo1Z8Wv9OuC9yi53jylpcwQExbsOUBgSp4yOfvtbi2cXSv+XV?=
 =?us-ascii?Q?vmqgk294g/fzSOkojXzQEc+Kd7hphNZ1/fbtW6L30zGgzlGI0T9RGhJA14YX?=
 =?us-ascii?Q?K/5d8AYf5iC0zeKv7SPFb4dqYkoSGFKz6qYVQgjMgtn65xtPhOaa5zsbgCCp?=
 =?us-ascii?Q?Tand84RGWSbyRUJAaZ5YTIB/+/suk25e9dqoeJ1o1oh7TcUALxm4EjFVwYgi?=
 =?us-ascii?Q?elXkJ+sEreLE9/YaVgRYx/zYwmXNjUh/Fm5gd/FxEdXAJ2Rm+zZJdUVehKE2?=
 =?us-ascii?Q?ncWCOkSZdaKGJQ9R+UCUx9931qdFfHUzA1PRaqSuj2x5B23sw+MNrRxRzibP?=
 =?us-ascii?Q?NX29ZTT3185EmCj+nfyOG6VIIlSTOYQAOeQ9zCJiLJfodlE8sMwvVxbTGrem?=
 =?us-ascii?Q?t4vbLJkJAp6hn0anwonMhMKTMq5ws5qXY/U9ziic+g1ZgZvtveKTz4IRXkTL?=
 =?us-ascii?Q?2ywSi6c+yWp8fD2Cx0FWrqAZ/1XqTWOki4kCsCu7CtA1f7QHgdBhSn289KsE?=
 =?us-ascii?Q?hjHCaaKK4DE1S7R00V6yXXUg406VfbCD97DBi1QViKT82YarGhbiFiIqzQcq?=
 =?us-ascii?Q?MG/lY4Zu9+2W3r8TUP82U8QJWDUyy+6RdI9cBEgHMR8qrEqh+FK5MoMyo8cB?=
 =?us-ascii?Q?SQdqe4CEC7yswg+gSuBnWES5QCZDa4gLCcw03eVDztjSQOLoUtyvR/3qZdU6?=
 =?us-ascii?Q?77+S3QwyEXbFnqvsidXTwcpuG7+5OhNSiBYYqdtQzGsM5pXFgvdcbg1/33Mb?=
 =?us-ascii?Q?pbU/tz9KLZMFolgfQE+8atg+LSf1oGB9XuqiE40869iArH4ZVUz+ZieoIZNp?=
 =?us-ascii?Q?CvsPtsHXUzK218Hiwlfy/gvuY2quaq4hbFCTRIKg19zJBWdWq+E/Z1vzGdQ5?=
 =?us-ascii?Q?nQJ1d8meyw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d62c33-33cf-4023-9324-08df288764ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 17:36:48.7399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3zjLewIPjBPJb5VTuBsRJIRlkaTf1LMvObEgtyEhZKnMG0WFlrQnC0O5rdMakLjYlgD1gWPyKbUWyYUSOoUdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012

Add the binding for the NVIDIA LSTP USB adapter. The device multiplexes
SPI, I2C, GPIO, IPMI and UART channels over the bulk endpoints of one
interface and reports its channels itself, so it needs no device tree
to work. A node describes what the device cannot report: peripherals on
its buses, GPIO line names and hogs, and LEDs.

Channel nodes go under the device node or under the interface node, as
usb-device.yaml lays out for the device's descriptors. The GPIO, I2C
and SPI channels reference their own schemas. The IPMI and UART channel
nodes are defined here and carry only compatible, reg and status; they
exist for status = "disabled", which keeps a channel the firmware
reports from being used.

Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,lstp.yaml  | 280 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 281 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,lstp.yaml

diff --git a/Documentation/devicetree/bindings/usb/nvidia,lstp.yaml b/Documentation/devicetree/bindings/usb/nvidia,lstp.yaml
new file mode 100644
index 000000000000..62b21051ab20
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,lstp.yaml
@@ -0,0 +1,280 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nvidia,lstp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA LSTP USB Multi-Function Device
+
+maintainers:
+  - Adrian Ambrozewicz <aambrozewicz@nvidia.com>
+  - Donald Shannon <donalds@nvidia.com>
+
+description: |
+  The NVIDIA LSTP (Low-Speed Transport Protocol) device is a USB device
+  that exposes function channels (SPI, I2C, GPIO, IPMI, UART) over one USB
+  interface.  Channel traffic is multiplexed over the bulk endpoints of
+  that interface.
+
+  The device reports its channels, their types and their IDs itself, so
+  it needs no device tree to work.  A node adds only what the device
+  cannot report: peripherals on its SPI and I2C buses, GPIO line names
+  and hogs, and LEDs.  As for any USB device, a node is matched to the
+  device by position alone, each level by the port number in reg, so a
+  node suits only an LSTP device hard-wired on the board.
+
+  Each channel node is matched to a firmware-reported channel by reg (the
+  channel ID) and compatible (the channel type).  A channel without a node
+  is still usable.  A channel whose node has status = "disabled" is not
+  used at all.
+
+  Where the channel nodes go follows the rules for USB device and
+  interface nodes in usb-device.yaml, which depend on the device's
+  descriptors and not on its compatible:
+
+  - A device of class 0 with one configuration and one interface has a
+    combined node.  The channels go directly under the device node, which
+    has #address-cells = <1>.
+  - Any other device has an interface node for the LSTP interface,
+    interface@N with reg = <N C> (interface number, configuration value).
+    The channels go under it, and the device node has
+    #address-cells = <2>.
+
+  For interface 2, in configuration 1, of a device on port 3 of a hub on
+  root port 1, the path from the host controller node is hub@1, then the
+  device node with reg = <3>, then interface@2 with reg = <2 1>.
+
+  The reg of a node on a root-hub port, hub@1 here, is the host
+  controller's port number, which is not always the port number in the
+  USB path.  On an xHCI controller it is the one-based index of the
+  port's register set, and the USB 2 and USB 3 ports share that one
+  numbering.  A node on a port of an external hub uses the hub's port
+  number, as the USB path shows it.
+
+allOf:
+  - $ref: /schemas/usb/usb-device.yaml#
+  - $ref: "#/$defs/channels"
+  - if:
+      properties:
+        "#address-cells":
+          const: 1
+    then:
+      patternProperties:
+        "^interface@": false
+    else:
+      patternProperties:
+        "^(spi|i2c|gpio|serial|ipmi)@": false
+
+properties:
+  compatible:
+    enum:
+      - usb955,cf11
+      - usb424,4940
+      - usb174c,2214
+
+  reg:
+    description: Port number on the parent hub or host controller.
+    maxItems: 1
+
+  "#address-cells":
+    enum: [1, 2]
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^interface@[0-9a-f]{1,2}(,[0-9a-f]{1,2})?$":
+    type: object
+    description: |
+      Interface node for the interface that carries the LSTP channels.  The
+      configuration component of the unit address is omitted for
+      configuration 1.
+
+      status = "disabled" disables the interface, and with it every
+      channel below it.
+
+    $ref: "#/$defs/channels"
+
+    properties:
+      compatible:
+        pattern: "^usbif[0-9a-f]{1,4},[0-9a-f]{1,4}\\.config[0-9a-f]{1,2}\\.[0-9a-f]{1,2}$"
+
+      reg:
+        description: Interface number, then configuration value.
+        maxItems: 1
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
+    unevaluatedProperties: false
+
+$defs:
+  channels:
+    patternProperties:
+      "^spi@[0-9a-f]+$":
+        $ref: /schemas/spi/nvidia,lstp-spi.yaml#
+
+      "^i2c@[0-9a-f]+$":
+        $ref: /schemas/i2c/nvidia,lstp-i2c.yaml#
+
+      "^gpio@[0-9a-f]+$":
+        $ref: /schemas/gpio/nvidia,lstp-gpio.yaml#
+
+      "^serial@[0-9a-f]+$":
+        type: object
+        description: |
+          UART channel.
+
+          The device firmware sets the baud rate, framing, parity and flow
+          control and reports them to the host; the host cannot change them.
+
+        properties:
+          compatible:
+            const: nvidia,lstp-uart
+
+          reg:
+            description: Channel ID reported by the device firmware.
+            maxItems: 1
+
+        required:
+          - compatible
+          - reg
+
+        additionalProperties: false
+
+      "^ipmi@[0-9a-f]+$":
+        type: object
+        description: |
+          IPMI message channel, on a device attached to a BMC.  The device
+          firmware terminates the managed host's IPMI transport, passes each
+          request to the BMC over this channel and returns the BMC's response.
+
+        properties:
+          compatible:
+            const: nvidia,lstp-ipmi
+
+          reg:
+            description: Channel ID reported by the device firmware.
+            maxItems: 1
+
+        required:
+          - compatible
+          - reg
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub@1 {
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* Three interfaces; the LSTP channels are on interface 2. */
+            device@3 {
+                compatible = "usb955,cf11";
+                reg = <3>;
+                #address-cells = <2>;
+                #size-cells = <0>;
+
+                interface@2 {
+                    compatible = "usbif955,cf11.config1.2";
+                    reg = <2 1>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    spi@1 {
+                        compatible = "nvidia,lstp-spi";
+                        reg = <1>;
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        flash@0 {
+                            compatible = "jedec,spi-nor";
+                            reg = <0>;
+                            spi-max-frequency = <18750000>;
+                        };
+                    };
+
+                    i2c@2 {
+                        compatible = "nvidia,lstp-i2c";
+                        reg = <2>;
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        temperature-sensor@48 {
+                            compatible = "ti,tmp102";
+                            reg = <0x48>;
+                        };
+                    };
+
+                    gpio@3 {
+                        compatible = "nvidia,lstp-gpio";
+                        reg = <3>;
+                        gpio-controller;
+                        #gpio-cells = <2>;
+                        gpio-line-names = "LED", "INT";
+                    };
+
+                    ipmi@4 {
+                        compatible = "nvidia,lstp-ipmi";
+                        reg = <4>;
+                    };
+
+                    serial@5 {
+                        compatible = "nvidia,lstp-uart";
+                        reg = <5>;
+                    };
+                };
+            };
+        };
+    };
+
+  - |
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* Class 0, one interface: a combined node carries the channels. */
+        device@2 {
+            compatible = "usb424,4940";
+            reg = <2>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            i2c@1 {
+                compatible = "nvidia,lstp-i2c";
+                reg = <1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+
+            gpio@2 {
+                compatible = "nvidia,lstp-gpio";
+                reg = <2>;
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a45adf95d36d..3eaae7388a69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19573,6 +19573,7 @@ S:	Supported
 F:	Documentation/devicetree/bindings/gpio/nvidia,lstp-gpio.yaml
 F:	Documentation/devicetree/bindings/i2c/nvidia,lstp-i2c.yaml
 F:	Documentation/devicetree/bindings/spi/nvidia,lstp-spi.yaml
+F:	Documentation/devicetree/bindings/usb/nvidia,lstp.yaml
 
 NVIDIA VRS RTC DRIVER
 M:	Shubhi Garg <shgarg@nvidia.com>
-- 
2.43.0

