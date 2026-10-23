Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723731;
	b=BKWfZcj8IM3nX8mMxNrB0l3kVgzJRucxgqLbUpPLKYgAucMLQQQBYysoVn2+gL++RnIz
	 L3y4492f/Ol/+I3VqQXzdLY1V3Y9EjT9tkAWQvsQQhqjgrRL35YfR7GjiDK4tr5ihV4l2
	 kOUjzEXR0F0NWjE9cfRMaT5CAlGd5/ZlUT+VeDDMHxKYRXNGWFdz2QvDDt5XWnA035L/n
	 seIjt6jgyaikMUeydj40CsiWW7sbQ+aATLy1OekoqrU+cKQNY4jfXwu2092bYVzGs8qYE
	 rxK/ovXZTmZN7ngbqAmLzsh2tpa1/ujTxXk0uM56UFlydlNzICXkrbla4Ip227xBENA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723731;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=pWzjv2CSIr51xY6O71lYBhcqggOBNicTTCGBk43wTJ0=;
	b=nF5IrT1TAg3Y05GcAbTCXUFwS+L8BFp8nAJsxQgwOmCksWQwGJAM0r7ThinOy52rNiO6
	 eqyzNxK8mIL4P9ROwnpV5JBn9XKbSgcJtWjjc2YH5o+Idx5O+uUT/QZ3WEdpxYrkAbujY
	 Obp3L3WsbzgI7goZvX5m67Mse2mzIsvxz9k+fn2eH/+PnKy7EpbRTsqJqm1ktX8EDAMvI
	 VObida+llb2wim5nz9o2pfMwx9tFYOoX0z/9EOIAMcWPJQ6zMzY2CYSDGhxxbeqv1+qk5
	 3oAS4aKMt5iHNzQUdq67FR4V0nBQ8m6K0F+D8GwkpZL09R0eYMpty0GFDn1rHHEr6Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=w7DSlOHb;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D442C606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D442C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=w7DSlOHb
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pWzjv2CSIr51xY6O71lYBhcqggOBNicTTCGBk43wTJ0=;
	b=w7DSlOHbfFB/MRsIsrpCwFQ2AUAqMFZyJIl7rIoMFrGmCNZ/R4OfnJF2rB+aovQ8BYNCAR+H2
	Qk/et/J7fjk2qbGirCuGjUCMwij5lHqvWg1GgUXQrwY28JbZEhi3qcIlGomysnUAUNP+8WA7gWG
	k34qRlqSQNNIOmzjWCv3Tnk=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j9nX60RS1z1K9Zk;
	Fri, 23 Oct 2026 10:48:38 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 24C4440572;
	Fri, 23 Oct 2026 10:48:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 10:48:42 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 01/10] arm_mpam: Treat adopting a config feature as a change
Date: Fri, 23 Oct 2026 10:48:03 +0800
Message-ID: <20261023024812.232820-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023024812.232820-1-ruanjinjie@huawei.com>
References: <20261023024812.232820-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

maybe_update_config() only latched a feature when the new value differed
from the old one. Zero is a valid value for several controls, so a
configuration that adopts a feature with the reset value would be
treated as unchanged and the register would never be reprogrammed.

Always latch a feature the old config does not have, and reprogram when
the value changes as before. This is needed by the controls that follow,
which can legitimately be programmed with zero.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..0fbf3464e744 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2897,8 +2897,15 @@ void mpam_enable(struct work_struct *work)
 		mpam_enable_once();
 }
 
+/*
+ * Adopting a feature is itself a change: 0 is a valid value for several
+ * controls, and writing it must reprogram the reset value, not just merge
+ * the (equal) number.
+ */
 #define maybe_update_config(cfg, feature, newcfg, member, changes) do { \
-	if (mpam_has_feature(feature, newcfg) &&			\
+	if (!mpam_has_feature(feature, newcfg))			\
+		break;							\
+	if (!mpam_has_feature(feature, cfg) ||			\
 	    (newcfg)->member != (cfg)->member) {			\
 		(cfg)->member = (newcfg)->member;			\
 		mpam_set_feature(feature, cfg);				\
-- 
2.34.1

