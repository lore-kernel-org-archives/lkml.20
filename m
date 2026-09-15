Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A2F4AA56A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473442; cv=none; b=Vgl8FGOXLII9/VT6wMKbJTjthbk+lDoAmX90G3KrbuMSH5wdGNoa4s0/GTPdBIzcqS4O9TR9R3bjO+lP2gFOM1+gJqy29uSJlN1uB3J3TpUW8lKTJEigVs82MFjuqey5NmfAdHahMKfMcuSS8Fypb9kgbHAX4llqzLZc598FUEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473442; c=relaxed/simple;
	bh=87WpsvV3hsfe2Dmh+5z+Pc0iRquoTZtD1VgPC59NIQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FBfPOCI/dm0X/sMFOnM5bC4Oi9mzZ6bwPqMpXnYeXxRq6Ykc20j/tXjzZxVwjdPFQcC2l2lkMLC/nEXka3rjm4ZXN0Nk4boyPZr+lp1NT8sPC0BiyvQLwAE7OIO0M7jk45jdnckCSIpjC9F06oekIZTHm8TZKcDakx2BTrLZlGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQnVQxMX; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQnVQxMX"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c4so3109565b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473440; x=1790078240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QapZ5O+mnJ/kXDTghanTAR7OESrg5a8lNyFPPG6ndUo=;
        b=bQnVQxMX3I2GLL4gACMJHzTVZBevby03dVieAzsGgw9g+tY0l7DEViw08TPnNFxf7T
         vfd4FiyxTORaVbINbPSd9nyHheKt8ZWekb+S0q61dAtLEr8df+Ju+sUMqDPfrd+8nWZY
         P64OLd3yu0MlcsM9pO9TAc5FDzsWezjvjmk/1n7IOG5SBbjWX/ab9UHWxIMVG9JTqUZG
         ZNov10kLQdsaOpUAwo+fRRYb36docqg5yoQS3Y0M9SAyAQ+LZU8++OUULZgvnfAcYDW3
         MZVOW3j04TJmxZSI34A0zS9vD1M4SsPUdF7yVf6YGude66Q016YVs5+vg6+ctCZsBySq
         oSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473440; x=1790078240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QapZ5O+mnJ/kXDTghanTAR7OESrg5a8lNyFPPG6ndUo=;
        b=SGWWEQ93ulRaTL52NOJIoIrh4ha+1qia1+2HcO1UdZaAEw3yBiM04rw3wD4fG3WzgD
         UQ5+NCyZYqRqN5dM38tgGh+qsbS4JO/EkGjkrYW+W8SIFDqGYlLXTSETTt4+c3DlCO9S
         7NnizFqIRY+3aS5w2r3vZgD+4jaUlEBdy30m5PO4JwqjItOHTnnIz8WFrvXfMUB+joEq
         oEAuzsujohJBci7c5b5hI+99AxslV/Bif/j2jvaFTAC/Dl6u3jI/NM4+TK3NdQ4Y358+
         0wpP0AAb2bMV94gNbOHhAW8H5e+v9oRSnVfn+osJVFb7ldlpkvtPo/9E4acPfDwESwDj
         Wu5w==
X-Gm-Message-State: AFuF++nl4psMNFy+Ji/tZq11y2DTBcF1s8qd/3GltepRAg+vSJbExSPX
	twDLruY2Uzr+YqInY8GFVEweKMXwsktGPCwPB6rT9DcOrr3p6ooOd/AZ
X-Gm-Gg: AYBFou3MERaFgWA8dpXv6tMk1pIyE4290ufraHPvgZ6B9F1py92t52OCKaeixO/l70L
	vfHETtVZ1Y+abE2MdMphqu7KJFAK70QeGNRHM9ArwUZyik6gkLPcP0/KSntNnYsb8CPDfNP+UAC
	u8LK6J1NlN0PlPg4E9YmlASRNG9RfDw0MJgsGX3V4C2QGhck7wR5/woJ1xt2I+2S0oCr2r1pY+w
	kuwvSKuE399pGrxQWw/tLCmwqNqsY7mLv40FklVh+8uJx20nBj/I076RLCfpC6sG26dhmVIzD1G
	pYzrS7QuRTdch1LoeaeQkAmxqXwGun7t9f7pWFK+7zBAG4OUSIfXoFpmbAKRR/Az0Jh6JcIbL83
	vk921cRDVzoGskxD/vMXCNMP9BhtBpBWjJf+bGqJXrwbdXOfbpjPpx4GA38cl/PyXOxdIfRBsYJ
	mb6WuiqYiBFi3gZScr4D5hA6bhYZS+QmxemW9Bm+vT7qlElSljuClazmMs6FRasnAKcBDgRRRzM
	xI=
X-Received: by 2002:a05:6a00:3022:b0:857:726d:2e96 with SMTP id d2e1a72fcca58-86f852073acmr13967162b3a.19.1789473440057;
        Tue, 15 Sep 2026 04:57:20 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c4e5esm6370218b3a.19.2026.09.15.04.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:57:19 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v4] arm_mpam: Use an atomic counter to schedule mpam_enable_once()
Date: Tue, 15 Sep 2026 19:56:46 +0800
Message-Id: <20260915115646.54113-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915031809.4073512-1-leeonion.muyu@gmail.com>
References: <20260915031809.4073512-1-leeonion.muyu@gmail.com>
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

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
Changes in v4:
- Use guard(mutex) for the probe lock and continue/break to flatten
  the nesting, per review feedback.
- Compare the probed count against fw_num_msc instead of
  mpam_num_msc, which is more robust against unbind/bind incrementing
  mpam_num_msc past fw_num_msc.
- Remove the stale comment for the removed mpam_enable() declaration.

 drivers/resctrl/mpam_devices.c  | 57 ++++++++++-----------------------
 drivers/resctrl/mpam_internal.h |  2 --
 2 files changed, 17 insertions(+), 42 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 2f09f4b78bd3..adfb734755e6 100644
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
@@ -1854,7 +1862,6 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
 {
 	int err = 0;
 	struct mpam_msc *msc;
-	bool new_device_probed = false;
 
 	if (mpam_is_enabled())
 		return 0;
@@ -1865,18 +1872,18 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
 		if (!cpumask_test_cpu(cpu, &msc->accessibility))
 			continue;
 
-		mutex_lock(&msc->probe_lock);
-		if (!msc->probed)
-			err = mpam_msc_hw_probe(msc);
-		mutex_unlock(&msc->probe_lock);
+		guard(mutex)(&msc->probe_lock);
+		if (msc->probed)
+			continue;
 
+		err = mpam_msc_hw_probe(msc);
 		if (err)
 			break;
-		new_device_probed = true;
+
+		if (atomic_add_return(1, &mpam_num_msc_probed) == fw_num_msc)
+			schedule_work(&mpam_enable_work);
 	}
 
-	if (new_device_probed && !err)
-		schedule_work(&mpam_enable_work);
 	if (err) {
 		mpam_disable_reason = "error during probing";
 		schedule_work(&mpam_broken_work);
@@ -2106,8 +2113,6 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 	return msc;
 }
 
-static int fw_num_msc;
-
 static int mpam_msc_drv_probe(struct platform_device *pdev)
 {
 	int err;
@@ -2713,7 +2718,7 @@ static int mpam_allocate_config(void)
 	return 0;
 }
 
-static void mpam_enable_once(void)
+static void mpam_enable_once(struct work_struct *work)
 {
 	int err;
 
@@ -2867,34 +2872,6 @@ void mpam_disable(struct work_struct *ignored)
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
index 04d1a59f02af..085f086e2b2d 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -452,8 +452,6 @@ extern struct list_head mpam_classes;
 extern u16 mpam_partid_max;
 extern u8 mpam_pmg_max;
 
-/* Scheduled work callback to enable mpam once all MSC have been probed */
-void mpam_enable(struct work_struct *work);
 void mpam_disable(struct work_struct *work);
 
 /* Reset all the RIS in a class under cpus_read_lock() */
-- 
2.34.1

