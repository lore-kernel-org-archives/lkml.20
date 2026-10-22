Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658936;
	b=sO2NFmz5cBVTEqhQITuROOBoecGOaioGKe84j9rR1aL0WrBORz/DNm24I0pSw+Qz6S9U
	 JiWOdKVU/jt0W2BNxIhRE7IdScVK6gTnA7Ylel1C93W9EjSOcZO1SMKbjq6Fqm47Zu/K6
	 BqKoiGUXoPDNWZ1ZjBrcSIumuo8+x4k0DpssQyxefa+UrMXJ537A6e0Om/JP8Hp47UVW2
	 C5YGTLTDXNr0SwipwlSkc/BYpoAh3+IxqVnewYbG8TZ0/AYdUR7IoLtM+8yL5EdBL9C2S
	 Jza3zleeiyPUJdbLx5BvK3Ar5ikFeAj7PEvYXobyj8Zrb8F3+HBmWGbGmEBDYNjyjeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658936;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=b0wRLcy0ggQaa8LoaAXhe35ntO48tNtFxyE60noBeWY=;
	b=gPnXm8IoJzr5p2cNjg0O1GbsXYzwLv43i/bKCGM8sNmNtIZOEpUOAXcyprzG8Keb3eER
	 ICyqMPXTmwKzjugMDqyNLaHdpm+WGUso348AsVWFnQ16jFCBRXAfLCNNWQEpEktEbmuJz
	 m6sCZfAFsGVYnjBvplkFeM7didSRTLSt7J1TJwsKdQmSEqlSN3VpyWFKRF5jrXhHW0dop
	 MZ3SJjrOSKKbpiGCLK+/LloJc0px/P3rmDzSV5V5N+WbCLN1SsaZUEsjL9zaAie+xlVPj
	 reipX7sn+Zm10pGyMv6peDH1j5KhyP5hrBrzPoOQ/8juZiK4ByQNxV2ohgV73JdRxdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KFYlIyDl;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64893606A32F;
	Thu, 22 Oct 2026 08:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64893606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KFYlIyDl
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=b0wRLcy0ggQaa8LoaAXhe35ntO48tNtFxyE60noBeWY=;
	b=KFYlIyDl6H9LGK69jDlK0ZZMjULU3bBHG9Nxno2IGZ8nmpors7Sj0pQH0XDxK/tNIAlu+WDZI
	LAtAtxx/MfbOBd7IIxgSZeKrQ2b+hUfLZkB0w9iXPFidHQPfUmN9hlHE1VWus9fk7tzStqrqReS
	mot3OG4qv5g57rp0YCBHOa8=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ92MtFzpSvH;
	Thu, 22 Oct 2026 16:48:49 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2A1C740537;
	Thu, 22 Oct 2026 16:48:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 4/7] arm_mpam: resctrl: Halve num_rmid for every mon_capable resource on CDP
Date: Thu, 22 Oct 2026 16:48:18 +0800
Message-ID: <20261022084821.4014873-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022084821.4014873-1-ruanjinjie@huawei.com>
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

CDP emulation consumes two PARTIDs per closid, halving the PARTIDs
available for monitoring. resctrl_arch_set_cdp_enabled() only updated
the L3 resource's num_rmid, which is fine today but leaves the L2
monitor's num_rmids stale once L2 monitoring exists.

Loop over all mon_capable resources and halve each one's num_rmid.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9ffee18e657c..efb9ce76acb4 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -189,8 +189,9 @@ static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 {
 	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	struct rdt_resource *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res;
+	struct mpam_resctrl_res *res;
+	enum resctrl_res_level i;
 	int cpu;
 
 	if (!IS_ENABLED(CONFIG_EXPERT) && enable) {
@@ -212,10 +213,22 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	cdp_enabled = enable;
 	mpam_resctrl_controls[rid].cdp_enabled = enable;
 
-	if (enable)
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
-	else
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	/*
+	 * CDP emulation consumes two PARTIDs per closid, halving the PARTIDs
+	 * available for monitoring - no matter which resource the mount
+	 * option was for. Update num_rmid for all mon_capable resources,
+	 * e.g. the L2 monitors as well as the L3.
+	 */
+	for_each_mpam_resctrl_control(res, i) {
+		struct rdt_resource *r = &res->resctrl_res;
+
+		if (!r->mon_capable)
+			continue;
+
+		r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+		if (enable)
+			r->mon.num_rmid /= 2;
+	}
 
 	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
 	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
-- 
2.43.0

