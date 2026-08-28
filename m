Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4962EC083;
	Fri, 28 Aug 2026 05:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894368; cv=fail; b=TbT6a5x/gjpoAaubr4MtB386rsXcp+Il9IvUSJdSHwBHQSQZnTnp7RLuF6oxh1vjf4MJSoihFPecYkGpcSSEGU4//7u+HJxLVi4ih+g9D6qUf2dn7ZQHJ2aYj0BqwvHEeGO3xeCWuRBZfxhir4T3kf7Kma5uDeFlQBqX0hP6SF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894368; c=relaxed/simple;
	bh=PJggvcC7MsfOrMew7Zo8DeSjdDBBsz8eiVrYgMhLxJk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A1K6CH2mhKm5/4ZNiAyiCWevjddoiaJmtJgqxxpxAzfPCnvva00q/UV0S/u60FxlJSpZyFyG/r/meha1bkPSGQhE5NZRWdiRefA7M/y4n7xnz2q09HjbeDklN1mXCE44DyC8y6B1RlLRQaGzdf6xTkDtkjXCLEGKdEQ+gFgOLls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s9pydJba; arc=fail smtp.client-ip=52.101.52.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s9pydJba"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naFxzrb9/fUAPEl0mNsksOHuyRMzjBvavQuHWPpWotY6v9ph2eVlconfnnUvqvK/AWKgV1k/UoOgYk4C9fq2qiRAMBjnsb3t5y/VKrSA5M65ubDOZ5K04V4+j8LBmsOzFHp2ro3QeVJuoZ9WiUnCDvVtQbALwaJZwEJxYam9iN7V46Pcrws1OiZvfJCVIqtGCowZbQwZKqGL6WkCNR4AePXOHr/iWPxTX/CHgjhS4wMT/xgRZxdZTOn+VsK5BCPIix6aoANY1BmNkokVCnyowAfVKrF+4yoGIPc5Qd+l/+xz1jhWMiKwV3oEwYdvSEXdf6VEi/TeagoXBKXfWImKvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGDpWeU/R1v/x/yZe/plIPOvwLmBJJQeHoMP478B7Vc=;
 b=sdktWritaEO+qLaf8RNmCCkrkK/iqjob7Dip62vd9bVvz/9iNMEPM3IATeUzFFn1BfUbPbx6NuSRQh26iKgPFHKunJcQz5I2u/9YlH7tH09f22RTOgw5KHlWM7uqSgH71fv9DOS8+LaX2q6981Wpsf9+N/fwq0rcoy0+4GDEb3DkynctZ7Whh8PVWlib/j6z88f3api6u8ligI4sdLCJRawEh+rUx9BllakmZ/1kbLHLhQK5/db+s/mNsbGbcoy2osQP+vL+TzwP7NmZumf4p3PCAiljxgq/dS8oOYTdRE2aVcA8ymPFE1SyYk3WtktOokq0sVMm/S5Nt3ALjZHGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGDpWeU/R1v/x/yZe/plIPOvwLmBJJQeHoMP478B7Vc=;
 b=s9pydJbaFiFNgNHteFrvRxc3vgccPZ0enLUhJZbLLww5qPb/gqdD8ZvEAyndYlhxYSfmAwD0lpNBPpjei2OpsuQAh46tHQpBodY251RmBDHSdRroRvNkjoxAmsecpyjp5eUxZ8o89IccazVD39C3hQVhLsqzaRCxf6gUQkBXlBo=
Received: from SJ0PR13CA0136.namprd13.prod.outlook.com (2603:10b6:a03:2c6::21)
 by PH7PR12MB6667.namprd12.prod.outlook.com (2603:10b6:510:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 05:19:22 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::f0) by SJ0PR13CA0136.outlook.office365.com
 (2603:10b6:a03:2c6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8 via Frontend Transport; Fri, 28
 Aug 2026 05:19:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 05:19:22 +0000
Received: from jprecision.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 00:19:21 -0500
From: Juan Martinez <juan.martinez@amd.com>
To: <westeri@kernel.org>
CC: <mario.limonciello@amd.com>, <andreas.noever@gmail.com>,
	<YehezkelShB@gmail.com>, <Basavaraj.Natikar@amd.com>, <Sanath.S@amd.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Juan Martinez
	<juan.martinez@amd.com>
Subject: [PATCH v4] thunderbolt: Fix tb->lock deadlock during hot-unplug on AMD USB4 routers
Date: Fri, 28 Aug 2026 00:19:03 -0500
Message-ID: <20260828051903.485922-1-juan.martinez@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827215740.415496-1-juan.martinez@amd.com>
References: <20260827215740.415496-1-juan.martinez@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|PH7PR12MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfab49b-3bbe-4a44-c846-08df04c3eba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	UCEKFg1WLwyFB1INjXjthUQaJ8sUu2xo4N/7KxN24zDOlyYl0kZsqfSA8M/Pnn9pmLvg4B3FPEVaI47Q4nZJvFwRcmTzqwzoo0IAQ3FU52+cKupFRKLjxTzc8sqKZJ3ofbMqfd2FgnSdJwBDj7HMIaGhBmisGLUg4+m8eSjfEt23/UqVqhh72a22zWS53y2O9TzYr66iuF7249tD9uaYo5+FVPDQdcombDV10oH1O8zksCjwvrUbKH4EqNJagpFr6Qda8rsOtoZU8/Niavi2NmA8B8GGOXhq6B+3blgSJrTXuI4Vt2lYAj6Zx5vfzK+qScpCeJqoQOFjqJoO423CGfgMS+BPTF+k4XEM/5v/kERwSaMDf5NLAGf8sxf8WY1I+ML0nuiePg1Kbgi1rxqyiC+zEQR798GrfKGPmjuOFzuaMWx/jk/4XvKawS2qTfYzpR6j8Uv4TEqkxLyImDCGCKa2LGT8eX0DTC5NF4Pnnbwac44xyYNAhmcZv4WlJCBGTdLOq8tXM82R6l/C9PeCRiSGXXlQU4OmiCzYxPM4uwxPFcIyTdBreMaOEZ9frYgDgJR25mnXsOqK+j0Qe2HakTDcwrjobl/IKNHmmAzcp4h1E5XUITZUxYtqNg09n/KFDfQxLAE6YJ8CuDANOqX3uqIGk3FBbV80B9vk37Z1wQNyYNEbyQDLhixMaAHZk/ueAKNKQFWIWB039ypHoEHQ7Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gnwu+FIH7rMvPEQDEalNwxBlF1hO1gaqNuBgH8sfHMjSyJJs9S3fxlnW4kuIHrvV6aKLR60vm6REcbFM4ASeQ2QQviTtMQErWdDFUXSivZ4O/Xn4nXrZyf0KPq1tNMpHNBUiwNF4JE6IyZFE4rJETLghomyCc0UC9pJygVQPTCUiPYHuPhcKezBNVw7QuGNrTAHkJ5Qwz1YlqOuZCm40fV5j46dVvgo+m43ZPrgoT90QvJ+J3+gpPOxI2kQBt3+1w/41szdZrjLwFPdUiYpuf8cZDtM18Hz1cwZkQR+VnQg7bX/jSQTq+OfvTSiIoKLLwgGWb0JwQAD5SoIK+218aPYqW/y1wtq9nmNjxjJqKps5BvuqEaLVdcMflsh5vfxRit7bkrnordilriWv8xkoKqDOwz4osl01uxu13jTf93AhZv1/j+O7xv2qr4HSG0ae
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 05:19:22.7329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfab49b-3bbe-4a44-c846-08df04c3eba6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6667

Commit f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on
DMA path teardown for AMD USB4 routers") introduced a deadlock when
physically unplugging a Thunderbolt cable on AMD systems.

The problem occurs because tb_handle_hotplug() holds tb->lock while
processing the unplug event. When it removes the XDomain services,
tbnet_remove() calls tb_xdomain_disable_paths() which eventually calls
tb_domain_reset_interface(). That function tries to acquire tb->lock
via guard(mutex), but the hotplug worker already holds it, causing a
self-deadlock.

The deadlock manifests as a complete network hang because
tb_handle_hotplug() holds RTNL while waiting on its own mutex, blocking
all network operations system-wide.

The existing code already handles this scenario partially: when
xd->is_unplugged is true, tb_disconnect_xdomain_paths() intentionally
skips the DMA teardown because the hotplug handler will do it later
via __tb_disconnect_xdomain_paths(). However, the reset was still
being called unconditionally.

Fix this by:
1. Splitting tb_domain_reset_interface() into a locked inner function
   __tb_domain_reset_interface_locked() and a locking wrapper
2. Skipping the reset in tb_domain_disconnect_xdomain_paths() when
   xd->is_unplugged is true (matching the existing teardown skip logic)
3. Calling __tb_domain_reset_interface_locked() from tb_handle_hotplug()
   after __tb_disconnect_xdomain_paths() where the actual DMA teardown
   happens and tb->lock is already held

This preserves the reset behavior for normal shutdown paths while
avoiding the deadlock during physical cable unplug.

Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers")
Signed-off-by: Juan Martinez <juan.martinez@amd.com>
---
 drivers/thunderbolt/domain.c | 20 +++++++++++++++++---
 drivers/thunderbolt/tb.c     |  1 +
 drivers/thunderbolt/tb.h     |  1 +
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 12c88509a54f..4cef9f4de523 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -788,14 +788,22 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 			transmit_ring, receive_path, receive_ring);
 }
 
-static void tb_domain_reset_interface(struct tb *tb)
+/*
+ * __tb_domain_reset_interface_locked - Reset host interface (lock held)
+ *
+ * Caller must hold tb->lock. Used by hotplug path where lock is already held.
+ */
+void __tb_domain_reset_interface_locked(struct tb *tb)
 {
 	struct tb_nhi *nhi = tb->nhi;
 
+	lockdep_assert_held(&tb->lock);
+
 	if (!nhi->ops->reset_interface)
 		return;
 
-	guard(mutex)(&tb->lock);
+	if (!(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))
+		return;
 
 	/* The reset clears the ring state so stop the control channel */
 	tb_ctl_stop(tb->ctl);
@@ -803,6 +811,12 @@ static void tb_domain_reset_interface(struct tb *tb)
 	tb_ctl_start(tb->ctl);
 }
 
+static void tb_domain_reset_interface(struct tb *tb)
+{
+	guard(mutex)(&tb->lock);
+	__tb_domain_reset_interface_locked(tb);
+}
+
 /**
  * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
  * @tb: Domain disabling the DMA paths
@@ -835,7 +849,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	if (ret)
 		return ret;
 
-	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
+	if (!xd->is_unplugged)
 		tb_domain_reset_interface(tb);
 
 	return 0;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index b7cc6894a598..89dfb3381345 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2489,6 +2489,7 @@ static void tb_handle_hotplug(struct work_struct *work)
 			tb_xdomain_remove(xd);
 			port->xdomain = NULL;
 			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
+			__tb_domain_reset_interface_locked(tb);
 			tb_xdomain_put(xd);
 			tb_port_unconfigure_xdomain(port);
 		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 4373336d9425..2e6e0920cb1f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -789,6 +789,7 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb);
 int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				    int transmit_path, int transmit_ring,
 				    int receive_path, int receive_ring);
+void __tb_domain_reset_interface_locked(struct tb *tb);
 int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				       int transmit_path, int transmit_ring,
 				       int receive_path, int receive_ring);
-- 
2.43.0

