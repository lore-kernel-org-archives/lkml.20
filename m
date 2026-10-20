Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503803;
	b=uqK6EjzkgfA5/c6IZrM8JRJJ91K3YFXbdLEG0M7ZSSuy+LkiEoeSrAxySm2M+Iuue49p
	 e5Ox4vA/PnJ13MWpG18vt3u4zuAxV1M+51y3+iuyHLJ40rOaoERkEtYlK22lPEyWorQyI
	 bl93x6HBlgpOgABz/bAt516LJ2dKum852hxkkAwYlIvqTR48tkSXIKziit716PZnQDXTI
	 pneB9ZfJLMDLixt4fuy6tudi4DuTYDw9FqlGapGx9O4FP42znzVdfkD+mJ0vGW6hrOBx4
	 Bf+3T+bPyVwakyFcCd8oWru9gohsDhr35DhfzhvcyxUdzPQTo366XHDRwSFsbrDJ2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503803;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=aGY+AepYJ9EUm24rUQklzO333K6Smi6v5nvBhpLQ5k8=;
	b=GQa7s0p+SFXizqZSS9qsfKt3S8IkO9vlvq4+LzWVQBd1tEuu8z+OqsvWa7XT8hTnGC8L
	 bHYQZvkBXQQA9MswbgcUXpw96mgnsX/1Px14N4kvdMu3/ICxqDqVMxnxSR9G8X0pZG2jY
	 MDAJr4b0VzfH56OD70oeJZpYZO/KSOdhAPLegPXXdovevBTyIWAmRU9/dkPPG1+ull96P
	 g1YuAedlfuwOa8ExKOrp/ol4c+gCF6XQi3OOYI6aiDQ/xvjbigreXb0U10QmcJ+yHh41L
	 Sa7zgv2ndwZffYxRsFQYA7Hzte7Vf37jahzQ2IhbuXn8ulQFr5Bf8fnilJyp2tlq5cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=rLixHht4;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E960A260C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE8E960A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=rLixHht4
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aGY+AepYJ9EUm24rUQklzO333K6Smi6v5nvBhpLQ5k8=;
	b=rLixHht4Flo/bSI9h8dZHyimxvSZK2OGEU2jwyvC90gewO/qR5g2dU640lrjxaP/Yd3R+jahN
	/yVzsD3LYsHRFSD0YW7v93cb/879J5T6zhZdb2XNK3eKmjZaRcIOZApdL+YWinsQCMry+/53NTo
	lr5fmNcFVw4+YCbEv7u5AYc=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBp6qF7zKm8h;
	Tue, 20 Oct 2026 21:43:14 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1FE0D40572;
	Tue, 20 Oct 2026 21:43:19 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:18 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 14/15] arm_mpam: Use the request PARTIDs beyond the internal range
Date: Tue, 20 Oct 2026 21:42:38 +0800
Message-ID: <20261020134239.3921377-15-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020134239.3921377-1-ruanjinjie@huawei.com>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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
 drivers/resctrl/mpam_devices.c  | 25 +++++++++++-
 drivers/resctrl/mpam_internal.h |  2 +
 drivers/resctrl/mpam_resctrl.c  | 72 ++++++++++++++++++++++++++++++++-
 3 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index f81a2df11428..79bc3339a762 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -74,6 +74,18 @@ static DEFINE_SPINLOCK(partid_max_lock);
 static u32 mpam_num_closid;
 static u32 mpam_num_partid;
 
+void mpam_partid_map_init(u32 num_partid, u32 num_closid)
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
 
@@ -1581,6 +1595,15 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 		/* Update the intpartid mapping */
 		u16 intpartid = mpam_partid_to_intpartid(partid);
 
+		/*
+		 * Without resctrl managing the mapping, the fallback maps
+		 * every PARTID 1:1, which can exceed the internal PARTID
+		 * range. Wrap onto an internal PARTID, like the narrowing
+		 * mapping resctrl programs.
+		 */
+		if (intpartid > rprops->intpartid_max)
+			intpartid %= (u32)rprops->intpartid_max + 1;
+
 		mpam_write_partsel_reg(msc, INTPARTID,
 				       MPAMCFG_INTPARTID_INTERNAL | intpartid);
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index a4f2fdf7ac95..b62a0ecdd69f 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -478,6 +478,8 @@ extern u16 mpam_partid_max;
 extern u8 mpam_pmg_max;
 
 u16 mpam_partid_to_intpartid(u16 partid);
+void mpam_partid_map_init(u32 num_partid, u32 num_closid);
+void mpam_partid_map_exit(void);
 
 /* Scheduled work callback to enable mpam once all MSC have been probed */
 void mpam_enable(struct work_struct *work);
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 99b43ff2008f..04282f56b6d2 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -62,6 +62,9 @@ static DEFINE_MUTEX(domain_list_lock);
  */
 static bool cdp_enabled;
 
+static u32 resctrl_num_closid = 1;
+static u32 resctrl_num_mon_partid = 1;
+
 /* If resctrl is leveraging extra request PARTIDs for monitoring. */
 static bool resctrl_using_extra_partids;
 
@@ -269,12 +272,12 @@ static bool mpam_resctrl_hide_cdp(enum resctrl_res_level rid)
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
@@ -2011,6 +2014,65 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
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
+	u32 num_closid = (u32)mpam_partid_max + 1;
+	bool can_expand = false, blocked = false;
+	struct mpam_class *class;
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		struct mpam_props *cprops = &class->props;
+
+		num_closid = min(num_closid, (u32)cprops->intpartid_max + 1);
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
+		resctrl_num_mon_partid = (u32)mpam_partid_max + 1;
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
@@ -2032,6 +2094,9 @@ int mpam_resctrl_setup(void)
 	mpam_resctrl_pick_caches();
 	mpam_resctrl_pick_mba();
 
+	/* Decide how the request PARTIDs map onto the control groups */
+	mpam_resctrl_configure_partids();
+
 	/* Initialise the resctrl structures from the classes */
 	for_each_mpam_resctrl_control(res, rid) {
 		if (!res->class)
@@ -2087,6 +2152,9 @@ void mpam_resctrl_exit(void)
 
 	WRITE_ONCE(resctrl_enabled, false);
 	resctrl_exit();
+
+	/* resctrl is gone: forget how the PARTIDs were grouped. */
+	mpam_partid_map_exit();
 }
 
 static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_class *class)
-- 
2.34.1

