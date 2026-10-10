Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D91F3C1D4B;
	Sat, 10 Oct 2026 03:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791601749; cv=fail; b=mmPDkzQOxrHBRVdF0zacvSeuzoefZSYSCoc5mfzH04gLgwMXXF+ZYA7+Q+b7yhZdKaY+o6zA2rLRq+ihjXKqMniK8YKeEMztZOY7uj6fSK4B8JRmcW9HzJEjNXCB3M/qVTnxz0C3ts8tTq5RCGcF1sU8CcPrwCZt32btv3jtSyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791601749; c=relaxed/simple;
	bh=KsuM8Pl5wU28esI3R1fPDzJeq1lmZI3oBKL9PE6UPe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UyMzssMVIZQdU6psrz93GHcY/QWImAfungcIjD3i+XHxV1wbxMZ1uADvVOBj+QXv6N+em1y9pdvhainqQUTh1NqGXKSr+1vY96iff2v1Fgmg59bRoNqyvucMGPGht7xYM2sta4bm29c0ei62419wVd27ZOs8rcTsFt/PlrEe+Gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=DNrW4bt9; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=RHOzQebt; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="DNrW4bt9";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="RHOzQebt"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2gmt2073967;
	Fri, 9 Oct 2026 22:08:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EdOK9ZSFLC+61rJeeA+cw/Z6LXvj9fSs1/MOy3orK
	PA=; b=DNrW4bt9jHk1IfQC0M1Fr1F3+ChdPy4OmwdAb2rRtOmu4tPrqplbPAyXV
	nzuR10ED1xC5pJfnCNiM0gVJI89trcPK9WVGDINCCNWOtXSImhgAb9NuQV8I3O/a
	JNG3tStMNz91Sa6JbJRT3abimd14caK9qSkCwK02S8YNE/wGli7yQr4/RtOmlDZp
	13w6/m2Yywub8DZICglnto4md9pzqPAZMht4NLGKhm7WP08cPM2jFAvv7+AAJnaB
	Sf1kA//TWZsoDSYls4j8ygfMETXdnwm/9RpF7ZjxEMddK1wg3c6xT8oG1pg98xzF
	u4nkvIb4fDAwBRlNvKW5Kqtk881sQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011045.outbound.protection.outlook.com [52.101.62.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h74uj2c8d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 22:08:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCgQ1+mMNYnUOQutUZ6P7CefApFwHhYu8N1c2sVDvmc36rMu38ZkSIrbbaOJVkO9aYHlo/iKpJpSQcbpOzZZ92mxunzDQ8JUbyBdAyfyAVaDWFAuEfXGcVFoaqg6/CE0P2RNaPDBSzW1GXjpbe7Nw2mKGK1tiEZDB5VE/wkGquHWN2eESiP3on6ieBeCYeKRrY4Rus5cliGZwSO7I2ZfbJnGLhtoOJNUzhBTL4uy1rIFMjldxDQGJg3ZjN67mf6PELDcBU+Mmg1ikNkY8AwOoGntKw6DiMDtEoem7Qa3MCj4/y4Bk6UW6//8gyUKidivzGDKlYODaZdtDfJWus8Qwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdOK9ZSFLC+61rJeeA+cw/Z6LXvj9fSs1/MOy3orKPA=;
 b=QBI7PYtsslv+2HMvKN8jxV7f5kttAkqTJlI0/QcMv2lBM+RyhaMq4SCToRtzXlGoatSzjZ87+ZNzXrHnzRIgNf/sfQTCXbTfvxAGSXXASCHnzCRSbcG0TAV/ofDEVcZbuhX5llXOjKbBTKgR04aevgZXT2jJDYPI3pgNLQ/NgqVMeskvmkcqusNxNcDfWioV9E5x4+j9YF4s7TkhRNdxEqev0I2Ci0EiLYp1OhYRP40blNrZSPai8vCAame3SL7yWrb3y39nt1LpFvlFp0PoRlFDaJVYPTOgINJjBEOTbUESqXUjRa4IKz3OQms9Y6nRmwUo18Pn95cHA807plbBRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdOK9ZSFLC+61rJeeA+cw/Z6LXvj9fSs1/MOy3orKPA=;
 b=RHOzQebt6RIkEpAWW7sSusFiLoX4+Jmvv8060t+f4YgoBzicc+OSmj1sJZeHAD07KzphQuYIFCbZeg4EswGqjPr8TfvBaogXfMrmX67dhPudYhptTLVnD3Wipms4U7FvTMO2KaueSvBXSul7Ilq2CYgEMM72oZ5HT+gahiLWDj8=
Received: from PH0PR07CA0027.namprd07.prod.outlook.com (2603:10b6:510:5::32)
 by CH3PR10MB6740.namprd10.prod.outlook.com (2603:10b6:610:144::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.5; Sat, 10 Oct
 2026 03:08:07 +0000
Received: from BY1PEPF00026967.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::72) by PH0PR07CA0027.outlook.office365.com
 (2603:10b6:510:5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sat, 10
 Oct 2026 03:08:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF00026967.mail.protection.outlook.com (10.167.244.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 10 Oct 2026 03:08:06 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 9 Oct
 2026 22:07:56 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 9 Oct
 2026 22:07:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 9 Oct 2026 22:07:56 -0500
Received: from [10.250.144.147] ([10.250.144.147])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69A37qjU2324449;
	Fri, 9 Oct 2026 22:07:53 -0500
Message-ID: <24f08aa9-079a-42e1-80e6-3aa5e74e6e41@ti.com>
Date: Fri, 9 Oct 2026 22:07:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] ASoC: codec: pcm1681: Add optional SCK clock and
 runtime PM support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu
	<baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown
	<broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla
	<srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-2-0c1897f21ccf@oss.qualcomm.com>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-2-0c1897f21ccf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026967:EE_|CH3PR10MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: fc4b4e4d-96aa-434e-7184-08df267bb4e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|7416014|921020|261009220027099003|261009223027099003|56012099006|10067099003|4143699003|18002099003|22082099003|261009223327099003|261009221227099003|261009221727099003;
X-Microsoft-Antispam-Message-Info:
	5eEOiwWTRmElDtbFNPi/4rYIrw+F1boj7LFMvqIvHIrH5N/1v7wgdomys7vp31mahfn0xdMIsRA2xdYraUd2KxBKYTSipQfL1w4U8S//+aM5UybdcfSRgsIbZzS9/M+VgSwk3iSZRyV5NbBn4rIib5kIA6kgfhl+6w7CUB8gKeBvT6vuNM6PboqksbiSb49AAKCj7gNNdvufYlqvvhNDOcN78meIZSBdjCHF2DmYnvzgy5cJ9H8jaw8Ct0qqj+y4gTNxxiCVkEulnak6h8d9G3tuhO5feQDmMkKyBiaWbCObud+3qIrJo9vorGp4hShz2VM8RfqtqCr3utgxV4YLPmbY0vGYDPU2F1eFmolp+7MHNGLzCw9FFVYpBVp81od337cZBuIdYydATfP8Q9xgt0ApJ2+d50Z/3WGbLKN9I4iS2JYgXgV2PLyTmIuyas84EYzlgquhrEM4s9Gsfq1LaTR0bn6fnpX4JITQaWjGZTwmDeqKSnF/qjtSdTJs2VauXln1b0q7k/l87utIxPJlN7W81kupV2jQgjBPpa9/sMxFwfeNIApoCkyEXCXEb/QMf0SKDA17oh7EWKj7+eLU8eh7oHK5OzybAlp4TGJJsYMbLrwOlmQ7GR9mneDSpxTGucSB6APJWAnpxyN9NdHNX319lzq0FmQJF5vc/rTgy3RVUlOwQURYtTpDkwDZSPoZbGJbI+hrcyn+bF5DIbhscZ0h2gNuup3YCOpmcg9wVTuW2UAWAcQU9+KqRvTYH3L0
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(7416014)(921020)(261009220027099003)(261009223027099003)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003)(261009223327099003)(261009221227099003)(261009221727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e4EQV1xyzI/2VlldtUEHtxxFcGqOzyRn18DYpbgoOzyhwoeT+hKdwJK1jbpfy9jLn4oAOEk60SVViQ7Jo5oOGXlJoKEo+N483ih6pD7LEdukcn5TOfzcbubGIE3nPnzkUJHrw83p+nXMLky6i8MfOVjlKlUGY+B1b7BkH82GnXobg0r6mFgCutGCagDIAgJhjR7DwB/XMF2Y4xAsar0uM2TRWS+DG5cpu/Htg5t0pVxsXzEsvmQkNaqp0QEBPaGLJaFo9y4s4Fs1uy8hxjAruW8eDRD2Omi1iyAA65SvWKJNkKJPlT3XUbyYDIK4W5RuG9ExncuOGVzFWSANtAMxSzP5WBdcGh0s+qtljBfAYnYc3BkRBBbwLHYPpsRh4Hxx1hynow1jtwdtTY71wDIsjojzO6PA97n2zySzryinxgPaypXduUSvQxL+syb1dpHC
X-Exchange-RoutingPolicyChecked:
	EmX3uqXLdG/KAuthaC7wzvR8BK5/crLvNIArbiU69ry1mXAGsYA7a2MFv58X3gUnoKpyhG1vjfV/0T2GC1nzy2okJ8AwAB4eF1vE9vv6YXHSYC08xPHKgIpLbPAkTTZqU5v8YxQaJ8WGVia/fQQVYsMZv9O1K47JESWQoEamS5e+prWIWq0YrbrDNGhLsCWrsp1xvt3Na+kCZ4gdoRWstnlYNDVfCeEBHru0NbpH6wQaGMukb8ZZEMe21xhbspzO02BGC09e9lZpN0k6SMtlcBLpZNAy5eFWe1NoxfwKeVjT6iyOvQOQG8pkGPaw/bNdvhRcPqYFhF7Pa4dXdoOGqw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 03:08:06.6500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4b4e4d-96aa-434e-7184-08df267bb4e7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026967.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6740
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfXwncYrkE9ZGvx
 ReI6d5+ePCm5yyj1iYswuI59nB1NPxVU4taXUk9E1VnzK24Ysq3oDUF5pyrB+dtZamnaWJjIiOl
 35ZOBZtPeGxk/anruYfsX/JCcPjHbyE/0wBCtBMFN63f0Y2OVvaXSjhTkPMqI5iBz+I/bpe1IVi
 ufdZIjxkNuSItof6rOPQ3WaOgAGKO9JfqYGFLFmc5oJY/gm5ozfEwj6SxQWFxTBCdGx27BAjXvz
 BmMUhn4VrV6SSVBfpTAJnXIPmKXVCjEfPgA6DYURMp2IgjJCwVo//QZekekeQp6aNTavW9ez7ht
 qJyxBzVC//RGE7D+t7xDtRGRiqHrPSxSwdo4bzmhzjVxDfnhPgacZAchcyknBakOP+pvLGTeQTL
 mBPDdZGNoFBrvZge3CCs0DQC/Jq1dTw3icozqwBMDkvj9+I2gGEUfGlbpRRfR9XLYVc7Fk9eaoZ
 3Q4vojSmmtoA2xD/Mcw==
X-Proofpoint-ORIG-GUID: aLEsj54nf36Rk4QQ-46IVY_0VQ1HDX4f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfXxrcB5Wl3QBsA
 NvS5WJYPxFpuFJavPEWaIuv1ddeFCoFBobp4aUj/325B8n0/uHfoyOzENLXHx0qQzcElHlGmypk
 1ajo6cctW6EyHh2jedB212SvztPbNxQ=
X-Authority-Analysis: v=2.4 cv=B9AsQ+tM c=1 sm=1 tr=0 ts=6ac9ac45 cx=c_pps
 a=6S8oBaZAy1iJ2l9u/b2bLA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=EUspDBNiAAAA:8
 a=P-c5Zunpq_BhUHJXe9oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: aLEsj54nf36Rk4QQ-46IVY_0VQ1HDX4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100012

On 10/9/2026 8:12 AM, Mohammad Rafi Shaik wrote:
> The PCM1681 requires its SCK system clock to be running before register
> access. On platforms where SCK is provided by a gateable clock, register
> access may fail when the clock is disabled.
>   
> Add support for an optional "sck" clock and enable it before accessing the
> device. After enabling SCK, wait for the required 65536 system clock cycles
> to allow the device to complete its internal reset sequence.
>   
> Use runtime PM to manage SCK instead of keeping it enabled for the lifetime
> of the device. Disable the clock during runtime suspend and restore it on
> runtime resume. Use autosuspend to avoid unnecessary clock toggling between
> closely spaced accesses.
>   
> Since the device register state may be lost when SCK is disabled, enable
> the regmap cache. Switch regmap to cache-only mode and mark the cache
> dirty on runtime suspend, then synchronize the cached register state after
> SCK is restored on runtime resume. Mark the zero-detect status register
> volatile since it is updated by hardware.
>   
> Drop idle_bias_on so that the component can reach SND_SOC_BIAS_OFF and
> runtime suspend can gate SCK.
> 
> Assisted-by: LLM
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Hi Mohammd, thanks for your patches.

> ---
>   sound/soc/codecs/pcm1681.c | 137 +++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 131 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 60fdbe5c4..a1ccf1edf 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
>   
>   
> -	return devm_snd_soc_register_component(&client->dev,
> -		&soc_component_dev_pcm1681,
> -		&pcm1681_dai, 1);
> +	ret = clk_prepare_enable(priv->sck);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable sck\n");
> +
> +	pcm1681_sck_settle(priv);
> +
> +	/* The clock is on, so hand the now-active device over to runtime PM */
> +	pm_runtime_set_autosuspend_delay(dev, 100);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);

For the sake of consistency let's add mark_last_busy first, so that 
first suspend won't skip the delay.

> +static void pcm1681_i2c_remove(struct i2c_client *client)
> +{
> +	struct pcm1681_private *priv = i2c_get_clientdata(client);
> +	struct device *dev = &client->dev;
> +
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +	/* Runtime PM may already have gated the clock */
> +	if (!pm_runtime_status_suspended(dev))
> +		clk_disable_unprepare(priv->sck);
> +	pm_runtime_set_suspended(dev);
> +}
> +

Sashiko reported something valid here so please take a look at this.

> +static int pcm1681_runtime_resume(struct device *dev)
> +{
> +	struct pcm1681_private *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(priv->sck);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable sck: %d\n", ret);
> +		return ret;
> +	}
> +
> +	pcm1681_sck_settle(priv);
> +
> +	regcache_cache_only(priv->regmap, false);
> +	ret = regcache_sync(priv->regmap);

I'm wondering if this would cause regression on existing boards without 
SCK clock, since now regcache_sync writes from runtime resume at stream 
open, before machine/CPU DAI startup or machine hw_params that may 
enable SCK. Rather than writing in codec hw_params as before. Did/can 
you try running your board with runtime PM but without the SCK and see 
what it does?

The SCK dt might not be optional afterall with runtime PM 
enabled.Overall I think it's a cramped patch with runtime PM, regcache 
enable and SCK clock support which are all major features and shall be 
bisected individually, therefore can you decouple and have separate 
patches instead?

Best,
Sen Wang
