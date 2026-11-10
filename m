Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318014;
	b=fIchTjjVYP2wrt1firX9W/NNSesoQpq001tBeXsvo5rTnUO21D7H4ASM0Pwf79pPRpBL
	 uCu3LDspuDVDlBQexlHU5Z6jCTstzezZhRaUS6CIZoEoCDkFxan0gpijJ14TH5xLRy7lT
	 6IGZMNRo9XA/KxRwPCJrMVV+mbEGJNvOdjB7UP7KhRd6wadmQ6NHVdUrkP8BdRUuxnAcF
	 x8j7KqxDCcqzfY5yLuQnCUckws+wKB7ric/32I++Yqzg6s7EDXwM4kbobfi/JVihifeT8
	 MICXTElaO2dCN+E2kvbgReMwR4nOk48PR9lCrUrVR5BBIxuwoc/8KqqcewGWDWOVZGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318014;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZZpzMXUXuQQiOTlnjceCSiKdtuorBJBFGxmkOw/np50=;
	b=ZX6YZomn+0fjwMuayMtB12GmkeAe0MquVQUX2eofk0dWAAi6JrD2+lBR5CEHvdByV+1S
	 3di6FEzhmc2ky+++dj5suEVC7bVJYyMNFEFW/6AGWBv8oonwCny1h53n/hidx2NndHafd
	 jSAw+4Haq69vIfN5ebyY5uDM4oQEiOwtPwpNdGdbQeHfkNavmu9NtUm1QqTFN0NpcK6hd
	 4L6J/bAFmSSk7/exHazzwpXprUQzDKMDy5YoL41ai3G2gLFtipuzQ7NoXYVJLdTAo7o+P
	 HJoZX7hxz4oTaRVdFgaoJBGwgA0A6HhUA+ouhOymbFDmAAiLy/irzFFVMeXWFY5tRxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=l6rJmYYi;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A9060A2604;
	Tue, 10 Nov 2026 13:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A9060A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=l6rJmYYi
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZZpzMXUXuQQiOTlnjceCSiKdtuorBJBFGxmkOw/np50=;
	b=l6rJmYYi/WPjHwD7u5OWtgo7dGsb7+eYY4RUucVEj6sSurle7eX3fVg2Pf3qiV66s4lAf7uUl
	hVkdx76UQ4LlrbFvra8Br5IGoUYwe5HaGihEDSjFGJUxfcpDRGJ5DBEaMw+jOuGnlq4Y77lyGfz
	gVLtmSrWEo2ZqANw8sNnlhs=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jP77Y2DC0znTZ3;
	Tue, 10 Nov 2026 21:40:09 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C56540563;
	Tue, 10 Nov 2026 21:40:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:40:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <will@kernel.org>, <gshan@redhat.com>,
	<zengheng4@huawei.com>, <jic23@kernel.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 RESEND 4/7] fs/resctrl: Stop the limbo handler while resctrl is unmounted
Date: Tue, 10 Nov 2026 21:39:35 +0800
Message-ID: <20261110133938.3768632-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110133938.3768632-1-ruanjinjie@huawei.com>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

A group's RMID is not returned to the free list when the group is
removed. It stays in limbo until the cache lines tagged with it are
evicted, and the limbo handler reads its occupancy counter in the
meantime. The limbo handler keeps running after resctrl is unmounted,
while the MBM overflow handler stops once resctrl_mounted is cleared.

Reading the RMIDs in limbo while resctrl is unmounted is not safe on
every architecture. On MPAM the counter of an RMID is selected by the
PARTIDs of the CLOSID that owned it, and the CLOSID to PARTID mapping
depends on the CDP state. The unmount clears the CDP state, so the
handler that keeps running reads the RMIDs freed under CDP through the
PARTIDs of the cleared state.

Stop the limbo handler while resctrl is unmounted, as the overflow
handler does, and restart it after a mount on every domain that still
has RMIDs in limbo. The worker can stay queued across the unmount, so
cancel it before queuing it again. This keeps the limbo handler
lifetime the same on every architecture.

On x86 the RMIDs in limbo are no longer drained while resctrl is
unmounted. Nothing needs them until the mount that follows the
unmount, after which the handler frees them as before.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1+
---
 fs/resctrl/internal.h |  1 +
 fs/resctrl/monitor.c  | 43 +++++++++++++++++++++++++++++++++++++++++--
 fs/resctrl/rdtgroup.c |  2 ++
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 1c85e06f09bf..c95fa6ce62e6 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -373,6 +373,7 @@ void closid_free(int closid);
 int setup_rmid_lru_list(void);
 
 void free_rmid_lru_list(void);
+void resctrl_limbo_resume(void);
 
 int alloc_rmid(u32 closid);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index ae9ddd380515..f56d0e32fd06 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -852,6 +852,13 @@ void cqm_handle_limbo(struct work_struct *work)
 	 */
 	mutex_lock(&rdtgroup_mutex);
 
+	/*
+	 * If the filesystem has been unmounted this work no longer needs to
+	 * run. resctrl_limbo_resume() restarts it on the next mount.
+	 */
+	if (!resctrl_mounted)
+		goto out_unlock;
+
 	/*
 	 * Ensure the worker is dedicated to a CPU as intended and not
 	 * relocated by workqueue subsystem as part of CPU going offline.
@@ -1001,8 +1008,8 @@ int setup_rmid_lru_list(void)
 	/*
 	 * Called on every mount, but the number of RMIDs cannot change
 	 * after the first mount, so keep using the same set of rmid_ptrs[]
-	 * until resctrl_exit(). Note that the limbo handler continues to
-	 * access rmid_ptrs[] after resctrl is unmounted.
+	 * until resctrl_exit(). Note that the RMIDs in limbo stay in limbo
+	 * across an unmount and are checked again after the next mount.
 	 */
 	if (rmid_ptrs)
 		return 0;
@@ -1033,6 +1040,38 @@ int setup_rmid_lru_list(void)
 	return 0;
 }
 
+/**
+ * resctrl_limbo_resume() - Restart the limbo handler after a mount.
+ *
+ * The limbo handler stops while resctrl is unmounted. Restart it on every
+ * domain that still has RMIDs in limbo.
+ */
+void resctrl_limbo_resume(void)
+{
+	struct rdt_l3_mon_domain *d;
+	struct rdt_resource *r;
+
+	lockdep_assert_cpus_held();
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
+		return;
+
+	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
+				lockdep_is_cpus_held()) {
+		if (!has_busy_rmid(d))
+			continue;
+
+		/*
+		 * The unmount may have left the worker queued. Cancel it so
+		 * it is queued again on a CPU picked now.
+		 */
+		cancel_delayed_work(&d->cqm_limbo);
+		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
+	}
+}
+
 void free_rmid_lru_list(void)
 {
 	if (!resctrl_arch_mon_capable())
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 3312637fb514..b702fe6dbbec 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3267,6 +3267,8 @@ static int rdt_get_tree(struct fs_context *fc)
 						   RESCTRL_PICK_ANY_CPU);
 	}
 
+	resctrl_limbo_resume();
+
 	/*
 	 * Ensure root remains accessible after mutex is unlocked so that
 	 * kernfs_kill_sb() can run safely if called by kernfs_get_tree()'s
-- 
2.34.1

