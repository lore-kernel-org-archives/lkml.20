Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010066.outbound.protection.outlook.com [52.101.46.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438FA511230;
	Fri,  4 Sep 2026 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545184; cv=fail; b=NjuNikhWKiIbuo1UwybW/+srtwUTmiWR/sB4Tsj6UgjncGPdocUzCIpoqY5nYY19HKnepc2qYziQQof5+EaLGIS04hO18XQLaDBCUslFL3uavLJEq5/N9nMt1rdt3rv33ujIXuZ57QW0W2rngar90Clrj+z7T6k08ceC8JVlHOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545184; c=relaxed/simple;
	bh=Se/ujmciHmcUJGsEHrJtTv6QCRuWqx6R64yMF4h9qDc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EkJgVx8UZMmDxhHiWDsbdzkRcdVyYFKfF0yu1EftQjrL8xjffssKKHgufeWaD617ndYEWs2Rb9ilb8SI8lt1yvqylPsHkS3mhjYFoKuudZHhLdMga5D5RhUTzfn3XIDXHalxJvHQYFZJWb9ABkHZuVWXAyw5Vk4is4NcUpWVSkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3+kAQ42g; arc=fail smtp.client-ip=52.101.46.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3+kAQ42g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GR7URQIPGxQ9hLuUd26C9btWpodqg2cuvGirXQGuqHo+MWegFgO547v89yf2npxJO6cn9l9n8cKghNzuuDM9lLzpfkF1UJU/bycIEOqi+KBrwgeBrGTTG8AnKFSWyPGo+ctlvo7jt5w2OE9jJAd5Q2mdhsPh/aYYGDvjXq+4WV4b75GQFkpoNPSGvRYm2iKbPv83rVX2KPhAkOTi79nImK548tXi/xp3a+C924rnNjcgQA06SypHcN/gVSoT1TRfnBlkr7w3uQIMKJM/yHBCSX16c9wvZwBzKYspDCc5u4I8e96kYMF/v4N6WOhjADA9Aofri95MWQlgML3f+2QC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zx7pDwrYwEgB0jbiwAY9JGMnws9CeWAwndm0k2cQmI0=;
 b=uuvZ50KhFoTYP09Ahv5ANy+1AU0iCunNynjc05URmgsh0q2/DFDUBBjUJNA5cXUfeBqo9FaBXr+XkyqVkDuoFACmx5BIOxMc7odo9XOw0HUGhHAX0R9yGm3iEAQtlXTQBpwkvn861N8I1fvM0nVfxi6f8RFYB1ypNaHfPLphIH2GxqtpwlGu1PEzF1AD6nORlGT/6Qew9GRr1DJiSlRvBSQyrXvrB6+BB5JiDbXEs1+4MLfa9rhZArN4DbjvnmuKEHaMHnekPBot+SaDTFAiU9FB08zF0L9a88UQXMIutYCXXdxIrwm4nqjSvw1eP8aHR3ZPk2KmpbQaArdguVcqxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx7pDwrYwEgB0jbiwAY9JGMnws9CeWAwndm0k2cQmI0=;
 b=3+kAQ42gqXirzbaZ6XwWqE3YaSCQkFvsimgbKFnrpqBZ/fyPR7NNe05Zpi5rfryeMy5hvxqwSH3VfdoUDrQtrYkAowrhOwavSfp2Yb0AJRNyibUwuy7nue98ByJtueo3TvgILxiEV5EauA2waMRjqcxXHc4t+6uYOzj/C88waqk=
Received: from IA4P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::7)
 by PH0PR12MB8798.namprd12.prod.outlook.com (2603:10b6:510:28d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:06:19 +0000
Received: from BN7PEPF0000009C.namprd04.prod.outlook.com
 (2603:10b6:208:558:cafe::67) by IA4P220CA0006.outlook.office365.com
 (2603:10b6:208:558::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 18:06:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009C.mail.protection.outlook.com (10.167.248.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 18:06:18 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 4 Sep
 2026 13:06:17 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
Subject: [PATCH v2 0/3] x86/resctrl: Keep default MBM mode at boot and fix ABMC
Date: Fri, 4 Sep 2026 13:06:09 -0500
Message-ID: <cover.1788545152.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009C:EE_|PH0PR12MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: 9611b602-13fa-441d-2382-08df0aaf37f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|82310400026|1800799024|11063799006|6133799003|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+Xvd596yb5PAqOmBZ8b7R697JZKFLHR9Om5GK9ZS1s+8ya4mePpC0WWcEA5HkWlG9FnJPfl2ygFdjsJJUWhmCjeKGTC84QOIvqYcbxfNtztuMR2TU/igCrWyALOx1d3mak1zti8rNYrbDvYdFrYGiuP3FYJcdUPwZaCWSJfuq2a0j1zN0Mymd3FAkfnZd0BMP5P1EsNkbiIbAiyBd1LRaacArJkFYIS+zThDfV+iRAxOy9s2jd9psPde/BVUXmmkLQbxEu556x9KzRCZ/K1xnKGKo+LhZfqgrYdE96tRYC3j8Mfg/cckinmKxYNSSFb3ZCkWTAKItJBPPA488v35Av44jNzi0at4jj7c6aBNPXGnEOSTEapIAokhvFnap5uyVu3iIrtRbuFE4dPcNEL0nvQOEhcrNuYgECmg8McBETM8c6a0Q6NsmY3LAdg4Cd6nkWGEzmUzGsqnj9ovTx3LmyGRdwhoy4MFpGUVdiyEm9LojNNoGmc955FoodM1rwHppCjLbEbcIAYYY8KCDRV+fMsEJqAwS/NxqDsY+B3EOrSLgFZwv98ButnFjJbkvmRPWv34GplQuZO9qCY3B5BaoYaUB+VvYXDbnGEBuGVK0rEK0pxFV4By/5OtIF8J+L6Klni5o2r52LnuhS6OeNKclg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(11063799006)(6133799003)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eEKjk0sIrXZsA/BF/EILg0aJKlX1rsykWzkD6s3xK2jOpAgSaor3Gtj/kjV3Wbaf9NpiY8UrgBYmlFmXKa4yo/lxo2qr+2KVaZZEEvXcPtpkVzNQy71A06NQ+REz/2nEp/PDnjztAVVy30jje9xQPWdiqWRR8YJf2zFKLnhjDM09RwJulSiM4Xvt9YkfV6fXcs5yF4JJ4BouN+Vnhvx8Rgjs4+xhAVP1yJhjJIjuHjtuM34n7X+1g9xJJOG6dxcp1w4GEnkATESka+gQcqKrd817RFwp4aqzJzUYZIyZ6K8mGqgTn8Hi+uq8PC/we8Q6QFKyLgS99GvYbHcjpCrVB5qrPk8lG3OD7JUHmsdkIcA9b9wTyqspGf5Ps6YdvpH456dOMluY/DFlE2miJLgyX91HQ01srB01WL+gXLVyhuMynfNqhvDZ0sgVEVJybslZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:06:18.3753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9611b602-13fa-441d-2382-08df0aaf37f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8798


Hi All,

This series restores default MBM assignment mode at boot, assigns counters
when switching to mbm_event, and fixes ABMC programming for more than 32
counters.

Commit 0f1576e43adc ("x86/resctrl: Configure mbm_event mode if supported")
enabled ABMC at boot. That breaks userspace that assumes default mode,
notably pqos from intel-cmt-cat [1]. pqos creates 16 or more groups (two
counters each) and exhausts a 32-counter pool, so further groups report
zero bandwidth.

mbm_event remains available as an opt-in for snapshot/rotation when there
are more groups than counters. Default mode can monitor more groups on
current AMD platforms, but there is a known issue with default mode when
monitoring more groups. It is documented now.

Patch 1: encode the full ABMC counter range in L3_QOS_ABMC_CFG (cntr_id
was 5 bits), expand bw_src, and use u64 to avoid 32-bit truncation.
The APM [2] at [3] will be updated for the expanded fields.

Patch 2: when switching to mbm_event, assign counters to existing
groups, including the default group, matching mkdir auto-assignment.

Patch 3: leave mbm_assign_mode as default at boot.

Based on tip/master:

  461735aa6e8e Merge branch into tip/master: 'x86/bugs'

[1] https://github.com/intel/intel-cmt-cat/issues/311
[2] AMD64 Architecture Programmer's Manual Volume 2: System Programming,
    Publication #24593, Revision 3.41, Section 19.3.3.3 "Assignable
    Bandwidth Monitoring (ABMC)"
[3] https://bugzilla.kernel.org/show_bug.cgi?id=206537

v2:
- Added patch 2 to address Sashiko's comment regarding the documentation issue.
  In fact, it exposed a real issue. When switching to mbm_event mode, existing
  monitoring groups should be assigned counters whenever counters are available.
  This provides a smooth transition between modes and aligns the behavior with
  the existing auto-assignment mechanism.
  https://sashiko.dev/#/patchset/8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger%40amd.com

- Combine the two v1 patches and add patch 2 (assign existing groups
  on mbm_event switch; Sashiko review).
- Keep boot-default separate from the encoding/truncation fixes.
- Document the default-mode counter-pool limitation.

v1:
  https://lore.kernel.org/lkml/980f39d3a0e0d9f73925e362f835aeef070a1bc5.1784322818.git.babu.moger@amd.com/

Thanks
Babu Moger

Babu Moger (3):
  x86/resctrl: Fix ABMC counter programming for extended counter ranges
  fs/resctrl: Assign counters to existing groups when enabling mbm_event
  x86/resctrl: Keep mbm_assign_mode in default mode at boot

 Documentation/filesystems/resctrl.rst  | 86 ++++++++++++++++----------
 arch/x86/kernel/cpu/resctrl/internal.h | 18 +++---
 arch/x86/kernel/cpu/resctrl/monitor.c  |  1 -
 fs/resctrl/monitor.c                   | 30 ++++++++-
 4 files changed, 89 insertions(+), 46 deletions(-)

-- 
2.43.0

