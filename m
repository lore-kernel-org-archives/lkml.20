Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012007.outbound.protection.outlook.com [40.93.195.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C16D35E1AD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972536; cv=fail; b=a0POyOASgR0jIX+Gj50ir+Z1Q8Z4OZHcMHpV6ikn7Oj0Cb/Cc6BBtdSAAgmHfU/HVQYFTcTHtoo8m/E9r7ED1vr+WuNm8A3FeVERFdnPqv4z5h2XoSv/FT8TfP8LPh39UJg8+ZZ+ZnnYRnqix+Tws0aDbxL3JP7zgeau7n8hr+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972536; c=relaxed/simple;
	bh=oGgo2B7e1q+8QbaO5mydvRmMSOstgTHhh46/agGD+Tw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dG+uQX/uFx9DiLFFtlZ1jci9BCx0G1CIWcDeTRmR1Sovskg1nfyr5RDxvsIjBCHCEunmoVPz9Y3VVlE/QOYqEkaYo4m7m6hIQobVYsR/woA141tNHRYYBOW827kqVcrERtInnySoMzfMtS5TZLO6vuKXZQPzsy9OBVDYc4HOTGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=jJsLTc/4; arc=fail smtp.client-ip=40.93.195.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="jJsLTc/4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Smb9zi/OfhlKDyX4H1HzBJqSciSuJgTu/EjWVLEKZB2+EeZVDAhowt8lJj/Xb25NiRoJFme6n64OWaG5QEG0alzLEe355OvxuglxES/lu+4Z31f3CZ4ynwKosgsSw6k5KdpfiUPNwjEgwhABANmQxl8FcLmZcPxkn7lsvmuousvqs7mpngT/po8SeLyuKa/wtUZmAwIz3oNE4srIbahxd3x7RbiPNTY31hxYJby2lUqDOiiTSP+cjXoN+IvyfAnbGn1reXT9lCD0nJyl2X7Z2z20TREExRK6YKda6iWjDrxMVv2ZHcSmmctkOR1eru4FsIIA9GSTyJxUb4BHImNo2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUD4/oo5UwlpqChX/wtB0Dan/x/HuYeCpxESzZSvfoU=;
 b=mvSw2bdo34nNh9cssLWkCTCrsTfAYY729TEeWpCGbc3PhEiJMB81UDMW8doCvld1ZQnMAnDqi9xCBdLrpPCL2edgCThiR1651kS07n+xvQhxbwYEoD+y4YJj37Fas2c9XDhNi5cDKYFeA3Rszhv59QqXWLOLoUY2fuoWjdt7Xt1D3Q1B1HUqnWNiYxnKx95i7314+nB209j+O7WWledSLFNtQrRJr7ZQSfomuzO5QuJv03lbbgEBmpw5ppTfETOZvne1xFAG8s4jJMnA3Hl8NoeTNQsARUKbeJSJHh3DqNEra/W83/5iyTFRXpKYBaLi99gDNE0lso2YAC3S/hgyCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUD4/oo5UwlpqChX/wtB0Dan/x/HuYeCpxESzZSvfoU=;
 b=jJsLTc/4F26A08mnFBUFxcXfQhy295BkXLOgPJHjO/RnFHqKLmnftJXgzq056m4w32rox0xGO9xkc1Z8dtC41+CI3dNzUeEtcvetp5Hdn8Gcsd9cD1BfsHWLc4/MFqVLhVcgJy6bl0uNdg33LX2szkcXRElHpS/C5vd+WkxzFW+pUwqaqDmMYLp5OJ9+1dSyD7S5bNXK5MyaIjar9ayF2q6ruWF5ya1eqdHZBczvcbePQOAFWg1TzWCdvWAoRDQ/1QSHCwOCaKGLdWJfyU5NORP+4oFS6vkWuuq/Tv7aSCeB7UU0VG7lVGujO7BrPYdG8xOlHj9HZ9ryh3SxjTxwjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS7PR03MB5381.namprd03.prod.outlook.com (2603:10b6:5:2c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:35:30 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:35:30 +0000
Message-ID: <da7eb086-1a4b-4631-bacc-f3badb075f6b@altera.com>
Date: Mon, 21 Sep 2026 14:35:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Fw: [PATCH 0/2] mtd: spi-nor: Fix unbind deadlock and
 use-after-free
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1788404586.git.tze.yee.ng@altera.com>
 <SJ0PR03MB5950909EBD8335469678D0A2A1842@SJ0PR03MB5950.namprd03.prod.outlook.com>
Content-Language: en-US
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
In-Reply-To: <SJ0PR03MB5950909EBD8335469678D0A2A1842@SJ0PR03MB5950.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS7PR03MB5381:EE_
X-MS-Office365-Filtering-Correlation-Id: 014493c6-fd53-4201-5555-08df17aa8819
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|10067099003|4143699003|56012099006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IAkNGHOnHBayLaOVJSAaqQnURUD6d/MaoWGJu++gfabOSx4Ge9OgsW2n85pEF32KV6hOYVTvBqn+dUtC8jBvAJgS5aKFPZoJsDauNfvBkTDT6eotAW6zaJ831trflnCLUl28EBO+fpz7G2NPsuJxtZhDsEG/dVA2r5JnLvIQdMfPgPHgk16+UQbZV9ANIbMNpMPyJR1aDjw/SkfNTZmrBYxggxusjcnX2AhMZp1styaEP8MyLrOh1T5sb4v23+j5MuM6GjJeHSYGPsq939am4pAeQcYX8FXQNH5fVt4ib+AFlcHACwVH4WkvdAZ/923tRWPUt6BjBSGQtzzenC2wETlq+/DxZZ63GJOCs7qlVs4JnBt4M6/vu2ka67KfYJvCP3E1D/SEuwu5lSrXz6NdshFOcCljYHJjtltyYtkWN4SxMnKVV1lkYn2CVc6EmkgmP6O95Gxg2NISc8XDLwEcAkPG5VwCzB99BDdEj6bVXTdToeWSz/oOM/zSJSux99pfp4PyRFXBOYkbC7yAoG/Ld3U+cYZOIv9ugGOr74ZKx4qhx6d5RNlZ8xGnS7vqO4lyyDWnIx9DX3yD8ZDP5rb8AAzRsTryL/HtQEXJc3HFcUhA2sLkcZB0SaD2n9bGufhKTz2JIS4/uQUNmTNZ7kL8I54GzULWKCnloEbWDTu8z5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTA2cnc4NkRYUEZmanE1dW1WRThEclRFaSs0YXg2enAvaXFZWXVOMmhOd3hs?=
 =?utf-8?B?cG9Ka0hwL2ZsK0pmUG5wT085WjhmOVprdmxnK0Z2RW5ETXg1SCtiZ2FMTTFi?=
 =?utf-8?B?WWM3SnFHT1B2RkhzSjJ5cE1EYmcyR0k1NG9WTFBhOCtkVkw1RFMwcCszRWRo?=
 =?utf-8?B?SEIySXhEazhycUhLa0FDSnUzcGo5UWdoVDcwdHlvUmZEVlYwdTZGSWJKM0FX?=
 =?utf-8?B?bjZhWTBRNEpObmFTVXNMYkFjRU9maU9WWWo2STdDQ3hqcmlsT1lIZFhwMjl4?=
 =?utf-8?B?VmU2N1Izem1JRGlGMk1tMm9zNVNuSjIwR01hU25WakNTdldnT3hJYWxuOUJ5?=
 =?utf-8?B?R2haZWROOU4xRERXc2xWSWZLVThNdzNFS2tiMjBDQVhqZjVhMXJmbVp1KzJJ?=
 =?utf-8?B?elJ4RVFWNGRodm5MVUFyYm81SjQyZnY2K1NQS0FLOTByZGV1TUNSNXVGSlVS?=
 =?utf-8?B?VE5PVFpzUWF4OWRZZHBncFB6RzlkWGEwWExmYm0wN0xJTEtLRXFpdmhrN0dx?=
 =?utf-8?B?cGowcFEyYWNsb0RxZ0s5cDdrQTlvSmxXT0ZMUkJoalpzRjJBb2lYYXVhR0lU?=
 =?utf-8?B?MFpXa2tCYTlEZzJTaGNvS3ZrMG1wdTBLdFRublNCRk5jbk5LUVIzTlQzZWln?=
 =?utf-8?B?eUdzN3R4M2RBckhUd2k4b24rY3RwMTZTbHdvL2dwN2luc3FaU2ZDbVlDcHd4?=
 =?utf-8?B?dnZSdWVheXVoZ2VldnlDNDBVOWdveVp0bGNSM0ZCdnJGUndFdE0rUWUybmpI?=
 =?utf-8?B?eWkwYm5TMEJvcHJ5d1BhdVdrZU91ZmJaWGlxdGUySzE5YlE2VEx0L1h5eUhE?=
 =?utf-8?B?a3FqNHgvZWh1RlEzWHpYcFh1d29JbEhWZEpYalVVeUdpQjd4Vi9YUGZDeDlm?=
 =?utf-8?B?S2pQTjVsczBiNW9xWXI5YWcralZsNmRXbmJrNTlLSHdvMTZ0V0ZHaGVjMUlq?=
 =?utf-8?B?eUd3SmlONExPaENLcXZ5NTJUVVcrNktIQ2F1Vk5YczZ1bkczWmx6dkFtd0o3?=
 =?utf-8?B?MDBxMlphZTB6VTJwMEMrd3I3bm9hNlorLy9CaHhzbDVSb3NydmVTNlNLaG54?=
 =?utf-8?B?Wk9WMmFETEp4R1JaemlLd1NRYnpqdldVZ3dZMTJBL3g5M0hDUGpDZjhoUkVY?=
 =?utf-8?B?MXlsQk1OU0lmQlJ2a0g0NVZmNjFkQTVVWmFWeldHM1p6blRKQktJaDhmbTVJ?=
 =?utf-8?B?YWduN1VyNTRQUVB2VFpkNzJzWFRZU0dYeldVdG1jeEdIUERvY1pHRXRhRWdY?=
 =?utf-8?B?Y1dYc3pLNE9OVFEyWldLK1VmbjF0dS85SVdUQlZKdSsrZFJmNnc1QW42b3Zq?=
 =?utf-8?B?TU93ZDJPUjB4SjdvNzBDUUtoR1h3TmRJRWluNnFNT0NUS0JnVnJxOUJlVkpF?=
 =?utf-8?B?TUwzaXp3M0tjK3FiN2M2T3J3MmJzWFIrV2xsNkdQcGtHYmFOUmd4YlBPRWUy?=
 =?utf-8?B?Qkh3RU1lNW1PdXVLVFNFelcxS2JGbVgxOFBDTVpyNXlmNUI0aXlEQjBVZVNC?=
 =?utf-8?B?aHBSQks2dmdyOWxZTTFlSzNXZTBxY3JOZWh6SGlMTEE3ZDFpc2Z3cUkzN2Zo?=
 =?utf-8?B?SS90TENNNWNOWWlpTFIySldxTzc3MFV3Lzg2WXliWWNvSVlPZ3VPYWttU3Zn?=
 =?utf-8?B?VWlZck4zSGk3elVBd29Ncmp4U3hiemIyOWxIMHFHRHJVQ0x1eEtSVUo4K1B3?=
 =?utf-8?B?V2tqdk1rcDYzUzlQaWVLNjB4dmZNQXJTVS9Zc0VLU2Myek5udEpIdjIweklZ?=
 =?utf-8?B?cXdUYThWdm9nWmoxTmVPRzZJd3ZTWlFEY0k1ck1EdkZyVEdIQ0NIclFSS05x?=
 =?utf-8?B?YWRZQzF0TzFjR1A2ellTRktCMEE3dW4rUE9heDFmMjRVUXF6VGRtYmFZT3ox?=
 =?utf-8?B?aXp6dnBNSGo4cWJNTk1QeFRQUU1mSS9ZM3RtS0NnS3F0WG1FZERvdUlJQ2ov?=
 =?utf-8?B?RFU3b1lwYWd5QW9GTkRlRCtQbkxwZFE0T1k4Z2owZitHOXNBMVg1ckhvcFFV?=
 =?utf-8?B?VEtDKzRoRVZ1dFBDZzlrdkJxalB0aWdESnp6eVpPSWlYcGJDQi9GeHE2ZExh?=
 =?utf-8?B?Q0F6Yk93R2lEY213Nnd1NXNsbzUzRzFuYXNDelBNYVdzZE45eFlXeTluWWtw?=
 =?utf-8?B?Z1FpcWNLMElIczlVekNaV1M2U21oTUozTExEbzcxU2JydHRVUElDT1M5MzhU?=
 =?utf-8?B?SW5LSmErQkRwSTl1eEx2Wi8rYzZBVExGQnBCR0I4c3NKeVRraDk4VFRqMXlV?=
 =?utf-8?B?VTBMTlJzVDhTcjRqR3VGR29iTWM1Ny9ycjE3S0NZQ0k1MHk1UVpVd244UDZR?=
 =?utf-8?B?QSttNmkvM3VkdjBERUVaMkdBeFpiaWxRWFc1R3VHaG1mVlFVYkJhdz09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 014493c6-fd53-4201-5555-08df17aa8819
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:35:30.7809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouh5gcF9WlKRFvprK0HsCm4meAfGcseL2OfGN/0oUXIy1RmUCRYtWadE4AsjjMNPMGgG3ZL9tryeb3vgTNk7gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5381

On 21/9/2026 2:27 pm, NG, TZE YEE wrote:
> 
> *From:* NG, TZE YEE
> *Sent:* Thursday, September 3, 2026 11:14 AM
> *To:* Pratyush Yadav <pratyush@kernel.org>; Michael Walle 
> <mwalle@kernel.org>; Takahiro Kuwano <takahiro.kuwano@infineon.com>; 
> Tudor Ambarus <tudor.ambarus@linaro.org>; linux-mtd@lists.infradead.org 
> <linux-mtd@lists.infradead.org>; linux-kernel@vger.kernel.org <linux- 
> kernel@vger.kernel.org>
> *Subject:* [PATCH 0/2] mtd: spi-nor: Fix unbind deadlock and use-after-free
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Two fixes in the spi-nor core around locking and driver unbind:
> 
> Patch 1 fixes a self-deadlock in spi_nor_rww_start_exclusive(), which
> took nor->lock while its end helper re-acquired it via guard(mutex).
> 
> Patch 2 fixes a use-after-free where a sysfs unbind frees the
> devm-allocated spi_nor while /dev/mtdX is still open. Give it a kref
> lifetime on the spi-mem probe path and fail operations with -ENODEV
> after unbind. Legacy controllers are unchanged.
> 
> Tze Yee Ng (2):
>    mtd: spi-nor: Fix deadlock in spi_nor_rww_start_exclusive()
>    mtd: spi-nor: core: Fix use-after-free of spi_nor on unbind with open
>      handles
> 
>   drivers/mtd/spi-nor/core.c  | 113 ++++++++++++++++++++++++++++++++----
>   include/linux/mtd/spi-nor.h |  17 ++++++
>   2 files changed, 119 insertions(+), 11 deletions(-)
> 
> -- 
> 2.43.7
> 

Hi,

Gentle ping on this patch. It has been over 2 weeks with no feedback.

Happy to address any review comments.

Thanks,
Tze Yee

