Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272914156ED
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798557; cv=fail; b=VKj/brntRgmfb8HCyf9KWFmPKGErClBr/3961N0S/BER8rtfMNj1z3kR9cu+OSzQ6ZAaRmzKDxbjf7qk1DAOx0WKvWzUdUIuneQp+xJH4xPdzYEtuQ9r39hkcbVlz7hb3YBAfJLJQSOOh+9xdvmZ6+M/u4UcTswfweDXtcp9nC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798557; c=relaxed/simple;
	bh=v8bUqLlNJZQnQ07TG5blTVZcLrxmig7rToqTQS9UL10=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N+pVXjG/eJXesg6O89kT57SEF6Wc/hUcbp763brOZbQ+z0ulveDyiE25vmtSA76EKOLBaNGb6AMRhjJlcL+mhYmxJmrmA6IoJCwpX68j5UYcTSL27UneqHpt3X6W/YfRS0ixDnD65/hGgZyxh50sp9x7L9d7gRc2xET0aR3dK2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=JuMTUnnO; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=mCk+RSLw; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="JuMTUnnO";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="mCk+RSLw"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UJtHGH032925;
	Wed, 30 Sep 2026 15:02:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eUn2fZXP7TMiFarUnbrkOuT/imSBS2K8yas19IQsa
	dg=; b=JuMTUnnOYBXWG8bC/vwFPsSMvAhsTRjCEzPdx5EMHU4Tah/SsC4eIcMgR
	ETXRl5nBcTqz73vSkaG3tz11wXQeH6aaZ0Zdqh8PtxfLypDqmL/+y/OH1CA8lmlT
	rePkSZjVDAq/Bw8UZfGt245SF+tA6kDy9pyhgSypIb5vBIkxpVJwqo/lqIWWbisT
	dNNTGDX5ndUORLPU7+rG5YRJ2POmL0YhOFOawx2wsN90yiZJfto7RVI6QxmZ0fcs
	TQYYqAYVs1b81OKsrxAPYm/Ge/3OcXGTwyeWlloXJc+dph3MSYOCHMlP6/TfHBMy
	waxgP7jzqStucdZVYBfIIXfAPd4Pw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011016.outbound.protection.outlook.com [40.107.208.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvbn5u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:02:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4x61HQB9sYqrSYmAq9uFCLI5x1zEDjUs+LZP72wpvD9xeRdd+xJoy2/PxLsBJDBVdgrD4ZM4MG6ZRu1lFnuhVLS3ZhRm42NMjBFj1Gf49J3qJG3t39KTiZKRTAnQ8/2yaWo+VregBQg93Ox6VOPLDIBa0gxO6JaDerlmVCKvFfAvd5mEOrHtYccSxZUuxbpOGwAqRGSyzuv04omPH70ds5nQFp4g1LEQZo5VhqixeQ98iCccNu3mk4NXtZdwbmp9dKQaDYFBrjLcs4mD51NHp0G3lf+AjfB+Xmx+jB2BckYuQAp8YAwcN1HqiqbdcSKLklXkQONo3VDjOFdi+Ut5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUn2fZXP7TMiFarUnbrkOuT/imSBS2K8yas19IQsadg=;
 b=WYH8DVb3qyjCsVYEw2Z+03UTaMAIALtPTHuAleXnKZb8r5CbsO2lrMYxZ1e8tE/V5ctNhaXgpP+U+ngjAUyUOAcyDt571KIJlnF9bEqqOqYFTJN9pjidz7y7OZM52+ck03hARZgwqwsK/bDXWeFC8WgHbmlr4ILdG79GKfZAmw9L0iD/nmJN0o6kn5DlY3i1Va7ASU1xgQMP4qZDJoHmD58LMDFlh5WYNtAphcaJB+p17DO0MRAplkb6Z/GlAAGT1Xg9tFxinHuLbIyReTeOHE/lpFLjPKlYrq01bfOySx+sFvtrzoI0mOTK3tjp4G3Z5mhl3vtNkLj7jAFqntBZKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUn2fZXP7TMiFarUnbrkOuT/imSBS2K8yas19IQsadg=;
 b=mCk+RSLw6YbDlKSKv11Snv+rRlpBIJ4U4GhR5rILmztfaec5tbPp6uSKD5YqHQP8eqvTW986mvYrBStNQUpsYtbo+Mwu+28UBSLu4PEoqqzDmfibTh0B0FwWqroj01Avk+Luc9YYgGcKYllAYFt2Sjw6HK48qFEN9DHn7E3Kou8=
Received: from SJ0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:a03:2c2::35)
 by CO6PR10MB5554.namprd10.prod.outlook.com (2603:10b6:303:141::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 30 Sep
 2026 20:02:29 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::89) by SJ0PR13CA0060.outlook.office365.com
 (2603:10b6:a03:2c2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 20:02:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 20:02:29 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:02:07 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:02:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 15:02:07 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UK20Nw513314;
	Wed, 30 Sep 2026 15:02:05 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <nm@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>, <vigneshr@ti.com>
Subject: [PATCH v3 1/2] mailbox: ti-msgmgr: Do not report rx poll timeout as a send failure
Date: Thu, 1 Oct 2026 01:31:57 +0530
Message-ID: <20260930200158.174118-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930200158.174118-1-b-padhi@ti.com>
References: <20260930200158.174118-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|CO6PR10MB5554:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e73561-5140-402c-ae73-08df1f2dc202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BV5OjmbTWxxPUxvLpLtusANdVQzfCnhC+FBqo36qouyLTmVHjFreaQyE4ytMmPEzLImQXZiCfHPgvp4J+lXEUgQ/OmIR9iNuPFOTi1E9RqTlhsRk0kcZ5cChb4EO5Z9UsHR6DIahfbk3UjBtohPGx/QA+GeJWrqunqhp261aQserMPdyVaJL+q8SLLBEd/Xf8IlyTKipPG9Jbk+CPl7PBEoC9xiobQlU/1lFKtPzXmjLAmQgG5H+Oef6+lwVQi+s2e00ziCBx7cTC8KxTO0bmaOzzOdOHZ6YDLhP25LdbbYc/CamTuieAyhJFTACqFRWX1j24JA6R7b6WgvxsqQtMS6Mn6rs38qmCkv0h53PtKsDtL1ykJ5SGeUVOIuoY5XwJLbYwPPWV9hHOjSpAPosW+XLFej/cp2wiYTHyKBGCodSTSuO7/d705Seu5ANxYhfDQe4tXX2KJSJXjLxc06fBLOBwVgY1hzCZgwrb+t6+U5dmZqPQBfEoAIEH8x5HtGVVQ7c6L9h/Md46dE3UstfipNhEtXvz/9FVKurQti8ONUlrE4U+3Z7EE6Izf5mJffbF90WOghrIO3kqVcOVuqS2WxXeG/zym0CX4gLTKZZiIsqe1qAltpg55b2axPvV0GOiOju3CxYdxaUGsxf6+xPExXEtSfVU4wzAnMVxQMZA/JPdpW1ASFsFv70LrjHU+ZZEVmXRUgA3Pu2PXj+Q93ekg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RPliiGJQjWZjZMHq0MiroHHZg30eZohfFeJQfvP2+TLb3HaE5vMKY/yFkuwy3JQYVIIkGI+VO30e+3ObyLRikERydt17vpWz7CDkT4OW2iUz4DmlrzJps6Km4gl9/WPKPRjGx95P7XjI7boMa1ez5G2pR/tj1RqNtRx4eaTDAZwgtcoDY2/y1++kRMzU58BzQI7rhdl2KbOa14c/6Al+cO/rbaIlhhRfXSUnZTn1lr71nyDWmdz4+BF5F6+qVnqX0yEjURjN5frbrTUvAbopJvJOcJRkLwiJiszO9jA8RpYOgOqiY0iW0XarBkeGP6aP97NR//gxo5CjdrQCJCRnlBhch2/5d7kWtulYMZTQzDYdjKNAGVtq419ZDbMiwNnU381wgR6QbT8UtAEjl4YyVPpbgRDbsT7+p9iX9CevJSi2Efl6aoGc5skwDTWzP42Q
X-Exchange-RoutingPolicyChecked:
	YUeUqhUkCmVlBdFQAFXXckkZAwnze0Lb5oMcIWRgp4i1KPJkDhBkbRNmyu3u3/jF3rUnGee8FRsTzua74oaZGFMRMQchykEa3pize/7Vd5l/l54pC40dsLJ6tymnBVt+XTawA/SS7cg025Yqj5ZU1Yt1Xl+sRa9NF1uyL/mdvxjih9U6bQ8W3OioofbKHRuIlIcV2wXtNC2DQCaWLxn/IZEfz8iF6KeKXIYBO3yjQPRQTo+TWfmflIL6VI2Q9TTkt3dyWvPlm1MlXHG6DlatwDqBQ8FZmMURvrn/rZC+58lpkntXy+WxvamrK+2OmRiiGhhMeJx1QPBQR8AoqJ6HRQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:02:29.7454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e73561-5140-402c-ae73-08df1f2dc202
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5554
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MSBTYWx0ZWRfX3acYpU7hD3GQ
 zUcgufvjxWFg1F668x48v0ugX2Z+aV3/U9fGB+lkbgHKODTLbR8u2LE45q6KhJLn7DjDaU0X1Q3
 Jz69B5oUZSP9hlvqUlckvLMiJ3cfPbs=
X-Proofpoint-GUID: LaxHqa53nCtu0cCPQLEdkh9GYJLXxHN_
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd6ad9 cx=c_pps
 a=CJt2AWVwLbfAHulDA2arTw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=_XyyNiWMlt3iJy3YHq0A:9
X-Proofpoint-ORIG-GUID: LaxHqa53nCtu0cCPQLEdkh9GYJLXxHN_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MSBTYWx0ZWRfX33TLsUozSJ3Y
 si7tYQ+8DfZII+7UZI5YKxPUZetu61AT5pZw9dTNBQ/hf4gOO717gq+zuYSmgaz2i4AQUI4RpK6
 4uAMNtcMctEraYZ2cd8DE8HISq0Bk4eTm6p+48KfwATJekh6Th2dQX7cGbSTyP8EcCPbSVolILi
 zSwLVY43mWIlmJmIStJ/PTsJZ/mkcYZCn0Z40w76/sjUpVhrm2GuncLj7f35lPpKSCUrN0hYSWc
 SYVw91Y7exEThdrmNXnlSy9moiq0bdvmlPD5mGvGAGS3S4R/kxCIyNPPP57T2Sb1R/BmTPtBV0V
 YawinAEsxN51J7lo56YjCWZXrY3eXAbhrs+InwURSn6fc4JptrP56iSZOMlcvI1S5aksV0Qwlez
 JF90YY5c7KmXhBjdhT2avsXxWDGqzjTQXVbwSMBxN0YU/gx+UoR18yuDX/CLeSnKi7tS9YtWgEV
 delpk8bazqRw80e15Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300081

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
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930143810.2419010-2-b-padhi@ti.com/

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

