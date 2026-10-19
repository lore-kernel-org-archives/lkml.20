Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023101.outbound.protection.outlook.com [40.107.44.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A469A277026;
	Mon, 19 Oct 2026 06:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391022; cv=fail; b=C6otStNvbIdXGTlguBWYsBnPSBZGwY1f59cBHon9WWRflDvyUsml54tJhOozRtKpjinyt4Fpt0sg5O4TPOGjoZOp3PhNiHrzrtFoGPQGbV/wHf3yn+6HulJ6M9nt4b/BGdEpI/fdsPf+oVbMg9u9p320vKWe0y/PLnRHV3EERwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391022; c=relaxed/simple;
	bh=kuOmvl09DlW8zaOzqCGCAWQMGyGU5Y5/LHUeiiE0+TQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SWHG5wkfbMgibvrucT6nhQm3MWl9TVL65N1nwQGmNLVd6Hm/PcRjZVFc/CnIrcBlJmGjACY7Abxx6GSNnWUl6h4lwsD397iupHRcnOPu4p4Jk6cQ8gVKkvrb2Oel+TzrJcAHaiXkaKEyamdg1WjiXOTo6bAHaPduN9PVuiVlxl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=H6W8vspP; arc=fail smtp.client-ip=40.107.44.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="H6W8vspP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfDVkCJQK/RRD++71YaQgA6oYtxkTbMihPab4gRjUDXS30EaQtHiVO6MMH9mHFk6x1gWtjGLurMfNor5hObv9ERVJ1LYdx4gZd1LOXprCWuXFcIoch+Lb5RU9n7iknlSGp8+TDcYyQ41CYyY4sP+Pe4rPagS6hRX9Z/RY1a27ijZ7CQ2j1Lny/UXV1FvY1dj+u7Us3UMRkplZxSKUcH0f8/VvHZe9E1f6eL1tVA0bBgpb3pL3PGEJlZ3gx1UH5DApGhZ/mnBiIW/+NVMLI+bk5nC7ZgQWQgkC5JN9uR4ev/oQuQD2sscFCt62nQo4B5vlJrkVuS/HEHZWAflMp9LGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwR1dCSIm6dMC4RHy8HX5zzahIcD7FfzPsai3bVw8Ac=;
 b=BaJjf/pQczX3okRSpvnV2vlPcrv8f9yZfA6KAkovRDlUAz1gA8Y/ozYNZTjVT8CwPBJnHaM9vF8YOmhdV+l/hUB25evJAdgKx2wjdRyZCxXrZe1TwXQx7b0UYULQrYawDbe4JDu5foMCkb1DXr1Bj789K8SyA5tsS+AP9C5sXI0AXGZFe4P8YKbPWjD6pcmjrPXcO3KObEMtCCdQGQ6mRXAyoOtQvTBnPGB6mAmbXqIaSeY+XG0NspEwKUljzKIdSBhnzc/PCyPcZG6rguURiyJlyZZcfExra2CvixmpmA8koW8p9yXZ8QvGlXD3SG3FcKmmEY9U7eqbwhkQXUzhVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwR1dCSIm6dMC4RHy8HX5zzahIcD7FfzPsai3bVw8Ac=;
 b=H6W8vspPyDeYXse/p8wDL0Elm1+BFNeXN7hV1rt+9xZP4ZkObQDehWvS3m+jhdEnV31hNwUnRW4c5Er2VmNNdBiGidZwBnJBzRlTuIu4GJIdt+DwNUKvAI93zJEzR+1MsWSDWDiJ4Wa9k0xSJNX4N3edLY1N67JaAJ4yCJro6T0HpRh8jbLAtk1rQM964lfojDf125oNXsr2+TCSxnZUSYKrRIqPgybUF0VwDnTBEPfZQ4FyDrM5PJKFl228EkGGT1H1sbGLr2Q7KZ96m5YaKMNdgmeqb6xkb6RHu4dL/eCE2zUqD1qkt0v8ohW/HreBGjDCGyBpDbcVeVt1EfCMdw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB9647.apcprd03.prod.outlook.com (2603:1096:405:39d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 06:23:37 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b%3]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 06:23:37 +0000
Message-ID: <5b66f679-2ced-47b3-966f-b75e67f8a6ec@amlogic.com>
Date: Mon, 19 Oct 2026 14:23:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: c3-mipi-adap: handle runtime resume failure
To: Jiale Yao <yaojiale02@163.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261003081129.433041-1-yaojiale02@163.com>
 <20261003081129.433041-2-yaojiale02@163.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20261003081129.433041-2-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::9) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: acdb23b1-820b-40f0-18e6-08df2da9824f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wtCRVt6B8f6CWxOo0EsmbWlyr9XOFj3Cnh/8G1otF65BKAE9RveuAQGCUaf39UIFw3giMgRjDRsDRKHxR+/bEKKshrOtH/aD3ilAQDWoeOOL0OBpAqA3XQbB+Vi66AxYkVnLKvKM7C9dSV4cjfJmDg2GwH2DMObrLiLLieFfrYlBgr1slGMyXC3T5VDO61gdlzzfTvEqHhrvnRZ5KdsnGY26WgToN+a2W10Rkm/Cik/FMZhS4yIUqm5EgIfXpJGCoJdggdtRPaLcI8vE1j/Qqnnh3BXfD9jKtwWSToM1jwufBQ7clX+vnVG/f+96ozpuZ34kLqPE6j+CYH8q/+XNUpgkrA9SmLONrguAdspwIxgmMOYoVXHdMyxb+695+pCHBpq3UH+wqCmRbzMpxuvWx40DeRGq40ZWTJZcql0qjMMXofIhy9MVzeP7+VYc9wa7qLl+Kvd+zxbETKNzNyiPAlBWUtYR5Tv0wBXGTDpg4okERzHWMrLxp7B0OB3/DYu01UCdV9sFEFqWYK2l3vzN/nWbazeV2lmJA87H6RwLwbp+3R8S9gsl7VssCpHdWEnIQJY+cAxzHOJNT7Z+AISx97Nkp0iiod4DMoqs8iX1nfx8MJX33rDHyw7P0jVLQmSx5AgxW0r4lViDK4bdGDo/nZ2wtyD5ffXQ9JW27R3G6Cg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2xWR2xtemRuTGdEeVB0UndWVzhTYjdWaEx5empJUXdxaEI3Ry80aFJ5MzQw?=
 =?utf-8?B?UmhZTHVIZHdXelJGbVpmc3FwdlpjeFpwT0pzbTRHWlN3SGZSdGhjUG9Uek83?=
 =?utf-8?B?ejFwcXZFVkNTVTFKMnhLOGFUc21pL215L2tZcU5zVmowVUt6ZnBUNHVFazhM?=
 =?utf-8?B?azNNbWY1eTdCZFdhS0xnRGpYOFpjRC95VVdVMWNaaEJ4Yzg0WUFpZjArcnlj?=
 =?utf-8?B?MFdpdGJsdDhzRVBEd3N4VFBrYzg4TnFyMk5acnk4aFl2QWkydWxMWUNEa0Vm?=
 =?utf-8?B?MG41dGZuM0M2MUNJL2FtN2xnanM0MzI1NkFOOURKRjBQeWpKMUlTdFdLNnR5?=
 =?utf-8?B?WVJlU2pBZGtXbEJxZ2ZZbkZiMWhHREpLYUNBWU1qclh4VWxlbThodHFhRGU0?=
 =?utf-8?B?VktUMTJKSmxJaURIRFhWbzdFR3NuczJCdkZXaHZjWlViWDRCbGcwM1p6VnNx?=
 =?utf-8?B?bGNpVTVRZ0tuaEdPSVVDZmV2cHVETTgvMkNVenB2TFYzWHhpODRIZlZ4K1Yw?=
 =?utf-8?B?eGtLdG93amtLL1d1WmsxeStPTkUrYVkzbnZMUDNRbWM0b1B1aGdKRFVNTHBa?=
 =?utf-8?B?NzVWdXF5UGhRZnhBSDd6UVY2RkpiYlhwRDNmUXVJbmRDQTFRT1lVWTlNRmVU?=
 =?utf-8?B?VjdkRnIzTG9TSlROS2paUElnV0F1c1VLSjZzZm4vMHhZaXNOTW5pNVRsVmVx?=
 =?utf-8?B?U015SkZWVVlnUTVmdTRSY2gzaXZXVFl6VzhkZHc4cUpESTc2MzFmelVkRWZi?=
 =?utf-8?B?WjBZOTNENEZuTTFYaGJoRkUvNUdUWk53WC9jYU9DKzVVSU5LekpLUmtoeTdE?=
 =?utf-8?B?M0pEcmtQUTcxQU9PNERJZDZTcnNHOWYrMnl2MWVYQ244bXovZVdGR2s1ZVBw?=
 =?utf-8?B?ZDBPRGppcHhCT1B0YjVaays1eGV1VlY3eTRWemVxT3VseHRCUVpMOUcrNXVq?=
 =?utf-8?B?TjJvTkFLYVMrcWtqejlCeEFFdjNrWEp2cnFsMU1KMmJlVURaZnd2VlUzWk9h?=
 =?utf-8?B?R25VVXpJOTdha0tnQmF1Sjh2NEVsSlI3dEJvL3IwWDFiK1gzUUN0KzZXMm16?=
 =?utf-8?B?c29DcHZ0allRcENRc3hpUW5ydGduNlpkU2pZa1dFc0J2a0pEZ1pZbEFyeC9L?=
 =?utf-8?B?cDdNa3lJRFBtb2VpWVMwdlNyWjBvZmhiMWc3Z3pMQnB6TFZOb1ZFM2JUb1pV?=
 =?utf-8?B?MEVZWHNsTWJhZU0xUzl2RzJLNEhBVEhrL0F0WTR3SXhOUjRZWVM3STJ4NnRD?=
 =?utf-8?B?TkpRZ0tDODNWOUNPWmhReVJoTkZvR2xjUG1RaktCMXQ4TzRnQ1RLL1lWbXdL?=
 =?utf-8?B?eTUxQi8wdzhaL0RIeWhkU1FqU0lBL2ZsblNEcjMyRDNOVUx5Znd4b3U1UHIw?=
 =?utf-8?B?Zk5HZ3JGQjdJUnpWdDJNMUlEUEkzY3VEVW14a1dsSVYvWHpKS3pidkFTUktO?=
 =?utf-8?B?Q0h0Vks3Y3pwSEg4OGI3WmpmRCtlWnRJdG1MRDUwSmY5SFNNdCtVSUwrdlV0?=
 =?utf-8?B?OUNiaC90SFlBR1V0OEdkQzFmaDNCWWN6M1V3Mk5nMEpyN0dQU1VPWDBMbXZE?=
 =?utf-8?B?SVJPYlFsYjZmNGo1SXY4ZE41U3FsUzhMeTNHNThnT3VJQ01UL29KZ05PN1pD?=
 =?utf-8?B?eDdVK1l6c1Byd2s1aFdzNEhJaFV2L2tyMzNFcmIySHd2Q0FZejEyMERFbVRv?=
 =?utf-8?B?S0RTV3RYN0RlV25mdHBvK3YyUmlTelNPWU5NNEgxa251OUVWL3Y4RnFVN2o4?=
 =?utf-8?B?YnpYOVFVUjdXMGdMd2NwZm5vT29QTFg2d3V0Ryswb3pDNUdieFFueThSUThI?=
 =?utf-8?B?SDZGQWNYd3hWcmFlWEhiQ2FPT1cwY3hva2t0bjFmeGVEWVJkbHRISXpkc1M5?=
 =?utf-8?B?MElhSm16Y2dxQ0JlRHFDeExDcEN3Nzk2V0Jjek5vcTlCbG05b3I4N2VXeUt2?=
 =?utf-8?B?NHI2d1VQVVAvdkZHTXNCL3hySlJXcjd2Yms0b0dXc09xajdYUjdtM0VmSU5x?=
 =?utf-8?B?aTc3ZWp3UVhDN3UySitUbS9Ca3lqQkRGWkZoYnFCNDdTcnBwL2o2Z3pIalhV?=
 =?utf-8?B?YUpGTWVUWTlQSGQ4TzRkVUwvZjNvS0M1enJVSlRXaUd2aVBwaDB3WTNQWjhB?=
 =?utf-8?B?ZEFFcUh0NVBYdU1reXI3YXBkZkFSQWZVRjNscC9vKzRsQUZpNWI0dFVUai9Q?=
 =?utf-8?B?NkkwaUZ4ZjE2QmNvRnltRk9YRUpFbUVzUkVram5PZDNBQWhrY2VicjFzU3Mv?=
 =?utf-8?B?U3YzRndVTDFGQlJsNjN4T1VuLy9WV3hHUDhOaEFNTEdTM2Izb0VwVHNXc080?=
 =?utf-8?B?eTZIMEY4NXAwSU1FTWdLZi8zZ25RRWNKZ3M0dkZNL1lQNjFINEk2Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acdb23b1-820b-40f0-18e6-08df2da9824f
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 06:23:37.1328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+ruz3bnCs8ym8I/3iT27B1HtHDAxiJagG0rBM4uUKm0eSSGHxwddvzcvs+VLBQIVuWmHrbKrOftAcllb+CYNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB9647

Hi Jiale,

Thanks for your patch.

On 10/3/26 16:11, Jiale Yao wrote:
> [You don't often get email from yaojiale02@163.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> c3_mipi_adap_enable_streams() ignores runtime resume failures and
> continues programming adapter registers before reporting that streaming
> started. If the power domain could not be resumed, those register
> accesses are unsafe and the disable path later drops a reference that
> was not acquired.
>
> Return the runtime PM error before accessing the adapter.
>
> Fixes: f0d2d8062cc8 ("media: platform: Add C3 MIPI adapter driver")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c b/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
> index 4bd98fb9c7e9..750b301f4bbf 100644
> --- a/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
> +++ b/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
> @@ -455,7 +455,9 @@ static int c3_mipi_adap_enable_streams(struct v4l2_subdev *sd,
>
>          src_sd = media_entity_to_v4l2_subdev(adap->src_pad->entity);
>
> -       pm_runtime_resume_and_get(adap->dev);
> +       ret = pm_runtime_resume_and_get(adap->dev);
> +       if (ret < 0)

                     Is   ' if (ret)'  better?

       Thanks!

> +               return ret;
>
>          fmt = v4l2_subdev_state_get_format(state, C3_MIPI_ADAP_PAD_SINK);
>
> --
> 2.34.1
>
