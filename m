Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B25F459AD2;
	Wed, 30 Sep 2026 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754122; cv=fail; b=J3UVX+OdZ2agFZOLhNeQcyvLr97F7w+S59jJQW8RPuK0gitiOiMinlqzYjWoH2lPQrRfDGJuRCCtYJ4AobUY6T41Yi/7Lvt9YIyqToi31UF6Fk76Kt1v0zsuYBpEsCf64zpd80hbkk08gm1yF+DctxMrC0F9+wGCfF93YtaVdyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754122; c=relaxed/simple;
	bh=aPYfNju4Ku2P8MBb/X6vqTTaZSSYKxD+xbo3nxWQ3pI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NgTP8qTlrnsWGmFkgORxSjD/JRw2rsCBv2BKse8iKqKt80zowlBgZkf8lEmMZPkvJQOMeCYf4o0Vickn+M7KI0DZKZrQIDjhaCR6FqSBq1ET4JMrs9QvfdcuPrZimhF53AQfCcLq3UTfpfflfNz/mO4l5luc0ERBUbK+wCIFr+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bIpwJesK; arc=fail smtp.client-ip=40.107.159.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bIpwJesK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFoLKxNy7zBktaVsjso3uH9dOyAx9Vq+baAlOUOFDRHWlZPobIac5UPbC919mFioN+FqwRxIDOKyXAiy012MUMJjR8oZ7RPDArGZxfw8hsFUnJAXo0We7p13/ZMTzSWwCylWoe7VCoIXcxab5z3CAesO69EPvyFP3XpVDetIt6DQtNv3LrrgCPT2q8vE2u6Skat3RMOAlQE44oww2a/PodPPobz//EsCBsvrC5tgWfcuv3ycRyaIpRXj7TQG+GwIv1AIThfg0mz7o39IAV65YmPZ/Vu4nCugp1w6jdnl0zZJiAIFly7FImMBtwUKBSwyjf56RS/ssFYiTBiFwO+abw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAcFOFYOXs7YknRY+6lqof59CdVZrKe86Bt0XTEgua8=;
 b=aM1G8xu7z/ZW38s1VNfSUcTC8p4a7W7Zsm+aTcJnqR70+WT0nAhTB+1gI36XMrz1okrcAUruriULiLkM9/d7Va44dEOQ3HBvKFULYtMocjhMsNqrt+AIeZmNypwy6TWzIVp+zMyStbDJ68lR/N70nchP7nHq2DLgk0g9vo/08t7mufFdxtdRFxcCve6bKc10K7MMtyotWh9ipebNx0oRTCltATlIhFd6i3t3cBeov/iiJ5O26AS/UtLCg5V+Ye9kFBpjQGwix077wS9VqTe1oc50KbrAUSzw9URxeR+sVYSXZEIeGpC61QeZwoCewmI/O5/oj741lN+USi89J6JmLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAcFOFYOXs7YknRY+6lqof59CdVZrKe86Bt0XTEgua8=;
 b=bIpwJesKlH3CiX8ONwd6+KBATRUEiZTbvuRIU3wHuolc6FsVx8NK0pMt5D7zHtK7Qbe/eazrAffea6mvCTch0ePRmcYBptGSTZlfHUp9k3qd3GSTBftShw5srV+Gb5fjtqvLnWsVWiVl6ykg/3OXGCtOOcjzqfjOAZgIPX53eDEWmmPLWa3NrUhKvXijbJj1LfllmFl8GV9DcDr+bUZMvOq3drQmGMHuWDKtm+2VB4vcKCqJGJPvD8u2tA8n0u4WhqWe7UMx9LRdGbcSuv1T/Qhol+taYHCHAoU7pvwlPh63LfWIpTO3sYl1aeHnz8b2pVWbfZB8Fd8sq2LiCGxwRA==
Received: from AS8PR04CA0208.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::33)
 by GVUPR10MB9727.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:35c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 07:41:50 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::76) by AS8PR04CA0208.outlook.office365.com
 (2603:10a6:20b:2f3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 07:41:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:41:50 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:48:18 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:41:45 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 30 Sep 2026 09:41:43 +0200
Subject: [PATCH v2 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-upstream_nvram_reworked-v2-2-cfda749ee0b7@foss.st.com>
References: <20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com>
In-Reply-To: <20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|GVUPR10MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fd842d-b2bb-4135-3eb4-08df1ec649f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d48kj67uLRiC0HPdycvHo7RMdLkwbStwSiKneqfJut89mst1qnFGS/x5pEJ5ngPRVoRbxpEAvy2Q/KG10YQ6QKF3RM+GKgRuX8B6soJaoP1/EH1amKgK0KFxa7QE3KC6J3Q8wBT+22Rl+UzC8miV6/2VAwiEIaBt7ApUgnOO+FL/QyJgBTbDVx7+HLDshtX0ALBtn3TpkmuxCh1Df0JXpOgQixzrqkZ8CXKsVoPK3KM3qfXPPAGXWyOSB8unkW6Iq2E9PWhri0+2i6FNd2U/iS1J85x6c3Li/vP9p9xZU6p76izvN7jCIcf6NY/T7EQ94JvTnNCGwi8CzuxdnV/Gm1enzrlPQw02QoUtOTaGdZuFa0Gt+aeLt0fc+35R9ObKM7LcHdvcZ3FzLpNR7RAwpzXH9hhAPwkzSAe8pr9Nc+voFM38BkKUApXpbg8T0nDnVCb3SY+UqOat96g5AEYQXQumCQGuRdtI49eHCAc2hrzIBL62BuIoNx/eboMhF3AZsXhuTG+bilgZxtiy9aF2tKP7DBGu5ehS8iJ934jfp7v+0cepPa5aV/pG1dY6QiblEJXnfJxcj9U2LF0RXvwZ8luwh3/YTbbPFp9Yho6ca0giCQOTShB2BTsx6jAJJoWWPAOL8oXE2DyYm66P9MMhqCC5HgnYoSQUc5devCPeGABzZ+iPxSn+mnA3Eit+aMVJBRsTRfuJRPrGpnXKGPQ+NQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ArE2XeTWYK4/I8TRiPH0XfPJy6ULg7+73N1+zjNo5IiTBteeu3hdXqhKBq+jLKaUwkFuF85RCx7yJOon8r0eiCOGY2XrbQ8cAmT8NdqPcHwMXGkYoXCxTiY6fRMwoMF24e60gQ/TvIa426/tYKDvGWNCuo3hO+Gq3Cy2i/v2iUv17Ti7lwa9DRbftH/A4ArJVrrF/Se79w0CRnI//D5eWp6n1rEsKIYKM0nK/f1zULIeVmOcR+1/rm3hmhT/0DBaYncoMpgy6ks17KzTcWZzffnt1m+jUFGgwhcieEYlnUpLzzwyJzlO4QbbSYXPt7qr8DDSuPnKI73TOlC6oYw9awngyku3b/gLTUUqsu2iNV972PoSQbV4k+j/g2/Z5KCNScp4Vg3k2YWsykmXxZzOUsw0x/uzaHFuWj/yGi2uOJu8zUGE1K2ijdH3DNxFfjwb
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:41:50.1626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fd842d-b2bb-4135-3eb4-08df1ec649f0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR10MB9727

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

