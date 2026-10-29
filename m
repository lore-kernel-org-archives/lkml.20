Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277408;
	b=BL3u6bZuwag0sOU8avn/0ODNKreAt0NQlmRl9KhPWLGCuxyqyM35zqGUpjfrldy6QdRL
	 Emp9JI+yHxeeNmY6dqbZ1Q7BndqD8FGyswj8qQEcu59bJlNaL1u4d4EB5VmaCGh8Vry+m
	 9JdNQ1qnouPt8mxK0V3667wrZtfbevoeKhvz7AOTiFp3jBq0mb9cmU9/wjVSCsau5eW0w
	 qxCh089kq3hDzk1b2+5GyMo4eO0I2upWTdHa83u72RboJHEbVGhs4aorPKiKk9HsL5nnm
	 YkLqhIrtYnTBgTFGWKPI6bhzXiD78/AH21Myp4mYAL0HUjPGqPDUGbtYzffdw4uNj3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277408;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=rd99wj8tmmWdc/xvgPsK/cvb9mmLPaO6Jc9hvYnKyVY=;
	b=W7gy6JlIXteODDVhgdMBxtaV43cH39iTId255NDzePylO3dDPQO5io4txOcg8aLu/U9d
	 SGS33Rby3Cd2Ab6c0ZpumV8/zKj8j7k/K9CbmlX6Jz1OXTc1VebjwPFb3p0iKZ3kuoK75
	 xPLiBaPgUAPsxQKTukNbIsM2Khiq187hdlLisgm9PC43//qBkQKLHygYe7tS0TrbrIvty
	 gK4dz6J1P0QKvwlzAlPrQ3+SvJLF2fn0JHy9dd8Ljs5McSanLxjR8UdOhlZDMIhHX1my4
	 WuSF0xHp9DuLSojnvEG8uLDJ86LwNYrG73Ae5iC+si1YGadF4oFwCtlIbEZ6EAwEgwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=gn08SL5m;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9107A606A321;
	Thu, 29 Oct 2026 12:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9107A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=gn08SL5m
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rd99wj8tmmWdc/xvgPsK/cvb9mmLPaO6Jc9hvYnKyVY=;
	b=gn08SL5miTDMU1IObTHHDjQoXKKM0BS8e1Kz873hQXSTZWfoJDSVicpzkX10YZn4m5jhxXf3g
	ACgzi6RnMZuHMpgJ2SpIzSvClsaKsBjuzDnRNe6i8UMYnOfnUuySMOBXQ3Utwk9mrC5TwroNcqY
	3rCcLXPv2KNQTqPBgXD8KkU=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHn0z2GzLlT6;
	Thu, 29 Oct 2026 20:36:37 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4C9FF40586;
	Thu, 29 Oct 2026 20:36:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:43 +0800
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
Subject: [RFC PATCH v2 08/19] arm_mpam: resctrl: Halve the monitor counts of every resource on CDP
Date: Thu, 29 Oct 2026 20:36:00 +0800
Message-ID: <20261029123611.1108424-9-ruanjinjie@huawei.com>
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

CDP uses two PARTIDs per closid, which halves the number of monitoring
groups. resctrl_arch_set_cdp_enabled() only updates num_rmid and the
assignable counter count of the L3.

Update both counts for every resource that can monitor. Only the L3 has
monitors so far, so the counts do not change yet.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index abd4fbca48ab..2f1be12ec461 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -203,8 +203,7 @@ static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *r)
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 {
 	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	struct rdt_resource *r;
 	int cpu;
 
 	if (!IS_ENABLED(CONFIG_EXPERT) && enable) {
@@ -238,11 +237,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	cdp_enabled = enable;
 	mpam_resctrl_controls[rid].cdp_enabled = enable;
 
-	if (enable)
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
-	else
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
-
 	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
 	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = false;
@@ -263,7 +257,14 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
 
 	resctrl_reset_task_closids();
-	mpam_resctrl_monitor_sync_abmc_vals(l3);
+
+	/* Each PARTID is split in two, which halves every monitor resource */
+	for_each_mon_capable_rdt_resource(r) {
+		r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+		if (cdp_enabled)
+			r->mon.num_rmid /= 2;
+		mpam_resctrl_monitor_sync_abmc_vals(r);
+	}
 
 	for_each_possible_cpu(cpu)
 		mpam_set_cpu_defaults(cpu, partid_d, partid_i, 0, 0);
-- 
2.34.1

