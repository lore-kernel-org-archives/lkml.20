Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833987;
	b=AenaiEM7Bx+ulddRQr6N9rYxcdgymUj0Do64sWrDHx9Yz2pkH4rUPmfKUX5agoDQf+s9
	 RTOFgGNscsWnVU8sJ0/EEfjSk2V4B19HMWHrDN7MIPgJstlSfCshHfM+SPROC6Ptrc+F9
	 mM0lZ+Ndq6pIGsECMGmeXgCVgA0287DQZGHoRV7zjqvZltI77V7wlPuCrrZgps4nymKqs
	 eOs5XjLpF6j1IqUAyxYwHXgaK8QsdbPiSoLM3/W4R1Fn3vfcxf5UZmurY8ytDjJMzY/qr
	 Bj6qctf9gmjS0Vy6aD+v//FVrgH2cKXjWy0vDGC3xW/pS471cOTWdYp7NNCpTR9UWOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833987;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=tnZvtSry92l+gCCWV6NrcP40QNk9UTJpmxZ19FLvf1I=;
	b=eIECbNi6uP3PxdDLTHvi6Mldwav3+8+RwiJOHkmXnVBBfiAwlEZM5NEagPAAkASJJdpR
	 LBf6ADeuy7CGfWkUMho8OrEAcpmIGtYFMh29CdvCX9u8qSH8sVq/1oGVYnvLj+O4bD3OJ
	 PRTI8awq19t16UUgWgve3l9+TeTFHZYR7ZGhrx11ZEZNayXegfSM6wKD4tI4vPT5+Gt3z
	 CQam7YBdjyhNrkk+73mOEaWFTz6cwhPv0LO4MbaXH5BNnyR9y05m7XkoLeQNOhuv/GjdH
	 eOj5Z4R8VNNuNdz4TcajByeTiNOFm4YEL+Xdyuw8YFlPW0CASJbRImSpspQRJA3VZ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=jmTNWMA6;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C0160A2635;
	Mon, 16 Nov 2026 12:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C0160A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=jmTNWMA6
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tnZvtSry92l+gCCWV6NrcP40QNk9UTJpmxZ19FLvf1I=;
	b=jmTNWMA6yowFulsIKd7yjQErdnvGcmHqQzKzL6Mnx3YZJQ36joCo5IIIL/aEFN5pgjl4CorOe
	ckekcfJ3LmTNmKni2qJWIfrhxWUa7FOb4rqjs4kfK0AHo5traq3qhKDfAhzogL1VPwj0+bNfJFT
	BPet9Oq0+J+M/ebWpC4yGAQ=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jSnyB4lZGz12LKS;
	Mon, 16 Nov 2026 20:59:46 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C345440679;
	Mon, 16 Nov 2026 20:59:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:38 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <fustini@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 12/19] fs/resctrl: Check RMID limbo on every resource with occupancy
Date: Mon, 16 Nov 2026 20:59:07 +0800
Message-ID: <20261116125914.498841-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116125914.498841-1-ruanjinjie@huawei.com>
References: <20261116125914.498841-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

An RMID is only reused once the L3 occupancy counter shows the cache has
gone cold. When occupancy is monitored on more than one resource, the
RMID has to wait for all of them.

Mark the RMID busy in the domains of every resource that has the
occupancy event, and have the limbo worker read the occupancy of the
resource its domain belongs to, against that resource's reallocation
threshold.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 4132258760fa..b7a21cbafa42 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -115,13 +115,13 @@ static void limbo_release_entry(struct rmid_entry *entry)
 
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
@@ -286,8 +286,8 @@ int alloc_rmid(u32 closid)
 
 static void add_rmid_to_limbo(struct rmid_entry *entry)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_l3_mon_domain *d;
+	struct rdt_resource *r;
 	u32 idx;
 
 	lockdep_assert_held(&rdtgroup_mutex);
@@ -298,16 +298,23 @@ static void add_rmid_to_limbo(struct rmid_entry *entry)
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

