Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833989;
	b=SQK3nCvjsDVI8t24T6302HDMpEC6/Lpt0QKj+a0ReSnfLfFEEfla61LMO1eiI+iIF/i8
	 0/C7Q0qNn6ilfG1zO/n/63+LAmQBiQ/wnSzj6DcFOjKpecl9EJfGGCtxH8CAP5GaKgZQU
	 z+eaY+Ymvd9rAhfKDAWDpmBVahDBZC2yKzHV+czu2jNpTQMe/0JK4m8lcfErT3Q0vHEv1
	 q5bG9v76hWhx/q1syxXN80lIcWfHFVsWY+ZsU121xWMH9k6bw23R4evd39tcs3omQBZAz
	 JYGlCcy2Wi/QpBTmBSZRNnGKCJLNF+jbMTWZtYhgujAoWK7iBgKaMUHkQ4K9RC9cGwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833989;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=tzyZcndpSPonNL2UNMoqSnInbi9aMQQdYrQCcYOVDpo=;
	b=BUXs6rfTErCfnqPipPmPAE75SFQB0ZoGVqsGDhRiB/qwMSdXppkHhD+YFYcvd59QHFgM
	 D9SRJUAwt8A3f0kSDq0NzU9quRmj9Howcu8eO+KfaNBm0RaHbeYJTEDySGNRLdt4pWC9/
	 7jP2PqnXwfZ5KS3Vf6c5KKKQIo+TkyUMGtk/m5LThSSzwTte17+nr1AFAb8pRAKrepflX
	 K5B2UX4tyM+/U4R8pKzAtTotIfEQDNrQm7BZ73MyXP70UG4/1nwN75FNBtriZXnSzNWUs
	 i4l5aCIvNEwokVLUzLZjlq+fk2ISbxUvPUlwnyIw5mmVFhV5RKimrkeuHyHeT57TKVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nISr9JHD;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC73D60A3839;
	Mon, 16 Nov 2026 12:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC73D60A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=nISr9JHD
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tzyZcndpSPonNL2UNMoqSnInbi9aMQQdYrQCcYOVDpo=;
	b=nISr9JHD/X0k93S9HVjSSULO9L7Ck9GZdZgqIpgjZEs9XbdORJ7SZQxBz9nEclgG4NyWFFOdb
	QEahlGsmxFY7zp/iZir9fonMsNITITGoYQesbrVNS1Fjxm4C6fZBHR2zNykqUaU+hymPiekcYA4
	O6IzVxoxI9El0qVuhAIqicU=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxq604XzRhRb;
	Mon, 16 Nov 2026 20:59:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 48D1A2011D;
	Mon, 16 Nov 2026 20:59:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:40 +0800
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
Subject: [RFC PATCH v3 16/19] arm_mpam: resctrl: Report counter assignment per resource
Date: Mon, 16 Nov 2026 20:59:11 +0800
Message-ID: <20261116125914.498841-17-ruanjinjie@huawei.com>
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
index 8a68b51d5811..470b37587890 100644
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

