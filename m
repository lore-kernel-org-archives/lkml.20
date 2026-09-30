Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022085.outbound.protection.outlook.com [52.101.101.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881A5502790
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777675; cv=fail; b=kfryz3Xg+H4NLwxBjQmL0EAC17hv5dut6UOPmG3lesj93vNTfWneqZbg6NkO4STJ0I3QeTnXxgurLjApD2TUDt7rGZ+y4ZIrFxGaQd5mx5x1D4Oh9iT3fURxZRqSACdAuMvn7wyQMnLKUybpn1oPooY9HurEVkgmVleo0tDejB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777675; c=relaxed/simple;
	bh=9sokmThMj5JXItJWGrBlRdzgNx/7048lITZwAx4PwMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DYSlPSOQ65tWe9sy+3dEkBWgNXvQiBf17E2OWTkfn80z+moqFeLNa4j0XGrsg8/DMT++wE0VSvqK6Ll4MOkVE5efE12HkaUQbog5aIRb/CJkA0LqqBXpqqzH++JoJetKONdqxtj9HO6VB8q3CepywNxQBac6qhPph8/X7juORyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gkl8M7JtakJFwH+UHAlm8e6IIm3Huzkm/jW0ZLVJUGjwae1mLCGzuDLZ0d5lmFppgEzxGhTVBNdRLRaire/8NahEmtgYUM0X8KPWJl1kX3Y4rf5oPVgxtdIv93CpOviemy9P/dNeXtraNrNXJj53m9qAZoPaTFrCfAi9PZk3m2O0qwzhNsjuh+Jsd8RI9f4H6qLOoWE/DI3nlRwXSeGuUycHoMNukYcW2aJHCU1vtv4ike8kEiAZAucTwA9DYpO49yvP0RFWwckKrB2+qyCDKfYIvYicsGkg/mOAd1pO1cVVHjstyTm5HLakqCfyNVofor0MlYvDPlYaV0o/Y1srCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=Hoy3CYTVtgIZCP//x7dK1XzU4mVhZCA3ZgHkH8LLjZc=;
 b=a6uPtOs5+kWqWOx2q1lEEJzri2wpNpzpv5t0s3yqrk/vElr+HFLA9IZRKov++gEMgNSiH9rZSLvXboVI6a8xn3FQ0l1XU5cULUt+Ap1HqIWjojpKg7dg44TTdLbg+2P71ZjFx6F7kWfi8gUF/zmC+Hz41tcwKTVF3qTeSNTZoRQDcmNMilTSUiTnehNW3Ze7hNGJ1taM5Xzga6gpTXvDW0xCAZbmsxx56a6iSGFCoI2NFwQ20u3b1/MHvZrlC8r8/FIv5NXBxU0rJrrfU4b9HUmw0FP8zLaQyAGxcnM7QE3jy4aIp0u8g/Mvm5XDgPzHRi494TU5Otat7FkKYsl/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CW1P123MB7843.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 14:14:16 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 14:14:15 +0000
Date: Wed, 30 Sep 2026 10:14:12 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org
Cc: paulmck@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	zhanxusheng1024@gmail.com, neelx@suse.com, chjohnst@mail.com, mproche@mail.com, 
	sean@ashe.io, steve@abita.co, rishil1999@outlook.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/6] Introduce per-CPU debugfs files
Message-ID: <wjain7u4fkmw62naqbwnin3i2ob5i7stmwgcf2ggkronkkq5dz@nftesprvoasr>
References: <20260827221809.988394-1-atomlin@atomlin.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827221809.988394-1-atomlin@atomlin.com>
X-ClientProxiedBy: BL1PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::35) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CW1P123MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa75b24-a957-4d11-b3c6-08df1efd1bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|22082099003|18002099003|6133799003|10067099003|56012099006|27256017;
X-Microsoft-Antispam-Message-Info:
	tjYJFHVBOSju+08i4x3EaNYYMa8TROFImj2ixkQ6fzZuB/Z2DEZtzE5aS04g3srWNSYUWNR7fG7E8pPr22w+A/T8Ctw+AC8llExLtAStPH6dcWlf+P/WF9TW5H39g2rOeKCcgrl5zChCGpmNFCqC40yory1tZDwLWVUUzR2F+txlT0yPXBW5TKE8axjcWa6s83y1d9hn6spd6ojFVpZ3H9EhPDT2H0Gouy78O9zuVUjhYv38Yj7asfi7FCMQe18H/GflE598JQh0DUKRYZfuA3FYgLNclbUZMivPtjTBnFg0X5+v6rMRzecr3yYlq5drS1EE9w8dlVrF+5JN6QYrqE9zmEwpIzCeuRF9Qb/TZ4VOFJoAyF82ExCioKkVtP8P3zF4j68TDuHb3pTXCMqhYeJOGGvpttRVauvtFxKziRBotIu6dQk9WkIZICkFWbDwrzSIROYet4V2CpHVbFzHHeN+aFwEG2HcLj4NYsPRBCrht0pWHpmWpBdHFrUG/KTALr1ZFSP2ddrL1KzofiXYoBPLbcmdI1bjL1DKf6IFqPCsmsUoC6+Iaf8k+mGz4+GBc5K3wQQf0JIDSx3yoNVmK38dm6FIIJBAfVHMpyBxIIE51rRdbI9S6PB6o/lNldWv+zkOKxHcfcgWzlvt2BYtyzQDWjVRIVc1rJ1ZeCDI0ZXk6OC0chmJp0J/nnKosJzYRQWwFT0aF7bM+/TB4Madnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnpTQVBwb2xLNjBDV1lIK1VNdDdrenZneWhtUEhBOXZNSEhoU205UUNZa1Zu?=
 =?utf-8?B?UTFkekRsY2p1YWF5aWRxZkdTUkNLL1VEazRUSktPZ2J1bzMzLzI2ZFdNWVYv?=
 =?utf-8?B?cTFZdVJBMjY4MnJkRkxrcEVOZGx1dWdHaUtsck1YY0Izb0tic3ZhTWFrdm1z?=
 =?utf-8?B?WGpISDhYWjh5VWtjQVBQOTNFd1BmVVhad0lhV01oQUp3SWdxMExuWnUwN2xC?=
 =?utf-8?B?MGZZdXAwd2JmbUVtRjJCUzdnODR1VThYbkd5NjdRNWpBSkR1Uk96NTczL3NV?=
 =?utf-8?B?WjcxZU9MRzYxM3BYVWRnbWFjaGozSWFQVld5RzhXSXBtckVUVUlFSzdQdW1R?=
 =?utf-8?B?NUhqdHlFdndZaHRGZ2ZXV1lNaysxOTUwSUVYQkNHQ2l3V3ZSUmpUVUZ6dVNQ?=
 =?utf-8?B?S2ZVaXJHN3kwdStoZ1RacWFRbU1aWlFEQjZyS0liRTdFTkFNa1RYNHpST0NJ?=
 =?utf-8?B?cGxKTmx2NDNzS0pJeldvd3NwRVpjVkJndlBEMy93UzVSVnFDWFNIQmkvZThM?=
 =?utf-8?B?OUFGOTYvQzFFaU9URWtxdUhrWHQ3N3BZbmRiQ1BQUTNtYTU4MyswY2NtQzZN?=
 =?utf-8?B?eDRQNkJIN0E3V1hVZFhVWkN4OU5hUFZTSlRHYTlWN053bEJKcmovQmpRS0xI?=
 =?utf-8?B?SnFBV0QzTXYrMW92ZXJaWE9ISDZsdGY2ZUlUVjFvUnowZ2MyM05JZUhKR2lK?=
 =?utf-8?B?elRzMXNZNUhva0g2S051WGxhZTN5QUJoNC9uZU5CbEFpQ2VTSkhUVUJTUXA4?=
 =?utf-8?B?bzRzRU9CejYyYUNrejU4Y0JETHYzNlIrYyt2ZjdaMTJ0UFRWVFlCMDRscy8w?=
 =?utf-8?B?MStKV3J6MEdRRC9yTEdyYkVXRzFZYWxLNzIzUUozMWNKTVRYdlAzeU1jdGZC?=
 =?utf-8?B?U0oyeVZNU2EvL2JlMGd6bkdKN1lRamIzeEZtclgvYjl4VE9rVG45SzgzaGFZ?=
 =?utf-8?B?WXhCV0x3V1VQcDRoSGxIamxDSXZMUGNjNUJyUjRzaTNUWFZsbHZzL1p4c0hT?=
 =?utf-8?B?STlIenRxMGxHNWUzQ3d0Q3Bmd2V4Sy93LzROUHU0WjVVVlk0K2ZLMkJkVU9K?=
 =?utf-8?B?UFRuSUlSV3dyTFdKMmo0d2JzL2ZhRjNNZy95WHZab3ovTG84bjM0N1pKbE45?=
 =?utf-8?B?Y2ZzbTFqZEUrY3pOempCS1RRazJQS1lWa0ZLQ0JVZUZWNUkrY0xXMTJoRnJw?=
 =?utf-8?B?clN4Nk51dTZlR1BwNERoU2I4SFltUzYxVTZtWGUxWHpXdDlDQ3pTMlB4WVFr?=
 =?utf-8?B?b1l0UnJjeHYrbUJWckxsYXJFcUdudE52TnRTOTlBbGR4MEJpd3Foa1NEbzMx?=
 =?utf-8?B?My9ISUZGTXV5b3g2U1g4dE9WdkZ6RFdHbUFoMEkwYXBjMXRDN1kyTlp4Ymxv?=
 =?utf-8?B?dmd2cXlUUi9ZY09DY29HVUgrSWVMcHdYTmlhT0JpUlRYMis3d0lwQjNKTDV5?=
 =?utf-8?B?Vzc2SzQxQ3VhNE9haU4yd2RmS2FjZHdRTlVOTzJ2Szh3RHlBSEJEd2E3QU5Q?=
 =?utf-8?B?R05QRHBMNGZ1NEx4NWVTaVRnaUh6T3JDUG1TcEFFSHhNWVJ2ZUluSmRvU1pl?=
 =?utf-8?B?NDBhWkpacG9JNVAyZE9uZ2sxeFlyTWRDamorME1CYWxxRE5ZQ056cWt0YlAv?=
 =?utf-8?B?ZE4ySFRNSzFOVVpOdnNGTEJVNWZVQWpvQStSdUJTeTVaM1pqR1FSb3VvbGdl?=
 =?utf-8?B?bDN6RWtwRWxjTVlTNkpjRXhkcHd1MGNEQVdWZ0JDTzRwTXVmeHRuM3RzSWpw?=
 =?utf-8?B?ZnhrdUpUcXRQT0EzVkdqR2Jod2tPZUNzTE1uZ3RWcWhoejVvYnNTWEdhNTFK?=
 =?utf-8?B?YmpMUCtMV1VLTmpzdDFxUFIwWFFmOFE4L0s4YXdYSTg5d1Frdy9kMlJ4dDQy?=
 =?utf-8?B?TXUrZWhhS2I4eCsrT24wbjR0MTJRd25UNEtLU3FaS0hNaHMvd05QdGFtMWxS?=
 =?utf-8?B?N0FUbGNZb2RyY1NPM3JuWUEyanVjbmNjbVprQ0VhZjN1OFBjL2R3cEUyUXVP?=
 =?utf-8?B?QmU4MjBMWXNwcHhJei96SUdTcGZHMzE5S1FZdWhhNlJRNmZPM3JBU2JGdTNB?=
 =?utf-8?B?OUJUS0FMblBlT1VnQ1JkS2l0bVhmak4yWFQ5alZJU25mTVdIZ2llRVphRlVr?=
 =?utf-8?B?cTE4OUVoQy9zMVhpb1daRnM4Z3h3NUZOK0FYakVjNHR1cVFtK0dGOW1jNDFB?=
 =?utf-8?B?RTRCQlZlZThmQ1BGbFpyK1pZY2hoZ01WVStxMENROGNlalJ6QTBxbEZCeVZt?=
 =?utf-8?B?c3VncWUrVExXRm5YNElBTjF5Y0ltRXdDNkVXR2drejJMaGlJNzIzUnVGU1JZ?=
 =?utf-8?B?L2czNHlzTHkxYk82UW16VkVoN3U4Uk5XWkptMURuZnI2SGNzNXcxZz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa75b24-a957-4d11-b3c6-08df1efd1bfc
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:14:15.6516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJInT4OBR7lJFewWrBWYsDL14UBqvy3VOboxYr6AxqAXjH/x3K43HQYV60DiVgq3ODSZ5sv+ggjIjxGsSr6p+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB7843

On Thu, Aug 27, 2026 at 06:18:02PM -0400, Aaron Tomlin wrote:
> Hi Peter, Juri, Ingo, Vincent,
> 
> This patch series addresses a few pre-existing memory safety and list
> traversal concurrency issues in scheduler debugfs handlers, and introduces
> per-CPU debugfs files under /sys/kernel/debug/sched/cpu/cpu<N>/debug.

Hi Peter, Juri, Ingo, Vincent,

I hope you are all keeping well. A quick, polite ping regarding this series
posted late last month.

Whenever your schedule permits, I should be very grateful for your feedback
on whether this revision addresses the remaining concerns with the per-CPU
debugfs interface, or if there are further refinements you would like me to
make.

Thank you very much for your time and guidance.

Kind regards,
-- 
Aaron Tomlin
