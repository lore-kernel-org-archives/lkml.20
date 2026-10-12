Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D83939D2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781530; cv=none; b=skJj5Unc8v2PCZG23OFKmEnrX8c35YMN4AwfzYcB4e6JLZTfU4LUZk+BbjN9wmRm2LMSbmAy1+3nffMhN28vcU4b3LcuOj+xy8rMn9tGbKOPdmrYRD0vsOZiZFG3eX7FfJWfA7tef61fy9eSKWAHt8NQWpGfjOb+5Dpbrac+OYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781530; c=relaxed/simple;
	bh=RhHdnm8RnMJtsb4Mn4w1XLaLle0vODhrgTirmFoDMtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRft2fo/qQ3XaSUa7eGox7MPqp6bnTwjY8aZiOnJHSznrC1+5I3hDvIqgA0GIn5FUc+pnPVgM49c47Az60xqCc86kmbWogYI5U3MM5YWakCiEk6I659BgpmdbbvppkroRtz/RH2NOvsaqo19td72gHERxuBmFsmTCY7Us7LdhTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqYNfbuJ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqYNfbuJ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so1037410a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781528; x=1792386328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/5BGt+KW1rM09CksWyEMtJ7DGtKQm254W8uGFhGj2U=;
        b=ZqYNfbuJdq2bB/D72dzGmulPI4kvuE0boWqzDQnR/pDZCXFvW77jX3tPidE+GllJJA
         GPHS+D3L179s55Zc6MOaQiRxGQDlPWbnQ+ZfuQ5gwj31d787PggBy5K5uEmDG4zU68H5
         efkULSokMKbSX8dM1xLdEzqOoYg+9WA4eqtbPNLfALcuhfmbw5GzjnY4SeuT7oz94mUQ
         D0AGS74EUvAjZ2jln+qZTfwoG1fIDaNm+FJzQHhnss/ik7mSRvlpjITvilsTjJmCmIpX
         2ganYnBucuqAx9HFgSSSZ2BGwGG9tSDDB8EKKfq4yetOtsZ39A+LA5Kwun540v5eU714
         lbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781528; x=1792386328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b/5BGt+KW1rM09CksWyEMtJ7DGtKQm254W8uGFhGj2U=;
        b=rBqj8HruKGEsE0l0hWb62w9mRsD4zPxmI8vAk50LMT4SYKNRFGR7vvYWkuE5TFNlwl
         GH9JrTTtW+D6qjjTTeBzepJZWt/wHEzp1ou5dQHLoLguCHQNDT6Rq4dYHtDkJ6I6kB18
         XAZUTBrWep1zJFuvamAcAjiGbXE50JF2xNapqqbdoJViJHNl+ursBVOiQdXRDO7YgQ1D
         LMCsCY5TMiJaQet7BR3CF+H6mmK+JAwuFPHYTIuYmLULUvtxBcArfjZru/BnfmNjnJps
         AsOfF/tgCycN9X9jIy3PoZrOXBuGFfNDvpZEFgF+YhDNUuiFVch+g7DwnevuH2D+sBl9
         GDDw==
X-Forwarded-Encrypted: i=1; AKwUvByvOszjIV475xznRj87pbfsG2248OKHREx4nIrMAEHLqq4ETLNSECrOX2dKUmkbf8r3xX4jXmtdDtCXYQM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRwgeG7bAMGBhaMZLWwNNxMxcOReLJWrLlESj0Vs+75eo9ptd3
	0dcobHbr/GKaNftfPTA5aBHCBSlU5ptyRzEKT3Y5+Me+WcuIdbtS++xi
X-Gm-Gg: AYBFou3rQk7B/xXDy/KfgDmvozkCqybJs2G7QgeKoZ447hI4McQxzce3xrz/Ou78/oC
	zmeV2vYs1TugNHKcqlu1AvnVl39r9SJRaaAO0zfNjawMDl5EL6xlAAJ4I4Rh5GgTDnfbrzfmTaT
	h52tfHWuIjB8In0BSU8HXWAsgwwCWIVljzGwWM+m90j6YMdL4sBONArl156G1NggH9uxA6Gkljl
	p1JT10Nx4RE0LU8xgqZgV+Mnl5wEpRXP7ryHwXkCSlivGnnwXhb9MgyuvR034CK9s5VYeOEjDVm
	Y+NKri/d+v7Txj5MMJHrh0F27UYapYyZqa2+Lgk6lxf/cQ1jZUN9gpzaw8Wjqbq+qdbdn3VW6Rw
	rOYjUM2jUqW71j+ksZQIJUbxX8iqPbTKo6W64eE+lstv1rRwY/ZL1XZQ7Um47ZDCSipZ8gtkbS5
	rd92LP+35jBXJ1SpMpTEl0u9F3MhNbXsezeEa7GBaXzdGCOnRybMsJ45ji4BpghPUN4pBtt5BcX
	olbse7q6pk=
X-Received: by 2002:a05:6a20:549d:b0:3df:f4a5:dca7 with SMTP id adf61e73a8af0-3e16bd88afdmr8608414637.16.1791781528067;
        Sun, 11 Oct 2026 22:05:28 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3106de6sm3593668b3a.14.2026.10.11.22.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:05:27 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v3 1/2] wifi: iwlwifi: mvm: Fix GP2 to nanoseconds overflow on 32-bit
Date: Mon, 12 Oct 2026 13:05:15 +0800
Message-ID: <20261012050516.3803074-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012050516.3803074-1-zhanxusheng@xiaomi.com>
References: <20261012050516.3803074-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

A GP2 timestamp is a u32 in microseconds and NSEC_PER_USEC is 1000L, so
three multiplications are evaluated in 32 bits and truncate for any GP2
value above 4.295 s:

	u64 last_gp2_ns = mvm->ptp_data.scale_update_gp2 * NSEC_PER_USEC;
	iwl_mvm_ptp_get_adj_time(mvm, gp2 * NSEC_PER_USEC);
	iwl_mvm_ptp_get_adj_time(mvm, phy_data->gp2_on_air_rise * NSEC_PER_USEC);

iwl_mvm_ptp_get_adj_time() passes its argument back to
iwl_mvm_ptp_update_new_read() in microseconds, which treats a backwards
step of at least IWL_PTP_WRAP_THRESHOLD_USEC as a GP2 wraparound and
bumps wrap_counter.  A gp2 of 10 s truncates to a 32-bit product of
1410065408 ns, i.e. 1410065 us, an 8589935 us step back, so the 5000 us
threshold is passed and a wraparound is recorded.  Each spurious
wraparound adds IWL_PTP_GP2_WRAP microseconds, about 71.6 minutes, to
every later timestamp, and the error accumulates.

iwl_mvm_ptp_gettime() already holds its GP2 read in a u64.  Cast the
three u32 sources before multiplying.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Fixes: a2f49f7d52a9 ("wifi: iwlwifi: mvm: implement PHC clock adjustments")
Fixes: 0e49e940d1bc ("wifi: iwlwifi: mvm: add an option to use ptp clock for rx timestamp")
---
 drivers/net/wireless/intel/iwlwifi/mvm/ptp.c  | 5 +++--
 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c | 4 +++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/ptp.c b/drivers/net/wireless/intel/iwlwifi/mvm/ptp.c
index 49dcb1388007b..c64d6327e76f1 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/ptp.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/ptp.c
@@ -47,7 +47,8 @@ static void iwl_mvm_ptp_update_new_read(struct iwl_mvm *mvm, u32 gp2)
 u64 iwl_mvm_ptp_get_adj_time(struct iwl_mvm *mvm, u64 base_time_ns)
 {
 	struct ptp_data *data = &mvm->ptp_data;
-	u64 last_gp2_ns = mvm->ptp_data.scale_update_gp2 * NSEC_PER_USEC;
+	u64 last_gp2_ns = (u64)mvm->ptp_data.scale_update_gp2 *
+			  NSEC_PER_USEC;
 	u64 res;
 	u64 diff;
 
@@ -259,7 +260,7 @@ static int iwl_mvm_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 	 */
 	gp2 = iwl_mvm_get_systime(mvm);
 	data->scale_update_adj_time_ns =
-		iwl_mvm_ptp_get_adj_time(mvm, gp2 * NSEC_PER_USEC);
+		iwl_mvm_ptp_get_adj_time(mvm, (u64)gp2 * NSEC_PER_USEC);
 	data->scale_update_gp2 = gp2;
 	data->wrap_counter = 0;
 	data->delta = 0;
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c b/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
index 7f0b4f5daa214..7a9a63a76f382 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c
@@ -2017,7 +2017,9 @@ static void iwl_mvm_rx_fill_status(struct iwl_mvm *mvm,
 
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

