Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833979;
	b=noAJoCgtv6q3RBlXc6GkCrYfK43LcTmuS184tyn4fTbKkoSPpKkloMiq4rspbD7Sdhwj
	 x1EOvt17JM67S/RmZd97rMKuuLoENC8xieYljiw3EaDxyQwOgRWIyTwGSo6eIZzT7N0Bf
	 fFvW4bfEyBvZ8BIRQLezvpczLyoeVOaZ96a/7gAN/CZultl3m43T3GEzDr09Wq/UApQmL
	 6x5q4YbTzFrAUoSuboBIE4HJ15F08SwcEmeCFhn9ZoShUxgEioJPcy6Zm25MvREpeP3l3
	 h5A86D2PWeiwRif3VIamiU3siJhpkk2eti9H8wkbiz5vR6AuMb1iJUi6khPYzvBO0Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833979;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=udpG/k2WOOYI2Tmg0wK/1DslqW3ZFGmHnucKA6feJV0=;
	b=JTjkSlilyLNZq/wB9ZzbVrABaDpXfKcY5S+0Yof7deG2wMisDlXKOieGAE7Vf9psU/1c
	 MMY58tI80nzJgVQme2gFiWfbBu4FMlLe+54/Kfd/B+CB2TeQf3q7vdrdG+rb2ZSC9iKcu
	 HBRsBKR5Mb9rPn4+P0cgQmZthkvx8BrTChLFvZW7OmBw6abDyKFx2+LJRAphk5lRdsczB
	 UbFSlSLr1iWt6lc9Y+gye3/ZY0VhDyhewQDP6I1fMAmWYhFhfc7h97Yv7LaVViNYitjXY
	 NBpQHCcSKvPsHHjBoYZ6vXYRqNoB9FRKYBAroXplAmKtxlHGmIs25t7+gIauKtbchoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RlcbrB1g;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E96606A881;
	Mon, 16 Nov 2026 12:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E96606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RlcbrB1g
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=udpG/k2WOOYI2Tmg0wK/1DslqW3ZFGmHnucKA6feJV0=;
	b=RlcbrB1gyp2VqVMiWu20xdcQ2hskwnibo9+98GSCbZ75sYahk19zvEuHcEd56AoYefLFggkr7
	WXR1cDWo67N42jNqyPRG4f2dejO5wshRhU8wuBqM+X97JS319ONGKtUzL7N5jvOaaURxZVYPYOe
	1+/OUdj6ey3g/APbC+paqrQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxj3h03z1prKT;
	Mon, 16 Nov 2026 20:59:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 50FA940577;
	Mon, 16 Nov 2026 20:59:33 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:32 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <fustini@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 02/19] x86/resctrl: Use the resource-agnostic monitor event names
Date: Mon, 16 Nov 2026 20:58:57 +0800
Message-ID: <20261116125914.498841-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116125914.498841-1-ruanjinjie@huawei.com>
References: <20261116125914.498841-1-ruanjinjie@huawei.com>
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
index bd9e4cf9f7cb..fab126ae2eba 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -886,9 +886,9 @@ bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
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
@@ -968,15 +968,15 @@ static __init bool get_rdt_mon_resources(void)
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
index ffd74a68671b..57563c35d158 100644
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

