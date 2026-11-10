Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322277;
	b=2AR6pIHmFLOxaXVPSKJknYdnIiFCn/+ErlqPHYDjsTMOSMSF8q+VASsA2fqPCf7H//hR
	 TGuUkzsmsxf5EcJH2NfBMi6CcLYVv7Ox+SfRKmDyYhozOoK7NNjyEvdFECwaiFgO5eUNO
	 cHbL1Qca2rGjGHRP8AfI8YJtF3Y5wRt6euCarb6Vx8yRjLf1MPG7HI3DYhNj+3IRPO/wa
	 RYYWKnxeGYe2dKW6ooXnkmQPVSSvRoqYjS6RAT+nG5bRLdM2NxcL3nKIZTxC7MFtioNNb
	 3OPN2PbbxZZvZ0MFJHGNFVAewpffKNt8nxbNCj+aqVGxBgQfoDhobqewO3DCPh4fqBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=60siS61lJQVsPLSNWq9Yx9eryDhQch+eqG8LRWnJFnM=;
	b=PGsJ+7QyvZ1ndDHyseIlNU5iqEgfXqEaigrRkqD0Egl7iekzCHeCAQO5UMjiQGmz58Dl
	 2Ltdchp59qGT6y3c8OssrLYI3tFbtX4jFleHVMhSIUQCUruS5fDs5JLnXW+XosLV/xslu
	 JKsQXlTOCFpstBLlMPrNBDLj00KN0wVDQPc1Wq8K7vqwfyQ4W0+PgyCnD/28NvHkClUaW
	 Dg5rNaTa6HeP6qHfUfwJQ4L0D1uBuld7frwkeLSe0tu6k68UZnyY00hjIGTCpALDASoiy
	 nU6niAoa95kl89Jtcyf6PxlmmEY5aC8tWcVkr+rf5zZ4gGSQuPE1PRiJAJiZZxUvzGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ziNVDBZ3;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE45606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE45606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ziNVDBZ3
Received: by mail-oo2-f5.google.com with SMTP id 006d021491bc7-7033e26cb19so686265eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794322275; x=1794927075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60siS61lJQVsPLSNWq9Yx9eryDhQch+eqG8LRWnJFnM=;
        b=ziNVDBZ3R9Qc3e5hzE1jAUyxnCJJIOHX55aVsPw87gdFpjEhS2n5l52/JNlLuPambf
         ZeW7a7/Js7vICV+B7JzhOTHSLqslh6fZ1Wn3EYR1gDquiQU3nEyLcmXh4o2zeBVBtB0I
         IWK8jtvLjY7WNn5RIEuXTH5aVrhMuaU/uDzt+b2EaaEpsV3K+fUQhMAhv4+/cv8eMLMc
         1bDCxOUR6IXQ5W/O1Cm13d2dxO7cFKx3DuEiPWHs2zPxzVapZOamGt6E3viBFwTqx0mk
         Q4ZWVNeOTX1v/aRo0QIdsGb/VmI4X6/l8wkwdFEZEftkzbJPHPuL3NAMmBYJhfVUzxlT
         rseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322275; x=1794927075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=60siS61lJQVsPLSNWq9Yx9eryDhQch+eqG8LRWnJFnM=;
        b=wyXKb99amgq9/H6k01R0IlwDDj0SNo4MAoimme2QbKKJ2o2e8X2u2cRznj8vDBwiIa
         bAvonUvXKr0kbR6BpAmYf4Djnl9fAjA/nCteN8yYS34tZW94IjUz6EPOj9jFy2OE2lBw
         Sq7BLy38mg4BdN8129XZIjy5/r58VOLrU0b/I+DYUdrk7e3TazDvTdg1D/Qkfz3ZJeYl
         MIHWjz6lN5WBCNr48bo6KU7ZQFNxkVlLk5Oy9VcRXbTtYzFnQvIRk537j9/n7UthkDa5
         9gSV54JyoGhDxuI38Mkx36N3EP5hNO96mH1jkxTW5ddbpJezCSs9JjLMxa7gemPBS+0D
         1jEA==
X-Forwarded-Encrypted: i=1; AL+hErGLfVhwoSXvqhvTBZd4G8mgInTevYWku/W1+wMqEng1rmw9YNrTErALHybyfCUn0i3ukf99g6tEiZ/M8H8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fa294y+3dG4zvVcAhZ+PyjphTbGw59zpfYX9nwAGk4/ib/ADb
	n4eBSdeoVjCsM0EFOEPuepDkYeGja/ZiTQfpsTa4/1DIIC37clXIWI4vDGMsB2pN
X-Gm-Gg: AYBFou3nYlunymI+xGNYc6bhVLOUeKW9QLiXeAKk5LSdNGoLgl20RABaDUUiFqNsnA2
	lnT1cc+3T1Vd7oQJTtrWIuiYQa9U7NfDwyiGQYAqMlWlQWEXDYwWf9dN8fLaeMWuIUlfRS+N3yR
	3ADlgp+zen+DOaQosKBSoCIV5JLigm00SisrE+2fBvfTxIUXNsl/eyEI/nZCBd9a6ATEETsH1TQ
	xwGNeswp6aR90L5dKTruI78g4CKOccBCYN/VpeeUEq/E/FhnzGJBw4e9hDhkA2SJmOnFB5/n2Ce
	/JAloBBk77ucZUCOPpHy398rN/SPbnaEXKdrantGjAFJIv2NRXLjKN4XFp+OVuZZWNT7LthEIXF
	2+fHdtzAC1RCmvmtC9gZbhtPzWq0CmrFI/hGe+LgsVwtEMkrOxfxM5wHAAr5B1c7wTKTB+toVZy
	DWcXU15vLBtcUsOuilCorgqqIYZ06Y9T1Sl7YhOuoYR6ZeUEsFobjqleZ3f0TPzppGrooovbpaG
	ulXGF39O7jluqQr3/DGEXoXz8TuNhyDQ6UgjtkQyEFhQK/m6gH4QGbwNInIV2ZLb7UsfNtEmdhZ
	xYAiXovV236PeENEygu7Cmlmye4HwXPQWL6ejCVYe4jNXd+i6PjS/NWWc8Up6CFH
X-Received: by 2002:a17:902:f64f:b0:2e9:9bac:2e84 with SMTP id d9443c01a7336-2edb92bb80bmr24201345ad.66.1794316918385;
        Tue, 10 Nov 2026 05:21:58 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:58 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 5/7] fs/resctrl: Release the limbo RMIDs when the CDP state changes
Date: Tue, 10 Nov 2026 21:20:52 +0800
Message-ID: <20261110132054.3702-6-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

On MPAM the counter of an RMID is selected by the PARTIDs of the CLOSID
that owned it. Without CDP, CLOSID c is PARTID c; with CDP it is
PARTIDs 2c and 2c+1. An RMID that stays in limbo across an unmount and
a mount that changes the CDP state is read through the PARTIDs of the
new state, which are not the PARTIDs its cache lines are tagged with.

With 5 PARTIDs:

  mount                  CDP off, CLOSID c -> PARTID c
  mkdir g1..g4           CLOSIDs 1..4
  umount                 RMIDs enter limbo with CLOSIDs 1..4
  mount -o cdp           CDP on, CLOSID c -> PARTIDs 2c, 2c+1
  limbo handler          reads CLOSID 2 as PARTID 5 > PARTID_MAX 4
                         MSC error interrupt, mpam_disable()

The other direction is worse because nothing reports it. If resctrl is
mounted with CDP and mounted again without it, CLOSID c is read as
PARTID c, which is in range, so the limbo handler silently tests the
occupancy of the PARTID of a different CLOSID and frees or keeps the
RMIDs based on it.

When a mount changes the CDP state, release the RMIDs in limbo without
reading them instead of restarting the limbo handler. Cache lines that
still carry those RMIDs are accounted to the next user of each RMID.

The CDP state that matters is the one that changes the PARTIDs used by
the monitors, which is not necessarily the CDP state of the L3
resource. MPAM gives every CLOSID two PARTIDs in all MSCs while CDP is
enabled on any resource, so enabling CDP on L2 alone also changes the
PARTIDs the L3 monitors use. Add resctrl_arch_mon_cdp_enabled() to let
the architecture report this. Only MPAM can be affected, so the RMIDs
are only released where the RMID depends on the CLOSID. On x86 the
RMID does not depend on the CLOSID, and resctrl_arch_mon_cdp_enabled()
returns false.

Reproduced on QEMU with the sequence above:

  mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
  mpam:mpam_disable: MPAM disabled due to hardware error interrupt

With the change the sequence completes without an error.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1+
---
v5:
- Split the change of the limbo handler lifetime into the previous
  patch. The limbo handler now stops while resctrl is unmounted on every
  architecture, and only the release of the RMIDs depends on
  CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID.
- Drop the cqm_work_cpu changes. resctrl_limbo_resume() cancels the
  worker before it queues it again or releases the RMIDs.
- Move the rdt_disable_ctx() reordering to a separate patch.
- Add resctrl_arch_mon_cdp_enabled() instead of comparing the CDP state
  of L2 in the file system.
- Rename limbo_cdp to limbo_cdp_enabled and document that it is only set
  with CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID.
- Check QOS_L3_OCCUP_EVENT_ID first and drop the rmid_busy_llc check.
- Use lockdep_assert_cpus_held() at the start of resctrl_limbo_resume().
- Describe the reverse sequence, from CDP on to CDP off.
- Link to v4: https://lore.kernel.org/all/20261105070934.2258613-4-ruanjinjie@huawei.com/
v4:
- Use resctrl_mounted instead of a separate limbo_paused flag.
- Record the CDP state once when resctrl is mounted.
- Add resctrl_limbo_resume(), called once resctrl_mounted is set.
- Previous Link: https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/
---
 arch/x86/include/asm/resctrl.h |  6 ++++++
 drivers/resctrl/mpam_resctrl.c |  9 +++++++++
 fs/resctrl/monitor.c           | 25 +++++++++++++++++++++++--
 include/linux/arm_mpam.h       |  1 +
 4 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 8f6edcdcfd87..d88a09a45d7b 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -181,6 +181,12 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
 	return rmid;
 }
 
+/* The RMID does not depend on the CLOSID, so neither does CDP change it */
+static inline bool resctrl_arch_mon_cdp_enabled(void)
+{
+	return false;
+}
+
 /* x86 can always read an rmid, nothing needs allocating */
 struct rdt_resource;
 static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..563ca99a581d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -148,6 +148,15 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 	return mpam_resctrl_controls[rid].cdp_enabled;
 }
 
+/*
+ * CDP emulation gives every CLOSID two PARTIDs in all MSCs, so CDP enabled
+ * on any resource changes the PARTIDs the monitors use for a CLOSID.
+ */
+bool resctrl_arch_mon_cdp_enabled(void)
+{
+	return cdp_enabled;
+}
+
 u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val)
 {
 	return val;
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index f56d0e32fd06..87d744a168fb 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -70,6 +70,14 @@ static u32 *closid_num_dirty_rmid;
  */
 static unsigned int rmid_limbo_count;
 
+/*
+ * @limbo_cdp_enabled - Whether CDP changed the hardware IDs the monitors
+ *			used for a CLOSID when the RMIDs in limbo were freed.
+ *			Only set when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID
+ *			is enabled.
+ */
+static bool limbo_cdp_enabled;
+
 /*
  * @rmid_entry - The entry in the limbo and free lists.
  */
@@ -1044,12 +1052,15 @@ int setup_rmid_lru_list(void)
  * resctrl_limbo_resume() - Restart the limbo handler after a mount.
  *
  * The limbo handler stops while resctrl is unmounted. Restart it on every
- * domain that still has RMIDs in limbo.
+ * domain that still has RMIDs in limbo. Where the RMID depends on the
+ * CLOSID and the mount changed the hardware IDs a CLOSID is monitored
+ * with, the RMIDs in limbo can no longer be read: release them instead.
  */
 void resctrl_limbo_resume(void)
 {
 	struct rdt_l3_mon_domain *d;
 	struct rdt_resource *r;
+	bool release = false;
 
 	lockdep_assert_cpus_held();
 	lockdep_assert_held(&rdtgroup_mutex);
@@ -1057,6 +1068,13 @@ void resctrl_limbo_resume(void)
 	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
 		return;
 
+	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
+		bool cdp_enabled = resctrl_arch_mon_cdp_enabled();
+
+		release = cdp_enabled != limbo_cdp_enabled;
+		limbo_cdp_enabled = cdp_enabled;
+	}
+
 	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
 				lockdep_is_cpus_held()) {
@@ -1068,7 +1086,10 @@ void resctrl_limbo_resume(void)
 		 * it is queued again on a CPU picked now.
 		 */
 		cancel_delayed_work(&d->cqm_limbo);
-		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
+		if (release)
+			release_limbo_rmids(d);
+		else
+			cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
 	}
 }
 
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 002f56e15362..ff1e1d6420fa 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -62,6 +62,7 @@ bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
 u32 resctrl_arch_system_num_rmid_idx(void);
+bool resctrl_arch_mon_cdp_enabled(void);
 
 struct rdt_resource;
 void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
-- 
2.43.0

