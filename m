Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318009;
	b=jJz1aNIvFQPjRp5uAeVi7UyrmLe9TN5MWv1HnMZ5UDQ/nETbqhF4T91wSkUqoLDZnn5b
	 8KNxAb2BBdWw2/CTRNlavnKletRzQ4LGXMbquV1VFcizeoo7K4bZL9K4ukFpZYMc72nlm
	 A7W/SZkC8W9enufTnIGLyT/S8eYwI+qmw3o8iy/GVkhISBz9zrs7ueoqOXmwwqRJXP66V
	 l1mPwU1xLgjGYlXAbadRjJSUwbKRbSlgcPVr2Kwsba3WMCk7fgvN8yrT+mQnMUDp5ItA/
	 RGvkTI7JxssWk6ToSrUsloarfq55Y/lVQuZoQSzVAHj/WqBr2yEE7ExZ7YH8KcjRung==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318009;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=wmZRRxF9P2WywNu2e79cn3gKlus8G4417OVoGcz0qRI=;
	b=g1vrZADSHgrlNpVVQiaFiAyF42wPcKnLovom3r+agG4Od9JsCL6VKwcScu3Q7gMmqWyj
	 9aEfgwBBTV5smBZCx0rCkcuOBRXGdy6SJWr8gNlS0ZO1xdY0OUu4erQmvRE3nWiWsg13u
	 NAa853uaS6howCW/6JMg/f62vnFfE/QUf5xN17QVdVIcVa2AO65fOFTVSq2RC3LM+Uki2
	 eS1DqsKrFOv+pDIw6Qh6wM0oWYjPuMqOysdhBYSBdwCu2pVfK0nV9VZwhTEHKLDbsYqp3
	 bo43iGqccruC6/I2WONVr7xmfHbZd2Cxi0lZR2x2RdnZgwt9e5PtI9JmuD6lB70yZDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=zHQ4Rdxe;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7566F606A760;
	Tue, 10 Nov 2026 13:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7566F606A760
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=zHQ4Rdxe
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wmZRRxF9P2WywNu2e79cn3gKlus8G4417OVoGcz0qRI=;
	b=zHQ4RdxejMhw69nHV9s7EYAAI6i0vSrSj2IhKY+/3Es9t0lfkCZ0N6c/GnFsBmiyw/2m79Ej1
	O/cDF35/IsBxpeClWJW49xBCBEKRNigUxjpDnsvzUS4O9ta/NfN+6go9asYde37ARYqdGRyQHX+
	mxIbexJVYETqMNjyArKIL5s=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jP77B5sjMzmVgP;
	Tue, 10 Nov 2026 21:39:50 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 62C344058A;
	Tue, 10 Nov 2026 21:40:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:40:04 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <will@kernel.org>, <gshan@redhat.com>,
	<zengheng4@huawei.com>, <jic23@kernel.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 RESEND 5/7] fs/resctrl: Release the limbo RMIDs when the CDP state changes
Date: Tue, 10 Nov 2026 21:39:36 +0800
Message-ID: <20261110133938.3768632-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110133938.3768632-1-ruanjinjie@huawei.com>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

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
2.34.1

