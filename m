Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8556E4F85D1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779151; cv=fail; b=OGtteV30ts1LKTWsxTFVNelPMWvLx9nnFf+iFFa5WemktU0lqo+3iX2t9yVfmYtQWKYpoxGyWrtNuqrtaLBP8ZslNrxPdp0WUwtMgrvc4A/jXnMSdg33V9NYUnL673MD3Ebc9QUkYhBsKs7Dep2C/DVVknQ4F3LQCR8B6epiBdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779151; c=relaxed/simple;
	bh=kjJViTX0UusBGOympU4ZCW4GjjOM+fRPSYsoleznX+0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QtnEx4yxJu5dbJfaEH12L6cr19veXkWPqHrK6n0N45hAQh7ygm2OfyFiD4g0YUSiGBw1d/BM7eKI49UT2eJVZMxoCBwAirkXQSl3U0qdZWsWpKo3JfbCgVXcySimLy2GSuYbgeb9Z4FoXbmxGVX3sEMsjrXsJiGIUKkO/hP8uvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UkRGPgG/; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=ZbcA4evU; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UkRGPgG/";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="ZbcA4evU"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1LMp3057461;
	Wed, 30 Sep 2026 09:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/+Xv2qXRjDQL4Rh56cmpWtlqQ3egjeIjchTK8UtvA
	9A=; b=UkRGPgG/ENqZJeq6ihisdBtkVcYClBK48lK7hrjWC70DlXYJzyR0fyik2
	y5NAnQc9XdE47cz1Cc8vdRSU1pRo8MGYKlvcB7hsfUV0mm6QCta2PRuTeqjKOOWp
	HGyqbsLyNe5KE2YtmYvzFF0MboYbf91triUN9S4pQv/XZ4YCjS+xu4SEfFEWWvgy
	3xXPFdZICkWohqtROw3Mb3w+kBgRMrkl+a/gGLHGWhlmb/NCK3Fl1H5iUmLitlL9
	fNrp3zJmVgE+Skzd1UUVtp0L6cqVFD4yAVArF4RT2HMaJC5mLjYXxc6ewPL+rng/
	PO/JLE9ZN7x3xmV5zctWJgtr3banQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fe12p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 09:39:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyT8V+YzGQG62IrR7SLjKYv1icHtAwdTRnvw80FFon7jgiYpOHL5kY9Hrs9y0rLIgmYwXkvSXVs5MIaKiMSQY2hVFHk6VD/D1dHvXSOTfCXDLypPNgCfS/Drxd5ffeRGJ/g5X1Y0fKcsZXKWV7bZyuZf/aBMtK39GygYV2ZqJJSEn2Fg3Pyw0Oc1HR9zbVvpKucyqIUFjaN8LYrqshTZCsecMd0Vkq1aExWhq1fDcasJg65mPIZ9SvYeD61EMvPWWNHzfam9Om9jXA3WtAtg5Kzq5PQgn8GFfRCkMkNZp7fIOsvw2GTB2hVDX60MJUF/CbQ49cNW6eMIl1vUz4HIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+Xv2qXRjDQL4Rh56cmpWtlqQ3egjeIjchTK8UtvA9A=;
 b=rhAeKkGtlZ4bzoQQluU8D9VpCCFcP8fMrYF9ym5xSLkfWvtX4Z2TWVHwxT6xLZx+BGYYPxkOTphKg32yo+3MLN9kiQdsHR5T7le+29T8gQhZRT8tPuhQohF6asMbS1YLdjYGlZfjd7nZgNLZL4UgMhAkWPl0zsi9TWzGNlao+tmdwkgSUtZ2aHENxPckP+juLRJU+mQGzL95+f3FM5GEU1n/cxU3rMy9FDCc5174Kzz+dUuyso7iOXO2ROQRY5dPQkN5rLHZ7sljmo14JMrYBnMye5cWdfogbfMDPl96SmMjlUayFhrBRNXUzSWx6ETBqaNPM1fyh9JSD3WhWSmx6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+Xv2qXRjDQL4Rh56cmpWtlqQ3egjeIjchTK8UtvA9A=;
 b=ZbcA4evUk4M+MbjjQNbpqRYetO3H3IWyLT7qQdPmlKVqn9w4+K9ph1LIEExo4/Nw5tOv8SBDYTrDEqk46lQnm5Ozq5ST/JR6tmnw7Gg3U0ukpcQz/0Qw3oqLy+TWvrdRPzL+je14LazL6mso38Ww8QEGFXtHJ8Q0HTgOwlqH5f0=
Received: from PH8PR21CA0001.namprd21.prod.outlook.com (2603:10b6:510:2ce::25)
 by MN2PR10MB4301.namprd10.prod.outlook.com (2603:10b6:208:1d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 14:38:58 +0000
Received: from BY1PEPF00026966.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::89) by PH8PR21CA0001.outlook.office365.com
 (2603:10b6:510:2ce::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 30
 Sep 2026 14:38:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF00026966.mail.protection.outlook.com (10.167.244.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:38:56 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:38:16 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:38:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 09:38:16 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UEcAmT3303811;
	Wed, 30 Sep 2026 09:38:14 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <b-padhi@ti.com>
Subject: [PATCH v2 1/2] mailbox: ti-msgmgr: Do not report rx poll timeout as a send failure
Date: Wed, 30 Sep 2026 20:08:09 +0530
Message-ID: <20260930143810.2419010-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930143810.2419010-1-b-padhi@ti.com>
References: <20260930143810.2419010-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026966:EE_|MN2PR10MB4301:EE_
X-MS-Office365-Filtering-Correlation-Id: e5764b8f-586a-4ea0-0f18-08df1f008f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	md8Hu0gA/PWp5OxocLnCPVH8IljjBvbJFkIEBGLKUugujzYT6BoyDCsr287uRl9Vw0hAv7eWSCCgh9Hv+cQxmvgDohsLLy+gcOP0T4i4mUpmePCDLzQwjf/Tm2UNuG4Rep8rAfvaf3ak0rDcC3Ik2NsWZVS06NiyVzwgHwj6Qie1LJOjOwwYopeBq2X71Xi+/4U97tz4gkSri3rw8y0wSPMZbcLC5dPBssGCiAlc+vXi3CCz1aDw38NzT/s24M1fpVaQamH61KL1M1kqdx9brFW36tdwpNGcxowbJl1mD3x34/a/MLemGHBjUiMO8QbHDAUHR/pVnfM6j4y7hPvSMReXPOzsITKezefKJyH9haR9K2UMy//gZGaMqazmSfOY16gaGXPdLHf7oE7x1T0do154LxpuBJ0Sl9ptQr61TjQOoyJMRkyc7huA8jsGpIWIWI95JLNRLkjxFSI1HHNh2JrcoK/5A0R4plTcl7vR2SpQKdrokvgqeqW0O3VZJ5xX+JH1lJS2PFHqPoW5RQQZIbAUht33JIFWF6GeqVD7BvYD4jDam0TxRx5tEk4PEGNZmUoWlG8uvOrYjVnNw3/o4BTVipsfVXMtUZipQ5blnTDXBXXAmvl4H8pV3PHvp7UFYrMl6tl4Vy1uBVfyQtQgzaLJF5NvNr1qLmUrMn0ev7wyKwmMIcc57hp/x1hyeSSXgufnfshWVaxO4CVO/drREQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PDk/Ki97WOCEmxN6Dx2HxXLzfTC833Fl8vKHKrKZXiICnzpqo4vo0XFvkqtkeuSTcAkEmh7xVi3K07D3GsK4CLiG4uM2JKGe10BEqc0446U6XSvNwnSlTZm4lPmDEboJI8evry6ClTGrhSpZiriEZMuXpM/gvRhhuDA9InbbTswtJkKR90QznwEEuuiF+YCSoj1TMHZD5q5TLxc2XStGA7tqPmSsuV/NRYO7B0WF7OAaCJWk4z8ub8x1pCPr/xuZNt8W8rH/KCEAgpEuRGErQoAtpOlgxcPrZe6uyHHwdOBJ9Atrq11cGYX45D7WpyeYBK1F/FVWYvC7M2ckCQnIaQNOPkPq28zW+jrFUuOfXM/ugcYOMJ9A4G8EirqNOQ1R9QxNUV4ocwwhm6L0up5DbvU7crZclg1MV/UFqnF6kd0AgLsrPcoo/eIEoTmnjrnZ
X-Exchange-RoutingPolicyChecked:
	xg0H6x6eNmO/ZZQ2GSWyY7Gf18n1UNPr/VqPNzoyBpmsHAL4ea8MT7rSjMpJtyrlm42uh7Y9zdF5MUrhr4216xuXMnrVlN5yXWgkayGwaDi5m38pZM0HLIZynTYTNDVu50VRi0p8ybM47w0wPMKchRnA3WKWWjOEpQaxo8pzDgCGcC3pjM6ZKcho+6Rwoat9jv35+gxbtKBvQ/cO/6LjGeLHWzjAr6/A+A/mHOsYuTsvqcnHTQnCQjANGCcxtpiI9F9wCFC8l4FFvJFtuAeiLw7lWs4J67rnKEz09IOny0gkXLAEoz5qLVfSRtlcm9oGw0lZxePqoHYQT2WHmhTvVA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:38:56.9589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5764b8f-586a-4ea0-0f18-08df1f008f16
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026966.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4301
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd1f05 cx=c_pps
 a=7wCTOXyfr6KSlQaUtw4X3A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=_XyyNiWMlt3iJy3YHq0A:9
X-Proofpoint-GUID: SfQYeWm1l6ATRjoTaz8NEmqjapBD4ZUR
X-Proofpoint-ORIG-GUID: SfQYeWm1l6ATRjoTaz8NEmqjapBD4ZUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX71k4xgWXp9/B
 Zz+ZAPra/DcQIK7COBHlOm/LD4tGa3FfUKtOvUFJMl58WJ2YMWf2pQgSs8EMFR5VEje3JZjkdPK
 cgnmhRAdafcXrq2U69MuNToEid0qBPfixcQGsOOvMxI74cKQl/mMnsPGqPydEwBhv/LzdGTsvyP
 MXyZwPApH5fNh09o1hplfe9nVIaCUJ6rBAW23GS/yM/UvOrI7UzxPlgvGD16xX9xF6MEsyRZJ5x
 CVShMpiCNU847XuO48lS2sZgcbSVMGDblRjQNT5MPGWUwWcxRvMsVFbToeDNNjDiotX/dLOgiwq
 TDqlakA0DoyQRB3Fnd5a+8Ey0BcCkhaU07RyyhYFXcys3WJh26WwO9taFHt2xNymJNaSMinmPAc
 jKFgpI9ekw5rY7TTbXTDzRmncvADvlCYzKkI/om105oEYuW1JKox++INZBt9Y2D3t3rJnp2Y+B2
 YIPZJdBVEV1UHXdnqQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX4HmpwOZlRp5e
 gVK+Nu4iVjkl3jDFnwrj+CjMOKw1/StKXpoxz/boNl0Se3V2h2xqbXT2Wk46fKKFX94z9ApBKva
 fqprvqWNVA6Fmd2Y6ZzZzJ22EbAnSng=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300058

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
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929200159.4033010-2-b-padhi@ti.com/

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

