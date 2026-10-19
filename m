Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2C43E7BB2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395987; cv=none; b=LIOmmtBVCzr8o/RksWi+Ht/Bsi6IDjKy3fqicaT2vWCTfxE1ZAtJaBf6kjMrbY0oexcA2F35xadB93Ip4cP0fSU+9JFzWM5fnFh4eHbkd7Weg25F33kiZnsUQYVK+aUCCahQ1SF35Kg3S21hqdJlBg2ax0/r4DloXUzaV3B/R0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395987; c=relaxed/simple;
	bh=S3S0vbhInEZybXk/nXIg+HBgsZTSaRXujVRIZzpy9yg=;
	h=Message-ID:From:To:Subject:Date:MIME-Version; b=crWccrA2KAYoa2eMTZPpjlESumTBNB7P8S9bXAmIgSCbmB1vYmFaBkPvFDpu1ocIvxHD1NQEJiFA2SSPtUPacI4T6GkPDjtZl5vX6682vLJjkBRORazsiclurR0akqoppEzkpeCisoJN0idafdCtGCBZWtsyn+2Fxdb5JUHqITU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=jX6dDWu2; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="jX6dDWu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395980; bh=IZTIuKnPYnNAHj+Y3d/0449dK5xVdC6DsbDKWOnxtfA=;
	h=From:To:Subject:Date;
	b=jX6dDWu2sYEbNXaKGGGcTe0HUesRu7JZFj55jFw6YrNhqh0AcDG/YBf8hc1eLAqQI
	 EImGHTYBLNJeOfQNR+WAdWdFQxU4RYzO6VMNMnlCkmQ8gxtqK2gW39WfF/ZL0Hc99R
	 kHGheJTql0NpteFGfK51g2GQS4QK1kGkEPCcnv9Q=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id B90B5685; Mon, 19 Oct 2026 15:46:16 +0800
X-QQ-mid: xmsmtpt1792395976tzgxa9x7h
Message-ID: <tencent_57E8587BC53D6D65E212D1EAD6440A6AA605@qq.com>
X-QQ-XMAILINFO: MTEKjEyAppcswhOZ0PhpZaHZG+lOeHaLp8NmsZXs7b5mKFscKPOrKGEoKZhiE7
	 s04fsFnsUpl8SsZBq/Z+V46nJIBTE8pLXrii9HhanL9IKLBN4Gk78nM5jNbt2hMHJA6iB/8jzlaL
	 L+EXmYrsVcBMS8tI3agJpdnR1iKhBHv38C6JFVaDYFJUCvKcIlpNagRopZeKo+vFMIGchqLZwPcL
	 Lkj+gsG0ldnfxsoe2aYBAThksNXhO0V39BWVry7M1dAEDMoL1YTU25O9gtzmcqTirTpTp32i9Z2h
	 l1B8McEIPcvmoA/cPEZ4DXPWld+9S3A2V/TD4PJgSMJJ5D/2dpH2XZAUD5qGUtPyS8zbp6oKX7mo
	 d1/JHjZWUroOgYlSBBDIhCc0nEBtUTxuxqw7L7r+KZPb8yvXzww8O1JZx4Xj5mbtPOfggujYBw80
	 9XJoBdsgdbnoINZJTCWuQiTIQSFQyfAUAbQYne9VtJ1eZpx0r/2PpDuoWNU3d/IhVEfYwzmDHpU/
	 NS9VscLfmjKCVJY9tLcOs13sa8DHst2Yn/KtwowONPwCwOAnUuWAVU2ED8uAUnbC5AZ+sO8TZSCR
	 xi3BY1ouEvYyE/dsphCAPs1pZQOpB9tdorig4V+HU9MnpfSAHiSGMLutTIxufOIQxY1IkYBPXPas
	 330xaI3fvynYLTA1vI2J2YWP6dp8k/SE2O4lXd7ng/2FKeDpD4gcYR0nWSHDVbSkmyRcGmpfouO8
	 34NIUohhzThqyHHbsIa1UCXO8I3RqOuZm7B60qPBqERMA1fMVR7wzEENd8zN/kczXfVOkTJ8FPlR
	 PqKZ6FqtlUYkenmvgCZIxe/LwnzpERKXY3Lr5hXCTzOvfAjyJhg7BRedUAnbYO8d2fFokvU9FKLD
	 36xvLfi01ibWVdrber7nF1xJNRFYAqIQUusMrv3wxAcb87EYOILiXfa191Q00dzU2F0sXkF4d39x
	 xtDrmLFfdX42FpVQtsWTWEj7ERHe6B8Zb3E+uI3apHh9OqoibIAu1FB49Vx6viIVaAUWFDWbTYKv
	 ccgU8DegPkD3unQj3qc3tFSiSXKXqVoc1ZHHA2IZ8mXOrwNot28VDuOWNsS5o45EJ8sZ7FVP6/9M
	 /CL7PmAiziz2kXiZ69ImCeuHB5YxDfvZVsGTkrb0CnxCkg+O5oquG31hy5Ig==
X-QQ-XMRINFO: NmyfvsrRkCkJAbzJWTXK6qOFf6uNn0Tzaw==
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	reinette.chatre@intel.com,
	ruanjinjie@huawei.com,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 13/15] arm_mpam: Identify the non-aliasing controls
Date: Mon, 19 Oct 2026 15:46:06 +0800
X-OQ-MSGID: <20261019074609.2144405-1-2118537295@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

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
v9->v10:
 - Include mpam_feat_cmax_cassoc in the non-aliasing controls
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
2.43.0

