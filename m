Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010010.outbound.protection.outlook.com [52.101.193.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2E3F107D;
	Thu, 27 Aug 2026 21:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787867885; cv=fail; b=M4By1RsBDHWvJsNKVNTi1lV/zz7ErfpsNy20ZHr42VFyaMOxxdHil+QrvQqazU89D5xMNZp8cWG8Q1eSQB8a869t56j5mmDx4iLn5EzjYDOhX6K7qWU57k1rrls2BbsnM1B1SGiHu+HHaYFMKq0/+5taGaA2Jn2lHGK/49HUQ5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787867885; c=relaxed/simple;
	bh=bU8OUGx0xY5JQU2WVI3SVDKcVEi5wsmq3y+ylCDl+h0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XZJlMvSKEL5vS0rjixWubtKqdyk186uugrF0yvPLg+XSgAoHDfxJlpb/0y7hlVNvTZYFOJHhEftOBoMUB2LzgKtwXRo/0p5PNFyGbpvv/6rFX+ejsmxzlBCrc54xXAzHam9XqvYe4fY72FeU9zubkwLJa8dkoa2vhYzsd1jnB4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AlYEXMFl; arc=fail smtp.client-ip=52.101.193.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AlYEXMFl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4pO3To7m1xwsT0eggjkW/YlRuWD8J087S/O1dzSngYZHsv43HrVOj4j3lQe1m4TK9hM/nOz/AeX1h9ejIIb+x570xABE4vNyIW9HxX1wSl4kB8kMDYAEzNoSCfO+dsEgVZrPKdfp6Q91/w+Vm22DeMTvvyJh+EoL7bZNyi30lT/jevh+A1DxNt5FnSBIFS1Tv7N7hGZMT2bkFKlYn2dW3odQxwE+7uw0Xkzq0X3K62QxbpqCYvGwJocFsh5UnAfQ8x1TQ/t7LRWgEnreQSCZuUf3jKw9jxCOgc1q+jShQOuOm4itfgXSAz0eYstaA6zKQ+PWt5oebw24JIn2t2psQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr+tRUTBxfChYYrqsfE2mtJOq1Hu+UAagWa+RLx8UKc=;
 b=cSq2u9d5vF/f+aPM3jWMPSOQFrrI4sYnwq8TRKK8ZX81EEtC9XQlbJ7lxNpyLn/GLfhJsGpCw6oNi3Msfn4XU0vgXCWqnMMQHiZE3NzsyUiTzA0TuXg9pTyUF6E87yo1yRmdUXfqSFh7NKLB5jh2Mz7cmsNm0ZtuvMGeVLltuyWP36kRnOq1KcmmUo5qjLxToXmfbAZoSFmrl7nt4x+JMxX9d/kSAgpcXc291KrrW4OqQryYjLy6Q1HzBaAG37C3QRESvYvrC6EzT3PaIXMYhu248HA0BIsP8h4P8geqiaHV24rBCMeE5baheRee5Qxe/b14NQoLN4NBalO2q92X0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hr+tRUTBxfChYYrqsfE2mtJOq1Hu+UAagWa+RLx8UKc=;
 b=AlYEXMFlw8w+9RR6ofChif1r+OcHNrzPbcuuSpMaHPfcQ62dY0rX70nhNqklw+aF7x57zzUzo/WCotyB2Stp6NNcDJQUiIEEh5x8gPCKFTqTRIXtf/uEt96fSBrVOCJWjRMKmbTawQJxVURwX/IigC4o0pmnv0KC69K1WK5zIB8=
Received: from SJ0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:a03:2c0::29)
 by DSWPR12MB999129.namprd12.prod.outlook.com (2603:10b6:8:36d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 21:57:53 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::8) by SJ0PR13CA0024.outlook.office365.com
 (2603:10b6:a03:2c0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.7 via Frontend Transport; Thu, 27
 Aug 2026 21:57:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 21:57:52 +0000
Received: from jprecision.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 16:57:51 -0500
From: Juan Martinez <juan.martinez@amd.com>
To: <westeri@kernel.org>
CC: <mario.limonciello@amd.com>, <andreas.noever@gmail.com>,
	<YehezkelShB@gmail.com>, <Basavaraj.Natikar@amd.com>, <Sanath.S@amd.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Juan Martinez
	<juan.martinez@amd.com>
Subject: [PATCH v3] thunderbolt: Fix tb->lock deadlock during hot-unplug on AMD USB4 routers
Date: Thu, 27 Aug 2026 16:57:40 -0500
Message-ID: <20260827215740.415496-1-juan.martinez@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825214237.4179813-1-juan.martinez@amd.com>
References: <20260825214237.4179813-1-juan.martinez@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|DSWPR12MB999129:EE_
X-MS-Office365-Filtering-Correlation-Id: e47c948b-6134-41e3-25a5-08df04863e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	4d+HeYVtelZDYThiPZJa5Ayhpv7ajmg89PH+JGrOtmUFYjKFeKo4PS+Z9ETTIk+2iI8hA7P7QXjF/qQcyqmbojM256GFH9k3g7KUGKrOFfr6c6V7oSz+/5MRqcYBHivak03QlSTf77rKTrWz/Tb+m7iEwJFnsrZc6Q0USVDA9gaqS+cvjojla5dKs+b4it/VmCBHHHmi9K9PovmySPRDMex41drTp2bMCzvkSct9Snt7H9XrWJXkA8p9lpdXh0VKqYKGiehPnB2ls1KykP0M06k9RZMahiXzgRvz7e8jyEqQeWdYOTfngOM3wzlIeFsXQ0sz9vAhUPYCZWS4msvi/Hb0dJwumYmzbr6bCA3Zri5YH7r/6UUmG3ghWiBQqjsllCdni1MeJ/OCIo28/OfUidjgMyq4EIjvdCZ3hOdo+6w6i9Wg6S8IbilSrXQQxkC6wqpw8c6n9Nrt1449rZRrhaKa70Tu1nmJSmhPY2saepAWgAjquzgOneBZDNDJwPX40lFpp8AqrWYr1oqiGhAF4aM2YO2Mcr0pjL1oxVc5KE++do5OhKwyxObCj+uD9SLMuEpWPnEVVBxIyOWaXNSrv/hN4Ml2ngXm5F4n+9jlSAVIuD8U6WOhIXuoJAVKK8oyO6Fqm9u4V8kdQEOKIqoYbHLTlpcMjhOdGN4+V6uCAOSLB5hIlUu6ARD+is1ncwE7vghCjHgYXKnUYLoASYb6dw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iu2BNXBCJOchP1USjJSsarxOspGtseJc0JMZTZCMIi/FvRb9RSYLv5GbXbARQ+ohkpFldR+iab1WT8WLAI6KD4VJ22HgU0G0Og9UFGzyts80F0VFpt+MYLYZ2babfrTXC8K+j8tpbzLGEKg/04QcJ+As577SBtr5jLtXEbJG4uvD4m5c9WRsOzeJh3Pw3OrCD6usPp4X67zV8c8zQNGFDO003A9Ni7DToXFfo6sEpOD+JE3lEQ32OSfJ8ZoY5HPsGbVdm7uR3j6lblRkiDjHYylWYhSB8zomBviNz265a421c4hXbe80ZbTSTi/sKjwS0spLzNh4v8R3lk3hlLc+yfxhlh4WA1i6pZJrbr3co87Mx6uX99dmdIfbHz05CgqRBj3DfZ9TT+Ssm0OswylYcHS7goz/MaK0hEZPCE4v7I7+m/xpfbkmGv+N/4x8CVtn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 21:57:52.8497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e47c948b-6134-41e3-25a5-08df04863e73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999129

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
 drivers/thunderbolt/domain.c | 26 +++++++++++++++++++++-----
 drivers/thunderbolt/tb.c     |  1 +
 drivers/thunderbolt/tb.h     |  1 +
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 12c88509a54f..8f33baafe9ae 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -788,14 +788,19 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
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
 
-	if (!nhi->ops->reset_interface)
-		return;
+	lockdep_assert_held(&tb->lock);
 
-	guard(mutex)(&tb->lock);
+	if (!nhi->ops->reset_interface || !(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))
+		return;
 
 	/* The reset clears the ring state so stop the control channel */
 	tb_ctl_stop(tb->ctl);
@@ -803,6 +808,17 @@ static void tb_domain_reset_interface(struct tb *tb)
 	tb_ctl_start(tb->ctl);
 }
 
+static void tb_domain_reset_interface(struct tb *tb)
+{
+	struct tb_nhi *nhi = tb->nhi;
+
+	if (!nhi->ops->reset_interface)
+		return;
+
+	guard(mutex)(&tb->lock);
+	__tb_domain_reset_interface_locked(tb);
+}
+
 /**
  * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
  * @tb: Domain disabling the DMA paths
@@ -835,7 +851,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
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

