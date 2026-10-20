Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503808;
	b=aelgeLQIkkRtFWmAcxuuGVROiPbIjpbTuNL+3ToHnJNp/zS+9vhM4NtAGHk84KZWOvoa
	 5EYSDOp0fz22ifCyM2EE9+lbS0aVk4ZlwqHtEPzqIWRPpLv/6XcHwe+8dCfm8IN3kn6jy
	 ZGpww75IsD7WlA31kyiAHjGunT8yAlbUFcP8q8eRjLYjB10Y1XJzyfQB67JONWS4+Lnbu
	 DoVr1ZNqb8VxcYADtjfwRKm8YmWgDWv93wITPwdMnCnCCUshdaUlY8uHfQBat1oQqgEaZ
	 lG2/3Yu0gvXRAmscA5WEQ0+oRmp/flhZDa0o93DNDvZROau5R3gu5qX5SbU3M9RL1hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503808;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=t50pMJ4gly4X4LIXX35oD9QssFdz0M+3l25cKCYk210=;
	b=XNd7iJURZ+IgWeH1uJeEhKYOWNjqx8MKt9qxSvvD1/UskEzMIdETAiPbJzlhrl2UCAvS
	 +RZ0Ewmb0YOGxn9iLhMm3Sv82PniQNZxAGT0zZVjeglMLfr5HuKzgmyMnmOtlmrZ/7yse
	 wz5l6XTPWQw6HRYgNK4tOvXc8zty/wvQYalBV7vv1NA6G3ldCw7lrMcqLKZqw+yjHMvIh
	 7Pjbm2l90Xyn+4aa3mRnWtIrE/tS7+2r1em5O3b3alkPoaeBefZC1hcjkp1oLqxeL4PAW
	 IfS65IFiEnykbwAcxCsTpOajRxAAWI/Oyhq5ca7fFld2eYRJZe286wBwYIChBzSzAqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GJYmy0NU;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7EA60A4AD4
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A7EA60A4AD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GJYmy0NU
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=t50pMJ4gly4X4LIXX35oD9QssFdz0M+3l25cKCYk210=;
	b=GJYmy0NUm+XMA/ed1CketUsnXk8OYqu2ag9PxGlRBJ9l5HW7LNU9qVksM7H0SNRk/ZbzUahYi
	ZTZuO71Uh4m6w10Hu4v0vYhOzB4o9J/Jflh4VVqA7uNGK0bLsX8CZwenhJllDrwg/3O9/D56/pK
	jVJWLv7dau0Ev2eD1XrIjQY=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4j8Cxq1zNLz1cyV5;
	Tue, 20 Oct 2026 21:31:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7712E4056A;
	Tue, 20 Oct 2026 21:43:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:17 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 13/15] arm_mpam: Identify the non-aliasing controls
Date: Tue, 20 Oct 2026 21:42:37 +0800
Message-ID: <20261020134239.3921377-14-ruanjinjie@huawei.com>
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

A non-aliasing control can't be presented by writing the same value to
several PARTIDs, because its value is additive. This is used later to
decide whether a class's non-aliasing controls must be dropped before
its PARTIDs can be used as separate monitoring groups.

A control that aliases shares the resource, so writing the same value to
each PARTID keeps its meaning. Several PARTIDs that map onto one
internal PARTID are configured as one, so a class that implements
narrowing does not have this problem.

Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
Suggested-by: James Morse <james.morse@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_internal.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 5a7590568a05..a4f2fdf7ac95 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -221,6 +221,25 @@ struct mpam_props {
 #define mpam_set_feature(_feat, x)	__set_bit(_feat, (x)->features)
 #define mpam_clear_feature(_feat, x)	__clear_bit(_feat, (x)->features)
 
+/*
+ * A non-aliasing control (e.g. a cache capacity) can't be presented by
+ * writing the same value to several PARTIDs: its value is additive, two 50%
+ * values add up to 100%. An aliasing control (e.g. a cache portion bitmap)
+ * shares the resource, so the same value written to each PARTID keeps its
+ * meaning.
+ */
+static inline bool
+mpam_props_has_non_aliasing_controls(const struct mpam_props *props)
+{
+	return mpam_has_feature(mpam_feat_mbw_max, props) ||
+	       mpam_has_feature(mpam_feat_mbw_min, props) ||
+	       mpam_has_feature(mpam_feat_mbw_prop, props) ||
+	       mpam_has_feature(mpam_feat_cmax_cmax, props) ||
+	       mpam_has_feature(mpam_feat_cmax_cmin, props) ||
+	       mpam_has_feature(mpam_feat_cmax_cassoc, props) ||
+	       mpam_has_feature(mpam_feat_cmax_softlim, props);
+}
+
 /* Workaround bits for msc->quirks */
 enum mpam_device_quirks {
 	T241_SCRUB_SHADOW_REGS,
-- 
2.34.1

