Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461443B4BD;
	Tue,  1 Sep 2026 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277821; cv=fail; b=B0dgIALgaBhWxjsqiDLvXd56llBcedQX0u3p4jHmuXCuBPYTbYrA4+WSbmlsuFE9CCTvP0lvudm2aTY9AG213N3LhkcqXvOcHQ1utCTb6BodLaaEvvEZyjr2+82nn0UGYJqg9aUmFjxn3CyhVRI6uZ0Hl98Vj1rsGV4CxZZ4nn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277821; c=relaxed/simple;
	bh=W65m5OUt5jlIiYBdPYdsZ5kbhR3OXYLD9iuHojkZhyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpnUWr719HpAAx/tiNHJBVajBBvWHXISPP7/1z2Kw8E1X1r7XKsw6svcEcg+MmWulEWI38fQmH4/5SQStGXMBMyhFTo6xPk2awwjuDNNXvubeUJt72w6kexFCzJzyYME7LB3x03ZATAvwCd+W5Zga7WA0vyrrupTXQF2ozqCG5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IEW1wfH3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DzixIsw2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IEW1wfH3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DzixIsw2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681ER8Li575588;
	Tue, 1 Sep 2026 10:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NF6K06KWfRpNBTu7kOK7cxquwQupM8eOIpkSaYWIzZE=; b=
	IEW1wfH3l6zE7UTNzw2vhniDK8gaAeEAt/JkS7TF3ogqaPjFLReXK4v543otPsSM
	ekezJfEarkQG1gl71hVJmMQtQERd+k8QnOyps/m5ok3KIP0vsxEZK1DHpplQMJvK
	SSn2g4ZdTYy8xuAfNicZ0jDHnCbyWm/LGNzbU1VcfRVjrIluRUeobXCQKqIDFTsM
	sgBnEPE7xSPUUyA6yQIyi3j9qiQkB2iNv4am3o+RsakdYWjII/N2sRmESGNkjGfz
	zczVmKYFuN405iNf0sQTbFfHmR3GGwC6l5mJvrfRq2/1FPbwymM20NxmeIOxf3PH
	JPKjT0LCR3UzY1qqGA43Qg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022120.outbound.protection.outlook.com [40.107.200.120])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtyv2t6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 10:50:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrpcxFxfcquyN5d2wQyTy/RHq27+Ir3vkFegv7qxBFxSODVMlsBA6vfgjNZURdD8y08h38MO0QOsPOFeILZbKGZ3VPnmUgD9E/yqr9cbJ+DYHnm0Rhr5LIdygAAA4aLh2KOpeCiVq19VSEaErWsP60g8kG9bduoIchQoE1n0Dwon98Zq/YdBmYdZK1rELPgsOwwgg5ee9lSGK3FOgdG/t/DfOUAGMrsOTSdH9lgInF84tM52bFazbjS676atC1EG0vz5oefgY37IvmKHoKMen6OmH5OtWzIcs8p9gLGVTLumjFFEEgiIysIVJUMYbpSzMMvL2oHi8Tm7ESRA/amP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NF6K06KWfRpNBTu7kOK7cxquwQupM8eOIpkSaYWIzZE=;
 b=q3oyi79T5p06Yp1S2H8x7GOwjF+IDb8znm3XgrPFYsjVHDWxh9xSS8i2llW4B8mGku/jppaIuC6p9VG3qM2Te/CPn73h0qtkj1egaI0/SM/t8XmZyi0MF73jAqlLFjuOhG21c5F7zz8nNCDL4c40QGsC9Fb73GghYdqNOQOq5+56o25bRrPGVdGSJVHTbrt/5Vmzri0PUQpUITKu5dHBvFdsiKaGfrF3jEcURSBKh1TCmc8smx+orrwDjhrYPZZQb2uD0cgeHWaIEGkgDvV6tzHWvro30nCuoBsZlqPD3YHv4KbPcitmMP6YFOAloK1wO64EBanzHPJL8SGujiO0JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NF6K06KWfRpNBTu7kOK7cxquwQupM8eOIpkSaYWIzZE=;
 b=DzixIsw2BfS6AQSqwSDdN0s+jTlQBEMzsTXcoT9Pdl10TU7Y23VZfz8/U5lyxizeKIVk9zFnSVNGsxC+rU15okUIwGePlrXzYVoqOr8cYJCHZCQxx/hJScjhFuASWx6LkDP7BlWG4cgZnXCbu4yH7LEj75OcznwUA5WLcSwh8QY=
Received: from BN0PR04CA0154.namprd04.prod.outlook.com (2603:10b6:408:eb::9)
 by CY2PR19MB175845.namprd19.prod.outlook.com (2603:10b6:930:110::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 15:50:12 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::63) by BN0PR04CA0154.outlook.office365.com
 (2603:10b6:408:eb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 15:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 15:50:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 956C7406543;
	Tue,  1 Sep 2026 15:50:10 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8EE3B820247;
	Tue,  1 Sep 2026 15:50:10 +0000 (UTC)
Message-ID: <17e7b179-bdfd-44a7-be3c-b206910780c7@opensource.cirrus.com>
Date: Tue, 1 Sep 2026 16:50:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: cs35l56: Fix probe deadlock waiting for
 SoundWire enumeration
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260901122644.634494-1-rf@opensource.cirrus.com>
 <7feebecc-66f7-4ac2-8c1f-0b8bf55cb528@sirena.org.uk>
 <ff3602a0-f1c4-4b84-b1a7-c815e48eccb5@opensource.cirrus.com>
 <627c6780-2a5b-4956-ae26-6ca6d13a41c0@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <627c6780-2a5b-4956-ae26-6ca6d13a41c0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|CY2PR19MB175845:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4fbab5-8e6f-473d-c61b-08df0840b535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700016|30052699003|82310400026|23010399003|61400799027|376014|10067099003|16102099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mnGfUrjKezEYBJdatbb7e4NWnKiIzKRNMhUMYk1TulB3vDCziZ+uBLEganNoA3hWv41ojhex0vSLHHaM3JZfNMJ5ta7o9u9Nlc+GTlws5Q7auORiXq0i+aW9zMb2JGkAfwTB26Gk149v/PLcMMgTKqB3I+8ruTARTjGaodbMpleNsapb9e+YtJQITuVQHPBq/Bb1NMxDOh8Bn5E69sGdtCM9DcxVYgtQye1qfmkTMGX4aWkBu4jY3eXViFJ7pFPlQbWZA+RdVOIzpgIsQ8x/VfPBoCSl3N6t3XR+mn30FVaf32avDAG+V631dvcJMgqujywDFye0tvaI+En62jfvicvbmlV5FcgIzLWF2MhMzVm7a1qDff5lWaK+giMDtcFAP4vmANKRJfYUZWOXMrrBMfiq5ncgqFf/MhzgYcgbPT1B1JT7QRPU5kKjyzMFGlTbrfTB01runNDY+sOUMLw1DdAZFSk9ly9xZmMpnxWa1/PyNFWqmmS3bmm6tZ98xqOkOF+bcyFxEM0yQumT0lSPU7iIojrJIv5XLVSlN9sl54GdpQtEkiIcGKrO6PRAZRj6hRk4qmu7R9KpkC3q87NJkMyH7GLsE47taWaEgef3dWIgPKk4OQYkXQPemZjI0h8iEOd3Ka8aITj4MLuNshgy+x8fMR9kp8o6u/FaFpvfuwePzDfs7XD2MoQPRoTC0CXe
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700016)(30052699003)(82310400026)(23010399003)(61400799027)(376014)(10067099003)(16102099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h9ISFtBj7KANu9CUjBHuV7YWy87IlN07isu5s9KlojvmnKRqpzcbILWpQ3ZgE7+ytTuY6fyCK6cGz33w6zR/ynZ7XDCOYjonKO2jyZmcn2zqhNetSXnot+VPTnT9O2mZMgi9w7oFpqN+poKTl20/Hfkod7ZCI/VKfeUHdzjaF0G/KVLl/0Iku8mNgZ8xTUD4uHvekROhceBgDJwca6M2Rm3Dxdx+vBwZFkRSbAYESEc/BmF19O0Mfeiv2KkvWU/6HbJC6CTGmqwfP1gMrvCpPqKNnquPOvvQ7hXIgbWz3Y57i8pBFMul1tYjcRiHL4V8VQ7wyX2avHL3cmqevlbIn4ww9a0CA4tW+6kBypEfNbyPmzrw8BqRxAYrXnMGHmP3r2JZDGXvmhjQby8fbGk16w9baGK7eVn76/QzD92hyuVZNNitxFSTxGz7M8LfzobV
X-Exchange-RoutingPolicyChecked:
	FWQuv+VCyueTL6PooqFuVmTUwN/eIRkceGyPcxas1oeDIzgdgVWu6Jz+jggmU5bbr6S4JWJdn4CHw+Nl4t6lLllJiBofeo3VP2Pzw2Q6pFzjJyGSOLyVCe7XJWxPBvH+mzqC3MS42GBcZ1fvALBlgnbkFHuc5KxdDQNH3mFH7Q7YZx7Mn4KsYYyxQvu+EybjAsayhXoeivgeLDqcyRFmLWiG7ND1XJCTKW67vhzolBER1gTAh9rR5PUaTWV3hNdUDR6390T1piGIrvLNyVElZP8ijds4RAuhBE0KS4kdGmkFWdx0m90kUsKoIaHYvkxL3YDR01JPJKQFlyq5LVEsaw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 15:50:11.8899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4fbab5-8e6f-473d-c61b-08df0840b535
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR19MB175845
X-Proofpoint-GUID: 3yYKL3YF6bYxRDeX_5kTh9g0Wf8HS2ZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX7c+9gS7h6m/D
 iy1bYz3rTl95wqG/2JogVzUxG6UAPy0vYgr61aYCZG1Y6Yqfl09f0hRXdvuum3jY8JidiIrsRJv
 NeGodRlhzZ2b67g09Itj/j5seazsbocSMJotvFprhWc81rxdyAMAGFnuBGGeQeyntFBqSojJk8s
 2jJC3Uyb4XVDsJXJkrQtaLBzs4q8BsusymQYY39T1I4rgZGgHh/wB3Pxb1p/vSqzP6sHZQMzn8J
 wcw9SUfc/vBo9qX9wJbvgIzt88th8jXNnPAAYkzOblVOJ/2HVFzHY/1hfxVsmlZ/wYUGc9KiXD0
 GWq6HD3oQlENrvktYxDkV9aO+12XmmSvUOuXv2HCOkxbnrmeXWSRe4hp5lSKaWwqcxkPGqoeOZK
 +1JLkIpiKFt5nGZDql3EBTEyz9Vli9iAARbg6Yh4hB3FRJRiVYVQN1VNhsB2RCkWOfaBljDViGK
 xdsaEfo6twYByplDYHw==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a96f439 cx=c_pps
 a=3SCk7X9PwWHtu4c5+rqWlQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=R7zpltcrJvst6SvPI_EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3yYKL3YF6bYxRDeX_5kTh9g0Wf8HS2ZU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX/WUxgk4tKPkr
 yH+bfftsBnYJb0xk3kHhWNpoth4gTwHq6DETJ0jQ7kG67zWeH5meZHW6MrhkVHedhRihWVi1mF9
 B7Iu8YA36R6hpYlx+q4EV5x0Y9HY2GY=
X-Proofpoint-Spam-Reason: safe

On 01/09/2026 4:48 pm, Mark Brown wrote:
> On Tue, Sep 01, 2026 at 04:38:37PM +0100, Richard Fitzgerald wrote:
>> On 01/09/2026 4:18 pm, Mark Brown wrote:
> 
>>> I'll apply this since it's very much a corner case and there's a real
>>> problem but you should probably check out the kexec case - it looks like
>>> it misses freeze_kernel_threads().  TBH I'm not sure the issue there
>>> isn't on the kexec side, it's not exactly a common case and having a
>>> difference like that feels like asking for trouble.
> 
>> I think you are asking for a shutdown() handler that cancels the
>> work.... ?
> 
> I didn't really look at what would be a good solution TBHi, that looks
> plausible at first glance.
> 
>> If I've got that right, this isn't so urgent that I can't do a V4 with
>> that change.
> 
> I've already pushed this version into CI.

Ok. I can do a follow-up patch to add some extra protection.
