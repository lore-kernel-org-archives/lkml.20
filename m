Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830A3B9931;
	Mon,  7 Sep 2026 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777093; cv=fail; b=llZzfewAY4wHTymmays6yPIdsAIJAnFGq9VnnGY0CwQzImEUBOIMG51pjrZCjNtq9xgxg1JluDejX0u0yZV8sPsNO5Q4Dti0M4yChzdYfMqgRWrPDJtiivs6DX6GZ+F8YPWV/fOOAfEmsKQxbcCxPJdxKMpoFPn3z/swEjoEDhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777093; c=relaxed/simple;
	bh=3QDhhqni7yKgDfmiDcVL3xnXPdhMXIJDMODLXdvsyQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GiU1KoCyr6N4pXVZZEs2JNIbBlzGNBk6mE2MSQa+ArUz7/h4yfpJVLIYw/nNjtlfMtapy5NDs0slewTG1ABHeDT7w0KKZ5CXUSa3wc4x+iCFnNekPi56RuYEyuQaoJMfgp2rjPs/r5JNbZmS3jgP3xdH46+PF/LmDJkgpLa9m2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=h+/6sHkd; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QC+n/xdL; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="h+/6sHkd";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QC+n/xdL"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879ZDYY3098677;
	Mon, 7 Sep 2026 05:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tp+6NhRzwya+Bs1pq+AN/c180uEuCsmSjexV7+aiC
	ZY=; b=h+/6sHkdTcncNHLbJji3zmKKU+6orbCQLtZgeGwwdZyGTqzSY1A6rFZwG
	himocqUMTYjfufp7ZvU435/4Cf/e/nhQ2LNowim6OsOCNT1DkEAV2Q2RSthwALsU
	xrrCMfZmUlgEoGuwpjkpFkLrJOoEI3zCVi/FVt3vlg6MTuFeq+yKDAySKbOFat3v
	Hox7yPYKwmURLOnHHMAOawh2JlOyQO8L3gaEb5bXHFeJJGZwKnG4YoL/xXtHXGC4
	CY69WLtcyp2hk3Ol6ZZ3uUBQczert8m0e2UhYocRn5TO142PAvSMDzyVggqm/XMk
	ThEqTy8wKy1WDbYYKgA60JLONl39A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh2f6dftu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 05:31:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkixspgSvdmD5u7+AF9oU5cDl6NXDAA16BatmlmbTiU5Vm/TSM+yc+NI2WTrNXZ32masMf0glye46Gv8WlZlkm95oJ0jdqAGpuXOVQibcYbuHCovshKl59+JHsr4y3JlDKy9EsMkk8PvxL27Pk2XGZRlAgf4Je5VGBNWkOYJYK61M0mPAZ5UQRA2gVYKQSF8X1t8Z70TGh7suLzHV8f6DtOy83HBIju6G5Q8XsZja5pyJPaYmSNVCHLbeXI6/+ltXj/nahqAD78YLkD61tG6hd8yFKfxHM99uvBGIGto6DL1+GRRipSFVGMY+QEOk6rEzs6CouwsPjdSzcrGi6tBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp+6NhRzwya+Bs1pq+AN/c180uEuCsmSjexV7+aiCZY=;
 b=MOSUasIUuOvyOLArbh177Jo2unvEPO5sFCkyaFGRdFxHk6m7XMEjoITtpcaC4zr2tt1bQ6Q73cLoGVoISV6qKLbvSluJrGySk0Ue0zMkKIejbZm6amhK6jhoOK5F81xujn8mV4908cQanpJuH0TP8LacUnKVaLdC4S9rSavEKjQyo4BWW9tt3QVPEFQ5ctze4o34gPNCDd4+RLQ62vwjxUfXAcHvMTHy/KsoLhGosV3WIvAYOSkW0i9nNTwnwjmdXNCb4kaLUwwFD2SnO1ZcLk8FHYqShleQSD0jnpYeBqshenLLuwv3ycvzjlIWALCDyQx7Ug//98DH0RLvB8ITig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp+6NhRzwya+Bs1pq+AN/c180uEuCsmSjexV7+aiCZY=;
 b=QC+n/xdL29Z4NPtzyS1NOQY3zAk7cmsuLfDnjJ6b9NOG3VpBxTHYr4e49EJAJKtM7fuQz4FiN4g2lXbYuZVCNcwsGcqWwJSFBfZYD6VLiqqbpoAgOgmV+k2Y13MstXn0+G0sigQSqIlClHd8odFRsXBy6MIwiHuCoU6QsIvNC08=
Received: from BN9P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::8)
 by DM3PPF2023FE2F7.namprd10.prod.outlook.com (2603:10b6:f:fc00::c12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 10:31:19 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:10b:cafe::77) by BN9P223CA0003.outlook.office365.com
 (2603:10b6:408:10b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 10:31:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.1 via Frontend Transport; Mon, 7 Sep 2026 10:31:16 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 05:30:34 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 05:30:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 05:30:34 -0500
Received: from [10.24.53.20] (scaria-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.53.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 687AUU7U353246;
	Mon, 7 Sep 2026 05:30:31 -0500
Message-ID: <38c8d72a-50e5-44e2-a196-fb6b9f7530b0@ti.com>
Date: Mon, 7 Sep 2026 16:00:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am625: add standby cpu idle state
To: Kendall Willis <k-willis@ti.com>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <a-kaur@ti.com>, <s-tripathi1@ti.com>, <vishalm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260820-upstream-standby-v1-0-6a0553b9713d@ti.com>
 <20260820-upstream-standby-v1-1-6a0553b9713d@ti.com>
Content-Language: en-US
From: Scaria Kochidanadu <s-kochidanadu@ti.com>
In-Reply-To: <20260820-upstream-standby-v1-1-6a0553b9713d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|DM3PPF2023FE2F7:EE_
X-MS-Office365-Filtering-Correlation-Id: e47813a8-72ae-4741-2e4d-08df0ccb2625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zqU7ddnifRNABG+jUQLoEsCvHrhuOXx2/KlSv792N68dM6jsYDTZ2zXlBKVc3PbiRNgDhTqUnjb63pnLNXOBHD+Oyup8BK9WT2wXwTvOJom/OWnJGE2NA25qGU6trWMB7329vrI3VyAX2Nq47Upuz1OUvN5UXDJIWcJXjqAemQD0LSomA6OCdLMK1tvfWxMzRAuRW0XqH2x8MKYgXuQMtOH/tUs9d9bMwU+Mk4Q4Rq4BaBcxW2xaZsmHCWU2EeyQiYL2ncMXi2LgBXRN2BLAXBxS9bY+Nfq8ytQ0yNpEhso5OdL3ygGNiCg7RC+Le2qfkXBG/7A/h6I8tOuVALOfbvONCk5wXDDVxW0wuCinFNmhRGClqupuK1smqmoRvzlw6aAWkRBbKomPDW5kqxhBFdSXc7jMAHvIuJcGgXZKQbTq97R8GLhlAGzzAaUtRdbrhTRACjxlMwECrkpGXPvDyQ8V5Oeuij35wP9BIfoMUZ4teRHdWsAGzDrkZiATpmRH2U3pbS0wr/yss0L4UIpscoqy6hpRVhuXAIl3yrF8Rg4v+apE2C5tUQ90pnG+lz7uJgcgy/GfYTSvgG3o0KWHb3+D1vYRM6sqO4grscTgcEwc6eKfclh5XWT/a8H1T5eOpHcZ2Rq/7bGLAm8G9e2eZe5XqMLWs9R8Zr+jGrjqVi4OCunoVpzlOlFJbUvu0mo9+vYfe9FK3txsaafLwfIBSg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	esUyClOXKbrbqCpU+AB4R6RCwF3/W2uYyadQBtF05z2tTYyww5I+s+FFohmh0Q/9/RHG03glWQ2xD3nKNRj7Se96EBJWsWbDLLw21G0XSzLWDuJCPjPlDwncMW9sWaprMt/cG2g95LO6EnkJlbRGtCXVqE3+YDGKjLsf13sgVNB1bAxFfXpayvP+x/W4nTzC3ku6WfZ9nIFuXQdkOjFhRvSsAuocchq3ML9GVbICcpfuF9+Kps57u6Is7m8t8XukCT1x/9e5Cy/4WnaaUn0IgaWKBunoKZAwThvaElAfq4CcoMwJDRT45DaZDsZvls0K13kGwZtgRYmXgGeZruuwwrk7LRMNo21CUGdtXXtqS8GDh78YicBS+lBvlmNpBfFdCGlyPiWuDJ0N49ZGQBBy00+tTgaEq347FALRYtyImysJQufeFNyHvGKg1ZI25ksR
X-Exchange-RoutingPolicyChecked:
	mQnoG+0YM/6VtRkS+UQVAgsI+EEuOLVoJQ9CmQIQNf6TjjQ17XjJFqSXblTzAekzystJAxW0fKzK7yFxGZ1U5jJNoAj1jwwgiZqy5Ai14jXS67uzBnD7/quXl7asy1vDoYs2odM9UUdGHoapDAdG9U7Hbg+NXfRBF/wgW7EkOslArLs+8ORAoxCLMHzvB56LF8ezujZRUpivel6jhdUX6V7g29NYIIwbMLO7NRvQuO89fqCPtedMRuy+fhLj74xQh6zx8Md1oFrJAimOBXFqAFZDmo55AUwsjPCKs7VW6D4D4u48M+GHxwdqmvRc+O5MSJht50a3ME+2jzFMBmem4Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:31:16.6527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e47813a8-72ae-4741-2e4d-08df0ccb2625
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2023FE2F7
X-Proofpoint-GUID: kbQTYfjzx81ktUZFxErddcZN4lsYtatS
X-Authority-Analysis: v=2.4 cv=Wqkb99fv c=1 sm=1 tr=0 ts=6a9e9279 cx=c_pps
 a=s6FLI2cSFE2dV00WXjZlDQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=be33sPGTcuLsgUYwzy4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: kbQTYfjzx81ktUZFxErddcZN4lsYtatS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNSBTYWx0ZWRfXw+ofDa5xG5xj
 hIAiQ1W+qQZI6me5gLsCVvnNRpJYbzamr02fMfy61v8baiBli1OuSRAWk0ez0kiuI/Gb3YzxO4i
 okp+GN+OiIKAxMfAsUMfLIm7KWSFNLUEiS3OHahUBJDhdi0AWqkaTNfozPHAxAMj48JmqZPUyu/
 UhqOo6sqrQzWtvLd/RozhCwylmg/ABLhLX4pWTlQ/xltAu16PyoyDIFbfbB1MUp//Ct1qs/HwoI
 7IRrvcKBiMyaC2jkbngRYEKpTUXL80bEWx2tvL2JFqilgbGu5AxS0UsmVjeTDFHkh2RTUF8dEoQ
 VqsO3scNHNh+EI9TvUNH65irZxHzsYcE3C18G+IEUXD0zmueWxnwS/2SAcWKk3cCGSnaJwQ8GQ/
 mzZFuLQ5dTOZLhswNOma3tV7WJiXepd679MLVkmsvOpQerU0AoEc6qb6Knuv/VFmSzi6BO/FlRo
 TtKWsSbhpn6aWKY2sxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNSBTYWx0ZWRfX2q4gD38PCNHp
 lNBTptIOGxA8xze0V9Q8vo9HQiYW6mZEtzJ2r52bgUCyILBov1+WNxq8r/xD5P3XEIAoJzHHBUO
 bbmFSd+5XLSBPWEBV16jtmg3nRnqiQQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070115


On 21/08/26 00:58, Kendall Willis wrote:
> Allow the A53 cores to enter standby mode on the AM62x SoC.
> The standby idle state enables the CPU cores to enter WFI through the
> CPUIdle framework.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am625.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am625.dtsi b/arch/arm64/boot/dts/ti/k3-am625.dtsi
> index c249883a8a8d846aa21092c4c341fd443cfcec15..7ba339d5875926717896fc92fb2fa6d2b8d0026a 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am625.dtsi
> @@ -51,6 +51,7 @@ cpu0: cpu@0 {
>   			operating-points-v2 = <&a53_opp_table>;
>   			clocks = <&k3_clks 135 0>;
>   			#cooling-cells = <2>;
> +			cpu-idle-states = <&CPU_STANDBY>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -68,6 +69,7 @@ cpu1: cpu@1 {
>   			operating-points-v2 = <&a53_opp_table>;
>   			clocks = <&k3_clks 136 0>;
>   			#cooling-cells = <2>;
> +			cpu-idle-states = <&CPU_STANDBY>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -85,6 +87,7 @@ cpu2: cpu@2 {
>   			operating-points-v2 = <&a53_opp_table>;
>   			clocks = <&k3_clks 137 0>;
>   			#cooling-cells = <2>;
> +			cpu-idle-states = <&CPU_STANDBY>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -102,6 +105,20 @@ cpu3: cpu@3 {
>   			operating-points-v2 = <&a53_opp_table>;
>   			clocks = <&k3_clks 138 0>;
>   			#cooling-cells = <2>;
> +			cpu-idle-states = <&CPU_STANDBY>;
> +		};
> +
> +		cpu_idle_states: idle-states {
> +			entry-method = "psci";
> +
> +			CPU_STANDBY: cpu-standby {

nit: The property ordering looks a bit unusual. Could we move the 
'idle-state-name' immediately after 'compatible'


Scaria

> +				compatible = "arm,idle-state";
> +				entry-latency-us = <100>;
> +				exit-latency-us = <50>;
> +				idle-state-name = "standby";
> +				min-residency-us = <500>;
> +				arm,psci-suspend-param = <0x00000001>;
> +			};
>   		};
>   	};
>   
>
