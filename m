Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503804;
	b=wAZe6Mx8ZgzHo2OPZZrVLjF75TRZRlXpQJt7dfWuAunm6LB0vq61+3tgp3NLRYw3Dh9n
	 NFJCGwyWUgBGAABmIJr7WCzFE2nMU9HAalq+wg3/6Ct57Oo3KXIoooyHDYpgOUXPSG4gz
	 OTsI6t8SokXd9K8ljwt360GR/bxpn/GA35FtmGBBVcSXxfb+0wi3QoiqsCPBPApyhOEZ+
	 O/ra/v5p+9meChDN5i7zbDmfugzzqcQX+2D1jPshMs++Zu7H3A1jU12a7wLHrRyoJk0jE
	 l/D2VcI6j5phncJKxHXOBywg4oJrLqcwp4i8dyf01BYvUyErDpP+6HfNvJOcMTsYHXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503804;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=LuPhFMOumlGNTqQS+w5VZbx5YKJeqmejHfb/ECYIeb4=;
	b=0ZvoAqFOSV1epIsJttL2evaO9YnNgM37sZlBiBJeCgLKtBph7z6yKfwrWjr2UhAx1QNd
	 GovE4mfnz/rbIDcqJcxfsfe8jrcHyCBVSheDqQIBzD4UsetkZrd6AO0kCeJhOBbKCberO
	 wruOjOUlarOhzjoVN/GYdAOTHN7EZcabn09WM8g+uAEhbpTS6RCV3Ez/EzKM9fnSRd2FX
	 LYW70rL/ig4VX+6NlNEcYQglpEDpMy3B7IqtsMuKPS2QXoe8/rLh7aKGBfE5kwm05vPN7
	 dKiHJ0KQsS5GOaVuWvroughQBMLWJlTA7G7m2i+erMnHk+1Yj4oYqixLqJ6yajjBILg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ENOtAHqy;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A59460A261F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A59460A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ENOtAHqy
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LuPhFMOumlGNTqQS+w5VZbx5YKJeqmejHfb/ECYIeb4=;
	b=ENOtAHqytCnIAQlZg7jlFKkYgsP/kLzMzpChH8QKTQKnGM5Xm4gDnm6tfA63rj2BCK6EX0IyA
	5kjP3Fdu8vU568DbkD6wZ5Xu+2aaJ1uC5Nl7u1FmYMsvRzmxQfZ8U+QtgOp6OJ3d0oWXxAKk3Hp
	1xDq5nI2NTRSyP/cruhnxNA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBZ39yrzcbNm;
	Tue, 20 Oct 2026 21:43:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D8FC94057F;
	Tue, 20 Oct 2026 21:43:10 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:10 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 01/15] fs/resctrl: Return -EBUSY when per-CLOSID RMIDs are in limbo
Date: Tue, 20 Oct 2026 21:42:25 +0800
Message-ID: <20261020134239.3921377-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020134239.3921377-1-ruanjinjie@huawei.com>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
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

resctrl_find_free_rmid() returns ERR_PTR(-ENOSPC) when no matching RMID
is found in the free list. On systems where RMIDs depend on CLOSIDs
(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID), the target CLOSID may have RMIDs
temporarily in limbo rather than permanently exhausted.

When userspace attempts to create a new monitoring group, a permanent
-ENOSPC failure prevents retry even though the CLOSID's RMIDs may become
available once the limbo handler completes.

Check closid_num_dirty_rmid[] before returning -ENOSPC. If the target
CLOSID has dirty RMIDs, return -EBUSY to signal a retryable condition.

Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb128ea..da883adc3adc 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -225,6 +225,14 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 			return itr;
 	}
 
+	/*
+	 * If this CLOSID has RMIDs in limbo, return -EBUSY so userspace can
+	 * retry. Otherwise, the CLOSID is genuinely out of RMIDs.
+	 */
+	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
+	    closid_num_dirty_rmid[closid])
+		return ERR_PTR(-EBUSY);
+
 	return ERR_PTR(-ENOSPC);
 }
 
-- 
2.34.1

