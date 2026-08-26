Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022122.outbound.protection.outlook.com [52.101.96.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988F1488223
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784173; cv=fail; b=FT5c3eXIqOECN191ziVC7QpjZDQ05+MnqatuOWtdB3jQPgC0xlKmCFYqzhz0BqJS7kaTNLmAvOvscMWDQzjy9H5usOLLi0uK24UAw70CCyeLa9iGZKmSc6Sl87RKCo5rVP2aLq/O7buSlcdLL3mxXWNpC1BD/fScZrjhU1UgRXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784173; c=relaxed/simple;
	bh=AOvXL1FiZbh7jBBHxWHb8ru8JIYgeWp5gL48/7CwlNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RGLZ9Tv1yffKV2k0XusqydO6uphij7EKWLRhs0ZBo9QlG5ft/JisLuOg81ajM+nGvwGuIb3g5gDwiSAkcLOly1qJ2IQh1+CNfd57u0kAnLJDw1wj4gSxV/nTsBF0iLdPr2E8jsomKJ5jfavbCP4AUZC4gVmRCNXzO8EvMFrqjz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5++ktleBsJ+cPBBuz1YLSxtZImjGgO7v+39d6hVexXK631ys7q1rgzAM8SizRzVggk6BufXLT63WRZmcFeGpGdqIPdKToSdMURthvU0vPgjhXTZMujnJZnTTijxBLftJUb7ez2GWe5MPnWvt5niVdk+dRQLFsJ42Nnauxf3+h9yUZxoKe2TdLIKIGaXuEPDZ8whBVWA3D3pxUkuruspOpQ2CoqybRFn1QaugC1pJpWqbUCmnEMXqKSUR443SMswvf8YhLIa+cYDAgJ4mGWmEC3RFdAeIG76Za9v63fX6R76t4Z7MuOmgCPmNbvdLMPEPn2ArBf+U8+uZzp7uXH+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=gZodYWiNrUAcsvo6eVOxBWVXHILnkwJuR9fjL6RKnGg=;
 b=GVgiD/yD1vMK5CBSEH0ZorjXHXR52iNHI2S3/zcHQ3eakV6v8NSv7jDRrza7P552XQn148QP/O07Zc8mLe8zXUqlJwzB3luzU6/jgWv/fKZSBdLKPMw1JJByMukOGeNDKU3rZXD/Y5IV2qjgcSJRQn2RWcD/SFj7u5aGpWoA8gr73Udt8g3BSqlJhYMxW0ajBfIIsj0c9V87S/X3UIFUVpaRFHdxwYdRi51EIo2zXn5pVKzgPWn/vstEASkFDG0gPgCtTdAUkLu1OHjt+KsArLydgnyNySj73E7v/pv2i7u0DlBPdCBPk9csp5YaS4uAKxvyf7TCZIJjMFnpcEX4kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOYP123MB2896.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 22:42:46 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 22:42:45 +0000
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
Subject: [PATCH v7 4/6] sched/debug: Protect p->mm access in sched_show_numa()
Date: Wed, 26 Aug 2026 18:42:36 -0400
Message-ID: <20260826224238.936456-5-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826224238.936456-1-atomlin@atomlin.com>
References: <20260826224238.936456-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::11) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOYP123MB2896:EE_
X-MS-Office365-Filtering-Correlation-Id: 8204e65b-f562-42c2-a631-08df03c35912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nHRKnIPUzftjFA+RuHoIhtxUXyzF6QsYfYjEUVElubMlUzklwGpkbFmNH+RiLyrhuZqV7/RIll2fbowJGUCFgibxGK/kSsGVb0Z+VBVjkh9owHAlgamhVQJzxSwuBQbN+DTi0obg44CTArZmGcW6UYQb1XvnfaleaAE0TvFtOl5yB1lUMBXqWoxTeUzypbZf3mPDrPRtUWXCTIJvmaRhSvZdSH98YNhi1EqnI7NyBRQOcSgs1pJPTyJ2SeQ9hBgDhx6Zc0ijrLCNxBJi3Ljdk+fykBKk7ByCq7OKnFYf9l8nD+y99lTXagjHmk2jFKpp7OxFcas4fvuVdqQ2NpvOOxXGkPPw3HGoz3PWPRTKLLLo5HUtQuGDwa8UsOk3jj7hbDfua8EdetFAJDLEITaffGDYmmAAWzVLBnCjwo1GHIfEKqbP5Y0PrlHIh0KkcsETXMmLmVitq3PavzgQe6STaNmGtYnXtohTn5NtcVztS2jgBVCa00I/KI4QjCl2fKNZiMUIJxLsJzOtR2aQ3S0n8JusJPYQnS2PB0XAJdh02gV+V+R9UBih9xW+n7mxQ7qZN6WSLHEpuNe9fvuqtmyG2sYi18Z/Hak2E8qYbYUKPF+C8nZD1uGInZbxZfnaI6l6dDke/vV8xQpuKDP9onLOd3gTIGGnLxV6KaHQUCZB/zc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0YSHZqACKnxmdbj1ol+oojzVIiFFP5ZalnB5XlqvC0naDluKW12ZkMdGHWum?=
 =?us-ascii?Q?AVwCxibdHH19ylGNLb93faKgytOtblXCwl6CSQx4BSlIXn7C1wWbiaeO84X6?=
 =?us-ascii?Q?zmeTzrtGZ87XYVNWwQrB+BDgeqFlHzAokQKN9qndR+Kab8YhWat+XuZyMyk+?=
 =?us-ascii?Q?SHq1ZKIj2ZSIxCVHGYfVhkgQATl7wysxGag8lY70todIkN+XtdcRxEbhRsyk?=
 =?us-ascii?Q?xFl7/zqYJaiimKC95/OX4QFSw9AdNUtzik3czuWkEQDmfkYeNLM4BVU9fnFk?=
 =?us-ascii?Q?fqnaFbjH5So7jB65Y1EcS3Km119D3uNDc+DxFYvCz1BvgWDkKZc8F65Gg6AE?=
 =?us-ascii?Q?u5uiFxomAJEWc8vovp+pZLRorbjRIgLQ155GDvPGcXqMpQEBZueK5kncG6f4?=
 =?us-ascii?Q?IwLxYlwUHD/KfRwJHHNNu48apYlldbRHf86r//qktljXmanUa4vB8ikRWGvL?=
 =?us-ascii?Q?HMJBLg3UyTC5U46g5enp1gVsK7clZ/btW61T4TNiOgzda8DPfe/DpPV77ct/?=
 =?us-ascii?Q?3GxpX/X9+rJDFq4VzONZU3nKQinuPvj6riIS4xASvKwaWAa7+v9Juvfl15Fd?=
 =?us-ascii?Q?N2XwR1jhWs658rBe3bU5Ax7hSy88+/w0Wj2cEW+l+5Vp3p7DePJMIAVBBSAG?=
 =?us-ascii?Q?d4j7JWfBBA7Oucors/++wzdv9QnpRXVTEo/+ARWiOnF0u4vkbRwNPyPsb2qc?=
 =?us-ascii?Q?IwHyTfoWkmShuYsDby9tWWq8vzgr+PC0G2oaZBXM9aeVFRO5xQgtBPBVvADd?=
 =?us-ascii?Q?VRuUP/I1jUbJe9H+vrxp8vOZ33bXlO0AAeleyr+sgIlpKnym46UkTmuW6H5t?=
 =?us-ascii?Q?mdyxxnaLUdcelESLOGRuLmJ6dq6tGnfsSwbmzESyi2vEsQBFXTeQBzbML2kp?=
 =?us-ascii?Q?M2x9QJtnhgVBrIBYp8bP60cXhByCyaEd1P1BsPg5gPyybZnw5avf0dRn35Cx?=
 =?us-ascii?Q?RRxBdJon/ascFnzp7i7j/Cg8jWGbs4WOCAd/Wr/fI6fK4JgDZEnykFTkrm2b?=
 =?us-ascii?Q?cMWWQT9NnFhI8j1klwl3+GuykYoJ1JvFRvbA0QJC48qRNXl/CkGTLLx/Te2h?=
 =?us-ascii?Q?yVPGyV1yDNTUEZonQMYHhoGi9jL2pHw55fz7hryu2Ay5tcb9hnESiExzF97e?=
 =?us-ascii?Q?rNixCW0hqtGGcbYqU4Li7l3nrI3edGgv23MhYYxG4/gdF9BQmoAQ1OJBDYvN?=
 =?us-ascii?Q?M+PRckIn9CaX9WJGWig1Wfbr9aNEL9XKJw08oLQlYSJsyqlfiJtkQT7LlHwT?=
 =?us-ascii?Q?g9GTRhWYTs+MjGqVqZUQQX81iwmftH7qnG8jGvHEV7m2AW2IXEY+oM7zIbnM?=
 =?us-ascii?Q?THUxjwx2mk1OEG2m5i/CrrL2uNFFb0AjTnWm54LgikN71arta1/+3xjGC9Tp?=
 =?us-ascii?Q?94IGGagzF0VDXqjH1cX3P9QpFDikGPt20eI4ixB0WxFEaZF/vSnN7FpqYibC?=
 =?us-ascii?Q?hkZ81pP4FphPHvpngez/xLAnE6lUYzT3VlVa9i2LR/iMTiaeXB75FX/ExwXh?=
 =?us-ascii?Q?rIHUEzEUUMg5ap7ovpS4ZUKMmtYg/L8meEcU19e7/2uIalGVmrUwpkVX/+cz?=
 =?us-ascii?Q?ofqr0n6ShIVoAW+KB1tdfCu/NnVskmJj3cd0cDydS1GnIJRiBtJqkqH3IKAk?=
 =?us-ascii?Q?i0wfslpXyoPzb2CGzz5ypqqiM8cViopkIWmqSsjj+a/SvWuZ14eWIjVAqzx9?=
 =?us-ascii?Q?y8OPGP/YQ67JQlNzGW+zUxe0rvo3ZY07/Ua2sf9v3ASVidn/?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8204e65b-f562-42c2-a631-08df03c35912
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 22:42:45.9013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4Y/IF+ptZACIgepP68pueEt2WjZ7hxDP1Vzb+2iVrf/EqTKo4f5pggCxf+CqGL+LyA2rZogrGXCqmQBLG+ECA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB2896

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
index 2949e6ce753d..2a01854f0f1c 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1395,8 +1395,10 @@ void print_numa_stats(struct seq_file *m, int node, unsigned long tsf,
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

