Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FD54F4759
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788457696; cv=fail; b=Cq8YE/VVMyF48x7CNVJMzPM6vL3mNItJ2blZVYRctgAJfZjSPPmhSdccah9cjx6Adck2LFNEr9vr74ZOzsmJyOFXRRVKLGcm9WOR8CRpgVhvkdnG9wuMEl7kF+SRb+yUzuljPK+cjoQeqsa/pKM1xYbI4E+0JoQqAZyC4kP21Cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788457696; c=relaxed/simple;
	bh=XIW5rKp5JqTm0waw7QBFmPlFVfCQSfYULu+JhyZ8BVY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmIjpYzkuxcj9ExTogvcI2z0xmXBfGvPsk2+yLf5epf407nAaYAakm1GoN5Pz3O0O0aAZNDdecql3NOQYC0W/GCKZZtPZnaykAJRbVjWkL25yqqcrYqSKbTnbBSNa7tUmatmUkp/T08cTO0SiA8tCDqz/OE7mfq+SspkNCNemxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ApGv9FmT; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DeCPffwV; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ApGv9FmT";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DeCPffwV"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683G0egJ4088410;
	Thu, 3 Sep 2026 12:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=FGePGM/FtKfBk2f
	UrizWslZkgGPSFjzzjW9WyL+lBm8=; b=ApGv9FmTtjj5HyrPobOUjzthkiPi3iF
	4vwMmCRTTGh3p5hEFgBAKVOuWMUP38udAjvbfPO+EEsOFI4kX7wGSYaifrtMT+WE
	xEUfo+2QAtT8bOaq4tpEd5QXhA0DeDHJ4ebGWhkSDua5ZWm0ozXokNgyk1JrugTf
	+569deULTJMD8QdMae41dEjErEyB2v00pSpffDFfAagL1ml/opKJhUiXNrfhzZ5P
	NrOJDXmeUCiPwUtyh7f/sQN1zStFTnf7VdBmfaCKcUDy4unkzqcxvhT9wBEoce77
	kEmHoYjcvUhdBKrez1ooGUCI5e/gImWYXNhhcra9LFOl1C3rYR4LG1A==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010017.outbound.protection.outlook.com [40.93.198.17])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gf0jv53kr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 12:48:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFDT3sfTIybETh4Od0uGt9xPCtibkYE11O5sz2ZBk+EjYGkNiT/8wRun+JKiErEGTH2u+Y+Vzsstjnx5sQzXgwWiNyKErEib+pyPi03ih2dw8ViFE0eTbqYWIt5xNWL0D6awNv4IQbDHQKiOSI3nL5R8GWf9CNe9l5VvBy2Vy5Hn2UvDadsrelTLhxqFQFyIjsT7z20QYMxZ1OMo/0y/NpR/xDCYzcVBSsUAqdSorW6JoPfeW8mNyxu9mrvBqGtt2f6fOWbkmk8N8IW3wQWwncriecXSTJrajMgV86vjG13zEC9AW86moaYqZimlk0AysZ5cjS9Kn/hEmrifyYhmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGePGM/FtKfBk2fUrizWslZkgGPSFjzzjW9WyL+lBm8=;
 b=JhhAOB24Y6FNPnkHu6xVw0iqFQ9rwo2vF1LsAwqIMpw9mR/QMhxnLsjo0D5UI9wcY6aqxanASGqfrey7vYW/HuZpSs/nH3yWAOuVHhPldyoXK2ED/wODbot36xKQTMUK9RJpI3WWbWMHWdF8q/pKuDbj4TVgOhA+BRTHCNmy/QrgDp6vvP+C6v9me3jyHj/+tseAp1cqMI3RPQbiwwmduDVYd8jFiqPydyDbaNewHyGxgxDyjleCHGld1zOqlXH+EwQVcJOWVj4OHudK9eSYychY0A2vSNnVKiahpyu8zDFvCcmRAeD+zP61Rwc6itaTFGsHpAwYbSldEgvjtOpI9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGePGM/FtKfBk2fUrizWslZkgGPSFjzzjW9WyL+lBm8=;
 b=DeCPffwVcZwU6gNP0nP4yrBZ1xlJtcs3u9v/cu/lH1Qop1L4gKip0PJDrwhTD/lMubmh3PaFaF2fskUfLBa7gRil1FGDq02Wl1IWNgbrZF3RRtTGWC6OreumjIt+DJNaiD6CIBzNdpwbAznTqnIA7PYLzmmKWl3hiX9bBfyxUsc=
Received: from SJ0PR05CA0008.namprd05.prod.outlook.com (2603:10b6:a03:33b::13)
 by PH8PR10MB6454.namprd10.prod.outlook.com (2603:10b6:510:22e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 17:48:06 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::58) by SJ0PR05CA0008.outlook.office365.com
 (2603:10b6:a03:33b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Thu, 3
 Sep 2026 17:48:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 17:48:04 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 12:47:11 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 12:47:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 12:47:10 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683HlBQO3003330;
	Thu, 3 Sep 2026 12:47:11 -0500
Date: Thu, 3 Sep 2026 12:47:10 -0500
From: Nishanth Menon <nm@ti.com>
To: Rosen Penev <rosenp@gmail.com>
CC: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: ti_sci: simplify resource allocation
Message-ID: <20260903174710.yxgdfqjt5neryhjh@earshot>
References: <20260430221123.79947-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260430221123.79947-1-rosenp@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|PH8PR10MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf1614f-16de-47ad-b6c0-08df09e38185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|18002099003|22082099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	yzvjTF4iqfRFKaXdT9Zf2Hlk25srpd4CTRObX6mPpYrksKjp9A+1OXI5zdFoaRyogSaYYee9nIAtaedrtvp8FvzPWMzUHG5rth3iZwXsmviP9zPLRPDbGywfrpCNCqOC95/gSkf4ikTrOfuqAydiBfn6yurFg6F2/xV4bNbJBMNcKLCc7/9gjjHXbWlYUiYae8vBRpuVslUbY/5JmcwSO2hqO6eosxEleavlzF0jaUqY3f6iugW3C+yQ4QcspJ8mtmkQidV/qOwoYg/sQqN30vpEyDwA3Rqfs2nB3nmm4Sw3F0gHMNhqMVHvgtir6/BuLSJ8rhLba/RlaTVIIuvjYQ8617k2M2CVHxLsUYUBWIVumJyvHOKokuaQtiQJHY+3t1KEGqC8SqWzSu8CNfVfrJyILoCVkay56+xtDVJh9DeG/G3ErVYoj+yTQsMWLPWbaNzEl4vRg1HAzUtVj1tx10se28dKu3aliVfUG8Idl4LzTTqzhWfO1u2M4EVFj80EchQm4bcYqU8e+NdeQOsGMAAMzpof0HOJ0BFQt6knWAexETTHablEH5RUCzrpSV+zNo6w7nOJZLC7AzXhU4LnSxUDSisKis8TCm1460tyfHSUvQCNOGu69Kpe3r7m0DEQLup3ljsfqlN0FB895CiCi8fsjg/NMYug7q3Cz80zmkQKfu4LiB2rUAr4JdyZsBdrzYPkHS8KvYp7CgCyXJiLdQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pl682+UadOVP2i5fY8zSp5dVk22vznIURBcRY4WfwoTPUKlWza0qs9SCesX3xnDjXnYIe1f0hLXtMJxkEBJkEQgjJZVISrfLu3UouJCEc0/FQIih+/n9KzMVJlXXz8vqLTSW9B+MYL6QnUyHwOzrFg1lSCS9syS+wzXruQbhLhUUIbcjWigvrP8ErlUPI+a3eaxsOIkrDuMFCWp3XvO9XqO3keKroEhFUlwN18/6ceATfVBDq5Qt6HvMKR8OnoPbLV0fh9aoGAZiCAz9Z2d9eUCq8UFKfLTRM+3v5p++i9f+7ZEa541LS5JzkwHWy/PdMQODVx5n5MKbUq7jEPwcenm3ZXbR55bN8Hx2YEipDKr6ccUFo+yeBlLUBIevvmJb3TqnqysBepcloPGJBPw7EaFHwFcqtVmqeip1MIQAgikAPpt6k//oJ1wN1zY902MF
X-Exchange-RoutingPolicyChecked:
	Rq1q3eLlHhPcw9E7uPYrBkiRd5q5KnSxALzWewyB3SwxPp3iFfl87885mgsmB0goRL5SswVKCRJzK0m+bFvYD+iXhlJRHVRYdOY8pS1v5UWAYaVyU8nSgHebj0mtrEoP8GsbP2Uhyz50gQ6v1FOaUriT+UGXvzy9UywQDoXJ7TvlVv7JoQd9RWre6U7tg+UVaeMSJJQkZjoM5U285XnUF5e/J3VGd9M9X7w/3IgKniPTcxZdsU28GRB4e7e9NhUAtyYADFuOPabuoH6vpHWatGiBvfYUFcrtQ4l7M6KbgyM7qHtKwnSQiyHHtvDDMRPKYOKSD9FN1tZ1wU1a96uBSA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 17:48:04.3862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf1614f-16de-47ad-b6c0-08df09e38185
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6454
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE1NSBTYWx0ZWRfX/lLgCpPFXBS7
 PkWUoEHenT2/RLo+UHMMXcekODRnBQ4l/jtFTRVp1gH65HVfaOcvjXVFN0XlmNrCJJC/ySp0il4
 E4LCkDh3GTK4xbFw/qyJrh8gFnXiiGY=
X-Authority-Analysis: v=2.4 cv=J6eaKgnS c=1 sm=1 tr=0 ts=6a99b2dc cx=c_pps
 a=gXOkrB+iIAMM2YfcT1gRiQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=wgstlb_kzrty_aTNqYoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: xiVeto_2lUUzRtpKMdcY8E8YZR_SQxOc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE1NSBTYWx0ZWRfXxnSEaVhDYlU2
 hivSzMyk7Lq0UH7aRtiYD5YGaU+A4HoEWDvnoZQpagtWdTwgRDWNKFtzaVI+wZfJsHwViO8RqHK
 g+cVe+UKxCURwiQbl8aicZ09ynvkNKn4qMamq52rqhSNaIdsn/laJXN4zd5faaet0vTq2/r8Xrf
 9gf628I6eOSjS+RRBO2zQsWDFJ+Jbk94x7rhFLwsTSxCRWAB9X7PA/4rsEeYAHDO/gYPI2dZygS
 CA49/IZwJ1aJDayXmc6lfnPAGMyppUI++C5dicgs3G4JgVOY7xGgvFcOKpq0DW1OIFPveKlRlOp
 DjWcJdzdXUvzGr+1edOy5wdM9PuUo6tuAVOW4JA99Z0ORqbVrP2nFhOCL57OJDG5/9GdZbrfPbE
 hv53x8kUnOqU+xzFvXuhkQiSXwsP+vLfxJNAe+vVcbvD7RO4y9S/88YFRIflOmSo7KaJhinopk9
 x1OdLVAbsZlWSWrknZg==
X-Proofpoint-ORIG-GUID: xiVeto_2lUUzRtpKMdcY8E8YZR_SQxOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030155

On 15:11-20260430, Rosen Penev wrote:
> Use a flexible array member to combine allocations.
> 
> Add __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/firmware/ti_sci.c              | 7 +------
>  include/linux/soc/ti/ti_sci_protocol.h | 2 +-
>  2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index e027a2bd8f26..04d99c1fafa1 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -3574,16 +3574,11 @@ devm_ti_sci_get_resource_sets(const struct ti_sci_handle *handle,
>  	bool valid_set = false;
>  	int i, ret, res_count;
>  
> -	res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
> +	res = devm_kzalloc(dev, struct_size(res, desc, sets), GFP_KERNEL);
>  	if (!res)
>  		return ERR_PTR(-ENOMEM);
>  
>  	res->sets = sets;
> -	res->desc = devm_kcalloc(dev, res->sets, sizeof(*res->desc),
> -				 GFP_KERNEL);
> -	if (!res->desc)
> -		return ERR_PTR(-ENOMEM);
> -
>  	for (i = 0; i < res->sets; i++) {
>  		ret = handle->ops.rm_core_ops.get_range(handle, dev_id,
>  							sub_types[i],
> diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
> index fd104b666836..7632bb11c862 100644
> --- a/include/linux/soc/ti/ti_sci_protocol.h
> +++ b/include/linux/soc/ti/ti_sci_protocol.h
> @@ -599,7 +599,7 @@ struct ti_sci_handle {
>  struct ti_sci_resource {
>  	u16 sets;
>  	raw_spinlock_t lock;
> -	struct ti_sci_resource_desc *desc;
> +	struct ti_sci_resource_desc desc[] __counted_by(sets);
>  };
>  
>  #if IS_ENABLED(CONFIG_TI_SCI_PROTOCOL)
> -- 
> 2.54.0
> 

drivers/dma/ti/k3-udma.c: In function 'udma_setup_resources':
drivers/dma/ti/k3-udma.c:4689:22: error: invalid use of flexible array member
 4689 |         irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
      |                      ^
drivers/dma/ti/k3-udma.c:4690:13: warning: the comparison will always evaluate as 'true' for the address of 'desc' will never be NULL [-Waddress]
 4690 |         if (!irq_res.desc)
      |             ^
In file included from drivers/dma/ti/k3-udma.c:27:
./include/linux/soc/ti/ti_sci_protocol.h:602:37: note: 'desc' declared here
  602 |         struct ti_sci_resource_desc desc[] __counted_by(sets);
      |                                     ^~~~
drivers/dma/ti/k3-udma.c: In function 'bcdma_setup_resources':
drivers/dma/ti/k3-udma.c:4881:22: error: invalid use of flexible array member
 4881 |         irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
      |                      ^
drivers/dma/ti/k3-udma.c:4882:13: warning: the comparison will always evaluate as 'true' for the address of 'desc' will never be NULL [-Waddress]
 4882 |         if (!irq_res.desc)
      |             ^
./include/linux/soc/ti/ti_sci_protocol.h:602:37: note: 'desc' declared here
  602 |         struct ti_sci_resource_desc desc[] __counted_by(sets);
      |                                     ^~~~
drivers/dma/ti/k3-udma.c: In function 'pktdma_setup_resources':
drivers/dma/ti/k3-udma.c:5083:22: error: invalid use of flexible array member
 5083 |         irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
      |                      ^
drivers/dma/ti/k3-udma.c:5084:13: warning: the comparison will always evaluate as 'true' for the address of 'desc' will never be NULL [-Waddress]
 5084 |         if (!irq_res.desc)
      |             ^
./include/linux/soc/ti/ti_sci_protocol.h:602:37: note: 'desc' declared here
  602 |         struct ti_sci_resource_desc desc[] __counted_by(sets);
      |                                     ^~~~
drivers/dma/ti/k3-udma.c: At top level:
drivers/dma/ti/k3-udma.c:53:9: warning: macro "UDMA_RFLOW_DSTTAG_FLOW_ID" is not used [-Wunused-macros]
   53 | #define UDMA_RFLOW_DSTTAG_FLOW_ID       2
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/dma/ti/k3-udma.c:52:9: warning: macro "UDMA_RFLOW_DSTTAG_CFG_TAG" is not used [-Wunused-macros]
   52 | #define UDMA_RFLOW_DSTTAG_CFG_TAG       1
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/dma/ti/k3-udma.c:48:9: warning: macro "UDMA_RFLOW_SRCTAG_FLOW_ID" is not used [-Wunused-macros]
   48 | #define UDMA_RFLOW_SRCTAG_FLOW_ID       2
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/dma/ti/k3-udma.c:51:9: warning: macro "UDMA_RFLOW_DSTTAG_NONE" is not used [-Wunused-macros]
   51 | #define UDMA_RFLOW_DSTTAG_NONE          0
      |         ^~~~~~~~~~~~~~~~~~~~~~
drivers/dma/ti/k3-udma.c:47:9: warning: macro "UDMA_RFLOW_SRCTAG_CFG_TAG" is not used [-Wunused-macros]
   47 | #define UDMA_RFLOW_SRCTAG_CFG_TAG       1
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:290: drivers/dma/ti/k3-udma.o] Error 1
make[4]: *** [scripts/Makefile.build:551: drivers/dma/ti] Error 2
make[3]: *** [scripts/Makefile.build:551: drivers/dma] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:551: drivers] Error 2
make[1]: *** [/workdir/Makefile:2232: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2


If I am not mistaken, k3-udma.c and k3-ringacc.c will be impacted. can
you check and update the patch?


Additionally, please CC LAKML.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
