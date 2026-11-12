Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489201;
	b=T+quRZ3w6wnRdY/YrNI5Uh3tcEsHhlxFhaJorUK2LIcjH/NakaAMo8iXDkTr8whVCih7
	 ofqltCiNRHBr2eWfs95CwjuKmUEKpFZUZj8wfhHMYZpTc3ok3oRQsH4lgyggu9quUz6fC
	 ogZMcBjGE47TYm/wtKPVHFzkQpWD6slbLOVFpv1g+pGjaWDZyLROMktv44HPF1cU2rlBX
	 35DCjJVxHfD42UqGsOh5QPBFwsFBEKe9ngsG4cEJH32ejzXj+nleOUjLhbHyKUxmjossm
	 zoZCY3GS5ePPCRuI7clcD9tDG/hZ8BifLMdT9xmZAhYHR+qdUhyB1gmZFddwS5SGEhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489201;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=6acSEnx31ZpF8ZCofAwjIOc966ljCuA8OHwj+0KmIBQ=;
	b=s0OLrWnkcA9q1OhTzn2Nsy4GXNZ/NR8nQq1h1rrjfY9AuEYqSTe8QqQLkuzaPN3SBYts
	 mEnURTfsI8cnOKGfRb2XIu+buOVKi3LbiKnOtw3aWb3Hfz7P1ondH2QwXzh/whQVbfwxk
	 JqnchDZsx6fvcyt3eH4MPKc2CoP01sy2AluMU2b15/v7MCyGvGbCFC1CY7vjxfNTwZKxq
	 YHGwP4fnbGsPl0u4Rbf+3RvbGp5Gsa/0XAQt1im27VXHfjYdc3oNEfyukC3/infdrDn3s
	 btu0lCSVnLn2PmjQY+4TjP/K53X7WCyO90a/ccNOnq47vIT3BeVM4CodW8kKzJeK/Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="Mf72qHs/";
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E9E606A883;
	Thu, 12 Nov 2026 13:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E9E606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Mf72qHs/
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6acSEnx31ZpF8ZCofAwjIOc966ljCuA8OHwj+0KmIBQ=;
	b=Mf72qHs/NleZGLu7cDvFBd3q07JWbJCY8DRoHRqvqnOTE3Pm2RvojamYDSE/f4fh4vmFEHEL6
	nW6yIVkqiDKOoeFleC5nPG8rr8tSDUyzMW01GHwSZ+vVvTnpPxxRsIJQx07GL4amXDsCJpFav3I
	ffjzO7aMwDy+mQjrsbG3ljA=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jQLRK4DHmzLlth;
	Thu, 12 Nov 2026 21:13:01 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 817DD40572;
	Thu, 12 Nov 2026 21:13:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:16 +0800
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
Subject: [RFC PATCH v2 9/9] arm_mpam: Cap the CLOSID/RMID space by the bandwidth counters for mba_MBps
Date: Thu, 12 Nov 2026 21:12:54 +0800
Message-ID: <20261112131255.4043381-10-ruanjinjie@huawei.com>
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

MPAM assigns each monitor group a bandwidth counter from a shared pool
when the group is created, but the number of groups comes from the
PARTID and PMG spaces. Once the pool is empty, new groups get no
counter, their reads fail with -ENOENT, and the MBA software controller
cannot keep them below their target.

While the controller is enabled, cap the CLOSIDs and the RMIDs per
CLOSID to the number of counters, shrinking the RMIDs first and keeping
one per CLOSID for the default monitor group. CDP hides the MBA
resource, as MBW_MAX is configured per PARTID and the two PARTIDs of a
CLOSID would alias, so the controller cannot be enabled together with
CDP and the cap needs no CDP adjustment.

resctrl_arch_get_num_closid() reports the capped CLOSIDs,
resctrl_arch_rmid_valid() refuses the RMIDs above the cap, and
resctrl_arch_set_mba_sc() updates num_rmid and the limbo threshold.
Without mba_MBps nothing changes.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 48 +++++++++++++++++++++++++++++++++-
 include/linux/arm_mpam.h       | 10 ++-----
 2 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 53fcffb23984..1e23a9a41ea9 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -62,6 +62,14 @@ static DEFINE_MUTEX(domain_list_lock);
  */
 static bool cdp_enabled;
 
+/*
+ * The CLOSIDs and the RMIDs per CLOSID resctrl may use while the MBA software
+ * controller is enabled. Set by resctrl_arch_set_mba_sc().
+ */
+static u32 mpam_capped_num_closid;
+static u32 mpam_capped_num_rmid;
+static bool mba_sc_enabled;
+
 /*
  * We use cacheinfo to discover the size of the caches and their id. cacheinfo
  * populates this from a device_initcall(). mpam_resctrl_setup() must wait.
@@ -271,7 +279,7 @@ static bool mpam_resctrl_hide_cdp(enum resctrl_res_level rid)
  */
 u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
 {
-	return mpam_partid_max + 1;
+	return mba_sc_enabled ? mpam_capped_num_closid : mpam_partid_max + 1;
 }
 
 u32 resctrl_arch_system_num_rmid_idx(void)
@@ -290,6 +298,12 @@ void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 	*rmid = idx % (mpam_pmg_max + 1);
 }
 
+/* The CLOSID is already capped by resctrl_arch_get_num_closid(). */
+bool resctrl_arch_rmid_valid(u32 closid, u32 rmid)
+{
+	return !mba_sc_enabled || rmid < mpam_capped_num_rmid;
+}
+
 void resctrl_arch_sched_in(struct task_struct *tsk)
 {
 	lockdep_assert_preemption_disabled();
@@ -1154,6 +1168,38 @@ static void mpam_resctrl_pick_counters(void)
 	}
 }
 
+/*
+ * The controller needs a bandwidth counter for every monitor group, so while
+ * it is enabled cap the CLOSIDs and the RMIDs per CLOSID to the number of
+ * counters, shrinking the RMIDs first. The number of monitor groups changes,
+ * and so does the limbo threshold. CDP hides the MBA resource, so it cannot
+ * be enabled together with the controller and needs no adjustment here.
+ */
+void resctrl_arch_set_mba_sc(bool enable)
+{
+	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
+	struct rdt_resource *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res;
+	u32 num_closid = mpam_partid_max + 1;
+	u32 num_rmid = mpam_pmg_max + 1;
+
+	if (enable && mon->class) {
+		u32 num_mon = mon->class->props.num_mbwu_mon;
+
+		num_closid = min(num_closid, num_mon);
+		num_rmid = clamp(num_mon / num_closid, 1U, num_rmid);
+	}
+
+	mpam_capped_num_closid = num_closid;
+	mpam_capped_num_rmid = num_rmid;
+	mba_sc_enabled = enable;
+
+	l3->mon.num_rmid = num_closid * num_rmid;
+
+	if (resctrl_rmid_realloc_limit)
+		resctrl_rmid_realloc_threshold =
+			resctrl_rmid_realloc_limit / (num_closid * num_rmid);
+}
+
 static void __config_cntr(struct mpam_resctrl_mon *mon, u32 cntr_id,
 			  enum resctrl_conf_type cdp_type, u32 closid, u32 rmid,
 			  bool assign)
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 73a6277f688c..7c939a6f670b 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -62,14 +62,8 @@ bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
 u32 resctrl_arch_system_num_rmid_idx(void);
-
-/* MPAM does not limit the RMIDs for the MBA software controller yet. */
-static inline void resctrl_arch_set_mba_sc(bool enable) { }
-
-static inline bool resctrl_arch_rmid_valid(u32 closid, u32 rmid)
-{
-	return true;
-}
+void resctrl_arch_set_mba_sc(bool enable);
+bool resctrl_arch_rmid_valid(u32 closid, u32 rmid);
 
 struct rdt_resource;
 void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
-- 
2.34.1

