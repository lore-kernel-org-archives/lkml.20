Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277404;
	b=rK+FgzJxF7WKI+8rMqX2QKUshwmwtcE4JuoMDHqAOFMEeYds1cVEyfk1BHlLzt8eKtKL
	 83Dd7JoRpoaUee8Z/KYOuyCRXYMJr1IGTv29xCInPjOK5SJ9sLSTex8jxkvibEOKbeoFE
	 A/It3c7p+a8vNdj6EUovQK+UO8yoXLkUWPKs+EDG8AnY7OBi/7qSvQY0DLcc9VdIMOwDV
	 vgq4LfZGQfVKROdA7odDipt6GH3AJt82tb6LlKHHjsV7dBfk7JQ9HvzWtxqR8nPrkcoZW
	 7Rmz+zNL4Qo7+icxNxZSsD4Fys+CwgMbztUFu5de30hHj4ZvGneAnqkjgNdhtoNMztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277404;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Y0PXaueWWNNW1qjVnxtFx1G452Tq6z9iP9QC2QUcooI=;
	b=Cvgakuq1Z3DsgeF9UhrmgkUSbvkou1vk/CFCwu3mEs/eeHj1qG/5nAugzMjbuXiGle/a
	 Y69rRDg1So65uXI9XmXAFpQ1Gxi9KzbG0RX1WSnXjK3MBMHgoRkbSJTgxKLr0kBrENXfP
	 +0MaO3XpfEbEZ/5p6Wvekf/L/d3Zv0c6v0Qsu3jdiHir/HuIbNb/a5rI9OC504cLv4v4J
	 8VoT4QYom5b5eOjRsym3NUFk4Gq/s4HUSgchk5cFMv7msGG4ElBmBOvpHFv45UCu+NWXC
	 ahxXZIvQSIIw5Kh8Hkg3k079fvr2zCzme+MHb1P4iwVCjQxnznWmIce1s8US11PJrYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Vrayu7Wn;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946A1606A32A;
	Thu, 29 Oct 2026 12:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946A1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Vrayu7Wn
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Y0PXaueWWNNW1qjVnxtFx1G452Tq6z9iP9QC2QUcooI=;
	b=Vrayu7Wnq2HmWqaeKIVCOWCydHGgxHIgnINeb+kRNkJniQuQl2+kpA07H0ngltYB2qGyK4Rbh
	M4a3g3fhd5t7a+qON3VsKY/ccavzVsJGoEKYL/KzFTnGem79zVU6Fk+nGjmvVdwlhY1ls12mkVN
	OM+b/jgNzOUYV8I/FJXgJoo=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHV6fzxzcb3p;
	Thu, 29 Oct 2026 20:36:22 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CC5DC40577;
	Thu, 29 Oct 2026 20:36:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:37 +0800
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
Subject: [RFC PATCH v2 01/19] arm_mpam: resctrl: Leave CDP off when there are too few PARTIDs
Date: Thu, 29 Oct 2026 20:35:53 +0800
Message-ID: <20261029123611.1108424-2-ruanjinjie@huawei.com>
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

Enabling CDP needs a second PARTID for the reserved closid. If firmware
reports too few PARTIDs, resctrl_arch_set_cdp_enabled() returns -EINVAL,
but only after it has recorded CDP as enabled, halved the monitor count
and turned off the mbw_max MBA control. resctrl then reports an error
and believes CDP is off, which leaves the two sides out of step and the
halved monitor count and the missing MBA control are not undone.

Check the PARTID limit, and work out the CDP PARTIDs, before anything is
changed so a failed enable has no effect.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..886f0595d364 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -210,6 +210,18 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (enable)
 		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
 
+	/*
+	 * Check this before changing any state: if CDP can't be enabled the
+	 * caller must see CDP left off.
+	 */
+	if (enable) {
+		if (mpam_partid_max < 1)
+			return -EINVAL;
+
+		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
+		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
+	}
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
@@ -238,14 +250,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (!cdp_enabled && mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
 
-	if (enable) {
-		if (mpam_partid_max < 1)
-			return -EINVAL;
-
-		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
-		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
-	}
-
 	mpam_set_task_partid_pmg(current, partid_d, partid_i, 0, 0);
 	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
 
-- 
2.34.1

