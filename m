Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437306;
	b=oa/Sjo3v3kXPAzDSGvGTKupwYjyKYAuJy+lxcBboPcLIlXO70+4TdVUsk6pwsWuQdJei
	 /nCfJbpaDOC18MV4nKvvFiLedLiHqIPBb7935sn0uymAaftp8wyje3YamFfiLBveM65ow
	 PrPtSk43uSZuQkzkpmIxso9Fd+kf7hw1acA5YmO3NYNXwDsKlmML/tqerFAEsHCUsBpHR
	 CDg2MM6myGCbYhcS0LpfBuK4CLhiBqrnpxLcadcFitoIR2ia0q6mvF4y8f+dYDZHKnbOt
	 hhFRFd7L7qlJeMiqebX29fT+/q+O3LBmlslSI5Sob6UKjVfhO6OqSRkCwHghXiGtWbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437306;
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
	bh=oT5YJ3CeLdnRxGgdByT1jFgMKO/L+3BPCMw6/bI9ecU=;
	b=jWCCF+z/URLl7/i9wzpsP+Ne9Pv2q4nCrnfxUUf5C4LzpRrqVOQ/E/8zR6VjfFgjDseX
	 zW3kl4Ahqykv0uOoKyuKXmVndRcjy/+v1hgp9jjNdZ1g8rfM8Cvqo2V1Ib4mpHNGQY9w1
	 2kozG9DK2fny0XFHy0W2HSVDY4AOmlsTQ6p9DuvywI295biwrli2Ej0TX8CvAml1cd30r
	 E6NMo1AIvrahshR6tg33KVaN6K+IXAW39pIc8P/hIg5NGB18UDtRGefEvKpU+B6aHHnZ8
	 cKRbClHSfK5FPiJkSchHSHbIvuPux1tjN9g8F7V2tfue7L0e8w2rJ41VujKbIwwwy2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3TV4+jy4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.6
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010006.outbound.protection.outlook.com [52.101.201.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA4B606A888;
	Wed, 11 Nov 2026 22:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA4B606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3TV4+jy4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUtYzQl/UkpMR3QxQLjW5YBE/MasT/rj8ZyFqbyQC0MQLvZ4k/pCro6pIEf9T9X9mAcBVq44LFBuCBkhtPHlOsnTWCmPhEo39XmOE5EvntafifpA+hfbRVQBqF4ASqkYuZ+QIxwTP6Rjjl7MEjsya4FbbGRjWOppuNV19kxdZkkX31qy79hDTlBbZwymr9GV0t+LFtFd4oUF6sldtIa8YqlVkgRjwOAxvADFWntIPvG6YFWBcZIiHcFTJgizt4i1THnVRoTGjyNjReRrT+TdoRgvq5XNAmL+RFqv65IhIbnp9cPNrCkBY2khyImCskSHewElki+3TpX8xm1zHCfaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oT5YJ3CeLdnRxGgdByT1jFgMKO/L+3BPCMw6/bI9ecU=;
 b=Qvy5w4Gklv1An5rquzF045Z/F1IsqZqfD7cpixPSxSsfmyaCQeznlBvPFjOyXmYIz6ZIPlbzltennHErJ4jn8LdMdnBzDkNclGScBcaxZ0CLbBQivZx41gxQfAeFN58VpRNTUSFW2sHAl6IlS3R3aAnbpYLj4+fksulBGiLgHQmCBtPK5kClGeK9j7xqJujgE1MIYAcMHrRSQ0OTy59ojBPPwjgZES964G2N/e3UAO2ymACcNOyx5a3kDqDeyX/kM9kX4w/h/PfV3G/LgIZhEIendmXnaWWhrxSQWcQvonOuYoWRyfnWgNi6UShIyP9eo0ELs4PAES24XCbDqnrwpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT5YJ3CeLdnRxGgdByT1jFgMKO/L+3BPCMw6/bI9ecU=;
 b=3TV4+jy4+yVMKTwHiDo2mO0CLwj1CB8sdW9gvTtK2wnn+B/b+SquvFgSQfv/uJgYxYXrrXIILJ5sNK93KUMOP40//0Z3gNBpYM3/kXldAKrnHSTcObozjmC3dpvmKdO7IoQOzzEmSCu0fA6A8Z1uofe3z9wQCUPICKASTlkP+0c=
Received: from BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::10)
 by SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:45:41 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::ab) by BY1P220CA0015.outlook.office365.com
 (2603:10b6:a03:5c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 22:45:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:45:41 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:45:39 -0600
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
Subject: [PATCH v7 07/19] fs/resctrl: Introduce resctrl_set_kmode_support() to register supported modes
Date: Wed, 11 Nov 2026 16:44:00 -0600
Message-ID: <e56839aa69cb287fb92a814403ac9b88ee35c6f0.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|SJ1PR12MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 1792da9a-5375-4f4e-6a6c-08df404583bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|36860700016|1800799024|23010399003|376014|11063799006|56012099006|18002099003|22082099003|6133799003|261009223027099003|261022075727099003|261021121427099003|261102123227099003|10067099003|261026121527099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	m7okzreAqMFnG7BzI+ntsXJnNthHKgTHTjVxrsBv1XOQie5s/fkEowd0/mGzaVNQ8ZRj1+QEHO+/8mVsGsSMMduAC9k6lxXBDsYwwZSDvQk9E4aKnUu3X/ykORaBTj/gdbzpCrD8u94rWFalHgRqKwb4oecGaFJGNSovaRgbioy3dOL7uEYJNYhFSFYmMV06daSq3WDSzgYVwPHISpqV7UikqVvHExS5muV4RoU7gcurSO+9uI2kUyNPY6+mjDti9+awlVZxI34zd38QztDWk/TMVlcHN0rWC9qouMN9fsM2Hx2b3jZCHKGvYqaBsq6PSPJcqTJarQwvPVkNR5wYJUyVGM7KVIiehk5gii+2RMRAIX9GW6gsz016nAEFA4SoISZIqIjbJRxO+hseu7g7YaM99pFd+0LJaPErNAyh1wcafPEeQ0+Kr7OJIP+Jp7xAqj8W9mAbj4mu5L9v3+PUe8qpgu5mF0D2yrZAUmA/9OMzNBZA9d5tKY75850/YW966jNJySs1PIK33j0rzLFXu+RKkiRObu5BpxV9YBCGrmjs/sQl+1JbjUAsv9ieB0VDJBiRzWWlpdiJtYnYk9RKYV9Iq/C2slCy4bQHeuQT/O67rzcDfc/4XCU4PrOutQNm7VeilYKwUVXhqa0jr1pJBPlzPkrMUvJtMEqGBko4OyM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(261009223027099003)(261022075727099003)(261021121427099003)(261102123227099003)(10067099003)(261026121527099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qQLBh3QQnmuhtXK5uFR7EaINYi2grQlFejSWXNGU+nRU57kj5IEZmMjIMmuPYn6T8Ijq4oxPRtq1xsh7E77lSTFpiDYKnpXuarl0jOQhSafNEYSjXJObBxhDrN4IPQe/1TbHY0XZSzx16QeTNMrvFNR+g2CnC7L7CH7nGLD8U2CCjwlUhx8oYKY0G22bD0m9LAPVK3HHGkMg7iInp8s8Em3WpAe6FHkJ3loyyEtBFomclaZV85ed6J9empOhwfpkq94OQSh1VNvLR2uNOmshAkyx8u3YdDdCxyoFx8nRT7mQ/0M3+dfthyh7DiN+3f0vyktxPaVRBe9HM05hj/Kvli4yTugqotJR7U6h/Y0iMtn4k3dmLYz1E4Y39X1D/bgnHC+0TRFj4rwxeRtqzUm1HACfOcH3jDlYHRAgKi1nxyhJdWqmGAeghpH5IRAHTYSc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:45:41.5927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1792da9a-5375-4f4e-6a6c-08df404583bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6339

Architectures may support different kernel modes that need to be exposed to
user space via resctrl filesystem.

Initialize the resctrl_kmode data structure and add
resctrl_set_kmode_support() to allow architecture to register its supported
kernel modes. This is preparatory infrastructure for future kernel mode
support in resctrl.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Moved the static initialization for resctrl_kmode in here as it is used
    here first.
    Updated the changelog and code comments.

v6: Use resctrl_kmode.kmode_sup after the struct flatten. Drop duplicate
    kernel-doc from the .c definition and place the function next to
    resctrl_kmode_init(). Rewrite changelog (not a bugfix).

v5: New patch split from resctrl_kmode_cfg initialization. Register modes
    in resctrl_kmode_cfg.caps.kmode_sup using RESCTRL_INHERIT_USER and
    RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU. Ignore out-of-range mode values.

v4: New patch to initialize supported kernel modes.
    https://lore.kernel.org/lkml/737a4228-52fb-4583-ac64-8efe79c107e6@intel.com/
---
 fs/resctrl/rdtgroup.c   | 14 ++++++++++++++
 include/linux/resctrl.h | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 443b41a4d467..28bd4c4d98f2 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -76,6 +76,14 @@ static void rdtgroup_destroy_root(void);
 
 struct dentry *debugfs_resctrl;
 
+static struct resctrl_kmode_cfg resctrl_kmode = {
+	.supported = { BIT(RESCTRL_INHERIT_USER) },
+	.active = RESCTRL_INHERIT_USER,
+	.ctrl = KMODE_ASSIGN,
+	.mon = KMODE_ASSIGN,
+	.rdtgrp = NULL,
+};
+
 /*
  * Memory bandwidth monitoring event to use for the default CTRL_MON group
  * and each new CTRL_MON group created by the user.  Only relevant when
@@ -2297,6 +2305,12 @@ static void io_alloc_init(void)
 	}
 }
 
+void resctrl_set_kmode_support(enum resctrl_kernel_mode kmode)
+{
+	if (kmode < RESCTRL_NUM_KERNEL_MODES)
+		__set_bit(kmode, resctrl_kmode.supported);
+}
+
 void resctrl_file_fflags_init(const char *config, unsigned long fflags)
 {
 	struct rftype *rft;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index e43415ae6e0e..519c28c63bc7 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -741,6 +741,18 @@ enum resctrl_kernel_mode {
 
 #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
 
+/**
+ * resctrl_set_kmode_support() - Register a supported kernel mode
+ * @kmode:	Kernel mode supported by the architecture.
+ *
+ * %RESCTRL_INHERIT_USER is a default mode and does not need to be
+ * registered.
+ *
+ * Architectures use this interface during resctrl initialization to
+ * advertise supported kernel modes.
+ */
+void resctrl_set_kmode_support(enum resctrl_kernel_mode kmode);
+
 /**
  * resctrl_arch_configure_kmode_global() - Program RESCTRL_GLOBAL_ENABLE_PER_CPU
  *
-- 
2.43.0

