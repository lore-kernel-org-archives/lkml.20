Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058F30BF70
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784440; cv=fail; b=tgQik1oEPhrLaAvAv5EfeC6Vk9ixwTVPUZptrNu3T3cUHBIr4MdWK1CAdaPfd16I8gvi+7+AOJVMu1g8IY0vZZlEITWFe9kcUG+jsuPjWN5fKfNMwb39t3cmcJlDwceQ1ceZ7Kg/5Yh0Cw4Df2ZHZmWHeAcSOdsWzo1dNFJE2AU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784440; c=relaxed/simple;
	bh=/wmyfbaL4m1YYPHGs6/v+qHycrn7iB9HeKxKmkZt1c8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EhRO3DqD0hmH3eZJUfgh/pw+ji3GQgzJq5ILIC2NDZgRrJqRDEbpc7pKeZP6ZMEVHSQWJhXipYC2RFS4KZ0km4JsemR1rzoch07nCq1G2uuxxg7YkvWQVOjEpi5F3MXY0RIUoAV4mL37GTHUTv6Fk/99SkTgqJ8V0kG0KTiHZIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=SMCKwNcn; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Uy9VouMs; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="SMCKwNcn";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Uy9VouMs"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1Gn13333233;
	Wed, 30 Sep 2026 11:07:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8GcTrlRZB/9EgRUDXiGd1XaiaWD7tNa/YqVmPuvu6
	1o=; b=SMCKwNcnm39eiGFL8aNlytytrt4w157lx19iN238EcOp6Sv1nbOsM8EG5
	tQhpvRPqWXTXxji/n0tWqaWvFWv3SrRacQkrPVA+onuLvm0KGOg9ofS7RVE/De2c
	R/xwR8f1YsAys2efy3nMIb+t2NhlsWlJBQqABEprXJY6k/ZUTFepv2Vb+HVg2FHD
	Fd8X3nDb94+R7CHtsKglvZKfSnbDgWIM22P4Um+bqygqfgSyIwFl2TzYwHdtY+mq
	3+JkJn3sCMchtz2mcT3jNrpI4Kk2UjZKMHFofrOmVXQzE4R1q/mxH8Hs7gaabqle
	KjFLtKY1438T0wsj0jNMtrBt9Bu/w==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1svnv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzG2auTgO1UPEL+O/p/nohKPkoF8OwFgfiSym3D0Ub6JZRagkRb+/cRm7b921dbfJmsPTzqLgbmB5/Ht0aRuOZwGYabWZN9Wsp19hpQTF7ycT5WHj2IvLGkoCP1qkgRIw+TuBIVqxxyl/RAV6aXYsrDUx5pQsBM5PdvrVetonkfQjFLR5TGvNC065Ojl+8S6E/a0EOob9YsT0uWj8xSIrW/8yXq3antaqfxLO1OjBVLsY1edQa3KpkOVPODtT3JcKKV/DLMAq30UCRP8dYnABFGmwB61G2Hc4rhnBdQGtjG1GEfCZ9/diAVMSFNi45KSNtzBhHLqtAW18z+dzopSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GcTrlRZB/9EgRUDXiGd1XaiaWD7tNa/YqVmPuvu61o=;
 b=ihK4YR9JTsp6lm2KIreFzpQjAtJIj6F/zkJjVyUutl1boA8J7o/np/nZIzCjGy8bYd6YIwHXR/qTOLcer+bYWIYXQk5+IdwNKzB65N4uD4Ni4REf7hMUbCQNJV9ouLELKZRwoLKCkdt7mjLvs1k/d/6qqe1qsHjMHYhYN6Ot+0YJWw7I8k8QvbRS4Q40Tu6SYz1+x4T+G+gG9vdgU4Y+jEmuyrWO9tv0Id1QfIQDU2lWntk10lah4wOgN4QgkMzX45jWjAT5E8ygJh9O6TkbUJnI3Iy9LdntoVyyiJ9+Ixr9xF6kXniXd4m+Pimnny2cc/EBNxsOcm8mebMshJZQ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GcTrlRZB/9EgRUDXiGd1XaiaWD7tNa/YqVmPuvu61o=;
 b=Uy9VouMs2POzXy73TCarcYzj6soblq3XmK9Jk4cF1Q1N/bvR/57VeqttZQxp1yAKYacGkk9O7jpMX3vuw2r1Lj9fodqs15Jx1lreHKtx5mhwFmrDJjDuOVb2V1pRWBwxyRm8n9pr/CzCRhyy/ru2mj2wWHVplfjoDBypPdf4vNA=
Received: from MW4PR04CA0226.namprd04.prod.outlook.com (2603:10b6:303:87::21)
 by DM3PR10MB7912.namprd10.prod.outlook.com (2603:10b6:0:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 30 Sep
 2026 16:07:00 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::13) by MW4PR04CA0226.outlook.office365.com
 (2603:10b6:303:87::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:07:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:06:59 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:23 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:23 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68W73425232;
	Wed, 30 Sep 2026 11:06:21 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 04/22] firmware: ti_sci: Remove out of place RM debug messages
Date: Wed, 30 Sep 2026 21:35:49 +0530
Message-ID: <20260930160607.2674980-5-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|DM3PR10MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: f7aa91cf-b525-453f-4876-08df1f0cdbf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	P4nPMmcpKbv/dQkg4dJeh+YJcEMKCg15JnIyBZuuDna0rys9YfBGaehtZc4zR1qunePpcQl4LbRK1uiB9fnaQF7MFjse2kRPJrEBAKJXwChgsL0UCtjc2cthiAatknSGT1T9Y031X66q9p4TkcPGvLdydBohS6Ah9L23hRqWdJcNHt4/khHK0QlERg+K1GMZqugjr4jBOEs1OqntpV4N5QI+nb08OCNURNcepyYD2wCmgBhEVOz8l8LEDEcYOZTQyNCWv3arHgBkLsH3ey60wSGOzguOqJsw83ZTkAsn64q2yiZW2cMOF5ebw0/98yncJS8tMqVhuBRoaPSr/pDQDXz9bcOerxrEsZV58I2jK8P5e/QpuaqFWIx3Tjy147fX1Rdr7hJg2017NuVU5r1faf28Nv9BuPeXOouDU4xNbUcAfNqpvNKEUehK32XoAaZR/ZrYqFyKutRJuFLYHhJ8PP8qrDqawJkXZg0bNiONWWZzgiEW7p/xlSTP/M+wXCRMoC4tyspdAzhK+pJyBYIDryFvO00mVtMPAJUqx5SCklO4pg5ZbMCxaW1JqH5TzsmyP3HBsisb6BENzcUewuJxzwlfwqcSm/BvjKafdkkLxmxCdFXy7CelW5gYdMYHa1OvpjereSbnkD5OFMfLDixY1r8nNR/MkoxFI0AQKHX0Uc5RNtpjuBkYxiMP7vuJQhmMAYYgfbtEuqXUTTgmonN0kA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	avR+C8Tqr7wd0RlzTJTSDZseKL3pvpTVKX5uXfkB3cZBD1Vd8LK7JwOSpF82yzmNbT8f2cFgCW/s8hG7rYqLi+DvazT76U3gN7UlAEDZfER1IPRD1g1xBkqG9KZcOsGIsX8/MWPE3V1uOsgiqryEfj4yzP27oMrHJaV5z/SJsoj4co3ePydLSzNv0M4wgDqWfQgwDd2mPoFP2GRc2AW3sK5Dpv5ebNkGaqO+4qav71dvgjB8WVsiK+GIL7IKH9UIOr/18Gq5PGo+0M2H7TEorIVoV8ldznnWGIbcWHqnMXth6KzdKP9q34VQcBPGg5uHSu9EkUrN1XZJSEWA1obS8XdN1ik55/bnRFV8qVZL0vY17EtJwzBg3/JxLcT+OUMHhzSiYXBxZGbqJWoWUD0M82Id6nQoQqjHj4ADalmaKX0hwZRzar4JDM0BvLieRWMy
X-Exchange-RoutingPolicyChecked:
	wcmP6dTUMEsywulseNZBwCCqC7EUTF/yefLDPT7DHBIA5Xa5hhzZu50ZpqcKO1R2+vX+23NpPInfEEmjfZgwTC8wq6F0HNcw2JrlH6mVomv56VyQVLDo1Dy6ErjEy1k9dLbuD6oXq6abguW0a/GxCrXJ6JwnFHS2nbXHItCd1oEoE3tELoTE49rJZJM3l/JipUgta4J7HOxBEZW5gcGZHKf7ydY5axfw425LQpx0o0T6g4zxeY1428eNfbwrMnfSR3xp7YQAzBJa0diXz+vS+3BhhN8Ru6ExJJ/593FE6lMPT2dD5NpHE/CAiXWGbEAdAhLKF8vaVkQThhlkP+oFXg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:06:59.8722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7aa91cf-b525-453f-4876-08df1f0cdbf3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7912
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX9OtDEtQycSkb
 V42qOC4dQf5zzwWoI/vMdzewzd0Rk/4PcI60xTjPZhuQRvBGrTNHWHseI/XUlk1eFMl9xBOp1qI
 qpNgvuVspAMjAjELyAb+MtG4KgznXF8=
X-Proofpoint-ORIG-GUID: 2o0hdo_nUGxsJXohblXQFs6h7p3qmYh0
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd33a8 cx=c_pps
 a=uvnHr/yu0CVMxYA77rd9og==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=h3hOHIXeJSkHiXZvtOwA:9
X-Proofpoint-GUID: 2o0hdo_nUGxsJXohblXQFs6h7p3qmYh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX/deS5aGj87Z7
 KNOoIalw97dDFhqFvxmtz2ea47rOuil743XXKnYizwjF+uWFenP2tql/8gvXIEuqyJ/JfQpTZgP
 pNQH3v9t7CdtdODfoV0FG4xBgy6E5NvKael2WoHYMMG8knCoeaqsfmqwXrr7tP9TXCSz+ixrg8V
 UsEKk4N11N/VJkGTBRdBpqOnlOruwgNYsE2TxVUjEY/gxNkkqYwav98SnQ23Ymo2hxY0ELAYEXZ
 epC8SeKrbq1UskQv658eOlCELBtcxSNcuJk7bQEzgHY0TTq3yN+pBqGrQz7et6BLjErCGxLe5xH
 gQxMpsGOZb/sThuZdAsRtYxQ3UOtY/d5H7WRXUSjUqmurxegirKs/FpxTDCvV01V+ysZHsLO1TN
 RN0ucrv8NXMcSTPTax5a4Zbr3RfEs3TxmlOUF3ty6qn9wi17hNX4EupfBUGg639GhAW5Hfy7aU6
 zEYF2vxHmFs4VDN0Dsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

These debug messages only print out the index param that was passed in
from the calling drivers. This does not add any additional info that
wouldn't work better in the calling drivers themselves (k3-ringacc.c and
k3-udma.c). These also make later cleanup around device fetching more
difficult, remove these debug prints.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-5-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 6ec16fe57f132..a91db923c8939 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2405,14 +2405,12 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2439,7 +2437,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(dev, "RM_RA:config ring %u ret:%d\n", params->index, ret);
+
 	return ret;
 }
 
@@ -2555,14 +2553,12 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2598,7 +2594,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(dev, "TX_CH_CFG: chn %u ret:%u\n", params->index, ret);
+
 	return ret;
 }
 
@@ -2620,14 +2616,12 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2660,7 +2654,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(dev, "RX_CH_CFG: chn %u ret:%d\n", params->index, ret);
+
 	return ret;
 }
 
@@ -2725,7 +2719,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-	dev_dbg(info->dev, "RX_FL_CFG: %u ret:%d\n", params->flow_index, ret);
+
 	return ret;
 }
 
-- 
2.34.1

