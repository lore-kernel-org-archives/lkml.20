Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0FB4ACC8B;
	Fri,  4 Sep 2026 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532114; cv=fail; b=HDTAgL0ppoMux/VUHqm+HN9FcOd/bex8fiaY30P1U9U9mT1Yy/lPNbFYpgsUKwZjP/rNd8JGPAdo5lJqSYi+UqA5oDw8FyfFNK7kNVk2LZQaoycD+YUBwTxC7SG8rWjOk8H8dCcUwxUBaA38QgLm5IQe8ydqf2M/fLUD5Va90cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532114; c=relaxed/simple;
	bh=Hvcpcsl7OElvNkYRHULDcQUyvm4VBImSW2C9kDRVMSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eiTJgLMx7/lNK0yrHswWeDVsWYLPrFslMPCY79Hv1JVGYbIfFko24KaZayZWe0cSGXMxhH3JdNK4lB9+OFEsk/CWbxgqetpFPu505nYC5r5gRlJAZbqMVYFF2rVLP+9LZ5fCQN/CLPSKcDYLRx6sjaX3rdAUvThYZHZJYLRIfvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ijeVEy++; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NlN2Bv+2; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ijeVEy++";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NlN2Bv+2"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684EBMUq3920128;
	Fri, 4 Sep 2026 09:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=kcoPyJgITDorZGQiK9BkGOdKMJJmEn99vOFPFnxrJ
	BQ=; b=ijeVEy++W/aYX6dOm0T/ie9QHg+uh2IubZ+cxzXJcUJnFJjBgWUx5sL5m
	LNfmFKquk4ebmm2p01dPn7cjsA0eiOO8mMjHUpZoF1wX6//dQ31AgKTOpdpV32KT
	b/TKGf8REZhVzEycdXEW+EsqENthxtqMgh24mv1afZWcNfczglrsxGVtUYLqOrX3
	6wLIrRgbYsQCcWwLN/w755Lbb0NaxK0X8ibQoojZjnHdKks3zr2wDdHQXUSW7Rdb
	NEQ8emWsUROj0KRN/xeYAfq1bY35MyiiaCdTmwPG9yJ21ymqgHfHoeg3jBzv6Bgi
	aKtHa1qoA30Lzg+IKrC0JT3mlph4w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gfk4xvr4f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 09:28:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3yScDvEV9t0w0wf4bObYuknwWQk+SryFJtPnvMJBvIiIJyItDYy2GqjL7IWLt66wTvYGjs96810yNkdhr4EJLWwozd8xKEcQpcKcgKaGgmAKSp/qnRw4p+KQ1WZhc8WSbiH2n554yDi+uG0OM2xd1CVLeKgbneClav2YOuigcheSDi9aCS3qc172sBPoczQzHiTMNmDQR6CdDynVkvtM3v/wsVEwcteNrLJe2QDpQfg5JSbaQV+HSe5bGjxpSkvQtRzVSSrdLISLnSpHDV3wd2toxw4PhBKaVMYyVtXaIhwFmxFxLB6STcEAyBHMDdBiPVGlfgsUAQB7rivVbmx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcoPyJgITDorZGQiK9BkGOdKMJJmEn99vOFPFnxrJBQ=;
 b=qQvA9EoHbRF2acO9H+kXBZ/dK0zbW8/N7rWYA02a11+aM0g7n81ErUE1/qYiT17Q5yaDUyK0ro2564wRbNwKhp1Amc1nvwVGXi9+kaW3CZ5DQeM4ib1LB+UXm7DqtkbOf5aB3Ylf+UIjrRgabwPdFeEQvmmBnzLVyliUZe8FVly85FdiK7B8oYTWLe5VmulLjS8B7kSKfiLBTmWcJmvsjFkidvGJLbLg/NVEB7jZwnJVW4xtmXoPT1O19pgaQs0Fc+9q/yL9PKQz8EYX4reralFVAw6bwYMzpLUqYLVBYlXRxIGDmnoNpCzyhpJIWBqkftrM4EtXVw4yObTz5E2NBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcoPyJgITDorZGQiK9BkGOdKMJJmEn99vOFPFnxrJBQ=;
 b=NlN2Bv+2kWj8FZKgBUqjuHOrekY0VIlO7B3EwMliBiyFSf1Re2+zxyk8NyoYswjGiWWDmK4EsIBtnNBSdNk9R0H2EUt1W0zgXkmy76M1PAI6StMyrzW69uehcYNCDsxsiMOyVC0iOUo1DBtJ41jwAwFpo4JbztTKk0Co6x0Z38g=
Received: from BL1PR13CA0195.namprd13.prod.outlook.com (2603:10b6:208:2be::20)
 by IA4PR10MB8568.namprd10.prod.outlook.com (2603:10b6:208:565::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 14:28:22 +0000
Received: from BN1PEPF00018545.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::94) by BL1PR13CA0195.outlook.office365.com
 (2603:10b6:208:2be::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Fri, 4
 Sep 2026 14:28:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00018545.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 14:28:21 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 09:27:26 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 09:27:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 09:27:25 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684ERM7H3655835;
	Fri, 4 Sep 2026 09:27:22 -0500
Message-ID: <33c6717c-5c24-488f-bd85-d0cfaacaf13e@ti.com>
Date: Fri, 4 Sep 2026 19:57:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: add am62p/j722s GPU node
To: <a-christidis@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Michael Walle <mwalle@kernel.org>,
        <u-kumar1@ti.com>
References: <20260831-am62p-gpu-node-v2-1-69945a2db2af@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260831-am62p-gpu-node-v2-1-69945a2db2af@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018545:EE_|IA4PR10MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c7bbbc-3601-4501-20b5-08df0a90c5ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rsEdRit+o2cqcMxVjDe2RRTaaE/C26U+NHAfbeyy8RsGZJHW0KMtfuuq4+/sOViekzeNEEa8MReurnze6n7HSec4WrlJz35vHvtDX62OaIK6iUzbVmqucDEBHpx+ZC9AV2rDOTeJcPaoStN9sVzc+xxx9cJoOuH/6ACvXf8vbZAlT+EB2zH7H7Td1xLy90oXY8/WiffR1zu0O9fmFl1SZopkFkg9OlXK1depKHcmlcn6y8ef6nkjourm4gp9GOgli6VcyTLQhQUm9B8lMZG48iyghppUxgYXETTGxsMOLtgzvtV1oP1nDg+xiIbwht4qq5fC30e2EtYGB6BAzo35AzUac5ufOhjLt5Q0kMV0agSE7Qn9so6RPCSzvVVQHnyAmPhE6aXAxKBk3XmjAL7oCpyz4LPeWekvnyt+FHl+wHZzI0kHb3w+hZ/1EyXs3KYYpLqiQajoPOBw57gn/h0WP7EqadiXt7OewGtGHQWFV0YtrsnMU1PUBagDtsmNDiraR0DcljDSF6fr6OyKoUk5R4HY3jhufHIHEJlwKqYVlHzjDvRPcIgtvjyfMFmsptZ+JAQq3BUOudFKpyaLvapPd5vHc6U5Z5HWjqjM5IWnvyjcVY1Z9KCpprMs01Tt4l7TjThNIWOxQJ2+6hP3V1sxbAwzL8kScMGBkUG476iyoBfeXz2BnhYEUijf9PT+rn0Qo6OQlyvGoUZgoIXdS6o7dw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4eUMOiozQMFuYu27O7fn59eTgSF85bLwsiuBb2qilAZkfSv5GkUJfPsvezpdu+X9VbEwpuAQy/Lq6RP5OdkwIiUbC6LxYHmJpf9mxoolv4SQ6QaLBDO4BJ+FFdvsPJqe73bhiZT+829LVYJMT342Ck6nwhMhd+b0TfMPH23GOXmk0Pwrg780+w9ZSu3DYLSC08unzIKASMH8XilwQimYLYdPRlgq6vN9Xae+3Mpyr6ffgF/CswoGDatcypn/kQETCUFzSP1O9UMqvwoT92Wx6XiheEof1/yOx4tjo5pVoYhv9PuCz86FtVEPvpqKOh/o1GgnPuGh/xPUcRyDfYO9ZNl680Wyo+fmnmqNBHO39tuON6F8LIczOJnnwB+LCPbMdOiZdFyXkdP3NoH4oP9JyN2ElfBK20I9gDbbvFGbYMo/8ALUBoSplB0NkgIJn2JU
X-Exchange-RoutingPolicyChecked:
	GueAb7Q+sx+ZH0tta/TBkwGQQRHArC22y78IW74Mh+S7bfEfX3iZBJFn6Yj5mppZNLJ8iwU4kvCzi3hVu2Us1avENuO4cO8IpeaDj6nAcNy030mSCOEf9LhF8ybj7JwKoOrKwMH0uyogYP1csrZYLd/ejBS4GQiaZBxC9sTgNrY0JyfY3DyIXLFo45m/064Q4Pk8K+JIvJt/fEepEj3ByXd/Px5weZjaCwzxykWsrPaO2uOfKTzSWrr/SdKGbueqZ9RqO/WbrkivFnGexofgqc3aVs8fmjZ3rsK3xBMgxfhd3wopn+l3yD8ojbdrZE4oTR2ikfx4CrC6ZtWWgSzfyg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:28:21.6688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c7bbbc-3601-4501-20b5-08df0a90c5ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018545.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8568
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEzMSBTYWx0ZWRfXw7nqHigThkGE
 dtM2Hu+kjaue4RE6nbazPFyD8nOGyBvuYPBC7L76cCOkkiUYUbnPmmakWn3AZgyLVvgDmy6w0rW
 4B+9PazOBmZrbkCI1OS9I74EJ8VDV3c=
X-Authority-Analysis: v=2.4 cv=TKd1jVla c=1 sm=1 tr=0 ts=6a9ad58b cx=c_pps
 a=4QxnTjFVIeqV5CvpKlqXuw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=tplSezc-QveuJUrXqLMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: U6Jg_4Mk9g044yrVtkDN8fta92HbVE6A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEzMSBTYWx0ZWRfX5IC4Ufsxjxzx
 PpHEcvjT/ndmxVQHx2QiLJy/5ymfToBvQkAyAG5hfI+ZV6FlH8jzFHozwRE+Sw+dDQTY5KIIRK4
 3KPXz+xGgkFurxirshBkjW3FoX8JC8xZ/AsYuRp/OH+bywl5/C+7ENF6N2H2HQmT9a/+UvWRP2Q
 PWg9BQFnzdlaisanNYSte884kog/LzWkrCgGRVaynn4W91YLhfNZWJr0IAZ+SI5HrrlGDqBCE/I
 rSLOpRxSx/z4VJXYXpZNHsHnU6XwEsLfTx39ewRMOBwUUx6A1p7uYOqDDt/eD9d/d164IHvc18z
 rYrzWQSV7RrUy3CgatsdOSzNjHCO6g5l/lao0w9xu4M4rStDAUvlSPzARxPGZecK/dOQYMN1VFO
 EcBY04cxj1vvj1wVtDt1hxC4WUZwHey6so9SA7utylY/ozWsqVRUomNZlgccN+Qesj+CXRpqF2q
 8ISwP2f2R4of9ooZlAQ==
X-Proofpoint-ORIG-GUID: U6Jg_4Mk9g044yrVtkDN8fta92HbVE6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040131

Thanks for patch Antonios,

On 8/31/2026 11:39 PM, a-christidis@ti.com wrote:
> From: Michael Walle <mwalle@kernel.org>
> 
> Add BXS-4 GPU node for J722s/AM62P.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
> v2:
>   - Reword commit message and title for clarity
>   - Resend patch, missed merge window previously
> ---

Link of v1 missing, In case you are doing v3, please include change log
history.

>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index f130c7cb998d..e36205eccfc9 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -1111,6 +1111,17 @@ dphy0: phy@30110000 {
>  		status = "disabled";
>  	};
>  
> +	gpu: gpu@fd80000 {
> +		compatible = "ti,am62p-gpu", "img,img-bxs-4-64", "img,img-rogue";
> +		reg = <0x00 0x0fd80000 0x00 0x80000>;
> +		clocks = <&k3_clks 237 3>;
> +		clock-names = "core";
> +		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
> +				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
> +		power-domain-names = "a", "b";
> +	};

Could you check once, if you don't need some assigned-clock-freq.
and good with default freq ?

> +
>  	vpu: video-codec@30210000 {
>  		compatible = "ti,j721s2-wave521c", "cnm,wave521c";
>  		reg = <0x00 0x30210000 0x00 0x10000>;
> 
> ---
> base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
> change-id: 20260831-am62p-gpu-node-f041d03b5159
> 
> Best regards,

