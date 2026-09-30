Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7F7519DFC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789456; cv=fail; b=kQqIldEydCejiojFAJvbQEpSX2ZbZYeZDK6E7b1Lc2yhL+7vwTgqwUqI+7txdI2tEKm4XJsnj1FfiQCXFMZbgGQ01Yc7h9E1jWsX9zgBnzirmFXPE4qmdhl8ROlPwLYANEUlrWzW23sTJctGN1NAJ+jmC4jpvr5YHUHv/5kGn0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789456; c=relaxed/simple;
	bh=zj0vpkm8TmNcQEC48WkJxLP4dfe/DIwTJQASC7l/BXE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OmzHBovSEHJvdJ6nu04ZiExsjiJca8gPF6WmkcVIp25bQD4r050N730rWMr/1wzCRbA6UWD6YvNNnYLxGYrJ/G3ExqQOxsjTbbcKB5vtXye6Io8I9iiXb+cEVi6kRueF/K+yiowdBeNOyfBYE0TGjeik6tXqqaCqyGtgIHxokSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=S+D5TQ7l; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=aRI4ZQKq; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="S+D5TQ7l";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="aRI4ZQKq"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1koe3890525;
	Wed, 30 Sep 2026 12:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZgD63RUNH4PkixGxlFu7MRFOcJnhUi1i4NwBHhGTK
	6g=; b=S+D5TQ7lypkZDElnkB6pHj0SuzVNPrEo6rvxDx4dbIOjkKPPF5whjcsRa
	HJ6252ETXhLLlat6nRrzMRhlKHWybk6jsufS+lDjqTUtPCrLlCOBNK+8UxvoOs/1
	N7TozTUV921C6YDzcSrHk+Cs2owOwVgEdG4TNHGQLXjgoWPFiFFOc5dvL8IlUdY9
	3iR2+0dgmMF1cyAitgXECTh+glRPzPEJsIOxwyiMe8CCn0wr7HnkhvHylkxYACAC
	qPHvuqRUDuWf5DI3J5vVdflzsZFeGyUTfSG/QTYrhyc8bZKxZwqAeN29woWXMJr5
	Hj0VZACwaNSibckBPsi/BfN09NSKA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010021.outbound.protection.outlook.com [40.93.198.21])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s22ff7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 12:30:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDIlWHO73N+SrDUIhNDE7KRntO1tpyiR8M7vzqvtACJpOQ0JuXu4XcnKjdA5qONKAAg5zRjq92pA5ECuMg1MzoenSs1LgvqLU6FGif+tmvF0R2sX/insPsw5uo+dloQSMhke4iEDSQNxYj0ChisaoiL0XHPzRd+bO7I8UUAXmH2Gdk0To4d4Ud5TtGkXzQl0rFyccI3C1s41qyq5/d9fV5Lm5A1MLY1aF35xbrrjFq7QDZ+13C1xZjrolkfCNJne6/UQHyjacM3EW/lxjC2Xkzu4ubcI72dkO8uXgwdlUEf9JwC/f1RyGnvxLIYSsu+itlz0qW1dX8Wa9eTuD2QRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgD63RUNH4PkixGxlFu7MRFOcJnhUi1i4NwBHhGTK6g=;
 b=yUvu9fFeH8ppXyypxMldJAspoNLBcYEfnpbWxwvezgBEh7HwYyYsI9icciGtRYNs/HtEUdGN7KhHcpyv9EyXGg5Dx3tC8rvVf6zPvonMAT7kutsxylUb1qB2aj0bmAfMXS1c8WFb7Z4gWEitiEJzhI59KPIPsrzUMKJ6xJdqge2n8P956Sl6RldCSKj+fCeRPGK12fzGXuuZg/cg6oIVN5JPkN9+jGYr0zAoOT3obW1guuMA94LLk2GMGckAZ2r+/cQJ8PD3p006DbUn9luoP7oR9Eal0kv0guXacsMmVDsTzbb/MZd5iX4S1SH60YXAwnGmexNoNO3DphV+H98prA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgD63RUNH4PkixGxlFu7MRFOcJnhUi1i4NwBHhGTK6g=;
 b=aRI4ZQKq+BTNh8MSnZSI3ehvV4BLaYTTzRWbFuNvI/INEqHjXQcudg6x7U/0mHIKbJElZdI5OleHgckUhL5wBRSqF+c75HG6fKXXsBdomB5d0tea5M0hqxwBVbrbkibtYAcPs+1W3E5N8eDE/k9Y2lPcrqDPm0kH9RKSc7Wg7uo=
Received: from BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::14)
 by SJ5PPF2C6461432.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::799) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 30 Sep
 2026 17:30:48 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::3d) by BY1P220CA0001.outlook.office365.com
 (2603:10b6:a03:59d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 17:30:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 17:30:45 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 12:30:21 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 12:30:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 12:30:21 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UHU1FR303419;
	Wed, 30 Sep 2026 12:30:19 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <nm@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>, <vigneshr@ti.com>
Subject: [PATCH 2/2] mailbox: ti-msgmgr: Add ti,tda54-main-secure-proxy support
Date: Wed, 30 Sep 2026 22:59:48 +0530
Message-ID: <20260930172948.2901336-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930172948.2901336-1-b-padhi@ti.com>
References: <20260930172948.2901336-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|SJ5PPF2C6461432:EE_
X-MS-Office365-Filtering-Correlation-Id: 398d0ae3-9762-44a9-f32d-08df1f188f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|18002099003|10067099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	mntGE76Vlz4y/BLjZrP9TQW12f23gnZPL7iZPG9SKP1Wiurdd3CJjFOriOJJjMGIGKlhZFWGbd0bV2OU0hMYLdbzho4Zx0z3UZz7MAq9KM7iO9HY+BGea43uic2oMde8KeryIzoiANpplxt018waDVoHU83uDMQYtzJZy7ripvKoJ5gSbgOe7fgN0DF9IiQmhplKsZqeN5AztACtYlNI8ANb0nm3QYijhR2f1u04K1LRXG8my4TF/77Aac6a5vqd+b8CUWw2tERcACCYQ4ujo3h4rWL52uG0SzrJ2WcS7KDR1UWtZhS+WP2kpijsuAbFCPnCBu9GESQ5+2suUvoWn0WWwglL68OTalmZT0pd049xq1zHFsMAnt2e6RoEBC1jZMB4Fpj+XS7avzSpENYROWOiKWM3Eyjc4WAocbVSdrMXQCks3QBIB+CKxHTRATDr+BLXcfSy50YxO8lS5WUKcxSJIdgezx+4U1d6dVmcvJLGk4jWHkg+JYo3rO1AWUpMvDomvmUPR1zEMdlx1koh+KsU/XJczabGXlbcG6NXzXuiGMY1ciuMG1imgH+p78vxPA2a/wsJZ2gujpi+fDds3VcX20W8j8lL+skSvaAZLGBVbK9pb/CyQzEu3IdPDIXbh1mVosVP/RZfjgA4bqMifm1Vw37nm32KzQWstDUcmSv6OdQRKBASZUzPM1pgECvyklNsJh5CmjJeSE5dXZ4r5w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(18002099003)(10067099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xEQHtaI/3LynJrF/pcS9yGrbQERuLDOCpIkTAU+xaBRKHkMAKQ5oUpprPB/QYl5EjNnw9O3Kp0z5pWCQmQ/fYBq5/vhZ0b2BVRpW77pIQwOqdNZvPWjiKS8rU2Wd0sBdPGsVZwny2qU6DIDlZxpXjN/hyfQDF058rYR39+DPW52YHyElM3eB/NdWfE7I04guJRoHlTSsfMYxKrQt+Apkk1mt8odUPJYUGiC2A6rmsRfsQPije+TSdxnVK5DcSLIzQmu48czvEMruilBT2TrZ6l7z7Shodg8AAnXsVOZDkQABmFZ++XWRcRhzMr6/k2ByklDVSFK/7dy9Pm/AlOlWimGi8+Q44s066fFUyDDLY0w8I2Ir2UJ54caseGOEw3ymxK9e+Ia+tcF2eqHgQO5O2Wrf/mxFnGwcuR/Zo09KubsEM18MC5twS15toekCHzJM
X-Exchange-RoutingPolicyChecked:
	ARw/BwsXQ/0x7Gaf8sofaQWMXL8FOvBGH7ec5JhyUH0Z323hRk7m4nY6nTNM/ywhnPK/pCx7DUibYP86V/bkEkC6zS4EBIgE8iX9XLJaW/QMPwtDEKljjj2Z/ENZR0WjGpnhUFITbNX+75TykWdVo/ABHAcrj8xqM7fDiQuHsrGRMp+/HvKN8pi2voLoK9/+WkYO3n6jjJLpGwXeHC3OUL5dCmT9jZvM4i9bGv8ztOMNbJaHGyIK0qdrRAz/7IHlaz2XFDXLB2UavNjLwP8FsrIXdl2tfTfT3ftPThariL2QPKBN0Y4GQTxllQq72I2EBLypZbfZbDucMHIkdY4Csg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:30:45.4818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 398d0ae3-9762-44a9-f32d-08df1f188f77
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2C6461432
X-Proofpoint-GUID: O1knbegxMY-wuOOehAVC4E8T180zYQSJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OSBTYWx0ZWRfX5pHlZARWYtRG
 Ko5Iue96uOJNnSNLmehVZXXIGve30JrygcBWs0Zk2gfChmXCG6bQyQ2guwGU03GS+hAg3/Gj+RA
 d1X+9e76g84qocWivVnUNRRTsx5Na25XfauMa5PnFVyHFRQR95FWKfju7gFTp7OxQ5vPYo2cTp6
 EkhHoO0RJqhFKvmFzLAVcMC+vR6txC6rKFvTqwsjEFSjqGSfdmprcAc1mDYLK5p9ebjD53A9/bO
 lEYpXXd8aUyrOsHxL5GfXyPtVptsAvzXtlfvFvr2WkOc7N7MaYqLYiHZPkm43/Y3TDlN+GdPm01
 SqgVWKDaisYEQgYZsP+w/7e7fcVhOmYI1uLsbfoSGGdVAbWgjHXTUmkEZozzxxUXkv1X/gmWgEs
 nA5yWx3hbWOy9MrfkYaw+Og0P40gx5f+Yv0+82uqHvp9o4avKL4Ov1Om5NLvFG28g28m/trM6Uo
 ilbN1yHLcwTHhN5UBnQ==
X-Proofpoint-ORIG-GUID: O1knbegxMY-wuOOehAVC4E8T180zYQSJ
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd474b cx=c_pps
 a=4YE3MzgntgO4dypjGrF/tw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=L7Wxq3lY63z9KYzOkIoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OSBTYWx0ZWRfX3PNa/B8WO5RC
 4OzItfEIk+5dvaB+HfHaux5PJP5OVxrMl2AzcGadwKzrfdmV1QiKuBniVS4URwbk0X95t6KWWpS
 8qc03psRi5TLMDZU3tj2Khxb0DjH9+M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300069

Add support for the TDA54 secure proxy mailbox controller integrated in
the MAIN voltage domain. This instance supports up to 444 threads with
60-byte messages per thread. Add the corresponding device data for the
ti,tda54-main-secure-proxy compatible.

While at it, update some internal variable types from u8 to u16 to hold
values up to 444.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/mailbox/ti-msgmgr.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
index 8eb8df8d95a4c..7ab0d07fe7a28 100644
--- a/drivers/mailbox/ti-msgmgr.c
+++ b/drivers/mailbox/ti-msgmgr.c
@@ -44,8 +44,8 @@
  * @is_tx:	Is this a receive path?
  */
 struct ti_msgmgr_valid_queue_desc {
-	u8 queue_id;
-	u8 proxy_id;
+	u16 queue_id;
+	u16 proxy_id;
 	bool is_tx;
 };
 
@@ -71,7 +71,7 @@ struct ti_msgmgr_valid_queue_desc {
  * for a specific compatible SoC is done.
  */
 struct ti_msgmgr_desc {
-	u8 queue_count;
+	u16 queue_count;
 	u8 max_message_size;
 	u8 max_messages;
 	u8 data_first_reg;
@@ -105,8 +105,8 @@ struct ti_msgmgr_desc {
  */
 struct ti_queue_inst {
 	char name[30];
-	u8 queue_id;
-	u8 proxy_id;
+	u16 queue_id;
+	u16 proxy_id;
 	int irq;
 	bool is_tx;
 	void __iomem *queue_buff_start;
@@ -138,7 +138,7 @@ struct ti_msgmgr_inst {
 	void __iomem *queue_proxy_region;
 	void __iomem *queue_state_debug_region;
 	void __iomem *queue_ctrl_region;
-	u8 num_valid_queues;
+	u16 num_valid_queues;
 	struct ti_queue_inst *qinsts;
 	struct mbox_controller mbox;
 	struct mbox_chan *chans;
@@ -466,7 +466,11 @@ static int ti_msgmgr_queue_rx_irq_req(struct device *dev,
 				      struct mbox_chan *chan)
 {
 	int ret = 0;
-	char of_rx_irq_name[7];
+	/*
+	 * To keep compiler happy about u16 proxy_id:
+	 * "rx_" + up to 5 digits of u16 id + NULL
+	 */
+	char of_rx_irq_name[9];
 	struct device_node *np;
 
 	snprintf(of_rx_irq_name, sizeof(of_rx_irq_name),
@@ -799,9 +803,24 @@ static const struct ti_msgmgr_desc am654_desc = {
 	.is_sproxy = true,
 };
 
+static const struct ti_msgmgr_desc tda54_main_desc = {
+	.queue_count = 444,
+	.num_valid_queues = 444,
+	.max_message_size = 60,
+	.data_region_name = "target_data",
+	.status_region_name = "rt",
+	.ctrl_region_name = "scfg",
+	.data_first_reg = 0,
+	.data_last_reg = 14,
+	.status_cnt_mask = SPROXY_THREAD_STATUS_COUNT_MASK,
+	.tx_polled = false,
+	.is_sproxy = true,
+};
+
 static const struct of_device_id ti_msgmgr_of_match[] = {
 	{.compatible = "ti,k2g-message-manager", .data = &k2g_desc},
 	{.compatible = "ti,am654-secure-proxy", .data = &am654_desc},
+	{.compatible = "ti,tda54-main-secure-proxy", .data = &tda54_main_desc},
 	{ /* Sentinel */ }
 };
 
-- 
2.34.1

