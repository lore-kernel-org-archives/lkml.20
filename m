Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.90
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280361;
	b=fDEv258EmqYsc4hzBhZv8mYBp//p7Z69tx8NmIn2/qqR/q7JVg3K9k9+mPsA8E0sCgGt
	 YnGOkUbQkqzQyMo0GQaKrJVkvQ2Q3oEtmyLSV1MOzWFRZDDoUSh6OtvoWlsY8CcREWgTx
	 EdfGORGT540MuJC6sEEMFyNskm4ydSq0yjbjK1QEoF6huc5a5u6TYc3Jjs006M4gknoFg
	 QdeVN5qm8NCV2aTSU3rbWnYE9ZgoXKcBV1MojPqiZ7eewDBEQNRxZDVL1It2gZ6n4hDxu
	 HXIFX37FuAfFwMNIsSXsQ/Fe5H7CkjrbRDl+0Kxydg8NhAZN/tjcq/i+gQZJNHy+5Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280361;
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
	b=cf0Xr7KRcmvGzG1Lvs/5b7TFEwDcqdBHS4wSaR5wLg+V2SZHW8xCS7FALouJxRO4cR6Z
	 NGHH8nV16VY3g0Xbq2TMtIB7Bg1sd3LV84uHnp3wbX4+QqZ+iOwwYSU9QX8jnG3Q2bCJY
	 HxrGcDCm3ERZebhfXVTO1Ags+Gl3xsybYOV3DWIgsYtNq9LbGrGigk+1tP+wLFnokz+8+
	 USUe9NzZ3lGFRU/rb5leCCRRT168UpdvHd0rWhMDzPeK5h8bQ68QjSHuVgN28Y2GANsX9
	 g9dnLkjAwoszYWdzgvOPC4h0bdD1qpwY0OORI+Km7DgU+YxFJ+ku0WOXMIYj/+sSgMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.90
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020090.outbound.protection.outlook.com [52.101.195.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED7A606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED7A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIMr6OjuodRLcAVLZ1y6Vgpm6as6VMRNUzkABWlLzSDtR0Z0VSU3mLwgRzKt4jXW2bzdoXiygFjw17Wme5lL8bU8qMMW3/0KT4yRmDILaUgvD5IfdxcAzUAil4zVX+nYmS/W2WiIrvo251EEe3hntdbf/k40l/MWm7n7huSKZpmIryk7xWiKvhJZhB5O48L1XSYEvJAKhNSTXdHqtyURGnokEupK/RkHOF5QKERepUeEGHxgSkfmT5/96n5TtFVMGvLro0kvaSZW/6z1hRlDCJ3QpMwOOzPFE2x8tW0sKyFHis1X2xyS7AeSpYyDimX853Wwt87fwXY5r6kNDls7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=7qT/hVGgUYbHKSpmS//528fK0tVsQfH8L0vOg0VOQGo=;
 b=LXOxNakkxhnUFlnMJ9Oug/rTBvWKSpb7nl4amrSqWMKXGhBhiUsAFvnm54Bk74I+u73OsHZd7QFAwYeSKrs7/egBhAbQrYp/4XYGvoWVs0NGs1eyoKEsNlLjmxcf0yInjhXlOIcyn0XAzPN0EGkitAW7TNfCvMM2KLzmg0Tn65KzXda7q603USttN+/asVFTK0xw/jyWVDjxfj8/DcofUhhL7JnDkJz23DWMdhiMldID97uYvkxuCUvq+dPywp1zKMhJGg4k7DQpE98WO81xXrYP6S/wvB1Yes6F+ZAHTmY/eBKc/MZ7KB2MDac6j+9IersiBEpgO2tMqCdevdTXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO8P123MB7811.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:3d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:26:00 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:26:00 +0000
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
Subject: [RESEND PATCH v9 tip/sched/core 6/6] sched/debug: Introduce per-CPU debugfs files
Date: Thu, 29 Oct 2026 09:25:11 -0400
Message-ID: <20261029132511.712391-7-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029132511.712391-1-atomlin@atomlin.com>
References: <20261029132511.712391-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::27) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 6298d261-42ae-425e-f4b8-08df35c02c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|5023799004|56012099006|261009223027099003|261022075727099003|261028144727099003|261026140227099003|10067099003|261021121427099003|261022105027099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZWwoqCOCFs2cle5yFB5LoF90CZr/S9TEuXqpMw151jKDzw/umzwMXGSkcpRYhbaxEiCYaiLMNtd7R5Vghp3NdZGGPuiL62+lSyUgfvze5LIAmeZjX5wnKdYubiCc4htjiLJgdTP+jlAuuC9b4wY714sxuDRSvoki/S6OZAH0GOtSJKgrdOgXctUlW426MJjkBr1tKEycM/5KmFEei1lKBSKDi2xDzS5yaDhiXuwPBt6AHcNjDEJ+yBGLrfSVkmVZdqeV6NluMrDH2+pE5Nw5zq2Z3gzFogfxGBeYlSpC7jaWte1WJOR0tXtnsy5YIhCneoCAcEz9AKz96x/kgHrjZv7Zj07uiDEXCqnEzCYHN7gptMQys+s2jP2Wcewanr3OOeIzXvIb08Ltai78cNRV2s8TDKD6sjuD8lrzD2lttNgG/q33lESSVNE4Rm+UGi7+LytU5m7Hc6BUhGBKYApcaZRZ2nKbMa0sLCrQH3LrhQtaWB9UKKHN6/9/n7iLVvpIwK8SMhTdXZap35tP1gv+5GM9kJFuzNv+TWUiYiNAcxkZWVTh8dlXuuR+ffOGGKRE2EPobpwPlPKEMttjAUDr8N2H1sDT+q3WnjVdXnfJSS17ctWknPJiI9HLVfIxnhAPc+JxagUsL7YBDfrMftZOGA/OBP+u2rmayFo0Z0lwpy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(5023799004)(56012099006)(261009223027099003)(261022075727099003)(261028144727099003)(261026140227099003)(10067099003)(261021121427099003)(261022105027099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+gUM9XhhfZTCZeeqDm0t4XZnZ+UIMAXTHc0bW3tLu91Wop+jfnA6MMtAIlih?=
 =?us-ascii?Q?wgjoCouwkjJ7cVcL6/E7wz1a50qrtU2BrKF74l/OQ9NvXb5rlqlZvESPgElt?=
 =?us-ascii?Q?1KKlQpBr3F3sGU617c341Gi9A8M0ELscV/lW2YidZDKxpS3m251YVp7PyRvu?=
 =?us-ascii?Q?2stcNSd4ENtU7TxE9LhTJrb6X8oijRWl0b64aRPUHD+28ADXe2XJNayqXfiD?=
 =?us-ascii?Q?36PDAphXRBgWZC7ixYNguHx4YYFh/Tbpc6dQG/e2WwHubt6GTK+HTKZ26dbp?=
 =?us-ascii?Q?ef5LyNL1UsNeyFAKocAQ8mQT8iT1hFcZGF/aLpXzAC5KFsWCV5UJDmrHP1n0?=
 =?us-ascii?Q?vGT32E9Wy8WFKMMMqekYpOC/zD9FHj+qMiS2/Its3lgoQpNHp7T1dGgs5G6b?=
 =?us-ascii?Q?EEhVf966Hxkd+pXboiFKIaz42chW09SkRZUsQ3SRrsIYMEnBA0dXGFapgW8u?=
 =?us-ascii?Q?5GsXBe4gzbCCZm+nfOZ2H9RAytSpiHWeaDt3tFVurJ2FohMR3GpCQASC+JuQ?=
 =?us-ascii?Q?Q8cbSti3BC7PwYe26x7WWYK0Pqbi7kNl9lbbLK/0Ih0iiNd9zy/PBecSH8Q7?=
 =?us-ascii?Q?OIS+vGRIT5iUqUuLkEKVcVB6Fu+zhXzT7zp9n2zBh9ueMNx5ZoZ5OZwyAxyh?=
 =?us-ascii?Q?5UtZSVJ80FdVGLEnOauS5WumOKnhGzms51Qcomv/k/XtQeWjWT/vwfJ17nmC?=
 =?us-ascii?Q?/qyxxKF67OC778aPwtNM0jFrHQ6+rtFxm4QX/f0wt8nEfw1jyDoFNlY9w/9t?=
 =?us-ascii?Q?bWpVAC/qdi2SSk0D/R+lDSdVEuHzCeyaW1otsQfAPwe7yG4kqsmiWKcc9+/i?=
 =?us-ascii?Q?KNfn1kvMbx5N3rmU1m7WBGZvUONLwmIIRfjqkiv7ZsVzXGLs0d9mMyVCUrw9?=
 =?us-ascii?Q?wY9cgJRo/laGg0+sHzHnclnZsCavf8FkXGsfhXjNNuvPoRLHWXdjh5zJvq4T?=
 =?us-ascii?Q?BgpbVehUNvzWhxZK1WifKD111bsiO3OxHY808G/NVYWaORoS+nv84RdMzdY4?=
 =?us-ascii?Q?ByzrkYZwQFtN5kcy0F1pd9d1chsXErP091DPxhzWfvdupw2TUBkRV4C/jptO?=
 =?us-ascii?Q?IkbZ/7EzCXfldyfDJzymHO0yS+glvp6AVOijS0W+kkjdCfhcmvGJmL3ozFEl?=
 =?us-ascii?Q?wr0kIVUl7LIRpeq+jexzxSwFeLEsIvIbBLZ8b+OtO3k1kiUpZmt0qYW4SxmG?=
 =?us-ascii?Q?WHju4EcBFRp1daSOpYQCZk8LfznsZGevelJ1PznWaiaAJj6TUDr1QTWQVhjv?=
 =?us-ascii?Q?ubw3dV4BARZUDUSCs2cKeMHTZUvHpkLY18xr6tKAwDCVqWCdadjaq1HbAQTy?=
 =?us-ascii?Q?EvmmuTN6t+0k0qYwkj0YG43K0rUmSfbvq3VyFBRI8uWOixphhKlRcUHAMD3g?=
 =?us-ascii?Q?2eJteofDcBiT19E9IOo9RBwYiDzMYuTH31xgQz2l+ovSvRaFC+h526kobOtJ?=
 =?us-ascii?Q?5Dh2TrtsHgu2A4EmeEmXuX6ahpSQxawTAdhSmWXpKURVzkXUyYfPazA3/WjB?=
 =?us-ascii?Q?y9rZRKwqQazryYgLtknrsesSkEW59dRajOB37eLQO2jbyW5vBEIeuSfWFL4K?=
 =?us-ascii?Q?rFuNs0+/o2oREDFs++ok4akqDKs3h1HT7YFAF0gUJ+9AXCwJ60qMZyd4bH+E?=
 =?us-ascii?Q?taQOYiXJstjpDFvdfqRmCFbR0nwdrf5+4YRoxA8+55KlT/N1UUQwrB4YMGV4?=
 =?us-ascii?Q?cwpvrsooc1DL7ZXDHotXXkFlAGnl5PMc3+LLoYTtZGzCs5K2F2+0Wkc/8LNd?=
 =?us-ascii?Q?kx3KD6DFWA=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6298d261-42ae-425e-f4b8-08df35c02c1c
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:26:00.1526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6fnOA84doD3/mK1Iq5VucCiSDbq0l7QUpvCUJCFnqMSjUyDkhhpk/XLHjkzI+sEN9+ZwGyxcQQ87q1fxxACkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P123MB7811

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

