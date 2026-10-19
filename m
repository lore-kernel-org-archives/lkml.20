Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A858848FF93
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395327; cv=none; b=anF4D/ReUHtb8WtycxXhyHclzT/U3juUXdf0pAnvnK2uum8XK/kmnPQZpLrafP0MZsLEQiVp1uOayNWY93bcGgx3n3Kw8p41WoGklETD8XXe3hQF6H8jNlONTtKY8s6YFOXTNNGHabStktriQ0TWfcNjSyosjgngF7WmNrenB9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395327; c=relaxed/simple;
	bh=YBe3DO5fECyTBBs4Pkg+d44igbYn4AQHBr06wWk/F/k=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=m1HubaWIbdHH/bzptQ+u951zTkBMrgZS8t7oMGiWoCDSw0O0vExzSs9V6I+WA1t9aHIUT135BgjJ09VI+gbLgWvvFti6OqIYnsb3T3hvGFVdluFSXy7nrcTP56AEvyABk2IBcjmMCJEObgl8BBdd2r4trND6m64ocMqSi16wFZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=cMMzB0kx; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="cMMzB0kx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395317; bh=QjMEe+lvmh5CdL/gfhUj8ZDRTwOOdw+xq6lFpzMu+Sk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=cMMzB0kxzZbwU/cnwhmwCnt3SRHqyqHqQ3+LRtN3FuLf1JNu2wIGssw69P9xtoja3
	 UDwPLrW/8+ZZ1Dvd+FiOQB9jvPUAQOPe82ZoFIwKG/iWCG0GYQ9MIF2kg1CQAMgaOf
	 hyU6ZI3wbJ8UcrCPEsE3+ASrqtUeEwNCj23t9H3M=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395314ty5mmwyuw
Message-ID: <tencent_B5E219E663D81597B485092444BF5B2FA907@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uj1/CIw6g/zbyqVjl9vxV3vXIsDwOrnN1cDp48ApywtVOBwkxog
	 Wm2APF+BTJsMVWAuu3hTg/xVU/UUbwiBDTDZJdtJklo0v1dGn4Le4D95hvcDpsbNFTp9Z1suEVTg
	 NcTxAObOQrvp6vWH/vD0F1bCCV+IEyhANXMbUnwKtfXFlDaxOAKxzxfosk28DQWdHqZfyeQ+TQoh
	 jeFWvtqza0v5wmUyd1ek0NkBL0YDGCgEZ4gj3ejadcfBy1IG89iI1UgrZ9v6QKoM37JOb2RyTkNV
	 9R++5uK55vR0oMDNX1atQAURp7uYmA349RsDThwmtS56XHMabxQZbPX2PNNOVSXSazWUpFyQf66j
	 UhRdLw4iC/LDl0sq4e4ljms/urnxFsISHnLI7T4hMaoOZ6EHfQE7DU/xlzMdlr8Nm1OGvh/AuUl3
	 p5aP72OQAlQZRQUZ9YtmDSi570x8uW4mVactq1qPNuX/bb0t2UZcg7rzSHy7yziYHPKP2dlcy4fL
	 AvKD4mQxWA0LgKLCcmIQ4JJUxuG4PJxzcAPGnxVPUV8AknhGvRx8+6TjOUfn23R3WdtE0MYoKBZ9
	 pDuJi+52nD+KhkPtLOKzx8n6nZKX6g0Y2Eizp0TaOwoe2ycCS+LD+XVRZp84XRafIy+6xtQoTVC3
	 zKZB/n787N0Kf5ucnr/mBC+6JK4kcXKK6MwIvasRM8RpDIkjnY78Gfaum5w2dGP5ThDaODez1haw
	 V4ZycrkGSACeN474cdV5Vg+YWHXb3xJbYbwMqtzXJ6xV6CoLDvjNtJBggpwmsdXY13Mpb4tO/oF0
	 eu8YB65SEhKCfvoLQAypU6z8pgdxVqMSIzwkkmlRz3gITimJUqidByBs1mvPNMkbuH9jW9MhYFlA
	 +zyErpSHFqi5mLHlIX63IcPFTu5pBvpRaev3uTgfYeI6NSfvTG+sJFu1axHp/FVwj+T4LLRjddvJ
	 YCcKbW02lzFpWAGMPPVaAdqNW2uqvIs5FhmJr31pCqFG7sWp7rBHhVw6zICsE4AjSGQwbyoMlR6p
	 +q1bDdXHCvtXgGnbyTLmh1FPSJT8EBfCddby6DmCPfY3xsmYWBW6v4aWzu2trtQHurRZegGbFndn
	 RvkwDV
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
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
Subject: [PATCH v10 11/15] arm_mpam: Divide the PARTIDs between the control groups
Date: Mon, 19 Oct 2026 15:33:37 +0800
X-OQ-MSGID: <20261019073453.2142856-12-2118537295@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019073453.2142856-1-2118537295@qq.com>
References: <20261019073453.2142856-1-2118537295@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

To program a class that implements PARTID narrowing once per control
group, the driver needs to know which request PARTIDs belong to which
control group. Add a map from request PARTID to control group, and
program a group's configuration into every request PARTID that maps onto
it.

The map is empty until the resctrl glue code sets one up, so every
PARTID is its own control group and the behaviour is unchanged. A class
that implements narrowing writes the request-PARTID to internal-PARTID
mapping, so its configuration is only programmed for the request PARTID
that maps onto itself.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v9->v10:
 - Run the T241 erratum scrub for request PARTIDs sharing an internal
   PARTID
---
 drivers/resctrl/mpam_devices.c  | 74 +++++++++++++++++++++++++++++----
 drivers/resctrl/mpam_internal.h |  2 +
 2 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 7f88a0170c05..f81a2df11428 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -67,6 +67,25 @@ u8 mpam_pmg_max;
 static bool partid_max_init, partid_max_published;
 static DEFINE_SPINLOCK(partid_max_lock);
 
+/*
+ * Configuration constraints for resctrl-to-MPAM partitioning.
+ * mpam_num_closid == 0 indicates resctrl is unmounted or inactive.
+ */
+static u32 mpam_num_closid;
+static u32 mpam_num_partid;
+
+/*
+ * Map a request PARTID onto its owning control group using modulo
+ * interleaving. Without resctrl active, every PARTID maps 1:1 onto itself.
+ */
+u16 mpam_partid_to_intpartid(u16 partid)
+{
+	if (!mpam_num_closid || partid >= mpam_num_partid)
+		return partid;
+
+	return partid % mpam_num_closid;
+}
+
 /*
  * mpam is enabled once all devices have been probed from CPU online callbacks,
  * scheduled via this work_struct. If access to an MSC depends on a CPU that
@@ -1560,14 +1579,24 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 
 	if (mpam_has_feature(mpam_feat_partid_nrw, rprops)) {
 		/* Update the intpartid mapping */
+		u16 intpartid = mpam_partid_to_intpartid(partid);
+
 		mpam_write_partsel_reg(msc, INTPARTID,
-				       MPAMCFG_INTPARTID_INTERNAL | partid);
+				       MPAMCFG_INTPARTID_INTERNAL | intpartid);
+
+		/*
+		 * The internal PARTID holds the configuration. Only the
+		 * request PARTID that maps onto itself writes the controls,
+		 * the others share the same internal PARTID.
+		 */
+		if (partid != intpartid)
+			goto post_config_change;
 
 		/*
 		 * Then switch to the 'internal' partid to update the
 		 * configuration.
 		 */
-		__mpam_intpart_sel(ris->ris_idx, partid, msc);
+		__mpam_intpart_sel(ris->ris_idx, intpartid, msc);
 	}
 
 	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
@@ -1641,6 +1670,7 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 		mpam_write_partsel_reg(msc, PRI, pri_val);
 	}
 
+post_config_change:
 	mpam_quirk_post_config_change(ris, partid, cfg);
 
 	mutex_unlock(&msc->part_sel_lock);
@@ -1771,19 +1801,41 @@ struct mpam_write_config_arg {
 static int __write_config(void *arg)
 {
 	struct mpam_write_config_arg *c = arg;
+	u32 partid;
+
+	if (!mpam_num_closid) {
+		mpam_reprogram_ris_partid(c->ris, c->partid,
+					  &c->comp->cfg[c->partid]);
+		return 0;
+	}
+
+	/* c->partid is the control group, and must be a valid one. */
+	WARN_ON_ONCE(c->partid >= mpam_num_closid);
+
+	/*
+	 * A control group owns every request PARTID that maps onto it. Write
+	 * the group's configuration into each of them. Resources that
+	 * implement narrowing collapse them back onto a single internal
+	 * PARTID, so only the first write changes the hardware.
+	 */
+	for (partid = 0; partid < mpam_num_partid; partid++) {
+		if (mpam_partid_to_intpartid(partid) != c->partid)
+			continue;
 
-	mpam_reprogram_ris_partid(c->ris, c->partid, &c->comp->cfg[c->partid]);
+		mpam_reprogram_ris_partid(c->ris, partid,
+					  &c->comp->cfg[c->partid]);
+	}
 
 	return 0;
 }
 
 static void mpam_reprogram_msc(struct mpam_msc *msc)
 {
-	u32 partid;
-	bool reset;
-	struct mpam_config *cfg;
-	struct mpam_msc_ris *ris;
 	struct mpam_write_config_arg arg;
+	struct mpam_msc_ris *ris;
+	struct mpam_config *cfg;
+	u32 partid, loop_max;
+	bool reset;
 
 	/*
 	 * No lock for mpam_partid_max as partid_max_published has been
@@ -1803,7 +1855,13 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
 		arg.comp = ris->vmsc->comp;
 		arg.ris = ris;
 		reset = true;
-		for (partid = 0; partid <= mpam_partid_max; partid++) {
+		/*
+		 * Configurations are stored per control group. When resctrl
+		 * has grouped several PARTIDs together, __write_config()
+		 * expands one group into all of its PARTIDs.
+		 */
+		loop_max = mpam_num_closid ? mpam_num_closid : mpam_partid_max + 1;
+		for (partid = 0; partid < loop_max; partid++) {
 			cfg = &ris->vmsc->comp->cfg[partid];
 			if (!bitmap_empty(cfg->features, MPAM_FEATURE_LAST))
 				reset = false;
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 0a2177241615..5a7590568a05 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -458,6 +458,8 @@ extern struct list_head mpam_classes;
 extern u16 mpam_partid_max;
 extern u8 mpam_pmg_max;
 
+u16 mpam_partid_to_intpartid(u16 partid);
+
 /* Scheduled work callback to enable mpam once all MSC have been probed */
 void mpam_enable(struct work_struct *work);
 void mpam_disable(struct work_struct *work);
-- 
2.43.0

