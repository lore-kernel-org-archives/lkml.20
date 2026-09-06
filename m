Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9C4242925;
	Sun,  6 Sep 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788702326; cv=fail; b=EWoZ4+/8Uu1v5vzt/Nk5qBfSBrJqY6VDCbc52+Yc1Ey/DQX4JzK0x4+WW7CHdMR8RR7BH6WhnmWaSsIaoSrsOPaptCnuUGbrKllpHOwAZ4cv43RxhDfbJTlhi2RlNpEkSMjT/LLPmMePIsYgwqx7mdGsOzrBgk+DPhz+F33zccQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788702326; c=relaxed/simple;
	bh=nkxQ6hiKMVTHW/P4U+F6VtEkt3uHh8S4qIUKCg7RxYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BiooevLxFoNDFP1ZWPS6oPKJsbLqsrhxpRLIBPEdTFINYjsgYT9VL80GY8domCVATvr69RBq7AgmvcVqYIrNuJWhGQU9OOOHKN48eU/Ye6mrPHaoXg5qgd/Bn7SITcwD3PnEy+McuPDtznx5pNoPK4tZMCid3fy93ArH6FUuA/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Xkb7Vuk6; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=t2gdqmPb; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Xkb7Vuk6";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="t2gdqmPb"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6868psGn2695459;
	Sun, 6 Sep 2026 08:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=f0SFsYBEtW0qVe0BTlv3ulRT2RhJEO8tRB+SIHvmG
	R0=; b=Xkb7Vuk6GLC7yjj/7BuTImbytOpl77fayVsLqMbRQ9P4Yq8n7lB61Jvwp
	fhh/893Fng0lNDjNjeWVQhDdDhRavebXRbBY0EPjSjXIE/Sp0evBWE4wqb9ECIvv
	uMECwnuPu9r8tV0qbX1nIgaYrNgAjaS9Y9i+m29R7TDE/w0nSrpxbMzsmavq1DlV
	U01eAOC75ZYNIJHf0QUyvNWu6AZbHQ6v4djaS4nNZ1aaQxqYBeLOEOE2SaQpKILw
	VYIOTx9iPE1qSRzDv6EYh2Rm49BP06VHx+4MoxytEDpOuzjo/o0/rEoLeNufaRvy
	bCsKoiaIxhL2lvHBtfQKIy/JKMACw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012054.outbound.protection.outlook.com [40.107.200.54])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gh51ngpcy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 08:45:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZ0yyCSAqu4WFOUE/zd/WvZG+Q5jea996Nzcrwdt+9wDR9arEQuzwv3Nrn5ZptERTwnM0v1LrHv+WeELXEnK8+DVP3AtqR/cuO3tKa5ZzHHXhbZKLrQiS+gN3jexJDYElNaMA6pRG1QVFAYnJYBNDrLl4Tjc8XR+YTzo6DN7/jPOxOO9TWOvWJFZnwEp/qrjjnvtYoUGUY5Xj4Gw47WBgJlCF1RfLXk4EKFcfACrKBHQ+j3djE5qEzkW0Xr8zxa9/UdRE7wXJmPorWNOPsA+VdUrbPZV5vlNfEaeudVH2w6ogR6AVkTYeu+EF4RDLxEo/rDhSrlhq6nlT8vSb7DPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0SFsYBEtW0qVe0BTlv3ulRT2RhJEO8tRB+SIHvmGR0=;
 b=qBVE0Ls+92lD6FEFj4979wL8tThlJXRBYxPsFIzB5pJMCzGZ+1MUQooSW8o1jXqfCeVAcId+I5c/a3wusbs584hShOHCP6cxoo8bSdC+1m9sBiu7aN5AiFvk4l9P4VxTrF7oHcjomkcImM0vQKb/Svgek3tMi/cWS+zGENZbWyaLI935Gq3PQ7inCFt2QQdzTcos8RxHkhKOpuO3qnT5EVjTt5jjIHqED9GnodiGSGBYuYBHBiIPCWL5az/yvdWrPRG7uOR+IQa4gZIlW4DasKzTMxOHaJk3AVaXe1rJXdWmKii1yX6r7C4vv8TLN6Ck18dneZqpdI1QY7po0u5IUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0SFsYBEtW0qVe0BTlv3ulRT2RhJEO8tRB+SIHvmGR0=;
 b=t2gdqmPb3ClKnyUaYEarB5a9LF0dZ3sZ+/nERy5JeUMyry1PbpWqpNLAS4D9ePcZE4j5M/Qh84Ms41RX/bSLgWUsWsJ6wTzatKOtw+tanuQaYSwyu4oTlO16iv9a7WIetJJHvIbUILXSU00CBY9NLYEvOu1FEerLDBS7D1HlxWo=
Received: from SA9PR13CA0133.namprd13.prod.outlook.com (2603:10b6:806:27::18)
 by CH0PR10MB7409.namprd10.prod.outlook.com (2603:10b6:610:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Sun, 6 Sep 2026
 13:45:10 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:27:cafe::73) by SA9PR13CA0133.outlook.office365.com
 (2603:10b6:806:27::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5 via Frontend Transport; Sun, 6
 Sep 2026 13:45:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 13:45:09 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 08:44:40 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 08:44:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 08:44:40 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 686DiZ5Q2928010;
	Sun, 6 Sep 2026 08:44:36 -0500
Message-ID: <d2c7a82f-0121-4f30-abad-dd8032fc5106@ti.com>
Date: Sun, 6 Sep 2026 19:14:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
To: Swamil Jain <s-jain1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20260811130822.2324438-1-s-jain1@ti.com>
 <20260811130822.2324438-3-s-jain1@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260811130822.2324438-3-s-jain1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|CH0PR10MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: e2474137-9cf7-4928-852d-08df0c1d1126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|10067099003|6133799003|3023799007|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	38HHbsUtqwSRq24uLo3LW9RGwQEhrt2Ka/nV/IHHgZa6cKwIMbkj0VumJuNfNkZdIJa+m9rvH7huKKclIxtR5jxQmN6DstpnUeUZhyLIidVjvSeAtLMYBIsHxQ4p4yPfrnXO7QbRSsCatRUmDrjJ8siIbuyR8aOy9ryzs4pwUPPUdSgpaXZY9Y4JJNmKsUEfF1jz4RsSMH3AnqjO5CFgXevf5s+hLUPDjVzXLQvuCzoKqZamLYmYtp02SjQcrPKpaThMX7liXAGp0WFm/XIkIY3lShANbv9azesLngBNfvOJ1QBqxMGwCVJZQGIOrwNnSfwXcuut2kznSAA9Dr+NWMl4c2229AdkDXSyj+rjvPlvInn6SvlSqvQFiJSgKkmBu0EskyiNkmLNibJOvbqk6fiPCqyzEGMtHoO92vyICSZvosuXsnrlwjObnfApVtOuYLooPwF8QKhVKnypppRlylNKMAmhrue7NYVGJ25iqtEcbC8wlLSEdIQwf75QPfFH5HVmcCqu7Jcn5inKV6foIeTnUrASn7aqgx+y2RLDQNhtksLWGUkGvVaNreGxGVvyT6F+9Unq+hB6NmRJFi2f0ANhDzjFsE275eCiw3gsIs70VRRGn3lcmaM2gaD/8TcVQvOuMlFYdeQsgMJbgZN77A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(6133799003)(3023799007)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zr0Babx8ShwLqihW3b5D6/pjkoI+0IlDZ+AAOtoepowKJOxMsHRzFyQlhV2n5w36qs1JYilJIdC1A2bd+xi8jbecdm7RDHPNoPUMTvxvgWqDdcwywB/xEfIkXp9Lpj0tXQib82c/2/up1e9TfwqfulynzKZ1Gu51nlDVGTSo3Re+wpngyq31wb8BPae25bbMaNEcQHaKubiWj3kiuuoDmfKmTWj2EKwiK6elgb1X0qjNRclXp/7G/ZBts6cMHEYHzvUHuwEZZcvPDsLPIs3OAQ6x0asg4+MOijiK8QtzbmaBbGQM+nz4tsE7igUKBP/qsMNSjvZIFwn8M1IVYqlB233r0/vr4zB2NKyITaQU0zUEi0rHlB9Rs+O/cihpErD8aTIqJ/wsb/+TCkTFLwxsNet8TpP8AOE/MIZ/a/FWQhvdo/8Mpv4Xj3YSnG8qnRFQ
X-Exchange-RoutingPolicyChecked:
	vKqD242GS8SyQdVjQ9qOGwfR93HD+JWJBPL+pkxP4eNSqXvEDkguhocEoMlCOjoemDeXPvbXEpErV4wfH8qWoQHNQvWd0cCPNvdRmT9BP+OM+o0fvVR8+IiMUl/fMdXsHGJ/YmcDYSem3soC85VbKAws+ElLcFKWV6RTqT5+ppBBv/vvHD34rZAYixZ11Ib3im9zwBD2ZacIXjdN998i6jjp8I1ZsHYwhPPG6mFNGr/lGwst9eg/afuc0FXZVpJwvV5za8W0b+03OMy9wMIoGrzTrqU31a1V9dqQP0Stb+Oq8HPohhDPVWvSrZd6BTj6BTk0VyXJO3EazCuW0FJDsw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 13:45:09.0596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2474137-9cf7-4928-852d-08df0c1d1126
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7409
X-Authority-Analysis: v=2.4 cv=J8GaKgnS c=1 sm=1 tr=0 ts=6a9d6e6a cx=c_pps
 a=tYoGMRiLV1KbapjTPXDBcg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8
 a=SO9gwbbG0jSecTGtxaYA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: uifmJUZuOhqHUh3qhZe4v855lp_GmItA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1MyBTYWx0ZWRfX9HRdnjdwyj4B
 FJ71Tv2SoZRlnnLhGjucRn1joESp1DFubGroyRr1OWqmxWiZtBYbUv1uZap/KzCaTkzQDQzMv17
 0z+SRwtRTWH2EV81R65oipFRgZQkk0JOuhoB2ipqGMkD74EhyIfg1Z/Cu6o2S/leAjyWxGj6RNj
 pf66kvl1vptPf7BgPd2J/v1AiydZCT2qRF+gQAtqiToOhr7u21OhQG841eAl7Zvj6KSkhqw/o/O
 fKcmtsmcOr6vSZduVfdlbNr3TSpQlmFG2dhL4G6d6U1cItB1sj+X9O9nCxzg/c0sYBxATlZxE59
 merhsPphQi4AilnyXaPL8tCcRIFuQ94YBUKAsDR9M1j1QymyjbhlyK3z6e3x3WFeN16x8F7J/5W
 LxH5OkDmrrHI0r7g4ebQNKKglBm5+Wt/N7Uf00f6yoGYXMkri4OTx1IZUPkHYyA5UhRxNcAZbTS
 CMN7Mj8+8hYj7w9BAqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1MyBTYWx0ZWRfX6CpCfrTywNGe
 K4LpXWSyWjzT973zK/C/Iky0kFVP5m95BoFVjEQiCfTf3R8Hfkb96jQaepncBhNhL2UBCl79gxQ
 BpsDVKazN7oQOiZeRdcr+RpkxS8IoPw=
X-Proofpoint-GUID: uifmJUZuOhqHUh3qhZe4v855lp_GmItA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060153



On 8/11/2026 6:38 PM, Swamil Jain wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
> DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
> and hook up its DPI output port to the SII9022 bridge input, and the
> bridge output to the HDMI connector.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 95 ++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> index 84a0cfaaf196..477de9de07e8 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -44,6 +44,18 @@ usr: button-usr {
>  		};
>  	};
>  
> +	hdmi0: connector-hdmi {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&sii9022_out>;
> +			};
> +		};
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  		pinctrl-names = "default";
> @@ -192,6 +204,38 @@ exp2: gpio@23 {
>  		bootph-all;
>  	};
>  
> +	sii9022: bridge-hdmi@3b {
> +		compatible = "sil,sii9022";
> +		reg = <0x3b>;
> +		interrupt-parent = <&exp1>;
> +		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
> +		#sound-dai-cells = <0>;
> +		sil,i2s-data-lanes = < 0 >;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dpi_pins_default>;

I think, dss is right place for pin mux, similar to
https://elixir.bootlin.com/linux/v7.2.2/source/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtso#L153


> +		bootph-all;
> +
[..]
