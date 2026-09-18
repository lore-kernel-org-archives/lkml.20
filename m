Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4892FABFB;
	Fri, 18 Sep 2026 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720064; cv=fail; b=DQreKUi4sCwXG9Gu/V1nqXEFRjUOkUG1QMw2OakLLnI6WWDyroKwnvSV6dkaZfcv8itxzTZ1W7eQSyBUVkyAFrkfa4W/0hVXIBH9BCW4ALUUVUNAwwYRIiK7Vvh5tUvT3weY46fAfwOuJgZMSC8zHFOdmG3qvafFTyjo3CIoaTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720064; c=relaxed/simple;
	bh=i9vjr7v04QuLvllzFhsdhuAiA2kVMpyNvW5RUsNrbQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KQGUajRzU4j4cAhQAe4tKGUOlzu90xanZ8AOLXYyZjI5vYaswX6KPjI7cCeSuedQsrBKupqoVO6hDqw0sAf4KXrTrBTOoHUuWkY7HFik/981FB+yWFZmrXF7mtDLkMm/iYa3hz0dBd5+/S33wiQQFTJ8ZoBpr60tOYRFtDymIAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Vu+prnHD; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Yclzd3BL; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Vu+prnHD";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Yclzd3BL"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68I6cuiR885058;
	Fri, 18 Sep 2026 03:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7m1/sJCpCVQ5sLXyoqpvjBZa2s2/hzTbyFJhnPz9C
	kE=; b=Vu+prnHDVgLvbt1FYwfv1mfDSk5got0F/OqktjuLIcbavH0zO7cWBhUoL
	fULMWVxkc/B5hN6Rc50UUEsdVP2apgmanrclmreOZlpXsNSIGV8cXGvlbBOmqxAo
	9IXY0DVw2ukDlXzCg3s++zNOkfDnEMr7h6Qp/8gwZn3p5Kg6RETjBHD7cONKAD7a
	kgbPRDcJd2gYGnPVp3fGWDJPGMuwiuVEDDijXa04xvz/vuegrNd3FPsAaQ0pYhmZ
	3ICXBrStuhcPb+Hwbv71HSBMzRWsLFTNoALM9fz/IQV2YmBbOTm9VGBSsWW/sFp1
	5ABF6LofJRSWvc1pRQ/TpGdVKm4WA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013058.outbound.protection.outlook.com [40.93.201.58])
	by m0384305.ppops.net (PPS) with ESMTPS id 4grr9hbjh4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 03:27:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FP4rOYvV2Gc0D1je0P5TT8Np0yF9cz2VE7EZLPsQt7esx3VXFww7R4TxTdy5pNScIr+HU1/I+I+bICqG0W4neKv5+4YBMRtjlIcZKsHFCwu4aYRLs3KAWKDSI5Zjn488wtA7ZeCi6U41GwIscg1Ozuc/7Is/25EUZEemMdEi4qQrMRAiNJhnRCwOdQMCwheqLvhebnq16OFZUsoAuedchslLbLvleijM8EdFMZ/FBpFvbNoH068hrsSzxWdtjBKNa4tDrH9jVepXIYbAU0e3BTSDOeaD8+Jup8xXbl+jykW4UAPu+wyV4YD46p8H46iVcV/NveBRtBlKbx1Hs9BH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m1/sJCpCVQ5sLXyoqpvjBZa2s2/hzTbyFJhnPz9CkE=;
 b=w6BFqa/yNHLTTIItTUelWQW4v5fsFelEJBCnYxZDu6bHG2PdozCBS5KiBDZPf4oyNDqabkBNgX2tKN6DbpzLhfO46yqKM3lOadSuRm7E3DOuZaIYFR4z5lJhusyDV0baCFBTGDYSbdC/iFUTFxWceoGldQV20JqFzxmWGUQtLZFyphT60FYL+78ZQAMFCSOMknCDkaLDVwyvNq1SkZemGAEuW5gdQUWi1GZTO1o2KbUaZ7gXmtETFXh64BWU+oZ6HcSfPznCkvDFp/a9VxPIKpNYKya1sY7Ibknz1ZwcvOUrtwmO1Ay4L3EfUoLtmCc2xEDHyhx9l/qbfTQjguB1rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m1/sJCpCVQ5sLXyoqpvjBZa2s2/hzTbyFJhnPz9CkE=;
 b=Yclzd3BLMK/u2OdO4NL5tlnFZSE1pXf+GoF8Sg81IieTOfR8OTjGIpr9r/ZLbuCe1s0naz38MkeveKLO964wKkYONql3FLur3bURsaKdDv2umebyBJPjuA35qX1+mVxn0Ae9GInZhf7CvZMGguVagUZXfzh2sXWyB9h4vTalCqM=
Received: from CH0PR03CA0346.namprd03.prod.outlook.com (2603:10b6:610:11a::32)
 by LV3PR10MB8010.namprd10.prod.outlook.com (2603:10b6:408:282::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 08:27:30 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::14) by CH0PR03CA0346.outlook.office365.com
 (2603:10b6:610:11a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 08:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 08:27:30 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 03:27:22 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 03:27:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 18 Sep 2026 03:27:22 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68I8RJ781373368;
	Fri, 18 Sep 2026 03:27:19 -0500
Message-ID: <39d5525a-1276-47af-8659-70a86cda8a1b@ti.com>
Date: Fri, 18 Sep 2026 13:57:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-pinctrl: Add virtual GPIO select mux
 macros
To: Akashdeep Kaur <a-kaur@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sebin.francis@ti.com>
References: <20260917111539.3844577-1-a-kaur@ti.com>
Content-Language: en-US
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20260917111539.3844577-1-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|LV3PR10MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a066ca-e378-4cf2-4321-08df155eae2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|56012099006|6133799003|3023799007|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	2k/63NQt4BvQVbUaBs9RByQZG4d6xCX6VgsEtTefOUVP9J9MhgfCrDUtnt/zTF43udvcBnHXgWSiEyJjcQOpH7FuXjUg0pBDFOs3lSROSKS5N/ygcta4BsqpAjDc3wo/ydcaMIbgZuSwz5V6Cd3QFqS59jdE9iefAaOC9I9OvkzgAqXdtudN/EsNHulUGnmPaMs/pkPoaMWGEmoUjuM9ry2xbDFQgHgH7subwvIJAJx6Q7dBV0pQ52eZ8i3BQ7EiBGrPGh+mJmk36d7BgVeBEZVuR4KX4gC2pXw0Q4VvmZ7cMJj7Kdd5Ncef8A5uu/21BrUKSbxOYaqF3INotvJT1OhyftgW1YmroP3XnRyFOvKs9CXVS2auMCjQJ/emvmiwfpgbw/JXjgCOFDdcG0BM3/q+H1llN5PRmk0jO53TjRbtH5PhiUp9T821IItVS+UmmbAn5AbuveEumlZJLYaQRsNvKAn6VejEn0Y/mDweybdxt4orY3CfnbV4CtjkE/tk9vJsuFqAppIpLXOVrAlzvQ2YgQ40Lw8CfL1YP5Fmb7mFeDB4xM7C6VaZOWrCitKvjTegkv1cvhyUqvOQzjkJdgQWYxcFpvMhHkJaqN78tJodNoBeYCslM5DEdjMIm5aadHpF2dDq/TaKXyXOPzNY3g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(56012099006)(6133799003)(3023799007)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	goyUzm2hLnev2fPs9efKwnNB+aMqZy0o4pwx4IWh7T6gah8bYcdb7hoeTDlBGUOeN5WOgcynxcWbxZTzR9qab7OVsFdUKfUP30WpA8N2fjAfB3Z0fQrysb4fFL82xX7IOD40MiXuiRKzSZC4hQa2bI/TBlgee/dBHemJyE2rYr0zVU9sLkkzHG2eEje1xMu0s1XIIsEEe2Ex4Ea7fH3Q9fMu3MWlICk20iO0cauhdFcaITMl4K+ZZxuDyr9vXp+GARssu5jakAYERzPgxHUu+sCYTPvpD/I6SeP2Fvr3eo3a4oCWJ9lw8/9m7U6qgrZNq82OuDK0R8O73yWIYcB5kEeT/9AJJH0N0JryHS9YSlZN6XA4nY3MyFZ1gVovbiDnw2cvGfe9VeZO8vcGrsQ8UQ94HKpDgzMXpCtNzPwon+Sm8Dy/9mLYZgil6zO9Yj90
X-Exchange-RoutingPolicyChecked:
	ZqGWfvFC0DVMUHzSt2xPtQbVnCScJhY1rnWhrs53WeaIDNgeZxzqbpF0hof7jQK6G7SU6ohJR2yIlLiu+3vJ5wJYm/RMk7wF2TQf+dE4GB/zkRV06R1AAbXJUTqZCwdAvyKrucgvjPTjsGJqO5S+vtOLrlSKqB7JqcUKL0Xp9kJ/RYnZzYZrRhLa568CPgA2DPIptRgCXT3F+CYwxz57GXmH4HpSFoJoRFgzasXcmXFlqgE8IDzlDfh8bCxlxd8IPiLU+LmVznRyqRvBr+p0d0/vPKWNjAtzbGb1Faw5C2SmGmgnZvNMR+DrPBIigAh1svxdQXMPYr1t4kyLwVpqIA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 08:27:30.2010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a066ca-e378-4cf2-4321-08df155eae2c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8010
X-Proofpoint-ORIG-GUID: -rrd_X8kQDW5w4JGT757GT4280hTm7en
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDExNSBTYWx0ZWRfX8mWxXoLYbDmI
 kT4hgdjq81qgLEWiNZ9hKDpaX5Pg4gLOcbD0iT0hCKgety/vSZ+WJaO0QwgqBY1PRWFtqhttdCh
 w6BaMkyt1OMLxh1wsvrMHIHR2li9EIgYlgVTt8HOtwoYKQDbxCGfFNLlEVCDW7LgMPaqUc6lf9r
 hgG13ksHk5h1LlnT36Xm2YCFpCxE1CDZKcTM1JRsFrbZrIlfdmLdpV6yTmqrDxfs6i1gUzmVWbw
 al5x+I3xMprGQHdwOAJLafMx0nYKWwfNgbCD3dJOkwh61IqBLp/K98EH+fHucMz6hL3w94eHzWb
 blmmZJqlGv5epLl66QGq9AG3/sKU2UMSM66qKzQpwECeYBukME+f6ABQ+kGXkKfWiB4rApKPxBE
 0WD36zRUSPUKZbjMG35NPNsSDDF4gdIk/tq8VjFnVTbXroh0D5q0lRqo5KXelv68dXQqo74og26
 +Ovx+BhdoXnPatQ/V0w==
X-Proofpoint-GUID: -rrd_X8kQDW5w4JGT757GT4280hTm7en
X-Authority-Analysis: v=2.4 cv=eeCo7LEH c=1 sm=1 tr=0 ts=6aacf5f8 cx=c_pps
 a=+UayH2mdqs80qU9+PBkj6w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=ZOoyv1ib33HAKZQanHcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDExNSBTYWx0ZWRfXwt32xRE+UHkK
 kG12gVYR4FK1xLqavmDdSaTBKUPWpMiC2fUG1hHY2SCRxgcamzycrGD/wF6SCGMuU5XBXJvqQDl
 VekB+QDdB/zALBrZXmcV7E+wu/jgxCA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180115



On 17/09/26 16:45, Akashdeep Kaur wrote:
> Add virtual GPIO select mux macros to allow users to select GPIO
> controller bank for pins. The two GPIO controller instances in the
> MAIN domain share physical pins, and the vgpio_sel field routes each
> pin to either bank 0 or bank 2, enabling GPIO partitioning between
> software domains as documented in Technical Reference Manual[1]. The
> pad configuration register field description can be referenced at [2].
> 
> [1] AM62L TRM (section 10.6): https://www.ti.com/lit/ug/sprujb4a/sprujb4a.pdf
> [2] AM62L TRM (section 14.2.1.2.1): https://www.ti.com/lit/ug/sprujb4a/sprujb4a.pdf
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-pinctrl.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index 4491898d8294..d42c466fcc7b 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -3,11 +3,12 @@
>   * This header provides constants for pinctrl bindings for TI's K3 SoC
>   * family.
>   *
> - * Copyright (C) 2018-2025 Texas Instruments Incorporated - https://www.ti.com/
> + * Copyright (C) 2018-2026 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  #ifndef DTS_ARM64_TI_K3_PINCTRL_H
>  #define DTS_ARM64_TI_K3_PINCTRL_H
>  
> +#define VGPIO_SEL_SHIFT         (4)
>  #define WKUP_LVL_EN_SHIFT	(7)
>  #define WKUP_LVL_POL_SHIFT	(8)
>  #define DEBOUNCE_SHIFT		(11)
> @@ -111,6 +112,9 @@
>  #define PIN_WKUP_EN_LEVEL_HIGH		(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
>  #define PIN_WKUP_EN			(WKUP_ENABLE | WKUP_ON_EDGE)
>  
> +#define PIN_VGPIO_SEL0                  (0 << VGPIO_SEL_SHIFT)
> +#define PIN_VGPIO_SEL2                  (1 << VGPIO_SEL_SHIFT)
> +

Unfortunately, this field has different meaning in different SoCs. Here
is the definition from J784s4:

Note this field  is irrelevant when Muxmode is not 7.
for MAIN GPIO
00 = GPIO0 or 1 depending on the specific pin (meaning if mode 7 has
GPIO0.x then it is GPIO0 and if GPIO1.x then GPIO1)
01 - GPIO2 or 3 depending on the specific pin (meaning if mode 7 has
GPIO0.x then it is GPIO2 and if GPIO1.x then GPIO3)
10 - GPIO4 or 5 depending on the specific pin (meaning if mode 7 has
GPIO0.x then it is GPIO4 and if GPIO1.x then GPIO5)
11 - GPIO6 or 7 depending on the specific pin (meaning if mode 7 has
GPIO0.x then it is GPIO6 and if GPIO1.x then GPIO7)
Note this field  is irrelevant when Muxmode is not 7.

Thus, macros need to be generic or it should just open code the constant.

>  /* Default mux configuration for gpio-ranges to use with pinctrl */
>  #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
>  

-- 
Regards
Vignesh
https://ti.com/opensource

