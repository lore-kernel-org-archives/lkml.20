Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792696535;
	b=kXGkoCdmNro5T/LaphO5jOVXxdOGIH9RAJXjGAcPoPwAJVgqUiCxYOEiVUyFZq8HuZHE
	 yYLokDNySQIbfHGPkHKFJ5RpN6Bv9EQ56veZQostLk8spIeVpafbm0tvVjmZpYqdDI7Pr
	 1TlCenE6N9EDQaX2a2Y+mGYodcvniJBOnrZ8OnPr5uBM5zVBar8U0XH2rPXdmZXSdk8Ck
	 AO8D0z/z0lcdQ+3P5b0FrxtBtdKL0no8Oqq4CjT9s5JQ30a5XkL7AyocJ9rpJziSGlzkS
	 smGtxrtXA3c6a5Ngpyw5k6xSRFTGjUQZREbkj6BcWpNpRKOtb3nQpV62yx4IrBhiLzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=llb4UFvN+MUQ0myGE95Y8ZVSSd69f0sodbZNxF+j3b4=;
	b=Tc150KAGVOowDOhJIt0cUEt9uvDRtCEVWLJ0vY3dp7HmeXFlZeT1uqKGOOWsjkj76i2W
	 OLWKQxMvdhzIHR6xAZxRM4G2S4JW7aZGsni4mIuUNIypx2zJN+Lcy3YRCM6NRv8WJtReM
	 vpP7ORiMsseMThasxXJ3i7CQKI6BOMxOUqfT3uY+6sb3x1cltzVCfjIhfoqyRkk9jn+/k
	 zM5v+6mkxiQ7IAKwSoCc/WjVcBXcdd6n+I2R/tLm5mcly1WHO6zhuPcP48xeUOwoOplKW
	 xv8Q1ifCrSQA9/goVXN/exMF9YvZuoC3CkVBAO+ITajhfH6/RP2WHMkUDbwfuuat0Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=NVDpCk73;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="QcD/2XPT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C955606A319;
	Thu, 22 Oct 2026 19:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C955606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=NVDpCk73;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=QcD/2XPT
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69MHsXHd827035;
	Thu, 22 Oct 2026 14:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=llb4UFvN+MUQ0
	myGE95Y8ZVSSd69f0sodbZNxF+j3b4=; b=NVDpCk73eAIx/Zq1j2s1H1c1rZw1k
	l38rCyULh9X7VQzjyCUQ7w1Gg2tkAHcsvKwBPxslVNHNmWJTybY2c9G0K+jpqt8W
	YkgD90MEL1Q6Vy+pQHgfnL2DUNoFSsKSb0KLJZu85Oo8M3mE6KjMJRwxl/qjERnP
	VLuE44xGHw6Er3UlfQLTtRO2iiCTcl+S5nizWVfT3XkyJUfhKOfDtlbVIVhdlSHv
	2JGZ9Qz5i8vC7CgknTv9TQSlEYjuTngolBVRT/oFqumcQt+zHjCqeauCQPjOPlNh
	VqgVxaWHNlXeOpTRV4KlwgDk+jms0vWXMOU2izvvRI4oD6+o8n8CAr20g==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hfmg21rc8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 14:15:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILWokNX/G8p7fu8SLaqZtS302DofELTho8FQJ1+4FeXlcB9KQgUc2QPb3nUo/R0uEpuwWeSMGd6iHkQFHe/QTpXl+BykzroNfn+mZKG9bmWKXb4NAE7pvwPK7JPYiNbuj/YZWDH2e/V4rLH1pWVJ+AKFaHoIL3sNaDHQgOwd7kFcck3TWzhiEEDzxOmgFvadLJ2UjTnuwZI3biO8QMgiy8WJV/97RbvZrizGPeHfGMtLTLfrfxeNvyOYyLBNBoL7MGlTvuk311IZR8Z93EO8AvgjC2bhxwUn4h/6ovWelAyloi0Do0T2fwZjvulZXoE0fBUMiNKC6g0Ska/ZlYIBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llb4UFvN+MUQ0myGE95Y8ZVSSd69f0sodbZNxF+j3b4=;
 b=NuSlPs50BF+wp84XJj5zwaqxrW6F96m1MEJBJVK1HbMbygOGiJ1GT5V2widUOsX3qJ+wLH+FMD5waXxvmkC3Hu7sznFYxra7V0O5QFC6Pj80l29vcA5N6MccTvVRVJjsmRR91lYuCzC2H4BViLQqKOOIQzW8xoIupavu9Tn411WB4M/yEmEaQZ6vtCiE0EzCoMxR5lkjfaOUDBXjlPmSiX5aG3xnWoSfDXI42e42Yglb+1ExFUqYMAI92nVqZST8WUVkLfqCSpFS2lO8Z1kxOOcr6p6huVUgO9QRx24FdKkjcXQVzSgx1JV0iJ66yJkIR+yuDT4Y6mjnQG7AIHXWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llb4UFvN+MUQ0myGE95Y8ZVSSd69f0sodbZNxF+j3b4=;
 b=QcD/2XPT6g/YJtN+qfUJes9K6a3TVnuvPEiBGFB/HF90qfkWh0M6t29ba0GvpUwbJfsTR5HhdmX3yvyIj1kTxr08TSHWSKmezQKAiZcVck1mibYw66FxcZ17wR0/1hjujrFucDD0ESbOy/slOJsAxpe2r1GILZn79O47EsLqwHU=
Received: from SJ0PR13CA0196.namprd13.prod.outlook.com (2603:10b6:a03:2c3::21)
 by SA3PR10MB6969.namprd10.prod.outlook.com (2603:10b6:806:316::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 19:15:21 +0000
Received: from MW2PEPF00014674.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::42) by SJ0PR13CA0196.outlook.office365.com
 (2603:10b6:a03:2c3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.3 via Frontend Transport; Thu, 22
 Oct 2026 19:15:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW2PEPF00014674.mail.protection.outlook.com (10.167.249.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 19:15:20 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 14:15:05 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 14:15:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 14:15:05 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69MJF5iU989659;
	Thu, 22 Oct 2026 14:15:05 -0500
From: <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <nicolas.dufresne@collabora.com>, <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <b-brnich@ti.com>
Subject: [PATCH v5 0/4] E5010 Probe Cleanup and Adding autosuspend
Date: Thu, 22 Oct 2026 14:14:59 -0500
Message-ID: <20261022191503.1025072-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: MW2PEPF00014674:EE_|SA3PR10MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1e89b2-7193-4881-02a5-08df3070d102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|18002099003|261022105027099003|13003099007|261009223027099003|261021135927099003|261021123027099003|261021121427099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ehwHfrAHISdRybJ4ioj3wXRf2eoL06c+etDN/YgAQF0m2jlzMAyeQGYdWHJBJthA7gOs4VTqTG4LeMqaagF632LZPgPWuotfrj/x64qGF1aoADYalIsg9IpC5cQvbBVwLgA1Z1/95fS1gRmBW01G+QUrcKX3AZAkk9kHRUVLYk5gQgZhrrMjtk1t8T170jIgyyc+eci9Y8GUTnZRnuPMB49frCXvh5U24ExQWiO1DTL98lxn1lmBGIhfT3TefSdKScrQL/5AIJxOPPgBUgob5Ro8T6qkLoMHX365nJBH0KuoZrw/DwTV/poRV6tAfdZw2PRWI7dvLc9goUpYeQr5Aojp1rN3tIMRpwYGegZW4D502WKBCGcimxGNaT5TBSZzHgBytIN8+JO6l+thQVgr84FlwwR7wxLylgNECZCxbzjdywJY5DHoqlvEdEjoPkf0ZDqUDHJyNt5z3osSFZJKHmNqDYaYdDc7s3G61R2ZY7GaRcdZrSPxT+AtnLZjNQS9Geyu2+U9l7Xy0aOb4SWuuBALZ/PEyLVidOSdVjhO6cDzAcb4J3hc+1o/4EyWJb9GzlRSjn+zlD7wKK8MHElggnWuq03AxrvzuS2lEerRWXFN0DHLikj/34ezH1q+PYwkATS3mw6D2Cey7obzPQN4zuKxr7mm2XOO91PUNZ3UReA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(18002099003)(261022105027099003)(13003099007)(261009223027099003)(261021135927099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bPa3ezJOurp/pvuDEeTSOWPNmQxOTs21gGlqm1Bp7j224MrbhRVNxC33sb6OD5h71o5BY3Gc5ycUTS17PpI9EzkNcOBpaeISlVBef7CTg76L6nnQf1TYcbCNVT5cKadrNUMI+fcYcEPH0IQp1hzitC6Xe310D0zY22OS4FVOXcX9uJgDabw+iKEHeLs0tWlqaaf1OIC8R+5Vb6pk2JxQiewgHi+8lVPUrT0XoSRI+XnapMPlnr7XGihWLpumJChriTMdXwLc0EUDf9F3qswiJIMe+uhC8ZexoWLj2kcnEo9b1HbXHnjMacUzSqNC+xqtbRWyyADM++1ZPIaYlSP+OHwp/EZfm4oDNQfe545kP+01knBQz2Fjma0GY5MeGlD9GKIJLQAicH8bOiAh0mh0uqVDoV3j1IYzKqkipLqxJ8f7BhezQvswt1YAyFUwJ2jo
X-Exchange-RoutingPolicyChecked:
	A16IBl8Fpn7ayMqBZ4oWo7F81XwGYSMiUDG0kj+9GW3a273MJilvZs3rxUaYyfHTxzO3FSRZ4EcQC1JFFn8nED/9I3J0YbZhI2lLYLxxEoXOnxe5jru7NnCInC9ZjuWpNmGFEuYl41kj1B5rAFs90MmT/lqZHCD/The/Q2mMQnm1cNNp5M+cJG2/lt/aDUJVP5dbesNJwOBFv+GgfMJKYuk2s2D3O+Geg2XTUxwSvXpJzi8d998I/zW0a2OoFvlzIu6b/qdNR4kYsQAj1GM/3lUy11eghygwrFfh0A+MnPERvibx1iIVYfql26cKXCol/5D7sIVq6o0+EEX9X4o1NA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:15:20.9570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1e89b2-7193-4881-02a5-08df3070d102
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF00014674.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6969
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfX78+cSM4c+hCr
 CdKdpiKMf42x/qrCvxH0QjWsymUKOBk1oLIhn6Y+bWpAIv+pGcz12zzTccFB5bQLsX4mNe+cZHK
 HCf4QTpBr0jELLKfEee6ukDB/krT/9U=
X-Proofpoint-ORIG-GUID: p5I6uZThKKXEMp9jiHYuHjyySJWZ2s-6
X-Authority-Analysis: v=2.4 cv=XISl2ghE c=1 sm=1 tr=0 ts=6ada60cc cx=c_pps
 a=f0OpuPnQRmDrWRgsA3vZMw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=sozttTNsAAAA:8
 a=3KFijOh3VjW_D7tkKcMA:9
X-Proofpoint-GUID: p5I6uZThKKXEMp9jiHYuHjyySJWZ2s-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3NiBTYWx0ZWRfX33hobLH6le08
 EbvS2hhycvRvdOQqoZaYsIX9xfYiGwqQ08/41cWsZuDIP6Y8hYIIhawk3fYwgn46INeZ/ZTNkz4
 z8JOkl+e7EcZ1ikdiJNBLW0e91NQJcvXJgUiCn9Ez2KKjIiYdC1ZykZsaoN8Es7e2b7C9wjjxRC
 cRIL60/JRXOYuNAKJPsnLZShW52r/j4yQfrLYOD/EwJLzQejN9QLIYAwhB2YlKVO4PD8TsAMySy
 Es7+t/MpNhwhxXXiIvCrK/Qfx09ZUcxKK7FxBo5C9DP9CUHRYGbO2+c7T9+QVWQouIHi8tOv6Ld
 2+BYOI1O27eWQfriLTH1mL6QJffbiIIgF9HF8C3cUBZPP3KHO/8RyCOP8gmawvf0Nc54Nc0oAvl
 PIUWY13vMdNjRgZtaVKH76YTi7dKOdeX1UsshBxi1XoDBnmZs79YcMJiArO+ITZVqNu392HBkTR
 TXGZ7bYQTRdPRds7A2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220076

From: Brandon Brnich <b-brnich@ti.com>

Hello all,

I noticed a report from the intel bot[0] which pointed out a valid issue
with the driver never calling e5010_init_device unless CONFIG_PM was
enabled. 

While looking at probe though, I noticed that the clk_enable was never
properly called. That has now been fixed with a proper remove path as
well.

Lastly, I cleaned up the goto jumps in probe to fix an issue where the
m2m_dev wasn't being freed.

Changes since v4:

- Change authorship of patch 1 since Myeonghun sent a similar patch
  first
- addressed Devarsh's comments in Patch 1 to follow similar naming
  structure as rest of probe function
- Moved the clk_enable call after pm_runtime_enable here so I can check
  success of that call. If runtime pm is enabled then don't enable the
  clock here
- Patch 3 no changes
- Patch 4 I added the macro requested by Devarsh instead of using magic
  number
- failure to power on now goes through the existing no_ready_buf_err path,
  so buffers are marked as error and the job is finished


Changes since v3:

  - patches 1 and 2 are new in v4
  - patch 3 remains unchanged
  - patch 4
      > updated goto to match changes in patch 1
      > update PM calls in probe

Best,
Brandon

[0]: https://lore.kernel.org/oe-kbuild-all/202608140323.qyc8mKlp-lkp@intel.com/

Brandon Brnich (3):
  media: imagination: e5010: Fix clk never enabled without CONFIG_PM
  media: imagination: e5010: Move e5010_init_device to Runtime Resume
    Hook
  media: imagination: e5010: Enable autosuspend for runtime PM

Myeonghun Pak (1):
  media: imagination: e5010: release m2m device on probe failure

 .../platform/imagination/e5010-jpeg-enc.c     | 86 +++++++++++--------
 .../platform/imagination/e5010-jpeg-enc.h     |  1 +
 2 files changed, 52 insertions(+), 35 deletions(-)

-- 
2.43.0

