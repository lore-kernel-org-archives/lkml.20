Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0C43233E8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790971074; cv=fail; b=a4Emi5vTRvCyDfX1IQA6iKCvR0efVmMjpEFNT1bllvBA1MET0iiynUhHOVHAdfEgWGcVxfSdNBKSCFNeVIjyTmja52saVrr1X9bme/Hkfz0USKe9OZe9BXgsDU5IQYvsuAhD7ffCTaAkgS0H7hFoh+NR1EKGMD8ptJG0jff7wI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790971074; c=relaxed/simple;
	bh=DzYckoMj7M3Y2qCIg2sN6wEz9GYeFnq0n+z75hXUjS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d0l1f6v5+ly2V9jMD44g50UbLQvbayTLev0f/Zn8LMZ5Zdp/LcsWSgy5TOs224w5+tisdxEJ0BfC6gUupEYWf6ynbz9WJ/iw3R598srayiQT7t0uIge5cx3ISrVBUOBdeNfHiXzITln4k69f4x8zXIkxJGj27zlupQ3mx8aPScA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=I9h4CLmD; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=povHIJxh; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="I9h4CLmD";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="povHIJxh"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 692H60uZ1176378;
	Fri, 2 Oct 2026 14:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=RlkSdJ0MhNMLZtCx7gFaCG8x5oVmxx/p7Q6O30PrW
	NU=; b=I9h4CLmDU03N5zKkCSx2TjJqQ0BRvq24LeaZqs5nHc5i7lcxPJxIV1cxf
	OrhAGj7ouCEcNKC+iyCZQRrOz6aiIQDXOp9wD8u9NCb1g1RVyRI3iFZiQP4+DyPP
	lpyWVkqMF+X7o3lNA5D8c34Drj9z9P/i7lMtFhsEq+R0+iryBhUelz4qQu4d0IFl
	DLu3tc1PEkEOYnuXKMc/CyqRBVrr0dA12btfjrlKLBej1uR1tqMOOL72lOHw5LsL
	N1+U/WDTp9Qg8v45PI7wcirU2814zS+8FgJeTWnR7WES8PuOCwlrFpjOMp4Q5BB9
	iJp9gmAB5l2xsp3oklocP0ejwizXA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012029.outbound.protection.outlook.com [40.107.200.29])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h2eym1ue5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 14:57:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1x5IpEgwZPThI2cTRiXPQkGgQiplJTwRRbIk2iRiFGkJSByU8p5BMXfNhxaX9j7wDDV42i4eRdKyzo2WSMzIbH7N6AQWsZWg28U7E37Zqx83GiBgxKdj2rs7LTh3U7NIQR1QJT1jx0XQoT+LTM5oAorcGFRp126l+G0JvZiSoZZRA4nDzvOLNPbsd2yQc0Jsf2gkFjb0uKRsmJRYxacmg/CknEUIaUoX9nZXfKQopJkoo+Ve5o7+xAV6YoX4odNaFTt0zaDLm8xyWkXHH8bxv+VZCcqHazF87dJriYQbZYIrmMnDot8/eTpp7izSB7E02HDsKUtFPLRvQ2y3w8SLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlkSdJ0MhNMLZtCx7gFaCG8x5oVmxx/p7Q6O30PrWNU=;
 b=U33M23ilqGJs+XKaL/W9/hsSS8kjL9JROBZSU9WJenOfAsRq81HbIBEN+vqabSkrFoFfxtcnqhLKNDQne1pFTJTlfclAlnLKPbNQoNA5lZqM4EVkmiz3ocmkPkTwC8D1ymvfZX/CwyrsbWy36L0xFlnDARqhajT5DrZ7CRNDVzy7ZvM0pToWAxR/Wn507i0s2AGY1clxkQJ6a2zXU61PwoOXm0kN2cXZtjRYP5CUgeqieBTKw4VQNBU/amsQxQaHXJxQ8/qj5LHkL/FY4Au9G+vw4vhWIWZX+syydUOpLqM+JwLutzASD7XHEpr354z8omaAMXXbj8bvSWRT4fREiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlkSdJ0MhNMLZtCx7gFaCG8x5oVmxx/p7Q6O30PrWNU=;
 b=povHIJxhUFVvgvpLiEAj1lJHTfrGU+tzj9+ACW+3hW5elSWTUZBF8X4hL9yaFs8G9EUGAlK24GGq6vj5T/n0Bgp27d1ySQ7WTljcLIxZgbSs0KN2o9V/WkTbATvfuX8p/jv2K/vS3vC+dwy+xrUX7hMpW9aHUHHXYCEkHxzmAtw=
Received: from CH3P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::18)
 by SJ0PR10MB5582.namprd10.prod.outlook.com (2603:10b6:a03:3db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Fri, 2 Oct
 2026 19:57:48 +0000
Received: from BN5PEPF00046988.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::99) by CH3P221CA0019.outlook.office365.com
 (2603:10b6:610:1e7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Fri, 2
 Oct 2026 19:57:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN5PEPF00046988.mail.protection.outlook.com (10.167.245.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 19:57:47 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 14:57:27 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 14:57:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 2 Oct 2026 14:57:27 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 692JvONB449241;
	Fri, 2 Oct 2026 14:57:25 -0500
Message-ID: <51f24dcc-dca8-4530-98f2-4304c41f8e48@ti.com>
Date: Sat, 3 Oct 2026 01:27:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: ti-msgmgr: Read exact number of trailing
 message bytes
To: Andrew Davis <afd@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>
CC: <u-kumar1@ti.com>, <nm@ti.com>
References: <20260929200159.4033010-1-b-padhi@ti.com>
 <20260929200159.4033010-3-b-padhi@ti.com>
 <170f362f-b64c-4b6f-9f74-ccfc4cce7d9e@ti.com>
 <de6aa05f-2226-4d7d-ae95-4da24135fee4@ti.com>
 <6ccdd04f-884a-484d-8b56-21dfd07c691a@ti.com>
 <90724400-bec1-4c3e-806d-8a831f705ced@ti.com>
 <61f81232-6e78-4a5d-8dbe-c0ef32b5ff37@ti.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <61f81232-6e78-4a5d-8dbe-c0ef32b5ff37@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046988:EE_|SJ0PR10MB5582:EE_
X-MS-Office365-Filtering-Correlation-Id: 512801b8-4fca-437e-1057-08df20bf6ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WOk76kcsRUkHaJMACYnKjb7c/cFGwjQy49d4OkUG7az14HgafhKEsJlhOw3zilYSWw5CB6RitW11zWKL54db2OKJ04EdVH0Qq8z8Qa//S5K9WKt8OB8Z8xFH4Xsf+AWMa4mchqKVNelLhIhIqPH+DpGt+ZmTrahCs1D7+wWPa1FACBj+M8RhsPKwZY/21xdjFcORPxUuL8IOvNCVn2/2y9JvCHC+vlHD5CSp911uNfV4JfExdzd9U9sGKo0OiMqHQZF++IiU/+X0kDLKFO5WCp5wvddlhmzQvl071UQhuDEIbFBxXzmt8nTmRkBUHICNMgGRJ1xuzqLjxK0BRHwVc/hPXe/cymnEaC443/ydRKaDa31C7Vx8D4vdZZgYczbhtfh5LlECMxoXbFzxY3ndrg8txCV7jGxbMu1/DGb1RTgEpY/nOAmrRwC4ZByvIKzO0CVqyhh/ffLXa+ClAIRHqj7BUsF9pFmDCY+yZjwasB7PyEyLUutA1yT2KczkN7HpnCcxpzjPAh/BVUF/IWFBJZ/Hf+fgkIEmeDxVQXfsEWTopocw3QAtcOhJLx0dlpQ5FIW5gT4EiyJSrxhUPWVvRNbN8vKd5+qgMSHjOyijr+w7JHbX9bPBNAJd0H3JEzh9KNG4hFiVKCwMU59Ajr74VjcIm8+X5azGp2HzSb8E3fcUiE7TuXwEBN4Kn3nuXnr0PwNLibMoWVCzsjQ7OgxaRA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2gXF1hC2dvg1THTa2+q1oXE1StjBHFXRjujEL7PFJ00x5B96IC+krQJwgRK2YBFh29syLrnCv46yNk1V/+e6K+n4oaLDREsl23aVX20pk81rzUIVtluCPUDdhcaWBA6xTSdzCOTTnEV32voUvlLDWlHVylHZk3ectNaiCO3YwYw5gKAiA4NhzwkUcp7n7sfceNtOOT5LatRbG0vK4QjSswHsIC8ym5nfUXpXNwvNyHTLEBHvLKsF32KYIRGhg6HsBEb7eJiZvovrTNWVG6c1cL5udgkAFMXtupYS9LNFo1/cWOV9zqTQIm+l1p4OGTD3jlQQLL8vnklXvFiv1yX9d3G5nzGdJAOt1uKNTi3bGOKxCekUYhDgEUcbURcNKyPA3GoSKQjb/WNF735k/9ayyQYeiKIGHHDGss6Xyh5fgraMztJgZEmhCGK5YJutbtZb
X-Exchange-RoutingPolicyChecked:
	2dAK2w/sfYCiBtDJvXMhdSWFsBoe8QKJrF+a7M02LFxZpEPLIPTvOGejjrKUXbj1CjxLUnF1n6gCcpFmJkVK8uFPGFx97vrOFXjuJmFjOVLr21062gZsWL93L6aP6G4g7+vEuwxGmnFTiXd9mn/yh/4uiTE6woqfHMSA2UOqHppTZxcE3kfHFoTTahOJiPRMaAB4+EDhM2cQxAoktyTugGeLNYN/tBpgMSt0EZfYaEYeivSzLrNAF7mZJja52bL78LkVp/O2Va1SMlYP0/j7j+fGT2u7DTujfQ/bxqmRNoPTUpcJyuNbBMdDlUCyQLG9vuSYv4q7qz0P+EBCJjFYoA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 19:57:47.5851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 512801b8-4fca-437e-1057-08df20bf6ea4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF00046988.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5582
X-Proofpoint-GUID: BOOpBWDPKbRt7jOGlsfMJfV_T3UZLNvB
X-Proofpoint-ORIG-GUID: BOOpBWDPKbRt7jOGlsfMJfV_T3UZLNvB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OSBTYWx0ZWRfX83Kjjlyn0Uk0
 vEtQMgzZ5m/EUqfFGBL2GNrgEOsc9/QsRYG46i5R1cxP9efC81L7JfeExRFdHUhUysHv4TBCqhG
 mA0qQu7OCOkInGBzcRXbl9VCyoDKyRB+ugiaS2cZ8DHYhZdnlPMgkLfXu8XatNuVsE9NinGm8wv
 c4/rZuihWK8P1Py8C/utCt+zcaxtInRuF1vrqs74mIet9p2KLHTW10zA34NK1P53Sr4mFAEOpe5
 ElG4jRDfbE+oOjcjLIO9V+vz5dS8fYk9bjeeQUeYJu1UThvGCgPxSkRLDIlcvB3xP0hQpHpxU7i
 5k9N4AOWbNBulnLBF30lG2OCkerjVlyKy/mrir0yGXG8TgJW9oWbq2/v37DrIAXcTQaCdiUWC6E
 grcrtsojIn7MVh1/ohops1yaTeIHOUd++uei7NYl+6pZ5QxDyaLQTqaGeLa96+djpVlGHBJsJdZ
 dQWx82uZ69HBTaHY6rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OSBTYWx0ZWRfX8X8F+m8vpLWX
 SLBYTKdB/FEOBqoZTUnnnNeAKVCfDTzFHdPxsZwXxUKd4YoUuEyVc1vBvPEcTLT3bCXj9g9qwj3
 /V/J6gSl34iie1LZUw6jmSRPoOP+iN8=
X-Authority-Analysis: v=2.4 cv=UeLE26SN c=1 sm=1 tr=0 ts=6ac00cbe cx=c_pps
 a=6BjqzLHNfcmCQygjyc7k5Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=b3sNpsoHgIfRlRqcKaQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020079


On 9/30/2026 9:08 PM, Andrew Davis wrote:
> On 9/30/26 10:11 AM, Padhi, Beleswar wrote:
>>
>> On 9/30/2026 8:34 PM, Andrew Davis wrote:
>>> On 9/30/26 1:37 AM, Padhi, Beleswar wrote:
>>>>
>>>> On 9/30/2026 9:43 AM, Vignesh Raghavendra wrote:
>>>>>
>>>>> On 30/09/26 01:31, Beleswar Padhi wrote:
>>>>>> ti_msgmgr_send_data() copies the message to the data registers in 
>>>>>> u32
>>>>>> units. This has been harmless so far because the clients (TI-SCI)
>>>>>> always passed its preallocated message buffer, which is sized to the
>>>>>> maximum message size (60 or 64 bytes, a multiple of 4), so the extra
>>>>>> bytes read were still within the buffer. But, with a later TI-SCI
>>>>>> update, the message size can be varying now and not guaranteed to 
>>>>>> be a
>>>>>> multiple of 4, which would trigger KASAN out-of-bounds reports.
>>>>>>
>>>>>> Therefore, Build the trailing word by reading one byte at a time, 
>>>>>> only
>>>>>> up to the message length. The value written to the register is
>>>>>> unchanged.
>>>>>>
>>>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>>> This looks like a bug fixes and needs a Fixes: tag?
>>>>
>>>>
>>>> All mbox clients of ti-msgmgr currently send 60/64 byte sized 
>>>> messages. So this
>>>> is not a bug today. It is only a preparatory patch for future mbox 
>>>> clients which
>>>> can send message sizes like 19 bytes etc.
>>>>
>>>
>>> It's still a bug, even if no one happened to run into it yet.
>>
>>
>> So should every pointer be checked against NULL before dereferencing
>> in all drivers by that logic then?
>>
>
> I get what you are saying, but in many cases if passing NULL is
> allowed or not is an implied contract between caller and callee.
> In this case the caller explicitly states the message length to
> read, and the function doesn't respect that value. Which is a more
> clear case of broken contract, and therefor a bug IMHO.


Ah, the beauty. Thank you for providing this reasoning. Being able to
back your arguments with something so concrete and correct is
something I really respect about you.

Thanks,
Beleswar

>
> Andrew
>
>>> Probably good to add the Fixes tag anyway, just in case something
>>> else every gets backported also that needs the non-4-byte aligned
>>> reads.
>>
>>
>> Fair, makes sense. Will add Fixes tag in v3.
>>
>> Thanks,
>> Beleswar
>>
>>>
>>> Andrew
>>>
>>>> Thanks,
>>>> Beleswar
>>>>
>>>>>
>>>>>> ---
>>>>>>   drivers/mailbox/ti-msgmgr.c | 16 ++++++++++++----
>>>>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/mailbox/ti-msgmgr.c 
>>>>>> b/drivers/mailbox/ti-msgmgr.c
>>>>>> index 425d5f9d9d0e3..44457a896510f 100644
>>>>>> --- a/drivers/mailbox/ti-msgmgr.c
>>>>>> +++ b/drivers/mailbox/ti-msgmgr.c
>>>>>> @@ -425,10 +425,18 @@ static int ti_msgmgr_send_data(struct 
>>>>>> mbox_chan *chan, void *data)
>>>>>>       trail_bytes = message->len % sizeof(u32);
>>>>>>       if (trail_bytes) {
>>>>>> -        u32 data_trail = *word_data;
>>>>>> -
>>>>>> -        /* Ensure all unused data is 0 */
>>>>>> -        data_trail &= 0xFFFFFFFF >> (8 * (sizeof(u32) - 
>>>>>> trail_bytes));
>>>>>> +        /*
>>>>>> +         * Read the trailing bytes one at a time instead of as a 
>>>>>> full
>>>>>> +         * u32, as the message buffer may end right after them 
>>>>>> and a
>>>>>> +         * u32 read would go past the end of it. This also 
>>>>>> leaves all
>>>>>> +         * unused data as 0.
>>>>>> +         */
>>>>>> +        u8 *byte_data = (u8 *)word_data;
>>>>>> +        u32 data_trail = 0;
>>>>>> +        int i;
>>>>>> +
>>>>>> +        for (i = 0; i < trail_bytes; i++)
>>>>>> +            data_trail |= byte_data[i] << (8 * i);
>>>>>>           writel(data_trail, data_reg);
>>>>>>           data_reg += sizeof(u32);
>>>>>>       }
>>>
>
