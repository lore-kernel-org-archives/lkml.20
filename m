Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazhn15011020.outbound.protection.outlook.com [52.102.161.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34254E06C3;
	Fri, 16 Oct 2026 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.161.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164380; cv=fail; b=nsNc+RSq5YdI3ahkIP5Qzd5KB2m2pgPJAWTKvGcnchSUZ+ORkzcg5ou/ezTbArFoAejW/P8wiufEOv4ea89x30qllZA9/FGgQIc04Wj9TV8YYHoEiWGasaaAHOfz++QBkZqBSWXz0KRtAKVdGbF8vgvxbUeCa+dBzzxLRu1HbrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164380; c=relaxed/simple;
	bh=aPYfNju4Ku2P8MBb/X6vqTTaZSSYKxD+xbo3nxWQ3pI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NNIG1gJPT8tV8OJwpNTwM+voAJhQb8ImsR1h4yXoUMqu5eJSM589CrVq+3pNO0UFlVXkE5/OdH1MoQWyOZdFzwX+Qc7WnMaESyRb2Xr66Q5l4Z5Ib0Q3Izj1G0eYGcC6jldcSMdIOBXD4sSrRx0Mky3arV860Bc8ZW5WcgyAvs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NAHt4swI; arc=fail smtp.client-ip=52.102.161.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NAHt4swI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJwqmt0SlyY4XJ3wWsDmZl2eOQQnWYZpVaasBozgzxiGpA0dcPqYYo2qAuCGl+6CPjHwZhz+8SgQpKQuN4idWZ9K3ASb0iyKSA7/gEsjRkO1Rob/IYd+WP9Nh4rd1LbRwqNR4p+UKXilZ+M4zrAgBpbrUs8w4UwZkhqeLwxC0FGF/Blq1IK0tFpc6cy7v8A8uyHIEE3HTJGwKP1Mt+bfOrNPRjYSedBfwL2DZ+ezU6bIl3I+kK9Xb26zJ5ca3HmtUSyQQYiwfIaayGd09n1kJFGgyFiHAugiKRcGNWdhxEGhWYOYXnzByxFLIBM1v3f20ug/cCrzwlTyTzRpiHYzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAcFOFYOXs7YknRY+6lqof59CdVZrKe86Bt0XTEgua8=;
 b=UPeCAbt1q4GHw+It4YbMgMm2fgd9wy084Oq+AjSd/Osp/ZJI+CglmXUMedQVhFvO/IMsAQGL/B1JGfSayfsLjGtq9JPaRe2T46UxfMr54mSHTF55OI2i3SG1opoyrYjCBV0/zbcUgmAlRMT816jz6kt1gRnRNtyGif0zsyBd94ln5zs98P7WzQrS1s630KqxyHWvE29K757IrJzHpACIEagFpnbOfRD226h83q6Kg8uiSOi3xYYhqEdhlCLrLRHm3k5fFdWF1KCoZU+zk71h5f9DX464hpqP4lgoHdEYTVC/ccMYMDiOt2cCJ0Hj15KsoBBUz9Amr1o92Wn0V7uM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAcFOFYOXs7YknRY+6lqof59CdVZrKe86Bt0XTEgua8=;
 b=NAHt4swIQPDC7invGTdhNI4pF/Cck72j+VIAUACP4TfZb4pZauA1/mjiZjt0g+X56TF4tuWi06Xqn3yG0YZYOQ1Y5EOu9nuaNHHF8Z5/7vNGMh9fW0gMl/J8RsH27Tv/wNZNqeft+DKF1QyAcswr5pa+MLCO90FYrlDepa7njw9oNu89zCkg0YUBHSuVH7TlbuBodhwIyqxB8inT9iHDQHNCMLRX/nd+wQcyKevaVNiEQGWH1dP+HbfBLw2Wsfg+bZYiLYBrw+70KOCICJ47lSq3EjsMAnGX5Z/zeBWQnpMA/z/fUOmjzxF8811lMIfvY9aGpMC2DgMjyW0nQRDOEA==
Received: from AS9PR0301CA0038.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::9) by PA1PR10MB9733.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:566::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 15:26:13 +0000
Received: from AM2PEPF00070CF7.eurprd02.prod.outlook.com
 (2603:10a6:20b:469:cafe::4a) by AS9PR0301CA0038.outlook.office365.com
 (2603:10a6:20b:469::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 15:26:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF00070CF7.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 15:26:13 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 17:26:40 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 17:26:12 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 16 Oct 2026 17:26:04 +0200
Subject: [PATCH v3 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261016-upstream_nvram_reworked-v3-2-f65908490cf7@foss.st.com>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
In-Reply-To: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
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
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF7:EE_|PA1PR10MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: fb69f994-1bd3-4d6c-5849-08df2b99d08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|34020700016|82310400026|376014|36860700016|1800799024|6133799003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006|12100799066;
X-Microsoft-Antispam-Message-Info:
	1EMJrUTZheXeGW0VM6dkhD378DbXUDbatl18Pz6xgrDMwIPd2NFsxs0Pz67SmH5slJLTB7Ft6JURy1LniM5XhSk3JutWRMHAbBk3uNBl28BzjeMHIthd2+VxLgaz5ox5YrfNawGS+4mWRKp5swxNwh9+ms4tvRfEuI5YfIGatCdZxnvjeXsTiuD0XD41geB55lXnNApTCxpHLc7VFMvdVlHOpEhkOeR0UWTujcdaXTGicqMsy0t04Hv4JkCa1h7Vpoy51hU63wFnmjSEpxTrLr7yq3VzaQ3AOHfihfImXECw5l0KH+qCOZvn2NhHceFy3VuiTg8p8rWAt8sdslDMMR8PeO1xBapuEhqr1et39TrKFsWLzhjnIvC7H2shtrooUEJgVCNfT95LaZ/ewlvRAQ22GbNZqLGjy3kmDLHJIVpUQtB7VRtJRX7ShnoVXNiUEORcQUheOZSTMOgYTDNApZESR2pyhcQoOc1zjhYihyF7Cjtvt4eluAEfYjrDm/hFH6um/rFkubEgLv9dQwWreLGnn3dQZhaordSCTWHzdkFdBwBeo28kffDxO+zKGPBYWcZOQ3QPyE5EOWD20bVxLedTuNLZRryha2ackX6ktW4k7H6vipHSVclIVVoJbxQzt3oRJQ4Y5vmdN98tF/x7Q6xxQ9zWKbTsEaiEOSonGj8In4tUKGl0VXWugW27bJydYdYg7FOx/djYZ5ikXHt6yw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(34020700016)(82310400026)(376014)(36860700016)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f7rsJDRvx6NPP319VJpoEwxVyprOT5lBZVlHp0J1g0bwBPKXZnD+iaH+MDM4QLD5kJqK6rkgSDZaFnU8z1iF6iOBTIVMyrES87xLG4f4TPfLuFkJ6RzUAfWcYuxcJsShJAR/36WRgfWctqrQm+BkDWXPUfk/HQxRBL3/xYQiuqr2C0aEwpiGS2nwS5VrXQvLJXkmnnWDaQfxTCYNEADsvvjxkPc+qb9gh9Ofh6fP/GhoCqA3UUVZATxTET4uOoITEPY7IbmO2X/oIBS1sj9tgrhPP+n2KajHI5DPkP7AF2HEZOieEjuMDiC+bIEyk+AXO8Il1/Gops7HY1+/vGa5Fz/Kzr+fAd+kaw6FjFhH3EkQCh04zFtDD7jMLP4udoylcqKE4UAy08m/m0upTO8gIOHmnWURZ44WTn9b6nN+AZKDv9v0iNzMpnKKwDrtkH0y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:26:13.8043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb69f994-1bd3-4d6c-5849-08df2b99d08d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9733

The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
exposes its backup registers through an nvram child node described by
nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
"#address-cells", "#size-cells", "ranges" and an "nvram@..." child.

st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
reg/clocks/#clock-cells, so wiring the nvram provider into the DTSI made
"make dtbs_check" fail on every STM32MP TAMP node:

  tamp@5c00a000 (st,stm32-tamp): '#address-cells', '#size-cells',
  'nvram@5c00a100', 'ranges' do not match any of the regexes:
  '^pinctrl-[0-9]+$'

Allow the addressing properties and the nvram child, gated on the
st,stm32-tamp compatible so the other syscon variants stay strict.
"#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
(an empty "ranges" requires the node to match its parent) while the
other STM32MP SoCs use one.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe23..1aeb54867db2 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -39,6 +39,23 @@ properties:
   "#clock-cells":
     const: 0
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    enum: [1, 2]
+
+  ranges: true
+
+patternProperties:
+  "^nvram@[0-9a-f]+$":
+    type: object
+    description:
+      TAMP backup registers exposed as an NVMEM provider. See
+      nvmem/st,stm32-tamp-nvram.yaml.
+    required:
+      - compatible
+
 required:
   - compatible
   - reg
@@ -61,6 +78,19 @@ allOf:
     then:
       required:
         - "#clock-cells"
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: st,stm32-tamp
+    then:
+      properties:
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+      patternProperties:
+        "^nvram@[0-9a-f]+$": false
 
 additionalProperties: false
 

-- 
2.43.0

