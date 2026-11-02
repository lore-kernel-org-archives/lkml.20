Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.126
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793638822;
	b=bUA3M36dGZvIIh1RSINKZ7pVABgZkE9HbV0Y9tJPJ0ozgTO4EjhCbsKLotwZueSQM8Vt
	 StgfqrvkhVetnMn4t5+vRsXuXjP6YEf2Vs/jcgVVEvUdUusou1b9gSHxaRk3L3SakkfzS
	 bHlB1gKd0gU0Emc/spEZY3MPsuPXwzi4d2skpZ4mErhM7N7q9f3MX3q0oYGEyicA06mQJ
	 zzrosAlpU8II2rvao6ezrmSW0xU5sZv+JiTw/uXZ5adAOFHjQT1zJQs1g3sLqgfIupEI/
	 vvNp4JFGe1sTRW/mo+j03P7z3SlasB5RIS6A9JuBoUrSc8bbGoi1Ju/S3KHF7g+Ciww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638822;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=j9oI0fLeZ1pjwibZu3lutP1KAB6Rovkz2jW5iHNIs04=;
	b=I8a0wITSgguK1DcaB9Ca5CwCGtwDOdfOFb0X1QDCnGug9fDFo8ZXMJnjzDNr3fxB0wks
	 w3ix1GONZjX6/q01D3rRqbkCIQJpB2MwMP73YJvRHd7xV1QCPbejNUqn5fPXTLXq0QA0c
	 oVzHvGFjwGCHYa0iUXV6jD0rVgGJVbclDst9+BD4A2P4ivILrl806VomJpDHjYSY/piGX
	 3oZNQ/gFnr7Zts3ftltwbexkozjkiW3Iv1wWqy46/nwmeGn8lc+LabF6VYAjKKJWovvEZ
	 AVGjnBo5TYDXFFeFd3LSUjT0v5NZ1A3XQ7Li1+HLuyViwpvZLL6yT7FrPuUbXosbmzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.126
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022126.outbound.protection.outlook.com [52.101.101.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371DC606A592
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 371DC606A592
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZF5rT/SCsyyvBaxSvuhy9/e2cLqUHz1OQQK/aklIQsi5qJU3V/miQ6pOaP6g9avhVZBjj3c5d7CO7829sKnscFLyIVe2jYzqoNv80tpB4UD7ByAvSR7/A+EU0ERnVMcWCAYodmaeFsZItKt/Khh9fnuO4bO7a4eTJtQGIkDTiKQmLU4HOXPRGYOPSW4XeCRCGGrHJ0rhVUy/8zL5k5hOCxmPnKOlyQ3ZBsCvWHD0LqW2OqaiRQ4WxToCzDSv1+lApH6+Ej1zVEZ/zySyp6CwEV4FmwXMPb4yfYErf1ZW1oXHXmYlXfN9l8Nuv7hQ6dK+C/WVFbrdDqg9YtlPFBeqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=j9oI0fLeZ1pjwibZu3lutP1KAB6Rovkz2jW5iHNIs04=;
 b=FU+s/WjM1w9jhPJqWbeMbluzsLs6+e1Accu5AdAkjWMUFdI26SS2yVSGwVOv24opaB2rKMWdHo4g6a8q+fy6GKIEjteT+Cx7l0nDGULYq3zL/wQr7ETGr/Jnqmy4HOHhaIrcwSjrkgfZt6yIK2xD7i5+aZWGcM00ZhU5dHxWsBOaos1kRr2y6Ht67GlncTWcfC2w0hgIuP1SKizxvejTGPxnMGvpZNgs3yYRgGKurBljrpvapIMvuK7ShtmK0Ek/ZiBVpvL0uKWHUgyqXqu8mgZ9A8kzkWDem7Ig465CzVpyH9ccCz2K5NFtVWDdKwdE1GLX5FdBpsphvadzSE2cpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:163::8)
 by LO2P123MB7408.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 17:00:17 +0000
Received: from LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f71f:a9f:c4de:687a]) by LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f71f:a9f:c4de:687a%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 17:00:17 +0000
Date: Mon, 2 Nov 2026 12:00:11 -0500
From: Aaron Tomlin <atomlin@atomlin.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/deadline: Fix spurious -EPERM for
 migration-disabled tasks
Message-ID: <545lvmqzloqcwbur3yftkiy5zqube4purvuzmwvdqm6o2ft5xr@xvmqapbjumx2>
References: <20261102135420.244745-1-parri.andrea@gmail.com>
 <v5c3zc2sy66bsummtsvw6ciri65kc5tphm6xs752ifh5eujn6k@qflvq77fph5d>
 <20261102151457.364631-1-parri.andrea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102151457.364631-1-parri.andrea@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0175.namprd05.prod.outlook.com
 (2603:10b6:a03:339::30) To LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:163::8)
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
X-MS-TrafficTypeDiagnostic: LO2P123MB4190:EE_|LO2P123MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7afa44-2728-4823-22b5-08df3902c551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|18002099003|22082099003|56012099006|4143699003|261026140227099003|261022105027099003|261026121527099003|261022113327099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	qrrds54ieXBWa20rKxLhbH/1eAnRVBj3mSF/5Js6pw2YA4tvjbBEieeS8hAecnX6+OcdaTSIattuIhJ6Xp7fYeoMDM/YhjG8yk62tQZWyOhJfPmtkfu6Gb271UDX4+7cYIpSIMU6wBEX8u9Q6D/Omv9t8FXoLfNdyRIfnQ+3Pu9EKk+mGqMUAELFrocIc/OjiVobbSvy6LergSmIzt6xZFsL9rATf+LbMiSl3e3IOyRhced0msXRepjFms0DdJGPmCbWQN2hlzR3Qnj5lCm/1xn23AXIW7mSkUZDLbJqBABZBeXXTy7wSbMFO9OyIr1GonzGC1+bmaMQl7TP8NZZ5X9kL4XiqRbcgT/RidtDRAi4YDEqF+JAMxPbK9vfXUnQg2nRcVhX7CgNYpxiwuD8zFtF+XK8HhFek3dccG3LoRUdceczJMsioNLLX1l8JZRlo4jkbItbSo3gA89C2oqtCEVEnEN6keyJIUGT08yT9N+HHlgt8j4+6anpw2BYJpEJZNyWgbLzHW9sYWMamHwexDl474F8gyC+IxKU+aSaqDjPZRyYQOyN1/PZSy6O5SwGbqZZ97OR7YUhC9jPZh2/NSnIFO5UP4/Wmru/4bT2gWM7bz/YzivFvtbMWMiPaXcSY3EBb3SEVK1gj7WYpkntqgFm98OWyXeBxTNb8paEoCQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(261026140227099003)(261022105027099003)(261026121527099003)(261022113327099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0V1KzgyTWI0TDJVVlVnNUdWOVk3NHoveklJd0xYdkFvc3h2N0cxckFXWFBl?=
 =?utf-8?B?MlVKdnc2a0h3K0ZvTlBHa3gweVc1MnJRdmNFRjVIdEFET2NGSmY2TFE0OGh6?=
 =?utf-8?B?aTdwY1YvcUszVW4wNzFrUkYySm1nSG8vZnFsc2I4YTlwaGZrTlhDU2hmaFZ6?=
 =?utf-8?B?UFFLRmtTYUx3WnF5NnNSSnNGZzlibDZQZHBXN3hzQmxDWkptYVRTYlNTNXNj?=
 =?utf-8?B?YzhyRDJJbExRNFl4VjdjYlpDOVNiUy9zUjdwdDl1ZlZwaWZlUWpxRkl3dnVt?=
 =?utf-8?B?YWYzS2oxL1dMdlQ5a1pnZ3RwaGpRZXZwQVdBZXFuaVlkODR3ek5Db25OVzRH?=
 =?utf-8?B?UHZMM1FJNzNkZnVnSE0vOHIwT2FOL2pkbzdBWHRGdzBxWnVzcVFsVDZSdHBG?=
 =?utf-8?B?Tm9aRm51dkFVVXpQYncrbmlXT2xMTkRNSWVpd1Y1SjV5N3Azd1RXbDFsdTJC?=
 =?utf-8?B?RWhLNzVBbGE2MENHcHRWL2VidVVLME9iUUZRcldFOFMzMDdBZWNWRlRjUGUw?=
 =?utf-8?B?TWo0eC9mR0VhNVByQVlXS1BTa0d5VHI1YVNDU2xHWFJLcVBWVHBlMUt4ZGZL?=
 =?utf-8?B?bUpmNktnUklzRHZFeU9Hb2hSeFZaZXlVKzZxa3Z2V3FpbEN0UlZ2V3Q2UDZw?=
 =?utf-8?B?eWpmaHFsZDlmN1NKTHpEOUd4RjlLY2ZGTVYvTWUwcWVFaWNXL1R3TENiSTFU?=
 =?utf-8?B?dSsxdElHdHgzTHVJY09wbk1qcEdlbmgrNUUvMnhQQUtCY0s4cnpNK1QwZi9j?=
 =?utf-8?B?SjRkM0lWWGEvZkZ3Y2c2Yk5ob0RyeVFMekF3SzZNZkk3UXl4THNaQmFRUE1G?=
 =?utf-8?B?eHdKTW5wTHRIL1UxMDhCeUkyT3pEdW12V0poOEJMTU00TkR0VTI4VWtFNHBC?=
 =?utf-8?B?T2FtRnUrTC9jOThSWU1ZSjVVdGRPQnNjY29paGxGa00zQjMwT1BrdjlBRXpY?=
 =?utf-8?B?WmxFNDJ1czVpSjNXMERtOHhKVGJNdDVQUE1LR2kycU5jTzhEdmRLTDV1NDdV?=
 =?utf-8?B?RlVlVFpScUhnMldDanlML1E1SlkvbWtTamZPRnkrT2k5UVh5QkpMMTM0ekVa?=
 =?utf-8?B?SUFRR2hVNEFaa3VXN1ZHdWNEMHlUTG1VUFZzbCtOSUF5MVVQbENIeTFDdlNY?=
 =?utf-8?B?U28vNjlCM3ludi85Zkx6RlBXOVNiTmxrZmRyemh6R1AvNkhmeVRud0RLa3Vl?=
 =?utf-8?B?ZVd5V3hlaFFlbkEzMlF4Sm1BVlFodHpVYmxWQzZBYmJWNml5d1VFOEU3ZlEr?=
 =?utf-8?B?OUpmMzYyWTk1MGVvb2RyS1dId25yUUU4cVhBdW1XRkJsUzlTTTFDWGYzZlFx?=
 =?utf-8?B?YWRib21aL09xdWNKM1JpZDdPYUdsZERJRkw1U1FTS2RlaGVPMXFuWDdWajI5?=
 =?utf-8?B?ZUZpUXdpM25NS0UrWldjd0NPT0laTmUrZDU2QU1IL3NzVUZ1V1o2aFdkOU1u?=
 =?utf-8?B?UE5kcGt1M2NJYm55dEdtRlM3K1BEQ1dxa2hubjJIR1VTYkJkUXNrVW12ZmpL?=
 =?utf-8?B?UFBKeC9tR29pbGc0b3ZodmpHdEJPeEd1NVNvZFNHbWxRb0lZWUxWb29pcWlH?=
 =?utf-8?B?TERQZ3ZrZG5aYUJsNG5vWmV4dm92ZFNVL0E4ZnZmQjJXM1dSSDArZ1RSa1lL?=
 =?utf-8?B?bm9UMUhDRHR2eG9UK2toUjZjdXh4d05yYzNudFh6MDREUC92Yzh5b1ZCd2J4?=
 =?utf-8?B?OVdlQnVzd3FMRXVYSnNoMU1GZ09XK1BhcXpDNU1KSjByaGJ2c29YYnJrb1cy?=
 =?utf-8?B?b0JoWHN2ZzJaRlg1eWhuZ1pzNXVTaERnazZsVU9Ndm1LYVZhRi81c3RiVU90?=
 =?utf-8?B?UHdxdGl5OXMrajFaY1N3TWhVTVcyN0U1c1h2ZGcyTlNhb0VWQVJhcHBVY3Qx?=
 =?utf-8?B?QXBuSVlyM1pxTnhMbWlJYVFxOXZ6YTVuRTY4YU9BQ0drZU9ra0ZsYVd1bXJw?=
 =?utf-8?B?QmI1eHl4ZzVlU2RHeTlveGZwT25WdXRHdldLR3RPc1g3TTlnbHJyL3JRdWF4?=
 =?utf-8?B?Rnh6NGE0K2t3S1pjbHJKNXNxUVA4V3hZeXVxa2VOZ0Z0ejNDa3dZUUswcGRh?=
 =?utf-8?B?b1AzYzE1alArS0FSNjBlbXNsMk9FWXJiaXFnQmJveEpHZE1uR29lWEhwbUow?=
 =?utf-8?B?bHRWMWM0a1ROOE9QVHpEelp3dFk1L1hTSUVISnRURGFldzNDNmlMZzdJS0Jt?=
 =?utf-8?B?OG5RRE8rSlROMjkxWk5aRkNMUHBab1RvdlpvYjNzT0ZaQ1RsT1E2MmU0ZThu?=
 =?utf-8?B?WDRjMWk3ZTNLME90elFITkVIMFcwWlUzR0Vzd2o1WXZ1MmR0bWdkbDh1Lzd4?=
 =?utf-8?B?SFVja1ZrOUZsNTJwVUNpR040SlByRkpsYVl4ZFhBQi8vbmFTb3FGQT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7afa44-2728-4823-22b5-08df3902c551
X-MS-Exchange-CrossTenant-AuthSource: LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 17:00:17.4353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JopvV+Rx2ncJM3BKqxRsOMuYH+JiuCK8Ds5lFIRRVNIJanpqUJJBl4uTSsuwzVWdS7nHGXoydq8WTP1wYZ0k1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB7408

On Mon, Nov 02, 2026 at 04:14:56PM +0100, Andrea Parri wrote:
> On Mon, Nov 02, 2026 at 09:45:30AM -0500, Aaron Tomlin wrote:
> 
> [...]
> 
> > Do you mind if I include your patch in my series [1]?
> 
> Thanks for the offer, but I'd rather keep this one standalone: it's a
> stable fix, and it shouldn't have to wait for the debugfs series.  If it
> goes in first, your 1/6 just needs to keep &p->cpus_mask on that line:
> 
> 	if (!cpumask_subset(rd->span, &p->cpus_mask) ||
> 	    rd->dl_bw.bw == 0) {
> 
> If the maintainers would rather have it in your series, I'm fine with
> that, as the first patch and with its authorship and its Fixes and
> stable tags unchanged.

Acknowledged.

Kind regards,
-- 
Aaron Tomlin
