Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559A1549397
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713133; cv=fail; b=uCmAdSD/gJi4M6bIu5iq2J5juthjlzwQXk96iFSP8BpnKWhmV6cRwo2F7k1IlLBU5Gk6L6a2Xjgb96rlOy13Sa33Lwh2rIMTXEPlowvKvs4qvl6UCstqpInGpmn0lZCdheMp+O0Ya79HMKU1JezDETK4i57csUMrkOx/ZJDL1QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713133; c=relaxed/simple;
	bh=qjVnb1H21KOeBlBR/y0oVfGs81HOKjmgP2q3OnzWUcI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fQArSqk75KjVrv726yKF4SOz7TYoLHYvasoe72vVKtAoW2XUcMjAGAfbb+dqidw+Hg/M0jijonfZTq4a9Vd30qnAde/S3r6+/XlEuYN5r7pStBBtPVIYL1gq0gtoBOxkjSQKJV3Qe0n7eLysqQRngjZqZ3wMU36jkLmU7ytNFbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Dh2Eqpqu; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=WxrmM0s6; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Dh2Eqpqu";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="WxrmM0s6"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFoRdA807529;
	Tue, 29 Sep 2026 15:18:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qtmI3B/88Pleg6d15duZokHUtrPeaXu5is+bQLmZN
	PI=; b=Dh2EqpquubITPAV4mc6zwXGUtNEWdF3CLg9672liMDMji3E/pHiqehuv2
	2t2x3QeXqx8zOmV9zMa+MgutBoRxSKCO/1KfCpIvSi9FnYqJ/Hj2lrCDUUA3eXeU
	rWmiuAfImwvUl7TlcdaYvriU7ol9RN5CYRA9iFQSZl8igX1dWfN+b0fr6nuwVDjK
	tmzsgyyt1sOGUUhkleqds8XjcgliN7nIW0vezzpBiJKLcP9x3W4VNFt18i8LJLu0
	fGoKcExboAZw/mCyjqOsY6UBLCgEP8M963HbTjNUv6rS01u1LymL+vBL6KdMxdtL
	LWF/TLrbZtcw1M0mRAx7oZE0e0lHQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013044.outbound.protection.outlook.com [40.107.201.44])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j6ehye-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KX5hVUndMO3P6BpZPxcsqafIgvV7S9Vue84ayAUevyWnQbO97Kq4iqd5uTa8cy4dlbKv76dS360EVxzcvtoYKD2qv295cu5WFeku+tNvrT6jdLMc/bBw+D9Dok3cTJ4o9/ZdhbmBMmMs642rI+RE71nZo+HD0/wrVY+xI2zG2T3dRAm/cRNQm1XO1F+jzshz/CnuqrxQc/VEmD7e+PYXNkZ2JvutWqEMSFlVwKFSlVFvhUcctxKk9uAB7EZ9fl+lffQDll4Ple9Upmr0I0lJlBgKWhnya8ICIYxnRJnajd+Ty9TyhUtpw2eOotnzsAET8f7wxaCNib80v4S3nTKKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtmI3B/88Pleg6d15duZokHUtrPeaXu5is+bQLmZNPI=;
 b=p5TSAFr8sNeLbWJIPaSz3jRIroibuwGx7paZC3io1EvTzq7+UeyFZBpuCT0DMFw+wO7UvCsOT7E0DmwdAp4Ej0Tsdcwclf2aUNhP0Sgkw2rVRg4RWP68fNRxl1N7452mr0QDoHOqCu+V7FVDteUt7jdxd9YxLdp/prcHRyRXINVaXVY7UZByc0IcND5uwwva+oWfgW6m7SxgUg8oCvKpgB2E1TpHAFB2C8dyBj4d65x2PL8olKoykCzZlZGF2NGqQhlrIYEeTIiMGy7abCCRZzBYQdI68YQYIjrLg2e/QyP42sf9WyYatwxseoKPYvRiSLBIFi/Ga0P188Ug2oSprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtmI3B/88Pleg6d15duZokHUtrPeaXu5is+bQLmZNPI=;
 b=WxrmM0s6uCLATA+U10XylR3dFAJPgdJ1tur2srAX0qD3bIoba2cjf4yvWudg7iSSqNzzSk9E7F4LD5qWD9LPiEYwiKmtpcMgfQeObfdCWooFNiwffHY4TXA5JZWRBwQ/QFFTyh1Yc2zUf8te9ayHelS/Ua13p6PgGVL/9dUD3OA=
Received: from CH2PR15CA0027.namprd15.prod.outlook.com (2603:10b6:610:51::37)
 by CH2PR10MB4311.namprd10.prod.outlook.com (2603:10b6:610:79::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:18:41 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::3b) by CH2PR15CA0027.outlook.office365.com
 (2603:10b6:610:51::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 20:18:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:41 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:24 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:24 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMj1688208;
	Tue, 29 Sep 2026 15:18:22 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 11/22] firmware: ti_sci: Use rx_message as message receive buffer
Date: Wed, 30 Sep 2026 01:47:35 +0530
Message-ID: <20260929201746.4078803-12-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929201746.4078803-1-b-padhi@ti.com>
References: <20260929201746.4078803-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|CH2PR10MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: 55113861-5abf-4d96-8c0b-08df1e66dac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i6RbsP2euYyaZJDC8smylSMcbgKUPu2/48MiBN4jmtvTtsPyv5tvz4fnMZPlvZwMZ5CgVbSFObA+B10ZD/RUEminkgNhV4tuvJC80qpeTqSUrYBs50ovVBOBQIISMrCVGPjUSU50q6pXatuo++61yqMU0sM81ZcDA64zW4Wj/KB9URZ4Zy1/VNYn69T9i9MXIH/p/zDRJfS4e95to4AotkTovOPMXXoHIb/eGCjVlpNWZ4soIa2XVpumAplhaDYNIdjJ0fKY4DIxG4i4GqkaC3dDE/Cn+7hMyUeiqOyuCFsBDvORvGKIFP/qvCaZFLQaWq0rHdxt4MOu2oT4oI+YfD2RuZQ1Obs4z6i4c2XsDyl7IX6/FeSzviXLp+C8jfWoCVs2WXX1qiPMINjPPSJrFYXGTR8d6SOGT9ErVZ7yHLcJJATNQEYZtOhTWL/ID4TnKxeLZURexioIl3d9mxf29/Ijzf4XuKd+jiuGQ7UerLY4WM41g5jfI169unmBy4GSu5CrHjK4hEkfa8zpQTr+qFc7e9GtIOLwYZIR0PdCqkliqeh3wY+yi6h47VM82h4vtq1I7wXmPssDMkJp5D+yDBkVgw0FlM4N0ClNkLm0ztLLpD2RfWKGJlONIWF3DV4DvMrFU9HRHzQZ+5ZDhtVVlsrB1C9igW9oKltPoCuwbKJ6SeNBX5z//nZl8kk9pjWu4pHJVjfhUljOhMbYVkk18w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x6YcKVkBMQHPlLwJQzN4+apzHFZECSEapuVZiZHOZEQnmBE4PI4wbR/P/byf/puRVftrcXjCoa2e3KHrlOlMrkK7opPrNshAtFfAfLS801SUBPKZmH3ob7M7nzyBxgRmzgeyvpqkay6ffZpH2wJg8twfwKVlCSILVCWmdLZySfyXpiZb6YpFgb+0xHWOXRfG81W/0xPDR9yeVRaZU7uR2APWJKLFQ+dBw2VCkKPot4sBjpF9yAGpJlv7WmqN+txzzvS5IIXnfnLuZRZNvFC/d4r/DFVUlNSFgzaU5X0DEcGnZGJcm40n424UlX46jSdH4thqBlPP1yI7i2UG2SsvYhqTq1QtGBgbYaG0lGT/dot+SFbpQMxN8rCfcNi51fogfP6Yw5ROO+N6MPeyciAZquzIOM04YqGdpjXEm9vi5WOfWR2uZZcGIT+SQygGxa3F
X-Exchange-RoutingPolicyChecked:
	4eaVpmqto8BhI0d6c806RvbUqPtoK/nUWLQ0o48QpG41oaCerVaHXDrx1IErg2ttgEKH4v60C+0TPfj3X/mBI4EWwvopaeky37EzS83Y0V9oKlHguWxRQaXLWTH6894vVFAIROKesUr2tFOePMVBfFUWJvnV3Jp5ItddJBP22oMUavdTFyvD64cAIbuQ4OX/7R+8fKsatNAfi0uPaF6jE+dCo6KCaL6D3Zd8e+ctyTkBfW3VSGr/I+wR+ZsZZTKj9gevXls4LLr7FvlCU/BCD/W7fFCcHNEQYCOnpPfqIRDukYBfIzHWA2O+23iusaPU4sgqvKmFrMHJhMFDDpitBw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:41.4783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55113861-5abf-4d96-8c0b-08df1e66dac3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4311
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfXxSH/UzpNzKsD
 8XKMv0GGQAYH31PuDc7wawDM/zu3IMFVFEyyGTuNf2Ts4UPYWey4zS/XNTAWtBi19ymBcsUPWTW
 KVV2HwvNpJZ+j681tDaBUgMNelL2eBo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfXwkpKWVdp+1+i
 5Db90Zrooutw4rVj8dsUHPvNF6NLzwtiF7+ZNB+FloaymLk0Qpla3wBiRXqcVCUuWPFSLONTwUj
 nrcAfDn8aJIIOYJO1BocoWh+FrV5wghb+jf8h3VI6eB3QIrUyJdYMI0BOl+OJw8tj68Wcb7Xtvv
 +Tr2rjJVzJuoOlJzLYsdsScxiYXreMOPXPR84LaGTZ/ph7Elmq33eMEZ1mmPaE9+wT4jEE6wFbv
 JipNVRkAVNvY69JVTeur0hC6P3MsaxSbYoJCGY+Pss/l7KwPlebCvGfg1Qs5H4rZcURib0VAg2t
 RQZ78ohgH6F4J3UgH7QwjvO/ZGFTjruLB0gg11ODjZcnYXLlQm4TMH+K5VwePeW/U99UTDoXXao
 67J3SE/npVZwMHt/EjtmyMnfqzKpc5lam1/PV6zB79QT7+HAoBg5YC6CpkZXkHI3Hbf/EfvVAII
 QNdaZ5IH8vVFMWVjSJA==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abc1d24 cx=c_pps
 a=skQXzUdJ1yZbsxdDph07EQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=6xb-8MLe_s-5M6G4LukA:9
X-Proofpoint-GUID: Ob7KIQgz_WZIIwSANcafpSXabnD0sBGv
X-Proofpoint-ORIG-GUID: Ob7KIQgz_WZIIwSANcafpSXabnD0sBGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

Previously we allocated a message buffer big enough for the largest
message we could receive for every message we could have concurrently
in flight. Now have the rx_message buffer during the whole xfer process
we can use that as our message receive buffer. This removes an extra copy
and the amount of memory we need to pre-allocate.

Note: rx_buf now points to the caller's on-stack response buffer. If
the system firmware replies after ti_sci_do_xfer() has timed out, the
rx callback can race with the caller returning and write into a stale
stack frame. A reply that arrives after the timeout means the system
firmware is not responding within its specified bounds, after which the
system cannot be expected to operate correctly anyway, so this is not
handled.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 6ed67160c6a7f..fef7028d40e39 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -45,14 +45,12 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
  * @tx_message:	Transmit message
  * @rx_buf:	Pointer to store received message
  * @rx_len:	Receive message length
- * @xfer_buf:	Preallocated buffer to store receive message
  * @done:	completion event
  */
 struct ti_sci_xfer {
 	struct ti_msgmgr_message tx_message;
 	void *rx_buf;
 	u8 rx_len;
-	u8 *xfer_buf;
 	struct completion done;
 };
 
@@ -287,7 +285,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
 
 	ti_sci_dump_header_dbg(dev, hdr);
 	/* Take a copy to the rx buffer.. */
-	memcpy(xfer->xfer_buf, mbox_msg->buf, xfer->rx_len);
+	memcpy(xfer->rx_buf, mbox_msg->buf, xfer->rx_len);
 	complete(&xfer->done);
 }
 
@@ -522,12 +520,10 @@ static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 	 * state, then ensure that the response is an ACK
 	 */
 	if (response_expected && ret == 0) {
-		if (!ti_sci_is_response_ack(xfer->xfer_buf)) {
+		if (!ti_sci_is_response_ack(xfer->rx_buf)) {
 			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
 				 caller);
 			ret = -ENODEV;
-		} else {
-			memcpy(xfer->rx_buf, xfer->xfer_buf, xfer->rx_len);
 		}
 	}
 
@@ -3326,7 +3322,6 @@ static int ti_sci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct ti_sci_desc *desc;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info = NULL;
 	struct ti_sci_xfers_info *minfo;
 	struct mbox_client *cl;
@@ -3380,15 +3375,9 @@ static int ti_sci_probe(struct platform_device *pdev)
 	if (!minfo->xfer_alloc_table)
 		return -ENOMEM;
 
-	/* Pre-initialize the buffer pointer to pre-allocated buffers */
-	for (i = 0, xfer = minfo->xfer_block; i < desc->max_msgs; i++, xfer++) {
-		xfer->xfer_buf = devm_kzalloc(dev, desc->max_msg_size,
-					      GFP_KERNEL);
-		if (!xfer->xfer_buf)
-			return -ENOMEM;
-
-		init_completion(&xfer->done);
-	}
+	/* Initialize the xfer completions */
+	for (i = 0; i < desc->max_msgs; i++)
+		init_completion(&minfo->xfer_block[i].done);
 
 	ret = ti_sci_debugfs_create(pdev, info);
 	if (ret)
-- 
2.34.1

