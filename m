Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583149;
	b=b7saXnO5BWmD6JSBf7m8WcsynsLFT7bgTbKDvzS3oFavvIC1Z5N1qquQoDspixFcCZEH
	 RthTdNjVp9OJbXbXPM4Z21bA7Eg3lbZVk+vbSR890Ym4ljRpDewLWEyH9n7+tS0tqRAxN
	 0nau2A0NpE6xVayoe/7vJPKXdolRba9+mpQO0Ymi/qmI3q32KmaPVu0YCYSz1/T5U26bx
	 Xk3A2/U+b0q1/n4yoylOCZWrzR+sZg7S6UUG1Cb1jNntrOhvKogaFf0wodoPhoL/JiRod
	 +We7VrMrDZqU8UmVJmbbT/iq8G9eUTbdZQlLKlYb1okXzFNto6yEwfRwqB5kbTVpmFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4KWae+kPLwFf/5JrLWhVNBTkidjzLlHiLddivhaLPSU=;
	b=kqy/Hjr7yYtlGlnd00TNHPwICabMF41UmaPfUh1qIco4a7iuWsOhHVkpv+UwzuSKCh82
	 KYuDqz+EOh61dHafJTaTx6/3JwSXPan5L6BVFEYAj1owYYSul+6cSk/75DLXtcSQNTyMo
	 53sWJk5G28QPvXq7J595cdCQ8l22WCs340GQhVYOdAfnQtnsZUMDVVdnDfkWxIdqB3GbA
	 DoRkUU1t2ZmnxwPTYwdAkTHkJFQ3/pzGKv9tv8b7hEh2QbSeYec2XOFeEV2p/XswlE6I4
	 KKWTL5kRjUK2JLYfGqczyOn0/YIifJ1es6YoNGy3Kn2QDUmENp2B8IhWR6a3c+7+3Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V+J9JrJz;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2D9606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD2D9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V+J9JrJz
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso380236f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792583146; x=1793187946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KWae+kPLwFf/5JrLWhVNBTkidjzLlHiLddivhaLPSU=;
        b=V+J9JrJzcFHLppXHu13uEl7JNZnehfNl8wf3cOiE1fdWu2qP4MhA/DZdmT/WhxcF5H
         yn3n5N7jq7C0G2OVoITnnLjhYdwVeMDisfFcl//DxK98WZhs/4nFFrxihwz136wY16Dm
         8HCZlBBcivRaB180e3LdWR2OLMi3/z9SP6te7vsd+WC4ypSolH6WO8OEOuHkmFFtCi5s
         JLtQHh/MSO7Sjz9A/+tpeZYxQRwxFV7X5VmjUYSV8DLoKUJCjJCsZNLdx1w4md5QUkPa
         jGE2m6UcvyPZFDxd451E3eHt42ioLFCAnWWLAU6ADaimH8dKycJ2oyzLWAISNVWxC3U9
         JCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583146; x=1793187946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4KWae+kPLwFf/5JrLWhVNBTkidjzLlHiLddivhaLPSU=;
        b=n5V4q+Px7Ybtqd4lA1RBmHpLwcEwt7F2UPm8uHvJZqNgD1QTdzcSJgQ9fhcncITXxV
         QLOVsWlBEpxrtr34Qv45lyaACWjmZRGS9laGKbpT1TgqjiZGs6WHhyrdCXpsnjm2++Tv
         7BODHqFF4YGWVcUQy3vbaL2UaT7C3RnG7I0UyolAm72/mSmuRysi5H7OxOykn8/lXQVG
         40mKygOSqk5YeOD9eVGEiJFxJuUGjQ87XPqsQRrq/SLzRYGPdafDoIJTog59zxHQHXGf
         TfNWJqsMePNn/m1vassC6VBMY5cj3FPwwY5UQStgyTOVx4MAPn2OajahqUyhJPQ4Zrxh
         5Amw==
X-Forwarded-Encrypted: i=1; AKwUvBx6s2a2jL2oQ2gtOfDU/t0KIsvYs0p98w+1hVA2eBapWD891wbLr3pm8M9IxASmCSZ21mi/YeTFZM7B89A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTKveYcLgxffRR6GuibNw53rhVDmTvDZztBaoUhlkAeNVLlt+o
	I/I7b2BUvmvw6x1uag5fXgnLzYDXDRX3OjOIrrzq1PFjSLR2Dln1Dvm0
X-Gm-Gg: AYBFou2rHztGuYr0jiGd1OrJ5ZjJU/6e1OZzQkQXhdFt8eA+n/x3Gf3Qj0ZOU/YiXeJ
	Bgfihpa3pun+C4gVMwG6SUHKmGUBOdqws5c5Anq9VmyOyiNewLhi4tvA53EkcwpSK6VqaMNE3lA
	15lo7CF4UYSCuUHoz2nxKY5fONkEwGRaSktmKaQzx/wiga9SZ5hNMxrSJoTH0IlZlsb5N4GW9QR
	H/2khtL4B+bUkhwQKVetMARE924W4PgkE3N2eP2vnVc0W2ho4f9BHrYDLUhiGOfFY4dLjyJ73tY
	uKqY45I5TOJs/7VVjWHdJgVbacNSNzfSsIHN7JJpj7i8AMCpVrPyavTw1+3Npsnp++/KerCuONk
	hhGM+4lGzrau3pqYocyNYCwPjto/K+EpRMaoKj5wl+bOAIPN4NXyJKmS187JM4v6NrN3d+D6RC3
	pCTkdRFY9muTmyNqUrqBuYuP6yl7esm8T82ubP7lPEx+nWNF5fmHlJuBovXUKJsUKSnV42obir3
	aQ4Kg7+lRBapsh7GtNy0r/JMa10NDh5fhEF66n6mTyzqmjieIerIC6HNbyAog==
X-Received: by 2002:a05:6000:46dc:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-48e264a2c80mr2270622f8f.12.1792583146500;
        Wed, 21 Oct 2026 04:45:46 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828ca3sm4944112f8f.25.2026.10.21.04.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:45:45 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v8 2/3] wifi: rtw88: support channel switch in AP mode
Date: Wed, 21 Oct 2026 13:45:42 +0200
Message-ID: <20261021114543.4132776-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021114543.4132776-1-mehmet.fide@gmail.com>
References: <20261021114543.4132776-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

hostapd's CHAN_SWITCH is refused because the driver does not announce
channel switch support, so an rtw88 AP can only change its channel by
being torn down and started again.

Declare WIPHY_FLAG_HAS_CHANNEL_SWITCH and implement
channel_switch_beacon: the firmware repeats the beacon held in the
first reserved page, so while a switch is announced the page is
downloaded again every beacon interval to advance the countdown, and
ieee80211_csa_finish() is called once it completes. IBSS shares the
page and the work.

The work is a delayed work of the device and csa_vif names the
interface, both under the driver mutex. The countdown is cancelled when
the AP stops, when the interface goes away, on WoWLAN suspend and in
rtw_core_stop(); the BSS_CHANGED_BEACON replay after a hardware restart
resumes it. The other page downloads during a countdown, the TIM update,
the PG backup and the one on association, are skipped until the beacon
after the switch, since every beacon fetch advances the countdown; the
next download carries their changes. A scan is refused: it would take
the AP off the channel its stations count down to.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---

Notes:
    Changes in v8:
    - Acked-by from Ping-Ke
    
    Changes in v7:
    - csa_vif is kept until the beacon after the switch: a TIM update
      before it fetched one beacon past count 1 and hit the WARN in
      ieee80211_beacon_update_cntdwn()
    - rebased on rtw-next
    
    Changes in v6:
    - the countdown work is an ieee80211 delayed work under the driver
      mutex, csa_vif is driver state under the mutex; no wiphy lock in
      rtw88 (Ping-Ke)
    - rtw_core_stop() cancels the work and clears csa_vif, which covers the
      IPS path and the firmware recovery (Ping-Ke)
    - the downloads are paced from the first one with an absolute due time:
      queued after each download, the countdown drifted by about 10 ms per
      beacon interval on the ordered mac80211 workqueue, and a station
      switched ahead of the AP on a count of 50
    - the BSS_CHANGED_BEACON path says why it starts the countdown (the
      replay after a hardware restart) and stops it when the beacon comes
      back without a switch announced (Ping-Ke)
    
    Changes in v5:
    - rtw_fw_csa_active/start/stop() assert the wiphy lock
    - hw_scan() takes the mutex with guard()
    - the ASSOC path says why it skips the download: the STA+AP combination
    
    Changes in v4:
    - the work and csa_vif live in rtw_dev; no lookup through the reserved page
    - the countdown is stopped before a firmware recovery restarts the hardware
    - a scan is refused while a switch is announced
    - one beacon fetch per interval during the countdown

 drivers/net/wireless/realtek/rtw88/fw.c       | 80 ++++++++++++++++++-
 drivers/net/wireless/realtek/rtw88/fw.h       |  4 +
 drivers/net/wireless/realtek/rtw88/mac80211.c | 39 +++++++--
 drivers/net/wireless/realtek/rtw88/main.c     |  6 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  3 +
 5 files changed, 124 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 3cd17a3bb494..2d81aaeed0d7 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1802,14 +1802,90 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 	return ret;
 }
 
+bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	return !!rtwdev->csa_vif;
+}
+
+/* paced from the first download: a late one does not delay the next */
+static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
+{
+	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
+	s64 delay;
+
+	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
+	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
+	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
+				     usecs_to_jiffies(max(delay, 0)));
+}
+
+void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	if (rtwdev->csa_vif == vif)
+		return;
+
+	rtwdev->csa_vif = vif;
+	rtwdev->csa_due = ktime_get();
+	rtw_fw_csa_queue(rtwdev, vif);
+}
+
+void rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
+{
+	lockdep_assert_held(&rtwdev->mutex);
+
+	if (!vif || rtwdev->csa_vif != vif)
+		return;
+
+	rtwdev->csa_vif = NULL;
+	cancel_delayed_work(&rtwdev->csa_beacon_work);
+}
+
 void rtw_fw_update_beacon_work(struct work_struct *work)
 {
 	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
 					      update_beacon_work);
 
 	mutex_lock(&rtwdev->mutex);
-	rtw_fw_download_rsvd_page(rtwdev);
-	rtw_send_rsvd_page_h2c(rtwdev);
+
+	/* a fetch advances the countdown, the next download carries the TIM */
+	if (!rtw_fw_csa_active(rtwdev)) {
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+	}
+
+	mutex_unlock(&rtwdev->mutex);
+}
+
+void rtw_fw_csa_beacon_work(struct work_struct *work)
+{
+	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
+					      csa_beacon_work.work);
+	struct ieee80211_vif *vif;
+
+	mutex_lock(&rtwdev->mutex);
+
+	vif = rtwdev->csa_vif;
+	if (!vif)
+		goto out;
+
+	if (!vif->bss_conf.csa_active) {
+		rtwdev->csa_vif = NULL;
+		goto out;
+	}
+
+	if (!ieee80211_beacon_cntdwn_is_complete(vif, 0)) {
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+		rtw_fw_csa_queue(rtwdev, vif);
+	} else {
+		ieee80211_csa_finish(vif, 0);
+	}
+
+out:
 	mutex_unlock(&rtwdev->mutex);
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/fw.h b/drivers/net/wireless/realtek/rtw88/fw.h
index 48ad9ceab6ea..d8e58e4ed836 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.h
+++ b/drivers/net/wireless/realtek/rtw88/fw.h
@@ -863,7 +863,11 @@ void rtw_add_rsvd_page_pno(struct rtw_dev *rtwdev,
 void rtw_add_rsvd_page_sta(struct rtw_dev *rtwdev,
 			   struct rtw_vif *rtwvif);
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev);
+bool rtw_fw_csa_active(struct rtw_dev *rtwdev);
+void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif);
+void rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif);
 void rtw_fw_update_beacon_work(struct work_struct *work);
+void rtw_fw_csa_beacon_work(struct work_struct *work);
 void rtw_send_rsvd_page_h2c(struct rtw_dev *rtwdev);
 int rtw_dump_drv_rsvd_page(struct rtw_dev *rtwdev,
 			   u32 offset, u32 size, u32 *buf);
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 2a9b09fa76e7..182aecc76820 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -237,6 +237,8 @@ static void rtw_ops_remove_interface(struct ieee80211_hw *hw,
 
 	mutex_lock(&rtwdev->mutex);
 
+	rtw_fw_csa_stop(rtwdev, vif);
+
 	rtw_leave_lps_deep(rtwdev);
 
 	rtw_txq_cleanup(rtwdev, vif->txq);
@@ -395,8 +397,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 		if (vif->cfg.assoc) {
 			rtw_coex_connect_notify(rtwdev, COEX_ASSOCIATE_FINISH);
 
-			rtw_fw_download_rsvd_page(rtwdev);
-			rtw_send_rsvd_page_h2c(rtwdev);
+			/* a station associating while the AP counts down */
+			if (!rtw_fw_csa_active(rtwdev)) {
+				rtw_fw_download_rsvd_page(rtwdev);
+				rtw_send_rsvd_page_h2c(rtwdev);
+			}
 			rtw_fw_default_port(rtwdev, rtwvif);
 			rtw_coex_media_status_notify(rtwdev, vif->cfg.assoc);
 			if (rtw_bf_support)
@@ -438,6 +443,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
 		rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
+		/* restart replay resumes it, a beacon without CSA ends it */
+		if (conf->csa_active)
+			rtw_fw_csa_start(rtwdev, vif);
+		else
+			rtw_fw_csa_stop(rtwdev, vif);
 	}
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
@@ -490,6 +500,7 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
 	struct rtw_dev *rtwdev = hw->priv;
 
 	mutex_lock(&rtwdev->mutex);
+	rtw_fw_csa_stop(rtwdev, vif);
 	rtw_write32_clr(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
 	rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_DEFAULT);
 	rtwdev->ap_active = false;
@@ -556,6 +567,17 @@ static int rtw_ops_set_tim(struct ieee80211_hw *hw, struct ieee80211_sta *sta,
 	return 0;
 }
 
+static void rtw_ops_channel_switch_beacon(struct ieee80211_hw *hw,
+					  struct ieee80211_vif *vif,
+					  struct cfg80211_chan_def *chandef)
+{
+	struct rtw_dev *rtwdev = hw->priv;
+
+	mutex_lock(&rtwdev->mutex);
+	rtw_fw_csa_start(rtwdev, vif);
+	mutex_unlock(&rtwdev->mutex);
+}
+
 static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			   struct ieee80211_vif *vif, struct ieee80211_sta *sta,
 			   struct ieee80211_key_conf *key)
@@ -626,7 +648,8 @@ static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	}
 
 	/* download new cam settings for PG to backup */
-	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG)
+	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG &&
+	    !rtw_fw_csa_active(rtwdev))
 		rtw_fw_download_rsvd_page(rtwdev);
 
 out:
@@ -846,6 +869,7 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
 	int ret;
 
 	mutex_lock(&rtwdev->mutex);
+	rtw_fw_csa_stop(rtwdev, rtwdev->csa_vif);
 	ret = rtw_wow_suspend(rtwdev, wowlan);
 	if (ret)
 		rtw_err(rtwdev, "failed to suspend for wow %d\n", ret);
@@ -893,20 +917,24 @@ static int rtw_ops_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct rtw_dev *rtwdev = hw->priv;
 	int ret;
 
+	guard(mutex)(&rtwdev->mutex);
+
+	/* a scan takes the AP off the channel its stations count down to */
+	if (rtw_fw_csa_active(rtwdev))
+		return -EBUSY;
+
 	if (!rtw_fw_feature_check(&rtwdev->fw, FW_FEATURE_SCAN_OFFLOAD))
 		return 1;
 
 	if (test_bit(RTW_FLAG_SCANNING, rtwdev->flags))
 		return -EBUSY;
 
-	mutex_lock(&rtwdev->mutex);
 	rtw_hw_scan_start(rtwdev, vif, req);
 	ret = rtw_hw_scan_offload(rtwdev, vif, true);
 	if (ret) {
 		rtw_hw_scan_abort(rtwdev);
 		rtw_err(rtwdev, "HW scan failed with status: %d\n", ret);
 	}
-	mutex_unlock(&rtwdev->mutex);
 
 	return ret;
 }
@@ -973,6 +1001,7 @@ const struct ieee80211_ops rtw_ops = {
 	.sta_add		= rtw_ops_sta_add,
 	.sta_remove		= rtw_ops_sta_remove,
 	.set_tim		= rtw_ops_set_tim,
+	.channel_switch_beacon	= rtw_ops_channel_switch_beacon,
 	.set_key		= rtw_ops_set_key,
 	.ampdu_action		= rtw_ops_ampdu_action,
 	.can_aggregate_in_amsdu	= rtw_ops_can_aggregate_in_amsdu,
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 0f23498b5c96..48e8cad221b9 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1550,11 +1550,13 @@ void rtw_core_stop(struct rtw_dev *rtwdev)
 
 	clear_bit(RTW_FLAG_RUNNING, rtwdev->flags);
 	clear_bit(RTW_FLAG_FW_RUNNING, rtwdev->flags);
+	rtwdev->csa_vif = NULL;
 
 	mutex_unlock(&rtwdev->mutex);
 
 	cancel_work_sync(&rtwdev->c2h_work);
 	cancel_work_sync(&rtwdev->update_beacon_work);
+	cancel_delayed_work_sync(&rtwdev->csa_beacon_work);
 	cancel_delayed_work_sync(&rtwdev->watch_dog_work);
 	cancel_delayed_work_sync(&coex->bt_relink_work);
 	cancel_delayed_work_sync(&coex->bt_reenable_work);
@@ -2170,6 +2172,7 @@ int rtw_core_init(struct rtw_dev *rtwdev)
 	INIT_WORK(&rtwdev->ips_work, rtw_ips_work);
 	INIT_WORK(&rtwdev->fw_recovery_work, rtw_fw_recovery_work);
 	INIT_WORK(&rtwdev->update_beacon_work, rtw_fw_update_beacon_work);
+	INIT_DELAYED_WORK(&rtwdev->csa_beacon_work, rtw_fw_csa_beacon_work);
 	INIT_WORK(&rtwdev->ba_work, rtw_txq_ba_work);
 	skb_queue_head_init(&rtwdev->c2h_queue);
 	skb_queue_head_init(&rtwdev->coex.queue);
@@ -2293,7 +2296,8 @@ int rtw_register_hw(struct rtw_dev *rtwdev, struct ieee80211_hw *hw)
 	hw->wiphy->available_antennas_rx = hal->antenna_rx;
 
 	hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS |
-			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP;
+			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP |
+			    WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 
 	hw->wiphy->features |= NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
 	hw->wiphy->max_scan_ssids = RTW_SCAN_MAX_SSIDS;
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index d59f6e323adf..bc3ebfec11ae 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2094,6 +2094,9 @@ struct rtw_dev {
 	struct work_struct ips_work;
 	struct work_struct fw_recovery_work;
 	struct work_struct update_beacon_work;
+	struct delayed_work csa_beacon_work;
+	struct ieee80211_vif *csa_vif;
+	ktime_t csa_due;
 
 	/* used to protect txqs list */
 	spinlock_t txq_lock;
-- 
2.55.0

