Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FE43C10B8;
	Wed,  9 Sep 2026 21:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990531; cv=fail; b=kSIcotxfGPgBXr10fJRNLvjEGbbo+NWuxbQSyUHay7ZqMjfsBAAMXILAd/MqbLNqua6ifR6lL6pSIWdDLA5KNvFu01n999oIkcSQTGPZF8ad4TS6x3iclDLko02yT+IcELQZFc3mXrztqJdkA4Vaqd/eie5pf22NDF/YgBlhViw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990531; c=relaxed/simple;
	bh=au9qkHVH6DQ0S0sAKBmjX9eGbuV/NL1Yo8a0VVXmr38=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MDhL4XW7I8z5AyWxRBrLgqp/i733EjSpz3cYuNow04BdCXKyHYr+x3iPNQ7KIjI9RKQgXz6wMnBTpyOmvmeXNWpkIHov3x2XS5bWUTz/dSAHby7kUpJQRmGwZ6gmjtP7+/BN0ErW6lA27KqvnMupTdGZCxi95Up3Na92mG87J+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=RuwQfzFd; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VPZw8Tzc; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="RuwQfzFd";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VPZw8Tzc"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689JGDYX1099756;
	Wed, 9 Sep 2026 16:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=aHkp4J4NhAmkMCi9lPJq4a+/END/i6MxM5eDiktsL
	9Q=; b=RuwQfzFdcGBTRiiS9Yg3qnp6Y3cMAfIs0lFx8SZgo0LfwydO/IocynMdO
	S6AatiPkx/HD35liXr074riLKFIwGujwvJq6HhCVcOGCLYd8/wX+GLdsH00P0OvC
	WU4Hf4oUhMYeocqv+FwkV5Sgxz4GL8hBR89u+GWRH5/E3XPQB1gENU4VBVs76qKM
	Xfq989zbIB5GPFYEzGoMUUVwf4HiWxpXdU1AGhavxow/N+IHJ9HnMQ214s0qXLSF
	BShuny/VP1oi6xo5ENd+r7Vra68+m/LpoD0cNZqF9KIjXppgcf5ydD+Rq0MI1S4R
	ackGSuZhUJDgBkQHL/8T0BijDsoLw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013069.outbound.protection.outlook.com [40.107.201.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxfs2sy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soi8rICX3J3LqZHesH4aYD8QRPbvTRWiHyjQIJmqGkdPLtoxdIYErcEAyuePLxzjsfK5OP9TcXFglGEEMSnT3wdT6ZElc/hliHfQB8AvqfgLP+6D/PcNMnB//GAFvdRg26LD7tPeK1tHjmFRTJYHVQlJ6wkY0RMQj+tFLmP+7xFwBnK75mZALQFp5j2+0mDaaM3y7pvWJ6AMMRXcdXGHLomLOKMvIdBoclR89+6C7O7m8OY0ujDmtiaRdz4ugA50QV1GMMtdjPDOx8AOgvFx3gJ2hoxS2wtqwUk0u04tqf418glBOotsGbvzdNG7jdJ1EXzJ9RtEpn5waCACkOMLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHkp4J4NhAmkMCi9lPJq4a+/END/i6MxM5eDiktsL9Q=;
 b=bRyxWwJeKp64wr9le3amTmaOZm8ZalAP6DyUq+y1vfH7gGPHQyz9Ph0LIArrCQaY34dmoPgR6PzvZAYLvw+J8CDAL2X+Eg9Op1+9HREf9AP11mDlQKqPSVENSHHVtuGl0pcpXhBKlrGJP+La5xpCTg0p6VJ/TfV9EsHCiy9K/pfoBq9VhQ4wP8QThaUqPrwxR7+0axKWmssF0X3jNYUuKuXnh6MTk2n6Dz1dShJAnSove4wwdYqsC6cMclQHE8hKxNMo51wAhbXSCDVAxyw4G/J/efw9z57bzHAMAXqJ8GRwoCjw1pHk1X1vnasq699kBucqX7lYDXP8Yj/hUzOuCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHkp4J4NhAmkMCi9lPJq4a+/END/i6MxM5eDiktsL9Q=;
 b=VPZw8TzcNRQxTHp+9oc+v/9Dqff4xOC+zkjUVf5yheL74qSOFpM5/9Z8VtWtrUJqReMX3BjFPScINmZFnljhGDSz0wgPp8izZPCd5mW35OJ6G1gcQolKs9oYlA9YzYwR3Yn+QFiWomj0dIAbfklFGXYoAEO2NnmAjn1NRhS7GWE=
Received: from BY3PR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:254::29)
 by SA1PR10MB6343.namprd10.prod.outlook.com (2603:10b6:806:256::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 21:48:10 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:254:cafe::9c) by BY3PR05CA0024.outlook.office365.com
 (2603:10b6:a03:254::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Wed, 9
 Sep 2026 21:48:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Wed, 9 Sep 2026 21:48:08 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:44 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0E1072162;
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
Subject: [PATCH v4 01/15] arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
Date: Wed, 9 Sep 2026 16:47:29 -0500
Message-ID: <20260909214743.899477-2-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|SA1PR10MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e03dfe-f318-4bbe-85d6-08df0ebc097a
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|23010399003|1800799024|36860700016|13003099007|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EPgHzXkyW3bSUW5Y8+kZ7A8Y6PPlw8YfZN+GOOKEKo0JmwWUbuu/nrIvNMS7rp5F+H+xhv9Smm8tUQeCrXc3GT8H8+LmQ7y9ZjLh6izKJMDDj9t3i6uzY5Y/ZdQhTkj0pTUQH9VhyvEzvNzkv3Mg1cva1aiZmUkmHQ1nEtyrmO8Xtl70a4qGBNXfZkbQj0liRTFWTJ3x29jvspcX79bPVZqGwfOZgJweURPQsf/yiBUksaXCQbXkLNdSKBpjyT7VA9Ua2IolRixoULKzEy19FhCuhw5q99FU0bjiMjhhgogt1/PJ3SqtnRwsFUKv0PK7nMTq9OZNZ9aoJad6czEuyycIb0PfDoo1pRyY2EXj2g4yaABgpCl0Srgr8D3D9Gji/cDjIdJClr6leQkoznzub2qOUF5pDeJFSrfmPRburksRJRMwQk8AQdX382pEXaniijhpXBT4UoEooa1R57NwG5YMTcEcOaHgPBw1ZYEza1CRKCMmWGSwquErRVb4qH12vHbfaBKTSTe0W3KclstKgZxeKhaLsy8yJFBWf4Y1TWxTApQCF2xogf5RDEW0No7sDBQSrnIhjzEbI/E6ySELj7+Pp1tK+nOeWMyr5zaC6uywnKpUz145eSYj1ILFZsrfS5UShoTIENcnuwvsQWPPIOMqtgu8NNfXQ+33tmLPqKcmqRCFelrdJxAJAdBjPGCYxIpXEFa7fRZxWFFVTh3E3Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(13003099007)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tz8j0jjIywI8Yf/RQCc+hEE8/qpZlWS4q4pDYo4LEQMkH/TjN0M9jMr/LI5bO+hXvr3jX8V8jFwtavEoKghnBvTCUBBonMRA4kwXYQ6PsUJFDp/iasHI+PVhG5APnGM/+GI8XCtjAfChjcOo/gLID0sVN0vO3Mkv2kCWiEec3hzQbZGqr2dh5uyP+dDzOaBvKBdjTp4ExsrP4cGEvItBBdTRrWfXs6uDXkK5Ec7WeyudeJ/qEMzfRWHfzjfZdgO9Z0cOkF3DOJ1yM0EY9Nim9kdCFq15Ne/6xeREPJJK1QL8CPlgKOsXlRMtKQ7BNtpMQwABQros/E4d+8WdlyvVAvm3PD515X0UYr3pvWPjpmFFpZJsgRfp4IiIFONjzc1ot2YKvrKkPxgMdnT3A5bD3gEubBQTY+iUMEEOd657g9U+mwcwjxce9svDDDvrLkxV
X-Exchange-RoutingPolicyChecked:
	Fp04u1z/ZRekv9fgxdfh6bTPyZqDiddW84O4hD6PINqQG9V+rLbE4jscLl7bBJU6aE2lE2/SJm7cykvEnsFGX1nl1AHfs89NFOuyci1oOvroVkY3JxxZfd1HYhmQl1MHtQrXyOjYtreGQiXx/8sNGdxSa4TuIq7lCMH612ACsonKbMLEHeK8NUK3Uxt9tSLSOA2lpVBWPUsuBrOdRdi+AAPw6anFHkfhkWdwdTiM8JG7yNCuzmQ0XFtPoJzeey4hYnMVmzvHFfDLuguwNvVAhQruzZsqYf7Qhy/+ulGIozMhdFme8AmwpuRFg1wDKpL/uMdCZgI4nxMkzM2I+TftaA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:08.4194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e03dfe-f318-4bbe-85d6-08df0ebc097a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6343
X-Proofpoint-ORIG-GUID: LKYqll3Bau4OjOTPIDJCiDvSb7QcyqBz
X-Authority-Analysis: v=2.4 cv=SoAFe/O0 c=1 sm=1 tr=0 ts=6aa1d41d cx=c_pps
 a=x8MjW6KKBoBq+i/1BMmcjA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=N8RrIdEaZFVbIXh2HqYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX2AmE28/UG3Bh
 neRA+CDAvNn7ElsHx1ghuYBP6nmv63kaoylG/6CVvHILijn+tl4MyJjH/ittObfFPe14U8gmiyT
 9j0guA832kZpeAwfX5+5ZlQcfGOCnruMCCgiRVOmii1eV2z0XKqZu/EtkLqFHqLXaHhJ++xwTyn
 wuaKFLaBp5ZjLV9ziCsuTC/eCKa1DwomRS8V2pkxkZANe1tieShqi0P4vEcUhFlTi+GdhCgV8Rq
 5Ae+na5B2d3yyuG9ODjSBGDMz6bSXLR+CweeO9+IsiIt4fpoRReStV4l7tlRrNR8O3c1hOyX/Qo
 IxacObPi9RCsdAY7TiKipDiqWDUQb/wiTJwzA3E62oeKJCfAHxW62YY8YLG9M3G/rTVVvM2S+9m
 uWULRdGBQvjpynk2VhXUZvAnAuGXR/xiGKN0/mAQG8oIrU1k6OlBI6F/vyiAEaX0eHBDCBUggwo
 gp+eLYEMBvI0pH3AjQA==
X-Proofpoint-GUID: LKYqll3Bau4OjOTPIDJCiDvSb7QcyqBz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX/txAyaufRRbn
 UQc2wc21gSF8b5t3ADj8PQ6GN4pM+9FsSC9Aed6R3uPrrQkPbKx2simMgF1jzm9Xbzgy6hZ29ju
 kxTPK4mUGpfTFR/0dJIBGv/y/W/ndUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244

MMC0_CLKLB and MMC0_CLK have incorrectly swapped register addresses
as per datasheet [0]. Set the correct MMC0_CLK address and drop the
unneeded MMC0_CLKLB pin configuration.

[0] https://www.ti.com/lit/gpn/am62a7 Rev. E: Table 5-1. Pin Attributes

Fixes: e041ec6e86e7 ("arm64: dts: ti: k3-am62a7-sk: Enable eMMC support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index d3b3675e7a8fc..b04636cab71c7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -328,8 +328,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
 	main_mmc0_pins_default: main-mmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLKLB */
-			AM62AX_IOPAD(0x21c, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
 			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
-- 
2.34.1

