Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437150;
	b=EnpUlhqVbVgxZizl34JTNyGRx9R6ouLgiSQp0jS+sCuIIr7lO9zvEFRGrhsLhOIM5M5A
	 dnRoQXdS3zJSKxJbUr+ASwyaf3uYwc+hISAv+sfpI2KCzU1XZ/Ij3nBrd3TimjB43UUoZ
	 05INMYZNL7mMVS4ovaS+0BQOI2Ia0B1xQU41r5x5/vGyiU/3ck/nVd+DP86CfDwI2iCAs
	 RcAcecHZjB7VmQy9333F/nytQ2ksHHqW5nlHW92H2d2xIBKtHYMVJ3LnjKRqj7SubB1Qt
	 O3AtGT5XaLZ7zugdrIxgxvJ+4icHcOASgEVsAIoQk9NGzer9LOaYFBYxvB4fz90BLfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437150;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Hi3sSDr6dyWN3jL7fFBOyyXv5vLrq/tlUBvvJIpkto4=;
	b=uqIFIPvhEgG+gMvmCQCBYb/xtukRYlKgsteu/1DtfQ4yOW6yfn3LoIRb73DzGizg501h
	 q7aE2RhNVMpMP/NgUD6Vs5erPsMZbAbxZWdXuPErYoQOZqi+vnJP1AstgrPDa9azefeDd
	 hztWTaBQXaysU/D95lUae+JHdjt9smD60Jw9Iva0u55HZ7JU8BLCnyZMQQgabQSX3twYw
	 EfSR/DG91SK1uG7RLn+Guse2yhb4n/8D4FIZ5yIBk2FmCUhCpVVJwHBjp8ZBVzIflUVGu
	 lKrlWVLxyPkd+YKRHurGhVJctbKhKUiu8fx29Ar2wayBF2aA2k8ujdNP/xKeYLGO03A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hesYNNGt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.21
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CA1606AEF1;
	Wed, 11 Nov 2026 22:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2CA1606AEF1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hesYNNGt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSHR7U3xpzYlw4mwZPT1J18751zX96alF9vmb7RPBwPx++gZi5uhq4VrATxvSPVS7eUkCVfYj9QXhoZTvyFlokgpqJ59Z6iavKWXhSEhxwzP6iBHnKlRsxFJoO00ZRjlrIAuGFSxUf1/UE4rmaIEs0mSwdbo/T2tI7L4QBv3lS5JqMAQSHjWbgCko7HwK5ReqflWdgWCXfcVkyx99zBoXdApQHxA3TZVX6tTuoQkazg3j1pMGmEFCwxBbKH6TGARP3HdpYA/vSRIWAKHShaq5NQWY5g8kyERPddySTL+6migLX/OI/uXCZVA0W+o9G1wZOjtPyPL+UxEW0MePXBoiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hi3sSDr6dyWN3jL7fFBOyyXv5vLrq/tlUBvvJIpkto4=;
 b=rGU12rVpHFzNv0Xf6pDc6J8/q2UamGumk4g1B/f3PbgJPkSFCvVBQgtAvySLrKfF+ZvwvmkU4lq5dMnddS6RweLq+1yL3TNNc+sDA1zTgIqLQ7g7GrkDPsAbs/njbdFQx/JZ6KJXJFL1jy6mG2/LGFMisCzbTyyOIBY3msiQCL9sxewNX484O0NKMqnIo4BvPMhTzQn5C7yJi5olvQKaF3OhpKTSLfaihoAtwGn1zA6/6rA2BGkJBicATTBvgTZ++XBGpg0JLESj1Dwf2dVNwfijKAOx01NU3Nijk94MLKsWfjm85bFFaJ/qVuDobK2WoX4Hd7iGDLZLYZhmkxXqVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hi3sSDr6dyWN3jL7fFBOyyXv5vLrq/tlUBvvJIpkto4=;
 b=hesYNNGtej862iMyxp2cD0jR4+z2Vaszzw74IugYXCoGJNWg+KOxd0wD5O3GT2JNgttOXDWPPRg+5qh4pk5gdoPHabedYIREHz8YUzSxcZwaVJgF7YZB1jp260rNAXIeAo0eW5bD4zyfVaPO69C+AcBxhbqpC2uYqt0tsDQKb1M=
Received: from BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::14)
 by CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:45:38 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::37) by BY1P220CA0022.outlook.office365.com
 (2603:10b6:a03:5c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 22:45:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:45:38 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:45:26 -0600
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <x86@kernel.org>, <fustini@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <jlayton@kernel.org>, <seanjc@google.com>,
	<ewanhai-oc@zhaoxin.com>, <binbin.wu@linux.intel.com>, <nikunj@amd.com>,
	<ashish.kalra@amd.com>, <peterz@infradead.org>, <superm1@kernel.org>,
	<thomas.lendacky@amd.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <ricardo.neri-calderon@linux.intel.com>,
	<darwi@linutronix.de>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v7 06/19] fs/resctrl: Introduce data structures for kernel mode configuration
Date: Wed, 11 Nov 2026 16:43:59 -0600
Message-ID: <4c86fe8b1d5d5e405faa67d19b5f6a236843b093.1794437052.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794437052.git.babu.moger@amd.com>
References: <cover.1794437052.git.babu.moger@amd.com>
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|CH2PR12MB4101:EE_
X-MS-Office365-Filtering-Correlation-Id: 715fa251-067e-43c9-4f76-08df404581cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|7416014|13003099007|261009223027099003|10067099003|261102123227099003|261021121427099003|261022075727099003|11063799006|5023799004|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ksD01jCD2+K+bflFREtgLW38ofnbhL/eXW1cbceTCrSrM1M0ejKHtI3DzunKX0gxrFTlJvCpQ/T4CKbj8/GbYQdykp30Xf6+9eLlLWF54urtYxjGuzdzj3LXonhGdPNwdt59NkyEaVfYKNCg5X8y+xYM00ezBu1D0nsfawX4hcLYnTliD222HEqTYmUlfmeDuObFIhAOdgS5aYNcdmrCg+EbGHwykwwH5zJir7BSMqO1vgnUMgKI+b5e2JAElJ8yr+fMiVVxgz0jaT9+oYA+D4SxKnewwCUkzgLr4Cw5PvVoK61qlZVcdzJpzeFrttnHuBmllrhxEQD2FPzsuILbedmWggBLiW2hw7fzx/zMzAU8J0TD3fVZ9ycMd9fv/8DBqW/fp5LfjHaAuKrPW7k/9Q2Ih1ehMSC/S5ps+YJGq5j5IMTSMxZ3Ate9IbxDe2/fi1C56eb8bQTpefxbF/ga8pmxMpm0pXF/MQ+bGZOdlewX4GqsKH1s8rg2FG/nUMCEEMrlRGdoc308nMYjalhVOxN7GrR8hiSwMDHLeKdNPp0Q7FtJvz4Z90pr2C4hV1vtkvpD6af/6Sq9kvg+mSKhsxv+lE1uXAvdY2I7i5wlqgqJLbHUAs+NOg2s5e+5uk72ndW5KpT6gp/vAn86JDnFiNZrTb2XMaKrcMe0huy+2+A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(7416014)(13003099007)(261009223027099003)(10067099003)(261102123227099003)(261021121427099003)(261022075727099003)(11063799006)(5023799004)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VOD14SOEeSF0+hL/xlUJa3PJFe4a+F5F6gixhSEGHacIpBWN44BFtJI2JGBqbEYNczMVEiv+Opy34vml6wrPq9AFF9mw9bZguH+b9IiSfDnRXubf8T76ur1K6dQq9WhQFso8td0k+odDiy4jNdEy2lY+K4ypu0r6fxtu0QMRjp05j9mHIDbEim6Dt7M6yi7kOguEYfWJdp9uXPVFQaFXavmZJ4rAWHuElpfuxzZ/Bn8+DXB0LOUuDVILh7aw21D+b24nSj5DWdck1jUE8i4KLOsGfcQHtVwkj61So8JQwnEUK0MvZk6nc8JvAgDRd3H7hUjhVNljfjc3b1mfrHsmfSTpId2AOe7DtKol93rp4LuDZpaIH8QCOdDOH57uHd6qGxYHUoKv7Eo3cJxX6sEK9jRk3hIFDDCySDdCW0ZPVWp7XpMtiCb/1u7PkEu3Yusl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:45:38.3423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 715fa251-067e-43c9-4f76-08df404581cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4101

The resctrl filesystem needs to track the supported kernel modes, the
active mode, and whether the backing group's CLOSID and RMID are assigned
or inherited.

Introduce struct resctrl_kmode_cfg to represent supported kernel modes and
their configuration.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Changed kmode_sup -> supported, kmode_cur -> active.
    Updated the changelog.
    Removed resctrl_kmode_init().
    Updated the code comments.

v6: Drop ctrl_en/mon_en and use resctrl_arch_alloc_capable() /
    resctrl_arch_mon_capable() directly. Flatten caps/active into
    resctrl_kmode_cfg. Rename resctrl_kcfg to resctrl_kmode, ctrl_mode
    to ctrl, mon_mode to mon, and k_rdtgrp to rdtgrp. Comments describe
    the objects, not a member list. Rewrite changelog.

v5: Replace per-mode registration helpers with a single resctrl_kmode_cfg
    structure. Derive ctrl_en and mon_en from resctrl_arch_alloc_capable()
    and resctrl_arch_mon_capable() during filesystem init. Update code
    comments and changelog.

v4: New patch to initialize supported kernel modes.
    https://lore.kernel.org/lkml/737a4228-52fb-4583-ac64-8efe79c107e6@intel.com/
    Changed the kmode_cur to enum resctrl_kernel_mode in resctrl_kmode_cfg.
    Moved the resctrl_kmode_cfg to filesystem code.
---
 fs/resctrl/internal.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index e62a277dee85..38aa0c0cfb7e 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -314,6 +314,33 @@ struct mbm_state {
 	u32	prev_bw;
 };
 
+/**
+ * enum kmode_state - Kernel mode association state.
+ * @KMODE_INHERIT:    Inherit the CLOSID or RMID from the user task.
+ * @KMODE_ASSIGN:     Use the CLOSID or RMID from the backing resource group.
+ */
+enum kmode_state {
+	KMODE_INHERIT,
+	KMODE_ASSIGN
+};
+
+/**
+ * struct resctrl_kmode_cfg - Kernel mode configuration
+ * @supported:	Bitmap of supported kernel modes.
+ * @active:	Currently active kernel mode.
+ * @ctrl:	CLOSID assign or inherit in %RESCTRL_GLOBAL_ENABLE_PER_CPU.
+ * @mon:	RMID assign or inherit in %RESCTRL_GLOBAL_ENABLE_PER_CPU.
+ * @rdtgrp:	Resource group backing %RESCTRL_GLOBAL_ENABLE_PER_CPU.
+ *		%NULL while the mode is not selected.
+ */
+struct resctrl_kmode_cfg {
+	DECLARE_BITMAP(supported, RESCTRL_NUM_KERNEL_MODES);
+	enum resctrl_kernel_mode	active;
+	enum kmode_state		ctrl;
+	enum kmode_state		mon;
+	struct rdtgroup			*rdtgrp;
+};
+
 extern struct mutex rdtgroup_mutex;
 
 static inline const char *rdt_kn_name(const struct kernfs_node *kn)
-- 
2.43.0

