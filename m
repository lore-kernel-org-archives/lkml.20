Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF9A36A350
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440503; cv=none; b=PjvJKftYbI9+jPZTY5O5RKwcvUweSm5IyaSWRjQcTTuo4o1uUkO4lcBOqn4c8MJk58nCPySxH9bS9GlP79CUtMhI3GDfB9uewRc/+D4kesOb6roAzHtOlJXSK7+dccXI2G6nCBXyDcsmQy1cxqe73WllK1gtbqyvh+l5NT61fM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440503; c=relaxed/simple;
	bh=YGw1svKFwue0FWMYxanhavBgvVFAVYIZzILy2UrW3Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwtnqushfkfLLyiol2aLB/ex3EN+/zQKIDAE8q/SoOMNOu0MF6vmx9YYd1T7Yy93jnsDrh17r2Y3aJqtN8hHcWey4REsEX6iu/dZmwg5/4DhSUE4gk93w75fs2IU62g3A3y3keOYTwz9atNWJ8oL5jR0NluOdTnuJQ2SNQcX/eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ik4o2BnO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ik4o2BnO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso3570305e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791440493; x=1792045293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ppRDdUqsRWIIj/zSrXTINKlIyhIsh0J2cDhvQY1CdU=;
        b=Ik4o2BnOarXzeYikSgEA5q+oSumteHm/fiTmgrPOIed3rd1Ic5w/qeYHJrRxeT5KtG
         cs3Y+WiNXdUGZscS7TI0D3H9gnQlhrlawoPA9U3gQmbhJQmguuDLApTgk556GjNjQB18
         QM1t9juljUySZK6RVzl18DST7zV52Vld7gq7UsB/1myIcdtgalO32NxyqpdhLyunNH/5
         gQ6XvB//0LGmrvSPIDcjewcUcFvWMqHFH9GrL1Z6FYcFC8x29j8N3TO0F4AmmB9dDo5n
         AiUmDEMiCVW8NLP5Q4UVeGyyTZKouuSIjTmgbSK4FWsSxD5n4EAuB+cc1KomHDIsKDyk
         8hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440493; x=1792045293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ppRDdUqsRWIIj/zSrXTINKlIyhIsh0J2cDhvQY1CdU=;
        b=ClQZOkWRw76yN4PlDqjH9DPsk5QZ+r5CoQbduS4fZ8yTMesD7IphRoGUTSzf2nZE6d
         pagme9HkQbmh2kS4zo8UPFisSkTIl/JjxThAUTjYS+e0eLfvj3bN3CptZB/F9xndiZdt
         Apm0Uze8QHZ2gowrgwh0ZijsmzWlu5/1O7WKIqu6jLSnFn2oQ1Bm1Pc3C02ZqlPRcBkV
         I75EfghXy7NHWjd2ABpU2pDX5KxbLdVcmMXnnlIrixbd1EFheYeJrd/5cgje117l1muS
         70LuhqrAA17Cv38CNF+xD+tc/s6xRvHOWwGLBnQZVsY/pBHf7hrzNwGJYk+GHeZnbcQY
         eSjA==
X-Forwarded-Encrypted: i=1; AKwUvBw0aBYvb3oZS36mw9Tx4wutPnYhhHN0Azda+6unhssuDUKuDQKTvmWgZNuHV5Vz8dVStk2m0pEjVcfKvIo=@vger.kernel.org
X-Gm-Message-State: AFuF++k4K6KxU7dNM0jI6VgiZMG429mTXIrPEL/qcZwEv+3S8G1byFUc
	2DYlhVmNYW7iqoHjyAbKOwE/Pi39UlSbCWut/VEd9HYhlk9DXj/tbAHCDepFKnpZVf4=
X-Gm-Gg: AYBFou2qiEV6mfUonITb/cLO4EK4I83W8adGbUmME24IZqjqZ122OA4mLrbiggvEYfR
	oyxsdD9PtYMNt05e1Y7shiYr/y1Wla67sYGgl1QKe3MzvuKSg66foEm4M0IX6Pud1RJiFSm8xZY
	kOXcnfMe8XznN7YYIrQ7GKO8EKRdNLbcDAL3sJbn87W+/h0QJt+A0x+i4V5prCMylwXuiX1XWvR
	L+AEJVL1K95lMPEfjV1StqE+xXCL7H6RxuNLVUDf4FrU4ze+stpp1X2nM2MA6L7d64WQNxvgDqY
	ywCVN4t8RcTmCKfiqMxVFqOuEi2mi8uagB/6DnbK77dujdLcpR5DrsXUpKYYxsG6xnDPlt3GQ8y
	VwnfGxjw55MjrBCxzhg/QCvNiPvrC2TT+lqB0CzNtBJMEzsNkxnshEtOQzHqPAM42tAE2LvZ6vi
	qZo7+nBvXgk8D5JovLyBud7M8C8pzoyXd7Cd6TUuIo3wbdBKFIEVRwwFRZoLu+d6/iuz3Y6Kb6T
	ENr4g==
X-Received: by 2002:a05:600c:3111:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a185160ba8mr28749355e9.0.1791440493046;
        Wed, 07 Oct 2026 23:21:33 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843e3356sm40309455e9.14.2026.10.07.23.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:21:32 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v5 2/3] wifi: rtw88: update the beacon from a wiphy work
Date: Thu,  8 Oct 2026 08:21:28 +0200
Message-ID: <1d68c868609a8d63dc884c155023c2e100dca886.1791362281.git.mehmet.fide@screeningeagle.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791362281.git.mehmet.fide@screeningeagle.com>
References: <cover.1791362281.git.mehmet.fide@screeningeagle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

set_tim() queues update_beacon_work to rebuild the reserved page with
the new TIM. Make it a wiphy work so that it runs under the wiphy lock
like the other beacon downloads and can look at mac80211 state; the
next patch needs that to tell whether a channel switch is being
announced.

rtw_core_stop() runs without the wiphy lock on the IPS path and can no
longer cancel the work, so the work checks RTW_FLAG_RUNNING under the
driver mutex instead, as the watchdog and the C2H work do.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
New in v5.

 drivers/net/wireless/realtek/rtw88/fw.c       | 10 +++++++++-
 drivers/net/wireless/realtek/rtw88/fw.h       |  2 +-
 drivers/net/wireless/realtek/rtw88/mac80211.c |  2 +-
 drivers/net/wireless/realtek/rtw88/main.c     |  4 ++--
 drivers/net/wireless/realtek/rtw88/main.h     |  2 +-
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 3cd17a3bb494..e01d79a70e37 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1802,14 +1802,22 @@ int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev)
 	return ret;
 }
 
-void rtw_fw_update_beacon_work(struct work_struct *work)
+void rtw_fw_update_beacon_work(struct wiphy *wiphy, struct wiphy_work *work)
 {
 	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
 					      update_beacon_work);
 
+	lockdep_assert_wiphy(wiphy);
+
 	mutex_lock(&rtwdev->mutex);
+
+	if (!test_bit(RTW_FLAG_RUNNING, rtwdev->flags))
+		goto out;
+
 	rtw_fw_download_rsvd_page(rtwdev);
 	rtw_send_rsvd_page_h2c(rtwdev);
+
+out:
 	mutex_unlock(&rtwdev->mutex);
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/fw.h b/drivers/net/wireless/realtek/rtw88/fw.h
index 48ad9ceab6ea..d433f454094d 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.h
+++ b/drivers/net/wireless/realtek/rtw88/fw.h
@@ -863,7 +863,7 @@ void rtw_add_rsvd_page_pno(struct rtw_dev *rtwdev,
 void rtw_add_rsvd_page_sta(struct rtw_dev *rtwdev,
 			   struct rtw_vif *rtwvif);
 int rtw_fw_download_rsvd_page(struct rtw_dev *rtwdev);
-void rtw_fw_update_beacon_work(struct work_struct *work);
+void rtw_fw_update_beacon_work(struct wiphy *wiphy, struct wiphy_work *work);
 void rtw_send_rsvd_page_h2c(struct rtw_dev *rtwdev);
 int rtw_dump_drv_rsvd_page(struct rtw_dev *rtwdev,
 			   u32 offset, u32 size, u32 *buf);
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 2a9b09fa76e7..7fcf91bfe761 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -551,7 +551,7 @@ static int rtw_ops_set_tim(struct ieee80211_hw *hw, struct ieee80211_sta *sta,
 {
 	struct rtw_dev *rtwdev = hw->priv;
 
-	ieee80211_queue_work(hw, &rtwdev->update_beacon_work);
+	wiphy_work_queue(hw->wiphy, &rtwdev->update_beacon_work);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 0f23498b5c96..647393af9fd9 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1554,7 +1554,6 @@ void rtw_core_stop(struct rtw_dev *rtwdev)
 	mutex_unlock(&rtwdev->mutex);
 
 	cancel_work_sync(&rtwdev->c2h_work);
-	cancel_work_sync(&rtwdev->update_beacon_work);
 	cancel_delayed_work_sync(&rtwdev->watch_dog_work);
 	cancel_delayed_work_sync(&coex->bt_relink_work);
 	cancel_delayed_work_sync(&coex->bt_reenable_work);
@@ -2169,7 +2168,8 @@ int rtw_core_init(struct rtw_dev *rtwdev)
 	INIT_WORK(&rtwdev->c2h_work, rtw_c2h_work);
 	INIT_WORK(&rtwdev->ips_work, rtw_ips_work);
 	INIT_WORK(&rtwdev->fw_recovery_work, rtw_fw_recovery_work);
-	INIT_WORK(&rtwdev->update_beacon_work, rtw_fw_update_beacon_work);
+	wiphy_work_init(&rtwdev->update_beacon_work,
+			rtw_fw_update_beacon_work);
 	INIT_WORK(&rtwdev->ba_work, rtw_txq_ba_work);
 	skb_queue_head_init(&rtwdev->c2h_queue);
 	skb_queue_head_init(&rtwdev->coex.queue);
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index d59f6e323adf..bb48529759c3 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2093,7 +2093,7 @@ struct rtw_dev {
 	struct work_struct c2h_work;
 	struct work_struct ips_work;
 	struct work_struct fw_recovery_work;
-	struct work_struct update_beacon_work;
+	struct wiphy_work update_beacon_work;
 
 	/* used to protect txqs list */
 	spinlock_t txq_lock;
-- 
2.55.0

