Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13E740963A;
	Thu, 24 Sep 2026 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243072; cv=fail; b=CkuT3Mb8exJW2efYDmuHxJC/KjxjNoS0/S/9u2HuMXetX/18WUuY1dzvnkFZL+t9NRxocbG+EMCoe/dGrN+XCiFoVcTZVnQTFqFjq4OsJTUBKlRVdpS3xJ1dkgLpNuHSybFcwlxgM1m4CloFLWMjFmJMvX9LcqVOj29TzvbLd+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243072; c=relaxed/simple;
	bh=88K6H1JscBj0R2mVxTN/WEHg4238G4XCPk8ezHntfKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uF89knFRcl/hoQSo4ClImoDBmKGc7IBoo/I4tn2/ChmEDVaeSIIAdpgOfIbxfc42DIv5MagAacAVi2r9KNiT9zWHv6vhDGlXCAWrTscv+94ZGZqX8zCcNmi50CejfeIuV7LmWTpHdDMPDA2Os+Wi4D4CFFLEITOD9Jt/UMbuofA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=XK6/29ve; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kIVrTmW0; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="XK6/29ve";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kIVrTmW0"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68O9HXwT3355186;
	Thu, 24 Sep 2026 04:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=t6TLwqoUwd0zNJOkmcVlO6Dd6xAKbPU1EAdOIGl3B
	Gg=; b=XK6/29vehG/dqi8SLxFR7AfH4eQnTDf/Z/KCGrCRLFRtguaoe2TaMG5Id
	SjS2q5lL5KYAbMxDk4jyyrqlAEblRYUcdzCbDHy0bJcjXBIo5rMNEMBfFRqKDiFb
	T/NONbj2/7W1mq3FO4z3J3VS2BAIRRNSS7wyWBuY3zDe33Fm/Ybgd1rOnRu9op8o
	ow2Jlj02ut4nVVOL1ZzYpeincwi0i/vyrcQRHqE5tXnL98k/SRJCPy5xod5kc3M6
	U2u3a7+ghyLqkojJSrGWKVJvjo9P1/iRzCyP8s0ofj84vsppICbUYByfgbSZRxgo
	GTkCvLYjsC/LxoADBDGdID21WTOyg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013029.outbound.protection.outlook.com [40.93.196.29])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gw13r845b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 04:44:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4ooHCay/llgBlOjWy1cxI7EZr6xv4qlELWRIUWXsQjow9GX1h4dBGHByAQS9UoBPPyWdT3d0LQgwnm1ibLgncxwSeUQDWn7AN6+cpdyZKcsWzCwNNxZKBs99g4Y9fQtH7DYwXySva1/A/pjVxsysDkc4VSNT4y0LYomV8haE1gGf32iH2Hl4jnAAUxntTThISpKZSA3wcj5fTenksiglTdBZc/zgGXCWHCBV0jgIC/VlYm2OCga7fzjxBflDJqUvN2sIWQJPVxuivzYgbkIEFruS6HYnMrfJ64aiY3uSVctrWbOlpKygUs+pmmxDr7JNv7wSKOsVo+KkyElsJhR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6TLwqoUwd0zNJOkmcVlO6Dd6xAKbPU1EAdOIGl3BGg=;
 b=IUroQa1lLcK00c+HOCqDkMyGg+OXuJqu6XSdcSURU+LIJwRcGK6qmJTiD8nAilQTFpLsjzG+BUFZeGbq2DCEFPBzyHGHsQztuPNo3zcdiLzgapjjH//O+HpUman77/Qm/O8sqlPm6lfnGiyWv7JrOYJX2DaPIGClNVV5T89qQtPRjY0ffCt7ScqDH0qwG6sfQGrGNdK8C4kS0zhdnrK6fiu6rb5KJB/WinIVfl3Uahq0f8VJkpJ0mknTbxdBpysKnHfBkDMvtJCKqHZv7weBlOLzp7Agq3n+OIt8wQuNaNT+e9jO1RRRu+0nYUTtHxNFG8dKkFgg3xFqPYSoWmP/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6TLwqoUwd0zNJOkmcVlO6Dd6xAKbPU1EAdOIGl3BGg=;
 b=kIVrTmW0YDBTA8yMrgtLU4KZuovRc9HcQw9+rFj+9EgGfi4Oq2doSqf+laqLjhqZuhqyrgpB4PB7riTqopfX8ny3xxY+b13C4dLkdCqd6exx6dLm2CaqpheAkds4a+bSAUVf1AxPFKWNEzz16a0+t+jlFIv7r47rMh5rtVjciqc=
Received: from SJ0PR05CA0146.namprd05.prod.outlook.com (2603:10b6:a03:33d::31)
 by CY8PR10MB7124.namprd10.prod.outlook.com (2603:10b6:930:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Thu, 24 Sep
 2026 09:44:09 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2603:10b6:a03:33d:cafe::78) by SJ0PR05CA0146.outlook.office365.com
 (2603:10b6:a03:33d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7 via Frontend Transport; Thu, 24
 Sep 2026 09:44:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.5 via Frontend Transport; Thu, 24 Sep 2026 09:44:08 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 04:43:50 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 04:43:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 04:43:50 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68O9hiUm3858009;
	Thu, 24 Sep 2026 04:43:44 -0500
Message-ID: <d50d1f8f-29a0-4bd2-8c56-d111eed46c91@ti.com>
Date: Thu, 24 Sep 2026 15:13:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
To: Swamil Jain <s-jain1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <sebin.francis@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20260923192643.1362891-1-s-jain1@ti.com>
 <20260923192643.1362891-3-s-jain1@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260923192643.1362891-3-s-jain1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|CY8PR10MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c7c632-97db-477e-5ec2-08df1a20618c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|3023799007|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gNZ9GcSntEmBioLEWa/UfnwXeCXN2y6nrQnqj7J8XHWPLXQHZLWrLM1BzOgiIkwk3FpVOI3WvWj3OkonXOCqZTIcUEBMbf4CZLw0VmbJQ72znagIZGNg52Vhh0ic8nfJ/cj/iWsag8h0qZ1ZIdVcZ7BjcPAiU+FU2dOYJCHP3QcKFcDzru7VYXw2oWNdjYLGkbFbhQlBmqB6pc+5vJy9BWa+gcy3i7oWsL07GIRgjBSHE7MGYoewvtEiGgLGEdu8gsACfX+mqpKjd92kC48u18whSXrXucgpV9s5u0x8b8J8YrVISQELtuOlscbLtW4FlRYGXsRgMHYEhsJ4CfRV5X1a+Gcfg76FxOsJ+RDbeuqtkcVGuK9I24359Y3EA1KeMsgSNvA7Zsk/IuqqItMQStULyPeDHrcOsG08W/Dy+rZR2BowCenFSYh8pRjScMnpFLsUn8mEWvh9sex4ewGxa0TSM/kgm6rq2CntFg77y3ruhFqePyYNNBqaeexZXiANGVV2+I2TAo6tssrXJ3oATqUPQuXfBmojf2z8fg74y5Bxc+ZLgYLvdhaQ6e/2RiuF3AOPxAN/omf9XnpreGTNIViyFSDgHfkuZoKxjIaymzLCWE90e7t2VFWIABK1fiHAvi67+EMEFwlPFbXWzQA6pNsRw91f/637Y9GrH5cCouyq2vUnwmf5tYrNAB4Se5HLXoTLjhMGlWAATIThYKwwuw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(3023799007)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zhjbg9kjW+GtE1psbN3mzeCoZKGCjfFqzGl2Z5u/TExvsOYs3zyLIfNbbSWfYTgKed16G4R3noE/D6S1+oJGuhcHqmuGJbwJeMDWXrc2m3zLyfVGvGtuf7e0dWTo1DQXV/jO/AhXNxLPYOT1SKYctBn5YuiUly+RfU7ha1yOqKPzGMVFUEpSmSidYTqLnZOjZt7Meu5/cuf0p5gIZwo7P1NkvtLWHIA9cBp2YRL6+YD/W/t4+HNMhnTpJ5jVViJvjOtt6OT6Sx4y4c4KGvhFRNWpxJHJdjfaGkUvK5HB+DmnWJPEnIhBrt9mK+1WIhUrxrp4Gu1XMmg6XC02vwsjC7zm8qIydvmlpLjaGm6g/2D1zz3Ulhci3nF6vRZtO0KXEpXci9d/BdJizONJuOV6OCGbPtk845wDtN8m+Q2WBZo5X2m9C9K3zvwpk/Yx3oQJ
X-Exchange-RoutingPolicyChecked:
	yJa4EEQE/N9IEB60JTu7An1QTkUIjVSI5Q6s6n7gJHG+p+Am9z7+Q1gnaZMDHeDVxZ89VWbpWCe9jf57R9o3K7AkunuogGAARBjnLpdbPup7dZdrNjeB/0cZg8E1MtAwELeD2iuQJ5kGbtDaXD4RcMgH4f9fu2lmD3fauvZ1C4H1Wlh2dpsoueDWKw/7/+9x34r6b/SuMxgVWlDUnW+QalQGkiBiMvLeZi2kZnoXq5/Lwg6rSmn97R43PHTwjFNg1tZiTVJQ7nJskifWhAUqavwJlKDwac/TPLorNBWtmkS3sBOwTGkJg5GpIibV88XZSly+gsaNKiraDjSKlfy3Rw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:44:08.6450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c7c632-97db-477e-5ec2-08df1a20618c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7124
X-Proofpoint-ORIG-GUID: Gkd8oVD8tiLsKOfOwb-A3Ir10thydD-r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX8268Sge68Pt9
 mlKS23c0RUCbcl7wcvtstjT4yU1Ql7c7pV+EtlZrNclsqqbNB2iaTiD29Gp4r/X7vMMOMAt7+Mp
 O6lqKpdop1WF6+n7Ve3HhtWcN86jRyLMAPu4Ti+d1k829T6q+GwE/0tOBuom/fHSUCTiaiAKABT
 2BB9XiKV9TvS/Rldf7mNCTzaPgPDiGHuhJtl8ny3eiUj9MiS4rc4gRtz3czq1DnyMEuagBrtSzC
 asr3oLaZw3x7hoHzIlYoiAvDf9OAGyLuLxn8dPCrxSGWWqpR+mNjg2EMn1jDH7FzGKNpiibeQbg
 jDOObMj475vjEAyVJDWbNY6JYvKBlqbgnPN2+U+1o8l2HnyRcXD/W9om3Lsg5G8DpMTHt2H+ev+
 t8V5peT7uqGD3SccWrFeKEkSXRj4xE1TX3mIblEbfOdLTT5xhb72eC44VP054iOnk7yW8Afye39
 vzNRFww8pA/pYtdMnew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX9wu+VTbPUykM
 oc+s2ZmGgmRA/ujQJ8H1Jukqp2EbRsgoaQpCVHu4Lz//BZTmut5dJjjOh7u3MCO4IpmWjRYqhhE
 zioATBOymvjuWbgOw5FZH0ld2dcK4ts=
X-Authority-Analysis: v=2.4 cv=OICyTiaB c=1 sm=1 tr=0 ts=6ab4f0eb cx=c_pps
 a=y599upwrfiZ3HV94zaFOUg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=P1BnusSwAAAA:8 a=IZusBTQpq6T1z_lNvVkA:9 a=QEXdDO2ut3YA:10
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: Gkd8oVD8tiLsKOfOwb-A3Ir10thydD-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240040



On 9/24/2026 12:56 AM, Swamil Jain wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
> DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
> and hook up its DPI output port to the SII9022 bridge input, and the
> bridge output to the HDMI connector.
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 106 +++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> [..]>  
> +&dss {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&dpi_pins_default>;
> +	bootph-all;

nit pick : child node's bootph property is carried forward to parent.

Reviewed-by: Udit Kumar <u-kumar1@ti.com>

> +};

