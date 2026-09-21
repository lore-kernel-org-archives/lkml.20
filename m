Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD9A4A0924;
	Mon, 21 Sep 2026 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998322; cv=fail; b=UTuck5IQWew0pBgl9kNTW/kzihC83zpFsm2MIqxj1/tMkI/fspFBUaAOskGgD5N6VU+LYH+Bd4MygpmCC3nqzrod35ddeDZ+1rPXwRVqkLxV1QZAjL7bqDT0Dx9TUP92hRjfnYSF18AoqJDJ+gmfXDLgPO1pCqer7wz3irJ1SYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998322; c=relaxed/simple;
	bh=GD6QXmEiPdZhakkUocE2Ssuza5xIbGwWyjIxA6pz6jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MR5yBrEGfeX3JhSETzM3lethF+ae9rTxTzxMes7c9+7VVDRegIN3NTA4yp80ctbyxLZq73SbFKXBJqQnfYbp3/rHat/yXVs5dHD5xtarnXrkJXHZXBpaMGbMkAnUgLt/P8Yb/wmC1Eyx8bYdtafguz1aVT5g6xJ6RGSctxH3h/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lnvMEtvr; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lnvMEtvr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USlhcICMRG8byOV7tLeCmcN9L+/mzju49QX8agN5nO8C17/pesdH5QAQZ0HkqS5KVOlW+F4kaA8jn9C4JLr0QqW3zjHemVOVyUoQGu4E0ArvmRigs3HkMW1m88MlgDtjkqdT2OWW/srNFwJonVIzcQ6GFaSYEX+YBmN8TG5TZ32xG1esl85nRZsrSX9Uk//v5DSXc3ek0xDudU4DdcViZWwd/vdc4DjlWoWLiZGr3gY0BKEGosW5k82SlaBd+5lLNv0At53u337Kq1HtzfkHZGyM42yXyfNvDkiBwrg0QNSs2vQ+6H1q+8Fe2Etl7MaBLsbvgR2OyS8lfi7rBTYrNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siYp5IR2sMpig2BXvvhZHcQtwLfdLlx3Pkc0rO51ZF0=;
 b=hxD/vhRUR//JAFYVR0FVFquOyPFKK7Qlau0ajmosfvVjZHTxuJnejbMi97HtbmlSo68Xh6h9fQsuyTDAOMbbaAtpFXpPfTaIdUKOskZopgCV0sMMdhxqJ+5sQUhVfw0l2XkVvKIVYrK8V0gC8QVfg/RfyrRPd8+KmWBUhSgqY7TaAORRlTsa8Ina+FFWMkI+S2YIhFHVClK0YL7TTyJR+ho56FPJAOmJDJ8zhb772KrmPJlOSjOB6KUe64Iywqrwt3D/Y6BztbNFtXgT5uUvGlQb0+/QTboRsv2cKV5WSwoLyJNwHtoTaOKys6mjWPg62YZzhk5h6XrfGaTZo2PrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siYp5IR2sMpig2BXvvhZHcQtwLfdLlx3Pkc0rO51ZF0=;
 b=lnvMEtvrceDo4F6SUe/jjTYohod1Vy4PxCnl0+BFzoydyht1Fi9zUMj86cySmH+MxhbYGc+TGQbViMsqF1eRaAV0hvkoa7PXTN4OxqFXvslLcS9JhPelgmz34l316/ruSDK356wxsqz6yCKJnZ6wHnZc/IhdnmDnqgMaj9MqT9c=
Received: from TYCP301CA0082.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:7b::20)
 by OS3PR01MB9547.jpnprd01.prod.outlook.com (2603:1096:604:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:45:16 +0000
Received: from TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7b:cafe::82) by TYCP301CA0082.outlook.office365.com
 (2603:1096:405:7b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD8.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:45:16 +0000
Received: from laptop.adwin.renesas.com (GBR-5CG34119KX.adwin.renesas.com [10.226.37.103])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id D0C533000279;
	Mon, 21 Sep 2026 22:45:13 +0900 (JST)
From: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/9] soc: renesas: Enable SYSC driver for r8a774a3
Date: Mon, 21 Sep 2026 13:44:24 +0000
Message-ID: <20260921134432.50338-5-ayman.chaudhry.kc@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD8:EE_|OS3PR01MB9547:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b92defcd-732f-4239-dc0d-08df17e691c5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	9TMTyKd9rj/vBPp+sh77Pi0+UwlPWZ9bgnhucOjkWX0XM1bBcJIp1nIaRNs36i/oIkRkTOL5CJ5IynLAZTsZC6dJCDATLAB+BWqJJfSSbuUXWyTLhXMVIuun1FVp7wwVDOC8c0cFR9FcYYh91yz/U6Vz4+RAxOHegKajnd1Jg4EJvTBbWIB6ofmuEhQGmWmeQM11wLgli1dlYPCql5P/GWTlXdBHsfBUWEe9jQCCTZOmzZ/zzFwjHZG1xVGsTU3PEevZftFXVpjEB6ABwc7O78DoeyAYLbdGjffbCWCfSNe5E49iZCIkZag08a3Whnw5HUB/COiOM5G6x+Sav54EJrrBz4c/lwlIsS7SqguwMy5po+OHCow26ckCPNAgxhitR/kZ1CTY1EzvID61Wk8ip1bJiJjSt+1LOoQTX+l8tXq0GvfS2OPYmyvMnXCDDzkf/g+kyeo1SizUGKb3RE4Rn3lpwaU/RDco8jQr38dopEhMsxs4DawIsjYLx0B9D4hUligER8pczgvXLLrxQB08Z+7hXtkI0OOz5jbibFHh3iJUXfIz4IzmEnk8lR09YzruWCdDfb3oKaxPS+9xlyUgeOhDqtgbxn+Z/2V6aa3XFS4//UgatJeLXIa0E/kC2pwNmMdeTO06V6+s7Uw93FEzqwtcTIb7nXrfF6sfq/wivino2NvAJC4ZMvQktmuBrfK1TW061DVYYGNr2XMwOVWReg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dvN3f1gv4SPMeGp2hMQ7s920fdV9MQiXsFxviJaVaTK94zzHxBLrGhQL2O+OKXylbj9AeIZBjIxp7QYxPhrwmd/490TSUkLm1ShdJ3LTcvrL41+1KxKYz/eIBIrkLzEO/5CdjLVl3gHcO0n5tzKFr7ueQMBEqj/WUrgr0JUbIuWeqYEcnHFEo5jnMxx9Lw2PdAnZ0RYpVukb2b0sqH7/wZ1ab8iNqIqAIh53BjLu9Xd3kPDjQwT7wTDAfOC52vKN6Ot+rw6DenyZMLyoQ/V/fSsuZ5Jcr0/Nm+vhN+tj3XORM8CSx/Bhz+QMpyUyai5wPJyVtK0reacnLof3ldGRSuG/ejwOQJDwgy22kSUlfwqz7MJSZ4QFPD3YDvHP04c0kV9RShzTN8THQgnVv2RDgbITDojSnq+pwDiQwkxCcdLkA/u2nQOx2DQZ0WX7brEo
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:45:16.4984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b92defcd-732f-4239-dc0d-08df17e691c5
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9547

Select SYSC_R8A774A3 config option if ARCH_R8A774A3 is enabled
so that System Controller driver is enabled on Renesas RZ/G2M v3.0 SoC.

Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Added Reviewed-by tag

 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 0f6d53abd86c..5445fba0879d 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -231,6 +231,7 @@ config ARCH_R8A774A3
 	bool "ARM64 Platform support for R8A774A3 (RZ/G2M v3.0)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
+	select SYSC_R8A774A3
 	help
 	  This enables support for the Renesas RZ/G2M SoC (version 3.0).
 
-- 
2.34.1

