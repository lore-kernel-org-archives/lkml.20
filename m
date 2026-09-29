Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055C35295C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712205; cv=fail; b=TqT2WC/FgufGcJ32JtcZKpC/Z90OEncWWOpuxIDsTayQacoUyDOl/gQjr/cuzA2iyWQ/IQ6ly7lwCCPt4tYWlotc4wUH5iffmfMeVvfanyS5wf8W55QqEdxMT+JJvich5r7LTJdyi6NKz054tXdne6FrzhzaZFOblPZHlZLvdnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712205; c=relaxed/simple;
	bh=S6yRHJu2QZWG7khQqVM9IeDwkyrxuqjhPRTDwV5xo+M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rz61yd70NRJhK2/QaBc+Gj9nJYvsQV0b66UbKuhoPeiLv4ARwGmEt8Bl/U+5YagKqd3hZYN94L5Q5wh2+rudtWcyz58Jetc5JHj+TeUBQwbePTOE/H1Q5YywMO64ejSyBTggTDz8ObfJQC/NMuUDzWlix+E6MNbEEsNuTt3GZ5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=oDNoScoH; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=BptGbRcM; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="oDNoScoH";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="BptGbRcM"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFeNLQ152293;
	Tue, 29 Sep 2026 15:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eRvKFsd4iq0RuRYI0QW0q+PzsJ7+NNsPvsD4JxouV
	vc=; b=oDNoScoHASlakNhOZenueqpd2arl1audY7kr7XWJwyljZGLXARR+6/yJN
	WQ2aHzlde53dNjaQZOfDcGTSccjm9SbVRY/ciFQf3iHirVgWI6mXPuZ3lPFE8RxY
	Lc0JfGTpeCu5mJ1Z9K3elt41zm9/DCmKra/2YGv8LmmVT0cuAKx87bSWUpsVtUhV
	l5RWWu4tGKbQQpn2vZWt5QZmEmVrqSB3sg4hxYrlptInfULbX4kzrTrK9TPw4w9V
	zA0qwOxp2G1EESLxSlcGV8kaKRdaMHS/2gr90+Au0GVfW1DIoGDC1jB7aFe/1wCz
	wE/M21lBmeOQ7hnzqWsMQhOmMiKlA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013058.outbound.protection.outlook.com [40.93.201.58])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h099y430c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:03:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNQghehm+Wq/9kdN0G1jN9EX0fLmmdY7qYDQLJ0LT+OvkvCrgZX7H19UwjlLSmBczHIP/5JYFd9MQIv1AlOZBATwySTD7mOfl7WfTW95kCW2CPzUIyAvd0hJNKYPlAEtO/cjFFeHNSOcoI049HkmPvzsXlFBELjtd+Ja3FQUfAK3WV1B4axcBo8OoVlpVSvp+T2y/lDx+PUzgyZhsTAci66nvtjt6eLx0zCldVQohfWAUhboJTI0Im/bd+sTESRYw9HDI33L092c9dIR+WWIiIEUmtnu70M/NYUR76ijAjd4HbOppOwUEJCkUQM5t+t2TE/oa4Kp/gATxee9jjatlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRvKFsd4iq0RuRYI0QW0q+PzsJ7+NNsPvsD4JxouVvc=;
 b=kDVMRTBABHOGSeA2CJkYcDkyc71zbKNT8966rAFMKH75QvQ2Oh5pxS1AXEoPm2q9ueXcJXc/GJaIsgPBEgt2bTHlB75O7Hwb3YVJ0Ot2lLj5qkBHuoiuAJrcP4sXuQCYaSRdae4v3U8LyuGWHiv8H3bqZO63qTRKILwP2No8Y6DTP6asDfIFcZgR3IRiMcS0k3XioL6+qUp8pWiWcLXWUWH5eZe7LcqO4ug4JLMcltiUergPuniNKEYGERU5+SWQo8pnz1QAEgUBqPPmfXNSkxcBoyv6jN8M0oA5MO+W/8UbrSiPJWNALePAeB9YkfIMRp4PeLNMOgvYsGsjonbPbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRvKFsd4iq0RuRYI0QW0q+PzsJ7+NNsPvsD4JxouVvc=;
 b=BptGbRcM1QACQ1VfflkA/hB0TCYJCathFJM75jihdnb5mrdiTaSvjN3eBl+hgwF+A3+7ThpuVBiyYITK4jL1BJuJ2rAIto1bAgLmGQgScXhTVyLDE4T0bIuQZnO8Asw6mP2WnogW3YkrWDGCZw4C/qUOnayzOrsQ8NVeAya44Z4=
Received: from SJ0PR13CA0086.namprd13.prod.outlook.com (2603:10b6:a03:2c4::31)
 by DS0PR10MB6750.namprd10.prod.outlook.com (2603:10b6:8:133::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:03:12 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::42) by SJ0PR13CA0086.outlook.office365.com
 (2603:10b6:a03:2c4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 20:03:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:03:11 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:02:05 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:02:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:02:05 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TK1xGg1665878;
	Tue, 29 Sep 2026 15:02:03 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <b-padhi@ti.com>
Subject: [PATCH 1/2] mailbox: ti-msgmgr: Do not report rx poll timeout as a send failure
Date: Wed, 30 Sep 2026 01:31:58 +0530
Message-ID: <20260929200159.4033010-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929200159.4033010-1-b-padhi@ti.com>
References: <20260929200159.4033010-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|DS0PR10MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: a07e97c5-6f18-460e-d800-08df1e64b056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hk8mJCm+751cZmycmYyDBkNDagc1kG4nPgL1wNTBSPjnr8iWVcKa/j8iGRGNCqYSOQNTr8hfl0X0VPwsS2qnRUVkbaHCi10biabGiYlVZ8wqgkIcgIFo6/U8G31dZq9wN1eF1iIYYpqcBSVnNrGDEW/Tprv7KFYl7F+17+LN3pNkcdaOtKIPJdjbjvfzP78kkSm7LfGK733O84f+ZYaMQW1d9ErVLJVcCoeWK+4aXx0Sgoa4QCw05bPkahyHPCx46w/8G2JfS1g1fwl5muv4ACr5nsKstlMlfeI/tM75RIbBb5Ojge3kPIC6FowsmAR05QsSlz16JPJr2OvEb4uscC0+tLnYYxGPfaIc7nI1BP7SlxF1iWi6/9jYrW9pBWSWivI7XlxMm80T0utS9CGucGySGpGU0yQoCX9iuh2p5/wEG6z9AOg0aFanSfXrN8661ge5h1Jlc1ZdTdWqFNMRpCcGkKY8oVw6M2cI1a03yi1w5zXeRSCwwhRnfHtMWDZXYY8Brv1UQciRI2tXg2/But9C8VJUdxj2/w/zhWCqrIFZL0K1hRKAU/FibS5XcB0UcoSxDynLLqLDa5JVyLIWumDo2m/BUjYJuduFXmS2amzt6KguAM4wv0LxA0BKnl4OWPD5YkqDS4Poi1Uq+8ErQT6HsiYFX0T0OkyObSNXhdNfOkcZUvsvvrOFhw3Bvpv/weVW9YbH2idy6cTb7C4RcQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i7y4KkLM4/rtQEW7F3OC0Ly9VY2n06tOC0GjqnRYMBd4C9zNlFtnylULwBYxAt93CKkOQ9DxJG81qkj7nsu+e2mFABIv/LXNZ9NAhXcXei2EE0m3n9WmLU3aEju28goAr+4CtdyiA0guliHTG7Vg+f2++GxCkkZMeFZnMothcUG+FgtXf+psD603zG5OX5mUIDZpdjJdt4lI9TtCK/8JoWqsZ1n8O+W95AL+boGBwY0MyrlTnWObiNStHvY2JoP0C/m4jqxsnmYfILnM52ZLFHTgezRYq0etIBPPZGL2uFe1eTeez6OVIQDG+gDNb67Ne5Wfht3/9/1ZvxqoeVwZtsSOFWGu4dAmqjOIZhJlvP5xBbWg5pKeaJ+L5zyTRJDwsQkVz6+nL4KvMntAtMpMDozM3J+veoQnbOj94bViAqhR7DDCB2j9GeDr0Wsqio4j
X-Exchange-RoutingPolicyChecked:
	3tg2ecFusocYpxt8ct3KyV5SMs1YGCLDVNKipGBx2qKAARPTOZeSunuZxtBbZ49mwzFk6utumkXeljeTNDjcztNz/Cg1P3jWH8YvW8wKEi/0KCusStUgZsftUqll8T3viLWn/SZDrL5BGMCxPzANI+akDuQzQA8Ozc0luKqX4BUiWQzIzBlku03/sBYRIL9hPKKvFn6n326tnzXF5ZoWFiVSBBOa+We8fmrOGr5EWb8dboGbQ2GpqzemRRW13rP5w6hc8i5o7CQHNRfLpXz8FlNlQ7ktiTHLFjdV2IIDzOwkldK/mZhSNePXW9YHtlmOhv+QLVZJVVotGqHN+IcOEg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:03:11.2597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a07e97c5-6f18-460e-d800-08df1e64b056
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6750
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3OSBTYWx0ZWRfX0DkFr7QBlkWf
 asegnqIqcpFATGiW1THEAlSSa8nhUfb9HiTDJMD4SVB+3nn7HZnixWmkSxyliQjK2k1e44iOC9k
 /dDFEU0dFLOWpkK/Xb+Wo/7aTCDnYZv/lZ3vgQRnb53an8Jb+ZqHbNBJnzygT6DWj3gBQi4+eCD
 NRtLDdk0NR2uL2RYB8fe2eNN4B/F1FhcFNbMJzA1QKaL9e7ID7U//IkXSDELTOqfev3qEXJXSzh
 2FBNZe7Lhg0vRR16b4+6G21oSX9KYAGGN437VZ+OqVB4SMugjzt1hhIlSXij8CsMEp44/1G6wN7
 4FcbK2a2k9Mr/UUQj4HjlzP/u3+JjIVXz87LCy1ACluwa73eBLG8fG+UUYy3jW9BXMYsPz3RyN2
 9bQM14TTRBD7Q4xKSHziz9D272mPLmys4RCTu4ENcGNdLUbs3z9nNUWLTkZYtjgdLF/MIaOYxwV
 MY7hFssCakXsZ6Pa2iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA3OSBTYWx0ZWRfX2w0U/FDyoKIq
 eqKxefm/hWRyER1gRA4ljdvJzGAbnrsjdsfYqF420ZDU/HYT953DhE6rhfi7PbEcF7u1cg/FxLh
 Et3C7+bGwNl5B2jIrearX+eGQ1SV284=
X-Authority-Analysis: v=2.4 cv=GdGCDgXL c=1 sm=1 tr=0 ts=6abc198a cx=c_pps
 a=+UayH2mdqs80qU9+PBkj6w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=_XyyNiWMlt3iJy3YHq0A:9
X-Proofpoint-GUID: 8RvLCixj95a5Zgsmf-wLHpBp27V16mHb
X-Proofpoint-ORIG-GUID: 8RvLCixj95a5Zgsmf-wLHpBp27V16mHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290079

In polled rx mode, used from system suspend until resume,
ti_msgmgr_send_data() writes the message to the tx queue and then
waits for the response. If no response arrives in time it returns
the poll error.

The mailbox core treats a ->send_data() error as a send failure.
So, it leaves the message queued without making it the active request,
and mbox_send_message() still returns success. The message is then
submitted again on the next tx_tick() or mbox_send_message(), after the
client has probably timed out and moved on. So, the firmware receives
the same message twice, and later requests are sent late and can have
responses matched to the wrong request.

The message has already been transmitted at this point, so return 0
and only log the missing response. The client detects this case with
its own response timeout anyways.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/mailbox/ti-msgmgr.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
index 8eb8df8d95a4c..425d5f9d9d0e3 100644
--- a/drivers/mailbox/ti-msgmgr.c
+++ b/drivers/mailbox/ti-msgmgr.c
@@ -445,12 +445,24 @@ static int ti_msgmgr_send_data(struct mbox_chan *chan, void *data)
 		data_reg += sizeof(u32);
 	}
 
-	/* If we are in polled mode, wait for a response before proceeding */
-	if (ti_msgmgr_chan_has_polled_queue_rx(message->chan_rx))
+	/*
+	 * If we are in polled mode, wait for a response before proceeding.
+	 *
+	 * The message has already been transmitted at this point, so do not
+	 * report a missing response as a send failure. Doing so would make
+	 * the mailbox core keep the message queued and submit it again later,
+	 * after the client has possibly given up on it. The client detects the
+	 * missing response by itself timing out.
+	 */
+	if (ti_msgmgr_chan_has_polled_queue_rx(message->chan_rx)) {
 		ret = ti_msgmgr_queue_rx_poll_timeout(message->chan_rx,
 						      message->timeout_rx_ms * 1000);
+		if (ret)
+			dev_err(dev, "Queue %s timed out waiting for response: %d\n",
+				qinst->name, ret);
+	}
 
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.34.1

