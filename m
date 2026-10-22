Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792696567;
	b=iwKHiB1GyIuW6GU4ggchDD0jojcyFp+K2dnXTT8mpu735PRxc5YfOKUMEzqjPOemo4BJ
	 6AWxU9BTpekp5vT3NdwBDfJextfVe/wVLWzwjVTpdZF+niyKd/wUf7DPmvbL1kZNvS1YQ
	 YydFJG1jjFXedgj/qBOsSkaG0NBrZMmjErUnSBasKTxFAIGXKVK7+i0BH0NnAXPdIJUVi
	 mmGrz24T5xuefSio7BzL/NagvQw+uwkiZtWymN8XlX2F5y1dfSXNszzZpmLbKJjghwrIA
	 ZgzQomOn68GGwMyFLFcd9dKNlF3KQKEcoscvc7Hh7CDAlwyqc02DfCHy4PuzVgagOSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696567;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=58YpJQTO2oRp+O7/3t3U87MRlDdLTO5P1QmGw/uHFkI=;
	b=gF/O5+l2+VvADZyBk+NwJdlWaKzORq2Fyu5A06N3eLxVnmDSF4ICEYHvYQ36WCUpKH5P
	 GS81TQ98ZmeEhB2IfJZ/Ymy5oS6uxH3JGineIpTKdCfBRep9/Bk4u8WTIWTqi78xlWSTh
	 GHLXAB2quYDeDmUyOXyhWrEjKjZldWTAXKqU1oEkz8G6SYGy3D7Cj9s4Gt3VoHiWkPL9G
	 RK/6os+GJXE2MNrYD4IpIwwOEIEa/suB8vz9hxJuQWMjtH/AcCnaFP3Y7xfpf6jwxfqBD
	 CvFrinRVaAhNEg2mSnYL76WTBiRKbP4hbMrlg3oodhsdCfVIukYbU77EuPSQOrfp7vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="WRB8p/uS";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=PsSY6c89;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED536606A328;
	Thu, 22 Oct 2026 19:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED536606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=WRB8p/uS;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=PsSY6c89
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69MHsX5w3652518;
	Thu, 22 Oct 2026 14:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=58YpJQTO2oRp+O7/3t3U87MRlDdLTO5P1QmGw/uHF
	kI=; b=WRB8p/uSyzrWq5EfSVPIiy7SqzFC5qKHgl0zQWCmoCdUdoh2h+EeJT96H
	l0gtrizuJJC321ge5leBSGEUxojYibeYBJ7FA+2TKs4ZoNUKtsE5ycww8L5GlU5M
	gl7EZkqSNEc1EfxePKQmtBLCjUJRiwWg0oZ3NXEHKlcfCUQxndNk/vKELXWSz5TP
	5d/wlpwCZCQWYR7Rpbo1I+Apeop8T39ATQk+PMsu6g7pelII7+nuPuO10jXDshK9
	mm6xGFQ36Bf5zXs/yd8JCYtdC1x18p/3VVPo1lqwvRipiEvt1Ibjx9mfYnpiGHig
	xpbRYn7oJrNi99+vyDNhK0ykKKalA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011017.outbound.protection.outlook.com [40.107.208.17])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hfmg81qws-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 14:16:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2oq/GoOHWYmtaoltUNTn0XBUF4qI25QS/50A5IKfLe/SkpkDT8Z63IZ6WYwKLLjDaIu9Xt4IAiXaoJsJgYquTOJBpQhUInoa0ZPSKESxNPQ8t68ly0tSpkD7CnW1Xw8Bqzc+vzi4AibpY42gfVIKj34SUfDReAAu3aU/g4/jz7GXfch4owqM3fSJJ/oB+/h+MC5Tgl9G2uQ+W+hFU12705x/Na3wWU75DtiCLj3XAuXBXEDIt7tPH0MVdR25Etzs4iI8pc9d0RykMJaHOCOvRzqrBc4aAcCzeOLENDH4ORRaJmK7QozB1VzCC7TGvUfAbqvfsm/oLVk1VnhFAkPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58YpJQTO2oRp+O7/3t3U87MRlDdLTO5P1QmGw/uHFkI=;
 b=fBTxBC1UtOntf2ApUIjuUFq1KyKJEG+S6pSItoZWWmcPUDvUPDojZ+Pf6oT1PTD/zk/7kNrVDBjMuUsOwcDA0FqoGpnvChMvEsbXgwOCm+/cgiaCCVfyDm5gpzTkdaK/jdPHWFZdjLEJJ5cbI6Z7QwYxZy2XA0Ask78JMwUI2Tm9UKc5nNmtv7Ov0dMesFXpkVsUPbl/hH4RNYgQFMgJtlmhAE0gVYd7fQS+aZjuMnH8nDCYizfLWlh5frxuzgonnAKe4rM4cDttIF4L2OL7FAK++JunIsmTgInaq18xm9jkePfOjAWlXLosS4allX48iVrmyntx809XFChDuc8DRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58YpJQTO2oRp+O7/3t3U87MRlDdLTO5P1QmGw/uHFkI=;
 b=PsSY6c89RkcfLU0PZFFCo01dguqJ+9h3xPok41K7XfQReEkxZBg6+7q42Vm61eySLDfPl6wultYW3AWZWRlQcP0vVbJjVMJmZb85NYUI5xB0eNwIY0k8grxyvnItr3wPP3//xRFpX9aNagyECr96RoV6fLknLpuR3RiNOHvX8Oo=
Received: from CH0PR04CA0069.namprd04.prod.outlook.com (2603:10b6:610:74::14)
 by IA1PR10MB6099.namprd10.prod.outlook.com (2603:10b6:208:3ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 19:15:59 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:610:74:cafe::a5) by CH0PR04CA0069.outlook.office365.com
 (2603:10b6:610:74::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Thu,
 22 Oct 2026 19:15:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 19:15:56 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 14:15:09 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 14:15:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 14:15:08 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69MJF5iY989659;
	Thu, 22 Oct 2026 14:15:08 -0500
From: <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <nicolas.dufresne@collabora.com>, <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <b-brnich@ti.com>
Subject: [PATCH v5 4/4] media: imagination: e5010: Enable autosuspend for runtime PM
Date: Thu, 22 Oct 2026 14:15:03 -0500
Message-ID: <20261022191503.1025072-5-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022191503.1025072-1-b-brnich@ti.com>
References: <20261022191503.1025072-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|IA1PR10MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: 294272d1-6bb5-4325-3325-08df3070e63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|261021123027099003|261022105027099003|261022075727099003|56012099006|261009223327099003|261009220027099003|261009221727099003|261009221227099003|261009223027099003|10067099003|18002099003|22082099003|6133799003|261021135927099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	NvpJFvm/3UPPQhi3TjGJzxVoYpF7ZKoh6HPvz2JqB42YdZNuUgcop2UaS6aGuTaJyl/zEpu2M4Ck8z6vLQ1Gy4xQa/cf82l2A0/eAcuIx36eMp53LtcnypwMYep0Sw41CGSX8bF8LI7rfrVEpGT1AAtfeIlmxQZ1JK+OSxZ0qFjEvxgTbvTrcPhE4wLTQ6hBAYLznJFxdrK1Wh+IvYJ9sXuP4Aaa6cb3VONkJG//21EV/t2njLT4/WXaJO/J4vXDAB/pvmfhvkpAAbboB03cKwGebeLTTZoI+LUFPQv8+9O5iTw7qghHlWQIRg9Ismu+nTlJsqEkZ4QuMMdzehNaDQg24q2rpdzFox7YO0tLHVd1n8nB8WYp9kPvf24UeapMRnHWifdSbauSPN7JgCeC4iCYsY8b3np36mkaX0LvhwZU9F9KCBcRt9j5j5zWPPHuF+R6zbpqDKEXdein10lbNA8BEUJXKO3TkT180g2pgoa8jW3cUgGvFdlXM798lvppqzZf1x8hDeUJAefP2w59cZBNFI8bywa1wIFqy3ScKlv2XbRDFsDd4rg01NC1pozFDDfSJ5jKW2mFx4V3lNuztTPdPk8wyzo8/VWUojxOR5sjs8EndL253haW51eAtjs2MEEIj8AkAKiVHovy3u3PQDRkS+W3Ki89nJ19TxaLmT5T5ab4tt042uQoGipFsaK5Fj4MxxdN8lOrgcCzdWPfrA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(261009223327099003)(261009220027099003)(261009221727099003)(261009221227099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(261021135927099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wc6uTJNA4LCXhnb2vg3LtGJLYGrP80fmeZ3HIzhf/3CFLVSHHP8QWreTpuoSjWpX1+5lgVwGJFOaLw8O0mch41SAOPOju+GxuNjKhji2heRb6BpITKcE6B2XFGGkKlv8IztsnwNWBcTfzcK9AySMHEZX9FdzesrSmMrIvxLILoExsBb1prT/QoYoZebK32k3krLE4TB3hWabMfmBM0V0025z60Gt7Mpci0sI4a46tw/QOLocD6YjkLKT3Pxu7ZGyXxeTPdaa511jute3pDPK0Gp5Ub8vPYmDpSf52zVOkCcO/IXqMwETRi94t3HmnFexzvF8wo5r+alBNbpUxNg9HWBj9eL0h4/61CEcOzO+haHmhddP9b+KU5E2dHWXeyNZ/DAnOp0JyQ1XkH6X+LcIkkZOgLwqDLFIp0qEXLZSfvlCpi86LGZHemOpkUCPOigG
X-Exchange-RoutingPolicyChecked:
	3CuNCJLcDluHr/TYZXqcbjSfVyqRILZNGsiHGkQRaOcuDZcG1QwI7lXmH4veHLzU/qIwOObxWiydPT0RatgBw16GJpYDTqUpWXGaF/K5JwebHwZJK6XGNCWHJBcSyP5BcSYE+Dy8Lhq8ugOkxZBTlFdxWNcmX/rb0xCClgZv4CcsdEm8Zr4NLZtIUwZpCl3IJBUM/VRAlKHPOhjqPAVwlLtcPSx91uWAoPqFnQs/Soa8K9jeVduFKCDxTBF7a1XNxI3MuWyi97lOoUvn7IUNbzkFa6Id+JGI3lT5Yr2/GT5euerkMf9KZEzNFnLPKB+wLVMF0HunwgG7cv3FXPOQow==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:15:56.5978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 294272d1-6bb5-4325-3325-08df3070e63c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6099
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfXxgT116tokbtV
 TsG1MpobmBqKqwIJefXUl2AEcuVS1NNRdSXAnsBhuutDMJVj0Upyq/++K/4yi5tSUK1v6CEV7qc
 7H002TZ6aWPDPwnGc9OTgXLvkYTC5hs=
X-Proofpoint-ORIG-GUID: vuttX9mOstCB6AQIvBPN5j46p-RdD2NW
X-Proofpoint-GUID: vuttX9mOstCB6AQIvBPN5j46p-RdD2NW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfXz47EXSwtIMsA
 zQcBKvzOnuwj8jS2yJAdzZj83BVKFIxRxRTQdGf3b8CBpghDXxkN4533faXjUiy4DYOY6UgrPhW
 LqzhpoItLp06i9GjTHpRtJASJW8betDZuybHo4icsuyBcicNvmF3a4UprnSIqnY2akAcNS5DOWY
 9uJYK3+CgJPMKWFTTNFLalGrxOc4IwTtn3cIKMe1VVhGk4tM+cWdEHbOKDRbbdRPc2++IqXj4b/
 TOH9KevCOekc621IblhJkkafdK0PQvJxlG0OMoZ9ECSLWvAaITxCE2Wyg2KDXlp0Q1j6XLtwxiF
 qWpgLyo0rUg89wSqmv7+o89pImcCnxNy7frOgr+Hqrhz+1dRbiPH+uv/0BZ92UWobw1qlngL6DX
 FJb0tjlqwWX9mgf4Y4IWbvDv4FNVo5bTb7dKLEkYh2hQqSupH/9JcKq+3ClWcRaToFWRODEhyRI
 k77nN3Z3tRkIEqa3EKA==
X-Authority-Analysis: v=2.4 cv=H/1OUOYi c=1 sm=1 tr=0 ts=6ada60f4 cx=c_pps
 a=xsXPfmOQRNjzd7Jig0hzfA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=-42tRimauhUyQ1eQmagA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220076

From: Brandon Brnich <b-brnich@ti.com>

Current implementation only has one call to turn the device on -
start_streaming. This can waste power of device as the device can be in
STREAM_ON state, but no buffers are actually being submitted.

Need to set last_context_run to NULL in resume hook. This will trigger
QP value updates during next call to device_run.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../platform/imagination/e5010-jpeg-enc.c     | 50 +++++++++----------
 .../platform/imagination/e5010-jpeg-enc.h     |  1 +
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index c25ab9627518e..228137243f749 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -976,6 +976,7 @@ static irqreturn_t e5010_irq(int irq, void *data)
 
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
 	dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
+	pm_runtime_put_autosuspend(e5010->dev);
 
 job_unlock:
 	spin_unlock(&e5010->hw_lock);
@@ -1099,6 +1100,8 @@ static int e5010_probe(struct platform_device *pdev)
 		goto fail_after_v4l2_m2m_init;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, JPEG_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	if (!pm_runtime_enabled(dev)) {
@@ -1107,6 +1110,11 @@ static int e5010_probe(struct platform_device *pdev)
 			dev_err_probe(dev, ret, "failed to enable clock\n");
 			goto fail_after_v4l2_m2m_init;
 		}
+		ret = e5010_init_device(e5010);
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to init device\n");
+			goto fail_after_clock_enable;
+		}
 	}
 
 	ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
@@ -1121,10 +1129,12 @@ static int e5010_probe(struct platform_device *pdev)
 	return 0;
 
 fail_after_clock_enable:
-	if (pm_runtime_enabled(dev))
+	if (pm_runtime_enabled(dev)) {
 		pm_runtime_disable(dev);
-	else
+		pm_runtime_dont_use_autosuspend(dev);
+	} else {
 		clk_disable_unprepare(e5010->clk);
+	}
 fail_after_v4l2_m2m_init:
 	v4l2_m2m_release(e5010->m2m_dev);
 fail_after_v4l2_register:
@@ -1139,6 +1149,7 @@ static void e5010_remove(struct platform_device *pdev)
 	struct e5010_dev *e5010 = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(e5010->dev);
+	pm_runtime_dont_use_autosuspend(e5010->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		clk_disable_unprepare(e5010->clk);
 	video_unregister_device(e5010->vdev);
@@ -1304,31 +1315,13 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
 static int e5010_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct e5010_context *ctx = vb2_get_drv_priv(q);
-	int ret;
 
 	struct e5010_q_data *queue = get_queue(ctx, q->type);
 
 	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
 	queue->sequence = 0;
 
-	ret = pm_runtime_resume_and_get(ctx->e5010->dev);
-	if (ret < 0) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\n");
-		goto fail;
-	}
-
-	ret = e5010_init_device(ctx->e5010);
-	if (ret) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 device\n");
-		goto fail;
-	}
-
 	return 0;
-
-fail:
-	e5010_vb2_buffers_return(q, VB2_BUF_STATE_QUEUED);
-
-	return ret;
 }
 
 static void e5010_stop_streaming(struct vb2_queue *q)
@@ -1344,8 +1337,6 @@ static void e5010_stop_streaming(struct vb2_queue *q)
 	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
 		v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
 	}
-
-	pm_runtime_put_sync(ctx->e5010->dev);
 }
 
 static void e5010_device_run(void *priv)
@@ -1358,7 +1349,6 @@ static void e5010_device_run(void *priv)
 	unsigned long flags;
 	int num_planes = ctx->out_queue.fmt->num_planes;
 
-	spin_lock_irqsave(&e5010->hw_lock, flags);
 	s_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	WARN_ON(!s_vb);
 	d_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
@@ -1366,6 +1356,14 @@ static void e5010_device_run(void *priv)
 	if (!s_vb || !d_vb)
 		goto no_ready_buf_err;
 
+	ret = pm_runtime_resume_and_get(e5010->dev);
+	if (ret < 0) {
+		dev_err(e5010->dev, "Device failed to turn on\n");
+		goto no_ready_buf_err;
+	}
+
+	spin_lock_irqsave(&e5010->hw_lock, flags);
+
 	s_vb->sequence = ctx->out_queue.sequence++;
 	d_vb->sequence = ctx->cap_queue.sequence++;
 
@@ -1487,7 +1485,8 @@ static void e5010_device_run(void *priv)
 
 device_busy_err:
 	e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
-
+	spin_unlock_irqrestore(&e5010->hw_lock, flags);
+	pm_runtime_put_autosuspend(e5010->dev);
 no_ready_buf_err:
 	if (s_vb) {
 		v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
@@ -1501,7 +1500,6 @@ static void e5010_device_run(void *priv)
 		v4l2_m2m_buf_done(d_vb, VB2_BUF_STATE_ERROR);
 	}
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
-	spin_unlock_irqrestore(&e5010->hw_lock, flags);
 }
 
 #ifdef CONFIG_PM
@@ -1523,6 +1521,8 @@ static int e5010_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	e5010->last_context_run = NULL;
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.h b/drivers/media/platform/imagination/e5010-jpeg-enc.h
index da57bc1baa464..807821ded127e 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.h
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.h
@@ -23,6 +23,7 @@
 #define DEFAULT_HEIGHT			480
 #define E5010_MODULE_NAME		"e5010"
 #define JPEG_MAX_BYTES_PER_PIXEL	2
+#define JPEG_AUTOSUSPEND_DELAY_MS	100
 
 /* JPEG marker definitions */
 #define START_OF_IMAGE			0xFFD8
-- 
2.43.0

