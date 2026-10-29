Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277412;
	b=gU2vt4DXvxc3Ckq3oAs6XaDv2LbHXBj2O1TeFZRW/wY1ucx9gsf5eq0ciEAGZeZcpmEc
	 uHGjgpqUlgU6CeXokkHXHazuydcBvXWgzHrRWVUt/OaX8f4OWZc85d/VFkNISuGdXxVwM
	 E1AzVLWG7etbFyHKjAenVv3z/s6UZHN0xJhaZK98jbR3gc4ZDImV7uaGsv1FcFkwV6os2
	 XLSkPxhmmXM+q1udkQtwQuFl0IND+GEP/h+0psMnesJGtmiiZNAm9Ds5gXp0JEuitj21m
	 ybEFwKiaKmqSXDU58pHrd9+HEV0IrWT+Wn93gOGbnSceDj0dhyytAeaCviSHFR0YDQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277412;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=3y18Q2V1U5+ZPmVEJaM4l5RHLOCkGUNZeAr2g2T0CKE=;
	b=N814D7P8xVRosh9U1ebFHZBmoINILTJcu9LBmvm2wC740PxB7KBLk8crzD2C0XrKyRSf
	 0StvnrFQOG7yp2PJp3Qxf3QSgHogjX4GbWmh7lOziW1VDcVhFqdqQ1l8u/2iybx73O9Ug
	 WAZ0QAg3/FGOTSYP8LxRpg4+oFJQU6phN3VW5MuKvALJa31/RkYDhxGesttNFgYHLa1JD
	 Pgl9nTocIbQvlu6aRNC13dQUtlSuDsfr5Kz3STiqRUwXIAAR3lWFjo7yxjzn10yJZHxlT
	 ukxdHmskTaiIyy7byM1VoU0D/MBu4iP0PmXwhDc0VFdnDU1+im0mhBMLAxQuUojQ/qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=XUxUJbCF;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FB4606A320;
	Thu, 29 Oct 2026 12:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40FB4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=XUxUJbCF
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3y18Q2V1U5+ZPmVEJaM4l5RHLOCkGUNZeAr2g2T0CKE=;
	b=XUxUJbCFBYcpXwC1W7Lo5nTW3OswkfI1Iq5aRv5k+e2NQjxTiucb1meVTAtNNg60NUyJ/3gA3
	lhV6DIC/rfsVZSnQoOix2JAHKWYtkrB5b/qOiduhi2FNMiEKDIjUT/A0+c6pt5wGthnzn14WB0x
	Heuo8UC8L5jN9Y6VP7p++Sw=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHs0TW3zLlWr;
	Thu, 29 Oct 2026 20:36:41 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3913D40572;
	Thu, 29 Oct 2026 20:36:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:47 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 13/19] fs/resctrl: Check RMID limbo on every resource with occupancy
Date: Thu, 29 Oct 2026 20:36:05 +0800
Message-ID: <20261029123611.1108424-14-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
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

An RMID is only reused once the L3 occupancy counter shows the cache has
gone cold. When occupancy is monitored on more than one resource, the
RMID has to wait for all of them.

Mark the RMID busy in the domains of every resource that has the
occupancy event, and have the limbo worker read the occupancy of the
resource its domain belongs to. The threshold is one byte value for all
of them; MPAM already sets the limit from the smallest monitored cache.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 4d90f784a4cf..739134e2ff77 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -126,13 +126,13 @@ static void limbo_release_entry(struct rmid_entry *entry)
 
 /*
  * Check the RMIDs that are marked as busy for this domain. If the
- * reported LLC occupancy is below the threshold clear the busy bit and
+ * reported occupancy is below the threshold clear the busy bit and
  * decrement the count. If the busy count gets to zero on an RMID, we
  * free the RMID
  */
 void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_resource *r = resctrl_arch_get_resource(d->hdr.rid);
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
 	struct rmid_entry *entry;
 	bool rmid_dirty = true;
@@ -297,8 +297,8 @@ int alloc_rmid(u32 closid)
 
 static void add_rmid_to_limbo(struct rmid_entry *entry)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_l3_mon_domain *d;
+	struct rdt_resource *r;
 	u32 idx;
 
 	lockdep_assert_held(&rdtgroup_mutex);
@@ -309,16 +309,23 @@ static void add_rmid_to_limbo(struct rmid_entry *entry)
 	idx = resctrl_arch_rmid_idx_encode(entry->closid, entry->rmid);
 
 	entry->busy = 0;
-	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list, lockdep_is_cpus_held()) {
-		/*
-		 * For the first limbo RMID in the domain,
-		 * setup up the limbo worker.
-		 */
-		if (!has_busy_rmid(d))
-			cqm_setup_limbo_handler(d, CQM_LIMBOCHECK_INTERVAL,
-						RESCTRL_PICK_ANY_CPU);
-		set_bit(idx, d->rmid_busy_llc);
-		entry->busy++;
+	for_each_mon_capable_rdt_resource(r) {
+		/* Only resources with the occupancy event have a busy bitmap */
+		if (!resctrl_is_mon_event_enabled(r, QOS_OCCUP_EVENT_ID))
+			continue;
+
+		list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
+					lockdep_is_cpus_held()) {
+			/*
+			 * For the first limbo RMID in the domain,
+			 * setup up the limbo worker.
+			 */
+			if (!has_busy_rmid(d))
+				cqm_setup_limbo_handler(d, CQM_LIMBOCHECK_INTERVAL,
+							RESCTRL_PICK_ANY_CPU);
+			set_bit(idx, d->rmid_busy_llc);
+			entry->busy++;
+		}
 	}
 
 	rmid_limbo_count++;
-- 
2.34.1

