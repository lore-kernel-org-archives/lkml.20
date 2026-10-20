Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503805;
	b=ykH9xuILhaZjYRuesBQ84EDOAlUmwETOeyQbo132uIo6a6AMxIK16oGn+FdRtH6HRN0G
	 TVYJPyP9XfxdWJISh+U6zOFECMGnWp7FgqpsAPaMv3OYgfM/q2xMSAB4VQ/7eRAUxdTb0
	 pqmAIMdvcG1QdsV9szMiDG5HnjrQelQx0u7SAjFkpUNW9JZcHxZ6D7W+GtEID7hy74LKX
	 OionNOvGGdlNvlnHRPoO/9wGFv7o4uG+hwqmfJIXoHRjl22OycSWYwFO6Fek1eLPiNM8/
	 Hjc/w9v5/Bq+RyQIMYGxPAGnTnqdhezdqORu5mkjWyEnBScs4MbZSv2Rr+Gww951tjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503805;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=b3bg20BKCUN+eOKPkvY/R/oeaBydWlXGSI00RF35VZ8=;
	b=GQfAsOLJeiCXY42P3ZkQ15WeX7/9CroIbdbyVaJI0W68YoYwsO8CQRh/qUYgu/3ypSRP
	 U19wy59LKgVglZVDXSy/ZLSNGF2iEXycEd6O/9/8OoJ0a2fIxahE4VZ4mz/AY9DGBGi/G
	 LqArbWfUC8LTNA8p+PF0f8s48qzHXFNaSXovJZo630YcauluajGukGzGNtLVRVZGzEyjJ
	 Rlj0XN1jGezQU28nhGqBO8GFnR7Tb1+6KqI59PvvPMwFRPzVhp6CTOKbvnSN3gkfPudS/
	 t4Q6h2FuDvVGkOti73yfh7Xi2krUL3LIJpgjRMZW0BWlxzqvvYJzDdTu3NkE/uRsljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=AkSXQ062;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDDF60A2622
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CDDF60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=AkSXQ062
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=b3bg20BKCUN+eOKPkvY/R/oeaBydWlXGSI00RF35VZ8=;
	b=AkSXQ062uGj3Q0zfOJZI+c/+3ofj66yScxazvHRNcR66upHdMCxxoGB4CewM4Jlz/ZlmrgEGt
	y3RdwzYM1f3YacQ3T4veBCDA4+12I9/APj6++8UbirA2FTZlPNWzTb5i+c8YjNUkiYJXp86EJJR
	aXBK2t0BLXT8mXG8TJyGex8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBk1WCTzmV7s;
	Tue, 20 Oct 2026 21:43:10 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C2324048B;
	Tue, 20 Oct 2026 21:43:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 06/15] fs/resctrl: Unmount resctrl with the CDP state it was mounted with
Date: Tue, 20 Oct 2026 21:42:30 +0800
Message-ID: <20261020134239.3921377-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020134239.3921377-1-ruanjinjie@huawei.com>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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
 fs/resctrl/rdtgroup.c | 46 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5dcbb0a964e8..40821cf07649 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3145,6 +3145,41 @@ static void resctrl_fs_teardown(void)
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
+		/*
+		 * The limbo handler acquires rdtgroup_mutex. Release it
+		 * here to allow the handler to complete, then reacquire
+		 * to maintain lock ordering for __check_limbo().
+		 * This matches the pattern used in resctrl_offline_cpu().
+		 */
+		mutex_unlock(&rdtgroup_mutex);
+		cancel_delayed_work_sync(&d->cqm_limbo);
+		mutex_lock(&rdtgroup_mutex);
+		__check_limbo(d, true);
+	}
+}
+
 static void resctrl_unmount(void)
 {
 	struct rdt_resource *r;
@@ -3152,13 +3187,20 @@ static void resctrl_unmount(void)
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

