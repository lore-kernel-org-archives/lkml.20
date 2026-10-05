Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9874AB3DC
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210936; cv=none; b=vCG75XNk7cyDO4PfZtT5Yvze+tlZY68EjN/O1u9MmuMOsBn2gMRga5pgywPYpfPeEtsJnROyEjkO/5Y6GxkpVR6pvaQM7zGGWaw6voS2nca0yxYs/ZdzzU7CdplZOoqFk3Sym7dZCIElFca13AMeCMbS3c4hhqzZNkfAoHOb5RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210936; c=relaxed/simple;
	bh=rMjNVLhs5JfxdkS5GzjLBQw0mAUVahYCa2QoKGsxgrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQeLJ1w+ZDATG/aHHLLS1bqOXxwmRXerlLXwuAA53TuJ/phFgLTE2eoFsP1SrNM3r3DJ3PZpn0GakhVitjzKtegdT7vR9wFZWmJeT9wwVZbJZi/wGDb2O6tACXE9yghGIptvtcU6PR4JzLXROe2eM7erkZ2weAKBgKpyUis7m4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATm8N0BW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATm8N0BW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a169d33ef6so10840965e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791210927; x=1791815727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVSyv8D2m+eD8yjkBEy7aqASvKw2BLJg+4IQxlRXQ9w=;
        b=ATm8N0BWOyoBQTpXxmKolRwBDuKm17Fjzw5IlHu60GASI5UKLxV45INS6hjPjgtsUI
         tkG8fQUE3nAVovAmGeeKWYoQkEVshkUGyhW0FkZCwjEMrMq+AOQm8DbJll5T34Z+91JW
         VEJEWml7SwrCPdMDHDuy04NMokwiNO7enHFCkXamHqB8EASKUP7lf4zEGpMThUW6xDs7
         K8MKL0+xFh5zxEpKPFKnQEnZQvvSYAUFT4D4DZY732oWrW+K51K+s1SQSIRJwfOtzCUt
         mnUl642lkqNSzxQlspgTNHO+q7P7V3sAAbcQbpxX5K6kaIQWRFx6A+Opzho63IevEF8c
         1Yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791210927; x=1791815727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TVSyv8D2m+eD8yjkBEy7aqASvKw2BLJg+4IQxlRXQ9w=;
        b=wgoXWZkbq96edrHG4XJ5LyM/xg99Fdqet0pXWL0oqMBSgf9avdft1Uy4CCcgY8YGTZ
         ayjlRV+FMS8wp7KU0AyuH6TTV88cARc39OeOY9YuS/iSqpK48cFwwYuIja21bgCJxHx1
         j+zWu067qs30ow1vaQg6wfkSweobmwpt3k/zlefKyjrxGcGJuRZjv3CZiIY/syX3Ny0g
         jJ2Emh3pkfVN89Wzm3OfY3vrk2HYpF5bDOIontGhjRLWSvJbJle7OWlSLYFSx5UFxWk0
         F+cqT9FwEvKgVRb7YZ1Cd9ox+xYxrJlYVhzzx7JUGVP+eNXBhSHc6Q4xk+nNzS8BTGha
         GwTQ==
X-Forwarded-Encrypted: i=1; AKwUvBws8dCAU/7wZDfnYotlObmrvN0ANgQnU062b5RqpLR/aD3tTxobZtZO5NV2iJ0+S9CNT3fsCavV/sFO5Ys=@vger.kernel.org
X-Gm-Message-State: AFuF++nGQGHCfdZAYE/jLcuRQULAOGIt63GPAPyIbVNGHtDW5QrlI7Zq
	4ULRKNt+Erjvdms8JXRDoIkSiqvZU9nNiRVl3dq+UhqxOHMa0+Cdc9cl
X-Gm-Gg: AYBFou235O0C4r3GR0gdgcD41ajNs9PMx04GAMkAfgnWbaeIdiPlJwmKCu044jajlLt
	6qwrPqWzMgaJ+X63Shf2J9M6xU77k02rg0fAuul4HGGL0hXy38m1jH45WDnkVdiqf3Ntp6L5Cwd
	QGkqQ1mGmplONPMaVPhtPrLkKK2gBYiCqpNnFSuZFplq+1tE+tejKipXdaSg5hesUs14MzJvyAF
	zYeSooOUhYhZHqmFL9Qcu5Xu/XbI/j2t6V+TmAmDHMj7fFFS438IpkTlpxAO7sRjpAIHsTjZVX0
	5a+afrr55U1vynqeBPcftKeuTsipT+ZV8295SmsSeMjtbK/NKk74QEAcO8e/ld8LNVjKHAVU0iA
	M609KmhTs/1ENbBI2CI7erJ+UyPTHrPh914im2AlzsXO90x7Hl+NtCXTWBbdD3bd4wh7PCg9E7z
	ipogmILeGqm9CtWkxJNCeWA51rL5k1jg38RFBNgNcZ+JOGaI8w7Wf9JFSYfAhq9QAbbMIQngUoI
	IgMOMFZ1A/OrR0=
X-Received: by 2002:a05:600c:3510:b0:4a0:c4:a1e0 with SMTP id 5b1f17b1804b1-4a02756729dmr190570495e9.9.1791210927156;
        Mon, 05 Oct 2026 07:35:27 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm396901835e9.8.2026.10.05.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:35:26 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 2/2] wifi: rtw88: support channel switch in AP mode
Date: Mon,  5 Oct 2026 16:35:23 +0200
Message-ID: <20261005143523.130287-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005143523.130287-1-mehmet.fide@gmail.com>
References: <20261005143523.130287-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

hostapd's CHAN_SWITCH is refused because the driver does not announce
channel switch support, so an AP on rtw88 can only change its channel
by being torn down and started again.

Declare WIPHY_FLAG_HAS_CHANNEL_SWITCH and implement
ieee80211_ops::channel_switch_beacon: the firmware repeats the beacon
held in the first reserved page, so while a switch is announced the
page is downloaded again every beacon interval to renew the countdown,
and ieee80211_csa_finish() is called once it completes. IBSS, which
the flag enables too, shares the page and the work.

The work is a wiphy delayed work of the interface; the wiphy lock
serializes it with the mac80211 state it reads and the driver mutex
with the page build. It is cancelled when the AP stops, when the
interface goes away and on WoWLAN suspend, and a hardware restart,
which replays add_interface with the work still armed, does not
initialise it again. The other page downloads
that can run during a countdown, the TIM update and the PG backup on
set_key, are skipped then, since every beacon fetch advances the
countdown. A hardware scan is refused while a switch is announced: it
would take the AP off the channel its stations count down to.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c       | 59 +++++++++++++++++++
 drivers/net/wireless/realtek/rtw88/fw.h       |  2 +
 drivers/net/wireless/realtek/rtw88/mac80211.c | 55 ++++++++++++++++-
 drivers/net/wireless/realtek/rtw88/main.c     |  3 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  2 +
 5 files changed, 119 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 3cd17a3bb494..5e68ba73548a 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1802,14 +1802,73 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 	return ret;
 }
 
+static struct ieee80211_vif *rtw_fw_beacon_vif(struct rtw_dev *rtwdev)
+{
+	struct rtw_rsvd_page *rsvd_pkt;
+
+	rsvd_pkt = list_first_entry_or_null(&rtwdev->rsvd_page_list,
+					    struct rtw_rsvd_page, build_list);
+	if (!rsvd_pkt || rsvd_pkt->type != RSVD_BEACON)
+		return NULL;
+
+	return rtwvif_to_vif(rsvd_pkt->rtwvif);
+}
+
+bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
+{
+	struct ieee80211_vif *vif = rtw_fw_beacon_vif(rtwdev);
+
+	return vif && vif->bss_conf.csa_active;
+}
+
 void rtw_fw_update_beacon_work(struct work_struct *work)
 {
 	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
 					      update_beacon_work);
 
 	mutex_lock(&rtwdev->mutex);
+
+	if (rtw_fw_csa_active(rtwdev))
+		goto out;
+
 	rtw_fw_download_rsvd_page(rtwdev);
 	rtw_send_rsvd_page_h2c(rtwdev);
+
+out:
+	mutex_unlock(&rtwdev->mutex);
+}
+
+void rtw_fw_csa_beacon_work(struct wiphy *wiphy, struct wiphy_work *work)
+{
+	struct rtw_vif *rtwvif = container_of(work, struct rtw_vif,
+					      csa_beacon_work.work);
+	struct rtw_dev *rtwdev = wiphy_to_ieee80211_hw(wiphy)->priv;
+	struct ieee80211_vif *vif = rtwvif_to_vif(rtwvif);
+	unsigned int delay;
+
+	lockdep_assert_wiphy(wiphy);
+
+	mutex_lock(&rtwdev->mutex);
+
+	if (!test_bit(RTW_FLAG_RUNNING, rtwdev->flags))
+		goto out;
+
+	if (!vif->bss_conf.csa_active)
+		goto out;
+
+	delay = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
+
+	if (!ieee80211_beacon_cntdwn_is_complete(vif, 0)) {
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+
+		wiphy_delayed_work_queue(wiphy, &rtwvif->csa_beacon_work,
+					 usecs_to_jiffies(delay));
+	} else {
+		ieee80211_csa_finish(vif, 0);
+	}
+
+out:
 	mutex_unlock(&rtwdev->mutex);
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/fw.h b/drivers/net/wireless/realtek/rtw88/fw.h
index 48ad9ceab6ea..a0a1dcbf93de 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.h
+++ b/drivers/net/wireless/realtek/rtw88/fw.h
@@ -863,7 +863,9 @@ void rtw_add_rsvd_page_pno(struct rtw_dev *rtwdev,
 void rtw_add_rsvd_page_sta(struct rtw_dev *rtwdev,
 			   struct rtw_vif *rtwvif);
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev);
+bool rtw_fw_csa_active(struct rtw_dev *rtwdev);
 void rtw_fw_update_beacon_work(struct work_struct *work);
+void rtw_fw_csa_beacon_work(struct wiphy *wiphy, struct wiphy_work *work);
 void rtw_send_rsvd_page_h2c(struct rtw_dev *rtwdev);
 int rtw_dump_drv_rsvd_page(struct rtw_dev *rtwdev,
 			   u32 offset, u32 size, u32 *buf);
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 2a9b09fa76e7..4c5be1bd9875 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -164,6 +164,9 @@ static int rtw_ops_add_interface(struct ieee80211_hw *hw,
 	memset(&rtwvif->bfee, 0, sizeof(struct rtw_bfee));
 	rtw_txq_init(rtwdev, vif->txq);
 	INIT_LIST_HEAD(&rtwvif->rsvd_page_list);
+	if (!test_bit(RTW_FLAG_RESTARTING, rtwdev->flags))
+		wiphy_delayed_work_init(&rtwvif->csa_beacon_work,
+					rtw_fw_csa_beacon_work);
 
 	mutex_lock(&rtwdev->mutex);
 
@@ -235,6 +238,8 @@ static void rtw_ops_remove_interface(struct ieee80211_hw *hw,
 	rtw_dbg(rtwdev, RTW_DBG_STATE, "stop vif %pM mac_id %d on port %d\n",
 		vif->addr, rtwvif->mac_id, rtwvif->port);
 
+	wiphy_delayed_work_cancel(hw->wiphy, &rtwvif->csa_beacon_work);
+
 	mutex_lock(&rtwdev->mutex);
 
 	rtw_leave_lps_deep(rtwdev);
@@ -438,6 +443,13 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
 		rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
+		if (conf->csa_active) {
+			u32 interval = ieee80211_tu_to_usec(conf->beacon_int);
+
+			wiphy_delayed_work_queue(hw->wiphy,
+						 &rtwvif->csa_beacon_work,
+						 usecs_to_jiffies(interval));
+		}
 	}
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
@@ -487,8 +499,11 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
 			    struct ieee80211_vif *vif,
 			    struct ieee80211_bss_conf *link_conf)
 {
+	struct rtw_vif *rtwvif = (struct rtw_vif *)vif->drv_priv;
 	struct rtw_dev *rtwdev = hw->priv;
 
+	wiphy_delayed_work_cancel(hw->wiphy, &rtwvif->csa_beacon_work);
+
 	mutex_lock(&rtwdev->mutex);
 	rtw_write32_clr(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
 	rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_DEFAULT);
@@ -556,6 +571,17 @@ static int rtw_ops_set_tim(struct ieee80211_hw *hw, struct ieee80211_sta *sta,
 	return 0;
 }
 
+static void rtw_ops_channel_switch_beacon(struct ieee80211_hw *hw,
+					  struct ieee80211_vif *vif,
+					  struct cfg80211_chan_def *chandef)
+{
+	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
+	struct rtw_vif *rtwvif = (struct rtw_vif *)vif->drv_priv;
+
+	wiphy_delayed_work_queue(hw->wiphy, &rtwvif->csa_beacon_work,
+				 usecs_to_jiffies(interval));
+}
+
 static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			   struct ieee80211_vif *vif, struct ieee80211_sta *sta,
 			   struct ieee80211_key_conf *key)
@@ -626,7 +652,8 @@ static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	}
 
 	/* download new cam settings for PG to backup */
-	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG)
+	if (rtw_get_lps_deep_mode(rtwdev) == LPS_DEEP_MODE_PG &&
+	    !rtw_fw_csa_active(rtwdev))
 		rtw_fw_download_rsvd_page(rtwdev);
 
 out:
@@ -839,6 +866,14 @@ static int rtw_ops_get_antenna(struct ieee80211_hw *hw,
 }
 
 #ifdef CONFIG_PM
+static void rtw_csa_cancel_iter(void *data, struct ieee80211_vif *vif)
+{
+	struct rtw_vif *rtwvif = (struct rtw_vif *)vif->drv_priv;
+	struct rtw_dev *rtwdev = data;
+
+	wiphy_delayed_work_cancel(rtwdev->hw->wiphy, &rtwvif->csa_beacon_work);
+}
+
 static int rtw_ops_suspend(struct ieee80211_hw *hw,
 			   struct cfg80211_wowlan *wowlan)
 {
@@ -846,6 +881,7 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
 	int ret;
 
 	mutex_lock(&rtwdev->mutex);
+	rtw_iterate_vifs(rtwdev, rtw_csa_cancel_iter, rtwdev);
 	ret = rtw_wow_suspend(rtwdev, wowlan);
 	if (ret)
 		rtw_err(rtwdev, "failed to suspend for wow %d\n", ret);
@@ -887,10 +923,19 @@ static void rtw_reconfig_complete(struct ieee80211_hw *hw,
 	mutex_unlock(&rtwdev->mutex);
 }
 
+static void rtw_csa_active_iter(void *data, struct ieee80211_vif *vif)
+{
+	bool *csa_active = data;
+
+	if (vif->bss_conf.csa_active)
+		*csa_active = true;
+}
+
 static int rtw_ops_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			   struct ieee80211_scan_request *req)
 {
 	struct rtw_dev *rtwdev = hw->priv;
+	bool csa_active = false;
 	int ret;
 
 	if (!rtw_fw_feature_check(&rtwdev->fw, FW_FEATURE_SCAN_OFFLOAD))
@@ -900,6 +945,13 @@ static int rtw_ops_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		return -EBUSY;
 
 	mutex_lock(&rtwdev->mutex);
+
+	rtw_iterate_vifs(rtwdev, rtw_csa_active_iter, &csa_active);
+	if (csa_active) {
+		mutex_unlock(&rtwdev->mutex);
+		return -EBUSY;
+	}
+
 	rtw_hw_scan_start(rtwdev, vif, req);
 	ret = rtw_hw_scan_offload(rtwdev, vif, true);
 	if (ret) {
@@ -973,6 +1025,7 @@ const struct ieee80211_ops rtw_ops = {
 	.sta_add		= rtw_ops_sta_add,
 	.sta_remove		= rtw_ops_sta_remove,
 	.set_tim		= rtw_ops_set_tim,
+	.channel_switch_beacon	= rtw_ops_channel_switch_beacon,
 	.set_key		= rtw_ops_set_key,
 	.ampdu_action		= rtw_ops_ampdu_action,
 	.can_aggregate_in_amsdu	= rtw_ops_can_aggregate_in_amsdu,
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 0f23498b5c96..9f3da59b208f 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2293,7 +2293,8 @@ int rtw_register_hw(struct rtw_dev *rtwdev, struct ieee80211_hw *hw)
 	hw->wiphy->available_antennas_rx = hal->antenna_rx;
 
 	hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS |
-			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP;
+			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP |
+			    WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 
 	hw->wiphy->features |= NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
 	hw->wiphy->max_scan_ssids = RTW_SCAN_MAX_SSIDS;
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index d59f6e323adf..9ab8fbbe37c6 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -839,6 +839,8 @@ struct rtw_vif {
 	struct rtw_traffic_stats stats;
 
 	struct rtw_bfee bfee;
+
+	struct wiphy_delayed_work csa_beacon_work;
 };
 
 struct rtw_regulatory {
-- 
2.55.0

