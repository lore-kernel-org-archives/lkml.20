Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4333B47C4;
	Wed, 26 Aug 2026 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772876; cv=fail; b=YDy6mBejoiPaexVdbDG6aCnJOtLyRU9TF6T01lWwQIpcULtURDmEUlJ0QWXQt46l51Y/EKKRi01QZjqftuth9QaYPMldisPqsmKzi1V/OlS0IiHXPW5Xl8ngV4Hn8S47TBOI3xXuM5DoR1Aq7fnrM0MQLY3FhK5xHEyGJ33V/OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772876; c=relaxed/simple;
	bh=c0I6hWi8P7MoGLfIkm2TNNETu5TD2cgN1zGjNCeibWE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OaqrnRyHmMZsvwLLV2FCHxVqyxUs9Xc4+Z5SsQ4XJdyPRtLTZlniMAHYA4T0aTaugZpTyFV5UFda+7MZY1DbaeeLRl7+vW+b/Dk+fMCC7XkmSqM13H2VOjFAA7a2ZY+uO/lwUWgT3ihy1cMBIUuXddiaAOy4fzlkRqK85YyVhtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xvSp5ipH; arc=fail smtp.client-ip=52.101.61.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xvSp5ipH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2ut/kMe8dXulQu2sKcRL4tcfKbyakUEmEMiam9L2HiwY3OpquxzMpQFVEaU3eD02LFV4cHCgnOxhoI3+2uYfW6sDuayAJI4Ut6lKlQIvZ7EM4026X9UEzLqEDbExjbPyU9xXr3qoVV3MwcFLFyDgOU0TqmqQVd9GtBV73lGnW2onddjZ/JKw7CvruDEhjS3jCqERDfBsufDxGsXpUkfzU+z+fGNHl+EtivD6ugBscE4jmFVaFQs4by8dJoFDHv7VVWbOcbZZ6Ml2DT4sNa0x0mMgGMnUXs3wtDxy32DvtHvtiR+b2yMnoSpflPVRdO6HbFj9KJXlN1xlrvuwqtgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zC9EbP/T+fyUNyCdpLz90BdYY51MAUFEmgdW9Js2Ac0=;
 b=GGrJ7itSfXCPmRNrkFi75Yi5CsMaDZ9NLI0OwdYD9NOjgdawLtUBPvjD//ITl7vXWx8wiAysu1q84hj11MAiRcGaIhwqnZYCmMvOMUl0mDjy8ZHNiuimitiGshdEXizkvp7K5I3DHhFUpKpQs/LuU6ST5PT0jIPwGm8qwEMVTq1d8eA/wPIrzRmKpnMGhInyHeZtHsnEaSQPZuVuqvI6NzVPEuiZ+x4y4ZKLBsHVzQ2FI57Kq6QLOTzVFn6zyxJc1TPM/3XK8K3Yq9Bnk4xTb2sZEqo+OjyJPuZvqNqfQyHMKeXdtPXyHpKo7dqyeRkRbsgNi+PqJjaid1xmnbcmzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zC9EbP/T+fyUNyCdpLz90BdYY51MAUFEmgdW9Js2Ac0=;
 b=xvSp5ipH3bFO95c3kxc/pd3O1BjpnMbb3BRqdQGsJ1UN/kV4e8NxDFWA5542P8JaCJAlLCdsZRPBSlLa0iadPAChH1qdQapGr7tDby127MQ7nlr0tbqKP+4mCyfZ2AZnrdpJ2DwRmnVaocEIICDNLs3me4NHfNUlgayH9jlmCW8=
Received: from SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::28)
 by CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 19:34:09 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::84) by SJ0P220CA0018.outlook.office365.com
 (2603:10b6:a03:41b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 19:34:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:34:08 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:34:06 -0500
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
Subject: [PATCH v5 07/16] fs/resctrl: Introduce resctrl_set_kmode_support() to register supported modes
Date: Wed, 26 Aug 2026 14:32:21 -0500
Message-ID: <077f2c8ea7e5b7ce89e63bf4a67bd74eee16f7ed.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|CH2PR12MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf2c5ee-aaf0-462e-8299-08df03a8ffa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|6133799003|22082099003|18002099003|11063799006|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info:
	RM2WyP32Nhsa+rPgRf19BWxzlHwrQqwK8T2HXn/MyYk9qylhJ+exQHVAO1WTQNAcHw8gv+kvq0/ZassZ/+0zuywjk2vQnzbYin7uAYi40SqSkIXCndosx9DoPS6xMfcyxaT7aoKtHNPl1ESR96Ud5gUJ6j1eX+o8oVBF/cii5J4TpoN0zF7jM7qY9rO7WIMu+qiQWKwP19Z7EL8pQTIS6DaGdatKjYc60pH3Wu1NT8gsZEFPr2W79bvPUwiJggY7llyZbb6KYy3jhkleD4gAib9QSXa+FO7TeJAIQS5To1ceMPWU/i48UzQD5Vqtf407xjeHF6LMyg+BrvLl31ZTuxFFOTMFYP9TT1pRzVlMoYgM/IsmcNAe+XYfmAcLwsy37ylf0KEDsUYoFteE2ltB+VrzOfsHNcUU4dJ4a2H6qR/c5TZ3vlwKK0shWgoLrrBiB1w4SGNvYju4exTJC5OzAHd51faLkLD2+NU8TsrsyugNHyUlqWcgGRyig+8TXwPGxFA7G8YVFXa/dNEC3qnEcuGiaO+7JYelNtwMdkLCZgl8nOfesUYwFnOGvP+GqHoc8jG8hlwTkRNXAnMNv70A/H7Oiw7oMMyHM7vYCM+SqMbTr90BoAI4lbxnlEg1h394IgLb5F3IMROrdytDtq6DmUyXmWE+uATRyU/HE+h8S4OJ4Y+SpAFmT5S+CGYn1ARnjySJNTGgUqzDc4bDSJhieA==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/oem4Sw7OSXuTYlOQpTTPa5MFvKR/4ztt0w5HAn3dii4aaI7leFkewMSMkWmSAG3ZpV10+fG/B27TyEhkQfSjC9e82X13lfVlS+dXtAiLL6B/gKL9BnqNx4xGyb2D+RcXTSslUYOM1/lAydPK+u/gtXdL7eZrYEEeQomcC9W7HKjYewUn9MBL62G5I2rxp2251G1WuqgZnuCiddAPjMhzbkex+yTQffDCNG/NoOHQBC6opX1/6Zc+MhOrUAL89QT2Y82ESswsTQ2sPUylga6BjAnEvI03ftpIak2bzgiPYgcokApvtsjXdk+Yxq09Ff/LGRVxUZJve0hvwW+bERw4hWLcs+txa08p3uWg6LRHCHyHcHkBHM5sUpu23m/92GeJfisBO9s/9yYbpuUyyfga1IUKUNG2Rc67gMy5lDnFxHTtxCd/FXgm8qKgI82P0oG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:34:08.7687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf2c5ee-aaf0-462e-8299-08df03a8ffa7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4133

Architectures need to advertise supported kernel modes before resctrl
can expose them through the filesystem.

Generic resctrl has no registration hook for architecture-specific
kernel mode policies.

Introduce resctrl_set_kmode_support() to set the corresponding bit in
resctrl_kcfg.caps.kmode_sup during initialization. Architectures may
call this to register RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU when they
support independent kernel mode control and/or monitoring assignment.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: New patch split from resctrl_kmode_cfg initialization. Register modes
    in resctrl_kmode_cfg.caps.kmode_sup using RESCTRL_INHERIT_USER and
    RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU. Ignore out-of-range mode values.

v4: New patch to initialize supported kernel modes.
    https://lore.kernel.org/lkml/737a4228-52fb-4583-ac64-8efe79c107e6@intel.com/
---
 fs/resctrl/rdtgroup.c   | 13 +++++++++++++
 include/linux/resctrl.h | 17 +++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 3c53f3f74e5a..3bb0e3a203ac 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -892,6 +892,19 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/**
+ * resctrl_set_kmode_support() - Register a supported kernel mode
+ * @kmode:	Kernel mode policy supported by the architecture.
+ *
+ * Set the corresponding bit in resctrl_kcfg.caps.kmode_sup so @kmode
+ * is visible to the resctrl file system.
+ */
+void resctrl_set_kmode_support(enum resctrl_kernel_mode kmode)
+{
+	if (kmode < RESCTRL_NUM_KERNEL_MODES)
+		__set_bit(kmode, resctrl_kcfg.caps.kmode_sup);
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 /*
  * A task can only be part of one resctrl control group and of one monitor
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 8b30eef835aa..051aece77eb9 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -729,6 +729,23 @@ enum resctrl_kernel_mode {
 
 #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
 
+/**
+ * resctrl_set_kmode_support() - Register a supported kernel mode
+ * @kmode: Kernel mode supported by the architecture.
+ *
+ * Set the corresponding bit in resctrl_kcfg.caps.kmode_sup so @kmode
+ * can be exposed through the resctrl filesystem.
+ * RESCTRL_INHERIT_USER is registered by resctrl_kmode_init() and does
+ * not need to be registered again.
+ *
+ * Architectures use this interface during resctrl initialization to
+ * advertise supported kernel modes. Registration of a mode indicates
+ * architectural support only. The final decision to expose and enable
+ * a mode is made by resctrl based on system capabilities and
+ * configuration.
+ */
+void resctrl_set_kmode_support(enum resctrl_kernel_mode kmode);
+
 /**
  * resctrl_arch_configure_kmode() - Program kernel mode association
  * @cpu_mask:	CPUs to assign the kernel mode on.
-- 
2.43.0

