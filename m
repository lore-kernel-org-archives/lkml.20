Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297589;
	b=M1Di8oea/iCeuappXwCWI4XCAUH/c+/UvbngbsEad+MEprV4sXu1h21eQ1aJt/nZ5Gcu
	 Lzc+gMkhTg84FPmEKn7Cmz41Dt0qlYpVZdU9ANYQOQPomPSBQzBYiQDjf6KuETNLnF7LS
	 Hj1vyf4BQduLPSBPc5cZVDULOC/L+1ohiH7Ohp6SKpIhmV/h5hhHFdKUsQ2JgPzMnTdIp
	 92M/99RsXYLARHPJ48LBX/f5upygeycvXWwplIb/TaIwBk7jOYRjgAa8+XQKgnbIpAzU7
	 fxDLupEaFBiKOSwp5oEPACqcfVumQP+3ukT2oC48FR5tQ+tpUti+hS9Tlf0nPkBDQ5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3ohuBoogFDxW79EGmHiIAUWI0STUi5B7v6J+3TdQJhc=;
	b=Aj7OxgqF+FXKFxaIxqPPpFaizhlDoGFL4v3GtkxfxEpM6esR5aWTiVWA0zIUEhn1fpeQ
	 kFPBBJG9oQr25XAioTpAD0ZdkMEYXGSZmtxfVCDRNBRGceZ8DG5tvPMXcj91K0lhoNSAB
	 jB9oshEAoax6GVRolbZweDh8orlR+O4lFLv+fpqr0M7oevzQluGpKDyUpTyBSBOpHFLR1
	 z5/0jlsRDJ/tvBbEq68stVl4ifLBqQYAlloDvd/k4PAqS9XOZB+jCG2dn0rYrYrcj9OlX
	 pHfSKlCTKpMZggReWYtRPDzTqWLJx8mPiOV7P8FRGrVavmibIZB2mMaAx7OFtZHJZNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fRqEj+0k;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=R3aKZk+l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57849606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57849606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fRqEj+0k;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=R3aKZk+l
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDRq03224646;
	Thu, 29 Oct 2026 13:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3ohuBoogFDxW79EGmHiIAUWI0STUi5B7v6J+3TdQJ
	hc=; b=fRqEj+0ksN314UtliWOnn1xejdY0NLuPbiQeTqc/Imd18xsUhI1xNf+5J
	q2shh/NmPC63Wh8FAbnPnlvd4m8oiElA+ywh7/HQXQD/ndoSRn892+gEt8Kx6x2S
	CELmq0gM/0t+FePy8269iwQWs+zHh1PBNqt43zcHr6hbWjyXWQNQmUEspgaSj+Vj
	uHnNqLcZQ5xTVcjFUK2n3u6bmQ47HMk++C2KBRz7OqKesp2Ya0T0nTiEDaf7Q97p
	ZsfEPDFK4Z04rpNm4jnMKq/VQlK32gdQFYSRS5tyoUkuzvDoh4tQ+ChYJ4zkkC66
	GU3MLR9jU3Qv6pdvM031wgtv/aHpA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm3h7kkj1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:12:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Np0U843t/oU5K3LZ73hJwRKAp49bfW45nQBlND1fk6U0/nqn3zh1wYehquTa9nM8bHTSqMS668yJVTR5nA3pg+iyU480OXJTucwq7nuWNKhDWo7JAkyOSSYzioqsBQqI4qZ1kahWm6YHUIg5TYzliWnSA3IkcYTkyz811urJLn7ETUi5Lm2C0Qc/hYfIjmiRdziHjroUYVEWNL78BOVOd1DRaKfXhuI/x6MUNjmiRd5Rsf9BcCf0p/38POgotwlxYjz3i+6uxSUBpGGdrv067DCrFwTsnJB45v/s7zDcpNC8e1piCAgWope345WqEabiMaDIHrfP5pg0j8apKk8VRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ohuBoogFDxW79EGmHiIAUWI0STUi5B7v6J+3TdQJhc=;
 b=qns8Sj3rIqUhYWEdjbiIFw8UhkVqQOpFn8tEXCssewv3RkUoJFEVcr/YEDwMLBtF7ZGhIPti93heb7p9fZ1i5qQ5B8ZI+bGuY9a5bZXtVgDwNdYOF5w8dqsL0Q5qbVFvAGT6KO2Y1HA6c4JdnmmkvPuwLG1KOW9DBusv5+ZV3BaHN3DpqSUfiMq9zTJWNrH1L5fZx/m+b5CiZFr7x6wRxaUdW24vY+APz15Xb6nhku695HvqJO4fYWE4RdkmrmM2oM0YOCbjv/7Q6ITcGnLs3JoH1Rel9f4QnvuBwjEfdsEU23NLK/cpCyHkp6znpXPT9xTYQ/532iEuCGSlm7bSBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ohuBoogFDxW79EGmHiIAUWI0STUi5B7v6J+3TdQJhc=;
 b=R3aKZk+lwh0MG9/SVGkK5hLQ4Aq95qeuiAFhgdfI7pZwkcqCwU3ievdVQ7znYgTK7dhTGOH3e1J3B47PGHkP95re753LyalFasEUrVgVca/Dop8qUpBY4c7rmo1/BdD2b+zQRctgnDEOuT6zR6vFj5xMo7FFgjtqIskkcnls9FM=
Received: from PH8PR21CA0024.namprd21.prod.outlook.com (2603:10b6:510:2ce::23)
 by CH3PR10MB6787.namprd10.prod.outlook.com (2603:10b6:610:14c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Thu, 29 Oct
 2026 18:12:54 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:510:2ce:cafe::50) by PH8PR21CA0024.outlook.office365.com
 (2603:10b6:510:2ce::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.3 via Frontend Transport; Thu, 29
 Oct 2026 18:12:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:12:51 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:28 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:28 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmMC3408718;
	Thu, 29 Oct 2026 13:12:26 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 12/22] firmware: ti_sci: Fix some kernel-doc references in structs
Date: Thu, 29 Oct 2026 23:41:37 +0530
Message-ID: <20261029181147.266771-13-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029181147.266771-1-b-padhi@ti.com>
References: <20261029181147.266771-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|CH3PR10MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 692e1703-6713-4877-4c41-08df35e83f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|3023799007|22082099003|6133799003|18002099003|261021123027099003|261022075727099003|10067099003|56012099006|261009223027099003|261026121527099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	UXtdbokiu5GRc4JuH6kdlH1BhXaMxmPMbMWZoWcHt9TzCWXpBIb1RoNQIVC9y2TN8Yl+tSHqxEvfX6Sj0Bwd0BBuqPL+9PDGsnOAi25tLi1iiQco72lp67uvmaS2+HnQkP4cH0uBz9YHALakK4BWEKtN8PDYYrz0LtT+QZDJdgqscyNA5xEDBUkE28+aFVZD09Acoo4gTl/Po9HVzNCytgIt7pThfWHBtT/nkV29/kkIvN9TV0XnL/vM9bTHGPRswZTXjd1pe6jpU/bl5xEqz9VUVA8gjLeihG60UypsO9Mqc10c32v1V2v64K8FZ/GmTe/tuAsGocH79C4F6hQ6LYHe5EyJN9lXrElZbHzd+C8oB4DDniEndy6WT/i7QBIGl43+0XuWsFdj+BMZb1h/a4tLCfrHZkyUiQQnbHu5NyFpkrGuZLw0z8ZKAGcGv7Dcia+FEs3xyuLGf+5VSbOY6NErCSYJ9OyldHOoZUoAyxfSD0gXr0bIYUiP8DkRfcebBF6/OSeyJ6C+Sb66Q9DcD1JK7/wN+B1wX1a9uldpPNZnBMNuUXiGLTABefBCTRd/gUcLittC3mlaLq9nslmLERWQIa4jUHH2yoJknX6CgnycQPe2kO5uhHnHuXv9P7S8w+Iq8BysWFxpwNYNGbdFsGERhDL8CIsfhz3XmUTBfxE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(3023799007)(22082099003)(6133799003)(18002099003)(261021123027099003)(261022075727099003)(10067099003)(56012099006)(261009223027099003)(261026121527099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PwKD7bh1PfYBqeRz0IQOun2mCsVtviWJx7Km1PlooCHPlgt3zAMOI/vmsHXFgGFFFa+hIPEuyBlwLNuqKCJ8e+4EdhKTfnI8lgpFLhriDT8E8wSyBkob52fqleIbLUQFr+sx1FTYDiuCt0nKATv5VId/lDCAO45767XuiVl90CfLux7e9i5OQEbsj7Lp831yRADmRy/MG9g8wfGAj6dP+tv8ZvMchAs2KyBEaK0OQIYZOxvOnsvfmtv3ukCYiikdGk1/2wTqx5+iQJ2eaUw25+4EqUy9ecmVpCToTMkXOclhDlaOWSlmjGn7wnjlsPytc9PxkFLn947TSOYAiQF+t5uogFMA0R27I676a/SAs6xomPextGKSUOyWmKZ49YIII8S6XzcFTSg2OqDRj4+4Pv1RppbvxAgXvw0VFO3O2azlGyZHhtLtVgITiWkeehlG
X-Exchange-RoutingPolicyChecked:
	mhFoSHAUQbyThaSGTZPer/FFiSOM76/9lcTGxvGIJ8RJS8Zy4jVbCGpEBhFPtS9wroZY3N4jRRBB6xyF9PCftFngSv237qyDvIfC3jFGYgjvq394foXeG91RctmQRsGI6okOtjpwVCSgef+Sb1AvaAeEoFfrdcbBBD8r7HCEaKsUj3iltQbs2zujx/JTNT2zw98p9AI0dX6sZsD2sNZcd6Btu187l3YMbYrChL3onKwerSTn0pN+GH5yZyq+MgvYoMrZu5nJa0B6693kN307HCewfX7G3mEI56pXTCf47z3p0L/W1oHrfhIDCL9ce8xwDQBZHvG1AHvo06NAXSSkyw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:51.8303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 692e1703-6713-4877-4c41-08df35e83f3d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6787
X-Authority-Analysis: v=2.4 cv=fv1J914f c=1 sm=1 tr=0 ts=6ae38cab cx=c_pps
 a=h6NrD5D8j3GnK3ckJnoRDA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=1fAJz2lvPm5DfgJi3fcA:9
X-Proofpoint-ORIG-GUID: S_YEHzkPJUEugzpDeN4mi-iTybW6hom2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX+0hOBRUNgxSM
 YTQrryU9FhB6qKuCezHtelUXrf9YpsgUgtf5rK4bzx4VkE/+T9T6QA0N0rb1Yivq87ydGputs9n
 IVwnrJcg6yzviVvJyNUr7Blqt/kNk24cHQUV2EWQum41O9xxpjbkNEmpRYs7ge9q4FN7zCC7/9L
 2hl+N2etKHO/3Nuyd5RY3AResWy2c6h+qPgeU/bdleY89JuQYDQX1LrSw8oLdTagFnvcRRC75Xa
 7q/RQk6BB2hjTbPtMJJBK3RuwWNOInoAkDjq5wHJS6corohYy41gNTE9s5UTuZDcvMQ6MjM+ybJ
 XqQoBvkWfIyIM6Jd9pE6e/PV8CsXzs19w9/Vi7QrrD8f+/mvRuwAF+D+uH+IgFsZToELxw+KfMb
 gkpDJVkohhY4IklC2MWmO9kCOQxuhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfXz0QDV3XNd69y
 BZwltuvXdRzromjySIlSfy5kchNAEUWYG80Uswh8i5gl5phkSt4UvDCCGEnSScLbDTo86bdOYDU
 4KpLB1glrRl6WARbhYUDlYduR/O76kA=
X-Proofpoint-GUID: S_YEHzkPJUEugzpDeN4mi-iTybW6hom2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290071

The valid_params descriptions of the RM ring and UDMAP tx/rx channel
and rx flow config messages refer to struct members through structs
that do not exist, the wrong struct, or syntax that kernel-doc does not
understand. Refer to the members of the struct being documented directly
instead.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-13-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-13-b-padhi@ti.com/

 drivers/firmware/ti_sci.h | 126 +++++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 63 deletions(-)

diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index 8fccbcd1c9a2c..34f7848073a0e 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -813,14 +813,14 @@ struct ti_sci_msg_req_manage_irq {
  *	The ring configuration fields are not valid, and will not be used for
  *	ring configuration, if their corresponding valid bit is zero.
  *	Valid bit usage:
- *	0 - Valid bit for @tisci_msg_rm_ring_cfg_req addr_lo
- *	1 - Valid bit for @tisci_msg_rm_ring_cfg_req addr_hi
- *	2 - Valid bit for @tisci_msg_rm_ring_cfg_req count
- *	3 - Valid bit for @tisci_msg_rm_ring_cfg_req mode
- *	4 - Valid bit for @tisci_msg_rm_ring_cfg_req size
- *	5 - Valid bit for @tisci_msg_rm_ring_cfg_req order_id
- *	6 - Valid bit for @tisci_msg_rm_ring_cfg_req virtid
- *	7 - Valid bit for @tisci_msg_rm_ring_cfg_req ASEL
+ *	0 - Valid bit for @addr_lo
+ *	1 - Valid bit for @addr_hi
+ *	2 - Valid bit for @count
+ *	3 - Valid bit for @mode
+ *	4 - Valid bit for @size
+ *	5 - Valid bit for @order_id
+ *	6 - Valid bit for @virtid
+ *	7 - Valid bit for @asel
  * @nav_id: Device ID of Navigator Subsystem from which the ring is allocated
  * @index: ring index to be configured.
  * @addr_lo: 32 LSBs of ring base address to be programmed into the ring's
@@ -1023,23 +1023,23 @@ struct rm_ti_sci_msg_udmap_rx_flow_opt_cfg {
  * parameters. The tx channel configuration fields are not valid, and will not
  * be used for ch configuration, if their corresponding valid bit is zero.
  * Valid bit usage:
- *    0 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_pause_on_err
- *    1 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_atype
- *    2 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_chan_type
- *    3 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_fetch_size
- *    4 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::txcq_qnum
- *    5 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_priority
- *    6 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_qos
- *    7 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_orderid
- *    8 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_sched_priority
- *    9 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_filt_einfo
- *   10 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_filt_pswords
- *   11 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_supr_tdpkt
- *   12 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_credit_count
- *   13 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::fdepth
- *   14 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_burst_size
- *   15 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_tdtype
- *   16 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::extended_ch_type
+ *    0 - Valid bit for @tx_pause_on_err
+ *    1 - Valid bit for @tx_atype
+ *    2 - Valid bit for @tx_chan_type
+ *    3 - Valid bit for @tx_fetch_size
+ *    4 - Valid bit for @txcq_qnum
+ *    5 - Valid bit for @tx_priority
+ *    6 - Valid bit for @tx_qos
+ *    7 - Valid bit for @tx_orderid
+ *    8 - Valid bit for @tx_sched_priority
+ *    9 - Valid bit for @tx_filt_einfo
+ *   10 - Valid bit for @tx_filt_pswords
+ *   11 - Valid bit for @tx_supr_tdpkt
+ *   12 - Valid bit for @tx_credit_count
+ *   13 - Valid bit for @fdepth
+ *   14 - Valid bit for @tx_burst_size
+ *   15 - Valid bit for @tx_tdtype
+ *   16 - Valid bit for @extended_ch_type
  *
  * @nav_id: SoC device ID of Navigator Subsystem where tx channel is located
  *
@@ -1153,20 +1153,20 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg_req {
  * The rx channel configuration fields are not valid, and will not be used for
  * ch configuration, if their corresponding valid bit is zero.
  * Valid bit usage:
- *    0 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_pause_on_err
- *    1 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_atype
- *    2 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_chan_type
- *    3 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_fetch_size
- *    4 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rxcq_qnum
- *    5 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_priority
- *    6 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_qos
- *    7 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_orderid
- *    8 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_sched_priority
- *    9 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::flowid_start
- *   10 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::flowid_cnt
- *   11 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_ignore_short
- *   12 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_ignore_long
- *   14 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_burst_size
+ *    0 - Valid bit for @rx_pause_on_err
+ *    1 - Valid bit for @rx_atype
+ *    2 - Valid bit for @rx_chan_type
+ *    3 - Valid bit for @rx_fetch_size
+ *    4 - Valid bit for @rxcq_qnum
+ *    5 - Valid bit for @rx_priority
+ *    6 - Valid bit for @rx_qos
+ *    7 - Valid bit for @rx_orderid
+ *    8 - Valid bit for @rx_sched_priority
+ *    9 - Valid bit for @flowid_start
+ *   10 - Valid bit for @flowid_cnt
+ *   11 - Valid bit for @rx_ignore_short
+ *   12 - Valid bit for @rx_ignore_long
+ *   14 - Valid bit for @rx_burst_size
  *
  * @nav_id: SoC device ID of Navigator Subsystem where rx channel is located
  *
@@ -1197,9 +1197,9 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg_req {
  * @flowid_start: UDMAP receive channel additional flows starting index
  * configuration to program into the flow_start field of the RCHAN_RFLOW_RNG
  * register. Specifies the starting index for flow IDs the receive channel is to
- * make use of beyond the default flow. flowid_start and @ref flowid_cnt must be
+ * make use of beyond the default flow. flowid_start and @flowid_cnt must be
  * set as valid and configured together. The starting flow ID set by
- * @ref flowid_cnt must be a flow index within the Navigator Subsystem's subset
+ * @flowid_start must be a flow index within the Navigator Subsystem's subset
  * of flows beyond the default flows statically mapped to receive channels.
  * The additional flows must be assigned to the host, or a subordinate of the
  * host, requesting configuration of the receive channel.
@@ -1207,10 +1207,10 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg_req {
  * @flowid_cnt: UDMAP receive channel additional flows count configuration to
  * program into the flowid_cnt field of the RCHAN_RFLOW_RNG register.
  * This field specifies how many flow IDs are in the additional contiguous range
- * of legal flow IDs for the channel.  @ref flowid_start and flowid_cnt must be
+ * of legal flow IDs for the channel.  @flowid_start and flowid_cnt must be
  * set as valid and configured together. Disabling the valid_params field bit
  * for flowid_cnt indicates no flow IDs other than the default are to be
- * allocated and used by the receive channel. @ref flowid_start plus flowid_cnt
+ * allocated and used by the receive channel. @flowid_start plus flowid_cnt
  * cannot be greater than the number of receive flows in the receive channel's
  * Navigator Subsystem.  The additional flows must be assigned to the host, or a
  * subordinate of the host, requesting configuration of the receive channel.
@@ -1274,25 +1274,25 @@ struct ti_sci_msg_rm_udmap_rx_ch_cfg_req {
  * Bitfield defining validity of rx flow configuration parameters.  The
  * rx flow configuration fields are not valid, and will not be used for flow
  * configuration, if their corresponding valid bit is zero.  Valid bit usage:
- *     0 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_einfo_present
- *     1 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_psinfo_present
- *     2 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_error_handling
- *     3 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_desc_type
- *     4 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_sop_offset
- *     5 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_qnum
- *     6 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_hi
- *     7 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_lo
- *     8 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_hi
- *     9 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_lo
- *    10 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_hi_sel
- *    11 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_lo_sel
- *    12 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_hi_sel
- *    13 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_lo_sel
- *    14 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq0_sz0_qnum
- *    15 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq1_sz0_qnum
- *    16 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq2_sz0_qnum
- *    17 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq3_sz0_qnum
- *    18 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_ps_location
+ *     0 - Valid bit for @rx_einfo_present
+ *     1 - Valid bit for @rx_psinfo_present
+ *     2 - Valid bit for @rx_error_handling
+ *     3 - Valid bit for @rx_desc_type
+ *     4 - Valid bit for @rx_sop_offset
+ *     5 - Valid bit for @rx_dest_qnum
+ *     6 - Valid bit for @rx_src_tag_hi
+ *     7 - Valid bit for @rx_src_tag_lo
+ *     8 - Valid bit for @rx_dest_tag_hi
+ *     9 - Valid bit for @rx_dest_tag_lo
+ *    10 - Valid bit for @rx_src_tag_hi_sel
+ *    11 - Valid bit for @rx_src_tag_lo_sel
+ *    12 - Valid bit for @rx_dest_tag_hi_sel
+ *    13 - Valid bit for @rx_dest_tag_lo_sel
+ *    14 - Valid bit for @rx_fdq0_sz0_qnum
+ *    15 - Valid bit for @rx_fdq1_qnum
+ *    16 - Valid bit for @rx_fdq2_qnum
+ *    17 - Valid bit for @rx_fdq3_qnum
+ *    18 - Valid bit for @rx_ps_location
  *
  * @nav_id: SoC device ID of Navigator Subsystem from which the receive flow is
  * allocated
@@ -1313,7 +1313,7 @@ struct ti_sci_msg_rm_udmap_rx_ch_cfg_req {
  *
  * @rx_desc_type:
  * UDMAP receive flow descriptor type configuration to be programmed into the
- * rx_desc_type field field of the flow's RFLOW_RFA register.
+ * rx_desc_type field of the flow's RFLOW_RFA register.
  *
  * @rx_sop_offset:
  * UDMAP receive flow start of packet offset configuration to be programmed
-- 
2.34.1

