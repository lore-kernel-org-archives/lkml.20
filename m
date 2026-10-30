Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.94
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793324322;
	b=jGLsmAsczCW1Kx2z5FFRKpvvbGETNWq3tVq3e0IuIycKQszQSBB5XGEnunyCmoRCzUkg
	 pKvYRjYp6pRgfM/5zjUW41Mn/wpGEcBsR9+NyhN/vgBSdww3rG5iv0BpyBw4XKqJiDcA7
	 jPRttag9ziDCBt41i8yr3f5K5E+OF+P7XWq0Ugf2pAGY+28wHRTpcI9H6oat2/9A2ALPe
	 Jv6sTMSkQEKV3Y3mwpLUjN+9oaICgjBYXG3LvV9uZyjlWmXQPF+DkpRViPoA7caoaKbl9
	 JG+X0nRhPBcpruDt6CRwy/QBuu4dRXjZto9PyXpIoxJm4e6RTF4tQnsgpaSguOYBnfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324322;
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
	bh=mkpD0wIrDWEIDW62EulZFq8uH60gx2K0ZOG9dMVyDoA=;
	b=pTRAkimmraGnJZGjaDxMt8hgJRGcGIffv6Vw/8Es3V+hvJa0Z+/OLAxnK+cYNiXMTt6y
	 I1HUj6wqaUKzxZbZWgZM5njkjw4XclZ2tNADzJxAsrtfEKyCjmtbW12cHlSqcdW+D+sp+
	 MYKcPZmPQRpXBfFRO40cjEfQWhD/IQWTin70u4fyzs/sBQ6F0gnMlttzYty2WJ2O8nhc+
	 MiFrsyHBvJb4MOmOlbpDa0UQNLQ0iT3RGl2+f3s+V6usiFbUr+lyaeFElHqcon1gUr5wg
	 gB00ian051FB73nhZOLBCqvebc25Uxo5zN1A9lM+p7znr7tQr/Tjz1Wl/NxXKg8xzCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.94
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021094.outbound.protection.outlook.com [52.101.95.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADBB606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ADBB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlNStVmeJLAn+79onto2SgXgKc0ZPEN1POVnfSM6pFW0OQXGQ4mQD2lJkhz/nkrJQkHO3PJfpK+jbivAkbHL+lVIY81Aetw41PNLATwPF38P5hP3HGCfGpLo2ubtbRZ4MWS6giHQWLYTSq217My44IojRXoCooj3EqkO0ODAFNc8O56r0QlpRre/1sjKf8SbcEqsbclizh6wLAA8OTBlcMKLt7IHytdXm0f31rIeEahaHTnZT5bP0EWyGchGF6+gTczifJqf3Ew7mLjzHMHUfMey/lDooB71TndJ7+2U6AQsyrvP8XPUk2Jag3yT7mwZl/koTcoo7SpoBUbMj2hkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=mkpD0wIrDWEIDW62EulZFq8uH60gx2K0ZOG9dMVyDoA=;
 b=EHKRygJ6MoNjnXgD2EGW2tS6F18PN1mfzIfs7x9RUMh3UTb1WLGNNbvh5lUA7P//HS1T8QDH7bGr5ymFfzM7u6J0v0Oszw1zu9ecMDGC8IyJYUqaOu1I5YFaK3pRA6nMdoWULqCA0n78tmzNzxN4PsEDNFscZLKUqGo9Y7/FuQz9vMmylYVClp8GmJk7RwZEC8UbQ7AGahmj4IYFVqfbnWPVPK7ZJTwxafHtvFzH82AadeEm8JZv0jayglhBi5+NOhHhAKFpbNbU3U7QPlgljkQC0ZjJaeCccHJ9IVZg1S7ZPNz++yDwb7tafvchQ3j5+imdtqDCCw1CFwLGgkKvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6323.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 01:38:39 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 01:38:39 +0000
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
Subject: [PATCH v10 tip/sched/core 5/6] sched/fair: Use list_for_each_entry_rcu() in print_cfs_stats()
Date: Thu, 29 Oct 2026 21:38:16 -0400
Message-ID: <20261030013817.753804-6-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030013817.753804-1-atomlin@atomlin.com>
References: <20261030013817.753804-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0535.namprd03.prod.outlook.com
 (2603:10b6:408:131::30) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO4P123MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fad64c1-e41b-4554-a579-08df3626860b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	RE1dvy1JhgshsF+WeP9RmfPgYBlk5ypJN/BEoi3/jOQf0agADSaRrK2AjoX4vaGy3JSp+7UMhQHJ/OTqpHZyz9ddZETLm9HA8tZpggxV9frpI886BF9JjM2vP98G759SUX0cCKPhOKgFKXhEP+GelP/QC2Ro3Y41ubM7WTn9gUPzAOvbYpAz7nI048G0RyagfDY5MOtx6IVBCQ1EuqqmLlVPPenU0Oe33YaCPZHVC1Fac1tRDmZ388WjE9LysliMw+jP/3AguqCCjhTHin4klzzWRA3wxw9tvi8o0uudYM2asohADIvGS/PKS7LlWFwZFAw97KqnPIgQbOCorD2E5iXZeGg2MiUHtvFnV55jAnE7mZZi8T5diTlHpCvQ/hyXe3yetSD61eVis8offXZKjuOkZg7UpSKe++q6xfdtij85T54K5Wf6hdieZho8JFri7WhT2Ban6fHVn1Ggg5F/ltYavoa/QkWqSS4FUrPR1bfjjXA8YG6XM44X78yCa60GSOYAA9umM1JHzcxfif9UoPyKE3E+MYGdkYPfJd1E88CsrwMvMh63Toqn5lFt348a+wrxlpt3r+14dQImcxbDl0b08F6HCFgWksbIKv+eInRKYYvJltdoQZoJRTM/QH5AvF1uMnb+zNsSUUTYXzonrz+ZzU5UD+havDmK2l2Epms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IbqbYfk1TmQHdvwFHePJl4UFsr0ASy3+Utv9r75q6h/NvZTNe2RUSqCpk6rl?=
 =?us-ascii?Q?ui7hcEfGVh9c210AfUAjFfsIsdOSQG+ZLdu6ttqE1lt+g1sNvEI16jsyL657?=
 =?us-ascii?Q?xAjTA+K5vHTCbx2/DSxV8w3ARNKE+1QstnqE6XFtbrHNkOupmWEaIetj055A?=
 =?us-ascii?Q?pGYU6LiB56MpTkUiw4gXN8iC2uEXFXXy3gY3pOcG1lxOKL9tvsJibnhzrGlO?=
 =?us-ascii?Q?8f3uY2xRVadiRj56a5QiAqSsSVK+3g4h15ORWR6ipUuOswjfkAsHBRVJyTVo?=
 =?us-ascii?Q?8+sZMKkGrEl86+zBYupksWjBl/uV2dd5KHFL754IMTItmhJlGoTLuOmI/0tq?=
 =?us-ascii?Q?BmFxslRFCGR83zMQzDmU82dlUvIrBxxCFuM1RyQx/c4ZX4U/hSdwLEuIasfc?=
 =?us-ascii?Q?hYMazt7aomlRBqYdUtQGVHDLIj7vwpX3sOLPZiuwtMym6xvkhtoB6GIVFzim?=
 =?us-ascii?Q?zsthRw+YM2TWU2UmhOZ5ajlPBsUNjsr8ESdj5aUsrO/4oVJ3pE9g5soqp0M9?=
 =?us-ascii?Q?BZxvlnkdKzKb6Y8Xr20MrqIe/F/C6B68zH0nSELOi8Pgfq1/BTaoI6HdJlXz?=
 =?us-ascii?Q?pA6QS7qwFF9DrD2exlZpeKYh+GIJP3o+xYObUTCoKGtqm2GAImsTzL6brj4I?=
 =?us-ascii?Q?66C8MW6WCKA6J9AUzUS343NXZ++h1IEXFJK9QWUJxph79jfr5iWgpf0Iud1L?=
 =?us-ascii?Q?Ufr3z6YlBPz/1dDzX5E44AjXgE3OAIFsYI9mRPas5X3+nTu0dFROZzHIABai?=
 =?us-ascii?Q?F4z3jYaM8oRyEfCHd564OYNq/zosYek4kqGYu/2gF+rfbQEXL75yKlho1P/r?=
 =?us-ascii?Q?xHq3ab8+O4fawZfDWsvqcfevq2UNKOkjUjDGuYdYrN/0r39FNmzLtfxscY4s?=
 =?us-ascii?Q?PSWLNuCDKNuzvR5H+De/FDQw4zdnhuBnyk5GPpp8NVWBYvBgxbMB5Yhf7zP6?=
 =?us-ascii?Q?ilIz173VVJ+P+dgjeGufStsHeC0ytD6MCKTKrm6eLsoayAaxtL1FLdBNZyU0?=
 =?us-ascii?Q?j9h1twaHq67dUbmM6cMxU6vEk/n2KK6apZAKFcUl6ZMxmpDK/z3ehFZOFcWq?=
 =?us-ascii?Q?qInQWHvfTkm0HkoQ9XFE/oFW0smCMqNNiXOwa2VldwxIiKJdyIc7CnJqY/8t?=
 =?us-ascii?Q?JvlwGvXZNNQfCMZnkA5HcRfVLnfTlVmrSXao6AFL+9LJW9X2kVtg4NxFOQlL?=
 =?us-ascii?Q?71liWpFZb5yACS/DIEi7SmtHvlbgU5kt1uw6oulc0CQndRWf5VWIesOvj1Up?=
 =?us-ascii?Q?DIS6wvh3H5wu+dZfWkQP5W9QwqUD5OZNEJzJEYLiXhf446Ge+5OzWuDObYSi?=
 =?us-ascii?Q?MyVQCjrsyrIx38x/HG101dX7woM/eRoa9JDdMJVJExYvwCX24q2ExbfkKlvY?=
 =?us-ascii?Q?eB5D1F4qdG6+0/84uK4+tqFIXO4MDT4hTWjqkihpaXzADiQQdj1VX22mUKZ+?=
 =?us-ascii?Q?O3bbfRoMFyDqqlgq2TH89LX8A6LRRIh0RPlb/IdfodsekJS5YHk3Qe1bTYJ/?=
 =?us-ascii?Q?RfoGrgRuLcDCr71mHel4kcxTvL/MLAB8pvdAkKIdrAlT3g1HBOyDIjl7ZIsi?=
 =?us-ascii?Q?H5Yc4lfvJFYHPxbp75VLweXoEh3nvfGeeT4mzaJhzG4JCbEQu7g9PpCJsWMc?=
 =?us-ascii?Q?ERlaLZAMg6LfEcNCUPPpQhEk5m8Tz93irdraNvt7QJ6eGr5YqZydTgtWedzD?=
 =?us-ascii?Q?MbSiBwcyn9NBPb66DA8sEIdRFOTWAxGk8SVmVwwXMIUFbmF+0rpxR/RzWw2j?=
 =?us-ascii?Q?82cob7kZrQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fad64c1-e41b-4554-a579-08df3626860b
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 01:38:39.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwSF+SMOGTXL3tS4LS97n4YtCodOsBZs4I9l/JZNYYnN18R0wq4SRR849XHRnOZ9aQCU6aTliskmOS97gTTXHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6323

In print_cfs_stats(), rq->leaf_cfs_rq_list is traversed locklessly under
RCU using for_each_leaf_cfs_rq_safe(), which expands to
list_for_each_entry_safe(). Although rq->leaf_cfs_rq_list is modified
using list_add_rcu(), list_for_each_entry_safe() is a non-RCU iteration
macro that dereferences pointer links without READ_ONCE() and pre-fetches
the next pointer without memory ordering guarantees.

Without READ_ONCE(), the compiler is free to re-fetch pointers or reorder
instructions. As a result, a lockless reader can observe a newly inserted
cfs_rq's pointer before its internal fields are fully visible, leading to
reading uninitialised data or dereferencing invalid pointers.

Furthermore, in the core scheduler, cfs_rq structures are embedded in
struct task_group and are enqueued/dequeued dynamically on each CPU's
leaf_cfs_rq_list during task wakeups and throttling. Because this occurs
in atomic fast paths under rq->lock, deferring list deletion with an RCU
grace period or allocating dynamic proxy nodes is not feasible. While the
underlying task_group/cfs_rq memory backing each node is safely reclaimed
via call_rcu() (i.e., sched_free_group_rcu()), immediate node
re-insertion can modify cfs_rq->next while print_cfs_stats() is
executing locklessly. Under continuous list churn, lockless readers
could experience backward jumps, resulting in unbounded list traversal
inside the RCU read-side critical section and triggering an RCU CPU
stall warning.

Address this by:
    1.  Introducing for_each_leaf_cfs_rq_rcu(), which expands to
        list_for_each_entry_rcu(). This enforces READ_ONCE() and proper
        data-dependency ordering on all architectures during list
        traversal

    2.  Using guard(rcu)() to ensure the backing task_group/cfs_rq
        memory remains valid throughout traversal

    3.  Capping the lockless list traversal with a per-CPU
        circuit-breaker ceiling. This represents a generous upper bound
        for active leaf cfs_rqs on an individual core while guaranteeing
        loop termination and preventing RCU stalls under list churn

    4.  Emitting an explicit truncation notice if the ceiling is ever
        reached, ensuring transparency in debugfs

Fixes: 039ae8bcf7a5 ("sched/fair: Fix O(nr_cgroups) in the load balancing path")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c | 39 +++------------------------------
 kernel/sched/fair.c  | 33 ++++++++++++++++++++++++----
 kernel/sched/sched.h | 51 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+), 40 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index a22d64647bbf..b29159513e2a 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -11,17 +11,6 @@
 #include <linux/log2.h>
 #include "sched.h"
 
-/*
- * This allows printing both to /sys/kernel/debug/sched/debug and
- * to the console
- */
-#define SEQ_printf(m, x...)			\
- do {						\
-	if (m)					\
-		seq_printf(m, x);		\
-	else					\
-		pr_cont(x);			\
- } while (0)
 
 /*
  * Ease the printing of nsec fields:
@@ -927,38 +916,16 @@ static void print_cfs_group_stats(struct seq_file *m, int cpu, struct task_group
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 
 #ifdef CONFIG_CGROUP_SCHED
-static DEFINE_SPINLOCK(sched_debug_lock);
-static char group_path[PATH_MAX];
+DEFINE_SPINLOCK(sched_debug_lock);
+char sched_debug_group_path[PATH_MAX];
 
-static void task_group_path(struct task_group *tg, char *path, int plen)
+void task_group_path(struct task_group *tg, char *path, int plen)
 {
 	if (autogroup_path(tg, path, plen))
 		return;
 
 	cgroup_path(tg->css.cgroup, path, plen);
 }
-
-/*
- * Only 1 SEQ_printf_task_group_path() caller can use the full length
- * group_path[] for cgroup path. Other simultaneous callers will have
- * to use a shorter stack buffer. A "..." suffix is appended at the end
- * of the stack buffer so that it will show up in case the output length
- * matches the given buffer size to indicate possible path name truncation.
- */
-#define SEQ_printf_task_group_path(m, tg, fmt...)			\
-{									\
-	if (spin_trylock(&sched_debug_lock)) {				\
-		task_group_path(tg, group_path, sizeof(group_path));	\
-		SEQ_printf(m, fmt, group_path);				\
-		spin_unlock(&sched_debug_lock);				\
-	} else {							\
-		char buf[128];						\
-		char *bufend = buf + sizeof(buf) - 3;			\
-		task_group_path(tg, buf, bufend - buf);			\
-		strcpy(bufend - 1, "...");				\
-		SEQ_printf(m, fmt, buf);				\
-	}								\
-}
 #endif
 
 static void
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 201864ef8c61..860a04ab060c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -419,6 +419,10 @@ static inline void assert_list_leaf_cfs_rq(struct rq *rq)
 	list_for_each_entry_safe(cfs_rq, pos, &rq->leaf_cfs_rq_list,	\
 				 leaf_cfs_rq_list)
 
+#define for_each_leaf_cfs_rq_rcu(rq, cfs_rq)				\
+	list_for_each_entry_rcu(cfs_rq, &(rq)->leaf_cfs_rq_list,	\
+				leaf_cfs_rq_list)
+
 /* Do the two (enqueued) entities belong to the same group ? */
 static inline struct cfs_rq *
 is_same_group(struct sched_entity *se, struct sched_entity *pse)
@@ -472,6 +476,9 @@ static inline void assert_list_leaf_cfs_rq(struct rq *rq)
 #define for_each_leaf_cfs_rq_safe(rq, cfs_rq, pos)	\
 		for (cfs_rq = &rq->cfs, pos = NULL; cfs_rq; cfs_rq = pos)
 
+#define for_each_leaf_cfs_rq_rcu(rq, cfs_rq)	\
+		for (cfs_rq = &rq->cfs; cfs_rq; cfs_rq = NULL)
+
 static inline struct sched_entity *parent_entity(struct sched_entity *se)
 {
 	return NULL;
@@ -15897,14 +15904,32 @@ DEFINE_SCHED_CLASS(fair) = {
 #endif
 };
 
+#define SCHED_DEBUG_MAX_ITER 4096
+#define SCHED_DEBUG_TRUNCATED_MSG \
+	"stats truncated at " __stringify(SCHED_DEBUG_MAX_ITER) " iterations\n"
+
 void print_cfs_stats(struct seq_file *m, int cpu)
 {
-	struct cfs_rq *cfs_rq, *pos;
+	struct cfs_rq *cfs_rq;
+	int max_iter = SCHED_DEBUG_MAX_ITER;
 
-	rcu_read_lock();
-	for_each_leaf_cfs_rq_safe(cpu_rq(cpu), cfs_rq, pos)
+	guard(rcu)();
+	for_each_leaf_cfs_rq_rcu(cpu_rq(cpu), cfs_rq) {
+		if (--max_iter < 0) {
+			SEQ_printf(m, "\n");
+			if (IS_ENABLED(CONFIG_FAIR_GROUP_SCHED)) {
+				SEQ_printf_task_group_path(m, cfs_rq_tg(cfs_rq),
+							   "cfs_rq[%d]:%s ... "
+							   SCHED_DEBUG_TRUNCATED_MSG,
+							   cpu);
+			} else {
+				SEQ_printf(m, "cfs_rq[%d]: "
+					   SCHED_DEBUG_TRUNCATED_MSG, cpu);
+			}
+			break;
+		}
 		print_cfs_rq(m, cpu, cfs_rq);
-	rcu_read_unlock();
+	}
 }
 
 #ifdef CONFIG_NUMA_BALANCING
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6607963efa30..93c1f4399a23 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -777,6 +777,18 @@ struct cfs_rq {
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 };
 
+#ifdef CONFIG_FAIR_GROUP_SCHED
+static inline struct task_group *cfs_rq_tg(struct cfs_rq *cfs_rq)
+{
+	return cfs_rq->tg;
+}
+#else
+static inline struct task_group *cfs_rq_tg(struct cfs_rq *cfs_rq)
+{
+	return NULL;
+}
+#endif
+
 #ifdef CONFIG_SCHED_CLASS_EXT
 /* scx_rq->flags, protected by the rq lock */
 enum scx_rq_flags {
@@ -3485,6 +3497,45 @@ extern struct sched_entity *__pick_root_entity(struct cfs_rq *cfs_rq);
 extern struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq);
 extern struct sched_entity *__pick_last_entity(struct cfs_rq *cfs_rq);
 
+/*
+ * This allows printing both to /sys/kernel/debug/sched/debug and
+ * to the console
+ */
+#define SEQ_printf(m, x...)			\
+do {						\
+	if (m)					\
+		seq_printf(m, x);		\
+	else					\
+		pr_cont(x);			\
+} while (0)
+
+#ifdef CONFIG_CGROUP_SCHED
+extern spinlock_t sched_debug_lock;
+extern char sched_debug_group_path[PATH_MAX];
+extern void task_group_path(struct task_group *tg, char *path, int plen);
+
+#define SEQ_printf_task_group_path(m, tg, fmt...)			\
+{									\
+	if (spin_trylock(&sched_debug_lock)) {				\
+		task_group_path(tg, sched_debug_group_path, sizeof(sched_debug_group_path)); \
+		SEQ_printf(m, fmt, sched_debug_group_path);		\
+		spin_unlock(&sched_debug_lock);				\
+	} else {							\
+		char buf[128];						\
+		char *bufend = buf + sizeof(buf) - 3;			\
+		task_group_path(tg, buf, bufend - buf);			\
+		strscpy(bufend - 1, "...", sizeof("..."));		\
+		SEQ_printf(m, fmt, buf);				\
+	}								\
+}
+#else
+static inline void
+SEQ_printf_task_group_path(struct seq_file *m, struct task_group *tg,
+			   const char *fmt, ...)
+{
+}
+#endif
+
 extern bool sched_debug_verbose;
 
 extern void print_cfs_stats(struct seq_file *m, int cpu);
-- 
2.55.0

