Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.143
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793373210;
	b=FkNn4qBv3Qz+AfQ9N5AvRkFmfReuZq4rGoolWI+vh4e/42WJhXTwjuQKqHv+JxQ9sj2v
	 L8CkTSwZ5bQyLkjEPp18MBY6yFBkKhxR+iayJkT+mWfWouwmOs0vgmx+64s7XAGGr1aXZ
	 PCG8Vw9XT7E0JFmEHfHGRDtSNBRyYgJ5usDjKUHZd2CLYbj5h1DW+UkK4F7VPZ7sajCGx
	 A+vMPNbI6F1yARf0VdgTXQPcPHeDoBfOnrerzDX+gzXdd/jvOXb4HwmUCUuwq6cecB6+s
	 Mr0zz43sCJWgZi3FRe0w5bhThbjWSBQEhjKLPevI6jRSkBEZ43w9chJL/FtjrVgbEHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373210;
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
	b=1GFOBtuF2I94Gu8ORjPFLlpoktF4FRQVXAHOh/ZirSXuznzyjY/62w5plk8Z2RI1c0U9
	 LX/kxRrLrX3MEqJ734jillXA3k2Aky7jlQF5Yfr5p4a/H+16zK1xDeRltp85jxFMfTAn5
	 YFWs+ccIAmtpvTope5ZAxaOG9beAfBB4SNtAsnkzTBO1sYqSysAAs2GJRz/aEkNczMMJC
	 VWGfhs7NmFaoV720mDhkAZGWwIcLxumlz9hly+5wMVCOIp8gWmT1wSVf3pYE9XteViKzv
	 JmViLK7kwNQygAIb+n4VB5+y1CA1WpMcFBSvenXKDAknzbg2PsMfwT5tqka7Yb+rJQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.143
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021143.outbound.protection.outlook.com [52.101.100.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0675606A334
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0675606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YC2rQ9CEfySfbiEIzP5kiXbQHq5JrtDStbfxYGT5MvtqpgsLqagYsnHG+nk73VKx/+FBiqfhnoiyuSgkKK9jYBG0vi5N96U8C52vGy3YErtihSWb4iuGxI7XaXPK/0uM6FMidfRMrRL1Ryinu7aCOJE5dJX7kaoalHroAvt5XjNnigK3uPxAe5VSfFLcEZKocWbXQ5me0r1RhegOgjYeEOrJSrB+gsbTcsWezlO9vr11TUBV3iXzmxQBR4xzBWTSrKWcooTOCRb6XJikphFLUVKMuUSa+H4Ev8Kw3FNfC+vMsGBzP6pQkqvo26wBd49568+rBktPQ1UMObj0HnWgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=dcfWpdfxnrQbAh7YNamsBvyWAa5kLyrF5h9q4pn7x48=;
 b=QzI/FH+eagCwUbP//h3gYl4GB0o5K/o6bVEzddT1aXUmmVr0mL38jDIymCd7381XS7y5W5ahNOnA9IHWXQ+FMZkW1GN0OumuZm1ORDaoH43mqtcA56EvmdFel8ZVtL9m8DNPh2+Pb+kLV2uQ8GtPe04NdY6QUZK1tvTBnhuqJND2dyrD58vVWcfsJUEEFPsH90pT2zJcyPRN1bXSsgB0Q+YEBN+4an+huqCHOJnv068wbEl5+8tG0i9tC94gs6ezPcD5hNQW5L8JhlZA6mB2nwxA0zoC3c/EsPW5rlb14gtP4xbWMo3OQv99xjXBjbUHpRk0go+t1m3rnTD8gqhTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB6488.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 15:13:27 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 15:13:27 +0000
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
Subject: [PATCH v11 tip/sched/core 4/6] sched/debug: Protect p->mm access in sched_show_numa()
Date: Fri, 30 Oct 2026 11:13:05 -0400
Message-ID: <20261030151307.768523-5-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030151307.768523-1-atomlin@atomlin.com>
References: <20261030151307.768523-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: a82e7f14-4e98-445f-5ec8-08df3698594d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|261021121427099003|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	R1LnsZTuhQO0Scpa7lzYB4fQuQdZyPvK8Riw1Hi7aDYNNfDQ1jRna5wOSIWwzI4S47UhiTj3WsUE/8Q7MievSzFWsNTb0a/DLdf9dMjo4mzbFXJWcrUv8/mzcPcV3qFqpazZM/xKjY6lEuPhFAxEBTSLQrQKUHBHNt7Bt2BcE5mDlYh0du/7S/QER7wuCZW90SxEyWE3eF1XmOqRUxyaPKdlyIrSgRsqf5yaunlswO5V6oEIkEJycdnECs1Qw6LIgmZqaggdjeQ+VqzNwxmka+DDEYU1K/cGYMXNyVG/obF0oWEadz3iouS/YII0Yz+h31Keal4jE67flDg5RB7Dig/5R8Dtde1G1kMl0APGMhThpcbykXk9JwKqeSqtUbrtc4DWnXzduttqe/4X97+gTjbxt1x3w2rCz5iQokEAVowvScgZWlQc+rMLPxJntnbZGxfWSbkJ1AA40u88M7+Q7/h+yTTZFXIaEqE+iO7RFqaMmc/GnnwfCvndSvYHuDWD2wdKJCDEEpWrDjFAA/worSA1LfhiBA8QtBNIYeFmKt6QL6VpfgcNCrR/c5fnhBcL80ht75h1xzyQpkfFE2JSMKEIedgz4kMGXH51XioXIILXC9eamsZD6qLj1OeoPsgOpRw7GpbbIdR2cYW9n0saXZsJvNiKeDB969ecxLpMc0E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(261021121427099003)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Qgzo3gUk7Vu9C7Ik6Q4n/0X12l4jMmraAZIArXV6utfLtDqvIf1cNNqfPaY?=
 =?us-ascii?Q?FSJny59gwqxyRL7pxlWHOdrQY62oExxnjxL1d/ah747e8NF6Xz/88eD5nTOr?=
 =?us-ascii?Q?E4uXJldeK/w4NOWtOaL60Y3rcVHFgpxlGKbti+VQmMHwF2WElYbGykMPgG8d?=
 =?us-ascii?Q?Jl9iGVxEs8BOVN7o1g/2HE8hOrtYzJhgL7tUoziSVCNQua+RWkNekjvcvVyk?=
 =?us-ascii?Q?DeBIiVAt8Z9UXEz9jzFY6XCWNbIoIybal8fQhcsj5l2NP60XFtNcU/QT1wDC?=
 =?us-ascii?Q?I+qvJld2981wROLUrcM+ldoKPRGG+WX7X9BqG6gr4t8oXT9uNIxnmrgfH18t?=
 =?us-ascii?Q?/33EJgmS02LR+KxQ9MO+r9z+CinvBU/Im64dPeSOqZ6j8d6yjlaDi1PczcKj?=
 =?us-ascii?Q?zQA6+IEO8v3cP1R0ufkWPwDuSzuJhKX4gH2asJeeLVc1IGn87CO4J4wlIVhU?=
 =?us-ascii?Q?8sLTv/VPZ08X2L7G5ZbJhNIUL4hSyZDcWNlKAju6F+6dYacCzmL9Iwb8p7Tm?=
 =?us-ascii?Q?pMK1/pLcshkJjr7vReh5I74xUyfCyIqeJZU6xlhQkhv1XfLHRWeQsGcVYlbo?=
 =?us-ascii?Q?d0O9UsFyEzdVNzlR/pj4M4KkxRuPnbYYE4w7Q/dk6GNotNGrfTJ3/EO698Xr?=
 =?us-ascii?Q?PxqehVQCij0HCWBAYTo8jV0rKcpnEk+7U4NOGrbmpnFfK/zQ428wZAuXv8UV?=
 =?us-ascii?Q?cvt4YC07V8kznvCgNJsklvWmaIS+j4cmHSnQ/5uM3Fr9za7KAeW3R4vY4b5C?=
 =?us-ascii?Q?BsugIVBtbYhdJt21CsXQVnR/r5KYnGwoMk3S8qbhFmWUOSPa4sXl6IYC+F8B?=
 =?us-ascii?Q?QOivUp8pYJCZzDXoI+h7q3YaqIysNCwvG26bqmT/nv+TTSHQSqudkXHay7sh?=
 =?us-ascii?Q?bvvCAaPHv/3k+WnsyPdm0AyQQCyVuA7pd244pkQ/uDSwYIusTV73b7USSaVs?=
 =?us-ascii?Q?WO2gclJhvD9JawuRYn2CFBXraUK2G4h5WBQIprjnFSUmmdlVDNNUhSVNG27b?=
 =?us-ascii?Q?hcckKFV5CiiSLceA2B2PP1wrus0PQnDZr8hqi+00nnrQ2MgLm5C33ttZ+io3?=
 =?us-ascii?Q?D+oX71OnvIM95VbbZVr23DAoY4mlGHo8qdAzWHIaAR+Lu2k7J6QR7m0yDVqA?=
 =?us-ascii?Q?gxPcur5lt8EOfz7ZJmaR24G1kxOPYsxQZPsnJP/C3TNpGajA63MTiK85nG9y?=
 =?us-ascii?Q?9TOOv5sAHdGhENZx/OoyvlNDxlhrng01uEJnNjVX2xvhrknaB/2HMLdXT7vp?=
 =?us-ascii?Q?d6ow1ZLRWyEuE/GS9GWTAkd1ex5coDsV8prO1nCeLBAXgYvW+sV+BFxTEcsr?=
 =?us-ascii?Q?hYWH+k0IuW83X30UFSdgONZIkknQUCn/q1C+GUS7k/nJOTvL0wvBpIhECjPK?=
 =?us-ascii?Q?K3cEu1NivGFQ/YgLZNnWsJUOJ6fy5xbAAaeIb5qVAXfHA+8ZH1PmAnZQLQTW?=
 =?us-ascii?Q?8PDw3BFj3oncBhrtXtMc0zeUibGyeXbPwiZGX/kDeXF+GBKHppLhK6ZIiRB+?=
 =?us-ascii?Q?7w8YA6TxdtaJhKPeZxPYEq7CRlXcdFRZnbZDiLNMl2g00Sf9EniGHXIx9YF7?=
 =?us-ascii?Q?q2Xoi02rznmS/j1KA/Ih9cz96pyqHVJqVfHvTRY9UF5TMcVZr56LiacuuDi3?=
 =?us-ascii?Q?PSPYpHhRY+0FtqHGUsZk69E6RQrB+qzDsPCv0iVBEbxH07KO8Tp/ijPJjNCD?=
 =?us-ascii?Q?thqbvOIFfPj+eThWIoeUWoPqPnxEmkfCCK7Jdmy9zIgyWpgn5YcrenkvjTKw?=
 =?us-ascii?Q?7pbsFtBkIA=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82e7f14-4e98-445f-5ec8-08df3698594d
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:13:27.2113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hb0NoEcYjpt5b5Jj/uxQYyNAmyKg61heFbK36QMWPJNMOhJ0bsVXYDUONG6plLSN2RYUDDF+lyro6AxBmws5vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6488

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

