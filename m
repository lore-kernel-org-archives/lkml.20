Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453038;
	b=17lQnNOmMp/Ed93dMzomvR49atKr6cSExtxvT8JGZbOfHNcBR37MB+xrWu4DQWxQ8W9R
	 AJ74+WrYEvY72lXEkgd+KN8k+lZbbIJDOaciH0IFDtVSSigUQhSwfAWFwMctPwxNbl/VZ
	 mJ96nDsx0KHvX+JNGfgyui/cOipxVmNS/7+5Ee4KtRkpVqTJlG38wnyl37ugyEAmuTdyP
	 LfZsnJ7ZMcbcPOpM3MjoWH2m+UuWT5wBlV3EFr/7LC+jGldGGsmpS/ZffR2oWZxQthJJp
	 nhMGka5ILbboen1isxRswefTpuLxHf8OvBjOQb373DQH9iXqxj+OKMP8dKzC2nOf28w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453038;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=LC4LR/ABY8pQCBM1xv/50ZFmkMGZ/KaYEvXMyKo45HY=;
	b=z4Bc9CCSiiN4P6iVA6yBGQBF7g9wzJGrqUa80BkWPP+b4Cd3v+zmd3oQxHOD7Uk2NbrL
	 2U8ve7vkwo/Q8O5tXHBYa5fwmpmX7fBvYav/7ghu9gXK/MYKtTrG1fs1wNY8jy39c0NTC
	 A0Kc3b8E1z1Yn3ZrwTadYXAqnrdxHMuxsnPlfCOC5PO4hulK9bcUwD0fHRQWDhUHJrNj1
	 1v/jtQfka04FAOEP0/gx/bDQ5SbMlM+azIKg3s6gY7PXnAfZ116We8gVOU+5ncbbKWJp8
	 /l6KF031ppiV13TgdNDmhqwP5o6tsN3EF3mnku9Q9ipn9d5SqK17i+1Q3PxmaGW+6yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=OGIgJNGK;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A9A606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A9A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=OGIgJNGK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794453038; x=1825989038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LC4LR/ABY8pQCBM1xv/50ZFmkMGZ/KaYEvXMyKo45HY=;
  b=OGIgJNGKeIh4KuPN6j3AXpxxsEKtDHakTajtC7XjFvhCd9KERN7S+C7b
   hoTaczeLSG42MHtJAKAY/HaZo1EODpVe2Y90MpbnLTqlu58ARawILgY0l
   jriBDms06G25cWLlM07jsh8zeSg7wlagT0MagFSbXZwt49jbtYrmNSFIZ
   Usj40eVbNFX49acBZx17aEj2HR3ZQ/ZGwg183ODo46K8Np2BFk38U/5cc
   rwzgFq3rjiLU/iB0NE8Relqt6hQT7WGy4R+vhHIEx1t6391fsF739q9lA
   DMpPDDe0nCWGnaUvx5chKMthn1dqor9miG1isfrWllkA1nuKuc2YxZDMf
   Q==;
X-CSE-ConnectionGUID: dw6NTToFRBWdEt+5NpqCug==
X-CSE-MsgGUID: 95b1RX8GQyWiS7PmX2+NOw==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33752689"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:10:35 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:16631]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.255:2525] with esmtp (Farcaster)
 id fe098a73-db4e-4a2d-9c44-3396f107477d; Thu, 12 Nov 2026 03:10:35 +0000 (UTC)
X-Farcaster-Flow-ID: fe098a73-db4e-4a2d-9c44-3396f107477d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:10:34 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:10:33 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 14/19] nitro_enclaves: Build the boot-time CPU pool once the CPUs are online
Date: Thu, 12 Nov 2026 03:07:10 +0000
Message-ID: <b8c95b3a93e9625c883cc0f4f947c43bdf36c5b1.1794393487.git.graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1794300000.git.graf@amazon.com>
References: <cover.1794300000.git.graf@amazon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

An admin who passes nitro_enclaves.ne_cpus= to a kernel with the driver
built in gets no CPU pool, and this not very informative error message:

  Booting kernel: `2-5' invalid for parameter `nitro_enclaves.ne_cpus'

The parameter setter runs from parse_args() in start_kernel(), before
the page allocator and the secondary CPUs are up. Building a pool needs
both.

Keep a value that arrives while system_state is SYSTEM_BOOTING in
ne_cpus, note its parameter in ne_cpus_kp, and build the pool from it in
ne_init(), which runs once both are up. The pool building moves into
ne_replace_cpu_pool() for that. That way a valid list on the command
line gets its pool, and an invalid one reports why.

Fixes: ff8a4d3e3a99 ("nitro_enclaves: Add logic for setting an enclave vCPU")
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 63 +++++++++++++++++++++--
 1 file changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 44a4432be8164..a897036dee2dd 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -14,6 +14,7 @@
 #include <linux/device.h>
 #include <linux/file.h>
 #include <linux/hugetlb.h>
+#include <linux/kernel.h>
 #include <linux/limits.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
@@ -102,6 +103,13 @@ module_param_cb(ne_cpus, &ne_cpu_pool_ops, &ne_cpus_arg, 0644);
 /* https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html#cpu-lists */
 MODULE_PARM_DESC(ne_cpus, "<cpu-list> - CPU pool used for Nitro Enclaves");
 
+/*
+ * The parameter a value from the kernel command line is kept in until ne_init()
+ * builds its pool. Nothing else writes ne_cpus, so it is set whenever ne_cpus
+ * holds a value, and no sysfs write can reach the setter before ne_init() runs.
+ */
+static const struct kernel_param *ne_cpus_kp;
+
 /**
  * struct ne_cpu_pool - CPU pool used for Nitro Enclaves.
  * @avail_threads_per_core:	Available full CPU cores to be dedicated to
@@ -403,7 +411,7 @@ static void ne_snapshot_cpu_pool(struct cpumask *cpu_pool)
 }
 
 /**
- * ne_set_kernel_param() - Set the NE CPU pool value via the NE kernel parameter.
+ * ne_replace_cpu_pool() - Replace the NE CPU pool with the one a CPU list names.
  * @val:	NE CPU pool string value.
  * @kp :	NE kernel parameter associated with the NE CPU pool.
  *
@@ -412,7 +420,7 @@ static void ne_snapshot_cpu_pool(struct cpumask *cpu_pool)
  * * 0 on success.
  * * Negative return value on failure.
  */
-static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
+static int ne_replace_cpu_pool(const char *val, const struct kernel_param *kp)
 {
 	char error_val[] = "";
 	cpumask_var_t cpu_pool;
@@ -420,9 +428,6 @@ static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 	struct ne_pci_dev *ne_pci_dev = NULL;
 	int rc = -EINVAL;
 
-	if (!capable(CAP_SYS_ADMIN))
-		return -EPERM;
-
 	if (!zalloc_cpumask_var(&cpu_pool, GFP_KERNEL))
 		return -ENOMEM;
 
@@ -509,6 +514,39 @@ static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 	return rc;
 }
 
+/**
+ * ne_set_kernel_param() - Set the NE CPU pool value via the NE kernel parameter.
+ * @val:	NE CPU pool string value.
+ * @kp :	NE kernel parameter associated with the NE CPU pool.
+ *
+ * Context: Process context.
+ * Return:
+ * * 0 on success.
+ * * Negative return value on failure.
+ */
+static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
+{
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	/*
+	 * A value on the kernel command line reaches this from the parse_args()
+	 * call in start_kernel(), which runs before mm_core_init() has brought
+	 * up the allocator a cpumask comes from and long before smp_init() has
+	 * brought online the CPUs a pool is built out of. Keep the value and
+	 * leave the pool to ne_init(), which runs from do_basic_setup() with
+	 * both of those behind it. A value from modprobe or from sysfs arrives
+	 * with the system already up and is applied here.
+	 */
+	if (system_state == SYSTEM_BOOTING) {
+		ne_cpus_kp = kp;
+
+		return param_set_copystring(val, kp);
+	}
+
+	return ne_replace_cpu_pool(val, kp);
+}
+
 /**
  * ne_donated_cpu() - Check if the provided CPU is already used by the enclave.
  * @ne_enclave :	Private data associated with the current enclave.
@@ -1904,6 +1942,21 @@ static long ne_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 static int __init ne_init(void)
 {
+	static char cpu_list[NE_CPUS_SIZE] __initdata;
+
+	/*
+	 * Build the pool of a CPU list that came from the kernel command line,
+	 * which the setter only kept. The value is taken out of the parameter
+	 * string first, because building the pool writes that string.
+	 */
+	if (ne_cpus_kp && ne_cpus[0]) {
+		memcpy(cpu_list, ne_cpus, sizeof(cpu_list));
+
+		if (ne_replace_cpu_pool(cpu_list, ne_cpus_kp) < 0)
+			pr_err("%s: No CPU pool from nitro_enclaves.ne_cpus=%s\n",
+			       ne_misc_dev.name, cpu_list);
+	}
+
 	return pci_register_driver(&ne_pci_driver);
 }
 
-- 
2.47.1

