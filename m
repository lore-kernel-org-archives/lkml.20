Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793415208;
	b=mHNkhwAYT4H41BAqv38CIP+FZ/43rdtnlawiIkVG2X1wx2PBbk0Sf8YjJjkn+nzWMXon
	 ADMNK8t+P8BZEiNVWM/5kOqPeSnG1CtmD4i+wpaMzzLC88kt/RLMTb+MxEPRCfTrE8Fbo
	 F7+UBbdOcnF6Trz1vpqUnjZqXy5eTwMM5eFr1lurFVeuOYRTOOYvaH3mWK15WiFfNp74k
	 rkYi7eRpVgt1302/zZuQ+85aojdFQDv4fJ74L7KXRbsAwDnKH5cbtpttTD0HB06HTQzvx
	 oKwj1TZ2RN5XEql6x8XHWr/1ziwf9gsPvwafvp65evvU2mS6jKQ6cVEGkqFmbAI5O/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793415208;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=LXWnYsnYf3m/A416tBsZ1WanRPHnR82xpzLLxgdmEQ4=;
	b=nYvXxCOfVIU60VpTEr+pBWElr6K0ECIKbB2cnfRoMqPhbP2DzBKeTxzRSTGUqX7lXY1P
	 svf7zlGCCoNWHPL7YPxOTLAeRw5UdaIsMLZCUpTMUvZExZR6JNbjqk9Y2vq6ZETr+YMFU
	 IVnSji4IlwQB0ol9Qt5WGh6HPvnM9rI4gD7lwAg8JU7JkfzRjBLrT+6oRQG5HByVw6AHK
	 ++aAzXqgOs4KXxmdjWJfZP6vjTRhTFL6PlLh3JJmvfehek7V13GK0q0ZVIbWoXfrnzsoa
	 jdvERqjqlQ5DsZ9ES5Tbe3QMu7qhcxrq8QTGdQTtrYNPh+34OnUuSKHvJz7iLK5k3fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=lU483Isu;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3938E606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3938E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=lU483Isu
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LXWnYsnYf3m/A416tBsZ1WanRPHnR82xpzLLxgdmEQ4=;
	b=lU483Isu10yhdK1smAVSajHGV7hh4vyIxPXpyDXT2hcs6gZS13icBdTTOh8krqrbxvhmYvYV9
	/+L3RbD2vPOvQsNLhM+MXw3I8CKkAu2Sn6kJa4K2jjZ5GlZyCYTHMXOMLSqFVG9+KG3M545nBQi
	KWtjh4LQ24CF1M+6ZYOXMr4=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jGjFs0t1NzKm5K;
	Sat, 31 Oct 2026 10:53:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 18D0740561;
	Sat, 31 Oct 2026 10:53:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 10:53:23 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <gshan@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] arm_mpam: resctrl: Leave CDP off when there are too few PARTIDs
Date: Sat, 31 Oct 2026 10:52:57 +0800
Message-ID: <20261031025257.1540228-1-ruanjinjie@huawei.com>
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

Enabling CDP requires at least 2 PARTIDs. If there are too few PARTIDs,
resctrl_arch_set_cdp_enabled() returns -EINVAL, but only after it has
recorded CDP as enabled, halved the monitor count and turned off the
mbw_max MBA control. resctrl then believes CDP is off, which leaves the
two sides out of step and the halved monitor count and the missing MBA
control are not undone.

Check the PARTID limit before anything is changed so a failed enable has
no effect.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
RFC v2 -> v1:
- Check mpam_partid_max ahead and The partid_d/partid_i determination
  remains in place.
- Update the commit message as Ben suggested.
---
 drivers/resctrl/mpam_resctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..aa3b3a093857 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -210,6 +210,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (enable)
 		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
 
+	if (enable && mpam_partid_max < 1)
+		return -EINVAL;
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
@@ -239,9 +242,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
 
 	if (enable) {
-		if (mpam_partid_max < 1)
-			return -EINVAL;
-
 		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
 		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
 	}
-- 
2.34.1

