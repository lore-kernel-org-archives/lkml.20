Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787414;
	b=OywmTlJCc4g/U1n2Mo9qvtYzNSn2W1B1pMqJ6cv8MTXanR1HSMfxXlgLBSI+uQ1Jn4bE
	 bYG06obEj19zrzk5IZ3xy0jlXqp30x8EoR9rXdKBmWpdPSv/EG0cDwDs/UwSUmbTHccIx
	 pdnK5yHM0ZsMJr5N0/MjIVRyNxNwPuWqPw+zS2euUtBQanVVOpRRoGft/luvs419glz1g
	 A4cwOtd0A8REzw8jWpnOlbsy8agfGhkWIocx2C5YCa24XFJvTx+ymKXzMY8IKRK3UsFU4
	 6dmQRP5cYYCNr3AkE+UBqmbFiLTTgIdiUYiCvmXJhjRNGTGKbw/yUP0bY1OE+wImAcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787414;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=K0+K6t8UvYYDmVVxcB8pVTT3JL6zkZOYzHJ2khqwGZU=;
	b=ZyyH0Y2oAZr855tDErEQQ9gnl7g2tk603qF0DbSQeJRTBHPDZuzT/5SnQi+l0g53VHNL
	 V6j3gW+IAVwVQvjhcqpFaU05ps8A113rDeQ7qRSt1FBP8x1dK81LwUzYvn09TnVHnb61l
	 5I2/uNaDjqgmDWvkVvN+/BHw2mcweGMf1rejyw46t6IpauotYb2IbrozAtvVDU5oQd8OZ
	 Epl6Ww99IShOw2t0HcKwh3oGotGtkjHMA8amGN4kfIJMULrfE4Jo+CItjMt/FWPBlAZAO
	 jqNAAHfltDn2plL7PXGVxuJR9c0haKAI9hFxbOafwZKUmCR4BksI4IGPrkTrV1OtxYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tEhZGALr;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C95E606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C95E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tEhZGALr
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=K0+K6t8UvYYDmVVxcB8pVTT3JL6zkZOYzHJ2khqwGZU=;
	b=tEhZGALrgrwyLOLok3S2AMOxh8lV5/QceXERZl+ODI9v3m1eVL+AoUnmlB8pnhHEVHoqE1NIX
	Q7NPXlehPQ716vm13QgBCPDLpj1HlJutLX5/u+h1aYD42GsD79Ygo0nZ2GnD3Air3R8vwF9heTa
	USD0Ya/euT0h6VDmI18lMpo=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jKLvZ0VZXz12LCq;
	Wed,  4 Nov 2026 18:16:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 36B1F40561;
	Wed,  4 Nov 2026 18:16:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 18:16:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<jic23@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] arm_mpam: Round the CDP RMID count down to whole CLOSIDs
Date: Wed, 4 Nov 2026 18:16:22 +0800
Message-ID: <20261104101622.563280-1-ruanjinjie@huawei.com>
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

resctrl_arch_set_cdp_enabled() halves the whole RMID index space, while
the resctrl core halves the CLOSID count: schemata_list_add() divides a
CDP resource's schema by two, and closid_init() takes the smallest
across the schemata.

When the PMG count and the CLOSID count are both odd, halving the
product counts RMIDs that belong to a CLOSID resctrl never allocates.
With 3 PMGs and 5 CLOSIDs MPAM reports 7 RMIDs, but the 2 CLOSIDs that
resctrl has times 3 PMGs only allow 6. The count is visible in
/sys/fs/resctrl/info/L3_MON/num_rmids, so userspace reads a value that
includes RMIDs no CLOSID can use; RMID allocation itself is bounded by
the free list.

Derive the number of RMID groups from the index space and halve that, so
the count follows resctrl_arch_system_num_rmid_idx().

Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1.x
Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..d3f957162b68 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -217,10 +217,16 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	cdp_enabled = enable;
 	mpam_resctrl_controls[rid].cdp_enabled = enable;
 
-	if (enable)
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
-	else
+	if (enable) {
+		u32 num_group;
+
+		/* Halve the number of RMID groups, keeping whole PMG rows. */
+		num_group = resctrl_arch_system_num_rmid_idx() /
+			    (mpam_pmg_max + 1);
+		l3->mon.num_rmid = (mpam_pmg_max + 1) * (num_group / 2);
+	} else {
 		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	}
 
 	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
 	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
-- 
2.34.1

