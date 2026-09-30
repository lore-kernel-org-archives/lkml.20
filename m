Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B23D0935
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754296; cv=none; b=R6vSYiQH3p1PoDRGdX47+sNtCZ/d/RIGdSxmhA8A4F0xhqp+bMHc4NSuhA68aLrdtU8rx5WEERfmeP/WTKm1MT4FxkUa3kZaxVL8XlUy5QU8TzLjSlaU/FZLqy0dpUJVwpUXJFx6t/JnCfNsUuow0CFJ4krNNJJ2RnhXJHAkYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754296; c=relaxed/simple;
	bh=h2L64es3pLRp+Ca8n/gXHr7JMEK9hubNeLUDmn8LiNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NzqrnVd1LjGZWBNUscIT04x2wUJgfk9p0xyFApg5ScUbR6Dim7uLKDNSLgZif0N1FqoO7G1JrRFB6Er1xvfkTmHuG5HZ2mOgah3WATXv0f/ZW3mTz3md9r1+jbztg88hOac3UujEu04giyRgb6MpdqrjP0aVrq0iAVcwDHLZSgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYEk8whG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYEk8whG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso31600375e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754293; x=1791359093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Anh174fYqL+IyyMyFQRLhu3moaI8jUFeFhObkFLdPrY=;
        b=UYEk8whGkxk4QhPhOeeHPRO7riKvGVfVhdqbNblhoV2dSjX7SDAlCp27c+Y98USrIj
         VYUZJDMAhMoXsgeKtn2PVO3MFnplnjB9u2D7DBYRCRgIC6p4PH+EIZFehx0qK11X1eX5
         sAg5pnoZGrfeVAiGZnyHstUFEnxBtLLJ7duhJkZIlbL0qiU5he3kiv2bZgvd1qd9bQKj
         c8MAQFeSYCWsdhillP/zp0TijRVp1UIeH5Li/wzUHNOncubRkQTyfeegOFdMFxghf6IF
         k3skpsYTlVgvkKra9A7cpPEYLEIYYDtmyZCG0w3C5usYAQGiizBc7lGfgJdsFVVvEx4M
         h3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754293; x=1791359093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Anh174fYqL+IyyMyFQRLhu3moaI8jUFeFhObkFLdPrY=;
        b=YJaj9f1CUSRZXY1xbG5RJ1kPrfloxf+iCDN+faXj/Ty3vN7MzkpwPVI8edWUzYO+eV
         621WcJ6rkTXMUX8qIjS+YGrOqOz8hPcF5tYt8EGfImi3hdtACSIFmB7IERzuUSgupuwt
         2NvBFzjL4KU09I2rGUPr3vNORbD8TqAN1TAPYZlEg4dSOwGjdrf/5VBJXTT6Wr8O/qeI
         m6G9ZBwj9uisgJnfqCu5UrZqRDGTO0fqN2JdltnLM5rJ59J84aKl68L+7LMjr+mppxIs
         Od8VvASwmkPOde1BGqZU4X9ad65I33GVY86fV2FYe9sqiCVrECE81XeRsIqvXXqcqoW6
         ealg==
X-Forwarded-Encrypted: i=1; AKwUvBxNE6kKczer53he6bGKPTOpZQaKsORi8FSQaY2wScNOyf9vacA0tSU7LfXjS71d2z40HVTNimT8KveMWdM=@vger.kernel.org
X-Gm-Message-State: AFuF++nH+nLWqPXFgJHS+2xvWa5JfQ7Cxwbrgv0b31Egexa38Y5j977i
	4iZaWpzu5Ug0RHxKkhxH1IHhx/O+QxNgXg45kgN+h6iG6RdFwEMN0MxF
X-Gm-Gg: AYBFou0o4g42IHHXUe9z/B9PcLjoc4EZvRPVbkW7wXzIGjhqGLP4LhYI8z55/Whbs4a
	t6kG45/htNOVEpi+RV2bQV4R6B5JCmSw8wugkKwTUp6MkNz9R9jplvtOiLYeNT38vLY+/s9pwDl
	R+phsIY+LeuNHaQ22GIPXtPOYksGefZNY2Z7SUp7nKnma+BzVTO7yLMEwze0noglNdathP/cFSa
	AhUtJRCM3kjQxkTI4O7RSUcUxEeTajzuwlTtfOv83jdsHa12AkFIfXDZG3p6ZexZ77DjFXK3ADE
	og5j30DxbHAXxfkdoWqcd3twEGUdHXyE6dVvzxaaEbk5EM2vjPK+ob+X8xqZhdRbxD/begUHEko
	EI6hgs1tTfjBtSFam2+lihgYeG0eNZB5aZHYUYFILA2obvAu0W8MNEsag+N6zwFpdEhBg7APmhU
	Udo3LF7GA3x7JNyIbH7GI0Cv5NQ/qVLyYGjnfcE8Bcb73LcKFntYHXWZO9O3repQ6Y9h+OmODz0
	5xH
X-Received: by 2002:a05:600c:a46:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-4a01afe8457mr7100685e9.6.1790754288819;
        Wed, 30 Sep 2026 00:44:48 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017bad33fsm23934595e9.4.2026.09.30.00.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:44:48 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 2/2] wifi: rtw88: support channel switch in AP mode
Date: Wed, 30 Sep 2026 09:44:44 +0200
Message-ID: <20260930074444.1991223-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930074444.1991223-1-mehmet.fide@gmail.com>
References: <20260930074444.1991223-1-mehmet.fide@gmail.com>
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

The work is a wiphy delayed work of the device, like
update_beacon_work: rtw88 runs one beaconing interface, a hw restart
replays add_interface without remove_interface, and the wiphy lock
serializes it with the mac80211 state it reads. It is cancelled when
the AP stops, when the vif goes away and on WoWLAN suspend, and a
hardware scan is refused while a switch is announced, since it would
take the AP off the channel its stations count down to.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c       | 41 +++++++++++++++++
 drivers/net/wireless/realtek/rtw88/fw.h       |  1 +
 drivers/net/wireless/realtek/rtw88/mac80211.c | 46 +++++++++++++++++++
 drivers/net/wireless/realtek/rtw88/main.c     |  4 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  1 +
 5 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 49f09a9f4ed6..1ad25e0539c4 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1813,6 +1813,47 @@ void rtw_fw_update_beacon_work(struct work_struct *work)
 	mutex_unlock(&rtwdev->mutex);
 }
 
+/* renew the countdown in the firmware's beacon page until it completes */
+void rtw_fw_csa_beacon_work(struct wiphy *wiphy, struct wiphy_work *work)
+{
+	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
+					      csa_beacon_work.work);
+	struct rtw_rsvd_page *rsvd_pkt;
+	struct ieee80211_vif *vif;
+	unsigned int delay;
+
+	lockdep_assert_wiphy(wiphy);
+
+	mutex_lock(&rtwdev->mutex);
+
+	if (!test_bit(RTW_FLAG_RUNNING, rtwdev->flags))
+		goto out;
+
+	rsvd_pkt = list_first_entry_or_null(&rtwdev->rsvd_page_list,
+					    struct rtw_rsvd_page, build_list);
+	if (!rsvd_pkt || rsvd_pkt->type != RSVD_BEACON)
+		goto out;
+
+	vif = rtwvif_to_vif(rsvd_pkt->rtwvif);
+	if (!vif->bss_conf.csa_active)
+		goto out;
+
+	delay = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
+
+	if (!ieee80211_beacon_cntdwn_is_complete(vif, 0)) {
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+
+		wiphy_delayed_work_queue(wiphy, &rtwdev->csa_beacon_work,
+					 usecs_to_jiffies(delay));
+	} else {
+		ieee80211_csa_finish(vif, 0);
+	}
+
+out:
+	mutex_unlock(&rtwdev->mutex);
+}
+
 static void rtw_fw_read_fifo_page(struct rtw_dev *rtwdev, u32 offset, u32 size,
 				  u32 *buf, u32 residue, u16 start_pg)
 {
diff --git a/drivers/net/wireless/realtek/rtw88/fw.h b/drivers/net/wireless/realtek/rtw88/fw.h
index 48ad9ceab6ea..982f46c03644 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.h
+++ b/drivers/net/wireless/realtek/rtw88/fw.h
@@ -864,6 +864,7 @@ void rtw_add_rsvd_page_sta(struct rtw_dev *rtwdev,
 			   struct rtw_vif *rtwvif);
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev);
 void rtw_fw_update_beacon_work(struct work_struct *work);
+void rtw_fw_csa_beacon_work(struct wiphy *wiphy, struct wiphy_work *work);
 void rtw_send_rsvd_page_h2c(struct rtw_dev *rtwdev);
 int rtw_dump_drv_rsvd_page(struct rtw_dev *rtwdev,
 			   u32 offset, u32 size, u32 *buf);
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 2a9b09fa76e7..7c2a373faff8 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -235,6 +235,10 @@ static void rtw_ops_remove_interface(struct ieee80211_hw *hw,
 	rtw_dbg(rtwdev, RTW_DBG_STATE, "stop vif %pM mac_id %d on port %d\n",
 		vif->addr, rtwvif->mac_id, rtwvif->port);
 
+	if (rtwvif->net_type == RTW_NET_AP_MODE ||
+	    rtwvif->net_type == RTW_NET_AD_HOC)
+		wiphy_delayed_work_cancel(hw->wiphy, &rtwdev->csa_beacon_work);
+
 	mutex_lock(&rtwdev->mutex);
 
 	rtw_leave_lps_deep(rtwdev);
@@ -375,6 +379,13 @@ static void rtw_conf_tx(struct rtw_dev *rtwdev,
 		__rtw_conf_tx(rtwdev, rtwvif, ac);
 }
 
+/* renew the channel switch countdown one beacon interval from now */
+static void rtw_csa_beacon_queue(struct rtw_dev *rtwdev, u16 beacon_int)
+{
+	wiphy_delayed_work_queue(rtwdev->hw->wiphy, &rtwdev->csa_beacon_work,
+				 usecs_to_jiffies(ieee80211_tu_to_usec(beacon_int)));
+}
+
 static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 				     struct ieee80211_vif *vif,
 				     struct ieee80211_bss_conf *conf,
@@ -438,6 +449,9 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
 		rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
+		/* a hw restart replays the beacon, not channel_switch_beacon */
+		if (conf->csa_active)
+			rtw_csa_beacon_queue(rtwdev, conf->beacon_int);
 	}
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
@@ -489,6 +503,8 @@ static void rtw_ops_stop_ap(struct ieee80211_hw *hw,
 {
 	struct rtw_dev *rtwdev = hw->priv;
 
+	wiphy_delayed_work_cancel(hw->wiphy, &rtwdev->csa_beacon_work);
+
 	mutex_lock(&rtwdev->mutex);
 	rtw_write32_clr(rtwdev, REG_TCR, BIT_TCR_UPDATE_HGQMD);
 	rtw_write16(rtwdev, REG_ATIMWND, ATIMWND_DEFAULT);
@@ -556,6 +572,16 @@ static int rtw_ops_set_tim(struct ieee80211_hw *hw, struct ieee80211_sta *sta,
 	return 0;
 }
 
+static void rtw_ops_channel_switch_beacon(struct ieee80211_hw *hw,
+					  struct ieee80211_vif *vif,
+					  struct cfg80211_chan_def *chandef)
+{
+	struct rtw_dev *rtwdev = hw->priv;
+
+	/* the beacon that starts the countdown was just downloaded */
+	rtw_csa_beacon_queue(rtwdev, vif->bss_conf.beacon_int);
+}
+
 static int rtw_ops_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			   struct ieee80211_vif *vif, struct ieee80211_sta *sta,
 			   struct ieee80211_key_conf *key)
@@ -845,6 +871,8 @@ static int rtw_ops_suspend(struct ieee80211_hw *hw,
 	struct rtw_dev *rtwdev = hw->priv;
 	int ret;
 
+	wiphy_delayed_work_cancel(hw->wiphy, &rtwdev->csa_beacon_work);
+
 	mutex_lock(&rtwdev->mutex);
 	ret = rtw_wow_suspend(rtwdev, wowlan);
 	if (ret)
@@ -887,10 +915,19 @@ static void rtw_reconfig_complete(struct ieee80211_hw *hw,
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
@@ -900,6 +937,14 @@ static int rtw_ops_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		return -EBUSY;
 
 	mutex_lock(&rtwdev->mutex);
+
+	/* the stations count down to the new channel and expect the AP there */
+	rtw_iterate_vifs(rtwdev, rtw_csa_active_iter, &csa_active);
+	if (csa_active) {
+		mutex_unlock(&rtwdev->mutex);
+		return -EBUSY;
+	}
+
 	rtw_hw_scan_start(rtwdev, vif, req);
 	ret = rtw_hw_scan_offload(rtwdev, vif, true);
 	if (ret) {
@@ -973,6 +1018,7 @@ const struct ieee80211_ops rtw_ops = {
 	.sta_add		= rtw_ops_sta_add,
 	.sta_remove		= rtw_ops_sta_remove,
 	.set_tim		= rtw_ops_set_tim,
+	.channel_switch_beacon	= rtw_ops_channel_switch_beacon,
 	.set_key		= rtw_ops_set_key,
 	.ampdu_action		= rtw_ops_ampdu_action,
 	.can_aggregate_in_amsdu	= rtw_ops_can_aggregate_in_amsdu,
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 0f23498b5c96..6a2c333d1a01 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2170,6 +2170,7 @@ int rtw_core_init(struct rtw_dev *rtwdev)
 	INIT_WORK(&rtwdev->ips_work, rtw_ips_work);
 	INIT_WORK(&rtwdev->fw_recovery_work, rtw_fw_recovery_work);
 	INIT_WORK(&rtwdev->update_beacon_work, rtw_fw_update_beacon_work);
+	wiphy_delayed_work_init(&rtwdev->csa_beacon_work, rtw_fw_csa_beacon_work);
 	INIT_WORK(&rtwdev->ba_work, rtw_txq_ba_work);
 	skb_queue_head_init(&rtwdev->c2h_queue);
 	skb_queue_head_init(&rtwdev->coex.queue);
@@ -2293,7 +2294,8 @@ int rtw_register_hw(struct rtw_dev *rtwdev, struct ieee80211_hw *hw)
 	hw->wiphy->available_antennas_rx = hal->antenna_rx;
 
 	hw->wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS |
-			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP;
+			    WIPHY_FLAG_TDLS_EXTERNAL_SETUP |
+			    WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 
 	hw->wiphy->features |= NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
 	hw->wiphy->max_scan_ssids = RTW_SCAN_MAX_SSIDS;
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index d59f6e323adf..21d65692e809 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2094,6 +2094,7 @@ struct rtw_dev {
 	struct work_struct ips_work;
 	struct work_struct fw_recovery_work;
 	struct work_struct update_beacon_work;
+	struct wiphy_delayed_work csa_beacon_work;
 
 	/* used to protect txqs list */
 	spinlock_t txq_lock;
-- 
2.55.0

