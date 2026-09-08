Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6A551477F;
	Tue,  8 Sep 2026 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863900; cv=fail; b=qR+wfNbQbZGC3dWccxAwb+nhlslj5J9sXRAQS1KwYqZIQIydq2khuBS8S2q4S0nUMvDOhRiU2rbhOMFEmgXof208ub2wWeBnm3ZRbd1HQ55mMW+dQEuZAGyFeQbEGAdE72lTWdNPiDes9HQGRurZZH7ebIGbEm++i7wvPqyncQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863900; c=relaxed/simple;
	bh=ER8V3uKqsZws/pBIlaXATVeQHCYNVWrIkKGFsYx1bII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eX4FMyxtKNdoIxT0aasv4PIs5R69HrbRP/SsU8GJQ7DsG//uaqYuFXOBupSeS8Dg2GW/Qs8eR8Jwpow/7wc6RD2QArlqvxm+iAKeYhBCHkFiLGzijSw/RgjrvmUFpyR7mbu/lzV49IN9gGsiObbg98SDAFujbLpOCKgwoJ72Rn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OO7QNhBu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GXdaoaMz; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OO7QNhBu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GXdaoaMz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68840ND82350625;
	Tue, 8 Sep 2026 05:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=MTFM4xWJifPEakTR89v4Tm5r7ixT+GK1UNqAc/aVnt4=; b=
	OO7QNhBuKJj/o3+wbgfK1jyRQFQ3eWsxdf/qeJWpLIj81Pu9dv1KJdgKiNFv/5gQ
	zvOol0j+wQpiq2R2xDcBemS8BZYMZ0YK8eP7+Y1Glc03EAGLk5NQy3LKcSKTa6Dx
	Qn4XNiMlYm8ZO/og7ckVi9HF1plig9ylk4IW7hqRqXvsRRmfv5t+6F6xmnZZ+5Sx
	vpnv40sgOY5FhIMbPG+LjJRUSfE48TlqyJov1ht30/j6WgvNPToHs0MtdLhj57kO
	6gemg+sVnCOfRrRD9KJHK3r7pxS6utzDsjZvWuYmD7eWLs8pVzeG4KIAqvc3tlQ3
	g3gBAM0nS7xlvXEY2/lSNg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azhn15012013.outbound.protection.outlook.com [52.102.136.13])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgju6q6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 05:37:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwcI7eRkb+mrbOjsVYGdm/KNC6PoRG03PUW9me2/CY3sz5DbRDW/XJ5D0I195ackRoULSWa4FmBkTbujgNoSWeAOkxLF7ZeM1DhhFb+fl2G3uPT/ScD+O8juw/BmsAGytCnATYi20yOJYKSd3IcxaJgqZpZN47zdIeEofEQjxnpExP4HLgvlSR//eKc8ijQ1hJjbuq8nLlKMc1GpTWriV8lllohcAJWZH2Bo5coWhs4Siu/s0+/3F69PWvczt7D7AX9OnzuYICbD8I7fJyOEnS31exuVuUozf4nbaQ4HRgiqsFBqzkZ1FmQ1SvWbM9FOmICbk8H4Di+RLCwlhEC2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTFM4xWJifPEakTR89v4Tm5r7ixT+GK1UNqAc/aVnt4=;
 b=XMFBsNKNb/+8KAV0BdSOoTVhaMlznD6BHRZwA9i61HFIfnU7DMl4fHmqCdytmFH5wMDpj1slP3Le9qCkZlDEFdIVrvM+ZHsN9mNwQe4e7Hzzj+PStu0BFqv0GATNGpEu61YdXnrSsWhCbABLEKR9Cz+Yskpx4yyeeDPNIIgTdxVCNRGk2+ZhHCC1OBOSXZNiVH/DTl3bO8+ThJOmricKV/vHgAhY2r5cE6iwHeypcol+foE/FWLg/ATlQa/fF8sSsMlBV0HzY/HbojTIdsRDiydiI50GPXteF0DQNuPHNMfDVNEm/8stFPbp+2EJlpP/sRmmE6M+uhWwRURoVw2n0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTFM4xWJifPEakTR89v4Tm5r7ixT+GK1UNqAc/aVnt4=;
 b=GXdaoaMz1+3aOK3E7AHLxs+Fo245wDkpmTm2rdbYNNR6oB4FH+80ZiB9jw1W4Dyt9RghIWzebrHVQhMEGadVlRO7HU7s/AU2SxfcR6TBtHGtf9Lt7UsyyeQqFU/6UcF6mZXXIJy308zARgQWJLg9FgGGdXZWYPxcyg/nIv/pUGc=
Received: from MW4PR03CA0158.namprd03.prod.outlook.com (2603:10b6:303:8d::13)
 by PH3PPF32277437D.namprd19.prod.outlook.com (2603:10b6:518:1::c10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 10:37:37 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::22) by MW4PR03CA0158.outlook.office365.com
 (2603:10b6:303:8d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 10:37:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 10:37:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2B0CD406543;
	Tue,  8 Sep 2026 10:37:34 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 142C8820247;
	Tue,  8 Sep 2026 10:37:34 +0000 (UTC)
Message-ID: <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
Date: Tue, 8 Sep 2026 11:37:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|PH3PPF32277437D:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c0d87b-2458-47de-edcb-08df0d9532d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|34020700016|82310400026|61400799027|23010399003|36860700016|10067099003|4143699003|11063799006|56012099006|16102099003|22082099003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	iqu6jfnUDbv4YNi3zyKz89luhezNGam+EAz93sx5NPjjSWhg1ZIEpj5T5ReXozpE3KSzQeipX86xGxeinZUNil4OPewVlv/po4CVofmwarPYyRvf8F6uuSB1cooJgmQwhWv6Yl7rJDhFMQIGm5cMRX1Jlki4NH5obOcw8Io9C87FsOL+dUh8pacG5uZjsHFq2TewHe+bX//H5xga3afjj2Wu9643h7t40a4z5Buw6NFZqIcNr09FJzaSYZCYMIktkw12mI39UB9Y9MaQwkPyckIB3o7B05O2IaTjkXKIxmX30etot34oxMd6oszwK9sD5m21MCojrVEgjyofWrFW8+pDBDr9u3vVkNyJg4gSUajJZ3soimDDiUgwZrsSKR5GjmsKBBVrS7qljjM8i6u/Sec9PMMBLYrzurNSDwVtQT+PWeqSY6Io/TEB/TY28fFWQGyrBuO3B72dNpwrElrlZBoQ/TEDO1IzABdK7LjQ4OrGOp5UYv6zhZf16M1gJYfUOYGwmysWOZO82g+Tm8HD3O7UObGYxZ5YOWRX85E4GaSHEd0/0Y51vk1b3gKZhrAU71CsKyfw7gghbcVnFY2aF/anTgZl6X0XzOj9QkxWDLMeHxvfUA5pTPnEWXYyMcL8Mmmh+hazH6JbwdpK4x/9XWf0Qkm+o5GKfHHhiS5cVH7AStI/sA3ZzkJB5SYLNWgxuC+WoI69rcFiTVfFKRzQjg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(34020700016)(82310400026)(61400799027)(23010399003)(36860700016)(10067099003)(4143699003)(11063799006)(56012099006)(16102099003)(22082099003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4qyeGFOsF8pr69trtggbSH1MaW0TyxmyhxXMaqSC8RR/8DBbdLeWHssJV3di+0UHpjVvowRngyMu0ekWVzZmk3twblUs98zoeMJ3e6xlVh8/sp+B3y0dYxk6TkPE9k4T/gpNe40R0trbOSjuA8jdrTypTTNvZvr8aHlIjnlPbMQw5V1q8juVWZSc/y2jYSTiXWr9j8xfRjoty4qna5/EwDzZPwq/r67NiySWPfngshujxMKYk7dxYXBaq/BQMVt2KwlorRvomJWQ63EaesHBg1uQcjLTOsl+eH6DzYyfVwX/LgvK3X9YTNAR/cwsslC0BU+2V00hvEd3qf3GQEKXqrqZ+tR95FhWFGF8Z001IZlO+HaQYGGMsr6rzebR2/PhRXLc2r5xDWyLamIWii7CltI6gvW539Zj/kQZh5pUatEpLjT3CTQ14l+u5hqCHECC
X-Exchange-RoutingPolicyChecked:
	ROmDeL3ga7EXGsJYGYKg6ejBF5VL8RwB5l0UdjtlHu0TJ8uhU3uY7d1vaW9DpQz19gdOv8HbOsPwzsDuWUSYTjexHt1okAolLRYA2PGFIK5UFDd1qgjk9nPVUEgUNtFpc9ADSYRRvQqi65WWrUPZspNDz12Er+MNR2+Gx3IAs8aCLA+LCY8Jn3C+5OoQM3JqbpCXJU2qCYW2NjAOX5TLYwsCFzh72BZ+mS9SpEQeVsNvnQAHfbjLX6b+tKBR+XfiJpmMoG6rkDmDlgt9Kqvy56s9dryIfAW5k3oPI4/kDjRCjxhiI4A8hyZOzMvSx0GEGvzKeKWEtQ7vAy1hs8bsTw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:37:36.0862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c0d87b-2458-47de-edcb-08df0d9532d6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF32277437D
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6a9fe577 cx=c_pps
 a=JBO1m3OZybHMqBf15U+9pQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=06WyV9Ugvycfi6l5TIgA:9 a=QEXdDO2ut3YA:10 a=jZz-an6Pvt0H8_Yc_ROU:22
 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDExMyBTYWx0ZWRfX/LQjlmr/CycC
 YsGWz3SoyVZzDTtylakpGBlavuKwfPqTQrD5eywck3iSFZ0/S2FOgP1b4kR1OMIvx4fvuiFnKbF
 y6R+32ddCQh4que/1hAQx6TWMM9WiirMN10OT4Sc2LFUHXkKGEAcDukYjbVwfdBzsCqmIn+SQx1
 5JowlQHH/NAyfmQNBS2Kry9O7joz3VkSiUBpNKbcxHJnyJZRaVHm8OCxuREyE3AASO36TJei/I+
 i3c3xhoRLm0hFNluaqvcWNesj1P2uahXgemBtREWfIPYgyvat1rZFKpjaZ+aiyaC62zbQs+aqcT
 lcK+LbJEN4zjePeBge+1N7sgicqRF48Yc2omhD4m3rteXeuEFs1dCzVcq/+BjupqLmbB73CcSuV
 YWjt5NcHWCtdMW/RmL0GrxMNiFqSqmmeo2M+159OpwgrZHxNJLwsFhAE/WDkjqCMh4U4C2bl7Rp
 ZCN1yTQJV7W17xGrdsQ==
X-Proofpoint-ORIG-GUID: hkLAExi7dHVWciGsR3dU6O0TcGNXq78Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDExMyBTYWx0ZWRfX43iREX9w/riI
 iuoAnzkom6ekiJRo68fi/+Z7O45kXu/cglHk8gW83kxgmDAQ6UZOfrh0cxfKS282n+nJYdQ3noi
 VSp4jBKA00xETuJwb2Okk0tIbyZIiwQ=
X-Proofpoint-GUID: hkLAExi7dHVWciGsR3dU6O0TcGNXq78Z
X-Proofpoint-Spam-Reason: safe

On 08/09/2026 10:09 am, Srinivas Kandagatla wrote:
> On 9/8/26 9:49 AM, Charles Keepax wrote:
>> On Mon, Sep 07, 2026 at 11:37:49PM +0100, Srinivas Kandagatla wrote:
>>> On 9/7/26 8:47 PM, Pierre-Louis Bossart wrote:
>>>> My take is that rather than encode all properties in C, it's probably
>>>> worth exploring a DT representation of the concepts that *can* be used
>>>> fairly easily and make the life of codec vendors easier - not as a> literal translation of ACPI.
>>>
>>> I agree a DT expression of the *concepts*  not a literal DisCo
>>> mirror would be a better A.  I want to bring that back to LPC 2026
>>> DT MC as a concrete proposal grounded in the earlier DT-maintainer
>>> feedback rather than re-litigating it inline on this series.  Because
>>> B stays put, switching A later is a change inside populate_function,
>>> not an ABI break. so landing this series does not close the door on
>>> the representation you're asking for.
>>
>> I am still not sure I really see what the value is in a
>> completely different DT representation of the DisCo information,
>> all it does is give us potential issues with future spec versions
>> and create a whole bunch of new code than needs maintained. The
>> ACPI representation translates perfectly well to DT, should work
>> perfectly fine using the existing code.
> 
> I totally agree with both of your comments, there is no way we can
> replicate MiPi spec into an different DT representation, this brings
> both maintenance overhead and is fragile. This a very big effort.

But in your previous message in this thread you said the opposite:

"I agree a DT expression of the *concepts*  not a literal DisCo
mirror would be a better A."

