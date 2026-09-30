Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E110B30E85B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784439; cv=fail; b=Vd/5UvVVZFM7zWwQ3+BaKNcRWliE5KORFMMW5KGW5vJQ5lZDENVdrQFTxaN7EGr3zPSbKueIjEgCDk+uCpC1GbKTURiPPK0GS/8WcppyERj6HhTcCuSx/CaoDLB7EUaUOLIqd1sfzeiOq7m5VHA2lZDUKYAdYe9Lrp2pBHJTKQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784439; c=relaxed/simple;
	bh=6ZdO6+WRzvLlKJ+e4z3ptmvkN+3osCamttGMWyX4xwQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WfR87Rx/bBoMiN1LioIVgpzFmcW2nsIH2GZsw2ysHe1ECkMrWsBFzG1/xf9FGUD8U3/4zJpRmA4E4c54D2VjhvkkmMY0R4+RWDkwSPdUhNa5zsiK5sSE4E8CbTl/SMjrrKFAKlZVvaxlR0WdoNg6hFzWCZEFPcsmKVoNBeP5e0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=EUH9a1/I; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=hIGrzBHk; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="EUH9a1/I";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="hIGrzBHk"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1XXO3555902;
	Wed, 30 Sep 2026 11:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=FxxKICpxB3Pk7/kHBjMKbGIqOqh7KNrvQZENapq9J
	K8=; b=EUH9a1/Izxl+s8ZwnRY3bqgCHOnxs6wRaBq21Ihp4LJ+zaIW2C8wTY6vv
	/NNxGGBV1MHjjL8L/fEzpHMNfFX7cvaH9B9cw0gt+k5EC/4mgbfs1g3/vZoUmZ7K
	2Vqh1+7CIF4klwFAdduTH85jJ+4vaIy9DYucoPY8Gu11d3dB4BXpHbAJ29IvUCfU
	n83G/Kj0N7R2fQDGcJHmvLxBA0CCtGx/mY/BAN0GWiDrY4dEM3QBrjmOnKYK7pPr
	wyzjqSvAbl0bpcIwdahIU/KfLwGBcEs/tpP/Wdp9WVoQtvIrPBrH6P5wTeYWlrL8
	+Ybr35xdknQPFsmM6QjD00iWkPKEA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvacja-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3EJNfbPuM8/HJefsbtm3XgKsjq7UkNVRMuK8W7lGBorzc1wYEJd4PQV207RnYXmLIRxj7AtN9zUSJ97Iw4mPEPoex5+0K+kKIX6vZK9pHjndddKtvGWuV/MxacpN8+H/bP3/iOFnqxTUdugkTxCkoV0FRbxY+0GSCZazMg5vZWRhjxJpXW630WRMggpPh6FCVINz21Cp0zVIfy3PfZt8fK/lw5wGK3/mgXbWZpxOELpZ+Zqq57cLIpCW04qMEuMOvKeHNcuk6fMzC/v7hGe2TJ0oshGHYfeMw5sGV0UhrwUbCg52rm3bqL5EVEyrkQLEXzKlrJ+/q8jHWR3OVDrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxxKICpxB3Pk7/kHBjMKbGIqOqh7KNrvQZENapq9JK8=;
 b=MOcgGc6M/baRebElVql6fmzg+wnsAPLR/lTbZ/N2oR5IuToYjz7BeK4eQ2Oxh90t6QBuWsJQ0pFgzzdTyHyt1np1awOf2Qj/k21h84n/ohi7S4BaM5XvrxmGNtYRl1HJcpmvuScnKbni/jvfX5PJ2+XuavmEOFITZHHPphQW6B8R8BfAObyoCps9cNjvgRmxI9NvmZnsX8VAFaq+aPjdtpmZmgujYJIbg1ZVlrP+D9kVWY9IxggEPUNRQdi24rHcO6tBmscsvRX+bj6PyXh9fcoOtGSCTfX9dIEzk/ClTQFK+QhrNo8Gq10Av+Ic+RSr2R5sZ66INvK2fRTy4CkIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxxKICpxB3Pk7/kHBjMKbGIqOqh7KNrvQZENapq9JK8=;
 b=hIGrzBHk/Zx/OIDgtxAlUam0CQGfHsBFdCSlYyc9toQw8UHcKY43K/Ej1sxamIi3tTyHTgaLGBlJ7v6yi+oQroeW0GHG2sZI3GOK6IxVWfMI6b5NT4R2HCvD1VjqdKoufUTRR3y0PL5p1YjsZivhbbhMGBa1+SdR+4EPbr116XE=
Received: from MW4PR04CA0215.namprd04.prod.outlook.com (2603:10b6:303:87::10)
 by IA3PR10MB478310.namprd10.prod.outlook.com (2603:10b6:208:70b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 16:07:02 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::6a) by MW4PR04CA0215.outlook.office365.com
 (2603:10b6:303:87::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:07:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:07:01 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:27 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:26 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68W83425232;
	Wed, 30 Sep 2026 11:06:24 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 05/22] firmware: ti_sci: Name response variable resp for consistency
Date: Wed, 30 Sep 2026 21:35:50 +0530
Message-ID: <20260930160607.2674980-6-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930160607.2674980-1-b-padhi@ti.com>
References: <20260930160607.2674980-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|IA3PR10MB478310:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b41777-3187-4af5-95ad-08df1f0cdcf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q4Kghry+tyYohFeaStIVgkrVXHXurJ9JzmETAYvMl2ghOvB+d9VmEg2iaEvNdGLUNOmV1vVq6XGJtb1OZK5TtC2RdjMcC13EYJMiTOKaHzr9jlddZrcO0++nPVL6BBJEN/aDNAb9OSBKCHVTDdvlof/Pv+s/Ztn1SWuUFWTb3ABtJQF1kjbbpwmLab2HFq40mbTXKb/KEdaZlLpSsJ6i/o+q0tF8HlCivBkMzaIR58xuhdI35VtJlsodTBJRzGBBosjptsNfSd7sNGAnkUGmiN3+Lpw+uzFkk0VlL2+KZ/QL5sszLzLBrorMnWJRNq9huUF31kiRGd0a97G5xeo6hj1mW0hgN7Qz/HiuZ4C19IolWFILDCmAc9xnH0RFL8UsnRwNDzogW1z/+On/lagdmmSSKrA0qryUxkPeNc598QHGLBHLB+3tMJ2HWt3og+oHjRTxovpzb+kyf0lhYUYul5jt90zOVVcQKwHS3H14dtDKNsyUr1wsatXAn6G1suayeUkSyyWi2AYta4+/7OZFbmE/FImRDPIjxi+d2bTtLffASg3e8uvztPO/3jxs3yl/8iy/MDasFhWhbJsvyZBtBsGol/1h+9WsGpVIJLSncd9l3GNNuMpvvu8PcO99SepjhZS6DxtqsvGIqjih1SdKIPQkdUkBkcWDRoGusU6XMavCZfS94tVWD+1FdIFwuQwLO1DW0mxEW/IMID2rZ+Yg3A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OO6SwMYXkLuV+vfXoD9MBKarEW5/Gjdw6/aMXRqL9A3VGhBcXuVfLkY5Lj3f6yNMWAUOq375gJQQZA+ZRpsbymfWt4kXD3DUiyqZ9KB/z4oxcWaU7bSas2ABUhToGNjFlZoSwCMcpkSjSz4eDCclF5gXGEQuWGwCoU1ALmLfGATTPXX7W+PvL9SKsbPBqTxTs7vHoAZhvvOco30qZEtPKMA2NZbbM6Vg01TekgpE2SkOU9bAWFwLg+cd9mJ4m7vRF+op3zSxucG3gxximTJubJXOv/d97Q2bTsraRqQjiNOLjqu/hMiZ/loY8CEWi3/9txD9Qkyw7UMK2WAFtmQDNgbozYcVU9pV75I8dLkLydSJf3zx79FHP86JQrpl9JeAfnWtV6udFzAp9029YCtRVmZZ3Gmo3b1Wi23a+SPd8TeE1IGxNU32Y/xhoXcZ50uJ
X-Exchange-RoutingPolicyChecked:
	0+b38tN29mtQT61HJxZzmgvCz15qse/M7GcT7LJXcUOMGAKRqp3AJ89CkQ6t1pfGmWiedCZxRMmJIPMBGRW2NtZrHEuLPAG+Gno/U458Ag1cgnWqlH1Puu1RK5zRe2ysUpxlF+Gu6knzL5u7aV45PkxeieR8FwofiyOzPOs/IGceEhDOCvkNjLWWSwSo9IH7HpZen+/gxiI5+HJ3lbj7kd+CCoHoYV4LWegkkCb3ir+8brU46Ew3b5v4en/1BsnUpEF0qanqR8VHZl5tj0F7Ve+8L5ii7YUIPDQttXppbgyyWEioB/h9Yop7jUgXzPJJdakmoh/uX5Vy9/aAQGpbNA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:01.5883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b41777-3187-4af5-95ad-08df1f0cdcf8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB478310
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX4eViJXw0N6du
 ArC5PRK9bJBeFc/fvTBffEDAKpfsiFzdytKHZA4rbIKuljGlRlUpiESOCsGWbluGMMfvwXRrNhD
 /ntocxBYZ053qxNZmXbJnVmROUKmoQU=
X-Proofpoint-GUID: H-WsUQfvPZS2a48Sl5C1gSmZ-X2WRx1P
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd33a9 cx=c_pps
 a=wodMs23R9wL6gmOfRTd43Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=j3GZ-1RxCUTCYdul9d8A:9
X-Proofpoint-ORIG-GUID: H-WsUQfvPZS2a48Sl5C1gSmZ-X2WRx1P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX6F7TUmD/Kc9q
 z3/cJU6weTQfZWeDdSF4pPd1xEejXsXP7IfnxptTSYczdsgtESF6ORL4U5kuGF6WYKt6XeYMifU
 afSpplCPUVkrjeAQXpZpJVkBP6LNPjOmKpFR1pu+6h+ENnvobEPxMXH0efKLTwRjfzBmKNLtti6
 pbWRBEkKigr9a2UAaKi6P4sqa4BDhRhKWRpXatUFHmeOimSlYEd2kgbXZ2/pBYCAdr/P1KYckji
 wJiEw/1fP1tT/Dm/5dWdzGcPjT21cyquK+Sv0WvaD1jBCxWlW0Dq7AZSOyGq1wycEcEN6sXNxHQ
 yjyE5uAeWJ1rIuYUGLNNhfHeh6xwsoLdykFQPLVO/Efb2+/eF9mAIshvoOuNN7M/9c3QFWqP+Pd
 teViCsHnGqeXEhmxRGRtIM2aINlMVFxqGxI/UBKTOMhloxcCueKUz+VVf6OHHQkqsyKcJ88MpEp
 Oo7oMFyO1PcZcgYsMtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

All other TI-SCI call functions call the response variable "resp" except
ti_sci_cmd_get_revision(), fix this here. Also get assign the response
variable pointer after the transfer, again for consistency. No functional
change but does make later cleanups easier.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-6-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index a91db923c8939..9081288bd133c 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -507,27 +507,27 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 {
 	struct ti_sci_handle *handle = &info->handle;
 	struct ti_sci_version_info *ver = &handle->version;
-	struct ti_sci_msg_resp_version *rev_info;
+	struct ti_sci_msg_resp_version *resp;
 	struct ti_sci_xfer *xfer;
 	int ret;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_VERSION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*rev_info));
+				   sizeof(*resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	rev_info = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
-
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
 		goto fail;
 
-	ver->abi_major = rev_info->abi_major;
-	ver->abi_minor = rev_info->abi_minor;
-	ver->firmware_revision = rev_info->firmware_revision;
-	strscpy(ver->firmware_description, rev_info->firmware_description,
+	resp = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
+
+	ver->abi_major = resp->abi_major;
+	ver->abi_minor = resp->abi_minor;
+	ver->firmware_revision = resp->firmware_revision;
+	strscpy(ver->firmware_description, resp->firmware_description,
 		sizeof(ver->firmware_description));
 
 fail:
-- 
2.34.1

