Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797334;
	b=hcnGeDO91/Op+WoyQ6Ztj6LQBxro538Z5o82GgVi473aWuB23ceV8uAqSBIwojhlZ17/
	 gcJISyIRRxQJgptXyLbbq2wwDNC5+drs2eDaPeVObqvhrB3XyLMz+FOFISLI0QmymXsK0
	 SJ7sHH40/1NjHTGhjPY5FU7C8GMHrZqb9EZvtnGGgVdpbIZ8CbZLzvDtElRR6mDuMLX+6
	 oWdjTVd6pUUtaEvGZy6CIrvgC3sO2IUjK+EhzHTbP7Xs38hfS8FXO3f/ELNdasUjTRbD8
	 LCx0n89POTaRjs1BgdA+EzgqhPRJ0aKdELjoj5pw6oFjbAVH/shC9p6M7ojm2PVkpNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797334;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VnScLMcYbIevCbUp04UB8Pkf1UTVjmVy//XxyaUsFK8=;
	b=U0yzmvAutrDuMlQwZKi0TrG4GbBE5DJR6LduAeYm1+Oi2rFQW2NCYKWWtN6p3xkgJjez
	 k8F/UI+0XUDnNXq1g2i4dvdfTzZvGW0Mjj8GSi4Zuc7vOktnU0WYddeZywLiibrRNFA5c
	 Z4cc9ZJlC95e8fC0o+/f2Why19MqVJaNihlDUViMJX3zm4YiUviqF8zYcT4mqStgYlLX0
	 7rYKHJ5Uac3a8MhMuPKhm2aGWrr8aFmOrcVSb4xuZdyCLLZ5bqgSzJAFNSaIaWbo/9S0G
	 +vv9rVShIHAtTJsVykMB03osoPK8RiFR7GIwLmaaXiSKnFybRsQMSQvyeDZw3/q+PqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="Ln/1P3Nm";
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A332606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A332606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Ln/1P3Nm
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VnScLMcYbIevCbUp04UB8Pkf1UTVjmVy//XxyaUsFK8=;
	b=Ln/1P3NmSrz2gtWrXFdeBbQFrAEcAgHu0epsuwX82dmlPaKQ13f6Ydt4TO9XXp4WRrjZ7kinb
	bhtTLZTpt1lseyd22JNy6OvzOClJVPnctKsb8eWuoENOtq+k5m8fkq5RjcCkF8+uifVKD8J7L5b
	x6epMFcQf89UXDLnWXgP2qU=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jSXNR2XCNz1T4hn;
	Mon, 16 Nov 2026 10:48:07 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CC9BB4057F;
	Mon, 16 Nov 2026 10:48:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 10:48:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <jic23@kernel.org>, <tan.shaopeng@jp.fujitsu.com>,
	<zengheng4@huawei.com>, <gshan@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] arm_mpam: resctrl: Annotate domain list walks as RCU under cpus lock
Date: Mon, 16 Nov 2026 10:48:34 +0800
Message-ID: <20261116024834.275512-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

The resctrl domain lists are RCU lists which are only modified while the
CPU hotplug write lock is held, so traversing them is protected by
cpus_read_lock().  That is the convention the generic resctrl code
follows.

The MPAM implementation omits the condition at three places, so lockdep
reports a spurious violation with CONFIG_PROVE_RCU_LIST on whenever
they run:

  WARNING: suspicious RCU usage
  drivers/resctrl/mpam_resctrl.c:1762 RCU-list traversed in non-reader section!!
   mpam_resctrl_get_domain_from_cpu+0x200/0x298
   mpam_resctrl_online_cpu+0xa4/0x160
   mpam_cpu_online+0x2b4/0x300
   cpuhp_invoke_callback+0x304/0x700

Likewise for mpam_resctrl_get_mon_domain_from_cpu() and
resctrl_arch_update_domains().

The lock really is held: lockdep_assert_cpus_held() is the first thing
each of these functions does, and the warning's own lock list shows
cpu_hotplug_lock and cpuhp_state-up taken.  Only the annotation is
missing, so add lockdep_is_cpus_held() to all three walks.

Fixes: 9cd2b522be2c ("arm_mpam: resctrl: Implement helpers to update configuration")
Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Fixes: 09e61daf8e96 ("arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation")
Cc: stable@vger.kernel.org
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..d25c2bac9678 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1516,7 +1516,7 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
 	if (!mpam_is_enabled())
 		return -EINVAL;
 
-	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list) {
+	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
 		for (enum resctrl_conf_type t = 0; t < CDP_NUM_TYPES; t++) {
 			struct resctrl_staged_config *cfg = &d->staged_config[t];
 
@@ -1743,7 +1743,8 @@ static struct mpam_resctrl_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
 	if (cache_id < 0)
 		return NULL;
 
-	list_for_each_entry_rcu(dom, &l3->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list) {
+	list_for_each_entry_rcu(dom, &l3->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list,
+				lockdep_is_cpus_held()) {
 		if (dom->resctrl_mon_dom.hdr.id == cache_id)
 			return dom;
 	}
@@ -1759,7 +1760,8 @@ mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
 
 	lockdep_assert_cpus_held();
 
-	list_for_each_entry_rcu(dom, &r->ctrl_domains, resctrl_ctrl_dom.hdr.list) {
+	list_for_each_entry_rcu(dom, &r->ctrl_domains, resctrl_ctrl_dom.hdr.list,
+				lockdep_is_cpus_held()) {
 		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
 			return dom;
 	}
-- 
2.34.1

