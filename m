Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318008;
	b=XRSYdUYKBeggeDEmiWVueMHTgUG8YbtQjkFrNKYUnhhkjjv+aNRpu4rOFm8Cp316Fn/5
	 ebqxvJdIiiJNrkEopsvhqzUiWkcb7lCJLmh2lm9rBJpM45LKdSkUP4t2MY5obXhN3o6nD
	 hALFJV3cPEhyzRHfuSZsViVLBTXEAoB5S3FqAGysNYG6MTSSl82XBV07T19nw3k7mobN3
	 OV45cUZGF0Tl+zFCZvzYa0OgYQ0bLplhkwro13EJXUbcZ+2P8vFQJSuxip9vAHjuvuC2u
	 A3u6m4b+cx5DGDlbcfXeFTTVg7hWAQM2pyT2NYVpImm1OEFTTTnNt3qeVtCuRcP7ehg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318008;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=5AoWzws+u8qPmUlt6b9wRGBvtGiSihMFLRLoKpS6GnA=;
	b=0nVxuWXNMD1rZ812OzruRKGW3X5KjAEM2wcDA62mXEdS2Grd7MMTP9Qj7+kSuNusGeRu
	 wceVomJp2DbJ4EY3RdKRCNwcMOeYwqXzfwcaZ4quDeThbAGsyXTzDdUjgjLw2EMgcSJSO
	 avaVExrcQvSwGnrJGGDTz0X681X6c+MVxJh0vYnnq3RwYYWEwLyOYgGIO12VYb5C3iRH2
	 jwX2I2fmu0b0MX8Nr/mEy2sv5K4ibufM2cxWdfrSRiNYPU2waX/6L28iekWzceewpRin0
	 41DBtTqedk6KzdpSiBsPx9rGHjpUN0tGBr5pfsHO5lvvQbvLfz4I7sLV48SIlwzxZfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3ouf+a6L;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF8F606A325;
	Tue, 10 Nov 2026 13:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF8F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3ouf+a6L
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5AoWzws+u8qPmUlt6b9wRGBvtGiSihMFLRLoKpS6GnA=;
	b=3ouf+a6Lg52f5zXr59qLSasZnWRwK2BVN91HsUEd3eQUv5mbLOOUuzXIrpo5Aq1g+VnD9JQ6V
	VLwWHg16lvEDtVyz+fL8VxgBc0eknDQADcHsYd23FEJg0TcNGVz8J/wsFFbhGmTJQ4aZa/43B8o
	yMvvponulEG+X6Qp3CORcyM=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jP76j4LhnzcZyY;
	Tue, 10 Nov 2026 21:39:25 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B0C6040538;
	Tue, 10 Nov 2026 21:40:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:40:02 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <will@kernel.org>, <gshan@redhat.com>,
	<zengheng4@huawei.com>, <jic23@kernel.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 RESEND 3/7] fs/resctrl: Clear the CDP state after the cleanup
Date: Tue, 10 Nov 2026 21:39:34 +0800
Message-ID: <20261110133938.3768632-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110133938.3768632-1-ruanjinjie@huawei.com>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
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

On MPAM a CLOSID is translated into the PARTIDs that the hardware
configuration uses. Without CDP, CLOSID c is PARTID c; with CDP it is
PARTIDs 2c and 2c+1. resctrl_unmount() clears the CDP state with
rdt_disable_ctx() before resctrl_fs_teardown() removes the groups, so
the teardown translates the CLOSIDs differently from when the groups
were set up.

For example, rdtgroup_unassign_cntrs() unassigns and resets the MBM
counters of each group through resctrl_arch_config_cntr(). On MPAM that
helper maps a counter to a monitor with the index
resctrl_get_config_index() returns for the CDP state. A counter assigned
while CDP was enabled is mapped to the monitor for PARTIDs 2c and 2c+1.
With CDP cleared, MPAM removes the mapping of PARTID c and resets the
monitor for PARTID c instead, so the mappings of PARTIDs 2c and 2c+1 are
left behind. The helper had an empty body on MPAM until the ABMC support
implemented it, which is when the teardown started to program the
mapping with the cleared state.

Clear the CDP state after resctrl_fs_teardown(), so the teardown runs
with the CDP state the configuration was created under.

x86 is not affected as its RMIDs and counters do not depend on the
CLOSID.

Fixes: 6e0e538a75ce ("arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.3+
---
 fs/resctrl/rdtgroup.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5d0351453c2f..3312637fb514 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3150,13 +3150,19 @@ static void resctrl_unmount(void)
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
-	rdt_disable_ctx();
-
 	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
 		resctrl_arch_reset_all_ctrls(r);
 
 	resctrl_fs_teardown();
+
+	/*
+	 * Clear the CDP state after the cleanup. The CDP state decides
+	 * which hardware configuration a CLOSID refers to, so the teardown
+	 * must run with the state the configuration was created under.
+	 */
+	rdt_disable_ctx();
+
 	if (resctrl_arch_alloc_capable())
 		resctrl_arch_disable_alloc();
 	if (resctrl_arch_mon_capable())
-- 
2.34.1

