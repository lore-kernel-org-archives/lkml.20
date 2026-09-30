Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231F551123D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784486; cv=fail; b=EMDwo92yI8O0Rg7NUtfnwE8B1y200BN68BJjlTolxgziN3IcntapIxUClT0NdWDaDPcHOHmGDDQB6NEGH1YNntyHv2kDmi11FerUJF/Ibi25q+ZwC/LdFWsNqZsTTGJGkpoUWKvBax7K4OEp+lZ3RPe2U0Yh6GujM3ncE2iADC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784486; c=relaxed/simple;
	bh=Xed6bRyOWTydrLew5CLElUHrS5oRh33hF+YQb6Lmeto=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PX6MrJyHrI8JSPIDkcw4PIGN/XFU11VEHmok+I+ubrKsgbcLPKXLCIACeuYFNJl10WCateBvIy8hC1a8rrFDJHXfBb+KRErEfBOy4grhWeSp8Qe9un5MDtHcDyGV0ALYHQ2SIj/8pot5ydXbM5ou4WZ85Xr2p9fy9YAsLC10/MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=lfx1yW3A; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=SuGqB846; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="lfx1yW3A";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="SuGqB846"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1HRU3333348;
	Wed, 30 Sep 2026 11:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=vqCO9a+phMbJlv3arPz3rVFd/y5CzZStPZhGWmK6h
	OM=; b=lfx1yW3Au/VFcu6Ydylzcdk3CBSoCnVATEg8PGqOmtfRTccqO8PTamADf
	VMLJYB4XCWZCIQ7243a7y1Y5pzsEsZ9sCQRgYVA/vUbsG0wtZ3QB5nAt47Mr9uq6
	Dr3pFeBGY5lVPYJfyRnJERyaWbGtXBLlQsr28mG8g1JsJze0Encg37SOanLLbzO4
	ehjPbxCr+A1XGi/pf6VhRgTOQv1HhjLGktdc6L9LAkg7gGJo907HVPMe1wTnJQfw
	yZ3M3e+Pj7LmXjhdF8fScK9BGQRpdSMjLgyz1CvaeRreORgfK3bl3+CJBTQttCIv
	M2ZGWFvIUyzo6vJJNSwjS4YhrDTHg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1svvg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSIHItblpqWb93L9XFlXFbBKwezo7NRhMhdTUHhqpKtPZj2h8g+E9wc5G0jYhApsi5Dp82NU28KhVPKwGdzbk4Xb6qrUKl+dSR2WQ80q1bWH2iJYGGEqHwkiy+6M8OmEM9EBXVrgcGkTVRoP7VZPQ1fM4bloQHKZfkEDNs0txL6KEqrdgW5ftTOZBXflhX070dX8bNI2nZQAkxCCpc/SOyPKAvJF/MaQmIOh9wCTEUKTOqO0rN29+ZFbbd7mjwmnil3bSm6WLGpDgr2NNC1A+XesBLdQRTVj4jut8MzpQ2R6sjOXmD57kWIK8fIaQoWWArW1fbGGgxbhyQo+5X61yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqCO9a+phMbJlv3arPz3rVFd/y5CzZStPZhGWmK6hOM=;
 b=fwoS91UE4tD3QWNVz5Og28FdzNxYyToPu3dFwJMCIXCj4+UcrYlomwVOkTYyS2ls9d1JLpEmUU8DBFUsxE4w1QCsBvAW6EVkDO+pMALTcKBBimyvDOGod9tnKZPV0JTbri80wmPmUzc/PTOaGhSo1UURw6BMu3NBcRh5GqIRJCT4qWG3y9Tmrh2EuHrmVf+6VQFEaHDghTMGLtaxfaFi7p8il9oDmUH24+5UPrQMPa2zv6zzxZ6+l2ZLHqPYvWId2PSRQWVYjte18arVSvc+OU9Z2Soxwz0ka0Re04aV6YAzOhBFWApUHLmZT89XMkl9TOx2YV0/yOXOkX6JcjiN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqCO9a+phMbJlv3arPz3rVFd/y5CzZStPZhGWmK6hOM=;
 b=SuGqB846zfhk119ak0NYaiD8/9OnZ7Dd0Tqxq1KxJyWz3wqOvLZk4j6YbtwKlhr1s4krpCjlwdzVIHRlNG/nPhWELccOaolzAytMRRpKYz62CLpod4SykKipt19y87Hr5KRCR/dGQpZw9t11MHFnDq17j1nwEK1zQRhUlgbDZhk=
Received: from BL1PR13CA0388.namprd13.prod.outlook.com (2603:10b6:208:2c0::33)
 by SJ2PR10MB7109.namprd10.prod.outlook.com (2603:10b6:a03:4cd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 16:07:43 +0000
Received: from BN1PEPF00018549.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::8) by BL1PR13CA0388.outlook.office365.com
 (2603:10b6:208:2c0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.9 via Frontend Transport; Wed, 30
 Sep 2026 16:07:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00018549.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:07:41 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:48 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:48 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WF3425232;
	Wed, 30 Sep 2026 11:06:45 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 12/22] firmware: ti_sci: Fix some kernel-doc references in structs
Date: Wed, 30 Sep 2026 21:35:57 +0530
Message-ID: <20260930160607.2674980-13-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018549:EE_|SJ2PR10MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f32a26d-593c-4bdc-501b-08df1f0cf4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|6133799003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1TLtZ5cp+MPefLPCaqBniNG0IoxxDqtqPUyqwiHNPPIycvYY1sSPCkPKjrECBF22IVtw33I8dm9DyhywhYSN6DxATrNIduyzLGsevGYSTa/jPN+P8CyN3ptNaZob4EH67OxNQWzbYrgQsxmht0+23ylJR6RnqcaOaWkbF+2hBilUqNy5rrfoEKbO+1QpH9qIaE1vVWqFaL9IN9J4a0kV05V4hnya+JJY2E5VhamBpBuw1zI30OjvenkvNfQfLXgqFEmCbEa+RFCfFu5lW03vBD0w8ID2OpV9GbzJHudKsakDV9dJ8mVpVOtrIxBQC5UDmuvyrH0aJYY8NHi3n4QL0CzLWOHRf2GgMFESJm4ddwoOsjwR8GNAOhoRh59I2dW1qSEXrgHryRtyr/Y4LJFlEGi7XuCqVmSXyU6Dv8Zp36LAedZpYifhrHvwX77t3p6xs6fxO3PEimS2vkYoj+E/4Eobn8nFUnICx4jWiaPKuDBorySS59+8dCSa4gnSybeEsMRJW6vVcx5EqPZofIlQowgOnggs66DlkNK1NdWVW0l/9G0ZQKFYxOzhhU3Q9KN9JBKQ/NPSXRZML7rC9nZLYYfqrfTUNa6kCqe/Sl9dF11skgOO2ZQpO0owYkya1z8WtwpsJJhnMahk9lTLRjtvu1CZbs+NdRs6xFwyd5LiEgAQyvhjthHaRwbxxVZNjAkFkqTxTElfXPa4xRtrX5UgWQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hr3/3itaSjBN3ExYs+zSjfnlJ4abvBm1/KTxp5L/odXPnKNAqNa5HpbP727Q3MVIOwnnoxnBrYxmTi2x+iMJxjxmv5Es3zuPF/96L5agtIEKONK/LX/l0qR63rtCjgZKc8L7/O/wDLF+b7UOD17DC7GbFl8C5JuDSb6dAs2sUXuFrG4KgiIQfiKzj/fOglZ9YBBX5rniFEKOHchwqUh0pXFEcE5bu7GqkWvFbdvJsolfojYmUC3Klo04DdgdoqvcNx60S3XjRWA5pfDdl1W/f5s6GRw14HM8no+7bmyUu0LVxnZQsTq+wK3hvXg3yerpEk/wWhm6oAGZVni7Wr3XVhri5Ldc43Go2dgDOfJaGmz9qcSkeXIY9l4SWhE/Eli5tbTNGUqDrqQvNn5uanPssDSoqzoEMxSUb2bGo87i/9rEUEYe8pOMRg/BbpOFkbZU
X-Exchange-RoutingPolicyChecked:
	tWTmJL+ge1fjVxzSK5FdMjPWGxR05uYh85X8bDzWqcD0r5qj9NMFtbeMEcAhsjBJFJY68tSNqn4q0OIscrmiwjJeGM0zWrMmIZd56eknqRdeDg/npGwBJJLis5Qp1kF1DxZ8RLcDKxjgbSZ6r9flA3kPRhR1QIgzZpMGtwCr/q9rffFdSckPTw7Y2u+hsv9amKy82L9bvhb1o7Wv/g6lOGC5co4eH+N8HkxOglYmz2QOH8BangLtHo2Uh2yNu9AaKsA63/CJdrXB3GKatwyefgbPI9D/Fi+EJFGXtAYhndjS+0/vNRzDAPEY41HS7zngRxEHi1b+tY3HJQeko1LWXA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:41.7984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f32a26d-593c-4bdc-501b-08df1f0cf4ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018549.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7109
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX47aZTy3ryBSJ
 V5nu8CF+nBHSQ2tm7NIhh/TL00JgLkT2F8fMuin0nDNLIP0wXwF7B5yyQbpMtMWeBpnDv4Pi3na
 hJOcQSxgC9GLZ+JSExtFDJZHH6Mmp/g=
X-Proofpoint-ORIG-GUID: x6gjmheGX3nDqxB5S7S0Zf5FqbLATgMQ
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd33d2 cx=c_pps
 a=E7iPWXAsOYqR18yzHj3E3w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=GOjBpkPxkVgeuWNzjYAA:9
X-Proofpoint-GUID: x6gjmheGX3nDqxB5S7S0Zf5FqbLATgMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX5EWN/daPzqna
 fItHLg4irKsw/rK2bwayrNfNujK8ibesUoz19ioV5KENRyS1yTwVQO9kIW5zyEvZcyEE8fP0XdB
 NFQoo68NsmIOGzx1ECojSXkdunxxKdcYsPhOrBUg+SRs2ORvz67rRQLQlZxN+ViOjhFDisz03Rl
 KNbuvLGrSVF40wWPaz1PFStVixtie0BVOLbzGh29UsOw93FsKuPRAHcEyVUGfQxNmKaajryx+EY
 8IeqKm1RpOlB2JdRFhAUE/Htonv8q2rfOMKv9Ps0jxI6csBnAveFex21dy9Fv77OMORdlZ3JCIU
 rcXxO+neVKO3npNIH9PB2OPRHM3HIAJOiMAxeHawfHatVr+g/tvSkKvPd08iXeAJSYso/qrkayZ
 peklukvKaRr7Ok48VIZKdf9hcAy0m6PLpxf+f45wiL6utB4C4fye2sTljSRHFwBHVlmN9cvrdU9
 6YZiQSt1u2oqwZWEQDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

The valid_params descriptions of the RM ring and UDMAP tx/rx channel
and rx flow config messages refer to struct members through structs
that do not exist, the wrong struct, or syntax that kernel-doc does not
understand. Refer to the members of the struct being documented directly
instead.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-13-b-padhi@ti.com/

 drivers/firmware/ti_sci.h | 126 +++++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 63 deletions(-)

diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index 8fccbcd1c9a2c..34f7848073a0e 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -813,14 +813,14 @@ struct ti_sci_msg_req_manage_irq {
  *	The ring configuration fields are not valid, and will not be used for
  *	ring configuration, if their corresponding valid bit is zero.
  *	Valid bit usage:
- *	0 - Valid bit for @tisci_msg_rm_ring_cfg_req addr_lo
- *	1 - Valid bit for @tisci_msg_rm_ring_cfg_req addr_hi
- *	2 - Valid bit for @tisci_msg_rm_ring_cfg_req count
- *	3 - Valid bit for @tisci_msg_rm_ring_cfg_req mode
- *	4 - Valid bit for @tisci_msg_rm_ring_cfg_req size
- *	5 - Valid bit for @tisci_msg_rm_ring_cfg_req order_id
- *	6 - Valid bit for @tisci_msg_rm_ring_cfg_req virtid
- *	7 - Valid bit for @tisci_msg_rm_ring_cfg_req ASEL
+ *	0 - Valid bit for @addr_lo
+ *	1 - Valid bit for @addr_hi
+ *	2 - Valid bit for @count
+ *	3 - Valid bit for @mode
+ *	4 - Valid bit for @size
+ *	5 - Valid bit for @order_id
+ *	6 - Valid bit for @virtid
+ *	7 - Valid bit for @asel
  * @nav_id: Device ID of Navigator Subsystem from which the ring is allocated
  * @index: ring index to be configured.
  * @addr_lo: 32 LSBs of ring base address to be programmed into the ring's
@@ -1023,23 +1023,23 @@ struct rm_ti_sci_msg_udmap_rx_flow_opt_cfg {
  * parameters. The tx channel configuration fields are not valid, and will not
  * be used for ch configuration, if their corresponding valid bit is zero.
  * Valid bit usage:
- *    0 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_pause_on_err
- *    1 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_atype
- *    2 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_chan_type
- *    3 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_fetch_size
- *    4 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::txcq_qnum
- *    5 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_priority
- *    6 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_qos
- *    7 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_orderid
- *    8 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_sched_priority
- *    9 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_filt_einfo
- *   10 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_filt_pswords
- *   11 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_supr_tdpkt
- *   12 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_credit_count
- *   13 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::fdepth
- *   14 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_burst_size
- *   15 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::tx_tdtype
- *   16 - Valid bit for @ref ti_sci_msg_rm_udmap_tx_ch_cfg::extended_ch_type
+ *    0 - Valid bit for @tx_pause_on_err
+ *    1 - Valid bit for @tx_atype
+ *    2 - Valid bit for @tx_chan_type
+ *    3 - Valid bit for @tx_fetch_size
+ *    4 - Valid bit for @txcq_qnum
+ *    5 - Valid bit for @tx_priority
+ *    6 - Valid bit for @tx_qos
+ *    7 - Valid bit for @tx_orderid
+ *    8 - Valid bit for @tx_sched_priority
+ *    9 - Valid bit for @tx_filt_einfo
+ *   10 - Valid bit for @tx_filt_pswords
+ *   11 - Valid bit for @tx_supr_tdpkt
+ *   12 - Valid bit for @tx_credit_count
+ *   13 - Valid bit for @fdepth
+ *   14 - Valid bit for @tx_burst_size
+ *   15 - Valid bit for @tx_tdtype
+ *   16 - Valid bit for @extended_ch_type
  *
  * @nav_id: SoC device ID of Navigator Subsystem where tx channel is located
  *
@@ -1153,20 +1153,20 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg_req {
  * The rx channel configuration fields are not valid, and will not be used for
  * ch configuration, if their corresponding valid bit is zero.
  * Valid bit usage:
- *    0 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_pause_on_err
- *    1 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_atype
- *    2 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_chan_type
- *    3 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_fetch_size
- *    4 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rxcq_qnum
- *    5 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_priority
- *    6 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_qos
- *    7 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_orderid
- *    8 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_sched_priority
- *    9 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::flowid_start
- *   10 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::flowid_cnt
- *   11 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_ignore_short
- *   12 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_ignore_long
- *   14 - Valid bit for @ti_sci_msg_rm_udmap_rx_ch_cfg_req::rx_burst_size
+ *    0 - Valid bit for @rx_pause_on_err
+ *    1 - Valid bit for @rx_atype
+ *    2 - Valid bit for @rx_chan_type
+ *    3 - Valid bit for @rx_fetch_size
+ *    4 - Valid bit for @rxcq_qnum
+ *    5 - Valid bit for @rx_priority
+ *    6 - Valid bit for @rx_qos
+ *    7 - Valid bit for @rx_orderid
+ *    8 - Valid bit for @rx_sched_priority
+ *    9 - Valid bit for @flowid_start
+ *   10 - Valid bit for @flowid_cnt
+ *   11 - Valid bit for @rx_ignore_short
+ *   12 - Valid bit for @rx_ignore_long
+ *   14 - Valid bit for @rx_burst_size
  *
  * @nav_id: SoC device ID of Navigator Subsystem where rx channel is located
  *
@@ -1197,9 +1197,9 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg_req {
  * @flowid_start: UDMAP receive channel additional flows starting index
  * configuration to program into the flow_start field of the RCHAN_RFLOW_RNG
  * register. Specifies the starting index for flow IDs the receive channel is to
- * make use of beyond the default flow. flowid_start and @ref flowid_cnt must be
+ * make use of beyond the default flow. flowid_start and @flowid_cnt must be
  * set as valid and configured together. The starting flow ID set by
- * @ref flowid_cnt must be a flow index within the Navigator Subsystem's subset
+ * @flowid_start must be a flow index within the Navigator Subsystem's subset
  * of flows beyond the default flows statically mapped to receive channels.
  * The additional flows must be assigned to the host, or a subordinate of the
  * host, requesting configuration of the receive channel.
@@ -1207,10 +1207,10 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg_req {
  * @flowid_cnt: UDMAP receive channel additional flows count configuration to
  * program into the flowid_cnt field of the RCHAN_RFLOW_RNG register.
  * This field specifies how many flow IDs are in the additional contiguous range
- * of legal flow IDs for the channel.  @ref flowid_start and flowid_cnt must be
+ * of legal flow IDs for the channel.  @flowid_start and flowid_cnt must be
  * set as valid and configured together. Disabling the valid_params field bit
  * for flowid_cnt indicates no flow IDs other than the default are to be
- * allocated and used by the receive channel. @ref flowid_start plus flowid_cnt
+ * allocated and used by the receive channel. @flowid_start plus flowid_cnt
  * cannot be greater than the number of receive flows in the receive channel's
  * Navigator Subsystem.  The additional flows must be assigned to the host, or a
  * subordinate of the host, requesting configuration of the receive channel.
@@ -1274,25 +1274,25 @@ struct ti_sci_msg_rm_udmap_rx_ch_cfg_req {
  * Bitfield defining validity of rx flow configuration parameters.  The
  * rx flow configuration fields are not valid, and will not be used for flow
  * configuration, if their corresponding valid bit is zero.  Valid bit usage:
- *     0 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_einfo_present
- *     1 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_psinfo_present
- *     2 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_error_handling
- *     3 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_desc_type
- *     4 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_sop_offset
- *     5 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_qnum
- *     6 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_hi
- *     7 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_lo
- *     8 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_hi
- *     9 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_lo
- *    10 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_hi_sel
- *    11 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_src_tag_lo_sel
- *    12 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_hi_sel
- *    13 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_dest_tag_lo_sel
- *    14 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq0_sz0_qnum
- *    15 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq1_sz0_qnum
- *    16 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq2_sz0_qnum
- *    17 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_fdq3_sz0_qnum
- *    18 - Valid bit for @tisci_msg_rm_udmap_flow_cfg_req::rx_ps_location
+ *     0 - Valid bit for @rx_einfo_present
+ *     1 - Valid bit for @rx_psinfo_present
+ *     2 - Valid bit for @rx_error_handling
+ *     3 - Valid bit for @rx_desc_type
+ *     4 - Valid bit for @rx_sop_offset
+ *     5 - Valid bit for @rx_dest_qnum
+ *     6 - Valid bit for @rx_src_tag_hi
+ *     7 - Valid bit for @rx_src_tag_lo
+ *     8 - Valid bit for @rx_dest_tag_hi
+ *     9 - Valid bit for @rx_dest_tag_lo
+ *    10 - Valid bit for @rx_src_tag_hi_sel
+ *    11 - Valid bit for @rx_src_tag_lo_sel
+ *    12 - Valid bit for @rx_dest_tag_hi_sel
+ *    13 - Valid bit for @rx_dest_tag_lo_sel
+ *    14 - Valid bit for @rx_fdq0_sz0_qnum
+ *    15 - Valid bit for @rx_fdq1_qnum
+ *    16 - Valid bit for @rx_fdq2_qnum
+ *    17 - Valid bit for @rx_fdq3_qnum
+ *    18 - Valid bit for @rx_ps_location
  *
  * @nav_id: SoC device ID of Navigator Subsystem from which the receive flow is
  * allocated
@@ -1313,7 +1313,7 @@ struct ti_sci_msg_rm_udmap_rx_ch_cfg_req {
  *
  * @rx_desc_type:
  * UDMAP receive flow descriptor type configuration to be programmed into the
- * rx_desc_type field field of the flow's RFLOW_RFA register.
+ * rx_desc_type field of the flow's RFLOW_RFA register.
  *
  * @rx_sop_offset:
  * UDMAP receive flow start of packet offset configuration to be programmed
-- 
2.34.1

