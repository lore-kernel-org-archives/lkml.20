Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DBD4A3D2D;
	Fri, 25 Sep 2026 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343133; cv=fail; b=hk7BjOpXjPb5m83knJTGw3u2dzYHjzQJvvaxp/DtFL9t8T5RoWg9KtLDG5Zao4VZ5FL2Y4dcZy7ycsZWM3WqXnusqM6jTrIsyTRiTzQWBYa5N2oQ4teW9bplTedcBJkw8CuM8by4pQv46q+pdEBwRm/ayrsvPQQjNSWUiACP/ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343133; c=relaxed/simple;
	bh=N0LJSmUK66OKl4bGWEFK6vf7+ZSuTWqYZACkhQ06D8Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZySt+EAilJkQT/MhZOUUoOQ9r4UWB/EdrqfjhDZd6VMh1zekEimfDLyeQqWvNXlnSoaadpJeFZ0xsMY/ap7SklrXWw5Pkh995jzoo1w8BRa8RqkjGILeyGaxeiIp3UNqOBPwThQ9jKyZ2ck4rabdApINkZFIrVCgrv319f+iGLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Z1jTbfgS; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=i7+z051W; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Z1jTbfgS";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i7+z051W"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68P91rCY1888882;
	Fri, 25 Sep 2026 08:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=n7IOFd3wNqsFtEIbfABeyhnhYl7cA9gRRgYuKI1Tn
	PA=; b=Z1jTbfgS962PfEyNi4jyzPL/mGxXFKjR6ggonlx+xf6CN1ma+TrTrEawZ
	nxvHTMC7Anyrm8YFmm7zrThpEFSKgmqbm6U+Y/oCz2CtKW6/9XJiXt2dsh3+XqtT
	spB1H13Asu0Ww1YzlIBqnv46ZljAFXlpSr3Gn2TXcc5NfncrVWCrGPok7rc0fw74
	jEyACX9OlJG3Yup5lJeI4qUjne7LHNrsSrFxgEAdm4Tem8iHRvlNpMNbkJy7wnRj
	+LRYs+xASjhUQfoBVUkrXm4ToQiNU9xMTLAnPztdnDQP8BlcPTF3kuekbXKb/Jec
	DXmEGkXgYGA0rMop3C0/CnJCS05Kw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gwnyfs9c0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 08:31:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eq+WGANjFhxzjkZ2GnkDLRe3BSnSnvwYHVGVmHgqLebewVS2IXiEgLyyjx5H5yzUSQva4reCNP4h82aRBsxIesxshm6YL1AGZwguIgqB0I1gYc3yThA3qlQezX54cMd6jxN5ghdkg/608RlPMhOm8RzRSppFZ382UeNx4Q5mWzsjFOOyd0xMOhxUzdg7w4AuO8h1klxFR36Xa5KqFlDte2t0BsQWMyY/9PFMz8twpu9/DV+kKJWnwfYA6aiDa5OBzO1n25C2JNV3RDDZF8nJspZDrbXlZ+UXC6kBTlKznOhQNPWg3LnoeAj+lT+BZBci6J7olVtcZC+BoQe7PgFmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7IOFd3wNqsFtEIbfABeyhnhYl7cA9gRRgYuKI1TnPA=;
 b=SjCNlBRk3KuKNwQvvBRAHMkjMwfo1SnwDof9Thb9aMiaHOniumyHFe/vPduTxlYW11JJQ9JAkyeVhRaWJQ4N3kjWC3799WVf1/mQighFwDwMAoZQgdzQ2QNCRON9kOktlO6zSwb5YmRxTY5FallQr9aN0qzu9ZaKODPeYTwDdzhIz6Y+WE8n24jnkqBT0L5L4ji/GO8MbXp8f2B3PL15ckR1BX3cTaBrKV24ZAh9Do6J6XQ3wQ4xJftZ0LYa1N0Ue3GIj6JMtN+UeJacwrWiHbsjXbIDt3YyntzTJiPpxl69y7CL62bdTD1LcBxZyL2thZup0TZm9WN5gTn8HPaMNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7IOFd3wNqsFtEIbfABeyhnhYl7cA9gRRgYuKI1TnPA=;
 b=i7+z051WrLgxZDYk21LHNlkaFhVz91qUpVw+dcmcP79jZbPQ3yWYkfa9iWo6FeEErasuhetSsYvfjMeYt/jc4XkvFED1xuKB9Q9xwTV58vagG/noI8AWvhQSuo+6WDriUinwvaYttR5M7vFE0YpjKf/Z0rSnMSHK29f1hzwM1A8=
Received: from CH0P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::34)
 by CH3PR10MB7259.namprd10.prod.outlook.com (2603:10b6:610:12a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Fri, 25 Sep
 2026 13:31:38 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::8b) by CH0P223CA0016.outlook.office365.com
 (2603:10b6:610:116::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:31:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 13:31:36 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:47 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 08:30:47 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PDU1nC2840014;
	Fri, 25 Sep 2026 08:30:41 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <sakari.ailus@linux.intel.com>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mirela.rabulea@nxp.com>,
        <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 7/8] arm64: dts: ti: k3-am62a7: FPDLink overlays for LI OV2312
Date: Fri, 25 Sep 2026 19:00:00 +0530
Message-ID: <20260925133001.2780868-8-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925133001.2780868-1-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|CH3PR10MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b7d341-df4d-46dc-9758-08df1b0952ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|1800799024|10067099003|3023799007|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	f/E/ACuwklG6OQPZZeWYphhXlNXj0R2UTWIX7g0iCHXIYkUUEWPPyFpXWR8y7//z7D4u411jNaaSXPcW8K4IZselrFDsa0s0m50eaMzl0vC1zolFhWXMvuL6zI9D6KDCbIlDgo2oOO8T+17tynH7VvAvciasHcMU/sNWh9I7jLblarBHvCeAx2uYEwYpjzbJko3kinWyZDIR4QnFuEntTT+26aUyhtTZTQGwhVRH4DhmsEl2rZmlpyvjbOLqTQz2kUQOIaZYSOCauY9icmpOmSp+EwPhjkgFGvjf9L4mxRnUrGgqAkdUncZV6vNR65k3DKHiAboXYsZhhpFxcIlrwz+FJN39Qb0rL3vrmD4dhtrQ6YT4e66t16IcuYxK2xYl5q7pBacNX93P2r75xkE7f5RtLcSt13CWCpAV9zLtHSxq1ZxV+2Mlbx0XHTcq3VMspeplXB+YXo5B9raW/HjVrW5CLIE14+8hoJWhBLdxUPT9GyXS84EOB+9BNYaGcMuDR0xfKNHGS1+V+Ae7Ly8yuWQcZE5mCYgbWZjq687Ha6fbzFpHAy/BMHS8hftIvM0mY4mKiJgB3tgWbT7koAIUi/ukPdwrtaIcBQCRxyDxZT5Ocp9Pd/zC7rzh7RzQc9lTqxyOzd4nivHFTYV0UZ+N5w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(1800799024)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K0URlfQHVzpX+5TkBEZlophCjB24ejA2OI3APfi6JW4jFau4BU31JG2VmXNFNk6h12FIJCPDyHACjDdkBhY5K1+yZMWoTNbauxmVpZ4ejbxlfXCDIuLljMS0do6DhI5GPKZjOJ+7tKTymOIAre8qvQlQ5sbcXiCqACUzLC/m/mu8j3OVg3NOwejpCXxbrMvPxZ/2Tyjxq9hKU1m4YP/hAt/9TRziRD4MkbIFJ3QbhDvg1W+0kYTbbxMLGGxMcZMsJ9BeK4IoKZaU+dcFGWOGk2sbXf7ySVAzB6j2Y574Nj/ulJdr1bXuY5OlWGSOwK3lzUtVFR7iU8W4TynUHjz7xkPlmb0mWE4dCV3R01YY7KsdnjAXzpwXudo0GbLjKAIr7w0cIUIVZJy4+x4UcLKg+Zz72sGXBJGAdDy3tzvjG3QqKp/iWvi4gx6KDMFH23SB
X-Exchange-RoutingPolicyChecked:
	1SvaS1A0kwqLe9fZOHTMhuIo++gU62fESw/1BncRSlKsirDtVgqNRw5Szpx5ocCscsYVfAYVs7GD1OtCScS9+5PYSqrd+2TyWkxE7w/oa+LsWSkvGYxcLBn4lizekRiqV1dT7Jw5eMgOBh21Nb4FNSwOq0hW0KTbyD4UYg3r668QfZ9rsJzH0osCZG8wJJm8MIqjjAByeMPdGt0XCAKfPkh7rpyGQPGY/5LnBRlW/iV2GlV0kphxIiDWCwHUc4T6gwzOchQFzyW09bDLQ8flItWESEUfitR+dHuyMQuY2DcJulQb3pRJ2jxYK/b+Kq+0EmdGaGOaQ8f8o7xWSTLDfg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:31:36.6848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b7d341-df4d-46dc-9758-08df1b0952ce
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7259
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfXy7lXDiRUsujV
 nSNZfRle3PcO5Z/s8f5h9xqZdiysoq2ifG0MEq8bVuLH2HQ3c7jBShMsl/mh+Cr5hbUqOAyD9jt
 jCylMk9wrqluNJy8pgef7se4ddlHLKwl4xG1DS5hILPvwXsPtYTM3YA85kullQ5XhgYqH6Dpa3u
 zXV9KTnWwgaJ+U4JZSaKTVj7FiHvhq/6F7n4yozqwAuXf/aOgQNwGUAF8jqo4V6YJURc3/PQ6D0
 pUZYdwJn+caawbGy+NgV8x2od9JVUD5rMKDoJjAmuBnz39fRCYoE+svWp/vQn8QPAg9sOl8iYdl
 WZRM/vsOIrsbSGu63rBiwy2ViYQ3aolRgd1ao74PGWSeNymN3zllIjFeYbNJXSOQKsexx1EvOHU
 lK/L0bl+3k6RQfz1P4Jg6sfEVX4XZqEjocTMDsFP8r2cn5HBK3J76QyQRcWmOdjFaVj3xF2AN4P
 AkeqCcNkx78Dr4tfYRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX5newoA0BjUI8
 fM3sgEvh05NMvLvd8LhZCFu8eJbqQ9I3J8XCHDWR+94Rf9H1e7XzBYMOfDU2gqMGqlixO4Iug0C
 ss1ZHCoyQhK2HlAX+lj5igClzD9d4Vs=
X-Authority-Analysis: v=2.4 cv=aeL0Dhot c=1 sm=1 tr=0 ts=6ab677bf cx=c_pps
 a=NtQEcg4T3rGzBSLVY3gzHQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=BIeaPEhIAAAA:8 a=sozttTNsAAAA:8 a=SCyOuhRj4KJ622XhaHgA:9
 a=xdwx0GSDnVkbZ8IFV8PL:22
X-Proofpoint-GUID: AnlvfcITFKgytFhERBN3imMAUnGP5dw_
X-Proofpoint-ORIG-GUID: AnlvfcITFKgytFhERBN3imMAUnGP5dw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250053

From: Jai Luthra <j-luthra@ti.com>

OV2312 is a raw (4x4 RGB-IR bayer) sensor, the LI-OV2312-FPDLinkIII-110H
module [1] packages it with an FPDLink-III serializer (DS90UB953) for
use with sensor fusion setups using FPDLink-III deserializer boards.

Link: https://www.leopardimaging.com/product/autonomous-camera/ti-fpdlinkiii-cameras/li-ov2312-fpdlinkiii/li-ov2312-fpdlinkiii-110h/ [1]
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  6 ++
 .../boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso    | 89 +++++++++++++++++++
 .../boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso    | 89 +++++++++++++++++++
 .../boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso    | 89 +++++++++++++++++++
 .../boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso    | 89 +++++++++++++++++++
 5 files changed, 362 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 795978e962ee..8d608e244087 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -508,5 +508,11 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
 
+# FPDLink Sensors
+dtb-$(CONFIG_ARCH_K3) += k3-fpdlink-ov2312-0-0.dtbo \
+			 k3-fpdlink-ov2312-0-1.dtbo \
+			 k3-fpdlink-ov2312-0-2.dtbo \
+			 k3-fpdlink-ov2312-0-3.dtbo
+
 # Enable support for device-tree overlays
 DTC_FLAGS := -@
diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
new file mode 100644
index 000000000000..0829f01a0f90
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IMX390 FPD-Link 3 Camera Module
+ * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&deserializer_0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* FPDLink RX 0 */
+	port@0 {
+		reg = <0>;
+
+		ub960_fpd3_1_in: endpoint {
+			remote-endpoint = <&ub953_1_out>;
+		};
+	};
+};
+
+&deserializer_0_links {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	link@0 {
+		reg = <0>;
+		i2c-alias = <0x44>;
+
+		ti,rx-mode = <3>;
+
+		serializer: serializer {
+			compatible = "ti,ds90ub953-q1";
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			#clock-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ub953_1_in: endpoint {
+						data-lanes = <1 2>;
+						/*clock-noncontinuous;*/
+						remote-endpoint = <&sensor_1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ub953_1_out: endpoint {
+						remote-endpoint = <&ub960_fpd3_1_in>;
+					};
+				};
+			};
+
+			i2c {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sensor@60 {
+					compatible = "ovti,ov2312";
+					reg = <0x60>;
+
+					clocks = <&serializer>;
+					clock-names = "xvclk";
+					assigned-clocks = <&serializer>;
+					assigned-clock-rates = <24000000>;
+
+					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
+
+					port {
+						sensor_1_out: endpoint {
+							remote-endpoint = <&ub953_1_in>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
new file mode 100644
index 000000000000..06cba8c7397f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IMX390 FPD-Link 3 Camera Module
+ * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&deserializer_0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* FPDLink RX 1 */
+	port@1 {
+		reg = <1>;
+
+		ub960_fpd3_1_in: endpoint {
+			remote-endpoint = <&ub953_1_out>;
+		};
+	};
+};
+
+&deserializer_0_links {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	link@1 {
+		reg = <1>;
+		i2c-alias = <0x45>;
+
+		ti,rx-mode = <3>;
+
+		serializer: serializer {
+			compatible = "ti,ds90ub953-q1";
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			#clock-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ub953_1_in: endpoint {
+						data-lanes = <1 2>;
+						/*clock-noncontinuous;*/
+						remote-endpoint = <&sensor_1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ub953_1_out: endpoint {
+						remote-endpoint = <&ub960_fpd3_1_in>;
+					};
+				};
+			};
+
+			i2c {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sensor@60 {
+					compatible = "ovti,ov2312";
+					reg = <0x60>;
+
+					clocks = <&serializer>;
+					clock-names = "xvclk";
+					assigned-clocks = <&serializer>;
+					assigned-clock-rates = <24000000>;
+
+					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
+
+					port {
+						sensor_1_out: endpoint {
+							remote-endpoint = <&ub953_1_in>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
new file mode 100644
index 000000000000..7d377dbe5bbf
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IMX390 FPD-Link 3 Camera Module
+ * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&deserializer_0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* FPDLink RX 2 */
+	port@2 {
+		reg = <2>;
+
+		ub960_fpd3_1_in: endpoint {
+			remote-endpoint = <&ub953_1_out>;
+		};
+	};
+};
+
+&deserializer_0_links {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	link@2 {
+		reg = <2>;
+		i2c-alias = <0x46>;
+
+		ti,rx-mode = <3>;
+
+		serializer: serializer {
+			compatible = "ti,ds90ub953-q1";
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			#clock-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ub953_1_in: endpoint {
+						data-lanes = <1 2>;
+						/*clock-noncontinuous;*/
+						remote-endpoint = <&sensor_1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ub953_1_out: endpoint {
+						remote-endpoint = <&ub960_fpd3_1_in>;
+					};
+				};
+			};
+
+			i2c {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sensor@60 {
+					compatible = "ovti,ov2312";
+					reg = <0x60>;
+
+					clocks = <&serializer>;
+					clock-names = "xvclk";
+					assigned-clocks = <&serializer>;
+					assigned-clock-rates = <24000000>;
+
+					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
+
+					port {
+						sensor_1_out: endpoint {
+							remote-endpoint = <&ub953_1_in>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso
new file mode 100644
index 000000000000..f74bff5f12b0
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IMX390 FPD-Link 3 Camera Module
+ * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&deserializer_0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* FPDLink RX 3 */
+	port@3 {
+		reg = <3>;
+
+		ub960_fpd3_1_in: endpoint {
+			remote-endpoint = <&ub953_1_out>;
+		};
+	};
+};
+
+&deserializer_0_links {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	link@3 {
+		reg = <3>;
+		i2c-alias = <0x47>;
+
+		ti,rx-mode = <3>;
+
+		serializer: serializer {
+			compatible = "ti,ds90ub953-q1";
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			#clock-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ub953_1_in: endpoint {
+						data-lanes = <1 2>;
+						/*clock-noncontinuous;*/
+						remote-endpoint = <&sensor_1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ub953_1_out: endpoint {
+						remote-endpoint = <&ub960_fpd3_1_in>;
+					};
+				};
+			};
+
+			i2c {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sensor@60 {
+					compatible = "ovti,ov2312";
+					reg = <0x60>;
+
+					clocks = <&serializer>;
+					clock-names = "xvclk";
+					assigned-clocks = <&serializer>;
+					assigned-clock-rates = <24000000>;
+
+					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
+
+					port {
+						sensor_1_out: endpoint {
+							remote-endpoint = <&ub953_1_in>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
-- 
2.34.1

