Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833985;
	b=PEymKnsrOAIwnb4yySmEw2uKGLKxkNF3LQGaPJqWbFOlziEL8MK6l6e2qWPEjs/Pdt61
	 c+k/n5f1hoh/mjUa58Z+ta9j7j+cJu5qtsDRSS0ra8ucoSgaXTWpSSX1xEAo53ciRQrPN
	 T8nNgIITa2d1jkVTrtarbvY2FuagylKhOOIMLRPXvj0o6hnCHvy5eN7tUZkrdZHP8o0ev
	 1yKELo9Nnah5w7TySatboPBN5+oumjoI2Asr1VATFLb6fO4SojbpKATvfaGrWBsIH1/jY
	 krdWVg/RJafNqFPjVHKTqq3skkdYCt95oCX8haRS8XKX+sCxkDrku9ByOLVV6MIiiyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833985;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=IcaDL1WOc1B7bCb9CO2auyoBDya4ciCiOjpuno5T3yo=;
	b=jPKoUczLVlOKEAefe+fuNggg+tmojyrBxCp1haYjGsVJ+KFqgi3ToT3/leKl3OYWHxDg
	 MDj0byVU+J6xLZdKinEIqOcAoRTfzZih5xzE2i/Ph9T7Zbc3lImXehgd8IXZAafFNR0mL
	 QQP6cn/96qm+ttMoUya/3wfq7z8y2cDlzyGdSkgOBBgPRIRv15oEL7JJwd7yxC2aCgrsI
	 G5/kLt/hontqrqCH9SRIhegpt5IrU5zFHk+lkmEo04oYGwFMthMz8AWco/YE9jNH6r0GF
	 pViDnsmhsVfvlhvAXkFSybOv3IAAnHQCi0QL3TYfi7JLPB7Amk9nxyU1x5bMKl8qMBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ruLTFHJb;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636E606A8A7;
	Mon, 16 Nov 2026 12:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A636E606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ruLTFHJb
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IcaDL1WOc1B7bCb9CO2auyoBDya4ciCiOjpuno5T3yo=;
	b=ruLTFHJbgv77TcWVAmeiYTo+tN5CmXlElaqX1EQQn7heVcGd/2wAjuQ3Mfad2vPkF7/eSlQs5
	ARoA9JYVky3trCMa8FkeLvEoRC+1RZVNdnzt68xYuW5Gc6D0O6/5wALy29JnBBLvpfLmPhZeWNo
	A3W6B9jkyDuii7DaIZUY2oo=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jSnx91tN5zpStt;
	Mon, 16 Nov 2026 20:58:53 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D7D3540561;
	Mon, 16 Nov 2026 20:59:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:39 +0800
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
Subject: [RFC PATCH v3 14/19] arm_mpam: resctrl: Halve the monitor counts of every resource on CDP
Date: Mon, 16 Nov 2026 20:59:09 +0800
Message-ID: <20261116125914.498841-15-ruanjinjie@huawei.com>
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
index d40c8eb7b300..df2f0674535e 100644
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
@@ -226,11 +225,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
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
@@ -259,7 +253,14 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
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

