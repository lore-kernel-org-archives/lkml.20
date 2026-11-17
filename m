Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794905881;
	b=xJ8fSci25SArd34J/CRnNtnqDlS/X53UrEcRZ30aVL8lniq6yOSBfGPm2dWTKkQ6S4u6
	 RdABTOFiSSQQLoqAIap/7XhtkkmKhG6cXD+QJzP/3tN09WWm/WYRx5x8DRBND6ipfUxBl
	 oAaLHGMXs0GyXb5ENpXyxF8CEXf6ENGyHtpY0R98xDbsahvNLq7X0j9ZoXUjnkgqe+Aqy
	 WSdzyxuTX3m7L5T51Q3D6utEg1jYQfF1g0vTh9NVda4w3C7RJRvtNNA/5ypEDr7Zarsdt
	 lhW875t9i8xYmR+RnYPZ/TJvIykQGj0yKSCc04+Oe7QARfRDmcpp1kN4mS0wdovGBEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905881;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9cgxFUD35xxC0oEEKI4aWaMrt5OYPKHLBsoS22dFbxQ=;
	b=yijOMNTQPC1NS5dRBQTuLqNMxXBVWXn+juJJQnraKqfSIgwggCMrZ+YPclfEsoJreYND
	 Gpboy3knG4kjiLJm0DiFtg0LTtRm76fy3cVcc78Ru8dsRpyahY3OoJFdQaFOzR3s2uEST
	 TlSYjodF3DPd7FM9fFK6zJoISoce8f3MO1E0kQoS0hpAoRqoYuSET2OmakTQhgoI8X9kC
	 Geh7rQoytQ4jsEzPm1HpYjGB+Z17Gj9WCresGPxHgBHEnIKXYghYSIwtxYVLtDTt47gss
	 Qi1QGQUlznMSXn+3+B2XvRzVqaqTlVyanWj6o6wjNgN4Q1OWIg83CloE7amZWbv4vXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3aN400iC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.42
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A0606A33A;
	Tue, 17 Nov 2026 08:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1A0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3aN400iC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFKlJqReqH7vSxEoOrE0jJeboVbsIOJN3HC21QNIz1OyZnOMC6ZtFNQ38zxnLGjYou9aOPU3MLcZd/La9U74Kq49+lQvOnMp3w2Wdviy5DCjH/1dovfgDq5wTjR9p0strG4X5M/N+ui4+b0UQKaXTG/xo5XmpHeZv7MdMZDyuxT9nz+afqYgghk8nR3GFyJljQUGCKmSYjfbgOPHF5JVkKkSbiqesoLbh1rQcyV7pLIXOTxezwYvrKaIaUz2iufxTyGfHAConnQpd9ok9xjDByAuqBa+kcHAd+XMwc/bxXVZWlBbyIODiJWRV3IKNF5/TU0lu1WhewvlWoe1NY/c/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cgxFUD35xxC0oEEKI4aWaMrt5OYPKHLBsoS22dFbxQ=;
 b=FmmITGPix9pVPU/EBa0bLVSfg6ug4gakE6gVwbggeokG0H2dCKE/2XkSwYQe1+TctgizZcD8h46YO1/mZFLNR8C1fnDDz73LFh85RJiAFITltTaDL0L16PkEOFG+3zr+G+AqcoeUnK7nnNFnJNcVgKjLCh9uC7OOOJC4Oo+lInZjh/EGIdIhJ27ZujspfmRAjokPSBYgp9OOK07xrfCt055F09SGj9e5dFecccBJrMbYDg4UyBGHzxjC9xb4ZiMguWqrjHj9hXaSMnRlybYJhbGAQ7SKCd/rpLfqnq9fkMZfwektHj/8U/XzTnUF3Z57uTiipi5umbBYLQpkSZO52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cgxFUD35xxC0oEEKI4aWaMrt5OYPKHLBsoS22dFbxQ=;
 b=3aN400iCqUOL0W9PIya2r97ZC1bzvsKXlIoLLyp/wA95UG5TLO43E0vjZOn4mvDMgC3/DEdZ80rdtN2qgrbjffVz3hrKoOxLoVD4qyjuGzou5d500ametWhZqS7kjS4OtNrWgpFO1OvvCZu4p6YzD5HiTscuQ/oTHEYY1BcbWds=
Received: from BN9PR03CA0585.namprd03.prod.outlook.com (2603:10b6:408:10d::20)
 by SJ2PR12MB8184.namprd12.prod.outlook.com (2603:10b6:a03:4f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:57:53 +0000
Received: from IA0PEPF0000003D.namprd03.prod.outlook.com
 (2603:10b6:408:10d:cafe::2) by BN9PR03CA0585.outlook.office365.com
 (2603:10b6:408:10d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 08:57:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF0000003D.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 08:57:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:57:52 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:57:51 -0600
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 02:57:47 -0600
From: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>
CC: Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Michal Simek <michal.simek@amd.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Dhanunjanrao Katta
	<katta.dhanunjanrao@amd.com>
Subject: [PATCH 1/3] ASoC: dt-bindings: xlnx,spdif: describe AXI4-Stream and audio clocks
Date: Tue, 17 Nov 2026 14:27:37 +0530
Message-ID: <20261117085739.3807943-2-katta.dhanunjanrao@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
References: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003D:EE_|SJ2PR12MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 780c880a-bfcc-4325-7301-08df4488dd61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|23010399003|82310400026|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eAkFuIV6VEcOPxdubH4B6uZWW/S/oSy9l3f0AXyyZCE7b7rbgHGcYemNmuk1ehWRmNaqQtHbDsDCAJ5MKKLDu1RJgvGTkgSnX0mfL3xk/PM7WPAjxR0zTaj0e9jfCys+mnmopyiJG3v6IBbdDnJoPaACzMUZ0EJj6kQJD/W09HIFddSnvHIN9pueO0cJ2/J7Nw9qWAFYd/ie400MWK/zO2KFQeFPbLYWtgB2WwCXkoIJQim7wJ1brteY31mpBBv9EfgD2d+7ujDF5CjnnvGIMJ0Oacd1slrxwPwoHDuwptGQ3Z/Wzr5Jqu58iJkJxFoGGD7Drc2pl4LMjNzJhdoEqz0JfqdCM/HLbpqm3PM34v0w9/tdJrXTYaQE3ZA7WYrM39w8KwNPkauZUVI2pV0droelrzigIJksRYi9P1mkTwviqqdW5A7L8udRxTwto9hC+10SDZ3c1HQeg7/DegZqoX8QtLy1dknoE2m1gSSPPKoc+NS5zbhgYODYhUJWWy5Y64XgH84gxUqpKG3tcHDSNwZjWMrahnNvJC/M4ThafBCMWk0CnzPU4V6CEd7gT+tDEObpwHvZSxvYPFqAxI3aOHMFjGjd0UHnGaLOlPan0NC9bzivT8z4KUonsB4xTvnrEp8GJrCqiX0dcDhaYfVH4Zce4/7URw1vc0TQMdUF1lBKEOzMRuppMkfwQgcOpMQq6ujo/OvxbRYxUkYX9Qjyew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lA0v3efLF969mEgPDeiQsE/iPUfgcOGbCIKcrgDMGa0qFlHaCDTNeulaZhcrzC7uyVzzfb30rCS0PaUbGWJ+h26At0Agbf2K9uFVDYkDkFYhFf82Ab2inobRmKHktYc4Vl1C27m9NDaujlrR2yLKhT7xhnxLwcK38RtFONrqIHmGJBziZC9gsnU6XN0Ux2tiPQ2JOj4jepLhFfwIihiTwXNAeju+tahbDlHfmMmCWENT5Wy1ukeiYHJ7a9kkcu6n+aC+7Xq7umGqA2bcrp5s2wdYbZ3A+LfkaKvjM271e15AoIFHapoTzpgeLF/hcV/PAnF2CYVFRwwTmdlcSvQxLs0f8YO4fHwQg8BF1JKNGy9/c6ySYuMYMqb3uxKqvE4ztyQBm55mCEcB85rEMl9NvpEXao+RtgY9xYeQ1X0HwwqrYYX9oxPWK2KR7OnMR8sS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:57:52.9967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780c880a-bfcc-4325-7301-08df4488dd61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF0000003D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8184

The SPDIF IP is fed by three clocks: the audio clock used at the
SPDIF/AES3 interface, the AXI4-Lite control clock and the AXI4-Stream
data clock. So far the binding described only two of them and carried
the audio clock frequency in the custom "xlnx,aud_clk_i" property.

Describe the AXI4-Stream clock and pick its name from the IP mode,
s_axis_aclk for the transmitter and m_axis_aclk for the receiver. The
minimum clock count stays at two, so that device trees written against
the earlier binding keep validating and the third clock is effectively
optional.

Mark "xlnx,aud_clk_i" deprecated instead of removing it. The frequency
it carries is available from the rate of the audio clock, but the
property is part of the published binding and device trees in the field
still pass it. As the binding sets "additionalProperties: false",
removing the property outright would make those device trees fail
validation.

Make "xlnx,spdif-mode" required. The conditional that selects the
AXI4-Stream clock name keys on that property, and a conditional with no
"required" entry of its own also matches when the property is absent.
A device tree omitting the mode would therefore have been held to the
transmitter clock name by default. Requiring the property turns the
omission into a clear validation failure instead.

Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
---
 .../devicetree/bindings/sound/xlnx,spdif.yaml | 54 +++++++++++++++----
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml b/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml
index a45d8a0755fe..a4abca2027d3 100644
--- a/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml
@@ -14,6 +14,28 @@ maintainers:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        xlnx,spdif-mode:
+          const: 1
+      required:
+        - xlnx,spdif-mode
+    then:
+      properties:
+        clock-names:
+          minItems: 2
+          items:
+            - const: aud_clk_i
+            - const: s_axi_aclk
+            - const: s_axis_aclk
+    else:
+      properties:
+        clock-names:
+          minItems: 2
+          items:
+            - const: aud_clk_i
+            - const: s_axi_aclk
+            - const: m_axis_aclk
 
 properties:
   compatible:
@@ -28,15 +50,15 @@ properties:
       - description: SPDIF audio interrupt
 
   clock-names:
-    items:
-      - const: aud_clk_i
-      - const: s_axi_aclk
+    minItems: 2
+    maxItems: 3
 
   clocks:
-    minItems: 1
+    minItems: 2
     items:
-      - description: input audio clock
-      - description: clock for the AXI data stream
+      - description: Audio clock input used at the SPDIF/AES3 interface
+      - description: AXI4-Lite clock
+      - description: AXI4-Stream clock
 
   xlnx,spdif-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -49,8 +71,10 @@ properties:
 
   xlnx,aud_clk_i:
     $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
     description:
-      Input audio clock frequency. It affects the sampling rate.
+      Frequency of the audio clock input. Superseded by the rate of the
+      clock named aud_clk_i.
 
 required:
   - compatible
@@ -58,6 +82,7 @@ required:
   - interrupts
   - clock-names
   - clocks
+  - xlnx,spdif-mode
 
 additionalProperties: false
 
@@ -66,12 +91,21 @@ examples:
     spdif@80010000 {
       compatible = "xlnx,spdif-2.0";
       reg = <0x80010000 0x10000>;
-      clock-names = "aud_clk_i", "s_axi_aclk";
-      clocks = <&misc_clk_0>, <&clk 71>;
+      clock-names = "aud_clk_i", "s_axi_aclk", "s_axis_aclk";
+      clocks = <&misc_clk_0>, <&clk 71>, <&misc_clk_0>;
       interrupt-parent = <&gic>;
       interrupts = <0 91 4>;
       xlnx,spdif-mode = <1>;
-      xlnx,aud_clk_i = <49152913>;
+    };
+  - |
+    spdif@80090000 {
+      compatible = "xlnx,spdif-2.0";
+      reg = <0x80090000 0x10000>;
+      clock-names = "aud_clk_i", "s_axi_aclk", "m_axis_aclk";
+      clocks = <&misc_clk_0>, <&clk 71>, <&clk 71>;
+      interrupt-parent = <&gic>;
+      interrupts = <0 90 4>;
+      xlnx,spdif-mode = <0>;
     };
 
 ...
-- 
2.34.1

