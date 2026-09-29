Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADCC39FCB1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713174; cv=fail; b=IU6WHUKg24tkiLCz3B3njVuteWiBnaHl6OLv3noBtARrSg5snxLqevFm9ravPVPrrnhBKBwQ1UEHTb+CLjslM4Cee+NDGzWOAXvtS+ffpcqvhiaKuFA13AYdyHkY3FlPZmUM6hTBMXIYTfFSbynynNtCWLYvIkJPnRwv1OrgWbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713174; c=relaxed/simple;
	bh=6RCfqgN0L69vt4x5RkouM85H7IcjlS2J1VhlfnoeC1w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CM09+yLBEiPoWe0bgPPKyNdU0T8peuG9wdFNKG1g1/Piq1swu+p6hNG+im835VAjSPfYoPXXdcTI/hXCq/M2Ci4BgO2FXKSjaGBB2mVipj9nZsSp9fDbvCBRdX7ikdgWXEwBwGkWmH5HBesXYclAaCrzAwqlwl/nOdgTU70SrOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=eBuPqOq8; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=KP4eaEZ2; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="eBuPqOq8";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="KP4eaEZ2"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TGN77H486521;
	Tue, 29 Sep 2026 15:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=piRaDrDGV1hK2AnIT4/x9QIhv11MVHY4h+yWbzVR2
	BU=; b=eBuPqOq8nQJGbdm0uIBRwpe5uQ8B3W6SQoDxqi70EHgX1MQtgxYlhMUn7
	GIor8z5CmoCxTU1Y4hrFf7ddi0EBoHlhpaip6v5TIDF5R7pL2j9jw/Yf7CV9Z90Z
	fsMHoRxVNVuIvBsqV0F0WrybuxiCmT1ChvfbWvF+UGsK695cq0ErBa4tGx8dpUDO
	O8TJuwzGU5xFxjU+SC55o1rewdtvxT9ruG+E6fsDEK+dPBYTRkOOHOp86Qbdbg31
	aiqCDa5vl5gQuWeEsApyK74+a5BmXpghSy8vvYfyUAPRLdhybRjLONwPjAuiYSlR
	+USvt3lYDpQW3XJB25pCA9xxLw4Gw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc3a3h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:19:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOyP6l/I1DsAt5LMcKcfqDXQUU3eGg3CU+kAkAQ4Gpo1YOgcWj18HB96R7UWvCZOfhDvygsa5Zsk8fbv2+QlhpoecTmYsKrNUIDRluttQg19rjuHN/pE4nI/KMY/LG9PsNUaYnI1yOEaDh81MpfQhYTnqXk6hQ/o/7f9gS+x3kL4XV23tcPL3krsW31/CJ+IPAbz/0eZxbtLzVGkqj3fwqQ5VSjQlRnonXiSFHVweDi2sI7CbLipZGJEOutfaGQHu6ME1loCdY6LYNW0uZ9HmpwiWqu7c9IxjGs8m+RyjRcYGYpNLKqsv3iWIaoKCEeByqgbAmH4m9ae9ToesXPBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piRaDrDGV1hK2AnIT4/x9QIhv11MVHY4h+yWbzVR2BU=;
 b=Do3EHVyKuA7U/FugLZJR6YLdjNcbrDmXUGj8R3FzEsezUA3FVcfxwF9o+shkUL7QY+Tmhgyvdk5wBjsO9jgmEy8HlHjiiW2yoLinQyl3t/Xa2uHDK/Pa6rZqezDA3xRLJmTJigbcd+zVScHpb5EcSMAGbcM1qklwAtvq8eriKcKhOhAd/pV6vwPb7fMd/W/jzL2/U1H+y78k1ZYzi1lUUCeJbZMOvQiT3NJ8CqVmf+WgfauIrnGTXOjJ8GHsPCYWrK/q5S4qzvdcyCNvoJjQVpZV19w7yvrxNP2LnoC6XZCtyF+9eWAMtj9NKvxmHv0JLqSvvqYCn3BgD++BquUxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piRaDrDGV1hK2AnIT4/x9QIhv11MVHY4h+yWbzVR2BU=;
 b=KP4eaEZ24Cr9v04bO9Tok9XiKwcpGPCPfSUHNfLffdEQ7+AKoUYJleERktCzGslJc/kCulVXH/O9UGeCagz4b/tIEVoQ4qrIb1MhCQJFYjxa+RjTi1P6QSnrasl3G845UQUgeh9EWCrERtcjOKOjWZpIbw4F6sbHOG1YKua+WVI=
Received: from BN9PR03CA0392.namprd03.prod.outlook.com (2603:10b6:408:111::7)
 by PH0PR10MB997641.namprd10.prod.outlook.com (2603:10b6:510:386::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:19:15 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::32) by BN9PR03CA0392.outlook.office365.com
 (2603:10b6:408:111::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 20:19:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:19:15 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:55 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:55 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMt1688208;
	Tue, 29 Sep 2026 15:18:52 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 21/22] firmware: ti: ti_sci_rm: Move rm ops into its own file
Date: Wed, 30 Sep 2026 01:47:45 +0530
Message-ID: <20260929201746.4078803-22-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|PH0PR10MB997641:EE_
X-MS-Office365-Filtering-Correlation-Id: b52740db-a577-41f2-2e0e-08df1e66eed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|56012099006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	tfb/rGD26+L485wGFbXppsFpyi83eCjsVgMr/aKCakdBEqNNY3Nbv/4NvtCydYExSvnmWlrEa5wnPBSe7ES1LMNX39Xza6QajiNIPro35MntbNcaMYwkE4FI0rcY4nNWMC2t0a0leO3IiCotmyEmX64gfp78B1dK/ZXvcxwFC4e14tlDwcRAOA36VTaGmQ/J7bIBri2imIuuZBj0BCQTGy2xLk5zsbqvvCxJP3ooKa6tXzmlTLgHVFtLNVoWdUEU+dx2L1RZGA/OaXN+jn/+sCt/Qg2ibu5oDjtqkbqUI0TGp4C+Sc/k3pYPTKQiipZV/B2r1ikifb/ijagFUX8VgNHl5vDKfv2WpVxsO4Qd/FLD3jsb1COlEjgsG+ey06eH70sn98tkXATeysHySaD2/pRwH+WaPxThduTiHg6zoU2j04Qop/orbQm+3WINXvuYuaeKXakiomZpb97ABq9JlWPxGjyimfVX9SwzKWyh5rhvhDUl+Sgh9xAbdkpFBk8WAl5LLqQ674rpKPGiA1cBj44iMe99rEa0+RWEKoZTchh0NLX3+7v1IhpA4Smy6RqsU0G668BgrYRMgsVBpaZ3nNow0ZNDatohGTk9+IiZJ1Dc3TlVoPqcGfMXuTBM0qro1ewV65N90FQFaHGXJCtCrg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d70TIsjitqH5OiOkqn7allsiDK7EqrSzrg0FgJLgpuRvMwgLFb6qf3GoLWU+TGXzCx9SjLtGFAVCaKyMpukolieAV8nixsmrxuhjFjX+jmSl3j7TbGA7jLKsPkKvnEtj8d2WQo4G5ruwwfZJqGvV2VQc3d3x5t7bh0s7AHcIqptnS3DsE3xUhK8HSSkJVFYJknwBNrVQsaqO6aev5teEX59z5fyAiZM5/PWDu+6oL8xdPeEeua/Pty84z16yPa3dAkWa2egG5zkhpjVKBr72P0mk0rMWgADfVwNZOGQs1lmFSsPpwDG0M/zH34dkBTJ6MqAZ8Rljv+oUJOQft6eRzCN9M2a637e9BEO2SAmE0yeLu6cwnbD4qJ12t0ayJPlmFy9ONc2OY/Rsz9wzLlhPbOLoi1SX8AFuaCNlNhGDYerT/hNfqcQjf0wfBqQzaSVH
X-Exchange-RoutingPolicyChecked:
	TmqT4obyH0kHbMbX7IDUQHDWegSH1NIy1lfeuRPzAO5ZR0DxNnyvC7MD5OVLbJ7iqrKpTPks/WW2mmhG/EjZVmaSkn1KBuyutD78Zt7n26E38Oy2RaJxBW+LozvT+teOjXVeMjBKrdApo9OmjYIpNI/aE6ZsTA4g2dZ9dxP5vv7uueApZOjEUhgC7lu0Gf1yPSLhzGR/Mxn1CI25JgUvYNm/QK4YwaXfTfntlFXU3gA3Q9AiO9NAhgazia4onCqisuxtapUmPIYFaJ56L7a83KWerBIdEk4+IHpLMpW5dc1kZ+VcWpdt+w6bEYBdvFVUu9K69K+yyLeUrL0mB168Hw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:19:15.1212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b52740db-a577-41f2-2e0e-08df1e66eed5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997641
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX0vWyVx0rVYFQ
 ZBcEVNqhHX/1HQ+ZZQIGlSaUqW52PZsBcque8XC8g0fwFjVOPEACLyydNDJnBzEDiThB7lvn2ID
 7/KljJxK4DtcyoTRzQF3Y6hLBYUSvV4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX3tsUdBrvH8gF
 VX8x68IDkLpny51kxaplzFodzuYljuwOqkY8TsJ6hCThFbo50XOz97GVPuCJu1T/1VAIEFmBTuz
 NT0n3vJ1AL+hk4gxqLhKN7uDqEDbEFFhtKGkUhYLB1aQRNUxBmTYHv4HbUji1d6B2mSzp5a1dHy
 ksBNSuxjmlNhT/hWegMaEG+iV9F7+380iJLECsNXk3zD8wwQSQ++nZzffIy+wrrrk8/CvoS4vVD
 E5sUOHCwn2ntq1YLolv9a+qJbtk1GG8D4cQ/WO9a3BvvNdNBRZZSAUVy3t2cT+oVFQb5c5HY8pw
 hx9hGQGXAx720oVXjL8XJFHm1pFIPI/HNjr4dWoxMb3Wq+n9wBOmBl69gIreE0+LSdkhhkdUeuW
 Aim106/ClfdXT6nS35ZimOVWl8DI/fyBibqO2FC3yT+BRKIJajEEOs0sLzWPZNHeRw0M4o5PowS
 FHMy7o6OJMVP4R7OLWA==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abc1d48 cx=c_pps
 a=k0I/Xeyziwozq/4EdJtLuw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=VwC-_Cji1ZHplTYqCF8A:9
X-Proofpoint-GUID: LgIZc7Dakhj9f1XkZjwBuso-88PtywVW
X-Proofpoint-ORIG-GUID: LgIZc7Dakhj9f1XkZjwBuso-88PtywVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

Extract the resource management operations related functions and
services from ti_sci_core.c into its own file. This breaks down the
single large file into smaller logical files for better readability
and maintenance.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti/Makefile      |   1 +
 drivers/firmware/ti/ti_sci.h      |  20 +
 drivers/firmware/ti/ti_sci_core.c | 875 +---------------------------
 drivers/firmware/ti/ti_sci_rm.c   | 907 ++++++++++++++++++++++++++++++
 4 files changed, 933 insertions(+), 870 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_rm.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index bbfe73587a3c7..7d9c2a73bf5a6 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -4,4 +4,5 @@ ti_sci-y			:= ti_sci_core.o
 ti_sci-y			+= ti_sci_clock.o
 ti_sci-y			+= ti_sci_device.o
 ti_sci-y			+= ti_sci_pm.o
+ti_sci-y			+= ti_sci_rm.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 7a707c632276e..e8d6589eec0e9 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -112,6 +112,7 @@ struct ti_sci_info {
 	int users;
 };
 
+#define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
 #define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
 
 /* Generic Messages */
@@ -906,6 +907,16 @@ struct ti_sci_msg_req_manage_irq {
 	u8 secondary_host;
 } __packed;
 
+/**
+ * struct ti_sci_irq - Description of allocated irqs
+ * @node: Link to hash table
+ * @desc: Description of the irq
+ */
+struct ti_sci_irq {
+	struct hlist_node node;
+	struct ti_sci_msg_req_manage_irq desc;
+};
+
 /**
  * struct ti_sci_msg_rm_ring_cfg_req - Configure a Navigator Subsystem ring
  *
@@ -1667,5 +1678,14 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
 void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
 void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops);
+void ti_sci_setup_rm_core_ops(struct ti_sci_rm_core_ops *rm_core_ops);
+void ti_sci_setup_rm_irq_ops(struct ti_sci_rm_irq_ops *iops);
+void ti_sci_setup_rm_ringacc_ops(struct ti_sci_rm_ringacc_ops *rops);
+void ti_sci_setup_rm_psil_ops(struct ti_sci_rm_psil_ops *psilops);
+void ti_sci_setup_rm_udmap_ops(struct ti_sci_rm_udmap_ops *udmap_ops);
+int ti_sci_manage_irq(const struct ti_sci_handle *handle, u32 valid_params,
+		      u16 src_id, u16 src_index, u16 dst_id, u16 dst_host_irq,
+		      u16 ia_id, u16 vint, u16 global_event, u8 vint_status_bit,
+		      u8 s_host, u16 type);
 
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index 60d0d64ac4ae8..b1345e06341db 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -35,18 +35,6 @@ static LIST_HEAD(ti_sci_list);
 /* Protection for the entire list */
 static DEFINE_MUTEX(ti_sci_list_mutex);
 
-/**
- * struct ti_sci_irq - Description of allocated irqs
- * @node: Link to hash table
- * @desc: Description of the irq
- */
-struct ti_sci_irq {
-	struct hlist_node node;
-	struct ti_sci_msg_req_manage_irq desc;
-};
-
-#define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
-
 #ifdef CONFIG_DEBUG_FS
 
 /**
@@ -632,655 +620,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	return 0;
 }
 
-/**
- * ti_sci_get_resource_range - Helper to get a range of resources assigned
- *			       to a host. Resource is uniquely identified by
- *			       type and subtype.
- * @handle:		Pointer to TISCI handle.
- * @dev_id:		TISCI device ID.
- * @subtype:		Resource assignment subtype that is being requested
- *			from the given device.
- * @s_host:		Host processor ID to which the resources are allocated
- * @desc:		Pointer to ti_sci_resource_desc to be updated with the
- *			resource range start index and number of resources
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
-				     u32 dev_id, u8 subtype, u8 s_host,
-				     struct ti_sci_resource_desc *desc)
-{
-	struct ti_sci_msg_resp_get_resource_range resp;
-	struct ti_sci_msg_req_get_resource_range req;
-	int ret = 0;
-
-	if (!desc)
-		return -EINVAL;
-
-	req.secondary_host = s_host;
-	req.type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
-	req.subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_RESOURCE_RANGE,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (!resp.range_num && !resp.range_num_sec) {
-		/* Neither of the two resource range is valid */
-		ret = -ENODEV;
-	} else {
-		desc->start = resp.range_start;
-		desc->num = resp.range_num;
-		desc->start_sec = resp.range_start_sec;
-		desc->num_sec = resp.range_num_sec;
-	}
-
-	return ret;
-}
-
-/**
- * ti_sci_cmd_get_resource_range - Get a range of resources assigned to host
- *				   that is same as ti sci interface host.
- * @handle:		Pointer to TISCI handle.
- * @dev_id:		TISCI device ID.
- * @subtype:		Resource assignment subtype that is being requested
- *			from the given device.
- * @desc:		Pointer to ti_sci_resource_desc to be updated with the
- *			resource range start index and number of resources
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_get_resource_range(const struct ti_sci_handle *handle,
-					 u32 dev_id, u8 subtype,
-					 struct ti_sci_resource_desc *desc)
-{
-	return ti_sci_get_resource_range(handle, dev_id, subtype,
-					 TI_SCI_IRQ_SECONDARY_HOST_INVALID,
-					 desc);
-}
-
-/**
- * ti_sci_cmd_get_resource_range_from_shost - Get a range of resources
- *					      assigned to a specified host.
- * @handle:		Pointer to TISCI handle.
- * @dev_id:		TISCI device ID.
- * @subtype:		Resource assignment subtype that is being requested
- *			from the given device.
- * @s_host:		Host processor ID to which the resources are allocated
- * @desc:		Pointer to ti_sci_resource_desc to be updated with the
- *			resource range start index and number of resources
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static
-int ti_sci_cmd_get_resource_range_from_shost(const struct ti_sci_handle *handle,
-					     u32 dev_id, u8 subtype, u8 s_host,
-					     struct ti_sci_resource_desc *desc)
-{
-	return ti_sci_get_resource_range(handle, dev_id, subtype, s_host, desc);
-}
-
-/**
- * ti_sci_manage_irq() - Helper api to configure/release the irq route between
- *			 the requested source and destination
- * @handle:		Pointer to TISCI handle.
- * @valid_params:	Bit fields defining the validity of certain params
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @dst_id:		Device ID of the IRQ destination
- * @dst_host_irq:	IRQ number of the destination device
- * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
- * @vint:		Virtual interrupt to be used within the IA
- * @global_event:	Global event number to be used for the requesting event
- * @vint_status_bit:	Virtual interrupt status bit to be used for the event
- * @s_host:		Secondary host ID to which the irq/event is being
- *			requested for.
- * @type:		Request type irq set or release.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
-			     u32 valid_params, u16 src_id, u16 src_index,
-			     u16 dst_id, u16 dst_host_irq, u16 ia_id, u16 vint,
-			     u16 global_event, u8 vint_status_bit, u8 s_host,
-			     u16 type)
-{
-	struct ti_sci_msg_req_manage_irq req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.valid_params = valid_params;
-	req.src_id = src_id;
-	req.src_index = src_index;
-	req.dst_id = dst_id;
-	req.dst_host_irq = dst_host_irq;
-	req.ia_id = ia_id;
-	req.vint = vint;
-	req.global_event = global_event;
-	req.vint_status_bit = vint_status_bit;
-	req.secondary_host = s_host;
-
-	ret = ti_sci_do_xfer(handle, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_irq_hash() - Helper API to compute irq hash for the hash table.
- * @irq:	irq to hash
- *
- * Return: the computed hash value.
- */
-static int ti_sci_irq_hash(struct ti_sci_msg_req_manage_irq *irq)
-{
-	return irq->src_id ^ irq->src_index;
-}
-
-/**
- * ti_sci_irq_equal() - Helper API to compare two irqs (generic headers are not
- *                       compared)
- * @irq_a:	irq_a to compare
- * @irq_b:	irq_b to compare
- *
- * Return: true if the two irqs are equal, else false.
- */
-static bool ti_sci_irq_equal(struct ti_sci_msg_req_manage_irq *irq_a,
-			     struct ti_sci_msg_req_manage_irq *irq_b)
-{
-	return !memcmp(&irq_a->valid_params, &irq_b->valid_params,
-		       sizeof(*irq_a) - sizeof(irq_a->hdr));
-}
-
-/**
- * ti_sci_set_irq() - Helper api to configure the irq route between the
- *		      requested source and destination
- * @handle:		Pointer to TISCI handle.
- * @valid_params:	Bit fields defining the validity of certain params
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @dst_id:		Device ID of the IRQ destination
- * @dst_host_irq:	IRQ number of the destination device
- * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
- * @vint:		Virtual interrupt to be used within the IA
- * @global_event:	Global event number to be used for the requesting event
- * @vint_status_bit:	Virtual interrupt status bit to be used for the event
- * @s_host:		Secondary host ID to which the irq/event is being
- *			requested for.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
-			  u16 src_id, u16 src_index, u16 dst_id,
-			  u16 dst_host_irq, u16 ia_id, u16 vint,
-			  u16 global_event, u8 vint_status_bit, u8 s_host)
-{
-	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
-	struct ti_sci_msg_req_manage_irq *desc;
-	struct ti_sci_irq *irq;
-	int ret;
-
-	/* Lock for set_irq() and free_irq() to keep the IRQ hash list consistent */
-	guard(mutex)(&info->irq_lock);
-
-	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
-		 __func__, valid_params, src_id, src_index,
-		 dst_id, dst_host_irq, ia_id, vint, global_event,
-		 vint_status_bit);
-
-	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
-				dst_id, dst_host_irq, ia_id, vint,
-				global_event, vint_status_bit, s_host,
-				TI_SCI_MSG_SET_IRQ);
-
-	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
-		goto end;
-
-	irq = kzalloc_obj(*irq);
-	if (!irq) {
-		ti_sci_manage_irq(handle, valid_params, src_id, src_index,
-				  dst_id, dst_host_irq, ia_id, vint,
-				  global_event, vint_status_bit, s_host,
-				  TI_SCI_MSG_FREE_IRQ);
-		ret = -ENOMEM;
-		goto end;
-	}
-
-	desc = &irq->desc;
-	desc->valid_params = valid_params;
-	desc->src_id = src_id;
-	desc->src_index = src_index;
-	desc->dst_id = dst_id;
-	desc->dst_host_irq = dst_host_irq;
-	desc->ia_id = ia_id;
-	desc->vint = vint;
-	desc->global_event = global_event;
-	desc->vint_status_bit = vint_status_bit;
-	desc->secondary_host = s_host;
-
-	hash_add(info->irqs, &irq->node, ti_sci_irq_hash(desc));
-
-end:
-	return ret;
-}
-
-/**
- * ti_sci_free_irq() - Helper api to free the irq route between the
- *			   requested source and destination
- * @handle:		Pointer to TISCI handle.
- * @valid_params:	Bit fields defining the validity of certain params
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @dst_id:		Device ID of the IRQ destination
- * @dst_host_irq:	IRQ number of the destination device
- * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
- * @vint:		Virtual interrupt to be used within the IA
- * @global_event:	Global event number to be used for the requesting event
- * @vint_status_bit:	Virtual interrupt status bit to be used for the event
- * @s_host:		Secondary host ID to which the irq/event is being
- *			requested for.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
-			   u16 src_id, u16 src_index, u16 dst_id,
-			   u16 dst_host_irq, u16 ia_id, u16 vint,
-			   u16 global_event, u8 vint_status_bit, u8 s_host)
-{
-	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
-	struct ti_sci_msg_req_manage_irq irq_desc;
-	struct device *dev = info->dev;
-	struct ti_sci_irq *this_irq;
-	struct hlist_node *tmp_node;
-	int ret;
-
-	guard(mutex)(&info->irq_lock);
-
-	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
-		 __func__, valid_params, src_id, src_index,
-		 dst_id, dst_host_irq, ia_id, vint, global_event,
-		 vint_status_bit);
-
-	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
-				dst_id, dst_host_irq, ia_id, vint,
-				global_event, vint_status_bit, s_host,
-				TI_SCI_MSG_FREE_IRQ);
-
-	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
-		goto end;
-
-	irq_desc.valid_params = valid_params;
-	irq_desc.src_id = src_id;
-	irq_desc.src_index = src_index;
-	irq_desc.dst_id = dst_id;
-	irq_desc.dst_host_irq = dst_host_irq;
-	irq_desc.ia_id = ia_id;
-	irq_desc.vint = vint;
-	irq_desc.global_event = global_event;
-	irq_desc.vint_status_bit = vint_status_bit;
-	irq_desc.secondary_host = s_host;
-
-	hash_for_each_possible_safe(info->irqs, this_irq, tmp_node, node,
-				    ti_sci_irq_hash(&irq_desc)) {
-		if (ti_sci_irq_equal(&irq_desc, &this_irq->desc)) {
-			hlist_del(&this_irq->node);
-			kfree(this_irq);
-			goto end;
-		}
-	}
-
-	dev_warn(dev, "%s: should not be here, IRQ was not found in hash list\n",
-		 __func__);
-
-end:
-	return ret;
-}
-
-/**
- * ti_sci_cmd_set_irq() - Configure a host irq route between the requested
- *			  source and destination.
- * @handle:		Pointer to TISCI handle.
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @dst_id:		Device ID of the IRQ destination
- * @dst_host_irq:	IRQ number of the destination device
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_set_irq(const struct ti_sci_handle *handle, u16 src_id,
-			      u16 src_index, u16 dst_id, u16 dst_host_irq)
-{
-	u32 valid_params = MSG_FLAG_DST_ID_VALID | MSG_FLAG_DST_HOST_IRQ_VALID;
-
-	return ti_sci_set_irq(handle, valid_params, src_id, src_index, dst_id,
-			      dst_host_irq, 0, 0, 0, 0, 0);
-}
-
-/**
- * ti_sci_cmd_set_event_map() - Configure an event based irq route between the
- *				requested source and Interrupt Aggregator.
- * @handle:		Pointer to TISCI handle.
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
- * @vint:		Virtual interrupt to be used within the IA
- * @global_event:	Global event number to be used for the requesting event
- * @vint_status_bit:	Virtual interrupt status bit to be used for the event
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_set_event_map(const struct ti_sci_handle *handle,
-				    u16 src_id, u16 src_index, u16 ia_id,
-				    u16 vint, u16 global_event,
-				    u8 vint_status_bit)
-{
-	u32 valid_params = MSG_FLAG_IA_ID_VALID | MSG_FLAG_VINT_VALID |
-			   MSG_FLAG_GLB_EVNT_VALID |
-			   MSG_FLAG_VINT_STS_BIT_VALID;
-
-	return ti_sci_set_irq(handle, valid_params, src_id, src_index, 0, 0,
-			      ia_id, vint, global_event, vint_status_bit, 0);
-}
-
-/**
- * ti_sci_cmd_free_irq() - Free a host irq route between the between the
- *			   requested source and destination.
- * @handle:		Pointer to TISCI handle.
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @dst_id:		Device ID of the IRQ destination
- * @dst_host_irq:	IRQ number of the destination device
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_free_irq(const struct ti_sci_handle *handle, u16 src_id,
-			       u16 src_index, u16 dst_id, u16 dst_host_irq)
-{
-	u32 valid_params = MSG_FLAG_DST_ID_VALID | MSG_FLAG_DST_HOST_IRQ_VALID;
-
-	return ti_sci_free_irq(handle, valid_params, src_id, src_index, dst_id,
-			       dst_host_irq, 0, 0, 0, 0, 0);
-}
-
-/**
- * ti_sci_cmd_free_event_map() - Free an event map between the requested source
- *				 and Interrupt Aggregator.
- * @handle:		Pointer to TISCI handle.
- * @src_id:		Device ID of the IRQ source
- * @src_index:		IRQ source index within the source device
- * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
- * @vint:		Virtual interrupt to be used within the IA
- * @global_event:	Global event number to be used for the requesting event
- * @vint_status_bit:	Virtual interrupt status bit to be used for the event
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_free_event_map(const struct ti_sci_handle *handle,
-				     u16 src_id, u16 src_index, u16 ia_id,
-				     u16 vint, u16 global_event,
-				     u8 vint_status_bit)
-{
-	u32 valid_params = MSG_FLAG_IA_ID_VALID |
-			   MSG_FLAG_VINT_VALID | MSG_FLAG_GLB_EVNT_VALID |
-			   MSG_FLAG_VINT_STS_BIT_VALID;
-
-	return ti_sci_free_irq(handle, valid_params, src_id, src_index, 0, 0,
-			       ia_id, vint, global_event, vint_status_bit, 0);
-}
-
-/**
- * ti_sci_cmd_rm_ring_cfg() - Configure a NAVSS ring
- * @handle:	Pointer to TI SCI handle.
- * @params:	Pointer to ti_sci_msg_rm_ring_cfg ring config structure
- *
- * Return: 0 if all went well, else returns appropriate error value.
- *
- * See @ti_sci_msg_rm_ring_cfg and @ti_sci_msg_rm_ring_cfg_req for
- * more info.
- */
-static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
-				  const struct ti_sci_msg_rm_ring_cfg *params)
-{
-	struct ti_sci_msg_rm_ring_cfg_req req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.valid_params = params->valid_params;
-	req.nav_id = params->nav_id;
-	req.index = params->index;
-	req.addr_lo = params->addr_lo;
-	req.addr_hi = params->addr_hi;
-	req.count = params->count;
-	req.mode = params->mode;
-	req.size = params->size;
-	req.order_id = params->order_id;
-	req.virtid = params->virtid;
-	req.asel = params->asel;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_RING_CFG,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_rm_psil_pair() - Pair PSI-L source to destination thread
- * @handle:	Pointer to TI SCI handle.
- * @nav_id:	Device ID of Navigator Subsystem which should be used for
- *		pairing
- * @src_thread:	Source PSI-L thread ID
- * @dst_thread: Destination PSI-L thread ID
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
-				   u32 nav_id, u32 src_thread, u32 dst_thread)
-{
-	struct ti_sci_msg_psil_pair req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.nav_id = nav_id;
-	req.src_thread = src_thread;
-	req.dst_thread = dst_thread;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_PAIR,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_rm_psil_unpair() - Unpair PSI-L source from destination thread
- * @handle:	Pointer to TI SCI handle.
- * @nav_id:	Device ID of Navigator Subsystem which should be used for
- *		unpairing
- * @src_thread:	Source PSI-L thread ID
- * @dst_thread:	Destination PSI-L thread ID
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
-				     u32 nav_id, u32 src_thread, u32 dst_thread)
-{
-	struct ti_sci_msg_psil_unpair req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.nav_id = nav_id;
-	req.src_thread = src_thread;
-	req.dst_thread = dst_thread;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_UNPAIR,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_rm_udmap_tx_ch_cfg() - Configure a UDMAP TX channel
- * @handle:	Pointer to TI SCI handle.
- * @params:	Pointer to ti_sci_msg_rm_udmap_tx_ch_cfg TX channel config
- *		structure
- *
- * Return: 0 if all went well, else returns appropriate error value.
- *
- * See @ti_sci_msg_rm_udmap_tx_ch_cfg and @ti_sci_msg_rm_udmap_tx_ch_cfg_req for
- * more info.
- */
-static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
-			const struct ti_sci_msg_rm_udmap_tx_ch_cfg *params)
-{
-	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.valid_params = params->valid_params;
-	req.nav_id = params->nav_id;
-	req.index = params->index;
-	req.tx_pause_on_err = params->tx_pause_on_err;
-	req.tx_filt_einfo = params->tx_filt_einfo;
-	req.tx_filt_pswords = params->tx_filt_pswords;
-	req.tx_atype = params->tx_atype;
-	req.tx_chan_type = params->tx_chan_type;
-	req.tx_supr_tdpkt = params->tx_supr_tdpkt;
-	req.tx_fetch_size = params->tx_fetch_size;
-	req.tx_credit_count = params->tx_credit_count;
-	req.txcq_qnum = params->txcq_qnum;
-	req.tx_priority = params->tx_priority;
-	req.tx_qos = params->tx_qos;
-	req.tx_orderid = params->tx_orderid;
-	req.fdepth = params->fdepth;
-	req.tx_sched_priority = params->tx_sched_priority;
-	req.tx_burst_size = params->tx_burst_size;
-	req.tx_tdtype = params->tx_tdtype;
-	req.extended_ch_type = params->extended_ch_type;
-
-	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_rm_udmap_rx_ch_cfg() - Configure a UDMAP RX channel
- * @handle:	Pointer to TI SCI handle.
- * @params:	Pointer to ti_sci_msg_rm_udmap_rx_ch_cfg RX channel config
- *		structure
- *
- * Return: 0 if all went well, else returns appropriate error value.
- *
- * See @ti_sci_msg_rm_udmap_rx_ch_cfg and @ti_sci_msg_rm_udmap_rx_ch_cfg_req for
- * more info.
- */
-static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
-			const struct ti_sci_msg_rm_udmap_rx_ch_cfg *params)
-{
-	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.valid_params = params->valid_params;
-	req.nav_id = params->nav_id;
-	req.index = params->index;
-	req.rx_fetch_size = params->rx_fetch_size;
-	req.rxcq_qnum = params->rxcq_qnum;
-	req.rx_priority = params->rx_priority;
-	req.rx_qos = params->rx_qos;
-	req.rx_orderid = params->rx_orderid;
-	req.rx_sched_priority = params->rx_sched_priority;
-	req.flowid_start = params->flowid_start;
-	req.flowid_cnt = params->flowid_cnt;
-	req.rx_pause_on_err = params->rx_pause_on_err;
-	req.rx_atype = params->rx_atype;
-	req.rx_chan_type = params->rx_chan_type;
-	req.rx_ignore_short = params->rx_ignore_short;
-	req.rx_ignore_long = params->rx_ignore_long;
-	req.rx_burst_size = params->rx_burst_size;
-
-	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_rm_udmap_rx_flow_cfg() - Configure UDMAP RX FLOW
- * @handle:	Pointer to TI SCI handle.
- * @params:	Pointer to ti_sci_msg_rm_udmap_flow_cfg RX FLOW config
- *		structure
- *
- * Return: 0 if all went well, else returns appropriate error value.
- *
- * See @ti_sci_msg_rm_udmap_flow_cfg and @ti_sci_msg_rm_udmap_flow_cfg_req for
- * more info.
- */
-static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
-			const struct ti_sci_msg_rm_udmap_flow_cfg *params)
-{
-	struct ti_sci_msg_rm_udmap_flow_cfg_req req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.valid_params = params->valid_params;
-	req.nav_id = params->nav_id;
-	req.flow_index = params->flow_index;
-	req.rx_einfo_present = params->rx_einfo_present;
-	req.rx_psinfo_present = params->rx_psinfo_present;
-	req.rx_error_handling = params->rx_error_handling;
-	req.rx_desc_type = params->rx_desc_type;
-	req.rx_sop_offset = params->rx_sop_offset;
-	req.rx_dest_qnum = params->rx_dest_qnum;
-	req.rx_src_tag_hi = params->rx_src_tag_hi;
-	req.rx_src_tag_lo = params->rx_src_tag_lo;
-	req.rx_dest_tag_hi = params->rx_dest_tag_hi;
-	req.rx_dest_tag_lo = params->rx_dest_tag_lo;
-	req.rx_src_tag_hi_sel = params->rx_src_tag_hi_sel;
-	req.rx_src_tag_lo_sel = params->rx_src_tag_lo_sel;
-	req.rx_dest_tag_hi_sel = params->rx_dest_tag_hi_sel;
-	req.rx_dest_tag_lo_sel = params->rx_dest_tag_lo_sel;
-	req.rx_fdq0_sz0_qnum = params->rx_fdq0_sz0_qnum;
-	req.rx_fdq1_qnum = params->rx_fdq1_qnum;
-	req.rx_fdq2_qnum = params->rx_fdq2_qnum;
-	req.rx_fdq3_qnum = params->rx_fdq3_qnum;
-	req.rx_ps_location = params->rx_ps_location;
-
-	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_FLOW_CFG,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 /**
  * ti_sci_cmd_proc_request() - Command to request a physical processor control
  * @handle:	Pointer to TI SCI handle
@@ -1495,23 +834,11 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 		ti_sci_setup_pm_ops(pmops);
 	}
 
-	rm_core_ops->get_range = ti_sci_cmd_get_resource_range;
-	rm_core_ops->get_range_from_shost =
-				ti_sci_cmd_get_resource_range_from_shost;
-
-	iops->set_irq = ti_sci_cmd_set_irq;
-	iops->set_event_map = ti_sci_cmd_set_event_map;
-	iops->free_irq = ti_sci_cmd_free_irq;
-	iops->free_event_map = ti_sci_cmd_free_event_map;
-
-	rops->set_cfg = ti_sci_cmd_rm_ring_cfg;
-
-	psilops->pair = ti_sci_cmd_rm_psil_pair;
-	psilops->unpair = ti_sci_cmd_rm_psil_unpair;
-
-	udmap_ops->tx_ch_cfg = ti_sci_cmd_rm_udmap_tx_ch_cfg;
-	udmap_ops->rx_ch_cfg = ti_sci_cmd_rm_udmap_rx_ch_cfg;
-	udmap_ops->rx_flow_cfg = ti_sci_cmd_rm_udmap_rx_flow_cfg;
+	ti_sci_setup_rm_core_ops(rm_core_ops);
+	ti_sci_setup_rm_irq_ops(iops);
+	ti_sci_setup_rm_ringacc_ops(rops);
+	ti_sci_setup_rm_psil_ops(psilops);
+	ti_sci_setup_rm_udmap_ops(udmap_ops);
 
 	pops->request = ti_sci_cmd_proc_request;
 	pops->release = ti_sci_cmd_proc_release;
@@ -1722,198 +1049,6 @@ const struct ti_sci_handle *devm_ti_sci_get_by_phandle(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_ti_sci_get_by_phandle);
 
-/**
- * ti_sci_get_free_resource() - Get a free resource from TISCI resource.
- * @res:	Pointer to the TISCI resource
- *
- * Return: resource num if all went ok else TI_SCI_RESOURCE_NULL.
- */
-u16 ti_sci_get_free_resource(struct ti_sci_resource *res)
-{
-	unsigned long flags;
-	u16 set, free_bit;
-
-	raw_spin_lock_irqsave(&res->lock, flags);
-	for (set = 0; set < res->sets; set++) {
-		struct ti_sci_resource_desc *desc = &res->desc[set];
-		int res_count = desc->num + desc->num_sec;
-
-		free_bit = find_first_zero_bit(desc->res_map, res_count);
-		if (free_bit != res_count) {
-			__set_bit(free_bit, desc->res_map);
-			raw_spin_unlock_irqrestore(&res->lock, flags);
-
-			if (desc->num && free_bit < desc->num)
-				return desc->start + free_bit;
-			else
-				return desc->start_sec + free_bit;
-		}
-	}
-	raw_spin_unlock_irqrestore(&res->lock, flags);
-
-	return TI_SCI_RESOURCE_NULL;
-}
-EXPORT_SYMBOL_GPL(ti_sci_get_free_resource);
-
-/**
- * ti_sci_release_resource() - Release a resource from TISCI resource.
- * @res:	Pointer to the TISCI resource
- * @id:		Resource id to be released.
- */
-void ti_sci_release_resource(struct ti_sci_resource *res, u16 id)
-{
-	unsigned long flags;
-	u16 set;
-
-	raw_spin_lock_irqsave(&res->lock, flags);
-	for (set = 0; set < res->sets; set++) {
-		struct ti_sci_resource_desc *desc = &res->desc[set];
-
-		if (desc->num && desc->start <= id &&
-		    (desc->start + desc->num) > id)
-			__clear_bit(id - desc->start, desc->res_map);
-		else if (desc->num_sec && desc->start_sec <= id &&
-			 (desc->start_sec + desc->num_sec) > id)
-			__clear_bit(id - desc->start_sec, desc->res_map);
-	}
-	raw_spin_unlock_irqrestore(&res->lock, flags);
-}
-EXPORT_SYMBOL_GPL(ti_sci_release_resource);
-
-/**
- * ti_sci_get_num_resources() - Get the number of resources in TISCI resource
- * @res:	Pointer to the TISCI resource
- *
- * Return: Total number of available resources.
- */
-u32 ti_sci_get_num_resources(struct ti_sci_resource *res)
-{
-	u32 set, count = 0;
-
-	for (set = 0; set < res->sets; set++)
-		count += res->desc[set].num + res->desc[set].num_sec;
-
-	return count;
-}
-EXPORT_SYMBOL_GPL(ti_sci_get_num_resources);
-
-/**
- * devm_ti_sci_get_resource_sets() - Get a TISCI resources assigned to a device
- * @handle:	TISCI handle
- * @dev:	Device pointer to which the resource is assigned
- * @dev_id:	TISCI device id to which the resource is assigned
- * @sub_types:	Array of sub_types assigned corresponding to device
- * @sets:	Number of sub_types
- *
- * Return: Pointer to ti_sci_resource if all went well else appropriate
- *	   error pointer.
- */
-static struct ti_sci_resource *
-devm_ti_sci_get_resource_sets(const struct ti_sci_handle *handle,
-			      struct device *dev, u32 dev_id, u32 *sub_types,
-			      u32 sets)
-{
-	struct ti_sci_resource *res;
-	bool valid_set = false;
-	int i, ret, res_count;
-
-	res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
-	if (!res)
-		return ERR_PTR(-ENOMEM);
-
-	res->sets = sets;
-	res->desc = devm_kcalloc(dev, res->sets, sizeof(*res->desc),
-				 GFP_KERNEL);
-	if (!res->desc)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < res->sets; i++) {
-		ret = handle->ops.rm_core_ops.get_range(handle, dev_id,
-							sub_types[i],
-							&res->desc[i]);
-		if (ret) {
-			dev_dbg(dev, "dev = %d subtype %d not allocated for this host\n",
-				dev_id, sub_types[i]);
-			memset(&res->desc[i], 0, sizeof(res->desc[i]));
-			continue;
-		}
-
-		dev_dbg(dev, "dev/sub_type: %d/%d, start/num: %d/%d | %d/%d\n",
-			dev_id, sub_types[i], res->desc[i].start,
-			res->desc[i].num, res->desc[i].start_sec,
-			res->desc[i].num_sec);
-
-		valid_set = true;
-		res_count = res->desc[i].num + res->desc[i].num_sec;
-		res->desc[i].res_map = devm_bitmap_zalloc(dev, res_count,
-							  GFP_KERNEL);
-		if (!res->desc[i].res_map)
-			return ERR_PTR(-ENOMEM);
-	}
-	raw_spin_lock_init(&res->lock);
-
-	if (valid_set)
-		return res;
-
-	return ERR_PTR(-EINVAL);
-}
-
-/**
- * devm_ti_sci_get_of_resource() - Get a TISCI resource assigned to a device
- * @handle:	TISCI handle
- * @dev:	Device pointer to which the resource is assigned
- * @dev_id:	TISCI device id to which the resource is assigned
- * @of_prop:	property name by which the resource are represented
- *
- * Return: Pointer to ti_sci_resource if all went well else appropriate
- *	   error pointer.
- */
-struct ti_sci_resource *
-devm_ti_sci_get_of_resource(const struct ti_sci_handle *handle,
-			    struct device *dev, u32 dev_id, char *of_prop)
-{
-	struct ti_sci_resource *res;
-	u32 *sub_types;
-	int sets;
-
-	sets = of_property_count_elems_of_size(dev_of_node(dev), of_prop,
-					       sizeof(u32));
-	if (sets < 0) {
-		dev_err(dev, "%s resource type ids not available\n", of_prop);
-		return ERR_PTR(sets);
-	}
-
-	sub_types = kcalloc(sets, sizeof(*sub_types), GFP_KERNEL);
-	if (!sub_types)
-		return ERR_PTR(-ENOMEM);
-
-	of_property_read_u32_array(dev_of_node(dev), of_prop, sub_types, sets);
-	res = devm_ti_sci_get_resource_sets(handle, dev, dev_id, sub_types,
-					    sets);
-
-	kfree(sub_types);
-	return res;
-}
-EXPORT_SYMBOL_GPL(devm_ti_sci_get_of_resource);
-
-/**
- * devm_ti_sci_get_resource() - Get a resource range assigned to the device
- * @handle:	TISCI handle
- * @dev:	Device pointer to which the resource is assigned
- * @dev_id:	TISCI device id to which the resource is assigned
- * @sub_type:	TISCI resource subytpe representing the resource.
- *
- * Return: Pointer to ti_sci_resource if all went well else appropriate
- *	   error pointer.
- */
-struct ti_sci_resource *
-devm_ti_sci_get_resource(const struct ti_sci_handle *handle, struct device *dev,
-			 u32 dev_id, u32 sub_type)
-{
-	return devm_ti_sci_get_resource_sets(handle, dev, dev_id, &sub_type, 1);
-}
-EXPORT_SYMBOL_GPL(devm_ti_sci_get_resource);
-
 /*
  * Iterate all device nodes that have a wakeup-source property and check if one
  * of the possible phandles points to a Partial-IO system state. If it
diff --git a/drivers/firmware/ti/ti_sci_rm.c b/drivers/firmware/ti/ti_sci_rm.c
new file mode 100644
index 0000000000000..24ac3d963f370
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_rm.c
@@ -0,0 +1,907 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_get_resource_range - Helper to get a range of resources assigned
+ *			       to a host. Resource is uniquely identified by
+ *			       type and subtype.
+ * @handle:		Pointer to TISCI handle.
+ * @dev_id:		TISCI device ID.
+ * @subtype:		Resource assignment subtype that is being requested
+ *			from the given device.
+ * @s_host:		Host processor ID to which the resources are allocated
+ * @desc:		Pointer to ti_sci_resource_desc to be updated with the
+ *			resource range start index and number of resources
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
+				     u32 dev_id, u8 subtype, u8 s_host,
+				     struct ti_sci_resource_desc *desc)
+{
+	struct ti_sci_msg_resp_get_resource_range resp;
+	struct ti_sci_msg_req_get_resource_range req;
+	int ret = 0;
+
+	if (!desc)
+		return -EINVAL;
+
+	req.secondary_host = s_host;
+	req.type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
+	req.subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_RESOURCE_RANGE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (!resp.range_num && !resp.range_num_sec) {
+		/* Neither of the two resource range is valid */
+		ret = -ENODEV;
+	} else {
+		desc->start = resp.range_start;
+		desc->num = resp.range_num;
+		desc->start_sec = resp.range_start_sec;
+		desc->num_sec = resp.range_num_sec;
+	}
+
+	return ret;
+}
+
+/**
+ * ti_sci_cmd_get_resource_range - Get a range of resources assigned to host
+ *				   that is same as ti sci interface host.
+ * @handle:		Pointer to TISCI handle.
+ * @dev_id:		TISCI device ID.
+ * @subtype:		Resource assignment subtype that is being requested
+ *			from the given device.
+ * @desc:		Pointer to ti_sci_resource_desc to be updated with the
+ *			resource range start index and number of resources
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_resource_range(const struct ti_sci_handle *handle,
+					 u32 dev_id, u8 subtype,
+					 struct ti_sci_resource_desc *desc)
+{
+	return ti_sci_get_resource_range(handle, dev_id, subtype,
+					 TI_SCI_IRQ_SECONDARY_HOST_INVALID,
+					 desc);
+}
+
+/**
+ * ti_sci_cmd_get_resource_range_from_shost - Get a range of resources
+ *					      assigned to a specified host.
+ * @handle:		Pointer to TISCI handle.
+ * @dev_id:		TISCI device ID.
+ * @subtype:		Resource assignment subtype that is being requested
+ *			from the given device.
+ * @s_host:		Host processor ID to which the resources are allocated
+ * @desc:		Pointer to ti_sci_resource_desc to be updated with the
+ *			resource range start index and number of resources
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static
+int ti_sci_cmd_get_resource_range_from_shost(const struct ti_sci_handle *handle,
+					     u32 dev_id, u8 subtype, u8 s_host,
+					     struct ti_sci_resource_desc *desc)
+{
+	return ti_sci_get_resource_range(handle, dev_id, subtype, s_host, desc);
+}
+
+/**
+ * ti_sci_manage_irq() - Helper api to configure/release the irq route between
+ *			 the requested source and destination
+ * @handle:		Pointer to TISCI handle.
+ * @valid_params:	Bit fields defining the validity of certain params
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
+ * @vint:		Virtual interrupt to be used within the IA
+ * @global_event:	Global event number to be used for the requesting event
+ * @vint_status_bit:	Virtual interrupt status bit to be used for the event
+ * @s_host:		Secondary host ID to which the irq/event is being
+ *			requested for.
+ * @type:		Request type irq set or release.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+int ti_sci_manage_irq(const struct ti_sci_handle *handle,
+		      u32 valid_params, u16 src_id, u16 src_index,
+		      u16 dst_id, u16 dst_host_irq, u16 ia_id, u16 vint,
+		      u16 global_event, u8 vint_status_bit, u8 s_host,
+		      u16 type)
+{
+	struct ti_sci_msg_req_manage_irq req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.valid_params = valid_params;
+	req.src_id = src_id;
+	req.src_index = src_index;
+	req.dst_id = dst_id;
+	req.dst_host_irq = dst_host_irq;
+	req.ia_id = ia_id;
+	req.vint = vint;
+	req.global_event = global_event;
+	req.vint_status_bit = vint_status_bit;
+	req.secondary_host = s_host;
+
+	ret = ti_sci_do_xfer(handle, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_irq_hash() - Helper API to compute irq hash for the hash table.
+ * @irq:	irq to hash
+ *
+ * Return: the computed hash value.
+ */
+static int ti_sci_irq_hash(struct ti_sci_msg_req_manage_irq *irq)
+{
+	return irq->src_id ^ irq->src_index;
+}
+
+/**
+ * ti_sci_irq_equal() - Helper API to compare two irqs (generic headers are not
+ *                       compared)
+ * @irq_a:	irq_a to compare
+ * @irq_b:	irq_b to compare
+ *
+ * Return: true if the two irqs are equal, else false.
+ */
+static bool ti_sci_irq_equal(struct ti_sci_msg_req_manage_irq *irq_a,
+			     struct ti_sci_msg_req_manage_irq *irq_b)
+{
+	return !memcmp(&irq_a->valid_params, &irq_b->valid_params,
+		       sizeof(*irq_a) - sizeof(irq_a->hdr));
+}
+
+/**
+ * ti_sci_set_irq() - Helper api to configure the irq route between the
+ *		      requested source and destination
+ * @handle:		Pointer to TISCI handle.
+ * @valid_params:	Bit fields defining the validity of certain params
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
+ * @vint:		Virtual interrupt to be used within the IA
+ * @global_event:	Global event number to be used for the requesting event
+ * @vint_status_bit:	Virtual interrupt status bit to be used for the event
+ * @s_host:		Secondary host ID to which the irq/event is being
+ *			requested for.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
+			  u16 src_id, u16 src_index, u16 dst_id,
+			  u16 dst_host_irq, u16 ia_id, u16 vint,
+			  u16 global_event, u8 vint_status_bit, u8 s_host)
+{
+	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
+	struct ti_sci_msg_req_manage_irq *desc;
+	struct ti_sci_irq *irq;
+	int ret;
+
+	/* Lock for set_irq() and free_irq() to keep the IRQ hash list consistent */
+	guard(mutex)(&info->irq_lock);
+
+	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
+		 __func__, valid_params, src_id, src_index,
+		 dst_id, dst_host_irq, ia_id, vint, global_event,
+		 vint_status_bit);
+
+	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
+				dst_id, dst_host_irq, ia_id, vint,
+				global_event, vint_status_bit, s_host,
+				TI_SCI_MSG_SET_IRQ);
+
+	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
+		goto end;
+
+	irq = kzalloc_obj(*irq);
+	if (!irq) {
+		ti_sci_manage_irq(handle, valid_params, src_id, src_index,
+				  dst_id, dst_host_irq, ia_id, vint,
+				  global_event, vint_status_bit, s_host,
+				  TI_SCI_MSG_FREE_IRQ);
+		ret = -ENOMEM;
+		goto end;
+	}
+
+	desc = &irq->desc;
+	desc->valid_params = valid_params;
+	desc->src_id = src_id;
+	desc->src_index = src_index;
+	desc->dst_id = dst_id;
+	desc->dst_host_irq = dst_host_irq;
+	desc->ia_id = ia_id;
+	desc->vint = vint;
+	desc->global_event = global_event;
+	desc->vint_status_bit = vint_status_bit;
+	desc->secondary_host = s_host;
+
+	hash_add(info->irqs, &irq->node, ti_sci_irq_hash(desc));
+
+end:
+	return ret;
+}
+
+/**
+ * ti_sci_free_irq() - Helper api to free the irq route between the
+ *			   requested source and destination
+ * @handle:		Pointer to TISCI handle.
+ * @valid_params:	Bit fields defining the validity of certain params
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
+ * @vint:		Virtual interrupt to be used within the IA
+ * @global_event:	Global event number to be used for the requesting event
+ * @vint_status_bit:	Virtual interrupt status bit to be used for the event
+ * @s_host:		Secondary host ID to which the irq/event is being
+ *			requested for.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
+			   u16 src_id, u16 src_index, u16 dst_id,
+			   u16 dst_host_irq, u16 ia_id, u16 vint,
+			   u16 global_event, u8 vint_status_bit, u8 s_host)
+{
+	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
+	struct ti_sci_msg_req_manage_irq irq_desc;
+	struct device *dev = info->dev;
+	struct ti_sci_irq *this_irq;
+	struct hlist_node *tmp_node;
+	int ret;
+
+	guard(mutex)(&info->irq_lock);
+
+	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
+		 __func__, valid_params, src_id, src_index,
+		 dst_id, dst_host_irq, ia_id, vint, global_event,
+		 vint_status_bit);
+
+	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
+				dst_id, dst_host_irq, ia_id, vint,
+				global_event, vint_status_bit, s_host,
+				TI_SCI_MSG_FREE_IRQ);
+
+	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
+		goto end;
+
+	irq_desc.valid_params = valid_params;
+	irq_desc.src_id = src_id;
+	irq_desc.src_index = src_index;
+	irq_desc.dst_id = dst_id;
+	irq_desc.dst_host_irq = dst_host_irq;
+	irq_desc.ia_id = ia_id;
+	irq_desc.vint = vint;
+	irq_desc.global_event = global_event;
+	irq_desc.vint_status_bit = vint_status_bit;
+	irq_desc.secondary_host = s_host;
+
+	hash_for_each_possible_safe(info->irqs, this_irq, tmp_node, node,
+				    ti_sci_irq_hash(&irq_desc)) {
+		if (ti_sci_irq_equal(&irq_desc, &this_irq->desc)) {
+			hlist_del(&this_irq->node);
+			kfree(this_irq);
+			goto end;
+		}
+	}
+
+	dev_warn(dev, "%s: should not be here, IRQ was not found in hash list\n",
+		 __func__);
+
+end:
+	return ret;
+}
+
+/**
+ * ti_sci_cmd_set_irq() - Configure a host irq route between the requested
+ *			  source and destination.
+ * @handle:		Pointer to TISCI handle.
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_set_irq(const struct ti_sci_handle *handle, u16 src_id,
+			      u16 src_index, u16 dst_id, u16 dst_host_irq)
+{
+	u32 valid_params = MSG_FLAG_DST_ID_VALID | MSG_FLAG_DST_HOST_IRQ_VALID;
+
+	return ti_sci_set_irq(handle, valid_params, src_id, src_index, dst_id,
+			      dst_host_irq, 0, 0, 0, 0, 0);
+}
+
+/**
+ * ti_sci_cmd_set_event_map() - Configure an event based irq route between the
+ *				requested source and Interrupt Aggregator.
+ * @handle:		Pointer to TISCI handle.
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
+ * @vint:		Virtual interrupt to be used within the IA
+ * @global_event:	Global event number to be used for the requesting event
+ * @vint_status_bit:	Virtual interrupt status bit to be used for the event
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_set_event_map(const struct ti_sci_handle *handle,
+				    u16 src_id, u16 src_index, u16 ia_id,
+				    u16 vint, u16 global_event,
+				    u8 vint_status_bit)
+{
+	u32 valid_params = MSG_FLAG_IA_ID_VALID | MSG_FLAG_VINT_VALID |
+			   MSG_FLAG_GLB_EVNT_VALID |
+			   MSG_FLAG_VINT_STS_BIT_VALID;
+
+	return ti_sci_set_irq(handle, valid_params, src_id, src_index, 0, 0,
+			      ia_id, vint, global_event, vint_status_bit, 0);
+}
+
+/**
+ * ti_sci_cmd_free_irq() - Free a host irq route between the between the
+ *			   requested source and destination.
+ * @handle:		Pointer to TISCI handle.
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_free_irq(const struct ti_sci_handle *handle, u16 src_id,
+			       u16 src_index, u16 dst_id, u16 dst_host_irq)
+{
+	u32 valid_params = MSG_FLAG_DST_ID_VALID | MSG_FLAG_DST_HOST_IRQ_VALID;
+
+	return ti_sci_free_irq(handle, valid_params, src_id, src_index, dst_id,
+			       dst_host_irq, 0, 0, 0, 0, 0);
+}
+
+/**
+ * ti_sci_cmd_free_event_map() - Free an event map between the requested source
+ *				 and Interrupt Aggregator.
+ * @handle:		Pointer to TISCI handle.
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @ia_id:		Device ID of the IA, if the IRQ flows through this IA
+ * @vint:		Virtual interrupt to be used within the IA
+ * @global_event:	Global event number to be used for the requesting event
+ * @vint_status_bit:	Virtual interrupt status bit to be used for the event
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_free_event_map(const struct ti_sci_handle *handle,
+				     u16 src_id, u16 src_index, u16 ia_id,
+				     u16 vint, u16 global_event,
+				     u8 vint_status_bit)
+{
+	u32 valid_params = MSG_FLAG_IA_ID_VALID |
+			   MSG_FLAG_VINT_VALID | MSG_FLAG_GLB_EVNT_VALID |
+			   MSG_FLAG_VINT_STS_BIT_VALID;
+
+	return ti_sci_free_irq(handle, valid_params, src_id, src_index, 0, 0,
+			       ia_id, vint, global_event, vint_status_bit, 0);
+}
+
+/**
+ * ti_sci_cmd_rm_ring_cfg() - Configure a NAVSS ring
+ * @handle:	Pointer to TI SCI handle.
+ * @params:	Pointer to ti_sci_msg_rm_ring_cfg ring config structure
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ *
+ * See @ti_sci_msg_rm_ring_cfg and @ti_sci_msg_rm_ring_cfg_req for
+ * more info.
+ */
+static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
+				  const struct ti_sci_msg_rm_ring_cfg *params)
+{
+	struct ti_sci_msg_rm_ring_cfg_req req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.index = params->index;
+	req.addr_lo = params->addr_lo;
+	req.addr_hi = params->addr_hi;
+	req.count = params->count;
+	req.mode = params->mode;
+	req.size = params->size;
+	req.order_id = params->order_id;
+	req.virtid = params->virtid;
+	req.asel = params->asel;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_RING_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_rm_psil_pair() - Pair PSI-L source to destination thread
+ * @handle:	Pointer to TI SCI handle.
+ * @nav_id:	Device ID of Navigator Subsystem which should be used for
+ *		pairing
+ * @src_thread:	Source PSI-L thread ID
+ * @dst_thread: Destination PSI-L thread ID
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
+				   u32 nav_id, u32 src_thread, u32 dst_thread)
+{
+	struct ti_sci_msg_psil_pair req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.nav_id = nav_id;
+	req.src_thread = src_thread;
+	req.dst_thread = dst_thread;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_PAIR,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_rm_psil_unpair() - Unpair PSI-L source from destination thread
+ * @handle:	Pointer to TI SCI handle.
+ * @nav_id:	Device ID of Navigator Subsystem which should be used for
+ *		unpairing
+ * @src_thread:	Source PSI-L thread ID
+ * @dst_thread:	Destination PSI-L thread ID
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
+				     u32 nav_id, u32 src_thread, u32 dst_thread)
+{
+	struct ti_sci_msg_psil_unpair req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.nav_id = nav_id;
+	req.src_thread = src_thread;
+	req.dst_thread = dst_thread;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_UNPAIR,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_rm_udmap_tx_ch_cfg() - Configure a UDMAP TX channel
+ * @handle:	Pointer to TI SCI handle.
+ * @params:	Pointer to ti_sci_msg_rm_udmap_tx_ch_cfg TX channel config
+ *		structure
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ *
+ * See @ti_sci_msg_rm_udmap_tx_ch_cfg and @ti_sci_msg_rm_udmap_tx_ch_cfg_req for
+ * more info.
+ */
+static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
+					 const struct ti_sci_msg_rm_udmap_tx_ch_cfg *params)
+{
+	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.index = params->index;
+	req.tx_pause_on_err = params->tx_pause_on_err;
+	req.tx_filt_einfo = params->tx_filt_einfo;
+	req.tx_filt_pswords = params->tx_filt_pswords;
+	req.tx_atype = params->tx_atype;
+	req.tx_chan_type = params->tx_chan_type;
+	req.tx_supr_tdpkt = params->tx_supr_tdpkt;
+	req.tx_fetch_size = params->tx_fetch_size;
+	req.tx_credit_count = params->tx_credit_count;
+	req.txcq_qnum = params->txcq_qnum;
+	req.tx_priority = params->tx_priority;
+	req.tx_qos = params->tx_qos;
+	req.tx_orderid = params->tx_orderid;
+	req.fdepth = params->fdepth;
+	req.tx_sched_priority = params->tx_sched_priority;
+	req.tx_burst_size = params->tx_burst_size;
+	req.tx_tdtype = params->tx_tdtype;
+	req.extended_ch_type = params->extended_ch_type;
+
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_rm_udmap_rx_ch_cfg() - Configure a UDMAP RX channel
+ * @handle:	Pointer to TI SCI handle.
+ * @params:	Pointer to ti_sci_msg_rm_udmap_rx_ch_cfg RX channel config
+ *		structure
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ *
+ * See @ti_sci_msg_rm_udmap_rx_ch_cfg and @ti_sci_msg_rm_udmap_rx_ch_cfg_req for
+ * more info.
+ */
+static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
+					 const struct ti_sci_msg_rm_udmap_rx_ch_cfg *params)
+{
+	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.index = params->index;
+	req.rx_fetch_size = params->rx_fetch_size;
+	req.rxcq_qnum = params->rxcq_qnum;
+	req.rx_priority = params->rx_priority;
+	req.rx_qos = params->rx_qos;
+	req.rx_orderid = params->rx_orderid;
+	req.rx_sched_priority = params->rx_sched_priority;
+	req.flowid_start = params->flowid_start;
+	req.flowid_cnt = params->flowid_cnt;
+	req.rx_pause_on_err = params->rx_pause_on_err;
+	req.rx_atype = params->rx_atype;
+	req.rx_chan_type = params->rx_chan_type;
+	req.rx_ignore_short = params->rx_ignore_short;
+	req.rx_ignore_long = params->rx_ignore_long;
+	req.rx_burst_size = params->rx_burst_size;
+
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_rm_udmap_rx_flow_cfg() - Configure UDMAP RX FLOW
+ * @handle:	Pointer to TI SCI handle.
+ * @params:	Pointer to ti_sci_msg_rm_udmap_flow_cfg RX FLOW config
+ *		structure
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ *
+ * See @ti_sci_msg_rm_udmap_flow_cfg and @ti_sci_msg_rm_udmap_flow_cfg_req for
+ * more info.
+ */
+static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
+					   const struct ti_sci_msg_rm_udmap_flow_cfg *params)
+{
+	struct ti_sci_msg_rm_udmap_flow_cfg_req req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.valid_params = params->valid_params;
+	req.nav_id = params->nav_id;
+	req.flow_index = params->flow_index;
+	req.rx_einfo_present = params->rx_einfo_present;
+	req.rx_psinfo_present = params->rx_psinfo_present;
+	req.rx_error_handling = params->rx_error_handling;
+	req.rx_desc_type = params->rx_desc_type;
+	req.rx_sop_offset = params->rx_sop_offset;
+	req.rx_dest_qnum = params->rx_dest_qnum;
+	req.rx_src_tag_hi = params->rx_src_tag_hi;
+	req.rx_src_tag_lo = params->rx_src_tag_lo;
+	req.rx_dest_tag_hi = params->rx_dest_tag_hi;
+	req.rx_dest_tag_lo = params->rx_dest_tag_lo;
+	req.rx_src_tag_hi_sel = params->rx_src_tag_hi_sel;
+	req.rx_src_tag_lo_sel = params->rx_src_tag_lo_sel;
+	req.rx_dest_tag_hi_sel = params->rx_dest_tag_hi_sel;
+	req.rx_dest_tag_lo_sel = params->rx_dest_tag_lo_sel;
+	req.rx_fdq0_sz0_qnum = params->rx_fdq0_sz0_qnum;
+	req.rx_fdq1_qnum = params->rx_fdq1_qnum;
+	req.rx_fdq2_qnum = params->rx_fdq2_qnum;
+	req.rx_fdq3_qnum = params->rx_fdq3_qnum;
+	req.rx_ps_location = params->rx_ps_location;
+
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_FLOW_CFG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_get_free_resource() - Get a free resource from TISCI resource.
+ * @res:	Pointer to the TISCI resource
+ *
+ * Return: resource num if all went ok else TI_SCI_RESOURCE_NULL.
+ */
+u16 ti_sci_get_free_resource(struct ti_sci_resource *res)
+{
+	unsigned long flags;
+	u16 set, free_bit;
+
+	raw_spin_lock_irqsave(&res->lock, flags);
+	for (set = 0; set < res->sets; set++) {
+		struct ti_sci_resource_desc *desc = &res->desc[set];
+		int res_count = desc->num + desc->num_sec;
+
+		free_bit = find_first_zero_bit(desc->res_map, res_count);
+		if (free_bit != res_count) {
+			__set_bit(free_bit, desc->res_map);
+			raw_spin_unlock_irqrestore(&res->lock, flags);
+
+			if (desc->num && free_bit < desc->num)
+				return desc->start + free_bit;
+			else
+				return desc->start_sec + free_bit;
+		}
+	}
+	raw_spin_unlock_irqrestore(&res->lock, flags);
+
+	return TI_SCI_RESOURCE_NULL;
+}
+EXPORT_SYMBOL_GPL(ti_sci_get_free_resource);
+
+/**
+ * ti_sci_release_resource() - Release a resource from TISCI resource.
+ * @res:	Pointer to the TISCI resource
+ * @id:		Resource id to be released.
+ */
+void ti_sci_release_resource(struct ti_sci_resource *res, u16 id)
+{
+	unsigned long flags;
+	u16 set;
+
+	raw_spin_lock_irqsave(&res->lock, flags);
+	for (set = 0; set < res->sets; set++) {
+		struct ti_sci_resource_desc *desc = &res->desc[set];
+
+		if (desc->num && desc->start <= id &&
+		    (desc->start + desc->num) > id)
+			__clear_bit(id - desc->start, desc->res_map);
+		else if (desc->num_sec && desc->start_sec <= id &&
+			 (desc->start_sec + desc->num_sec) > id)
+			__clear_bit(id - desc->start_sec, desc->res_map);
+	}
+	raw_spin_unlock_irqrestore(&res->lock, flags);
+}
+EXPORT_SYMBOL_GPL(ti_sci_release_resource);
+
+/**
+ * ti_sci_get_num_resources() - Get the number of resources in TISCI resource
+ * @res:	Pointer to the TISCI resource
+ *
+ * Return: Total number of available resources.
+ */
+u32 ti_sci_get_num_resources(struct ti_sci_resource *res)
+{
+	u32 set, count = 0;
+
+	for (set = 0; set < res->sets; set++)
+		count += res->desc[set].num + res->desc[set].num_sec;
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(ti_sci_get_num_resources);
+
+/**
+ * devm_ti_sci_get_resource_sets() - Get a TISCI resources assigned to a device
+ * @handle:	TISCI handle
+ * @dev:	Device pointer to which the resource is assigned
+ * @dev_id:	TISCI device id to which the resource is assigned
+ * @sub_types:	Array of sub_types assigned corresponding to device
+ * @sets:	Number of sub_types
+ *
+ * Return: Pointer to ti_sci_resource if all went well else appropriate
+ *	   error pointer.
+ */
+static struct ti_sci_resource *
+devm_ti_sci_get_resource_sets(const struct ti_sci_handle *handle,
+			      struct device *dev, u32 dev_id, u32 *sub_types,
+			      u32 sets)
+{
+	struct ti_sci_resource *res;
+	bool valid_set = false;
+	int i, ret, res_count;
+
+	res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return ERR_PTR(-ENOMEM);
+
+	res->sets = sets;
+	res->desc = devm_kcalloc(dev, res->sets, sizeof(*res->desc),
+				 GFP_KERNEL);
+	if (!res->desc)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < res->sets; i++) {
+		ret = handle->ops.rm_core_ops.get_range(handle, dev_id,
+							sub_types[i],
+							&res->desc[i]);
+		if (ret) {
+			dev_dbg(dev, "dev = %d subtype %d not allocated for this host\n",
+				dev_id, sub_types[i]);
+			memset(&res->desc[i], 0, sizeof(res->desc[i]));
+			continue;
+		}
+
+		dev_dbg(dev, "dev/sub_type: %d/%d, start/num: %d/%d | %d/%d\n",
+			dev_id, sub_types[i], res->desc[i].start,
+			res->desc[i].num, res->desc[i].start_sec,
+			res->desc[i].num_sec);
+
+		valid_set = true;
+		res_count = res->desc[i].num + res->desc[i].num_sec;
+		res->desc[i].res_map = devm_bitmap_zalloc(dev, res_count,
+							  GFP_KERNEL);
+		if (!res->desc[i].res_map)
+			return ERR_PTR(-ENOMEM);
+	}
+	raw_spin_lock_init(&res->lock);
+
+	if (valid_set)
+		return res;
+
+	return ERR_PTR(-EINVAL);
+}
+
+/**
+ * devm_ti_sci_get_of_resource() - Get a TISCI resource assigned to a device
+ * @handle:	TISCI handle
+ * @dev:	Device pointer to which the resource is assigned
+ * @dev_id:	TISCI device id to which the resource is assigned
+ * @of_prop:	property name by which the resource are represented
+ *
+ * Return: Pointer to ti_sci_resource if all went well else appropriate
+ *	   error pointer.
+ */
+struct ti_sci_resource *
+devm_ti_sci_get_of_resource(const struct ti_sci_handle *handle,
+			    struct device *dev, u32 dev_id, char *of_prop)
+{
+	struct ti_sci_resource *res;
+	u32 *sub_types;
+	int sets;
+
+	sets = of_property_count_elems_of_size(dev_of_node(dev), of_prop,
+					       sizeof(u32));
+	if (sets < 0) {
+		dev_err(dev, "%s resource type ids not available\n", of_prop);
+		return ERR_PTR(sets);
+	}
+
+	sub_types = kcalloc(sets, sizeof(*sub_types), GFP_KERNEL);
+	if (!sub_types)
+		return ERR_PTR(-ENOMEM);
+
+	of_property_read_u32_array(dev_of_node(dev), of_prop, sub_types, sets);
+	res = devm_ti_sci_get_resource_sets(handle, dev, dev_id, sub_types,
+					    sets);
+
+	kfree(sub_types);
+	return res;
+}
+EXPORT_SYMBOL_GPL(devm_ti_sci_get_of_resource);
+
+/**
+ * devm_ti_sci_get_resource() - Get a resource range assigned to the device
+ * @handle:	TISCI handle
+ * @dev:	Device pointer to which the resource is assigned
+ * @dev_id:	TISCI device id to which the resource is assigned
+ * @sub_type:	TISCI resource subytpe representing the resource.
+ *
+ * Return: Pointer to ti_sci_resource if all went well else appropriate
+ *	   error pointer.
+ */
+struct ti_sci_resource *
+devm_ti_sci_get_resource(const struct ti_sci_handle *handle, struct device *dev,
+			 u32 dev_id, u32 sub_type)
+{
+	return devm_ti_sci_get_resource_sets(handle, dev, dev_id, &sub_type, 1);
+}
+EXPORT_SYMBOL_GPL(devm_ti_sci_get_resource);
+
+/*
+ * ti_sci_setup_rm_core_ops() - Setup the Resource Management core operations structures
+ * @rm_core_ops:	pointer to TISCI rm core ops structure
+ */
+void ti_sci_setup_rm_core_ops(struct ti_sci_rm_core_ops *rm_core_ops)
+{
+	rm_core_ops->get_range = ti_sci_cmd_get_resource_range;
+	rm_core_ops->get_range_from_shost =
+		ti_sci_cmd_get_resource_range_from_shost;
+}
+
+/*
+ * ti_sci_setup_rm_irq_ops() - Setup the Resource Management IRQ operations structures
+ * @iops:	pointer to TISCI rm irq ops structure
+ */
+void ti_sci_setup_rm_irq_ops(struct ti_sci_rm_irq_ops *iops)
+{
+	iops->set_irq = ti_sci_cmd_set_irq;
+	iops->set_event_map = ti_sci_cmd_set_event_map;
+	iops->free_irq = ti_sci_cmd_free_irq;
+	iops->free_event_map = ti_sci_cmd_free_event_map;
+}
+
+/*
+ * ti_sci_setup_rm_ringacc_ops() - Setup the Resource Management RINGACC operations structures
+ * @rops:	pointer to TISCI rm ringacc ops structure
+ */
+void ti_sci_setup_rm_ringacc_ops(struct ti_sci_rm_ringacc_ops *rops)
+{
+	rops->set_cfg = ti_sci_cmd_rm_ring_cfg;
+}
+
+/*
+ * ti_sci_setup_rm_psil_ops() - Setup the Resource Management PSIL operations structures
+ * @psilops:	pointer to TISCI rm psil ops structure
+ */
+void ti_sci_setup_rm_psil_ops(struct ti_sci_rm_psil_ops *psilops)
+{
+	psilops->pair = ti_sci_cmd_rm_psil_pair;
+	psilops->unpair = ti_sci_cmd_rm_psil_unpair;
+}
+
+/*
+ * ti_sci_setup_rm_udmap_ops() - Setup the Resource Management UDMAP operations structures
+ * @udmap_ops:	pointer to TISCI rm udmap ops structure
+ */
+void ti_sci_setup_rm_udmap_ops(struct ti_sci_rm_udmap_ops *udmap_ops)
+{
+	udmap_ops->tx_ch_cfg = ti_sci_cmd_rm_udmap_tx_ch_cfg;
+	udmap_ops->rx_ch_cfg = ti_sci_cmd_rm_udmap_rx_ch_cfg;
+	udmap_ops->rx_flow_cfg = ti_sci_cmd_rm_udmap_rx_flow_cfg;
+}
-- 
2.34.1

