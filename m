Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362AB32B13F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354797; cv=fail; b=Fr3kpJRGcgUE2xNZ5ZSbBPwDH0HxXFUw6odL5iOrSVruqTDWEeaI4dERkxe1PDjRB8E9uyynOrcRWoMu4wAYSO+BoXR3nfe/SwCLdt/nzrBUh82uqeAq+J4QN4py/j5zHjGhOpy7P3uZ92zxaKsepQWh036ShaO9wZqZccAdCOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354797; c=relaxed/simple;
	bh=+E7J8h1DqEtdX7hKkGr7cuwVc7lH0bm5tlo0OrNZCek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WsP+JzewOtKl6gNth3GS2Vap4Q0FAZ3EhlftBUeLwRdLAP89IJiXLqCVoJCG6MF3TVygWxeN4PtiBwP0S3ZfuNIRUDlqYPci/I76ZHmgslFaQ8tlflQIplncHx29raKSzf+LSsmkNpUg91uVMjoPrHgBue5xGuGD8QwMRdvO3I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D7UvJyqj; arc=fail smtp.client-ip=52.101.53.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D7UvJyqj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXAex7ru6KkCSHOi+P6KDmtnTyByyixk/1qdFdlyd11I5wrowT5fX9beGAHi6ZORORK/36u1am3GC4ElfbpR63ux76Zc0Q6Zt7krhfAspERpoDF74/ZP6L/YzuvfSdlVtnA0S2vi3COmAZNaZoFkmY2h952dmh7YMv9gAuHehOogIEpCaKwwA3Oepkf+mXSh4+yE7qG2Jg41NwGoBvWGkQ0Lz5VtzuqQH5Q0j0uGmkTRa0xDRdW2XGKuzk7C7r7dphELQ/cNAd0azeEsUz5qZNX4Be6sNUSdM1euSB6DDecPcN8QwcGjY7x4JmKebCW8iWClCmoTJQL9P20ZpGtpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+E7J8h1DqEtdX7hKkGr7cuwVc7lH0bm5tlo0OrNZCek=;
 b=VhFfhvHL6BlJRZCG3G2NXYTwkDDl0I8pF9fOci5YN6KJu8UxWV9Syx1Wbx8JG+YpZgLF01eRPrpiiYzacG+qh8UFlIrl5k1XICC5n/q9WJutKSlNWRXZCwhClmz+IEeIs8mdUEICUmMubKgmMNnQ9alF0J2atroJMMExxe1XMXipkHcY0RHrDFP1iWX9KGfQIIH6t1TEC3udiY4VweGCGYhcSfgR57BcapmvJAmwHuUeVPBDrosdq3BRV7zvmDvNJSDogDN6Dc3lDafHZjim4/HSfsVQUN5iX4MzOToXMWtjtlz00+GgC+45nQR2EItkKw5XqCOLxAl50RyJ3o/VCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+E7J8h1DqEtdX7hKkGr7cuwVc7lH0bm5tlo0OrNZCek=;
 b=D7UvJyqjygaYlhOy0TaIPpdX/WDeNTxOaedIPz8/I6QA7mHa++gNEhGvKBTOjbVe4MiHGFEUPmX8XV2yxXa0EXDOTzGbrK3C/gqzFkFaRKygPtJz3w3RTE5wKeUode3/L5+ytaKvdmP4wVwx63LSGSq+mOb8g3daPc5ESWSYHxqdJWHWJHr48jahckeb7XU5xY6GMMecXYwlOT3y5bj1LfC1wAfa+wQdsMEkE1FQZjVzXalakYv1TXk5NdRj0gfvBVgsiiXrZkogEV46akTro/93x+D8BwCzByR26+EwgujV+f5RCZX14Myv+p4fzpU/bxQzAuUfFdWZqJ1uap/J6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by SA5PPFB2BF91BC0.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8de) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 02:59:53 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0406.005; Mon, 14 Sep 2026
 02:59:53 +0000
From: KobaK <kobak@nvidia.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Chen Yu <yu.c.chen@intel.com>,
	Ricardo Neri <ricardo.neri@intel.com>,
	Len Brown <len.brown@intel.com>,
	Aubrey Li <aubrey.li@intel.com>,
	linux-kernel@vger.kernel.org,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: Re: [PATCH] sched/fair: avoid creating misfits during cache-aware balancing
Date: Mon, 14 Sep 2026 10:59:49 +0800
Message-ID: <20260914025949.1348528-1-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825174112.2580942-1-tim.c.chen@linux.intel.com>
References: <20260825174112.2580942-1-tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0135.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::17) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|SA5PPFB2BF91BC0:EE_
X-MS-Office365-Filtering-Correlation-Id: 4902ef02-ea45-4bce-b8d0-08df120c3fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e/m/Veb3NuxMr/xldK+PoP9FH36DDPyqqfarN9xb+BiGb+hyHVgmi0sWk8nYrT3OKj8wLulPdE0gJFwdP4By2P9fp5zzd7dgoYDoBR8h2tFybj6iUrlAJCwpLHTmY2Lf83DXwARwRecSybTYZI0CRQ8cKQBeclIoyWX3VXiAORX9VxPVqzTseBtenDHE9XqoZ6U625CX5n84UzYcx3zdXf/ViCesGXjR+N0DwrcRvdALUoYZBiFhgpx06Z+fr7PEeFU8/UV+JjZOli/27KS+0r/nkZMQnvrWEAhXW5PtmUWwGqhvRkj3cy8Y58cqpbM88x8P3r9SVfPjVGKT3V+UVaabAhgCratU60+uFexiyna6B0TEQ+IdXY/9ozJI+QHkzQD9a51dr5wISkeP8lBwJAZyFOXNbHXwRdvKRjr47Rxa3LTjwsy7lBWcipaiCP1yNhGJqxM8fhWfcX4vbfNBW9oKWRJaOe+JlCZAriEfJX87JqqTTKjS3B6lFGjrJqInn/FwqpeD1XNzTdvEmswevvVx7217lQVsA89xKzxmXBQA44wjgYTZyXAviWMCS61gL6mjCJoePZtErwa1qP+IoqPsvs+C8grqJFMNzdnQwBweNb9NeRvdIXTPOsCSkPxDgfE/Reqo2l34nu3+6kz7Si1wJ/qTIkQfkCgQy6YIuvU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVlGOHRoVExjdXVNcTR6VjNuSGd6WHBldTZ5TEVVMmh4cEl4cUQ3L3ptaURz?=
 =?utf-8?B?YWh5WGJ2MWtFVk52TThDSmhNb3lJcWJvS3ZYWDNwK3ZTc3gvbEMxenM1QjhO?=
 =?utf-8?B?Qm1pbmF3eng4aG15UFBMNnk3ZFl0R2FtSi82SlBFZC9YeHpWMG96Z2c5K05m?=
 =?utf-8?B?dmdhUU5NVnVGMGpFOTZ4ODdDL004SVhnQ20vS0tRbmZSS1YzRUJOTiszSHpP?=
 =?utf-8?B?QjBab0xTQVVKVHlDQi91azRvS2tTZ2RLUy9hdHp4eDFBZnJZYVRkZVBLc3Aw?=
 =?utf-8?B?V0dPV2ZoamgrN1BXVE5ZdGw0dkM1dXhOMWtVb2xibVhFaVIwQ3NhM2svM09K?=
 =?utf-8?B?RmtiZU1ZMFZWWkViUUtDNnVUb1JnOHRubUllcmxnNDR3QXVQbmpvVHhzYXll?=
 =?utf-8?B?dXdNVW5Mb3hzSFlTVTBWVWVyTXRrWUFEeW5RR3V6OENKa2xURHJWdlpqS0JE?=
 =?utf-8?B?ZHpZNDluYlZRMDRoYjRUREhVVnZIVlhqRmJac09aeU5jQ2wrN1J6anRUQWw3?=
 =?utf-8?B?SGFIOXJPUXBWSEtuWWI3Q3VzYjFuR3IyZGg5enNiV1RabVZidk1KWHlOeWVE?=
 =?utf-8?B?d3AvakpTOU1kQ24remRwendkVUxnbW13VmZ4Y2hnR29VRGtWYXZpajh1UjBl?=
 =?utf-8?B?cUlUanJ2a3NIU1pVVEVNNURSQ1dpK2tCU2hxZzdOMXhDWTZUbmkvNVRMd3VP?=
 =?utf-8?B?aCtvWWNhYkNEN3Jramt0NnZsZTJjaHJhWDVwbjRnMjBnNmV5d0Y3Uzl0NEMy?=
 =?utf-8?B?RVhoMnRmNnZJSnBqK0ZKK3h1SzNEN1lIYUFrRGl1UjJxWHZRZUNKOCtOa2sv?=
 =?utf-8?B?Y2I0d01hYm1DYnoxSDhaTW5DVlhEUkM1OHlET1FXaXI0Mk10WkFqUStUZG44?=
 =?utf-8?B?Z0Qrb0FnZzMwdTF5SXI2RXhZbEg3alpsc1h0bDVIaEFNQnhyL3RpNFErVkpP?=
 =?utf-8?B?Z1F4Y0czTmcwaTEyRzJkMGh3OHN6Ui9vQitpU2xnZHF5aHgzSlRxSDI5cUJG?=
 =?utf-8?B?VVRSZmNkSlRTa1hZMVVlNUJhcVo3eUlCeWgrclZkMFd5S0MxaUhwZEh2ei9E?=
 =?utf-8?B?ZEVRb3MyNmpvVlY3YWthclovWmNyU3IrckZOR2tQaUludmdhelRUR1FMQlg1?=
 =?utf-8?B?UGFSMEFqcU1teWJPZ0xGcFpDQnZFdmZIUzlFSDgvaG5BRDVkcjdVaWtPRmZL?=
 =?utf-8?B?YmlCMEpxMktma29LUE9VcWhuZkdPVFdWSDB3eCtrNFREbkN4Zlp0RVNsRGdX?=
 =?utf-8?B?UnRERU5UcFhINFdXTjB2dmpkd3dZNEkrOHJSMzZmbzhFVWlueXlVWk5zclF0?=
 =?utf-8?B?eVdmeGI1azd1MUl0aVdybjZDWWV2Y1A3WSt6MjdmNm9NcE1KV2puREFmSGo2?=
 =?utf-8?B?YkRleEY3NUlPS3NQck9wQ0gyT0tHWWIxOXVjOGEzdTBiNTdnYlhCNS8xcnFJ?=
 =?utf-8?B?MTNmR3I4dHZaVjdRK1dzZmxsWlRTUTNqK0ZLSkIxVXlmR0lJa2U4cVlmNHpJ?=
 =?utf-8?B?Y3BWM2hFU2srcE9LSEkzVjZONEdKT2V4SlVwNDBMZUZRUElQYmZwb2JnR3pB?=
 =?utf-8?B?ZFZSbE11NGxoTCszS0RjUDhkZ05SMHNnUTF3VnYzSUJRelhqa1F5dFRBcVFG?=
 =?utf-8?B?eFlhODVVOG9Cc015UmFoQUpkM3QwTFJ3UlhicHJKS3dTMUtmYTdXUmgwNE95?=
 =?utf-8?B?RVlhUFI3N3JjV3F6bENCMFJYeUsvcThCVDJvYm1MWklTcWt0ZFBsQnQxR1lx?=
 =?utf-8?B?YzdrZlRoUnN2SGRNdGhzZUVOb09rZ1JHeTRsNDVLcXRRcVlUcDdZQkk5ODdF?=
 =?utf-8?B?R2hHM2xxck5UcXNBZnFDeTdhUytBZXNlZldhZ016U0lHYlBkRGN5QUNrQnRm?=
 =?utf-8?B?NU9lSkgvd0dGVWVzL2YvcEZlRzUxeTZuTDNWQ29NeXJ6V3MwcjE3WkFtVjhI?=
 =?utf-8?B?V0FJbFlKVEtmOWdYQkhYWXpoMWprY2VmQVViU1B6ZTZidUhSY0tLdi9MOWdB?=
 =?utf-8?B?anpUMExDcDdqRjlDdWdsUTdxMWxpZ1FGMFp3L211ZTVUVmlvL2dyTGxZUjVu?=
 =?utf-8?B?VGg4SWhhNTRaUFp6QlovdXVTVVpLSjFKQVJ3dnZaaUpobldZaVFRaUswQ2t3?=
 =?utf-8?B?cGdUc29ZRXZGWHk3QkxTTUt4ZEtUQUVQSklDN1pnZkdZN3JVTmlKcHpaczB0?=
 =?utf-8?B?b1RBemtoczd5Q1ZIYTJYeXBsY05RaFZlTkFYd0hwRlh1UHc1VFQ2N1RIemJ0?=
 =?utf-8?B?bUYvQjZyYk9uL2UxMmFSQmVKQTRoLzNmR3orZDZxOXhDUW10VmpVL3BsWTZx?=
 =?utf-8?Q?SM9F8lihIebLG4XB7M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4902ef02-ea45-4bce-b8d0-08df120c3fd1
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 02:59:53.0138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EpRai33wHQM9jar5qKrPQHY1IHosZ2/jmlw1WSjw+1XpmL+cBs/oeSYy5hoK0NnT/vrFlbv7C6X2eqgnZbydQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB2BF91BC0

Hi Tim,

Thanks for the cache-aware load-balancing misfit patch. The tradeoff
you describe (LLC locality vs capacity loss) is clear.

I have been trying to understand how this showed up in testing. The
cover explains the failure mode, but I did not find a note on the
observation method.

Would you mind sharing how you tested and observed it? In particular:
which hybrid generation, what workload, and whether you used
schedstat lb_imbalance_misfit or another signal.

Thanks,
Koba
