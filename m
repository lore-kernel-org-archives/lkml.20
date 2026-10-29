Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297573;
	b=kBWKjNlVfsheSb3pCsIko4XwkREMsbVIeJ/fhka6x5Pc87Uy2d3zUyr2MdZvPO0ZOpuz
	 Y/3euE+BX614RbIwcrHCDM1K64qt8ROkBla1ZcV1/ewT+jxm5Gi0TN5pLWwXifFpzF3dM
	 cMfvHAzJgnDlAwqc3db0Ype3CKgf2u6Np/XDhuaBga3H6FlScP3ZZ33uBl49hhpD0AT0p
	 Bv68UYl18TbeNNzU0s1n07s82MyXnPK//zEDW7ynykadFpgM0jd75fIyj6S1c16zH3Yov
	 1SJgypsbYaD/K1Ph3cvTbYiA0j71p7zKkP79BbHV7nSQmCDwOI/5xDYaQboMfpLGuRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297573;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3Bk03z1oBEMJniFKSY5SheU++r6Xgsrmmcpi0pWvEWk=;
	b=44s7Kt2UgX+ZtAmINQsU1yIyIdouHGVcqAsXLPd9VNWBN3OFCGI07hoAKhMETlxqsSKO
	 VQ4nM8p6Iqi/DFezenSA8s5WoC+uw3MxAIHFD4UiCYr3vSNa+QaxPALJ75gXTkltanUQ+
	 Luw5xp2vwKZchc9jpXhc0Z7fTjsgdta9fhdHwKcZlWOURS+xnkxpCCMwDzzs1GTjP/PBw
	 2jBKJMqosZuDSz+FHaTnPIrqZ4Xri27OkerTWWR5Z2iBzi0CfbrWMJEAOv0DrEEUC01VX
	 vKhTp2YHtHWq2O6UZFqvfsYl2S6pvFi4MW6mR9eJo/paNh9VqWXXR39Mx6Snd9B1Wag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=bJ994kMO;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=l8yzHyt1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C048D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C048D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=bJ994kMO;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=l8yzHyt1
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69TGDTIs1079046;
	Thu, 29 Oct 2026 13:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3Bk03z1oBEMJniFKSY5SheU++r6Xgsrmmcpi0pWvE
	Wk=; b=bJ994kMOIqJiAI3hfEvE1zi2Z4E1cE0UP9JeTS/TMLsm2b36ko+PbcN68
	PpLFWjVXVodYA0rQCcA3mR3Ve02htoAUlBk+e4qYt8OllMrwmlWbGFDzBaLKE2o2
	3hCM4MRyH0ggpddcHethk7QUZ5/9FiUDOb2UcitPcjr1XDBT0o1zTSQWpp9OpMkY
	GonuMrzEf+FX/GPUgjTNMWqiCKpbHxwV8Hl1b/QwSTR5exGNtF2PxlOuj1UvMdtR
	uVubktFQJGzpqov7pet1ZFWfN13h9oXsuGmH83mZHbtHWNLcP5OPNAz+LmR6ofVz
	WASxEZemHtoqVf7YnT5q1YnLo5P2g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hkurvxamh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:12:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6D7APtbEgEro8UYks9JGOq/mC7mpeZbH+c+UKRtyJr7RQwECaRR7kzLtXnP7uDqZbk//3k3kr/e+yRkpLJK7HN/vA0pLfIC3urdUW5yngygGiVdwwMWRYCtm589ib1wC9O4WNc36g8atzHmKqYNW3kO8H6Hazruih4zOzSgoyNnZrvIgqZHvHsk4P8sitV+qJVRbmXhwfCKqECS0cpjrr5t156W72ilS9xuQx8cFIVuQoB6LTNHpMGhfH816azsWsHxal02qijfQZvd1iLOObE55hmuxnBVpgQU4qVu3lVdLeVijzTMFuBrouNDcpuzMhEiHcZFuNAnxtMFxS4UHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Bk03z1oBEMJniFKSY5SheU++r6Xgsrmmcpi0pWvEWk=;
 b=v5DqBKXobyFZDSVYzdaC1p3Mj7+QDqMPK5tquEBNtvnJuV+zOMy8mLK4fupkZh0ETSewwZGo4FOiVbA2oOKFZq98qRI878jMpX44xg8ExRy+r6I43C++tLcBQc6B5uLOV6vIzmPAjyX3KbWY5h8T/YSO9PHR/BdbOGpzC0fqJFH7gDm4dR6zq8EoDS/zOIRoQocaPTr0n3vxKrvnJzSc82Ab3yakjW+WTfHyt6pXtgrkkC1WUyAsvVD9BxI1sxYUitSFbhhc+QWdW3sIpLMcnfwpC29RfzTiVljllOmw7HdvnBFFFEQLTwQyu5aJoJAS6sn9gO7rCEoGfMdAHEU/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Bk03z1oBEMJniFKSY5SheU++r6Xgsrmmcpi0pWvEWk=;
 b=l8yzHyt1uPsz2FrXmBt6/IQMcItc8m9Olqmip9gKXXozHiWOPTuXPKo2ev4FVfjU7s33AUCeAYewsndUyAIIUOPlG/8xDQmScXeYDab795DN9C8kpBmiP+e33rk9Wj5gJBXEduCcPBaqEI8ptbp6za/vctQjp0i2tDkqXGW+PtA=
Received: from MW4PR04CA0352.namprd04.prod.outlook.com (2603:10b6:303:8a::27)
 by LY0PR10MB001655.namprd10.prod.outlook.com (2603:10b6:404:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:12:37 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::14) by MW4PR04CA0352.outlook.office365.com
 (2603:10b6:303:8a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Thu, 29
 Oct 2026 18:12:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:12:35 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:11:57 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:11:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:11:57 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmM23408718;
	Thu, 29 Oct 2026 13:11:55 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 02/22] firmware: ti_sci: Move error message handling into ti_sci_do_xfer()
Date: Thu, 29 Oct 2026 23:41:27 +0530
Message-ID: <20261029181147.266771-3-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|LY0PR10MB001655:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a4ed55-eeac-43c6-9576-08df35e835b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261026140227099003|261026121527099003|261028144727099003|10067099003|261022105027099003|261022075727099003|261021123027099003|261009220027099003|261021121427099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	72/jK6oiD9ZIHThDQfvzneTqeQNjCVH26cQ5p8V5hEu/Ru1xSOWZaBZI/p0OolrdXwtP4OjsggBporSXDvYzpBrahVUKRYWkIS4TynBFC8R51Agu8Ny8AdV/r0Edj22sV7/3qY5eVI2CsaUBG3sJr2nTPqakHjGbp9v04kJt6kk8pCWlzeEhXzGOubpC+te+Rj6ElScMGw+iF3fxQ7gZEHAQMXOh+lSlxLDQn5WDk/zgcA97lzViQFyVroCsSy+0G7gvoNhNXAfz/cYaQjW7I92RflIzk29/3Y3gzT9h7qgN7/oZ8bnxkDvZFdApWPK59G0lJRNwse1MUu9ops4UoPe9m/LBe8T6J+toHZHgq/v97dN8BqVtMhNYRLj0Csr8t7JMTG3udi0VmorIfiTkQYQLoZXqynG3a2l+Ui9WjCTjzxq0m5Q8OsDhAe/wDlxFEykDaNGb9A0Vnshx4+gH8gBcOyLG/zM7za/lBT4ZhTLe2b8sog+4wq9yK4GNNj8lU9aeXm8B923egRbcCz33Ynm/H2iXtFBTjJRPx/h9/hoMxtz1mOXZxJp8szySMDAsgC87cySG8dRhfpIohxcX0FK2QOZ3SGipGlKpvAdLhPeozOyTxf4YwIPJboyxXKOpLQD6GFVKBihtA7ASdhMNWKpzF/Wf6dKE4cQ+dBcFoVI=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261022105027099003)(261022075727099003)(261021123027099003)(261009220027099003)(261021121427099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fH7JZCntQxdKuQixpNT5X5+fxa70ulvVHmHGseP5F4C5/KWmyTkFJ38UHLQTfNMpbNtck5pfc8SeZ8ZoQxpoAeXOfcj77llpQskr+dM5MjVac+m3JwRHVDimvFwra4ArgYOtcyTSbi8T+YSLkHGky4yanalW1B236M9swTrS4B3LEio+mHBhk5VEEUzIx8mkJicUvjleymIS5wZHM6ng3n0Ca92trMGM1WRCJLrsDQftF+K4lem0Dfkav5nGpPtyWTfu9RuqufsNTpzI+wEI3VbPCnrxaelhpRPYgdEHYDuX+IF/vPOXlWwZqRizRtuY14XNZmNcJJZg+YCSeBAiMzrZZx0nL2vd701JTYnj8u3EjDlpp5gZPLmOBGt1mdl3/m57kRkUfHz81SSFEw7/tn+K3E9B8jAFJGyjPioRNXtgJbuMsyszsGRglbqAK4kz
X-Exchange-RoutingPolicyChecked:
	LyQqJyrxFPtalHiKdXv9Vjb0OYL5nDEctsW2QauSm0gKb/PPp9jrstkhVIZnC1guGmZnfk7zrEBrjDSQJfa7yMeGt14Z/mpXxN4WqDrQq+bhYzsjNFGGltgbnpe7nX3es6/j/hVdVHGynH51b384WBzwkVNITnSkO1jCJEnB9fJbaOEgwY0KbadRsPIVPc5SsxoaJTN4n6YMiAraZ/BD6GoKRyh+dVl8SHuQMs4JmdJz8hAfa1uWGD7HQA23oL8ABBPSwm3rA+Jm3kZuZvZzr/3TGvHqajse1QdR1iwMXLFv4+HFrj3qTKYr5NvKsysmP56g6xVNpr1i7HgB9HygKA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:35.8172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a4ed55-eeac-43c6-9576-08df35e835b2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR10MB001655
X-Proofpoint-ORIG-GUID: XQGFDVrOk36_Q4LknMj3C8zqebZHgkhG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX7tP/6rq04otm
 7cAnDiM+ywV65Xt6yO0cI808lsAXffrzyg/If9gpa241MMtJkpxwdGaVlBb0V5gHHYpwCBJSH2D
 v2wGm63pBHmNj5ikaular/OBB/tKkOHNNhnxWJy/6xpFNbsSj+Fs9fd2La5+clWKIgnAF+lHcay
 HK4I9Y48QpPSb8omBgMNHwRKVrenU3SCnCGin61ZnONbZjRgV660gPTlQzlLcmUiThTn38w7WGJ
 8zOJILZPzHRHoEPYeN9VJu3C01L/pUzlovXTH9L+IVSqVx3OsUZKTvgp9/XXMLJoUshy5ePVPem
 jUWKfLPm+ZZzS++eYB/z6xYyGzp1HKSaV0BRRVaYnDHS/IPjZIwaC7wg86ylb0gmbdBLL5J8Wn8
 aaXLaKkYJhmhQh5WIsvVW1IiREIYnuesMolSujHHERSlwJKKnpn7p101Kq9Y69xWhw9Zd9vXuBU
 H9SE0W/8RN7s1fKRgbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX4QLqsNfMJXFH
 tNgekMiqqAzjuIZCQXUnX/OanKXLkJeghpM21cu+d2bMmzhoCUjvF3K3g5yMP05QN3icaNVucsw
 F3LRyEYoP9KoqQAooBOjyJrV4MD8rOo=
X-Proofpoint-GUID: XQGFDVrOk36_Q4LknMj3C8zqebZHgkhG
X-Authority-Analysis: v=2.4 cv=DtrDa2/+ c=1 sm=1 tr=0 ts=6ae38c9c cx=c_pps
 a=R7TnPQtMnhj+722GCxzAsw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=KzVFh0hEau53bWtobz4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

This allows for more exact error message than just "Mbox send fail",
which might not even be the correct error in cases when the send works
but we timeout waiting for the response. This also removes redundant
message printing code from each call site.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-3-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-3-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 187 ++++++++------------------------------
 1 file changed, 37 insertions(+), 150 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 5e7d04754913e..3b58fee07c257 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -431,8 +431,10 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	bool done_state = true;
 
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, (void *)_RET_IP_);
 		return ret;
+	}
 
 	ret = 0;
 
@@ -477,7 +479,6 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
  */
 static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 {
-	struct device *dev = info->dev;
 	struct ti_sci_handle *handle = &info->handle;
 	struct ti_sci_version_info *ver = &handle->version;
 	struct ti_sci_msg_resp_version *rev_info;
@@ -494,10 +495,8 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	rev_info = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	ver->abi_major = rev_info->abi_major;
 	ver->abi_minor = rev_info->abi_minor;
@@ -539,7 +538,6 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_device_state *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -548,7 +546,6 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -561,10 +558,8 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -595,7 +590,6 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_device_state *req;
 	struct ti_sci_msg_resp_get_device_state *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -607,7 +601,6 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -619,10 +612,8 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 	req->id = id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_device_state *)xfer->xfer_buf;
 	if (!ti_sci_is_response_ack(resp)) {
@@ -898,7 +889,6 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_device_resets *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -907,7 +897,6 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -920,10 +909,8 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	req->resets = reset_state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -971,7 +958,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_clock_state *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -980,7 +966,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -999,10 +984,8 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	req->request_state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1034,7 +1017,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_state *req;
 	struct ti_sci_msg_resp_get_clock_state *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1046,7 +1028,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1064,10 +1045,8 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_state *)xfer->xfer_buf;
 
@@ -1266,7 +1245,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_clock_parent *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1275,7 +1253,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1299,10 +1276,8 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1332,7 +1307,6 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_parent *req;
 	struct ti_sci_msg_resp_get_clock_parent *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1341,7 +1315,6 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1359,10 +1332,8 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_parent *)xfer->xfer_buf;
 
@@ -1400,7 +1371,6 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_num_parents *req;
 	struct ti_sci_msg_resp_get_clock_num_parents *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1409,7 +1379,6 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1427,10 +1396,8 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_num_parents *)xfer->xfer_buf;
 
@@ -1477,7 +1444,6 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_query_clock_freq *req;
 	struct ti_sci_msg_resp_query_clock_freq *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1486,7 +1452,6 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1507,10 +1472,8 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	req->max_freq_hz = max_freq;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_query_clock_freq *)xfer->xfer_buf;
 
@@ -1551,7 +1514,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_clock_freq *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1560,7 +1522,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1581,10 +1542,8 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	req->max_freq_hz = max_freq;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1614,7 +1573,6 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_freq *req;
 	struct ti_sci_msg_resp_get_clock_freq *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1623,7 +1581,6 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1641,10 +1598,8 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_freq *)xfer->xfer_buf;
 
@@ -1703,10 +1658,8 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	req->debug_flags = debug_flags;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	if (msg_flags == TI_SCI_FLAG_REQ_ACK_ON_PROCESSED) {
 		resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
@@ -1758,10 +1711,8 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
 
@@ -1815,10 +1766,8 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1868,10 +1817,8 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
 
@@ -1933,10 +1880,8 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1988,10 +1933,8 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2029,10 +1972,8 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	req = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2051,7 +1992,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	struct ti_sci_msg_req_reboot *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2060,7 +2000,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2071,10 +2010,8 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	req = (struct ti_sci_msg_req_reboot *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2111,7 +2048,6 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_resource_range *req;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2120,7 +2056,6 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2134,10 +2069,8 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 	req->subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_resource_range *)xfer->xfer_buf;
 
@@ -2230,7 +2163,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2239,7 +2171,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
@@ -2259,10 +2190,8 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	req->secondary_host = s_host;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2582,10 +2511,8 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	req->asel = params->asel;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RM_RA:Mbox config send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2613,7 +2540,6 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2622,7 +2548,6 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2636,10 +2561,8 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	req->dst_thread = dst_thread;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RM_PSIL:Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2667,7 +2590,6 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2676,7 +2598,6 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2690,10 +2611,8 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	req->dst_thread = dst_thread;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RM_PSIL:Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2760,10 +2679,8 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	req->extended_ch_type = params->extended_ch_type;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send TX_CH_CFG fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2827,10 +2744,8 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	req->rx_burst_size = params->rx_burst_size;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send RX_CH_CFG fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2859,14 +2774,12 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2899,10 +2812,8 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	req->rx_ps_location = params->rx_ps_location;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RX_FL_CFG: Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2927,7 +2838,6 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -2936,7 +2846,6 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2948,10 +2857,8 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	req->processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -2977,7 +2884,6 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -2986,7 +2892,6 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2998,10 +2903,8 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	req->processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3030,7 +2933,6 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3039,7 +2941,6 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3052,10 +2953,8 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	req->host_id = host_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3087,7 +2986,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3096,7 +2994,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3113,10 +3010,8 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	req->config_flags_clear = config_flags_clear;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3146,7 +3041,6 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3155,7 +3049,6 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3169,10 +3062,8 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	req->control_flags_clear = control_flags_clear;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3203,7 +3094,6 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_status *req;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3212,7 +3102,6 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3224,10 +3113,8 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 	req->processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_status *)xfer->tx_message.buf;
 
-- 
2.34.1

