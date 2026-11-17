Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879798;
	b=MdQDnKEHjjeoFpdx8p0G1jIEmEWqK2cGANIWn6+Z/eOJdQxjEXtgAfcQbrr28h5lupMk
	 yjNPh71hWq42ZZtRLo/fqnATrTaNiGl8nVTfMXajVh7V9YOaxha9lcUiCvl5lEHwzHz5a
	 ZZM3tPjh0Y/WGlge148NoPSBSet5hlW1ea6NJdKv8o5Gb2wc1EDumaTD9CM2odRE71UBz
	 CXSPpFTgALPTZ1TO0Es7gD4o/Q194TDEaeycHm8XD9VEpAvmX5tEMEoSpqTVGc5ZUmiTU
	 aOU8zQ728I3jZaVDv4TVIVFasFmli9t2BzcKy0/HlN3HUut7+Pmz4LGjsYvP+c0MWSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879798;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=wICdQTS/j653JNeSpq5WDtpcanKknMisPljCXOeLMss=;
	b=LtFKseQs3NmVKFFZv2e3v9FOspDKlFER8bFEJnaKU6QeA77LhB0c8U6ZsrjoCcY73XsQ
	 3aVkTm2X6fD1mMQ8/vVVNCDAajTAYNRu38qV8wGnOg4C/9y5Lx92nAHqJww6IKOnftG97
	 tFaHja/lQ7b5ClhUk50W5SHXzybr3Fs8ZrPSy4xkyd2sIXFS+R7L5x6NibXKbrvZWHSz6
	 /19YkZe+oHeubOKmIZBkk+dc7TSu5sgWKdK/Fp+mGTMFUkbK+O+8Jct9UZiUEeOsS6gE5
	 b2V7rDINtkYsi4nkLT3Y5NUBVLk8K1BBnvZ/Dy1Br+PI378PtoBJJV8/8GG3J8CKKcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=frpS6OPX;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7447A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7447A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=frpS6OPX
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wICdQTS/j653JNeSpq5WDtpcanKknMisPljCXOeLMss=;
	b=frpS6OPXRpqmmhNNflCDPRrZ+OrimVw2l/RYtkrUAZlNSbLWnQs/7BEcx1Yxb2dLhNlHhAfbq
	yi10NqiOnLyxchiHsPNhASIINfoC+5fFp6PRPkmtbslZu4Y8KjaAZksvQ15iu5yYmSFhTyqEGa4
	VubTdFdWssd9ixX7E8x1Bls=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jT6tk52mpzLlXR;
	Tue, 17 Nov 2026 09:42:54 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 71FD04048B;
	Tue, 17 Nov 2026 09:43:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 09:43:12 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH RESEND] arm_mpam: resctrl: Annotate domain list walks as RCU under cpus lock
Date: Tue, 17 Nov 2026 09:42:46 +0800
Message-ID: <20261117014246.530431-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v1 -> RESEND:
- Drop fix tag and not cc stable (Ben).
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

