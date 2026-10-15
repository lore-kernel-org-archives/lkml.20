Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021139.outbound.protection.outlook.com [40.107.42.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BD240B11C;
	Thu, 15 Oct 2026 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044267; cv=fail; b=NWL1eja5x75JtxxYAXrvozEI1Ndq9TW2Yh/FYAxa2YxIVNpIbO26iMEZhtif6cJv/ZVM2dS6pvVBLyRJaviPwZwrZ11eADQFsMEd0Ppmkv3iM+O8eA/l0RsceSRrhsBHOMvrPRgcN96KqPyWohwxIxOFfxV5lkwGL3qC+OsAOow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044267; c=relaxed/simple;
	bh=hzII356lJSxO0tCoZ66hewlozO26GPrNJAYjUCQUJ7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AuPtqJU7YpnhmjKDn7YG2oojn/jb3GnXEh/wpcFqOO4MfsomPVDuOusJQjfqiLKNX3myKn4/uPC7A360nHSKL/bAtZjadP3Wm6WuOWb968q8btK1ZlfWMak+CnKwdt9ssvKmSYYGseE1xsxLiVe06bqec4KsQ4Hq64GRYJp4u4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com; spf=pass smtp.mailfrom=irondevice.com; arc=fail smtp.client-ip=40.107.42.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irondevice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/5bNMp63YksytojLJucZT/FmbQ9HlHchGYDSFaBheRtMemShBf0+hX2jsfiblPmm4cFc0l7SFa5Bn6f/mk6vdl9of4eNCzwJeLXQ0hgf2zwcgukWoYmpPJ2/n6R0GfNP93h5AVXuSXMb0+ZmoO/T4braO+WQnnkY+BLsEwOYr0ODWS2hkFc6Xs6dVjUdYYswJYdAQYsRXs+KpAFapIG9PHE5ofDx+cmnPWzHGXsz37NysCBTDRYcCczGc4hg90MAW8RoNRGYBtdSGYgsUhKhaNoJMn2qUHOOuBGf1bILgqUU9VQmUkPNSRUd8RAzJ6kKUYIr6VSyeeKZwM+5yA8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4embnqnepzBOtZg9UA7gmW3IiYLORuFWYTcwSA5bBQ=;
 b=uqpJ1QmRv0y04FKjM7Y1qTLJsnYw9/yu8SPHalEBNs+IXz8g8Vx4dThjjruFwevB0TYW1Zy9nQpu/Nn+jj5J6HONbeKHqMAMpikH2yYYXmY52iqzY/3VXoQVd7nHkJnosuvfmj3nBznWsXBNJO4a2JXSz/Y2qQRugfbtSn1jNjQd0gMZQ8+8tbOeFhEK9i7BHduf0mhkBPTC9r6WTvM03sPJhOFVwH+ozyqKK4ogECGgKW3N4tq+a/N1iiF6J9Pdcc1CBWaLz7prxIrAcx8GtMw/HxZzFlo88lB54QlxpXUXRWcRmh8Lu/7SaQr7yhBUtnsimYqdooB74FpdFWHOlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from PU4P216MB2349.KORP216.PROD.OUTLOOK.COM (2603:1096:301:12e::12)
 by SE5P216MB3199.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 06:04:18 +0000
Received: from PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 ([fe80::544f:7b73:fe81:9c85]) by PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 ([fe80::544f:7b73:fe81:9c85%5]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 06:04:18 +0000
From: Hyunuk Son <hyunuk.son@irondevice.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kiseok.jo@irondevice.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunuk Son <hyunuk.son@irondevice.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: Add Iron Device MA5311
Date: Thu, 15 Oct 2026 15:04:06 +0900
Message-ID: <20261015060408.128711-2-hyunuk.son@irondevice.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015060408.128711-1-hyunuk.son@irondevice.com>
References: <20261015060408.128711-1-hyunuk.son@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0136.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::15) To PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:12e::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB2349:EE_|SE5P216MB3199:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0fca14-7f0f-40f3-7f87-08df2a8225e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|23010399003|22082099003|18002099003|10067099003|3023799007|38350700014|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	fyxTzrIHrGL08+a3bHpCYQgBGFq5kQCXOSOP+NLNUwor4P7W267QUU1d+4ZHV6a0FxapXsF/CuPaqHPLoF1k7WAZsysUVyT9ZuyvHRGyOhExD7BwzG1oAjkqzfsdBmXqJ9DFi04wylZ3UL753jPp9VXjtpHL+WABCqpLgxc05bsGfPiXGZKsV+sYeyqJybSk/T/6IGk9ku5jIt9M3flVY/0BZuyIjfEucSNne43woSxTLJXsPwue8KuWjASn5Q3vMGS6v48UjK31KiPE2OguZjpx/N4l9oWbQvPmtmGoiJPQHZ139cSwSjL+9zvE9z95H79Id3fjzD+m7CmO0QZiqllkGgXxrlpQz2dEXb+58Pjp46+LuixbrYsS4qHr9Aw7UmkTRmHw1GY+Kyhandm1ErSRHVkljCgYqOiMEt7nMoxm3vhEGlp+JUYjybjBiVoiq+IbyqQibJhckhh+/x1+gxP/uKLw7eVFq0PX/aDuWzpJJimHLkdN7dWWKUd04CqTz4eBBOFrAWsM8mMvz3dGC8N0XdJLaPu76hCnmNfKe2CwAPyAi/JipV4SXjTLM9aOVLi+/JmeuBhVfCIL4G7QSHvpeXz3QZBXM/OmWuPusCN26W865Vqd1qvYSGxgJ4SNJA34FCWYA/IkcdhnsY1r4Q7r798ZgmIp0Dkh0JkpQyA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB2349.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(3023799007)(38350700014)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qp+3RJdO/46n2AQ7O+6WU7BrbEwxHQcnzeTapOZ1i6HBDWldPocSC6S2zwGL?=
 =?us-ascii?Q?rexMJ3p8+lqo/JUnT3LkEaWHpELt5qGAnDlSsg4DYwOKg4ag0Il2LpMRpGCm?=
 =?us-ascii?Q?+qzA3EJxvlLHH/qNGmkR0iDnIXVZ7GxyfAEweZDtWp4IjwBuFVpYrHLCoR3h?=
 =?us-ascii?Q?LvnBEhUcoDeEgHaVDY8sEKTUF/KdutH3XmTJmfkz1IXnH0XN7AS/Atm6op7Y?=
 =?us-ascii?Q?sCTwE77PSpuaMHqS1gP8n4GfNSZOX9aERSZZa/JbCrqDHR8XVAKQbF6rORnR?=
 =?us-ascii?Q?R1PDOpxIUP7VhjI0SsHbD1YQc/+5H4dIc2QdBh8ps3R2hMZnB+TzU9MSbIA1?=
 =?us-ascii?Q?yr6Ap+y3JmnXhA3JwJvfQRIZObb8SWbXQ9Z+j7NUJkZUE6ZUvLffDQbsTBwD?=
 =?us-ascii?Q?aIEk8IUECY1PPObBvw/0+YLiNigcoszJuZkhNRwS7I3D+Cmw9H8/Udf+f/nI?=
 =?us-ascii?Q?NhEWenbFiCfY8E0ypUzNsAWnOnpmvAdcru5BRyi8HtCCgHMwmuu18aQgNVg8?=
 =?us-ascii?Q?KuG9+Lku1meRFyNxRnxa4fnPmyZlGCOi5EKcq0EPUkGRDyRhCEPKIdycy4aF?=
 =?us-ascii?Q?z94D2RMNZjH6lEAcI/IC2KTVIf62cfmIWu6sXoYOv4hd8qTAyr3c/uD1F9Z6?=
 =?us-ascii?Q?6RBs9Z7CushMaltzLFXSHQjEs9rjxqVxLjp9DrLmxaT7GFBS/ds6Ei1ypPlE?=
 =?us-ascii?Q?Do0NWtJR6U8DWssCNYBP9AzNxS2lQJTceDRokEN5Ej8dqRv6FCv2/xHDZF93?=
 =?us-ascii?Q?S2gkJmbkh6wsfFlnvWjRKR8i89s7ZI5dLJIb7Up/QX9mH4ERzKp7WVtR0KLC?=
 =?us-ascii?Q?wklxhXU3MfFxv+LYWEo7T8QBed6IZkpYyJwK+qS2rPtno2jcy0/0YM8w8NPQ?=
 =?us-ascii?Q?1XMvKQCL4QUIM07y4HMgJRQTmeFsAEPiQsI0d4kEnSnC52O9K/3b3NC95ucc?=
 =?us-ascii?Q?GmUWaUNUxP4feLnjCfqDwvizHOHaPQT38anHRUnBB79SHPgVtqNutjRjNqvj?=
 =?us-ascii?Q?q87/UYle/sJPaCjDTUQpmwtOikzNFZZs8+vCkTOPxY438HkVOianelLyrREw?=
 =?us-ascii?Q?W73E74OqhNsmA+B260pRM/JUNRi76bH4mrcRWlG+5wTWuJB8UwCWfAOT86Rf?=
 =?us-ascii?Q?AcVCtHA74iQvvBOZlz55jrTgCoD6Ws5q4H+hPaE3z1/8E+Ap7dO+mYpTMOIQ?=
 =?us-ascii?Q?Kg2Or6GGa9SCXL2dbuI7LONbtObno/lY3Ea2QwMNMuxaimA22VWHUXawdGwL?=
 =?us-ascii?Q?YCaef/LjbUmVPB4ZA60JHcvJiFpfQrGu4O59mWEVcEA3gm+b08+CVywvoawl?=
 =?us-ascii?Q?bpcSvGDqR5OCJiGCE1nFMa3eNg5aBpEgMJDbjAbXP6K1dwVxp5ognEJf2Clu?=
 =?us-ascii?Q?6cb98DmoAgFcXdbeo8GtWbPILxxNsKWRsjUAnHRy9dbgbGNxDZgkJ31jmXr4?=
 =?us-ascii?Q?iKx0uvbWzwAU8OpoRWpiOP+ztrWqvKBRek7T4HjHkpmLnxawC4nwcnT1Xb/T?=
 =?us-ascii?Q?Ge55xXboo12AF5fq67GhjnOq8UMpNNITJTBm4vbt4fCnFKx6emqyV5sX/H9U?=
 =?us-ascii?Q?cRx3cgq/oyVJrFrKVMobVANR5mV4mrVWbJoujXas05kUZfyxYPD+FiowI1da?=
 =?us-ascii?Q?NbI/YyOC0WUuBOVyZxRKlA1vFVxqJRBkrsC/aNbWXWHmJh03UiDn3Nw0ol1P?=
 =?us-ascii?Q?PzxerOdmVpVoWmTOHx2rgH9Ba8B9Z34eD5OBpv7rAxjBMgojvufFFrj4dHOz?=
 =?us-ascii?Q?q8fO5Bm2qg=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0fca14-7f0f-40f3-7f87-08df2a8225e5
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 06:04:18.0548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaCFD8RSxU0X38/cucSmyyZOAJOFg2JFEJvUdwy+ez1PS58wRl4lVxAMaNMfzCkzVwIBgHKrDknZzIsU9/oEI2Io62dmyzPF7pbZMGVwVWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3199

Add a Device Tree binding for the Iron Device MA5311
audio codec.

The binding describes the properties required to identify
the codec and configure its connections to the host audio
controller.

Signed-off-by: Hyunuk Son <hyunuk.son@irondevice.com>
---
 .../bindings/sound/irondevice,ma5311.yaml     | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml b/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
new file mode 100644
index 000000000..ae4a13c29
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/irondevice,ma5311.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Iron Device MA5311 Audio Codec
+
+maintainers:
+  - Hyunuk Son <hyunuk.son@irondevice.com>
+
+description:
+  The MA5311 is an audio device providing digital speaker amplification,
+  analog input conversion, and audio DSP functionality.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - irondevice,ma5311
+    description:
+      Requires two I2C Channel.
+
+  reg:
+    items:
+      - description: I2C address for control registers
+      - description: I2C address for ADC registers
+
+  reg-names:
+    items:
+      - const: control
+      - const: adc
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the active-low RSTN pin.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt from the active-low INTN fault and thermal warning output.
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@3e {
+            compatible = "irondevice,ma5311";
+            reg = <0x3e>, <0x3f>;
+            #sound-dai-cells = <1>;
+            reg-names = "control", "adc";
+        };
+    };
-- 
2.43.0

