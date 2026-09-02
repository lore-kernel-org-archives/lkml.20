Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C423A1FBEA6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788310884; cv=none; b=q6Tr2td8yAo6bvCsErt+tFLoIeD4DGgryuUdN2W6kD8OJlwcSBsM+iB8CN1lJrAIfgYWRDJyjQBqum7AbNlYmMcja1BTcQ0S1uW7uUeIKcXgC1eAc+XWIgpZceJq14GYFEDoOFt4V3/kVYqujsRzkCLNGqYNCWO0Ss7WqhcwH/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788310884; c=relaxed/simple;
	bh=Q6tfhjQHAk22vFyZ3PtUbqriLWpDS8KohLhNM5fxKrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PiF+FNovVXLoLj8l1/iSACe1J3P3+Aqh9znoJlwMZVGpdk+GlRR/i9pzIltbo+zrX9ubwlg54mporJAndSFDp2Fwi1V9gQYIyelgZEnVp1CJfeFgl9KLy05tOwb2EQ/Fs5heoxIigdIrzJl/MI/AcSdHsh6BMltE75rdYNehjpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EshmDCiU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EshmDCiU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-382ef647e20so595367a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788310882; x=1788915682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIsvf/pMgFR1o4nDemQvggnheWLtStmBokvR+GjxbWU=;
        b=EshmDCiU+ibMEiRgmCfm5EBV6lya0PS5EGILl2V/x9AdkiC6fC4jUVc+BLLtr4FmYg
         o+LikV+iz5bzJ9ZA/2z5HcOrQ9wIs7k9cVo+EElYEm4zvidt7PbK6ClQbyAx4Pf4Rkc2
         CR+MGhBpLlKhQFFml2JAd2q1sGazCv7peiuA5Bou6IYbLzbR+L4Blqx5qmZHRLEbFEp2
         4+mGy/aHRHB15GYTBnopet0t+B8+VRILXRgHjhmQuTh5QtkKoVJS6THP2yDLas+BY/Vj
         OC5l6RZmCdAg33K17FSCecaNdnB9kKhtWTTjmJpqQH9Y74UcQTG7Cwcaa4Dx9NqkBKjs
         S/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788310882; x=1788915682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIsvf/pMgFR1o4nDemQvggnheWLtStmBokvR+GjxbWU=;
        b=bJ13K+qmcRWkbqzc1X2srC3Dvk3TP2pnDBqbqNOgV77Jhb+ZbfOo3ljC1iACwq0T9u
         D5EcHwMn3mB8/xmE/taaKogvMbZzNP7BHG8Fa51BGalGlCcuGc317lbWrPSRfdw3lB77
         KRDZY968paHi57I8sAdaTfDwI3ZtboBdKY02aYGaq80KF8Ush17C4+RASMvEUI7osr41
         AMQriCuoF32zQvFfM8PEGjQQdPwGRxElUX5A8HylGWu+934/yKFqjd04DYMrUMhwE7Zk
         KG5do37skQEU/FMpaOdoKTL1V1aijgI1BLLLgDtJJ6XeQvJoEuD4c45FW49LXjsgiTVG
         QAnw==
X-Forwarded-Encrypted: i=1; AKwUvBzfBo8ldr6hKNl3cxzAvscmrfGVVlKJmZ9kENliZFt44l5spnXYVqTaBJoOtooQG0eyeqpHVHMTI940Aos=@vger.kernel.org
X-Gm-Message-State: AFuF++lyFDWbpIBcQ+ZjZqjd5H/f/4ZJK2bMz4+QYpWF/SXjaKzFWYOl
	mBfUFH+6MHmRdA+3wwQ32WskEAZVRY8R+LrblNH54sgX7GVtt3Frw/SV
X-Gm-Gg: AYBFou12oc9twCHcpzOnaHzU7SPvSjbgpunAFss8UiUp4Q3Cyv9hLuebAyNKsfgzGtU
	yJccdJjfzd5yusUYAtN5vXgPkAS8vJ2ZGSRtGPoe3dnXP8rLu0VidKB48nTPqJkMFU04a/yNbXF
	Tvrm/8s5UMNwvvs6Igrl/n23tUZWM9v91X9GAd/UjHK/FWbQQUUd9nUaUMq1UlvO63RRvlX4t0a
	j9mUYueg1a0izqjMVQfSLel/j8EaZpwJmpbuOsbLzg5WAQkq8bDseYNNZ0DlUV+HFJHHPmhTxQR
	56oR7/ybwaH/NGnG1eR86/L35ReIobPmTuh/hEDgSWrNM/Uq/G3AFP/1MoI75xQWxAMqIcU/jBI
	aS0Q+8qQSr1MyNx37P995MPX0QMQD+vDr9edIaefeJoMPXJblhQn/hGjTre6dL0uqGF8zJxaFqd
	nlECjRksjUInwBHBpefiMY9om3QqtjHRY+4B8f/YZSlvIgYxOmFTS0cnLa0My5d92Qx+5c3TLgQ
	wi/XBzTrRinezjh
X-Received: by 2002:a17:90b:17cd:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39aededf539mr1313470a91.6.1788310881957;
        Tue, 01 Sep 2026 18:01:21 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfe6b6sm2164002a91.1.2026.09.01.18.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:01:21 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vignesh C <quic_vignc@quicinc.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Mahendran P <quic_mahep@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix NULL dereference in hw scan cleanup path
Date: Wed,  2 Sep 2026 09:01:17 +0800
Message-ID: <20260902010117.3225320-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath12k_mac_op_hw_scan() walks ahvif->links_map in its abort path to
tear down the scan vdevs it may have created. It skips link vifs which
are no longer present:

	arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
	if (!arvif)
		continue;

	ar = arvif->ar;
	if (ar->scan.arvif == arvif) {

but it does not check arvif->ar, which is cleared in several teardown
paths while the link remains set in links_map. When firmware crashes
and the reset worker detaches the link vifs from their radio, a scan
request arriving in that window fails, enters the abort path and
dereferences a NULL ar:

  BUG: kernel NULL pointer dereference, address: 0000000000001508
  RIP: 0010:ath12k_mac_op_hw_scan+0x170/0x8a0 [ath12k]
  Call Trace:
   drv_hw_scan+0xa0/0x160 [mac80211]
   __ieee80211_start_scan+0x305/0x7b0 [mac80211]
   ieee80211_request_scan+0xe/0x20 [mac80211]
   nl80211_trigger_scan+0x610/0xa20 [cfg80211]

0x1508 is the offset of scan.arvif within struct ath12k, reached from
a NULL base.

The oops happens in a task holding wiphy and rtnl locks, so it takes
down the rest of the networking stack with it: subsequent scan, netns
and NetworkManager operations block indefinitely in D state.

Check the radio before using it, matching the existing arvif check
directly above and the arvif->ar check already used elsewhere in this
file.

Fixes: feed05f1526e8 ("wifi: ath12k: Split scan request for split band device")
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 99bf5cf79d102..64a636f3ae3c6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5821,6 +5821,16 @@ int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
 				continue;
 
 			ar = arvif->ar;
+
+			/* The link vif may have been detached from its radio
+			 * while this scan request was being processed, for
+			 * example by a firmware recovery running concurrently.
+			 * The link is still set in links_map in that case, so
+			 * the radio has to be checked before it is used.
+			 */
+			if (!ar)
+				continue;
+
 			if (ar->scan.arvif == arvif) {
 				wiphy_work_cancel(hw->wiphy, &ar->scan.vdev_clean_wk);
 				spin_lock_bh(&ar->data_lock);
-- 
2.53.0

