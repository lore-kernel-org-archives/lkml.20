Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787370;
	b=4R8nO7AqnuWbjY5c+6RzkpZOD4EuoOqB17wBtPGIFOjhcP8QFAkruehtADDeSaQ1bpCI
	 qBYdeeg53IhdZvmT9azQ4fUEQIMd9Eib7V3ClH4kKTdMExd1hYolOa+kDrUecWh4nac5x
	 cS0hE5KE+K585VEKJbfY2F9WryVsGnzN8e7/k2FZTNr35E5U/olQyKTxE5VEOGDafNpfa
	 Xd1BcH7HYg5utQoQsviN9NZUVMevrIC/wIFc/gZYLkqzZjSKa6Ni75AHqJ8zCVBgeA0tM
	 ypQCI2VmX3v/uesildY1qonCxgbL31YIo+vcrEnm8SrsBUySBsX7lbIWNs+l4PEhlVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787370;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=blji6EsncC02jabiZ6XFQjZLweyuE5ilKCRUIDmsUIk=;
	b=D35nwBjw84IFMVVmgDnmvDHRjsmhNuwOCmGUrgaHYnW9aIa1iK63cRe61roZ0cCiu2V3
	 1gzequciS0kCslR2+WWgHvuLJSZONhUmY9yNl6bGXiKJ9SF5QBquNRL520ttJUr7EiQZC
	 +ghZV60CQI174HpnJ1CqfkaQ+M/tLWS1wxkaTokxD6P60a8ZVB3c9VKckMLkNfA2Rzz3X
	 mFyJy9PT2lVY0ozGjZQP9D+JwzLMbwJVw/lsfknUykslQCZFnlrTOa9qcc1WBwS0NxP6Y
	 TJ+rDGZyioScLny6hLjIUWnktkUwnV6hFNdeXS3b3oR9vjLkfShqvh17FfLRlYW6+SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=o9xzZVg0;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BA4606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16BA4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=o9xzZVg0
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=blji6EsncC02jabiZ6XFQjZLweyuE5ilKCRUIDmsUIk=;
	b=o9xzZVg0fOxBJlAD+nBxyvw2tTHS6Skeo/45Cxe4pA078r/AihD17TRdj6Qm1Xax7H+bOedeq
	vWcbeQY6bJTonQ5DHgg0oC47ip6VNJHqtEERD3jnRCd73gi3uFh1JHm1CXXRtdBp77xJXFDbY1i
	AeePRK3miMx68nksgLj8ZGs=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jKLtX1ymmzLlXh;
	Wed,  4 Nov 2026 18:15:48 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 240724055B;
	Wed,  4 Nov 2026 18:15:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 18:15:58 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <andre.przywara@arm.com>,
	<jonathan.cameron@oss.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] arm_mpam: Restore the cached configuration when a write to an MSC fails
Date: Wed, 4 Nov 2026 18:15:41 +0800
Message-ID: <20261104101541.563113-1-ruanjinjie@huawei.com>
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

mpam_apply_config() caches the new configuration before writing it to
the RISes. When mpam_touch_msc() fails, the cache keeps the new values,
so a retry with the same schemata is skipped as a no-op and never
reaches the hardware.

Restore the cached configuration on failure so the retry writes it to
the RISes again.

Only arm64 MPAM systems are affected; x86 does not support MPAM.

Fixes: 60e33a1864fd ("arm_mpam: propagate MSC access errors for mpam_reprogram_ris_partid()")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.4.x
---
 drivers/resctrl/mpam_devices.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..bb667a416660 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -3412,6 +3412,7 @@ static bool mpam_update_config(struct mpam_config *cfg,
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
 		      struct mpam_config *cfg)
 {
+	struct mpam_config old_cfg = comp->cfg[partid];
 	struct mpam_write_config_arg arg;
 	struct mpam_msc_ris *ris;
 	struct mpam_vmsc *vmsc;
@@ -3439,8 +3440,10 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
 					 srcu_read_lock_held(&mpam_srcu)) {
 			arg.ris = ris;
 			ret = mpam_touch_msc(msc, __write_config, &arg);
-			if (ret)
+			if (ret) {
+				comp->cfg[partid] = old_cfg;
 				return ret;
+			}
 			ris->in_reset_state = false;
 		}
 	}
-- 
2.34.1

