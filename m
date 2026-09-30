Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE49551AFF5;
	Wed, 30 Sep 2026 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789515; cv=fail; b=Kj4OknLL0GFNLNmXgg22wKZma4xFeu6VgqC2obrAeKHcI0p0Sa5mkfKsLnoHWyfsvpSwWtfPzWH2xg0srK08TZTtTQxf125oPT/e0cZB6Kg9gkJDtTOPnGKL64vs2/DnmIaLeS/0rRThe9T+WFfhNXbBSt1qsRIigIxmtN6fV0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789515; c=relaxed/simple;
	bh=D7drE44OxVVFUh2si5pgikrf1jUWLWnXKFIZRbbwu70=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VjovjI+k2DumcaoBsHaUaKsayYhGzJ5hXmASCwn/mC62QF4fxrytR68vww1SxYWbZSdL8FSOzRCFqljKaKyak5FpYi7BKu+mAoQIfev5e+YzQ5XwAF+m7xlU8Ds4uob5nBs1VcvJEl8X2JyMk8/QTxWj2DLcK0KABLZ4LXgAn1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Av4dLutZ; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=VijPFfVC; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Av4dLutZ";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="VijPFfVC"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1IAf3333409;
	Wed, 30 Sep 2026 12:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ni40F+DzRrcv1uWMV1y3JTpx3GCw8UELZvdiUGvKf
	rU=; b=Av4dLutZSLsYadGsczKnwd9axlGX49gQlofNY50estghAJY02zqygJSNn
	RWQ1dzqra+V3GAscIRCi56pZTBwgK/lisGVZDRmZHedEziYi8rZDPZNTbAZfiyRp
	Fz8BydBTR0qJ3B5tms2EWnh0SW7vaxwGgfAA8pL8F3XRFDChlE74FD6MkoONncFa
	zg8MiAIGzthixEgs1cgwdZM9sAr8S7Ac545PBC06ZNH0t0d9YhFLpfyBJ/uIRmeS
	CSfspgtcKOxYFaLYKVNcfYG6Kergr9IRCaTmIaOm8QwSbgicb28V7GIDqrShMEXk
	VyCV0AAVxACb/PVJWRm7OYjIwJfdg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1td8x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 12:31:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPk/4PA/Gjmilbcz5L5L32Ax1OjydcAWQcmfnjGK7xPO7k4Yyslg+5h+QyzJ0rbnetOBrYfONa1bXPuyBgi5GOtbFrtzDTYUIqRDpgCMaxsbG6OKJuIGRKV7lnL0THrfM+QMBb6ypeQreXaSSpC5PvOiUbrx6KMWsehZ+PFk4Q7fu+CD83X4XgeJuZCM6YbVW6g3Abejw887pO082cXgHoY1gODHvjLDXG0LR/50RavcOrxy9Jts00wDQrqdzaQ01NmbRHW2F57hvbHYH6xroQSTk9b76YDRH5cueP0+LpspvKAi7MwF4fjf9+dM83buK5wEpbMuUAOw6IwypHnaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ni40F+DzRrcv1uWMV1y3JTpx3GCw8UELZvdiUGvKfrU=;
 b=cWR2pOp7g8OcEGOGvIJe+PWgr81l2z+jzhOsB0O+gKbbeNqM/wfD/mfhyAPFYitL0Z0xAy1sYrrb0vHH3K5Bt2zD9ShGXG9D/tVVRgxN42dgMTMGJXKboG/iYeyrEmDdbjq2rRTQfJfJ24do0LzR2PCTJqgyxYNCZPxsn93bXZrisJIVDYkfKl9KM9lwBL5vm3qrX83JSMVT92FnDHP2A1R+0ShnKQgDsVmA5fJtm+YVhZZ4ClFG3hRsWrmBs//S7OaL2xVAfKdjy4Qeodbv8pfd8FhA/M4/zTnELPHVbM2evSeeZ2mzFC7VJjLIx/gl2Fvy0Op+QHEilckRdbGSYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ni40F+DzRrcv1uWMV1y3JTpx3GCw8UELZvdiUGvKfrU=;
 b=VijPFfVCpOX2ipkxjo5PFk2PC80bZ/IFDg8tvXOdHM/zb4a0eYwRKS8mufDcmDLhgL1vR1abkQ/+/Iikuht5gLj3cwOoIzZgzSszYvQik1ntfdlKVygWki2jcG7twaHWCJCxmGiqiV9Py9t0cCaWWausohakTOGEiIggS4xfsBA=
Received: from SJ0PR03CA0229.namprd03.prod.outlook.com (2603:10b6:a03:39f::24)
 by CH4PR10MB8196.namprd10.prod.outlook.com (2603:10b6:610:246::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 17:30:41 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::a) by SJ0PR03CA0229.outlook.office365.com
 (2603:10b6:a03:39f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 17:30:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 17:30:40 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 12:30:17 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 12:30:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 12:30:17 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UHU1FQ303419;
	Wed, 30 Sep 2026 12:30:14 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <nm@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>, <vigneshr@ti.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: mailbox: ti,secure-proxy: Add TDA54 variant compatible
Date: Wed, 30 Sep 2026 22:59:47 +0530
Message-ID: <20260930172948.2901336-2-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|CH4PR10MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: e96dedba-9458-42a0-6413-08df1f188ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/GlvODHueaZvPfvact1h9UKtr1k9sh1D+mwp91RISLgJn52TwYtNFk9jNtjcNqAMR7LltDBxNxqRkA9HD0tF1cZLjCFAjKai6/o4X0DidRUl0rl7RbB2DBvjLjhpRUfeHc2QGczd1mJd8aWBkt4g6t8o7ECVxVqq6/msKdqC9s5HPErTjYvQAxFLLZaAjfqlrs14suxoxuiCboK8xm7vnBALfj9yIXullnmW7l1c5JpYW+BCTsyORhSH0fPYXzktHOjX8aBAt/oY0qSIXEbFaGyy9fSdejDG3+ssq4cgY4r60PivTZnYjKMAWENaAo/76KpKUPuKIS+r9jNrKfoQfJI584tr8HOL8r9i9Z7aSnjzkYrXr50ywxkUQL+qitenkfueHpiPqDdh/2zeLWszAVC5XZTBabhiCZtRannve/KJlRNOc8brGK0Xftu0I/cDNYMPkDFApkG1I3j/joccL3l9x9+BrT40xNgFKKd+n+r+s8sQa3TsA4gN/oZd/LEh1mlY8pn39D1uuoQ/Uf5Mhe13rE09iG4KQpoFfmT+YMhP6vRAwRJ+Vn/KCWA0DNvyyJj7YnMBCjiSglYuRNifVcItQzvwL15S1FUv8JwUZExjYQKMqzbXDV2SHVAfxLizIG3cYRs5uOSrK6Pw0UK59YUvK6mCkDUiyD31vip7LM5LG1SmRt/sa1iBtFCcUqM8i2Tg9WkR5fSeDYEOUvMdMg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	196qucFYQARe6PmT7Kt2Buhb6O0WwlL+sfQ+kEhdLbEwfo78Q07ZVvREp66mWTYa50Ctjet5hG3K6qh37ZkMj/6JCTB6jYej+Da/HoSj6XZd+TVwEPGXf9phzWgc7RnWbST53Ud99PL6gRHh7niJF5no7BAGuiRIL0HOjw7L3OikHJQIeA06g5eDVwy8HDW12yKRtzHZWFYFc5BGkP5aQgF3BEofClYfgr1IMHcaIpQnCX2msYQCKo12YjNff20P6KBnVFoL0Pv4MhkMsz78trvaHcOX51/HALuCqk8E3NrPtuyh999A1Crmz+tjxBhnBYbjgxx97i4iKXqlN7Cw9E6wiuKXmRIg9ehRx0UCJ6djTPRsJZodFRv0G4U8lMb4Pjt4LBsiBeVemabdb+PJg604TnMGuLlqk7MKlZmeNwcgcahdAUR3otJQyS5Lzhue
X-Exchange-RoutingPolicyChecked:
	VTkMi+7lIwTu5pb59rBrqURCHFXDxb8NlNMzPFfZ0wsZNIwywNlj93Ouv61k4fosXXfCMLgTYyXqVuxczfF+fxWsbFDI1r+sNk1yyQnOd2g7xSKkt22/5DrKDkTmF1Z4GmQ171cz2EG+NFc9nlkgcSCRx5lXGnGPEikvxYQ5V33Cl+l872OOGxYC5DVJtKFnEgscXqSY2d8qUPXQCQ0f0I8HGGrRAk5hya//5cMPzelZiuPmXxcA1SAZxTDgvsrnGERBeb+MXsRc/w1Bz8EjOSpAcModyC6HnqcBmSUwTwRmcg1LuZtkw3cnExfcde9arzwcPCBLL1RUXILC43Kk3A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:30:40.7628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e96dedba-9458-42a0-6413-08df1f188ca2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8196
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OSBTYWx0ZWRfX5tW5oEVu0wJK
 bP8gFmor2zkErvju8rkCbV4a6ldqYwG2Qx384GWDUBWq1f4ascJW+L07KIlChX4PCAY1th9vMDu
 GRj5UW5b8S0upFrwo+81ByKQ3R98sd4=
X-Proofpoint-ORIG-GUID: bylX8jzeVHhk6mXRIvCjpUFyTbL-UchN
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd4786 cx=c_pps
 a=fYaSdR3m0whpxnlOBVIaHQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Wlv5HqHXOdFO8zYWzrIA:9
X-Proofpoint-GUID: bylX8jzeVHhk6mXRIvCjpUFyTbL-UchN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OSBTYWx0ZWRfXxYtDKi4k5kIT
 yFTaqtFzPyenNLzBPZgruOdWOd+NYURaXoD7b2Uuyem2l2Q8Ff6n+hPGxa88kG+0pSiksb0Cjac
 uaSVvfPUPfeD+m4PWHLlBxNSar26xC3NWrD6Op5Bp2zR2RTK9bwDbMrxp6ckZN7be2m9+rBGlLB
 6cmxQ34rIa+8QiPE9LwTptwBumAecYPyI5LYIdhPludS51eLOMo1l3gsU7u5POyUFH7zvo1dYaP
 Xqpbzp53s8tgYPkX0woaLOZ7KkkDBV/12C/fwih5qMayNHsb/wncyvyvBswDYwgRRqQRN81eBwY
 0K5Y9htkaqCoOHhYO7mAOaAYsYgPLlNC2URvYt9dhhot9/X0Q5Co5kFLkdlKk+fpQvbnBVRsnYN
 OoQQ8hqWyYzFd+a3I1pf/B35Yqt8jJl64ma+dXO77p7WDilHHgPiH/eG8YQtB0i0iAHnJLPlQN5
 KqyqnBlHRb/9zsGRx6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300069

Add the ti,tda54-main-secure-proxy compatible for the secure proxy
mailbox controller integrated in the MAIN voltage domain of the TI TDA54
SoC, which features up to 444 threads with 60-byte messages per
thread.

The number of threads is fixed at SoC integration and cannot be
discovered at runtime, therefore a separate compatible is needed.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

 .../devicetree/bindings/mailbox/ti,secure-proxy.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
index c321b69f0ccd3..525266953c974 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
@@ -22,7 +22,9 @@ properties:
     pattern: "^mailbox@[0-9a-f]+$"
 
   compatible:
-    const: ti,am654-secure-proxy
+    enum:
+      - ti,am654-secure-proxy
+      - ti,tda54-main-secure-proxy
 
   "#mbox-cells":
     const: 1
-- 
2.34.1

