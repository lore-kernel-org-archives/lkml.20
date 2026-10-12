Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F4457E44
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793490; cv=none; b=pmHY4MSGFZdJ2Ka3xVxuyQDPYicj8pmUHMaGJ9WQDeHEgcDC16Fja1siyCN554sjFV1tqFNil4o4/AYxmflhUFhEtanfhTMeabCSWtRhpLKtCIhPOyL+xgonS3N0X38wyr9FSCjs2w7Jc7OnyGZmzcePIcOgEQ5hdfauZslcROU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793490; c=relaxed/simple;
	bh=GNSTY2Dn5R6MYgrl9wguViH1e6yWEGe4MV0Vu7dVxE4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ukcn6+BfnInS2eQNQXBlNcZGuaOl7muGuN0ZWL5ap36YH952R87KYPLYOJwiIWpQ9XkNn64RlXIOZ4ZFDFbQu45oKsUBM9r5nt40/HFLz25qvVcyXSSTaBz0ONfEGh+hlPT2zuJhXvwYjrbELbpnY00seMHC5gin9pwUA5B6PNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=bcPKK+WK; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="bcPKK+WK"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BaJDLR6ahRLYoEVPJubl1K3dqZ6wLFIVh2mL+VWsorI=;
	b=bcPKK+WKhbGi2mwkJ+/EVNVZLwj8Tb0WArO3T8HVGsWVDqtrlKHdvHhyVFC+lPxFliAUSP5mm
	eyJVrjDGIirHfvMGRfc0si0+GWvzxfGFiAs431VilF1bCgXYyTbjbGex8bxolwQhwG7w136tav7
	/dda7rlLUuiXfG0ZBgv4rcM=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j39F964c5znTVd;
	Mon, 12 Oct 2026 16:12:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4C2D24056C;
	Mon, 12 Oct 2026 16:24:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 16:24:38 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 6/9] arm_mpam: Divide the PARTIDs between the control groups
Date: Mon, 12 Oct 2026 16:23:34 +0800
Message-ID: <20261012082337.822258-7-ruanjinjie@huawei.com>
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

From: Zeng Heng <zengheng4@huawei.com>

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
 drivers/resctrl/mpam_devices.c  | 68 ++++++++++++++++++++++++++++++---
 drivers/resctrl/mpam_internal.h |  2 +
 2 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 029f105d5915..17c29022d75d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -67,6 +67,25 @@ u8 mpam_pmg_max;
 static bool partid_max_init, partid_max_published;
 static DEFINE_SPINLOCK(partid_max_lock);
 
+/*
+ * Configuration constraints for resctrl-to-MPAM partitioning.
+ * mpam_num_closid == 0 indicates resctrl is unmounted or inactive.
+ */
+static u16 mpam_num_closid;
+static u16 mpam_num_partid;
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
+			goto out;
 
 		/*
 		 * Then switch to the 'internal' partid to update the
 		 * configuration.
 		 */
-		__mpam_intpart_sel(ris->ris_idx, partid, msc);
+		__mpam_intpart_sel(ris->ris_idx, intpartid, msc);
 	}
 
 	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
@@ -1643,6 +1672,7 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 
 	mpam_quirk_post_config_change(ris, partid, cfg);
 
+out:
 	mutex_unlock(&msc->part_sel_lock);
 }
 
@@ -1770,15 +1800,37 @@ struct mpam_write_config_arg {
 static int __write_config(void *arg)
 {
 	struct mpam_write_config_arg *c = arg;
+	u16 partid;
+
+	if (!mpam_num_closid) {
+		mpam_reprogram_ris_partid(c->ris, c->partid,
+					  &c->comp->cfg[c->partid]);
+		return 0;
+	}
 
-	mpam_reprogram_ris_partid(c->ris, c->partid, &c->comp->cfg[c->partid]);
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
+
+		mpam_reprogram_ris_partid(c->ris, partid,
+					  &c->comp->cfg[c->partid]);
+	}
 
 	return 0;
 }
 
 static void mpam_reprogram_msc(struct mpam_msc *msc)
 {
-	u16 partid;
+	u16 partid, loop_max;
 	bool reset;
 	struct mpam_config *cfg;
 	struct mpam_msc_ris *ris;
@@ -1802,7 +1854,13 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
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
2.34.1

