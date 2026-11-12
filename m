Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.26.1.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452973;
	b=oPZ+skCeBp2fwHQe5YM+ntM8vbajwaGdGN21mqArD2hcy+38HGvvHmM0Z+461D8yFl9I
	 bUtAo2bqPjevKG18WnA6F1mhy+8wxxksBShU/Mq6iIN6Fpo1aJry1DEl9tsAVKGW1t91q
	 YOPhRhTkQsHKcLauaaZbhs8eRzqv6QigDTW02lAWkYLCMbN3j/N2V5UczuZQN4lnFvAO1
	 bCVErlgogFgoQWCg8Tp4AltQRGG7ZmzdLqrkdxiWwGSiRYHUe/AjamZhh1q7eNPtMlFB2
	 moy/3GU9sia86yA8p5su+Inne+gQdzaGSu1YOhNFS+pXdRb4I3LDaQmR50mIf8b/rzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452973;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=9tMy7TdKo/z2NyMVYvTP/qcvuej+8nl4xCS3DkO+JpI=;
	b=ROVSpJJk7ASjwYQMGI7fFNhnerSwa2KCoqTQwIcOQ8eCt3h+m/jNMgu7T2EzadEpxf0W
	 /V+Q8lPxQqC1I3+qyYA1EUd0VRfPv7kWbefT/ThHt1cJcIcsp36dQ/FFEJ0SDx7jIMR6h
	 JiO0aqDDSn5IsOd2Ws1TVdRW4+G6+6CL0fBnqzQrixSKoUr8VBN/y04t88S59HgOJ7OLR
	 MXgsqphnQ11ADds6fgz6TcmWVuahKY0uytjUSDVX22xMraoMpHIQRDLjHylbj8vFx6FmN
	 nYJ0tMMCRq0cy+TCRBB+qicrU5PIhmAQODoUOAAgW3ccI/KlqRpWzIExMozA8TWbyXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=EGygWNvp;
	arc=none smtp.remote-ip=52.26.1.71
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9CC606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F9CC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=EGygWNvp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794452972; x=1825988972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9tMy7TdKo/z2NyMVYvTP/qcvuej+8nl4xCS3DkO+JpI=;
  b=EGygWNvp+PkZBOIu2ZHORep5umbf+BYUvvT30ytWNtqys2MT0kFCuCA+
   jp0sPY9bl2y0BSb5cYEUV19J3BqohBq2mt6rWe6usdri355P864qVuwp/
   8dxaAQDyxrHuOxFD5QxDbv0m6NY+dv49goYZDoRkQR8fitpqEKM4fC2CP
   RUPX3CFlKoOATJCvWp3Qesao8WQLNCsQJyHDgjZn3bcjEzqrr0tuCeTCp
   iFOpto2mquksn4bus3vjxq5e0KYssg2LrETIADk8on9dT0rRaCnK+jos0
   QppNSLM3+85E0553oNG5T/SS/FhVpAb3dMJyWvLNLdxdGF/ey/hTd1AHv
   g==;
X-CSE-ConnectionGUID: DNoAsf44QX+orUegqv/8EA==
X-CSE-MsgGUID: NN1DSASoTBCZyT4D2H3yQQ==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33802440"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:09:30 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:21370]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.128:2525] with esmtp (Farcaster)
 id 105b05b4-ec3c-4215-bbf2-38e8d981c68f; Thu, 12 Nov 2026 03:09:29 +0000 (UTC)
X-Farcaster-Flow-ID: 105b05b4-ec3c-4215-bbf2-38e8d981c68f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:09:29 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:09:28 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 12/19] nitro_enclaves: Put the CPU pool back when the new CPU list is refused
Date: Thu, 12 Nov 2026 03:07:08 +0000
Message-ID: <b9098275c3fc6be796306fbaea09d0def4674965.1794393487.git.graf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

An admin who writes a CPU list that the driver refuses, for example one
that names CPU 0, leaves out a sibling or spans two NUMA nodes, loses
the pool that was there. The checks need every CPU of the list online
and a CPU the pool holds is offline, so they can only run after the old
pool is torn down.

Snapshot the CPUs of the pool before the teardown, and set the pool up
again from the snapshot when the new list is refused. Where that fails
as well, clear ne_cpus so that it does not name a pool that is gone.

Fixes: ff8a4d3e3a99 ("nitro_enclaves: Add logic for setting an enclave vCPU")
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 35 +++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index de3bf93a4ef0f..70d740d64ee17 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -382,6 +382,24 @@ static void ne_teardown_cpu_pool(void)
 	mutex_unlock(&ne_cpu_pool.mutex);
 }
 
+/**
+ * ne_snapshot_cpu_pool() - Copy out the CPUs the NE CPU pool holds.
+ * @cpu_pool:	CPU mask to fill in with the CPUs from the NE CPU pool.
+ *
+ * Context: Process context.
+ */
+static void ne_snapshot_cpu_pool(struct cpumask *cpu_pool)
+{
+	unsigned int i = 0;
+
+	mutex_lock(&ne_cpu_pool.mutex);
+
+	for (i = 0; i < ne_cpu_pool.nr_parent_vm_cores; i++)
+		cpumask_or(cpu_pool, cpu_pool, ne_cpu_pool.avail_threads_per_core[i]);
+
+	mutex_unlock(&ne_cpu_pool.mutex);
+}
+
 /**
  * ne_set_kernel_param() - Set the NE CPU pool value via the NE kernel parameter.
  * @val:	NE CPU pool string value.
@@ -396,6 +414,7 @@ static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 {
 	char error_val[] = "";
 	cpumask_var_t cpu_pool;
+	cpumask_var_t old_pool;
 	struct ne_pci_dev *ne_pci_dev = NULL;
 	int rc = -EINVAL;
 
@@ -405,6 +424,12 @@ static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 	if (!zalloc_cpumask_var(&cpu_pool, GFP_KERNEL))
 		return -ENOMEM;
 
+	if (!zalloc_cpumask_var(&old_pool, GFP_KERNEL)) {
+		free_cpumask_var(cpu_pool);
+
+		return -ENOMEM;
+	}
+
 	rc = down_read_killable(&ne_devs.lock);
 	if (rc)
 		goto free_cpumasks;
@@ -443,13 +468,16 @@ static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 		goto unlock;
 	}
 
+	ne_snapshot_cpu_pool(old_pool);
+
 	ne_teardown_cpu_pool();
 
 	rc = ne_setup_cpu_pool(cpu_pool);
 	if (rc < 0) {
 		pr_err("%s: Error in setup CPU pool [rc=%d]\n", ne_misc_dev.name, rc);
 
-		param_set_copystring(error_val, kp);
+		if (cpumask_empty(old_pool) || ne_setup_cpu_pool(old_pool) < 0)
+			param_set_copystring(error_val, kp);
 
 		goto unlock;
 	}
@@ -460,7 +488,8 @@ static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 
 		ne_teardown_cpu_pool();
 
-		param_set_copystring(error_val, kp);
+		if (cpumask_empty(old_pool) || ne_setup_cpu_pool(old_pool) < 0)
+			param_set_copystring(error_val, kp);
 	}
 
 unlock:
@@ -471,6 +500,8 @@ static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 	up_read(&ne_devs.lock);
 
 free_cpumasks:
+	free_cpumask_var(old_pool);
+
 	free_cpumask_var(cpu_pool);
 
 	return rc;
-- 
2.47.1

