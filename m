Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277411;
	b=RXLb5+EgnmIFxZkZkJV0u0xJQEldZ4xAixg8vuaxjdNaTupHq/62tab8NezL3DFOhMg1
	 UreylM355peVWpuZ58fYcquGXHEc2kDlZw8dcqSsO/v4XDFUOqkJQBicRDemh81UgHy5Y
	 6hHOPnPw7LvkpFmfMn+l3toMwrkhgRlymvE3lzCeRBdseYn/mXhEp9pFr12Vn1cpX1A3i
	 UKV220o6gyo3scRJ0hKrFWFM7rPpfs/I3U7A9gIFzCBQ//1GjtoRmNZjIVKMn4++mqdY/
	 CHmx4ttGMJAh2dZMGg6KT3CmbN2icL1NmWS4QBk0qQVx0QZbHOYuowsrPZP23XlrV8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277411;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=8u3BYJaHqnf1MKubNHyfB+r6z0l4E8xIBKgFoRWzhuY=;
	b=j91Ei1y8jxv4cJkEWpxqPNHI5DYR8c2mca05bWlI4GZGKJRsnsKSLHYU7nLmq/3XLViS
	 Ni4xcH9KlSTusw8YmZlils1JSCXb6uyfaJT4NnakVfMshnDX84OnOmk7bXVMM50OO+yBr
	 ZMMfuoFRz2KfTzH/h+pCOnuxW3jBNWVIUnoNnhf72b/PD4zQS9CbFPv1SGz9Q8D/kLgIl
	 RLa2oFsBCpoUY+OmTM3dLBq9g8mzOIc2qR5M7u0F3G7J8cFhBQM1YkTvLa6RCsXKmQC3r
	 tOa7FlU5A11FgMaaR9BPNY2WNl8TEDrNPv8sSVGkx5kSujPX0LnS1VqDGgW6jNHAHvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=m3S34qm3;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE64606A33C;
	Thu, 29 Oct 2026 12:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE64606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=m3S34qm3
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8u3BYJaHqnf1MKubNHyfB+r6z0l4E8xIBKgFoRWzhuY=;
	b=m3S34qm3A8s6Puk55buB3KMBs/HBGOQAHrmbs41kd2QmUHZOX5gLlZNIEn3XZM/E1tIjs/kJR
	G+YqlgtJ8EjKim8LG1st5lrM4Bg0WTKWe3wiSBergRux78j3Utvj0vnhOinkUHXs0gRLXfjRRFK
	pYvR9wwsEep8cnZ8ZKigReQ=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHz3vKJznTZy;
	Thu, 29 Oct 2026 20:36:47 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2CFCC40586;
	Thu, 29 Oct 2026 20:36:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:40 +0800
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
Subject: [RFC PATCH v2 04/19] x86/resctrl: Use the resource-agnostic monitor event names
Date: Thu, 29 Oct 2026 20:35:56 +0800
Message-ID: <20261029123611.1108424-5-ruanjinjie@huawei.com>
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

The monitor event IDs no longer carry L3 in their names. Switch x86 over
to the new names. The values are unchanged, so this does not change what
is written to IA32_QM_EVTSEL.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/cpu/resctrl/core.c     | 10 +++++-----
 arch/x86/kernel/cpu/resctrl/internal.h |  2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 55214d6fdc49..8842e3406ca5 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -887,9 +887,9 @@ bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
 		return false;
 
 	switch (evt) {
-	case QOS_L3_MBM_TOTAL_EVENT_ID:
+	case QOS_MBM_TOTAL_EVENT_ID:
 		return rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL);
-	case QOS_L3_MBM_LOCAL_EVENT_ID:
+	case QOS_MBM_LOCAL_EVENT_ID:
 		return rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL);
 	default:
 		return false;
@@ -969,15 +969,15 @@ static __init bool get_rdt_mon_resources(void)
 	bool ret = false;
 
 	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
-		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(QOS_OCCUP_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
-		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(QOS_MBM_TOTAL_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
-		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID, false, 0, NULL);
+		resctrl_enable_mon_event(QOS_MBM_LOCAL_EVENT_ID, false, 0, NULL);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_ABMC))
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..1abb4b6d01e4 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -77,7 +77,7 @@ struct rdt_hw_ctrl_domain {
  */
 struct rdt_hw_l3_mon_domain {
 	struct rdt_l3_mon_domain	d_resctrl;
-	struct arch_mbm_state		*arch_mbm_states[QOS_NUM_L3_MBM_EVENTS];
+	struct arch_mbm_state		*arch_mbm_states[QOS_NUM_MBM_EVENTS];
 };
 
 static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 5ffa39fa86fa..825d71b14b4f 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -68,16 +68,16 @@ void resctrl_arch_sync_cpu_closid_rmid(void *info)
  *                              configurable event
  * @evtid: event id.
  *
- * Return: 0 for evtid == QOS_L3_MBM_TOTAL_EVENT_ID
- *         1 for evtid == QOS_L3_MBM_LOCAL_EVENT_ID
+ * Return: 0 for evtid == QOS_MBM_TOTAL_EVENT_ID
+ *         1 for evtid == QOS_MBM_LOCAL_EVENT_ID
  *         INVALID_CONFIG_INDEX for invalid evtid
  */
 static inline unsigned int mon_event_config_index_get(u32 evtid)
 {
 	switch (evtid) {
-	case QOS_L3_MBM_TOTAL_EVENT_ID:
+	case QOS_MBM_TOTAL_EVENT_ID:
 		return 0;
-	case QOS_L3_MBM_LOCAL_EVENT_ID:
+	case QOS_MBM_LOCAL_EVENT_ID:
 		return 1;
 	default:
 		/* Should never reach here */
-- 
2.34.1

