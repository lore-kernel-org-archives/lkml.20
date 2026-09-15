Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492813905F5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436317; cv=none; b=P1IH20zBDoDcz2xZGCgVNJJLx8rxLre1aA91Kfwjnflll0LuegFea4aCHeiKsiVKdvFeARyf+H8NX+dLxRWwCU8KD+cXo0E8U5ePhaJ5Dldfxtyjdspt9PLwMkg0ioEDVWB7JLjpmtmGEmF/JAOHSejm5u+MGXrvZLFO8sxFVk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436317; c=relaxed/simple;
	bh=kcX7W3KJm7uim0L4A7sIQZnxPQj1jpVE5S7W7qnhh68=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tk8yvquhfMhuzK/WtLkiWtFBzNGlPBTuILW+QlbTW2fQVYmTByvt2z8wdTFzbiKKuf+rGRtvX909f6p6zTNkmY60s+2/2i5+GZMTHmZnqwH/xndzjjL6UokpckCMaNs8D4LJ3NtMOFhzTrTSINaWjvRkl9OsMSFkcszdurQyjn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c7f887ac6bso1615820b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436315; x=1790041115;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D/OXlmXDzhSBOUUUa+pw8bKsS/MS8eRqek6rym3Li40=;
        b=l3isZtsNbXu1WiJyDayEfvqCjy70u1L6N1hiArrq4wskjkU9Qmv2vBY+YcBgODAjwS
         pVNLm5lUfY8eTA1F9iHA6nMeh5h/jjtHlcIoGAAWWl/TIl5NeEJLZSApcB3uT/EqZ3x7
         9mFew/jCk61sFjDX4kMUwqM55K4yTzULDdFgsjQAWsK0fu5DD76fT2WXQY1hrMqJ1pQm
         /Z1Q+WsVWzO+E2y7ySsKbpR09x9OqMh1lOSABv+wP8m6PVsNbXyJmi5vXlhdmpjC+m5z
         VFov9zj0xBGhuxX2/ZI2AfxzzDE0oMtyn6C/2zpVffiT59b1oaLi+PpMDd22QK9/5j5G
         cJqA==
X-Gm-Message-State: AFuF++mubWdzc7iU0XicfPpQixvTUq2tQRDA2BhHsBmaGAE4tYoD61y5
	CUX67VaFCckuNPegSfmUwrqYgoefkTiH+DymdegR8kbKDdLGDwo+Yb5JjYSGA6ZUa5TcuIqQLSK
	ktwrHysrUfCM9D/vYWKVUuwWja6XFMevetkR6xdU867ujQKLnvgYHfwC9iwg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1791:b0:6b6:5bf3:e201 with SMTP id
 006d021491bc7-6c541b40973mr4981727eaf.30.1789436315284; Mon, 14 Sep 2026
 18:38:35 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:38:35 -0700
In-Reply-To: <6aa52208.f81106d8.2ab401.002a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a19b.4c28b7d0.c1bba.0028.GAE@google.com>
Subject: Forwarded: [PATCH] INFO: task hung in ieee80211_register_hw (8)
From: syzbot <syzbot+c92af8613ad38696ff09@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] INFO: task hung in ieee80211_register_hw (8)
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git master

Reported-by: syzbot+c92af8613ad38696ff09@syzkaller.appspotmail.com

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_main.c b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
index 02b6d81cc..de3bfeaa3 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_main.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
@@ -7156,6 +7156,15 @@ static struct genl_family hwsim_genl_family __ro_after_init = {
 	.resv_start_op = HWSIM_CMD_REPORT_PMSR + 1, // match with __HWSIM_CMD_MAX
 	.mcgrps = hwsim_mcgrps,
 	.n_mcgrps = ARRAY_SIZE(hwsim_mcgrps),
+	/*
+	 * HWSIM_CMD_NEW_RADIO goes through ieee80211_register_hw(), which
+	 * acquires the RTNL mutex.  Without parallel_ops the generic netlink
+	 * core serializes all of these handlers with genl_mutex, so a task
+	 * would hold genl_mutex while waiting for RTNL and can deadlock with
+	 * code that holds RTNL and needs genl_mutex.  The radio list is
+	 * protected by hwsim_radio_lock, so the handlers can run in parallel.
+	 */
+	.parallel_ops = true,
 };
 
 static void remove_user_radios(u32 portid, int netgroup)
