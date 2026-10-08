Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2AC233134
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791421926; cv=none; b=tIs/UjBrqwKR9M/IYDbyOx6H2qArRzOncU7NS/ripTR2PrAN5O7OWDzFEd6grcG31tRdS8aTk8k/ewY1z7x/WDDJ9e32BZvNcoQKMmGqWnv8ROKhNnkXHgmJG8B/3n+ijwuCIbod9rqWNeXNln4bplFbVroxUbb6P3VEUZiOk0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791421926; c=relaxed/simple;
	bh=F7gh/jnJzeSdNEZTsXu+VKDB5whuZGw6HM9CeVO3EzM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bKkh7ZLp+fZgzF3ZoY+ioHzjvycgFnV965itYu5pHpLeANtv4OGtkF17mSD97wCwJ4rKaUUljb7XDcSlxwWT4HWbSVkFNszqRYFXWoKr7t2LCEvgu2dP+AccChNCN5sefjw9TDdx29R4uEpWZ95punMwORY3r9BCbXGc4RBObHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4fb73e868aaso3470135b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791421924; x=1792026724;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ttmnAuOv5c4ZLqNvAx4z95Cb6z0wwMRnU4CEdaqUjK8=;
        b=FoiesDoHyzHvpQT67r1FuP/tSzybMYiK4VJ3l0rLILYLIWRi+qclQwYzCGxjtHX0t5
         9b2jhf/zCFPmFNEM1Bf7E5KwkRwcXNjZR2UvJeFH/6YwADXy1zdfkgYK54hb5GXZZJ91
         l72uXkyWfp9Te1/abJ1Tn1lNUx/dtRfUn/MdMClKB51iHx7t42gt9TPlblt3a1ppduHz
         ZAM5XNMjCwQ1Rv9jNW5gSsUONWPnnnRQZ5hjSDE9op/c9pGc2CSjgVf1qYh70hquChvX
         PSl90lpC0rzH6H5mgwOU9xp8P9ynSjGjvay61MOt39vF8z8lyM9F+PjUbd9KQokE5UIO
         P5Dw==
X-Gm-Message-State: AFuF++nOoixTs1KqEfhleHBDRevZ8AFHddvTzFb93Xei2WedPpJ9mp8W
	BGDnRHmEsZisphhU4xqmIiK8qkbhn5MThTdcfRTI47xjJUONtJwQq58PMcEinsM3hGhPcW8EKzZ
	z4O27vLXAy8xUhbLoFVh6R5T4UXkNbGDnQguro7oL0n63FE5qyG808srq5L0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6611:b0:4fa:95f4:3334 with SMTP id
 5614622812f47-4fc46c9f436mr3548461b6e.42.1791421923870; Wed, 07 Oct 2026
 18:12:03 -0700 (PDT)
Date: Wed, 07 Oct 2026 18:12:03 -0700
In-Reply-To: <6a88eb8b.ae6ddae5.3da009.0049.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac6ede3.a36481ec.1ba24c.0003.GAE@google.com>
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

Also start the regulatory channel-enforcement grace timer after the
self-managed regulatory update has been processed, preserving the
existing ordering between regulatory updates and channel enforcement.

Fixes: f4e72e375807 ("wifi: cfg80211: check channel list asynchronously")
Reported-by: syzbot+2ad5f42cd6ca88f0107c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2ad5f42cd6ca88f0107c
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 net/wireless/core.c |  1 +
 net/wireless/core.h |  1 +
 net/wireless/reg.c  | 37 +++++++++++++++++++++++++------------
 net/wireless/reg.h  |  7 +++++++
 4 files changed, 34 insertions(+), 12 deletions(-)

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
index 11665e0a7efc..00244341fde1 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -3188,7 +3188,6 @@ static void reg_process_self_managed_hint(struct wiphy *wiphy)
 	enum nl80211_band band;
 	struct regulatory_request request = {};
 
-	ASSERT_RTNL();
 	lockdep_assert_wiphy(wiphy);
 
 	spin_lock(&reg_requests_lock);
@@ -3219,6 +3218,14 @@ static void reg_process_self_managed_hint(struct wiphy *wiphy)
 	nl80211_send_wiphy_reg_change_event(&request);
 }
 
+void reg_process_self_managed_hint_wk(struct wiphy *wiphy, struct wiphy_work *work)
+{
+	lockdep_assert_held(&wiphy->mtx);
+
+	reg_process_self_managed_hint(wiphy);
+	reg_check_channels();
+}
+
 static void reg_process_self_managed_hints(void)
 {
 	struct cfg80211_registered_device *rdev;
@@ -3226,12 +3233,17 @@ static void reg_process_self_managed_hints(void)
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
@@ -3618,15 +3630,10 @@ static void restore_regulatory_settings(bool reset_user, bool cached)
 static bool is_wiphy_all_set_reg_flag(enum ieee80211_regulatory_flags flag)
 {
 	struct cfg80211_registered_device *rdev;
-	struct wireless_dev *wdev;
 
 	for_each_rdev(rdev) {
-		guard(wiphy)(&rdev->wiphy);
-
-		list_for_each_entry(wdev, &rdev->wiphy.wdev_list, list) {
-			if (!(wdev->wiphy->regulatory_flags & flag))
-				return false;
-		}
+		if (!(rdev->wiphy.regulatory_flags & flag))
+			return false;
 	}
 
 	return true;
@@ -4144,9 +4151,15 @@ void wiphy_regulatory_register(struct wiphy *wiphy)
 
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

