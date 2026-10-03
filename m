Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8C93EFFCC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023832; cv=none; b=XlbQsjDoXjpSmzTkiZxRJxUvhqvuCJZpP7WAwmIaxReKRkV//2jVNSAQXajq4d81B/3zj8SKwaOaqTI+ezDo5gexFL4g5avgOxnFo0idu74FrkpYxyICSs8DHqlpW/z/f/tS6FCIAzLN2pN93BDwA2UygTyNUin87SIy0XZbJrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023832; c=relaxed/simple;
	bh=DrR8IdHrzyO6e1eneK+NgF4BitGzqFuc4bURmrXBluo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KoIqAC5Hqb7Cpby/xlExo3nJ+HfSXmyVrWyx7twoNw0bhVzVnyE4MpTCtmIuZhnC0VCijA2iOPMxQmKoPV5lY8nEXCxFfnU1FJugnyKy7A94Wx2QRu8AtBpmyQ/WNHyjxaXoHOwkLuhWth9ZX2C62au2UluU9naCesrmvXyVTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4eb0b989f0eso546015b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023828; x=1791628628;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nXiNBxCYyl3AED/Vs2sSXZl+E9Fcz7egSi78disaRcU=;
        b=wpwvGnCgKgXcOK+AQnVTNx+5tlp9Vm4NHMHXqDNC0UQBe9xb5hGUE7XLiiTbnm3ALe
         J89P241Bw0xlnfT5WbPrlIDkd0/0DfL5Rq0wf8B2cAKDq9tiFda8iArkaIxv/gqtiT1c
         I9fMSwd0f8YCgu0s4Uf4g5vxDFQCQnr1K9btPsAGxqBFNu9M7IEBJPqRLKXSDorWXKlc
         SP4S/0+gmuR5TXbnotcnSIdKl+oUKp6wh5DmYDiv4Q44eeL7HlTrPQe1CG+eNfkudDPv
         kXs9zIXP1RFqnnfHt3/5ejSUnCarycfxbEIl5wlICJP3iyigcKgyFNyX9IhBOoK5DQnv
         80CA==
X-Gm-Message-State: AFuF++m+rfq09BsuRb8coHpKFkzXUsqEX+7UXruyUnH282zIfkGm9jpM
	9Bqpm+xuvM9fmu8tgEBkCpafpU7UKk1WCdKMzrshOB94xqFgjQX5B4oNpr8rYTT0uxqAdn+HzR+
	rS4EQFsOjb+1rDMfxhj1bdhPy+/FFFkIQXJ3ImaplYcvJgozotPI0y1unjw4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f86:b0:4d6:9133:cfed with SMTP id
 5614622812f47-4f30c9a91ecmr6435240b6e.50.1791023828720; Sat, 03 Oct 2026
 03:37:08 -0700 (PDT)
Date: Sat, 03 Oct 2026 03:37:08 -0700
In-Reply-To: <6a940044.1d9ded08.62e62.011a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0dad4.9ad129c8.3858c0.0012.GAE@google.com>
Subject: Forwarded: [PATCH test v2] wifi: mac80211: acquire wiphy lock for
 unlisted sdata teardown
From: syzbot <syzbot+e9cbd080a7801f06cf08@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH test v2] wifi: mac80211: acquire wiphy lock for unlisted sdata teardown
Author: rajojha047@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 5f0c482..175965f 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -931,7 +931,7 @@ static void ieee80211_teardown_sdata(struct ieee80211_sub_if_data *sdata)
  * core when cfg80211 couldn't move it out of a network namespace that's being
  * destroyed. Drop it from the interface list either way.
  */
-static void ieee80211_unlist_sdata(struct ieee80211_sub_if_data *sdata)
+static bool ieee80211_unlist_sdata(struct ieee80211_sub_if_data *sdata)
 {
 	struct ieee80211_local *local = sdata->local;
 	struct ieee80211_sub_if_data *iter;
@@ -943,16 +943,25 @@ static void ieee80211_unlist_sdata(struct ieee80211_sub_if_data *sdata)
 			continue;
 		guard(mutex)(&local->iflist_mtx);
 		list_del_rcu(&sdata->list);
-		return;
+		return true;
 	}
+
+	return false;
 }
 
 static void ieee80211_uninit(struct net_device *dev)
 {
 	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
+	struct wiphy *wiphy = sdata->local->hw.wiphy;
+	bool unlisted = ieee80211_unlist_sdata(sdata);
+
+	if (unlisted)
+		wiphy_lock(wiphy);
 
-	ieee80211_unlist_sdata(sdata);
 	ieee80211_teardown_sdata(sdata);
+
+	if (unlisted)
+		wiphy_unlock(wiphy);
 }
 
 static int ieee80211_netdev_setup_tc(struct net_device *dev,
