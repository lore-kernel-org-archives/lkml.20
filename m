Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CBD3B14C4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791585094; cv=none; b=JQa4ksnynvdJUXfAlfMRe/iUBTgbdanLubuon1k+HtQSkdULv94vbez97yYDM1za4Zb3Jsk7usPjkeWHuEGTDWXNxIPW4xtwDnCTMqOEi26qmbciOg73PnnLU5beOugcD53o7vOORFvc4t1qeCsZCdQGtrA62sIh4lx3Rww9jOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791585094; c=relaxed/simple;
	bh=A/kcRKmJR7ozCn7Cl71ZSCtr5qDqDq7RiBTaUIROmyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOwvKSXSrjg76s5d82ElRvpSK2fZmQps6E0NfUaWuXlAMjyxQ1AmxzUHawsKJroRb/pGD/OQV0wgtvF295om9gfweWpOgbGjcXhLpT+RUFq1eyBRQ/CiOCIexRYNUOKAoZSujcEjvivES6rLnqYaum1PoGXAY3kvb8Spc5Guks8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2TFtt9b; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2TFtt9b"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49ff639372eso282585e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791585090; x=1792189890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWZkp+NCndvQueQ6E2vgtu4DQoR7geHPX3xAT83ymnk=;
        b=k2TFtt9bWW0OYERa7vi1cRp44lK5lURMFrK+Q/di8x0Uvbg6SrRDfXXxPv/bujI7D2
         C5RKJL+yL0gvv3Pj8rGkkr84vZrMAEPB6bSFpSU81xxmTZ3t+vm7LpN5o2Cles0b4mqL
         MSjtEHWZ8BIA5tkH63XRQvRLJs/ZDnx/EAAvTYG+JQpwKgqx3ZwkvMVNKMu9HUdbyfAt
         BLSa+skhXF2raIXC916OW9lX0rBG9WKr3IVjC5mPl/Xzx9vyInTnccNSCzIdt5zHFV98
         P1W+EVcSB6+cxrvROJ+VSfrNfErQHa1pNZ/ZWFza7ojeLrYai154kMux0QMoaZqB2Mc6
         t1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791585090; x=1792189890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWZkp+NCndvQueQ6E2vgtu4DQoR7geHPX3xAT83ymnk=;
        b=AJm8M8JCl/BXTORXd7j9BA/qOs9ySHzzCRgdNuLeTbaXLEoI6rzAkRp7eM+KLmQ27k
         Mxkw5q/LfqHFXWTdLz2DNF/3ueKA9vm2EeqN0SZhuM1SYbdz+xZZJcLdTjM9iJqBx88u
         u52ZK/9l/WyYB3KQne7C1wDX1xHWSOrFbTngxo1KkroFpebxEDmDBF+/B0puWNTqqSaS
         Px0moMWOg352/ACxYSbh95TjfDziXCTM0br0CBsXGgaG9fAewqzKJ1YrRpMSyu0ejKm9
         nE3T/2gf6mnzvdmpHI0RlQySKk+OOBOR5LxmPiDlSDs1fg19N7cL9kAsAjUaN9z3UkRq
         BXkg==
X-Forwarded-Encrypted: i=1; AKwUvBy//LxwR07FGSYz5nFRDfclc95WOgAVxOtAyk8kTQlo2vQJ4JRuzT3iqYgPNSwodwobUAQgh+Cr0+Qbnbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwZP42X/kkiiFQsOkD9WHZxqffayVUn2S9SrsKJHTvbb5X5OCH
	cfqJ4Cv8jjUS1E9ztwTKFjZAVxZr241kaX+tuQaELtT84UbK/XZmaEkcYB+FxdVbMcgLmA==
X-Gm-Gg: AYBFou2nzq3MZPjSlEl34lRzCf+8E48B6+d0lQH0F+nOesKiZtPUcERVm+1Y+EES7xX
	WSIIWFu1QC5YoLr2KvOR3hQu0V6f/imt7GhIFh43mNqb0EB3n262DZ0CAb2nNJ6k0VYLC/GigF8
	DS8XrYrhEn+BTyQr95PA/qypoIkV1dcTCC3LNMno3myYOJ0+MYglwM0vCofQsu1vfVJAn4SEweF
	bFkfyj9F6WAxfaH7Ctmt/ODd4DY8IyvNbROT/y84TSr77c1NHkbOIQ3hzRgz2ob+K62Uf8WTG/H
	10EI80Iv7c/ULxyZIUvHBJ24f61lbamGUrN4g0QbLZ71YyIVpOCMNMTVClCN2g0aFSkZO0AbC6e
	SVO59QS/h/Kvf90xsrxeKQfpmImhSEYMELRd4oYv/lO98PjA3P46xJq2K/vbGvZAsvdapIc/I9Z
	5mhVc3UiLU08+fSpPJ9bbNG6NyuFbUxbEdWvD/J+yMtrA77IZ1JueeKcYA0tWF47iYzOhCkNxNa
	EdaiL/uSCmq4uSEq8oqsSeJeZbyDw==
X-Received: by 2002:a05:600c:1e0f:b0:4a1:8469:e6c8 with SMTP id 5b1f17b1804b1-4a18e46f48fmr62472605e9.1.1791585090364;
        Fri, 09 Oct 2026 15:31:30 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.73.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm130254575e9.8.2026.10.09.15.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:31:29 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: johannes@sipsolutions.net,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH] wifi: cfg80211: defer self-managed regulatory processing to wiphy_work
Date: Fri,  9 Oct 2026 23:31:23 +0100
Message-ID: <20261009223123.10536-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f4e72e375807 ("wifi: cfg80211: reduce RTNL holding in regulatory
enforcement") decoupled channel enforcement from RTNL by offloading
interface verification to per-wiphy wiphy_work, executing under
wiphy->mtx without holding the global RTNL.

However, reg_process_self_managed_hints() still synchronously acquires
wiphy->mtx under RTNL during wiphy registration. Because wiphy_work
callbacks hold wiphy->mtx and can acquire RTNL in dependent work or
driver paths, this creates an ABBA lock inversion between rtnl_mutex and
wiphy->mtx, which can deadlock generic netlink message dispatch.

Extend the wiphy_work architecture to self-managed regulatory processing
by deferring hint handling to per-wiphy work. Under RTNL, only check for
pending requests and queue rdev->reg_self_managed_wk, eliminating the
synchronous wiphy->mtx acquisition. The regulatory domain update and
channel verification then run asynchronously under wiphy->mtx without
RTNL, and pending work is cancelled upon wiphy deregistration.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 net/wireless/core.c |  1 +
 net/wireless/core.h |  1 +
 net/wireless/reg.c  | 39 ++++++++++++++++++++++++++++++---------
 net/wireless/reg.h  |  7 +++++++
 4 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/net/wireless/core.c b/net/wireless/core.c
index cde3ca85494d..3dfbfb0c10f3 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -671,6 +671,7 @@ struct wiphy *wiphy_new_nm(const struct cfg80211_ops *ops, int sizeof_priv,
 	INIT_WORK(&rdev->sched_scan_res_wk, cfg80211_sched_scan_results_wk);
 	wiphy_work_init(&rdev->reg_check_chans_wk, reg_leave_invalid_chans_wk);
 	INIT_WORK(&rdev->reg_leave_nan_wk, reg_leave_invalid_nan_wk);
+	wiphy_work_init(&rdev->reg_self_managed_wk, reg_process_self_managed_hint_wk);
 	INIT_WORK(&rdev->propagate_radar_detect_wk,
 		  cfg80211_propagate_radar_detect_wk);
 	INIT_WORK(&rdev->propagate_cac_done_wk, cfg80211_propagate_cac_done_wk);
diff --git a/net/wireless/core.h b/net/wireless/core.h
index 6138d207caf4..2b3239d0cf1f 100644
--- a/net/wireless/core.h
+++ b/net/wireless/core.h
@@ -116,6 +116,7 @@ struct cfg80211_registered_device {
 	struct work_struct sched_scan_res_wk;
 	struct wiphy_work reg_check_chans_wk;
 	struct work_struct reg_leave_nan_wk;
+	struct wiphy_work reg_self_managed_wk;
 
 	struct cfg80211_chan_def radar_chandef;
 	struct work_struct propagate_radar_detect_wk;
diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 11665e0a7efc..a0965500d81f 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -3180,7 +3180,7 @@ static void reg_process_pending_beacon_hints(void)
 	spin_unlock_bh(&reg_pending_beacons_lock);
 }
 
-static void reg_process_self_managed_hint(struct wiphy *wiphy)
+static bool reg_process_self_managed_hint(struct wiphy *wiphy)
 {
 	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wiphy);
 	const struct ieee80211_regdomain *tmp;
@@ -3188,7 +3188,6 @@ static void reg_process_self_managed_hint(struct wiphy *wiphy)
 	enum nl80211_band band;
 	struct regulatory_request request = {};
 
-	ASSERT_RTNL();
 	lockdep_assert_wiphy(wiphy);
 
 	spin_lock(&reg_requests_lock);
@@ -3197,7 +3196,7 @@ static void reg_process_self_managed_hint(struct wiphy *wiphy)
 	spin_unlock(&reg_requests_lock);
 
 	if (!regd)
-		return;
+		return false;
 
 	tmp = get_wiphy_regdom(wiphy);
 	rcu_assign_pointer(wiphy->regd, regd);
@@ -3217,6 +3216,15 @@ static void reg_process_self_managed_hint(struct wiphy *wiphy)
 		reg_call_notifier(wiphy, &request);
 
 	nl80211_send_wiphy_reg_change_event(&request);
+	return true;
+}
+
+void reg_process_self_managed_hint_wk(struct wiphy *wiphy, struct wiphy_work *work)
+{
+	lockdep_assert_held(&wiphy->mtx);
+
+	if (reg_process_self_managed_hint(wiphy))
+		reg_check_channels();
 }
 
 static void reg_process_self_managed_hints(void)
@@ -3226,12 +3234,17 @@ static void reg_process_self_managed_hints(void)
 	ASSERT_RTNL();
 
 	for_each_rdev(rdev) {
-		guard(wiphy)(&rdev->wiphy);
+		bool has_hint;
 
-		reg_process_self_managed_hint(&rdev->wiphy);
-	}
+		spin_lock(&reg_requests_lock);
+		has_hint = rdev->requested_regd;
+		spin_unlock(&reg_requests_lock);
 
-	reg_check_channels();
+		if (!has_hint)
+			continue;
+
+		wiphy_work_queue(&rdev->wiphy, &rdev->reg_self_managed_wk);
+	}
 }
 
 static void reg_todo(struct work_struct *work)
@@ -4110,8 +4123,8 @@ int regulatory_set_wiphy_regd_sync(struct wiphy *wiphy,
 		return ret;
 
 	/* process the request immediately */
-	reg_process_self_managed_hint(wiphy);
-	reg_check_channels();
+	if (reg_process_self_managed_hint(wiphy))
+		reg_check_channels();
 	return 0;
 }
 EXPORT_SYMBOL(regulatory_set_wiphy_regd_sync);
@@ -4144,9 +4157,17 @@ void wiphy_regulatory_register(struct wiphy *wiphy)
 
 void wiphy_regulatory_deregister(struct wiphy *wiphy)
 {
+	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wiphy);
 	struct wiphy *request_wiphy = NULL;
 	struct regulatory_request *lr;
 
+	spin_lock(&reg_requests_lock);
+	kfree(rdev->requested_regd);
+	rdev->requested_regd = NULL;
+	spin_unlock(&reg_requests_lock);
+
+	wiphy_work_cancel(wiphy, &rdev->reg_self_managed_wk);
+
 	lr = get_last_request();
 
 	if (!reg_dev_ignore_cell_hint(wiphy))
diff --git a/net/wireless/reg.h b/net/wireless/reg.h
index c587079ead8f..4cfac05c6178 100644
--- a/net/wireless/reg.h
+++ b/net/wireless/reg.h
@@ -194,6 +194,13 @@ void reg_leave_invalid_chans_wk(struct wiphy *wiphy, struct wiphy_work *work);
  */
 void reg_leave_invalid_nan_wk(struct work_struct *work);
 
+/**
+ * reg_process_self_managed_hint_wk - process self-managed hint for a wiphy
+ * @wiphy: the wiphy to process
+ * @work: the work struct
+ */
+void reg_process_self_managed_hint_wk(struct wiphy *wiphy, struct wiphy_work *work);
+
 extern const u8 shipped_regdb_certs[];
 extern unsigned int shipped_regdb_certs_len;
 extern const u8 extra_regdb_certs[];
-- 
2.43.0

