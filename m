Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFACD39E9AC
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791673031; cv=none; b=W1WGkJaOIeiehAAv9TNWvwsc9jMhB1RI/A7awYXKvrpDi9rKOpvI0dQONyKspvpSKwzq50tJAgH8nM2cnPbAWvLzR+dAnOYCdX8qz5eBgqLKkuFYFXO1Zp02Fg2Denj+SFO/V9loMU3VHglddbCBmEOBBZaIq9l/zvbJpR98hNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791673031; c=relaxed/simple;
	bh=50YF1GRIAdh1pbM526fLR+jHhqN2rJgvJ/QgNd/p0D4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ko/j3aLmbrdglpkB1hFe9n4Rn0Q/jOXKXPXCPaIPwbiGGI5C2NGXvAi9Q+Dpk/TDwzrSzd1hhLFvZy5rLSAjIbHVpX6159S0RsWqCSMgxtzwRhDPK5jEYATTRr/5Q6VnnezabF8bqPjp0oqYX+36Pv+4IY3Hf5tNvyXFeLDAhgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndc0ciYx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndc0ciYx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so652184a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791673028; x=1792277828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7emqRlU0MzXMkqE8ZjhvjRAJOSMNKDO1xaL6vJcVJs=;
        b=ndc0ciYxjWsA8z4dIiqDVn08t3BzwbwQv8+i8wh5tbKsQ//HX0f5vEGfvdxP2bcsmJ
         IlH7gUry+6IpQW9Ii/DWCR0u5qTSdQGr6PeB5xmWCmJrMH3Ur+bKW1EbT3MJjPFra/jz
         Gj90azYJyg9s7U6GQDBGbNQ+5GU09ztBlMgTYwqO3jrCd4Zkntl833nO+aP8m0+M5f6c
         PdUGqfjCZnQdHoKOy68AtJrPGoWSzv06BcKidJ2hv9d1I07sMbNDGCHjdRWZb4l5uA8U
         zUrEB2yZJPbPGc8y3eJ0nhfr1YqUVjTdWGVcFwAbkq0m1MQ+gZ0nxmzgjzRM7GBLn/o6
         sM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791673028; x=1792277828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7emqRlU0MzXMkqE8ZjhvjRAJOSMNKDO1xaL6vJcVJs=;
        b=rrc5ch0coJF2IZ1ogfyiRPG/A5fnPFivzqYWJ1EO7x3JCDpN/XNP2lbXt80AUV7TD1
         QL9TCksrU9kRfr2bqk4PMBwumXzw75wC2f+xEVCWFhA339rsr7G/4YbeiHkedwhaqJ2U
         JwSGqqXD2CFq9pvtKCb6TMj71NPIWAJbmD0KaYKKvDyGw5nHXBgWquQHpPqdoG6UW+Ni
         RZ1ezpZrppq8HpI5bxK9TYQcNwi+P5zJtxamz6sNCj6wjf3I1g94WtDPYWL5A+Nn7AD4
         k3kMqKTpHwekkXEunDpX63C8zHNyODLcEtesE6e9HYkxu2zJftkH+Mf4iSHZcYg4MZZI
         k/FA==
X-Forwarded-Encrypted: i=1; AKwUvByjfOlaFCUJqlcuS4BLT7rlHxoIkiLIWHAk7/L1RU6QAFcgJBroRNamF5DoccB6k18YnjTfa86EvLHppzY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5zC6UUu1YHNmgrSfMO+5+QppQ+EycsSAkmUpJjz4aVcliglwv
	fzYaKqxRolDJhZat/fAWT3XaMf/2GOVNnpkA2nUVcdaJqb44gRe+SRwl
X-Gm-Gg: AYBFou1QsCjbAqX6Idso4FNQbWROPfkYxf58wRA4O6INTyFbdodXpwcUvyWyuka7D9w
	0ebo5KE9mT8WN1X3iNUjEcmhh4P4nKhjQgxgzP+5uni7SohvnfL+Nsgnga/6WYmRhhAmWWt+m7E
	6XLHwFCRvN4YgcrXH2L1/eDHAzpPi4J6L8JANEmYHD3rW5rwPjGr0NABetKQSiKFbWK7KMEvjqT
	QIGTQr69nHruEsFWlsMWzs765Z9Z4SY4Xha/tOhX3hldBN/QNg+QtKKFuRl/dj6BXrwsZGKw6PA
	YdjywtGZgS9bE6V4mDt1jXvAOH4cdEp+TRN6lfPECRD1Hl+Kd+74MOObQpmmrlIJCtvuQCOz6/N
	cB2KAKFLGKlJvykZvgsfKs+1JDMcmiV4v8gGtG0iugRyZ3p6iLE3+S133pGq5IohewhiZo9OGAE
	l8hG7H3vPy3BoK/Mm1G83Y0FLkl8jLB7Wy68fPE/wjvPV67Vng882DM8rk54M20Srmt8CN/pkLz
	SuJfphH0CAzPJb4nzJfUGevk5mP
X-Received: by 2002:a17:90b:1844:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3ab3a955af4mr4973848a91.18.1791673028071;
        Sat, 10 Oct 2026 15:57:08 -0700 (PDT)
Received: from cxlqual.. ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm2603662a12.5.2026.10.10.15.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 15:57:07 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ira Weiny <iweiny@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Fan Ni <nifan.cxl@gmail.com>,
	Li Ming <ming.li@zohomail.com>,
	Benjamin Cheatham <benjamin.cheatham@amd.com>,
	Gregory Price <gourry@gourry.net>,
	Richard Cheng <icheng@nvidia.com>,
	Anisa Su <anisa.su@samsung.com>
Subject: [PATCH v16 1/8] cxl/mbox: Flag support for Dynamic Capacity Devices (DCD)
Date: Sun, 11 Oct 2026 07:54:52 +0900
Message-ID: <20261010225852.10727-2-anisa.su@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010225852.10727-1-anisa.su@samsung.com>
References: <20261010225852.10727-1-anisa.su@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <iweiny@kernel.org>

Per the CXL 4.0 specification software must check the Command Effects
Log (CEL) for dynamic capacity command support.

Detect support for the DCD commands while reading the CEL, including:

	Get DC Config
	Get DC Extent List
	Add DC Response
	Release DC

Leave mds->dcd_supported false. Dynamic capacity is only usable once
the driver can handle Add and Release Capacity events. Detect and log
the capability here and let the commit which adds DCD event handling set
the flag.

Based on an original patch by Navneet Singh.

Signed-off-by: Ira Weiny <iweiny@kernel.org>
Signed-off-by: Anisa Su <anisa.su@samsung.com>
Tested-by: Wonjae Lee <wj28.lee@samsung.com>
Tested-by: Junhee Park <jh9934.park@samsung.com>
Tested-by: Heesoo Kim <habil.kim@samsung.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
Reviewed-by: Alison Schofield <alison.schofield@intel.com>
---
 drivers/cxl/core/mbox.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/cxl/cxlmem.h    | 20 ++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
index 55828a836c01..199bb986d674 100644
--- a/drivers/cxl/core/mbox.c
+++ b/drivers/cxl/core/mbox.c
@@ -171,6 +171,33 @@ static void cxl_set_security_cmd_enabled(struct cxl_security_state *security,
 	}
 }
 
+static bool cxl_is_dcd_command(u16 opcode)
+{
+#define CXL_MBOX_OP_DCD_CMDS 0x48
+
+	return (opcode >> 8) == CXL_MBOX_OP_DCD_CMDS;
+}
+
+static void cxl_set_dcd_cmd_enabled(u16 opcode, unsigned long *cmd_mask)
+{
+	switch (opcode) {
+	case CXL_MBOX_OP_GET_DC_CONFIG:
+		set_bit(CXL_DCD_ENABLED_GET_CONFIG, cmd_mask);
+		break;
+	case CXL_MBOX_OP_GET_DC_EXTENT_LIST:
+		set_bit(CXL_DCD_ENABLED_GET_EXTENT_LIST, cmd_mask);
+		break;
+	case CXL_MBOX_OP_ADD_DC_RESPONSE:
+		set_bit(CXL_DCD_ENABLED_ADD_RESPONSE, cmd_mask);
+		break;
+	case CXL_MBOX_OP_RELEASE_DC:
+		set_bit(CXL_DCD_ENABLED_RELEASE, cmd_mask);
+		break;
+	default:
+		break;
+	}
+}
+
 static bool cxl_is_poison_command(u16 opcode)
 {
 #define CXL_MBOX_OP_POISON_CMDS 0x43
@@ -759,6 +786,7 @@ static void cxl_walk_cel(struct cxl_memdev_state *mds, size_t size, u8 *cel)
 	struct cxl_mailbox *cxl_mbox = &mds->cxlds.cxl_mbox;
 	struct cxl_cel_entry *cel_entry;
 	const int cel_entries = size / sizeof(*cel_entry);
+	DECLARE_BITMAP(dcd_cmds, CXL_DCD_ENABLED_MAX) = {};
 	struct device *dev = mds->cxlds.dev;
 	int i, ro_cmds = 0, wr_cmds = 0;
 
@@ -787,11 +815,22 @@ static void cxl_walk_cel(struct cxl_memdev_state *mds, size_t size, u8 *cel)
 			enabled++;
 		}
 
+		if (cxl_is_dcd_command(opcode)) {
+			cxl_set_dcd_cmd_enabled(opcode, dcd_cmds);
+			enabled++;
+		}
+
 		dev_dbg(dev, "Opcode 0x%04x %s\n", opcode,
 			enabled ? "enabled" : "unsupported by driver");
 	}
 
 	set_features_cap(cxl_mbox, ro_cmds, wr_cmds);
+	/*
+	 * Disabled until event handling implemented.
+	 */
+	if (bitmap_full(dcd_cmds, CXL_DCD_ENABLED_MAX))
+		dev_dbg(dev, "Device supports DCD; capability disabled\n");
+	mds->dcd_supported = false;
 }
 
 static struct cxl_mbox_get_supported_logs *cxl_get_gsl(struct cxl_memdev_state *mds)
diff --git a/drivers/cxl/cxlmem.h b/drivers/cxl/cxlmem.h
index c401e3a1af06..0c8e23276dc6 100644
--- a/drivers/cxl/cxlmem.h
+++ b/drivers/cxl/cxlmem.h
@@ -252,6 +252,20 @@ struct cxl_event_state {
 	struct mutex log_lock;
 };
 
+/*
+ * CXL r4.0 Section 8.2.10.9 - Memory Device Command Sets. See Table 8-308.
+ *
+ * The 48h Command Set (Opcodes 4800h - 4803h) defines the device-enabled DCD
+ * commands.
+ */
+enum dcd_cmd_enabled_bits {
+	CXL_DCD_ENABLED_GET_CONFIG,
+	CXL_DCD_ENABLED_GET_EXTENT_LIST,
+	CXL_DCD_ENABLED_ADD_RESPONSE,
+	CXL_DCD_ENABLED_RELEASE,
+	CXL_DCD_ENABLED_MAX
+};
+
 /* Device enabled poison commands */
 enum poison_cmd_enabled_bits {
 	CXL_POISON_ENABLED_LIST,
@@ -427,6 +441,7 @@ static inline struct cxl_dev_state *mbox_to_cxlds(struct cxl_mailbox *cxl_mbox)
  * @partition_align_bytes: alignment size for partition-able capacity
  * @active_volatile_bytes: sum of hard + soft volatile
  * @active_persistent_bytes: sum of hard + soft persistent
+ * @dcd_supported: all DCD commands are supported
  * @event: event log driver state
  * @poison: poison driver state info
  * @security: security driver state info
@@ -445,6 +460,7 @@ struct cxl_memdev_state {
 	u64 partition_align_bytes;
 	u64 active_volatile_bytes;
 	u64 active_persistent_bytes;
+	bool dcd_supported;
 
 	struct cxl_event_state event;
 	struct cxl_poison_state poison;
@@ -505,6 +521,10 @@ enum cxl_opcode {
 	CXL_MBOX_OP_UNLOCK		= 0x4503,
 	CXL_MBOX_OP_FREEZE_SECURITY	= 0x4504,
 	CXL_MBOX_OP_PASSPHRASE_SECURE_ERASE	= 0x4505,
+	CXL_MBOX_OP_GET_DC_CONFIG	= 0x4800,
+	CXL_MBOX_OP_GET_DC_EXTENT_LIST	= 0x4801,
+	CXL_MBOX_OP_ADD_DC_RESPONSE	= 0x4802,
+	CXL_MBOX_OP_RELEASE_DC		= 0x4803,
 	CXL_MBOX_OP_MAX			= 0x10000
 };
 
-- 
2.43.0

