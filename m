Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452940;
	b=e6RMOy2CvEUOrS/9s/EL15nUBh+VwoyJYQ53J088x+f8rB2uYx1/a0ETh5LY2EaGFPwA
	 twsE10bzqQyIxzE4YmmS9jaLkaKJmBsUDLqaJB4B6NfisDy6V5fd7Cy5mtC+kr3D/jOy/
	 0aUZUkeioIb/2CUBDXMSsQpZuDQzSgTkZ3Ec6C2DjxtJ0NJjkDqstBamOo70udj3G0p7h
	 Jj/mmC4oiguhZnUTTXXoKApZ9zWmo1qM2Vuf/geoqWWOhKr+Z60sAqGuN5K7YSBgKG+xa
	 MFeVVYKdxQh1OFZggCfVy+GLBS+iR74SxP2BaOroQEk9khpq/nNwigNOLbbUWA+tdgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452940;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=RJDDeiBxYVApQyn9W1dQi3/I/ocTvhj2ie12bnekdtg=;
	b=rUajN6lEx36wAtRvhNocctQAfo8gI6vRfng24VUYZQhLmX8lqBQszniOhkGLi1UmQ8fC
	 ItssHLlInDmDLAQpJq+ctyJo4Qu/pjZdMoByAY2yP3iHM0iEJJLynxKsPRYNL6JGVD5qq
	 ToxiJqzvwclIO1N7OgMYqeZsYeTbnCbVSTwwPaUjCYXVwos7jD+D10ip6l+YUrbSSMnoG
	 GGqppaj1K/Du+KIaLf8oVnxqGrvgWJHyFcNSYEBTwaSCrv8RIAmXAQaHypzzOl2CAudrm
	 W6/LJOe6VC3bIRNZ8qARsk4sCryyJ5Q35oHT6eE+cOz588TwXVeyodO0y5P/qi0fZlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Osw77AM7;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83F6606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C83F6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Osw77AM7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794452939; x=1825988939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RJDDeiBxYVApQyn9W1dQi3/I/ocTvhj2ie12bnekdtg=;
  b=Osw77AM7Jb/D7BSqGwxFJGanmhzaK0DY5PrkOZPaI87bmdawoqMq2A1Q
   RxQF/5gUIJtqlPDTbNs038nLgDLk67jI2RmizxVV5q7ML8gdcUzb2ImG2
   7l72QGBnoRCvFqpRQih+Os2+A2rOp0jL+0Og69ahNiqxED2PDC6Vx7kU4
   uVMhfs4enkD2C+ZHDjd0qTO78kjxgpCN+DxGc37EP5RCBoDxY4dFDYDaf
   7DXQZ3fciamNoTHgn8pZXZSwbhslKttwZyBSrEk2TrvH0XVaoN6SosYua
   Gt9RYuCz4KC2mZdZSMXHTQvse9sWGrQgT5kMV0eK60OAILLRmeRtNU9Rc
   g==;
X-CSE-ConnectionGUID: D27h8lapR+SuKgSGwwdanw==
X-CSE-MsgGUID: oIKBgZhrSnGJWVvGT0r5GA==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33552210"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:08:57 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:25585]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.141:2525] with esmtp (Farcaster)
 id d2163a95-ca23-470a-8292-829ae62215c0; Thu, 12 Nov 2026 03:08:56 +0000 (UTC)
X-Farcaster-Flow-ID: d2163a95-ca23-470a-8292-829ae62215c0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:08:56 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:08:55 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 11/19] nitro_enclaves: Keep the CPU pool when the new CPU list does not parse
Date: Thu, 12 Nov 2026 03:07:07 +0000
Message-ID: <6906689236135feecc54366f7795f5c812dc0ce5.1794393487.git.graf@amazon.com>
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

An admin who mistypes a CPU list into ne_cpus loses the pool that was
there, because ne_set_kernel_param() tears the pool down before
ne_setup_cpu_pool() parses the new value. The write fails, but the
pool's CPUs come back online and ne_cpus reads empty.

Parse the list before the teardown and pass the mask down. The other
checks stay after the teardown, because they want every CPU of the list
online, and a list that extends the current pool names offline CPUs.

Fixes: ff8a4d3e3a99 ("nitro_enclaves: Add logic for setting an enclave vCPU")
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 58 ++++++++++++-----------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 1c2a4994257d1..de3bf93a4ef0f 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -143,7 +143,7 @@ struct ne_phys_contig_mem_regions {
  *			 or not using CPU 0, which should remain available for
  *			 the primary / parent VM. Offline the CPUs from the
  *			 pool after the checks passed.
- * @ne_cpu_list:	The CPU list used for setting NE CPU pool.
+ * @cpu_pool:	The CPU mask used for setting NE CPU pool.
  *
  * Context: Process context. This function is called with the ne_pci_dev enclave
  *	    mutex held, if there is a NE PCI device.
@@ -151,35 +151,24 @@ struct ne_phys_contig_mem_regions {
  * * 0 on success.
  * * Negative return value on failure.
  */
-static int ne_setup_cpu_pool(const char *ne_cpu_list)
+static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 {
 	int core_id = -1;
 	unsigned int cpu = 0;
-	cpumask_var_t cpu_pool;
 	unsigned int cpu_sibling = 0;
 	unsigned int i = 0;
 	int numa_node = -1;
 	int rc = -EINVAL;
 
-	if (!zalloc_cpumask_var(&cpu_pool, GFP_KERNEL))
-		return -ENOMEM;
-
 	mutex_lock(&ne_cpu_pool.mutex);
 
-	rc = cpulist_parse(ne_cpu_list, cpu_pool);
-	if (rc < 0) {
-		pr_err("%s: Error in cpulist parse [rc=%d]\n", ne_misc_dev.name, rc);
-
-		goto free_pool_cpumask;
-	}
-
 	cpu = cpumask_any(cpu_pool);
 	if (cpu >= nr_cpu_ids) {
 		pr_err("%s: No CPUs available in CPU pool\n", ne_misc_dev.name);
 
 		rc = -EINVAL;
 
-		goto free_pool_cpumask;
+		goto reset_cpu_pool;
 	}
 
 	/*
@@ -193,7 +182,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 			rc = -EINVAL;
 
-			goto free_pool_cpumask;
+			goto reset_cpu_pool;
 		}
 
 	/*
@@ -208,7 +197,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 				rc = -EINVAL;
 
-				goto free_pool_cpumask;
+				goto reset_cpu_pool;
 			}
 		} else {
 			if (numa_node != cpu_to_node(cpu)) {
@@ -217,7 +206,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 				rc = -EINVAL;
 
-				goto free_pool_cpumask;
+				goto reset_cpu_pool;
 			}
 		}
 
@@ -230,7 +219,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 		rc = -EINVAL;
 
-		goto free_pool_cpumask;
+		goto reset_cpu_pool;
 	}
 
 	for_each_cpu(cpu_sibling, topology_sibling_cpumask(0)) {
@@ -240,7 +229,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 			rc = -EINVAL;
 
-			goto free_pool_cpumask;
+			goto reset_cpu_pool;
 		}
 	}
 
@@ -257,7 +246,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 
 				rc = -EINVAL;
 
-				goto free_pool_cpumask;
+				goto reset_cpu_pool;
 			}
 		}
 	}
@@ -274,7 +263,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 	if (!ne_cpu_pool.avail_threads_per_core) {
 		rc = -ENOMEM;
 
-		goto free_pool_cpumask;
+		goto reset_cpu_pool;
 	}
 
 	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
@@ -325,8 +314,6 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 		}
 	}
 
-	free_cpumask_var(cpu_pool);
-
 	ne_cpu_pool.numa_node = numa_node;
 
 	mutex_unlock(&ne_cpu_pool.mutex);
@@ -343,8 +330,7 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
 		free_cpumask_var(ne_cpu_pool.avail_threads_per_core[i]);
 	kfree(ne_cpu_pool.avail_threads_per_core);
-free_pool_cpumask:
-	free_cpumask_var(cpu_pool);
+reset_cpu_pool:
 	ne_cpu_pool.nr_parent_vm_cores = 0;
 	ne_cpu_pool.nr_threads_per_core = 0;
 	ne_cpu_pool.numa_node = -1;
@@ -409,15 +395,19 @@ static void ne_teardown_cpu_pool(void)
 static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 {
 	char error_val[] = "";
+	cpumask_var_t cpu_pool;
 	struct ne_pci_dev *ne_pci_dev = NULL;
 	int rc = -EINVAL;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
+	if (!zalloc_cpumask_var(&cpu_pool, GFP_KERNEL))
+		return -ENOMEM;
+
 	rc = down_read_killable(&ne_devs.lock);
 	if (rc)
-		return rc;
+		goto free_cpumasks;
 
 	ne_pci_dev = ne_devs.ne_pci_dev;
 
@@ -442,9 +432,20 @@ static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 		goto unlock;
 	}
 
+	/*
+	 * Parse the list before the teardown below drops the pool the driver
+	 * already has, so that a value that does not parse leaves it in place.
+	 */
+	rc = cpulist_parse(val, cpu_pool);
+	if (rc < 0) {
+		pr_err("%s: Error in cpulist parse [rc=%d]\n", ne_misc_dev.name, rc);
+
+		goto unlock;
+	}
+
 	ne_teardown_cpu_pool();
 
-	rc = ne_setup_cpu_pool(val);
+	rc = ne_setup_cpu_pool(cpu_pool);
 	if (rc < 0) {
 		pr_err("%s: Error in setup CPU pool [rc=%d]\n", ne_misc_dev.name, rc);
 
@@ -469,6 +470,9 @@ static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 unlock_devs:
 	up_read(&ne_devs.lock);
 
+free_cpumasks:
+	free_cpumask_var(cpu_pool);
+
 	return rc;
 }
 
-- 
2.47.1

