Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489201;
	b=GS8MlAEkULi89Uf364dshjyE0GgeMWvPUf7eopiAzBEqQ7BdXHEukLdu0e2m441mfDhU
	 SdmMDudS4RkB86+fUiobVBRlQ39aaLp6XA+aRFDv7cMHCwMf/SuNutHrlBf0g5EJNH2Zc
	 oJk0kBVJi4L9J1/TCSeSKO7P5QtsTWhavtlmYpJH+Ws76H5wm4VSrr/tyvBCiLM7aYy7n
	 0X2egyQkur9hTWmgX+w2YmP+n01V7pHZ1u80Bajgsf4g5cGF5whXBFyizLTu0j2WolPJf
	 K9ETG57Cyx2tdFSBjgdABsJESVtNC1ZAKds+sF4Sm5FGJAVHtfxPjd3HASpbvDnoTWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489201;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=BCDGiFTL7bEho1teaaR+h3F3jJTu4tY+KLRp0jIgfEk=;
	b=3iLc9uysoK749GNKMJUnVGLaSm1Mt8AqthZGy+R5CMVt5odmOm6QH3GJS336/5DFhgd9
	 cYErZE4mAzG6x9Hio1aa3rMnrfQXm+u5TetQqJUNVf+IbbBAwGMNQPI9a4F/89oG0w0oz
	 TrpgsG7dzSBFiYyHxf+UwATywbNMYpy5UntVwXFSUCXb5Cd+FRBcpYEMvfUnP0FKOhpRX
	 A3BlAK1o0MWDjbjWGwzin7YUmjL2iT5QUHeKRpOm9UP6nYPK4E5A1ArWZE6GgVyh7NqC4
	 pkWP70njZSvYHDxlFCH9QtV7Tzk8CYfUEaAB2tBV+n0FGw2sNvxNQ7hrluZGmPHjN6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Uq9jxE24;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD074606A88B;
	Thu, 12 Nov 2026 13:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD074606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Uq9jxE24
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BCDGiFTL7bEho1teaaR+h3F3jJTu4tY+KLRp0jIgfEk=;
	b=Uq9jxE24HjGXST5HHEpVr7kDwwuMKs4eg6oQ+GgM41GKEF97mVDdLaC679k0FF2FVirVEkGwo
	FEU41UYnLHVs7CZ/51h4d4eveoQMWtb/l4+JLZrqUPCJH4H4xW4ZVbDzcemKNHH4/zTLjBf7Sn3
	E2cuTckOB69GvTREopDm3zI=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jQLQx07b9z1T4KS;
	Thu, 12 Nov 2026 21:12:41 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5E7B840538;
	Thu, 12 Nov 2026 21:13:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:11 +0800
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
Subject: [RFC PATCH v2 1/9] fs/resctrl: Extract the software controller's step decision
Date: Thu, 12 Nov 2026 21:12:46 +0800
Message-ID: <20261112131255.4043381-2-ruanjinjie@huawei.com>
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

Move the condition that picks the next control value out of
update_mba_bw() and into a helper of its own.

No functional change intended.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 54 ++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..75abbf90d090 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -661,6 +661,38 @@ static struct rdt_ctrl_domain *get_sc_ctrl_domain_from_cpu(int cpu,
 	return NULL;
 }
 
+/*
+ * Pick the control value for the next interval: step down while the
+ * measured bandwidth is above the target, and step up when the target is
+ * above the bandwidth the next step up is expected to yield.
+ *
+ * Always increase throttling if current bandwidth is above the target set
+ * by user. But avoid thrashing up and down on every poll by checking
+ * whether a decrease in throttling is likely to push the group back over
+ * target. E.g. if currently throttling to 30% of bandwidth on a system
+ * with 10% granularity steps, check whether moving to 40% would go past
+ * the limit by multiplying current bandwidth by "(30 + 10) / 30".
+ *
+ * Return: true when the control value changes, false otherwise.
+ */
+static bool mba_sc_next_ctrl_val(struct rdt_resource *r_mba, u32 cur_msr_val,
+				 u32 cur_bw, u32 user_bw, u32 *new_msr_val)
+{
+	if (cur_msr_val > r_mba->membw.min_bw && user_bw < cur_bw) {
+		*new_msr_val = cur_msr_val - r_mba->membw.bw_gran;
+		return true;
+	}
+
+	if (cur_msr_val < MAX_MBA_BW &&
+	    user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) /
+		       cur_msr_val)) {
+		*new_msr_val = cur_msr_val + r_mba->membw.bw_gran;
+		return true;
+	}
+
+	return false;
+}
+
 /*
  * Feedback loop for MBA software controller (mba_sc)
  *
@@ -737,27 +769,9 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_l3_mon_domain *dom_m
 		cur_bw += cmbm_data->prev_bw;
 	}
 
-	/*
-	 * Scale up/down the bandwidth linearly for the ctrl group.  The
-	 * bandwidth step is the bandwidth granularity specified by the
-	 * hardware.
-	 * Always increase throttling if current bandwidth is above the
-	 * target set by user.
-	 * But avoid thrashing up and down on every poll by checking
-	 * whether a decrease in throttling is likely to push the group
-	 * back over target. E.g. if currently throttling to 30% of bandwidth
-	 * on a system with 10% granularity steps, check whether moving to
-	 * 40% would go past the limit by multiplying current bandwidth by
-	 * "(30 + 10) / 30".
-	 */
-	if (cur_msr_val > r_mba->membw.min_bw && user_bw < cur_bw) {
-		new_msr_val = cur_msr_val - r_mba->membw.bw_gran;
-	} else if (cur_msr_val < MAX_MBA_BW &&
-		   (user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) / cur_msr_val))) {
-		new_msr_val = cur_msr_val + r_mba->membw.bw_gran;
-	} else {
+	if (!mba_sc_next_ctrl_val(r_mba, cur_msr_val, cur_bw, user_bw,
+				  &new_msr_val))
 		return;
-	}
 
 	resctrl_arch_update_one(r_mba, dom_mba, closid, CDP_NONE, new_msr_val);
 }
-- 
2.34.1

