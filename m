Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022130.outbound.protection.outlook.com [52.101.101.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD9432D7F1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869106; cv=fail; b=DPxHpPdJp9UARr7vO+q9YGC1t8L8fxliPmAXjM8AwPRW/YmgBqTH5yPp3ObnI7/5ynbdrCxmpJnDSU05pSXIc0btAGP5nZiGgyG/Db61LY4P9+/US52VIdwBI04fzgNMlK8FRjb59XD4qAG3ioDzH9la0vzs2zFji4kEe8N5IP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869106; c=relaxed/simple;
	bh=EjWRLuMtddpGpEz0wwcKvBoRX/wKRrozMZJvimQ/Fmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q3Y9rTYItFpnRG6ioW2cQzoxHsWEQncBK2w4NlYbXQP1JDj4K6hzrnw8f87W4Wtvia+T20KcZGw0ldqRFABVdSy87q0SVHhflhnGQWqZPrwCAnPs7C6qlWGuv66Uncz7QlfjeAfmSOs0ayXmIf1UKCoX+DUUc933Z79Ubx49aVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzAFHyffu/VsYuMBAUXUJ5+sXc4/KgmkUJ36Yr6IesgePDDE2BHbkdoJicN7Sk0UubjV95NJzVOwg8BDVAAx1RzqcscS8UGzPEMskM+rj3xhlc5q06hG0gelxZdFInviXQkajA7bt678XlH6UKYbs02PCZemAUE2Azq0sALBmLcEVaxvVLEZbJeDfW9zkrFUV8cKjsme3CMpVZW8B9isrP4t7rbRruQl6vwv7urTOsoCDKyOdOpkidpQ4vvFXnL4euTlQAh5FiRhDF19rHo5T2gc2zlnFmtk0xplOHE+i3fijM1mPNMILZxtTQowU0YsyHYW/ZIF4ZFkiUkDX0lvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=N4L2lHhG5/Tgj/tMXo3AuwJe4R1m6EosDrnQHHDyi3c=;
 b=tAkuqRsKS1DiwZItq4GUB/XDwHD22zRstbxvOR/XxAhXpQzPeouLo0ub9jvsO0ueNWwrsEPN4oi6vC5fb/rXuQJkNN2OCnk6ZmglqO+6V/kx3on5Jc3LxohWBihlfhPQjNL4wlv7/FoKWMvi7ZjVP121JWjUNGqkOPOE3N94kXvDFhU/19C3W4fYJtuhuRrXfdJ2EjBemmCqd/XStxFM6VUBzOCB+eocgEshkfI/6StG2xJUDk1uKwQVccduzzNI89QDk4Lk9UuiQlCM4jch9VQocVNDp3g3OxFfJuY4pSrAYHFtnHCK7QQrk+B3qTFdIdfUDNddv8zArr78GJpBFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB7095.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 22:18:15 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 22:18:15 +0000
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
Subject: [PATCH v9 3/6] sched/debug: Protect lockless rq->curr access in print_cpu()
Date: Thu, 27 Aug 2026 18:18:05 -0400
Message-ID: <20260827221809.988394-4-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827221809.988394-1-atomlin@atomlin.com>
References: <20260827221809.988394-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::10) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b508c76-bb19-4236-b58c-08df048916dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9jRCnkNvDn0gHLV88+3I8tpTGOl/imjYKOPzrQ0GloHXy1MFnnlXKdeLVfA7QK6IupodckAbxHM+sdhwDCxvmbzXjis34mnEv3eIKJByLjpm+j+fq9G52ZAO/V06pNowtGzn9nS2JcMVai9W/yXKABSwAdhJqX15Xg0iCRiADPZp7C02bE13w577Cs/rO50aH6MrL7NKrQFyF3vcU63gJw07MojtlJko+tILuJeEqVtQU1pAZ9qz8j69CuowYOhW3/ZMEVaQnrB82kDAU8nL8TyLbenPHKhDecMPnMcbHo4KsJ25K0m+g3mDPqppSDnJtHI6CyBu/UKp/KQ78ux+wc7EfZahzp+e53oR2AsUWUxJLaeSW7GQOlpPQk9Jxxv4Xsx5Krs0rR4R6ec81OctrCoDn8LlulMEnyP2jS0gdR8tyhfrGULaPIboKe/TU42OncuqcIqFPMVsdiRSsfNXR34N7ms2FvyFPWKS4F0mGsKzps8v3dw7n2ud4iWCj2d8qkBUI0Zo/+jKe3kR+QDLaEL7dnQOJ1svAs+3Dj/gmXa9t/OC03pSDLl7nvZBSn3lHLMFBfCCAS5MZKHlxLL1R0WvilBKTos8W6WL/GH4wWd2HOux9owPWbKXO/Us46AJkXNPsZFxNXXofhACqjQUtNo21XgqPsUoZbdHzyxP8ZM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X1DrbFzTDGwa9RhMJGb/exK6U9QWV1WTwExdDKjBcrHlNqjIWhuh9a+nauc9?=
 =?us-ascii?Q?ZMLbGj+ZVpLeWyzExjpLmo4HTvufYhdGpFdE04XuShqnWKXx/PN2G9tbMawR?=
 =?us-ascii?Q?g/btB8FhaGxrkd3mtzyY/xZtQY3K8E5ulZhWYWbKAMwK1OOoStMKK/gR5AWr?=
 =?us-ascii?Q?40LM25QJFFD0+9GnfNwGdG7J+ox/N3NRGX9NFvd6dnMUgeddxVQws90scJH7?=
 =?us-ascii?Q?S5ffZiyi5vTt56A/QrdEnUzg6h9/x7uVwXT3iwQCBk0/EiFa/V7ZxUogKhXN?=
 =?us-ascii?Q?Uj7KJ4cwZgoZ8DAL6eRWnzhYz6Tiic7hGyfEZjgqVrQxtQkikrpZUXlKJlh3?=
 =?us-ascii?Q?uRinFxp8qPxgrG5+sIQ0BlnHNfPZ4a1cdBjBvgnAAcKIAZws6Dzn4IzO5XDq?=
 =?us-ascii?Q?AFVCXAIPAmiv562Yu0hcuPcYoDWTteqW9YjW0b5LW9ybco97RlAtpfZfCjk5?=
 =?us-ascii?Q?lTfD9ZC7wkBkT/9lTcivBIPograxYXYehrQLGyczPOBPd5/DaQIy9/5Z2XRM?=
 =?us-ascii?Q?4mgooGnyz3IO1shbShe3tjVlcdzItQDqu7gjQxeXqbgpDKDc3J/oNCPWu8+b?=
 =?us-ascii?Q?I/e6rQpLKKYO/tXmKnGpuMf0AQfbLEZcF7YyJnDEADof0tpUkW/X3bbWQa2Z?=
 =?us-ascii?Q?AO1jUJw0is8RScgkxizEsGo++SOHwQ0YnAlEkAKBFiHAjaF7Q0yuC6B/M8Zg?=
 =?us-ascii?Q?fsJ+JuS0y2O4TkKxmSkQLz+lsuCbIKvPivUX4lFyydD3PWD5tD71DhlKG7Y9?=
 =?us-ascii?Q?cI6FiFh9WoVdSg1lfcJF1GxMf2NoRj6MU/Xfsn7QyAZedc6IAbVM9J3LM/em?=
 =?us-ascii?Q?wVg47X/FESFfrTane1ayYmYPhQOizJkWaEG7N23Xq04vEdCHxQPVQBSFGowV?=
 =?us-ascii?Q?v/wOTOE3pgTRtcRL+J1DWKcViTkl5WhiO+dub7Nf/1jjny80hWrNa/4/1wz6?=
 =?us-ascii?Q?zZQFB56w4wTP2G2uyrvFNEHezp+5oP45EuYDko7k3AqUxY+jliCVC8SjhuaJ?=
 =?us-ascii?Q?1QxlbJUOqUPAIe2tQjz4lJHylfHwLZC39UKhR1oHEzO95/FmINe/mAfJwGzh?=
 =?us-ascii?Q?jUuI5aEvAMUGla5yUiN+NFF4GUKM/DH7Rrtjow6Ms3vhYlN+u2sF56Hhk1RY?=
 =?us-ascii?Q?YC1VSxncwleyslmcbIaY9dBRW6r9XEDPuYjShL0XD7T1u5d7a+uY5y2wgsJy?=
 =?us-ascii?Q?msoYQmLV3HbOdKYO9KHQMh8w/K565Fmgh0xjBZ1EHVC2B8SSvbrXjTTcfCz9?=
 =?us-ascii?Q?3HkLmIGCHKIjmjhvB7uHxd0nBdkYbPPwZUjENjPw+ZoDOJwEj8gIBPTPVXkx?=
 =?us-ascii?Q?2B+28wO6mcirfuvak12G2F8xqF8r4Nfh0bJnosK+pjPhvwm45nf7VSPJO00o?=
 =?us-ascii?Q?6Z5xu75gcl77ASOm3XhARFnYGSMMi62FwPbim1BKStqmcoWE6PKy+3L2+1tQ?=
 =?us-ascii?Q?k9wYqsCaJiT36PH8wNfwflzDiBfYcU3duzmiO8fwUAPEEBJxr7Y9Sft1ZrXM?=
 =?us-ascii?Q?wjvLYkvgHHk7rCvRZLjjdtvXKDn/VYO3rEjBDXyCX1L3NWX+HHFVlePr5Vrd?=
 =?us-ascii?Q?gOcNUvgRWzkpFmOVWvpLNe0akR6g7ZDXAJ6vvRyEQ75m1ATSEkRA+xFAEjwl?=
 =?us-ascii?Q?rOXh3/RKYRA8Jy9ybF4nI2i6tVZcCvrmIaravByD71yuLZk39SgSjzZPkLzk?=
 =?us-ascii?Q?iTBleGPKYORJRLRF+l+ZuQMajkEbbLFt0zJTN4aq5Jq8HWbj?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b508c76-bb19-4236-b58c-08df048916dd
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 22:18:15.1592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEh2VCgvJA/UNXwpCUwRyUlVymUwf1wIlpAjZOQO3PECikjPbO/MWtKlj+L1D3E53Bzc0CGgt4XrJquPfKoARw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7095

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
index 61932ef7ec4f..3d6248c50dad 100644
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

