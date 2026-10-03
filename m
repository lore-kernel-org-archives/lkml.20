Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439FC1FE44A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021944; cv=none; b=dHrlguap+UQQVsbi2TchMDYwcbujltJx7ZWqVydcExoiicvOv9mvD38ymjjqN2+Uvz8GCP17IzbyDMi/DnhyxO6Rx7L+I6dxoUm/QRdPSXqywTEObsH7evVqn7SADPir8Be42MIk6IlqXM9irCLDrpKa7KGWYWXoi8HNKN0IeC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021944; c=relaxed/simple;
	bh=wLZ8Qlvn9dbdKIjXQPPL4FrsB38+pw0NhfZc4Ss0fy0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ITJzyqg30Zzp2f8gj8zc7Au9SriqPOCMCI7AkoadeFGcuwujFH0qvXToKxDDXTUEhjg+akDRmYe4j+w59fHSMZFLNIyJGqth8Po7JESsyvMDrAclefViEigYCzIQap8CSu8yqPBlie3wUU8m9F3NuTX3RMl+m3C3Uz+wh3+//RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a7de733fa9so401509b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021941; x=1791626741;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dk9CjJxm5eaLxDihb8iwgv6Oe1o0gFoZjbLYMkxgCsI=;
        b=2CwyyLdSfvIv6ZVuaMb5cdmTm1FUwHhj+qpZ11r4routIl8xIQACozcfj/s9U/le+e
         SNhRp7c/Bn2Vsmw4XFlVHughL5SOG6bHfsHWxc35wVSwvSXz6Fg7V/hRoyrrM1vFZV+a
         Xv6DZW8qWYin5ho3zZxzQOoGP23K2rUZp6U6fcFGJcs/CTcxZCj9aKHAAmbdUJn123jy
         GbjDV7s9HSD1DSL33WZAsXwGdku3arFOvz9A1nrxgH8DndJE7QrvcFnOW7vz7tK3zw9H
         I9HHvAukTOHjVs7x9LyHK2W8qtQX/v2yJZFd6jqQO0xTlMf/e+x1AroOssZ7dxADYm0x
         PmjA==
X-Gm-Message-State: AFuF++ljpqVIjJg8RCkNH/yqWNqSMwWHZ5LiJWLT4UYuZAOBtyt6+7RT
	VjwUDpBTUI7M7wv8Zcif0AgZjTwACcuZayJZjrWTK4GYNZqLDec1qZkuEb5aBrHItPX9QX/Whhn
	9CLlIJvusyJ0Bh7qchQ2aihaqZo9fGWjt8vn6g3QXegPG7o0UFzR02nTQyIs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:158a:b0:4ea:686e:fe86 with SMTP id
 5614622812f47-4f52b0a156dmr4210870b6e.63.1791021941734; Sat, 03 Oct 2026
 03:05:41 -0700 (PDT)
Date: Sat, 03 Oct 2026 03:05:41 -0700
In-Reply-To: <6a940044.1d9ded08.62e62.011a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0d375.34119e79.2f92f3.0010.GAE@google.com>
Subject: Forwarded: [PATCH test] wifi: mac80211: acquire wiphy lock in ieee80211_uninit()
From: syzbot <syzbot+e9cbd080a7801f06cf08@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH test] wifi: mac80211: acquire wiphy lock in ieee80211_uninit()
Author: rajojha047@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 842bfb4a7cb6..c011e40eb351 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -949,8 +949,13 @@ static void ieee80211_unlist_sdata(struct ieee80211_sub_if_data *sdata)
 static void ieee80211_uninit(struct net_device *dev)
 {
 	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
+	struct wiphy *wiphy = sdata->local->hw.wiphy;
 
 	ieee80211_unlist_sdata(sdata);
+
+	wiphy_lock(wiphy);
 	ieee80211_teardown_sdata(sdata);
+	wiphy_unlock(wiphy);
 }
 
 static int ieee80211_netdev_setup_tc(struct net_device *dev,
