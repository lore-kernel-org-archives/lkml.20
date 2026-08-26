Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013019.outbound.protection.outlook.com [40.93.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A0A478E45;
	Wed, 26 Aug 2026 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772862; cv=fail; b=EM8rMedMj4b5QkE232vjKoBLxiHlWt8CyN451WQZc0iqPMtso/HYlrwIeK1YWyJY1ny/HSNG3ZWj2GqKvvEott/wFyLDmGx7VKpA0lVFvIktlfwacTVYjNNXLexMYOh90M06nGprNiqyrZ4kg9VhLB/RCkakN3naxrRzWcXA8Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772862; c=relaxed/simple;
	bh=dtso5QQI0/IxJpXvvRnzqXCHTnhx0qPe586bk9T6XbQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OzAm5aVcLi4BcOIdDxdXdGP5YsY9D4zWLSiMAbM7PSZSGK9Hv8BbzZsXYb9crpRvG8pqNpFaYNzDeoELE2mtLAdQZ4WoSEsMqSiL3JRDVaCxyFGBt9HKySYvjZ0W+v1JNXvNMMHxMquHoYNzgV0FReV1HfwtnlJtrHWizI3LfqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HG0isiWN; arc=fail smtp.client-ip=40.93.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HG0isiWN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+Q0itijOeY9Y4v9EJMxNNpb04H9CLDJuDz7hmNpcENZOTzhCSwl0agx1OAI0HmIq7j89JqxhA1QH3VvWGkDGPx+jTTYstDj6vZJ5tRc8tK4cWE2gKdPbrBAoWKgzNEXGecBKko8z+rLqUcCpkh9Q4KEBjPBkYtGTmLmEfroFZkPe1OZeK4YeuGhxkubSXm/Mbrclo3TwpIBNfUtv2MWjXV76S/DBVfAqFVhl++vkVnHAgsrHkEfbQk9aRNB7OKX2ehjhydOSIUEavjsU/cXnFUdRyvHPGUKhTgT1NXuTFZe7Jqq3TxU7AnCNN3cFFee4uhDR48zEmbQWa1UV6R1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mljt4P5L75n5H6fHaFPrHZZUI7ESRipZ67ElnFva7JY=;
 b=yllVpaScgVghGdqdE9ldKaHrcstERFQp0ezXYX2BUE57rwEyiXjNBAdS2i30XZygHy2spZSCtdK/1iTU9pdOb1DoJHVEG43PaTpIj2Z733RqcwuU5m8IZynzf+QosXH00xVwdQYBbTZdWX5XKFyz455YR0VN0+U1kUWPOjQEuKP0wD8Uo7QunoqZSI5vdcF6+QsA11WcRP9QVJJ13b9db02h9M+VJRs0b9RHOYas/3lDctKDVdNwhoo2jKn2/aRzCL/Ct36xS7QgxnOog4+l+I46ijVmQgyJgUgykDk3R1qev040S+zjIP7wf0wWhE5HZM8X5Z60iyH47MbfIqIXxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mljt4P5L75n5H6fHaFPrHZZUI7ESRipZ67ElnFva7JY=;
 b=HG0isiWNX3ozVuOPF/GPiwtm6eVWBUmKEQTdvUS9d0XajDNgzs2c+vgIouSLwl6hiyRQQ7AVa6+TZr0nuNX+SSl2YwLcqZ88tB/ssJMoN9XFV94Xh42/b2FF4Os7hHHNpPGp9snElPoOYTE4bYx4WIiRfdeba697w6lzsogOZPA=
Received: from SJ0P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::8)
 by DSVPR12MB999126.namprd12.prod.outlook.com (2603:10b6:8:383::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 19:33:57 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::1a) by SJ0P220CA0021.outlook.office365.com
 (2603:10b6:a03:41b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 19:33:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:33:55 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:33:53 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <bp@alien8.de>, <ben.horgan@arm.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <jlayton@kernel.org>, <enelsonmoore@gmail.com>,
	<kuba@kernel.org>, <ebiggers@kernel.org>, <seanjc@google.com>,
	<peterz@infradead.org>, <chao.gao@intel.com>, <jmattson@google.com>,
	<naveen@kernel.org>, <ricardo.neri-calderon@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>,
	<elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
Subject: [PATCH v5 06/16] fs/resctrl: Introduce kernel mode states for resctrl
Date: Wed, 26 Aug 2026 14:32:20 -0500
Message-ID: <89413e63d627ed967108bb77e6f56e7ceb977571.1787772750.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787772750.git.babu.moger@amd.com>
References: <cover.1787772750.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|DSVPR12MB999126:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b20719-4edf-43a1-1db6-08df03a8f7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|18092099006|22082099003|18002099003|10067099003|11063799006|56012099006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	aUj4JMGntYRkzGfe9HWn4W1uuo+5LDUIeXM8Z7qRcwu7MrBoaVIM+Ct5QMZpfQtD22ARcDgdT82T2kWU9fzGbwLcdZ5RRy+kuWfKMZN+m+zPYOZ31KNrOTGnXZuOTe60ceRdbyz998ENarYNqzYTpSvesTB/ANBksxssYnGqpTTUaemkbPlUgcR7M32KcQl+cEmPZFXW3M4MowTpVfHzBLwDgfyZmTCRxJiCnqnXn4jije1v/PTcO3BCzrHPHxB8SEviSM5KTrUg+li1D77gThIx4gVu1bHbmMpjgth1LnGe+tOyEILdmv0SsVmBpdsM9es3yfOo82GZ+9gZ3MfGx/xX+6SkQQbVA6EHGKloWn0JKyqu1owgUOjfgfvQLXN+cjsBjdGMd+fgOlBDNxC4iN6AIukfhUNBSs/BSVsz39wGSbIee9VcPb/AUkHnbs4cONWpaVCnPBYncPpT2oDm0rA51B/ba+M9C70rve6ED6mvtNEd26N84iXvEYnxTLegnzrN0SR5SMjdJkKS6gVj487BtSfHU0wfDo+dI8zzGNr9YCe1aqcWvvSkhAC87lsHxTTbwuyHu+DY9ckcyVqkQKM5zDleWGdGq/83YTfJymkyq2oR8aQWLlXaojGjbch130UKUfoN/iD/9uzNfIBsfpdUw6SOLPKZ0jUSr715oNjLaF9jZ89W6TenRU4sDO1VLc/R1cpRSZ48FBCqMN/xgw==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(18092099006)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vdonQNiHUgvhty8K9WE7DnLOXlLbZEYa4Qam5lVmbOMYXRqMpWLb0LIf25POCFRO92TT0ajqTHmsQ/iG2guxwF1DJeIIi56Gxq3j4d2w7jNogLQuKFMSeFfmBL9u4GjIzGVyPDdAEbVFmumQYeMm9nHPct6qV79+9vcmd6Ho5brXVjJgEOLPDc5R1T/vFmIz/7ct9K2XqkX2lhTAEj9ruwTP22Sl54TWZMt9eJI2dVgO1SYQ0TICXV5i8gsA+dAXq8AYpv+qbN5T2ZspIDeXFGiDV36g8mC/n4NAu9O8l8YWemUO7+bj4uOfp+yyUSkM6Qfm7FL9ptHsVJBOewWKVeGCWby42irAyf2gu/0A610liCSpwu7cXqPUzo4yQUjzwMInUPmss8NN6frUkdQKH13Yoxpfk4pK89NKs3DHXmd6J+dwjYKexZ7kf/ph1klA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:33:55.6024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b20719-4edf-43a1-1db6-08df03a8f7d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999126

Architectures need the generic resctrl filesystem to track supported
kernel modes, the active mode, and per-dimension assignment state.

Generic resctrl has no place to store this policy state today.

Add struct resctrl_kmode_cfg to hold supported modes, active mode,
control/monitoring assignment state, and the bound resource group.
Initialize defaults from resctrl_arch_alloc_capable() and
resctrl_arch_mon_capable() during resctrl_init().

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Replace per-mode registration helpers with a single resctrl_kmode_cfg
    structure. Derive ctrl_en and mon_en from resctrl_arch_alloc_capable()
    and resctrl_arch_mon_capable() during filesystem init. Update code
    comments and changelog.

v4: New patch to initialize supported kernel modes.
    https://lore.kernel.org/lkml/737a4228-52fb-4583-ac64-8efe79c107e6@intel.com/
    Changed the kmode_cur to enum resctrl_kernel_mode in resctrl_kmode_cfg.
    Moved the resctrl_kmode_cfg to filesystem code.
---
 fs/resctrl/internal.h | 51 +++++++++++++++++++++++++++++++++++++++++++
 fs/resctrl/rdtgroup.c | 33 ++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index e62a277dee85..4087bf44a06d 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -314,6 +314,57 @@ struct mbm_state {
 	u32	prev_bw;
 };
 
+/**
+ * enum kmode_state - Control or monitoring state for a kernel mode
+ * @KMODE_INHERIT: Inherit from the user space task.
+ * @KMODE_ASSIGN: Use a global assignment for kernel mode.
+ */
+enum kmode_state {
+	KMODE_INHERIT,
+	KMODE_ASSIGN
+};
+
+/**
+ * struct resctrl_kmode_caps - Static kernel mode capabilities
+ * @kmode_sup:	Bitmap of supported kernel modes. Empty when neither
+ *		@ctrl_en nor @mon_en is set and kernel mode policy is
+ *		unavailable on this system.
+ * @ctrl_en:	Whether kernel mode may use global assignment for control.
+ * @mon_en:	Whether kernel mode may use global assignment for monitoring.
+ */
+struct resctrl_kmode_caps {
+	DECLARE_BITMAP(kmode_sup, RESCTRL_NUM_KERNEL_MODES);
+	bool				ctrl_en;
+	bool				mon_en;
+};
+
+/**
+ * struct resctrl_kmode_active - Runtime kernel mode state
+ * @kmode_cur:	Currently selected kernel mode.
+ * @ctrl_mode:	Control assignment state when kernel mode is active.
+ * @mon_mode:	Monitoring assignment state when kernel mode is active.
+ * @k_rdtgrp:	Resource group backing global assignment mode.
+ *
+ * When @kmode_cur is %RESCTRL_INHERIT_USER, assignment state is ignored and
+ * @k_rdtgrp is %NULL.
+ */
+struct resctrl_kmode_active {
+	enum resctrl_kernel_mode	kmode_cur;
+	enum kmode_state		ctrl_mode;
+	enum kmode_state		mon_mode;
+	struct rdtgroup			*k_rdtgrp;
+};
+
+/**
+ * struct resctrl_kmode_cfg - Global kernel mode state
+ * @caps:	Supported modes and assignment capabilities.
+ * @active:	Active mode, assignment state, and assigned group.
+ */
+struct resctrl_kmode_cfg {
+	struct resctrl_kmode_caps	caps;
+	struct resctrl_kmode_active	active;
+};
+
 extern struct mutex rdtgroup_mutex;
 
 static inline const char *rdt_kn_name(const struct kernfs_node *kn)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5dcbb0a964e8..3c53f3f74e5a 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -76,6 +76,13 @@ static void rdtgroup_destroy_root(void);
 
 struct dentry *debugfs_resctrl;
 
+/*
+ * Global kernel mode policy state: supported modes, active mode, assignment
+ * capabilities, assignment state, and the resource group selected for a global
+ * assignment.
+ */
+static struct resctrl_kmode_cfg resctrl_kcfg;
+
 /*
  * Memory bandwidth monitoring event to use for the default CTRL_MON group
  * and each new CTRL_MON group created by the user.  Only relevant when
@@ -2297,6 +2304,30 @@ static void io_alloc_init(void)
 	}
 }
 
+/*
+ * Initialize kernel mode policy defaults from architecture capabilities.
+ *
+ * When ctrl_en or mon_en is set, RESCTRL_INHERIT_USER is supported and
+ * selected as the initial active mode. When neither is set, kmode_sup is
+ * left empty, kernel mode policy is unavailable, and kmode_cur remains at
+ * its zero-initialized default (RESCTRL_INHERIT_USER) but is unused.
+ */
+static void resctrl_kmode_init(void)
+{
+	resctrl_kcfg.caps.ctrl_en = resctrl_arch_alloc_capable();
+	resctrl_kcfg.active.ctrl_mode = KMODE_INHERIT;
+	resctrl_kcfg.caps.mon_en = resctrl_arch_mon_capable();
+	resctrl_kcfg.active.mon_mode = KMODE_INHERIT;
+	resctrl_kcfg.active.k_rdtgrp = NULL;
+
+	if (resctrl_kcfg.caps.ctrl_en || resctrl_kcfg.caps.mon_en) {
+		resctrl_kcfg.active.kmode_cur = RESCTRL_INHERIT_USER;
+		__set_bit(RESCTRL_INHERIT_USER, resctrl_kcfg.caps.kmode_sup);
+	} else {
+		bitmap_zero(resctrl_kcfg.caps.kmode_sup, RESCTRL_NUM_KERNEL_MODES);
+	}
+}
+
 void resctrl_file_fflags_init(const char *config, unsigned long fflags)
 {
 	struct rftype *rft;
@@ -4816,6 +4847,8 @@ int resctrl_init(void)
 	if (ret)
 		return ret;
 
+	resctrl_kmode_init();
+
 	ret = sysfs_create_mount_point(fs_kobj, "resctrl");
 	if (ret) {
 		resctrl_l3_mon_resource_exit();
-- 
2.43.0

