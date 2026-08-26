Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1982D47AF57;
	Wed, 26 Aug 2026 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772836; cv=fail; b=MiSlhpzhcDaWwJVIiSPNOoCwbdC7FLH+g3TN+JhcNTDT1k3ZYdG7+cE6q91yGPjMq31zQGQUNGeOSHrR9gybDo6T6eO39DnZWu4nUU0b0jBkb9ArgVbWOXe3Lm2R1uo+k6mLJuMXfBsPrECXXAEYiMqhgJp5R5F+RHCDw1ncqWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772836; c=relaxed/simple;
	bh=9WL4AVbgnpioFYEuxlcpuA8TwaEunOfCwHY4l23B6Zg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m6rBwqBDRwQ3utfWPAkljxPxpv/+YEIPRAEMG2jiRdg3xpMHi6GxuOISdcL4FM2/rLcuH4yW5mh3xJ+7i16NcxCs7KXnP2USg9dbCEX45OYF7i82IZcP2rvwU67Y/YRZKsoZ4GDQCaBMJmwhsVYcbztUfNiI35TaMO5qRRfwzRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G5EdJycS; arc=fail smtp.client-ip=52.101.52.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G5EdJycS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9qqcG3MuFSJQjcv6ezGSgtDgQf3jEKr1febclcX8tveFAmWMADrvM0Pgs+XBHwrtbE6yLCLQbDaIqntjosXknMNgfQKmZLICs7ocIkJEhUjQlwj6QbP5Zwln8bycAs/i4UKsZ9Z9rB66eBM+tMo8q1cd1YbjAtARxMEjxVtSxWLTfQOFvrMYhAutcUd0wvINh+Z5MMHQemhveJR8QP3voMZBw8qnGNlrCWlzGF2BD3AsMsaHNUPC3U8KCP3178QJTwQmYXo0vMKeD2UAYA+phH8Kv9O0dS17gD3EeoxnFMHAOLb5zuhA2Ge8/q/5mv6tgTuBdGUmG6zZp/oGHg5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83Ebp4LIf+ZVmIbSvzbmVNvehRBokEfaDUNCv5Rt6fk=;
 b=RQY7Gsco84Pj5HEoEqml4ya16Xv+0HRRHGdhsaZnY9xbF/Tin9b+zYc+k16yTzineVdS2oq6fH2Nad7b60NkZ7yUznpZihrO46/aNmIHE/0/BTZtOX638bK0/PMLjf/odJZX3fEBdvQ6OZTbyUPx6S7cCW7KOaPiq+/hV8Pfi1p1VrH2ELt6cOalheQ0ZmGQloNgECQd3FUX6uNEveOnidx20txQrUfynMjoLw+T7eblFq64VYQT1/p+hL3gmcgJLCGRM0Dw+KvVF/O9HJCoP4UNfrYDRaC05XdsWM0DN4GhITuEKYw5sSXke7HrOWfG/nfvCBNf/EKTP+KRHDUPpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83Ebp4LIf+ZVmIbSvzbmVNvehRBokEfaDUNCv5Rt6fk=;
 b=G5EdJycSsqMlar1RggX6iLIxpflPA/fkSyWmeukQogflUm1NMN4OK/gHpf1S/yZ/6ObHFw30mqNJc7paHT449mJbs8Z1waRBdsXsSW1UKgsiyWH4ugULjpO7GXo7SSsHFSQHU7Jb2boogK4g/h6U4OLlkql+oCkTwwWOBJ5wt/4=
Received: from SJ0PR05CA0136.namprd05.prod.outlook.com (2603:10b6:a03:33d::21)
 by SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 19:33:42 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:a03:33d:cafe::3a) by SJ0PR05CA0136.outlook.office365.com
 (2603:10b6:a03:33d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Wed, 26
 Aug 2026 19:33:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:33:42 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:33:40 -0500
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
Subject: [PATCH v5 05/16] x86,fs/resctrl: Introduce architecture hooks to program kernel mode
Date: Wed, 26 Aug 2026 14:32:19 -0500
Message-ID: <be2bfecd0ac11f2b564860bb2066a7678466bc1d.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|SA0PR12MB4445:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f313ca-8380-4d93-30ed-08df03a8efdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|3023799007|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	y6P2OCb04TNIWmt/va5JefNYSwXwK8cAMgb5E1VGS6VYrsfB8u1K5dAx/IM6sLfOMy3ma/2T5159KBq458fVFpIA03/bLbm0FN0qCQlL6qIN7JdT9yD7H11HZ5QFqQH9IqPi7H3XQ2qzw9SxQNiqQWmyWTOzplH79ZgBF0nimpCx7eKzE91759Auz6sWfB6GdAObB1vaXchIlmOf8p611lE2lmu1qXEtxyFTWFPY1yWffQFReSpsFA4+YnRIkdXLjs2XOJwXrjRLPsevyDhoMr/VSGjjUMAlht18CpMlhvpa1pJmXNUUdns2SIkWc5CPOCDrSDa6cmVMNnh0vc0Xcv4gr0Zd4AdT6BF2dlrpcmKNK2zQxk6d7rx3/9J8TjT82ongbl/3ExKMBDHXIpboMNwXw3/00+mwSewWVPsktKXzPAiyLt9dD4O+sRdR9/QAjoj9bozWnWDRW6rLzZUZFj3qPEi9pelMiNi8M7/WMr5Ftv46F2qclJPC7RkeGm5SPtJ3vsDo6M8XUS3ILSiIek1eZgcN99YMDSydGvqwLSr+iJWuZm0a9RT3grcihrhYtTG8YHm0Sxt0R6366BYwTxsaPBD4qJWBiJReUo97AAFBRxHut9ZdSjEfIvp2qJI61lDBHIup3KU8STl3NCZqLCmJscqWPiMAABLty1iuixzGplDCHcC48MZgtvrnC7t7SoD9OgWIE6d+I+dqyNnTnw==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m6ZVnViaZEbj8v9na66RNE57UZRDWikrSpTXtGh/pnY8phtXfQ6m9LvWmMUhc/dsDZQt0D1fv7KewYxqUuLB3jEKjnbZv45ocT1wPJemuT6GGni3xc35btzy1CzdBdf7gqjwPOe0e9FKiIC9b527HpBT46N5+yUOtQs+K8iv7U+YlkPoGHqygXVQ3vTr6kG3rN2vA5QdOAqsSyeH8anRnnJsACUqld/vPSKk011jtFPUVTuiJq8oqNVSruovNxqdegBtfQdmzakjtJ3vuXajfctYAeVPFe3l9Qc7mZCP6Nu21gkwAH8zCwoob+IcWzKKw4zHCLB2J4fCX9YZUbXrr8UipEBdzeyZXvz8ZcMKvDkTgm3O7frTcQ0+GVx5vj2XD4430fdIQtg0jVesoQkIyT/iUi9GuZFjdDMcpOt2lHs/M/E1agxIF3t5DlBIzQP/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:33:42.2435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f313ca-8380-4d93-30ed-08df03a8efdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445

Kernel modes defined by enum resctrl_kernel_mode must be applied on
the CPUs when user space activates, deactivates, or updates a
configuration.

Generic resctrl has no architecture hook to apply these modes across
a CPU mask when the active mode changes.

Add resctrl_arch_configure_kmode() to program kernel mode allocation and
monitoring associations on @cpu_mask. Accept separate assign_ctrl and
assign_mon parameters so CLOSID and RMID can be assigned independently.

Implement the x86 hook to program per-CPU PLZA settings. On x86, PLZA
programs these associations per CPU, with CLOSID and RMID configured
independently.

Provide an MPAM stub so the filesystem layer can call the hook on systems
without PLZA.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Fix kernel-doc for resctrl_arch_configure_kmode(), wire assign_ctrl
    through to PLZA closid_en, and update the changelog.
    Add calling context in API doc.

v4: Added assign_mon parameter in resctrl_arch_configure_kmode() to program the RMID
    as discussed in below.
    https://lore.kernel.org/lkml/20260605100642.1103628-1-qinyuntan@linux.alibaba.com/
    Reintroduce independent monitoring assignment via assign_mon after removing
    the task-based PLZA approach in v3.
    Changed cpumask type to "const struct cpumask *cpu_mask".
    Added MPAM stub to avoid any linking issues when resctrl_arch_configure_kmode()
    is called from FS layer. Thanks to Qinyun.
    Re-wrote the changelog to be generic.
    Updated code comments.
v3: Removed task based PLZA implementation so related changes are removed.
    Per-task RMID handling is replaced by group type selection in the fs layer.
    Updated the change log with details.
    Removed resctrl_arch_set_kmode() as arch only provides the modes supported.
    It is FS which decided which mode to apply.
v2: Updated the commit message to include the sequence of steps to enable PLZA.
    Added mode code comments for clarity.
    Added kmode to function names to be generic.
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 38 +++++++++++++++++++++++
 drivers/resctrl/mpam_resctrl.c            |  6 ++++
 include/linux/resctrl.h                   | 33 ++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index e74f1ed54b86..40fd5e31c94e 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -131,3 +131,41 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
 
 	return 0;
 }
+
+static void resctrl_kmode_set_one_amd(void *arg)
+{
+	union msr_pqr_plza_assoc *plza = arg;
+
+	wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, plza->full);
+}
+
+/*
+ * Program Privilege Level Zero Association (PLZA) on @cpu_mask.
+ *
+ * When @enable is true, kernel mode allocation on @cpu_mask uses @closid from
+ * MSR_IA32_PQR_PLZA_ASSOC if @assign_ctrl is true, otherwise the CLOSID from
+ * MSR_IA32_PQR_ASSOC. Kernel mode monitoring uses @rmid from
+ * MSR_IA32_PQR_PLZA_ASSOC if @assign_mon is true, otherwise the RMID of the
+ * current task.
+ *
+ * @cpu_mask:	CPUs whose PLZA MSR should be updated.
+ * @closid:	CLOSID to use for kernel mode allocation when @assign_ctrl is true.
+ * @assign_ctrl: Whether PLZA should provide the kernel mode CLOSID.
+ * @rmid:	RMID to use for kernel mode monitoring when @assign_mon is true.
+ * @assign_mon: Whether PLZA should provide the kernel mode RMID.
+ * @enable:	Whether PLZA should provide the kernel mode association.
+ */
+void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid,
+				  bool assign_ctrl, u32 rmid,
+				  bool assign_mon, bool enable)
+{
+	union msr_pqr_plza_assoc plza = { 0 };
+
+	plza.split.rmid = rmid;
+	plza.split.rmid_en = assign_mon;
+	plza.split.closid = closid;
+	plza.split.closid_en = assign_ctrl;
+	plza.split.plza_en = enable;
+
+	on_each_cpu_mask(cpu_mask, resctrl_kmode_set_one_amd, &plza, 1);
+}
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953a..286284ac8423 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -139,6 +139,12 @@ bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
 	return false;
 }
 
+void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid,
+				  bool assign_ctrl, u32 rmid, bool assign_mon,
+				  bool enable)
+{
+}
+
 void resctrl_arch_pre_mount(void)
 {
 }
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 4245d1e65ccc..8b30eef835aa 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -729,6 +729,39 @@ enum resctrl_kernel_mode {
 
 #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
 
+/**
+ * resctrl_arch_configure_kmode() - Program kernel mode association
+ * @cpu_mask:	CPUs to assign the kernel mode on.
+ * @closid:	CLOSID that matches the RMID to program kernel mode. Depending
+ *		on the architecture, the counter may match traffic of both
+ *		@closid and @rmid, or @rmid only.
+ * @assign_ctrl: true to assign @closid for kernel mode; false to inherit
+ *		association from the user-space task.
+ * @rmid:	RMID to program the kernel mode. Some architectures may use
+ *		CLOSID/RMID separately, others will consider them together.
+ * @assign_mon:	true to assign @rmid for kernel mode; false to inherit
+ *		monitoring association from the user-space task.
+ * @enable:	true to enable kernel mode association on CPUs in @cpu_mask;
+ *		false to disable kernel mode.
+ *
+ * The function can be called in the following scenarios:
+ * - If a per-cpu kernel mode is active when user space switches to a new
+ *   per-cpu kernel mode then resctrl_arch_configure_kmode() will first be
+ *   called to de-activate the active kernel mode on all CPUs that the
+ *   kernel mode is active on.
+ * - When user space switches to a new per-cpu kernel mode then
+ *   resctrl_arch_configure_kmode() is called with cpu_online_mask.
+ * - When user space adds a CPU to an active per-cpu kernel mode.
+ * - When user space removes a CPU from an active per-cpu kernel mode.
+ * - resctrl fs will always provide the same closid, assign_ctrl, rmid,
+ *   and assign_mon parameters when activating a kernel mode, all
+ *   interactions (adding/removing CPU) while the kernel mode is active,
+ *   as well as when de-activating the kernel mode.
+ */
+void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid,
+				  bool assign_ctrl, u32 rmid, bool assign_mon,
+				  bool enable);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.43.0

