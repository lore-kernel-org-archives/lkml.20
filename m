Received: from mail-pz2-f31.google.com (mail-pz2-f31.google.com [74.125.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0899D3C416A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991410; cv=none; b=tNpqthePkondCw0eNrGgHMvr9EHDXB0o5aqpqJKbFv/hl4dFwjDMewjEatz3TI5+MK6l+gk2dZ1yaiG3d7puhkRK3qLpbsuP/n8Itmjs1OPIH4+3PmNTU5CIZ1Ear4iVCtfn+/xxKw/l4TkM8Ge4Otv+GiLmccJouhKiGTGDNXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991410; c=relaxed/simple;
	bh=pJtthfdXGcEngam82KC8Q9jE9Eya+A3LvHojQ4SiYCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QTujNnJj89xblTy9L6Kt4Mn0RtE5atXnICqfPKo7UZgVXwkfUWC18snAa9obaqhsfmv9pwxZqNM7zDQwCAS7VAbc+2mmeBGN6TRMUUQ6kelbTqtqIrT7U2tB5CSqKzRbZXL1AiATwrzV8PYqsck5Yf4Zwf2ss8DEaI9/QXP2LSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1LsjOq3; arc=none smtp.client-ip=74.125.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1LsjOq3"
Received: by mail-pz2-f31.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so494899a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789991408; x=1790596208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmeBMZqJtALHoE/5S4vqtP4zKqKZeq0+0/6mbWy8ZBQ=;
        b=Z1LsjOq3kaz8za17JVXfg7JAwpIPU9d6zpiCOjMo+xwFqw8kWpQMwIyL8AmQyZBNn/
         LPULb61Qfj+3dN7Wt1x09mQRY4l+Sh+B+APc025DlGfdxdDLj7rydN5NvUWroAeiHd8M
         71xj64gzsf/2km4VgXx6ODAzvrCP7DWTo3bKexNRpvoRmM9V3NuW9whSg8BGcamUkCZJ
         59oxiJ+NG4tEqM0/nW7ZwdMXJivAH+C9bJujJZKFOUoNjzC9Lnzl2Xr+wMMK1O5prD+Q
         uWgO2YcVgg1npdnqCkuaWqd8RJh6FSjqmEh/rjcMUltcHBpnR1I0TyufYpMEtDQk/5W2
         sxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991408; x=1790596208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmeBMZqJtALHoE/5S4vqtP4zKqKZeq0+0/6mbWy8ZBQ=;
        b=MpaPCu8d72Yh6AJOhIYP4njorqNL3eQ/1yUBr2EQLdoRJlCcfzRUjMcM1E5smdWCUV
         SQrMwKF4QXPv+7jSS6iXI7KsRRfyWrEN86j95UtrD+JDcz4recYY7uGbLM1lCcsZNy7W
         BXcktKaVDeLE/MGyusAIzD59YTrKVzK53mt0nwjVHDz6fhmlktfZQTfcP8ZeUilTsZb/
         w7TItafoyS0nDY9UmvYaN3jYuQ1jkhL8cEy6J1quprVqhAKN918Q4mMIATUe5+jALF8b
         XNMglJDcqxxdKXgtUrrKoywTynFOs64YqTXHat8nshIZZFt3Mx1FLdKjg9cXOnJqKPwX
         IedA==
X-Gm-Message-State: AFuF++l6lsYa5xYwgqU2FUtPF32d49dMH9Qmc9ceb1nkySx0nRVPPkTh
	rph8H6bKVVS/85gvWCFQBuxUignpPOqoCsXpcvcde3G5IKe3Es0S5R/g
X-Gm-Gg: AYBFou0lPok9ViyiukdP71PrS1WbO2LPXNasNNGyhu/i0Fi58P+pt3nXor5RQt/nrQM
	9FMlxvp6Mx+xPYC/F1vpaLOAn3RbWU6TOsBNztyrZE5BDGHoc4UkM68Fez9QWqXIKvZQ/mFBl6A
	/gvoizuCmIaxr+f56pNfNCxpiFFkDI5Kddac3kEEJYKcc6uOWk5rESNbxmccdEfBQTmGXkKJu/l
	RqWG8MRufYMniSSCJ5knScVTa7DdjO+qNwFY8TwzVFKFlDIPVGhWL10wxplP31mnFURWpxB4gzA
	doNdzE/s6J0NpxI84UrwsNljj3hnmWRLhzU6ORxDbnuwcrLiW4Tlh+cC1a37X9PzFM6giSj67S6
	33xF8VrV7rExpOCMPcrFjuPpXuk+NcMMg6CVRoB7AaYed/N8A+Nh7RxnR/5I0DKqmbIVtHDz1dM
	dyAPDJ5vvL+20eydU85IzJYWFtqeorDZFKS+BeJzD5fZqFqtbaL4AAP94m84Gyg5ge7GFAAd12w
	Zw=
X-Received: by 2002:a17:90a:fc4b:b0:3a0:2900:f55e with SMTP id 98e67ed59e1d1-3a02900f85dmr5227403a91.29.1789991408058;
        Mon, 21 Sep 2026 04:50:08 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a03bcecdd2sm3237277a91.1.2026.09.21.04.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:50:07 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v5] arm_mpam: Use an atomic counter to schedule mpam_enable_once()
Date: Mon, 21 Sep 2026 19:49:57 +0800
Message-Id: <20260921114957.3382350-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915115646.54113-1-leeonion.muyu@gmail.com>
References: <20260915115646.54113-1-leeonion.muyu@gmail.com>
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
Changes in v5:
- Schedule mpam_broken_work at the error site and return early,
  removing the duplicate err check at the end of the function.

 drivers/resctrl/mpam_devices.c  | 69 +++++++++++----------------------
 drivers/resctrl/mpam_internal.h |  2 -
 2 files changed, 22 insertions(+), 49 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 2f09f4b78bd3..4fc82acd854e 100644
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
@@ -1865,24 +1872,22 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
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
@@ -2106,8 +2111,6 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 	return msc;
 }
 
-static int fw_num_msc;
-
 static int mpam_msc_drv_probe(struct platform_device *pdev)
 {
 	int err;
@@ -2713,7 +2716,7 @@ static int mpam_allocate_config(void)
 	return 0;
 }
 
-static void mpam_enable_once(void)
+static void mpam_enable_once(struct work_struct *work)
 {
 	int err;
 
@@ -2867,34 +2870,6 @@ void mpam_disable(struct work_struct *ignored)
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

