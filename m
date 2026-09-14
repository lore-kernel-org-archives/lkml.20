Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B1A199EAD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416959; cv=fail; b=eBkb0Gy4/Bl6W9KaP/H9SPKrHdBeW6vbVqhMXLT+F7sxXajSpobG4k0IGCwXg3XG/FTon1hRTM3dvlHAisUb7EZp0caNMvFTpO+EwGKoOU2iZpR+XDe/yfITHA3eoHBIxUflv2QlvnO0ZZWLGwZtsVafgmXLCU2Sy2KBkmpdSyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416959; c=relaxed/simple;
	bh=TM50yrCnKlHFecFBMzVpi6N8+EQUrNtJ4JKdDSDcJDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bAk+Zbe2AIxXv/JDHl0ctW06U1HQdBehwJyj1x7mKEc16p3ziuvvuOlrsnPaNapjK/6y0yfS8EDiQqbvV5YRZVc+Rft8v3QtmyAbsP25j6YhjMllA9uBZCwpiQxGFvU4UvS5swnh0e/nwj34IZ4MbJJYQcx5gKfpXyO+8YfOwkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nSNN61BU; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nSNN61BU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPKn0XxVV2dn3UlhYO2N0NKsWcAFkJFEo8VvBBx+a7EJZ3iM3L98cnJDV30Xl2EIHXmReOmVknysrwzZ0euvKby+7mm2GEYSH9v1VyuT5opk++7T7DDuG/y7wBLt2gheG533gX0vnVCsH4xSCk7A2re0n1/A+emlqHAnX+ryWbBn4wBqFKwfJ0H4r9U8+jpobXN8X4xFagYr/cGrc5JslyNduCcDauAmMaZFcN3q7EHig+BmW+MZM4OccZFzZc/4ypU9pw2dDP0RIW8MEeMtWwIgCnIQy3A10E4xi9lNTrse71XHLOqkE3pxLVd1nrejdo4RZ+fhS/cV8GKJYheWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMHEFDimhdn0MCy/mD6AMOzqNMlFO4fVV2BvvIBmzM4=;
 b=izgAJr4BlDERZzS6cB7K3yvdfp43JTpnfpusKrW2RaUJDESCelXs2u79L/DKH/JYDQ8JncewTyuFztr2BimcVvuRDwbKK8eEVxKd14+P/9+UEMIfXnG8jVQqOIbHEgZgcfNPISs92frsGEmo6IavzoyRQ9XjARt2q+aNrUFHfgQSSozL1nmj2+5BSenUG8a0920z5gZNxxp522JEaJatgPaDFBJlJUIEgp7X0KEURFZsB9IXAxIdgDgeT0thvMvspwJZAo9cfSAucbfgIz3qDwabgoQUlgbpfeFnSEwzqdaiW1X6VVkiyU6PVFGj0rddtRoFANUyBw6ddFQ+6yOCUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMHEFDimhdn0MCy/mD6AMOzqNMlFO4fVV2BvvIBmzM4=;
 b=nSNN61BU6xzTu67IjSZ/9x0y9xugN1Op4T7Ea/RJLfWtMPD9rFpERvjDmoqJXtAm5VcojQGXhiTGDpXCj4+tWJ9WvCIg9I7ObGf2y0aNUmHnyaIfNNc4zWDH0XX6TLheR8cgnhVK32XTD7vjFJDbWyuskWIBcSZUcrBfEsz7/58=
Received: from OS0PR01CA0030.jpnprd01.prod.outlook.com (2603:1096:604:25::17)
 by TYCPR01MB11374.jpnprd01.prod.outlook.com (2603:1096:400:3c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 20:15:54 +0000
Received: from OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:25:cafe::50) by OS0PR01CA0030.outlook.office365.com
 (2603:1096:604:25::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 20:15:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003E.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 20:15:54 +0000
Received: from demon-pc.localdomain (unknown [10.226.93.156])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id BDD33300026E;
	Tue, 15 Sep 2026 05:15:52 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH 0/3] MTU3 MFD improvements
Date: Mon, 14 Sep 2026 23:14:53 +0300
Message-ID: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003E:EE_|TYCPR01MB11374:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed4e706e-3199-4a27-371f-08df129cfae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Xd8GDZBIRJCl5dgY9xDRgbEFNuBLWFBsa/2LHOIGKShYOpK82rW8v3YnAjtiHK4QmG/7SSNiW+o0G+Px3LOlusD9e2ifu9SUATE+ABjuOH87WWvd/tTJVaoqGdFvINCCPNAGuHy5WZ3M5joAzxfdKv431IYiFSpbtgk32WhgCtOTqhLJab1Te2Op3yk/hQ1qqzHBMrxkx7qoLnX98cTP9XDaifR9EH0cgX8pQNevbl4bKqxOJeNhrrt9X2GUU7D17ar4MpKosT0jrg8hIxZQwBf5JFGuLWnaJt2HggLVHPOPr+gdJhXkhvUcXn49OKXA7YgG2NigxUXLOQ16TvtjTMO1jAfqdEHxLy0Q99tmVDuNxJk5vHxyABH1chBIJUt/ERFzkgBRHUch1fZ94YVCUIxvdxJP/nWIAYMzI5MoWVyYelyp/DMsj9mRKELQPFnl12IpK7C/OceKsg6ECVmNS4L5H61zJPGi8wRAUXGwWWGv2dlP4xtwZ0VKt/EZiTjDOM3lxVk+AvEOnFRgg5keX1OPBperDaC1xfyanjqRhbpvOp3nGpdWagJGS4RQQwBhSg36sdkIt9IlOWin56q/b4dpLzf2vv3zF0s054cTpZxHbY6t5jo5YigZBla3jsowWhHtX9PRabKvdU/x1ph3+oJrsAOIPJ9yflKFaqN+pWt7MS4zMsMBw/pczI214PbOGqNTewHQUzoJ39c/XN4L8g==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kkw6vnMCFJcff0OcLRpciL3bmvzLd6sjbQWm4Zrmtwn1N7OywOMiowUjk2XG5SNeJWJ8BBEwF9UJPvEpkDmF1v5KXQWfj1siIlcZ+HWguMl3nB4iiIoiKqqwXFHLCu7+iuQ+TMM+xK6mU/tz8sEPzVL5WQ0R0QCgkpbieOgZERhU9EM8z4RSl/6Oi4fpFQxapK3uEakGMLmBqfOEtw07FjX5k1tBMI3Txb7GdBCrXLUGFCH1fgm1BLdpxblmyZBsCaFln5Pq2Qtey/KrVKoJDEqV/yx87tHwXVhx+tpbdfo8ct5oluRgMHJEC5o2ycQ6GfOv8W3brTwtOrg02pHWHN592U2CjKJ3iYUsqeUk6muj82zR3o0SP7iqk784+VjRs+1ysj4Z8aHYSVq6P4eLuANPh/0GrhfDr/e06XvcuORZ1g5ow+YkP3bh/2bXc6gH
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 20:15:54.3061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4e706e-3199-4a27-371f-08df129cfae9
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11374

This series does some code quality improvements to the MTU3 MFD driver,
and enables runtime PM to allow simplifications in the sub-drivers by
relying on PM domains rather than open-coding clock handling.

Cosmin Tanislav (3):
  mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev
  mfd: rz-mtu3: reuse shared_reg_update_bit() in start_stop_ch()
  mfd: rz-mtu3: enable runtime PM

 drivers/mfd/rz-mtu3.c | 71 ++++++++++++++++++-------------------------
 1 file changed, 30 insertions(+), 41 deletions(-)

-- 
2.55.0

