Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.127
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793093600;
	b=3haCkSmWQQcb8DWAqr0IVnRTCA2sZ0DuP5fzNGmzkwH7KqkmzQibZAcoc9U0qRk/ig68
	 ElMQVvqxZ9YUFFBxU+q5r2SX8BoT3jELMXzD+/Z0j+r5Cun/PKHvOJBEqMPk1GSPdCLqD
	 qYYd4e21ybXbWGqZT8knhltqGoW+5+Ky5UPu1EKOdb8MTXy6sqPFivb9qCVuwPIwi7yR5
	 gkWXNX+634LNsP1psZmlsy5jAvOT59TW8jSGtA79mnOfBrnCTXNqUeNJi7IRchOsoSS9I
	 DdzQY7qo87e+qAj5Bks5J9D37RCtrz8OhRkZkfc3jznpi24xFI9qLMg7KnQsCGzok+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093600;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qRA3G/QOvozGxKQxwIrMH8UcsMDcL8ZQbDk+CLa+Pno=;
	b=vCoqE2W5kP+mawIwnPi1OUFul0XOSsnILflPcOEOkZ+IF2T3yrCBAFk7zHeOkkD4zYWu
	 abI4e++kYKUU5tzGE3oa6WHuRBo9IYvLFDnwZzLyAn1JCfTrGvN6krGIDz4mcA2pgXAeZ
	 ZDJ/QFOe74zD06p5X4+FnVVOS7p0ffihongEHIHZYEaEzPqMuOfs+Hs7C3EsXQKw4a5jA
	 DqCWygH5Z1/wWLCK/hIwcCsi6aGPVnqB+fGooIpOmUxVjTjCZ+41roWzEOYQ1qEHqoqR+
	 7a4TEDhTBcotXna4aJFJmEuX40FF+Dk88fKAs4lt1mThFi6AX1dWDeIXJk/G7gRRDPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=irondevice.com;
	spf=pass smtp.mailfrom=irondevice.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.127
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021127.outbound.protection.outlook.com [40.107.42.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3C2606A325;
	Tue, 27 Oct 2026 09:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC3C2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irondevice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpHoPHv9Aptuh7EEO0QC2Y36czw6XzrRi+SgHXIUf9DbQ3eHlnHGzXtPO1JnMLnq7aEn1lQK0P/rveDAcO6ahUTvVUlkMHh4Y2xM1Vnc1esSVaLx4dAaoArCH2pWP8n/dtZIKdKeVM5TpWbcuvrkqo5FYU+otpuIXXBcz+CW4Xd7LBRIvCiKIVlVlxGlOoUJatTiCT6tmQKR/SBeJqJAqSx2qUQvK+jrdJYvJJ8oLk69DqyeNRHU6PyMbfJHYoOd81UeWYGBDl0JlQS1Apwwt6nM7fkT/gOd4WShBl/PfPtC5Vwzn8Wt/ycEaZPNOUf9APob9ymJNSo/MIWUs820DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRA3G/QOvozGxKQxwIrMH8UcsMDcL8ZQbDk+CLa+Pno=;
 b=r9Kfw5l7AEYsKqmAKhyOpTvuKYYEYhHULxkkY+bgMly/Vx5d0MTTjRbMEghnEIMhMbHNycZR5so9JO+xvnra8eMRmT53bJl8Jm0IyUePeTa5FtL89g38JAN0u5qpgqDDScSxHE77euAryNmIyCqvHuA1LqrVZs4cXA0B9Fg8xIFuyYqnfLmZ06AwrDZhVnx4A9shOxProRHYBFD8DTEnZdr0Tv5FxyXUyRSY8w3KvE7BCq9iIvtAY7hIy78pnG1KVD+frxR/CSu09UCXpIGGYEwT/xAD5qBioVVViotX5VnjyQL52fYPzFWcQ3WxSArV9nwR8nEDhWuUU0OR9/yDAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from PU4P216MB2349.KORP216.PROD.OUTLOOK.COM (2603:1096:301:12e::12)
 by SL2P216MB1531.KORP216.PROD.OUTLOOK.COM (2603:1096:101:32::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:33:17 +0000
Received: from PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 ([fe80::544f:7b73:fe81:9c85]) by PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 ([fe80::544f:7b73:fe81:9c85%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 09:33:17 +0000
From: Hyunuk Son <hyunuk.son@irondevice.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Kiseok Jo <kiseok.jo@irondevice.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunuk Son <hyunuk.son@irondevice.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: Add Iron Device MA5311
Date: Tue, 27 Oct 2026 18:32:31 +0900
Message-ID: <20261027093232.859755-2-hyunuk.son@irondevice.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027093232.859755-1-hyunuk.son@irondevice.com>
References: <20261027093232.859755-1-hyunuk.son@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0198.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::7) To PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:12e::12)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB2349:EE_|SL2P216MB1531:EE_
X-MS-Office365-Filtering-Correlation-Id: b6558150-3bdc-44ea-7aa9-08df340d5504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|7416014|1800799024|366016|18002099003|22082099003|261026121527099003|3023799007|56012099006|10067099003|261009223027099003|261022105027099003|38350700014|261026140227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	sGjr7iOo+3c9eRco27UmArsuvFVuqCvNm9aTezAgOUfQaA/bWQUH7HrAAP2B4euegTrzaRE3oJvmU+vcUz111j4t6yP1Tl/T1pw7kR+JDHGJyO9z4prsnTOKahS2cPz9IH1nDpgHPm//OU0+/2e43bci7hGAraNFmJYcP93AX19i3czJJ0gFtnKpqdCTJwj08mYhPK6KgRQ2qR1kaYH9AgEWw20okk1xkLb7rCRoyJ8iH0Ls2eICB7S+O5rqHbAUrpgxQ5z/aFRXclbgMNFwkaNF7wYTJpAWti0AeV5EH2uoxnz10aVVZNaH4tLMBGecUdiJu8WhCNKBEP7vrZjIhBcJvXx/wgPSJJNAPpqtRoIUFcVK5e/tyhps97dTTTRDV50kmI6GLzqB4UxVFAOATz/4/tXT3XxwQRvyF6ptpg52Y66zSPstJ/Gs6i5GfYdH3O7qNkU9EjplF7OZLM8nlnkHbJJKmcf2v1s6/sPkp5yARNBDLJSyymgENK6HsfZPAFxGFco/5+3+xhMvj/JTl9CrUwcYLyN4HDgyJ23Q8jp8Ya473qtH30QuU7I81m9LGraabh2kKBGhesHaa01mYdA5Od2C0S/rCe+aCFRuBAIqTe+Gl0cRLNeIJmdRLeizTrxqcd2FspTxRIFXEwDmAd2w6AGfW7oPmPPBIsEw3aU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB2349.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(261026121527099003)(3023799007)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(38350700014)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tmt4G6tEziacQjnhFyj82abrDgRalbFj/cts5rGAP36z26S3xbbsW0fiVVx0?=
 =?us-ascii?Q?g3vb86cBSc0Uj58lV5B9EA3jWW0LjjLC5+VjfW67y3SB4giAp6B1jKzagXsP?=
 =?us-ascii?Q?Nn/oCELhIkdfuTJ2UaMtlYtLUOOgwD0l0mVXgWt+07ALjExLUjzLhnpZAA8m?=
 =?us-ascii?Q?ggyStnb+v/HTgjKGTiileSf+gBuiiGKCeTY3syxd4cEuQcaQm9WeiYo1F4lj?=
 =?us-ascii?Q?ycJMtWrv4fCmKUxj8JItDiWMeatMFiTnn+WpPAwqLpr/XvUXPSkisJzAOLxq?=
 =?us-ascii?Q?hDk7gbYjN0QK2z9kTntiSWddptV6XejnhF884g6Aq8FR8eqB6sOxR0clLczM?=
 =?us-ascii?Q?b1NtSh6ranc73HoVxHqnHyoM3iaoZ3j0Iqj9pM6vntVIkMAl8745rqrTWb/5?=
 =?us-ascii?Q?MnoeQAxkyJvZVXOXvQ5+Nr+QKP6tO9kay98ZivHrYnCtoOVumWnJtIGYg1oa?=
 =?us-ascii?Q?ZVvLunG5Q2QAVWI6fk83SHAXemRwD4Z8jFWKa1cktlx5abBGC5HY3/O41n8P?=
 =?us-ascii?Q?1DnsrJAu8y6HzzP4ZAxEsSgQP9JNZWFj+cHYdmeR/aJQBI0CuKu366gECJNB?=
 =?us-ascii?Q?2HgxhUF45fitw26WyTcaaEvL62NKKHAAyJUr2G27lBK/TqgcawlJBtD5mvDb?=
 =?us-ascii?Q?igsl3qutt6dodIuIlTCjauvjrRrCkUqdCHo5LsecrlTDwYy+W6IWmEtQT7UH?=
 =?us-ascii?Q?dghN4PfcfidXvawl0Qwy6l/8r3rk7SRmENHBsfwZ+Sr/UA475JQuHGvJOX6z?=
 =?us-ascii?Q?pjLfJDvXIMkzhw8yzqYBnEuQiKa9CR4JaE04umPyWXAlgPvRu0NnMyeVAV22?=
 =?us-ascii?Q?S+TMy8Ll3NK0K5hiZhKMMhxZy5vtYoHupG5jvNtPugRDFD+p80lKQhK40vnU?=
 =?us-ascii?Q?MbtKitRUPNKiVE24J0zpKUIeR4vdgEmy17/wpVnpjnrvFq6U7rdXxBU9fUA2?=
 =?us-ascii?Q?FaLDjxppQSUTLK9ONS+fM6whVLA1vswLBbvpkLdxtTrQBrbHEqQK9f2z37QP?=
 =?us-ascii?Q?CUAW1IMrOESMcrxHGaAtDxKec7KN5GhYXmD+EwWFZlRbBIZGhnfpNVcRFiw0?=
 =?us-ascii?Q?wkWzGIEjckyISCPd/vwdo6q4XhqYdoMUcqxNSfZcFjvtl7w5JWf8eMf2euCc?=
 =?us-ascii?Q?A1+RrCul5ziO6foa419sYX1fTRmGctH1uh21U+rimXSoHtbw87NiJ53KktqD?=
 =?us-ascii?Q?5BMzyQbm16teAswFGDUGpIzuiu/+/Qk1SH4TId2paXPyAQFsk7Lk391Hpcqi?=
 =?us-ascii?Q?1W7ThmvD0ywEoGCKaCIorMA8UMITQTUThuc3iFq6I9l/RHH5XTbcxRqY+UK3?=
 =?us-ascii?Q?cYacldkonZbzZBIDluyEXLW6ydLHNlT5lwvdRNOxZhU630s4xjawPCtoZAoK?=
 =?us-ascii?Q?6EMqv1oBwpTwAfqLPPHkZL206rpKGcK74dlLjs9K7koBVLTf9FVsN3eo9AQr?=
 =?us-ascii?Q?wAoSafjhh8EN3g2GMe3g8wE2uU72wvy8aIpJIJnauY70b4Bo3fjRKaLRZJ9A?=
 =?us-ascii?Q?4YrFFO4PVO8BISNgNaa6xa7J1S8EAQB9CYkSmOfjRtpoAseG7uFKURUSOUNw?=
 =?us-ascii?Q?hA0Ec2r6cHg5zP1Ov9KYXi4k94AUdtyfLu4jyR7iqjxu+CyyrU9C+250TbEc?=
 =?us-ascii?Q?Oy7HV7rQ3xzuyPtToezBsoEEKs+UW6L5eHonFtSMC8fd39GbqmENMOwBBSNt?=
 =?us-ascii?Q?ca346ak5EehgX1yaOq0ZnVZZZeq9OHnv1T4s+R4R2Ag0uMarL7R7vnIMZohd?=
 =?us-ascii?Q?poTVPl2Psjk3B61Cp92leIygeaMpt0s=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6558150-3bdc-44ea-7aa9-08df340d5504
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB2349.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:33:17.6185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lf62S9b/UwNK6j3mOWDWgICIgw0ljju55Xo9cZ0ofkRBVelzSg6qaYGN1EWi4c5eGb08cuFPuPy1MJhWlm3snst4N+ToDGGCJOg1TOAb8kY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1531

The Iron Device MA5311 is an audio codec integrating digital speaker
amplification, analog-to-digital conversion, and audio DSP functionality.

The device uses two I2C slave addresses for separate control and ADC
register banks. It also provides an active-low reset input and an
interrupt output for fault and thermal warning notification.

Add the Device Tree binding to describe these hardware interfaces.

Signed-off-by: Hyunuk Son <hyunuk.son@irondevice.com>
---
 .../bindings/sound/irondevice,ma5311.yaml     | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml b/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
new file mode 100644
index 000000000000..db5f800ebbc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
@@ -0,0 +1,83 @@
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
+  The Iron Device MA5311 integrates digital speaker amplification,
+  analog-to-digital conversion, and audio DSP functionality.
+
+  The device uses two I2C slave addresses. The first address
+  provides access to the control register bank, while the second
+  provides access to the ADC register bank.
+
+  The device provides an active-low reset input and an active-low
+  interrupt output for fault and thermal warning notification.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - irondevice,ma5311
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
+unevaluatedProperties: false
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
+        audio-codec@3e {
+            compatible = "irondevice,ma5311";
+
+            reg = <0x3e>, <0x3f>;
+            reg-names = "control", "adc";
+
+            reset-gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio>;
+            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+            #sound-dai-cells = <1>;
+        };
+    };
-- 
2.43.0

