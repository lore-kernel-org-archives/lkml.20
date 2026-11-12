Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453069;
	b=DM51iF8vgCx9sZ5bgvQUl158rgQsJJ4WLqMyHuKTXUTPi7LEs+pLLVDyfEoZCO/s9Kyr
	 YcyscN8y6BKwCY7N2SyEZ6S3RJkXsBnLqWk3OmCU7Y7O7qbhbtcfX4JCTsa2qBr5U+JV2
	 hHeA6mTmkpgQCOmA1voy9ep3PYq4UJeT6BFJrKcABH/F02CYLIGXwpvoW8EdIoBew/Qo7
	 298lvWPwzbOlpIrlzIPQWG2S5ExvMl/R9uBf38Abda3ZYSvElmiYJJtzH4DkBriMRHd6A
	 T4X3U8+Szf4VqHQVpB5BufIdaj5I786i+okZh9IH8A7sa+JIjzH7ZSXdDFKurGda/Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453069;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=+2F1A/bWqGq508H1sjAYdhi9lPp/h2f8qY7k1Gs089o=;
	b=QLM0I8YzOramwI9aVKa+Xbjoeswr9OnH9XExhjwcpGbFhfkLv1lKT3rbQjjeRVSLv4c2
	 h+xhrRrL+la1iHEbNAOUHii34hgk5x94MT1xSYCHwmHUq9Y8o/cOX5hhL8HkGZov2x+Ft
	 b5cW/u0gGYHXY42owDxi6pheHRYBm9mUrdNgnivYTnPHrlPgu9QOMPhYedVtSLObC23Ni
	 bTtRzrUhgQA3sNGxKFnGhUUM0fo4jtWEKwgvGzrV3GQAAWyUXvC0itfabIKSh6K4hN3zd
	 ROPDO89IZZ6iOAqyw6MUoSpf7jZlpesZ2BCk763aKDSXWJzZUP4iw5+NiW0XMLuy1zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jDFP5xnp;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8A3606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F8A3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jDFP5xnp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794453069; x=1825989069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+2F1A/bWqGq508H1sjAYdhi9lPp/h2f8qY7k1Gs089o=;
  b=jDFP5xnpTxw/E8vOnlMlchVqJzBNVcJzATTj5pBNOCV0BQbGy0Zz01DB
   27LUB9IXMRdMTtQBTI05R4FaL5Z8gfS9Sh98zQJcXYmXwz8MD1t0fT5Y/
   sxLV+cFiy/Fqv1Lge+FXJ8EXeWPkVu45ZP5EV6KMV0VbTrZG3XKv0aDfG
   7+XFHGGH1swn+7erXqyuYKawLdhECwoDctrRbvt8r1j+OyIrgf+XwUJ5B
   WMGfahdCWATKUzRosOulsEeZ45g6aZ7bkJpMiSBByXmwziyFxohDdRJ87
   rz1Ej6RKlPumgphpTQiz3zME25QBmd+S5pm/VlmpPiHBho6WLx8Z/K0KJ
   g==;
X-CSE-ConnectionGUID: RPfgX57CRL6nlnlDvgEFng==
X-CSE-MsgGUID: UglWWFLQQL6WnAlHMwO4yQ==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33552347"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:11:08 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:16337]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.212:2525] with esmtp (Farcaster)
 id 580afe5c-114b-4fb4-a17a-99cb381d3057; Thu, 12 Nov 2026 03:11:08 +0000 (UTC)
X-Farcaster-Flow-ID: 580afe5c-114b-4fb4-a17a-99cb381d3057
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:11:07 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:11:06 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 15/19] nitro_enclaves: Set up the CPU pool under the CPU hotplug read lock
Date: Thu, 12 Nov 2026 03:07:11 +0000
Message-ID: <65b08827c7eb7417c98e458f06e51c6735ee3281.1794393487.git.graf@amazon.com>
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

An admin who writes a CPU list to ne_cpus while a CPU goes offline can
get a pool built from the topology before and after that CPU went.
ne_setup_cpu_pool() reads cpu_is_offline(), cpu_to_node() and
topology_sibling_cpumask() for the list without the CPU hotplug lock.

Take cpus_read_lock() over those reads, and drop it before the CPUs are
offlined, because remove_cpu() takes the write side. The failure paths
share one unwind in ne_free_core_slots(), so that one cpus_read_unlock()
covers all of them.

Fixes: ff8a4d3e3a99 ("nitro_enclaves: Add logic for setting an enclave vCPU")
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 73 +++++++++++++++--------
 1 file changed, 48 insertions(+), 25 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index a897036dee2dd..f8b066c990ce1 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -147,6 +147,27 @@ struct ne_phys_contig_mem_regions {
 	struct range  *regions;
 };
 
+/**
+ * ne_free_core_slots() - Free the core slot arrays of the NE CPU pool.
+ * @void:	No parameters provided.
+ *
+ * Context: Process context. This function is called with the ne_cpu_pool mutex
+ *	    held.
+ */
+static void ne_free_core_slots(void)
+{
+	unsigned int i = 0;
+
+	if (!ne_cpu_pool.avail_threads_per_core)
+		return;
+
+	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
+		free_cpumask_var(ne_cpu_pool.avail_threads_per_core[i]);
+
+	kfree(ne_cpu_pool.avail_threads_per_core);
+	ne_cpu_pool.avail_threads_per_core = NULL;
+}
+
 /**
  * ne_setup_cpu_pool() - Set the NE CPU pool after handling sanity checks such
  *			 as not sharing CPU cores with the primary / parent VM
@@ -155,6 +176,11 @@ struct ne_phys_contig_mem_regions {
  *			 pool after the checks passed.
  * @cpu_pool:	The CPU mask used for setting NE CPU pool.
  *
+ * The topology of the pool - online state, sibling masks, core ids - is read
+ * under the CPU hotplug read lock. The lock is dropped before the pool CPUs are
+ * offlined, because remove_cpu() takes the write side of the same percpu-rwsem.
+ * Nothing reads topology after the drop.
+ *
  * Context: Process context. This function is called with the ne_pci_dev enclave
  *	    mutex held, if there is a NE PCI device.
  * Return:
@@ -171,6 +197,7 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 	int rc = -EINVAL;
 
 	mutex_lock(&ne_cpu_pool.mutex);
+	cpus_read_lock();
 
 	cpu = cpumask_any(cpu_pool);
 	if (cpu >= nr_cpu_ids) {
@@ -178,7 +205,7 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 
 		rc = -EINVAL;
 
-		goto reset_cpu_pool;
+		goto unlock_hotplug;
 	}
 
 	/*
@@ -192,7 +219,7 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 
 			rc = -EINVAL;
 
-			goto reset_cpu_pool;
+			goto unlock_hotplug;
 		}
 
 	/*
@@ -207,7 +234,7 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 
 				rc = -EINVAL;
 
-				goto reset_cpu_pool;
+				goto unlock_hotplug;
 			}
 		} else {
 			if (numa_node != cpu_to_node(cpu)) {
@@ -216,7 +243,7 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 
 				rc = -EINVAL;
 
-				goto reset_cpu_pool;
+				goto unlock_hotplug;
 			}
 		}
 
@@ -229,7 +256,7 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 
 		rc = -EINVAL;
 
-		goto reset_cpu_pool;
+		goto unlock_hotplug;
 	}
 
 	for_each_cpu(cpu_sibling, topology_sibling_cpumask(0)) {
@@ -239,7 +266,7 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 
 			rc = -EINVAL;
 
-			goto reset_cpu_pool;
+			goto unlock_hotplug;
 		}
 	}
 
@@ -256,7 +283,7 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 
 				rc = -EINVAL;
 
-				goto reset_cpu_pool;
+				goto unlock_hotplug;
 			}
 		}
 	}
@@ -273,14 +300,14 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 	if (!ne_cpu_pool.avail_threads_per_core) {
 		rc = -ENOMEM;
 
-		goto reset_cpu_pool;
+		goto unlock_hotplug;
 	}
 
 	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
 		if (!zalloc_cpumask_var(&ne_cpu_pool.avail_threads_per_core[i], GFP_KERNEL)) {
 			rc = -ENOMEM;
 
-			goto free_cores_cpumask;
+			goto free_slots;
 		}
 
 	/*
@@ -295,12 +322,14 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 
 			rc = -EINVAL;
 
-			goto clear_cpumask;
+			goto free_slots;
 		}
 
 		cpumask_set_cpu(cpu, ne_cpu_pool.avail_threads_per_core[core_id]);
 	}
 
+	cpus_read_unlock();
+
 	/*
 	 * CPUs that are given to enclave(s) should not be considered online
 	 * by Linux anymore, as the hypervisor will degrade them to floating.
@@ -333,14 +362,13 @@ static int ne_setup_cpu_pool(const struct cpumask *cpu_pool)
 online_cpus:
 	for_each_cpu(cpu, cpu_pool)
 		add_cpu(cpu);
-clear_cpumask:
-	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
-		cpumask_clear(ne_cpu_pool.avail_threads_per_core[i]);
-free_cores_cpumask:
-	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
-		free_cpumask_var(ne_cpu_pool.avail_threads_per_core[i]);
-	kfree(ne_cpu_pool.avail_threads_per_core);
-reset_cpu_pool:
+	ne_free_core_slots();
+	goto reset_pool;
+free_slots:
+	ne_free_core_slots();
+unlock_hotplug:
+	cpus_read_unlock();
+reset_pool:
 	ne_cpu_pool.nr_parent_vm_cores = 0;
 	ne_cpu_pool.nr_threads_per_core = 0;
 	ne_cpu_pool.numa_node = -1;
@@ -371,7 +399,7 @@ static void ne_teardown_cpu_pool(void)
 		return;
 	}
 
-	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++) {
+	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
 		for_each_cpu(cpu, ne_cpu_pool.avail_threads_per_core[i]) {
 			rc = add_cpu(cpu);
 			if (rc != 0)
@@ -379,12 +407,7 @@ static void ne_teardown_cpu_pool(void)
 				       ne_misc_dev.name, cpu, rc);
 		}
 
-		cpumask_clear(ne_cpu_pool.avail_threads_per_core[i]);
-
-		free_cpumask_var(ne_cpu_pool.avail_threads_per_core[i]);
-	}
-
-	kfree(ne_cpu_pool.avail_threads_per_core);
+	ne_free_core_slots();
 	ne_cpu_pool.nr_parent_vm_cores = 0;
 	ne_cpu_pool.nr_threads_per_core = 0;
 	ne_cpu_pool.numa_node = -1;
-- 
2.47.1

