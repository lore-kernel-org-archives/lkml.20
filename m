Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794437266;
	b=RyBzy+Dmzb5Vt0UpJdL2oWxnmSSpO2nFsT8pXXAdnqgOHN/xyFz2iMTv/lCV4oy5Fq8f
	 SsgdppJe+IFD+MrClH1xJMjIIwYPgZ1AJA1ZFXqP2wTETWANGKZVP3Z+gLBQ2RE9h4Z1E
	 +/f1n3utq4y5rua982QELeSOhNq4EFaZ4MDTUuBmD+dAX729KDPLr61itu1oZipUmk3HP
	 xNQnTIXQKnBrzsp2yjsiE4Mkr10eEHNe2kw83bBPJTgMcbx2nRsJhfMLK1rtF25jPZ/U+
	 9yVuxcrK3B7GXlGefQg6jrqierlLmjlejbFuZKJH19uWSbmiJZUPgUNP4tLVD68/qSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437266;
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
	bh=5qBnRXo+Kgi2EIoBw3OSAp57VGbxvf+3VYzD3ClRUe0=;
	b=wycnE/Ob2vZHMdgn46Dvdr27co5jZ1Co0mGWBm6NO1HNJV/Ht1ibZiFQGK9VQ1K7oeS8
	 lpqVXfUdFqT/IpUB2/N7oWgB8S/bDlpOeu5oB/me9MEkyiqIWs5O1HBEnquCKpR41FxKz
	 CNBWxM4Ob2BUDRgVCVSnfmwVtR/q1wzpXPtlCY3u7ZbYBboLODIYRd+hRM5yH1ZYr0A0W
	 wZ9Cm+zUeIIbIVRGhCM1nqAQmhMNHbmu2rnOMJf/a80hw+jLHsixVwI4yATt2z2/8orHK
	 yF4Di2eh0j6LYEK2CDeL4DPEru3nkz8VEtlN3T0kxPI7HXrPtV/rn+d6Y8I/ApNcBSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xXERj62P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.69
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E6606B757;
	Wed, 11 Nov 2026 22:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 755E6606B757
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xXERj62P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rf+wnXRW+jy6STTkSI2qrNF8seZD3+0wPf5Dh4vy0EMOIY+QSQEX13h2B9M5oPq9eURxLgQGlPM1hZDq+sDGGmUu2oFIONYF4zUsdAfbjeDH5GEh+iC1bXQXGxQL1fGJOMU2GRmGwQ7sFFnQ4mOFElYUQDxsqRl7DUbjpBpUf9c5mCuad5LTPqFVits4Gbr4xK71qd7Mf/yLRmPMPz4fTfMQ3T+GNbTkHcMBGWbNu6q28OKR6lyV41rC4TkC3VguETnY8YeecTSyHmKDzPez3TxlVx7k6uZlmprIZv9Y/2Yvxj+QHccAdYG6ufdWMrjNnZhejiMdoO/hK4aZ5SRm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qBnRXo+Kgi2EIoBw3OSAp57VGbxvf+3VYzD3ClRUe0=;
 b=knW1XuOMdIYhxPS5GgKWDPtNRgi3rK2mn7DEyDRpg0xYmzH4LMKh32oITVk2GdqdVqW3pEAg0QHp3sE4drLWN3ouS0zD6nKtylc/J9nwnAit4hyb+x7P3E1X4EmZFz8UdGlUQaIIHmpvZhZVRKjAL3NTPY9ybpillwW0kYC2C0J6gIO+Xwhj7E7MhS64myCfAC5Axhr2mGnw6zPrTF8LXjLt3j5nwYJ4Jr4oa4Cm/Ag8ywpUHUKseb6Wo+KQ5aSj7gO4lx4ReeWk0M3DlzxckWzitDTZHA6BTQN6RiLkOY4prZSSL0OKbnSbA+uHCW3QOnca13UAs4EEl/LN4Qt0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qBnRXo+Kgi2EIoBw3OSAp57VGbxvf+3VYzD3ClRUe0=;
 b=xXERj62Pg6s+K4rEp8gx4dwbrgJhqml8gHxOq32Itv9nPJDfc2e36b0HTsWN1k0TzldkNP94mD8aIl4G3FDR/Pt0iK0tjWYsfHzhYSToAG9NubUffmSIb6EJbH6/A3sgARNXDjGLYhWHbQIt7cPTFFGvDYErB0scYp5HRQrGqe0=
Received: from PH7PR10CA0013.namprd10.prod.outlook.com (2603:10b6:510:23d::9)
 by DM4PR12MB6254.namprd12.prod.outlook.com (2603:10b6:8:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 22:47:32 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::91) by PH7PR10CA0013.outlook.office365.com
 (2603:10b6:510:23d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 22:47:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 22:47:31 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 16:47:16 -0600
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
Subject: [PATCH v7 18/19] fs/resctrl: Allow userspace to write kmode_cpus/kmode_cpus_list
Date: Wed, 11 Nov 2026 16:44:11 -0600
Message-ID: <f236e7f6d752b59d8871e13e439357221ee2c503.1794437052.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|DM4PR12MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afec300-3e07-448c-490a-08df4045c53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|82310400026|1800799024|376014|260925022911599003|260925021911599003|260925021311599003|5023799004|11063799006|56012099006|18002099003|22082099003|6133799003|10067099003|13003099007|261009223027099003|261021123027099003|261028144727099003|261102123227099003|261026121527099003|261022105027099003|261026140227099003|261022075727099003|3023799007|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	dCzP36Wd48RAGHH4iDEyntU0Nyt6CZr+BFu0KOtv495SgugO4FCsQDPO7VQcyrGFLij570HyHdhcPkpSH6pHMCc0qfjM3UI9mJsmQz37wEd2laWGW5IEjnHKuVtJj3xbqtwyu/ZGzvPwlljnx+Us3jPdIFHIA3C1pi38VIRoDuLpW3OQqxkwKvJcOqZEYZmcqXfJaZYz0uQ71yLGOGPazxrE3ACBJNCT22sOJ76Yow+hDjtg/D0U4RZIuYBqFEzu0yCG5QO/P4SlsVUUJbf52LwsxM5GQhil4Xghjt8NG/cr0Ukq8ezQEwzfY8MUW9QGy0BX6xRxvfGKR6ZoWfHWoraAKh+4ViucYEDHVG4Fk8sbyJYzNl71vddHif2EuMwjs7QR21wASHmtydAtTWVClVVJrhLy5NRJz28FP9C2G6pjLfSBhEWWgwlv+D9eQa4uXNbQnjABnwqyj6fvcKTx3h/UAcRJVJar672oZasQpPqARjvl1PXByObgxjLcjixeJ0k8w2cXYoUSJU8ejnL5yprUdjL0kBlPU9sxZZyewz8phFueRg7t0BQe8rl2iBODqQ7NZCmLqAs4SI2yP3Q1++YWy7jVy1DRfYg/EaU2R4v/Ijhts+vAo0VK0GVUxfvkhXfon3csD9IQrTcnphnmwg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(82310400026)(1800799024)(376014)(260925022911599003)(260925021911599003)(260925021311599003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(10067099003)(13003099007)(261009223027099003)(261021123027099003)(261028144727099003)(261102123227099003)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(3023799007)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eQFe6oFvyCRXfGgTPjyf1NIls5hf/FpJXSApwcLU5ojXSj1elSejvtwgIumMNT9BBUeDJO8y0LmR/AMsfOL+lb+q0f3oTNm5+/xOefCJeRQQe81rhMp29XwDgDoZ/hIgnaUjX81J+cf9sb33xC2s38xqf/1WHbZ651dmMUTXGo/mbCjzhzs7gTVDdRcab0x83YDd7ddM4LIHD1k3pl7k1GpFF8GQWC1F4nbnb4FVWNTVZ87nkkfHL0uUpg//El/1B2Z3QVORx+LWD1EHUaDsiVtBL5vGxK1pzicwlmL8aVSKn1+PqVm4cTOiU2i8sxqyE99rWuI5ZBciOvyjA+rRxplCUDgUiCHQnOQV/K4x8JYEIEHzJdsikPAx7oqqmp1BuAxWuFjQj2t4HtI0I3d/IwqoeWDfz9tEHfIx3FEoTDzKt3pAUztP/UYh0Co0lTGe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:47:31.4836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afec300-3e07-448c-490a-08df4045c53f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6254

The global per-CPU kernel mode allows CPUs to use different CLOSID and/or
RMID associations when transitioning from user mode to kernel mode. The
mode is enabled on a per-CPU basis, and kmode_cpus and kmode_cpus_list
expose the CPUs used by active kernel mode.

Add write support so userspace can update the CPUs used by the active
kernel mode.

Document the interface in Documentation/filesystems/resctrl.rst.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v7: Changelog update.
    Last_cmd_status message update to keep the messages consistant.
    Minor changes to handle resctrl_kmode data structure changes.

v6: Use flattened resctrl_kmode and global_enable_per_cpu.
    Fix the sashiko reported issue.
    https://sashiko.dev/#/patchset/cover.1787772750.git.babu.moger%40amd.com?part=15
    Update the changelog.

v5: Adapt to the resctrl_kcfg caps and active split. Use
    resctrl_kcfg.active.ctrl_mode and mon_mode in kmode_cpus_write().
    Use full ctrl=/mon= syntax in the kmode_cpus example.

v4: Empty masks are now allowed and updated masks are in rdtgroup->kmode_cpu_mask.
    Updated the changelog.

v3: New patch to add "kmode_cpus" and "kmode_cpus_list" to support
    kernel_modes.
---
 Documentation/filesystems/resctrl.rst |  30 +++++++
 fs/resctrl/rdtgroup.c                 | 114 +++++++++++++++++++++++++-
 2 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 1a1877222624..2f0f6f01766f 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -716,6 +716,36 @@ All groups contain the following files:
 "cpus_list":
 	Just like "cpus", only using ranges of CPUs instead of bitmasks.
 
+"kmode_cpus":
+	Accessible only within the resource group backing the active global
+	per-CPU kernel mode (see "info/kernel_mode").
+
+	Bitmask of the logical CPUs used by resource group backing the kernel
+	mode. When kernel mode is activated through info/kernel_mode, every
+	currently online CPU is included. CPUs that come online later are
+	automatically added to the group.
+
+	Writing a mask replaces the CPU mask. The mode is enabled on CPUs
+	added to the mask and disabled on CPUs removed from it. An empty mask
+	disables the mode on all currently online CPUs. CPUs that come online
+	later are still automatically added to the group. The mask must
+	contain only online CPUs; masks naming offline CPUs are rejected.
+	Errors are reported in "info/last_cmd_status".
+	Example::
+
+	  # mkdir ctrl1
+	  # echo "global_enable_per_cpu:ctrl=assign;mon=assign;group=ctrl1//" \
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
index 86bd6a66812b..0d67e7086e25 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -427,6 +427,114 @@ static void resctrl_configure_kmode_global(const struct cpumask *mask,
 					    enable);
 }
 
+/**
+ * kmode_cpus_write() - Update @rdtgrp's kmode_cpu_mask from @newmask
+ * @rdtgrp:	Resctrl group whose kmode_cpu_mask is being updated.
+ * @newmask:	New CPUs for @rdtgrp's kernel mode association.
+ * @tmpmask:	Caller-allocated scratch cpumask used to compute the
+ *		incremental enable/disable deltas.
+ *
+ * Enable the kernel mode on CPUs added to the mask and disable it on
+ * CPUs removed from the mask.
+ */
+static void kmode_cpus_write(struct rdtgroup *rdtgrp,
+			     cpumask_var_t newmask, cpumask_var_t tmpmask)
+{
+	/* CPUs dropped from this group: old & ~newmask. */
+	cpumask_andnot(tmpmask, &rdtgrp->kmode_cpu_mask, newmask);
+	if (!cpumask_empty(tmpmask))
+		resctrl_configure_kmode_global(tmpmask, rdtgrp, false);
+
+	/* CPUs newly added: newmask & ~old. */
+	cpumask_andnot(tmpmask, newmask, &rdtgrp->kmode_cpu_mask);
+	if (!cpumask_empty(tmpmask))
+		resctrl_configure_kmode_global(tmpmask, rdtgrp, true);
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
+ * Update the CPU mask of the group that backs the kernel mode.
+ *
+ * Return: @nbytes on success, negative errno on error.
+ */
+static ssize_t rdtgroup_kmode_cpus_write(struct kernfs_open_file *of,
+					 char *buf, size_t nbytes, loff_t off)
+{
+	cpumask_var_t tmpmask = CPUMASK_VAR_NULL, newmask = CPUMASK_VAR_NULL;
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
+	if (resctrl_kmode.active != RESCTRL_GLOBAL_ENABLE_PER_CPU) {
+		rdt_last_cmd_puts("No active global per-cpu kernel mode\n");
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+	if (resctrl_kmode.rdtgrp != rdtgrp) {
+		rdt_last_cmd_puts("Group is not backing the global per-cpu kernel mode\n");
+		ret = -EINVAL;
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
@@ -2689,17 +2797,19 @@ static struct rftype res_common_files[] = {
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

