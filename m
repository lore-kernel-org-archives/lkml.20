Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603589;
	b=day5S9bYuyKp5rReVk0NhHrWDhPsxT4+Zshd1eal7p2pB8bvwo8STWyikurkjXV4bXGV
	 4O6TwdcMERrxpO092j1gK0sp+chiRsjCksL2+/fb+U3jgbtKPeXXxEC3BiE4R2/HL5IRF
	 TnS6Q2sHbpkR1fuUwPtPI97fZJ6D0zK+WVDLutDE6fCzClRk+WkhBzm5Jng5QlfR8DiVI
	 01iBR8t9Lq3uROwrJoNP2sbKxwTqHHabPITJr8YzpNUTQppTMPPsUQp76y8fhnZ+Ppp3l
	 Drv2YWJcaVQ6Vqjz3rwdhZ38JkPQ9sNqwhPJMEPhYvw8a6amMWXcN+ordQJGitznvaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=C1/iihW28aNu18mLJFGbicoB+M36ExxUuA1vjoQI5nY=;
	b=J+imrwQVsO9hgdLsfMXhfnuHDAeaIKPJ6U6dAksDnp6wA7OGA8vfjqHcWgUIqAldbkWb
	 V2l4tlvJ2GcMxAYvB98Bgcj+tVG0lk/k9h0DFi7XBwL+MfCb3z41JXc+N+jbaAY3DvDw6
	 5melZ2M0ppnz/iqnTwCZQaCqzhDnkoTuyqHQYIXFfmDu44/uvg/EG/jgoq8oOpK3EhxSJ
	 1ITpqArXonUN/d3JbrCDtDF7tALjxN7mon8+um7NOZeABQUYT8PK8RhDu4hkEo6p5Gkef
	 qByVoTRDScrxoGmY9AIkumJh8koNRmJmARoAHjQbfMrT6XGSkRuB4cTBHkG+i15FmFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eidvB0Vp;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCB3606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABCB3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eidvB0Vp
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so1529466b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793603588; x=1794208388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C1/iihW28aNu18mLJFGbicoB+M36ExxUuA1vjoQI5nY=;
        b=eidvB0Vpa70v1cwUSwnoJ0UT6Xa0Hs+vvRR3vAkJPP+bLWIlO8jeh1Fn01uYpPVqSx
         ak51EqaXABwPjPjw9/sUJWfx/IA6izR+TRm70mT9cfKgzixGWFbID1J41cCiWiU+TbJV
         dAkcw8mVsz1M/y3zLfBPuF13SDHiBPZ98oEo6i3ekjCx4nxUvcygwYpmCeet9aOYfk2I
         t8IwwBamo5KNaojpdJUUAhebxM7yupyRvwld4YDts1XlekMuBqOWwVdQ+7d8FOOUd5dg
         Qy3W6Eyn/kjkxjkBdnIktyuUB5bXYdrWnNDlNwNm8wtr9SjIK5EmhYdDeR3d+GWvfYdr
         YXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603588; x=1794208388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1/iihW28aNu18mLJFGbicoB+M36ExxUuA1vjoQI5nY=;
        b=TMW4uDv2mKbJL9/rLVZH73spgjSDprSAWZuRpbb7+Li60Pxi9FRh+J/cJHbZKHUrSa
         uqZlye5LNG7su9IJ2ObgEVgK40UjTd5rKFNuNOCASpjzDO3ud7foCxKVplC0pImf5jBA
         PGxGWoOzFy5y155pCtQOE6ROWS7vriTe1/moJB5XDeY/lMld+wtvPhmPJIhjfiIXRrLr
         4RTS9qZINtbbbhA6YfrX/kDpF+Iv7eHT5lyAA65RU343a3B06HnIhxr4easSAtKcAHI2
         0R4ivg/oV6k85g6AB+idWKVEi7S/KTRdOQ/9Ri0XPCOZjWRwC6v4bUWc0E7iCNm+AyuQ
         pC+g==
X-Gm-Message-State: AFq9FYKUE/prHzCS+gsFUdFtdxbRxytmGL+o4lcI9ZXakHP8V5EnaTA/
	Nbq0x+Mb+xIrq9eqdGFxPTMh/dauKse06IFgeEHNPCKoNzkC+Tf1ICdz9qO47h4S
X-Gm-Gg: AYBFou0vlw40yOctt01IW0ivFWx/a/Lg651908cL32tyvh6tkxrNmDAC40JlHoKt8WW
	N2BCt0qqUAxOKZAPcBHnWyafz8A1Ybt6vy47c0UUTC4ZQ4OcFHe4yDGLLIh08UUOwWJnLE4rbrx
	OwW5jEoV9tRe5z/H2cXs3rTcXwH/JfcuAMKnpAEoD4I9/ORrnMA9ba5xS0oO5kkHMHUsifmRlgs
	EPxLIKKlhEPY+s2z2W2beCKVaV6YqKZH+KdJlZobnd4wxaql6zMkbMGwpLKeZQ/PY0aI52RAsyq
	ysGaV3c2anVOmz8DfKHlCuaAGJp64B7qFnvK1HTD1XuQHLhAGOwzPeQj+x/0PblfxRaCkpQpAA8
	SJMt2CtehEBU39e7NHLT8VekdLiO9Pz++q0hjlw/zd8RMI+3S6VXskFW6nnQlDziCsVWCmD3lDH
	bhCVE96mbf2tYC0WdnYGxziBP5ZYCukizeIBCdnUPdT8BVCM3PyUVLPbQAqvuAKGh/UOl7gV4GW
	NFZHZO2bWb1XWKJ6ihKfl6HQJKjZImU7lWDKkjrkxaC5YrDgb6w14pKCXQSIFiw2dxanMKw/NLX
	/JCk5rheR707AKbkX4uZWt2auCepCRRbAg==
X-Received: by 2002:a05:6300:67c7:b0:3e2:47ab:6a25 with SMTP id adf61e73a8af0-3e9289d5d85mr8302838637.46.1793603587953;
        Sun, 01 Nov 2026 23:13:07 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096fcf15sm2660232a12.18.2026.11.01.23.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:13:07 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor supports it
Date: Mon,  2 Nov 2026 15:13:00 +0800
Message-Id: <20261102071300.554160-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
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

An MSC of ours implements the MBWU monitor without PMG support:
MPAMF_MBWUMON_IDR.NO_MATCH_PMG is 1, so MSMON_CFG_x_CTL.MATCH_PMG is
RES0. On this hardware resctrl monitor reads always returned 0.

Tracking this down: __read_mon() unconditionally sets match_pmg,
because the resctrl (closid, rmid) model maps rmid to PMG. The
expected configuration generated by gen_msmon_ctl_flt_vals() then
contains MATCH_PMG, but the hardware ignores the bit, so the
configuration read back never matches, config_mismatch is always
true and the monitor is reprogrammed on every read - the counter
never accumulates.

The architecture allows an MSMON implementation without PMG
support, so read the NO_MATCH_PMG bits during probe and only
program MATCH_PMG when the monitor supports PMG filtering,
falling back to filtering by PARTID only. The CSU monitor has
the same issue and is covered the same way.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c  | 22 +++++++++++++++++++++-
 drivers/resctrl/mpam_internal.h |  4 ++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..2086ff121b59 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1089,6 +1089,9 @@ static int mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 				if (FIELD_GET(MPAMF_CSUMON_IDR_HAS_XCL, csumonidr))
 					mpam_set_feature(mpam_feat_msmon_csu_xcl, props);
 
+				if (!FIELD_GET(MPAMF_CSUMON_IDR_NO_MATCH_PMG, csumonidr))
+					mpam_set_feature(mpam_feat_msmon_csu_match_pmg, props);
+
 				/* Is NRDY hardware managed? */
 				err = mpam_ris_hw_probe_csu_nrdy(ris);
 				if (err < 0)
@@ -1118,6 +1121,9 @@ static int mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 				if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumon_idr))
 					mpam_set_feature(mpam_feat_msmon_mbwu_rwbw, props);
 
+				if (!FIELD_GET(MPAMF_MBWUMON_IDR_NO_MATCH_PMG, mbwumon_idr))
+					mpam_set_feature(mpam_feat_msmon_mbwu_match_pmg, props);
+
 				has_long = FIELD_GET(MPAMF_MBWUMON_IDR_HAS_LONG, mbwumon_idr);
 				if (has_long) {
 					if (FIELD_GET(MPAMF_MBWUMON_IDR_LWD, mbwumon_idr))
@@ -1309,6 +1315,20 @@ static int mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
 	return __mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
 }
 
+static bool msmon_supports_match_pmg(struct mon_read *m)
+{
+	switch (m->type) {
+	case mpam_feat_msmon_csu:
+		return mpam_has_feature(mpam_feat_msmon_csu_match_pmg, &m->ris->props);
+	case mpam_feat_msmon_mbwu_31counter:
+	case mpam_feat_msmon_mbwu_44counter:
+	case mpam_feat_msmon_mbwu_63counter:
+		return mpam_has_feature(mpam_feat_msmon_mbwu_match_pmg, &m->ris->props);
+	default:
+		return true;
+	}
+}
+
 static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
 				   u32 *flt_val)
 {
@@ -1322,7 +1342,7 @@ static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
 
 	*flt_val = FIELD_PREP(MSMON_CFG_x_FLT_PARTID, ctx->partid);
 
-	if (m->ctx->match_pmg) {
+	if (m->ctx->match_pmg && msmon_supports_match_pmg(m)) {
 		*ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
 		*flt_val |= FIELD_PREP(MSMON_CFG_x_FLT_PMG, ctx->pmg);
 	}
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..88cd5ac4cde3 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -227,12 +227,14 @@ enum mpam_device_features {
 	mpam_feat_msmon_csu,
 	mpam_feat_msmon_csu_capture,
 	mpam_feat_msmon_csu_xcl,
+	mpam_feat_msmon_csu_match_pmg,
 	mpam_feat_msmon_mbwu,
 	mpam_feat_msmon_mbwu_31counter,
 	mpam_feat_msmon_mbwu_44counter,
 	mpam_feat_msmon_mbwu_63counter,
 	mpam_feat_msmon_mbwu_capture,
 	mpam_feat_msmon_mbwu_rwbw,
+	mpam_feat_msmon_mbwu_match_pmg,
 	mpam_feat_partid_nrw,
 	MPAM_FEATURE_LAST
 };
@@ -645,6 +647,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
 
 /* MPAMF_CSUMON_IDR - MPAM cache storage usage monitor ID register */
 #define MPAMF_CSUMON_IDR_NUM_MON	GENMASK(15, 0)
+#define MPAMF_CSUMON_IDR_NO_MATCH_PMG	BIT(22)
 #define MPAMF_CSUMON_IDR_HAS_OFLOW_CAPT	BIT(24)
 #define MPAMF_CSUMON_IDR_HAS_CEVNT_OFLW	BIT(25)
 #define MPAMF_CSUMON_IDR_HAS_OFSR	BIT(26)
@@ -655,6 +658,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
 
 /* MPAMF_MBWUMON_IDR - MPAM memory bandwidth usage monitor ID register */
 #define MPAMF_MBWUMON_IDR_NUM_MON	GENMASK(15, 0)
+#define MPAMF_MBWUMON_IDR_NO_MATCH_PMG	BIT(22)
 #define MPAMF_MBWUMON_IDR_HAS_RWBW	BIT(28)
 #define MPAMF_MBWUMON_IDR_LWD		BIT(29)
 #define MPAMF_MBWUMON_IDR_HAS_LONG	BIT(30)
-- 
2.34.1

