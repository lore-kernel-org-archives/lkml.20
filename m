Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793134268;
	b=ENOpqjRoN/XQhY0ZlSm4m+o0kuHgz2Ue4k59Vi/qYGvHD5bxlz5Nxqssew0UDVcAjems
	 VPeeM1XALSXXJX4jjo/2Cnj/d4zd/6j0G4EohkFnmgOorBL8jY8+QVQ5pUNSLRcHnfiF2
	 d8XbtXR1pf3RdK0I0fqIqOzfaCvjJEiZEjlWdfME7xnRXHBfLRJHg5ykgDdWVlNGx9+c6
	 Q0RFkIxj2e7Cb+t8WPz5j2o2R42VhmiVhctuF1zHu76IJD2o2khdYdgpa/6Tw1FYhyysD
	 p0RI0n4dzG8s6fHk4ZQYyd7FLLAT+bQVeBOWQgnNTZo51OKceTEY02nRZxO3E9eS97A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134268;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
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
	bh=ghVknt/XXqH4uDdnh7fnbY7iSaomlTGIgQYIHHjE9gQ=;
	b=dfd71Plx8PtPYdvoHDyPoCeiRk099gUGzkrtKhDdRRuq4sMZDDSMEvTZrzMTaWb1a5+0
	 g5JvpvCEWrvwFVX/waRUTkGktK0ay9uEvCF7pI88t76eE45WlQV32uCB5kE97ghBbSm9q
	 CVhkzRZzea5Aj7xS97R7c7qECgkENTDG+Qzd/VuDp3ZmFj2VBQFsdMCW1IGdO+2IrVm5j
	 HhmulMw2SE/ZYBqOZ+LWNSZMRfp/cqH6ew/NLCu+zT11j/suzcMNnn8GhVqQpo9WLuKXr
	 /FlbBRnRviavLoLSa2L3Zw8HiVOc8OhPhc9XIzVviSkcRO8jWqwdszAcG0X2GMKm14w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WvMSQOH8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.63
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3F0606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD3F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WvMSQOH8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3OjRihc/9g/C/jmT16v27W23pZ7GpYGZZ8gL7WB+cPiqJtFMNKsc1YPWEVWvCsuvaMI36lCpVxrAQWM45/AGAs9xVNyZ9BZvCMS+GLuyJVAgIOgMrNvwH8IJaoviMFdC7JMR3TEV6CeKVi/wUCc+H9u8BiHaDfe9gIBqFgmckuqH1n+bIElbKTk8SWqaaSBA4yET8rtthgwWgjmV+eGEtnHOeVAgHO6BzjVSJkGOEB7/0azG6RpZ393ZQuRuodQWHg1dtzwoIcfGl6quIhNGf6Q3SypepkA1y17yQMo4qT3xJh4v6+jUmIKRYQ/PePtjt2YZtWVIQTvMShBoyLQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghVknt/XXqH4uDdnh7fnbY7iSaomlTGIgQYIHHjE9gQ=;
 b=vTgKzv0E9FLsOXOGnwK24QtWeDrKg+LVMtXywcmjJG7R9tSbHQtL70G1iQ9daJNKUz/HqNoLcm2rmCoxX/vZ+GkD0J6Vveb74g4A7RjKfd1asxCnTsSS0H/zul5sEwEfRauImA47pZ/o4Cc7bZ1mFUuGrDs4E0aT1B9WR1ZUvSBM+HAG0jVlQ5uFqDPAcGrelktg1R8iAnraruMkfLE2mki4BA2lAmBSYSuLXSbZjskT+34HP3G4Lqz+mv5Ng7V/+Fs7RdI7LiYvnaNsB9Hn9x4TrNj+bIeBy17PnL21DjNOU4mz4UzM4E5ttddn7cytTujZOseZnNC1dvXcGp8OUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghVknt/XXqH4uDdnh7fnbY7iSaomlTGIgQYIHHjE9gQ=;
 b=WvMSQOH8C5N5fwRrDW6BYSKc4JFHyr6PN7vJALv/3UHueedVHVkwlh7c7qe1OZbLTHD/9b0Qsehfqy+kc2AjuOQjUEh2md18XOiqvdFLaL4i5dDLvRPk8UUrY9FXfyehVSx/VLvOJLFjq8FxikWekbJTuoP6JHpOPYsy0PAvHn0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 by IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 20:48:49 +0000
Received: from PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc]) by PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc%7]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 20:48:48 +0000
Message-ID: <ba77a6b8-f79c-496f-ad45-9314ac8f8a46@amd.com>
Date: Tue, 27 Oct 2026 15:48:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Don't warn about vendor infoframe for
 non-infoframe sinks
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Wentao Liang <vulab@iscas.ac.cn>, Alex Hung <alex.hung@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261027185414.162183-1-pmenzel@molgen.mpg.de>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20261027185414.162183-1-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0184.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::29) To PH7PR12MB9174.namprd12.prod.outlook.com
 (2603:10b6:510:2ed::9)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB9174:EE_|IA1PR12MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b2f081-44c1-441d-4b57-08df346bb336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|921020|261026121527099003|261009223027099003|11063799006|56012099006|5023799004|261022105027099003|261021121427099003|261021123027099003|10067099003|22082099003|18002099003|6133799003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	H9Gb+fIa/jIYkcj9wQnNcXveXAIXVnCG7HB8+5u59Aj7mGvY06aYtpI4T6yelC/NnTuSSJJVU5EjhHmUfvqakUyVXjQ7KQbIHe9KeLoFudxsp8R5nCq1iRhyVDCjFA+uj35wWSMNlLoIVrnBUdaxVQLY0KuZYgGLcMJCI6UVjN3rqYLPG2YopZoFVjo37/D8u3VNL4NkNBzlIWGXMzXE1m1+5/wjPTYV7gQHodJZkn2m9wC6cbimnRzlot4NB45gFYUXPpW6Ix7Vje/HIxVQjScdF/Nm2WBgOQVR4nbSa4TJoj8uyQGCgc3yfkB5JBlgeumiwOV+3qNen2zpAK06t74uWHjmmlb0+BFsMOesFmWk56JMt26bY95RpQhGvLEexoWpwOBvAKfFbi3nc31KThjetbwAcSow/5THi1IVUrJn1uE2jDGONC3QrVAaP0sQxAslGRFFSoCmTEweP6gliu9SbqST5TVE3uprttKJUnPy9ReFvCf4ILQaww7NSqCNTUVXKk2WuI+PQMNVf8xTRxv0ojBUBeloU+vh0o5Wen7X9nhkeAq07AmogWLg1FUxxrfLvmPvmGJQyIZUxQ90WcCsOvzlqJ7KPQFqx4Kj+COy6DXSQ9g0xIsf9nB5Vf4xhIuol5Ps7ZXimaqAL8v+q0oveCkv13/lHyGEJJ2XA4I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(921020)(261026121527099003)(261009223027099003)(11063799006)(56012099006)(5023799004)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(22082099003)(18002099003)(6133799003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmdoV3pyMkJSeVVBYTNmMDRXZk9wK2hITXlNa1pKVkg4cThnZjdXUDZNQ0NR?=
 =?utf-8?B?V0wrakMvU2M5Q1A2Tm5KeUZndjZIQU9iMWhRZnRvTjlwckVzTHJ0ODJMQVZB?=
 =?utf-8?B?S1VkMVJoc05KTWxBU2RiWnkzY2dHdk5WY3FYYXo4cG0wR1hOa08vMzhLSGFa?=
 =?utf-8?B?bUZDSit2Mlk2cG43QXdnU05aU0RnYjcxcEhCK0swcHAvaUZwUmcvOE51VzU1?=
 =?utf-8?B?cnQvRmxmQ3ZuV0todG1hdVQ2TWJ0WWNkTDk4ci9SSEo4cHpwT0RrYmVxU1Vu?=
 =?utf-8?B?eGoxUzlHblJ0TmN6azY3eFFmNjgxYzhLQWhmc0FzS1dsK0ZVTlY5UDR0Q2Jz?=
 =?utf-8?B?cVQySmcyK0RJWGdoNytOYXVxRlNqcGlYZmZZVTdqd2UzWEpjeDBhYzF4S3Q3?=
 =?utf-8?B?M1BQQ05zbFQzSnBSZEI1VDV3UjUydlRaUWFiYUt5djM0SExLckNPZm96SWFt?=
 =?utf-8?B?U0oveTE4Q2RyeFJ5VE9QQ0pYcnNTcE9jRVozTEIzVnVucVJqemhQUWQ1a0R2?=
 =?utf-8?B?eVNTMitabVIzTS9RN2U3NnVIT1huVDJiTVlQVjNIZVVmaHVrNGVEd2FiWWhN?=
 =?utf-8?B?bjNaTlloZUJvQ0hQZDRuSjMwWUlFb29mMElncHk3aG5WNkZpSlU1UjVkbGZR?=
 =?utf-8?B?b29mb3dqdmpVbVhYVmYzbXE0Wmx1dGN0RVRFRVM0KysveXFzaVdtOURsWUpa?=
 =?utf-8?B?M2QrOTVhK0x2UDVzK0pZRU53RTFuN0NVa1pBVEZoVlJKQlBUdkpIMUtuM3N6?=
 =?utf-8?B?UWlvWXB4Q2NoTUl6aTJRVnl1Mzd5bU5wL3JJRXZtYTNWSWlRL3c3dmlXc2JJ?=
 =?utf-8?B?TXQ1RzVZa21rbkhLamd6b1poVWlYdDNMYndFcnIrMmJxbkprQ0tiaCtlRFF4?=
 =?utf-8?B?K21nM0VvM3JtVUN2c2lpc3lMZkNCZlNKSUxrZkljSnAvWGtUQ0NUY01lc1pH?=
 =?utf-8?B?VlRIcVIyaE5NS3BzN2N4S2NyNFczT1JtNUU3YUxWcWFNZHp0QmliZlRnWWdK?=
 =?utf-8?B?VVFUZktPWFRwZnd2ODM5Y08yYmZpb2NyeDVwTUE5OGEzbjVOUHNvd3NkcWc0?=
 =?utf-8?B?UnNndUZqNFh3b0JPcWlxSUZlbzRkUS9FUUM3UDRwVjFyREpzMEJtNmVuVGtN?=
 =?utf-8?B?Um1zbE92eWxkaUtlcTEySFBzWDRiSXhGRUhIQkRmY0lKTkdoREFoUWZjeWhB?=
 =?utf-8?B?aDE3K2VYQTBKa0xqUjJMSmlFUUFPUnhsUkUwWEpLbXlzSFcwSUJJVk5Md3hN?=
 =?utf-8?B?UW1BYkpqMnJnc1BTQXpJeGZkbXlZWUZieHQyMlhrdm5xTUVNekRnSWtNTG1P?=
 =?utf-8?B?K1lkTDZhSFZUSXVKMGZPMVNCdUFPUFJycklNSkkzeHk3aGdHeGRDbHdHOVJS?=
 =?utf-8?B?cCsvVGVheEhHSitlNWVlS0F6WHFmZDl6YnBpcGh6S3dOazExYUxpeWx5SFpj?=
 =?utf-8?B?ZzJ2anVXRmlNcFdnaGI1L1YwQitaYTRWdERwMDJUMHlMLytQODJGK0p1TmNP?=
 =?utf-8?B?NkdodGRnY1B3dVhnZnFQYmJGcm9VbEhicWhWZ21EdW1NbVllRzVoRzkzS3Q0?=
 =?utf-8?B?ei8zalhwUURvclVwUlM4MFBkQndxTFJVNjdtTm1OK2ZvY1JxRnRZUFN5T1FS?=
 =?utf-8?B?dk9QSUdUQTlDUmpQVlVMVEFxQzJpZGVyVHdnWkhnZDdVVWpsVEVuWmxta1JL?=
 =?utf-8?B?a3pUZFFhQ1JxRVJrYjVXbHE2NUp4cmdoeTlDMkNRc3M1ZzJ4aFVKWXpQL0xw?=
 =?utf-8?B?UkRyYVZoRytvSmtvWHV0M2xSLy9VNGtSeTFqbDhod0Q0dTFNMDZ5M1B4UkxN?=
 =?utf-8?B?dkgvNmlJdGJsNFI2TXY4SThiUTVFZGx1Ym5WTmh6N0JTYjVjQ1hCS25YeXJh?=
 =?utf-8?B?NWJNT0t1Z2J2d1VQQ2M1cGRQeVZqSmpIQnBRdXUwWll5N3p1Z0s5VnFGL2VO?=
 =?utf-8?B?ME5yUmhKQ01HRmMrVjdVSlRhYktJZW5QQVJjVm5VbFZwVWNYOHpnNDljUk5z?=
 =?utf-8?B?Z3dzMkQ3U1UraTVEK2ZmVTZRWVgwd0pPck84TGFyRnhaWWRUSzFRRzI5c21O?=
 =?utf-8?B?UlVlWkk5QlR6alptOTVudHY4UWw5UDBITDVERGt2c09MQVhKRHZnblh4bTNW?=
 =?utf-8?B?aVFkSEl4a1JiRnY5TWdiUG5rUG51c2VCc0t5WXJqejFmdHdjOEVyLzJ4Y2lK?=
 =?utf-8?B?TVhyLzcyaEQ1ZGwvNDBmYmEyL041YXNaczd6eW1lZjEveVY2bmdDR1RFbDRB?=
 =?utf-8?B?WFgyeG1yR0FJbkF0V0tRZXE1ZHdmR01GQ052L3NqbjdNY0JzdnlqVlo0c3Nq?=
 =?utf-8?B?MW10NlFnS3pBd0NudFVhUzcrZnd4L3ZBK256TWdYeG9oZFdWU2FzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b2f081-44c1-441d-4b57-08df346bb336
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 20:48:48.6412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpkxh+X/DWfCKATZeCdhIH6joFjT3xeFlcgOFX9SFSlrny1xiyDrddzGM0xV4UieaYBr1yaYjL9KUU15G1kIJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061



On 10/27/26 13:54, Paul Menzel wrote:
> With an EIZO EV2781 connected over HDMI to an AMD Ryzen 3 2200G (Raven)
> on an MSI B350M MORTAR (MS-7A37), Linux logs at every boot since v6.16:
> 
>      amdgpu 0000:30:00.0: [drm] Failed to setup vendor infoframe on connector HDMI-A-1: -22
> 
> Commit 6027cbee1900 ("drm/amd/display: Add error check for avi and
> vendor infoframe setup function") started to log the return value of
> drm_hdmi_vendor_infoframe_from_display_mode(). With `frame` and `mode`
> being non-NULL, the helper only fails with -EINVAL, if the sink does
> not support HDMI infoframes, that means, if
> `connector->display_info.has_hdmi_infoframe` is false, and its
> kernel-doc says, that this error can be safely ignored.
> drm_parse_hdmi_vsdb_video() only sets `has_hdmi_infoframe`, if the HDMI
> VSDB has HDMI_Video_present set, and drm_parse_hdmi_forum_scds() sets
> it for sinks with an HF-SCDB. So an HDMI sink, whose VSDB lacks
> HDMI_Video_present, triggers the warning, although nothing failed.
> 
> The EIZO EV2781 is such a sink. Its HDMI VSDB has a payload of only
> seven bytes (source physical address, Supports_AI, and a maximum TMDS
> clock of 250 MHz), so the byte with HDMI_Video_present is absent, and
> the EDID has no HF-SCDB:
> 
>      67 03 0c 00 10 00 80 32
> 
> Only warn, if the sink supports HDMI infoframes. The infoframe setup
> itself is unchanged.
> 
> Fixes: 6027cbee1900 ("drm/amd/display: Add error check for avi and vendor infoframe setup function")
> Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/5025
> ---
> 
> Notes:
> 
> claude-opus-5-5 (Claude Code) assisted in analysis, code change and
> commit message.
> 
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> index ded8e21897f1c..636dd2dedd73d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
> @@ -941,7 +941,8 @@ STATIC_IFN_KUNIT void fill_stream_properties_from_drm_display_mode(
>   		err = drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame,
>   								  (struct drm_connector *)connector,
>   								  mode_in);
> -		if (err < 0)
> +		/* Sinks without HDMI infoframe support make it fail with -EINVAL. */
> +		if (err < 0 && info->has_hdmi_infoframe)
>   			drm_warn_once(connector->dev, "Failed to setup vendor infoframe on connector %s: %zd\n",
>   				      connector->name, err);
>   		timing_out->hdmi_vic = hv_frame.vic;
> 
> base-commit: 77f548b127c6de34ce271fa09ba270cb1ef9f2da

The actual change looks reasonable to me.  But a few things about your 
commit message you'll need to change.

1) You are missing a S-o-b [1]
2) Disclosing LLM should currently be done by
"Assisted-by: LLM" [2]

https://docs.kernel.org/process/coding-assistants.html#signed-off-by-and-developer-certificate-of-origin 
[1]
https://docs.kernel.org/process/coding-assistants.html#attribution [2]

