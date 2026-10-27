Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793090276;
	b=J4gf//sudWB+OVKbcAdy1E1UseWaTLAQep/egYSdo8kD9m2QWeU05xsnu+o5VQckzet8
	 tIjLiLRNxxuxnhDzeDgjX9asyTVJnVHoB0uB4o0JYX+j4WTMwf759pVtXuH4EwOMFrFRA
	 +lHO/Lcu/LRpx5BkeoNwn1wawYYRegSkJZeI12aqaH7dvtSkV13p5ehdKlii/NVOMFUGO
	 Px2XRFQUiCtYRZVcvjgKAT/WZ89Ie5nXSRCnyLOgJR3R5QDwaalCcx0M/qlVythRavk0J
	 0MpZpeoGXKN2gpbmvarpwV2ml6shuWaHVczFLsAWGTcPRX1sKJ/vV/VoXY/LIPrOt/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090276;
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mtg9/1n7fUZC52Btb04TGsA//iuYfYzk0ZmmBo4ssYs=;
	b=PFwRDZZb2Sne6HS3i2V4JcDQOxDdGbMZC7BxKNuL0Ly+wNA6kJQRlP9+xfn4WJGQ6L/y
	 tirpA5LPN1CL0clwfj4/Z1RlrOFG8EZ3pMgmsIMYWm3e9G+YpIR3jHN/MlAKpkm3hdVW4
	 bfV+he/NrTLWfJ1s2Wp8qwl6zdqhNC5Pahw2aJf5wfiQtWXWWTS6iHyYd4QKndQ745+dC
	 6AjQYwEhcJoc28CLOFsuqFtacyVizVLgRzgpzKC7tVV66qgYTr+H3QxgHC1JumUADKuiY
	 nYvfxqOsDvxzzj69PKU2LUJ4Kjr0V00OLuTW46Hw9jXtUBRyUKLDWRL9Ln/gWbZmmeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=C+tCUyu6;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=knPuEXq2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD869606A31A;
	Tue, 27 Oct 2026 08:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD869606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=C+tCUyu6;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=knPuEXq2
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69R5XRi2265842;
	Tue, 27 Oct 2026 03:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=mtg9/1n7fUZC52Btb04TGsA//iuYfYzk0ZmmBo4ss
	Ys=; b=C+tCUyu6XGXDS2CZwywyqe/jzFAhr2Jxmmnbil2y47877gtkjmFVAcR1+
	ZRMMDQgS4eWoAF/h4VG5cwJbdVOgVZo9x9IfZcevWttrxuBHw4B1Mn9xtZnz0QaO
	+g0+z81SQo5f3ysXiUkmrzO47RW7eNccBY2QEksCQ9EgnL2NwvMBZSU0LHd34YTo
	L2x2/GXHPTXurRCAG1qQUZxZLXpB8BROJ81ViRzwLJPvfA2/tprx8CSnr800B3Rm
	Yt2tDS6rUu/dL/CGPxxQTFiVPz0QMoJxNRJ5+9N9OmhbN3dCCGJXxxXYyinYWvZv
	mBfAGOKUdhN0CM9utt4SnqRZMwOsQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012049.outbound.protection.outlook.com [52.101.43.49])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hjh77jpdf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 03:37:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFxFJ+TVbU0sUQnUUklAtcdjKKXVUD3MLXkSw35tZSIYtwZlJGYvVD1WyxQ0qZKl0Kk1WAMQZnrhV+DpFmSTBl5r2dcfT4mEjKIgV7l1/l2e/mnIDt/CIf4RF2ZigSiuEBTivUgL+QuX7E/pqpbkHjQDRklVVCb0Mo0FElYZ956IcjlrzNrB3gaUVZJ2hoLN3J1y+RY9ILnuaByQ28oAe+2CODcSWiObh+8fMSqvqmtSToP6jeNo2PQ0xAjU864TmVIB82ZSFFywJhwQPIsEs9n6mbYTcaQtR784aW96Ve2lFkOUz8KG05MLICuuSznAqfc5JbK2IVa7IAkEAGtKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtg9/1n7fUZC52Btb04TGsA//iuYfYzk0ZmmBo4ssYs=;
 b=maGmi46WXtaQXK6eTnr7O9LsW7n551n94XcrmfWGu1VJXrH/ke+kBK0e6OjeGu28kYsGY8BKVGkKkOXZaiwvtPfLYBhjdc6A1OWbxv/msqJpTm6jDFAt3xXOfmY3dKRddWqokjieeRA84Py0xurh8E05OF2qUT+K+bKHew6GkgfRsaZW/NX8DAHFMlVVDbuWiVU3uUC6wo4MmWYlU5SSSOQ6hyid0eBOYEHnFWMBcPF1I79k0rdFoRIgCGyAVO7FGzbLz/stANSeN4rzdvSrkUe8Ct5b9kcRMlq6ILZuQ6EtXPrpzMb4VYB7H5aalqcMHPEcQoqiEZbiCmqJiVxtYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtg9/1n7fUZC52Btb04TGsA//iuYfYzk0ZmmBo4ssYs=;
 b=knPuEXq2iwRFvVwcsJ+dfuBfTvUJ/F1YNIizqyU3iVVTTmBvv2y+GNJAFybTkxU3PqAYy+Ik7X1SHuIeusAmWbhy+QJkkbI3ozNC+duCK4d5OOh9ZsZ1b8qc6d94pGGPLVbFxNdgU2r0HJuVcFL8LkeEnObcjPYr6l7WKC3QjF0=
Received: from BN9PR03CA0452.namprd03.prod.outlook.com (2603:10b6:408:139::7)
 by CH4PR10MB8027.namprd10.prod.outlook.com (2603:10b6:610:239::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:37:27 +0000
Received: from IA0PEPF0000003A.namprd03.prod.outlook.com
 (2603:10b6:408:139:cafe::20) by BN9PR03CA0452.outlook.office365.com
 (2603:10b6:408:139::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 27 Oct 2026 08:37:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 IA0PEPF0000003A.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 08:37:27 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:37:17 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:37:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 03:37:17 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69R8b1hF1558035;
	Tue, 27 Oct 2026 03:37:12 -0500
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/3] soc: ti: k3-socinfo: Export SoC registration helper
Date: Tue, 27 Oct 2026 14:06:59 +0530
Message-ID: <20261027083700.1964371-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027083700.1964371-1-m-shah@ti.com>
References: <20261027083700.1964371-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003A:EE_|CH4PR10MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 264b1032-1bf4-4b32-e61f-08df34058815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|56012099006|261026121527099003|22082099003|18002099003|10067099003|261022105027099003|261021121427099003|261021123027099003|261009221227099003|261009223027099003|3023799007|261022075727099003|261022113327099003|261026140227099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	k296nVGdazoBoXmBRW+4utCkhrou69+dgiPVhMcxHnPBOgFMMddYHlabEPF3IzDavYVAowC81rM27K37sD09/6Il+8KshvH1K7LMTfqZcEypWW6lnYGo/CeuuC8UDHW6kmLcXqBMKumWTUH0jDSkFFCNCVfs3U0ek8MmmlhxbLk7ydRD7PO0ygdlRVQ7lLwZE+9RapnbKxJz2fAOIzIZ/TO2TsifRsHGkfBjgu4CWRV9UrIWyMV9aStVjY8+9CWL2jNkc7E8/LGprhlbaJXA4HscR1njK8dQ/cZcMpk1mIpatyc+Il10ntvdRBv1TT+ZUU7j6JWqSyBu4YyiXBF7jZmt+Bk2CLO2ZH53KDJ0y+dsEV1Ci039wtfVsZO99h7RQGrbCOMUhYwpTEcHk/f6g8lJuWL/yDt5QXXeWNGou7MGKN7ufHr/h3U4kziZYmM2xkp9VG6JNLqNW7OOQGjY+tTnWy586I6rGuzVttCo6IJb8L/kSA0ZI8U5YuA9whixziztxVZciD6qfh982bIUUyHMUIK2Xu3pn/kXho6ZObeS24NMjwjkg48ZD45n6sGfMHqq4+KxS/cOCAK75umcocHcl28JtqAr/fZEpWkUhSXg9WGpHFI46ETg9n82rEKF76WgFzTeCyEtaSraqvuxWQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(56012099006)(261026121527099003)(22082099003)(18002099003)(10067099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009221227099003)(261009223027099003)(3023799007)(261022075727099003)(261022113327099003)(261026140227099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/75FF4jxeXhSe7SvrPZrgDO+xJ71yxylbKhyrfV5patahVeBR4uD3PFS3OZvFffvJ2TblFpcwtSvbAK9zhfTYf9RvwdjOXdIR046D0rH3ZvEhb5zmF23aggCVdcmoH7JASPj9NYFU1TGpwcc0jT9AZgib0XDJt/oAZRljoJvRxyQfmme6G03T9wsSSdAj4Txf4J+qh6Qi26qFxNvWDaHMXJygy9lKY+MVkrlFrAvB7YNXry3SRfXlm/oJhE1K6or63fv0woYLp+XxwpD9JAIEWtPqVmEiwELQdJ65xX9YIVtncdXxId2qbR0LEHY+E0pdw1bZSulkeMHRLmtgbjRty1ys1l6nAyiJJlU9qK94Q0YMC4Vsp5JrYxeA6oMi0hyYsBlqC0Z7insV89/hZav0Jjv66r/SwY4KYTQnmN6rBXRL0EwjB8XT6ANQExIMTL+
X-Exchange-RoutingPolicyChecked:
	Egtk4gC3C2kPpDC84kwD3c9MlLSN/z4XgwG82GwfGxBPsYs92eF/0s76RxUtS60ELFUYmocwteqJ5DBTfX9ql8Q7rdQCFXCLObaly0Ei+nZl52+M9IpsmtR6FrSE8IUIgiQxxLXcsvZqxRKPQUyqe03kJ6zG7wLDxlD+5ngc6csYTGaXTK/VcGDbHkVQH/qP8GiSGLl5usEfYygs57uDuZmucwozyj5pNQQdGXpM5fV2F315Hu5UxBWHdVh08kM+U8xg50H7MoW8mp7+TJ8dBJ2PQqks8+DvrnMOQ52F/+/xYStTQ84dJOpZZE/f5ppfo6r0XRjDAAP0LEiBzWm/dA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:37:27.1270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 264b1032-1bf4-4b32-e61f-08df34058815
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF0000003A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8027
X-Proofpoint-ORIG-GUID: _7cgZLWpD3gFzO7VTy4rA-kll2mDllqe
X-Authority-Analysis: v=2.4 cv=FMeOVOos c=1 sm=1 tr=0 ts=6ae062cb cx=c_pps
 a=cGw96uMdUXN41aDBKcSctA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=9o2SDgNTmoWgWv0daWUA:9
X-Proofpoint-GUID: _7cgZLWpD3gFzO7VTy4rA-kll2mDllqe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX4HRbJUu20rwu
 mfJ11yEQU4gegoervLCPpCZk28umgkUP8x9n3aiHQOblGHS7SazPgI9PD9zcN3ddvvOM/ZHClwo
 kt4+Mm7ba1BVFmgFgZYhtYHi+xowU98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX0M7Tz+vp695y
 elcjpwL4vz9euOEtuTbTX8HmYKr53A5kQ9RS0+/8cs3XjLACgoMbD5Ot95rx+XOHwyFdvs5GjI1
 S9g8pSv5UWhlW4qD95kIDqsXjIEwv7JANR39C3WoWpXnLfU3AsaUaK148KOclwP3v7reFnbb5YM
 T6etSenbbIYudLWVEwC6F0X0DBC7W6MfkhAKqECftxbb0qqMQyYrGesAnQQT43gWxOUM0Cuwjq6
 s8nnQK1jTJFRq9OdBizeokvl4NjvH3jsWbAgyY8jt6YUMLbe2GKpFVv6UNOBj6nGk1/kEwhm+1e
 nr4ecWDe3j7T7gwq6A3O1DVP2FfUx+zXEV9R/z3BUHbBoZqG8u7PUQSD2fLhNRv2xZ+S/cmiLwa
 y68d6XUYBadMyHHXwvweX1ZpWsKh++Ls4QE5ZVdhmi/BGEu7lvZYPdM0K9QD/j9t+jxXuxpdATB
 1u8vIQVHmhjFjz7bdNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270034

The k3-socinfo driver reads the JTAG ID through a dedicated MMIO region and
then decodes it and registers the SoC device.

Newer TI SoCs like TDA54 use a different path for accessing the JTAG ID
register, but the decoding of the JTAG ID into the SoC information remains
the same.

Split the decode and registration part out of k3_chipinfo_probe() into
k3_socinfo_register() and export it, so that other drivers can register the
SoC device once they have read the JTAG ID through their own access path.

Since the helper can now be called from modular drivers, it must not leak
the SoC device when the caller goes away. Tie the registration to the
calling device with a devm action, which unregisters the SoC device on
unbind. The SoC attributes and revision string are allocated with devm too,
so they are freed on unbind as well. Callers need no unregister counterpart
and the helper keeps returning an int.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 drivers/soc/ti/k3-socinfo.c       | 119 +++++++++++++++++++-----------
 include/linux/soc/ti/k3-socinfo.h |  11 +++
 2 files changed, 88 insertions(+), 42 deletions(-)
 create mode 100644 include/linux/soc/ti/k3-socinfo.h

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 48dbef3acceb4..e81d27e03c9d9 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
  */
 
+#include <linux/device.h>
+#include <linux/export.h>
 #include <linux/mfd/syscon.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
@@ -12,6 +14,7 @@
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/soc/ti/k3-socinfo.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
 
@@ -115,14 +118,14 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
 	case JTAG_ID_PARTNO_J721E:
 		if (variant >= ARRAY_SIZE(j721e_rev_string_map))
 			goto err_unknown_variant;
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
-						   j721e_rev_string_map[variant]);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
+							j721e_rev_string_map[variant]);
 		break;
 	case JTAG_ID_PARTNO_AM62LX:
 		if (variant >= ARRAY_SIZE(am62lx_rev_string_map))
 			goto err_unknown_variant;
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
-						   am62lx_rev_string_map[variant]);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
+							am62lx_rev_string_map[variant]);
 		break;
 	case JTAG_ID_PARTNO_AM62PX:
 		/* Check GP_SW1 for silicon revision */
@@ -134,13 +137,13 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
 				 gpsw_variant);
 			gpsw_variant = 0;
 		}
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
-						   am62p_gpsw_rev_string_map[gpsw_variant]);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
+							am62p_gpsw_rev_string_map[gpsw_variant]);
 		break;
 	default:
 		variant++;
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0",
-						   variant);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%x.0",
+							variant);
 	}
 
 	if (!soc_dev_attr->revision)
@@ -152,38 +155,39 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
 	return -ENODEV;
 }
 
-static const struct regmap_config k3_chipinfo_regmap_cfg = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
+struct k3_socinfo {
+	struct soc_device *soc_dev;
 };
 
-static int k3_chipinfo_probe(struct platform_device *pdev)
+static void k3_socinfo_unregister(void *data)
+{
+	struct k3_socinfo *info = data;
+
+	soc_device_unregister(info->soc_dev);
+}
+
+/**
+ * k3_socinfo_register() - Decode a JTAG ID and register the SoC device
+ * @dev: device on whose behalf the SoC device is registered
+ * @jtag_id: raw JTAG ID register value read by the caller
+ *
+ * The registration is managed by @dev: the SoC device is unregistered and its
+ * attributes are released automatically when @dev is unbound, so callers need
+ * no matching unregister call.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int k3_socinfo_register(struct device *dev, u32 jtag_id)
 {
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node;
+	struct k3_socinfo *info;
 	struct soc_device_attribute *soc_dev_attr;
-	struct device *dev = &pdev->dev;
 	struct soc_device *soc_dev;
-	struct regmap *regmap;
-	void __iomem *base;
 	u32 partno_id;
 	u32 variant;
-	u32 jtag_id;
 	u32 mfg;
 	int ret;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
-	if (ret < 0)
-		return ret;
-
 	mfg = (jtag_id & CTRLMMR_WKUP_JTAGID_MFG_MASK) >>
 	       CTRLMMR_WKUP_JTAGID_MFG_SHIFT;
 
@@ -198,20 +202,24 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	partno_id = (jtag_id & CTRLMMR_WKUP_JTAGID_PARTNO_MASK) >>
 		 CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT;
 
-	soc_dev_attr = kzalloc_obj(*soc_dev_attr);
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
 	ret = k3_chipinfo_partno_to_names(partno_id, soc_dev_attr);
 	if (ret) {
 		dev_err(dev, "Unknown SoC JTAGID[0x%08X]: %d\n", jtag_id, ret);
-		goto err;
+		return ret;
 	}
 
 	ret = k3_chipinfo_variant_to_sr(dev, partno_id, variant, soc_dev_attr);
 	if (ret) {
 		dev_err(dev, "Unknown SoC SR[0x%08X]: %d\n", jtag_id, ret);
-		goto err;
+		return ret;
 	}
 
 	node = of_find_node_by_path("/");
@@ -219,22 +227,49 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	of_node_put(node);
 
 	soc_dev = soc_device_register(soc_dev_attr);
-	if (IS_ERR(soc_dev)) {
-		ret = PTR_ERR(soc_dev);
-		goto err_free_rev;
-	}
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
+
+	info->soc_dev = soc_dev;
+	ret = devm_add_action_or_reset(dev, k3_socinfo_unregister, info);
+	if (ret)
+		return ret;
 
 	dev_info(dev, "Family:%s rev:%s JTAGID[0x%08x] Detected\n",
 		 soc_dev_attr->family,
 		 soc_dev_attr->revision, jtag_id);
 
 	return 0;
+}
+EXPORT_SYMBOL_GPL(k3_socinfo_register);
+
+static const struct regmap_config k3_chipinfo_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int k3_chipinfo_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	u32 jtag_id;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
+	if (ret < 0)
+		return ret;
 
-err_free_rev:
-	kfree(soc_dev_attr->revision);
-err:
-	kfree(soc_dev_attr);
-	return ret;
+	return k3_socinfo_register(dev, jtag_id);
 }
 
 static const struct of_device_id k3_chipinfo_of_match[] = {
diff --git a/include/linux/soc/ti/k3-socinfo.h b/include/linux/soc/ti/k3-socinfo.h
new file mode 100644
index 0000000000000..487e69d0069d1
--- /dev/null
+++ b/include/linux/soc/ti/k3-socinfo.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_SOC_TI_K3_SOCINFO_H__
+#define __LINUX_SOC_TI_K3_SOCINFO_H__
+
+#include <linux/types.h>
+
+struct device;
+
+int k3_socinfo_register(struct device *dev, u32 jtag_id);
+
+#endif /* __LINUX_SOC_TI_K3_SOCINFO_H__ */
-- 
2.34.1

