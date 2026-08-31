Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD90733A9E8;
	Mon, 31 Aug 2026 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211987; cv=fail; b=nhuYAScaewsq7wN2lBPu2QBZb+WMdZLV3B3qYNDIJCUzZFl83MQQL/G1+hh81Q2tGt65ufHWrNQcyDHflgx/WgMqa1Uf+0Ja0ihveBExXN9Q2VbqB9yHzj/1rQPi69Es4IrqL4JYDPcLMdxBZ3UoX/p4I7FL8zsfCN/HR4r+V9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211987; c=relaxed/simple;
	bh=XI7yhoivd+/OWcad1HHdxRk5ehx86FBYfYtBSs20pWs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G41x7QTpFP39XVtHTc8PqUd/hYBjszSksDPD6/xbuJwsZW3IEYxoKLGV7gB1sVzhq04nKUP9m7V16lV/4ku0crneKNTYk/2obh85CNIasMZyWv8AvtZMj07u7Gqntuv2aAhPfp0HN7gQTietAq40Ht2GzzQ5uoznpb3KmrprKcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ICTqbYdr; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XXnO5MEE; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ICTqbYdr";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XXnO5MEE"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VISRFL1813419;
	Mon, 31 Aug 2026 16:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yZW4052o6BlyNaA+pElN/rpteBva6ayyzACDzx5Og
	z4=; b=ICTqbYdrDdU/Y4DVYP5tvEPPV1MM5BvCAn8RfQ10RRaywEFFbwQJWpf4k
	XMyxqt4Kc2AlNMlyG7+T807Q9hlnp+9b2hat6OYPUNHymD/9FSLx8ZYcLoE7GTJ/
	1lQO6vo9Z7k2IQM20gE6/9ScIokn6V3HdhsJyTznzdiogV4jH2eCXl75oWf+XOrc
	i66kkHaITPnvqjvYpQAAZ4eQ29q9vf7G049nNsISJT/+krrc4VI18MWoCPwjAmBj
	B70qsA8PSFiSMEhPtjHnp5YKTcBDRxomp/OFkpkBwto6v8s0pfJLVLv9CwFnPC39
	kNmjKhxuzEDq1MCbhnXP2yewUBfZA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gcet48tsv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 16:33:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAFUpYaimYG2nb1Hcj8snkj7mJxGtHfcsURfC7S4WNVPmKGBPzRUj6c4HWQLQgexOvpTP54qrlqh9t+AiqgwtSjpkc+MTR8bGAnhjb7TXrT3NV5GWdqJSrNxkDGE/WU8yYyanUmRum1YIRtowsi465d+1vmaw/hRRXPPS8oDC3gSmmcXbGBtKeA2p17mcOloQHmjv8StLiY8BHtnsoOeD/aJUPNR8YFlGLzdWp4QigRzlHwFVVky4exyacG8FUCPZH6f3d6NQA18e36QWoDY/JTsZmHieUpUTzQAldT/M69g/+LJWDypqGbadiYqzuiXiKh5LT1jpBTaD8xz+DrleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZW4052o6BlyNaA+pElN/rpteBva6ayyzACDzx5Ogz4=;
 b=c9kxYb4aNHIS4EnoRE+pDpVSlQgwOj0JYOC77yV6z3Yq5GfoaSl2rMRhetcevJnlp0bhO5Y66/smvtRrnwdlMn3SrqUQ6x4GnlSMF8RX92PfY1MolnwMe15sTEpECPqT6r7EaWulWa1gj4Z+9xDmIYV2a0nXvgYD5BwiGmKnAZxhYiSllP7zC96mYTWCjvEu5mrLHds05ggm0oOuImJOt+IHFn8IZ0iCBfinahIw6PKd0A4rTp5F+M9jouTh1J/fyIg3EaTtlZzHb09dzeibkllKeq2Ma5D/DJRvsbW4JoFSLZDoHlCN3srNj4vOIHha2elAWTFOPB2d11fvp3Wiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZW4052o6BlyNaA+pElN/rpteBva6ayyzACDzx5Ogz4=;
 b=XXnO5MEE4SwUdGWYW40rf/PZP0zMGkcjRJLyleqFgi851btXGVRxi7oRpBbUX66KnfWiUvvyLwZRuq5oEcCu27miAj+TOo7VzVk6JpX0i+97a21rC2a2G9AzZLObjyhoqw1UxwjbBEPi00CwNTI2CHgKfCd3Q1uCPqoqKeVvQtg=
Received: from CH0PR07CA0007.namprd07.prod.outlook.com (2603:10b6:610:32::12)
 by LV0PR10MB997564.namprd10.prod.outlook.com (2603:10b6:408:344::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 21:32:58 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::1b) by CH0PR07CA0007.outlook.office365.com
 (2603:10b6:610:32::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 21:32:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 21:32:58 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:32:53 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:32:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 16:32:53 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VLWbYe1545515;
	Mon, 31 Aug 2026 16:32:53 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <sebastian.fricke@collabora.com>, <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Brandon Brnich <b-brnich@ti.com>
Subject: [PATCH v4 4/4] media: imagination: e5010: Enable autosuspend for runtime PM
Date: Mon, 31 Aug 2026 16:32:31 -0500
Message-ID: <20260831213231.2125544-5-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831213231.2125544-1-b-brnich@ti.com>
References: <20260831213231.2125544-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|LV0PR10MB997564:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f22d0db-249f-4845-a8c9-08df07a76d22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hZPcnKU9kFaIaN+OxXNMKL8158GZU3q6UZhu8aSajTmzoCGzTnW1DWhxU+0jqRB8Jp++AkaBy5bI9awAGqNj3l50DJEINOzdqPaOqg2WpbkU9tgOXhJs8YVxFbvFpZyW9g3bL2E3mWIQks3tgdN6Ib5/5PGxaTG8FwzBiBBbenTT5oGiGeiIedubPzrMIy/sR4no/q6W0s9KymLKojieMG+AMjWM+Fb4ATlY7D7jfMF+jUaYdeXc0JwURbE6j4dT/vaX4rO2mN5soOGau2y4x3xIpQQe1Vr+bKSLefURj6MX6iuL78fhyu4C+whVhqbeMsFm2pGcbX5NXloqZb2vKWOpE25in8DsqgaCd+tn01n71KSkduu/a5VyIvQnDxCc7K88NjOe0v/A2HVflbb6lXE681yyd29bvS1w6n1cywLI+1Osu5t4VTuw/L7o2Mgd0hyNuep9sqtyn9VEM/YwcplGW7n+MqrN9IH2eD6VbJmfMnRazjvz3vpsgM0u1J5ER4Qu1lUUXQh56zrwhnu1/qNOjAPfHgt/9JgItkuYox01XEcs8HUon7oFER4F0MZX+i3Nhcifb/F+MzbYRXXRDl+vHB0yKeoLH3Bi4iCyca/LXkTJ1EMwfJUvOCUy1P+J3dfmWvz4dVC1/RjdX5wLOGb1ZhPRDZpX3+/ofKJri+6z/ZxDQHIIxtinRch0EHcHiW8vEcJfRk5onjQBFtRh3g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UTG8RI0zgXZGSScHCY0d6tcHqHVC9PF5WRL/CF8+TZ1ztsebWgV958VKv+LPiRTynISoVTzrLx5LjXwBw87hGyQo7kCQv992S+4+F4/nqcN+pZ8uuBZm7pLh8V/yW3Q37qX5PZ1Yl8nlK720juN+ak8fAhRXCavGH4P1RMMcWuYTpFcp7274HqMRTuzsZLIBE9G5PRJds2ZX170TX7UXR7CDifAJHHM+hNjLPaeIFRQY/BbjCkRx0yT6HnzKEuKnI9p7NRqsZ9QoM1aTd8KD18HSF1a+Jf9kadYZ9NOXYLF/2xD07QFdd1rEY+dxUVMeDVmXnyMsIfpuYjy68SO1fvs0vhQaVXnNEA3eTbsxplJvhZ9ai6niYovhRewuRUMmIXjp2bRIudXmUlUQlqBYKAzUKVYZuYm9JSBQGPHqrWmOUiqiOx5TRXcbac+WAhA/
X-Exchange-RoutingPolicyChecked:
	O7WqQRIyJ1aNCf/OMpAqCWTAXS+sUwJCE8Fd1AI2nJHLx7kY9nnqH9qSjCGQKp8Yoknusj9Aye84wxcIk9dJCBgaDrWavmM5AhCyJTF6fvg9Iwu6/d211RFIpEmYV1THbUvZh1vpLxTh1N1RYSrcnpHBXwAPcqc9eTc25dN5nfY81J8Jd6qshI231GenyUzfeyY88ByC2n7mLmA5jrMdPRcRP9ucHKLrvrrArDenaRArwL57exROsCqbfh5mhbmoczzagnAkl07Pk8eIKc9/BlHErAH7tIzZwC7T5TcMOzcIkWGYE0AGnfHSid2tR/ddCpIRz4jbMXctg5g0nGrwcQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 21:32:58.0857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f22d0db-249f-4845-a8c9-08df07a76d22
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997564
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE4NiBTYWx0ZWRfX9Ui8j3pcYp4S
 UkoI6vpDJ0nfFKKtzpKkjypmopIFIQVCA+nrPHaHkEv7f2CdcGAODr59I43JiyVx6VVgPaomWgM
 tc598Za2mTYl0CQV945rVQuXvB92NIvNklkSuaowlCL0k072ek96SuJOBcR0bZOAZC0+SSQeXE2
 GT2Zi5kux72+pYXmOWllLoDlf/uAjTo9NRsUxguhG8PZzV5dy1Tq+RdMKZMcwz0Lq4p7N04iigz
 qU6xOLSBJv6DSlzVZVaKdTTHjr7p6u72tsdrpJ8owZ6AI5x7v1zRLgMx+cGy9I+xWu0xZi6j8cH
 eWBfS0P3Hj2b9O2+3g4j1Uek9fu255CjAEL5SJ1Gq0exT7oy/b2gQueHOYHiY84RHGEO9DgXUyc
 8wpfOPFH63R1QTc1oZBaoHXgg0Xf/YNva5jRRJj+7WYX0w6yTlwrbRS+5hM5U6w3nj63nF8nV16
 NlGD85/N247s8lY9S2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE4NiBTYWx0ZWRfX3Wog36Pk4nSv
 ZPzZcogbavQnSCq1Caj6oOVD2BsXpE9PqtuSa1FREqGjHdPyd5RvkSxf166M9Jqq0e2mu7nhQL6
 03tYGLt/DqgUTEkiZfPwCHq0OknM8tU=
X-Proofpoint-ORIG-GUID: weW5-ec-63AhF2ZHYNmomGddeYrJItdM
X-Proofpoint-GUID: weW5-ec-63AhF2ZHYNmomGddeYrJItdM
X-Authority-Analysis: v=2.4 cv=LrSiDHdc c=1 sm=1 tr=0 ts=6a95f30d cx=c_pps
 a=QmrQXVULtgJTkzLS4HxzTg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=Gi_RKHrbGS1op-ALBdMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310186

Current implementation only has one call to turn the device on -
start_streaming. This can waste power of device as the device can be in
STREAM_ON state, but no buffers are actually being submitted.

Need to set last_context_run to NULL in resume hook. This will trigger
QP value updates during next call to device_run.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../platform/imagination/e5010-jpeg-enc.c     | 41 ++++++++++---------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 488f5d7e4c9d5..79347014562bd 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -976,6 +976,7 @@ static irqreturn_t e5010_irq(int irq, void *data)
 
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
 	dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
+	pm_runtime_put_autosuspend(e5010->dev);
 
 job_unlock:
 	spin_unlock(&e5010->hw_lock);
@@ -1105,6 +1106,11 @@ static int e5010_probe(struct platform_device *pdev)
 		goto fail_after_video_register_device;
 	}
 
+	ret = e5010_init_device(e5010);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to init device\n");
+		goto fail_after_clock_enable;
+	}
 
 	ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
 	if (ret) {
@@ -1112,7 +1118,11 @@ static int e5010_probe(struct platform_device *pdev)
 		goto fail_after_clock_enable;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
 
 	v4l2_info(&e5010->v4l2_dev, "Device registered as /dev/video%d\n",
 		  e5010->vdev->num);
@@ -1299,31 +1309,13 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
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
@@ -1339,8 +1331,6 @@ static void e5010_stop_streaming(struct vb2_queue *q)
 	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
 		v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
 	}
-
-	pm_runtime_put_sync(ctx->e5010->dev);
 }
 
 static void e5010_device_run(void *priv)
@@ -1353,7 +1343,15 @@ static void e5010_device_run(void *priv)
 	unsigned long flags;
 	int num_planes = ctx->out_queue.fmt->num_planes;
 
+	ret = pm_runtime_resume_and_get(e5010->dev);
+	if (ret < 0) {
+		dev_err(e5010->dev, "Device failed to turn on\n");
+		v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
+		return;
+	}
+
 	spin_lock_irqsave(&e5010->hw_lock, flags);
+
 	s_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	WARN_ON(!s_vb);
 	d_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
@@ -1484,6 +1482,7 @@ static void e5010_device_run(void *priv)
 	e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
 
 no_ready_buf_err:
+	pm_runtime_put_autosuspend(e5010->dev);
 	if (s_vb) {
 		v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
 		v4l2_m2m_buf_done(s_vb, VB2_BUF_STATE_ERROR);
@@ -1518,6 +1517,8 @@ static int e5010_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	e5010->last_context_run = NULL;
+
 	return 0;
 }
 
-- 
2.43.0

