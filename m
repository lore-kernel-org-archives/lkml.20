Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203D149D5A3;
	Fri, 25 Sep 2026 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343119; cv=fail; b=TH5rdMo3YRFDQQep80Y8RN1kc680Ytqi3bYiSIwwfvMA012r12qhwB4zRd7QLUDK1TeWKjtM4CEs7AGqO6VKcdBOp1kuGrAN8u6RSkL7XcHFe4JDipwKA2F83TU7ZNi7buyB7C/CrrmlAE3HiymBnLoaewoHZGShaqq7kzT2Eyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343119; c=relaxed/simple;
	bh=CDff/CJR6rqEmY/ELmsksngWAhw9dzAt2CFwEpMtYUI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mqCp3bcXoEarLr5gK6VDhwsbtgmOW4fV0SqcdN2rkbzInIjJqp1V/IphARAvNa7K7eZe00P3WDK21r13kgwqPeFjFa1taswAwoRMQoYn6R7HfOCnoW2TnLYpxJr65q/FVziZgxNjglJ/CZKAilBpoEAqwHS2DJeG8W10+07B3Kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=kj5Ki2XX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CSUc5PSn; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="kj5Ki2XX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CSUc5PSn"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD47Hi1848373;
	Fri, 25 Sep 2026 08:31:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qLENT+49D7JbhvcOVfYa+5v8pPnSxk8bAdBcuU6o7
	6o=; b=kj5Ki2XXqbrEgFhols2y5i+0yBMophw6OoiGR1wnkKNQdHgMHX9Fcsb/s
	IuXS/xnqpeaXNl07w2Jenyy5qt7DRrF75gKlEiC6nZ4DEsZ29Hr2rQI2ubyeqCtD
	qW/PylHGAi7dpeY1ILyuRITVIJy5O9FF9g2DGKmnx66VAlT9HOpVuGGHEPUyFc0M
	3l7pLmL2v2MACd8lRoPlxcJoQ2Ql98P9GR1uw9j4wL7RkokLxmXnBsEMQFPWg1G7
	HWHU6eAG2ybfav+Dtk0B0aVPrRQDv5m6dTuKspXYbK0npLvWrWSPbw0Dpgsy9zdH
	HRhj5QUMAjNmFYoIw/B+ac7MBWMNg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gwkhra0bx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 08:31:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6zS4Thu3JTct9B18NIRZf4GAwPpqe6xwZrVa1nbQaUUt3fuyMlB78jI1GydXd93oDLzw8aRhQOPSIl1HWMYePMo4/Weg7j9zoL8dnHNnbe6KL1y8ooxUzCPwlx7MXrwJIWf5xXSvFd4uI3RxAgUlG4OOZJ8kk/p+5yN1eXuUoV/O4dG0AoF3f02B1mYTudohcsuOrmeGD8++FaxXjpT0clHNmeFBn6XiYlm2WWjCLJ0tnba0rY19JUuZLNUAl4DGBOdfEiTPzS+xvcwS2CjzEFyhX0EXKVZXbv/f4oDRBnOtFzker7fVb8kNQVmpbPrte9Pcq9ZLx2QgVcywA07EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLENT+49D7JbhvcOVfYa+5v8pPnSxk8bAdBcuU6o76o=;
 b=EiNjzUVB/H41rq/UZpnWuIKHXfVA8tyNRx0/yBY2wX6SOsgiA7e0YI4nQkZurJcBW1yTG0W8qTdXxIaQMxCzkmj7A0B641ZYJ8nZlPMgM6jrAJNi4hSH8DjXLPFrwe39bAIskPcTB/yrmvEqxkokvemHFxWOuPGrWCvApB+0KewRkCmJeJ0ty3sDaXRUeqIAy7MQGIBMiwRMmCE9thao7/7mk6huFGNvAmqsn6dHSaGpQ98NM8N4JZNuqMLHy1VF0thXPG5uP2VTDrizBzX5tqOaIDP1xkGcBAgSKweFgBrfcxD6dph/C58WMQ6dhF242NDvzSqInB9Tmq/aNR9p4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLENT+49D7JbhvcOVfYa+5v8pPnSxk8bAdBcuU6o76o=;
 b=CSUc5PSnsZwkKC8Hf1/S1mWHhXX+yYpGil/8qSD2ZZfEyHB73IR6IP6PpI7kKmLpds55QR7iPm0ZDqNk9fuseo/AauRbOJvcrDPtEYCB72UkVERLrOAufBrPdBeyoOXbfXxfLq0N6SG0E7xkt6qVj8fU568Rjjgw5K6jSYjKx+s=
Received: from PH7P220CA0147.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::21)
 by DS0PR10MB7272.namprd10.prod.outlook.com (2603:10b6:8:f7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.7; Fri, 25 Sep 2026 13:31:40 +0000
Received: from BY1PEPF000264B4.namprd02.prod.outlook.com
 (2603:10b6:510:327:cafe::12) by PH7P220CA0147.outlook.office365.com
 (2603:10b6:510:327::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:31:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF000264B4.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 13:31:38 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:35 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 08:30:35 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PDU1nA2840014;
	Fri, 25 Sep 2026 08:30:30 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <sakari.ailus@linux.intel.com>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mirela.rabulea@nxp.com>,
        <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 5/8] media: ti: j721e-csi2rx: Add RAW10 RGBIr formats
Date: Fri, 25 Sep 2026 18:59:58 +0530
Message-ID: <20260925133001.2780868-6-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925133001.2780868-1-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B4:EE_|DS0PR10MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: d61cdd56-266a-4f7f-54f5-08df1b0953e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|1800799024|376014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6Sqo82dSw998PNMP7xF1opFhWNeQXCh+H9nPPkY3nUfYoJ+5QoyITQcnjWkiRaBuPHLP3+PsmB98veKwJSIWVUyLRYKe3upx0AjKVc0fpDKM9NmvMe1y7BVffBVIvRPCfVXPn90oXaz5rIAuOX6hLpGxQoOhRg5j3weOsQHsDDisrtWvDLWGpL+NFfDP/bMvBjiDcl02SS7gosDDvZoCDCFH2KyMbwmRrBG6btukkMdbggZO8hx0nwguErMp8IUnD7L6NGMMmStTPumxPW1U7kdm+HjNW6klX46mljARkPI3TOmMD7epyy+Miz8oaLi8OFw6CxWRMiGSnfUl4sHitEHLTPqOJ3w3PYU7uxRUuMQ6ek7Blabhvh4vPf7nfDRYNt/sMltPpL0ljNvXqN6lndLP6iSva3FBB3H/eVXIl8o3MeTm8GigGt9uRZe8pam9baTDvnBWCG3CTb8pz0BOrx0566GdSKOqw2nx7nNszc5uGmHIoaaaNkeIkcd0x762eU9XLY7hWq9DoTFggaZr3q5cH6PskTp8O0EMtgnsGqYfuM1fN2Mnte6YYP7n1ldefeTfoPUKgooyeAIUOKx8axl2yztVCaceiTSk+VDfDDTzVSFMlolLeQ5Aa52pYkWGbNFObck2iklR2ognhagqPsyuaHRyKnblJO9YxLjW3RwfMaputvMDVqETf6uZ/F5oB+fqSq4AJY2a0hb7RtVCcw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CxT9Zb1IxUNxWKGBHBhZ9L7wymj5UuOnjv0iUcAUvPfnXLzWKy8Bx3zZXOmSaYZoMXW1zMbdfO3MspwV9Kqc+HU5npecJHhRkvPuW2W3oE+2rEyOhstdmok2oS1NJZLu791IuLio6yLuerjyMrTEi/LBzaaWs8JC+qBxJ7Ks9JKjZuZ8MOevUXMLKDIQfvqRHuIh6rQTRW/37Z5lWEGmrr6ONNtrEcCxMrIg3oOyiTKI5y42zKW1eqmOLGRRPaplr7xbjDJO0xLZu+a9sPgj7UZR4e1JgSrXwmxeIZInEZ9TOGD5zCGanDhVPaOjcz2EGqHLwQqRFkPWE6Fht68Fwggck6kBGurAGAMjSyl6NCo7hKKcCrkh0w9zQW/M3gCThEqByBTUcq3yZ6Nhoo6ZSZA4LomTkRyPymxECscDp/6OlFBzhs5UyE0Ot24TGuJ+
X-Exchange-RoutingPolicyChecked:
	oBIptrC/DNHe9lsQClTI/uaXtFWcJvaR34lMnEMuKvQWXCMVRAQRs1iJa/RYomA+Iil4DDYO86LxG2reIwR0tGrDJwxTcOUSPlwgIwiJLTsrwbdqabVOUcuCF4RmflCEbKTy9Ty+s3rcCDUAngNu3DFPlUwPqPenDvQnh65uXxJYMh2HmTf6LLcbCs7pe4EShOG5MkYWzu3B9HCn50A1mKq9WK1XoxrUqP0++1Mml0hat/3OpjFVpphzEJgTZ0P3HcJoh8j1vBgn6llQ8m835N/HDrQK4UhRGTqAzY62xvFkopvjoeXSUyn+4U+N1VJl9YT6U5MH+d0kVyC8XGp44g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:31:38.4942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d61cdd56-266a-4f7f-54f5-08df1b0953e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7272
X-Authority-Analysis: v=2.4 cv=Fv+QbGrq c=1 sm=1 tr=0 ts=6ab677c0 cx=c_pps
 a=COQGWIG0gBNyFO/LkKr7KA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=IAMkWLclugvq4DZpYv4A:9
X-Proofpoint-GUID: 1HtL_y19hPnRpXOrNVQfLuBngAu24lBd
X-Proofpoint-ORIG-GUID: 1HtL_y19hPnRpXOrNVQfLuBngAu24lBd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX/5C2ukoLgCg4
 A2THjgBUhaZJsG2jCPfH434aoni/aJm+hwiJYRF5hIHkZQ7HysXkpBZHZuKxfZAeW0A8ayg88NF
 AhzL9mujYTr7SFWxwnF3tnQZKlRY+5tv7gdBWxTVwnH+dpUGVz0OarWJjOEGeV1y2DMPHrOSIy3
 24mKrT6Drzge1AGR4BVgAmf1VePWjuXd0BF3mHiA/gJmznEn4x7wNsQhHNFXDRMWi98vJZUxo/S
 rBsiQl+Cb3uZYlEQElh9OaXaQkGVaKUBeNSBFIpVPraEVtpEJukybq8eCe7ll7lMf+hcnmfy6M0
 RjJqobe10Y6Cyka6s2rYvMBptEairfS7r3MQrE9t7QhRByO6gj4rqOgJQu7iBEUCB46rrqBgX1w
 mEUVqqVE98vE9Rl6WAROvPnwpV7UkmTswek/GKxixT5oI4oIduddA0mlq1a1RVL3jG6AFUYeRjf
 hGv/0mgyxUcdIPWDkmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX0uYO/FMvm97E
 wgMrDCoTptMbHpwvZ/Up7bWYQhHtIxeZvu+7OtxhjqeMVSTMg5KPA5no3g6jWOhguUS4W2/EUA3
 rwQs4HK5gazwpygqAzcJo31W7sXogpk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250053

From: Jai Luthra <j-luthra@ti.com>

Add 10-bit RGBIr formats to the table to allow capturing them.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 022ea3d616c9..9f97f019368e 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -249,6 +249,54 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 		.csi_dt			= MIPI_CSI2_DT_RAW12,
 		.bpp			= 16,
 		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SRGGI10,
+		.code			= MEDIA_BUS_FMT_SRGGI10_1X10,
+		.csi_dt			= MIPI_CSI2_DT_RAW10,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SGRIG10,
+		.code			= MEDIA_BUS_FMT_SGRIG10_1X10,
+		.csi_dt			= MIPI_CSI2_DT_RAW10,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SBGGI10,
+		.code			= MEDIA_BUS_FMT_SBGGI10_1X10,
+		.csi_dt			= MIPI_CSI2_DT_RAW10,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SGBIG10,
+		.code			= MEDIA_BUS_FMT_SGBIG10_1X10,
+		.csi_dt			= MIPI_CSI2_DT_RAW10,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SGIRG10,
+		.code			= MEDIA_BUS_FMT_SGIRG10_1X10,
+		.csi_dt			= MIPI_CSI2_DT_RAW10,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SIGGR10,
+		.code			= MEDIA_BUS_FMT_SIGGR10_1X10,
+		.csi_dt			= MIPI_CSI2_DT_RAW10,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SGIBG10,
+		.code			= MEDIA_BUS_FMT_SGIBG10_1X10,
+		.csi_dt			= MIPI_CSI2_DT_RAW10,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
+	}, {
+		.fourcc			= V4L2_PIX_FMT_SIGGB10,
+		.code			= MEDIA_BUS_FMT_SIGGB10_1X10,
+		.csi_dt			= MIPI_CSI2_DT_RAW10,
+		.bpp			= 16,
+		.size			= SHIM_DMACNTX_SIZE_16,
 	}, {
 		.fourcc			= V4L2_PIX_FMT_RGB565X,
 		.code			= MEDIA_BUS_FMT_RGB565_1X16,
-- 
2.34.1

