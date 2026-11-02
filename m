Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793587985;
	b=kPKrnuNMsgRXu13sVM7ioGEJzsjYZKkC8QK1oRvZ20nXj/UosRXIsP00fssI68bXgx6+
	 EhesxUvcZ6vgzf+gqR25ou3FpiLalWTw77NKpaeoNsnMu8sIRcb1qP69z2cQIH01TjIFN
	 En8EP5JaQiae6PNLc3oj5CgGPvyEAXoGPAPDenAeaTppBiq36CdRglZhaiXclTihFKXIv
	 SaXEBN2JolPpipV/frF7cbkqWDfqS4fMR3HVivVg5TRFBY2qbz9pL8gNKziXljUcgkzEQ
	 aFDwpzqG3Uh9JOK2Hdf6RMLYC1eptSklK91RUxW+tflifvLTslQFY3jsJwGNYWDH5Qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587985;
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
	bh=xa/2WhDs9EUTjY9tHMaUOJX05lxbOefn0n6MipyRjO0=;
	b=zQqCoU3+Uf/LV+KhpdrsS4vl6Dbo8BBpIKjBoEb/7cA8gY0NNP4U/QsKGK2YUHiuxjq7
	 e1GRJG/BJRC341ty19/e9TnyZeLQ0+X3kQiu7VAbmu+JXNrRJj25bDX6x5iC7dXRCPELo
	 FDLWswy9KP1aKDCDXMehhdbdv05u9M2QOO6mgEHYr19dv4M3J+3BzO8Ry54RSQTBK70Z6
	 pFav7h3liWRVD98B1hyb4vmuMj8hXcISvYedvguMtAW3K8N3l5g3DMkqyy9JxO39NDJOQ
	 wpnOFOUiIWg5MXkpBIo6bqNksWXTceTs/zqsygG9mz7DO+iSs90L7srYVOnGXcbksJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DPnPk+AD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.56
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013056.outbound.protection.outlook.com [40.107.201.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E03606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56E03606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DPnPk+AD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGOGmNegHoiDPmb2MfoeXUIY4+X+sy5trlYuo5qkTmZBArZJFxGy1Mgh0TQhuewsPGMXsZq7v2aEkzEiZe+dYpSmB2eYJUvKxUwypEeXjprZTVfgoMYcMXD4A9+sbRfkHkVSQJXJlH9+CwzCaEjoCggiT0P5O3p6rjZnAc1fQG92zKsjCsMgeF9DPSZSJ9VCVQLw2TBdAmV17ecn9f9zdNxTcrjH0cv0UgZSLvmgw8RG/T9qTSgEEjq+e07JrYAsNpmnZ7GB50J2hX6P8nihUIxM076d4ec8XtL7U0Wfya2tGF3Mwgg6nBjWNZBuuF2qHWZLp4AWfI18u/uRRjv2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xa/2WhDs9EUTjY9tHMaUOJX05lxbOefn0n6MipyRjO0=;
 b=ZHMGgwEalkIyUh/2MIO1zn1e2POIOWeUe2wSiM87olVlaMuKspC50dZrcmUfmoOQ12rjhilWcr+ecR+e91nzTZPRPGKSTQohnBqjOAu5aNQGT+9Wn76PsAIjkMBXUq2AGRnlUCfPsGo/MyWjv8pmsI7wVUAkoteVbJoLwON+jry6dbOzVmj+wbAu4/ib7ruNEFCe5dZNBP9yuCFnmv7AQLKDM/zRLzJeoZSv5LjRgtqQF8rFeCFsHBifQ8aejCy2H5t+pqRcPfCZ3+0cVQo3q6JBbALJsJ5kbxHIv6IENsn1sg2GBhBqc3GfX8s5V3QlIKl9iZ+eMiFFWj6G969N1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa/2WhDs9EUTjY9tHMaUOJX05lxbOefn0n6MipyRjO0=;
 b=DPnPk+ADEqbRQzKKBYs9Spi3INti1xAYSHwTfoNlKtrPKm+eH3bPy5uh112IaJhks42DL3bUrRPZIDBETlJ2iNJswxRDEpiJEXaeccwLKO4zKlvfPXzpyKy3ieoBxHpljguAtQcwew5rrJA2rJuaOCXIR0Khc9X7eyUY5rHy0iZoaD4xClQDHHt+Pl8sZ3/eyqBGF9egJRQB/O1EGGLi4rz6Ssye1KPH5HbM6McqS7jc3TOo808ASYXAj7S0AbKXdw3S3Es4W3ubrLYoJU37N5L3JgHkjS3Zw/VXOuRk41AZoA5lcauzToL9L+llxcYKNgLY8X2Eoi3UXmSzLIsgqA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB9730.namprd12.prod.outlook.com (2603:10b6:610:253::9)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 2 Nov 2026 02:53:00 +0000
Received: from CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128]) by CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:53:00 +0000
Message-ID: <92e9f154-b316-45a1-a809-7790368e74a4@nvidia.com>
Date: Mon, 2 Nov 2026 13:52:54 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] taskstats: use div_u64() for the elapsed time in
 tgid_stats_add_task()
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
References: <20261101005616.3022705-1-brads@mainlining.org>
 <20261101005743.3022780-1-brads@mainlining.org>
 <20261101005743.3022780-4-brads@mainlining.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20261101005743.3022780-4-brads@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MEWPR01CA0196.ausprd01.prod.outlook.com
 (2603:10c6:220:1ee::13) To CH3PR12MB9730.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB9730:EE_|DM4PR12MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e0a46d-f1a0-4e18-59da-08df388c6828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|261021121427099003|4143699003|11063799006|56012099006|261028144727099003|261021123027099003|261026121527099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	665CqWcQc1cynumTo4uVrnddD7FivFLwe00k5hHzXJ3kZ68S5qN7GlfmRCyrYTEHiN0YTG1MHCjNkT3kB2NuiTVTcw1ZaK/AW03zSwDSKFI8notEB4EZhG421I6ZoMQTg7O8no6EzxPrAEWOrlRmLsNI29eo8Ase+Gt1pBwSoJb4wMNRVdI2y6eOCGgXzm0jkss45oU+0hjvZrIk/pnrE12HSf07QHqQ0JhfuQ1s5t5M9QOr0jx0938oxaXsNESedamKeQYhtyIXqGvecuIAKrS66kC5fxKLGbe87K33CpFcfpQbUQK9mC1suYmJqW/KOHf0tteklJauh3L4WBt1OU9EKndXWswM539bjYhpoIwqENTJbIGrc8DWarByZoUWnmobpOU7+wvYIZ2Z5cCJ9BIFRiolyB0IJuhjP4+XqXcGoUz0m5uzw46ao/mpU5RwtDhy3JBfSJu+t2fY4dQcyKeCoIowNpqp2zS4bN5/EpkjrNm7WhcuHRRb33CMfEx+YFjQ2+Mox22TV5506Tp0hcFMcUPTFvOgRBux/zV+DqG/ixZeb66+GwJsDssjSHYdzvwDbLnYR20CMaKkpb1vombeP5Nk1+2SywkgXqL4eOnJBnM15IKudWmMwauKgaBn7IyhUnSn4GJpIK/E8pKh5NdSsginDxUtC8UKx3nBTS8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9730.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261021121427099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWtSaGcxM1FpSmNSN2VOQmVYekdCOEtBNGxjdjhmaElzVDNEQnJscXQ4cGZ3?=
 =?utf-8?B?NzkvVnp0TGRJVlpJNUVLSDZrRW1BcnRiMmpvL3FNck1GNy9LK2tianVybFZo?=
 =?utf-8?B?QWppUFBpWFhNNkhTMkl1aTBrd0kxbXQ4UUUrZlNyeCtYaExjaG11VXdDaHBH?=
 =?utf-8?B?b1FZcHh6M3hNK25IQ2t2RVBLWFZQV2VCZEhSUEhzanBvSFA2QVpEVjdTTTVi?=
 =?utf-8?B?RytFV0FKalI0TC9VdkFIMlZLR0JPU0x5NHJZRWFwQm9vS2FLTElaRm1KeVE2?=
 =?utf-8?B?VDE5N2pKOEF6NldZNEUzSjRYSUcwdWVwUCtnR0lTSlhPdi96YXJYVGZiTVhk?=
 =?utf-8?B?RmUzRERpbnczZnhQUVlKZ0dFRU5FNzliNm5tR1orUHJvRzhBZkxZVnREOHdW?=
 =?utf-8?B?QXU2SGZWd0ZTYS96ak1sSVBrZDVRYllpeVhLdDJlT2UrSTV6V3RzZnJZL2dG?=
 =?utf-8?B?Q0hYQjErQUtrZWRLR1BoN2MzY1hGNXdEc01JeWVDYzJDc2prWmZlZUJQRlZE?=
 =?utf-8?B?NC8vV0VNRUJTNFRxbWJlMVluckJlN1VIL1E0SjJaRkpMUGVpd0VvZWMwQURC?=
 =?utf-8?B?NzhMSjI2UzhMU0krSThqZUJiT1NNdTlyRnpWajl3Z0I3WkF2bTZRdEd5a0pi?=
 =?utf-8?B?NlF1ejI1TytCWXVNWDJtRVo2UE5jVDg5cWZWTFVQQWlqSGczaHdvNWNzc0Fo?=
 =?utf-8?B?S0NLMUduUTlzbnZBaVFlTnhEbEI0UkJaSlQrbldOTkhOMGFSZGg0bFhZdENK?=
 =?utf-8?B?aTREQy9GSW5hM3k1VzMrV0g1WWJ5dGp1TExSbUFrN0Y3aXV6UGl0OVlTZ1pX?=
 =?utf-8?B?ajBqLzhlakhzY1lQcmYwWTd3eDVxd0dXWnpFUDNEWmhUd0FSNnJxUzI3ZC9x?=
 =?utf-8?B?VTJhbjhOVFlnYUlPMHJLNTRvMkVCaFVacUd3TDFFMitIRS9MUGluOEdDMEIr?=
 =?utf-8?B?di83RDBRWXY1SmhtWkZ6N1QrejIwaWtiNnVXallRNWNtS092TVhuUEZlMFl4?=
 =?utf-8?B?QjBWVGV0TURDODNxWW5nSDlXMEw0UFY3Z2lRdzhsQWpVeE4weFF3dnJUS2Rx?=
 =?utf-8?B?VFA3c3lVOFR0WEljZjJCMGtvS2t0QXQ3Q291ZHBKUUJyV3daY1ZoOWtxUE42?=
 =?utf-8?B?NVlCM1g5QlJGZDFpRFFqWDdjOUpodTJOcWx3Z1NjMUhBckhqT3cvU1htMG51?=
 =?utf-8?B?eHlXMjNHeHFXbHppR09kNWEwMWRUMFUwUWN0Q3d0LzRHM0hvZEZ5eDNDVmxP?=
 =?utf-8?B?ZnlIOWxTbEQrYTlmLzdIWUgrUDVkY2hFTTVrT0JFMFVVbHQvR01vVEhYaktH?=
 =?utf-8?B?UjZxbzVrZjBxNjY1ZkNZdWhnc0tzTlVyd1laTFY0N2hpS2w1K2w0cTNybk5x?=
 =?utf-8?B?UWx3VUlYNjROMUFFS3Y0WFFhUmxBR243Z2crZ1RvdU9GZWp3RlQ3K2FaYlh1?=
 =?utf-8?B?RHlJcmZ1SnpEQkcyYW9yKyszNGdyVXliak5wR1hsM2xKMDdablFUaE5uOXZ0?=
 =?utf-8?B?RHdRNGJqbngyV0JaRUR1S2xQVVE4MUlKNk16ZTJ0TEVkVnVFamFnU1duWHJP?=
 =?utf-8?B?anlCQjg4TGpNcERHNkJ3S0FFeXRIN1F0b1Bjc25uY1FxNzV4UXBmN0E4djRB?=
 =?utf-8?B?dGlQaGdLOVltSHRFUU9KMUNvdWZBSnlWNDg2aFlQOGp4bmxMOXlZa1ZGSlhV?=
 =?utf-8?B?Z2xRem5DbTlaQ3VkVXRRb0ZwZGpxTGVSWlUydlJncG9PZkhiY1lTUGFxRVlM?=
 =?utf-8?B?TDRWUlJyZjNBaitVYzNPVFlMemZCTTJXZnlDWit1eHo3Rmk3emVabkdYVnA5?=
 =?utf-8?B?RkJJQ25LZis4Sk9ZVW5XaStzMThQbk16YU9UV3BiYlV4UDJDTGhhQkpWRVlw?=
 =?utf-8?B?cGpGSmN5T3drMHpIVkNwVjcvd2l5b01nUUVNWk5Rck5xSng4enlVdzF1NC9S?=
 =?utf-8?B?a0hUcko4TGI1aVpxT3ZNTVpQYk0xeE1PZGhKNFFiTnJoTldpaW01VXF4ZDdB?=
 =?utf-8?B?SFJYR3FNcGl5WG9xYWR1TW1yYm9KclNoYW5nd0hkQVB2S3BVTzl6Vy90Y2Yy?=
 =?utf-8?B?cGNzc2FzSEl1NjQyeDVWTnZJSjNXc2hCd2ZJNGRPZXRqUTkxdCtTcDUyMGEz?=
 =?utf-8?B?TCswVFgwTmJJbCtlZHNxZUl0WmxCWnpCKzdOS21HNEZBVTNTTGdYSEt0ZFp6?=
 =?utf-8?B?NGgrQ3dQdjd3UTUyWVJDcVdRMGkzNlN1TUpJWldLa0p2NkxvVmhHNWI5ZDVa?=
 =?utf-8?B?ZStEKzUvUlZVa0w3OWU4ZWhDYk9pVnc5czZ4WnpHaGh0TUxVakhDS296Sm5i?=
 =?utf-8?B?YTgrbEJCRHdFdERMVWdIOCtlNk43NWVMZ3RNODhIcW5PZ3dwd3NSZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e0a46d-f1a0-4e18-59da-08df388c6828
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9730.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:53:00.4780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdTMMVkf0t3h/AX5Mwi8zpJbYjZhmeFIk6zXrwMZKJYzKEUMUCO7o0wcDnNfBnaBbTWnntE/LlFhIQN7zedrlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745

On 11/1/26 11:57 AM, Bradley Morgan wrote:
> tgid_stats_add_task() converts utime and stime with div_u64() and the
> elapsed time with do_div(), two ways of doing the same 64-bit divide four
> lines apart.  do_div() clobbers its first argument, which is the only
> reason delta needs a statement of its own.  Both end up at a native
> divide on 64-bit and at __div64_32() on 32-bit, so this is only about
> picking one.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  kernel/taskstats.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/kernel/taskstats.c b/kernel/taskstats.c
> index 9e11f92216861..2d4ecb9a89a91 100644
> --- a/kernel/taskstats.c
> +++ b/kernel/taskstats.c
> @@ -226,8 +226,7 @@ static void tgid_stats_add_task(struct taskstats *stats,
>  	/* calculate task elapsed time in nsec */
>  	delta = now_ns - tsk->start_time;
>  	/* Convert to micro seconds */
> -	do_div(delta, NSEC_PER_USEC);
> -	stats->ac_etime += delta;
> +	stats->ac_etime += div_u64(delta, NSEC_PER_USEC);
>  
>  	task_cputime(tsk, &utime, &stime);
>  	stats->ac_utime += div_u64(utime, NSEC_PER_USEC);

Thanks!
Reviewed-by: Balbir Singh <balbirs@nvidia.com>
