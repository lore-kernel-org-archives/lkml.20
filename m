Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022130.outbound.protection.outlook.com [52.101.101.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191723921C6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869123; cv=fail; b=ND0mm1PwVL1+HVJyrJ6NcFn7PVcEwIMkxvOcssTfohM5WxVeszyxUdC9WRT0eKrRMHv1AeXdv6K1bTXAWYeIIvX7qDJT0ZMTuh71QI0HvpRg/K73qw6OeOqd3UAOhyH5itKihqx3Cis82woqFPy8iZayegpztzRG7p0oXgEikYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869123; c=relaxed/simple;
	bh=J7pwT1edrOVUk/npmmI7+krU2MCAyo/qiiNK5NBCXNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SdScVyx5QFTxuqVtvViOn4YZhh4IAmCsHn+g6Js2pjU125kkckoDRyDeKcURkEqDP3aIUVmo9KYEcNutjma4p8IQyEKBMdRVDz5wYuR0awrP7MBzpWGX7ccqYtdfRXVW4z6sSA0trQmSt7dWavEboktXIuoZQx+QusPBW06qPzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MM8ZOJCwyZymeZK11AiL7vCTqFy5QspiZKK9+F7+8m9uovafshbf5LMmKgp+K155s0wkv96GSYVHEh45/jV7Slhpw7cd2p3qS5JlEklFjTrITyMNRPdepEgE8TXe2lTwwPucuLdZHSrRQN+1/fonga/g7OTNiFmkG0JiLXhnszBM3ugG9Exrz2jALLwltZUfBbfOYSiX7PYBOKO9HIUWNdZDcke2p7zDioonQ6d+Yf3R+DMpUWAZuc03wGmHMCP9jqEvfAnLKJudK5x7BrQvK26wo+09ErH0LXiQdbtQaC7cvXfVtfaj/qyoppkswTGHVtjtGhqVJFNy+2LMS8ik3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=rZ1aBVvW2tdu5aY4cnFprHRqoBAJnLIy8xFYAwiA1Vk=;
 b=hYpNDl5otNo1Iz+byP+GoDc/7gDaMe20JraiwQOFHU1Qeqwqpv63w+Dei68Ghhsw1t7Xrn1fQkmUzs+qkKkzA9IWaObYHslYbi/TOvwMsLpyokMpoNHspAJSC5gfRC5XGVsdqN8R5Bmd4CBEz3SmgEBHBHFoo9GLCEIvDYY0Zt+zErR66DPSFlL8JzweerRoE8m1i8G6m6N2jc2ruFqViedMSp/ViGSVeW1ANLGydbiz5Jhj5BGSvNdgedEzx2/m3OBG900ZGCeLwxYBjacf1Mm/gen9gNKfq1QGpsBGGPFT0Yl5f7BiyDWaRf/B5ZIDKU/TeWXmb9xKBHTarqRZQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB7095.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 22:18:19 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 22:18:19 +0000
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
Subject: [PATCH v9 6/6] sched/debug: Introduce per-CPU debugfs files
Date: Thu, 27 Aug 2026 18:18:08 -0400
Message-ID: <20260827221809.988394-7-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827221809.988394-1-atomlin@atomlin.com>
References: <20260827221809.988394-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7d27e4-b8d9-49ef-a785-08df0489194e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|56012099006|5023799004|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oX3QoN6gAPTxTSi1DV/lsbNIlcesV0ttNTeRJccVks7hBvcRvmTucmJLosG+buRFMEPz5GrK8uCnShwIRXvghwgYTDmYzcruxI0b8z70qv4EVM8xDdU+u7cJ5Bnh5ZxR329asI/2AEoFphoYVGDNDRQDXIAlLm+SPg+l11/VEWYxKT+HaviuHBfk4lFrDsdfVGclAzpXNxOQfe7ZqlnFIcfo9SlYxxH/+hI05ktWIoyDtDkbRA+ZP4aV83ffAXE7Golawn4HCBJmV2IoTnRj0urXfDmaU3VZi3JVfb6RHKuFuiN8HhjNCMHUtK3H+MXp+uUno8VDWiDCXrSkZnHBBHTAZZbWJmDdVFXUXBgAdUVV3cJ82qF8Ls79T7nQvAl63RtaxgYejgLjDXKwI1VQJoaWfIDS3wiUzydx6w98XNhYuqiRC1Hq3TPtObGAySKVqiAUv3a4pqmeHqVSJlGRqwkVkn28mAnW5UX5C1FRX3G56KAX03w1/ZeGAOZikvJIdjuu+RRC/pXTF0J/a0fhJa0itWle4lo8kJ8kVIGvrLdDAujKiSGi9qjZ/xLz7sKqvDN/5ARr1h9ASqnvszOa6NG1sYzJLSoY3ZuxMIkfPnqtNLyysujW0s2mwTyaNCljrf0IEJkNMKsJkcIAi8ATP59pJgu8fayZ6SRRdcSoLXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(5023799004)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HQJbKzXlQHb+si2Zuw6FVQ8ZsYtFplWXwMIuayLXpGFxQbOR5rmj95MjBWE8?=
 =?us-ascii?Q?vFdKzSKdSsJzfnYS31TJYxOkmedYa1ZqD2jB1XynOGrljrKv5zU9+KAL88Z/?=
 =?us-ascii?Q?IBZWPNm9YrdIcspvSYTMAuCQIxURjfpLwrkvYEEm+Qoxz3FD+PqSGLua/Q6w?=
 =?us-ascii?Q?Aae/SheI4Ab3QvDDHJxuLNwd5YyyjWFDrQEhfZabu9AXn4YcOwMU1ME94FUW?=
 =?us-ascii?Q?tNyjaS8zjptFqEbc/Ac4gc4LREqUFghkEji09l9M79+2lfsuQ+q8OWIfVYbJ?=
 =?us-ascii?Q?eQSe5bOq3i0KC/vTijal4OXqU/SHx65BgHv7c/5urzG4vI6i34jMJA2aQvkG?=
 =?us-ascii?Q?KDvmTsnh7o7JwJf5FL3pqdqLeCR1qRWncHUeR8OyNj0tzecaE/NTYCRCMHtL?=
 =?us-ascii?Q?6fBbtWpTI4vdOjArco05B5PF7W9+f1a1C+aB7wkQYbHt77DAefCbeZP6il/9?=
 =?us-ascii?Q?CFLv2cbf/7TlJy9aHgQbFNqvmL7CYWp804zubWCEunpejXXzRBiEUTUFW9At?=
 =?us-ascii?Q?IUAJIg/9kcNSSlZxKmbURE4pVgdLHlQOKVeqb8XpQbVVhfQCYnxv/Ad+6Q+E?=
 =?us-ascii?Q?xU9NcjcNrHDrwMAq2LCarST3Qiy1RGKH46H+N/e5OFrk0K8P7bzACb7erzCs?=
 =?us-ascii?Q?/LzbqvtlxYa2oxFoeV1GhxT/0oqqkeRfYi5QYgvlPsbFCImRCTNbfCA71Niv?=
 =?us-ascii?Q?bqJFM9kbWJaPCyFsQ+Jzx63wFPzr2bArqE2XpAE170cTzQX/i0crz/L6CDG3?=
 =?us-ascii?Q?UhG7YIo+ivLpKARcl5/GSzTpMXK19Bdk10xMB7f9El6upi2Wj1dN0ar6aY7C?=
 =?us-ascii?Q?+DTDhLvKURI8MDROs2RibM6uhMQ/Z+OUKy9LzypDziSdgsN6ketT+ESWEJK1?=
 =?us-ascii?Q?/wCLZdLq5vJUWm4nWQk0UhuI7m3XnicKQv3hcUWMNV1u3w1JLzruC6VL4rkp?=
 =?us-ascii?Q?uYRt4ZpicA4Iw9t4OsD+5G+Oa2nTWjx0aiYiRsSf/UKGDcujGodzveB+EfqA?=
 =?us-ascii?Q?DQGMR02VaVTSWv/LNnRZs7fO2Xlj4BTYcc43/QBR8ifUgUIu77MXjCgtnUs/?=
 =?us-ascii?Q?bTArkFZkiq4+0AnXFhJze0uE82ow6ncWjAOpUi5pv13RGI4BKPfdZMt9TRTZ?=
 =?us-ascii?Q?biLnXX+jLrbAmzeKXeVKwyu586maWYzg9iDa9LgVJz7e7o+wauhWcsSMlu4Y?=
 =?us-ascii?Q?Puw0kUryjp1Wr/8qp4PkgTDAzhcA6EStiYbzp+qF3fX7o8/LaX6/EN0g4hBf?=
 =?us-ascii?Q?m+XU0AkmlQMhfk6e0BXUIMZEtoBY1vD70C+h5TGz2VKCyHskmZM5y2RtEYgM?=
 =?us-ascii?Q?iYFA2qiyE6ijivHVxcoZYG9/6g0lk2GBumKj+qasxGHovbR61zqEnfmU9xLY?=
 =?us-ascii?Q?TX04bBhGfYZIQrawsFj/sxihH0TrM0q0ffORdiDUPCfh8+ygM22yLrlpLuqQ?=
 =?us-ascii?Q?YbtZE+x1r39qK0/NkArp1jv83QRWPlpyc1neqxY0WbBP3z0pEI9yK1oqNIcE?=
 =?us-ascii?Q?5bLYl4CjuNkeTZcuLShAx5A4Ixfxh3rgn0NxSqgxq/cF6/XPLuW4e/P3RT3W?=
 =?us-ascii?Q?3wnAhW3l2WS5NiDOTudfhkt5GssEobWYlaFAmgX5Q9CfkVmcezWi/jiwUS9V?=
 =?us-ascii?Q?Bc3mkxtxtg5f50mKoNf9/AVXOK22aGp1+GuDWQFjjce7x+NppqDWijGY25Fz?=
 =?us-ascii?Q?CYXD29tmkT9irt9L3Dpg/VgKElfLQmjbEnZp2OFHN7R/aPKa?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7d27e4-b8d9-49ef-a785-08df0489194e
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 22:18:19.2873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWNS3iFglDZZYgyscxR5sv/hJU7mW7VXTC0TUdGvTlT4bnczATTsCVF1yt7paNT7DXGytK3Q1T6l0aH3V+N3jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7095

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
index ffc55b89801a..0c1122007543 100644
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

