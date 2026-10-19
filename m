Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C7C377A9E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395988; cv=none; b=kv2x2xAkxdrWnve385CXLhRyprBdBDeavPrRbdkyfIcnl8jAfLA8WsyihZ4XHCe9L+C5SigK0AZA2Dv+Yu3/vPgPBO2a9hTdU9UPVOyadJpWsJPG78YIKP5VIF6kB87hWyHQXZB/24mM/a7ckypoOzWsZRFfg2wMPMaNUSZO5Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395988; c=relaxed/simple;
	bh=pxkGMts6LRvUCdhClSpl8oIap14/o85wXc3/CiHeLmA=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=onHXbkkLQxAgHnYEyVaaW5B4ly+XGcjMImixEFufDgHhPAlQgCI4t4hBDp+sWpyCtd3o4hEECzF5hOnhk0st1EDJbtTin2Se9GasgIG4p5Aro8L1wpP1PHagSG9rt6V3W4NjLXLnEVGp5ELsHuM/VGD2uy8eAL0LiFwsbyiN0BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=LkQqgj6z; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="LkQqgj6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395981; bh=elyb0iXyNG854hyA71P6HS0H3VLpLTmDjbgy/oHwJgM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LkQqgj6ziF8KiPhF77kTxBh3D48dPy/k+NSFwJY6EpoShcNmyD8vCVkijfijByJdo
	 x4W34fYBNVuPYAi31Pdx3R3n+ag3LnWp25YNNwsE4PG4r4iFsT4OL6VhFV5P0tOfIj
	 KOXveb/cqjRreon7uj+7+msJ/+1UftlcjjwlOguE=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id B90B5685; Mon, 19 Oct 2026 15:46:16 +0800
X-QQ-mid: xmsmtpt1792395978tih297940
Message-ID: <tencent_8B0A4E9AF24412E2F6ADAC94C84CC231FA06@qq.com>
X-QQ-XMAILINFO: MMwjR1C73eIs4KTQ8RkQn90iYnRB9s7G4sQdBtgGgwyRacmzA3DgSMmk0XQQUe
	 WChpIS3szaRowCXqDItPWblCLY3I5V9A4xm7mYgfLtKml4LWPPm0uRhtnOUQtw0mC7b5wQH8DMZE
	 0a8w5LQi6NjiIDIqOASNxKBHNe/JKwjA4g/gn3iAizX2KOuvy2qMWDI5gcFsLjFyuW9CZ5m51N+u
	 FJyHTkrEjLqtU2mrbm/wO2+WHQUsfl5rliZnm59QtkucpvhBfgQ7qFNlvSj48rgNXS//mizBspX4
	 zCuOJTyTQfxo3LlKyp5iPuBC6+Idl4fuTMqVqA9UBOumCyMhntBkh69h0nwmD/HrrC0Zwc6JrrSg
	 zGcuUPSIqoSsOr2d0kXHkpmi7AFwjK4yN7vT6Z4yzUIgT26s3P+JKSprJs0RF6NTV06owrnxaks8
	 j04akQQeHECUmx2xTsdwCIeze6g6zujmA7SkV5i0A5QG5KXS5XNQOCXV9ipL1ltve5lRT1qPxFL/
	 77z3I5m1iL+6CrM8zu3wxE+HJ1MsZ3g6JbM1cq5jRwj+pj9JnW2Xv7LdXV6aeJISwjgU4P1QHiOr
	 LVg3u6TrLEEEJ3Ki6kEB9X1qs90QmA8XfKm216id1oerck5rihbjBc7a1ChZJsFQWBZGN+4yygML
	 r7snXXaQ2VRxsPvB4U93TtnWShRbR0PbTKuKUbneiTh7CgYVxV8K6ra7HjrAUp+zwYCXwpcn7O5O
	 F+frT6FFaXm7E0I/fa097QIM/TDBtaEeoetKARzupj6sAOWy2QRsVSI7aOS+yTSIWHx3Ph2sj8eh
	 eG1/tRBcaFBeaIhq9umws1ufy7+7TmLPv9HS9Q8N+2T7OJphqujCWXWMkkn7YDW3HEpkxJ52icmu
	 wO+Iaekm6xjfX25YcJOf3zuD6thIXpXAhV/jGVnMlAhrsOhLye+oslN9ffq8H7T2EG2w+Mly0iXI
	 C4m3b0UVvrQgPg1NAEQF+S9T2mhc66A2ZSptK/1vwSWsC7lx3tww9olLqiTMVm4pMKKQ+Hwkak8u
	 F5Nx9K1FNjosEsw1zIUROk0QF1F7kSMqx4zumA4AH22tOaH8QOWxtiXMioMhlyHAsv6sa6FLqEdo
	 6e99yMnJwz0zOb7kY=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	reinette.chatre@intel.com,
	ruanjinjie@huawei.com,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 14/15] arm_mpam: Use the request PARTIDs beyond the internal range
Date: Mon, 19 Oct 2026 15:46:07 +0800
X-OQ-MSGID: <20261019074609.2144405-2-2118537295@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019074609.2144405-1-2118537295@qq.com>
References: <20261019074609.2144405-1-2118537295@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

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
v9->v10:
 - Wrap the intpartid mapping into the internal PARTID range when resctrl
   is not managing the mapping
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
index d60dea846486..fb997b9d41d6 100644
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
@@ -1931,6 +1934,65 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
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
@@ -1952,6 +2014,9 @@ int mpam_resctrl_setup(void)
 	mpam_resctrl_pick_caches();
 	mpam_resctrl_pick_mba();
 
+	/* Decide how the request PARTIDs map onto the control groups */
+	mpam_resctrl_configure_partids();
+
 	/* Initialise the resctrl structures from the classes */
 	for_each_mpam_resctrl_control(res, rid) {
 		if (!res->class)
@@ -2007,6 +2072,9 @@ void mpam_resctrl_exit(void)
 
 	WRITE_ONCE(resctrl_enabled, false);
 	resctrl_exit();
+
+	/* resctrl is gone: forget how the PARTIDs were grouped. */
+	mpam_partid_map_exit();
 }
 
 static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_class *class)
-- 
2.43.0

