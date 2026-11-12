Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452872;
	b=u+xu58aPL4nr97WmS5LrR0CuMxdK70GroTxkpAFq+5DtVymT711Gp3IbRosYvc2DetiL
	 g4/DZ3txYaOXTIcZytWMjAofAT+GRSXuECBL8w1AHbZyNplrhEEU3H5gXHZNY7iu5FYO5
	 O0oozf/vdMDvnDCV5EF3l1dKswHaoJn54YUiIFBGqDq6WopGCZ7USs71Ni5Ee52czPCk2
	 0NgVH/1eY65X8vhYWbYP1LVjJVPlOU0IXB8uE/F6vX884KKKk+ObGv6DLQX0xt2MwO6oB
	 lrytn3rFZqxnUim0P5zTylVE596r+p7b5kUPljSztlIMbGwbZTgKmRqOeiFD8RByL5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452872;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=fQsuB7GfIq/2n8sFtAgqwdloEx0U9ITEEJnXkB9GA/0=;
	b=B+JDHBKuvavWAkIfivTSUpBZYLAwW6tKmfvmkQoJoUC/mj92EVZXFZFCr+b0XBhxtxnW
	 D6MinaoRa7ZI7rvb6xTh415yFJFEZN74BsFDyxPS9OwLn+d6yFTwvnU/mcGtriIILhXLS
	 ezL/bGZFlXKfDx7XrISVqORWDy9MgY/t6u1CNu632irVMCH2vAOd9WSCkCQ+BjxMk4OJF
	 LoHSDIEMzlWeXRSu1YMGfBXFSoMx8JPtt/t8lUjwkTXc1WvEP2R/4zUe4km620JpEE1Z9
	 1HXVQAtMS+HsUUzffnYLYI5klzCt2SPuNErgR1IUWHocv4JarjAkHIzHFm1CpgepYng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=H4LpPzFq;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B2B606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B2B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=H4LpPzFq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794452871; x=1825988871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQsuB7GfIq/2n8sFtAgqwdloEx0U9ITEEJnXkB9GA/0=;
  b=H4LpPzFqsEgpqJP+IY2a1ZwNa2UkXyPMzyORqSjQiIjfQzO6k0CXJeb0
   wTnlEUoxZxMJSCmMSxzF8EzKP076A64+CFhK6JLj+Fg57cW5seN3wymrP
   TOHt6TOowtsRkyuUM0NvsH5N3QpxWPGtsbZkI3DU8BazRNmrN+COTbS43
   slGzFqvGdUcdOvy2cZmIyAgCCBPCKSSn3O89gjS30KXrZVnKwps5eYmbk
   2zO+fNePOTiAEb4xExdB4u3qEE+q4q1KDpPV7mPJgSBvmXpBd5vx00wZ2
   dwS2XujSywoVOmPIDP//YTYPcLmeLLKoznuN8A1gTNDNZ+uRZWbH6zBPx
   g==;
X-CSE-ConnectionGUID: s/XhQPqWRGSXA+7Buha8VA==
X-CSE-MsgGUID: wMZLGeSfTKqTu0UiaOwzBg==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33546948"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:07:51 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:4665]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.227:2525] with esmtp (Farcaster)
 id d2365406-8730-4e33-ac82-a0aa9f23506a; Thu, 12 Nov 2026 03:07:51 +0000 (UTC)
X-Farcaster-Flow-ID: d2365406-8730-4e33-ac82-a0aa9f23506a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:07:50 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:07:49 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 09/19] nitro_enclaves: Do not return enclave threads to a replaced CPU pool
Date: Thu, 12 Nov 2026 03:07:05 +0000
Message-ID: <e13de8c105a9131c65672c31db28db0629f66663.1794393487.git.graf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

A write to ne_cpus checks that no enclave exists, drops
enclaves_list_mutex and then replaces the CPU pool, so an NE_CREATE_VM
in between gets an enclave whose release writes into the freed pool.
Hold the mutex across the check, the teardown and the setup, and take it
and ne_devs.lock killable, as the ioctls do.

Fixes: 9c8eb50fe9e2 ("nitro_enclaves: Add logic for terminating an enclave")
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 76 +++++++++++------------
 1 file changed, 37 insertions(+), 39 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index ac33fbcd41f35..0a1080443fc72 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -137,37 +137,6 @@ struct ne_phys_contig_mem_regions {
 	struct range  *regions;
 };
 
-/**
- * ne_check_enclaves_created() - Verify if at least one enclave has been created.
- * @void:	No parameters provided.
- *
- * Context: Process context.
- * Return:
- * * True if at least one enclave is created.
- * * False otherwise.
- */
-static bool ne_check_enclaves_created(void)
-{
-	struct ne_pci_dev *ne_pci_dev = NULL;
-	bool ret = false;
-
-	down_read(&ne_devs.lock);
-
-	ne_pci_dev = ne_devs.ne_pci_dev;
-	if (ne_pci_dev) {
-		mutex_lock(&ne_pci_dev->enclaves_list_mutex);
-
-		if (!list_empty(&ne_pci_dev->enclaves_list))
-			ret = true;
-
-		mutex_unlock(&ne_pci_dev->enclaves_list_mutex);
-	}
-
-	up_read(&ne_devs.lock);
-
-	return ret;
-}
-
 /**
  * ne_setup_cpu_pool() - Set the NE CPU pool after handling sanity checks such
  *			 as not sharing CPU cores with the primary / parent VM
@@ -176,7 +145,8 @@ static bool ne_check_enclaves_created(void)
  *			 pool after the checks passed.
  * @ne_cpu_list:	The CPU list used for setting NE CPU pool.
  *
- * Context: Process context.
+ * Context: Process context. This function is called with the ne_pci_dev enclave
+ *	    mutex held, if there is a NE PCI device.
  * Return:
  * * 0 on success.
  * * Negative return value on failure.
@@ -385,7 +355,8 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
  *			    CPU pool.
  * @void:	No parameters provided.
  *
- * Context: Process context.
+ * Context: Process context. This function is called with the ne_pci_dev enclave
+ *	    mutex held, if there is a NE PCI device.
  */
 static void ne_teardown_cpu_pool(void)
 {
@@ -435,15 +406,37 @@ static void ne_teardown_cpu_pool(void)
 static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 {
 	char error_val[] = "";
+	struct ne_pci_dev *ne_pci_dev = NULL;
 	int rc = -EINVAL;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	if (ne_check_enclaves_created()) {
+	rc = down_read_killable(&ne_devs.lock);
+	if (rc)
+		return rc;
+
+	ne_pci_dev = ne_devs.ne_pci_dev;
+
+	/*
+	 * Keep the enclave list from gaining an entry while the pool is being
+	 * replaced, so that no enclave ends up holding a core count that
+	 * describes a pool that is already gone. The list lives in the PCI
+	 * device, which is not bound yet when this runs for a value given on
+	 * the kernel command line; nothing can create an enclave then either.
+	 */
+	if (ne_pci_dev) {
+		rc = mutex_lock_killable(&ne_pci_dev->enclaves_list_mutex);
+		if (rc)
+			goto unlock_devs;
+	}
+
+	if (ne_pci_dev && !list_empty(&ne_pci_dev->enclaves_list)) {
 		pr_err("%s: The CPU pool is used by enclave(s)\n", ne_misc_dev.name);
 
-		return -EPERM;
+		rc = -EPERM;
+
+		goto unlock;
 	}
 
 	ne_teardown_cpu_pool();
@@ -454,7 +447,7 @@ static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 
 		param_set_copystring(error_val, kp);
 
-		return rc;
+		goto unlock;
 	}
 
 	rc = param_set_copystring(val, kp);
@@ -464,11 +457,16 @@ static int ne_set_kernel_param(const char *val, const struct kernel_param *kp)
 		ne_teardown_cpu_pool();
 
 		param_set_copystring(error_val, kp);
-
-		return rc;
 	}
 
-	return 0;
+unlock:
+	if (ne_pci_dev)
+		mutex_unlock(&ne_pci_dev->enclaves_list_mutex);
+
+unlock_devs:
+	up_read(&ne_devs.lock);
+
+	return rc;
 }
 
 /**
-- 
2.47.1

