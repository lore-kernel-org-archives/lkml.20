Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057AE43A806;
	Mon,  7 Sep 2026 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771292; cv=fail; b=rqHv4KksUob9xpHoPZSMdFW/lbQ+67FDrCqcfz38Zfs3lBaNOgnwh/Xl1NJWmnGQgmM9vy035eJZPywEoy9KYcTXUST6iEvEeW370kYsKuSx1FlSA3x+lQvb5sVSx0HgGVUoxp6RqssSzUuVTt7igt+X2Im/WkT3ZP/CEPrYuok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771292; c=relaxed/simple;
	bh=KvNeaXo6GzDLuswQfq39puftq641aovU+AZAYFSU0Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfx+SwiicL6OxYAUsgEdwxiwZ87ymQh3KBKQe7Cm4c8NinPshPdzdpGNhhHqoI2fyhTBc7nrYE4t81znNdJHE6W5P1XkF+qYHd4sbHQqAafJG48SnV1+47lrXET3zPzdqC/B06GytTBO7rrKCvSGN9F5gUpGsdA/YUIzs5slKu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FD3vA2i0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xNw7ky+t; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FD3vA2i0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xNw7ky+t"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6870kuU53788198;
	Mon, 7 Sep 2026 03:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SCid0yCsHbbAjE4NWKLFjTgIDBKFbHTZUtkUFNevxTI=; b=
	FD3vA2i0nJEMlKgl5ZMk2r2B8A+wFuyZ7aPPVi6HuHPFiZERSBW8mfOd03pqA4Mf
	B4HguS6gqTSy72ohMpt0qO133ymqB8QnO13/7Hsk3s1xZQPhuWxv1s3qRHxzBFpH
	HDGcfoy/Tnb2igiMpYupdypGKJCf44SEocaekuj/RBOUpMfOTcNhkKmXlAbSU5oh
	dp9ymYLyW03e3dbaSVaJhdj9XWuUFjpTxruc094a7V5446VurJhR4O8ZBVb/GxD5
	p8TufDVzrKrZ2TCA0KRRDRD8H0+5dUJuy0R/+eOT1VtYnZ55n5MPRy7FCLbm1RSv
	ajqJxVlTwfmm34/yIEOonw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azhn15011003.outbound.protection.outlook.com [52.102.149.3])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjsqn7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 03:54:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcsED20M3d31m4F7ijEiGZ0sAuEiWB2oAj4h7+t6M1IDlkqVT6h99xWSwI5uZ8+o3HRlZtK+dcLXci1Zxb1wzgTDv+mSG7KcIhiqP/cYQ6LSkHoZbcD9fcz2AmMSZeYAWu3LazRP5gd8ueq3Qiy9AfKSLCrwua9liI9yhEasPKqR15udx3Xbl0K8iopgZTbVAMUYVAx9DaCES61XVM6iyyRbOKnupDyTkWyGRewG+dFjknahnBfGJE0h2IL4NXar7bBxQ3FY5L7sQTvUmwExW2Z8V4bxnirmP+CeldvYoAt6/bXrD30RKAr7Do0gcus5f+LtqWk1oIb+2KQ20bXU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCid0yCsHbbAjE4NWKLFjTgIDBKFbHTZUtkUFNevxTI=;
 b=XXLJfXCh/i1pkF9IzEvqXXaqqRl5q+EpO7qIvUBTsvrxw5eg1VCgIueMtFdXpuQolfGA2fSlQIC6Z9ZOkyWkuzSkJpguBeOZtqVLjfkYve2Z7ZC3RgVCy3YA1RwecOr7f0VsPxaBx4DRBzZcQnBKLxsbmQ4lPKEMKS2kTS5uDE5TX15RRQQRNUbERFcxGbb0RTj5fiHohiGrojMu9gIpwPCMdL8psHx6cftZgOck0aCvVbdfWU3WxAZr8zMG3cxnqEmwZ256G7Qa8+RLGSW6aXFfDfdYeCgZRTjPQVuin5du6EB4j3K6SlfbAGectlHIqh225/TsvYKnjEmS6BwURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCid0yCsHbbAjE4NWKLFjTgIDBKFbHTZUtkUFNevxTI=;
 b=xNw7ky+tYtqHItut3bKZ1HX04gtCw0uXdXLZvZe2XXQrAYmAcPv0yx4Gu0t3QKgPiK9Y27PRCgf1dnpTAOYMDh9FoCEHiBl/YGkGzt/BIPjKfw1Yz/5dv0ATpARP6wGiS8sV334cIKsTate8DHrNLd5RlhFYqgeLliMsKV5yhx0=
Received: from BLAPR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:32b::13)
 by SJ0PR19MB6890.namprd19.prod.outlook.com (2603:10b6:a03:448::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 08:54:13 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::37) by BLAPR03CA0008.outlook.office365.com
 (2603:10b6:208:32b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 08:54:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Mon, 7 Sep 2026 08:54:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6EF61406545;
	Mon,  7 Sep 2026 08:54:09 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 56195820247;
	Mon,  7 Sep 2026 08:54:09 +0000 (UTC)
Message-ID: <b1eb306a-ca6b-4fb5-93c6-7890a88e2689@opensource.cirrus.com>
Date: Mon, 7 Sep 2026 09:54:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] ASoC: SDCA: allow building without ACPI
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260907083727.733705-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|SJ0PR19MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 6479c72e-7fc0-443c-fbd8-08df0cbd9595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|36860700016|82310400026|34020700016|7416014|376014|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|16102099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	4Uk9c8GF+krTMFweIGNmfBN5JGahRWx0HhH5wotLEq0kAaNVA1RITEfeUmw0w7eZ7kwhsQlUZzJUkf8amdyMZYhz6ay8vhZvOBZ8Gy/nAtX4qiknYj/0F5rFSBSpdyAphTlmab1CiC4/PuX6ZM7hFV72zG7SVHnr1Hy0lMNZm1L1nkbDLvVKsBYWd6BCjT0wxTlFX5lMWH3IHw46hzEd0Iq426Rovgn3n4BcrPt5KYcurUANJZOX/TKOL/o6t0KW61xwkbk6LPZjFBCel4ixSczttrmGXkoC/dG04g7Fdtg8KiX/zkO5ZH69Y1JadZRWS84IHydbL+VUEFNGpnS7AJHAwjImHnX/Tf1CQYaEEMDQUH5Q5Vb2R6nsIdx6v9XdLtMM9PBMx0l7mqGuP8QTsgM3LKv/BZIWpr+B95VHKW3ptiaGhIuOFTwwuxKWHG/7R9YLXHthiyJyJU0OVBqECHdcpScLm4r0cP+b2ZeNRgixLfUu892FrSzQNdB0QPgTxQ8pMEzvxgUYMGIQ1esJuVN1RSMcP5duS7fvo6Z44wXm3l3C9G8N84cbIPPUIqQCRCSJefuDwqS7d4rW02aH+gWp5HbB14c3by0qL6x/x5Us9B42IOEgI4v8450/MstXrfg0Ay1iQsEfLEnS/6hnxRyjB+ePowrdKsqinm6ai65ge64vZtyNakzXCDZK6DEW
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(36860700016)(82310400026)(34020700016)(7416014)(376014)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(16102099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	japtfvBtdeXavyvN6ooLhLGkg6q/ShHcLOisTpbeHdFQ6bYFdAsH8EHZoa68i8Xlh6xkF8UUHcBgJZ2s/9x71LByF9t6ySgdjXY41BhMDA01cryRvPCG3UR6iJ27MyqBU35/ZdJSta3J/QZrw1HdIz8zmDQaKAgU8k8V+fBGxbR5C38fqdHNjDjss73MEZBptQCPwnP2rLp81zYq7TgVsZIdrawpHFvLmtmYLYCC5XyvsOQoySvgvRXJc+pMx0Wf9SlMYSs+2joW0o5zd0ozD4PD7ZGtM6cGJ9QJJUsaXNiSRcZa9QdWkMlo2uMbdvV29RA6pp4ARalyyzVikFavgoBzdayx2360eG34kx8ME2lSDkiD9T1bHqAncaRn/NhrHo0zPWMoMb7RXvbkr0edzSCN3WuaE4ozrsB45N29ehojd0mtqf5VwBtn1hFDGYol
X-Exchange-RoutingPolicyChecked:
	qNzqJ5qrazaASnygTSJDsKfgNafxDuXCCE6FHFYbHnrFrE4MxAXZkR9cHEAtHlXxOU58/ToBFoV3JbtyOm+18ojY/WHxcEgyAHDnCeB3qbWPUFd+COP9HWIEfQ/O18PArUObgE/12DpTphkWhzy6Ue+VZPBJ96BvKZFcWxYw2ybRwbb85NP1hnBT2rz6gtZKWNP9AqfXfccF9D3ozBl7A4yqmPSnWoGEB5ENhwhW1EReaeF7Yk83B5nQ6BW6doNdy2QB4g8oPFA0FR2H4Fxmtzr+j0D+XsxnkyuOVQ1Bynjdar+OMrm1FUVELU8ihjrJmdbd5cDYYqVSLo766daYEg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:54:10.5749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6479c72e-7fc0-443c-fbd8-08df0cbd9595
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6890
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6a9e7bbb cx=c_pps
 a=1DO7jTO3TJ1MpkKKpqwukg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=i7EG6DhO2Qa2drhGAPQA:9 a=QEXdDO2ut3YA:10 a=jZz-an6Pvt0H8_Yc_ROU:22
 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfXy+Fq2G2sBH/r
 ZHu7UpuQJ69G0O/uIWsjPoov0Z3hyj18dpC+0/aucl6/ymfw9nXzqfAB+z4TlKsCvbVmI2Kr2Gp
 pgj/cSTkL3PdYRurzlE+8lrdZYtge0aagpmzqVhYs/pCRnBKCcX2TCwUIL2dZ2jmrtrEbXIDeIc
 kARxBDMBCLjoutysQqa6ytogdkQhouSLwuHAWASFeHvzcNAqqJV+bITyyJq3HHUtyNOLL8LJOlS
 YvkBfua29IeioGxjxWSs2hf7OnPivQpuU5pHB13DXeVVKUgWzeHTwILLtuMyog/oe6MfrDTqnlQ
 pTueG3PXjNhaBpj1fib5njX94z2YKWZJwkfG82mdiIloE5HtGQdYg/1aw5o9lVYzwJDpW28fcqD
 wjo/gGgjzxXCpZLCjfzuryo9tLAR3H29q95eRqVIxu49MYyG+1mSrk0DW/L7SmqrmjKTP6DUfab
 EUw7CjWhih0jI/4xLQA==
X-Proofpoint-ORIG-GUID: dAtqEEvR-GZPcO2OFDW2mI96dEKH3AAd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX8D9VAAi71YaK
 M6dyboBu/1P5g5+cKKVcwR4vBDnWeq8wOehoYknlcooTsLNf1SuGDTxlkz/sh0M8nCEojzWLi94
 hetK9C2seAO7qav6Hnxgne5uicakBWI=
X-Proofpoint-GUID: dAtqEEvR-GZPcO2OFDW2mI96dEKH3AAd
X-Proofpoint-Spam-Reason: safe

On 07/09/2026 9:37 am, Srinivas Kandagatla wrote:
> The SDCA class driver is useful on non-ACPI platforms where the
> topology is supplied statically via sdca_class_hw_ops.get_function_data.
> 
> Drop 'depends on ACPI' from SND_SOC_SDCA and guard the
> ACPI-parsing implementations in sdca_device.c and sdca_functions.c
> with IS_ENABLED(CONFIG_ACPI), providing empty stubs when ACPI is off.

Would it be better to use IS_REACHABLE(CONFIG_ACPI)?

