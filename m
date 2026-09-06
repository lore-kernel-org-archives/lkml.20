Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE8A2B9B7;
	Sun,  6 Sep 2026 05:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788672023; cv=fail; b=pCu5dvmva1C/v5MXXOgWp/JJbzFwBcXElSeuJHc+jmgI96cXwybMwSH/vgKEurltY57hYNvtAUHKGLbcrj9TreAzgAHsMMcghnPMJ7K6CKQw0GJqnkYF5BEcTFhsCLyR9T60V6zxQW6aFOxy3G3vHkxTd+i2Qp5iOHcid0CV/l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788672023; c=relaxed/simple;
	bh=FyYznto2iSPEmvrpvWcP3IYgehFxDmsYt/5HbH8LPmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hgEswJl+nl83vu20SsdiZqjWfGHZCHciYoeWz9zXnU/rRuJunCibWPxoa46Mj0QFW9VmbQnFD9mtoc6Jrar8OvcP5VS9i+av3lHlkU29jA1/aREgUC1oaxQzCQbAMaQzqmkVFT9zpuWq6Ygy2GSf96h+DXIyrFK9VQVQ9cRZW9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WlzeVRVJ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uSgic9e1; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WlzeVRVJ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uSgic9e1"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68600dvf3603369;
	Sun, 6 Sep 2026 00:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DSewu3KzgTyGXFvWV391XX6+ABqmnXbgaCeRnEjws
	qQ=; b=WlzeVRVJsKzGX0qDuhebAM1PLCD9MXwIjxTTXumepTzBOkCi+M83+lRuf
	YODl31bLIWmfySOpEFyWz2jqDKbaXTBL1Kv4UrVZZY1yjj0EmCbMw6TLXo0I2BDP
	TF7R1T04HjsqsSVFLJJiMwvKe1VtrhUPyLW7E1h25779/XwbCwMKR7zoM4eqrEBm
	1APUWzQlPUlpc+QVFO1BjC5t3oq8mQbzLCG1xoiANq36S7qcAHa/6Dc6+ZuAV+L4
	jFx/u27J2DEsLlHl34l5eX71TNbaTZoS636yDDAENN7KFSHuVRnWBv20LLF2DHqA
	Z5kFRXRLgrQiSMEtj6RDXgtVz1RNQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfyyq8fh7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 00:20:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNhbAf7Ll6WbYY2ZYaEAs2fCsVoBg/kqxl0c6yuNDcqqBaL6m5qZSpm/pgUFg3NPk6ZH3uMlnCDTEG/BKEpYdwbUOuMFRnalScsPU+5OnAzNWlLz7V59DXmbV7EBtfVvDavASUcwM6eLDhbvVGYlTqwR6GO6uewu6Nh0V+T8a/U46bdbgE7T3geCoaHrCN1ROvxep8TyjeR3Im31NKPgJYgzS9ELmC5bG41hM/pzufuxz2mQZDKD4d07ZTOKpj/F3njHYpieIJmUFP+bPB645CXcUXe+dv8+gQLkzeLvj01c06OXkPV6crjo34sPCbKznQ25wU1oPSpE5hRMw+vC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSewu3KzgTyGXFvWV391XX6+ABqmnXbgaCeRnEjwsqQ=;
 b=utuA3WgX5i03xVhNWtIWK3wOV/X4P/yZCYiu42K0bsOpP9zR053fmDVGl0txxeYk2dNHNI70/O475st95HUxiWnG+OmlALxJnRvZGgLg0h5mS46YPD1QW95VQtoQYJI0ukbtY1gv+bDPQQgGdR1nYyq+iBQHGHQ1C46LuFTB6gcPgUBsewyP8zpMC8OWIT2eiYQ6gxBEMB8E5Pr/A1AsFR2RlBPnBqtHNmEVUpD6pJtJUgnU+kUGIMikjiExSBoni0Z9gJDiTm0Eq88WulcZkX2v1uHMN6fE57OzgrWsXtYZimQNuTQ5p99+74BbDCHxeJYfk3OpGMQfEGmhNYB9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSewu3KzgTyGXFvWV391XX6+ABqmnXbgaCeRnEjwsqQ=;
 b=uSgic9e1HI5BWEDabSdhBdZyYWkOgmmPM2QQoFASKi0od9yvsgzI0u6arNIJqfPair9EIv8oo3sJ8bFL0bNYbpBiNanKroksKGu1FcQBKHW1YWVJhWnyxy6xVcPthAPFolHuk4YAT9F9zjw7I7ABzr4ZQDSLDiiWkbgcv9X1Ubk=
Received: from BN1PR10CA0012.namprd10.prod.outlook.com (2603:10b6:408:e0::17)
 by DS4PPFF0E76365E.namprd10.prod.outlook.com (2603:10b6:f:fc00::d57) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Sun, 6 Sep 2026
 05:19:59 +0000
Received: from BN3PEPF00022BD5.namprd03.prod.outlook.com
 (2603:10b6:408:e0:cafe::a0) by BN1PR10CA0012.outlook.office365.com
 (2603:10b6:408:e0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 05:19:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF00022BD5.mail.protection.outlook.com (10.167.248.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 05:19:58 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 00:19:57 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 00:19:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 00:19:57 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6865JqhH3321921;
	Sun, 6 Sep 2026 00:19:53 -0500
Message-ID: <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>
Date: Sun, 6 Sep 2026 10:49:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
To: Leonardo Costa <leoreis.costa@gmail.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Leonardo Costa <leonardo.costa@toradex.com>, <u-kumar1@ti.com>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
 <20260803173705.2268792-2-leoreis.costa@gmail.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260803173705.2268792-2-leoreis.costa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD5:EE_|DS4PPFF0E76365E:EE_
X-MS-Office365-Filtering-Correlation-Id: 6313b9da-072b-496c-1126-08df0bd67ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|13003099007|3023799007|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lVC0LKL3wkt/EnbtqIRzeWM5hE9qJ8amN6nKDswful8ZC3NbCHnhHupUAy6uupouucmb4PR8ZQKseMjZFHhkXyixZSYJyjQQhuARDdHHw86bmmR1AyAaOVwgR4Dq2SD9ehK3WassKew+fHw6HzfBV5ALyqUO8LRmJjvR3WGK9jLuewVllIlJEqSR6I4G03P6OGua9NgbMfMR/ZmzNd/8CtoX9woMpDKtEhIKVj8+afSYGUweazXQFjwFt2ltIOxYvU+1dj/bvYekzNJx8y6EbNf7x64WS8rbHqy43HlCqAOVVk11V0tXZW0Q/rxs/Ujx7gIMOIRTkZl7dX6lPQLfK2Z0ulTcjMEMGjwUHTGvHqq1ZfwsaLthZpWj86Ttx2CrKvjihoL4s33ENyDMLawpnhUfjKLBEcVY4Vw7IwSi00dL+nspJIITarkSrhgApU8XN0sxty54d4UZ7xCaJ/yByIlAYQZd0sLaCsegsI7nXdBrre9jPZdd3dEpaP6qbJqeF8YOtGqNwD2HGnDbbztfUytKQriFetdHNy7o4cbW+h0jX1KDmE43JBeaOp1keBnNLtyLsnYbdyfohaCSRplMAoROD5ykfdVU7koq2xONQkXUR8DsPe8ld2W2uv+r8UADDnx6ZlGSX8wVK5/uDgnw1Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(13003099007)(3023799007)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	scOXuXmcm8gOhKeBytybbOxTuHnaYRnLiFdDaijK4zK/BK25LTzzWjkTpxjphqBRi/fP4GsU7HEPg72KaE70YmIaoL+ejYilqx8rhIxwMjx1X8cyrRik/7goAjciykS/JQPdJAGXCbsu6qRO0fKOzmp6Oh/PtWqjr9HnDC9aGqchMZOc0xrtyGdOEiYGlwdwj2+zvs/0dOrwz2pWZnXW92byK1449yGx5lCcUy/oXyjBe/vIEQUyyV7K6l9xTvsjYszayWFINk9giH+Bk7ymKSvM4W4pfXHpcXqsqgM0RrWt0eGowdOUmqMq8ezgS4s9rwOOSS5qKy2QfQj0PoHqqiVcoYf0cudRFTh6hIa5xdqH252il5fNi+k0HA6/tzc/WCE4cYepcTZEyhobWDVnzKeGv8XnsisQJ9VfaUAdJ6P5nwfZ4a8VRuQdJRF01DMm
X-Exchange-RoutingPolicyChecked:
	sjMow1V/sVdTkbd+yPRRjTrSN/8IoVun1v0A5hlp+iQ4SDX4EgfXmix3zmitcF6tQ47nsO+OAbgoM+AKHXxqb8az+DvchhzQT+XPF6X2xNVY6+FQQv2GX9ezZg9au6/tjbd17YaBE+yQlzF3CStH3wVOKE8IFJGPF1SYMX4EzJj0VCfF/vIu0f0sTZL0gUtxW1zzoJKOInMGHWHEoGWZHqAECgHHyMgr80PhQ/jvenzcQq4RCwCE/69Kke0QS5Dv9RQJ6HGngifJzH3Sx7JxNF7cg+wfQh2eyztQbF4xXECug4MDERTikv2DDRd0Cv3UPdJjYZGvv8jP0C75nmQ6PQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 05:19:58.9573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6313b9da-072b-496c-1126-08df0bd67ef4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFF0E76365E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDA1NSBTYWx0ZWRfX+/BShRNVfkMK
 vXN4qbCgAQ2rFryJWpeHks+a9f4uym1KZlxQaiDGdWZakLZgMx9lRKSN3+JfXEDDiA+fBk582lW
 hcxrcpncXojBThFdZLxbSNCdsbB132Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDA1NSBTYWx0ZWRfX92XRtVcnDgo5
 b4in9FNa8j3n7uxhnUp0O8yLGtMLdi9CWdwX0x1e5AH+sbBCtQa8xxusukyEHHKqtd6tWxuGCf2
 hn8pA54ricSFjcqvfYT7wqyQlppPBHNjm9ijAmuU500egmQz2JR01G+8Rhre3CZtaVAxQWjO7jC
 ywW7C1uhmmZnQbuGt1iHpBgy+SnTZku5Rhh8DWzEq+vDyZefm/O7uDwBcV/FPaW+U5hy8/zKw1v
 vN+sFgJXMA2Ict7i4IaGNbjpzbzzspldrD1AV7v/PilP9cDff4tPjYn3XINGqv14rjvaAzAtt+k
 RyXikcMMFXsH/sv2eweNf21WAinE3eWQ82x5kGTRyx6z5sy1hRBfDLsFhY8T56Na9s4QwGnFTnc
 hloTGFoaTTK64AGcuxUBtMuqqMzWmHZNX+8ggYDon1FwePg7dvL2eOj+UBuTqbPZ10Us8A4uNv2
 gz8+MRLWQBpsUEp8kew==
X-Proofpoint-ORIG-GUID: BNuZ5Qt8oOgi0ahXC3ZszTkqWSDDl-pQ
X-Proofpoint-GUID: BNuZ5Qt8oOgi0ahXC3ZszTkqWSDDl-pQ
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a9cf804 cx=c_pps
 a=wsTBi80DslKxnI1CMYi+3A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=m8ToADvmAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=-AEETTi9g6pZRztx2ssA:9 a=QEXdDO2ut3YA:10
 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060055

Hi Leonardo

On 8/3/2026 11:04 PM, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
> LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
> touch controller.
> 
> Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile               |   5 +
>  ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 153 ++++++++++++++++++
>  2 files changed, 158 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index f4d109ef6798a..8a59fc597aede 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
> [..]
> +
> +	panel-lvds-bridge {
> +		compatible = "optologic,scx1001511ggc49", "panel-lvds";

> +		backlight = <&backlight_pwm3>;
> +		data-mapping = "vesa-24";
> +		height-mm = <136>;
> +		width-mm = <217>;
> +
> +		panel-timing {
> +			clock-frequency = <70000000>;

Looking at
https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#mc4ed25e5253da6dc635fd3eddc317dac8f447f3e


you are using three different clock-freq 69500000, 64500000 and
70000000 here.
Could add some comment here, why freq is adjusted.


> +			hactive = <1280>;
> +			hback-porch = <55>;
> +			hfront-porch = <55>;
> +			hsync-len = <45>;
> +			vactive = <800>;
> +			vback-porch = <5>;
> +			vfront-porch = <5>;
> +			vsync-len = <3>;
> +			de-active = <1>;
> +			hsync-active = <0>;
> +			vsync-active = <0>;
> +			pixelclk-active = <0>;
> +		};
> +
> +		port {
> +			panel_lvds_bridge_in: endpoint {
> +				remote-endpoint = <&dsi_lvds_bridge_out>;
> +			};
> +		};
[..]
