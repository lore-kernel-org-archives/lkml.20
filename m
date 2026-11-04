Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787811;
	b=JfxZXHx1Vo06O7YUWie3ibsgiS86wV7cqTs63i6Ng70CyibD+NPSKO+KoPeoVGodDc5v
	 MAvTamnXyypo9N8bFE0dabvu6Eh8q+XkVDDwdVHpXa7LLpTBDDAl0QQSntSR4k5nsEz0K
	 rmj5zcZ7LXdfzduZUdcKyLVp9zuuYk0rJlm5Jrf0iIkYqHR6sWYjGKX9WsN23+IdhBYCI
	 izRCSRM74aaIRIMiP9IpIiCIJvrB2UUjjJW+YEiH5P3Dmmrw0rWxPQbFVQ4KeIXuFC6lw
	 E/lmE0xuaUAYzCgMAb5h/zqA4VbqqCCLZrEw4APjj1DA224gr6a+HTo10x4TXRE8SJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787811;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=DqjNi23A6N6PJPVtji9+3eIWFzePoyW0P/KcAaiXz3k=;
	b=c/SmXBtwzxdXIyYyIqS/RDKc97erKZ+mw6rc1/vTHBNDt14HzjHWi3eD+MGIIiwhiELN
	 PS/nIvAVRyE/Hw49vFL+zAwNp9xOzChXNLhfzyDRXgzeoN5rY/WqObOA4ESi2lyxnmicG
	 bOcgSrFKvGSeKG2plMeGkflfkrSG+HY3xINa/WuvcdglYFB18nCf5pJVMxsbYKKffcKaU
	 nx6XgdG3vU9bKdmdlLbQMNyQwpPNBfMQiwGLGORR8GqANKBfQ24y4FkBSCcj8Yb+/ryRv
	 piDCP+rQcpCqv4lEOSfF7wUQ7CJHyjJKKiLknQ4ks8zXJm2eqSWklHJqW7rzVNwRYbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=kpTTQA6n;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA473606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA473606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=kpTTQA6n
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DqjNi23A6N6PJPVtji9+3eIWFzePoyW0P/KcAaiXz3k=;
	b=kpTTQA6nIUWOyqvuXfxaL5Wv0xIE1eU7ODRPTZegNWHz+/RKmFvexECK0aaYPorlUmHG5KcED
	Y8/qxrYh90ZFLiVi+52bwhp+wa3dzGL/p3F3ZIM3z7qi4hJ42/r9poJJqMpQcegKa5cG1PmJl6M
	0t01VuXCA6iZsFSSdohNsNE=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jKM2t4PCkz1T4J5;
	Wed,  4 Nov 2026 18:23:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D8D34057F;
	Wed,  4 Nov 2026 18:23:22 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 18:23:21 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] fs/resctrl: Report why a schemata write failed
Date: Wed, 4 Nov 2026 18:23:04 +0800
Message-ID: <20261104102304.703535-1-ruanjinjie@huawei.com>
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

rdtgroup_schemata_write() clears last_cmd_status when it takes the group
lock, and records a message for the input errors it detects. When
resctrl_arch_update_domains() fails, the function returns the error to
userspace without recording anything, so last_cmd_status is empty and
its show function reports "ok".

resctrl_arch_update_domains() fails when the architecture code cannot
reach a domain, which on MPAM is a write to an MSC with no online CPU.
The error code is the only description of the failure available to an
administrator, and it never reaches last_cmd_status.

Record the resource name and the error where rdtgroup_schemata_write()
discards the return value, so that last_cmd_status reports the failure
instead of the previous success.

Only arm64 MPAM systems are affected today; x86's
resctrl_arch_update_domains() always returns 0.

Fixes: c377dcfbee80 ("x86/intel_rdt: Add diagnostics when writing the schemata file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/ctrlmondata.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index cafebdff70dc..cfb59cbc4135 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -367,8 +367,11 @@ ssize_t rdtgroup_schemata_write(struct kernfs_open_file *of,
 			continue;
 
 		ret = resctrl_arch_update_domains(r, rdtgrp->closid);
-		if (ret)
+		if (ret) {
+			rdt_last_cmd_printf("%s: failed to update the domains: %pe\n",
+					    r->name, ERR_PTR(ret));
 			goto out_clear_staged;
+		}
 	}
 
 	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
-- 
2.34.1

