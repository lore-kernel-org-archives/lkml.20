Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFCD3B3C10
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746763; cv=fail; b=bVUl3081/99yCI/G24YCHu137jEsNj9Mbzti6axGKgXSF5RSXWTaQ/Wx7AOViEUSneSE6RFX3Us/qY/L9MI3WNV9uYUyKIpNwjCvz+mJjaliEdRG/fqw5vcDBLueKQKahtSW4IBFrkM49MKDSzcJ0RDMMcp6n3WQ91HRgKB3OdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746763; c=relaxed/simple;
	bh=RmdjVc+quTNbBoP1TJfwZFYefp0dlp4rtsFoGoo2+tQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zuon1E/JQ44zs2ONRBkjEW0PFuRVAG9j/Qq7vXlbaqatwobNJ5vgClH+glBRWKTv6/A99oppPo6g3Re7lYzAbmOGeh4mCRq+b+u6d6CI4kxPeKtb+Mzv8PGAdI1mIVOZvpPz0tq8pRsNOCMu5rI5XtFn/vyVY54d1pkcyfBR9Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=YmzaoB5/; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=IZw77dsO; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="YmzaoB5/";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="IZw77dsO"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68U5bwfx1798579;
	Wed, 30 Sep 2026 00:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=RifgycA5esGK+NsP4mcRLTzICdgQskGersUNGMwlt
	Bc=; b=YmzaoB5/G9B1inLYmRwmDLtpHh8XM6TSJk0PZ43WvH7720Zo4u0TlQyRx
	a8GspsAymVyDPnlQLZYw0ZaomQ5kAJR6CP1hlpGkqyikw3dm9af4ZObjevb52X/a
	x/lHmDhGxP4dfqrQAN6mY0nRTCBaECjp9f/3qh3nyzQ3Hycondo2RDMYz3VCH25b
	A7dlQrjf1aHlHhVBLORhjzZk6Pa+yte7uKEUVp8e7CjJu7kjACP9DIeqtHEwuku1
	OsuDntjMpWKHtHgdhE13SUk81wPgvzqlGT0MaAOymlmp+hTRTXGJPbb9+vZmYpmw
	97h3j5+BYWGfBwpIrVzAqPekbskrA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011039.outbound.protection.outlook.com [40.107.208.39])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h0rgfsj8j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 00:39:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVxtf1Q7lGuyNTbYA2biNK5zt/0e+hV1o6JKXcjvtH0qfscvi5b9fWkVCiSuQolfINHXH1bssrGQBGqrsMhqdy5rbcAfF9JxgCo6GJcIU7nfMXB1FJC4PWyiAyL6uubmUS20dHXhkVt6lz+wP1g2Cfz9W64JY8gNap5QlruJ1FSYB5UqAFVP8+9TXU66lsASILeHZHrdLd2VTadzhtFWYPGoYB0cyNx5vT9HHXVd1aSf5BSlZRtRW2vMiALdydRikorWWvZxPf0PZ8NzVvB2vdQaK/f529cPFrYCXzG+TUOJ5bWmhZUGgIM7xz7oHZXQWQqoO8zl/pGmBJL1WcDnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RifgycA5esGK+NsP4mcRLTzICdgQskGersUNGMwltBc=;
 b=KLMKJmlBSRPPzfLGraEzTUQf30C7e72rLOKVrN26z2AnTVERmWn30DYOj4qL7y/4IkOUF2OK2MKqr1aLP+GlQMCnUSj5RhyYHtEjtUI3NZjSgp3CFLE8I9r4MVwXGxXbxS6TCzmdWyzROwc9JuiQJca6BP7t9YZbcnJ6bhCWv+8ClIuqExkI8snSOqBnSNgZWyRDLuAWNwUkQGRJs3e9hhyut6VJ2nVqPV2idvi4E2/tl9F8VjzjX8JtJxnrdG1P477ah7oDWhWysSmW2D8skbt8UgW2wrJJxjCnDjvJUA90u4t76vJGbUWMriyPHVEk9M8brGPCxyZL+uFxOgMKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RifgycA5esGK+NsP4mcRLTzICdgQskGersUNGMwltBc=;
 b=IZw77dsOSwUc/Gibnt/IFJqpQZ2nyh3Hkp1SKlC5BY8aOkGpMKaeG7HWwCx/oJeDAE7xSM/zWf47p4JZELIWQrKxJfrCJRHEHbG+KhsHf+X8vJeKRVGmqDYRUpPtNzsqJSKYkYxsaDEHWLFHwOzox6ZErpfK6Wbn64M1RENZRWU=
Received: from PH8P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::11)
 by SJ0PR10MB4766.namprd10.prod.outlook.com (2603:10b6:a03:2ac::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 05:39:13 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:510:345:cafe::3f) by PH8P220CA0010.outlook.office365.com
 (2603:10b6:510:345::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 05:39:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 05:39:11 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 00:38:33 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 00:38:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 00:38:33 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68U5cXfY3446448;
	Wed, 30 Sep 2026 00:38:33 -0500
Date: Wed, 30 Sep 2026 00:38:33 -0500
From: Nishanth Menon <nm@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/22] Cleanup and Refactor TI-SCI driver
Message-ID: <20260930053833.sms3ondwxhnys545@spirited>
References: <20260929201746.4078803-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929201746.4078803-1-b-padhi@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|SJ0PR10MB4766:EE_
X-MS-Office365-Filtering-Correlation-Id: d376b1da-e8e4-4993-b796-08df1eb5279a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|22082099003|18002099003|13003099007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9Ok2P3qLaNHooHC52I1wVpjF9AM9ycQWRWlZlmI1MYyg2vY9AIsBJdiSQxuJwqqPjQ/lXtko/iu0QnNd1SQKFeMwX/0dEML/0xhtOG1hM4NEsN4BnZ+YC7RG6IuIqiHwi5pLcfFw1Ba42vvjHrnfXX/tJW6JCcK7rzH4X1OlV44H6lot0uOrSMiSeNPID+bFB6q4Qt8ecLlGtwkTOZTMiuUvZETT0PGIZTs0UGkwIbrwLNKJ6y7ZNXAwLLMS5k6qPwdlBcGrIQQty1gz25sZmY5iEQ8j+AKn1r+ZDeZomKLccf46bBrHaBQnXuSNEkr5hZh0DAMRs+Qi9mQ2gBc1icJqfLDqgsyn4kslLqgiI+x6QGMsID11JLoHdN6de1ZIEd/tRNJAqz/i95OhmfL2cXybizNWVic/fDb0/I0timZFAU0jsA6kFJOYZXfDWY540AOOtY8HXcsHtmMGrjbCd/qRg/QAoQdGslfkL7GHRkPi8V8DolWz5SPpf+m3NWQNujx/A9CAPKpruNm4PIQ1eF7Q4z5c5ivs7ywS29v6bmbjSEDWmG+KgObUV+DVreqcQCrHPbnLQ3nNgWWOjQVL3pS1e+dpixvFLaOneK/H7DQ876ylWjAlUqh7sExqyR65N4K180+v9oFrgMbrRgD1pg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(13003099007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PhQD82WYrASrAnLt09AUTuCYG5ADj3vAgN7ENQVepHdbit/WWXYvy/iqToW2d5FeuRRiOiJfGFCvMoxbOqun8idp/TZY3MZez3OFy/QncD/rhp3qQuIslCfWIyHsbKfxIboaIdN7BxMI4axaPGgTxyGb4ONLw2H+4Sq5lubD670caFx2gdvdyh5Dxn+tz7CC2gvgG/aOqRYx2WonNjKoC9UOGx2qkQ2ePBhOi9S4GAc808lJmL6u873Ka8TjFH5sN2pbEWH3cB3NQ0h3AifCkOPA5tWXnaNjaUEpaaefU5op+vaXQKR3RHPzjMaU4UMb1RLLNPBfM/BY+z/Qn0cPS6HGXzGpwXGwAq77DFqSf0YR/BErFXHU7VWFenVW5WB1C/LIGORg7fZ8FIQOkL6vIrxFaCOXA4fxzNNUfz41itq7uL3e0pc9o9llqmdDOm95
X-Exchange-RoutingPolicyChecked:
	2FKypheiPxbmeJ1mkuev8fJ3Q3H8GhEPrUIEQZ0WHRKVxSVoPILpbfuTZife/WdlIM85vhVyCRSHBxLN37VHtfIOWV/B0MoZiCT/l7Bm9hxRSkikWXX62XYL5+/9Zv0Bs5PLdrEadNAIYfc9hViluRVA6LULlZpXDjhVlHpZeHsxIuuv+mNDvxnefsdMqqM3c9mD3mNvIu7SIGg+cIXOe/KS25jQmiPS0MbwaNGWGdwVKFH0xtIeGAudd0SCqlbzRDE+dxWqdM0qmvNfQR6LJSs0453VqQrTs29VJuxMHM39TIyheo4CMPPHNN0XbjpkCISUdl3kcgiCpfeoAXejOQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 05:39:11.1534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d376b1da-e8e4-4993-b796-08df1eb5279a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4766
X-Authority-Analysis: v=2.4 cv=DMEacCNb c=1 sm=1 tr=0 ts=6abca084 cx=c_pps
 a=ILySzFF5iTKX7yzk26Ee5Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=Klfo258dlgAgmQjh_8YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: usT4kYrMrmV6PSfGuD32i28wxcW7vQsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMiBTYWx0ZWRfXxW8Epl+gJzqc
 XBxLD6rqkiwE1s3AtJR0nozSh5SsJQ2vItetnTmu8W2jYnBQRwVDBlNJcEoI9iNyjFuZSkUx+zV
 745GgKYx0Ppv5/QBBBZyQlp5OCd46xVS7ZeQINLBkZEnRTIDnErGczODtJz3GG0hDQV7qSPdW3l
 SzpLUrwJ6oJsigwKkqLEe7kI7uy3i9x48tO/E0+KFVh7z01APVEHyjYghny/39YcLSpvYmMYncu
 PcW8JlEwih8DvE9brwFRxMntYhmBkO1jHBTKSxIfI8IWymUabRv7lSbnW7zmyWQpeCmPa0ywd+6
 mxVMdWnomnr3r69tecBvKygFEaBPvy0jzLH+j4+ZdyZ+a6AYkbRbcWxcP/cOsz5j0+W/BQOfpSa
 kgMOm5PBiDZgsRTEasML5zHA4l805npV7kA/j5H7ZWpWaUce+/ijSo26txllpyLExjFgbub6+vZ
 BLr5+urhiaDOjrMIvyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMiBTYWx0ZWRfXzEw/lvTnL4Qu
 90q2wnB/eJFnnUswiFZHGoO8W03uyAAgreNFjJf6OWughYwyIgTU4Ar758ogN/tyB2CvTvrnG3l
 /b7/mjuy5YaqFhz1zZlJG8hF1K9lZWU=
X-Proofpoint-GUID: usT4kYrMrmV6PSfGuD32i28wxcW7vQsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300022

On 01:47-20260930, Beleswar Padhi wrote:
> This series does a lot of cleanups and refactoring of the TI-SCI driver.
> 
> Patches 01-11:
> The first part of the series refactors a lot of common code from each of
> the TI-SCI message functions into a single place (get_one_xfer() and
> do_xfer()). Result is removal of net ~740 lines (~20% of the whole driver
> size) without changing functionality.
> 
> Patches 12-15:
> The second part of the series does some preparatory work for being able
> to break down the single large TI-SCI file into smaller files.
> 
> Patches 16-22:
> The third and final part of the series breaks down the single large
> ti_sci.c file into smaller logical files: ti_sci core, device, clock,
> pm, rm, and proc. This allows for better readability and maintenance.
> 
> Note:
> Since the [PATCH 10/22] (first part of the cleanup) now passes local
> stack values as part of request, the following[0] patch series
> in the underlying mbox layer is ideally needed. It is better for those
> patches to be picked to avoid any KASAN warnings and possible duplicate
> message resends.
> [0]: https://lore.kernel.org/all/20260929200159.4033010-1-b-padhi@ti.com
> 
> Testing Done:
>  - Boot tested on TI K3 J784S4 EVM.
>  - Tested some of the Core, Device, Clock, and Proc ops with remoteproc
>  - Tested each patch for no new warnings or errors.

Thank you for the cleanups, but lets ensure keystone_defconfig,
multi_v7_defconfig + LPAE also build and boot on keystone2 platforms.
Currently, I get:

drivers/firmware/ti/ti_sci_rm.c: In function ‘ti_sci_set_irq’:
drivers/firmware/ti/ti_sci_rm.c:225:15: error: implicit declaration of function ‘kzalloc_obj’ [-Wimplicit-function-declaration]
  225 |         irq = kzalloc_obj(*irq);
      |               ^~~~~~~~~~~
drivers/firmware/ti/ti_sci_rm.c:225:13: error: assignment to ‘struct ti_sci_irq *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  225 |         irq = kzalloc_obj(*irq);
      |             ^
drivers/firmware/ti/ti_sci_rm.c: In function ‘ti_sci_free_irq’:
drivers/firmware/ti/ti_sci_rm.c:313:25: error: implicit declaration of function ‘kfree’ [-Wimplicit-function-declaration]
  313 |                         kfree(this_irq);
      |                         ^~~~~
drivers/firmware/ti/ti_sci_rm.c: In function ‘devm_ti_sci_get_of_resource’:
drivers/firmware/ti/ti_sci_rm.c:825:21: error: implicit declaration of function ‘kcalloc’ [-Wimplicit-function-declaration]
  825 |         sub_types = kcalloc(sets, sizeof(*sub_types), GFP_KERNEL);
      |                     ^~~~~~~
drivers/firmware/ti/ti_sci_rm.c:825:19: error: assignment to ‘u32 *’ {aka ‘unsigned int *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  825 |         sub_types = kcalloc(sets, sizeof(*sub_types), GFP_KERNEL);

with keystone_defconfig build with next-20260929.

For the next rev, it will be good to get boot logs in gist or equivalent
for all k3 and k2 platforms.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
