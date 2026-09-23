Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62CB419FB2;
	Wed, 23 Sep 2026 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156308; cv=fail; b=hoNhUqbrm92LBiVFw+A7TH7Zs8d85M/F+ddH2klIgMDtX8TjxEcLCDEo5nyAaqRGAeZYxY4sys6/8GXSmV4UyemzsRqiq1GgMNtm62pTU+TRxKe4MM7QabF7akgslDLn7uIvS5AcTTRLb9jNgkWY95W69M91Lxc+eNAykDudoqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156308; c=relaxed/simple;
	bh=3HwwcZ1DXroyKkuF1TPauPMp4wXYVZ8JD59NIdoUzjA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PyQ/pug1yajz3e9GR4z0arOPgkUh+rSuraeN0bBPML1f97Zdxgtj5fUteeonLoeV/wBRra4co5yLxIM0GQcZoCKHYFJqA6FvbsIfz9OgcmMpWF672XvPi39jWWNnEdTI5N8nOplb7MH7RGMdbBam2DBLWh96FXVpAbh5esoJHds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jYGMyma7; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jk8fkTJP; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jYGMyma7";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jk8fkTJP"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8NCGW1611727;
	Wed, 23 Sep 2026 04:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4gshtbFU8V8wijXgK+MIDm2E+8jRHnJARj8bLZ/hL
	u8=; b=jYGMyma7oY5ZT8BHDGsv1j5hsFsCCCF5jOOZW8hAmiEqDVOg/QptFxjfb
	ueOI4eNidHwzUmEaVVJskRFjAUx5wAai0z2qQDxjeraRpjcc+4CC1ilPb1dZcw4X
	D4ur1D7oFV8YSlBJqt0jfYJeq+aiXH2gcIyA6UYxBHSobn660UANUyohwJVM4C2g
	xiUFQ5YfWUuIThlN/3x9gFsrr9cj9HXh1a/cwf5jWbQQEQ3dXiwsro9XdM9LDGaF
	Pq2BjvhtJfj60gXJaAPHjdUr9vUZvwk028o87lviyDuglo3VqA0aBjE4/429lXpL
	fqjCzRDNYckSWa5mKW4yXNdVNTRCg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012001.outbound.protection.outlook.com [40.107.200.1])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77rdg2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:38:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+00HEXhsFND+JOURRmAfVf1G41h1mBdcCUYQmd04lIQ6CVSzLCRTLBpvaj2h2ASdoGFfOq2tfBzjm8V8uay551KzmY4ec7w8hND8wRGBLs8zksmjn4fit2/aYolUG3S844SA+QkjF+czpw4z+rieYPGuxRpZeOZ5EZWIx6O7GS0XjaduNvAJonx4co9GkaQpmppRT8cWtaE14xD4MmFluIEys0YTJJo0Z3Ou802UDCDHN8zP9hF9f5hSq1OrqkPe7CNHhhmWSTUGyqz6eyPl9JYRuq+YtpOLSxkGiaPxmUwROiVn0zYCJbeymidgq2YrHQSmacxMu1EFv/zVeMi3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gshtbFU8V8wijXgK+MIDm2E+8jRHnJARj8bLZ/hLu8=;
 b=orbBNB2DumdtxjybV9XXFmRHxn2ZSvuiz+Rr8y7cescafMCEEGp+QVIGYAu21BP6vaZJhB1+CYLtWAfbkm6dJu9mNoVtH8W9Gpc5iheICmH2qjfTKKmPMyd5WvSSsu1fkGcuYe91ASdYLuPn3UhPeM+nULmZFKOSXLV16Oqzd4tmTL6CUESLVunt5COzsuJLhyDMwZxptBJVgCViiLE3/Azqxa6jNGaOEXa1it7Pa0qkUrUERpEf7jRNtZH9RMnxI6YRRJe6KXiSnvts7H9zkzkUnr50gyBCROzzrlqdD2VIa/MxvTzhcj9d6FeGbM0J4rJ+WeCxv5H34dpU80y/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gshtbFU8V8wijXgK+MIDm2E+8jRHnJARj8bLZ/hLu8=;
 b=jk8fkTJP55wkZmgydPF7A3sxdrKXO/QhZPRJbjMccaKRMAhv72sMMWFzaQ1DdSTxZr7hVlH41EW3kNDv4OgI6KIAaI2l1sQnQ2m6rnIukYhmE5O4ZW3+n5b5djBD+f2g1x/X7P0cU36noTohD3DGx9BNja5sdryzQqN2j1hcO9I=
Received: from BL1PR13CA0273.namprd13.prod.outlook.com (2603:10b6:208:2bc::8)
 by IA1PR10MB6124.namprd10.prod.outlook.com (2603:10b6:208:3a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 09:38:00 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:2bc:cafe::4c) by BL1PR13CA0273.outlook.office365.com
 (2603:10b6:208:2bc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Wed, 23
 Sep 2026 09:38:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.5 via Frontend Transport; Wed, 23 Sep 2026 09:37:58 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:37:34 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:37:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:37:34 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3Wg1760658;
	Wed, 23 Sep 2026 04:37:26 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH v3 18/18] arm64: defconfig: Enable DS90UB960 deserializer and DS90UB953 serializer
Date: Wed, 23 Sep 2026 15:04:59 +0530
Message-ID: <20260923093459.28125-19-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923093459.28125-1-y-abhilashchandra@ti.com>
References: <20260923093459.28125-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|IA1PR10MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 036117b2-9090-4f3c-e1e0-08df19565a6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|13003099007|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WlG/CZzsGwoqVltJS32VbsOP2b5Vv4fy6dNkCm2Bm1GX23o+m8DzBxaWOrr0BV9Cg15395keSoHusByCqTluK3TMeDuuuOwdjY+oYDqp6XSXCHicdZWWTCl4e83qicHU6QVC8UCjTWbChMMkMpMj040pkbfF5Z6f6tI/Xou2zVQvqJYgwXGl40TGm291KoEQsZtoVDfkpOHeahUdLOOWSOQGw49QoiQF7piKZ5Vx/YapkbszFJsNvGHbUhvL/Pol4t/llXG96QggPR2m+ub2wfrgM0AQvj9JOJ1FlliV1nQ8OR8gF8GqcQuynYyKOP4W0AxcL4sMCKVbuKPaKac+JbUnD/QzJ6cCw0ai8Nbl65QXkdeS+7p7mxdiC0jj4tNupDyhE4InQiFga87eiYtwiEFENZlr5GaP16BCb5FDrP0VaMuGG1vVnP63RZ4QO+edKRbmQ0uD8YdKB2iWeLRsrdH4QP32jeGwsNa0r6nO+AyivQ7YkRObEi6UAKevwYgr7hciJd9NfASclkaUVqUvmxBjjuqSA1ArPdZb8C4cuNjI9GiMXsxdGQ+doFRGYV7lVxzbk8QO1OoMWzU1qVK/3AhxaFJzfzjgTxZpegISpSlSPYjzYoKkl/EtCVNuU5WerkZY1+GR0VFveJw5PrzYAEE/PmnwFtWUKlWjh80CuuTptpowSkm+4xphh+M8WYkKRWGErMJbmTzqNc19pUobYg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(13003099007)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4lf5vVJl4QUyUlB1oJHPbpNjpZ8rFvhpAVPYz3yrmjJpyocPYjZ8c+QjaqZbwZctGWBjS1RwoHG3Y1jV4AygIssHtQe6gkV+Vsjq5MNatU54gDndigcQs0JkIsPqQC09k6V5FYsm5ZVpUBXbSVER0xBaVCyl2s/V8UQEErTD5kNZASO4FqwAWNnPLCbHoBRaOI9hnNBIftfZCdyDyCOgf3NQsEl+qN855uVqK2I9F36IKg7EGkcdPEhr+48uzKOGjFzlCz4yw0HToti8gCWQM03YZqTZcczk5D6zqyIQJGngSE1/qAAAFEMeLDwcaqzHtMlTTYmsSvmZpeT93od2SEAf3XhJXg+1s8W7zc9VD/ly85sq/iEcBQgUhngBYy+Exp9NGdgYC4Eqsy4RBNgofWU8VtKhZCzP3qX+uHrHz6g/MGxAwzBDLRnVzhzCnxBD
X-Exchange-RoutingPolicyChecked:
	Aq5wtfeSC0joopNKUPS+a6lTWUwac6wVQUPAO0E7lZsAQ7kvkhFDBZXYD0y4Q5eF7NvCLyXYtlWSon/pFPxUsqINWpb0XO0Q/0onk6J5udKH2EpRy563wVXqH2/LMsxAJOtjYvOSp93pTqdM1T4t597+2dTxHaM7uOREPd5k6bQ8ECRZLiEqeHWR7Wl7yXOQINN3rnvYV9EL3HyT45atbmfBeKUnvzoQJ3M4b5hwDi4oCj+t0A/wT5GN5Ce9Olj9vTzo9H3stS94m1sjhxwL9nf4YNpDOnRETb61ajImLkmipqk1C54slkzTuzetrr/GMYZ3eYrIdaBJZbYwnLFd5w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:37:58.3846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 036117b2-9090-4f3c-e1e0-08df19565a6f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXxyK2LfD94uO0
 pP4MVwOWQe7nhfNx9MFoPTdE3G03aUXLGnIRf/BeE3VwHoz5V27DEAhPLbHYcdpi0teL1JgILpd
 ISCrOtH0N1J3HXk/bPCnqffunE7P6TyMXMWf8YC5WXRBo2lph9X8hfqbG9qi4o91c8D/OiEgKhl
 ckS7uN+grftWmJW3v4QkNxt6UfXoEwAfCVwLadM82MOWfQ1H4UFsSP4mCfFo+UJnFP91fEqNknJ
 56nUm98eAap78Zuf5oyqdW6mHcDbSsQnxNWegOwj8teoor8Q2s6YV8cFTTbqlQvjxiT/XUhNoWJ
 ea2z+Ax3wlEUUioAI47BTPMpLiUMugnrO5MQz4xRKpei0pMsoWToEY40kNMLa6it0gdhjcgdUdA
 uNLHj0utF9wfHw8H7BPBbmncjbxd19fygQuoSL7Z7vD62MbEx3jgO7XKYNNuKRgO+EJZoXHEN/7
 7tHoGhWZsMg8rBvr2uQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX2NJQDk+oT52K
 wvrJ95ebgXwyVjIBfq3JGLY8sesu9zi1kUyqHbsOqmFHLwFhfjpBZzg4U9A0B++2Lu1atdWHMye
 oh69ayTLDUvLMRIDdARPqZ5uiLBhrkY=
X-Proofpoint-GUID: udCplcoqhnmQWkzvf6G5o_k9BuaHcDnD
X-Proofpoint-ORIG-GUID: udCplcoqhnmQWkzvf6G5o_k9BuaHcDnD
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab39dfc cx=c_pps
 a=c79N1uTKLHxLQxOLln6vMg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=v3qYMKi1rdSUh7ufAVAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

Texas Instruments DS90UB960 deserializer and DS90UB953 serializer
enable capturing from multiple camera sensors on Texas Instruments
K3 platforms.

Some of the upstream-supported platforms where this deserializer and
serializer can be used are the Texas Instruments J784S4-EVM [1]
(k3-j784s4-evm.dts) and J722S-EVM [2] (k3-j722s-evm.dts).

Hence enable building Texas Instruments DS90UB960 deserializer and
DS90UB953 serializer drivers as modules.

[1]: https://www.ti.com/lit/zip/sprr458
[2]: https://www.ti.com/lit/zip/sprr495

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changes in v3:
- Reword commit message to explicitly mention the target vendor and
  upstream boards using these drivers (Krzysztof)

Note: Board names in the tree are lowercase, so please grep case
insensitively, e.g. `git grep -i J784S4-EVM` on next-20260918 gives

Documentation/devicetree/bindings/arm/ti/k3.yaml:              - ti,j784s4-evm
arch/arm64/boot/dts/ti/Makefile:dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
arch/arm64/boot/dts/ti/Makefile:dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
arch/arm64/boot/dts/ti/Makefile:dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
arch/arm64/boot/dts/ti/Makefile:dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
arch/arm64/boot/dts/ti/Makefile:k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
arch/arm64/boot/dts/ti/Makefile:        k3-j784s4-evm-pcie0-pcie1-ep.dtbo
arch/arm64/boot/dts/ti/Makefile:k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
arch/arm64/boot/dts/ti/Makefile:        k3-j784s4-evm-quad-port-eth-exp1.dtbo
arch/arm64/boot/dts/ti/Makefile:k3-j784s4-evm-usb0-type-a-dtbs := k3-j784s4-evm.dtb \
arch/arm64/boot/dts/ti/Makefile:k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
arch/arm64/boot/dts/ti/Makefile:        k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
arch/arm64/boot/dts/ti/Makefile:        k3-j784s4-evm-pcie0-pcie1-ep.dtb \
arch/arm64/boot/dts/ti/Makefile:        k3-j784s4-evm-quad-port-eth-exp1.dtb \
arch/arm64/boot/dts/ti/Makefile:        k3-j784s4-evm-usb0-type-a.dtb \
arch/arm64/boot/dts/ti/Makefile:        k3-j784s4-evm-usxgmii-exp1-exp2.dtb
arch/arm64/boot/dts/ti/k3-j784s4-evm.dts:       compatible = "ti,j784s4-evm", "ti,j784s4";

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb6..eefcbe091c9a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -961,6 +961,8 @@ CONFIG_VIDEO_IMX412=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
+CONFIG_VIDEO_DS90UB953=m
+CONFIG_VIDEO_DS90UB960=m
 CONFIG_AUXDISPLAY=y
 CONFIG_SEG_LED_GPIO=m
 CONFIG_DRM=m
-- 
2.34.1

