Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022122.outbound.protection.outlook.com [52.101.96.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E824949E0
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784171; cv=fail; b=TBcOVeSy5tGkPLuTGS5fQ8099SEc4KY+/loCfNaQHFtUmVbkiKHFEtYcpsRc5TMQM0LYHYM466SirGwG6t/sB/K+R0UXi1Qc0oPoRCbifJCZ3JXeRvQ+vn5fjm4Z5A4eVxybnUAwfPSL7OdHt8FsfTz5odn3hpFpL4l23YUKWic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784171; c=relaxed/simple;
	bh=oCpfRzeW3vnLiZYXl9KF4nlo4FqZ8G5BMJbONYFGHqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sAssPAC8Rgj5n8whkIebVNwcHhBxfeM6EJNV5AQcShJ2WnMCjia813MWm+WZF1TB2igNXO8euSzbxWTgwlqvN7F5WGf4IkklDy/EHa4NpRkctRP+PgqdexidhISaRHlJ1xiAVZ37G4OawKfMyC0BCopkbfaSDD//dO6Tia03o/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xN6h0T1xjN/u9GRVqaez2UutQs12QmmHzDAmL/ksTtGnHH6i1P0VXtYz+ShLZaw7+L/vvU3/d555dr/RXqpvT1z0TP0JBSBKgqZ0uNV4uFbjVefSc91SViB2bKGBivgrA6XwZ+CV5IxdAZwcX3Vc/KDRUyuK7smmOgupuvKiiRhoOTM1tUcYWY75rs7PNf2fyqfmV37UK6PSvhGlF5M1FpR7pw00Se8sh4lED6KKHp1oaIbFMqMouNBZkC1mUv6hPEtEnSWN7wnBreyUE3R+BQwr2AEg+5nGdP6Sw4C0Ya17aFkdjRmR7fMN9PXcJtA6cWEdKQsJqtCk4wuNuWvgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=dB/5EqRnB7B53vImUMVvge0SKpUE/VZxSsGjvVV0jHg=;
 b=igSiux8PFnDmXfK6E4Tj2XVsNh0sWKFwR0jW4/f3AULxl25yWj+tteX8Rl8H4KKQ8BXtrkohrJvtIw7HxxW4seSOMy/pTfrjp9qLMbaGU5tzAh7DNRQureM5kK9ThX+D/qvJtK0d+cmez3teFYFUvb2qRBzOSvJZGVCwjFU3dzzZcYmcQBKAqgswxoqoRjipAkdqgNmw0QXlF7BVmj/wGZuDtqjcLQefatht93QlTuz93T2QV38U3d8LFwwTHRiQBWOCpHwGjcBn03v9CRn9uffpF5ZzoClqTAh1mmRP6dTg1CA2vSnqi/ARrNDgBGO+oYBhAcLWp69r3kAW6BTXzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOYP123MB2896.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 22:42:44 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 22:42:44 +0000
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
Subject: [PATCH v7 3/6] sched/debug: Protect lockless rq->curr access in print_cpu()
Date: Wed, 26 Aug 2026 18:42:35 -0400
Message-ID: <20260826224238.936456-4-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826224238.936456-1-atomlin@atomlin.com>
References: <20260826224238.936456-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0613.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::19) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOYP123MB2896:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd3fea7-02cd-4c1c-d903-08df03c35845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1zR9z37oY6Bnl7CBqCemjAK7ENvt5Ulq1blCxJmmz2mhbtqrgLc9XUta9Umxnc0D4YYOIl1i0MIDOc9sV++pWX6NCqINmXn6RndOPgpAVpfM1GGKNuyAuTm1cgZP7loSEyuOpZAXAj7eEVMJ7iZP5m8wuU4TGLQSYaajCgYvnVdrHXa2cQ4rYMSDuSFFoaAJxcqzAHUE+wp7xvq64sp4Jt3ahg9MOAE1NV9nOvOOlE5Jz7hp3vqgQEsxNdwgaz/tJh0zXdvBRlchyerIIMJJQ1G6XlMDrIHo9sf5z8QeyGs282ZOqiPs8Q5WhM8P+sWDs6wG4fOwQEQ+F7CTB1cio+MPG6Boo+rMXKArq/yScl2cjCQIsZYEZoah1K5X4k0vdgxVrRJgfq9H0jX9ZUFXNso+D0qmQ1O9MXWJ32+nZNnCnk6PuIWc1DarIxXc6w4ymQTKqWLxBQ7mLKV64gJ3w6Fn0lx65UbwmjsfU0Y4LZtQW6MGy80Mw1knZ3XvwbkibI13ST6n1SkUf07txb98I1BogHwrgCfGWzXpJMPfzTs05GdoGMzIMMWdJB8MrER26z9iGgmmhGcnYCRTOtuwLeonrk+pCJ4ik4HvgFgi45P51x0Po8raD0sg3zHC/ry0EGydw29ATUyp3TfdPd/h9+0ZgAr2NZbQcwvGRxL/qU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6ucgNjImzQ8V+/RLle4GXM7Jhi4S9r0rZLSJQoACqHPp8o+8I0+4BuZWv0yt?=
 =?us-ascii?Q?+to22YZy4G+yCP7UvZrTf8pFDJl2uzwlT4jy3GfenDXDreKl7Eq64+cZgOgA?=
 =?us-ascii?Q?fJgvN52Xa4em+/wml98DP7AEzAQ3Q7N47pjBAbADRzjfn0EQ8zC3He/Fq8KJ?=
 =?us-ascii?Q?K0OaV7oHF3x7pOmYEzZ4vMoPKK5ZnjylEWyI+E6sWg9HSh4nczSzmqAKKntr?=
 =?us-ascii?Q?fcbT+Ayc3n/2dzK7mUmGiVaHKmjk8N5cbwRqzADq4hBhU9GypM4Ok3591YB/?=
 =?us-ascii?Q?Qhz149+ukNLVqGcJcdcWlewLPwwBvRv8jzrvHcJ1XH+J+rVPc+h6sh9dBrCb?=
 =?us-ascii?Q?BQ+KIaEjT9zxoN6fYDdPOF9LiKv7pPVYJaFkJi1hYuxx8d/gyUctQFMZ21Fd?=
 =?us-ascii?Q?6BFFu4v8cRV1w1l+lM2od5CXC+Xuc0Ofv63lqnNwcJ4M3WucQb499Ir65j5H?=
 =?us-ascii?Q?KyF+Y4Ll21TaKncR59OrdMG2N/s1klZHhrIfrHUhIwQO+QdaB9rOVHUNivxO?=
 =?us-ascii?Q?K5FxpZnXTd2vJiM2PfVtClMjL6G/4qnROVHKJ7XakoJBsAOXriqRG9zGi6jU?=
 =?us-ascii?Q?iPjbbfHNflP/jMtpVL9OEH5ksRJmb2gL0XoRTjckFgB79quIs1znLq8PBt5R?=
 =?us-ascii?Q?nZNULe1p7p8vOqWAIfMubjJSZCV9kDlVlda0rnT5VRGpLQX4gUmONJR/A8+1?=
 =?us-ascii?Q?lbkrzmUjkRZLltCeD4Z9PwAKgiy3ibJz5RPROt+q/gSFjX5NVMA1jSnhAaZ6?=
 =?us-ascii?Q?iB/lUO0h8f4eCMw2cCtfjJgwe3fF8EiFOn2Y8LuBu3N2kSrOJnlFOLexf56t?=
 =?us-ascii?Q?E5gU8jm3euA/cJuiDxHMHdeSLWp2u/ngOyg+PTJM2EUaTfl8muzoyFKVr6M1?=
 =?us-ascii?Q?Vy3Hzt//QW1twqMIlBwjXKQMu9mhC46eaSrCt7ZN+6+d20KhHzT9mcnhBBTj?=
 =?us-ascii?Q?r8wckixd/vkRSnHbjhqCxSOTbFgFORGAZyiXsOpxW3V8T7qO/TMT4OBA1+E/?=
 =?us-ascii?Q?N27UXaVhVZZUy4jO7JKFQbRLCGBfXxFICl5oNuMjVoimyOCKnboxjAQa/Nd1?=
 =?us-ascii?Q?aiV1XvFnN8P3mfFAfnmVUJzy5Qo3LQ2OF5mo1rij/NI9vXDn0D4Z00Y4U5UH?=
 =?us-ascii?Q?A2Kp6cT96lkYQFOFBOi3u03jmfyUZljOPD6dvro7xBWnxHWxgX0YdkzB1Vxe?=
 =?us-ascii?Q?qu2psyXRBphhIzwBuMNcjlCfGyNoMmDtjpSUuBRLZCD6R+VMIwpA3GEd89EK?=
 =?us-ascii?Q?Bm+TIsYJcHYkPvAL9YqBi6VHru4qTOOWdM0wvS4kHFO0Ur7qmL+8UNp49GWD?=
 =?us-ascii?Q?bpfOCABdaR7OdCN/lDRh5YktIPQVcGiDRA/Dsvs706ek8PWmCjLgyUDq1OgF?=
 =?us-ascii?Q?L8x8bTPVYy6VBueOuM9md7VIUoCmhWUgTgAyi2oGhSjfgS8wf9dyC/P4A7he?=
 =?us-ascii?Q?IjN45gxM65UyYy6WpzjYLRmlqS9Zt6A793Lt0K2omowWeNggFf7K4TVrOg9l?=
 =?us-ascii?Q?HDlpGS3TCyKUoVD2wVTe8Hs/UER2ot7rea68iQ3vGTgujY+la/SAgXnc5ezu?=
 =?us-ascii?Q?7EjhDHH4KEsSHyFjNKJu9Hrq6ACKQnAzPFX/dABVy/0tE3GyokrOb+MVj79k?=
 =?us-ascii?Q?qrjajbDXl/19rjrXUiW6lATqBSije0n3kTYi4dA9ltyFhqguNYEhbYeUXiyU?=
 =?us-ascii?Q?dJjW8Ai/AnjKSspGI1u3evYF1YCa/KarPBSX8gcpvx5zUcyF?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd3fea7-02cd-4c1c-d903-08df03c35845
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 22:42:44.5635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jA9ZFYLhGi9Skge93ni9tZxC+BGCTiHosJNCdTl3m/ew5z8IIgWEZEy+StFa7xdTLvlhb/AS//I/3lOLfHoy0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB2896

In print_cpu(), rq->curr is dereferenced locklessly to print the current
task's PID via task_pid_nr(rq->curr).

While accessing /sys/kernel/debug/sched/debug is inherently best-effort
only; rq->curr is indeed expected to change dynamically while
print_cpu() is executing. However, if the task currently running on the
CPU exits concurrently and its reference count drops to zero,
put_task_struct() calls call_rcu() to schedule
__put_task_struct_rcu_cb(). Because print_cpu() does not hold the RCU
read lock while dereferencing rq->curr, an RCU grace period can complete
concurrently and free the task structure via free_task(), creating a
potential use-after-free race condition.

Resolve this by reading rq->curr using rcu_dereference(rq->curr) inside an
RCU read-side critical section. Holding the RCU read lock delays the
invocation of __put_task_struct_rcu_cb() until after rcu_read_unlock(),
ensuring that the struct task_struct memory remains valid while being
accessed.

Fixes: 02968ccf7b80 ("sched: add /proc/sched_debug file")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index b8be86bf8849..2949e6ce753d 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1210,7 +1210,10 @@ do {									\
 	P(nr_switches);
 	P(nr_uninterruptible);
 	PN(next_balance);
-	SEQ_printf(m, "  .%-30s: %ld\n", "curr->pid", (long)(task_pid_nr(rq->curr)));
+	rcu_read_lock();
+	SEQ_printf(m, "  .%-30s: %ld\n", "curr->pid",
+		   (long)(task_pid_nr(rcu_dereference(rq->curr))));
+	rcu_read_unlock();
 	PN(clock);
 	PN(clock_task);
 #undef P
-- 
2.55.0

