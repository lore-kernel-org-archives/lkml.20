Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC7321E097;
	Wed, 30 Sep 2026 03:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740642; cv=fail; b=cFjcelHq0ZEJFvVMJ+4+d1aD+4SiOXSCcnb3bRfxXBNFR0fqpqzW3EF9R/M73Ep7DT9Rmekjd6SF7pRtnvSBlFB4S616stkO0cyaNo2G8HFBEZeQA7BI2RWVb3jh0DqlukAWgsGDWjoE8NopHvQTQvnjVwPMEbQS6BLe1Pbllho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740642; c=relaxed/simple;
	bh=PR8D4HdY+JL/Q39NTIuTWLpcRND62ACj/xAiENKgU7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jPO6XDpZp3H2aRmilQIVmbdmsUFHflG1xtMPl7fyjIqCIx6a24+mqFtu6C9F8pMGfcrXVRkipRgTrHtFFLtgSiLMn6yT1xnAbhi/RZ7czzrXvQwFJ0WakoSwErgednPUm5END/4CZAnPgVQ0bgVicQntMxPoyVpEAyY6D4OpxsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MHKJa9qc; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Gt39VhFs; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MHKJa9qc";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Gt39VhFs"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68U2YFPD2569307;
	Tue, 29 Sep 2026 22:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qLlHv9tmbL5QViMC9o3lCsYhEDZTNYfr1wpwj9rBT
	3Y=; b=MHKJa9qc1fz21a0FNBRjoBDEmSI9MT8K8VxXjXeUGAg/YjbE/bOAArXFA
	YjMVLoMDIXO16YU4BF6TcC8A3mAYP/4IUNFO/A+PNA/xJ9EEkPzsz9ATET4Gz72h
	BD4JERPVRhDgUzApWnpgtO6HNPcPeq3sEEewYwTsUWH/5Y7FH87fGubel1GyYHtq
	AU9CRTUTTBkoXak07Iq7KJJb8a6ybPUN2NzQPllLXifVxym2ocy4ZMKG4Nfaveri
	ZXX5nIzCYAfu47s9IxCr6M8ACzQF0fYy9C9OSSEFFVLlAOyYYkIycJAP66q/pFja
	xkNw0rwLePUSOUFppCoM7DZQ8wH2g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012018.outbound.protection.outlook.com [40.107.200.18])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h0srrrg43-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 22:57:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlxIJNKggGFDf7MZSYW9hUVmlj4zvYDaZqkcsMPS5Yt8OQbM8fDocaDuJjarRzJh65jWToxExdjqNe8sKeaM+R0sXxwCI1Zp3jF2KwH9QBLw5Ed2h2l5Iv2yYfoB/eMSRRJscFT3YbcM1ILL4BFJsR7yF+XF7PrUHsArHVDn9jLqnf7lebLgOrr5n+IQzx0k+USz46nnKfGRxyzuy4nx6dODfIPPHFUrtJPC8UROVMG79DDlr9YpW1b7aOZF5lw2bjisiN9wnxfMDIuD7xIu3MXyONnFDyVg21ckoZGTKskBmmWwv4m0CWSA55gQFfBjurimR5lU2GCCkBs+u0ee2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLlHv9tmbL5QViMC9o3lCsYhEDZTNYfr1wpwj9rBT3Y=;
 b=JcCA/Gxh8NHziXq6OOQYk2HBnxid1TenexM+LYML1SUoV+Y0b+sKsW6sFtrWB/Vpyfrs/DH8sFDaYSbzA9r+uPyMyuT8A7ksUCocr17jKezoCqv47ymMTIaD5Q2XfY6j6dIaRHj856K+ggLW38gEe7EpZPBwb6DVi7rY2nnjwWdXmM2HUL7m9r2Iw4dpyj5UG8nPIAensOzD1bjrZA8b9W5pUeSdvkTNi9bFJV+hFPLEDCzFQ9/CiyYA8UQN7wxD6BvXsTxBf/o69Ra4HpXQLceBLfB/0GGplTLkVkYb1m27gKfuz1hFCqBtkVDFgadXwqyZ7xAjv3YrBm3qPbv8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLlHv9tmbL5QViMC9o3lCsYhEDZTNYfr1wpwj9rBT3Y=;
 b=Gt39VhFslcK+5nrVBwWbulbTVRsB04jnqU71vg5n/+K70+bA9u0wetwp+vcOm3WcuPtQezJpBAUfD40dwJ+aYUL3zFbht0kdIU60EmpKi3inL7/9jRrUm5fE1iea34dgSof7uO8ZdVma+D80XNrTMsdmq082GFFPsQtreDI+kfs=
Received: from BN1PR14CA0018.namprd14.prod.outlook.com (2603:10b6:408:e3::23)
 by IA1PR10MB5945.namprd10.prod.outlook.com (2603:10b6:208:3d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 30 Sep
 2026 03:57:09 +0000
Received: from BN3PEPF00022BCD.namprd03.prod.outlook.com
 (2603:10b6:408:e3:cafe::63) by BN1PR14CA0018.outlook.office365.com
 (2603:10b6:408:e3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 03:57:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BCD.mail.protection.outlook.com (10.167.248.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 03:57:08 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 22:56:54 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 22:56:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 22:56:54 -0500
Received: from [172.24.21.88] (lt5cg60819vj.dhcp.ti.com [172.24.21.88])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68U3unLa3258576;
	Tue, 29 Sep 2026 22:56:50 -0500
Message-ID: <e33193b3-90c4-42f2-8377-e9f2862bae9c@ti.com>
Date: Wed, 30 Sep 2026 09:26:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62p: Add MCU SRAM node
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <hnagalla@ti.com>, <jm@ti.com>, <u-kumar1@ti.com>
References: <20260928032221.1072316-1-s-adivi@ti.com>
 <20260928032221.1072316-2-s-adivi@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260928032221.1072316-2-s-adivi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCD:EE_|IA1PR10MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: c589405a-8be9-4261-23dd-08df1ea6e633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|56012099006|10067099003|22082099003|4143699003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	/BZQiOgYrlYkmINCq48BLRsm4V8H8YSlzLBMDtfJT3GnQNFsfBIP82/cU3e3z61IfuQh91f1b8Awqa+I+40BG/1VwiosJdZqd7cx2FNB3JnXMHjs/6oPhgiHJjNwUzp4WwAf0RcPPBm7xj/7g6RQXIrmQE0FS4a1CdUt6d4tnxM4NdT3vbNg/AMl2Fh2qq2wIkpUQtAa9/OoK0RFwf4kIvTNvrgt1pPKWwKNV5HOtjo6OyZm/xt/c0RKkOZtvzOVaMHlpR4t7/S/W+G3AB78FADOw9qkwk9xvuU3A0Mtw9UetIUykeK0kMrMYM2FMCgOtqrdF9D+FQ4S/GNxgDx2ibJ2Q+out4pNcRvzTbHD2swDxdxjA2gtftbY8+/U39s+i3IbhKgpHIM1ke0fyRi1nPBfUUmldXskAK/TfsFLtH2K40EN3iLnQNt/V9BfVpcX4gzkP2VDddmjZpVbgiamaBqqfJP8eHdxzX+dip5WmphyVkkY14M8/lWGMoKsaE5Hk7Tt3BThzhZqPjpTk/pBhaHX1GtJx+6tSaKRNEtoC4qyoTjh7s5cnV4qzOiJRHRArVdIipHAf7FVqgWU+xAsrzaPb84GrniU9s4EFdIFKFs4ARCiq6WRJTBFiu49CSVeM4SRYyBYSMINiWt597oCNS48eqfknUj3KIdlWnPud7ycem3CngPVGD6GgPhcxuUbvbtwKclS1DDajEVnTKynYJv7UVStlY39g3Lyed3B5WHfdpWsvyT+71yDQ6Xn0+gr
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(56012099006)(10067099003)(22082099003)(4143699003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wBgDw4rREXexfl1n5VytZzs+Ni9HuC959GDP3ePQUNc9rgMETeYcaXClhCEhnnOYae3Rsxs8vTBhW6oOdd0TgHIzTTD5EyMzYIHZ0EqScBTCIghWIvqHtKd0oR98Lhi93DiLL2DrcU4AmXn4+BApxWbP5ZUjOmahnMHiZAAKHdVt2lnxDyVaE00rwvODjGUz2q3wVRSBIkfl7eo0vkhC5T0gyybN2jr1oeK7TzeKv8gYGsIsxR2zvTlYTlPHTg6n32g7xzNFGMCvnBcPSvfrfr1BunRhsDNh5DAS/9WxVvH/Iec0EAo5Z/pXQ6Pjh3XpyqwS6A61/SDHV+PK1kWcYEyXXAeO5Gop/CazB7dlTPwPaKDoiZtJpcexMGaELyj6syl59I8G/GTk7Qu4/n6GwOqwe/5QNYpzs9rFT2yeOf6mX2rDuk8fQc2QwIK2lTMG
X-Exchange-RoutingPolicyChecked:
	p5vfq9OzqQv9p/g9u8I+ljd+8FDC2qqa1TZHTt5PH/Y0ZgJIbgxyuiLTWyhqcv8bmTxX+x3nZ2XXXLQo7kaBvdv1wKYf+sochRxGKz6TGXqDc5BfRK2xiqkEcVDrJ3jTmnBh4FAFcCrBiYDTE4TkBnJBO75Hi1iKAGjNgpjRj7ior6NY1ZYkqTJOqYT4O+4nfu0x4zPYgDR+seZwwhfiUVluVcLgnJHZQDRsfJHb4KJ5LNy31PyG8Pq8TDI97Mn/g7CFdJq9JoyFrZYbU6ObxYkI936STXQwtOQjgPJgd+IHH3ml6/P6+LXkm1lZzIeO0edjRpXuchqLc2YyedFOmw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:57:08.4216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c589405a-8be9-4261-23dd-08df1ea6e633
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5945
X-Proofpoint-ORIG-GUID: uxz6Rmggfpfy4vUeKgAwVEuQ_BZj1ZPd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAxNSBTYWx0ZWRfX9ZdJn/8Nl1a4
 rBTaX37+culW8AJcGuJ5atjVOoc5Z4nPYRHhow8Y1MxBLFyYirJYLVvP3Ij6cRD0w1ayZipY/x5
 JjAzStFzGegO6IastYFwVWCxGnFSzd4=
X-Authority-Analysis: v=2.4 cv=Q79HcI2a c=1 sm=1 tr=0 ts=6abc889a cx=c_pps
 a=73h/HchST80NzqUzJRdbyQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=9rvN1CI2hs-4UwjDuy8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAxNSBTYWx0ZWRfX7cn+TJDtvGpJ
 JsKcaJJMxH8jnhxpoIe9f4dBQtEhgW/088dqv39dkkn756vJV0UqIjylM4WhMpLvC82myDf4Wj7
 Dn/75oQWO/OY0MTOvBMImIfPTlZV0dUyUHxl7EFRTLDBtOemf1Y0r+a6lFA7M/ZQrUIfkRSKt+O
 RQ5iVoVgnu85tDD7t/ofwkr4P728vo+LXM16o2KjgT1VQ1975D0Pfv2JBHU+V75DFWiy3BeRdMG
 BbQn3h2MxNMCuRDMphHsPXd6ojy/z377GvCoRMMBoduW5TlzNN8AG5gg+GU/mJKFhOfwokg1j/h
 F6eI4I/cngBTlPvme62Dn7GXWtPkPpbQECHcpQ9QuHJyZBtmmzSEt7pEeb4Hm8HT+MDpLEwH7fK
 mKLsTz7j42cd5FMTmHHvGEgf8XqlHdckHLwXuD+sfwMEWCmJkTBcWNSOw2R+NYW5XTE0IOp8RUR
 TBchuwhLNdNjlEi0dTw==
X-Proofpoint-GUID: uxz6Rmggfpfy4vUeKgAwVEuQ_BZj1ZPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300015



On 9/28/2026 8:52 AM, Sai Sree Kartheek Adivi wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> AM62P devices have two banks of 256KB each SRAM in MCU domain. This
> memory is typically used by MCU R5 firmware for low latency accesses.
> 

> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> index 2394a4fb5a94c..278404cadcd98 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> @@ -6,6 +6,18 @@
>   */
>  
>  &cbass_mcu {
> +	mcu_ram: sram@79100000 {
> +		compatible = "mmio-sram";
> +		reg = <0x00 0x79100000 0x00 0x80000>;
> +		ranges = <0x00 0x00 0x79100000 0x80000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +

commit message says, 2 banks of 256Kb, Here you have only 1 block.
Please add description, why you are adding 1 block only

> +		mcu1-sram@0 {
> +			reg = <0x0 0x80000>;
> +		};

what is use of this ?,

If you really need this then, please make it block of 256Kb (something
like below)

mcu-sram-0 {
 			reg = <0x0 0x40000>;
 		};

mcu-sram-1 {
			reg = <0x40000 0x40000>;
		};


> +	};
> +
>  	mcu_pmx0: pinctrl@4084000 {
>  		compatible = "pinctrl-single";
>  		reg = <0x00 0x04084000 0x00 0x88>;

