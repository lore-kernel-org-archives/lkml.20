Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805627;
	b=hHvsgohqiQV46/+XeuUZx/UKHXNd7MIyYfvEBUOjYem4OATGKfA7hxGrZxbdZ2pCNiQ/
	 a/3GHn1uiy6nWWqdOegaOXyLhr/fdzCrE5HHzg9RAs0U2rJGRo7qqWCa9j691fms6gZ8f
	 IPYCAduHQKJp5jfvjlAIUH2AlWqkp5zPe1pba9/mQvYqO39mukyxZ3pX5wSNGnTMGucfE
	 M96V2J8wHW7PUaio5X0P0sGpLPHUd7HWBq3i80vGhIf+1RW4fWOCe6wBf2eSGKuHP93bw
	 poMr2922ATVlAEOPcfHKsRp180neTA7X7UbeZuQ9xulTYu924/nzjiMw38rhuqzIqjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805627;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=POGRuviH5TlEzEUjx6xxRrSvo62+D+y2VRA4aXnjt5Q=;
	b=DVpeJcCpUHrJ3Cw00PA0OjAAr3TjGg4K9IstoSXm5XWS1dqwhAjH5kAJGDlmRrTXQAll
	 2arc8wUNkwzQt5Vfwad4P/MzxFkEX1Q8xNOoBs2y6lNrxi3z/N7MrmQ5gh+nEPygxq7yT
	 9OOmPv5v0EYn7Lx6pU5nBncaP5eQggFvj288txq+mqlZr5lFnHJJdy4em4M/DNFBJCR6C
	 o8U8RMWXwbhxIDVJmfoSyhG1nCtqIRVMEUZdT3gA19P+Cf7mAMMLH90BsMQ/KoDz+re2T
	 laNg9vF7RMfiXa91MoIqIkdGH5FHf48zeRR/wE4LqkoyiJ/zACsUbuRVScATw3BU0pA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=WZHwpEzL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.36
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011036.outbound.protection.outlook.com [40.107.130.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46812606D830;
	Wed,  4 Nov 2026 15:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46812606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=WZHwpEzL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iB41VcHsOVygw4LTWS5S0YZGI8rX8tjT4e3iiFxSPq2iJTkJYUXDJeUFrtal/S3YhDcjCZuY+ZTZZUMOUntihnbmogd+4I5V4PjJTwVr7h4YzXONOSRNsGdTDGGdjY2B+eFfRPnUf97JQG98AWHvQIAvGN7Y08Rxn2a7K3Y410NewL61VCABxZybneshSh7RzLNhl0VoxotP3RteD7VAnTeMXYWjFPmTcvOPZonHDkHPaKAP8HjRcSCWXdxhi0IGKIT7dB1xur9YSaG3AWhSjs+VEndNt8VN28kw8clYGScshO9K20C981IsEiQH+qQNXa/pLdnPleOn/lByFM1azg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POGRuviH5TlEzEUjx6xxRrSvo62+D+y2VRA4aXnjt5Q=;
 b=kfd/DXTUi4kbFdkVOfwbRZTbfnglXtZTmJrE/81XLYdZJIHHTN5W7a62TXAZV6Bu+AcEwkXhUfK4HGzdlUkqCoyXoMR7TMhAhkHCoVacTpBrb3wBReI2Kt5GWbdJ8BoUPRCTyXdQi/YLk1fx3Nz7QocrG2xLTm1KhTq4q/0L/KnU/cyylGKMKbA7el32H6PU3sIOzo6j1KadJkeYdW/5MaD0lSOb2qqTstAUVyA5dO0d7A3YX6s//OXRcX5w2Vz3uwy8dpFqlqvCJ/Tij6RSBq+cyrgJCUSYYxrOjr5elhvW17OZ+3JbQfJdGAVVFOmMJ+Pykf8niv9Z1x6/NwilKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POGRuviH5TlEzEUjx6xxRrSvo62+D+y2VRA4aXnjt5Q=;
 b=WZHwpEzLNfLTzGH5QF/AXdhBnNDUNUfi8ndARm8fc+reDobKHcZbm1zGV1WrmrYpgGtB9WuStqnXjEeP1z0UtQ0rC+SV/6FsvdLPT/EgAMfUqDgVelGebZ5774tpyGlRC5mX7+cq8w7GWDl5rewOTcW8TJQfdE4gwqMO/t1KtbyumweXyNYg7gp41a+uvVRHEVcQSkuUIb0pAA6oLko3uEJGd+HVFO6rpwWY6tCRD+ec3JzJaqJpxMMuneKIALr9XqsYe389uL0tSkX/V3Hpq430zwiJrCyJnyehEcrCtTMAFJFR+wU2vANEjcy0zXrvgX6cUQ7GTzE3QMBCa+kTsg==
Received: from DUZPR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::13) by GV1PR10MB9014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1d7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 15:20:21 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::8) by DUZPR01CA0059.outlook.office365.com
 (2603:10a6:10:469::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 15:20:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 15:20:20 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 16:21:05 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 16:20:20 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Nov 2026 16:20:09 +0100
Subject: [PATCH v4 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261104-upstream_nvram_reworked-v4-2-144024496a44@foss.st.com>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
In-Reply-To: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|GV1PR10MB9014:EE_
X-MS-Office365-Filtering-Correlation-Id: be24c895-d017-4096-35ca-08df3a872419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261009223027099003|261021123027099003|261022105027099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xahPxTsDK7Yivu2anUxDOL0J1Z9apYG0qmT+eSPZW8MfdW8N0z0DX3u7kmStxjptUozGhpqsWCtOchDse5qUKEtM9/v99dRU9E5C+ZdzWVRW4u5k6qVdcQLlZBnIkmVWPEVgZD7ctzBH+HRiozL4l/3kbLuUz4h7GG+qp1k6wQnPloZx8aBcZBlkxdctBFd7/dYvGzngeUzur5CamincQDKtZb54tEfpOcPLxT9gQcudZ43JtCuzSqSHFl+Tg+597Jn1kkTgBimzbDG4jONv2wu1/nUO80j62ykK0u6sDNCNcsh8K9Qx9ekEk8tHDi1IJPebQo4ZALV2ojmyoFfntR8akgZ/eSMt1x6mz9sF4y/yQZZQdozrtUPx5C3CU6RcHaMUGDIiv48Gk0O29wt5wglYrg+UXh3Hu1ChLSBegkp4/DrxXoR01adCy1T7nAB8saRzd+pyEbYjaK5g2Ug7tbGZyZqR6HDPySmWaknKNtcRCAkZN8i1DAnz+s/tSRtlp7re78E++CpS5hdI4CnKf2MC3KPu8/MxLyeOxkyh3RWHFdpYpkSeEHK+hghai3xaoGoXlj13PlyBtuXm6sAdd6skjGttYXTVBvdVKnCIafNHjMegx4nBGmDfEoX3MtF/75PvlrxGcF6EU928t3MyG2DQMvYIaQuVsOYpq1GnVxCVdDFRy3FWrNIDBRFll+JszzBB5cObDDvYfmdvmi+x8A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261021123027099003)(261022105027099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zBB2b8bE778uPSTjv99bSvJpPxT2NpjIJ++2hBvtJpZlOKQYGKROb1Jk+4yKfnEXw/9YUYJFQK/D2FPqSrvul66PH1rv51rMbEvhZo7amzRt4MeHuLqxwFaJpAO4Evo4z48BVw6/UkLhZrgs9hSFQPE8lFPCCA3BlOGKSdq1xEw18sBGfSXibvEosdyN8FfzFbGGYxLAHZSrTviZzgGTBSM3dVnDxE6Mj4QCsdB7SPG7c8CfxoDyl5m5HleJMQsZLJs4ewlLg9/xGrQKnBdyoQfLGOZyTYSHyNHSYsoY5bU4FBODxDE1iGudD/GNLJxldvtjsir0ETdSLxV4JZcKPPL+xjKpURqvZ7Mkm6kRRr/jRILOiDx1YVSDfDHbOiScLNpjSrTNaVLkeGJXE7FfgRIeasEQvHSilPXYB10ryoEVFW/ughrkOX3LjzaREk4F
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:20:20.9324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be24c895-d017-4096-35ca-08df3a872419
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9014

The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
exposes its backup registers through an nvram child node described by
nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
"#address-cells", "#size-cells", "ranges" and an "nvram@..." child.

st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
into the DTSI made "make dtbs_check" fail on every STM32MP TAMP node:

  tamp@5c00a000 (st,stm32-tamp): 'nvram@5c00a100', 'ranges' do not match
  any of the regexes: '^pinctrl-[0-9]+$'

Allow the addressing properties and the nvram child, gated on the
st,stm32-tamp compatible so the other syscon variants stay strict.
"#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
(an empty "ranges" requires the node to match its parent) while the
other STM32MP SoCs use one.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 38 ++++++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index a559f8b03b84..51cb565e05ed 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -43,13 +43,19 @@ properties:
     const: 1
 
   "#size-cells":
-    const: 1
+    enum: [1, 2]
+
+  ranges: true
 
 patternProperties:
   "^phy@2[48]00$":
     type: object
     $ref: /schemas/phy/st,stm32-usb2phy.yaml
 
+  "^nvram@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/nvmem/st,stm32-tamp-nvram.yaml
+
 required:
   - compatible
   - reg
@@ -84,11 +90,37 @@ allOf:
         - phy@2800
     else:
       properties:
-        '#address-cells': false
         '#clock-cells': false
-        '#size-cells': false
         phy@2400: false
         phy@2800: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32-tamp
+    then:
+      required:
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+    else:
+      properties:
+        ranges: false
+      patternProperties:
+        "^nvram@[0-9a-f]+$": false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - st,stm32-tamp
+                - st,stm32mp23-syscfg
+                - st,stm32mp25-syscfg
+    then:
+      properties:
+        '#address-cells': false
+        '#size-cells': false
 
 additionalProperties: false
 

-- 
2.43.0

