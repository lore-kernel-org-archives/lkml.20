Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554974519AD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793488; cv=none; b=b9RAPbMWkh3Lw/xfo8Ny+QfN6rf4OEZyxhBwtU1LsjgFYyucfWLwI9Qz7GTa0FBTH56DEce41ICJNk7U4yu25ArYituSJ03aRNnkBLzYm9Nm4pwJVwt20IODN1QrWGyqCbUXEf948t4yyRDAFxaVBYYo0doAjCj56Y0Dz++foSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793488; c=relaxed/simple;
	bh=szDktYLccHcjJ1GSY9K8zjqfB1wUYkOd009xB+PZJag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+f6uTOLLWuud+6jHBMMrPV7Sk2ypl8AHDwz9A23X3f9qj7GwoVCt7DPLMOidLNZwsJD6izoOe/u+ciZNzXiS9UJhYf5r9FW+NYudSSuQMK9sUV/bfZzrbOqEfHLyEkgg6ACoqxNc+awJeRIKsemFSfttC5123BniYJdvlHCjnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=TGqABYD7; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="TGqABYD7"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ULWcQs+Yl0W9F9/2as81AgVBVEBUKFBG8Tgo4e7vytk=;
	b=TGqABYD7PqB2vYkDZZUNKEBSpgKenfQ9r6C0gRlVZuh9qVP+AmgiaxLRvRmT4Kl4/KogH2KkK
	Rgv9zlBIjqcTwuVtK8/UJy/nA8na4uIy9IedtOoPgf+o+Gb3hUUcNqeBVDPeLacC9LL49JVWLR2
	J65kj4tKb9uRHapYLHK8J2c=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j39Dg4Sc1z1K96s;
	Mon, 12 Oct 2026 16:12:19 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D85364056C;
	Mon, 12 Oct 2026 16:24:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 16:24:36 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 1/9] fs/resctrl: Unmount resctrl with the CDP state it was mounted with
Date: Mon, 12 Oct 2026 16:23:29 +0800
Message-ID: <20261012082337.822258-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012082337.822258-1-ruanjinjie@huawei.com>
References: <20261012082337.822258-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

From: Zeng Heng <zengheng4@huawei.com>

resctrl disables CDP before the control and monitor groups are torn down
on unmount. The architecture translates between CLOSID and PARTID using
the CDP state, so the RMIDs freed by rmdir_all_sub() and
resctrl_fs_teardown() are parsed with the wrong mapping. On arm64 the
RMID limbo handler can still be running, and a CLOSID left in the limbo
list is re-interpreted with the CDP state of the next mount. Enabling
CDP doubles the CLOSID on arm64, which can push the stale value out of
range and take an MPAM error interrupt.

Disable CDP after the groups have been torn down, so every CLOSID freed
on unmount is parsed with the CDP state it was allocated under. Return
the RMIDs still in limbo to the free list and stop the worker, so
nothing carries over to the next mount.

Cc: Tony Luck <tony.luck@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Babu Moger <babu.moger@amd.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/rdtgroup.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5dcbb0a964e8..6778a7ef2e95 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3145,6 +3145,33 @@ static void resctrl_fs_teardown(void)
 	rdtgroup_destroy_root();
 }
 
+/*
+ * The RMID limbo handler keeps running after unmount. Any CLOSID still in
+ * limbo would be re-interpreted with the CDP state of the next mount. MPAM
+ * doubles CLOSID when CDP is enabled, which can push the stale value out of
+ * range. Force the limbo list back to the free list before the CLOSID state
+ * is torn down.
+ */
+static void rdt_flush_limbo(void)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_l3_mon_domain *d;
+
+	if (!IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
+		return;
+
+	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
+		return;
+
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		if (!has_busy_rmid(d))
+			continue;
+
+		cancel_delayed_work(&d->cqm_limbo);
+		__check_limbo(d, true);
+	}
+}
+
 static void resctrl_unmount(void)
 {
 	struct rdt_resource *r;
@@ -3152,13 +3179,20 @@ static void resctrl_unmount(void)
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
-	rdt_disable_ctx();
-
 	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
 		resctrl_arch_reset_all_ctrls(r);
 
 	resctrl_fs_teardown();
+	rdt_flush_limbo();
+
+	/*
+	 * Clear the CDP state last. free_rmid() translates between CLOSID and
+	 * PARTID using the CDP state; clearing it first would make the
+	 * translation inconsistent for the RMIDs being torn down.
+	 */
+	rdt_disable_ctx();
+
 	if (resctrl_arch_alloc_capable())
 		resctrl_arch_disable_alloc();
 	if (resctrl_arch_mon_capable())
-- 
2.34.1

