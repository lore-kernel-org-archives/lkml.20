Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384822;
	b=KwJapaJB4lnHttMQ9g7RqYPAtiXXS2+KhpDabPUYDoJPi7gYx2nIT4n1XPFA/PfhLi3K
	 lu+2c5AMtcLPkeAtAbe6663cyqGhnxBcDCTrt3+oDmJkUVWyv4fRZeR5NMxbbgTrzZP8I
	 LNekjFci6WF6Z+anNTb3JmHgW3fchTXLHz6LLwyGTzXlCH4t3tklqEBGtL60SF65+leuI
	 +iCAorRhZXLQWb5oHpoTlRM5R5Zv8jK0+Vj6htzjS1FZgl2QP+tjjRYshncb60ptds916
	 u5hCQ/KtnHCkW6vj2zDwdY5tVFVneCwx4cJqgve74nqUaZ3s4JT29QDEixmP4gIK1sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384822;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=02ZuU5L8LvwtJsfio8qy603fcakQVuFW27ea/trZscI=;
	b=BZF2K//pDftChLhgr4n8a6QivmSQllAoI1nIoZ9x6RkzZDQoHJOjIBgxhNMLFyFNq1wV
	 n1a1E6R7nOjTKQ3OfoHEBrNY3r9oYoE0EkF5XDxVmZTQvrKRBXuEg9rRad1GjDnLaXk8C
	 3APUSCp/I72CPR1c0ZmLc55qUCBVoJD5nRYLluTWY3+6fmzkQg3gWf9cMxA1WSOAbsw9P
	 Zvpjl9DWNYMKHKypDjqXCrWc2xQJVoeI6+Reezqz92HMtvINyBH0r9quBAUX+sODV0vAU
	 2qHUgeQnF0PQEugZGtaIMAYjqUUakauypIP/kxGR8++rkx+UpnFw2yrOdk3Nosl4wWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4VAjRoVv;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C175360A6F5E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C175360A6F5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=4VAjRoVv
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=02ZuU5L8LvwtJsfio8qy603fcakQVuFW27ea/trZscI=;
	b=4VAjRoVv8MAIytCy/iLfyFKqwU8j7ZIVCKpUVgPIydLv0mxy/BBTM5s+fUlL6B7oFlWU3VGdM
	pvxBoRKPxvCAXB8k43XU33vLeVD7QvW/TFGzvELXGe3RVtHNno1dQKJrTdzSQqLfvPe1/Ssjc+7
	WmcjhIXSh51rOkq/CgyDWIk=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jPbr15RQFz1K98l;
	Wed, 11 Nov 2026 16:13:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0626A4055B;
	Wed, 11 Nov 2026 16:13:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 16:13:30 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 2/3] arm_mpam: resctrl: Only enable CDP on a resource that supports it
Date: Wed, 11 Nov 2026 16:13:15 +0800
Message-ID: <20261111081316.3828283-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111081316.3828283-1-ruanjinjie@huawei.com>
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
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

resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
requested, even one that has no MPAM cache controls. Mounting resctrl
with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
its CLOSID count at the number of PARTIDs. Control groups in the upper
half then map to PARTIDs beyond mpam_partid_max, which index past the
configuration and monitor arrays and program out of range PARTIDs into
the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
disabled.

Do not enable CDP when a resource cannot allocate or is not CDP capable,
as x86 does, so the mount fails instead. Only the enable path is checked,
since unmount disables CDP on both cache levels to restore the MBA control.

A system where only MBA can allocate, or that only has monitors, now
fails a mount with CDP as well: CDP hides the MBA control because
mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-aa2c-3c90fab5853d
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1+
---
 drivers/resctrl/mpam_resctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 573617ba09df..afa3c084c475 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (enable && mpam_partid_max < 1)
 		return -EINVAL;
 
+	if (enable && (!mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
+		       !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
+		return -EINVAL;
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
-- 
2.34.1

