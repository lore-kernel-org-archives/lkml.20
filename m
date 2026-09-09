Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B66842252E;
	Wed,  9 Sep 2026 21:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990545; cv=fail; b=X3wtJklydfXJzGfysWUwqXKWFO9LkcPTxhQLLC83NXvuHEC2pGPH2QTV62gOducpcBP1IFwizBEIsM3OsH+0RmOWJy0+WDYY+YCTr6k+rU2WQQSn9LUU2Iq52ZngQgFiS2rgWCTapy/Cm1wUREwb5PaOT5ecCUHnqhonUdpD1nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990545; c=relaxed/simple;
	bh=7DGzeZ9VrEDm+R3fDwfnTWdiap0dN9qk0wE0Pa7BNVY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTaQ4lR6Or5/BfggHI2H6IHjwGYeewUHdlBM7OjAaqiPGfeucZwo5lcLekLaelrNpEzs8fDkcYSI5wbuqiPFgoKgndk5OB6Bxy/zyegXxA+4w0gL7Gs3tsLDDsrjTBMUsgOqVYQbPJWsdFuYTqvmLVcd3p1BR0GJmJj2rGi0ISc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=gCikRp/7; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oKU2WT5F; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="gCikRp/7";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oKU2WT5F"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689JGGej1099762;
	Wed, 9 Sep 2026 16:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lO51Ig26CoCYLd0NkkY2iscn52DBvtUrOCDG26WKA
	io=; b=gCikRp/7FTDQ8VsyY+DgdkQHA3v6IYUKp+cqUMCbmsvbJ6dY5O5+Rm4x6
	n5v+9e8ES/eWOjF7mNnk3LwHHOFWhWPLj0HhZqjUsfjgY33BdwknQBpACqZoFoB6
	7/4Ra0bLZU2eBhlzeqkfXpJCPiJMDdlf2nAH2wtimLt71rVSurlGVHXm5NOVIWGp
	GWJ0P989joeMIQTvhnoMy4a7srN0DSWsP+bX0lH1xWPl/fXoZVcDMJ6w3DjiBJyH
	YliMbR6fT9BzNGAZx7gmKT182mds7tn4PEZvMEH92093qc52X7a49hE4Sn5+T5Ro
	3mBTx76wM4wrm3zVjNrsdGNaY1cOA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013042.outbound.protection.outlook.com [40.93.201.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxfs2tu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjrQPTcRxns7GyJeEKLSOjbT2wp+ct5cz/4fmNkC0Eu/shd2+nyor9XKke5hQo0zs9MD3jzGeluEUaGtJ/HDN3z3WxAl/BsqPH8aDDR48v+NGJzTjUxnEvu0qeJWjYQ0gfaeofFZ6AzC9qGjMDXjArbI3aADnmLPgNWHg3pJiris/xJXXxXBJh8Rz0kdw2QuYgSy+4/qn5GAZjfY83eJts1PQnM0ziEpaycOzS+aym86ZCxSYV4RbVZm4cOesEFuHaxynVJYpzcItstV5GjgzDd/zMasy3Px6EFDL16YdIHrN8tHH1RpCIu1QwWgqObqEG+OM+tMfO64+QgFHTEjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lO51Ig26CoCYLd0NkkY2iscn52DBvtUrOCDG26WKAio=;
 b=s8KSCV9YYZPLia7aP1eBjzGCZI8L6BqjBZgKkWXCPbSvr11pU6/t6dAr0tc6/oAt6uuuhEVb/s1Sc26O0B5hbJcWlWRfbVmVSe0RvyNih5TAvbMqjNclm44p+laxhGnrYNgx0wxzHzEdHouRvEZrEDYnqQXpa+TPx4DIjmmRGPjWxx9kEAohDDaYf043yIHYY9TjddyeDtAXBoSNlP6hZnTtNoxlfNSxxwPuAukvuYdBp1tSse5Gp8UiVNybtkbq/X5HcDrT4a3i5gFzBGZS3wTye8stpwYYUvTRL6Nsd1vioHxMV9iW51qAgLF9VC6iwwjxxzHr9hx74DfoUd+Fpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO51Ig26CoCYLd0NkkY2iscn52DBvtUrOCDG26WKAio=;
 b=oKU2WT5FH29+ojH8k0HShKliWhWkz5+npDqDzlAFMlCFKVyubH80VaaHFFck4HJSIvcv/jFNpMr5DUjFnFjGYS38hym1hqefo8T9Enr3A3EKXM1AGHUOiTr8xCrKVMGf1P9AYNQ2AuWgOqLfnDD+d6TZ16EQ4MgxoFkc8t74bwU=
Received: from DM6PR02CA0153.namprd02.prod.outlook.com (2603:10b6:5:332::20)
 by SA2PR10MB4492.namprd10.prod.outlook.com (2603:10b6:806:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 21:48:21 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::a9) by DM6PR02CA0153.outlook.office365.com
 (2603:10b6:5:332::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 21:48:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 21:48:18 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:45 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0R1072162;
	Wed, 9 Sep 2026 16:47:45 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: [PATCH v4 14/15] arm64: dts: ti: k3-am625-var-som: Set MMC clock pins as OUTPUT
Date: Wed, 9 Sep 2026 16:47:42 -0500
Message-ID: <20260909214743.899477-15-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|SA2PR10MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: e60f65fa-7ed7-4712-8a0b-08df0ebc0f92
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|7416014|376014|10067099003|3023799007|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	4WBFL+tx9x5N0hqRkFrUn200nuYz7GMQNnXLKxKb0NAW2rsPxYkyTRKtM0V6y+MzK8bc49q8wniBYqxbz5DKlVhoOoUGbjSGecc0tSwtCX9EwH5FUwKESK9qaDH4sBCooT2KxcGBmTY2Ls+lGaQzjc+0KWezIrzzyzUo71FgTgX6vSm5+RRUdwncftaGhgQfk3GjF3GbydVRh4fAbToP/7orcYtrGVLcuEZ2/LzWgWKoqbneBhdDrqXMw9jhhnTu4T+fJizV1+Db2U1drHuX8DysfAfMmbbKnopB5yC2fQICh1amP/Ee11lAtiggB/a0HOYY0E28eXtGg/Pnbk9GjYj58pK8/fvEB14+e5Oi9gZJa4Qjw4lTEnbnrXquPM0/LylLHiwKZncytqhOo+WVPo9PzdyUFMq4WhoDpTfkwlFDuPSl6NLtWKAwhcwr9GfMHpntCGrHX633CMZ26a04K1g7LQZeONAZ+vm3Q/+43s9mrVs026gSgyUj3Wwx7V4V2ZCtSoz0yV3F1as/82LRLzYCnJD1uEdk4SJCO7tzzAthFrNJj/HnZjraraeSMe/+5vDPhuy6BS0s7zHseHkj3JVNUnfi59nxCgst1/jCTdaFGARMYbwtVi5AD1MViY9a5gDtXTEod5Pvh9Y5LH7dYP97KdFj8U93c43tqjPoYy+Lzn7TH0jinG+b8PrmfoR+jUXIp/vcBDUlBeTHcpIvhw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(7416014)(376014)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PeDimqd345cxoN6yc3AmPfWtRPvLXYmPfEp3Ufhlqa6ZWsUFIfjTa8fYe30O4Ssk0+FIZDYgYM1Cuf8MjS3AkLU+rHa7FFbJ63uHFM9zeGAnUmeqEAqzIet1hS/6MxttFWJaSS9dYTD4jsYKPseCmETK7xMoFllpQrd1APUKB4z5rY+txxBx7e/6wSPKezES/VtHFGxs/I3rkvUAgfm5te+RPMfQ1ZTL5hmtiX5JEAqb+dwsVmGj55W67ykyl0gBy4ns7XkpMameoMoeUJr+kFus33jzY/B58ZflstW+2vXSR2qkJuVvZJpr0WiTswtk/yRSVsD68CaSRSU6svPZ30PPhHvsQIZMJb2LvuAwpd+hGb5eOKFeBFdqkgAAwbqPob9OsZa2+Nyj1K4p/0IEd4aRjCAnAOIcgQikJ7aJMucZFkLErpALO5tvB5x+wMfe
X-Exchange-RoutingPolicyChecked:
	GUHq+Y9jQksov6giuSsuC61wFgclY2C8KNcXsPoXaY/QZE4JThhxOALoZdfLBqnB3Iif5C3tIHs4bz2A6+fvBwtL2G1EibmU9AHngxcf9A0KZ3L7lwVcaOG0h1KwSx+2U1BRQ0/1U7fbu3ApZcZCLiH3OnqRMsKlurxQ3QatufEpzVqmjzigEhMw8BROzUeZSNGChZcyJHm2sekMHPlzbswj6QcERIM61hUSJRJONB5aFiOzwM2O1Tj2Yw5sFKdVQzKwfN2OKjmmCcR8XRbTRfZ/I3kmyM2Xzug9DX3v9LZhf8dfsaUuJgFzpYQxKgsg8IXALaSlDwb6CuXW0gErSg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:18.6719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e60f65fa-7ed7-4712-8a0b-08df0ebc0f92
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4492
X-Proofpoint-ORIG-GUID: 0PxvmC72sJlNmOUxh34HrH5Tns_MHUnt
X-Authority-Analysis: v=2.4 cv=SoAFe/O0 c=1 sm=1 tr=0 ts=6aa1d428 cx=c_pps
 a=Xv5HOu5WSFZfuBAuS1yumw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=_HXhFaAfUaoI83siruAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfXy31S0md50/x0
 zf3hPvJcoG+TOyW0zbbMeEHTsG5yciWZs2pAHvRBngBLTGU60QycNNfUD9urPySHSSASmScs+fV
 ZqrUsPOlPqxOeooxa3RCtMwe9UxG3VDMM1t9VWabvureqTRcFXJ3DkdksSPJU9tGl69cKDqvzeH
 7DPFi1BXnjbwH327W2tbFfoimRlNvt54glNhHcelnQmZpPQaSKgWrfxYsWDdcU+1d6JXge4njh7
 z6ePgRq1motWIHJhFPgnFX6Eij0fo5rhqvOJeQ2e+Aqj2R9ZI3X0npuFQ9wK6vJ/U0q+BG4Fg55
 j0EE6t2n+QwjNMaqDret/7qk622d5F7sJJA4dyVgR8K1MPqS+2gbSW7fibkkG3jIBM7NWHMUy+D
 EudMqSDawuoxb1NqQSqf/R8TJp3mootYT2qBXt+ftgv0oZ47WFGrnqe0uiOFBwMuMjnIUbKmDte
 DTEElnc09LfUDzuKlvA==
X-Proofpoint-GUID: 0PxvmC72sJlNmOUxh34HrH5Tns_MHUnt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX9RjsaNED00FR
 +YmbEyC0PJjiFtxBgy7uANVqduUak6/9WP/mOo/+3cTbo/WZlSV1gtVSQboCIQYsjvjaOi6nO1o
 eILzzuZzdU22T05HtUjn7YiXM06PYGc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals

Fixes: 887d9e03c487 ("arm64: dts: ti: Add support for Variscite VAR-SOM-AM62")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
index c2daa56c35e17..c23b6a90b8b13 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
@@ -277,7 +277,7 @@ pinctrl_mmc0: main-mmc0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x210, PIN_INPUT, 0) /* (AA1) MMC0_DAT1 */
 			AM62X_IOPAD(0x20c, PIN_INPUT, 0) /* (AA3) MMC0_DAT2 */
@@ -292,7 +292,7 @@ AM62X_IOPAD(0x1f8, PIN_INPUT, 0) /* (AC2) MMC0_DAT7 */
 	pinctrl_mmc2: main-mmc2-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x120, PIN_INPUT_PULLUP, 0) /* (C24) MMC2_CMD */
-			AM62X_IOPAD(0x118, PIN_INPUT_PULLDOWN, 0) /* (D25) MMC2_CLK */
+			AM62X_IOPAD(0x118, PIN_OUTPUT_PULLDOWN, 0) /* (D25) MMC2_CLK */
 			AM62X_IOPAD(0x114, PIN_INPUT_PULLUP, 0) /* (B24) MMC2_DAT0 */
 			AM62X_IOPAD(0x110, PIN_INPUT_PULLUP, 0) /* (C25) MMC2_DAT1 */
 			AM62X_IOPAD(0x10c, PIN_INPUT_PULLUP, 0) /* (E23) MMC2_DAT2 */
-- 
2.34.1

