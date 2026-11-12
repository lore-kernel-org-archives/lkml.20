Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453135;
	b=eT/vIHcsn6qmCN5/hHqqQbSQhnGqaSn9BKxqb5Nf/+fpsI38i0qiiKr/mQn65IQ1/ZIZ
	 dw+iXjN1DZiTAob0wSGuet1iw/aDlxobeCNxYD8zzKWqbCzWF4XJ5jlAntrd7x8rUwmLx
	 fksbsso51N8gEXl8fAjRHSZOG7Xf6WRL4vO1XKpEI12FvOaEF5tJPRLnbhw/PDUv6o4j8
	 9dBhjDSNl8vEO78OghLh/NnKB5t+C26z04jpluUORAUJSgsl+Xvs7MKSLtp1AHc8Xk2Wj
	 seuDO5UKsOegPUQvFPPO13EaasHuUliqNeCSqezuJ5YkNXXZhANUfhPdmRpGFX9EpMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453135;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=HDqhAb1cyLxN/xViRFGPNkO0OLMe+fOddca2mHOKPpk=;
	b=MhIp/ALSmKpZuVsH2UZszAU0EeIEC5Kpgy6/kYTIa+Wn0xOwndFC+mVQ+25uMHTs1VLC
	 phgiiHDCPdX+FT87X4+cXEL6OAEA9qhyKjM90Z5oMIF3qXJ8m45lRDitbYthGFK/crpTT
	 5i5fQH/SZJ/TE98f/nXKY5lCQpUFwjTxonCReJwAT2zEcdXGRBeuSNNFG9FIpJH5E5Ttz
	 0mQaoIO2OXgwD9r5E39Y1c/LBFqCmydACqHziNCzQKSb5/4hxY1Trshaja0BaTtNXxDYW
	 tmeri20LQMCdc1b9vvmdI+SYyZxFzCZfGa+fvFIMHkk7mB1jBfeHRgPCF7cuCC+84Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=UXsVcCQg;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91129606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91129606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=UXsVcCQg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794453134; x=1825989134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HDqhAb1cyLxN/xViRFGPNkO0OLMe+fOddca2mHOKPpk=;
  b=UXsVcCQg0q5x8VUAoes4OGXixjYv5kX1Ssj6iTemUZ1vJ5x6XyzGrpPI
   N61KjyMsbQp2p6EGCirbAi9UXZZtI8FB/SNsi2JhuYueTAGHL9QXaBD6K
   bnhrkHq4a1e7PNVxd5GtcgP1XGZp58wNetVmKBIVpvhmKoJfIorA/2BZJ
   YzhtvnTHf4sD6SfhKQ7qzOOlt+W6hEqHTnEQMpOM2QSROJBgT/5Geu/mq
   2fF9jZEdcy2RhsTkRk/BvVsTP8O0A2u3cSBW7W38FuxXU1FU6JG6C1nvH
   nFwkWuC+ykRNQ4Rm5p/kFSYFuMWHQCLFj5a34P9kPl8WrkW4nCOal+HPh
   A==;
X-CSE-ConnectionGUID: 8n3xozLdT16iwUO6Mps59A==
X-CSE-MsgGUID: w2PosxH3TwyEwqROmSGnjQ==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33752859"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:12:14 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:6185]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.212:2525] with esmtp (Farcaster)
 id db1ad0fa-c305-46b2-8ede-fb69930ab18c; Thu, 12 Nov 2026 03:12:13 +0000 (UTC)
X-Farcaster-Flow-ID: db1ad0fa-c305-46b2-8ede-fb69930ab18c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:12:13 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:12:12 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 17/19] nitro_enclaves: Index CPU pool cores by sibling mask
Date: Thu, 12 Nov 2026 03:07:13 +0000
Message-ID: <0151affce5b48462715b651945c9064a001dfa6e.1794393487.git.graf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

An enclave on a host whose CPU pool spans two packages can get the
threads of a core on a different package. The pool indexes
avail_threads_per_core[] by topology_core_id(), which is package-local
on x86, so two cores in different packages share one entry.

Walk the sibling mask of each pool CPU instead, in
ne_build_core_slots(), which gives each core its own entry and counts
the cores of the pool. An enclave copies that count at NE_CREATE_VM.
NE_ADD_VCPU now bounds vcpu_id by nr_cpu_ids instead of the thread count
of the pool, so an id above the old bound that the pool does not hold
answers NE_ERR_VCPU_NOT_IN_CPU_POOL instead of NE_ERR_INVALID_VCPU.

Fixes: ff8a4d3e3a99 ("nitro_enclaves: Add logic for setting an enclave vCPU")
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 168 ++++++++++++++--------
 drivers/virt/nitro_enclaves/ne_misc_dev.h |  16 +--
 2 files changed, 113 insertions(+), 71 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 355eb0a684ec2..cb1efc95a7f34 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -18,6 +18,7 @@
 #include <linux/limits.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
+#include <linux/minmax.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
 #include <linux/module.h>
@@ -114,23 +115,23 @@ static const struct kernel_param *ne_cpus_kp;
 /**
  * struct ne_cpu_pool - CPU pool used for Nitro Enclaves.
  * @avail_threads_per_core:	Available full CPU cores to be dedicated to
- *				enclave(s). The cpumasks from the array, indexed
- *				by core id, contain all the threads from the
- *				available cores, that are not set for created
- *				enclave(s). The full CPU cores are part of the
- *				NE CPU pool.
+ *				enclave(s). Each cpumask in the array holds the
+ *				threads of one core in the pool that are not set
+ *				for created enclave(s). Slots are handed out as
+ *				cores are discovered and carry no meaning
+ *				outside the driver.
  * @mutex:			Mutex for the access to the NE CPU pool.
- * @nr_parent_vm_cores :	The size of the available threads per core array.
- *				The total number of CPU cores available on the
- *				primary / parent VM.
- * @nr_threads_per_core:	The number of threads that a full CPU core has.
+ * @nr_parent_vm_cores :	The size of the available threads per core array,
+ *				one slot per full CPU core in the pool. Counted
+ *				from the pool rather than derived from a thread
+ *				count, so a machine whose cores do not all have
+ *				the same number of threads is sized correctly.
  * @numa_node:			NUMA node of the CPUs in the pool.
  */
 struct ne_cpu_pool {
 	cpumask_var_t	*avail_threads_per_core;
 	struct mutex	mutex;
 	unsigned int	nr_parent_vm_cores;
-	unsigned int	nr_threads_per_core;
 	int		numa_node;
 };
 
@@ -169,6 +170,88 @@ static void ne_free_core_slots(void)
 	ne_cpu_pool.avail_threads_per_core = NULL;
 }
 
+/**
+ * ne_build_core_slots() - Group the CPU pool into full cores and give each one
+ *			   a slot of the NE CPU pool arrays.
+ * @cpu_pool:	The CPU pool as parsed out of the ne_cpus parameter.
+ *
+ * The slots preserve the CPU topology of the pool once its CPUs are offlined.
+ * topology_core_id() is package-local on x86, so two cores in different
+ * packages report the same id and would share a slot. The per-CPU sibling
+ * cpumask identifies a core on the architectures this driver builds for, so
+ * walk that instead: once to count the cores the pool holds, and once to hand
+ * each of them the next free slot. Counting first sizes the arrays to the pool,
+ * so the walk has a slot for every core it finds.
+ *
+ * Context: Process context. This function is called with the ne_cpu_pool mutex
+ *	    and the CPU hotplug read lock held.
+ * Return:
+ * * 0 on success.
+ * * Negative return value on failure.
+ */
+static int ne_build_core_slots(const struct cpumask *cpu_pool)
+{
+	unsigned int cpu = 0;
+	unsigned int cpu_sibling = 0;
+	unsigned int i = 0;
+	unsigned int next_core_idx = 0;
+	unsigned int nr_cores = 0;
+	cpumask_var_t processed;
+	int rc = -ENOMEM;
+
+	if (!zalloc_cpumask_var(&processed, GFP_KERNEL))
+		return -ENOMEM;
+
+	for_each_cpu(cpu, cpu_pool) {
+		if (cpumask_test_cpu(cpu, processed))
+			continue;
+
+		cpumask_or(processed, processed, topology_sibling_cpumask(cpu));
+
+		nr_cores++;
+	}
+
+	ne_cpu_pool.avail_threads_per_core = kzalloc_objs(*ne_cpu_pool.avail_threads_per_core,
+							  nr_cores);
+	if (!ne_cpu_pool.avail_threads_per_core)
+		goto free_processed;
+
+	ne_cpu_pool.nr_parent_vm_cores = nr_cores;
+
+	for (i = 0; i < nr_cores; i++)
+		if (!zalloc_cpumask_var(&ne_cpu_pool.avail_threads_per_core[i], GFP_KERNEL))
+			goto free_slots;
+
+	cpumask_clear(processed);
+
+	for_each_cpu(cpu, cpu_pool) {
+		if (cpumask_test_cpu(cpu, processed))
+			continue;
+
+		for_each_cpu(cpu_sibling, topology_sibling_cpumask(cpu)) {
+			if (!cpumask_test_cpu(cpu_sibling, cpu_pool))
+				continue;
+
+			cpumask_set_cpu(cpu_sibling,
+					ne_cpu_pool.avail_threads_per_core[next_core_idx]);
+			cpumask_set_cpu(cpu_sibling, processed);
+		}
+
+		next_core_idx++;
+	}
+
+	free_cpumask_var(processed);
+
+	return 0;
+
+free_slots:
+	ne_free_core_slots();
+free_processed:
+	free_cpumask_var(processed);
+
+	return rc;
+}
+
 /**
  * ne_setup_cpu_pool() - Set the NE CPU pool after handling sanity checks such
  *			 as not sharing CPU cores with the primary / parent VM
@@ -177,7 +260,7 @@ static void ne_free_core_slots(void)
  *			 pool after the checks passed.
  * @cpu_pool:	The CPU mask used for setting NE CPU pool.
  *
- * The topology of the pool - online state, sibling masks, core ids - is read
+ * The topology of the pool - online state, sibling masks, core slots - is read
  * under the CPU hotplug read lock. The lock is dropped before the pool CPUs are
  * offlined, because remove_cpu() takes the write side of the same percpu-rwsem.
  * Nothing reads topology after the drop.
@@ -190,10 +273,8 @@ static void ne_free_core_slots(void)
  */
 static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 {
-	int core_id = -1;
 	unsigned int cpu = 0;
 	unsigned int cpu_sibling = 0;
-	unsigned int i = 0;
 	int numa_node = -1;
 	int rc = -EINVAL;
 
@@ -211,7 +292,7 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 
 	/*
 	 * Check if the CPUs are online, to further get info about them
-	 * e.g. numa node, core id, siblings.
+	 * e.g. numa node, siblings.
 	 */
 	for_each_cpu(cpu, cpu_pool)
 		if (cpu_is_offline(cpu)) {
@@ -289,45 +370,9 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 		}
 	}
 
-	/* Calculate the number of threads from a full CPU core. */
-	cpu = cpumask_any(cpu_pool);
-	for_each_cpu(cpu_sibling, topology_sibling_cpumask(cpu))
-		ne_cpu_pool.nr_threads_per_core++;
-
-	ne_cpu_pool.nr_parent_vm_cores = nr_cpu_ids / ne_cpu_pool.nr_threads_per_core;
-
-	ne_cpu_pool.avail_threads_per_core = kzalloc_objs(*ne_cpu_pool.avail_threads_per_core,
-							  ne_cpu_pool.nr_parent_vm_cores);
-	if (!ne_cpu_pool.avail_threads_per_core) {
-		rc = -ENOMEM;
-
+	rc = ne_build_core_slots(cpu_pool);
+	if (rc < 0)
 		goto unlock_hotplug;
-	}
-
-	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
-		if (!zalloc_cpumask_var(&ne_cpu_pool.avail_threads_per_core[i], GFP_KERNEL)) {
-			rc = -ENOMEM;
-
-			goto free_slots;
-		}
-
-	/*
-	 * Split the NE CPU pool in threads per core to keep the CPU topology
-	 * after offlining the CPUs.
-	 */
-	for_each_cpu(cpu, cpu_pool) {
-		core_id = topology_core_id(cpu);
-		if (core_id < 0 || core_id >= ne_cpu_pool.nr_parent_vm_cores) {
-			pr_err("%s: Invalid core id  %d for CPU %d\n",
-			       ne_misc_dev.name, core_id, cpu);
-
-			rc = -EINVAL;
-
-			goto free_slots;
-		}
-
-		cpumask_set_cpu(cpu, ne_cpu_pool.avail_threads_per_core[core_id]);
-	}
 
 	cpus_read_unlock();
 
@@ -365,13 +410,10 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 		add_cpu(cpu);
 	ne_free_core_slots();
 	goto reset_pool;
-free_slots:
-	ne_free_core_slots();
 unlock_hotplug:
 	cpus_read_unlock();
 reset_pool:
 	ne_cpu_pool.nr_parent_vm_cores = 0;
-	ne_cpu_pool.nr_threads_per_core = 0;
 	ne_cpu_pool.numa_node = -1;
 	mutex_unlock(&ne_cpu_pool.mutex);
 
@@ -410,7 +452,6 @@ static void ne_teardown_cpu_pool(void)
 
 	ne_free_core_slots();
 	ne_cpu_pool.nr_parent_vm_cores = 0;
-	ne_cpu_pool.nr_threads_per_core = 0;
 	ne_cpu_pool.numa_node = -1;
 
 	mutex_unlock(&ne_cpu_pool.mutex);
@@ -647,7 +688,8 @@ static int ne_set_enclave_threads_per_core(struct ne_enclave *ne_enclave,
 		return -NE_ERR_VCPU_NOT_IN_CPU_POOL;
 	}
 
-	if (core_id >= ne_enclave->nr_parent_vm_cores) {
+	if (core_id >= min(ne_enclave->nr_parent_vm_cores,
+			   ne_cpu_pool.nr_parent_vm_cores)) {
 		dev_err_ratelimited(ne_misc_dev.this_device,
 				    "Invalid core id %d - ne_enclave\n", core_id);
 
@@ -1276,8 +1318,7 @@ static long ne_enclave_do_ioctl(struct file *file, unsigned int cmd, unsigned lo
 			return -NE_ERR_NOT_IN_INIT_STATE;
 		}
 
-		if (vcpu_id >= (ne_enclave->nr_parent_vm_cores *
-		    ne_enclave->nr_threads_per_core)) {
+		if (vcpu_id >= nr_cpu_ids) {
 			dev_err_ratelimited(ne_misc_dev.this_device,
 					    "vCPU id higher than max CPU id\n");
 
@@ -1566,18 +1607,22 @@ static void ne_enclave_remove_all_mem_region_entries(struct ne_enclave *ne_encla
  */
 static void ne_enclave_remove_all_vcpu_id_entries(struct ne_enclave *ne_enclave)
 {
+	unsigned int nr_cores = 0;
 	unsigned int cpu = 0;
 	unsigned int i = 0;
 
 	mutex_lock(&ne_cpu_pool.mutex);
 
-	for (i = 0; i < ne_enclave->nr_parent_vm_cores; i++) {
+	nr_cores = min(ne_enclave->nr_parent_vm_cores,
+		       ne_cpu_pool.nr_parent_vm_cores);
+
+	for (i = 0; i < nr_cores; i++)
 		for_each_cpu(cpu, ne_enclave->threads_per_core[i])
 			/* Update the available NE CPU pool. */
 			cpumask_set_cpu(cpu, ne_cpu_pool.avail_threads_per_core[i]);
 
+	for (i = 0; i < ne_enclave->nr_parent_vm_cores; i++)
 		free_cpumask_var(ne_enclave->threads_per_core[i]);
-	}
 
 	mutex_unlock(&ne_cpu_pool.mutex);
 
@@ -1816,7 +1861,6 @@ static int ne_create_vm_ioctl(struct ne_pci_dev *ne_pci_dev, u64 __user *slot_ui
 	mutex_lock(&ne_cpu_pool.mutex);
 
 	ne_enclave->nr_parent_vm_cores = ne_cpu_pool.nr_parent_vm_cores;
-	ne_enclave->nr_threads_per_core = ne_cpu_pool.nr_threads_per_core;
 	ne_enclave->numa_node = ne_cpu_pool.numa_node;
 
 	mutex_unlock(&ne_cpu_pool.mutex);
diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.h b/drivers/virt/nitro_enclaves/ne_misc_dev.h
index 4031d5d23eb00..283c17558f2a3 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.h
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.h
@@ -50,18 +50,17 @@ struct ne_mem_region {
  * @mem_size:			Enclave memory size.
  * @mm :			Enclave process abstraction mm data struct.
  * @nr_mem_regions:		Number of memory regions associated with the enclave.
- * @nr_parent_vm_cores :	The size of the threads per core array. The
- *				total number of CPU cores available on the
- *				parent / primary VM.
- * @nr_threads_per_core:	The number of threads that a full CPU core has.
+ * @nr_parent_vm_cores :	The size of the threads per core array, one slot
+ *				per full CPU core in the NE CPU pool the enclave
+ *				was created from.
  * @nr_vcpus:			Number of vcpus associated with the enclave.
  * @numa_node:			NUMA node of the enclave memory and CPUs.
  * @slot_uid:			Slot unique id mapped to the enclave.
  * @state:			Enclave state, updated during enclave lifetime.
- * @threads_per_core:		Enclave full CPU cores array, indexed by core id,
- *				consisting of cpumasks with all their threads.
- *				Full CPU cores are taken from the NE CPU pool
- *				and are available to the enclave.
+ * @threads_per_core:		Enclave full CPU cores array. Each cpumask in the
+ *				array holds the threads of one core taken from
+ *				the NE CPU pool and available to the enclave,
+ *				at the index of that core's slot in the pool.
  * @vcpu_ids:			Cpumask of the vCPUs that are set for the enclave.
  */
 struct ne_enclave {
@@ -76,7 +75,6 @@ struct ne_enclave {
 	struct mm_struct	*mm;
 	unsigned int		nr_mem_regions;
 	unsigned int		nr_parent_vm_cores;
-	unsigned int		nr_threads_per_core;
 	unsigned int		nr_vcpus;
 	int			numa_node;
 	u64			slot_uid;
-- 
2.47.1

