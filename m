Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FFD495050
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454997; cv=none; b=OdkAqCbDSvIzUzv9IR6S63dmqU4ucZ0lYcb08wgWDoyUxm8IYWaaG0Kx9jZq8KiS7wQ0oKESxYYsT/kgjQbSQk+37j+q47TgtfGtuBegRRdzeskf6EIypMWXn6HUbYcP2VAhkt1wWwt4LcMqUGUmR+PMQwNc8ZJEm7c03MBvtLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454997; c=relaxed/simple;
	bh=xtqW2t6U4jA5AiaQeEAmtfis7i9MMzQZBXitVBMb0gc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MKFiC2SqimRkzYCCIOpeIsTjSgmzLWvDVVhOSblnO5MPjuwgZw2S6GOWkHMiXPPz0/fKG4Rui7OEMOPDELEwOQC41CG/Sl9S9Yt+RbdtrKx/zzT+9r6r2wc9rIJiweTtAEgNR8DJPod1PHB4Xr4w4XJElcXktSXytagFc5Y7q/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f8281066c4so6702113b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454995; x=1792059795;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NKTQKj+HbiuDg2ygRxPpEbKcFjItV4NRbnxi8nTtwx4=;
        b=Q30TCpCL57SpwSCVPYmaZ1HcOSmmlFDn9GG/ChiYgJNBk2+90EyUZPjejXZfVtw8Me
         5XmWX1PsTeTxaSz05pUeYOPK9rA2Ls0yWLvnivPOlZ3hagerXP5+b0NBJzwdddinJkPS
         Rk6bxqVQaAXN7aX1X5/KVFAeoD7wWii/EmwJrjCdZZAX3l8t7oE1oxAX1JTf/2fvwIbT
         YtQwUhgVAGOon2HGpJ45HFCKaIqQS+PqtmdEIBy0jO8R8LfaoJ5y6iAJpkU+tDIeOoyl
         3wljt9DkbNhsPBdKtd8c6lKKpgsUxsUJcYsRBxuf8odGXuMS1JiFSk1TauapmLQtzuK9
         nQ4Q==
X-Gm-Message-State: AFuF++lDjRxsOpyyBohnVW5jZXv6U0mlQvvR/oJQ2nTxTwsBlTyV8G+W
	lfibWNTvZ/+WIxNt/lf9hA7KbV/59vNIs4rOmVRHF0A098/393ZKVb76kZzg0ZVVgiY/jFJPgwE
	yb2u+c59BOcs1GmFfDpT1P1EOciK37JIW3joDz3RgvguVWe0/bS8ldSJb7RA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2e4f:b0:4b9:a829:f00e with SMTP id
 5614622812f47-4fc46480531mr4235671b6e.26.1791454995186; Thu, 08 Oct 2026
 03:23:15 -0700 (PDT)
Date: Thu, 08 Oct 2026 03:23:15 -0700
In-Reply-To: <6a88eb8b.ae6ddae5.3da009.0049.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac76f13.70ed5d86.2ac85.0004.GAE@google.com>
Subject: Forwarded: [PATCH] wifi: cfg80211: defer self-managed regulatory
 processing to per-wiphy work
From: syzbot <syzbot+2ad5f42cd6ca88f0107c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] wifi: cfg80211: defer self-managed regulatory processing to per-wiphy work
Author: emmaonana18@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

reg_process_self_managed_hints() currently acquires each registered
wiphy's mutex while called with RTNL held. This can deadlock with a
concurrent path that holds a wiphy mutex and waits for RTNL.

Defer processing of individual self-managed regulatory hints to the
per-wiphy wiphy_work instead. The dispatcher, which runs with RTNL held,
only checks whether a regulatory hint is pending and queues the
corresponding work item.

The regulatory update is then processed with the wiphy mutex held and
without RTNL. This removes the RTNL -> wiphy mutex acquisition from the
synchronous regulatory-processing path.

Also start the regulatory channel-enforcement grace timer only if a
self-managed regulatory update was actually applied, preserving the
ordering between regulatory updates and channel enforcement while
avoiding spurious timers. Cancel any pending self-managed work during
wiphy regulatory deregistration.

Fixes: f4e72e375807 ("wifi: cfg80211: reduce RTNL holding in regulatory enforcement")
Reported-by: syzbot+2ad5f42cd6ca88f0107c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2ad5f42cd6ca88f0107c
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
index 11665e0a7efc..22022e7da7ec 100644
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
+		has_hint = !!rdev->requested_regd;
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

