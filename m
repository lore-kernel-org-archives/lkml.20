Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592E9569F36
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713157; cv=fail; b=Yp61UJTs6agDW5Op0zrG0H7eKGVZBPPbnooePAiphhw8sBwqJOyOSndfePvKGyKFn9xglk64pFyJIsb/2NrwSb7Q3O24/0uRvWUtQHk93Noisj9Yo57xsH659jzKegEMcySu+nPXPNtw3MZTBVL8rEX+clY/9/EWviN2IJnPkuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713157; c=relaxed/simple;
	bh=fErUWMLnXGdQgK+SatElg+aYdgi13XaJdEYc0paQyUI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j0XElz/f32NojOO44V8GFet+8NDnm39ESmcAuEzo9C30KsTQhlob1YQ34VSM+mCjHYEfQjwvehcavknPum2qQW3EiWOj6wjyy6EvrwckHuhejVgZHrPQEC9dkpLNmzrYFKMrB1jwer6Pm2RrUDdui3URxdYF/b08Z0VDw0D75bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=is56X5Ot; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=UEwtfUDj; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="is56X5Ot";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="UEwtfUDj"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFgImj807515;
	Tue, 29 Sep 2026 15:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3VmE9j0ObL+4j2ZpLrDWPKG7klGR2jGtRH0ob1kOS
	/s=; b=is56X5Ot+TXmdzMFw5xBaTwZYTo9tqN1F7T06dvJdo7DWs41QqslbkHLj
	ZzAJx8WHSeehlGaaZ2j2TioLOabYvym5/QhX+9sxmqxKdCXsL5RwVE4xw8m0Qu1w
	0t5wIYJpBCyV0gLkZLr49lUR5fGD8Elk1WLeDHF8Q29foyJy40bstv4TuNTnxfHw
	HuoyjfX+gReOxMyI2N7QMucEYEGG8SBew5qZa0HiAtq/p8wXClQXWhhEWYVk6OIN
	5pfMwc3jXUlBEXXV+8k6IZ1E/NXpLszNqmXuBOLndhHJ5d/JjL70ZMaG7ZHXSnle
	Pqf4moFRQ/Y8bEn7bBb20SoELioaw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j6ej16-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNekeUPtVmrw07Kax2q6RDuSDsreLLvmPnWDrsFh2EJsDUrcHSyohrhNkiK56sAmSrNc1a8L2vF9NZqJxm+4QyQdF8wJy2S+ylp0EomQLOOgzXrS59OHNrLXBPwDP8s6G2eBNWiWYvCDt2nEiqJ5LFSP4/Slo64FNY8w/UlWfrPbe+ywLxlnlFmSaibhHsogV+5f348gbr5o3JvHl7Tjh7ldZ7Hi6oQGJosORrq3Aq8mTOdtmWsFP6F2ALkqWLmqzJP7rhnlmGZBuScKh3EPQPDCcJnjStXivTzWjvFioeaK8TEenkcVzxmkcjqS9IY8dMly2LCdeWtrBupBUc/IjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VmE9j0ObL+4j2ZpLrDWPKG7klGR2jGtRH0ob1kOS/s=;
 b=jUFcd85JjjusgndZrKjQ5EwbwCaZjRjPrWA+udNO1zHpJ92+vIFdJjaihiIk/hFVCxjXl6Nppix5G20X2fkM56zADog9jmIrqBGJJ2U8vWylcnDWrDcl2CoTIjFef787r/7xQH47XsOiude58lYbdBkoCkFw99uvrvyi2MbJ5T2kWikG7VjS2yQOarPxzlbnQJ1cOrNi1C06ZJQt4GkHa5Yp5phBbLwfDw59OOLkwSnm0Kep3rSXUKRlDsdJ0TeN+OGgalQU3qWZzB5KO5Gp3nRAp63DBbDUFtB28BBuGLCBJHmO/vdGzy2uD1AtTjfd8UjX0ydccBLg4mlpJg/8xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VmE9j0ObL+4j2ZpLrDWPKG7klGR2jGtRH0ob1kOS/s=;
 b=UEwtfUDjxjKmNeFyXmo6bmv6xI35Ph4yHh6nZtTvdfxFkwjeR23WceNUIq/uuHMjs0gYSaLtW84Yls4UD7E/jrEOk9hzOX07zuH9x0hIKsJ1HrtEKx2BqA0h3zWCnu2BoRaH2hwSiSrqcP3fWK0Smb0KmNohCn1R+h5teMfDsWs=
Received: from CH2PR03CA0004.namprd03.prod.outlook.com (2603:10b6:610:59::14)
 by SJ5PPF3BE5F3DF6.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::79b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 20:18:48 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::79) by CH2PR03CA0004.outlook.office365.com
 (2603:10b6:610:59::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 20:18:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:48 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:34 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:33 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMm1688208;
	Tue, 29 Sep 2026 15:18:31 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 14/22] firmware: ti_sci: Do not export reboot control
Date: Wed, 30 Sep 2026 01:47:38 +0530
Message-ID: <20260929201746.4078803-15-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|SJ5PPF3BE5F3DF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f76f87a-6d8f-4b56-c5de-08df1e66df04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	R2ocNBKgKYRrbfhL2GVV2uOTbafhxK/u0i6VJC2+/ZwnFXM6rhhkvKLeFZcQAiok8m42WaDGhakErUTItrC6k3BEhoDrdaZnh1OIs2FNbG4xw7WLbnbjHmszZkQHbhFTTNRcO4y0bav/bUQK0Mo8StgZjfvPLY4kUKyy1wxtu+Khbt3kCIkAzSvv/SJEUc11OtxbU2p8TJ94RTuJOjRSWYYqCR+zLa7q2+9T6ZtQuJP1A8uuchs6VI81yt8BNWTTX0GxFwFmd0R6lBxtCp1vdY296ZF3UeT+x6YHZZ7cZ4qX0FYQffr4kF7r1fwZEBUyT2IipWRihSBXcy3+qc0jzG3zVFWwHWA75dD3w5XuUK8NbHJL84A5GZgvczfo/hpBHh5RON3nnV37j+PbSl0ldgJ4c8p/02GTg0+G488qkplqcRf5wtoJbpqLj5kelzgLgtrAoCBhKNYO9Py05xbYA9wxbRTM9EwNqRKORYFiCc79srarAy51EHjDRzKIAteCNR7glw88tVsNcG8yA9g1urmboL/kUdCoN2BLIu46TO3MZQA82Nut1/5HvEOrsIQahchQjLlpT2t+FFvMmIN0O/SpwIitYrN9CtSRLFtlWDmPd+CyvqPO0gVYGNpFkIk6RYepBW0lgYBXclf4dh1UD70lE7VnHRjEIlR7MBcAj6EEFS/2PPFXACkYRSILqZhG1f3VJWB7bd/ZwRfm9C3DiA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vmMr5FhTW6MCBGQLIwcC1QWEoeEyaHrtqdVSadWe36aCqqFeeorEesw3l+pgM+4gpBkrdSTwqw7gB8h75Q41sC64i9ilnY7f6PExy/e/HtVAm8o/HEBa1x9ntzRdJ7lWGp2hHc29aOnR/lI5KkIW4WPcqOdeZiKKx1TNh+eiiBwxNEPndBPR/XzMUihT/abPgo/zIOCTpD934Vt9exBCWa4r9y6YjImzYd1vobkYQDQ330v28xWf4Nnkfru1x2Yv8Bs8xob8ENU28r7YQhzKIr8Shey9yFzFAPDQtbZBr64DQddRffB8vqTwUeVbF1I2pTbV1gAhUKS0XWBgGb5wONIqBP2yJ2lLKoYApDTbppLw8p33NNi81rOx6CG16U1NjSD9+MFkNG2C/Ek8yoQ+G0Ns0bcnSoh/anwCBYNlFnLXMM5yJYUGri1CuOAb8qMq
X-Exchange-RoutingPolicyChecked:
	v9DI284fSZb6bzT90/YcawZxexXac1uH9p5akiur/ubqa0aCMKwRnhxunI8aI5BkZmCG2x65whYwshVm9LADbAHwt91i64tFa4YN4uMyv7kmCVYF9L/Qe5vHt81cX3diVH+goG6jNAgpDGigoQd4wHpEDqWIc9fev+C+44BU4ge25smBnZdXEp2I1Nq0iWnF/t8nujTfL6mJbYzP2ILI6Rt5mJgrRtYOmabycRUs1P8Cl2afYvo8qesOA4Zdme3lKC4sVXkFAEzY1lLSDobipxkQXGocU7pH5hLUaDoDXMtcQOG41AU4OhgeAskQ7YSPMaLbfDeZK1snCgM0DRDq2Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:48.5903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f76f87a-6d8f-4b56-c5de-08df1e66df04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3BE5F3DF6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX2M+EakuT6kiZ
 1i45E1uQDadIgE+6rUt0Qmvl/mc4FTVJiBDKBrR3tZixp6JgTSYwBDQU/zbtciwh7cGuYUQfTRO
 gJ2Hq0oyQ+eXtTSwxnwlor4fnGL6cag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX1KSl/kLtKyNu
 hF6cbwa5QMatg8AH+5GO4wiyxVkTkT3VRqtGKKVwZLkxfhh0s/rtm819lk6iM3ywApP1ykE95Qo
 IGFNngU0YkJz9ZZkEHw4jgEgpSXVj9pzVq7NN/zWHwD8wSqNLgzKN5LJPPoD3Yrk5fBE2DK1osV
 99Zndc+t12j4+aqkHoyZuMTHmgqrMV+g2lels6u3luiI3eOx+/AggZyrqqXyESnU6RmQZzzaj+5
 4bMSCrFZlYODmeoyx2PRb8dSPvYt7ApTWPH5ClHiZzYrpEVde7KP/zKM4LCpAPw3kGVOdkjv8li
 CM2KDn/H1DOHMq9BgFdb+gAcNWR0jWIssVBd7bZ3uib9peMzqddUeys+4AT/ZLlVmfu4JkRdFIG
 q3t1CNdVcsy9Av7nfrLK2S8KaUqAMWD1KhHH3RE5PXJFoRi/4Mph2441uSADEr6vzPb4JIbBvxn
 9tQXyuStQo3i0VCik6Q==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abc1d2f cx=c_pps
 a=lq01mLAL2wBNHDG9j+U+0g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=4y9GCjRDMv2ZYqE5liQA:9
X-Proofpoint-GUID: wZyM1mR3WzyWEXjXfFMq5Gnpi64pJzqt
X-Proofpoint-ORIG-GUID: wZyM1mR3WzyWEXjXfFMq5Gnpi64pJzqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

This function is only to be used by the TI-SCI driver itself through
its registered restart handler, exporting this control to any TI-SCI
consumer is not needed nor probably a good idea.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.c              |  3 ---
 include/linux/soc/ti/ti_sci_protocol.h | 12 ------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index fef7028d40e39..d22686f9346ea 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2567,7 +2567,6 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 static void ti_sci_setup_ops(struct ti_sci_info *info)
 {
 	struct ti_sci_ops *ops = &info->handle.ops;
-	struct ti_sci_core_ops *core_ops = &ops->core_ops;
 	struct ti_sci_dev_ops *dops = &ops->dev_ops;
 	struct ti_sci_clk_ops *cops = &ops->clk_ops;
 	struct ti_sci_pm_ops *pmops = &ops->pm_ops;
@@ -2578,8 +2577,6 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	struct ti_sci_rm_udmap_ops *udmap_ops = &ops->rm_udmap_ops;
 	struct ti_sci_proc_ops *pops = &ops->proc_ops;
 
-	core_ops->reboot_device = ti_sci_cmd_core_reboot;
-
 	dops->get_device = ti_sci_cmd_get_device;
 	dops->get_device_exclusive = ti_sci_cmd_get_device_exclusive;
 	dops->idle_device = ti_sci_cmd_idle_device;
diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index 471f5580787cf..d8efddc1d4ca4 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -27,16 +27,6 @@ struct ti_sci_version_info {
 
 struct ti_sci_handle;
 
-/**
- * struct ti_sci_core_ops - SoC Core Operations
- * @reboot_device: Reboot the SoC
- *		Returns 0 for successful request(ideally should never return),
- *		else returns corresponding error value.
- */
-struct ti_sci_core_ops {
-	int (*reboot_device)(const struct ti_sci_handle *handle);
-};
-
 /**
  * struct ti_sci_dev_ops - Device control operations
  * @get_device: Command to request for device managed by TISCI
@@ -905,7 +895,6 @@ struct ti_sci_proc_ops {
 
 /**
  * struct ti_sci_ops - Function support for TI SCI
- * @core_ops:	SoC core operations
  * @dev_ops:	Device specific operations
  * @clk_ops:	Clock specific operations
  * @pm_ops:	Low Power Mode (LPM) control operations
@@ -917,7 +906,6 @@ struct ti_sci_proc_ops {
  * @proc_ops:	Processor Control specific operations
  */
 struct ti_sci_ops {
-	struct ti_sci_core_ops core_ops;
 	struct ti_sci_dev_ops dev_ops;
 	struct ti_sci_clk_ops clk_ops;
 	struct ti_sci_pm_ops pm_ops;
-- 
2.34.1

