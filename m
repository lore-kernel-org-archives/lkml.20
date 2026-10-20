Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503806;
	b=2AdoGfP05Gik8ZiwZJ8MwJb+5xX3/cb2aqk+r9405x4H8oaqKgXKGFhI4jab2Qhen2nw
	 YbtuGqvFWhlLBe1NeWmt1cH18SdERE31tgbR1UytEe839ld/uVP/+DISSCoDOGzM6YDwn
	 DvmMBGZMrjk85QicEt+vSYJUG/lGeT7+aSmb1ubRIIm88XM/Hgzd47S0j7vrX6d+e5Csp
	 0yeazYzccD+OswLTtMCr5CnpUWToFrd9rTTX2/UwEQTYAurYpVhwDzXyKUNI1FJ9w/IeH
	 VvR5aYywfdpyX+UnMT/d1ugu0RuVsUcq58B8TW89KhgtnMVIMexMSXoTAoaVJ9q/mRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503806;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=U1dugOHm8NPorm7jQ/fYQt9GQpeBKiLqypNAsncLNjQ=;
	b=PTwmYT30Zk9gXQ27Cizr04kEcSSvnkCh1Y53DHCg4RKX+Blwxnq164IIc/2fwJAZfao8
	 S+xSNwzR3UtnOpDtkFveBYOwIYd33fV77aOx3lTlYR6Qba2cvu3KYwL4msFcvcc4ME9uO
	 m9qDKPrJDaADgIHuFAASIg5jcTdYO1ACGwGM7ErexhGS23FyJr2NSEwOddVEM9TFCRRG2
	 nE0DZo0EXjiQiLrQYxvzSvl9OsE6N6ADLylkElNVepBCswGgG/Z/qq9FHeJftRz3S/dbf
	 Z7VRwXkujHZoL6cqySbPTFWDFyHUe8qDnUVUdJfIUpLblOD0bVo7QQsk1qDGDBSwXDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=b0v9FWVX;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A160A3830
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558A160A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=b0v9FWVX
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=U1dugOHm8NPorm7jQ/fYQt9GQpeBKiLqypNAsncLNjQ=;
	b=b0v9FWVXW0VmdhKdjU9otPL99RB8eM3hao/kydcr5OZQQ+W1SnsZPr12Fz0KMjCXYMXiWW6e1
	UGcLoEeyiOdzq802U9NCIU7OWhMRTTV3GFb78YF5aprcpRBnATtuWO5+WxEQriCnQIO/tvDkqvG
	NussHhIu6v9mP60s+WYThg4=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBn3N7QzmV7s;
	Tue, 20 Oct 2026 21:43:13 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4AB5A4056C;
	Tue, 20 Oct 2026 21:43:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 11/15] arm_mpam: Divide the PARTIDs between the control groups
Date: Tue, 20 Oct 2026 21:42:35 +0800
Message-ID: <20261020134239.3921377-12-ruanjinjie@huawei.com>
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
2.34.1

