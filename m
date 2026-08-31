Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258994CCDC4;
	Mon, 31 Aug 2026 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192995; cv=fail; b=KjEFd3+yd/T6x3la+HryY1NxuRQeaW++n2z0TwLNURxK7+ym7nkwhveZ8LiZTGotlAmr97jl8xVgzbsOhHNYn4aR+bRTYYPPCbfC1vEGKM+vpkMLAVXJ0RxZZu0VmP5HZ1MgdAazEXiCaSxLxDkKYAjNaZm1cZE0eA+i8Gd6R64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192995; c=relaxed/simple;
	bh=PjSV0dq4eWx9fvekZGRFO2SW6nOCzkdCQ1VKWRLHigM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UM/A/bmzuJ5oVT2y4+/mZE4qgWTkUFAy9qAztz3/Xtc/QU2BeyLfvsWXx7H6hMCgqLqZYAVKXP+wOc4T1fqAemKqhdhImUfYzh7oNO25X/6JteUd+E7xKx+fkH+R1minLv2amuEedeQcII2oGDs5ho9XNca3ymYcdAtTj/X0DiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NB/ssysR; arc=fail smtp.client-ip=52.101.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NB/ssysR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnT5sC47UTWVEIbUiUgu9HQ8C4WTlBlSakglJxnQonwzL5PsoqAjZcw1FLT4OP66prpbSD0lpNKR1ARFjthbbn7c02xqfNWqTg0ZwkoQq/KO6NPDvrI19ffK8mv6YWpn/1/LZiWOoOBrymJy7uKEJwdHOJkglJQw55U2VzZUQFWCPwWrSxB4/jY1HovK3cm7lD6iHcizyElXyATxl1z5+RnXi9Jnl8TElQ8/+dS6JEXRIz9TgDRARBfxucn4dVMbBjXFod0F55VvOgecCFH0/sJ8xif8R1nDsGHv2dxLEeCzb+mNoeQT/+vqrgbrxkj0HfrFFZ7R73t4hdThpYKTwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jnRNhkcu4fbvoRmy9Ua0qp1pIJNhVprUfy4MVc4CKw=;
 b=cRIAlW4wN27ABKF4PR2Sz56+ZC+8tsfdlqelBd6j4rJ/PjSrCZeRqaw1SeuzmI+sltwPu/8jxhUa9F6DeywP9vy+aqNT965sMHkrHYkfY/ueKbIATS6ruOwM6Pfqi5chgwI04YX8OyizpJem9m9EJtKhYfDbI0XYUhUL74fZy/18JgYvEU5q3WTELi3m2Xs9flpWAl4UFz8/Nv0uwCcSiic5AI2j6jB3US8uB+iP5p9Y557MogFm0023KHnOqq4WzsPDDZ9hF5Q8WcDt6erYuDuFrREoUNLGxytMcwb7Hk7xYPElrczL6HkeL94NUe7FlclGFEUTMoZiP52mQKrp1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jnRNhkcu4fbvoRmy9Ua0qp1pIJNhVprUfy4MVc4CKw=;
 b=NB/ssysR9ofWAQJ4nR+RFf57R9UyEV1pOoLyt/3UBGrQ3WYZKMXO7ClA6P0JP/nfQKETBQmNof3lYRQ1pt/gIwSrpsNKO0xh2uktXjNwHIaDdT+AbCUbfdGTUe3kt7MPxWjAUB++M15RjNQ7bivc2Lmlt1P7IYRGcLqm1Z/mySw=
Received: from MW4PR03CA0113.namprd03.prod.outlook.com (2603:10b6:303:b7::28)
 by DM4PR12MB5987.namprd12.prod.outlook.com (2603:10b6:8:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 16:16:30 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:303:b7:cafe::2f) by MW4PR03CA0113.outlook.office365.com
 (2603:10b6:303:b7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Mon, 31
 Aug 2026 16:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 16:16:29 +0000
Received: from jprecision.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:16:28 -0500
From: <juan.martinez@amd.com>
To: <mika.westerberg@linux.intel.com>
CC: <mario.limonciello@amd.com>, <juan.martinez@amd.com>,
	<westeri@kernel.org>, <andreas.noever@gmail.com>, <YehezkelShB@gmail.com>,
	<Basavaraj.Natikar@amd.com>, <Sanath.S@amd.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5] thunderbolt: Fix tb->lock deadlock during hot-unplug on AMD USB4 routers
Date: Mon, 31 Aug 2026 11:16:10 -0500
Message-ID: <20260831161610.1322731-1-juan.martinez@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831130638.GK124825@black.igk.intel.com>
References: <20260831130638.GK124825@black.igk.intel.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|DM4PR12MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2ed6d7-3972-43ec-fc50-08df077b36f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yFLvRjOhbiOkAafRSng5wCCYNAq9SQh/cZfbutDuLzr+wvxeAEuW5Sgm68ROTLEY1NUvxDekOv71rvsEjAvqljxk9wSwZ28q6y48rLvizpyzR/r8k5m+EjIsUifZ50k7EVZM6lgwjcsEiviBmtUjPXnS01jv+kaG5KHPBXRJhFBYM+cjss8UGWav4PI0xjJyJFNJcAPTkbYe0HuHify2v/6cEid94ci8s2JuBxOjrEvm3gKvlCuzDbHw3nfsp1kzcL4IKCATEwXolCS/gf08qTDBhOQ/n2DUoAhit8ssMBW4HeJED7i3JNdsaafVx+sjxdY8IOTFozOGi3JWNG576/SOZJttCJ3gMylsB85SUs4aB9rPXDrggtPoW7llGCwjppbQFX3LrHUTrZCkfzHR9sUeqikz4eFe9bZDsDKkQf6GU11BfckqCbzs/+pLxok/Q1/xek4BDlQiz6MYFinefBWcTw/ply09QRvdSrDBV8R5WzV6KwEv6VKiYKWYjIXOzCfNIv9EgRPC8pFjxVZXfLplmDOpkS2mEBJ3udf8GiqBwa11UhU5NMJZOAGM7Kb5DEBjO7AUsLoYfHChNItNQcRBkZ1AKsicz/lbHH4pQaCJmqq96+0j75yg2CbBUOV1eVDS35wAYonnKuok5ldrUPS/9o0PAxiDE3U53Dg/ATfmQyz+32xOrJIkGyszUZk9q0O33gaGuf9ZD0o3kM6Cdg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RClAeka4xZK95biko9HyFplA5DrjhwVn6WwSMTfG+DcHTZYt8UU0YkmjZT6wyu/Haek7zNAsZwU9yL6ljKqHpaz1kAa6xdfi9NTAGJzQlM8cMw+MJfRZdfMlgUDjTwHTcdqAJgdL93fDlWoOoJlMY2PmZcVcVVoQmVuMDI6qMDu+YaKCDYHQSeUQTwa4Wls3dhT+bqmH3HR6V3oLcDXk6+Nbe1TpFg0+E9nqo+ZLDp35yvKreBYD9TfTaa8+9vXqKAyatxluxFwI6AOK5specVwiz/aT6ZuKDnFr9b2Ty4P55Vd+e9ClSi09PVFrTvxKTaByTl/oqTzUFoRiO9KsjTdpdlnZwGr9fCpUsSC6pfioNLfiuPb08j9ox7nZU0tNtUvaKMDDTG+Zp9I1qRqFYPBCYauXpDIvKgREwp5I74pDzs4VGmyXqT/EjfH3BZ63
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 16:16:29.2760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2ed6d7-3972-43ec-fc50-08df077b36f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5987

From: Juan Martinez <juan.martinez@amd.com>

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
skips the DMA teardown because the hotplug handler tears down the DMA
tunnels itself. However, the reset was still being called
unconditionally.

Fix this by splitting tb_domain_reset_interface() into a locked inner
function and a locking wrapper. Skip the reset from
tb_domain_disconnect_xdomain_paths() when xd->is_unplugged is true, and
instead reset the interface after the hotplug handler tears down the DMA
tunnel while already holding tb->lock.

Handle both unplug topologies: reset after the direct XDomain teardown,
and after invalid DMA tunnels are removed when an upstream router and its
downstream XDomain are unplugged together.

This preserves the reset behavior for normal shutdown paths while
avoiding the deadlock during physical cable unplug.

Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers")
Signed-off-by: Juan Martinez <juan.martinez@amd.com>
---

Notes (v5):
    Changes in v5:
    - Rebase on the current thunderbolt/next branch.
    - Reset the host interface after invalid DMA tunnels are removed, covering
      XDomains below an unplugged router.

 drivers/thunderbolt/domain.c | 20 +++++++++++++++++---
 drivers/thunderbolt/tb.c     | 10 +++++++++-
 drivers/thunderbolt/tb.h     |  1 +
 3 files changed, 27 insertions(+), 4 deletions(-)

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
index 47753a5c0f2e..9300cdae10b1 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1776,12 +1776,19 @@ static void tb_free_invalid_tunnels(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel;
+	bool reset = false;
 	struct tb_tunnel *n;
 
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
-		if (tb_tunnel_is_invalid(tunnel))
+		if (tb_tunnel_is_invalid(tunnel)) {
+			if (tb_tunnel_is_dma(tunnel))
+				reset = true;
 			tb_deactivate_and_free_tunnel(tunnel);
+		}
 	}
+
+	if (reset)
+		__tb_domain_reset_interface_locked(tb);
 }
 
 /*
@@ -2489,6 +2496,7 @@ static void tb_handle_hotplug(struct work_struct *work)
 			tb_xdomain_remove(xd);
 			port->xdomain = NULL;
 			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
+			__tb_domain_reset_interface_locked(tb);
 			tb_xdomain_put(xd);
 			tb_port_unconfigure_xdomain(port);
 		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index c112954ce3fd..5bb448a71407 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -792,6 +792,7 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb);
 int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				    int transmit_path, int transmit_ring,
 				    int receive_path, int receive_ring);
+void __tb_domain_reset_interface_locked(struct tb *tb);
 int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				       int transmit_path, int transmit_ring,
 				       int receive_path, int receive_ring);

base-commit: 48e989e33b715611438ce4b8d6ff712d4becd84f
-- 
2.43.0

