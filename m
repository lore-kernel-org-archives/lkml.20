Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDAC56B851
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713137; cv=fail; b=PfbAlYRSxgi+am85IsX4Pme12EvQxC1iedO3gTDeDDwP5fPEfdnOX5sbpsa2Lepyy1othq7bzcUae+tJTrDsZdNGRfzpfi0yAwqEyKiByBYav9DuIVnpRTfNPYlk5tCze4H89BivVpLD7jLo9kI4v1Zs2byDy+I4SGm3IG7AQTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713137; c=relaxed/simple;
	bh=tLRGfEu5YPYE66MfwcunHELcde8w8Mz2zz+MTSZlWps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+gWK40KnEKLC12V66tg1kuvQYwdYjunTgzBLT3GLy7xgkkaY+ppE4uFKxUyuwM8JalGGQWN6E4q+FsGkVex8Ao0XqDJIygasQP0jZv03kb5/Mjm5/QVWZ0WdAZc62oACOOmSWlj33mvIykS1aqNkOnfLutWzcRXs2MA+VdVeAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=i/Im2b/f; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=LelpV72v; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="i/Im2b/f";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="LelpV72v"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFoJm5152387;
	Tue, 29 Sep 2026 15:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hZlvxWm2fc61hcwQ04xAyUiXpxto5cyclVFr5Z5OK
	+g=; b=i/Im2b/fiFjZb1tvRzduuH/cz/srHqD7FKCI0ivSdpMAyWCbL6h76eHnp
	7ZeE3JiIlL9RgeDMLbhaqvieykl8j/mvKPi7JhZsfvry5afYVTgUOCcPjZ/53kkQ
	3xCQiTl3U/s2CrQXfqm/Fsv+Dic/4IPF2WyKxYFFteVdf6MrpP2XheA5EPG1yw27
	Gn8EPh3Bes41fl806jTj+mh+Lon3U+Gkr8qic/X9wd04umZ+S22sFi+v9hXUcLSi
	qv2/TAPkXREqgY7SzCb3kEzk70OLr75+qpXrmh2cc7m5JY99IsFeKxN0rGfmtEPJ
	eZpuNgRJvzBXHulcTdTAX1kHZDTFw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h099y45gv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UULhdkaXE2AyEuMHDjWmJCxM6sv5mjmR2nYxIhkmisLkSxULQNE0c3qIRY5JiDNW3t1sNk1xUjp9Lq4drYbEhhpvQTMI8q+vylPSN4YhrInkjcO7A+jb1iErmHHXzG9bVNqJ3yuR1tfdQVQlGakIu6dw/eTAwuGnCIx4fToCUrtuHMQNlMRX9E2+BYr77S5si81CNMN2KuAmXza/nsh4X4mEwbpZRwrDjRJ9ys26BemzxnsBktcoMDDJoNGphhVAwrDysZ2QMmSwbrUJmJi0nT25sSwIbN4aalvxzbEO7FssoQx39TixUunLu5OjjbufRX65xd90DtH+KixORZcHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZlvxWm2fc61hcwQ04xAyUiXpxto5cyclVFr5Z5OK+g=;
 b=n/YtZBVrN+JfTgDlOSTHXZY27xQ0IdJUf/DfZuBjSd2/WXOJxu8qkFcDO+rYzIns77J1u4xWAPvTgOGdWtSpRIQuv8vZ4ErObGI5b5y5gdG/Ohqqeep4++HE+ptQ7Oft9ZUYMNG1v1NWqBgDoMbKLbIwj6QxSO8rUsiispxPuzS6A5smfG7Pe3/zCZD/X6wq5RkGuuQqcPoPSXZgUTZHsv2/557zeU/oARs3RPZDMqVTMLyuQtMzErSp9zznTWdsF+BJ0vH9aMH2ly3G/yH03Npcl4nR+SbOIuWn5MWRtaz8CLCOpVW+EgIzP7yu3dfj5mbR5VnO9xeVn1MSbdQt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZlvxWm2fc61hcwQ04xAyUiXpxto5cyclVFr5Z5OK+g=;
 b=LelpV72vQALgiYjIsk4WZWeHO3NfAbp1urPEa3VoitAP4mHK9Le9iWr+TW6d8qheHt6vKa8rnLyCaHMFCCXwnFJReEDOdiTXCvqBn9nrk0PKCPnUPXDIQM64jutSXfgA30NgrD3CrAks2uJJLTtz71m4M9FEaT+F4oQfxvtAFxk=
Received: from CH2PR15CA0021.namprd15.prod.outlook.com (2603:10b6:610:51::31)
 by IA0PR10MB7184.namprd10.prod.outlook.com (2603:10b6:208:409::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:18:33 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::9c) by CH2PR15CA0021.outlook.office365.com
 (2603:10b6:610:51::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 20:18:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:33 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:18 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:18 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMh1688208;
	Tue, 29 Sep 2026 15:18:15 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 09/22] firmware: ti_sci: Fetch info struct from handle inside ti_sci_do_xfer()
Date: Wed, 30 Sep 2026 01:47:33 +0530
Message-ID: <20260929201746.4078803-10-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|IA0PR10MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 34cf7cbf-3bb7-43bb-720c-08df1e66d5f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lVTppo2GPkjXcfGJoIXhB5BEcX24ba79fjEK5tnHMqvH1yQE/hHWyiPfuBKRpZ0He4Z1X8H1xfGgwA22GML0ya8L6pqGYiEX+BS3qgq3AMFb4oj4+jE3oyNyv/T8OMoe8QkKTrajKLidJzYf47000IEyPCmSt5Nn0AaT9V8FQOw/zzFTS51yqu7JpoaagKZ9uEhQdR93qbzA2+l/rkuMfis18o3QiT6abExv6iN3TMnYrocTLrrzojUwBp5CJkv16y/qYadDNXS79RN38rpag+Lf1SpiFPyDWkZ7DzAbWE+e5vWxLvJ8Q4J/b3sVKI9SfhH5CLkbJL91xelj0mqMWrUN5MA1VADIpb3J9oaMHoqVOr35dwNtgTlVj+d/AGQLF60kxqgaMDasRbujjh/Za6JqJeq101elT2izkFcU8RdPNZ7nISP06FPgv8bTxIQ9zEmFv8FF2zfa7td/k0jAw6w1rkQC/YPiMFj1Yvx27rNto+RzTagrPIDvP0sMPLv+sdexooF7bFZmu+zd1Sa4EgUEII3mOwfQC9txhhSF8e0323p1ZDJJnhNoWhGcHowYjUPaHQv0LeZW/ONP4eFS+eDA9JBWHT6/+rG1UldjAB/YGF2+jJK34suabnYJ6H0+VbfxaaxR232poDV8NopFUWdEeWtpZBki4f9oHF4qXq4BcCuu3zPb0Tx+399dYogGd3rGJ5uk9FdU6PgeAANiaA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QQI4sdUvuDZ6g8ZEnlfiXKNOnRafsMXUKnn6QbsgrRaXfPtFwRNa05BWq3nqeh4uosQX2+g0F4Ov1Fj9Ek+pLFKC6I+JMaU1tbOHWC10i4raMvog3GSWJGUE7PJeF7GE7uy9iJr5ShxBrVUp16JZfIXYr1iDxyZIiTQxpGJzxZJfQcGT+79mDT3Ax1LCAXk2tYyp+VtQ0qxy2UnVPk5Rh1BXvIcEhuq3AydOznPd6KcE+zFgXiK8bXkjN8Npcctspfd7LxmtmDOKrko0cs1Chn4B8yLbCXOTASW+STL8RjrWF8kYhwxTroU9W1/igki1L2lNUqCm9REVHUpv9/rpyWGlqJICPQ31HzVA4tzCWlQBOMz3t+nVCgy4Oh32ojka05bXHpwmFOc7Epw438bFxLQyiQ2ZmH4o7QZiI5+6lOn2bbV+3ScMIFVTlRKCEoET
X-Exchange-RoutingPolicyChecked:
	OuR45ryFtanC+FHpHYTEGD85M7GuOv4Rp2uXoO8Rz3z4BZ8ZV8vZ5qsFXtTKUbAzsOgXri0lFBsZjxuqSoJ8aJV6gAGQrxTElv0KB4FHmbGcLxm0++8Tpojs37c1ZH/yyjnF7GCRIZhyA22HEWOlNDVItyg7a6w0PHVex67iOkbxwK51XYCJX5SwjqzN+IoKsjUDb1mDDl/b5Ri91x117VcntbF7oKxUjLzlsIdkqnvx3qPYq7Kh+0ZdY1+DcmiFiC961achJ5D+oxJCIlsukbYcfOVIHGECF34k9IbHImioau5q+e881feGlamWKdVJUUL/fmBm/Md19zKYUnHHFQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:33.3945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cf7cbf-3bb7-43bb-720c-08df1e66d5f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7184
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfXz66/ibPr1mON
 K6jXR9uuZpRaG5c5CB1BBPydbLoVgysG9jsltP4S2LrpUvr5MFYHCVOclOG+G4/Rb4dS8eM0BN0
 1jbds7tNyg+edrZ0AsZ/DjKR3s8Lv7wNlmCZ1zBtx3RbTzritN1TBWQiFuX9bsZis7Ui1srDWPV
 Pk+G1D3ZPYpCuYWlSARAz7hUd7St5Ip7S3DVC3b4x/SC4ESQrOstXgEJShpPiZqPkly2qm9F4rq
 RwQ0y6/RdVU8dsJLOMulPQZHDHkBLwHuV56+89dPrYjuz1ddo+tJVJE0KDnldSCUDC2PmWc6mZC
 6Z2cRTZR35qV4oR42bXr34WdCBzJ1+Zx40mr7sx5GBTsv7W1ZSUI2qOLPOVt4/zjI+yafYNeAHu
 rOKrOA4kCGNa1cdzMCNYD7QuFEaqIDn6S7khKu05WAb29GDatQwBNSK4hA9LDVy1QnCBbNMEQxn
 rkAZFBRkjQ9bcwZqDDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX2b5YJMQU9Ux/
 lw98qfBSgDhATsoiQ06ThZW/LcN+rEiG2YHVK3bfngl43F5LZBDjEBdgOCXQ+4/qMndvQPcD8xG
 Is5ARA1B0zqTGCw2GqTDcVj4zkMq3Wg=
X-Authority-Analysis: v=2.4 cv=GdGCDgXL c=1 sm=1 tr=0 ts=6abc1d23 cx=c_pps
 a=+kBkz34/1DjdJIz+AnMsKg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=we-QN_a4EPTVeeq35NwA:9
X-Proofpoint-GUID: SGz1BtlCIdT6mPeqVZsXIApb7S5ejobV
X-Proofpoint-ORIG-GUID: SGz1BtlCIdT6mPeqVZsXIApb7S5ejobV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

As the only use for the handle is to fetch the info struct, which is only
used by the ti_sci_do_xfer() function, move the info struct retrieval
into that function. This also allows us to move the handle validity check
inside also, saving us from needing to do this at each message function.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.c | 306 ++++++++------------------------------
 1 file changed, 60 insertions(+), 246 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 6d0ecb77d731e..dbe192142bf17 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -435,7 +435,7 @@ static inline bool ti_sci_is_response_ack(void *r)
 
 /**
  * ti_sci_do_xfer() - Do one transfer
- * @info:	Pointer to SCI entity information
+ * @handle:	Pointer to TI SCI handle
  * @msg_type:	Message type
  * @msg_flags:	Flag to set for the message
  * @tx_message: transmit message storage location
@@ -443,23 +443,26 @@ static inline bool ti_sci_is_response_ack(void *r)
  * @rx_message: receive message storage location
  * @rx_message_size: receive message size
  *
- * Return: -ETIMEDOUT in case of no response, or
+ * Return: -EINVAL if @handle is NULL, or
+ *         PTR_ERR(@handle) if @handle is an error pointer, or
+ *         -ETIMEDOUT in case of no response, or
  *         -ENODEV in case of a NACK response, or
  *         corresponding error if xfer allocation fails, or
  *         corresponding error if transmit fails, or
  *         return 0, if all goes well.
  */
-static inline int ti_sci_do_xfer(struct ti_sci_info *info,
+static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 				 u16 msg_type, u32 msg_flags,
 				 void *tx_message, size_t tx_message_size,
 				 void *rx_message, size_t rx_message_size)
 {
+	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	bool response_expected = !!(msg_flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
 						 TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 	int ret;
 	int timeout;
-	struct device *dev = info->dev;
+	struct device *dev;
 	bool done_state = true;
 	void *caller;
 
@@ -470,6 +473,14 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	 */
 	caller = (void *)_RET_IP_;
 
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	info = handle_to_ti_sci_info(handle);
+	dev = info->dev;
+
 	xfer = ti_sci_get_one_xfer(info, msg_type, msg_flags,
 				   tx_message, tx_message_size,
 				   rx_message, rx_message_size, caller);
@@ -551,7 +562,7 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	struct ti_sci_msg_resp_version resp;
 	int ret;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_VERSION,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_VERSION,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -579,22 +590,14 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 				   u32 id, u32 flags, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_state req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.id = id;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_STATE,
 			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -619,24 +622,16 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 				   u32 id,  u32 *clcnt,  u32 *resets,
 				    u8 *p_state,  u8 *c_state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_device_state req;
 	struct ti_sci_msg_resp_get_device_state resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
 	if (!clcnt && !resets && !p_state && !c_state)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.id = id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_DEVICE_STATE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -905,22 +900,14 @@ static int ti_sci_cmd_dev_is_trans(const struct ti_sci_handle *handle, u32 id,
 static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 					u32 id, u32 reset_state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_resets req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.id = id;
 	req.resets = reset_state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_RESETS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -962,18 +949,10 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 				  u32 dev_id, u32 clk_id,
 				  u32 flags, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_state req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -983,7 +962,7 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	}
 	req.request_state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_STATE,
 			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1009,21 +988,13 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 				      u32 dev_id, u32 clk_id,
 				      u8 *programmed_state, u8 *current_state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_state req;
 	struct ti_sci_msg_resp_get_clock_state resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
 	if (!programmed_state && !current_state)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1032,7 +1003,7 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_STATE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1222,18 +1193,10 @@ static int ti_sci_cmd_clk_is_off(const struct ti_sci_handle *handle, u32 dev_id,
 static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 				     u32 dev_id, u32 clk_id, u32 parent_id)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_parent req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1248,7 +1211,7 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 		req.parent_id_32 = parent_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_PARENT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1272,18 +1235,13 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 				     u32 dev_id, u32 clk_id, u32 *parent_id)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_parent req;
 	struct ti_sci_msg_resp_get_clock_parent resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !parent_id)
+	if (!parent_id)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1292,7 +1250,7 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_PARENT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1322,18 +1280,13 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 					  u32 dev_id, u32 clk_id,
 					  u32 *num_parents)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_num_parents req;
 	struct ti_sci_msg_resp_get_clock_num_parents resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !num_parents)
+	if (!num_parents)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1342,7 +1295,7 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1381,18 +1334,13 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 					 u64 target_freq, u64 max_freq,
 					 u64 *match_freq)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_query_clock_freq req;
 	struct ti_sci_msg_resp_query_clock_freq resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !match_freq)
+	if (!match_freq)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1404,7 +1352,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	req.target_freq_hz = target_freq;
 	req.max_freq_hz = max_freq;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1438,18 +1386,10 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 				   u32 dev_id, u32 clk_id, u64 min_freq,
 				   u64 target_freq, u64 max_freq)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_freq req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1461,7 +1401,7 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	req.target_freq_hz = target_freq;
 	req.max_freq_hz = max_freq;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_FREQ,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1485,18 +1425,13 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 				   u32 dev_id, u32 clk_id, u64 *freq)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_freq req;
 	struct ti_sci_msg_resp_get_clock_freq resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !freq)
+	if (!freq)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1505,7 +1440,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_FREQ,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1533,7 +1468,6 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	u32 msg_flags = mode == TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO ?
 			TI_SCI_FLAG_REQ_GENERIC_NORESPONSE :
 			TI_SCI_FLAG_REQ_ACK_ON_PROCESSED;
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_prepare_sleep req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1544,15 +1478,14 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.mode = mode;
 	req.ctx_lo = ctx_lo;
 	req.ctx_hi = ctx_hi;
 	req.debug_flags = debug_flags;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PREPARE_SLEEP,
 			     msg_flags,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1578,7 +1511,6 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 					u64 *fw_caps)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_query_fw_caps resp;
 	struct device *dev;
@@ -1589,10 +1521,9 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_QUERY_FW_CAPS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_FW_CAPS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1617,7 +1548,6 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 				       u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_io_isolation req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1628,12 +1558,11 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_IO_ISOLATION,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1658,7 +1587,6 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_lpm_wake_reason resp;
 	struct device *dev;
@@ -1669,10 +1597,9 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1704,7 +1631,6 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 					    u32 id, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_device_constraint req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1715,13 +1641,12 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.id = id;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1744,7 +1669,6 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 					     u16 latency, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_latency_constraint req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1755,13 +1679,12 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.latency = latency;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1786,7 +1709,7 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_ABORT,
+	ret = ti_sci_do_xfer(&info->handle, TI_SCI_MSG_LPM_ABORT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1798,19 +1721,11 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 
 static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_reboot req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SYS_RESET,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SYS_RESET,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1840,21 +1755,16 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_resp_get_resource_range resp;
 	struct ti_sci_msg_req_get_resource_range req;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !desc)
+	if (!desc)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.secondary_host = s_host;
 	req.type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
 	req.subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_RESOURCE_RANGE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1943,16 +1853,8 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_manage_irq req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = valid_params;
 	req.src_id = src_id;
 	req.src_index = src_index;
@@ -1964,7 +1866,7 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	req.vint_status_bit = vint_status_bit;
 	req.secondary_host = s_host;
 
-	ret = ti_sci_do_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+	ret = ti_sci_do_xfer(handle, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
 	if (ret)
@@ -2250,14 +2152,8 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_ring_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2270,7 +2166,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	req.virtid = params->virtid;
 	req.asel = params->asel;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_RING_CFG,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_RING_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2295,21 +2191,13 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_psil_pair req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.nav_id = nav_id;
 	req.src_thread = src_thread;
 	req.dst_thread = dst_thread;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_PAIR,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2334,21 +2222,13 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_psil_unpair req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.nav_id = nav_id;
 	req.src_thread = src_thread;
 	req.dst_thread = dst_thread;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_UNPAIR,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2374,14 +2254,8 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2403,7 +2277,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	req.tx_tdtype = params->tx_tdtype;
 	req.extended_ch_type = params->extended_ch_type;
 
-	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2429,14 +2303,8 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2455,7 +2323,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	req.rx_ignore_long = params->rx_ignore_long;
 	req.rx_burst_size = params->rx_burst_size;
 
-	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2481,14 +2349,8 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_flow_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.flow_index = params->flow_index;
@@ -2512,7 +2374,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	req.rx_fdq3_qnum = params->rx_fdq3_qnum;
 	req.rx_ps_location = params->rx_ps_location;
 
-	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2534,19 +2396,11 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_proc_request req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_REQUEST,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_REQUEST,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2568,19 +2422,11 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_proc_release req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_RELEASE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_RELEASE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2605,20 +2451,12 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_proc_handover req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 	req.host_id = host_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_HANDOVER,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2646,16 +2484,8 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_set_config req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
 	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
@@ -2663,7 +2493,7 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	req.config_flags_set = config_flags_set;
 	req.config_flags_clear = config_flags_clear;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CONFIG,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CONFIG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2689,21 +2519,13 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_set_ctrl req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 	req.control_flags_set = control_flags_set;
 	req.control_flags_clear = control_flags_clear;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CTRL,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CTRL,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2730,19 +2552,11 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_resp_get_status resp;
 	struct ti_sci_msg_req_get_status req;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_STATUS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_STATUS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
-- 
2.34.1

