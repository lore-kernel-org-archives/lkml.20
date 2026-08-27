Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020079.outbound.protection.outlook.com [52.101.195.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11EC4C6EF7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787859641; cv=fail; b=r5BXyyRxPl3HG2lRSTgVgrx+gbRgRD1avoknyXGaASRDn8UzQX4LwrzkCuCRUoNc2k2eFky+702X88sxdgJ14lxbMdVn4ALevIovZweMoeZehq4/BfLdh2dLAXYNQTM8PB+cSUfuUXAqIFo2VRe3HMylVjvc6j9WxdSoTrxjWbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787859641; c=relaxed/simple;
	bh=J7pwT1edrOVUk/npmmI7+krU2MCAyo/qiiNK5NBCXNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=si7LQwBSX/uHhCYd8ioDG/gCRvQCC1WZWTZsWueKI3mH9aSNKvDHvbVdXGcTi5JcVSVl1O6MKBRPCMPlzJNTZJUsIc+aCH51Cn/f1Wtbcjq7+NyhjEkQlz3QWYvgu3j340ABtYUA4pACxhXMtWtQqhOrckoN48sxce6gBaUkDVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBTOfdzQwsqI3BiChaMH/nqGY/peXpz1E9Q2zrt2LhgKJfw7fNMw/iXuGpe3RcRdrlJUuh4WLZkkDQcXOeKUqIdHBgXfPsKpv1zZDfGRBW8vDyiWacwBb+ETdqRxFg32bBVNq32gopkhHeOKQ9sQvisgFRKUIvhH8UshUgZnWWRfJjjqMADi+1lKoFQrP61vQgd40sRhcSkgO5a4/JfRXZuFQ96lbv9YnLOwscASpRK7Ggw9vGAmYWpG7VvK8qMYjg4u7ni8mC+XblHvFWHgAl+nXdu5FsLm9Bo8a+95wE1aKtsEvb1QPsxEA1LIBRXugQmfE9wTg33MT1aCY0g02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=rZ1aBVvW2tdu5aY4cnFprHRqoBAJnLIy8xFYAwiA1Vk=;
 b=bH+FOQCdr7QpLweA2MI9b9TBjn2iWo/5O8D7qWmmSIJdevVThP5x6GEA1VOqM1kTI8PjU0ZvW9qHcRa8gsEZGEKsdYxYZS5+kj4NS7R2JGWcVM09knt214d5+lYBqRLFODR/dQxLVbjzYxD0cKknCWd8LXmr45hdrhlrvnpGrjlOr79Iqab7v8euX7ogaJgglXtTKc+b9hzXxwW3q6VPr1S3MfKU8LD+ikZazVSh8843KThDCoDTeopZrclbTGCcSx4balarMyt0bKaGa78uhYFnOIN7zBrXW+Epnac3J0jK0JL0+qb6YJcK9n/xvydBVklUgiIZE76VnOQhzRt4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CW1P123MB7744.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:247::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 19:40:24 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 19:40:24 +0000
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
Subject: [PATCH v8 6/6] sched/debug: Introduce per-CPU debugfs files
Date: Thu, 27 Aug 2026 15:40:14 -0400
Message-ID: <20260827194014.977758-7-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827194014.977758-1-atomlin@atomlin.com>
References: <20260827194014.977758-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0488.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::13) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CW1P123MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: ce471f39-617b-4d14-20f4-08df047309ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|3023799007|10067099003|56012099006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WtiudSdmblJXXZRn/FuBpGcdDzzljUHj6DZV/TSaw5Fh65gpQ8NDu8PJjlHCsy2CSOiuLhp+ajEHO0RjiAd9mOEAOds9nrhKkqPplNLtIDi3TV43UegopVeReyAKqD6+mVdmz9Pvbjw0A/C8tpsnhSpO7qrVILSfuBmHGTRLkr6l7syqkgjW9m8OZuvsQl42s2acSoscTFAq0FRFNP2UEEcKEC8vBiE7A6TZbTUsvI8dbcie6XbwEmcFclhNTANzCOcHw3WdSOXuml77TZZTRV+nUXUONzzb7j4A0wpNJIJ+Q1T3n8zRqyHJE3TC2ctZEsKLu6K1bAuTLIuAUWCtBUVyPlTUJ9ZBmFeN6h3U6mC8zujK2hGPqi+8NzXT2wVtWV6hR65rEx3Wrt3aj6zBDofK7idEuQ+zWLMORJlHMBD17pL3TUQMBf9DgqphNIPjPrLNeryU4AuJtsYPbC5Q+rrrRw9rHzZHR554o+CoqUzJLMe9xrip/sOQ9Zmjd9J1c/HfhTPVeS7qfWaEZ6KWVSmUR0Osn7VJM8p4HvpqN4aZZrH5QuCOn10aRqB5IxW3tPmf2C/2pcH8rpA46XZz8+soxHWhQUW9iUXodFR+OFc/d0Hoqf7HdVDm0fnCCX83tCsbLmo6zq99V4q+iGln7tFakgp7A1cQ829IY2o3yH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(3023799007)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VAND8T1o+X0kSE9XcjKMjWEDJNVQZF/MHgF/zF1L1kSpMHywMPu1Sww/Cyoq?=
 =?us-ascii?Q?m/mUU4t7kTGRjWjr22S784zy71xo1CLW18BPZm/qHDkGUL2KRbduB93KsyU2?=
 =?us-ascii?Q?0A/uKgSbFEc5w2GrYfBWgxrY/yXKeHqtzqV7Fcf2u9PfE9+/9qPavCYv1aL8?=
 =?us-ascii?Q?dRkcfVZGGAG5dqOY1aGvdMWeT9gSj0PXFvbvgkCBiXvAJ8OTD8DbqbVoDl2+?=
 =?us-ascii?Q?tqxVCQEGpAuMOBdYJsnrwkC3qcq+QU4Iam+cUz50elv8RHP1m1LCMWb7AZLT?=
 =?us-ascii?Q?t5K4N01fn8EWVrlngfAMvXY6MCDzBQGTYrnv12jmaOpIY+LCvw0j2DMXdvZR?=
 =?us-ascii?Q?gslGxeEXD5eifaO4pm05UWZMWwB+ngmHX6orKYdDFFVe/aYmy6ZAKyhii/35?=
 =?us-ascii?Q?Xez7ju0DgBZ2/pqD6zoffG63A+lLrrqyRb/QcNaGkmkT9GLWibxK1lduqoIi?=
 =?us-ascii?Q?cXj/cM5hjZ8c6Ay+I5h99A8sQ615P8C3s6dVjjCshWlL7mSjIfUxK8nZc7hh?=
 =?us-ascii?Q?bWGOg98/wyMMIQKfvbHbTPsZ2+jXkrDTzkKGLjCPxupnSIMClo2CQO803iqR?=
 =?us-ascii?Q?MMecwvDH2fjk4JTGxdsEC+RU7bW64kbTWWPJ+HkIT+ZWPQuqihOcZNO7C0vl?=
 =?us-ascii?Q?75VQL1czxlg+55aPM47vF+9dDLfmT+QR5Sba9gt0rvapmIpS8CM/7eH9ZTZw?=
 =?us-ascii?Q?l8X/EIex98sV40//rKP6MUQYuxqNmQCgssOjgXTQx1WbkYXTVjmqH5PhvK1s?=
 =?us-ascii?Q?tCJ9uNG3Hj0iLTOREFP1319TpHeA03KNBTA30GsZJI33vVbe1pUpGYIfFxXe?=
 =?us-ascii?Q?ETtrKHsG52EVkMrDzzLRuJTvPjpvO8MYynvZaoHgnSdxHcLjD3BoZmmcAtyf?=
 =?us-ascii?Q?wdxUjVVv+f46xk1eKvYTiMzCR33pPZB0AJBuo85zzItOF5LZ2uuUdoLJgW2j?=
 =?us-ascii?Q?dBGpXSyT9DFKVA4Nit6PXb16zkqstr80t4W6iLBSlP+qmaEIbGGAAAGVHMQx?=
 =?us-ascii?Q?sm4jWYgIfCX6n72Ky1G5WiY5ywZCDWkx33wnss+VQhhSMLO0fTJBm2oE7UWN?=
 =?us-ascii?Q?fxc5nR3FAVa5hXH7HDwSTZGXN0UUCUeA+wXYj+zTWVZBLZzWes6g7AAd5avD?=
 =?us-ascii?Q?oUNL1Cm8A6iYSIUBtghyw9rP7Ldn4FaJq6K+M+AkWtWh2zf++f7r9+sWoJwD?=
 =?us-ascii?Q?NPSdlu7+Og7SA31m91j6AXSjR0DFeE4LbgavAQxIo/SDwNgN1FGGLXDofFmQ?=
 =?us-ascii?Q?aFRrtb7HDsXIIEsqvsbN6eRPoWa6+eHabOZbS+5jvhkrz5YgWe0THLkx22FK?=
 =?us-ascii?Q?w8HSgsdCmQNw6lgihEtMhjkpSkBnCEyXL6y3vVmKoOUmcRGbucEudbq9Mjml?=
 =?us-ascii?Q?wLlQYVKnaKsmdI+rxu4Xww/t8R570K44+WKLnmH9EHIeqcxjExWsSF9ep8KS?=
 =?us-ascii?Q?xTfYDyfkczeRuIAJUD2iDlWbLpdt73Cpkict9XOkstVT/ilsMg6GBJuaOLIt?=
 =?us-ascii?Q?/7QqbFrjCp+BfYV88NBEDrxWQjivbbH0GYaKH3HA32j4odZ0RYTZUSV/RZCx?=
 =?us-ascii?Q?yz660pTvWTQ/ZZKTDWAEqoGozfksWqSXKnYvSEuhcPUmGw6rxI/VJv6H7T4K?=
 =?us-ascii?Q?EymqrSHskQPsh+veiRPV2TSBFGsUyYhoNQZd922gya0VDH4DwORQ0O5pKBko?=
 =?us-ascii?Q?YY5mwriIkrYdKtkh7OKUNbpJ68dlAfK6gqzSwNpP7LpKBwJz?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce471f39-617b-4d14-20f4-08df047309ec
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 19:40:24.4999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WITWhETpDixkxZxgvzB8Qig+tsiffdCRQ/YqXpFZvdJJuOU8VJyrgJt6z8Q5eCUGzci2kDr3d1hU/jSQg5m7Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB7744

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

