Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.108
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280357;
	b=J3v5KDZd091frhPO9mZTwR06x9zY4S2pcXSHRaQXl1X1/Dpvr/DL1w2Bg2uZ9Ab9GPAa
	 4qj32v9UND7PSS8pkSNz/tlTCuATnCcAyhgDTo/d6UotxEyS7dzmZFCRJtZDP9L/y2c4v
	 hvM/bEO9lsEHiylA8Z1+KdKEVoHqmzeoYKKhuhhE2Uc07V4QWlXhpr4PbhTkHeI3VuCT2
	 0r/o/xFU3Q9V6IWJamkE2s3cbSwzNM8n8zzWUHBliH/CNNhsmxlE7GkGoTOwuKISfjwPw
	 DueQp3IE/UfXruLmvszV2t1OHgFgo4VKryZJJ2z4REGNN0ggzuCRnPjbCHf0+uHvflw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280357;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=dcfWpdfxnrQbAh7YNamsBvyWAa5kLyrF5h9q4pn7x48=;
	b=478dZYEh4ZKtW4elioSGCMM6Z3R8e0SkFBpIBZ2h06Hf+zX6KRE2rdQRnGta34OINFi4
	 SCll1+6WbVHbzmulePcVZPu9TT/xyCbscKol1DbfRF+NemO9aEboYoU1x4hPtMXz37R5M
	 b9rMa7/IH5OQ92F++s7Tp0B5mYocFCY5td4Om57j427xj5hzT4o3r72MykK0bf17SWeCG
	 qsRoRPB0N8HWoHP+/mre3u1gXXxwn9ndGQJAW8VN6qGdgWAlqQVPb1we0PQu0DnUu/L6k
	 jYMZ49z0jaBrlHNm3ATWCcVjtqYxuzlc6mgKXNhQeXCTVT6tKeDbqwwtdlevxaxJgsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.108
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020108.outbound.protection.outlook.com [52.101.195.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5C360A2615
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5C360A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esbROW19wppYuGZU8DZd6PiuZzPv6sKfpi3DkOagRnwS/714g0tRKMMxm9MNl7MwDDL6PU2vdzn7u/bXlihNJKbyByqrv3v4C7/i6P1Pkq3fZrJcvFowBmqOaaivNh4s4j3qv7fhoN4uZMkXlXpXWKJvtJhmwPMzWYEEOi/ZB7h3v0JHMEbimG8/ROussfHyzq0RCEr6GC5CPn5IeM6CJou+VyV5E+x8BzAVm8ghrNySunqw8xl+oInFIf16VOAHRLh8/TyjM3oiuXuPSKAlpB0aPlMZTa8IMrEqJiamK0ZpxUxDiFdb0xRyNYZu38DZ5KXZJbsqRfN4PwzaXpPh2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=dcfWpdfxnrQbAh7YNamsBvyWAa5kLyrF5h9q4pn7x48=;
 b=sDuk4vL8keR7RAcwZWYtxGOHIifBFpqmlNkZUtvNbnd3FjM0Y4s6LA0FrI9FsB2CF5RYQi4p89f/v/YkaIeWkJ/FRMy6DtPMX4N6NxZVo+ACPO4r1b3Zu5pBQnWvcPcm6kh016WfFN6EaJBhDP2eRsVq9TfersLjPMkCmsCCYihUNmqCm0p38Uiwmh6oEvjkiJijFqgywujDSeLZB42xxowxD1Lgw7MtABIgxEbVELmat7DsO4k46aoP2itu5E9REum4fdoa9EYad9S1ltvECGaWJPImQmQS5A1r6+9NN4nXTRj9bf2j6CjkoBXA9jxVS8Wiw4n5P95ot7WW/A4w2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO8P123MB7811.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:3d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:25:52 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:25:52 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: paulmck@kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	zhanxusheng1024@gmail.com,
	neelx@suse.com,
	atomlin@atomlin.com,
	chjohnst@mail.com,
	mproche@mail.com,
	sean@ashe.io,
	steve@abita.co,
	rishil1999@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v9 tip/sched/core 4/6] sched/debug: Protect p->mm access in sched_show_numa()
Date: Thu, 29 Oct 2026 09:25:09 -0400
Message-ID: <20261029132511.712391-5-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029132511.712391-1-atomlin@atomlin.com>
References: <20261029132511.712391-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS1P221CA0015.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:242::19) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO8P123MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e43d77-9af8-4b75-cf02-08df35c0274b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|56012099006|10067099003|261021121427099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	POsfQ/xBz5VYY81z1xdGpbf3BsMevURBl+cB6cHK5EbkJXg/6GXATTqpQ66oOJWVA5wrf/RNNcLv8qJ/zuuUANP+77eijf9aHlVwa1JOrspUBpOrdvphXJZcV1HIAE/Aa7N0gDNwCa6sgxOEoPgDU8aebZuBiYifsZfhrT+5urxkb39+8SvyNjijOP2wcC7Psowj4WtrGC84XXXZogW8KVf6efY5i1q03B6UB+AGwThfXli9KPcQVy6FXWAAGYfCHh7YdPIrn3QhElZJ51ROrZ5VlKQVDyok3bk9LlIjHUHbx72J9hundSfr7m6h5WL6aLiU2UdiBuzTeWqOH1jK+BIG3o+CZocvEVaKPAICB+VZGdpfQ2U8tiipO0hSdI/eK+t/l7AiX+T+Q7xStSjfMqJP4eAeiQVgY7OKX+ASQRunFPvQi7Ye8+56T4q/EibLhHW0rmaX3LsxRFXX8mH/KIv6n1X6Fv85+kgTQFtKCVISIpgoTKusBqSb0roRf6QyVhd1LbUN48ML6fNJxVn4Ng1aR6VWbTldKjmJ3gLW1SVil7a0JjuwMJa+bFGQd4mDLdTtf9+aYGYMEBlMQS8B6rOrJJgFlzn/hnmVKztqTs8RXOUyUX4Ysgax7l8L6OOLXMEpMslDxFtk3g+jPbVqYhFMHbIKSQa0kpuabIRwd7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(56012099006)(10067099003)(261021121427099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lBvAE89+KddSMhIl2TN25A4A4ly6EBil+xrZjlFtkeEhsDf6f0NmzjYmnA76?=
 =?us-ascii?Q?V9/MKiFiBfiNWzUhkWIARzDvmsbD1lPxyaRs8YE87nCxO33dAOWqevz9k2vT?=
 =?us-ascii?Q?BCReSFKielppu2Uk2PlCvOcUaxGplEVsk+8ogEkVXylNBLX7ivx9DbywO1gN?=
 =?us-ascii?Q?KQZA0lHKy3nulPL9Ah+ug+weAXRY7JpO73O6Lj/eIVRASh+fJu+WpL/3+SZw?=
 =?us-ascii?Q?ZuG9m7nSWH4pKvaRYOxLmY9y52xt1HCbJjvTIBAYT2LCyty2PIyHDJk4m+zi?=
 =?us-ascii?Q?AbuWLKlwYzNj3M0dSB5ePDQXT1/ZE1LJjP099yfdejuftBvkQvAw4vFpyKo9?=
 =?us-ascii?Q?MJ50jjrPxoOXTXo8yk+JlhMuvF3BlRiYog8+EHJEl3+bR9Nqb81l7qlnM82e?=
 =?us-ascii?Q?BotnhnxUSXFcOcdCGVXnlPZFgwDRg5lpUQ9aPdVOauFRm7lqQ60N5yLwSTTN?=
 =?us-ascii?Q?BRb2puD1ULRUZHkuWJIGjoe5/UKbdO/Brww8nOs5uFVjCKJ2ZSMIZBYMjhLf?=
 =?us-ascii?Q?+EDHrsUxWtBVFqnVNVzGQNfo45C9H1Y5gzWAV9c6cbmP+X+ymnuewfoLEsEA?=
 =?us-ascii?Q?72AsQv5io4Z14NpONKIR3E+B/cJzlXOziP3g18uCyFCLJ8b2GIYYVRsdh3PT?=
 =?us-ascii?Q?R53SaFatICdkU39mx4PYkchIAmbDFX9yV2klSmXVQZMrFvf2NVGk7zi3Qo4Z?=
 =?us-ascii?Q?hMJFG7TYuDjtAnuPEz0deq9SLiDMEQdRycrTTy6ig+qrkGK1RUUoFwpLXBtc?=
 =?us-ascii?Q?OWhmTaBL4zPTEJgFUPq3bBTVJMytF8WiqXd9qn7OBR2g07lJKzQNYtvrxCfZ?=
 =?us-ascii?Q?ZSstkNZdX8RVE+vD3SNzcNxeJHTmcvY9wKHCkPBYcQY3m+fsw5xoXsCwKlCj?=
 =?us-ascii?Q?6vBBRIyESLWdziRtR7R+WHfaK6K7HApzxEreakEKYSusLNDdHS8veFKvMuSh?=
 =?us-ascii?Q?oZy66jaElpZGUY5MdJ/EdRi4EUHDI+cbHry8SZSNUbY83cCuan0dCGIFmzpz?=
 =?us-ascii?Q?GRnKg/QLDNENmhlZusa5MeOPLccLo1dsC31v5slWiNTZp1F7133sKlEICKen?=
 =?us-ascii?Q?S7u2foSnuN/mVU/zWxgR7GYohsMyS+R6nI68/c+5++tbZwJ3w/j8fDFGZV9t?=
 =?us-ascii?Q?72UvTjXfOhZ1OOJln4nsjg/xq32F0snegS/px9JcPgj1AK+zoToGNZ8K+o9c?=
 =?us-ascii?Q?rDP5jbbDjTymGlAse1q/RH38SUeEHbozaEsdNs/aTfrF6bLMS6vUGGxg+E3G?=
 =?us-ascii?Q?cZlcCFwTZ681G7ab0Cava9JKXC50AqQPNmiwPSXiPQBbUDb0sT6ny6bFNrFZ?=
 =?us-ascii?Q?0xtFNS1yqIwfUOrslYP71NYprdRCUL4DETAGuAg45gyxms9j4HN0LkFEW7dB?=
 =?us-ascii?Q?goLyWc+PGjbJRHrXAycDlAFF9IWR5WKguBLGW7FLo9qmDQuca7rIdQFA8AuP?=
 =?us-ascii?Q?Ri5b9xob/TGi/ecuQYAH+ESeLMfBfIo6JlyLmCcYqfwzVoEYIsgLNeDpdO5o?=
 =?us-ascii?Q?i6NKthG2s8ZiE46WMjvf6skK8kZ3oNE/Ag4wz3QwBlW5rmY3aGjo6jz8k/8N?=
 =?us-ascii?Q?c9gZaTXoTW82Fo0AMnNbUupb+3AYbaJ9JKXX17ZV8xCDqkMxrvOcZX+Cz4zF?=
 =?us-ascii?Q?qfh3mrWFdjpYxVUR88LQTgem0RrSWjiyGE9TlJ5dmhNWo2+uxE0QoLE4lWqG?=
 =?us-ascii?Q?hn5PUuk5D6gimmvk+Yl5144jrxzr+jF1YFUubrkA7C1fzk4RibXpx71s3XjH?=
 =?us-ascii?Q?xavZb+XPJA=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e43d77-9af8-4b75-cf02-08df35c0274b
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:25:52.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ModV5E3Y/Xkz/B5rG2mPFddZCdtweNsin5VtOn4ujkknhw2xIyi2139W4t0UIYfZ3ZVMO+j82+soiCQ3wJM4IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P123MB7811

In sched_show_numa(), p->mm is checked locklessly and then passed to the
P(mm->numa_scan_seq) macro. This presents both a time-of-change to
time-of-use race and a potential use-after-free vulnerability.

If a task exits concurrently via exit_mm(p), another CPU can set p->mm
to NULL and call mmput(mm) to free the struct mm_struct. Dereferencing
mm->numa_scan_seq without holding task_lock(p) can access freed memory if
mmput() runs immediately after the check.

Fix this by wrapping the p->mm check and macro dereference in
task_lock(p) and task_unlock(p). In exit_mm(), current->mm is set to
NULL under task_lock(p) before mmput() is called, guaranteeing that
p->mm cannot be set to NULL or freed while task_lock(p) is held.

Fixes: b32e86b4301e ("sched/numa: Add debugging")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index be886ede0a1d..a22d64647bbf 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1389,8 +1389,10 @@ void print_numa_stats(struct seq_file *m, int node, unsigned long tsf,
 static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 {
 #ifdef CONFIG_NUMA_BALANCING
+	task_lock(p);
 	if (p->mm)
 		P(mm->numa_scan_seq);
+	task_unlock(p);
 
 	P(numa_pages_migrated);
 	P(numa_preferred_nid);
-- 
2.55.0

