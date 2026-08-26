Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EF740DB44;
	Wed, 26 Aug 2026 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772920; cv=fail; b=Q1Cts1yHNoH7FgOGrgPC1lGEQabhe+lFmctMIhIYdjduBPtS4yRLwyW2WlS5CxrB8mgFFWijtVmu7wI7jF5+Tuy/tcctyENyRtfGd0iTMxUy6tOxqWhkK3p9rZqE6o07GkRtjDzDHzfA6Xfd0Q4LaIm4wTqDXVcsiqQxMcDg0sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772920; c=relaxed/simple;
	bh=ZFY3l54c9jxfVki0wSBPfVG0VQ92vTv4uFbsOwKqHM0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lolej5VoYnMNA78HpN3gya/t1Zb7FXOxi4RNRbTkQIqvT9B8wMw1FaWOrLMuXf07PWk24/IcrMJOrxHbp3WHUUmQNQ+riE49JeWjaYaYNM6FkxQLPIzQmQJzNnaijs4d9HaiR4nUJ7RbuRKUKO02fWjv1fC5tBxgYu+xaPIScjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZO3exZLm; arc=fail smtp.client-ip=52.101.62.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZO3exZLm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oesTEzzZJHd9I6XLz+xuQzJ8EkvGk6lMkZVpDOjwrygoXh7z9cUbC9biC+35qbGOT/VATwjduvO9NXn3wQwaNwHmx/t+riFoYROnchHqWHxKUS1gYDbq4QacgYe0KpTy3dqMpzr1XLc4gezMpTx4iqRwXKNzPrLLnvPoswnklGstclGvLhV8P7z+NpRfnVs7EHB0txFlyjdmr4NCcza8ki+yuNzZAzgzRl+BXO7+bB4np/zGlY1gXYHyG8+C0s/Vhx7n/HiMuhuDNyk2oyTU8zReID0khr/fXtiGRSQg/bn+uHM+CzUccbim4Bq/u1vbzn4gh/yGXu6bfRDAUXRtMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2gX5HKV97K748Q6CRhV7jr6g1uFviBkbj4+tlWwH30=;
 b=aE77D9qt0sSijPWUifZXRCWAMw+arJ+BBAyNKinLnnmoJ4LgXGPpJD8ZJh8zT4cB59Mpcn00rqAQWtfPt7poL4od5UEtw7E4ntuPiUqng1/ykXYoGeIUAY+vUfurhVGtKblUgY+4Wpur6lIVURlwMnd01meoaxxdjOWUIZ4loqPsNqzIpRuFhvrhHvGVzrm+NwzuW+72lz+yWWJRoGnUM+l3k6FRRlA5jz+1/2IShaMj6OlDf6BnOr6yJ5rOKdkf2dvcwZkqLfwTDq9rtHEnihvZTbieNQCr5BWqWvu0T+NIvNF22RYWHZyHoX+Mh9MtEsEopj94i/cVzpH+ebQHFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2gX5HKV97K748Q6CRhV7jr6g1uFviBkbj4+tlWwH30=;
 b=ZO3exZLmD/ptidsjcYmtI+Q9O4oUu4mhL0uvzv2XkqcjE5n2GJKV1vZJmQ0XMV27HkzBFlY8bPmVL0i6ufzzefcnCeWQVNabvWuTM8tvAX8Ux6pxKNp2GnCm5F+VX8D6VfNa2GPCtYY00LjaWF5r25yoaqvNTdDj9QuEtUY0QwY=
Received: from SJ0PR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:33b::29)
 by IA0PR12MB7676.namprd12.prod.outlook.com (2603:10b6:208:432::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 19:34:48 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::76) by SJ0PR05CA0024.outlook.office365.com
 (2603:10b6:a03:33b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Wed, 26
 Aug 2026 19:34:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 19:34:47 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 14:34:45 -0500
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
Subject: [PATCH v5 11/16] fs/resctrl: Introduce kmode_cpus/kmode_cpus_list per rdtgroup
Date: Wed, 26 Aug 2026 14:32:25 -0500
Message-ID: <0ad1110a1fa2c041d71f50b0d756815676c4dee6.1787772750.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|IA0PR12MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 787d1b30-7cec-4612-2725-08df03a916e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|23010399003|6133799003|3023799007|56012099006|10067099003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EZHtd39U0lYS07HTnm+uLag2hP98adyJ/jG2xeQEi3/6GWRZyHg7xuqQqyUJFl+k+BYiwDKQss2LBBimBCKyuR6YRE8PcUYWqw/JMxuAV3RJoTLZwy+ilpZblDYv4M4Zqid4KmH0sH7nWyI/V/G9ydZTkm1jCIdrbwNaMyprYB3lUGUTLojDj+9jakCH2Yue6g+pXWeU3sbt4pZSJOrHS5thOE6vTyfqtRNlWylJmghQT19rBZ2g+VdJ47k2WTOXNglTKHL1E3kXHq7BUjg8TxEaOH5WB4gJ+Xm8rUEdt59OCKNCKz1Jxb8LwvHXP8zB8w4gMAFhVltL3SzZeF+N+t3VZEeuRW/nMovrsbBuP0HvRJSBtrc7RjFGI/3X93k9n8NoHQhhFuZP2q/wEQwgIItkdtv/T/BTgfeU8NtQmmEuvaHsWIum78x981/awUDIMNLKiD3NLGgWe0+34Iw/Ef+G3JWGnH1pOWJehVEQrOApumlt/oLuXNDyZT2G08osyhFyOVeh9NygK2/ZLm/BV7oTN6/b4aKdJ4uePeNNQw/ACBPhs/TVQ1uSozoNw5DHWWR/dL0U9L7jy4CvdhPgmmkRhz/OZkrEwTHOnBiwDkXrxz80XZ2ayMXRa6z6GiQId30Tf1aUFQlf8CU81h+pxtoMOpVfY4tKE7qyv2Cjw1DWBdxUFHAd76BuZKSpdnT7x5InIxAZ+gUMhgvkJ+ct3w==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5Ersr73gBGB+BeLHqcPQfzmZXbDSHLEcjWT8Zfg9ch0boCf073xuubFIw0BNyKHOVOaHJP6A/ye4OrnvXazQdmo0Sv6pbgqp0Q1NSJ+9gm0ZB8YbgzjYwSgjfUaM4ZWMtmbBGllzgq0xMC2zK9Zi5R22fe1UVigDuKxO48a1Atpvj4fql4+SPj0s02RV/8uymGA9BO2n16PW9Lt9U9OTDXziBR8NPHRdDPnyoyu2yKAsuNjqeqSbjMInduV3noP3eQlphvFfIyhheY1tQQRUJx4EJWcTFtx8eAVWPjno6NRDGSvvL8KKjtqFLceCB8A/mlBpmNQY1eNloOfSuxuJHIHVH60ZnXfhyC5OUWpR2inXWHEw8qgSZOzzSYk8Tiw6qjJIM/kNYj+tsORxDvciXrfcoXJ87Ukc0m6Qr94ZDv+ztCVs2K7ElcpU/Irt6BNA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:34:47.7202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 787d1b30-7cec-4612-2725-08df03a916e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7676

Kernel-mode resctrl policies can associate kernel resource allocation and
monitoring activity with a specific rdtgroup, optionally on a subset of
online CPUs.

While info/kernel_mode exposes the active kernel mode and its associated
rdtgroup, there is currently no way for user space to determine which CPUs
participate in that association.

Add read-only kmode_cpus and kmode_cpus_list files to each rdtgroup and
create them hidden. These files expose rdtgrp->kmode_cpu_mask in bitmap and
range-list formats, respectively, matching the existing cpus and cpus_list
interfaces.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Updated the changelog.
    Removed the RDT_MODE_PSEUDO_LOCKED check and added rdtgroup->kmode check.
    Files are created hidden.

v4: Rewrote the change to be generic.

v3: New patch to add "kmode_cpus" and "kmode_cpus_list" to support
    kernel_modes.
---
 fs/resctrl/internal.h |  5 +++++
 fs/resctrl/rdtgroup.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index b56f95625072..01f9f596f9b1 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -216,6 +216,9 @@ struct mongroup {
  * @mon:			mongroup related data
  * @mode:			mode of resource group
  * @mba_mbps_event:		input monitoring event id when mba_sc is enabled
+ * @kmode:			true if this group has an active kernel-mode
+ *				association
+ * @kmode_cpu_mask:		CPUs in this group's kernel-mode association
  * @plr:			pseudo-locked region
  */
 struct rdtgroup {
@@ -229,6 +232,8 @@ struct rdtgroup {
 	struct mongroup			mon;
 	enum rdtgrp_mode		mode;
 	enum resctrl_event_id		mba_mbps_event;
+	bool				kmode;
+	struct cpumask			kmode_cpu_mask;
 	struct pseudo_lock_region	*plr;
 };
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index d2fff8adf915..06e74b027044 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -389,6 +389,32 @@ static int rdtgroup_cpus_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/*
+ * Display CPU masks for the kernel-mode associated resource group.
+ * Supports both "kmode_cpus" (bitmap format) and "kmode_cpus_list"
+ * (range list format); the output format is selected accordingly.
+ *
+ * Returns -ENOENT on error.
+ */
+static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
+				    struct seq_file *s, void *v)
+{
+	struct rdtgroup *rdtgrp;
+	int ret = 0;
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+
+	if (rdtgrp && rdtgrp->kmode) {
+		seq_printf(s, is_cpu_list(of) ? "%*pbl\n" : "%*pb\n",
+			   cpumask_pr_args(&rdtgrp->kmode_cpu_mask));
+	} else {
+		ret = -ENOENT;
+	}
+	rdtgroup_kn_unlock(of->kn);
+
+	return ret;
+}
+
 /*
  * Update the PGR_ASSOC MSR on all cpus in @cpu_mask,
  *
@@ -2288,6 +2314,23 @@ static struct rftype res_common_files[] = {
 		.flags		= RFTYPE_FLAGS_CPUS_LIST,
 		.fflags		= RFTYPE_BASE,
 	},
+	{
+		.name		= "kmode_cpus",
+		.mode		= 0444,
+		.hidden		= true,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= rdtgroup_kmode_cpus_show,
+		.fflags		= RFTYPE_BASE,
+	},
+	{
+		.name		= "kmode_cpus_list",
+		.mode		= 0444,
+		.hidden		= true,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= rdtgroup_kmode_cpus_show,
+		.flags		= RFTYPE_FLAGS_CPUS_LIST,
+		.fflags		= RFTYPE_BASE,
+	},
 	{
 		.name		= "tasks",
 		.mode		= 0644,
-- 
2.43.0

