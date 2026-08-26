Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022122.outbound.protection.outlook.com [52.101.96.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597C8495028
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784175; cv=fail; b=uLkuHeA/cD8j0toQsg0lw5aznX2aS+pFNq2jjYZjrOYTypvAAr9ItteTsIiePBBl0BZuacy7GHh/QavDCuF6w0YKnqmmiHyfGM3VyLn6MWHH78ylaj1ZB+BS995E4le2e797pN6+rOZrBrTejRk4ioI8Q7kdCyIIndCKXkp2WDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784175; c=relaxed/simple;
	bh=bYChyL1EEXS8z4NdNcWvzhbQbozIYqmPSC3FYsbWxhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hRXu8u/OOav0sQU59xZIhkrF40Zj6Jkhabo6Fp22U1TjTar7EhalbPVyRmx+6OMmAPWXCW44BN5nx13j6VV5iL1rgqnFTxKN7bi8HYMkT4y7fy8I4yopiV/RDkWUmvNf2AM9mIlwVfdcBAROI3jOkTrjHFQTrmgHE5NUP3Z/EuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rD/8hLSJJCHNldx9EhEB+3DEr2v0Hyhxsbzbhzf4hgyoIhB37lqeUAhc+BikY9wUpnpl3y0A/twQpx6iBt+A3vCfO/JTwc2FaSPJYTT46ygO9CimfyOasTQqyqU6LJWoFZKWltfQ6vaScQ0bZ2d2Aw/Vp+0c0GzrVjv3kcn8bT1w+en1pTLZu72TRw1XaEhWDMfYTb12euFPdQfWp3PcqKJGYyh4KugekURyYA6IrPyCTD49zcV/2GXP4l7vpgaa0tJB/v0dA4YEWb/ooj/EVOo/njTKdF3dejxrtwWn5D7ffaVlviqcleGqWlORzVaE2NusuJgBTKmxw7cV+qPphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=8YO/K+uCFDFm+dQzpvNntelCS2/7Y787NdbN+4/KaOw=;
 b=qHmJSHH00hfNEhj5NJ38EvC8WdnYAN/QC6r3WpNN24EEbOP11N9PJHBjVl83NHNj4al2aicpg6RpFhqQ6in+DPkxSS86o7ETu6cwwl8u8Rr9az341AxrBKxREl0ssBMyDQOsdjMJDbdO4IS4e4vojdqiQZi73MHNc89c8uA7e1m65m+E7wi90LsWRqx45ltxyWzZUjeyAVOfF2XMD2LMBrrWI21GEtO5HIPPvqDVkrNS1/dwIDvXA0c1XTi6xdPTsmP/BJLaZZCImO2xzjsfhvTmSPA+tXH4xyQWVqY3I2d+4FuBIsaw0CbCPMu8mVikz++HBY8LFbBuKNd9frGKWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOYP123MB2896.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 22:42:48 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 22:42:48 +0000
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
Subject: [PATCH v7 6/6] sched/debug: Introduce per-CPU debugfs files
Date: Wed, 26 Aug 2026 18:42:38 -0400
Message-ID: <20260826224238.936456-7-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826224238.936456-1-atomlin@atomlin.com>
References: <20260826224238.936456-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0658.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::7) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOYP123MB2896:EE_
X-MS-Office365-Filtering-Correlation-Id: ed55bed5-debe-432d-7e6d-08df03c35ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|10067099003|3023799007|18002099003|22082099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	ZvjPLxEP9GE0RyxlguTp1rdoOk6CL9b5waRIic+vk8T8G5ovfsFmf/1MsLFI4SQKtw4375NdltKqqM7B6NlrJndxeGFpMzHDKWwK7prxw8npdm+qVNb+ohBW34GfRaJu7ywVljL+fD8rNjrL1VHWnSjNPT18C9K2tgUBZ9AZWzr7nHqZ0qULPZ/Vhtic6ARgeClZ+WcHCeqB44zwSphlwWPzttQm9NRMUDpZxlMlkXVh4dNmIuEDYPgVqbDcawo83WLNNKcvJOmUktHyawaBsMaWDHAPOy54XfzFaMvMK6zIsMJG1bQACf8OZo6JWwOt9U4fxU8zNzRr7E3DdbDWNCmHwobR3bXlX5GhdJHSuZ/FUHsrg5nbYI6r/1GT44T+NIz1KN7Oo8ikXBA6cPmFg1MYlqai1hZTA7+7i+Glx8Fh4zE+yhWb/f1crNscrwUp8yNjR7rtugyC/TgVEwsmfVzjarO8YcrZiROAfF4ZJIQQHnSRdTlQzFtzo0saYeGlZCNtqYTH38m7jeNDlywV99Ru3AI8UHVlsB4Fi05dzSoe8iQwAjmu8AMV/6ESLN6Z2nGPd6LcacKyHQUg3Sgt6gaIlOMgCiYKyb+3c/r+Dbra4Ia79fN0zKwVKBVS00IDkpzhC8VgvThqUbgon8sa9GYNZLr/b1Qjbi6ewufxPso=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YcrprTOnV3yth5kPbbhs9cC/Wp6lI8mmJ2jW1tNQGVeEXpUecjVP2YNXbOK7?=
 =?us-ascii?Q?ptFKJYyEtBIDBU0IpuwsE0SDirYiO72oFMqaUqTsxkaUE8+9Hb7J1LM3zNjh?=
 =?us-ascii?Q?TbTSj+ya1JK5vsCU4DNfjJuI8SniPraemiuFdxRSx+PiogBFu03vr+uz+O+W?=
 =?us-ascii?Q?Pg7R88esI5KG3t7dpCLdXrjr1gNMxDLkuct93bWtwn4EmBbHWbfm+o4uD8t3?=
 =?us-ascii?Q?iUapP7C62lCCa5N3+UwwCR5dLxP3t3zQn+wXtIkM3W5HLJjaFsUYuj5wbjrB?=
 =?us-ascii?Q?4Bd8sZ6auqmArTvK1wX95wRl5NCYGh4oonKCKc1QhV/i+vcRkkuz9ZfMog+P?=
 =?us-ascii?Q?c+zNUHjhJsblP7n3Mb7WikZh7VK3FYQkhIsOsAkPTyxZe110YXFRRIPCrHbO?=
 =?us-ascii?Q?jfzqFqYXl2QgZqzSzOUFdWDKiM6u4JiyjloZCAPgdjilDaRZPR9mqttJwy1o?=
 =?us-ascii?Q?stqKwgSlnZfj29QntFnkVJp2XVgZXIhLGkCesdHmiyA6BcHHCCjalSD4usu6?=
 =?us-ascii?Q?Y4HJf1qbT/a4RRNxj+N0vN+23WQqEHSCxvDN5r/9TkWqBExut49pfhPY/1ty?=
 =?us-ascii?Q?7yGM/V2StWCnPM7EtIgkh1YkDgsobwBT2wYvXWQzVAoZiKJ8xN+4xEH7G1eQ?=
 =?us-ascii?Q?ylT4Voc42HLdL19VXPnpnvlMvlGSwvuylNBdGPH+ABTPQFel3SnWtGLn8bGa?=
 =?us-ascii?Q?yHGbfYd8haGenDrl5Exx1KUMVMbVYb+2kSW/znxBWpRFV3CfryXXypOK1wbu?=
 =?us-ascii?Q?n/6Twevw4L08ycEt/Ejc8c1668fS8mJR+qScXPUcxKjf00JERR05iS8+ezMl?=
 =?us-ascii?Q?mZk9zdBCN5GAvd5on4xyYWhKKED7gAUoR/wyEK8Nf0vKc9oB0n4NfVTZs2jE?=
 =?us-ascii?Q?oTWHLIFGZB1gBGnZmHPXWgA30pGuDoo+wL7CngM6FazyVam28My0oOPmiyJL?=
 =?us-ascii?Q?kAYBnTuHnwPis4vXcK+EaUw9BLY1g7YPZH4XJQvRdGHPXcpgpzaCYdejTu4P?=
 =?us-ascii?Q?PJBFcrUQWNytUE0e2ALJcR2Nc+mlXYnKbNfjvk3MOqgzRfuOenpJtKVGCJc4?=
 =?us-ascii?Q?Ttj4c6tmtIGbX/WAc8Sb+90LXK97ivp/tdvcyWvR/deA06j+4QoLPvGCdlr3?=
 =?us-ascii?Q?EPYhCumJV7sIxRK76DHpYlVBDwRo3MKGSA6u1iCqZdbpMhRm9zrRAlh2d5bm?=
 =?us-ascii?Q?S+Th6G3eIRqqtME7f7Uz4lFbjGUru8UWI1anPO3qWj/how+u3ual7jiuIMFP?=
 =?us-ascii?Q?azW3Z6BTfd/aSrH6vJUZkz5j2WgEfPRTaytYRqtSp9r3fe+Ed2ySVDxyS/cD?=
 =?us-ascii?Q?oxLg5sFigF2vLBXaFWgQUcL8LgPmxxK6x6Y/hvZWnFelwEmCzwL76OaIsFoX?=
 =?us-ascii?Q?tVooeGlFWuqyC3FuNreinky7KWVNZd5nU+KfMIoDveMA4tQYBDtWhofK3IL+?=
 =?us-ascii?Q?/S46UHof99uMnHAghfmNZ3JuW5h25SW3uiemofin++AykScsolPUxjRqhTxX?=
 =?us-ascii?Q?oGOHnQw6uu6rejzWemP/7t0cKuZ00b+bFxXUa4BCOBqn87BAYsd02OnElh3c?=
 =?us-ascii?Q?qZgitETbEwK+MUDqNt46evc/im2oHjNHxHvIqUOOfjtNH65bX5gRrqbo4zn5?=
 =?us-ascii?Q?uOjlzGMoazRsZvoZ5Ut2ICm6DqziH/07UT0LUaGzfjaYjcpk6L1Mz1khf1Wr?=
 =?us-ascii?Q?shqJxz8EgkQR8pA0ThSW+IR+S51pTtSpfXc7RpMl1hN4Tpw1?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed55bed5-debe-432d-7e6d-08df03c35ab5
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 22:42:48.6457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOsBxxS/ql2H+WoFSj/tqkRAf7EZbn3TaMePUV7BMBqs4RnHJtEsfd13RoI6Df/pHX/Akq6M6EL8JV7H5uVpWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB2896

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
index de453342481c..d70387659ae8 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -345,6 +345,7 @@ static const struct file_operations sched_verbose_fops = {
 };
 
 static const struct seq_operations sched_debug_sops;
+static void print_cpu(struct seq_file *m, int cpu);
 
 static int sched_debug_open(struct inode *inode, struct file *filp)
 {
@@ -698,6 +699,47 @@ static const struct file_operations sched_cgroup_fops = {
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
@@ -759,6 +801,7 @@ static __init int sched_init_debug(void)
 #ifdef CONFIG_SCHED_CLASS_EXT
 	debugfs_ext_server_init();
 #endif
+	debugfs_cpu_init();
 
 	return 0;
 }
-- 
2.55.0

