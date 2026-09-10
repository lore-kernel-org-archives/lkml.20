Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013069.outbound.protection.outlook.com [40.107.159.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C052A33B97D;
	Thu, 10 Sep 2026 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049506; cv=fail; b=NxdW8Sy35tQf5KT+LmmUUF6pPg/exzIb0Za1pfM2yysGozvmgqCb02NrZCuovwZk+QiDpAQYYaWEP1Hn4IyCm2QkzVHcp7JBwpPRwqDZyQXWM1VlQGg1Rzwb9cbezB0IlOIF6xw7Lqt18FhBtF0JmtGrewvL/38gx6B8hhJfNPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049506; c=relaxed/simple;
	bh=aimOPlor4mBqKDSGBeKnceQVSR/lTtJpYgWZHZVy0Rk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lelMD/it8Fb0279/sbdGF4yQoTO5ddroI4hL+58t5Y0vIOWqbiJyOgGOJ8wQd5Zf+8e5ki/W4g06vrAciTGY672Vgs0gq1SD0qSQMQQJyhtLDWBLIMpakIJLagnEU8hACV7ubl2ZVUDSkRfTGME0Glzg2A76mO1HJfAgh//h9M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ZW2JmJmO; arc=fail smtp.client-ip=40.107.159.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ZW2JmJmO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEcj0ihIW4/2hfL2sFmXcgUUHPiSp9pOV/BkETS2qp5UCBuMmd9p2Euvqz5mAGhsfZdz95QrwtbJ0FQC0HJOBf4rx9jjp936wwFGmRTVWCq7iiLzgNzsvrIKzbNXQwopTBnklVAXfPeEtY0n72IaIu116M17NQPSDrbfqCYmt4zeECly4k70T2sbPbetG57bZR4AnVo+RbPgf1Lw8NJ90oKbJlz6By3VYeqR6Ml6WcomDNYgrLx03+Y27NgMVPYmgMbMEFwhbqxFXeZAwZtr7M5ROz4uHm/1FOgHczHYI0Z9lZb5zYk6t4PbHhJEEmS9T6kyZrHlgV1KLnUguTe2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJ1x3kgqSkTQvoo2VkC6bdHXJE6MAsnAJkaVi1Blhp4=;
 b=HEuQv+GX4JYci6515GXSUQpq3rfv8f8IQthfddZWou+v1LE0sQiqTK3C6n9kguAT6og5M5n7ACbasr/Ng0LleNbXJuDv/Ytygv1zEJCw+flJ4R1elogjnMuR1soogdKMbthwYdIoEUA1gXsGrbbRtfPlWo95br3lEgaVs+dimzbBv+Jaek9MbkDbHDRYz/IRGEvQOqI9+/Ng26+BAqMsmZr/zjyZwbhp5iqECU5Wki6Kx99YWNHg4GbtzUcfyqVpDQ2YYzTXc0VW9JfOP7+qASbdeBuanONEvGaLQwJ9WUoVgtT26PtpP/ejyJJUqvtJY3CoX/60GcNZewpySYS7ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJ1x3kgqSkTQvoo2VkC6bdHXJE6MAsnAJkaVi1Blhp4=;
 b=ZW2JmJmOjGzEPHlOq7+LTlWJjuUHUfwnH6E6V7O1cCq+lSPnjk/wcXsb+ZdSNs5CSBkxuQAEHugu8liOZeRaiBt7FoR+78Guicl7/H4sIr/l5yA70tiOlDLxMxN+w6cKuipco08rlMzFT2pY9BctbuyYjYlTY6evhSdsJua2tMkdKtLqxXg4mQR/BW9HaMJc/fXiMHUNKtz196wTRDBjgPRxf/ndjNrJ70z3Nos9Uxkyp/XdNYasla123xTGcZS7fkYTuGJ56AscsijoKbbSfKIbX2OeF0LJQj7TnpzotTUhsgGwOHmrO0pw0ZER+dkhwT3XRgWVRKpNceyOphdpew==
Received: from PA7P264CA0351.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::7)
 by MI3PR10MB9922.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:74::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 14:11:38 +0000
Received: from MI3PEPF00008481.eurprd02.prod.outlook.com
 (2603:10a6:102:37c:cafe::95) by PA7P264CA0351.outlook.office365.com
 (2603:10a6:102:37c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 14:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008481.mail.protection.outlook.com (10.167.240.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 14:11:38 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 16:17:39 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 16:11:37 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Sep 2026 16:11:23 +0200
Subject: [PATCH 2/3] dt-bindings: arm: stm32: allow TAMP nvram child node
 for syscon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-upstream_nvram_reworked-v1-2-521c16175cef@foss.st.com>
References: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
In-Reply-To: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF00008481:EE_|MI3PR10MB9922:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f576c7d-f4d7-4ac7-0728-08df0f456e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	HA8eRosO9OG3svvJcnkzPdNKZ4LiBBc9EFBHzg1giGhc8O/q7KSYHgVgO9zEe2sNxhMAqeWtLu0TdUMhlNVl8ZYdV6DuXVHd9J8/tIwCjafyW+5MNbDvrGjJt17RRayHQL4RccYyBaj5kIyQsJqJAkIWIvfhAcTHHoqkl2/jhSaWZLuAiUoof+YaZq2OGZIES5eJ3m6ue7tB8PBYKjENqeOBsJ73nFdZcYIXrlFJ5RQ0ZQ/Y96T5y4k0+8cCLoLSFt01s1O2CaUlzlS7mFG2Ubcv9m7+Mg+s1OjaaUbNRvaQ21UGurayry1vbma5OsldpbA7zc8gtuIBDATD8kUig/j/uEl7PxXg1fVAV8AYP0MG9bFycZAMa/tbCW5EjuhUi8VCcCGRjuuWXslULfFtSS7TZF/0L22XQdqHQwE8wyWAqIyGRtOgQIoZSSPAuKEluKJTVPA5c9AlHv77X4pAMGRwQecw3oe8fE9t2B+0S1+O1y5X7yTG26dVAEwse49SCgqIVWTq605aO/iqtVqAjKMT5ZIyT56+sAmCiAc/lPgnKwfO+cgFMrYqwWBusn1921+c9vvYe5BRhQL0fWZWbvem0mZ3gOyngSYS/vIXlU2jwPy2xbkIaDgByHO45vJv8ELuedi+BjYDUSrga2sT37XhArIjy2+lUyOumv7yo3Y9cLSXgBpL4KEA2fH37iMna3k14CqNVws1OxkCmlG2tQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XNY4kiQZp/HNRS0IgvGpU4WC3oEhPLqzC4MrYqg0mNf0OF+a4aqn8WsRJ3z2YTZYyiPeBly/4QgUNfDlq4tz2KAbWKRF20MajJ+JM0cC7C6KL5z9TjISEqEH20dnSgnb5zuiYv6isPXUXi70/wEn5BDIuPATxX+ewMuWVV6ybXOs316Q4TkJcggRS7MosH23OtDLLC8d/eTQTDPYm3d5krsyQxeS/hNKClDMfZ5QdS8Bt42cdPbe+sJpk1pk46WiETflWMmO368UvHIhBpbEnNaemBW3RgZ6ne6Cyrydo0PtS4ksfJ8zULfTHIGocl3IkSGlKabQOxLAJ+X9a+DgDEy5OFWFkZmxU3HzubQgvBcZ5thEy0tkYAEBebk9XwaM3Wr1hTLO5ho0qCjDdAxolbmSrR4SrsWhgOEw+Wz0ii6gv3QtCVInEwdkHuuPkKFd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 14:11:38.6920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f576c7d-f4d7-4ac7-0728-08df0f456e4f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008481.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR10MB9922

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
 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe23..8a0e751591f6 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -39,6 +39,21 @@ properties:
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
+
 required:
   - compatible
   - reg
@@ -61,6 +76,19 @@ allOf:
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

