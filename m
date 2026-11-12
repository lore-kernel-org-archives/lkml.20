Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489202;
	b=t3Ak4TK8OBXz0tJLKpu1SyaMHMXnqjCaU046mJGYNdZPfA00rL/DOorIUR7e++FN09ER
	 s0Z2UEi3SBErVCt1SzbUb9GvI7xuZ5uvAOjnxJTC+J17OaDrkXD45R812E90XHoU6diXc
	 mCcWDgcCcZlCi9H6uizXbuklh7YI14ZUQiKC4imkCf4jyMQ9pF8Wc89dTnlXk4grUQnWL
	 v/1OUqy4L/vTzmdHjdwYFubYfCtcNZrf/DOMm3gDPjg0Vm6h2ACOG0qWdz3k+gFIEPFBH
	 3PXNelTt3iu6LJ9zGeKyQgM+oC5vMP8AV+rvcqfOSLpjhTc5vaconXOInbeDn4aByyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489202;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=pDpjt8VglQ59WLlsERaR/X2OODsiatxf33CQhvLzv1E=;
	b=HWwbT5TqdF7ipF8YoBtDDCpZfRRx8cUVDBYvSPJX6nS95NWMfORPOniJik6We3AWm4xj
	 Vb/3IKuL9ErGO3I6WaWOWl+VvlF+TQGfHsEmET2b8Km7KUNk63gCjAJdk9bJITmL4Ruf/
	 UBxwJVGx3goMOevOsBmfwKFiL/QgLsV88kj25gi4FIpf5vqtPQmBiS1LXv9khMRdRDQYP
	 rIns16XHzMkQuFTLHIEf1sUx759EB89+TOV+SZzRqVofgu4TTwC5wLgapSLQ5PUJYUdKF
	 2YSqP88odlVmRQokf/7y1cFAl3I6M7rPu0fuMh88G9bOqgi/V11KAvFE4fApemzXXUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=z8M2B9r2;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A426B606A89E;
	Thu, 12 Nov 2026 13:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A426B606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=z8M2B9r2
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pDpjt8VglQ59WLlsERaR/X2OODsiatxf33CQhvLzv1E=;
	b=z8M2B9r2M2uLanCqzT0oLyqagHMgMPnWUSJkp6BvxC4lhfAVUoxh2fUmUnavLAsFgLC+oO2L0
	XinoAdPGlC+PwjzYVZTATB5IqLiB84CKlcyvD4lkwtuUDeS7+emizkoqYBTRjE++QCQdDvamb7I
	rt63m14fe+l79OAprDcWfno=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jQLRN1PV1z1prlH;
	Thu, 12 Nov 2026 21:13:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C49D40579;
	Thu, 12 Nov 2026 21:13:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:12 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 3/9] fs/resctrl: Do not update bandwidth from a failed counter read
Date: Thu, 12 Nov 2026 21:12:48 +0800
Message-ID: <20261112131255.4043381-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112131255.4043381-1-ruanjinjie@huawei.com>
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
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

Every second, mbm_update_one_event() reads a monitoring group's
counter and passes the result to mbm_bw_count(). When the read fails,
rmid_read::err is set but the value stays zero, and mbm_bw_count()
runs anyway. Subtracting the previous sample from zero wraps to a
huge bandwidth, and the controller moves the control the wrong way.

The read fails when the architecture reports the counter as
unavailable, and, with assignable counters, when the group has no
counter because the shared pool is exhausted.

Update the bandwidth only after a successful read. A failed read keeps
the previous bandwidth; the counter keeps accumulating, so the next
sample spans the failed interval and is larger. The controller steps
down once and recovers in the next round.

Fixes: 30442571ec81 ("x86/resctrl: Calculate bandwidth from the previous __mon_event_count() chunks")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # v6.1+
---
 fs/resctrl/monitor.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index f067329e92c6..49a4b4ce95d4 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -801,10 +801,11 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_l3_mon_domai
 	__mon_event_count(rdtgrp, &rr);
 
 	/*
-	 * If the software controller is enabled, compute the
-	 * bandwidth for this event id.
+	 * If the software controller is enabled, compute the bandwidth for
+	 * this event id. Do not update it when the counter could not be read:
+	 * that would store a bogus zero sample as the previous bandwidth.
 	 */
-	if (is_mba_sc(NULL))
+	if (is_mba_sc(NULL) && !rr.err)
 		mbm_bw_count(rdtgrp, &rr);
 
 	if (rr.arch_mon_ctx)
-- 
2.34.1

