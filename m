Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022137.outbound.protection.outlook.com [40.107.75.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC273BC696;
	Mon, 19 Oct 2026 06:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391081; cv=fail; b=gR3uLSh/m/wYePRSTqrNxfGUwBFVn9MFbCQcByAn/TNBZPRHmlWGCATGn+ckXVr2xpqralZF8c85cjvhjRzeNNh+lQFxOstCHy1xLsIy4B7rgDh079VoiC6yj8IKE04fFfAN/6OrKcZ/yM9IcT9kicEHxt9Ya0SgiReqVHeXpCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391081; c=relaxed/simple;
	bh=gL2HTWCQz+of3iaShs3Ynf/A3GumvO20N67WvFI372c=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e3/UiR5y/LhTioYWpHZMhkCvvmjc8d3qP45ZzlFRUpkCjthAhH0hO741TiAbS40+ceedbcz3SZApc+lfKuAJgVd8Xh/fvD0S3RvwqfciZxh71q58AK/8Kqw3T8jfPQUu8Lxb7Zv7S9CUGW3ih0Sk4xTpdK7DvoBc1CGQ9XLfcL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=mNV4qcd8; arc=fail smtp.client-ip=40.107.75.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="mNV4qcd8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaOc54kH+1o0sFjHhWS6B7DBxazB+lCGKKOR7TC12gIERwN8i0VdTP0USavqziAzfNG2/BCadyDBwFaXv53N9LmG8QCg9kPzLCrG7vBD0Wfgcdr6Bi0aiFwji2zENfAviGApT+II9mUGApZEhLcmpQpTWaVELUs+fQMNpQnilqvKuAbXdWmoQfGRyTPr57V3rz1yJRzE0AuDrrGD56vxFWZ3sAem5aUj8XIVzkg2pl8IO4EYZkePpZ305tuvbsElMOcmqQMgznzurNweCDxRmkBI1KNUMI0px9lMnIBmRlKXUqknvxzb/JFefLo4cAFtGNkdmp04bw+JIvGTwlX2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAMmqEDorsUtpOKCRpyyk6e6JaUIA0UlHIssrgG6Ltk=;
 b=Fx8nVzshT6y92A87h+K/19fdBmwtvSjEw7bK7iM/zLkZ+zLvMmiSxnMpf2kY9SKd6S9t8IKk4P1yZ711LiUv5dQW6LaqqcWhkJX2zvIs8QuE03PP5kAymtOymt8JFKae0wld6Q9UkhE0/DfhUpIor0/oYJnlAUST6piZHPavSs9xIs0C9u6Z43kEvmH+9wZ3IzEI/7gIlrQk5m67KctARdzxvtRp0L4GH/8Ibfm1lzG/iQgc1Hw6wJ+sfJELjSYr4rJNXHx8nPtD67AudUASeFP2ZfRY4KBYXXhTC74W8Nt4a3o7dgkf56l59MWbVORG6hGEa6etBBotC0Ru6pvWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAMmqEDorsUtpOKCRpyyk6e6JaUIA0UlHIssrgG6Ltk=;
 b=mNV4qcd8eqrXIJ72IQlSp5kXkLgZSJRL1Ky1PkUz7myv+gmb/daGCHbOsx/sFBqvYOT/x6qAme4Bjyq5vHECnRamXQES7sykX9CkuNm+ZhSTqmRcjOQgNfgjR9WUet5YpSLNSALLBBQE953NvqiZX3WCtY0FP9/tv15fhmGjXU0U8/u1nPXQ5EeU7STnO9Si8L7QpML/hlLib895LPIEq7su/OcMzc5Sfiq3AOxdg76dPho3lKWpdC1Lymfl9qweQjWXlytcoUHnUSjf6MHKqQsRl5KiX9DNRENCaAmg2io1BjvQd2jPPL1gmv6HBHL7Wtq4wmV0Ojc/kmiEgPpnxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TY8PR03MB10450.apcprd03.prod.outlook.com (2603:1096:405:3af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 06:24:36 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b%3]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 06:24:36 +0000
Message-ID: <99b34523-8ee2-431f-ad1b-c1e11dd1412a@amlogic.com>
Date: Mon, 19 Oct 2026 14:24:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: c3-mipi-csi2: handle runtime resume failure
To: Jiale Yao <yaojiale02@163.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261003081129.433041-1-yaojiale02@163.com>
 <20261003081129.433041-3-yaojiale02@163.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20261003081129.433041-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P301CA0010.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::8) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TY8PR03MB10450:EE_
X-MS-Office365-Filtering-Correlation-Id: f88e0c9b-ae53-4892-70dd-08df2da9a5b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|10067099003|22082099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	aNf8dIk2EgV1clFN6g4D01RMan5mMz3poPNw2ullsOvq8xlkU8+p+WNG8t772JDFUpOCyyJtz2Ax5o710/lqytStoAbweYbO7WcIQoA9w47kv0NGmaVcyZZuPOzSIrjPtpNtRAktUcf/zf5+OTcOkeFcP+/mJdsWUc+zaqyIuHWA2Y32hV62l0ZOR5GN+4FvGTMOWtt9krdp7x8vbHZe1frHTqQPzUwr7q3rcCnCpBErdx5m2eHu+rH7qdukQoIfgWgw9HY1WYfKkXUT63eyee1ZN7No+0yE56tTrXYWrC95xM3vYhzHGwiieVF978VzIKZOjorg+5VcZ6/74j4676stgaVuvbemcZKRCSU3kE/u00sGuN3lmz7rZmO2eR8R0R3pStp1k80IHoEKEPvRoJODwD3rX79uYOyEv+MKyYtBKaJ0UihaF9wPGRW0gHw34YRUkxIc7Bzd+pYp3xYKLWk6+9VBXwt5r+tjm5fTiCuAeoOUY/9/oWV82wNYgVygXEzUd3NIw2KFRtWai1jUICU/lOTeOX+N6vZ3I/Z+L2wDfS/PTJDc5YcIizWHdsuAnBkDEvpAA7vkh8jKn0NmYV8+DuBPUe8HLzLl+OHlDfeBLURgtkYgFxHhI0GrIY0Ekto8F8l49p1ImgLmIn+gXn+N15C/3UFUe38gc+ThVac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(10067099003)(22082099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVVTem5BVW1sdVptbHArKy9CNmlCZTN2ZnI1YWVKVXZ5cFdEQVhsZnQwYTZl?=
 =?utf-8?B?YWQwRzhVVVJKcStUdmtGQzQrakI5OVJvNnNYdWZOczNCTkpMTUJlK0ZTME12?=
 =?utf-8?B?NENDZWdaUlREVG9TWUVackh0NC9QdklNb3F6U0loMkN3SUJDNzBTbXNFZ05Y?=
 =?utf-8?B?R3FXdWJoMHZRQXYxakVMVlAyT3kvTlVXWFFadzRqNi80ZHFmVnRaNFd0ZjRk?=
 =?utf-8?B?YzVZaUdNSlR2VWk5c3NETWR0eVZjaWpYWk42YWlVdXlIOFBWam9LSWh1MjRG?=
 =?utf-8?B?bGQ3eTJxRk9BQmNjN3BxUW80dW5NSHpHMXJkQzFSUVJwdXZMQ01Jb01lT1lN?=
 =?utf-8?B?UUVFYVpRcHRBUWdNUlBGV1BxTUtJWnlHVUJoVXpJR1U5ZkVUWnhkOEtRUEFw?=
 =?utf-8?B?dXd2NXV4aFVtUDc1R205UGtaYTZMU3ZzVjlYS3VDV1JzUkhQaVMzRFBUWlR0?=
 =?utf-8?B?cUZwNGNVVWRwenBqR043YWpRaEczalYyeERwYUZObHhTRXJLTFhhYjBYeFhl?=
 =?utf-8?B?MENuZ1BvU1B5RXRrcTRKY0tJclkwV3AyY2tWTzJDZnRUZ3g3SU5YTlhwLzFD?=
 =?utf-8?B?ckdqcUVFZUhiL2MrTzZLUkVTRHBjREt5TmNRNk9Uc3Vxc3dkeEFNK2ZRMFFM?=
 =?utf-8?B?bmxtY3MrUDR1VG5iaDhNZ1NvaUNBQVFZRTU3djNNdW96dXJ1U0FNNnN2NHMx?=
 =?utf-8?B?V0FROXRpb2FWQW1ndUJSOWtmRGc0ZXkwQU9NOGtmMjRyKzdEZG5uM1V2bXJt?=
 =?utf-8?B?K29YUFZRcTMxY0FaS1psNlZyNUMwMFFLTVh1WE9zQjRBNTJtSGE2cHRFQ2hG?=
 =?utf-8?B?WG1WV3VZQy91VlJwbjBmeEl3ejl5dWNCNWh0ZnFlVGRRUjNDVTdpVVg4SitG?=
 =?utf-8?B?Yy9qM3p1ekdTSm42RE5XWjZaYm1PYU1yZVBoRmJEbmJENzRiVjIyNkdhSFlG?=
 =?utf-8?B?ZmlMaXFIY1Q4bkNLU1IwZXFuRUVWTW1yOC9wNk9sTEVvRHJnMVZFTVhESGI5?=
 =?utf-8?B?eENueXhGdktFdWp1OHFjL3lXK3pSTWZPRlRmMGVJNFBrMG4rUzJ2bW5nM3NW?=
 =?utf-8?B?MTROL2tJZklpSU13aXI1L3hpT1hzME1xVHNpL29ndWxZV2FWVzkxZVBPUGE1?=
 =?utf-8?B?SThIUFAwanhTR1doRzNMSVhnWndIUWtBUWZVZnB1dlJBRUNlc3k0OHJOUmVR?=
 =?utf-8?B?czdaQjA3ZG1yb0Nvb3NZYXVzaVhzSmZHVHNjOVdERkNMN1gybFBwOTdrV3lt?=
 =?utf-8?B?VjNOMC9lVDl6V3NBNW1IQ2wxdUJnVlJvYkRZRW5SK1BYUGdod2dBYjBEVC9S?=
 =?utf-8?B?a3B4ZWhYWmRZM1UyS3ZGVFJIVENjd2kvYk93aWlRZXpuZWgrdHZjdEplYUJn?=
 =?utf-8?B?QWJuV2ljN0hxcVdKZHBkcERrZlUyNDhCakNZSXhPemtwVi9GOURBZGVWcTBL?=
 =?utf-8?B?TGQ4WDNNYkxvZWJyU0tmRjJ5ZHl6LzJmaUV0NmVQSU1jbVpzUSt6cjVDenVV?=
 =?utf-8?B?dTJtVTVCM0x3dXNxVXN6WlhXaHFJbGUxVXhWY0JJTGV0TmNaNVQwTnZvOGVk?=
 =?utf-8?B?Mnk4RUh1V3d2OGY3c0sya3Q5eWQ5L3FNU1FOSTY5WXh0SmNlMGdTZkZKaTRD?=
 =?utf-8?B?bUNTZm9NbUxCcnpLaVZpVTNHZFRMV3VTZVdCRnMvQkFnNG85MmxoZG1NZWxR?=
 =?utf-8?B?V1pIMHpFMGlOd2N4RFErNmpaZm1McnFQT3NuSXlHL0kwU1Z6TmNZZ0FBUFVZ?=
 =?utf-8?B?eWVST1BMSTFpVG1GM0doUHAwTC8vOVFiUldnbHdxem5mL1lsQitPSHllU0Ur?=
 =?utf-8?B?YllhRjB6RmoxTzdVcHU0clZLWjNnTk9JQ29EYisxSHdsZDMzVjN1cW5QNkRk?=
 =?utf-8?B?MWpIRzM4RnBnbU83N2JySkRjTXlPNnBFWWsyaW1KODlvUnpwS0JQZVhUeHB0?=
 =?utf-8?B?azVRL2FEQXpFcFBVcit4MUt3Sncrb05kQS8zQTZFOWkzUEMvM2hvbFUraDNO?=
 =?utf-8?B?YmtNUldJM2lGK1RxYjl0VUJYeENkZldvbUFZZHFiNWhFaG5HVThGY0xWdkpI?=
 =?utf-8?B?ODlqclBPcGNIakJOUUltVjFQdno3KzJlT0swMS85bmwrTjF3MjY4YXk2Ti85?=
 =?utf-8?B?UGY4eTIyeHd0SmFHTjM0eDE0VHM2WEZORnNvcHNNd1djZXdhMUd0Y1lUMjEv?=
 =?utf-8?B?bXlMdk5JM0s3OWtsTTA1K3pCUGVXZnVBaE5HVWlwaGNFZEVVcXF3djJJYUdx?=
 =?utf-8?B?U0lKSndlY3Y1cXpJRGhwVWdMY01WTU9HaUNKTGJ0UlRYYXVMSkJVWkR0VHFy?=
 =?utf-8?B?ZU5qM1NqOTRkS1dUbXEwNVVaM250NEtWMnNHQlZYdnltWWhSSzRPUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88e0c9b-ae53-4892-70dd-08df2da9a5b4
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 06:24:36.4668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5w7MuwwFMqa5H9hH+Df1VGdmmg6XDAclzRojJyDEB2VDj6+0Epur4+813F8UApQOFoBMxHxeQsyDR/goNVSyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8PR03MB10450

Hi Jiale,

On 10/3/26 16:11, Jiale Yao wrote:
> [You don't often get email from yaojiale02@163.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> c3_mipi_csi_enable_streams() ignores runtime resume failures and starts
> the receiver before reporting that streaming is enabled. If the power
> domain could not be resumed, this accesses unavailable registers and
> the disable path later drops a reference that was not acquired.
>
> Return the runtime PM error before starting the receiver.
>
> Fixes: b63ef604a28d ("media: platform: Add C3 MIPI CSI-2 driver")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> index b9e4ef3fc308..4731d58bf2dd 100644
> --- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> @@ -431,7 +431,9 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
>
>          src_sd = media_entity_to_v4l2_subdev(csi->src_pad->entity);
>
> -       pm_runtime_resume_and_get(csi->dev);
> +       ret = pm_runtime_resume_and_get(csi->dev);
> +       if (ret < 0)
Is   ' if (ret)'  better?
> +               return ret;
>
>          c3_mipi_csi_start_stream(csi);
>
> --
> 2.34.1
>
