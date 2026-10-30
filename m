Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793324326;
	b=4JA2tYi3MNJgFTWd7EhOlXFsxanFNV6/qJ9tpBN/Q1tdwv+b/uhS9tBcyZs2oDo1emYk
	 CycHg13LQuo7mZpyHD4bA8zXU33v+Lcih8bb7p6huizzBcpLznTRuDKpB1gSXDOQT29gI
	 njZU09AtGQqaIIja6cwC0Khg7GGEZdm9SWnCCu0IqvblExfWmjuKs8LoGDEzFQZNI1+1o
	 GttK38d9BROzodDzRcG2/Nluv7yVPQxT1iXdE+toMRaFVYK2MKP0AJldnLecTnODHjLNS
	 T7VAkE8v/DMRr2Cd3w3jyQQJF8/hmaRB2kukrNRrOQSYDB13bbVwkFj1NA7GSNjtoJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324326;
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
	bh=7qT/hVGgUYbHKSpmS//528fK0tVsQfH8L0vOg0VOQGo=;
	b=FuGDxTeZrZIkjduhdLSzVMrdXg1If71PxbpjRazzPqQ7/JltBZ9YuO129r8r/HfaKtv4
	 3D7cCNa442UYyrGT42NWnSgTdervC42KryhvA9Q5iKh2xgvFJoq3fPZTOMJVBC4XsQ+8L
	 yHNek6cGD/iKzteXXM7fEQZ40KducTJPqD5FRVM5JaZ5/gUQB3ykJQdiwTjFgEyjBEuJT
	 O4Cp8FeIG7WE3wCM1CFVBkudE+twfuJ1RCVGRw0NLYnLP9E6P4ER+ToSBtpM/p89OaNKC
	 LaBiKL7vWHYFkPSn+wvDS1+pwU5GZuwYLMtzBLEVfnNWRO9W5TRUJ7uIa3WIACaywVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.72
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020072.outbound.protection.outlook.com [52.101.195.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E119606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E119606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqEoFelnKlSlMDPsZrz4oLnb/bCTK+a+O7HKCCkf1mt2r07WkrprCmwCiA2xhCykUgpLLyfd9QC+d8QjW8iJcTiJacAiNFNQeEXatbDNlZFjDL3Fhln/7cNWKxvxu+iN0rMDL0DNenb6PYAQ9M5qLLWPa4IE8rBMOdzXOWXC1x0OCwmrBT3pSjWJ94LJh9c8fHZG6ucsXjZyMLc2nEc4NyuE/LcQq2FEr94ullUugEvqUDXwsg8vJ4uGBFeWz9pJV/Bkzt3houWpLROIguUEIYl2YmIVweSMcvpAw1ouc2ObWyV9Bb7IcJ3oC1BbpVxmh4SSA3hMF8peHns9yuiFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=7qT/hVGgUYbHKSpmS//528fK0tVsQfH8L0vOg0VOQGo=;
 b=v9qBOqdeZwTv+M/daR8w6p/NlMQnU3mYI0AN+tR1AuF+PmchueYLLkd4V6QfURvdtkt7NvugKV4AApRo47JEN+MCD8wK1hSnWclbAcFhz0QCk5yZ6WyIjHu05Xr1Sv1Cog2BxxVZGSN0Uw2isaPgThSArXsFkK9DAh/Jyjw1OwpzknGm6NVzeBfxL0JkQt/cZTIUUjXRQpnFAqCpjdJvx9u56rXUANebemYwMHsoElBVm1+E2rXLh4ULaJMNdzuW11NjJnbgqo4m89bOHj8gWcp8m+loNxYbKtmEJMz/SW+G7sBmIck5FGBv4VnU1rXwmlzzz7GejEuuSy0tbS6qJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6323.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 01:38:43 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 01:38:43 +0000
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
Subject: [PATCH v10 tip/sched/core 6/6] sched/debug: Introduce per-CPU debugfs files
Date: Thu, 29 Oct 2026 21:38:17 -0400
Message-ID: <20261030013817.753804-7-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030013817.753804-1-atomlin@atomlin.com>
References: <20261030013817.753804-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0503.namprd03.prod.outlook.com
 (2603:10b6:408:130::28) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: ce7dd1f0-b8ca-4265-0099-08df36268829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|5023799004|56012099006|261009223027099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	iz16TEHvFKMPh0e0HpMXabrR0qy5iDxvEGldau0SSd9hnRUF2O2ac2C79jbB7YYsSPg+Y4vWBAiyCkRgOEP9FoK5RD4tBRJIKM6itbMZ9G8I50d/PV8W/GpOBa736Q2U+e0J2i1ZKcT3K+FqSEfJhbCnUKKg8rA7NSYEsr8Nr8iDK7H4oJP9Z/KwjQQ8tBYPfd1tNIqvQHxmZbKHs+5I44CEOhgzyCgWczdekyjiZht23AAr06Ya4VP4O763sHM1LRyMgOGmTJsE1APb6h+hLj2V1uneHrtnU0efchSlCgtaZIbjcIXpej5v6Ndc3gyY1ZCEhV36x1wu1WlHhUDpe1ctGJeqtLBaSkHaZ9CZRqarUNtLEwk6Y1fj2LMav2ZzqkJCGFBTb3527pkcLpkpDPewx/ydTb6s+mOhf0yqjiRv2QqhVloe8MG6u8Y2+zJ67DgRGkMehlrl9gFhrcfh30+HSGejcyjdBrvgFkTL+o07APWY8W07yClugh3iHbPHIbOBq2E3StJVEfZQc3nJwe+xBR2a7K59QD3k+z02A70/vSy/Zh6+iG+XYxjEhbXSFU6tBs8srHwn2+imdQItr/yhKpcJBGvkX7DK9zgmwtq3qz9KsmGoYqxyke+Ubz20/VlE4YK17Al6AfdMNVwwQ9OSj/F44os47HO9TCe6eaA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(5023799004)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DHjIgDvAO/3Kpk+T3yYsF6GGZD6pjEOnz2SrBdoAzSZzlrLRXbjhpTwgxG7p?=
 =?us-ascii?Q?0RrXpewBTOWp59THNuv8utXnKAkV1uPILVFlSrly5jPb4SpkDVUc5Y5JQu1a?=
 =?us-ascii?Q?Khmw1PIiVrvNOsncP6Qz+LURGf6+xuhGojPyWqeOA7eNKWXCe645/Ch9EJ+q?=
 =?us-ascii?Q?pG0xLyLqjXreahvt3HqMVpJ7MmgAPeWkCNitTYMBrN8y53muXa47R9oagmW0?=
 =?us-ascii?Q?mzuv+cHtTPlrrH7NdnHLgoawCZvjIkr4Ctyfqh06AgeXT3O9Oxa3lnW6dfwj?=
 =?us-ascii?Q?2aEmnDXX62grfbyr/eiCo81jVQBWn0lueubqCfntPAi42RDLUxTF9s+PR/7n?=
 =?us-ascii?Q?KD2u9g7PUCLUC9SbZB8fJfo1MWcvO8tzni6TauacRD2cBVscZMTQWqXqSUWA?=
 =?us-ascii?Q?3PCUjbrhCkan5tN+2dE4l97bXhBgBF74zsQQtGGL2jas36jH47C1BbgLhRRd?=
 =?us-ascii?Q?OR3gfIjUvDW7BZQJUWXfFp2I+kxhjZ4rcT4GYEsgr5MP4TSAWV/1cXLr6ox2?=
 =?us-ascii?Q?lVQMWm1S0TWZ4FafazRjqJYCnRnGBJzf3Eycj6HKMJsr3V8hrEPfIfjg764m?=
 =?us-ascii?Q?9UtzMz9356P65g1XzRBreh8xcXJoQ+cnnHwjufJyugasVRWD1HmlWUeto1oJ?=
 =?us-ascii?Q?J9d9N+SMC5U6GCkYKuXT7auUyzh3SY51XtfFzVABSNOyLmU8JDY4Fi2AY/En?=
 =?us-ascii?Q?S4qjnzKmCx83kHUayxi7zOBxti6q1/jGiJIKS3DaY5RmK0HREp3ZtCzkdD2s?=
 =?us-ascii?Q?UA5ANcjQq72V1oDmT5Iw04j/hA0edcOIMDiCeCapDxebVtzKK4JHuT09txKj?=
 =?us-ascii?Q?15r6303NV1FKUMQ9oaXS1VcO3V1hNJugKTQd3rYJzROs4+Grgq2X9EbIdNk1?=
 =?us-ascii?Q?haXKdKT+YFy2oUiSg3QBKV8DowdDnmxvEHoz2LotGHQZpHO8hCyafC+12SMX?=
 =?us-ascii?Q?akNqHEksa+7URE+/JvT5SZQR+SiaOk5k/l690JoF2VYEHJucyn/uztAPoEjn?=
 =?us-ascii?Q?R97cZQojjokOjxpiUaP00oKKXYgju3UA50T3EB8OGvnj4+zFWrGZO+bq9u1S?=
 =?us-ascii?Q?8Lo94SiGBDF75SokdrdXcBb3JrjGjPuSC0u1zSaUEcDmh3lpb9p9VTNMBS+L?=
 =?us-ascii?Q?gt+O3siBj5ph7gNndCrApHvlB+DcgGC2oMEzDdoU6heRAJduoQMyZAGidzUh?=
 =?us-ascii?Q?mF3q3nnCQ13Z8avUv+YaXpz6QZtPR0G3lFVlU+0PJXwO4ra43OvPib/cOXLK?=
 =?us-ascii?Q?AqVopNI9XhTIuZqSrvj4uwdQy8WlMHKJv6wFpWPCXQI3jiTXOP8InIfEVF/P?=
 =?us-ascii?Q?PsIdGU2e+VyT7Dy53AqyZm7aP0XGSQ4vKcHswTHxZSn3N4EMo+qM9Dc+UcDR?=
 =?us-ascii?Q?NJAHA3rh+Ovemy7wM+TkA84W71o+ldXYqvfiRkekyYEUnrAcxci+6AnNdXPK?=
 =?us-ascii?Q?LnFvilfLl4X8jmuMM0AKZJGyBEMrtxszFPmpoaNWQxKyg2LYjQgOEy/MkHpP?=
 =?us-ascii?Q?g0hbCo71q9qrzh67I0nQBXXqduHhlYOfjrDPxC9KNqBpEeI7GsU3FJsANlup?=
 =?us-ascii?Q?fC+OEf6LBsBjPWoebCIjjg6S7r+kIHIgvqO/KyiklDdpN2HyEljpJiq7nZgo?=
 =?us-ascii?Q?Ny6s2jHHTXOYGr0nbiAzoN1KrZVMIvTF7e3dtU9VFTD5LZ2isBeKMN9xL2Km?=
 =?us-ascii?Q?RLFa1huDDuUZFnSRmYn9kWbSBpPUVa05mkhRIWmLcHWf3l3RqQn6d/Wrh7Os?=
 =?us-ascii?Q?qKKjd3yv6w=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7dd1f0-b8ca-4265-0099-08df36268829
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 01:38:43.2648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbirJbzQSoA73xhOuChH0ObK0d9m5RLH6KV9ZPM7AeKGBYBUjZu2+eDCF+Jw08jIIMajk1NbPxI6yyk/FwQqvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6323

Currently, accessing scheduler debugging details for a specific CPU
requires reading /sys/kernel/debug/sched/debug, which outputs
information for all online CPUs. When investigating a latency anomaly or
scheduling issue isolated to a specific CPU, accessing
/sys/kernel/debug/sched/cpu/cpu<N>/debug provides an immediate, targeted
view of that runqueue.

Add support for per-CPU debug files under:
/sys/kernel/debug/sched/cpu/cpu<N>/debug. Reading
/sys/kernel/debug/sched/cpu/cpu<N>/debug calls print_cpu() specifically
for CPU <N>, exposing CPU-specific runqueue details on demand. If the
target CPU is currently offline, reading its file returns -ENODEV.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index b29159513e2a..ac4971cfbfbe 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -339,6 +339,7 @@ static const struct file_operations sched_verbose_fops = {
 };
 
 static const struct seq_operations sched_debug_sops;
+static void print_cpu(struct seq_file *m, int cpu);
 
 static int sched_debug_open(struct inode *inode, struct file *filp)
 {
@@ -692,6 +693,47 @@ static const struct file_operations sched_cgroup_fops = {
 };
 #endif
 
+static int sched_debug_cpu_show(struct seq_file *m, void *v)
+{
+	unsigned long cpu = (unsigned long) m->private;
+
+	if (!cpu_online(cpu))
+		return -ENODEV;
+
+	print_cpu(m, cpu);
+	return 0;
+}
+
+static int sched_debug_cpu_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, sched_debug_cpu_show, inode->i_private);
+}
+
+static const struct file_operations sched_debug_cpu_fops = {
+	.open		= sched_debug_cpu_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static __init void debugfs_cpu_init(void)
+{
+	struct dentry *d_cpu_dir;
+	unsigned long cpu;
+	char buf[16];
+
+	d_cpu_dir = debugfs_create_dir("cpu", debugfs_sched);
+
+	for_each_possible_cpu(cpu) {
+		struct dentry *d_cpu;
+
+		snprintf(buf, sizeof(buf), "cpu%lu", cpu);
+		d_cpu = debugfs_create_dir(buf, d_cpu_dir);
+
+		debugfs_create_file("debug", 0444, d_cpu, (void *) cpu, &sched_debug_cpu_fops);
+	}
+}
+
 static __init int sched_init_debug(void)
 {
 	struct dentry __maybe_unused *numa, *llc;
@@ -753,6 +795,7 @@ static __init int sched_init_debug(void)
 #ifdef CONFIG_SCHED_CLASS_EXT
 	debugfs_ext_server_init();
 #endif
+	debugfs_cpu_init();
 
 	return 0;
 }
-- 
2.55.0

