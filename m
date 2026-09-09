Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884203DB62B;
	Wed,  9 Sep 2026 21:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990533; cv=fail; b=IphrzIGKqxaz8clLsO5QmAND83hXX7llYtxhQDd8ecC+VRw9I/UCeJRUWPUPjagldGclC5WYNvohdisMUnd9VSQybaX+d06R5JwWhPvi6OrsoG5nHCvHJiEEFoVN5YdW4QwJ5WWomhXez1/5LBtc2CRhuaAidu42/A3hg2KYQas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990533; c=relaxed/simple;
	bh=GUKEgF81dvbVWQ7E9IAehAMmVuFeBoqnntM4WoaDhYo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EwnZHgWyqUuOxxjiBv/2NoOo8aAxuhq2ZkdxtUuG/KgAWcI+C/ZcOUkz73nBHqxjGT232sizPTO4kV9SlO0LMYA4Tt0XvCl8PA6j4CGfIkErlnZ/tOnw/ZN37igwMgndt9HX245axNCVztDbMvwsfNjEZdqDPuHYqGjoERtDBxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=AqYQKvKS; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qLqkWG9F; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="AqYQKvKS";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qLqkWG9F"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689JGCjM3382619;
	Wed, 9 Sep 2026 16:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yB+hHVAiqOKb/ycYV8pBrkdgC4Od6uU/VCbzMf23R
	0A=; b=AqYQKvKScsPCTBfzy0u/kl4xurbB8DEFZRqkvIya8XAqR1qbhBSDU+ivs
	PkDgbd+gNS8HvDB4bFfXG7/aphSyh4ElFkki4wOHU2bzOLvxFnpD8Qijtb9MIxtp
	FRi40aAcKQtK9y/KnVsv1CiJMsoVnOXxTwmGsuW9RvqvyKKQvkBGbyYfjiqetbX3
	wI/WXB0pv5kR7gCzxjdv9n+ufvg1VHvA6wWLV6UG+cFxZ8gcjfNmq6299tn/KjOO
	R8q6ku69HSTTYPk+Lhd1g7cXP50o0Mq4CYFSdOOEORxO4jnYZHNYEUk3Gvtpkyta
	tNcyrgu0lCRX2Df8L4y36QgXlQYhg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012063.outbound.protection.outlook.com [40.107.200.63])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxg92u2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecsFY6r1+baguIlcxFYNLzZAfsaezP/tnMfYnRNUm5h8wkLDS+K0P2g1QeipMJUMVZq3Oz8gwAYCAzacZCoyq2+NHIzYXkStJsDV/FaK4cTr8Cgs0X+knnGq0laS28D7OwGLoyc77vUph0zkOMQ+LkKTlGegFqA8p9U6scBI5qkGIlaDv2I2OR2z2ppU8uZuZv6eXdCNGVWSSt10xy0dUfFCdbJEnXkdbQhxAQoDTTJFXAY1U0ZLoGmVGZZE2p9RyNLjk/RMgcQXxFpLLottUZSVzCe/Skkt0ZtJNSKK2lQ3o8ET/PGi3gC9uIvo41PCyFToPvJk9mzKmJ4L3zl6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yB+hHVAiqOKb/ycYV8pBrkdgC4Od6uU/VCbzMf23R0A=;
 b=jpDCJfCSewFbM2BPhUia/8P5TvA4oU+Kzi7QLvEXrytF6mVJZDAbs1wLThWhBC6bQ4HNqoaRlG9aOR5grfzu6l3Z13Z7oBJB7OxK/iV/NK1TubU+o1CN2Ukr4BCylNAYgnoh3FfiJ73PhlNh0qGzd3RxwaZUxhhgjPQEeGwIfFXrC6m9pRg9vFT4ovyvi/yxzcLiXL7zXeqFp9IEKaoFjrjpf+1ab16rz2tVVPg1yV+Iuy2tA3wScxQCTDcW85lvzs2F5j79m7HGSz4nJkYYOw7wcUYHOU9DqntYG9STxWf07t65y/xYD7JQwugiMhsWTr1f+/UZrhm0BZHiP4oVvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yB+hHVAiqOKb/ycYV8pBrkdgC4Od6uU/VCbzMf23R0A=;
 b=qLqkWG9Fb5dAFQ5AJ+bSvR8iXJxHZgHPziJoueukhxVhVAMsrqlFi7qD97vOi7Qz1sy59ptKCPTkIzR9euZKL+PbpIKVl+HmvwCDtoQcBywBBc7zu/DIr8J4IwK3x89hYTdUsuYX0rQAft4purfJ0rSSpuqPJRVlaOL1ewM68qI=
Received: from BY3PR05CA0028.namprd05.prod.outlook.com (2603:10b6:a03:254::33)
 by SJ5PPF1425E126A.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::78c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 21:48:12 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:254:cafe::29) by BY3PR05CA0028.outlook.office365.com
 (2603:10b6:a03:254::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Wed, 9
 Sep 2026 21:48:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Wed, 9 Sep 2026 21:48:10 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:44 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0K1072162;
	Wed, 9 Sep 2026 16:47:44 -0500
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
Subject: [PATCH v4 07/15] arm64: dts: ti: k3-am62-pocketbeagle2: Set SD clock pin as OUTPUT
Date: Wed, 9 Sep 2026 16:47:35 -0500
Message-ID: <20260909214743.899477-8-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|SJ5PPF1425E126A:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab5ede3-b0be-4ca1-57a8-08df0ebc0ad5
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|7416014|376014|13003099007|22082099003|18002099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	r6OwySs+9DYG5yAToHwNDO5dtoSDPCwUb3aSe+fZDfCWe+OZO9IOAufKf+566pEOq1qCxqrCYxWTsrvKlrVQWF5LzmjelFgImtS1Hl1G6Hf0zv8y3yykBkVghd8w4Y42Mh3VoDZ2lZkavABMjUSB+hfekiDrJ1XgRJb3WUj9TX6Ah2jIGoQ7WwY+bCrGcIFV30Fyj3bRTgjoLxo87+QZ8RGjBlJjr3wtrXT5YCwY/VGJdIaMHbWBibS61/Ol1PQv1tLny6FaD9L/7FuARCJBR9WHkhWAOTU1mm/kLdiPWHvli1ZnnYbnc5QjJ/hPeA/IQJKWa4qCX9JTAMunFT+QfMgRX0vflsJR7UDnzZcsqbY2v6hVbu3Ra9TroEO993Ujs22ijcYU4R4NKcaT9mZOOAi0T+wupq16Q6kd7fr5yug7kRf0dMbeqH+x1wa5ce0iJPOkVQlmAjcmZp8nOSak8u1uAv8wszGzIUsNLIIm79Kua5F64ClTyHsTSQ812cUkCCKPJwgsiaf2ly4YLCWhBshivGJh/fdquZ2IlDHR91ulQFqCM0Z1mLGOBG1HFjSzfV1dmawA+b/c6l+2AvpM/yeRF2XVOcuPZLpM1kssyo+D5ODYf7hYAjPKzf301fY7QZxrLGSr25evcb81GjwX6+OlxHe0WZncsVkR3DIbSzjnLtmTHdLJXbDBqXN+JKfLdaq/O+ROBK3Raa17Uq1B4Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(7416014)(376014)(13003099007)(22082099003)(18002099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V3x4eglaqErxdb4wUQlPPh+Aa+ZkAEGkBV0pLYZa3RWbHcMkPkmkkS2CLyMzh7rwHcTeRs4lRu89f1GPY9X3Iwn9gKEE/wr8ThTOtnj+lz3AVUGVxwtHUtKZA+E74yZL0DCWHtBGj20Q08ewYTOJK2sWmRyVW5doyROaVPIr0wY6Lk05ogHEDfELejqg8SWASm1NnatPZaNwf1wtrL+hQw2y9vdzy9EcHLyHyxD6TZAMpMBsQOnlrnJFUNZFFxybXlKHERAdah45CgN3SyflXKeecEO0THcs20hjq4yKm0YzTLaAVuSU0T1Q5De/ddWUVGwyEihvA+pIb3OLuUtpgOhJDo+WLk6Iw2r1EqSWeohJkV0pJmpGE4CAfbXqZ2u9W9s5+4ZnpU9VpT+/ziiSvZuTpa4bYhmAkDRmZJqcQD+qV9KCeLwC21/nMe2uVpBY
X-Exchange-RoutingPolicyChecked:
	4jWXLOSvS1JLnBvOHpZLW6z1ax277gMKDWpyRyJ6oNV+dT8YFsXomvEifLTFdIrR6lJ1ay9PRUrV+Jl0u8q5+kLs2FA0276gpRY9t1bBO6JD7kWlXhgVoFRqyBmrriAPjjtCOEZvB/ebnekoy99oyHY5RaScwE8aNXvpgXtwPJmOOkv6Nywh02fwS5evrQaU3Ky7aRLS+q/rbhraMrXmUaKtcJsG1OZQpD4y59irdcF4BZsbY1a7XZF6R2X61/NQfFq3+4Sqsrbsv7Xt0ZrJmjh6GDuASXq49aCJJeZLe4WoV2mnRN8Xpeg5vPYi+sGOVsDolIEq4vUe5I4mDyyvtA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:10.6983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab5ede3-b0be-4ca1-57a8-08df0ebc0ad5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1425E126A
X-Proofpoint-ORIG-GUID: 7m8hhXYb8B9ojE2wR3gvBITfAbKBCtvf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX4wEvkGpDAydY
 dcNalK5KFbz1lodJGxTJZ+V+pZ+nB3XQME5OHFjgEwT33t/S7iM/xkZB8DG7b9tTsAsCXOCCeHd
 pnzO3K8Xtn80spzrW+trmiLQ6eVqmvs=
X-Proofpoint-GUID: 7m8hhXYb8B9ojE2wR3gvBITfAbKBCtvf
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa1d41f cx=c_pps
 a=9KM80f3Gg1/mZdPsmiBtBA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=ou5Q2muKSX2s0xizsJoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfXzMZcl2sZxSMa
 YQh4HoVuaYMAJIY0arC5pRDqHpr1o+TGDmcrlz84kkxsogD6uXZzN5HU0sct4+HZjyoBAUrUnNp
 Sv2aHY8HCUh+m1pQywBjO7bBT4CNhjKiveQBoR4JUuoUdEewRH6H8fUUS61zqUYophO4EyUOF8i
 b7SeEFIq5BrRBSyxdlqQtzLCDIcsXu2Yb7peXBIp/2aDxGBrtAJFIchw28Slut/ujuf+KQXDdxJ
 rB1QfFbhLmzvrHwa0WVf8buhAqnXNJMy6bwUQvk+wBBk5oSc3Ghu4tSZn+eLD8Z2wnHXZXjfJaT
 2BGCphNBPb5v8Zhu7brUpuReH0h1Jk+u8lUTw5l624oyeLdXruenlYZKbPtKSnjHU8iuAMbPfty
 1sxrXglO3tu9PD8gFYOdt0TmVwznf0uxV9YpxU633eG9JqTa8tkvBz/tz+CD+IiqxUxPBTPhFuD
 /A+7M+TSbo1+ws7Nf2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals

Fixes: 92d8c028aa92 ("arm64: dts: ti: Add k3-am62-pocketbeagle2")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
index 7a4cffc27bda3..1c691629d4ad0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
@@ -235,7 +235,7 @@ AM62X_IOPAD(0x0020, PIN_OUTPUT, 3) /* (J25) OSPI0_D5.UART6_TXD */
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21/C18) MMC1_CMD */
-			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22/A20) MMC1_CLK */
+			AM62X_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22/A20) MMC1_CLK */
 			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22/A19) MMC1_DAT0 */
 			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21/B19) MMC1_DAT1 */
 			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21/B20) MMC1_DAT2 */
-- 
2.34.1

