Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277414;
	b=F3d3UntImwAB/QvVwOBJqk7iB5ZSYXCnKTSY5X4ZJKLtEqokkB7dulo4F0hG0qgk8qgl
	 1bmbk3sorPRiGpGKx0+WMvzvPbP2xSRK5KrMPGYzHm9V5jPlI4Voww+nRi4pY1z2WZ2H8
	 tfTeogH77MmaaEo8VEAIRNExJAyrE44dMPjlra9/OaUqT7FR4JIdJxkzaJf2Qw96OdlR1
	 gQ7FYsJ4XJ6p38wlyt8yknsDgu9o6Hkqqpc2lwDmNbzakB5WuPE1XCZ6SDfDNYzve7kw4
	 1R9ppRdV4OQnuxxU6zbrQoATgso4X5jdD+f0B7BpORATeb1iFkocQSqpaWYw2s/YBpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277414;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=qNHQ/CjqKp6Qo9XYbCd8OHdzmqMQwGutPp8zz1Kaeis=;
	b=c538A3MLzBcyy2cUsLAcSmwGioX1qVYPP8zXj050u/JXrn6mu5jAzMqNqIig8BenEqkc
	 mVqckDnat309Z+o9u0BH21a+9f7n80+g3ApJmEjk/uMsvH4gdH1slGm3dNKmiKyo5YJgX
	 n80cuFQhTCkvy9Ml0zHy8JCGzFu4fLM9wqKiIgeXM4nYgNAKs6HelBvwcm+LvDn/zZeNq
	 CzKxolIenmKfb1PVY53V0q7bN1+eg2OYthMRthhvlId8WF7uaMdSu2JhMWaWLB72TDEE6
	 aAlOqT3/EYs+/XPMIHYwudykT3yqfayk82MJu7vnwjcXHZBc0nLYpd/Qsn2uvkOrfcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=eYelVYeK;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8C160A260A;
	Thu, 29 Oct 2026 12:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8C160A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=eYelVYeK
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qNHQ/CjqKp6Qo9XYbCd8OHdzmqMQwGutPp8zz1Kaeis=;
	b=eYelVYeKjnXwWuyoa6znSSGsY8G8Dwya5YJDIaSfuAg+6yuJctINj/RmCrH39XuA3mo5Op9KP
	xEWjDrv+y3TVddIRpGWv4vA0o9zEgle/cgCi6vJkAvPUDwkb7ysOkxcqDcAZ6In3EFouxDcHUKM
	aKG+pCOczjkZcunfYzaqegw=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHv3Y3MzmVBy;
	Thu, 29 Oct 2026 20:36:43 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8816640572;
	Thu, 29 Oct 2026 20:36:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:49 +0800
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
Subject: [RFC PATCH v2 16/19] arm_mpam: resctrl: Report counter assignment per resource
Date: Thu, 29 Oct 2026 20:36:08 +0800
Message-ID: <20261029123611.1108424-17-ruanjinjie@huawei.com>
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

resctrl_arch_mbm_cntr_assign_enabled() says assignment is on by checking
whether the resource is the L3. A platform whose L3 has no bandwidth
counters is then told assignment is on, although no counters were set
up.

Report the per-resource flag MPAM sets when it sets up the assignable
counters. Other resources can then report their own state.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 4de3ad5a8ca2..b5416f589698 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -130,7 +130,7 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
 {
-	return (r == &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res);
+	return r->mon.mbm_cntr_assignable;
 }
 
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
-- 
2.34.1

