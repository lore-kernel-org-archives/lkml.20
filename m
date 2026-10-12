Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F58450404
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793491; cv=none; b=Xv7pVZ5t/10Ko+coego9A/SadC2MY1kV+eF1GTHiDHqonC11qcA4918//0eCINnThcqvPO1ysTMUPlrGv++dhPgmpGPQKCxuiK1v4Py56v5idhTli6QUeKehreQTEwkOkNdAvaok6yeb8+0lcNWzBG5RFBIwavVoW4utZyeclcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793491; c=relaxed/simple;
	bh=1LKve/Gi4nk3fMvyTGvqgxe2kdbKCYXbNHl/OVT8rW4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bs+nk2oKCYwMBA2K4vbsTS82EKjZXBY/HzyIpiDrAVn7w/m7GIpLYXiK/mcU4veJK106BMvqAqcN1+XdvUvY1VaXoRoXo//rd+Al1QiNW0Idgn4m68DA57gMX3ii9sSu1+8i8o60zlxLVcGFIqFwD4Cgy00lAcWH8IzqD7iEayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=aZhGFU0T; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="aZhGFU0T"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cOM00yF4lFnpGALd1fWOcqCiOcK7DXV76BAJMgz+Ubc=;
	b=aZhGFU0TDljH/FvyvAEZckmSb+niQbUauwUYzpQRD5qCfTzdDY33IxBlkXa53tcLb90ztclBv
	Z2Gye+JAQGhNZvqJVlsZJN4UZGonUweTaApUpElkrVokdpHlV604BNVz2TxUUnm776c/clNKEih
	c1cEfwrGcOI+hl8buqB4cSw=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j39Dh2glCzKmWF;
	Mon, 12 Oct 2026 16:12:20 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CF0964057A;
	Mon, 12 Oct 2026 16:24:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 16:24:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 9/9] arm_mpam: Use the request PARTIDs beyond the internal range
Date: Mon, 12 Oct 2026 16:23:37 +0800
Message-ID: <20261012082337.822258-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012082337.822258-1-ruanjinjie@huawei.com>
References: <20261012082337.822258-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

A class that implements PARTID narrowing maps several request PARTIDs
onto one internal PARTID. The internal PARTIDs hold its controls, and
the request PARTIDs can each be a monitoring group. This gives one
control group more monitoring groups than the PMG count alone allows.

The extra request PARTIDs can only be used when no class would lose a
non-aliasing control: its value can not be written to every PARTID of a
control group, whereas an aliasing control's value can. Every class is
considered, including the ones resctrl does not use, so that an unknown
class can still gain a resctrl schema later. This is decided once,
before resctrl_init(), and there is no user interface for it.

The driver stops reducing msc->partid_max, so the full request PARTID
range is available, and the resctrl glue code starts handing out the
extra ones. A control group's configuration is written to every request
PARTID that maps onto it.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Suggested-by: James Morse <james.morse@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 16 +++++++-
 drivers/resctrl/mpam_internal.h |  2 +
 drivers/resctrl/mpam_resctrl.c  | 72 ++++++++++++++++++++++++++++++++-
 3 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 17c29022d75d..207456bcab08 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -74,6 +74,18 @@ static DEFINE_SPINLOCK(partid_max_lock);
 static u16 mpam_num_closid;
 static u16 mpam_num_partid;
 
+void mpam_partid_map_init(u16 num_partid, u16 num_closid)
+{
+	mpam_num_partid = num_partid;
+	mpam_num_closid = num_closid;
+}
+
+void mpam_partid_map_exit(void)
+{
+	mpam_num_closid = 0;
+	mpam_num_partid = 0;
+}
+
 /*
  * Map a request PARTID onto its owning control group using modulo
  * interleaving. Without resctrl active, every PARTID maps 1:1 onto itself.
@@ -959,6 +971,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 	 * A RIS that implements PARTID narrowing has one configuration per
 	 * internal PARTID, and several request PARTIDs share it. Record both
 	 * limits in the resource properties.
+	 * Keep msc->partid_max at the full request PARTID range. The resctrl
+	 * glue code will broadcast a control group's configuration to every
+	 * request PARTID that maps onto that group's internal PARTID.
 	 */
 	props->partid_max = msc->partid_max;
 	props->intpartid_max = msc->partid_max;
@@ -969,7 +984,6 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 
 		mpam_set_feature(mpam_feat_partid_nrw, props);
 		props->intpartid_max = min(props->intpartid_max, intpartid_max);
-		msc->partid_max = min(msc->partid_max, intpartid_max);
 	}
 }
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 0433ca6faaba..2ee8f8069685 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -477,6 +477,8 @@ extern u16 mpam_partid_max;
 extern u8 mpam_pmg_max;
 
 u16 mpam_partid_to_intpartid(u16 partid);
+void mpam_partid_map_init(u16 num_partid, u16 num_closid);
+void mpam_partid_map_exit(void);
 
 /* Scheduled work callback to enable mpam once all MSC have been probed */
 void mpam_enable(struct work_struct *work);
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 8479fdd7f713..56611ef13bca 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -62,6 +62,9 @@ static DEFINE_MUTEX(domain_list_lock);
  */
 static bool cdp_enabled;
 
+static u16 resctrl_num_closid = 1;
+static u16 resctrl_num_mon_partid = 1;
+
 /* If resctrl is leveraging extra request PARTIDs for monitoring. */
 static bool resctrl_using_extra_partids;
 
@@ -279,12 +282,12 @@ static bool mpam_resctrl_hide_cdp(enum resctrl_res_level rid)
  */
 u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
 {
-	return mpam_partid_max + 1;
+	return resctrl_num_closid;
 }
 
 u32 resctrl_arch_system_num_rmid_idx(void)
 {
-	return (mpam_pmg_max + 1) * (mpam_partid_max + 1);
+	return (mpam_pmg_max + 1) * resctrl_num_mon_partid;
 }
 
 /* The request PARTID and PMG a resctrl RMID maps onto. */
@@ -1927,6 +1930,65 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 	}
 }
 
+/*
+ * Decide how the PARTID space is presented to resctrl. This runs once the
+ * classes are known, and before resctrl_init() advertises any limits to
+ * user-space.
+ *
+ * The extra request PARTIDs on a class that implements narrowing can be used
+ * as monitoring groups. That is only safe when no class would lose a
+ * non-aliasing control: its value can not be written to each PARTID of a
+ * control group, whereas an aliasing control's value can. A class that
+ * implements narrowing doesn't have the problem, as its PARTIDs are already
+ * configured as one.
+ *
+ * Every class is considered, including the ones resctrl doesn't use. An
+ * unknown class may gain a resctrl schema later, and using the extra PARTIDs
+ * would prevent that.
+ */
+static void mpam_resctrl_configure_partids(void)
+{
+	struct mpam_class *class;
+	u16 num_closid = mpam_partid_max + 1;
+	bool can_expand = false, blocked = false;
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		struct mpam_props *cprops = &class->props;
+
+		num_closid = min(num_closid, (u16)(cprops->intpartid_max + 1));
+
+		if (mpam_has_feature(mpam_feat_partid_nrw, cprops)) {
+			if (cprops->intpartid_max < cprops->partid_max)
+				can_expand = true;
+		} else if (mpam_props_has_non_aliasing_controls(cprops)) {
+			pr_debug("class %u has non-aliasing controls without narrowing\n",
+				 class->level);
+			blocked = true;
+		}
+	}
+
+	if (!num_closid)
+		num_closid = 1;
+
+	resctrl_num_closid = num_closid;
+	if (can_expand && !blocked) {
+		resctrl_using_extra_partids = true;
+		resctrl_num_mon_partid = mpam_partid_max + 1;
+	} else {
+		resctrl_using_extra_partids = false;
+		resctrl_num_mon_partid = num_closid;
+	}
+
+	/* Tell the driver how the request PARTIDs map onto control groups. */
+	mpam_partid_map_init(resctrl_num_mon_partid, resctrl_num_closid);
+
+	pr_debug("PARTIDs: monitor=%u closid=%u extra=%u\n",
+		 resctrl_num_mon_partid, resctrl_num_closid,
+		 resctrl_using_extra_partids);
+}
+
 int mpam_resctrl_setup(void)
 {
 	int err = 0;
@@ -1948,6 +2010,9 @@ int mpam_resctrl_setup(void)
 	mpam_resctrl_pick_caches();
 	mpam_resctrl_pick_mba();
 
+	/* Decide how the request PARTIDs map onto the control groups */
+	mpam_resctrl_configure_partids();
+
 	/* Initialise the resctrl structures from the classes */
 	for_each_mpam_resctrl_control(res, rid) {
 		if (!res->class)
@@ -2003,6 +2068,9 @@ void mpam_resctrl_exit(void)
 
 	WRITE_ONCE(resctrl_enabled, false);
 	resctrl_exit();
+
+	/* resctrl is gone: forget how the PARTIDs were grouped. */
+	mpam_partid_map_exit();
 }
 
 static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_class *class)
-- 
2.34.1

