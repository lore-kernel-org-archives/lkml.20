Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792830998;
	b=Pw3yhP3MCDtl50sML5PEfnA3BF64siKmEDHSnoWV9Z+GhgG2Kcvhali+LMkYes3Xm5MK
	 nO732v/r7Yq0MLzVn+KITSVoL4oDSe1Ngb4ISEQs6qJiNVKrZr/p1TP/VaNq9pL27ZzrQ
	 ImIAUnN5Btg3omuh/CwyLWwZYXRZtuh0xEhyy7L9ZhIoD4AH3XDKQQDC0WFfgup9Vxd+M
	 W3aP270kOR+XGlxAhOhB8C3BeFrAOBgTqY6dyDPQduSC1SVXgy3eBGE6zwwNGYL+hZf8D
	 W1I2cab8AZd7yrYTPog5AEwJD60MnJ3T8RIwzpzQmqvfxzK1d4aZ9U+7sMaM+9sLGAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830998;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=il/hGVrhIulmFUWRazi7o8mtXXtStsHOQ3fSwDsZqQ0=;
	b=gG7E8id0V2Zh8g+MlxUPr1YxjW3N3OfmGaDyyxuLWwyvZRk+P3k1/X7wsd6hmgBNS81v
	 dWxTay1lBb+/cKiz3GffkVAHWT2A7WAKMa+fHPFBPRG80XinPaao9KZZjg8KJbPsnVSTr
	 0NrJHc9h85aSU1FEeF0Exmjgrac9sTGssMSgCQCFE+RU43gAHpCtkuTlU4aWJyB9oXaAK
	 bnGaYfBN+QpVjvLQiT1G0LLOUjOO8g7ccr2E5gYohM9yKYrq8s0J7lgDQqgCGDY0LbIiE
	 EwK7yp5vYMj50yZTTXn3N1xjwpd0X9bR9YRrnWLepNVWS3V4GSR5bcN5N3IfF+H1LQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pNpVkG36;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.26
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010026.outbound.protection.outlook.com [40.93.198.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20077606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20077606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pNpVkG36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foRyLh8TbSbjTvl0DU8rOdwwVD1ZID3fuMdXQiYlqf6YmNIF3ETZePMUTyK/f1LyG3cpn9r3YWHlaXeW/sIEb2Xt7zKi1wtwFTXSU6Qmj3txFiAuVJC+ZKKD1q4N9JS8mBlnlTNNlpYxdapTqXciRHqZOxHyuntO5mi9wmR057z3/WtZGwasff5uhqJ+tzfiGEaT2DsEXFvXtVKec44vxnBHN+avnEwCznt3EmFN2qDmkhjkALHxNDeXwFBiXYYKD1uhDP08w879ibdloesmSCXtpRDeo4FMABqscGgLZZc3UJn0YKr/3iQzxfaEWBNPBli1sGY6lGYxOFotl/WWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=il/hGVrhIulmFUWRazi7o8mtXXtStsHOQ3fSwDsZqQ0=;
 b=UbH/CkhwITWTxpUYJAM6GRO8k16OLFD+ZWJeglvSnvUREOYwjpOg8A4desQGW4MamBYb6E7EjrCDsa8QYHz2eu2w/fyov1hs5/X5xUWQ2WPgs4eMSrGsOuqH8kImxH+altovUQNVDV8p2yTBbfpLgGLaiYqCAITCV1eygw/BpwTqIaGil3NQ52PsylEtusONyZmfhXNyryR5vEzuGLqgo6XkWarvhcTjKgt5Yca6ND6rptBqoWf1lGwvnixHbe1APjuat1Ei3Mc4FfoK/hVQ5ukJGQ6BVQxRSSjqSYb4A14cpsRz+FdiRZP2VO/GT7QdnUsrrvg/cHpe7g1zW7OE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il/hGVrhIulmFUWRazi7o8mtXXtStsHOQ3fSwDsZqQ0=;
 b=pNpVkG36E1e9cjrW3iJHhVuAdrxkmIeP+JzG7Hx7CzyRVuXwzXOhaBGEOUmKwzTqYs5tG+XqpIz9X/JB6sZJWP8+YeZ3CfR2fR9/ap51rIlSSUxEzUpXbv+t/M6YmtN34OK2X+gYda+5ZaqPYoA3U1fVihjFggJmvqtAWTdxYBdAMyXtYuofyINFmUt2jCmnJpePVkm7IAcn9qH7bmF4LUP2DbaJw8VgoIV8ZNF2U1svyZ6qhgmWXKJ9WLmi8qJAR1phwExYT4B2F2ywReT+aUhNaem2yNDApBVfSINI7sHkhsQG1U9MrwsaQe176hXsKYCdfbh67rFm9AF0uf/L5w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5174.namprd12.prod.outlook.com (2603:10b6:208:31c::19)
 by DS2PR12MB9799.namprd12.prod.outlook.com (2603:10b6:8:270::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Sat, 24 Oct
 2026 08:36:33 +0000
Received: from BL1PR12MB5174.namprd12.prod.outlook.com
 ([fe80::58de:822b:868:96e9]) by BL1PR12MB5174.namprd12.prod.outlook.com
 ([fe80::58de:822b:868:96e9%6]) with mapi id 15.21.0546.017; Sat, 24 Oct 2026
 08:36:33 +0000
Date: Sat, 24 Oct 2026 10:36:26 +0200
From: Andrea Righi <arighi@nvidia.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Suleiman Souhlal <suleiman@google.com>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Zimuzo Ezeozue <zezeozue@google.com>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>,
	Hui Su <sh_def@163.com>,
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	kernel-team@android.com
Subject: Re: [PATCH v33 4/7] sched/proxy: Set TASK_RUNNING when shortcuting
 return migration
Message-ID: <atxuCoz3ZO_0j0Go@gpd4>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-5-jstultz@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023220431.1106611-5-jstultz@google.com>
X-ClientProxiedBy: ZR2P278CA0073.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::16) To BL1PR12MB5174.namprd12.prod.outlook.com
 (2603:10b6:208:31c::19)
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
X-MS-TrafficTypeDiagnostic: BL1PR12MB5174:EE_|DS2PR12MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c78976e-8fb7-4a1b-c6fd-08df31a9e896
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|261022105027099003|261021121427099003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 p9LSE+kpdkvV+G8JVZRqrKaUxbWi4CISa4b3bjL+Mn+5XEKoSGZadMCeIvfViB/sB+VziuBccgy2sjXmtj2vlEDMNakfvt0fDyYmY0lOuj4JJP/IunAUbgVFqxmhafH86wDnG3TbpH4fSoIUC+5OtCWT9UQ3Lln3SM+8FJmSq9qAvECCk7rDELTVCdRmkn5RQau27wtBI5gxuax8y1RQOb6eqF3L0RVgE+gPl0CgRLrbfKfgQ4Tm1UZ75OyPJPN4QxpCz+RLkqMWeX0L1rk/duAbNzkhjNqJTZAdzGPy+YHyU31jTt8pnR+JSMcp5973ob8LtyelxpKMitpKRG2BHwAyxLPcZE+ehPEcbZ7XYhXgERjqCmwqjQUNJUO9M6uXytcOpuzzPpCcdcQ+n34G7o7ceE9SUCb4m3LxOZx1ev/obL3tlrII0OzTvK0lovIokuWm5hDcG62H+8cdGJ8dMIsS0P0s/gEt9f3NlV4PJ6KHZuNKitQGVdu7dGW+fGVyE+WX0yyUnubybCPXlXn5EYM1Lu0+gt0YsSNsfvZdfmqk7eiktpiRtnhs68cbQXHQfG8EAnmfzeAYIOKOt74JNHCbtQCxpWnnawwPOYA6UrNyVZM2pIj3qMCdG7xGbMZ0tRVQ5/OD2ijO+wkJQu1vY4uPrWpnfwG2lbjrQ8AQ4fY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(261022105027099003)(261021121427099003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FiVlMMpKSDvkjMsQVVqICY6TrZNWeMKTnkhbHx8Pc9W6inVApT1DvemoiNH2?=
 =?us-ascii?Q?dnglxC+CwtypR/xRmYGRycQcgoa6jaXOgnZG7pFv90SYA0R/SPXi5UamziMy?=
 =?us-ascii?Q?/RebJTNKwmvN5Ce5WDVbRi0C3LaTG2HbdUOfw/INjvijkE0+ZecY9r/cl+ud?=
 =?us-ascii?Q?m6FkEM49KrwKIvHjoB1feTFlBHlTYsbA9DmgbGYLSbH9yC6roV/oLwrn+saA?=
 =?us-ascii?Q?iHz/Ri1hov68fnQLif4EIop3g18lwzMQ+gK43girmtJw8A82IaMoYJhGnc5f?=
 =?us-ascii?Q?+0GoqaeZdHa68tDMwc0ulcJye9IzMdbl0S8DBnpPBMuhQRcvAoe8mOhN4Mm+?=
 =?us-ascii?Q?MnIJMPFGVIhhypAIcjsl7WAKSWbuLOj5gS3vXk+XaIfiYsRjq1eqapMncp3r?=
 =?us-ascii?Q?BsiuKvsdEet254PzlwxN391TVWm47UoCAUGMEKG/j0FusSn3X9C8voEx90PI?=
 =?us-ascii?Q?eTzzuy/sbUzwxV2Q3Nh8cg+8F2TFV1VAOB4sE/G3/FaWyPm/EhJXq3mguxyY?=
 =?us-ascii?Q?2z4PIruGVA9y8MRtQfPKXEuXOCA5gh2wrRmhNtpu56Y9X/DpGJ6hFfFhDihN?=
 =?us-ascii?Q?xnPJwPpJCxpR/PxprRhIR8hu4YYD3cyb5ZVGegrXMrd3J9u/j8eSFcTCWr1B?=
 =?us-ascii?Q?Dwfd4LZXcyb9SKK+G1Xzxr2M3knCVcUgjER/v9sbiFLc/JyyYLiZx9qRNVK6?=
 =?us-ascii?Q?1jt9cHN2yjTCIxXf83Y0RcfvO/RNUZgdp42VMR3e5vv/cE9slRG+mZt8z1LU?=
 =?us-ascii?Q?138/+EoD7rsOHBa6Yr3C4sretYBW8PivSXz4nUjXXFvZZR7DEMEj39Apijdj?=
 =?us-ascii?Q?cPyyd8MFrNETUtaiB3+R09kijfb1aFS5UeEXdK0iu4ND3sn2fc7gwSdQq+FZ?=
 =?us-ascii?Q?qjldxTRpXY9pJH3FvJ5YQcxZWcKJc9hyi9bjnZYBGSW8nMf3lISG/8vM/dHB?=
 =?us-ascii?Q?W4fiEaBbK3v7dxrFeHruTp0QZR3wnD9KsdxOBu4+J0CSdE4/tX/LU5UxY82k?=
 =?us-ascii?Q?QLTWQrD990inlKF6ak2mX99uAKqeFf8wrTvVj/DFC+p+0eL6UPrzcM5kj1mS?=
 =?us-ascii?Q?xHE0LLICXslcXCPWyAtRTXv8OfOPlGZGXLtbfJBHIpQQGnoiqGm9dFAvC5A9?=
 =?us-ascii?Q?pjhCDEnzAfYxH4e/MZM1b4ZfslQTwyrPXcyM5EoHY3KObagVYB07nFwxsYcp?=
 =?us-ascii?Q?Owo6a46d4zAzQdjXX0zeXzBk4JU3wKLYEmoZ+YjFgKJ3preap8SoVq259B33?=
 =?us-ascii?Q?34xoqUJ3iJihQBaR4vvAvOmI5MoQfzAw8HxltkXCcaKqnS3EpQXn+k7MvbYD?=
 =?us-ascii?Q?Iw0Z9RImy8sSaSzbx0gYsQaqh1Z+MWwFrgpycvpWm2ITyvdzUOnwRW9zGQlz?=
 =?us-ascii?Q?TMkv9iYNJ8X0yptvxoMCVK4eCYZa31GUDqVsFM5rd1JepTAjtF6Ydjsyx7OQ?=
 =?us-ascii?Q?zWD+8HkDmsxgpinZKSLDXHGPKoWdB8emwuqc9QffgaAjKAbM5wM9li31t5dQ?=
 =?us-ascii?Q?NcUr3Q6FFAtgnCrpZ2Ko87psIrCYmlHwQPBF+TuXBRiUElirtZR4/FR9JERm?=
 =?us-ascii?Q?OWC6sAS/gmHU1HNBk+tOiYg8j5BIe2VpOLOtp6ED88JS6w262ZirRzxvvYuZ?=
 =?us-ascii?Q?7yRCoCgPQMoDN/cFrXSnK2gpmjuQB6n4TEPFshVChDBnADyTCg0kcmubRENS?=
 =?us-ascii?Q?mvpt1GbhiSe4w0ABmwSVtCCxnZQxng82leWLf0nu2ZUUHbeQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c78976e-8fb7-4a1b-c6fd-08df31a9e896
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 08:36:33.3415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S69BJIMpljt5sOg9BpHyjY98nvaN3kuXdWoSaFb2sBRc6XuON9LBS5J7Vb5TiwDoQbff6WXMgWQr58ZwnGYwwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9799

Hi John,

On Fri, Oct 23, 2026 at 10:04:15PM +0000, John Stultz wrote:
> K Prateek's prior patch optimizing find_proxy_tasks() logic to
> shortcut and run previously blocked tasks on the current cpu
> made me realize while we are clearing the blocked_on and
> is_blocked, we are not setting the task state as TASK_RUNNING
> before returning the task to run.
> 
> So set the tasks to TASK_RUNNING prior to returning them to run.
> 
> Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
> Signed-off-by: John Stultz <jstultz@google.com>
> ---
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: Suleiman Souhlal <suleiman@google.com>
> Cc: Andrea Righi <arighi@nvidia.com>
> Cc: Metin Kaya <Metin.Kaya@arm.com>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Zimuzo Ezeozue <zezeozue@google.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Qais Yousef <qyousef@layalina.io>
> Cc: Xuewen Yan <xuewen.yan94@gmail.com>
> Cc: kuyo chang <kuyo.chang@mediatek.com>
> Cc: hupu <hupu.gm@gmail.com>
> Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Cc: zhidao su (Xiaomi) <soolaugust@gmail.com>
> Cc: Hui Su <sh_def@163.com>
> Cc: Shubhang Kaushik (Ampere) <sh@gentwo.org>
> Cc: kernel-team@android.com
> ---
>  kernel/sched/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 2cb42de255f7a..43ba76b5a3464 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7028,6 +7028,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  			clear_task_blocked_on(p, mutex);
>  			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
>  				p->is_blocked = 0;
> +				WRITE_ONCE(p->__state, TASK_RUNNING);
>  				return p;
>  			}
>  			goto activate;

This is basically an inlined ttwu_do_wakeup() without
trace_sched_wakeup().

> @@ -7065,6 +7066,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  			__clear_task_blocked_on(p, NULL);
>  			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
>  				p->is_blocked = 0;
> +				WRITE_ONCE(p->__state, TASK_RUNNING);
>  				return p;
>  			}
>  			goto activate;

Ditto.

Can we just call ttwu_do_wakeup(p)? It'd also avoid having two copies of
the same state transition that can diverge.

Thanks,
-Andrea
