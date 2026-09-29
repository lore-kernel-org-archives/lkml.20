Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5061E3E2777
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721574; cv=fail; b=Hoyhiv1GxmI3ricsrz6xLIN3S1lsIWi9TV5hP+CqlOFcG/Zb9zaFGHUT7FC9FhUvnECEy23co9LNCd7/DYUMtAl++EMlGWA14SbSyroouP3/i+se91xuLzbd2AAYcpzMDqMUpksQXBi7QmXAMnRzv++yeuHq8fAB2E/CLQ9VuVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721574; c=relaxed/simple;
	bh=nM2fmGg2XqDBwYKRsAL2Ihxn0Jkmm46qWasJHHgLlhw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sMtKfzoqPXLXpPIfLGxeH9RQTGvoZnS6Z3e6lizO/QoKmnAMsnrwYUoM/OstuTEcbU2NwJFGmYympF2XHUgLBVw9DtgoNVhlaJQisTH+m1js2qU3qGqTyUbKJ5xt55hxwC6rmK1UwcQcN+Zq4CVIgSb7tQDqesQnjcYvWy9iM1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2153X6Vx; arc=fail smtp.client-ip=52.101.56.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2153X6Vx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIMx3vqs89gpdsP6r4gN9A7bdfk7yxQ8/2OcldOEHbAlgUbHsbDgxft9IDtIbse7Lq8MaOtvCOjG1S5a3ixKovXsNSxqhdas79vArDXsbJrbh6AD8RmdoLmxpp7OKJOD3bj8PB0hnTUIrsp2J30v8E1HxKVHt/oIM2nEV8QhvEcaue3biE1AazkUx36aUCoJSyfb5wYMISt4aNi+5RjpMPLcYX0m78VbmN8FPO9MnRPTKb+Z7XfS62o+w6cShcqwhpL9JDc1Y3SNzsrBzzCUyrvSy9+4TD/AzFwo04ONbr9kOc2rxX6zZRb3AphuiQt7lkqC1UE0LjALvJTAfcty0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VWSiBqDpSQSJzpfJcqXa7pM31PSwYGGtiwtnvUXRg0=;
 b=PCQ0SI1R7AHRU8yuDvU0zg1OOCJ+fdqWO0tXibBwpSxVYfiVYZ27ZGVFxQcxtil/CZtAW8/7VQhDAtbmQJnxO2Jw+24rh397SN4Y//+LmJKwE8wgdcJrKn3sQ5k2DXpHw8Yeu9RYao74FIR/dwPejILqBC3GiQ80sgRZV8ckvfoO9x/Z9pumWprvwNG+9D69ukvGMcKKUgdUcZ5V25sG/+c6fm+R0LD5ytKKyD0EYBRFa8PH3MCRTsoAUXC2Dxixdyr+VeQ5/PMAPMLUQya5k/Hgk5f+YQqQEEmtR7M0UdaGxOqI22jQUS12F4TEsFkbfDy5O4MQUChyzY5MiqD7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VWSiBqDpSQSJzpfJcqXa7pM31PSwYGGtiwtnvUXRg0=;
 b=2153X6VxmEzfR7DPLEwNV51ryzY0Bq5pbTp481Q4baBTVIhpv0GC+UnMftz0aoAD1NEjqOvSAUXPuXB109f+A4sCb1XXU9gLIQbHkcICjlpSa18UK5NRubBAOBOjT20KVEJyqhYHAy6hka6VVtcIsCAtRG+uc6WS52rCK/kYy8M=
Received: from PH7P220CA0070.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::10)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 22:39:28 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:510:32c:cafe::39) by PH7P220CA0070.outlook.office365.com
 (2603:10b6:510:32c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 22:39:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Tue, 29 Sep 2026 22:39:27 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 17:39:26 -0500
From: Babu Moger <babu.moger@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <reinette.chatre@intel.com>
CC: <tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <dapeng1.mi@linux.intel.com>,
	<peterz@infradead.org>, <thomas.lendacky@amd.com>,
	<chang.seok.bae@intel.com>, <jmattson@google.com>, <kim.phillips@amd.com>,
	<prathyushi.nangia@amd.com>, <acme@redhat.com>, <nik.borisov@suse.com>,
	<namhyung@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] x86,fs/resctrl: Use a consistent log prefix
Date: Tue, 29 Sep 2026 17:39:04 -0500
Message-ID: <bc637e9a1f0c4624a01b8208f0e53582cbf21886.1790721445.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com>
References: <9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd79dbd-acf2-4aef-be5b-08df1e7a8500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|7416014|36860700016|1800799024|13003099007|10067099003|260925021911599003|260925021311599003|260925022911599003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EyGIvTBhcVAiFNqqu1JvMDto6YTmetQNLweKtrCc7SIHEeP6XEmJubtkvXvi4dMmd2DFOJMNxAQiFlkgHrFxD/ziR5UW0GPxH7gc2rqLgE5UDaHMb+kIn+Ru/jO7mxLVHXcRsb+MHVQGwyGhVaQ3gNKtuFEzEEjNumXMOI+OClqnwZXQ2g4SAkb0vBXHu0VRMvcoa1fVOyaztJ6sEWTM0Xa5cUbDi1vYtdG5VTCTf3nFtpjUEuJOuIAatklNb6lF1BlUURn4yp6Kho9ejZqpg2qrT6E1ovvQsCK8RcHel0QAbHfzVxnFYNgomVGcJfhZQ4w12v64dNVrA6SVboodU0NX2lVBrJJtEFMwfX5W3yU42wQE++uMKDOVN4s4aI+cRu9OGq7or2RzrIlRJUnNWS2REujDhz60khu8VsUetNVLopz51mP0Hx6kyCULzMI8+2Q6CwLKgOIlzwFdKYBud9hn7ZNztvINvPF7P9523ag17imLHUh/hP9WLoMtJygtPSqDqER7UNqxIEaIeS4WmQVGGgAysSvnwstVprnrvlz4q3sj4+0mSD1QpmPhYojmK7ZN25wgNu2hMz6YI8wO9qkSESVRWo1w1qkW0CF2LYlfQZwaA9STumrdDLfzjk1/8b5EmdZwnPDbIRdsyNmQ70WsDlXcn8NO38ZP+baFNzE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(7416014)(36860700016)(1800799024)(13003099007)(10067099003)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nAQzRtTNr/KHrQSh0qGqUr0neqdnN+f96zrgeFOdKK3nXw9eMCzhzps+iD8Xg3mPoqb6Q4ejGu+mYQxkax9mzv5iVvfPU6WIHpBgmHbWxgi+QHgZsDlDF2FVwMRkdSGmnx5v0CepsqVjj/rXCQQOWwJGBrlwfcXYSKP/XbNvGvb9eGJlaWycLOWiZW7z1i+OK1Wri0sK5M6aRr08O0SDisJTXibMd7I9zI258qdQNJu9cZLcwg6jk25z8ZbpA9GSC12DNtdEU8BP43042l3QdgSCPaQRKcU+i0vlP46IwRAe0Q58o2wqMPrG8Sof2F+J4dkXCyXfZOShOEBT20HS9rQMs6oC0ECLBx+PkTD08DMtuyGcL2QR/ZvQAhPhJINsic1RTnY044gHspvN0yzViD/0iBUjXY6cNmCqx4+SMGkvZ2XUWBWx9zQckgwzmt69
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 22:39:27.5295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd79dbd-acf2-4aef-be5b-08df1e7a8500
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017

resctrl code is split between arch and fs/resctrl/. Some files derive the
printk prefix from KBUILD_MODNAME, while others use "resctrl: ". Since
KBUILD_MODNAME follows the object name, messages use different prefixes
such as "rdtgroup:", "ctrlmondata:", and "pseudo_lock:".

Use "resctrl: " throughout both directories so all resctrl messages have
the same subsystem prefix.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: New patch. The issue came up during the discussion of PLZA series.
    https://lore.kernel.org/lkml/432f0cbfb811aee3c8c51bbc42faf66174375d8b.1787772750.git.babu.moger@amd.com/
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 2 +-
 arch/x86/kernel/cpu/resctrl/intel_aet.c   | 2 +-
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 2 +-
 fs/resctrl/ctrlmondata.c                  | 2 +-
 fs/resctrl/pseudo_lock.c                  | 2 +-
 fs/resctrl/rdtgroup.c                     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 25a5f0c8dc56..77726cd13b3a 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -13,7 +13,7 @@
  * Software Developer Manual June 2016, volume 3, section 17.17.
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
 #include <linux/math.h>
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index c22c3cf5167d..04b665277884 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -9,7 +9,7 @@
  *    Tony Luck <tony.luck@intel.com>
  */
 
-#define pr_fmt(fmt)   "resctrl: " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/bits.h>
 #include <linux/compiler_types.h>
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index d7caab0409b6..a58f9ba63c71 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -9,7 +9,7 @@
  * Author: Reinette Chatre <reinette.chatre@intel.com>
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cacheflush.h>
 #include <linux/cpu.h>
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 6590ebf6b29d..d81c1360d1e4 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -10,7 +10,7 @@
  * Software Developer Manual.
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index cafebdff70dc..f5a3abe5afac 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -13,7 +13,7 @@
  * Software Developer Manual June 2016, volume 3, section 17.17.
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
 #include <linux/kernfs.h>
diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index 56ab63f19bad..656c1f1a3f4e 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -9,7 +9,7 @@
  * Author: Reinette Chatre <reinette.chatre@intel.com>
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cacheinfo.h>
 #include <linux/cpu.h>
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 552ec06886f6..5c51d50e53f1 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -10,7 +10,7 @@
  * Software Developer Manual.
  */
 
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
-- 
2.43.0

