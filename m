Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E91B4E06D0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896643; cv=none; b=Da9xsW1kkrj6CbVvWlsSspe79im0S0fzkDJ3R1mSUy+nwlXEJ8lV3KKHCd90OoXaih0smeAOT0D4ncsqWTP0tPJ0JF+hVNkOWhtC8VaWhtfcxf+wjKH+5l4jnK+5l+xI47LBBVrtSwIeRFDoGjq61u/7Yx/CpytjFoDj9UVT14I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896643; c=relaxed/simple;
	bh=4vcsZ25CqlYw8WtJq/H02IRIUQgh0pu2X9tLpE8GNk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dMID1XV75UkMNJtrQ7Nfpga2NqbrkeZF9pwBk2cRIOvqzYs9s2TPcIMhBmU7WBiUCMi2yDdcM2OT4lkc1NXb2+ycCjxKdNdqn1FNKV7rhBjt3gJZcIfnHbxi+IXUvLhMV/5+jO9/kPSQUlivb7Ix6qs4OXkL7i1PRyPmF4vIGsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+yCwFhQ; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+yCwFhQ"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677b5148acaso2739886d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791896641; x=1792501441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIO78QiWK8kgfOkXvN+ipmBt58jQOeWlhfCMdouHK3g=;
        b=R+yCwFhQMLCIBoDakgw/bAbGsRo9erl6M+TAPv3Y9XFRS3kOfQl+EdfSrVrO62pu49
         AA+D3Sz3skQWOnfVYHh4pImWXW8JBgdB+IssI13oEpsttytDniyC40p4LWR/D4mdXxvc
         YTCnj8F+eq+QfOmHQOiWX21MxaBLOntFgh5GJOQcEfy/Zc/HV3AhpUgOZiZKELzxbMNo
         /pbiYQenZfej+Fq84qZ+q7bJPPJBZyd+7zl0a1PqSGvrMOrjB9K92elJppeXgn6BGup8
         hI5gJbXTeQ5FAJ7dofqKzucPmHvLZAP0L2LJJ1tpjW484HVhvtkZFN9T3YxhrnOZ1x/o
         dCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896641; x=1792501441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YIO78QiWK8kgfOkXvN+ipmBt58jQOeWlhfCMdouHK3g=;
        b=jOZ2tqE4y9Ye3Eo+JDVzHufoYCDqe4vXGVCsLjAsHKU3aO+zfKG7qTSGwQxl7bAnvl
         Lhs4Sy3uYZm/izGJiPFLoKp6pPEt1bUu7v/BAJA4nPtN8tbziRKn73Li9qsEwexTOFt5
         0wWm/ugRU+hidamuCvLdWbGhAce+Ev4g6kbqWr7GkZnXnGRNe1xDh8J8Ep4jQbT9Xmpo
         4Ro99xFkh9DLLNbEffL+mgbZB0mbAFJtJmnw3tiEg0TVJmVBsak90xB7VLBAUGbp4A25
         9hwaHo3tJjghdGz4nn00aHKu24v/NnB428t3EsoLdGoUAPw3THq42w50yJKGVMTM+3mT
         5rYg==
X-Gm-Message-State: AFq9FYJulLF7TMlwNCxSAbyAhOk798tCedu67sJoldLgAm88tLivObGO
	P/9HK1sl2aOPXbCfFvZxt+6M0dapJmCuCcfbuycDFor1Y7JBfBVlNd9Z
X-Gm-Gg: AYBFou2urwRIN+7Wxgd5d9u4Szzgdp+SREgRvk3IHbHClRLOL7Td5Q1b4eVDPCM6HQi
	R3KUORu9iSkXEYnhfwfZAPUxZeuEOvIoWF/57ISCmrRymyByvUPy2nRQCd9WIgp4KAQVDoopN7c
	w/0l4w5bz5UqdEfHMPeoXcew1beU6P7XctjJ9bgfz4ElyHw2+QadX0n+PCfgX8NdrS2a2n+5/B6
	l8NiXHWjoLFgn5VX29vzYasX3qS3bSL8lamBAP7GinHAwqM9MrV202QwQxKNe9Rin6Zrj7rvaU0
	ZJsl2Ft1tsHnRR85eQWkMW5ogjBhAwSgffm0CdngHuT0NjGzrnCzXYITPgFdiliC61YvY0uhV21
	AMEtF+1KFjMVc6w1DjScSLeKalKrCRo/M/NGfn9tV7LLKc6GowVK30Glajjb1pS4JrnZ+6BRPD3
	LhTLRcx8BdToisyU7RpUq7UncxBWT9ubAK5l09QD9xXBuGYz+fxkIYEqvCG8JFdLTQB9VED/uQf
	2IzHBYJBFlyWg==
X-Received: by 2002:a05:690e:4893:10b0:677:bb44:c06c with SMTP id 956f58d0204a3-6793602f9b7mr1988403d50.55.1791896640746;
        Tue, 13 Oct 2026 06:04:00 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356ffbecsm4797166d50.23.2026.10.13.06.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:03:48 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v6] arm_mpam: Use an atomic counter to schedule mpam_enable_once()
Date: Tue, 13 Oct 2026 21:03:34 +0800
Message-Id: <20261013130334.337468-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <019fee57-8984-4bd6-8912-ec9b1718eb08@arm.com>
References: <019fee57-8984-4bd6-8912-ec9b1718eb08@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mpam_discovery_cpu_online() scheduled mpam_enable() after each MSC
probe, and mpam_enable() walked the whole MSC list taking each probe
lock in turn to check if all the MSCs had been probed.

Count the MSCs that have had their hardware probed with
mpam_num_msc_probed, and schedule mpam_enable_once() directly when the
count reaches fw_num_msc, the number of MSCs reported by firmware.
MSCs that were already probed no longer cause work to be scheduled.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
Changes in v6:
- Drop the redundant initialisation of err, per review feedback.

 drivers/resctrl/mpam_devices.c  | 71 +++++++++++----------------------
 drivers/resctrl/mpam_internal.h |  2 -
 2 files changed, 23 insertions(+), 50 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..0d0803146f24 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -49,12 +49,20 @@ static LIST_HEAD(mpam_all_msc);
 
 struct srcu_struct mpam_srcu;
 
+/* Number of MSCs reported by firmware */
+static int fw_num_msc;
+
 /*
  * Number of MSCs that have been probed. Once all MSCs have been probed MPAM
  * can be enabled.
  */
 static atomic_t mpam_num_msc;
 
+/* Number of MSCs that have had their hardware probed */
+static atomic_t mpam_num_msc_probed;
+
+static void mpam_enable_once(struct work_struct *work);
+
 static int mpam_cpuhp_state;
 static DEFINE_MUTEX(mpam_cpuhp_state_lock);
 
@@ -72,7 +80,7 @@ static DEFINE_SPINLOCK(partid_max_lock);
  * scheduled via this work_struct. If access to an MSC depends on a CPU that
  * was not brought online at boot, this can happen surprisingly late.
  */
-static DECLARE_WORK(mpam_enable_work, &mpam_enable);
+static DECLARE_WORK(mpam_enable_work, &mpam_enable_once);
 
 /*
  * All mpam error interrupts indicate a software bug. On receipt, disable the
@@ -1850,9 +1858,8 @@ static int mpam_cpu_online(unsigned int cpu)
 /* Before mpam is enabled, try to probe new MSC */
 static int mpam_discovery_cpu_online(unsigned int cpu)
 {
-	int err = 0;
+	int err;
 	struct mpam_msc *msc;
-	bool new_device_probed = false;
 
 	if (mpam_is_enabled())
 		return 0;
@@ -1863,24 +1870,22 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
 		if (!cpumask_test_cpu(cpu, &msc->accessibility))
 			continue;
 
-		mutex_lock(&msc->probe_lock);
-		if (!msc->probed)
-			err = mpam_msc_hw_probe(msc);
-		mutex_unlock(&msc->probe_lock);
+		guard(mutex)(&msc->probe_lock);
+		if (msc->probed)
+			continue;
 
-		if (err)
-			break;
-		new_device_probed = true;
-	}
+		err = mpam_msc_hw_probe(msc);
+		if (err) {
+			mpam_disable_reason = "error during probing";
+			schedule_work(&mpam_broken_work);
+			return err;
+		}
 
-	if (new_device_probed && !err)
-		schedule_work(&mpam_enable_work);
-	if (err) {
-		mpam_disable_reason = "error during probing";
-		schedule_work(&mpam_broken_work);
+		if (atomic_add_return(1, &mpam_num_msc_probed) == fw_num_msc)
+			schedule_work(&mpam_enable_work);
 	}
 
-	return err;
+	return 0;
 }
 
 static int mpam_cpu_offline(unsigned int cpu)
@@ -2107,8 +2112,6 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 	return msc;
 }
 
-static int fw_num_msc;
-
 static int mpam_msc_drv_probe(struct platform_device *pdev)
 {
 	int err;
@@ -2715,7 +2718,7 @@ static int mpam_allocate_config(void)
 	return 0;
 }
 
-static void mpam_enable_once(void)
+static void mpam_enable_once(struct work_struct *work)
 {
 	int err;
 
@@ -2869,34 +2872,6 @@ void mpam_disable(struct work_struct *ignored)
 	pr_err_once("MPAM disabled due to %s\n", mpam_disable_reason);
 }
 
-/*
- * Enable mpam once all devices have been probed.
- * Scheduled by mpam_discovery_cpu_online() once all devices have been created.
- * Also scheduled when new devices are probed when new CPUs come online.
- */
-void mpam_enable(struct work_struct *work)
-{
-	static atomic_t once;
-	struct mpam_msc *msc;
-	bool all_devices_probed = true;
-
-	/* Have we probed all the hw devices? */
-	guard(srcu)(&mpam_srcu);
-	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
-				 srcu_read_lock_held(&mpam_srcu)) {
-		mutex_lock(&msc->probe_lock);
-		if (!msc->probed)
-			all_devices_probed = false;
-		mutex_unlock(&msc->probe_lock);
-
-		if (!all_devices_probed)
-			break;
-	}
-
-	if (all_devices_probed && !atomic_fetch_inc(&once))
-		mpam_enable_once();
-}
-
 #define maybe_update_config(cfg, feature, newcfg, member, changes) do { \
 	if (mpam_has_feature(feature, newcfg) &&			\
 	    (newcfg)->member != (cfg)->member) {			\
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index def0e3a65c23..021dedb9eab7 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -456,8 +456,6 @@ extern struct list_head mpam_classes;
 extern u16 mpam_partid_max;
 extern u8 mpam_pmg_max;
 
-/* Scheduled work callback to enable mpam once all MSC have been probed */
-void mpam_enable(struct work_struct *work);
 void mpam_disable(struct work_struct *work);
 
 /* Reset all the RIS in a class under cpus_read_lock() */
-- 
2.34.1

