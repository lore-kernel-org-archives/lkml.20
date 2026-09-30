Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A965D519E13
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784479; cv=fail; b=or6M/p2P6MbxrFeGFWZtd+V2tf8ynjPdRRCj9H/UkdzW3D2vclbQHalx9o8qNBFAPpkqYbq1LJtMI6yHW2FOxQdpYnOsgz3QSiTVklOSbpdLQRZo4dp+RJ62kgHo5HcFRi+vvuY99Lk16sC/0yA3sd8kSS/YChIRL3Rc9mlF8ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784479; c=relaxed/simple;
	bh=bPJbMa0lxlVvykMcDG1ufvupBaqBlTAWd7JUOiF7HVc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ex1k4lKsWQTBfs2TCWSflqu7NWFSeEY7vGBUgTl2kTKVw0twAq4mAGqP2OH0cWg8a6Hccc9elWGaFW21IdJ9nxO7MzWUIEIRX/+XqojKMvWfuvJKH1gzRYwKT7du9bmkxz2i6IMUgYB3ZhTs4cp4L5Cy8v2W9WOXmkqlwndimeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=iCpJ4RIb; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=KYWMwlYB; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="iCpJ4RIb";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="KYWMwlYB"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1JNC3057439;
	Wed, 30 Sep 2026 11:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tR3FNCTnEELyokoaTcoD8mC8vFVY3sUUR1+17nscQ
	eE=; b=iCpJ4RIbfaLubVHlcs2mL7vqJsw4389PPkFZv29K6rDP/xKIGWPzWO87T
	QI8oyFk8ELSyc3yGX60/La/TWz0dNDuJY5ea7AZy8WgOn9CAD40yP19Ya21hmz+f
	07WHmRFe+2nKfKGT1cGd7TsvCUz0CCuMNkUVvJA7w2OCDMHDo13jgJYAX6LZiueD
	zauy138xat7uBrDEO5joYPpuLrI6E8mKIvs+G/Z6OVe0WDzo/s45vwLYe2YleUim
	rbbdRVRZLwp1+Q9BPQkD80KkBtlTuJLez05OGrif4KSP1QwfczmpXIUTtU1WGMx9
	p3dO7JanRfCX1ns+SBBnWNQIUBFyA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013017.outbound.protection.outlook.com [40.107.201.17])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fehxu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7F1f5hWOifC/zGgDZKWcEAPmFDeI7wKWRvWr2/P9g8Cya5vncR7oAz+ca1rAxuT6WZfztWBkNGP94XgIuT3cK1e/5OZQruRaT+xDl3xJuJmwJc9yfBYXDwtNJHVNOkbo2QZsPIolqTayul/uJdNTBONdOmKPqvQ9tUMRZCE9CPbVIV/RoTPoBWGjBQVOcnJaxOhfNjb0rJCLUkSMP5QcfsAam643iOjZWLTwAtZ8oJfFuuauGh5PR5kGVUd5VAoR8EfNB1JoO06MU30S2W3GkdYrGUCidQhN3wU7EeLGHV3/moDDSicOR5oIaKiPUz8g7b4VR3mnwDFiVntfd0XEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tR3FNCTnEELyokoaTcoD8mC8vFVY3sUUR1+17nscQeE=;
 b=etG/OO2JDA5l2fVNQxd4p2J665cFJWpL/eYSm0FvXtPMZooXomOrml72tJOAIvn0+QX3aVR2FiPxvPrQgza95k1qOfo5CH7pGSq5mkqUYGGQFa1yM4VivJCwnJNTCOiaHQ7Twp0p1sEFM6E3XzutQDTMTO5NCG+bDbMP5MFHDMdq+BgTz0V2wy6QOp0VZH9rXR9eBekCejD3RzxIRVhgEy/bIImYwj/AGhuSr0AaG7RyQZXAQ9y5qz5WKsp2wFod8KyKw7DTAq60liqOzjYTFOcgnJPOoihHPl9RphYxJg0puf94rD2c3rh5HP8HcWzttqub5HXrK3s79cmURA+hBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tR3FNCTnEELyokoaTcoD8mC8vFVY3sUUR1+17nscQeE=;
 b=KYWMwlYBicZy4qBiT9WOr7zvmMfbGlPLTDysIgRNWOAjwktKYzlysSy2TXdxFAtHUNrDTMtqEHnSDYBRaif/gwy+yN2qN+8lIVe4HT7oYe5wz5XE2U0yYLbwxd7bpM2iyAwsUVTrCMbb9WDtp9/JlLQrFyUTw1Fktu1JYHU2x/s=
Received: from BN9PR03CA0074.namprd03.prod.outlook.com (2603:10b6:408:fc::19)
 by MW4PR10MB6393.namprd10.prod.outlook.com (2603:10b6:303:1ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 30 Sep
 2026 16:07:20 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::4f) by BN9PR03CA0074.outlook.office365.com
 (2603:10b6:408:fc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 30 Sep 2026 16:07:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Wed, 30 Sep 2026 16:07:09 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:20 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:20 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68W63425232;
	Wed, 30 Sep 2026 11:06:18 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 03/22] firmware: ti_sci: Move check for ACK into ti_sci_do_xfer()
Date: Wed, 30 Sep 2026 21:35:48 +0530
Message-ID: <20260930160607.2674980-4-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|MW4PR10MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 576deacd-afb9-48c7-f3d3-08df1f0ce1e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|10067099003|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	RXNsz9PewesFakHgsql/fGHt9adodXOlBBR4L0noy+i6DeHVHwr9HHEaXHlU4Tdqi07gOxyawR3Dpq2GwSn5SOVIiUqj42hapaAHrsZZwiGHzIyZaZDwx6y4LAgbVr74R71z5XpbGWvSeieF2XodLsAFKVjiWPEtytLxMMfAwodLsd3XhbSbdD0qm8ZSCEFczzQI8Zx1ooDIx2BhNxmkXWsH+W/LEDkHXovTpisZ6t8YbUvsECP1AI4eJ0y7VOc9khq4J0aubjbEKfatb/ymVXMZBjL94GJbW0fVys/OXdgLF8xOt7LekT3QRDiQafzPcNqCs3mmfYH3WSfEd1UQrq+lHjwL4oEgP8a9fPwSTyfHSmdaX1v7MMlLCquHxleHw+vrkttHs3Vu5a8WLc3dcTyKpaTPHJOw6Om/OIZiwfCcNBagXH5CrOGf1ZXZoIy5tdSqyMF9wC7+AW4horj6yyoa7kCgRxIupF05BiOLh0eU5xIOgax8KXRVNDxb+wZRBKZDnCtpv7u2FerHbJkEXxgp2Ektdd/TV8W8aEOMNEdQpFnhk6Rcv348Rw2S5hsu+reItt8D0Q6A1JWrjbAq/cfxOIJUBHnay0b/Gu26mKv31Jn2Txq19Jgu6Bddnj8HWeL4+dbYYnn2JtqsyjwrqGe2TSmJDtu+7acIyDZJOa/oK+QLJuT9InotCQK+zfoqDdyf1NiZITubkapAidKQNQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BElnLdeXrbtbuKRgTarHYdhXtMfrF9q3SbNbP1ArWlUtwNawnvuSel74kUm0VmZ3P/B5E/ZhYqjDtCDfpW+0il0PHPcysJxqFsrElYXi/1hS5tYJYVya/4a2UmQ3IaG571RVKCUL4iVV7uI6cg9JcFKmxfTKIy3RmalZRxvMDklnurj4kUHRwdT40kXr+3GUp7I79rBUCoywp0HbMr5RmecXWTZVLzEruCdul5zKrwuxIcVEbIxqaqLhL8VSkTb80TSUL5N7W9u2J3SXOVHBo4JDt7F+42ZRHJU7MOW0O5dKsVRlg68BbkOHoTTq+vVo8o0QaHPSEZ2qzsFYahLjgrw84mpcFdTidAuwWwTGeN428S72R1jjkzgDbGlSnknvpOeEddH5sxmFKN0f8ASOGbufiUwlb3pMJoQtYWS4YPurLkFiUpPzpHrZltL0omNj
X-Exchange-RoutingPolicyChecked:
	3Svq6m6rnxZlKd8jROeMCHgCSf+0kWsUtqh1pcaTJ4tXRS/vKukADBpwom3d6SVNQxtKrRDdwGaVFN6Gycw+/p5EzOE5I83ncLpM1E8MUbiwXfkZFhAauqUXhf9W1tF1fqjMLNqsXO/FK64OzByS8ShWRpMfjwvmYmVsDkOXQ4wcCo5SbJRGjbAcuBkX4N1PfgAO7VvqP6JEXXdS9cp6qx5/ebLIpQQuy4NurM4I2zuUews0PGFU0DGNI6moqeAe9IjWCZww4Xxhl+XHDyVPDodPXZVvtsFHQceLr8I8nAxnGWfCEf6NH6WtcujLtWyCZbXwBc4cbRWk40LN/S+0GQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:09.8750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 576deacd-afb9-48c7-f3d3-08df1f0ce1e7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6393
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd33cb cx=c_pps
 a=XX75RHJXRTy/mnnqXKIK7Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=C4LaqBg6sCNJR2sbnPEA:9
X-Proofpoint-GUID: LTTFN2spns-YDXJBtkNHIZZL5EdN-pOT
X-Proofpoint-ORIG-GUID: LTTFN2spns-YDXJBtkNHIZZL5EdN-pOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX+ndfnZYRQ9UG
 W3lSv9y9A+xk2eq0HaM+UWdN8N6Ah6IWtidg6kFU6eBSLuR0gUmBZYrYGtCI/BMrKe2gYDnOdsF
 ZSpCty5JNFnGJknyrhXThZfhEMMnKdtrZWSvW2EElRaJT2a371ea6noYKMvvPbGym5E4MM2P2A5
 9YjYcF8zzwV89z0ft1ElszCyiZYr7ogQzpQeWQHNTgrCAY1Zbo6YSGXmgxbgxM9lRV1w+yxevkl
 YrWu6zkdMETzIXKSOuM0E9/g6KKAH59pK1eafsXI1L7WPO0e+xCekVPKZuTrInGGIA/lMD/ZmWk
 xCJIml1gukyqZuTkxMbdmgTRTuhwys+iRpYflH/5VFJmS+PeZvILbsA+bG/Sodhsax5fEr0mp9C
 KBjx5Rp4tp5jz4qt+66OHsS8wpZkzmG8VcaUsQre2jTqadMdzPuCwPG1ASW+as8/5GFDj7CXAc/
 4I0OhsUJe+slQCE0pcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX2UBH9sberSts
 UaahMbIhQ9wJJwvJlv3CXaiaIo4zN/EculyAliodjsCUpqSpOrp8GQGg4vF7wKkqNMMeI3uk96x
 br2tacCbefEd+jlELddXwjdgb1ZgAxc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

Move ti_sci_is_response_ack() function up so it can be used in
ti_sci_do_xfer(). As we know if a response is expected we can
check the response in one spot removing the need to check that
at every call site.

Note: This changes the error code returned on a NACK for the ring
config, PSI-L pair/unpair, and UDMAP TX/RX channel and RX flow config
helpers from -EINVAL to -ENODEV, making them consistent with all other
TI-SCI message helpers. The users of these helpers (k3-ringacc and
k3-udma) only check for a non-zero return and propagate it, so no
functional change.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-4-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 239 ++++++++++----------------------------
 1 file changed, 60 insertions(+), 179 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 3b58fee07c257..6ec16fe57f132 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -410,14 +410,28 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
 	up(&minfo->sem_xfer_count);
 }
 
+/**
+ * ti_sci_is_response_ack() - Generic ACK/NACK message checkup
+ * @r:	pointer to response buffer
+ *
+ * Return: true if the response was an ACK, else returns false.
+ */
+static inline bool ti_sci_is_response_ack(void *r)
+{
+	struct ti_sci_msg_hdr *hdr = r;
+
+	return hdr->flags & TI_SCI_FLAG_RESP_GENERIC_ACK ? true : false;
+}
+
 /**
  * ti_sci_do_xfer() - Do one transfer
  * @info:	Pointer to SCI entity information
  * @xfer:	Transfer to initiate and wait for response
  *
- * Return: -ETIMEDOUT in case of no response, if transmit error,
- *	   return corresponding error, else if all goes well,
- *	   return 0.
+ * Return: -ETIMEDOUT in case of no response, or
+ *         -ENODEV in case of a NACK response, or
+ *         corresponding error if transmit fails, or
+ *         return 0, if all goes well.
  */
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 				 struct ti_sci_xfer *xfer)
@@ -466,6 +480,18 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	 */
 	mbox_client_txdone(info->chan_tx, ret);
 
+	/*
+	 * If we expect a response and are not otherwise already in an error
+	 * state, then ensure that the response is an ACK
+	 */
+	if (response_expected && ret == 0) {
+		if (!ti_sci_is_response_ack(xfer->xfer_buf)) {
+			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
+				 (void *)_RET_IP_);
+			ret = -ENODEV;
+		}
+	}
+
 	return ret;
 }
 
@@ -509,19 +535,6 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	return ret;
 }
 
-/**
- * ti_sci_is_response_ack() - Generic ACK/NACK message checkup
- * @r:	pointer to response buffer
- *
- * Return: true if the response was an ACK, else returns false.
- */
-static inline bool ti_sci_is_response_ack(void *r)
-{
-	struct ti_sci_msg_hdr *hdr = r;
-
-	return hdr->flags & TI_SCI_FLAG_RESP_GENERIC_ACK ? true : false;
-}
-
 /**
  * ti_sci_set_device_state() - Set device state helper
  * @handle:	pointer to TI SCI handle
@@ -561,10 +574,6 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -616,10 +625,6 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 		goto fail;
 
 	resp = (struct ti_sci_msg_resp_get_device_state *)xfer->xfer_buf;
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-		goto fail;
-	}
 
 	if (clcnt)
 		*clcnt = resp->context_loss_count;
@@ -912,10 +917,6 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -987,10 +988,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -1050,11 +1047,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_state *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-		goto fail;
-	}
-
 	if (programmed_state)
 		*programmed_state = resp->programmed_state;
 	if (current_state)
@@ -1279,10 +1271,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -1337,14 +1325,10 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_parent *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else {
-		if (resp->parent_id < 255)
-			*parent_id = resp->parent_id;
-		else
-			*parent_id = resp->parent_id_32;
-	}
+	if (resp->parent_id < 255)
+		*parent_id = resp->parent_id;
+	else
+		*parent_id = resp->parent_id_32;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1401,14 +1385,10 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_num_parents *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else {
-		if (resp->num_parents < 255)
-			*num_parents = resp->num_parents;
-		else
-			*num_parents = resp->num_parents_32;
-	}
+	if (resp->num_parents < 255)
+		*num_parents = resp->num_parents;
+	else
+		*num_parents = resp->num_parents_32;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1477,10 +1457,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_query_clock_freq *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-	else
-		*match_freq = resp->freq_hz;
+	*match_freq = resp->freq_hz;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1545,10 +1522,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -1603,10 +1576,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_freq *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-	else
-		*freq = resp->freq_hz;
+	*freq = resp->freq_hz;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1658,15 +1628,9 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	req->debug_flags = debug_flags;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "Failed to prepare sleep\n");
 		goto fail;
-
-	if (msg_flags == TI_SCI_FLAG_REQ_ACK_ON_PROCESSED) {
-		resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-		if (!ti_sci_is_response_ack(resp)) {
-			dev_err(dev, "Failed to prepare sleep\n");
-			ret = -ENODEV;
-		}
 	}
 
 fail:
@@ -1711,17 +1675,13 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to get capabilities\n");
-		ret = -ENODEV;
 		goto fail;
 	}
 
+	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
+
 	if (fw_caps)
 		*fw_caps = resp->fw_caps;
 
@@ -1766,14 +1726,9 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to set IO isolation\n");
-		ret = -ENODEV;
+		goto fail;
 	}
 
 fail:
@@ -1817,17 +1772,13 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to get wake reason\n");
-		ret = -ENODEV;
 		goto fail;
 	}
 
+	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
+
 	if (source)
 		*source = resp->wake_source;
 	if (timestamp)
@@ -1880,14 +1831,9 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		ret = -ENODEV;
+		goto fail;
 	}
 
 fail:
@@ -1933,14 +1879,9 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		ret = -ENODEV;
+		goto fail;
 	}
 
 fail:
@@ -1975,11 +1916,6 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2013,13 +1949,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-	else
-		ret = 0;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2074,9 +2003,7 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_resource_range *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else if (!resp->range_num && !resp->range_num_sec) {
+	if (!resp->range_num && !resp->range_num_sec) {
 		/* Neither of the two resource range is valid */
 		ret = -ENODEV;
 	} else {
@@ -2193,10 +2120,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2514,9 +2437,6 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(dev, "RM_RA:config ring %u ret:%d\n", params->index, ret);
@@ -2564,9 +2484,6 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2614,9 +2531,6 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2682,9 +2596,6 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(dev, "TX_CH_CFG: chn %u ret:%u\n", params->index, ret);
@@ -2747,9 +2658,6 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(dev, "RX_CH_CFG: chn %u ret:%d\n", params->index, ret);
@@ -2815,9 +2723,6 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(info->dev, "RX_FL_CFG: %u ret:%d\n", params->flow_index, ret);
@@ -2860,10 +2765,6 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2906,10 +2807,6 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2956,10 +2853,6 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -3013,10 +2906,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -3065,10 +2954,6 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -3118,16 +3003,12 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_status *)xfer->tx_message.buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else {
-		*bv = (resp->bootvector_low & TI_SCI_ADDR_LOW_MASK) |
-		      (((u64)resp->bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
-		       TI_SCI_ADDR_HIGH_MASK);
-		*cfg_flags = resp->config_flags;
-		*ctrl_flags = resp->control_flags;
-		*sts_flags = resp->status_flags;
-	}
+	*bv = (resp->bootvector_low & TI_SCI_ADDR_LOW_MASK) |
+	      (((u64)resp->bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
+	       TI_SCI_ADDR_HIGH_MASK);
+	*cfg_flags = resp->config_flags;
+	*ctrl_flags = resp->control_flags;
+	*sts_flags = resp->status_flags;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-- 
2.34.1

