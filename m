Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CFA511230;
	Fri,  4 Sep 2026 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545202; cv=fail; b=rVd+8LNHqh4G5SnNyLrNUA4XOvgmNBtLcGzHgT8vGyOlhClDuyNl/uMAna5WoSOR9Td1uB8+0vodSO37gEzS1JHQVS2jmmRWzf4kXbOmVPpy76SgbXGLs4fyP3AJAMjwNJ2jsj9bJd8vIgQg+vhca5VRcSL2kN0owRKV96sBYSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545202; c=relaxed/simple;
	bh=W7l100rmkoykVgKApgbjtzFhzX4034PvXPIAZao17RY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TitfsHzS/KkUHjLBkTzabj3bzYzYVulcVFt8zUhfo1aWnDME5CzsFGsrHMBlq1bwOx5wgtgEA3W+klYmaDcExNHdZsY7sla/DlnALL1nwNJJ/33aSiPgI4SchIY0Yu+aNNu+nhGcItf15DB5o3v0A/013p5Zc9Ae5up4G3jWOeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PpffhhtS; arc=fail smtp.client-ip=52.101.52.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PpffhhtS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkpmDW323nsz84WxEyyx9t0FBm2K8M93SOsl9jrQCA2CV/Bzm30MzAvPj1xS1dLf2CmSpWwV/cgztIb4xv2Oofnxs4Vcsq2ywO9XlcIrdsysSGokHF4jMIW0t0A/KsEWgmCZVR2xbfUE6NVwve6bdUPR1RCmGsEhzrMILlw4A0+v5EQRPswG1Jv7ygXrXB4nwdKbbQZdfS5FCkLWybhG63cNUiOYqQ8utNyRHkt9uJ6wSh85ytHtlIUeCqPBeuHgC+WBY2LbTNQPlGCU1kMY8S2LwWyDGAAgx+VtZvZ7zAEViQjqgYHJAp4IDW1d6LROwDpBl+KCHbhuHW/hzoxgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+y5B48+5hf2I7zAcU6TRpWa20HG8b/HWbmpu14d50Lc=;
 b=vNn5CnDkOfFswvQYaRAeHMa2Qn6evZ4nCuVdhaRIkAg2+H+7eM9GivioZzFjJobm2kEG5IlkP2wbHwT5m88pdHEAckMr+t/9+9nAKwi8UPIMRfn1QKRAoYnZio3/BvBmev2XcW/SONfUzu4bnjyZ6DqUi7FlyUnw7gvcHjrEUWgOsg2oVTWxxqdgSZEE31z4hBNAlIlZl5pP846+svIpT2dr+clv1dLbH+UnqMSvdpIct/YdZ6Z0wyy1mfYahntkXN78k21DAjgTDpIbwzRe+lI8n6Uw3Ibtk/DhB8q/NgC+HWK1viItRn5PFCFFRQlgW/qvRq+E7i3eD/R1zQ2IcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+y5B48+5hf2I7zAcU6TRpWa20HG8b/HWbmpu14d50Lc=;
 b=PpffhhtSPYxkN6D/bXPPocheNmeB0NZr/aq4Zcb8asaBtYoNLmhuC2bCYk7OoVSkoI31FaPjBOdehax8UTE1OpGL0zxK725nz2yOI8Vj/WPAjnyq+UKSSkvbtDg/IiCr2M0P+Ied+psQnq7rVQr1oF3ZR2+Iz+6zHSU7Rx8ANcQ=
Received: from BN9PR03CA0559.namprd03.prod.outlook.com (2603:10b6:408:138::24)
 by SA5PPF916D632A9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 18:06:36 +0000
Received: from BN7PEPF0000009E.namprd04.prod.outlook.com
 (2603:10b6:408:138:cafe::28) by BN9PR03CA0559.outlook.office365.com
 (2603:10b6:408:138::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Fri, 4
 Sep 2026 18:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009E.mail.protection.outlook.com (10.167.248.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 18:06:34 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 4 Sep
 2026 13:06:31 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
Subject: [PATCH v2 2/3] fs/resctrl: Assign counters to existing groups when enabling mbm_event
Date: Fri, 4 Sep 2026 13:06:11 -0500
Message-ID: <79d6aaedbef7e3113a15c79b1f6eb7510b2a2a62.1788545152.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788545152.git.babu.moger@amd.com>
References: <cover.1788545152.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009E:EE_|SA5PPF916D632A9:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ca9c06-3e60-4550-8999-08df0aaf4146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|7416014|1800799024|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	DzthDQ7JopDG0Kem6RmWrT88Kb/nmSc4T5SEP5k8IL9muAnrL72jLFy7SRxPX1g1mwb+tkq+WQJx+uXRVIt7scrN6O83TajeKmCN4Wx9RXe83knXxUMTsD/XqhAdgejweYHpvf/fJm4l7k5R301j1xED0xIu16yF1kgpGDxGf8fSIKFDT4P318KP4X6ZdxruWOy9Wu5CNL/OUs4LUs3ic7QNywUlNB6mYS/VMewx1rYv1/YyvVv4ZSxOSkZH3dZGaX8BgaRpS4kIiKcQkBta+vko+lQQISWPRoiQMtcyDUFa/AK1pHtgsJKMsGLzJR8cGi8J58jocN5ccUBqXzBCP8o7Iw/CGh1qAOhg0DVIhvAXcy+CGiWL8kgdd/zSTeczBilfHn/0zYVb5NmD5BgDDfgBVUYamDUARtAkljUoaF9+EmwbzoBLMfxOMw4/Vut19ZNq16+mCJG7okNGmW2LsUVQFDhEEw1pcyCdy0YydfPaXbP+bmgBzqkdi97gwta6WetCsJR0yOsYToValQS6bYa8qeEkku2ugoqszTpFnDdxylXrCLqjIhAKD3VtroJpF4kZQR1AWQ8jyQp7kVu31lZVpk+VCbgXFC7UBKyvEDQsnUzdIGx9r+lgJglb60urBc5w14qwFRXp9iyJzkDhug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(7416014)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6hA9AHlyEVsY+e3P1hVLDY4/Yi0EbX59jkS1oR5EKXExX0wI0ieKm0Ic7MW/UXg9DJaOsBVE9hkrYs5Of8usNbeby99lLGf1CEOmOI2UQQqkJWVRKUilE+vXveLc/Dw7bt9joItIX2LCXyueHG9KveOGaEp6pL6vT49IZtmIgWKUc5Rp4JhyyCYWzqRL3lrl+1Fns7lNSisp7aH+xI2HZSFx+Vsr4xL1zxLcS76VHNt7onQnxgqRI2wmTOwLMSr/EpPqnjIXXtWBt1yL22BCcZmVx3wNcUVB99W2ct3yBvwRVw2UQ5OL5evQWYGZ3TMEjTm7w+OqhY0RkFllNcixsQgzf2rt0uk1QVY1nAhvcP4/RfmL1WXrmZhWzUnsCcAEVIjbPRYfov/4rYVlju8nJgupqGYfv4UmKAiUFlso0w3hW/sDjM3Ff3rcGYAEdcDV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:06:34.0166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ca9c06-3e60-4550-8999-08df0aaf4146
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF916D632A9

resctrl_mbm_assign_mode_write() frees all counters and sets
mbm_assign_on_mkdir for subsequent mkdir, but does not assign counters to
groups that already exist, including the default group created at mount.
Those events then read "Unassigned" until the user assigns counters by
hand.

Enable mbm_assign_on_mkdir and assign counters to existing CTRL_MON and MON
groups with resctrl_assign_cntrs_allrdtgrp() so the switch matches mkdir
auto-assignment. Groups left without a counter still read "Unassigned".

Update Documentation/filesystems/resctrl.rst to describe this.

Fixes: 8004ea01cf63 ("fs/resctrl: Introduce the interface to switch between monitor modes")
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: New patch.
    This patch addresses the Sashiko comment about documentation issue where
    counters are not assigned automatically when mode is switched to mbm_event.
    https://sashiko.dev/#/patchset/8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger%40amd.com
    In fact, it exposed a real issue. When switching to mbm_event mode, existing
    monitoring groups should be assigned counters whenever counters are available.
    This provides a smooth transition between modes and aligns the behavior with
    the existing auto-assignment mechanism.
---
 Documentation/filesystems/resctrl.rst |  7 +++++--
 fs/resctrl/monitor.c                  | 30 ++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..79feeb1dc296 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -371,8 +371,11 @@ with the following files:
 	of counters available is described in the "num_mbm_cntrs" file. Changing the
 	mode may cause all counters on the resource to reset.
 
-	Moving to mbm_event counter assignment mode requires users to assign the counters
-	to the events. Otherwise, the MBM event counters will return 'Unassigned' when read.
+	Moving to mbm_event counter assignment mode enables "mbm_assign_on_mkdir" and
+	assigns counters to the events of all existing groups, including the default
+	group, for as long as counters remain available. Events left without a counter
+	will return 'Unassigned' when read until the user assigns one using
+	"mbm_L3_assignments".
 
 	The mode is beneficial for AMD platforms that support more CTRL_MON
 	and MON groups than available hardware counters. By default, this
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb128ea..61463741b91b 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -1326,6 +1326,27 @@ void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
 }
 
+/*
+ * resctrl_assign_cntrs_allrdtgrp() - Assign counters to the MBM events of every
+ *				      existing group. Called when "mbm_event" mode
+ *				      is enabled.
+ *
+ * Groups created while in "default" mode have no counter assigned, including the
+ * default group created when resctrl is mounted. Assign counters to them so that
+ * enabling the mode leaves the same assignments that mkdir would have made.
+ */
+static void resctrl_assign_cntrs_allrdtgrp(void)
+{
+	struct rdtgroup *prgrp, *crgrp;
+
+	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
+		rdtgroup_assign_cntrs(prgrp);
+
+		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list)
+			rdtgroup_assign_cntrs(crgrp);
+	}
+}
+
 /*
  * rdtgroup_free_unassign_cntr() - Unassign and reset the counter ID configuration
  * for the event pointed to by @mevt within the domain @d and resctrl group @rdtgrp.
@@ -1599,9 +1620,6 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 									   (READS_TO_LOCAL_MEM |
 									    READS_TO_LOCAL_S_MEM |
 									    NON_TEMP_WRITE_TO_LOCAL_MEM);
-		/* Enable auto assignment when switching to "mbm_event" mode */
-		if (enable)
-			r->mon.mbm_assign_on_mkdir = true;
 		/*
 		 * Reset all the non-achitectural RMID state and assignable counters.
 		 */
@@ -1609,6 +1627,12 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 			mbm_cntr_free_all(r, d);
 			resctrl_reset_rmid_all(r, d);
 		}
+
+		if (enable) {
+			/* Enable auto assignment when switching to "mbm_event" mode */
+			r->mon.mbm_assign_on_mkdir = true;
+			resctrl_assign_cntrs_allrdtgrp();
+		}
 	}
 
 out_unlock:
-- 
2.43.0

