Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FC64A205D;
	Mon, 21 Sep 2026 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998316; cv=fail; b=RGXU8RyipjRAU60/ng5sN7ILyCBOnhGZDRiDpRDr9QRNiKaN0XdN8HyaiT/pWtJgDktshtMkFfFKptHk8omc5M8XahDZdhkuYiDQUgXrcEsY/XnKOMa0ZTLlqYpfSPN9OnY3EvVZO6bSSvVwkrLSEazBCRnULw6LbXTI+ydWAVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998316; c=relaxed/simple;
	bh=n0skHPz4Oqo5XrGHqYC63r79XTAJOc3dsMzQWAJ7OTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V2nnRVZ7OXtlhbRRO4muT5POyZmQ8KybWrLU4t6gDsDcl9secrMZQw/K8KfL4rfloB3m/kApKyT3O9ddFPYcQqOuH2k1tEgzxAhuAI6MoOBSZ+0thk8sC0fptIT8yYDWA60GDgDvNKNeelbnjZBcS59nvN0d3An+cVssXphZxwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MKDZMs+1; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MKDZMs+1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aimhwKofuHnrVqanSfUolR4WVG0Hv1QNMoOdiqmtgWXf/nj4u6ywBzS4ako7gdZvKHou8t/txXAUPPSiqOqsFj3MwzXzLtmUt+VhxPpS0lMgA6iCbX3jiK1bG09ZAFyKJ79QrGjMK6vkx9idInv7Wa17H/Ll7hQg37moONj85tvkvZhg6azPKW2/9Uxsdf3pDzODblDVXx9g/xP/yy5KflcS7twloSChPkZzagyUaXB9FNihi6ELMTKYESqgOFTQOhwcAow44DuP8+HMYuOSetOJEA9pv3ShHc3RDkgi/+FhW9eW9OgNJpJUYQG6uYk5EA64xNffVYKnjg93lkxjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p87POCrQ8h3/zE8xfaiJQX/lheKpY3Z9C8m2arFVDME=;
 b=jsRjj8KPk51tA/aTcc1ue86wkXWdrnH3I2Ypaq7oi/kLCg6O7XQ4MRxybSJR3biCqwz2G7PpBn+ShEe+1a4uhePV2sIjJuLiPLl5ifLo9P6FYx4X3Sxg2rnDQs8q+7XDuqyFDCQHxFiPYDJpQcCec2P7p+9kveyinp4l771Yc5l308ralOJEp2+o8O7p5mOw0GHgkf2ZCZ1Vd4K35G+a2I3x/BNFyGexxsty2Vxeu2h9IJxEM56uSmUKzAL1GKLxdgxMcMdtgKIUF7X++MkBjPKMOg+/MdoZIpilH0cUA48ZsbPfUw8E9JmtpqWzw7jpWUM3Qh0hd2LNzcTZD2dS6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p87POCrQ8h3/zE8xfaiJQX/lheKpY3Z9C8m2arFVDME=;
 b=MKDZMs+1YDZ5Ii7mJ2DKXSml1/aSBzDcsJ32lc31bEB6COTlPe57TqckU2pedwXPqeCFV+Fd/wOtFuKlKRRsPq7CvHsXYHOcmkypvsHj9S2SvZRVC9vGv0it8d89Hb9z0B7F7u54a4Q+3qvMlRTMkJVDOil/BRPtQa/ZYeVwwOo=
Received: from TY6P286CA0040.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:3b7::9)
 by OSZPR01MB7035.jpnprd01.prod.outlook.com (2603:1096:604:13c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:45:09 +0000
Received: from TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7:cafe::29) by TY6P286CA0040.outlook.office365.com
 (2603:1096:405:3b7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:45:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005622.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:45:09 +0000
Received: from laptop.adwin.renesas.com (GBR-5CG34119KX.adwin.renesas.com [10.226.37.103])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 9A837300025F;
	Mon, 21 Sep 2026 22:45:05 +0900 (JST)
From: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/9] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
Date: Mon, 21 Sep 2026 13:44:22 +0000
Message-ID: <20260921134432.50338-3-ayman.chaudhry.kc@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005622:EE_|OSZPR01MB7035:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2645ca26-67f5-402e-61c2-08df17e68d7f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1x4XBE1/UnSBmdTUBr/3Y+8DleoGvd2vCcFHxXPS8eAUT9bI+d55VHvMeysRaG3kra6yPFvc/HebrvMcBnnbU5+b8xMcMVezSNmRavRZYx/fLeeYzLx8Kb0+b2rxohK6DB32rTWW0lkTz6RfPdVZvteY4Bz38O4yhuIxH76cJKRX54px9Q6WDFeMQ0s12o2hW6n9pcYbeLPCjJ/971eGCF53jobcCANlgEsWsVv6HNdF2RzfNuzroZjrREm+AFUejMjVxZsxBQjkxdAx/x0xpXL/jwgH5qTjYAkzslXWnOFeVj9NJXqmYLhSm6dD5lxRKbdxLlr/q6zDTo4rHYvEBQt+fGKLiaxl53gdKwOvvGhEc/WwYBHJbdxPEhfN1hA9I8ZvUffRNXajJUOL+dbeps4eG4OjMQ39cMgXGaOmqsZzKTSFJ5LOeseg5nHMRmCPIp3md8LHXx1AlQ63TLMCPpzm+lqAzKvVDGQ8BauN/yIlFInXq1FeQgTtIGuCvoAnMCdiQ1RE1I0WiXJqm/88+LYP1wprF7c7mCACYjq5+F7nhw4JD/0941a7w2W1hjWWcNCbGHmiXNtPARDsKnbfsx3nuvUsZGZz/iSRE995fjmz6QHKhPuqZdNpWZFxjnL0RDKuctqkH9SVyz/aD4M2C432zm54LAwCOktcOztOH6WJbfeGmO6uxhx4omeypUFjI+kvkt1Qs6u4HDWQ/Tx7Vg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E7u7pkkLs11TkeXFwiom4gRBpUsUPHv/c+Qg2n2CZ+WVTYiRIttgSN8gDCe3s1B4xnCnO5RizFKBCOEM9pBjrxqvS49JaphTAuqDmBRHvns5QCYldWRoy/zgAEpqD0W5UOJTRwVFCWH4UJwjBuXd+JuhBoIQG7ujRnW0nXuujyI5a4lUk0xTx5LBk2n1ppAdXkLNZlUgo985/HNYGmtTLn3yKw/XTOBt/SaVqRbewsUB/sLNG2DlFouXsBqhI1CKOTVrpshej35Vs6B1KVdeIL9vcB4Pj8uiq9mAkk7u090zvXjDSIUsF4sgTelKpAs2lAxr0jLEvMMuq4pGtjs8PT6HfBaIFTngZ2qiWvGXGqwOtYo0b7s/acEqeHi8CwN+rQarlYtcdzZCwlDzcAA0Y6gxRtAQH6tsmN/Ati9MNWaKoT1LDe7NdZrJ0xOgG3wv
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:45:09.3256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2645ca26-67f5-402e-61c2-08df17e68d7f
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7035

Add power domain indices for the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3)
SoC.

Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Updated commit message
- Renamed file to include vendor prefix
- Added vendor prefix to include macros
- Added Reviewed-by tag

 .../dt-bindings/power/renesas,r8a774a3-sysc.h | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/power/renesas,r8a774a3-sysc.h

diff --git a/include/dt-bindings/power/renesas,r8a774a3-sysc.h b/include/dt-bindings/power/renesas,r8a774a3-sysc.h
new file mode 100644
index 000000000000..ddee6812e9a4
--- /dev/null
+++ b/include/dt-bindings/power/renesas,r8a774a3-sysc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_RENESAS_R8A774A3_SYSC_H__
+#define __DT_BINDINGS_POWER_RENESAS_R8A774A3_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A774A3_PD_CA57_CPU0		 0
+#define R8A774A3_PD_CA57_CPU1		 1
+#define R8A774A3_PD_CA53_CPU0		 5
+#define R8A774A3_PD_CA53_CPU1		 6
+#define R8A774A3_PD_CA53_CPU2		 7
+#define R8A774A3_PD_CA53_CPU3		 8
+#define R8A774A3_PD_CA57_SCU		12
+#define R8A774A3_PD_A3VC		14
+#define R8A774A3_PD_3DG_A		17
+#define R8A774A3_PD_3DG_B		18
+#define R8A774A3_PD_CA53_SCU		21
+#define R8A774A3_PD_A2VC1		26
+
+/* Always-on power area */
+#define R8A774A3_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_RENESAS_R8A774A3_SYSC_H__ */
-- 
2.34.1

