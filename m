Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32948412BF1
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791022394; cv=none; b=UISV6dSnGol5XPnz1gD6snKTYAwipUBHuRbs26WV6xzY35B8bAEMBX2i0J/feVRzZ4VvU7012R7NmAkxl+WBDGdWS73ZNR3NMnHc0E/66x+3NxaOv+ZRywmeVX83MnHZ8AvbwnopYy2s7T2eKUecUMKw+riW0q8mp47yb3zXSGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791022394; c=relaxed/simple;
	bh=o+NrExyU0PGE5uVgCn51Td+mcO+fQZ1NdnsiQWPDPA0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EEH8CriGyEre6Sq7ZpQgkjE4o0SpQET6xQ0czDMz2Av6CmpU/hHzmO9m/QtakIF73p8gWzJo7keOqjx7TcTaZIBDHQFFuIZFpF9XImV2qu/Yio0DE3NAky12BIlAlizzNbAvdPoKfnvh5cpnf7rK//cd+475u4MrFIiusBCcmv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e9eso473532b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791022392; x=1791627192;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hcIoAdm4vtlLOz98FNXDID2HNTW++21QgkzhcamXHLo=;
        b=dwl3Cz4wwriW8Lss5A09C14Ue2k1xant90NIyydVPV+r43fIqdgeGOGB2f/84vFUj3
         C50fXNPMo8FFxq8qE5cAFedK0stzszTelo3Hmfn4Rzw0hsvpVd7e8+cNRR3T7RqUGV9I
         MgseGG9SdK67Eq8mBrIXDdQroi9ZwtYm0Xl6IldgmLnLUFJzbZ7boYec246pE+sfg4t3
         xYFLif5W7SjtYrFG6L4ECmppsPl0X3OuY2ohVTXTyEgYTc0tmEu3UvgjjXgsHQyqXoxR
         pcmonyVCfrXIcipdKB3MTCGdz1WD6BdORVKzzRalfUkzXxxLd9Q6gAn7TQ91RxyHkK8n
         03NA==
X-Gm-Message-State: AFuF++n+QBv9TpXXwqHFMPDDJeLT4OkFd23594Xh/4laYsf24cFtHFXr
	yaKuOA9eHnSTAIt9qie4Xqm+/uZb5MBkPoIS2Q9qS8aSUfOrShxoaCu8iVTA2s7M3jImLsrdvHG
	NmPif2hYEZVoFXK1LxnELlllbS1eGX+ohdsFULA8DjbGj6mv1iWgcBufGMg4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1815:b0:4f5:1202:9d56 with SMTP id
 5614622812f47-4f67b742cf3mr2343431b6e.55.1791022392268; Sat, 03 Oct 2026
 03:13:12 -0700 (PDT)
Date: Sat, 03 Oct 2026 03:13:12 -0700
In-Reply-To: <6a940044.1d9ded08.62e62.011a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0d538.81dddff3.363068.0007.GAE@google.com>
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
@@ -950,9 +950,13 @@ static void ieee80211_unlist_sdata(struct ieee80211_sub_if_data *sdata)
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
