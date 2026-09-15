Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022098.outbound.protection.outlook.com [52.101.126.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F33BB57;
	Tue, 15 Sep 2026 02:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438855; cv=fail; b=D/S7+irUyPdQsuZZtyreMqX2KVyhZDNDB08IBC2iyDAY2v2R5lJy3kIsisSr60awMvrJ2FcCBBGeOYwyXCoXuaAEGOi5eGh1g1ZutSPYfL4RT6t5PP6yqfS/eddPU+TLG0mW406Cgb5u4LMEHvW3d4uTzStcrVzMyITA1507J5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438855; c=relaxed/simple;
	bh=f16myTtR9L3T8qakLPUa7SsvMa0wrzgSOe9JOhIgv7o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L7SZaQLcIDhGhQm4u6F9aUfO1TErQ6YDD/5RB+h5XDeEi1ca1bjge67SrkwDD3tpOBpCfTwao3ZG03+Ycr8H02W4oR9GNjKHiQHNJCwwY+D3ZSfYSeA8FhkyYC3KwWplnzJiXqwhiBPm5jn5EvfYRH0xupnpHy7yUEs9TowqBN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=SOt4obBT; arc=fail smtp.client-ip=52.101.126.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="SOt4obBT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGCSmxacw9L6ePbjIfMxaQGR/rLbeuJmmOCGey0eRJEc2e4rvGPd5KH3QVubmlJyo50D4UNBoa+H3e7G04yZi3ZUiq1+HtXRRPvbwAHt0ccKkUbjV7jRvTiFyg7tHt2QybomU6QIMaC4YzjLBN9YfDl82nNqUdezSkt2Rwj2JwrvMD72Ukhv7F6YO3YInX9rVA/2Hc/cXQojIMBHoF71RFrJnumYEF4m4VX5QSQHvZCl5sruaMYTerVaZJ9VtwDqOKA+Cjs7QBnK4uhot+P3GhA6WGcD7c7iI8tGBnROKKrJsng9ROaxT5tk6tWvJKSLno7wT0Fco3rgrbG+UtrL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajcgOCu8Z1ymYpShLtt4rA81zNwmfrk3c8sVIw610Ko=;
 b=dXkdtlYno2s6lwBWirXY8VKlFcbmv9vwoeV1nKVDGtKLgI2vD7npbXDLQH1JQJ95tl14G/jT6Ox0blW/McPFMuUitoCjVFj3dQanc037wuIM5v4ozobeSCmmCJRr2WWkET1pGPV/lfKdu9U4VTCr/CmXqeSKzgWi4P+yB0caQCXCXPolxiuv/ziQqqJz+6DgWUyITbVQMYVz1Hi6li7D4u2cxet3J5VWbRH60p3jsXI7Ge3R/pE6nImJQUpm0LWYlnMDPhkjDFF5zJ34P+of7IRYjOsDrl7IiIKO59Fw1sa89QSDmndLeVi2pjWNvU9v2U619EVd5do9v0wNzoyGAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajcgOCu8Z1ymYpShLtt4rA81zNwmfrk3c8sVIw610Ko=;
 b=SOt4obBTuaHKLDOL8uIWhZxDGyNrhxOKP1aZEjLvwElQGesaQK3LQ62z3yXYuJiyH+7iqJoE6OwdWqLoJUKfMq78pm8gsZGPAjwtD9vYfuSwqGIzJjaET2Dzk3HFmyZ1LIiIonz/UvmLQlDfKmCaEfNoxKRunWckeX8IjXa0Pan/sTXM79KUrWiJ79fALFzNpKjyWgHju56Lx5zmRsr9ttrp/jDwyzDQkJlih4oYbRTmtnb/y+zB7pW1gnedxdGYz/GTaOxWNNPdN87gEYzbq4D4Olu2sgi4f/5MZWyeUdfsplZZ/jEpxG+AZATIBgmjct7/+FjvonY8yyC05QgAwg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TY1PPF95FF9296F.apcprd03.prod.outlook.com (2603:1096:408::a61) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Tue, 15 Sep
 2026 02:20:50 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:20:50 +0000
Message-ID: <53e494c3-f0d2-4a2b-99ae-af92fcfc5128@amlogic.com>
Date: Tue, 15 Sep 2026 10:20:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uapi: Fix C3 ISP type references in kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260911233011.30951-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20260911233011.30951-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0016.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::20) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TY1PPF95FF9296F:EE_
X-MS-Office365-Filtering-Correlation-Id: 6643ffd2-bf72-4892-93a4-08df12cff5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|3023799007|56012099006|11063799006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8EcU5N56n4uJd19l2WOillAcRY6TRKBRIxAAAygVrrFPVdlTSd0P74j1S8gyHtGzayrkICN048lzY652m13/p7UAfCWaSMzevsMTRPCyyLksinik/YZg4mAMnHxYu7shfescrjIn9tUJGnc1R0cTBBZca/NYvKD/vVY24syEndXo8ZYVeXxc0SE70BORQ93NCpIZpibAggdZdCihWY3cbHcwaQ8R37zWl7JZBK1KSIl2dwMhKFiZ+KCBwYKvkSDtYvkWD6RnmJszxa0Gf7moi2eoLgEjU38PuetWn2tTSJqItqdGFB0S91HbGJbMbkOHNt49kg7ANg3oUirQJpNAXFikNy9slzbPSHJSAnLEUeWReNWQ954Vi7pIiwa/b94BRjVdlFHUFL1UpwemFBOExLFDQkRrknL7Oex/FLyAReL94cElRaOvkC3LS7fdPQFqMyTzOZullwqACZ+1RZVJcOad5zS/oAmYzj48x1kPBsPlCaOdgUKJnWxcLl0A4nE/Bm4JdReFKYFJL7SZ/M7gDJgX9s1d2IBHSnEv/2MvatURoa/sjaBNAvDtPyyKQVT1d0Jqq7gnae2ooGg+WFUMV21HKhCAHYU+0Yic/cKrW+xet4XdL75WLYGtsMA/SqOGYiX2uF8eAFEvl9bBwXbbWeG65Hth2fVUas+bFwrzQNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(3023799007)(56012099006)(11063799006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm1KQVFVamcya2pPWGVKYVJxWnZ5Z3lERGZ5MjhXWnhBZ2psaU9ZOHg1MUlG?=
 =?utf-8?B?czUyT3g4b1RHYnFBeWpjaENXZG4vU3Z4SSthMTNkb0JPMlRVTE5qa2Jnei9m?=
 =?utf-8?B?Umt4ZDBBbTFDRWlUY0hCb3VTbTYxS0FZb2t5cExxMms2RC9taUdZd3VpUmtQ?=
 =?utf-8?B?bVVMRTlJNHJWZjBkRXJhTWJ2ekJhVzJJWHNENFNMbW9kSTdVbWRkQkxGSXpW?=
 =?utf-8?B?VE00RGNSSURWQjRKbTJHWVJLWGlBTDNmNll2T3RhN0taU3NYbHpadlVpNllK?=
 =?utf-8?B?WTFoaHFMcDJ5S1g0K3ZRSENXTERnclluUlZNZGZhdzhsN1FuTzQySjJpVlBk?=
 =?utf-8?B?VzNlSFFkdWJ1a2xyM2lybTZlR0JaVVVIaUYzQzhjMmt5Z2VhMld1bmk1NUhn?=
 =?utf-8?B?ejFMREhQWVZFZlhFeUZFbkVlQWE5bTNhNjZwZ3JQdGF2MUJFa1BvTzh3bkt5?=
 =?utf-8?B?SUowNThlMUQ5aDhJQmNWSGtKSGhZQy9PM3U1Yk9YbTNHam0wMU9KUVUyditC?=
 =?utf-8?B?SFRDWU5ZNll2N0lPL1Mwa1lENEtKYnF5N0lUUEJ6dmJWN0hLSzIvekhZTWVa?=
 =?utf-8?B?RE5rOFNiR0tuYm1RMGIzQWtxSktLNmdvNEVFRUZDQ2Q0V0dhY2J3N2hWNTlR?=
 =?utf-8?B?d2FmWHIyZGVnVnM3MHc0dmRmUlVmNUNBQlREdERuNFBsUUpKTlJCTkEwTG40?=
 =?utf-8?B?TTZ5aE10SEZiZDBQMGRIUEJMamp4czkrTnlCOUUzaTYrenUrSUoyeFRYOHpO?=
 =?utf-8?B?M1k2cmdiNVpiaEkva1V4dXJkM0FOcnFsdldvbzdSdHlUS0VRVUVadngzeFdX?=
 =?utf-8?B?QTR5OVgxam1nOHd2TUhnOWMrK3FyTTcrVHRaZnZBKy9zbzRPcVM4QnB6YVZ6?=
 =?utf-8?B?bjlORmFNcHVSQ09zdURDYngzbXJnd0ZDU2daYUo2RENmazMvRUdBVjJIWkt0?=
 =?utf-8?B?Z1ZQaUZlKzNGVHpNam1BU3M2M25QQWc2c0FubVVySmhZUmpiM2pCODJDMEFR?=
 =?utf-8?B?TS82eFJKVGQrUkR0anNxMDBBWC93NUdldy81cm0yTTN0d1BwNFhWM2tUaG1s?=
 =?utf-8?B?YkU5VlFsWFpkSStCQyt5SUplV0xHSkwzNy9OaHdVODgzbEZSTGFMczhFUlda?=
 =?utf-8?B?V2RLcDlNSWNGdkNlaUJHTDlybjVUOUhvOEthcXNMbk9sWitGT0krZUxyNUls?=
 =?utf-8?B?UFJ3SkRXT0hQZFVMRWNiSll5VXI3am1COVZjNEE5MnluOGpVVGcydGQxc1NN?=
 =?utf-8?B?cFovTkI5MFhBenNLZ2dqWFFqYnFncFFuNnpJNlJXemJFd05QVmVZenl4akFn?=
 =?utf-8?B?OEN0U0VxZmZsREtYS3oxN3JFdlRtU1pudGpROU5Eb1Z5YnhiMlIvWDBobCtP?=
 =?utf-8?B?OWJjdWVCN3BXUEZuWEZNbjk0Z0JOM3B1bStMUmFRVXdueVg1TTZQUWdwbkRm?=
 =?utf-8?B?RWc0ejlPajV4YU5uejJMc2dBcEsyU3hLNlVob3FWbFdwcXV4S3dXQUFaSUly?=
 =?utf-8?B?VUQ0aTlmelBXNzhFVHI1VzhMWFFMMjlYL2FnN3ZGR2x6Q1lzc0RhcStaUEFG?=
 =?utf-8?B?S2RvaWxDRWMxSHBKZFY2LzgyeURTV0pxSlUyMjZCQjVwMjVkSDZSUlFkSmM3?=
 =?utf-8?B?SXZ5QjcrOWdqcnVtQmZieTdKU200LzVtcmphWUlybnJ6dHJhWWZqWUkvMGUr?=
 =?utf-8?B?ZmUrNTA5NVNpUmxNRlFWSGo4N1BYdXNaWEx0bU1KM1V1cTJ0OGxSNWNtSTlN?=
 =?utf-8?B?R054RmJ3Ni83Wm0rZzJmQkVwZnAraStwbFFNRkg4U0ZZd2I5YkJ5cjg3L2tm?=
 =?utf-8?B?V0RqaEkrKzNSZGFJaEQxRUt5MFFuaS9idnVNdUxLOFlYdnkydnhnRkdPenBj?=
 =?utf-8?B?cURoWGUzZTJWa1ZRNXJURXBnZlFUSTBVQjRxWEZCenozRUk3Zm5VWHp5SUdC?=
 =?utf-8?B?VHZGd0I4Skp5bDQvV2VPZi9sT1J4em1kS1dPL2p2NTQrRGhsblZKdTNxSzNN?=
 =?utf-8?B?VHpoeG5jN0Z1WU1wcEwrT3lPTVlqbkdaQ3I4SnF0eE43Q3dVQnl1Z1dLb1Q1?=
 =?utf-8?B?aFpjOENUU0FmdzlPM2ZJQWgxZjRxaTZwTzc4cldTK0xxS3BOT0hia3I1cWox?=
 =?utf-8?B?NEczN1FXU3JZR0xIaFdzNGFtYlRpcGZ4dGN4Rm5KTnVSWmV5ajRSaDVqUXhq?=
 =?utf-8?B?WjYybjUyVHM3SmlsWngwREtQYlhHcVBlOTdIVnFTVWV6SUdlVHlCaGFrRGJS?=
 =?utf-8?B?cjdrblkwSXljTkRreDgyazFmcEt5N2M0TytOSncxcUZFYU1jUFVZNzBrN3Rj?=
 =?utf-8?B?cFVNWjI5Rng2d2tLQnZkcjBzTFBMZnk3eU4wZXc3ZFVuTGltUnJYQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6643ffd2-bf72-4892-93a4-08df12cff5cc
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 02:20:50.5031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXQrOtsz6UoNZ312zL1LvcMgvkBd1pOdsg7BYBk2+Kty7bV632bh9OywBkdYAj5SDiOs97Alzxri0r2U87H8jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF95FF9296F

Hi Karl,

Thanks for your patch.

On 9/12/26 07:30, Karl Mehltretter wrote:
> [You don't often get email from kmehltretter@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> The C3 ISP UAPI comments use singular names for the AWB, AE, and AF tap
> point enums, and misspell the parameter block header struct. The
> corresponding definitions already used the correct names when these
> comments were introduced.
>
> Refer to c3_isp_params_awb_tap_points, c3_isp_params_ae_tap_points,
> c3_isp_params_af_tap_points, and c3_isp_params_block_header.
>
> Fixes: 6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>   include/uapi/linux/media/amlogic/c3-isp-config.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
> index 92db5dcdda181cb31665e230cc56b443fa37a0be..fc70b3124ccacff635a7d9c0135d4e3821ba1a33 100644
> --- a/include/uapi/linux/media/amlogic/c3-isp-config.h
> +++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
> @@ -247,7 +247,7 @@ enum c3_isp_params_awb_tap_points {
>    * from :c:type:`c3_isp_params_block_type`
>    *
>    * @header: the C3 ISP parameters block header
> - * @tap_point: the tap point from enum c3_isp_params_awb_tap_point
> + * @tap_point: the tap point from enum c3_isp_params_awb_tap_points
>    * @satur_vald: AWB statistic over saturation control
>    *             value: 0: disable, 1: enable
>    * @horiz_zones_num: active number of hotizontal zones [0..32]
> @@ -305,7 +305,7 @@ enum c3_isp_params_ae_tap_points {
>    * @header: the C3 ISP parameters block header
>    * @horiz_zones_num: active number of horizontal zones [0..17]
>    * @vert_zones_num: active number of vertical zones [0..15]
> - * @tap_point: the tap point from enum c3_isp_params_ae_tap_point
> + * @tap_point: the tap point from enum c3_isp_params_ae_tap_points
>    * @zone_weight: array of weights for AE statistics zones [0..15]
>    * @horiz_coord: the horizontal coordinate of points on the diagonal [0..2888]
>    * @vert_coord: the vertical coordinate of points on the diagonal [0..2240]
> @@ -342,7 +342,7 @@ enum c3_isp_params_af_tap_points {
>    * from :c:type:`c3_isp_params_block_type`
>    *
>    * @header: the C3 ISP parameters block header
> - * @tap_point: the tap point from enum c3_isp_params_af_tap_point
> + * @tap_point: the tap point from enum c3_isp_params_af_tap_points
>    * @horiz_zones_num: active number of hotizontal zones [0..17]
>    * @vert_zones_num: active number of vertical zones [0..15]
>    * @reserved: applications must zero this array
> @@ -487,7 +487,7 @@ struct c3_isp_params_blc {
>    *     | | | b_gain = ...;                                               | | |
>    *     | | | gb_gain = ...;                                              | | |
>    *     | | +------------------ struct c3_isp_params_awb_config ----------+ | |
> - *     | | | +---------- struct c3_isp_param_block_header header ------+ | | |
> + *     | | | +---------- struct c3_isp_params_block_header header -----+ | | |
>    *     | | | | type = C3_ISP_PARAMS_BLOCK_AWB_CONFIG;                  | | | |
>    *     | | | | flags = C3_ISP_PARAMS_BLOCK_FL_NONE;                    | | | |
>    *     | | | | size = sizeof(struct c3_isp_params_awb_config)          | | | |


This change appears to be unnecessary.

Thanks!

> --
> 2.39.5 (Apple Git-154)
>
