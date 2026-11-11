Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384820;
	b=bGbEkIEi+7kkxHWNS1K/uo6+zLEtYILl9WjtKoj2U9AThDCzxfK0kgwIlnvy7gcgRBOx
	 au5EgAGwxkZPI2+gv3jM83Y9aT9YcZibR6c5CkuWJ/b3ho7S6omtOf/41hcHOhYarMEzI
	 TOhWhiqlXwswsvD82FbhJh6aOhKumNSyVCUq56b9Sa8qcvwrFXtMmuCh9k+xhn4XQ+JYg
	 KvutcRn7xFNmRmr4MQEnKNFPWgIRt4OS5GCjX+7VF4QNWDkNCpkac8KdGJ36e2n68wBoq
	 e1eYfvDLrfDZnYuRU0O9R7EqCfyJIDTyrrKoRmj3bVXiOINnDeviifP9FXLy1QhML5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384820;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZUfWaV/zQvNeuCJEfS/peQTeOVn6kkR76BCqbGN3A+U=;
	b=EEuWSzHEteE3UZAq5pMMVtltV8VchSAj4SCPwb7FUqFt2zvgOt4+7Mpj0dnXsSoZGAJD
	 V4xPpsfCfWb9A3TiMNwHR6C3L5xen4m/PNpjQkfSUPfSwk8y7vqMlWBGHnMYnwY36Sz71
	 1YgR44SbuhHfBGelonv9yiHpiESbuvb7uo35BhTAUS+H6m3IBcWQsNIwoGx5WhZs91X44
	 pK/CC1iureQbUNPyN5qhZHetq2XURyKaBHN8xWpVSXDsCs08DvgudHha0pVTLAyB1q/tm
	 2eu4vAwS7YCd5IHU/zL0k3OIPWycn7ZB9OqjJ3Do/LEf0s9FA5mlb6ZIIWC1Jty49+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PhlVHTqB;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B88B60A5BE5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B88B60A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PhlVHTqB
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZUfWaV/zQvNeuCJEfS/peQTeOVn6kkR76BCqbGN3A+U=;
	b=PhlVHTqBBDSeuCTP75pcpnLHPfLV+6BssxOaH+8RxFKXOuNxqC0dPQ4vueL/tFwFCU3A4hzC4
	ktdbjdk78nnZzngP7bdbKU2tKo6A22bbDiMp3S2BC/NSK+PNPxPiigAfudHnHGIJG8Tn/mb35ym
	9F4KLG47Hd90QJqTgAcPOb8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jPbqv0MFLz1cyTf;
	Wed, 11 Nov 2026 16:13:15 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 810874057A;
	Wed, 11 Nov 2026 16:13:30 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 16:13:29 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 1/3] arm_mpam: resctrl: Leave CDP off when there are too few PARTIDs
Date: Wed, 11 Nov 2026 16:13:14 +0800
Message-ID: <20261111081316.3828283-2-ruanjinjie@huawei.com>
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
Cc: <stable@vger.kernel.org> # 7.1+
---
 drivers/resctrl/mpam_resctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 563ca99a581d..573617ba09df 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -219,6 +219,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (enable)
 		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
 
+	if (enable && mpam_partid_max < 1)
+		return -EINVAL;
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
@@ -248,9 +251,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
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

