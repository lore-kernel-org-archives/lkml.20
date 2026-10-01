Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65AE3CAE8D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790830878; cv=none; b=U89izeD+vHbWjZL830s29N0tBy3Z5C6Goi+yHXNYm05yVaKVCOqArfU5+GDsp/LjFzMSlju2TVyKx+d5/46EiwCuFwRkEU63K/yxH0xgMxruRS2XUBfeXWh7jwKgGFy0L5raovGhnr5sv3DR2lp37TRO94twbcOA7iNYvEU5w/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790830878; c=relaxed/simple;
	bh=8YZJ69ey0sPd+XzFNKSH5elxOenalI+CtLxC5znIJ+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DK6nSFvKwWwGsa0O3E8F7k2rGCyHpwIOAtdk5GDS4RdExBOuPvooie3WLfPriWiukA4lyK8kvfw4ZH1orA38Qn4+Fd3q4K4REjNkrmIVKmALO3599BA8AVL6LjeC6t5aCj9T3y/I0lcgFOuJiEk1OLImzS06lrMm4oiPmwK5cGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDt35WUa; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDt35WUa"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f9bso29225495ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790830876; x=1791435676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP7oNfhQpc8o2+FdFv2zFrXCBPchs9tdxw8AkWMX6rc=;
        b=JDt35WUaZmXzC6q8LMCJF8R/KU9Px3eRLWpaUnfazyID19xUUitmGq9lqy7OxxVoDn
         kSTxAfMObA32BqFEtZsCr82meQ3KluKv5KE+aDQbb33dTo/15QH8tz3GL/2uylo4O1ld
         UoQNM4boRh/F0jM7yEq3P/SUIj3UI/8CBIMpxZtZlaxGcG4WvkxCpmJxoAf+XqxvOlqt
         L1FhD2tEIXpZUodxvXspIaqcCcJVPk0Y/E8mb27ZS96qEMaDa/J0XlVz6jDglssF9M/N
         eK2zKbThCmaZwT7uWOnu8ru6Oyd6xa2Zsdgv6V2esu2TdnjJM2shsfCxfRlBMklHH+o/
         Drkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790830876; x=1791435676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SP7oNfhQpc8o2+FdFv2zFrXCBPchs9tdxw8AkWMX6rc=;
        b=Uwmtxyf2tatG9ubiff026PUbXyz3aa+7V8gE5/O557DFevh8vxKJVTl/QP2sdOYmRK
         exmDquIPsHOxd4igckkhiVoaoKhFHOF41aXLAHoRVcogDbpy4cjieAIiZqJesNfvgboS
         X+lKjn0hxw7MY/sRB1paRFb/xoALfnFG/MP4AJu7YXso/sv2IrbD4WoRsHoYM68szzBQ
         kjmjLGn3ZQ55gRYSDQCv9tb4dOA6/nEjtyZtWXhxG97y9RjXuJVbsaaD5evczQiF/oD5
         7iVFCGj+LDAWF8i/3JfZBEZvuNE102xdLi88pE7dEblCrjM15gq9N1RQtb57rBqR2UeN
         tiYQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6DGzJk6UjG/rPkg3CuzpPascZcDV/CYJ/hVMh0MW29U8v22PrSvtP+BavWCsz+jpgzPtg5BR/tzwC1ps=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFhjjvyp3rzHFRYoNkNWRXF5MjCsQFsTghNeD1Q66dpkUZoSa9
	PMNBt1P+yo321RRvHK04OhYb0UTnYRmJ08DpCAJ2s8NN4CuWc0sMs7Ot
X-Gm-Gg: AYBFou2fm1dqoSkqmUWI9mQUIS94s6BwBlyAGsgY9io+aUy86TXR4MetDSm4BSRz9CE
	fwXSWvtagQBvKGrD7yMmgowd4yyQOxYyptwpbrh/H49RBveQd5YCF8EAxIQ4sRhP1hP8mewSfe3
	bz6epCxj/chu1TeqAaq8Vq8HKT0VgFiE+wWVgD+EXus33pJDUoVxWliB8dDU8Rsvw2bwUhfAvVd
	SGA1bbcSteJJI5GgQ6puYj0+CCTFe48AKC7g0qz/5TmFQlBhZU612red1xSDTwGr5AmWQSER5+c
	Dn7l6OerYCZ9atgQRjoCem6Ku0eJAzqQ0PYKfakqQWvOmtv1NZ+y1Ldp4JXZy/kxABgNus3flvt
	RLOczaEZZA0FeVciQsLh54Jq4g1+OZMhnLMTewmHVX34zs26tdUESN+Oj5vt+pDg5nRE0HAWozD
	Ot9NRcRt4pzxbcJX8sbKQiR5q7WssoReFW4MHMl7vyv47kYz+aFOgrAKUU34jBuy3bqGXAtyowf
	M9Ty7uJynI=
X-Received: by 2002:a17:902:ebc6:b0:2dd:c100:7cc8 with SMTP id d9443c01a7336-2e2e4b34ae1mr32499205ad.68.1790830875905;
        Wed, 30 Sep 2026 22:01:15 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b21912sm5112085ad.54.2026.09.30.22.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:01:15 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Daniel Gabay <daniel.gabay@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v2 1/2] wifi: iwlwifi: mvm: Fix GP2 to nanoseconds overflow on 32-bit
Date: Thu,  1 Oct 2026 13:01:02 +0800
Message-ID: <20261001050103.860584-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001050103.860584-1-zhanxusheng@xiaomi.com>
References: <20261001050103.860584-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scale_update_gp2 and gp2_on_air_rise are u32 GP2 timestamps in
microseconds.  NSEC_PER_USEC is 1000L, so on 32-bit the products are
computed in 32-bit arithmetic and truncated before being widened:

	u64 last_gp2_ns = mvm->ptp_data.scale_update_gp2 * NSEC_PER_USEC;

A GP2 value above (U32_MAX / 1000) us, i.e. 4.295 s, wraps.  GP2 is a
free-running counter that wraps every 2^32 us, so almost its whole range
is affected and the PTP clock jumps.

The neighbouring conversions in the same files already cast:

	gp2_ns = iwl_mvm_ptp_get_adj_time(mvm, (u64)gp2 * NSEC_PER_USEC);

Cast the remaining ones the same way.  The i386 build of
iwl_mvm_ptp_get_adj_time() changes from "imul $0x3e8,...,%ecx" to
"mull", i.e. from a 32-bit product to a 32x32->64 one.

mvm/ptp.c:219 is already u64 and needs no change.

Fixes: a2f49f7d52a9 ("wifi: iwlwifi: mvm: implement PHC clock adjustments")
Fixes: 0e49e940d1bc ("wifi: iwlwifi: mvm: add an option to use ptp clock for rx timestamp")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 drivers/net/wireless/intel/iwlwifi/mvm/ptp.c  | 4 ++--
 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/ptp.c b/drivers/net/wireless/intel/iwlwifi/mvm/ptp.c
index 49dcb1388007..5f33e2f8fb2a 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/ptp.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/ptp.c
@@ -47,7 +47,7 @@ static void iwl_mvm_ptp_update_new_read(struct iwl_mvm *mvm, u32 gp2)
 u64 iwl_mvm_ptp_get_adj_time(struct iwl_mvm *mvm, u64 base_time_ns)
 {
 	struct ptp_data *data = &mvm->ptp_data;
-	u64 last_gp2_ns = mvm->ptp_data.scale_update_gp2 * NSEC_PER_USEC;
+	u64 last_gp2_ns = (u64)mvm->ptp_data.scale_update_gp2 * NSEC_PER_USEC;
 	u64 res;
 	u64 diff;
 
@@ -259,7 +259,7 @@ static int iwl_mvm_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 	 */
 	gp2 = iwl_mvm_get_systime(mvm);
 	data->scale_update_adj_time_ns =
-		iwl_mvm_ptp_get_adj_time(mvm, gp2 * NSEC_PER_USEC);
+		iwl_mvm_ptp_get_adj_time(mvm, (u64)gp2 * NSEC_PER_USEC);
 	data->scale_update_gp2 = gp2;
 	data->wrap_counter = 0;
 	data->delta = 0;
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c b/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
index c01c704929ba..e9146c38a81c 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
@@ -2021,7 +2021,9 @@ static void iwl_mvm_rx_fill_status(struct iwl_mvm *mvm,
 
 	if (mvm->rx_ts_ptp && mvm->monitor_on) {
 		u64 adj_time =
-			iwl_mvm_ptp_get_adj_time(mvm, phy_data->gp2_on_air_rise * NSEC_PER_USEC);
+			iwl_mvm_ptp_get_adj_time(mvm,
+						 (u64)phy_data->gp2_on_air_rise *
+						 NSEC_PER_USEC);
 
 		rx_status->mactime = div64_u64(adj_time, NSEC_PER_USEC);
 		rx_status->flag |= RX_FLAG_MACTIME_IS_RTAP_TS64;
-- 
2.43.0

