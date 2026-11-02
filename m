Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793588375;
	b=npkA5DXgo3HndqsRURyvEjAHeoQIjtvnFoIcyFZ1SPsXutf1Xb4ip7dRkDAWJF/U9V4Z
	 TFWgvMx1lN1hdOsS4VQLqciRsxp9YSEnCM9vTvcN7ypWgwt4F+mgGAJVyETwRGBME8OTV
	 3kaDhEAnIUI1f06nVDOEYZ36Em7iXL7bZHBipJjpEpq26DJYxE120Ubfh7RYyV4vNL0MG
	 IGj9yPrv/uPa5uUzrkdb1bDdbeb81ekMYGmZ+ocxKO2Eyo7Iizf9M1c1VFXpFz8Hju8US
	 3Je9K6Zssl7N8o1vIr+vKSn2RBU39NFWwAeuiBfSOvP8r1vV5U12un8fFghpyjHkKZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588375;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hvlITl6CnRue2LWoCP8CgH+DrX75VdvFj+E8Y1lJZ4c=;
	b=N8pgjWMJ+N6f3MVmU9+GE9nsLEfsCvKAL7sMkSpt/gsMN/gOsnbspiw/lqh+M15+cIdl
	 ObXNqVGWgT3no2VodWj8/BCAhKuRe7em+cKlctadR3xA2rhtBv57lNWwjiKPbn1DaKVTz
	 /r71TsIUdpDUwSpHArH4SwAJYJa/mGdo1gUmbSfSwFKzSBLHrzNEzLPGF+Uxk5QBz8+Qq
	 5pepv1n0t/YZBI/hR2Z0ELK3j95V4XwXQvg3VZTqxdrK2tOG7X/akPSQ8eP9ZJLntCLDw
	 63UYJctf1DH5hwBQxYLxJ/oBCVvYAduJP5HSDUjZK72x7pMGvoMgNmoxP5tJoo2EspQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iqtc0Lu6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.19
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB84606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB84606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iqtc0Lu6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0D5nN2ePXpOy2u2g95VNimNuLBWp3AhTgDyEIwdape6twpHTYc7iX/JWLYMhiGv6fJcNlzpmQmUAynUP4hAhdSKp4aq6RMQSYb7ZYK2Z/1oZ2cn8Zfs65+b+/6VB9rbg7I/ZanAwhIX+OQqo2HVYvE0a8saJ9cshssEXyMbDRqsukVdjy5Uw3onhMeh0gFQF49tzE3C8BpAC18r2SkF9an0Oca1IsA98tHTsDOB4Tqve28X9/AuQbnecr3IbGuEfhY1eqoy9o19Efat+118QjUQm9Eb11xrVCAs8pWflxy49YgHvSWHz4/+ZhEiI+0xTO13IwJLgYuZFeYlOX+rlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvlITl6CnRue2LWoCP8CgH+DrX75VdvFj+E8Y1lJZ4c=;
 b=lJt5q6+/5V1/5dudHGq8aBJ+OZv1eKDYjcQXlA+qMWpq6Tds8k5D6o3iYcAoP5h2DB/37jDSbMr6aNJmzv0/c+w9rh725BsGINsTesA/CnpSVCPoyew/34t3qY3Mi6hLZ/VO4HyIavy3iX85lTn8GHndCwdIjhdfR6jeb3t1b3IjHQ3mq2nHsFIGjWGHJDfwMhy/f9kaUuMFEWU328dBf0yyDg4Jy7IqAcc3iClzJVy+qFfXCwD/XMMAv3wcUPQd+zMNR02N0X0bn2ICdHyLdoqQ7aJ+WUf1tF1C0t7UkNw4Xwc0p4m4uzs9RdJKatg1Hf9mrlNWxNxCAl9Bdqp3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvlITl6CnRue2LWoCP8CgH+DrX75VdvFj+E8Y1lJZ4c=;
 b=iqtc0Lu69T3XfO7aqjAfL0lQ6FCIaNPV6b8GKqmkE56hboXRbDVoAS0jiWjyz5rWDEEoAdGM0Bl52wtc77EEhMeAJE3jULgnAdjPRqfmWwoBwwcK+L2PR7z+YelLGfSoRDim8OdZMf07M00t0LXCZtC/sK+mO8c/PZj6BOaPyTc00tsqccgth9UTrNo2PeNoB9DB5JOWUjTzCpJIr9uV8O/kpDC/05UqBz7FdWZ52Wm4jLR/oab/D0dM9N8cX2eiiFzD4gbx3tBnWKfn2xXbJXBsjkvGNrirelFP5+mviCUX7WmhPTC7hK06LQhmZe4KNc3IMTUfdoU5+JYGWlRCrg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB9730.namprd12.prod.outlook.com (2603:10b6:610:253::9)
 by MW4PR12MB6952.namprd12.prod.outlook.com (2603:10b6:303:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:59:30 +0000
Received: from CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128]) by CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:59:30 +0000
Message-ID: <18e5ff5c-e0ac-4b0c-a725-5855a89e5c84@nvidia.com>
Date: Mon, 2 Nov 2026 13:59:24 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] taskstats: use nla_put_u32() in mk_reply()
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
References: <20261101005616.3022705-1-brads@mainlining.org>
 <20261101005743.3022780-1-brads@mainlining.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20261101005743.3022780-1-brads@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MEVP282CA0038.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:206::6) To CH3PR12MB9730.namprd12.prod.outlook.com
 (2603:10b6:610:253::9)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9730:EE_|MW4PR12MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e0059d-a01e-4fc0-a1b2-08df388d50c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261028144727099003|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	btSak8RZUxi/nOt8jgqT9SpXXCAUtwv0XTyH1aTlrvBTP0qjevoA/q4HTjuDYZgrDJQVKo0EX14wPezrbMqGsTbhpXm4SlmAiCQ6o27Px5mIeEAcBCd+6tnVsyGdyXRsxBlPZwmmoYa8sW7dP/kZEaEf310Y+LnSdJwHfKHNdJuAoG3tC3/BswUuk3EbRwLye1mo/nT+NKTj+7LCNkYTi46dbY1h2kE81KKelIntjlRJzu1bjPmCuvAASFT6oVr+xz0c8Dq1y2TItdwEKfv03XMD8oy3xEehn1Q/3pKmL/aC3DW1Po83UkuL0DEEDgxhHho85uXaAJ+KItnTmwkYmvlV+Z/Bn/4WeAAuyN256e6JuWS+Lykn9VTQubYJmuD89ssZArTIsdb5YmkdRGLA/FvoysnQTMQIwe5s63f6OT/MZJIki2I9Mc3t+hnLlnUK2qM3hMGrSz8CZPf+NhdT90tgZXxAGCG6TcSPTbqVdaOhtXNvBpqZnBXKzsqyTnR9ASP+fwZuNcUuHdrQKDz6SwrRcIWEaRVrpejTpEXPGzEO518Yjw+6wwi5+t0g3dQ/uWhK6f6NWZoMTDl4/Bv/3U2GbLEfDzfQXJzL5XVlQnbew74vZtdZqeK3lCbNPEwNqST9uR9xjx4Eu6MtShGepT3xq9fRcRsRiTVZ4L7r2zA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9730.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmllQzl0ZkcxR2RET294YWY4OGdWMHd3NXk0eTlJTXJwTldESVkvUU1jWGFN?=
 =?utf-8?B?Wi9jd0pQc28zNzZUK1pnRkJQT3pWNkhnQ1VuWmk3Rk8zWFlwMTZ3ZDFGdW41?=
 =?utf-8?B?U1h2YzZvUU9NUjRIc1lBQk9JMFpablNsQ3p0Tk0rY3ZRN2UvaUxubmlnaWtP?=
 =?utf-8?B?WWY3eTBrK2x2WkRkdW52ZTRLcUFxcHdBZUZVRGJudGJQa3M1dkJiMTY1Z1dM?=
 =?utf-8?B?ZUFKSE5qZnpJbFhTYUliTVgreDlTeFFkSmlrRVFvM0g5T2FIK1h3eURqTmVD?=
 =?utf-8?B?bGl1bUJERVZmZE1VRXE1SUpHMWJ1WVc0aExVNldac2UyYVFzRnlON2p3ZDBN?=
 =?utf-8?B?U2xIVUFUNDVNL0VZUmR5VGE4amZYNlZTemRJcXRUanRyVUdCQ3hNUEhuZUlB?=
 =?utf-8?B?Y2x0RnVTSEVjWG5GK2FzMWpjUVpUMVB5UjNBaEZ0ZnZuVnhqaVZtNVRwZHhD?=
 =?utf-8?B?dWJsUFZBQXRFY1hkSHh3QzVoaUgwSUtCMWluS0ZxSnBDYjJyWWNhM0FhZlRa?=
 =?utf-8?B?SXVPS2RpV3Y4a056TndrRy9QM1NzSXZZUEZnMGlJSWVzTEcwMWxCZEdYQlNm?=
 =?utf-8?B?SjBHSTMvaG8yRjNMdE01b2doSXF1Z2JJYk1tNkpld2RtZ3dlT2RpY1dESnJH?=
 =?utf-8?B?VWh3bjUvZXpqYXVyN3NIaHA1cEhiMFIxWHNNeXEyeGMybndkOHV3cWdSSWRk?=
 =?utf-8?B?WGViNEl0MS94eWNPNzhxcFV4ZHBvVEpKTWg5bHFIdVZjWUFIa2Z0RkNIMWI2?=
 =?utf-8?B?aExoYXNWcHBZTGZTSE9TL0I0ZVhKVXhiN3phdXd1NGJGZXU5cXB4cTBDbzJ3?=
 =?utf-8?B?NWtmZTNPQzdYWEFWM2h2WDZKckdtSFUrM3M3YVFoSDNlUmh3b1dLeW8zYTcx?=
 =?utf-8?B?Zjg3Wjl0ZnlmYmZsalFRL2h2bkRyc3FneFpVcHFNY0FVV3dtczNDdSttTzhu?=
 =?utf-8?B?MzZaSnBmc1IvS0J5b1JvU3lwYWpZOEJ6cDFFanV1d2NjUHZKcVh4MGVQRzZw?=
 =?utf-8?B?aTB4N2tPRDIvdzR1VVE2UWM1NVZMUTFVT3N2UUVYSnM1bXBPS29pb01rTjIz?=
 =?utf-8?B?V28ySHZvclkvbzdpbVZwSGZjVDdNN2IvczBML2NmaDAvWUllYmRGa2ZmdEhF?=
 =?utf-8?B?ajE4SlpjQmE1YzM2N2YvZkVHYjNJYW9NWktGbjJRYXhoalpBK2lGZEVZeDlu?=
 =?utf-8?B?M2JPOThpU0I3OWZmaEdmcnZ4clUyL3BvUkx2VHFtUVo5ZjNRVDNMUWZkblJs?=
 =?utf-8?B?cGxTMmVXdFBjc0VpcjNxSUpZUm5qeW1mZ1hTYnJWYUJRVzI2WENJZlpJZkUr?=
 =?utf-8?B?Q1RhQ1VERWZmT2R2NjNlYkpjTFlpMkwyMVdBTXExdEZXVUlRa2tKVThQQ0ps?=
 =?utf-8?B?M3ZhZGJFcEhkL2g0dzFZbndyYjR3MkNnVjNQVnNMTXJETUxTUVFLMDZNZGlr?=
 =?utf-8?B?VFc4TDZ4bWYwdmM3dENHbVl3QVRrQlVpaFQrbVBkZ3NrS3U1WXoyZ2h5MlZl?=
 =?utf-8?B?WXYrZDJlTG9PVFB6WE5La1hVK2lONS9zV09UWDVCbFdodWlnQkxLNDFwbGlz?=
 =?utf-8?B?YnJ1a1J3UXF4MmVlalFaUVZ4Q3RLWEVRTWkrSWlRZHdQWVNvKytBWjlTOGlW?=
 =?utf-8?B?dXIweDI3VVBxM1VEQkdnbDcxMU56Qk00bDhSVkNldEVDZFdDRmV2c2RRTG85?=
 =?utf-8?B?NHpGaXNWZkhQdFlPdVphYVQ2cTlGRUlnVDhMUi93ckRBN2s1M2dVeFRTbHZT?=
 =?utf-8?B?NkoxMmpnNXdvSU1QRlNoVTdFMjcyV0k3ajhPRkpuVlpsdXVNWno3NVhhd0dy?=
 =?utf-8?B?bGE5NUwxYmx6K0F1UFg3QzgvbkFDTjhSODQ5aFQwbDg4Z3VVY3BoekJ5RjlJ?=
 =?utf-8?B?ME92QkQrOUJreW5rZEVsQ3BMNDNTcVJLQ282dnBpclI1VDRNT2Zia01yZDl0?=
 =?utf-8?B?Rmw3SXJCS0ErYkpTZGpPZXBsVWYvUVZnNlhrNTlrMmxXK1VoZ3lwOWMzZHNK?=
 =?utf-8?B?Zllha1FHM0g2K3RuV0ppbi9YUkdGc29yRnhGVlNNRnNhVXhFQ2hyeVVPWVRV?=
 =?utf-8?B?K0FPcDFUR1Z3ZFhSQUc2ZGFnaEhuNHhqVVc0WXUrdGJHMHEwcFdZMGRqTy9C?=
 =?utf-8?B?T3RMYmsyTUowOHEyZWM5Ry9taHFWTUxKUFNTNDQwbDZUaE9rcHozMEZBZFY2?=
 =?utf-8?B?T29MR3ptRmdhbG52VTdPWHBlVHI3a2NXWjc3TEhTUXBZVXduYm16SWw1SG01?=
 =?utf-8?B?c3ZDOHVqVHBuZ0ZkT0NLYlFsa1ZPMUdzV1hiWVZXeVJUYlh3clNMdGh4QXd4?=
 =?utf-8?B?YnhZRUJ0ZTg4Qng3Ump0TFVWY2tLa2FIR0ZFMU4vNm1TUFpkc1dMZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e0059d-a01e-4fc0-a1b2-08df388d50c8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9730.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:59:30.7536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCSH0+LJH2QtCOuEyhImsFNN86mRnoG3qlIs8jKsgEU9DocmaXrYriG6UbifrHCKDjF5eTzrFIt8BDmmBie+OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952

On 11/1/26 11:57 AM, Bradley Morgan wrote:
> mk_reply() open codes a u32 attribute, nla_put() with sizeof(pid) and
> &pid fed to it by hand.  nla_put_u32() is those same three arguments
> already collapsed, and it is what the readers of this attribute use.
> The helper returns 0 or a negative error, so the bare if() catches
> exactly what the < 0 comparison caught.
> 
> No functional change.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  kernel/taskstats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/taskstats.c b/kernel/taskstats.c
> index bf517788b8409..37422c43b8caa 100644
> --- a/kernel/taskstats.c
> +++ b/kernel/taskstats.c
> @@ -386,7 +386,7 @@ static struct taskstats *mk_reply(struct sk_buff *skb, int type, u32 pid)
>  	if (!na)
>  		goto err;
>  
> -	if (nla_put(skb, type, sizeof(pid), &pid) < 0) {
> +	if (nla_put_u32(skb, type, pid)) {
>  		nla_nest_cancel(skb, na);
>  		goto err;
>  	}

Thanks!

Reviewed-by: Balbir Singh <balbirs@nvidia.com>
