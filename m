Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA004078C2;
	Thu, 24 Sep 2026 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244288; cv=fail; b=derruJ959Whh44qv47BwlXh72Oo8RQ3aQWN2Pd4ssyo0ndmwLZXPKiI0q8sclK2fjNRVz3Gv9IdiC+tRu7xXiJ/4OzKm2pPFmMq5nRDOqMn8ve+J+vOxEzOZxdMt+pNIEBley0w1+Mp7BMV/ypKkmoFExIuPUZOTG4/IJ9R4mnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244288; c=relaxed/simple;
	bh=h0zHNbrp0cQXRRxgAL2SEAB2BjGht7aMy45kdMFPCcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ib93KaR7SJDnvA9QPb2DSokhgezFwDLcaEU78UV7I5fRBZB1jdH6EZQGNairaQXfnxvqdUwBSfkfevOcQgvRMw39+QGULZ61oT7JS0lxs8zHnQuCVUp456nhwG9/7/AaOAIVCDM/vhHUkz4yYUFCUoTaNrQnIeO/7twfrFTU+KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=McxIhlx/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mQ9O2pnv; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="McxIhlx/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mQ9O2pnv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O4v8Vc3450717;
	Thu, 24 Sep 2026 05:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=W3O3SxqlOp5UlQn6Jx
	wbvHANM8G87ZiS4+ThgJc2134=; b=McxIhlx/niLJ+M+oWjObdUHTKZchiueOZ5
	xWtQ1/A0NlQoLlruH0vPIUshgjhTRNodflzGlQ1JLcwuQBqUpfxGK0vEi7n6fpQX
	UTw/59Fd2KTUBuB/8RUxEfeIiirAQlXw7SagArBZt3+jQ5mAM7RFxploDLC+baQY
	DEdk09y7r3pa32acw5lsm8r6ou+os98JswQlWka1pVw6oboymdzsZeQETzzhmRRz
	uVOAn4r/YrnQODUWOStXPwhqW+iX+oBWo4GHiRtVawz+72E22u+XXB37UnWR4PZ1
	xktA7Xu2QuGN0VNceOVK1t8u/KWOdISj/8/S+J0TT16nssShFF9g==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021140.outbound.protection.outlook.com [52.101.57.140])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gvkc5953r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 05:04:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peVzUBwvbrq0OXV+nxYIDZQPZezs3RO2FgBQ+KzeJXewxyjSnm7iwzyqB8gH5QBig3eZE/OiI7t+BSkKc1yc1Kbc2ucbReGPSiJTCWtDm2oDJjxY894/CO5JNRinCBCDPd9iJ9jDS3f1ZcQjM1rHtHZH/gAcMpe6bv2cDIQCJgoZT1h8707wPdPYFJyUKWCDkUIRVXIdnirOFtgOeOGdl8QfiT0MBni0jTpHqa/pmrcQd0Da1BUohC83/zmA6vQlVAjkMqq6NxyCl5l2zwmMlz65cH3oonNQBLO05HxfGfUCTyo/KYEIFM0MzjCsFIipSXnVWQn4s/ljE6wSGjkwaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3O3SxqlOp5UlQn6JxwbvHANM8G87ZiS4+ThgJc2134=;
 b=g299PbwEFq3EQnfgvrd2mB6ZFqwwjvfne3szKxcWXpeuPz420vw+/im8v5dJrppp1Wcujxc50/VyF3me5mBCuLcWTA4LMRerZ8cHvh7T+vBl590VQlqWcR3oVBCd9FkquS9SQfPH7vhAxcC+mKhc/tmlNjbPaJ+qZK9yKlpWqDGZMcvchtB1hXPYqTk9AqOnMKvGKksiB8rqsLNKiTo9q6ERn2Gc2sDg6AP/3EhawY1AGF7wfGQC4g9OrSy9iYeRraFgc8SJr7pXD5Bor/5n9gSBAtLCOzICQ36n5xOpvE/onzwz0mvRNzzj1aljAG+7HDJeVCbr+O3YSBB8LmSHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3O3SxqlOp5UlQn6JxwbvHANM8G87ZiS4+ThgJc2134=;
 b=mQ9O2pnvnFBZ9O+1NNG3wPynEMQfqqA6HsS2p56WSbP8whwpHcNSQF4MkMr8vhTDC2+rvIYIpC01X0nh6IdrMlJE0s1XUl+M4D4iYJYaJjzq+jgbYh8zI3GN5u7kEfnDM0iHAexpbJLEb9eVza+eah2/HP70VEWnTF3dPQ5CtSU=
Received: from MW4PR03CA0137.namprd03.prod.outlook.com (2603:10b6:303:8c::22)
 by CY8PR19MB7692.namprd19.prod.outlook.com (2603:10b6:930:7a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 10:04:24 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:303:8c:cafe::6) by MW4PR03CA0137.outlook.office365.com
 (2603:10b6:303:8c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Thu,
 24 Sep 2026 10:04:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.5
 via Frontend Transport; Thu, 24 Sep 2026 10:04:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A3EBF406540;
	Thu, 24 Sep 2026 10:04:22 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8C99C820247;
	Thu, 24 Sep 2026 10:04:22 +0000 (UTC)
Date: Thu, 24 Sep 2026 11:04:21 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 0/2] ASoC: SDCA: Power management fixes for the class
 function driver
Message-ID: <arT1paheVXRcAL8v@opensource.cirrus.com>
References: <20260924095458.2683755-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924095458.2683755-1-mstrozek@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CY8PR19MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: c1bb8967-4768-4285-8be3-08df1a2335b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|23010399003|6133799003|16102099003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	lynBcNCJEUK9lqjzfc8IwCmWsTnC+9O//UIHqu8ZCH/dbNFA6+ctz6eO5GvFuQjpm7qlhCUVCgAFdlaCoTG/3oz1FvPM9MRoDRE99A4L/cUrkxexTFlnaIAcCGOPLzHJtDu09x9iN0CavXbGh5Ow7ar2o+ZKnOFE85RphesHKLwMCyqJ9DRjbWKsmw5hlvTPJptzIfwUcarMWdeT9FHcJBeNfs7IlMJ4l75EEmcWLBEIasqqML6oZOUquzDrYeTPdlkAg0vR/ubXUAjLILR1cKTo5jmwFN5J2pCi9zQy0Qn8WuJ3bMxcO9Uu6Xql+CGnS7fjq4lB9rvytC99MVpLMViRHI/KkXanMz246HA8ZuMkeGeb45IA/AlIjHa0M/pmERi0rZRAUQFZ5QtTisKAx+bRDQHN2esI+qWR1lsmlvmDRKLuHcZccspWkW/JFL16Nzjv7+3tnn6JXOLu/kFBRa9WUEXbt9cxbua1T9+dx7/1We2IBdQbyTdrtYipshKZjt2Ekmakr3VtTpsxCx25tBB469ICGnfMgWPY+l8q1YHVjurlzEciaIs4/YSg+ILK3TNraGS4kaRnRHKy7EBEPITHEiPbvEJQpv5WXAiw051JMtnFsOePTTXAIONcxUI3SzqdToWVXg3+7rgFxd1QPsZT0/RJurxb2MH4lhSu7IxeNBlaZ4Td7ogpC3ImsIKp
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(23010399003)(6133799003)(16102099003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iFNiUo3Ztbm7GIIrkxq/dn8SLziFxjxE3RaY8UjaEVg7TubTHrXeXblMNpwbIHR6AJPZFwMIiap+3SxU+GmH1NvCEfVxOwoqjb7dXlGlq1xingrMK+ZDr7+nw5+iqflV8vXqZlrXCG6dcTUFXKbRkQCWnfc5EtC1khDvyLTceYxw4Ko2yE1Nl6P187dyVOV/6Wf5lWFmildYSVYSMdy/Pb3wocD7rhrkIkBIiAbFuagIg7YkapTwsDHxmF0BpR8A+/e2+Iwj+lh3fE5hzbk5MOD3ym4KKxfutYAddbxonB442BjdZhnTDimeNqgFf9MRQBOIFncUzebWyHyrBC8MzVtvBoXUTqUwqL2th/Cl6A4ocEkG/2m+pO6MhCZGUoD3JQbZQWl1EPGRowD1FghklNyAC8o6MXZZVwq0rbeQCGskWIHj5silUJN+oImt0jac
X-Exchange-RoutingPolicyChecked:
	OEYq5nAry+gscMmGM25sdNo5Up/fIJI9Yo37JTNsYrsusd47AphEyLemNZLSKAZaDH5coIqcG20v4RD9SO4a2IfTOc7+nTVRGyMkeSlj6fjWBK5W5c+q8GgvSzeQOxkBcjM9v1yONXcuBdOhgIoeQN90j6CMw6jXHaTdR/q7/wTH//mR8RsY8smuRBBE8N1e2GQVx29qTl9qvdBuaSjGx3Ma40qGiPVEIr84HoseEfDBioFCIca08oN6mBILO5mOGtmbO/AvDwnUmW0NN+X7YYqinDKnGcBWFZrtCXrUzYVPRspR8oM6/IjGUFtVsKHlrIKah0KtYbDHD/3FZcNi9w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 10:04:23.4969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bb8967-4768-4285-8be3-08df1a2335b4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7692
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfX7hACJbfFxgIq
 TiMh3q9VRn04mEvDOX2qhKSUymiIPRkfeDuSjGW3d0P8owpvf8AtzcdX2IZxVLyCqrqTjPVhxG4
 U10Z3EyKixT3oBwcy8URFkbu+dKhblSAhUWBzo12df2rDbSDaaPraRaQjTbNUMySbx60QLuM/t7
 iTK/YY+/G9E0EyXs4iGMkSILUdQxXxhSA4nAMr1Jw9btJgchWLIumijxxBKCf7+2DZ3ehBfy5tA
 DmAPVyIG2iHyqF/Ldro9554xHTZkEEPpcL+l5cduGN5p2JzC0qoDNa1f6B65xXMP8bl7utV0jFy
 JE0rMKrSRlbY6nwA+XKWxZRotlKoaxIBI4L43Zq+HqDpw6HZq9NLiv0ZUJed3rGP5Fb1P7+mIkS
 mso5UcDiZMjvo9MD8i3l/fOYAcbAlpclXMUQNZ9kakomPnr0DuzYTmWV3Jz82+ZJ61sqNy6jnS2
 IHMqkAxnDCHBiyYdsKg==
X-Authority-Analysis: v=2.4 cv=ZcyIpcVA c=1 sm=1 tr=0 ts=6ab4f5ab cx=c_pps
 a=MXoojEuG0CHbO9udwFI4vA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=sQGGa7r-9QNuyzd-whgA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfXyTevk9k6OYVg
 pUHgwjdcN2BADKi7A+N0ETLKde50DQM12Auo/qkjoCkHl5CRPRILDkiezJWmZFiwJ/P2+/S3cKE
 IfeiUe5FoLrzXzsuBtMY/alzDrKokAs=
X-Proofpoint-GUID: _tcpK6bVjJw7BM58r-6elVMXW2YOhiQr
X-Proofpoint-ORIG-GUID: _tcpK6bVjJw7BM58r-6elVMXW2YOhiQr
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 24, 2026 at 10:54:56AM +0100, Maciej Strozek wrote:
> The first corrects the point at which the suspended flag is set during
> system suspend, the second balances the runtime PM reference taken in
> probe when one of the later probe steps fails.
> 
> Maciej Strozek (2):
>   ASoC: SDCA: Set suspended flag after resuming within system suspend
>   ASoC: SDCA: Add better pm_runtime error handling in func probe
> 
>  sound/soc/sdca/sdca_class_function.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> 
> base-commit: 782424a17d77ae6de07b490618b523066c528f59
> -- 

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
