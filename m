Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793588286;
	b=duXG3jv5zx0TX/RJtuDefii51FuRgxcPHBecRaDTPBaapueu0ttWAtBzCK9frwOKAKaQ
	 B9E/9+JHybGzZ4MR2SXch+1Xe4vTh2uF42flSmqBgwzbUhF19WIc0abcwM7nuPAWgknRv
	 UGZnrqN5TRRtjeLhY0f/wV4CfuyAlw+EWgUnkso2rj2vTPQy7riI4L55SCJQNefS3mzG6
	 Gtr2r50lalIs+R3aLTqHFWLC5h2Z331Sqm/xTLOK06Ol6tii8J483BktcyWIuE+9Tx4KE
	 6AUg/qTDybpKGXVXCWDM0WNvMq1glS4dbFLgKkUF+IXk0lGU/VQRmIjgP0Zqf7rCyeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588286;
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
	bh=jmoS5TLxmNPOu4aWxMJsWrmiufQnFAcvOs/eAfuDzfQ=;
	b=KtG5+5FzmPP25JPkL30ZhKoDU3+qbjudKh05j8tON6mCy/3EgrZIJlujIRX8HD6kTx/Z
	 R/L1xldwa6dFZedI7J6ZbsiRI8wqKu4BmUyelQJv0tCI7wHESduYqYX7zs12oemQtIWax
	 X21xbybx3qCB8ZLbaQvmEuNJaqLqszzlyG7zXVQnGsbacL6CmiOuTL3KEsrUWgcn5NmvO
	 k5UowxKtamGhIATznXsU9MVATRzOIrNB0dIFR5ZclSXYLmGOZi9WYMrlcQaZRia+lQM3Y
	 yl7IHrAWgnQzAXs1nbjJ4M0JeuYtj+Usu8olq/Z6E9yRe+aGpeqGtkKFaXgkhatfHnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="O+NCfZ/S";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.68
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A394606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A394606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=O+NCfZ/S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUh5orASJimBij7wwjzwaBA68DdQZpD7fGqksZ2qcE+W7bU21vF71xUM0jRUQPjj7SzlLEPTHbE3Hxyo55uvSvQuCUyYvf5zRlJgAKrRFXxeipgmiRwdaU8GVx1wr+5Xj6WUMeB8yWB6DkO+HJEdYi2EBvAbvfC75S4PKf21psocwKU4KoWSfmp7Bli2P9YE/mK73e2vpgDjE8j5GCZeqDF63x8rKHIE5nPpxTZB8gsIi8j3dlGZ0VHoBxazQgPFDPrt0WBatcyPMMFt3clA5mL5DIsVT+/yAYrmdF+73KtwAKC6DUI73UUie3rEEaHujAPLCL7TSVqvG+pDik9fzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmoS5TLxmNPOu4aWxMJsWrmiufQnFAcvOs/eAfuDzfQ=;
 b=tCpRnGENvkXE3so/FOeECO2VcKiRjVERPlB5wpLExfGUlT1MF9J0kYX9tyaU1wUo5EvyqF20xKBMN76P+4qUjN09Z4VufYN7J7O4sltTMBs1ArXVKaw+ORzrvIoxuEeGkLB3DF0CI/i5cdlVrxt3TH4KcP4w1TFbG1nRVmVSsS85aRRx6C8WzCEA/f80qWAnuhhIF5qmZNf2Mh7o7eYP7YbL/LnKwSiEiQpS7JTN9vy/sPfaqt2mjRgkUL9DO1n+YaHoePTMUkdpHUQNhFEsAeZravVLzDVgkUEYbwcpyYP1Dc+JSJX0VsOatrqYizfSMRBks+DM1euWPZegvut06w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmoS5TLxmNPOu4aWxMJsWrmiufQnFAcvOs/eAfuDzfQ=;
 b=O+NCfZ/S84jOCvW58+XzOVFPQvaTQRVrlx+2E1PeU1KZZwoi9LCdYXTnT2nV7KdGgzhrGeI9gnucGSORkQKSA0HV5CPA6iw2amL552+CDUGQyIbJX0Ekp22lU/wBFvb560oC7onXLygjgmbKBZNgLRMEJw8G0npti5dCMaw1CEGI4JRPxM9nRSKwoedKSx5I+UlPPGFBQyLyZh/lAi4RPUpDILWqN2qQk+/kHNYw+tGAUUI4vEM+A1O5ITEuF7yiosAFZri8qePNotMkwMpl2OJhalIU7+0ry6OvPUwn/h/vfn7cTcLX6lqRpiraE2EfSG7PRwKytjFlBdzpdSlfQg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB9730.namprd12.prod.outlook.com (2603:10b6:610:253::9)
 by MW4PR12MB6952.namprd12.prod.outlook.com (2603:10b6:303:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:57:27 +0000
Received: from CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128]) by CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:57:27 +0000
Message-ID: <eea1690b-ddf9-4424-b312-3446092aec18@nvidia.com>
Date: Mon, 2 Nov 2026 13:57:21 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] taskstats: take the inode once in exe_add_tsk()
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
References: <20261101005616.3022705-1-brads@mainlining.org>
 <20261101005743.3022780-1-brads@mainlining.org>
 <20261101005743.3022780-2-brads@mainlining.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20261101005743.3022780-2-brads@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MEWPR01CA0128.ausprd01.prod.outlook.com
 (2603:10c6:220:1d3::11) To CH3PR12MB9730.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: e650678a-4831-4aaa-d30a-08df388d0714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261028144727099003|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F10c8hC7/rWfKUI06A/Es6PrekGTPlT6YjJ4SQiA7Kjp81tHidAdOFlaGQg2ONllMbzOcla7QWF7j8n9vElql2RklE4HeYkOyLaJfmnovhXx6gbygfmwQIPnL+9gyzuahuKFb9Sevu5D69t7JaGkYPH/FDlSIFwO5lkQvP+cC3punX7isva53pXzoGI2gKxxssepyMpLRzNHhJZy0nSKGoqpD8C9L0wr1KuqBizcXWGfx6I2i2YZfIgZzZ3rbd8JOL9JkBT+AuzT9Tg2OunF85WP/UlsGH0/IzIKGC5sigFLYdSbKX5/51o/GseBZsD0haPug+12UGGmKrf80orw+t6kS2O6vPg8mPXmjtKO5iRAQ/6FVD434fPYL92/azN0Zei3HD1xckLTGC2kWvN9OQBgBEMYMtzypcJVHWeTIvUPJPWML1CWweT5F8nD9uXAd9WcxKkcJ9/TFCbThUJP98TpraD3HB5QwELuMC5QB4bEVcZ34+3rcJ9gZbwyOFlKHGU7Vot1m7bkQnEyEaSep/kv474LhVrvnIK9NhqRDinoGoGvlBMo8on26N4SeGEY7oGBOSgAtpo/sUVuAsTeYAutbgdt/EY/wujqNFJTCRUgiimzvpiXieBTAn2+bA//B3jr2JDOEuvB9k254zT/PndHr2UOPfp0Iq+/pKra4nQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9730.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFFnNHhrYVFObmkxL3pHeVRoNjBibGNWWmpuVGhCTnJqcTFITnpOU0hsR2hC?=
 =?utf-8?B?cG1NK1JsRGlJb2ZtQmFpZmhWN1NHU0lBZUhab2kzR084TjMvWi9McW9SQWE3?=
 =?utf-8?B?TWRRRXgyeHdGNFdZVEk2eStScGZqOVY1RlkxbUk1T1JzSUY3YXFuSlRPbTNq?=
 =?utf-8?B?V3V6U244THFxdUZNWUszSkZQREZONGNTeG9yMFRnWEw5bW1YUzV6WkxqWmxS?=
 =?utf-8?B?QXFWWExnOFdKTW53bGpXWkNDdE9DSndFK0tiQUlucVlWckVhTDdUV2Q2WGpK?=
 =?utf-8?B?ZHhzNTVaV1JQazdKSHlHLzBDRWRoeUFBdG9hNlhOZFUvZlJpTGhWb2xDT3pk?=
 =?utf-8?B?RUtIUnhoQ1hhUllQSzd1MS9UbnRQL2FiRmUvUTcyZG13WFZWNTM0VXNPMDhE?=
 =?utf-8?B?b2ZPc281bzRUT3RFWVR4VUp3dU4zUGJoTll6Um9zaURjbzMwNktpdDF4TzJV?=
 =?utf-8?B?TXZOSTFESTlaNXRCMjhvZklmUGZCem9FY2haSmx6ZmlKYkRIOFFMU0QxSlBh?=
 =?utf-8?B?dlNpNExuZTBCZlJvOGViSDhqSGJmNU16cy9ya0RqZXl3S1lJemFxb2ZEUk5J?=
 =?utf-8?B?YkhyNUZtQ0g0bThxNDdrTExDYmJ5Q3A0dUE2QlF3ZlM0a2xhWVgvUlZobmdE?=
 =?utf-8?B?RmMvY3BMbjA3ditremhGaFc1YUo4K3BEWmdMbkh3ZEREK1V0ZTNHNG5LcFlS?=
 =?utf-8?B?ZFBGbGs2bWYxTGYvdnNRTzZFaFpPK1Y2dTNCaGw4bWtvQ1ZlcDdTQnNBTnp2?=
 =?utf-8?B?RXRyVTcwVll6bDBqbVhMVlhuY21HRDc3RXMyL2tRSXF4U0pYU0FjMW1YU05q?=
 =?utf-8?B?YkM4NC9UcFUzbTNZc28vd2o0eUtrS3Bzc1RrcTVXTy9RTFhtakFuclp4dVRS?=
 =?utf-8?B?cWpzTE9XZmUrY1Q0OUw0anVNdEdyZ2FCZnRMdkFLaGQvTXJXYWxKbG5EOG85?=
 =?utf-8?B?SWtnUkhSc24rRm1Obi9PdUxhb2RzcUFUN3F4cURBSWQ0R3B3a0c1WFhOaC92?=
 =?utf-8?B?eDJEYlg5TkE5T2VuNm9XZE5JQVRrZ3A3bEdUNWJCMUJWMWlPL2dteDBBdCtv?=
 =?utf-8?B?OW9nUHJBMStSK0N1eW0wbGdkdU9tWHQ3UFVXYU90bUhNOFpJaG1lemVJb3Zu?=
 =?utf-8?B?Vis5ZVcweDNnTEJlSnBFTUdHM0JCWURBNUlBNzVQM0lmeU84cFZDelVvc0RM?=
 =?utf-8?B?WEdjN3IrZ1dURmNuRGt1dDVrMFk3eVBjTzBpYVdJMkdTVFA1K0E2aERKNmhB?=
 =?utf-8?B?ZCswNmhNc1AwMDZvaFZ0TFNoa1h1MzRHc0JycGRMQUV2d1kwWGlxZGxlbDNK?=
 =?utf-8?B?MDREMmVKTWsyTytLOGFJWW5NaDA0dytZRHJmUmE4VG0zQUNybDNtZ21peVhS?=
 =?utf-8?B?OG1LTDBYYzhWL1FaSUxyRXdvU1paTG82d2dvZmhnWTBob1pBUUJPYlE5NGQ4?=
 =?utf-8?B?S2NUMWdFV2N4YUVKUFlmb2kvMVBXRnV1RTVsSFBwNHowSHlXRGxkeFZVL1BZ?=
 =?utf-8?B?VkZUSzlrN1A5TE5PSmVkekx6UXFrb1F5bDVZRWpiNWlMTE9oZjF2YjI2b29J?=
 =?utf-8?B?RWFRd2lwS3V3NjhNdXZTSDY3OXU2WUpiVCtOcjBteFJnRXRsOElyeW0yZTVT?=
 =?utf-8?B?VUp6UFdFUGtHdkloQW0zelNrZCtDREVMaVB4WE5MU0ZpL1dacTUwUWZQSXVD?=
 =?utf-8?B?dWp6a0xEcm5xV1YvMkF0SGZ4U2tmbmZXSm1XUytoaXVhVGF2dC9WdFVEOEJZ?=
 =?utf-8?B?R0lybG9mZHZ5RHlBNXVRVUN3RjFqZ0tBc2hsai8rTXpWQXdQUFYvSDlQM2pj?=
 =?utf-8?B?eVpLeFphS2MxMExsWkp2ZUl4dTJYUk5VcDlwRCtOMEFHRTF0Rzc5VXpiVUxv?=
 =?utf-8?B?MkczYys5MkcwQkJBUVBDbXh6RVg2TDRHZnVaczlBUXhyYzRORWcwZFpvdUVE?=
 =?utf-8?B?SVJmNWFSU1E4dDdKUkZHbU95WXZqQnlTM0xpeHowQUo0RnpCUVEvK2FzUjhv?=
 =?utf-8?B?MU14WmJ4ZE9YdlMxSW1KN3ZEL2xTem1ERDJTYVdSZllzSUc4UC9NM0NTd201?=
 =?utf-8?B?eG1CeHpXc3pGQ1hPaU9vSC82Z2l2YW0zbWZBR2s5b0lmTHd3b2MyT0dlSXly?=
 =?utf-8?B?T2RMazYzR0xxbHlEN0R5TW1PMjRGdHdleCt5ZDRJb0RSeGE1Ui9NOCthZFV0?=
 =?utf-8?B?dk9peVczUnk2b3UySzhqWnBKQWU1VjBOdlU0Y2o4ekZJYUtKVVFLKzNjMDJJ?=
 =?utf-8?B?amVmeDYzS0NzWDBsTmhkemplcXlRMXJnSXkyWm5ydVZXSXZvTlhPVFo0c0Js?=
 =?utf-8?B?NjUvNzIzTXJaZFNKVFR4a3lQQzcrd09lalhneU5lM0tzQUFVVnVrdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e650678a-4831-4aaa-d30a-08df388d0714
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9730.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:57:27.0884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ae4+AqLKaqBACvNQOdEAhhDzkDHsyMziCbPxzkJ7VkjAClpdIvCr9MBjgq/oSQXTanLTnahmjf6XBQRv3Of2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952

On 11/1/26 11:57 AM, Bradley Morgan wrote:
> exe_add_tsk() walks exe_file->f_inode twice, once for the superblock
> device and once for the inode number.  file_inode() is the accessor for
> that field, and hoisting the inode out of the two assignments also gets
> stats->ac_exe_dev onto one line instead of a split continuation.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  kernel/taskstats.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/taskstats.c b/kernel/taskstats.c
> index 37422c43b8caa..35e9fa71526cc 100644
> --- a/kernel/taskstats.c
> +++ b/kernel/taskstats.c
> @@ -159,10 +159,11 @@ static void exe_add_tsk(struct taskstats *stats, struct task_struct *tsk)
>  	struct file *exe_file = get_task_exe_file(tsk);
>  
>  	if (exe_file) {
> +		struct inode *inode = file_inode(exe_file);
> +
>  		/* Following cp_new_stat64() in stat.c . */
> -		stats->ac_exe_dev =
> -			huge_encode_dev(exe_file->f_inode->i_sb->s_dev);
> -		stats->ac_exe_inode = exe_file->f_inode->i_ino;
> +		stats->ac_exe_dev = huge_encode_dev(inode->i_sb->s_dev);
> +		stats->ac_exe_inode = inode->i_ino;
>  		fput(exe_file);
>  	} else {
>  		stats->ac_exe_dev = 0;

Thanks!

Reviewed-by: Balbir Singh <balbirs@nvidia.com>
