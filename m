Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F853B71B2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712160; cv=fail; b=mhK7IPLBpjXckL86L9bH7/tg6d0eYyMqBDZOILuJjneb3el13inpej0JPf/WKnzWtL7EB/BsTRZEdjYjoJutPQFV1mCSbO+27KR5PXvLBUBPVSUF7ikXwOCVrXcWwQaxeKP0huNGWs+euHkYGSYQfrqnp9GSTwIDQor2NaY6g6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712160; c=relaxed/simple;
	bh=+DohWHYoqU2mcD99wh1R9vGEhW5IgWjnFfUzXbM6qEc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UxPr1eR38rXm8hH33KFaw//kiD3HDAdyPnrkUZd3IfT+YxChoZyHpV7AN7tN9GWZqr3G+9JlRgpUvhxQ0BcjXrhRyO6XAxT7NGhL1aFBrclJD5hS+cWLrYMfH3UkAgmHOsLQvl3NsWVuu8yPTx+kBwAR/ebiKiduIex234MM/P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MKIgRbxK; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=QqUt/7S0; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MKIgRbxK";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="QqUt/7S0"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFoRaw807529;
	Tue, 29 Sep 2026 15:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=aOgQZf4R34mS0
	13YE6RJ6iV5HfAFBM5XcTHc7WOHxJM=; b=MKIgRbxKkeSNhizAB7T/bX5k9lurN
	ehf/eNze7c+r8fw41wEMQUWpVZ3xRFSKP3kdUw9wCrQ5GkjpkBDRIrjnYUFYigIP
	lQZTmXIt3XdLeBBksNmiL08f4ZjSOyxsl4n2hi7excIFqfAtd6jRnsUdO7RO5abV
	5Ht+eZqQswDvXDptr3b/Fko6f+CRpr/pFHYiSODncxWKXkEK3uQZjkOzMTMkrCio
	48OezHomyr1p9eNmp5ZjuFemNAUDcgwcTGoki6j7+hFfRuJohwKXQ+fJxEAafnXr
	PRM4uwPsCUTiOfIvzT7g+4E1Ek8qZAq1GZf5N7fzHCuvU6wpTnEP7Frcg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012002.outbound.protection.outlook.com [40.107.200.2])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j6ef71-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:02:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ai38amR7ytIzTaU57Xjt0x++UvjDtmOQx1wmD3r6jto2iCaZzStdcCpsHeZ7xQsJZ96RqT7yN9qlk0cSoTpT5syN7zb9bk4opKqruOLYT9CMbtfV7V4wKPprtvEwspWjfggSi6cXQeWitw1weSS4PyXQDua7M3q2R7872qHPShpTSO2ny/YLpW/HHQdOemeYPGu0lDyaeNV1TlkE7fu2k7ML61z8pz5xxzce/R8he7lH5iefrLKdWg4o9EvyOT9LrcGI/3Y114JAh3mAdzs03JJVvfMkS8UPVLoRSKjMhU81GLVTGoSUsED9KO+JqZMlszNRB3khEKL4tgMRo/PQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOgQZf4R34mS013YE6RJ6iV5HfAFBM5XcTHc7WOHxJM=;
 b=uuy8nYeHvN2dYXK1ORb7jGqGdmS8aTIV2k7gXjzKDZMWXlfKmDJD8kNCkfvAokOk347SRETxm41Q6BXeOwAM2Z3XAzvnokbnDvNLtGBulrAZlEAgq40jXr0tDjITRNbT6X+zmRdkAHg3d/muEh/VLjdaRM6KOzyCuBAcmr/UaVP+7g0n6lWNtZovi35R1smZCC9yXe48bO6vOUsigO4E8ur7u1D6PG5qj3k+51FdzTZaAYtDsV0UdIVKUGohwIJdfmVIDVGGQ5DXxaZUTT8QwswAG+KDsOQe3qRaY1o9MYz1xDTghgSUkQ8wpl7Nv0zU7ZnVdqNSqyzkocijoiCiGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOgQZf4R34mS013YE6RJ6iV5HfAFBM5XcTHc7WOHxJM=;
 b=QqUt/7S0X7UiIY+hchNmZGCKdfPBwYZUhWjiiPbSBjvK+0eIFWNFw4x0D9zVf5McNDIGigdAxg2noK5/J5j3ONQ0OiXZVVay18NkSpKGbLC8T3l25GiY6meOYr4zQjsErTLMhswIjBDpzVuFpmz77W33VHKmn2yvk84LO1Brj0U=
Received: from CH5PR05CA0016.namprd05.prod.outlook.com (2603:10b6:610:1f0::21)
 by SA3PR10MB7043.namprd10.prod.outlook.com (2603:10b6:806:313::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 29 Sep
 2026 20:02:27 +0000
Received: from BN2PEPF0000A804.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::42) by CH5PR05CA0016.outlook.office365.com
 (2603:10b6:610:1f0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 20:02:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000A804.mail.protection.outlook.com (10.167.245.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:02:26 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:02:02 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:02:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:02:02 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TK1xGf1665878;
	Tue, 29 Sep 2026 15:02:00 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <b-padhi@ti.com>
Subject: [PATCH 0/2] mailbox: ti-msgmgr: Fixes for polled rx and trailing bytes
Date: Wed, 30 Sep 2026 01:31:57 +0530
Message-ID: <20260929200159.4033010-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A804:EE_|SA3PR10MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: fb41cec6-b0c9-41a0-7ff3-08df1e6495c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Kwd55/mH7qEKQxsgE8KL58jQC3mYxcEl/wrbtBw85U+iEQIE4iPqAh3toKa+nM0m4wy/4fcTs3m6sUbZlqmxj6Pvu9TsaEHrJ02YhVK3A1ohg0hRrb0pmN86xlwx3RBu37VicSqLquwErWy4D5lbiwbIxtM9yGTjC1IfZwVjebMYtMnLxayeiHm/5/6n7/tp/h5n2Nw9nYKdPY2EsdMkfaQ+2J2es/e/u5c664GSDITXJOPPx+qTMoqTWMGFt6I5lA0hm4+qm8hid5eVtiqJI+XrVZiUFf3IWJlYBiPOPvohKqB85P1e69siPzueZ8Gqk5+iAA0LxFdY+mEVM5gn9ZIJ0ZKyRjgy6XKx/ykoJMLACB3Huwg0HxBv5vFYMxCBDcm4VNNArvsVI5/C29mV9J893t/7QN+0S8KXI0fZ2jFccO6IJIPdChZcpvRmjOpY8T9LqzOB5rNYtsV29wURRI7K7BCot3KkJN19I5hmNRagmAzJ/T8gyiHp0xSxTEb3zN1ODV8q8g2NAPUbUpXudYqukWvgxZKSCJCDtGHuHEWnWfZXnO2LbXJS5tnSilcvm7CPjF4qcC2C5zP5WTzmPzv5mrn9AynuUNv3BzVlcR+uMJWsNfOXMA6cNURPykOPwSkY0ufuE7nPDPYsMKP4eT35yRuU4vSKzVG6JTSf6YNHz92U6kLRmm+bmgdTKedrb0aQ4eWUmkJ3flD43GWi8g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nggLlAtgGWuMz/m8FE+LKhZZZEQgfTSkGSu9z5duLSxbd4orXiXvXuiwo/KvaAh3S2hB90/oic4aOKFuSZsnRi1dAGKOYAjd3ojOVJDTK5rG1mtdisAl+S0xyMVYe9o/0RFpnfrqcF9BwCrBru0lM+HDkfsdgBfdx/D0zE1zJ0L4V8qUB+56LhD829BeBAG+fpHfaxGcNI03u9y83Lf+rxD2NYN2iW50afmbZiqNF3PVxX4m6SrRu55Shjel5A7JutWNja4gOMCgQufXrV8qv1iam8fEJDa+HI/67xX6bfyhQTxznTGrjAcRAhkHpYoYCj1PehFC5P9HJPBb6jhqEhlSQTnfodhMRqDgwcvOi4VHLRaPoI3MbVV7+yIqCt0kkvevHuLbUnnqOOVjs1jEaQ2uj9YLuXmcAEEPSBAuTQdbt4C3Towh34I0Pfj+3Aa+
X-Exchange-RoutingPolicyChecked:
	yPgEDEPjzwIZdLsfXk1YQYIf3wllQPMOqZ+Qp9C7sW8m6y1XxtomtcWUaVyXXC+S2ZqlP7qRY7QVh1fBmG0JIbPSpNcvYFW6Mmzc+JLm9fnNB98Z5d4LVZOLs+8SCWwrADvq8nXLPI56GhjGqmmyJu9UCf+7esX8L6VWa1axeMf5ubsbC7Zcb5lqsXygnZUKX0aYD/+6sSC4J2d6dJIbU3WifmwVteXJmPVqTvijbo2FMPmmFM1uCrzE7DECB0++7ZtQY4lAn1byoFE57mIElacINTmvQJ2LNkMna4/fR+mFUloEBFr75wBA9vflxEfgmOXz/j3BpwCVg5281jS6fQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:02:26.7112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb41cec6-b0c9-41a0-7ff3-08df1e6495c5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A804.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7043
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA3OSBTYWx0ZWRfX9qdlb2xbAq6x
 FOCjFvxlwf0oSBMaFbf7SCJTkyx6ftfKawX0sA++cO9fvXRyofqj0owcunHEGznCfmmCp4HT/ek
 ueWmerp9YuEqtCzPKAPc2Aozyi8xYbA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3OSBTYWx0ZWRfX4s0K2bx1BSni
 TuqfCSsafA5tJHhXCqLRtm5FvD3RH1dwe7HRws5WRLQ4RQkB52ayyESJ4epL8fY6K1XifuU+gj7
 /Ms8QoALQg0lMHiAkR1GhLAKsHhK7cqHmYv/A3g3JVH74IDERw09xG4dB0RJIanR2MSL7Reg7RD
 OzB97mXV6p8p4Ps9UvNgpuBLarffYuNmn7Bo7aiPDV3y1zXjq8k8ETUxqAasOAG+qQL3pVd8Pev
 7czS1OBqjuoJynAiM1y61dykC6az6pMMoY/JUa1C/dywbZRfru91w0RmgOwVu0kN1BB/B47qGiZ
 Y6Hnp7Ty6HfjzltleQ3HhHzYbLy0r9HP9iDDC1bvIMu7y+r1jE4rKraVphC0oBTxgjhRfa5DmrX
 Grt0QYC8yc76tR5VwaAkC6mucTnZYEdov3N67l/1oUoTwryIQsC7Ex+GolkhJh8Q/28oDcSpzoJ
 HaI0ArGqI/pgGMV5z3A==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abc195d cx=c_pps
 a=fjiyZBo1bxGOeg3e+tCWfg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=YgXEIQ1LDJi3hft-ifoA:9
X-Proofpoint-GUID: GUqyLck4CytEleK73T2mfUXYqKB4Fgwu
X-Proofpoint-ORIG-GUID: GUqyLck4CytEleK73T2mfUXYqKB4Fgwu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290079

This series fixes two issues in ti_msgmgr_send_data(), found while
refactoring the ti-msgmgr mbox client (TI-SCI).

Patch 1 fixes a duplicate message transmission in polled rx mode.
Patch 2 stops reading past the end of the message buffer when the
message length is not a multiple of 4. This is a preparatory patch for
when the mbox client can send data which is not a multiple of 4.

This series is independent and can be applied directly.

Testing Done:
 - Boot tested on TI K3 J784S4 EVM.
 - Tested that these patches do not introduce any new warning or error.

Thanks,
Beleswar

Beleswar Padhi (2):
  mailbox: ti-msgmgr: Do not report rx poll timeout as a send failure
  mailbox: ti-msgmgr: Read exact number of trailing message bytes

 drivers/mailbox/ti-msgmgr.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

-- 
2.34.1

