Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20B7569F3F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713154; cv=fail; b=r//MYMIK6R2JaTMljRnojeMFB8IFwWWEuLCrGIVYytfdpXShxwcTqdIPb9BLdapcqoNAsfjoec+IY4ObjgQS6btpqIOba/HKkk8s31iF7FFTmN7yQckcZFRV6UPCwSfFfxYShdPffk0ysemZznuBwht2aDlZvNKiRF/sJW3GLEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713154; c=relaxed/simple;
	bh=FtQMKyUdbt4fV6WSNtByOAJhR6GTolmwyH6WFYsCATs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eHWCILLHh8lMDXEHR/9pKc5tuQDeWOEvRvHZu9Ih7WjoyLj1OF0q/6wh7k64cHuDUybPe9XHCovLWIRfFNpCErMIAeuRCdYeXS8dyLWDubPCl0s/iZ0LhDrd2+Rza/NHcec0IUrm+1ZkVjc20kTE8FYUFEakV9ZNjROWaULQotM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BRbCCnhi; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=HBWizMIB; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BRbCCnhi";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="HBWizMIB"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TGJXD2486994;
	Tue, 29 Sep 2026 15:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=h5rrvXoP0rqM7emLaph3pVVBKlqt0WuHF1l3SDnXl
	0Q=; b=BRbCCnhiQZwsWTlx8qG1eFG7t8Ru+6t9fWfohejnKoanjfspgfG/KiGEx
	XdPbsIAhXFkIivTxjBf7+6uNmqabrIs7Mt9MJKiRiK/qBoDvwdeVJp3TKtmVR6rZ
	VBq1WSfDEgZZ4qrfUdB+1Cy3AH029jx0ndXOKaK7IgVRSuK3mhtJ5M9te+lHSeOd
	TNBLWe9PtZWstPNpnOIAEVYxGQDkfUdpyVKmPEy6JALh0ArsPKbIVKHTCKhgmSxs
	ntI9M9LzcwZwDX0qAwOg2/iPuORPbD89S4WvcatjNcWrnfny8r6QfAk61zdSUMGM
	tfMVQlmrX98vCjadZWU9Jhkrd8UiA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012020.outbound.protection.outlook.com [40.107.200.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc3a1q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3ICndX9r6VdTgj5/bIdgK0137KpiQUc6Z2hcxL9krbVBrcrvqXX4JC7h40mCV/CYPNrdK5xUSTXQhjPR+xJJsLE4phzYZvI043elNFESGegBjeFlnxGpvbdkFQ0bU56tAYIfPkJy/ch2bOc0G22ZLxM/mocDEXOv369v1noAV0MDKsmQWsLtaceYZCKPW6li3LtP628JSkGM3FmULJKuf1QBf6Cr7Or8jd9vxxk9HNZMjmL/aeCJlwK1YtIQw0cWrEKlEzravIVQKSGvKNvvtCV3ka1cuFFm2yHFjBUjEQ35Nen1fGN9oUsSZCFVGOcP2Amx2g+sKjGqJ/EhQ4WPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5rrvXoP0rqM7emLaph3pVVBKlqt0WuHF1l3SDnXl0Q=;
 b=KfU7eFUIRefFCaluR8WaT+ardLk/cTDBoM157VdNMQd2MjfzY4MDOpNTorqAqjXN57wteRYaERyeDcTMQvbscaxcb6PV0Rub9q6MJTczZ0Uh/KvdB2NDAXA3P9XwkR/ccMliKtFbXfZjjDBJMWTvl4DcaTupzPUMDhSW3L2u37MZAECF7lQQlAqo8rlxsqW+CWMU9uZRww7K+381SQnR6v6qc4EA5JwMX/Y6BPaD1zCcht3NSR2MHO8A6sK39Q/bORDJEWjJSSJVfmR82U0F4Zydtovqu/m/fzCO68x4TiC86jWM/pLYR3y4BC774dnFONfyNkRdmAQqEg2aSNEDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5rrvXoP0rqM7emLaph3pVVBKlqt0WuHF1l3SDnXl0Q=;
 b=HBWizMIB0uQgWtk+tcCs52QLxEEE6ZNMKqsPXkVzl3CK4H/B5FKDrv5B2/GauzD98IgCrskagdttvs+kjAnksVJ/EMG6zLoWY3+9iGTYkzKPxYqb/Jdn/HydaCQo274GeJqujp/yW0Jtw44h8nG9C+bwBVeOGzzn8h5m+0LEwCk=
Received: from CH2PR03CA0016.namprd03.prod.outlook.com (2603:10b6:610:59::26)
 by LV0PR10MB997971.namprd10.prod.outlook.com (2603:10b6:408:391::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.12; Tue, 29 Sep
 2026 20:18:52 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::43) by CH2PR03CA0016.outlook.office365.com
 (2603:10b6:610:59::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 20:18:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:52 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:37 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:37 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMn1688208;
	Tue, 29 Sep 2026 15:18:34 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 15/22] firmware: ti_sci: Use pmops fxn pointers in suspend/resume hooks
Date: Wed, 30 Sep 2026 01:47:39 +0530
Message-ID: <20260929201746.4078803-16-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|LV0PR10MB997971:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c1eb66-cdbe-4d55-2d27-08df1e66e143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|10067099003|5023799004|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	yUCnQXlu9/1Fb9rz4kwyFq5G53UwPp00Wm4CedKv4n1/iwKbTMcY/wIP5RlJhxt/K0Dg2RKW1PKVSstMkaLkoY/Ie+eoZVWw//4ziFNayWbP+IuO8HAPushHLkBsozc3F5/O3KPt/imqCWTh519boJyhrfO3q47QTGSY0fQljgRzxSIZMh0hJO6SgV7+SIeUPbhPA2BTxEy4qfrsjP3O3hpk51CJ7vC2tkNqqwWlMLeFfy0iHoIMviYLCUXdgWz1kzmt9HdyuAl+CbmEeQmYVGDQ8HgHbF9qdSZgLsExJ6RgE7H6TBzHGHlEJWErPA7B5UDVdEpcfOI+4JEfrLtjmh5dnwm5AMoXEL56GNi2RmuTuQE0GVLQbdKSb/cdXXW8l4JU3hKa8Gx71N8Opzg/RAVOT868lDhaj4yoj6Hh2cb5ENiSHMAa5DZsCB2IJqn6+hNuF4k7mOGt9NadRpBg6MwAXjvoLKNV8I0uwjlA8av4FoGsWupJOSDC028BZWm57jFsi5phRb0yLtVwBeivdRk3kautSpGPxhrYXUdMsm/1ApvzgkbdMDvXFvoUqt6qlCYQ1ea+/SwkcFUHKRCNks6k2TdmyRKjPg3uPMAfJ34eSxlDf+xkl7GLmDkbfYcBu1kKu1yb99KufRBPE0cobVIa9BOtZi7XjC6x5wwHTvE0V8TOyGIVE9+3hiNznrwQeyyAIh7H4CTwGNTdo4p94g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(10067099003)(5023799004)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h+bzh/p1TvZ1FmmL5YP5QQWtxeL5LzgmDlHTssmjC5FcoqgmJf79KWQ8Er5J208rqC+uURxVjKwkIlTSN0MvVlVlCxR46tkrxlqmnp0bN2fVbx3mmIptMqVtTn8ptTS1p1RG8bX0bc33gicOOiamTM+uTXAdi3484uVGrbmNFHSOzwam/nBuJz72fSxhIUm7Hja6gFjCD1tS1mDkFORR/tZjW9XZp8g15bFuXck9hWKt1C+OWLaRcL5vaHx4L11MtvRAM2R4L0VQm4WSw/p5bExTc3mMqB3LFWbdQPIJiW6fK94Be8WsimeMwZdOzfYfdk8BHpD5xKEgc6xSfV7gOmmyO/O9r3dpnkwVEq/XqBo3Mau/X55gPlJ4FacRXHXCl4DMzWskd9bpK5EEolC0iURqyau0vgiv+CLFVpT5kU517xhQRCO+ikIwSA4Xm2d7
X-Exchange-RoutingPolicyChecked:
	WhYR6icmLeCWZxfvXQ03FekR7MiYUv4uf7+kCujVxUgkZWg+EDtPuh98UDh8uxQFZBTv0Msta2dDB6MdEz+Ntm8p8m42v47s153/j72oGdtT/ZdUu1LyupEfxCFYKUbO97gkXwuslcQYOf6c2cmaRLNVU3Zr3YGWnC6LU6tEN7dn5cU1EVhCzfEAsQTgQ97/pc1EMmET6zX4fapIDsEwKuknpmcu3o8u8cgG9q+M12xYn9prN9JQKu84QTVuHu38YEe9L4L9Zmk9bmL96Ui53Ur7TGqjrIwusmabtfBFnjUvKWbdUR8WoJWFX94lk96nnnDlZ8/7uoxgXEH6x32uUw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:52.3493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c1eb66-cdbe-4d55-2d27-08df1e66e143
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997971
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX0ZvNbv8YF5aq
 OCwQBSrAsggZ6IlQn6sdO19cfOTWjXlRX9A3x9XCgSBQx4AEHVeUb5TN+FGWQggrAoGz55XifOc
 X9G2fsdCjKqWky7FGke7OKqveFZDpHc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX8HL48rtkKOio
 SlMULJIxtSyJ0JwQtLIxDl+6qKpch+mOMW5MX3DA1OhAcbG9ga/YrpqnEFpxud1kSSr3Ob50wAP
 C1LrZ3Go/mwOa3C4+qXHO+5SEFM3mDlDAD7/2VJy619sZFLvirjikxNKhiCWLMp/LroQJfVQwvQ
 1/x/L+sjQMjqpvxaNhbe9QKW4Vw79KmTwTrpsDZvdKZOV2pw+zTTCQh1EBt7nx0vVDxKQUsrMRt
 3ouwlA1tQNT3Y52gCCy4zuMhkRwkyeUzs7SF+oHIKDQ92hnpcScauTinamxYQj3+QBHu7D9Ea6/
 wJMJ+DFKMm4kn5O1fvafqMobTjTgYVONMHy0CCiZ2AOMYl6pPPnJnNtPU1Dc/CXxEBrUHqGes2q
 y2P8Z0RbvotWYRu4AlIbkX9FcN5lmBwreS1qj0nRki68NWHFcVl25ta1yLIgHGF+euB6yoav/8s
 KE8YH/GhfY2vdPk3U5A==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abc1d31 cx=c_pps
 a=Og0UtPbLppQH9mpfBaDriA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=7QgvFepopYO1C1vgVtsA:9
X-Proofpoint-GUID: aBTX6Cv1cONwxFQV0URnDN2DGCfFxR27
X-Proofpoint-ORIG-GUID: aBTX6Cv1cONwxFQV0URnDN2DGCfFxR27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

The suspend/resume hooks invoke ti_sci_cmd_set_latency_constraint() and
ti_sci_msg_cmd_lpm_wake_reason() functions directly. These functions are
already exposed via pmops function pointers and pmops is available by
the time suspend/resume hooks are executed. Therefore, switch to using
the pmops function pointers instead of directly invoking the functions.
This also helps in a cleanup later.

Since commit 60357991f6b9 ("firmware: ti_sci: Introduce Power Management
Ops"), pmops->lpm_wake_reason is only populated when the firmware
reports MSG_FLAG_CAPS_LPM_DM_MANAGED, but the resume hook bypassed that
by calling ti_sci_msg_cmd_lpm_wake_reason() unconditionally. Guard the
call with the same fw_caps check which should be the correct behaviour.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index d22686f9346ea..5d3151571ac33 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3154,6 +3154,7 @@ static int ti_sci_suspend(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct device *cpu_dev, *cpu_dev_max = NULL;
+	struct ti_sci_pm_ops *pmops = &info->handle.ops.pm_ops;
 	s32 val, cpu_lat = 0;
 	u16 cpu_lat_ms;
 	int i, ret;
@@ -3175,9 +3176,9 @@ static int ti_sci_suspend(struct device *dev)
 			cpu_lat_ms = cpu_lat / USEC_PER_MSEC;
 			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u ms\n", __func__,
 				cpu_lat_ms);
-			ret = ti_sci_cmd_set_latency_constraint(&info->handle,
-								cpu_lat_ms,
-								TISCI_MSG_CONSTRAINT_SET);
+			ret = pmops->set_latency_constraint(&info->handle,
+							    cpu_lat_ms,
+							    TISCI_MSG_CONSTRAINT_SET);
 			if (ret)
 				return ret;
 		}
@@ -3209,6 +3210,7 @@ static int ti_sci_resume_noirq(struct device *dev)
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct ti_sci_msg_req_manage_irq *irq_desc;
 	struct ti_sci_irq *irq;
+	struct ti_sci_pm_ops *pmops = &info->handle.ops.pm_ops;
 	struct hlist_node *tmp_node;
 	int ret = 0, err = 0, i;
 	u32 source;
@@ -3262,11 +3264,14 @@ static int ti_sci_resume_noirq(struct device *dev)
 		break;
 	}
 
-	ret = ti_sci_msg_cmd_lpm_wake_reason(&info->handle, &source, &time, &pin, &mode);
-	/* Do not fail to resume on error as the wake reason is not critical */
-	if (!ret)
-		dev_info(dev, "ti_sci: wakeup source:0x%x, pin:0x%x, mode:0x%x\n",
-			 source, pin, mode);
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
+		ret = pmops->lpm_wake_reason(&info->handle, &source, &time, &pin,
+					     &mode);
+		/* Do not fail to resume on error as the wake reason is not critical */
+		if (!ret)
+			dev_info(dev, "ti_sci: wakeup source:0x%x, pin:0x%x, mode:0x%x\n",
+				 source, pin, mode);
+	}
 
 	return err;
 }
-- 
2.34.1

