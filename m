Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5314A8A2F;
	Fri,  4 Sep 2026 14:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531039; cv=fail; b=jLN7fIkuySVniPzUoce5UdC5MNXXqOOrBbF0Vynztdl4N1ubsirmoGppqVdD6zxMwjP5FJ3iJn2YENI5GnELvb2bPSx1sfoiTOAfwdTtBprFNsscmKQ1vcCLA3LyvIQh+rICMR3UocvOGWkkwVTbbIEMCGfX8RRRSkHuM1Hr2Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531039; c=relaxed/simple;
	bh=J3R57GSB1kwPKX6lCkJAFKEnEK+V6noKDRUI63unOow=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OV2ta/B2Pke8KiKQX5mjEWDgIavRdSuv0XFnF3YX6qiceNuGvOoel5IFkJuKDGYLrD0vTAVdMxwMxJfH5c3vZliRan7TzbrO4P62VgJCwop7UB8VWfDFRnXCTywEKuNZ/bBXA9gS6pfymzuHdoPnd8Um2hy4HHA0IKk/0VRWs9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=LD0euLGt; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hL5buINB; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="LD0euLGt";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hL5buINB"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684Dhe3p2338073;
	Fri, 4 Sep 2026 09:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xd7RZ6cNMomuGTfFppdcspOMMiQvIdNHeSfL4Ivm3
	QI=; b=LD0euLGtoTNIOzXEWJ29RC3DR1YadxSlzKzlAvGI3+sdPBt1bs8lZqaiz
	XGpt207Y97BybNKFxp8zntrholkrq0qpGFv4EY7rQ34wafGdIgx934/EW6Ymmbio
	0RYCosSmOr+tBIwr9NJHmpRkyDqFlm5tKp7xdgGuqla1ykStyHdPfMNYBzPnrboG
	KtHVSwoNMuzpa1+kn3nMQxf9hjX0iibbxgGhBe48yOOpPqJ7tzOZoXIvArGpLZnE
	rkJnm08umEneeZwiKaSi6Vxl2hEVj4tHqw2tOzAlhtwtq7nnPOrxv87fzuqhXD7e
	0B0vyQ5t9g3C+RXMZImOs87MdOWfQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gfrs32q8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 09:10:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjQRT3HnpFzYyPncMTynKoaK6tBWT6QxMRYPBRwZoBf6i0o6yAlMEhs1EuZnalY/+85Nyl1utvRFKQWoNdI9/CtnnbWJYtYxBiGBymXlzkaw74sRbE6of+2m6RxH0+QwGrU12Nn32gxTBNUnTKVw0GPgtUVww8GAVtm+FzuYTUuCa3eqAh12VCKs0DALnD49CK6oR43Udpvexwzp1AkgZo2dnhpRbyETLulv2L2VQmGj+/JWMJ2ofSC2csv/OUe/3VS0hx+FwI21MFJKoabVtzCY5dRXDGhYiwTp1qm1yGoy2+G6maFaP3Q4YE/q4Zb4hXogGDKIKAKpxGPjr+oWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xd7RZ6cNMomuGTfFppdcspOMMiQvIdNHeSfL4Ivm3QI=;
 b=c5/Tf0LZ3pS4bWs+R8OeU/4IdaghE0UIN70tmy6b4gFQmWitDZzvr5mVnptppUpawAtP+FezJOOAenl8BE3VAWVew6KvVBGCeJS3Nu1hsQYWRHLZT+T/ocFiwPQBBB6UO4ybNiddhzdbO3PDyPjX1ckutpzJzPsMhqe1xs5JPJR4pc4xHpW8i9g3faZbH9IaCUnOU/mW2KhdF4+UNfr4IKymo7N07mg6Nt8tdWd07rRV9IfU7c85tgnLHSi3AGS7uycYWXec9tCQB5Zu96jrYOaDgp10+WL8CpxlbDlb1DzOvDVajFOaUaLm06homOxiASWn2IRoX/3Fl5OgF5oiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xd7RZ6cNMomuGTfFppdcspOMMiQvIdNHeSfL4Ivm3QI=;
 b=hL5buINBbHAztPGzIa88/68nLmERpJAFZlX+JUZpGcUNQkqeJnZ/ppw3RK4BL0U0uw0oCjfD4pW1nuHWql8ZrDgK77rn5sSpujwgHfeK2+iXGcQhveHkWInz2dHEXA2efmJZV5zYBaDs3FKcXN4gUZaymj5bjY1vtjBi21OHDYQ=
Received: from CH5P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::14)
 by MN6PR10MB8166.namprd10.prod.outlook.com (2603:10b6:208:4fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 14:10:22 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::a1) by CH5P221CA0009.outlook.office365.com
 (2603:10b6:610:1f2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 14:10:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 14:10:20 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 09:09:38 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 09:09:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 09:09:38 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684E9YlJ3632561;
	Fri, 4 Sep 2026 09:09:34 -0500
Message-ID: <412fc9b3-cac5-4fff-8071-ca2d4855db30@ti.com>
Date: Fri, 4 Sep 2026 19:39:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-am62p: use ti,am62-m_can
 compatible for m_can devices
To: Kendall Willis <k-willis@ti.com>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
 <20260902-smth-v2-3-b3678ca44c7b@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260902-smth-v2-3-b3678ca44c7b@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|MN6PR10MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de24dda-134b-4ad1-f28a-08df0a8e416d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ivyoxAwayto199GaOsKHusJNMpGjCCBruCYZsPF0wFGzJG18NOb7Wk4S6gO2RyL9b1R0xY6tTlo6Y9SQ6qU6HCwc7DJ3ceJ+zvHYKJlTg41aOPjLKG6EMLiF6S9pLua0JMEkqk8ObWtCsP3uPcyDDQozBnsoabOUTtpVURcj8/NyJm8NMdJCSF7b7fNQ5Gcuequ1DvHIdSiGmEoV3MJTx2d7YYNe96ddY+fXoCwibqzGE6k4WCVtcz9y0DkTGAGnrEJBrcG026whOlQ+ZuYMxx6DraLJxBZQVD5gUeHNDMU5IR+orC43LnlVvZfIRa9VhKj8qJg0up4m3SDVwghOdtl4VzwmI2J7v4H8/9vDLHHd3TR9wGxIiRwmkuTUFH9E9lbmp12hdk5aAls8u79dwyK4yOLrI3CV8HKdsm0alHhU2+mjOmGQPjXvPKU8aanhHqg6Evsc8HdrHBRfHQA9Y/NYQungAo7lE8HOkEIVGDavlA8LSc45ymR1hfV6bG4D4OOy/l2m34caIgUb7JTVWJtRN0ODoulPgd2ibVx+7ki00qMxQ4ZwHnT+nJQSxbVMvmkh8AIc6zZpt3wwTjYp2F6W4XVk0FQsGCuwhG8P8ArTsqOkZGMIvzkaoouszgaiw/qI4sk0YjxEUwuzm0+u7AV8NLL5uLxqyydLxAngslRwx/wX9cuOFQF/q4pYBhQBW4M3T2/AaYhUd6+cMqO1PQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HVw7wd5Ihc50KUukvsjRhb7ACfy7RSODFr8CfkBuPj7KOrgVSSYs+gzKEmZ0enF6qlOpNY4YCUAjAbB0JI2az2Vh/8S0L8pU99q+CY3M83PQRizr/GBfO4LSoM54qXe2CE7HMwoNlWsKb7lPTC511ObL7Yia5clDjUzkP8fGLlys07kBHDNRnXPz8dVad0jBZ1m3vdBr/mXnLTtG3b5XKiIzDeciuTO8C0L6OminV7nhxI9my4cbuD5/DWjrD1Ril55Yf0K/NUs3Zz3f1BUtn7SUTj6xHjWkTeKg7xbt+CEASTjeIhrHPc25p/8YQWJTsBJusLzy/NDQwK2DHxutd2gNXtUQTCLouMvW19NwnoQhGZg3KIlg7Z0u9SwoQFc/OpnMe/B5nnuO7zQ/Z5OoDFd8tgMNUNOy10hJHX+bhl3Wddyfngsc6LbUj3Mb2KAZ
X-Exchange-RoutingPolicyChecked:
	KfrFGAIlEhJrQ570xU3HGJXcy2utfbZuWOzD04i1iKaiiIu5ICcsdn6m9M1P0ho7MmSs4i9eol7P6G7Lx1K5FCRtiNyO3RGLdwH90QSykRa+1fdvKQXHztx+kqDfxsxfHucC6mBmixKTzJeBqZw2wCXW5ZZNbulm+32oWX7CasNXNu56Qe738i7No7bgKNc9RCGIENnxOh0qrL4LQN92O2CUF6PwQeeyQvTAsVCJR7xbhBeGZbWk/2s3iSpLST6n/pva8Rs0wao82ofSwBVBLaH6aFNEt3sMMcyK7ZIEsfdBvAzdtgwaEeFCqv6mYUvknT9R4DFUVSNA1Js/9JwLoA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:10:20.8127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de24dda-134b-4ad1-f28a-08df0a8e416d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8166
X-Proofpoint-GUID: a6nEQ92w6WTAgz-3BmMpX-TK7Jw4i86h
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEyOSBTYWx0ZWRfX68JdIO5Zugd/
 UgS6qLN+3GRN4jQdcUrxrVrq5evSVrucDi9QjDIwPzcFoqK4Q/I32NlV5iPN2uErJZg+9emsezs
 ezYO6bojn3me0T1HpU/i/bnIzUaLxBM=
X-Authority-Analysis: v=2.4 cv=GshyPE1C c=1 sm=1 tr=0 ts=6a9ad154 cx=c_pps
 a=GRGg88i0IYp+MSRJKvRoYg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=4H319SI92yjNY7Ba2IEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEyOSBTYWx0ZWRfX1GpZApKr+ywG
 HKSaD0s9PYEAvqhH67d423TFUwKeUjTdw448AHZFEgs7VPISipVgE6S9BYbZ2IahLSvMSzeb5e2
 NLYNeUTXY17v/22Ee8gv5vgnUQrXc3TEage2yoeqfYmtmpz+YrbNY+7WAW//kKoFpvuxrQRPzHe
 UVOtuf3t7NVA23QmMh+Oe0NStqC6N5jwOQHCkjJwI7/pzPV+jfENKv6huZTtoDUvPXpLRpmzri/
 fMAQjHbsZTjQgOMnxXdeCIAudZLcG9QOUWWsQ3NfaESOptQT1vc01j6JWf4KautLLGqCk8Tlm9q
 Hm5JChOssHjrSp/dliXHDogShmJ4MSK4aPoDvEOm/YLyyQAbLmYg9FnHeFTTkwGxogHPxIwDqWT
 wm/cUgC101j0MAhFePHHGmxXJuzHtvuH0DnqXPi78RW2uNcr/ib2f0cbKr9t/SvxIc9FrmN4mvX
 nYEjiIIMe2Y+SgHQlNg==
X-Proofpoint-ORIG-GUID: a6nEQ92w6WTAgz-3BmMpX-TK7Jw4i86h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040129

Hello Kendall,

On 9/3/2026 2:34 AM, Kendall Willis wrote:
> Prepend "ti,am62-m_can" to the m_can device compatible property since
> this compatible adds out-of-band wakeup functionality to the m_can devices.
> The m_can pins can be a wakeup source in the deepest low power states,
> despite being in the MCU domain which is OFF during deeper low power states
> since it has the out-of-band wakeup capability.
> 

Instead of adding new compatible,
what you think

1) if pinctrl_state_wakeup is set ("wakeup", prop in pin control)  then
treat this as out of band wakeup
2) if device itself enabled as wakeup device treat as in band wakeup source
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> index 5288c959f3c1aecfde363f9e2440253545591171..d26d6b6d0cf46a19bde9f58769b3eb8c86c836ab 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> @@ -154,7 +154,7 @@ mcu_rti0: watchdog@4880000 {
>  	};
>  
>  	mcu_mcan0: can@4e08000 {
> -		compatible = "bosch,m_can";
> +		compatible = "ti,am62-m_can", "bosch,m_can";
>  		reg = <0x00 0x4e08000 0x00 0x200>,
>  		      <0x00 0x4e00000 0x00 0x8000>;
>  		reg-names = "m_can", "message_ram";
> @@ -169,7 +169,7 @@ mcu_mcan0: can@4e08000 {
>  	};
>  
>  	mcu_mcan1: can@4e18000 {
> -		compatible = "bosch,m_can";
> +		compatible = "ti,am62-m_can", "bosch,m_can";
>  		reg = <0x00 0x4e18000 0x00 0x200>,
>  		      <0x00 0x4e10000 0x00 0x8000>;
>  		reg-names = "m_can", "message_ram";
> 

