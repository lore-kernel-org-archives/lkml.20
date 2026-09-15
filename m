Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA6435DA6D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442299; cv=none; b=KneApa8GW1NZmLArdAwj3pz4HbzWO0oUDymyajuXBCHQVfGJpKAPH1S/MiRbRZucNnQ7MF/gTPfgvCxkJSJ8yuDYsaUZy5sqOXl3XnhDjkjTGO2Ki6IUsXtb1l6UH2XP0lsdOu18wv+kdfOJvG0bUX/D4x+XSpXfy1LuoOv3J9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442299; c=relaxed/simple;
	bh=9MIRQgWd23+4WdFecOwmA448G83RhQfpq+7zQgsNnZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UoKph4nDmvducBRnCrAT8/4xauNU2klIZA7SeX8kTy+4GRwuMLuysXJB4ZIykQbruorgYWScq6LFrzEAqkrevKMmDuWBj2uCZF8sIhxE0ImD93IEwkbeUKnky8apXlHe3AxJv267JJofdMbt0rTLYTez21+PDnsd58xaa4AkA6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRAa3s7J; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRAa3s7J"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so2688113a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789442297; x=1790047097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpPB4wVCR/NTEf/+FAdWTUhl8u31h462ZSitYq4sSwA=;
        b=TRAa3s7JlkHBZLQ+QZoLCTNRBsCKdk3GvBKlAD3whOmH3uPMEDoACr9iypK+Si1CTy
         cQpq/DoNjZqZdXaUmCZ4zQ8MWrJvBxkEUNzpZxXi0h7v9ENNLyjTS3U7JrKMzF1J7bD+
         BVCF0VwAzCUbM/S00L+oljcl9rfkU5M8cJVTSeoVKck5+RqTvKtBeVCJLh6dqppsuFso
         cdnwy0xFM+RL+uvYyJxJhCk4j3XIcKNqHIlhTnVPqaKrmlljIQIA+7hRWVGShPztFJYj
         0a3i7QwExkFDf6DS5TzOi5fNvtDpU+xrPiVkYPgrgWWoGIghlzHFw5XoGLV0+1WZm/1g
         6S6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789442297; x=1790047097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpPB4wVCR/NTEf/+FAdWTUhl8u31h462ZSitYq4sSwA=;
        b=H5L2R6JRUl2PXqVBmu8dm5UZzP9X+i/zUsryAhsaLh/vz6uu1072jkJbvbI+Pt42Hj
         I7MWLuvoFkbtRPXVPbmIUXPrd+RDY5xxSlCuh1OkOVpIRxAaglgAFqTWPviNu9rk3FeZ
         Hg3w3jJeDHNGQ2XcK752joO8m8JKIZpPKmL310ScbeKBmbaUyvPS6znXtC/qAkifx3vv
         ONrwuqwvl8ESA/5fILuoCDG26BgJhi42OZI22VWlFxcvZxZAayYDF6734wpG2DWu6TsD
         G4rket4ewsnLgU+aWVn+FG46DkEXLT6+jXr4YcopppQf8t93WJuOut/Qh2cIMbo2DfIa
         F2Gw==
X-Gm-Message-State: AFuF++nPRLHwTE840lIPHqZZcZ+hVSSsLA+V0gb1uLeWp6COZ2W0oNcQ
	w0L94L/9vLg5ZV3H4msCM4YXRhbGPMJkh9PtY/egMSeJREXgzhFrmjYC
X-Gm-Gg: AYBFou3K9XnfStr5D1Rkr9sD6SVRmWFlhdmSTC3suVfWiLiBwZSBkICTP7r1pPKMFYX
	z1U8g0I9YeVPV38Enizh5aRqzHc4fFByEGEnBAn/dWfLSERxHa/f41K5fWlP88znrPzL6JdRJ1k
	YugG0hmXpD4/KBSn7i1HL2q20XQWVsvfWEHNa+OyIDnM2dQaq68XA8DEXCa1dHSrAbz5NWoEv7H
	oC5PI9qBD8jrf1J+jqnKFWM/CZKF4O6loUZugX8sfFIP1wZy/HRW0b6J0rzzu4f2+yP0xzBCrBd
	esu9vlnDJnA77qryo5nc2N0szKnZJnIhBB1s0PbmBtcELNqcRoW7PfALXeqlAgOtfHEw1k+Q/xv
	51i3vYLwcoCCFfVUShkhqZyYAKX2Ao/B4NClqBo2U7mYKP3dmixqY7FeLEYqT8qfnss3ra2uyeX
	xM7fW1MvueOiW9V9ZZYxNceMB7auepDN4M8LtAciBhMT7YYsGPyRKGdp5dVaKPhueUizeWoX8ap
	eU=
X-Received: by 2002:a17:90b:35c6:b0:39d:f247:bb3 with SMTP id 98e67ed59e1d1-39df2470c55mr9081508a91.21.1789442297250;
        Mon, 14 Sep 2026 20:18:17 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfbb0d314sm1026541a91.3.2026.09.14.20.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:18:16 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v3] arm_mpam: Use an atomic counter to schedule mpam_enable_once()
Date: Tue, 15 Sep 2026 11:18:09 +0800
Message-Id: <20260915031809.4073512-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908024846.2063161-1-ping.li@horizon.auto>
References: <20260908024846.2063161-1-ping.li@horizon.auto>
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
count reaches mpam_num_msc, the number of MSCs the driver discovered.
MSCs that were already probed no longer cause work to be scheduled.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
Changes in v3:
- Rework per review feedback: instead of scheduling mpam_enable() after
  each probe and walking the MSC list to check whether all MSCs have
  been probed, count the probed MSCs and schedule mpam_enable_once()
  directly when the last one is probed.

 drivers/resctrl/mpam_devices.c  | 47 +++++++++------------------------
 drivers/resctrl/mpam_internal.h |  1 -
 2 files changed, 12 insertions(+), 36 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 2f09f4b78bd3..c6000bc2157a 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -55,6 +55,11 @@ struct srcu_struct mpam_srcu;
  */
 static atomic_t mpam_num_msc;
 
+/* Number of MSCs that have had their hardware probed */
+static atomic_t mpam_num_msc_probed;
+
+static void mpam_enable_once(struct work_struct *work);
+
 static int mpam_cpuhp_state;
 static DEFINE_MUTEX(mpam_cpuhp_state_lock);
 
@@ -72,7 +77,7 @@ static DEFINE_SPINLOCK(partid_max_lock);
  * scheduled via this work_struct. If access to an MSC depends on a CPU that
  * was not brought online at boot, this can happen surprisingly late.
  */
-static DECLARE_WORK(mpam_enable_work, &mpam_enable);
+static DECLARE_WORK(mpam_enable_work, &mpam_enable_once);
 
 /*
  * All mpam error interrupts indicate a software bug. On receipt, disable the
@@ -1854,7 +1859,6 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
 {
 	int err = 0;
 	struct mpam_msc *msc;
-	bool new_device_probed = false;
 
 	if (mpam_is_enabled())
 		return 0;
@@ -1866,17 +1870,18 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
 			continue;
 
 		mutex_lock(&msc->probe_lock);
-		if (!msc->probed)
+		if (!msc->probed) {
 			err = mpam_msc_hw_probe(msc);
+			if (!err && atomic_add_return(1, &mpam_num_msc_probed) ==
+			    atomic_read(&mpam_num_msc))
+				schedule_work(&mpam_enable_work);
+		}
 		mutex_unlock(&msc->probe_lock);
 
 		if (err)
 			break;
-		new_device_probed = true;
 	}
 
-	if (new_device_probed && !err)
-		schedule_work(&mpam_enable_work);
 	if (err) {
 		mpam_disable_reason = "error during probing";
 		schedule_work(&mpam_broken_work);
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
index 04d1a59f02af..72bf296c846e 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -453,7 +453,6 @@ extern u16 mpam_partid_max;
 extern u8 mpam_pmg_max;
 
 /* Scheduled work callback to enable mpam once all MSC have been probed */
-void mpam_enable(struct work_struct *work);
 void mpam_disable(struct work_struct *work);
 
 /* Reset all the RIS in a class under cpus_read_lock() */
-- 
2.34.1

