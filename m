Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD18B3AEF37;
	Wed, 30 Sep 2026 07:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754115; cv=fail; b=Pkql6SQFVEzTMMCFie2Xn+3Gm5dSy4XeI16x3WKHqeHRvvIuAaLwgWsVplDp8r7VldzOz1WWFIRP9auwIT6MgOKIGdE9YlzmTbSIYy/SrqRGQjdX0V8xwQFFVUE3shis3t29EefNCvvNe1wBZPUJcyTctMWVxN6glGUTcX6VFLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754115; c=relaxed/simple;
	bh=Qq96/r0qLli9PiLffVcBxx2whxRWFkeDAdUh2ko3MRo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=u6CJlF2tKVezo8CF+59OhFYPwE9X8Wtpzgt4zcWaKEBaTTauwROSfKsiFombt0RaAf/YIQVLFCnyAS4+vrDEp2+ZSxWW51AI6pLhisKqxFI3haKqo/d85BPxkdrautrtwjEU2xUHGz5UYXxdXKWXfkkrqsoxeupUpFFTXUD0oAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=mcYF27i6; arc=fail smtp.client-ip=52.101.70.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="mcYF27i6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EL2nl1lMYMIQQvVj2QJ2wdaSmwEC0gCVl3Zk1RlwO4uTmtT01n5cp9rtf6Y80GS1qXIHtpcromQJsyPqoRBdMo/fyVlza+C0nsqv2EQ3qLVn7XllVX74eRURyLRC4TcQOMmaRga4ZN5XwO5rf1Zb0UaCmHhQd5ex2C0hLNA4pmTbfoD42zb8aFc0RAOp7r55zlyj3I8nj1+Vj2YWQo3XlynEKokcllnEMle7BW7R2Pw269SzPtsNKhxzLUCLS/Z6nmPY2Wgp1S9bNBRpQ4ysITFei740l3zZfO0ZJVmezPpAfvwdnzw7SqM6bBeBEVQfraEsaFFYMB+II9i0yoI29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ12n6iK1/inIjyQsmoGzhgOcT7vWlGjUNusmai2DOQ=;
 b=X0V2QQrt1e1ZzYcW2XphJEwf0nMOc0M58MBQwvIeSWMxoI98xlZYViOKSudClEijzIW0olGZ7k8JAb8fefgj2BnyDkL7fTnxAE+D4KUXCkluKlmrmsfcCOb8nu+nrQqjKGTJnSDHTuRf14jPyCeAsCxV3EBzmgcPekfaWvNlpujwz2AUhQlLS0NTe6+iKMyhwa9WMqRL3Yuqy7VjOyn1J7li0dz35qqV1eAn+EYT4e6ejW5jfaGA1cuUaWIklXbiDSS/ks2jPp4JNHZmFSHOy+5PScujnBRHbtVJMO5g590mTudgNtYVHjxa+9Hrf5NX9rG35tEqc3MWzSwUxuhqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQ12n6iK1/inIjyQsmoGzhgOcT7vWlGjUNusmai2DOQ=;
 b=mcYF27i6v5UuQcWTnZpDYV9JwwEKgJqOZ6NffIWHWxHX/p+BxYd4AYr4sUY1jfblCw0DfDNeAKYthpFDU33zU1BJWCTvdrl8qu7RUJzIDOsqp2iX3VwBHyMEGNHDJZU1m0vMMtvYetHR92GVPs85yTt1/PBaKIlsJb7pRf/5oGZdXIPV1t90nFDGMDodKdFVIBGQKtiYcxvP6m0/bQvRmqF1CUcOuU15LB9/XkEHOcOursD58jHcVT6blRaNNHFTOsfedQVYqp9q6M6joPlNcdIxdrLE8Bpawb8+5XRp3Zw9NFcf+EYAsnKZWIjBi9m4IPBTbGi2dGydxomcX1pXRg==
Received: from AS8PR04CA0183.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::8)
 by GV2PR10MB6982.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 07:41:48 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::ab) by AS8PR04CA0183.outlook.office365.com
 (2603:10a6:20b:2f3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 07:41:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:41:48 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:48:16 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:41:43 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v2 0/3] Add STM32 TAMP nvram driver support
Date: Wed, 30 Sep 2026 09:41:41 +0200
Message-ID: <20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADW9vGoC/3WNyw6CMBREf4V0bUlbebryPwwxUC5SDZTcW6qG8
 O8WdOtmkpPMzFkYARogdooWhuANGTsGUIeI6b4eb8BNG5gpoTJRipLPEzmEeriOHkMiPC0+oOV
 dkdRJc8wLmWsW1hNCZ17786X6Ms3NHbTb7rZGb8hZfO9qL7fezyLFX4uXXPBUSS0zmacaunNni
 WJysbYDq9Z1/QCIIBP50gAAAA==
X-Change-ID: 20260909-upstream_nvram_reworked-f84a4b37817c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|GV2PR10MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: b083a76f-4ce7-49d8-ab3d-08df1ec648e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|6133799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cWt7LYJeVLUSEJRoR21g/CINvkRhp6yDWcHbRRmVnN8WVUcnBLxhvmgGAvi7xEh1CrpBphR0DGR90Ya49kD3Qn+JmXjwGwXW+GZe4fFE5OKAbc7Cpz/Dfg+d7pu7kRKVa8cHa2F8QyjS5lODLcOdhaP8rR4XHWfAl24XeujrV80WfcdoKTGPrIQkDhpLA+RIQB9DiPZVKnHKo0KBB9Tld0mCPmDeot615rH2zf9goAFeguBm9DzkjEWwj/D9jwIkWaSMAvj95Z2V5CApcYp0NaH8865ImAR+nsKLiQiKhV+94s6QidplCVzgbj6Pk0/ldnqmm8STlOaJN/YwTmO1oVIvXdgoAMAGhnrcbXmKfnvH07uBsSnaKWPlxtJWjf9yWo9rAPwven4XriNW9Q+mW483yWPWjG0tptye3wKD330ow7zNXVf7fNCMSx6cblSWahHLqATZhI8MCzJKHKvfAwyTuKJRhQkoHPmvPJBSSdRAEJoopJvcHH3xF2H9e2E5MUuqR6mvGv+J4sTwCqzCg+jQZMexVl9XDiCoPaDZPZWRPISGZq01Q/ID0qWaiAhA1L2zqPLhl/3vxKvnlZsDPqKYKpOqS9EAcFA74Izu5D0bia+RHtrolHFQdX59l+Sq93PVT6oQRlDJ3lKBe0cwjg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LDMqA0MiJGRpF2aV0iaO3xCGJ3xAsgPrhiYweuoCZ0RccZOWmj1SH0eGef4+xXw5XH2DvwaPW+iFdogN/JLuUtWoWVPVXrCQN/TOTrUrTnzI6r21tFB5jC92rLp9CtiElC/7nMSCJ8ZQmkn2M99sq2r8QF2W/l0lsvH3buhtSUgCSCKv0iKI6cjQDpNEX0h/6uNPPO5TYpay+AqgVXJT/X9Mj/QSXM2y4j/B9ZE3l+Fo+HNDcg7nszb+hIMat1SWpevU/9tX3/0/cXpApiXOO2GzT1xlCRFhXDy92LXFGq8iU5uTUpjvaWE5vEmHURs3KOtKu8UoU9muWQQ45Gfhjnbs51H0zOLKPLkhEZwfV0sY+YPN9p7Shf/FMib5O3Ip8spYtu5a7F99mIkneh9udQRMvTHcj7nZ8RCOwc3evfezgWEscj0hTB9LrkJ8RI3M
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:41:48.4199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b083a76f-4ce7-49d8-ab3d-08df1ec648e7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6982

Propose bindings and driver to enable TAMP nvram driver
support for STM32MP SoC's family.
It allows to expose TAMP backup registers as nvmem cells.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v2:
- Update commit title of nvmem dt-bindings's patch.
- Add required compatible for patternProperties in stm32/st,stm32-syscon.yaml.
- Fix issue found by sashiko-bot:
  - Add freeing compartment_owner.
  - Replace regmap_read/regmap_write by regmap_update_bits in stm32_tamp_nvram_write_byte().
  - Update error return in stm32_tamp_nvram_read_byte(), stm32_tamp_nvram_write_byte(),
    stm32_tamp_nvram_read() and stm32_tamp_nvram_write() to return the actual regmap_read() /
    regmap_write() error instead of -EIO.
 - Add freeing field and update error return values for stm32_tamp_nvram_get_backup_zones().
 - Update error return for stm32_tamp_nvram_probe().
- Link to v1: https://patch.msgid.link/20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com

To: Simeon Marijon <simeon.marijon@foss.st.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
To: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Patrice Chotard (1):
      dt-bindings: arm: stm32: allow TAMP nvram child node for syscon

Simeon Marijon (2):
      dt-bindings: nvmem: add STM32MPX TAMP backup registers
      nvmem: stm32: add TAMP nvmem driver

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |  30 +
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        |  57 ++
 MAINTAINERS                                        |   8 +
 drivers/nvmem/Kconfig                              |  10 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/stm32-tamp-nvram.c                   | 742 +++++++++++++++++++++
 6 files changed, 849 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260909-upstream_nvram_reworked-f84a4b37817c

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>

