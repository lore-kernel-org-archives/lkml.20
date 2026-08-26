Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9865472F8D;
	Wed, 26 Aug 2026 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772947; cv=fail; b=J7xp1lvXZv0P2K7erKusJkrgy/ZFbOVjh26jfkObzt5N9Kv9odrKwy7y/JGCWc1aY6RiZpaNpXL/1bpjIR2FU6HBbkg8f/H2QfENBA8NjJbXwKpu15MT9cUVuCYMoGD0m+gmRF/OgBP1aWOw3YJKZ08rzD7u8FlLk/YaQ7odXGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772947; c=relaxed/simple;
	bh=i+yIrO53tHseHw9bZykhUTj50L6GPOpWpmgKYvAs33E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJ0GTBllH5TAAvh3kGKe17/iW1aSyTHckYlieNIt4RuR9EV/cKbraKarnX5ZBeQ9S7GHyhDxCiJpGtN4S1pCA73wLYGT7qqeDsn5gz808lkkCuX9EMDFARG2iS1RS6GWKg+RRENHhjsMjkHFkXLDyv0ghvWtVHUGYm6SFS5S2Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1FzvCsuS; arc=fail smtp.client-ip=52.101.85.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1FzvCsuS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vic6TSQkm9IQi2c4lBzMCfy8LuqVsaYuGJEiYHo4UU/sk02CTwRy0IPwMPaXFrsMuD6CI1/d8pCyykrJHCrW31oaTyiTGfmKyaL3RGwpdWntDjrlv+3DtMEZGzknuN11RPGAIOMUY/9Cnsg7A4Nk3zYWz2edblG3akcXvjjNuYxoN/bTk8M76aQKH568evC3MbXYTaIVCwqhEZ+Oeh5I2/+iAt8ZtlXmjwIOnSQLDBMrJFtMW/tvgZKr9nbwYbSuFeeN0o4PMnIDC3l+0M1frL8q9gTdrtgvbyouwtTgTpCUL1WWdm4ngbwGoBIhScn4JSTVkI2pV/CvO2umYzyEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPW+EdREAOg7ZDMiKvho4Kf5DS340PLtPzHyycllClA=;
 b=jfpqgPMUHL/E3VofXDkFyyhRs0YUjzFbQcZPmv+qtaCQIIXba+NpYwVXQmIkMZh48lTyMFvjY+0dsmZt1keHsJUQbyFXJOu62F7fJn6SrMYP1z2VpmGAZ8TwsGfN08ETBwTKvf1N63MgKCoon9bQdZueRulpfl8eBztFlpzbeXcK1z0cnv3pt3ZcB9MlxbCtJv1XJF3licAOU2QUzXt9Pyn/U/V2z1GEPX6D9pL6EMvXTj99bhHy4/Vn7C8vqKRF25YZ65cOpwr8qSUlff36BUBexnGxc+XqhKNCQdsgb1+wxYacOnBL0Dq887/YJTtWWshxOQgMuti+ZNZJrB7Nzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPW+EdREAOg7ZDMiKvho4Kf5DS340PLtPzHyycllClA=;
 b=1FzvCsuSOUH+hUUF8xJVL+CmZ7pAxZBmxShObQBynxrm3xtyNwksHcicp/BUEckiUP5MLA9HuqS0tA64MqRVxC1K5HaS/XUtO1UAY41JJ3DT4MmIWWtvoqAFEQdfOta+WsaYvlO10eGqVTy/TO2m2S7v/qSulokhyHJ/TfDcKhY=
Received: from CH2PR18CA0001.namprd18.prod.outlook.com (2603:10b6:610:4f::11)
 by IA1PR12MB6555.namprd12.prod.outlook.com (2603:10b6:208:3a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 19:35:26 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::af) by CH2PR18CA0001.outlook.office365.com
 (2603:10b6:610:4f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.9 via Frontend Transport; Wed, 26
 Aug 2026 19:35:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:35:25 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:35:23 -0500
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
Subject: [PATCH v5 15/16] fs/resctrl: Allow user space to write kmode_cpus/kmode_cpus_list
Date: Wed, 26 Aug 2026 14:32:29 -0500
Message-ID: <dd3646805ff9e0478cee882da7cb0e5cf11bc7d4.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|IA1PR12MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: cff4c179-d543-4b25-85e0-08df03a92d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|23010399003|1800799024|82310400026|10067099003|56012099006|5023799004|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hAr8gugmBKNiBwCup8Ol9uKKKXyzsCMcfXjaDdubEkJ6rUBL+4DVB1yld2cLnnDwqj2B+F33eH32jfAGkVUPUJdFZor00DszGtWLjy94CHtFU+OagjxsoJBOYG1PIYSaDUiP+P7DdQyt/4RDPSEQntwxTJUKHcsbjyVn0cWUmBVgzZQnhR6kUPkWDVm2WYJ5LfwA9bn7aakq82n1sbO1EjFGeci9ky8T+JS3YEbynb0SZrmvyZBHzL2YFcSjuBEr30n5xk/jcGRG0WHHlrOCg4U8Pr4Cq7eAHR3KfgUVOjaYWt4KQps82OqmmWQ5hf2ACA85/to7x1j0pukN6cFMXlSDHyF1M3a5DUDO7w3/dp+5Z0OCQ8Vchu0HT8wsz2d4CoDv/kay0oUHvw0INTVJ9AYYXf8VW8d8DoRuFMiosvSaq/cds8bxYtu5eC9osPZdJwKoaFdC6h66YaCoyst/StUL7gmwO3gaOf1vXRPpu7oZuUqRM7vBOFsmuGg8YwFVwAddg3DTxPVzKFWh/QO9hcxVkXIq0fQSsTyxbiZ9QfcMTeLFUWawCrTLKNxh6BqTZCmbJfiFGLXOcSvRvEkMsUKwUTn2jVvbavpgbHj4dI3Y4yr2KRKX48jgmwEjnh88OcnRjtVDUv7aJeVhuo/NHMixVip4kYEhBvtgjnYJws94CjfqD215mEVNS1HUvnyHiwZmCexOvZo/1VNoGpG4Jw==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(5023799004)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zz8bhMqWBKGMWay527Z7J4kA9USU0Z3S2Ke1aUwrio4n+KCZ6cwpclfXp2/tNZYuw0umks60ofwTFUq4YCIekgEYu4Fz5phIf9qw+HA1CHkaH8LxcCJSHYDl2xl6aPl4SwxfUqJkh+HEXimoMX9AW24cK5dT0Xap1nVO2bPJGxDYKHW/HkBYB5fzAisBWNvW/Idn57kXBuUkcSFO6eKjyzPW6lbZ1GVI0SweSvzi2Zb8fmBeN3DEGpjfdYUB3feq4BnNTBZGWqtbKlsnPnfBFGx9Yje07YNTcoX123KW09ywbWlZXns+1nM3wNbANxl2eur2aGOrRfvwV6c5gE//IJ3d0kGWYImKIn+jjpoJnRdjfCv7r/VLbjcgVcX5gHYAuJ05bAsa+1a1C5Z5ARB0nm5jDNGeUyTz2ShnGLExk6ms0kyFliCg8CaDgLO+rtE+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:35:25.6860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cff4c179-d543-4b25-85e0-08df03a92d85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6555

Per-CPU kernel mode associates a resource group with kernel-mode allocation
and monitoring and records its CPU scope in kmode_cpus and
kmode_cpus_list. Administrators may need to add, remove, or clear CPUs
after activation without changing the active mode.

The files are read-only, so the CPU mask cannot be changed without
deactivating kernel mode.

Make kmode_cpus and kmode_cpus_list writable for the associated group.
Validate input, update kmode_cpu_mask, and reprogram kernel-mode
association only on CPUs whose assignment changes. Document the interface
in Documentation/filesystems/resctrl.rst.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Adapt to the resctrl_kcfg caps and active split. Use
    resctrl_kcfg.active.ctrl_mode and mon_mode in kmode_cpus_write().
    Use full ctrl=/mon= syntax in the kmode_cpus example.

v4: Empty masks are now allowed and updated masks are in rdtgroup->kmode_cpu_mask.
    Updated the changelog.

v3: New patch to add "kmode_cpus" and "kmode_cpus_list" to support
    kernel_modes.
---
 Documentation/filesystems/resctrl.rst |  30 ++++++
 fs/resctrl/rdtgroup.c                 | 131 +++++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 490e8f534d37..3e886f84315b 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -658,6 +658,36 @@ All groups contain the following files:
 "cpus_list":
 	Just like "cpus", only using ranges of CPUs instead of bitmasks.
 
+"kmode_cpus":
+	Accessible only within the resource group currently associated with
+	the active kernel mode (see "info/kernel_mode").
+
+	Bitmask of the logical CPUs associated with the group's kernel mode.
+	When kernel mode is activated through info/kernel_mode, every currently
+	online CPU is included. CPUs that come online later are automatically
+	added to the association.
+
+	Writing a mask reprograms the association: it enables on the CPUs newly
+	added by the write and disables on the CPUs dropped from the previous
+	mask. An empty mask disables the association on all currently online
+	CPUs, but CPUs that come online later are still automatically
+	associated. The mask must contain only online CPUs; masks naming offline
+	CPUs are rejected. Errors are reported in "info/last_cmd_status".
+	Example::
+
+	  # mkdir ctrl1
+	  # echo "assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1//" \
+	        > info/kernel_mode
+	  # echo 0-3 > ctrl1/kmode_cpus_list
+	  # cat ctrl1/kmode_cpus
+	  f
+	  # cat ctrl1/kmode_cpus_list
+	  0-3
+
+"kmode_cpus_list":
+	Just like "kmode_cpus", only using ranges of CPUs instead of bitmasks.
+	Writable with the same semantics and restrictions as "kmode_cpus".
+
 
 When control is enabled all CTRL_MON groups will also contain:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 10d936710899..576f19a9baa6 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -415,6 +415,131 @@ static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/**
+ * kmode_cpus_write() - Update @rdtgrp's kmode_cpu_mask from @newmask
+ * @rdtgrp:	Resctrl group whose kmode_cpu_mask is being updated.
+ * @newmask:	New CPUs for @rdtgrp's kernel mode association.
+ * @tmpmask:	Caller-allocated scratch cpumask used to compute the
+ *		incremental enable/disable deltas; contents on entry are
+ *		ignored and on return are unspecified.
+ *
+ * Reprogram kernel-mode association only on CPUs added to or removed from
+ * @rdtgrp->kmode_cpu_mask, then update the mask to @newmask.
+ */
+static void kmode_cpus_write(struct rdtgroup *rdtgrp,
+			     cpumask_var_t newmask, cpumask_var_t tmpmask)
+{
+	bool assign_ctrl = (resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN);
+	bool assign_mon = (resctrl_kcfg.active.mon_mode == KMODE_ASSIGN);
+	u32 closid, rmid;
+
+	closid = rdtgrp->closid;
+	rmid = rdtgrp->mon.rmid;
+
+	/* CPUs dropped from this group: old & ~newmask. */
+	cpumask_andnot(tmpmask, &rdtgrp->kmode_cpu_mask, newmask);
+	if (!cpumask_empty(tmpmask))
+		resctrl_arch_configure_kmode(tmpmask, closid, assign_ctrl, rmid,
+					     assign_mon, false);
+
+	/* CPUs newly added: newmask & ~old. */
+	cpumask_andnot(tmpmask, newmask, &rdtgrp->kmode_cpu_mask);
+	if (!cpumask_empty(tmpmask))
+		resctrl_arch_configure_kmode(tmpmask, closid, assign_ctrl, rmid,
+					     assign_mon, true);
+
+	cpumask_copy(&rdtgrp->kmode_cpu_mask, newmask);
+}
+
+/**
+ * rdtgroup_kmode_cpus_write() - Write kmode_cpus or kmode_cpus_list
+ * @of: kernfs open file
+ * @buf: CPU bitmask or list from userspace
+ * @nbytes: length of @buf
+ * @off: unused
+ *
+ * Parse and validate @buf for the group associated through info/kernel_mode,
+ * then update kernel-mode association via kmode_cpus_write().
+ *
+ * Return: @nbytes on success, negative errno on error.
+ */
+static ssize_t rdtgroup_kmode_cpus_write(struct kernfs_open_file *of,
+					 char *buf, size_t nbytes, loff_t off)
+{
+	cpumask_var_t tmpmask, newmask;
+	struct rdtgroup *rdtgrp;
+	int ret;
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+	if (!rdtgrp) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	if (!buf) {
+		rdt_last_cmd_printf("%s: Invalid input\n",
+				    is_cpu_list(of) ? "kmode_cpus_list" :
+						      "kmode_cpus");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (!zalloc_cpumask_var(&tmpmask, GFP_KERNEL) ||
+	    !zalloc_cpumask_var(&newmask, GFP_KERNEL)) {
+		rdt_last_cmd_printf("%s: Kernel allocation failure\n",
+				    is_cpu_list(of) ? "kmode_cpus_list" :
+						      "kmode_cpus");
+		ret = -ENOMEM;
+		goto out_free;
+	}
+
+	if (resctrl_kcfg.active.kmode_cur == RESCTRL_INHERIT_USER) {
+		rdt_last_cmd_puts("No active kernel-mode association\n");
+		ret = -EBUSY;
+		goto out_free;
+	}
+
+	if (resctrl_kcfg.active.k_rdtgrp != rdtgrp) {
+		rdt_last_cmd_puts("Group is not associated with kernel mode\n");
+		ret = -EBUSY;
+		goto out_free;
+	}
+
+	if (!rdtgrp->kmode) {
+		rdt_last_cmd_puts("Kernel mode is not active on this group\n");
+		ret = -EBUSY;
+		goto out_free;
+	}
+
+	if (is_cpu_list(of))
+		ret = cpulist_parse(buf, newmask);
+	else
+		ret = cpumask_parse(buf, newmask);
+
+	if (ret) {
+		rdt_last_cmd_puts("Bad CPU list/mask\n");
+		goto out_free;
+	}
+
+	/* kernel-mode association is only programmed on online CPUs. */
+	cpumask_andnot(tmpmask, newmask, cpu_online_mask);
+	if (!cpumask_empty(tmpmask)) {
+		rdt_last_cmd_puts("Can only assign online CPUs\n");
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+	kmode_cpus_write(rdtgrp, newmask, tmpmask);
+
+out_free:
+	free_cpumask_var(tmpmask);
+	free_cpumask_var(newmask);
+out_unlock:
+	rdtgroup_kn_unlock(of->kn);
+
+	return ret ?: nbytes;
+}
+
 /*
  * Update the PGR_ASSOC MSR on all cpus in @cpu_mask,
  *
@@ -2677,17 +2802,19 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "kmode_cpus",
-		.mode		= 0444,
+		.mode		= 0644,
 		.hidden		= true,
 		.kf_ops		= &rdtgroup_kf_single_ops,
+		.write		= rdtgroup_kmode_cpus_write,
 		.seq_show	= rdtgroup_kmode_cpus_show,
 		.fflags		= RFTYPE_BASE,
 	},
 	{
 		.name		= "kmode_cpus_list",
-		.mode		= 0444,
+		.mode		= 0644,
 		.hidden		= true,
 		.kf_ops		= &rdtgroup_kf_single_ops,
+		.write		= rdtgroup_kmode_cpus_write,
 		.seq_show	= rdtgroup_kmode_cpus_show,
 		.flags		= RFTYPE_FLAGS_CPUS_LIST,
 		.fflags		= RFTYPE_BASE,
-- 
2.43.0

