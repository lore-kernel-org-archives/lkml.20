Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.121
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793373220;
	b=bSULTZd2LjZ4/b/K/4+/7wvXzx4y6TBxsqOy492fAWDqws1ecbPRi7T37PICrGouje0e
	 xNCi7BNjR9z/tO7Of/9LLcDX4FIW2o+EFooj8vxXUWUIIK2wcnWKbcrtAeQQ0mBgjinM0
	 HAI75LKbes3uWCaix/IUQZ/YT1Je8hMcEOPb0JcByUoHu7LR+zjMnnswGoZCSSlwFljKO
	 mJUmzBDYS6YawNSayg8SG5IsZ4PhgFxSy9HUkHo+MQn9IPtZ31hAv/y7ybYsBkTOPsI4I
	 EZ4zvOhDIUBTpUdmCHQTm7cy397zIpnpSsa38/iJUr2XnieXNn8nbpRT8wkhmjPjWHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373220;
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
	b=YtUs1xtWCHe3nx7ogbrghGoonw8e1QeNKCJSlywuuU4LIJd4KBgY2zad0jIQ1pOHfqXb
	 qgiZdBFVy2lKEqz9DEwZKShiV1D9foe9ds28y+4BEChwJYzeqbdP4m9zst8ZYrX55ntRo
	 2BhF7qgNdRoujxp04S793K2lKcFUPNu0Mlcbn1DhgEbL5g7hVEYmDQfaHKAAaSsvcYTUL
	 SUoi2KA72Kyr18PI86SUvph/EHQapbd77Q9aBLXf/n+QcK4SATx+zX23/Tb/im+ha4Rue
	 IRdh5b8+r38xdXm1l8NrC9cTit8mpR2NNVHqZywJj3YPf60KJqRb0SN9j0J0qJluyzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.121
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022121.outbound.protection.outlook.com [52.101.101.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE860A2601
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ADE860A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXZttDYSgPwaEfpCH2bkyliXR4cn6KFg1Tl5UjWa/+nXjrrCJJXBjb7ELaXDtvDGqfLGFyBwNvppdIZpkt86Bp9QUjfYpz9aMxFZ5p3AQtUWzrSlBV8epLEF10u50JBTGqn4RCJq3NK3GQ/v7ImfYSCI7zhZPvE4nUZoUMx2JLRKWNu+yLGqdyHpDA4anDNQq332PJp2Cg6MrtZRg4EIdEex44h/2sfcCaXu8L9IZVriVdpM7dE3fPSlI+AU23cfRhqIIlly+WfggZIGjOfjlVdcR/xD7wxTELxn9NwPKCE4w/yiyDqDcf7hqGYBJLQTyKFE+r8lJlkfxqzkacFodw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=7qT/hVGgUYbHKSpmS//528fK0tVsQfH8L0vOg0VOQGo=;
 b=rFMMz84C6ulhuH9+HnnEaehaYMoLl2axL7kozMjqpj/lt/QGi02ruF3JDOJ5xDomAK8kaWD/Iyh7EqSCoM4qyXJv0oqW+6fpAzWe2eIndSI9hCIUaAbnIkxHUP8FoGYucjhHpJJGgoZ7KUSB2QABSzxbueu6CSQmyDT3A6GP1H0FQC3pRsxTgaRhG3WXsvKC7YM79wojXd1bjYrDVIoPe0XoSgdK5jg6xNKWMd5DkDrn45fyGEkxih5SjCwJgjn1onSDTsOx4T/ihVxEH0cl8tzKg6Nj6Mqesq9tt94iuHAjAOy3+3+ou9RirHivUb3VaFe/q+iWwKjDl3kfn4cvpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB6488.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 15:13:34 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 15:13:34 +0000
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
Subject: [PATCH v11 tip/sched/core 6/6] sched/debug: Introduce per-CPU debugfs files
Date: Fri, 30 Oct 2026 11:13:07 -0400
Message-ID: <20261030151307.768523-7-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030151307.768523-1-atomlin@atomlin.com>
References: <20261030151307.768523-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0011.namprd08.prod.outlook.com
 (2603:10b6:208:239::16) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 962ac6ae-eeb6-4b49-45de-08df36985d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|261028144727099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|10067099003|5023799004|3023799007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	pPLvZ2xU4fUrnAMn0VCHPCtqvtSH/dP99O2eTSvsHdMfBOq/GHMrM4yF5m4O6XawSRdy+s2ySn9JNFgNsDeRKHb9wl8riMU9TE9n92w76X2v7O1cOVlNQ8sJtwYe+9n7I5wNvCb2lqjHahWDOYZl8snoA0vIsDMkfGS2TV9//8zycw2qfQedGwupx+kYWFKiVOUcwEVgxDqnSgdD7h+XvRpe3PJTzcWrYJJcplhJun4rsHYBQRWrjff/zy8vBkg0iSSYpUH3sZN0khtddUfFSlugS9Po3jW82aDoSNdGgvHgLPwg/L0m8P0jhzi+ltwceT86FK/2NKc9gQ7KZv4Yl90oXQXTi7kkh+MfvteCNYjAq8ojp815hmgGMimkaPyRwcVv6kHwFpfTFWQ3/Yvru8jSk3LfnR7Z5hD1+Xcutle55eSD6m56l2fB1pD+fPLKvB2BFX6Hld8Px/VPwB/M0onk3gq66X7quBAgkFo15uWzCQw9pQATEW5Fm9TnAmR/fIqApr6fbKp4bp4Zpd8CoTC4JM3Y4ZNyfuo0hJo/tRpTwtuySYXia1Qx8yfci2uBrGfFRoAI80ER5yOnpqhsfogW99Buxe9edZcrYg8RbNdR7eK09B/rRq5F9RB82FNihVZ3V/zPVBJ1990HdggVr4UiHj8Gc69ULLuGMevAPq0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(261028144727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(10067099003)(5023799004)(3023799007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yE0A0r49fAUf1gO62exO9nfNAAQ9r8KLyPcLNdcesvFl7UnEWramjEM7CANY?=
 =?us-ascii?Q?WtT/E+ShvClTuYDc6tU7ha9vyyp7tLtU6+wtNCMrEjudNPIcv9Hr0hGoIYme?=
 =?us-ascii?Q?JDUf4dRw9rPzrX4KGdkRKS8Z1NuspA5jrt5In066V62MKKXETCZ/EfN/LjJs?=
 =?us-ascii?Q?kQmJHMmsP0PAHCZgqvLPPGrGIVpwLY4WUnUZ06eBgp3YHTpp1PhklqirI/AG?=
 =?us-ascii?Q?h6t5eJxeBB8sKVAxyeWJvLxPUvHC0T+GHpR+klp9soQ+YghjLWfNMKDGkLDV?=
 =?us-ascii?Q?w1Fxa02iqQ4XqESFH3Tlwu6WcBc5gaAlCK0/ADFx/MvHt+HBgerbfjnJqq4b?=
 =?us-ascii?Q?KQAblzkrYUAUjVzKeahEMYuoWfouuvOCgbhk6xhSjT0rB8Qsb6WQRtUgmNEd?=
 =?us-ascii?Q?klNMJhUHpkDLgDw5w6fRU7r2N/kI9dCan0RnXFaUeJCRfmX2M8gU6EKbgAK9?=
 =?us-ascii?Q?Rgl8Pp9O9BE2GqediMmqsKf2Y17kM4aF5KEXa4Z0VkU7O4fyJ917S7OCH2Zh?=
 =?us-ascii?Q?6xlE8FTlyjtzKULN8HC/t3Gauto+ZhpVlf0N0xGI2v/+Z3MpK1p+aWTYVjMO?=
 =?us-ascii?Q?al0cgkVTD2XkiskT2egWQ9cFGNVT3Ne6GyLxsl/R2q8qH8Vx60nJTSVG30m6?=
 =?us-ascii?Q?UZR71fKokwjd0fY/+MosL1ZztHG76dJUhZOFyb4Df1qA3pY69oxX1YZOx59B?=
 =?us-ascii?Q?QVttya10es7N6/RuSZcGVIKfd4ZpaSvDABK9J8pyGe4ov5Y+1u0ZRAr+8R6D?=
 =?us-ascii?Q?rrJSZMLU/FXK9/BXnrpu5g2W/Jy8V+js7r4NqfBL5jCA5T/iFHkDp0apmgIg?=
 =?us-ascii?Q?PpYZpEGhs3PLmMBAqQCsKfUsTVQcoh5K6ZwvArE7D1HodID8SjNJq45c8b8o?=
 =?us-ascii?Q?SpDtzFYH8isjQL9GOYIy7AvvByG3vPopkeht+F2xzMU69Kzvyo0qvR7lYoyu?=
 =?us-ascii?Q?8FUE2fDEvGrEKai5WY+gpHpZlynt97Yl4plACMu/oGWF/kEGf0vRNoNaeY75?=
 =?us-ascii?Q?5NOC94vrWIwxKUnmmRhvZVf0joB8TOjdc3g4edCmmOv0oOJVEPblXeoDdY/o?=
 =?us-ascii?Q?RZQ8E+ppx7eZew7KpRYHt24qDF3mZjswZsn79Ip6EvBrXSCO8tzKnlFaP4XX?=
 =?us-ascii?Q?k9EfocKUgXvmL7SzZltDeAaASuOZlQElBnA6PRmBVHX7Y4Bsmml5J8fX/sc/?=
 =?us-ascii?Q?b0cMpOW2vZypCHTf2zwsPeJySN0aVlFwtE3BTU2YLm3fy+voHmP6SXjBLTy9?=
 =?us-ascii?Q?JTHKzXhbN6zmW4KAISlp6kQqY0isp4n4jR/6bAj+ZP9YaRM2j7juqH2MvVn0?=
 =?us-ascii?Q?8umeOxqy8+ghhXz/6GzjZgBdwdwc9VWA3txZJ6B+m0JT9rqwalWI0N4orojJ?=
 =?us-ascii?Q?zzJMqQpv0sSmBIgksApwArBWnblFWDCt6j/akIDiPL8t8mdSfr2Kb/7uhzF2?=
 =?us-ascii?Q?br/rXqDuWNOvoyGq1QgKu67096WW0C1KUJe6EsASpIshbgtoayYtpBu5BLEt?=
 =?us-ascii?Q?jsCqJVeruXG14VsDvFR9qrx43OOX9ywWFD0C+R//wyFWR8qWX8BEFXMmuAVY?=
 =?us-ascii?Q?tkthwqXpFN+AZK4Nr5UFVFEj1IvBu2ZwXOetsF3kaq7fnEyBuDaQ2ncfDcoP?=
 =?us-ascii?Q?VJbnVrzjbISxRYuGDaNoUCDPFlu3ssdtaT1KSiCpEfOyE3q+iBu62Isp0fMK?=
 =?us-ascii?Q?Zn/wOh6IsBJOLh1HniqlX+oun+4f9uNT3WOt3lXxnGFZjcNcGpxyV91wqv2y?=
 =?us-ascii?Q?jI24z4rvog=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962ac6ae-eeb6-4b49-45de-08df36985d88
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:13:34.3684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3ngkrhdlH+doLRvohfoBajW98T9o4TNJLbwY42/gcG36KssTIvHIQBIatV1H9gerF2zkZ4/jhWPvcRlbuc41Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6488

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

