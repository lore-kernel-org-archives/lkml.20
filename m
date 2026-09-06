Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111692512C8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 00:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788654440; cv=none; b=R5x1y+lEFRKsASRhG9HpZ2EFVc44N11+H9bfwd+IuFZGlOdae8YMrkpcz9f1jhXTeDxVe3miVqUvJFZilNRfDANj7YXrGiz/SqZnmlAEpS6MxT2Zvg8tLxd5UN8N8VXWjcmqdZDGeIrp8UsxFc+MXMau9xzK/VKMlbFZnautHNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788654440; c=relaxed/simple;
	bh=2TdAKrKV0FCbD/Fri2RG+Wg+0ou7YdCoPON6tgECizM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E7HbCKgbbo5zNEDhlddIOiPEAtKRB63N/sQZLPhv/uQ141RtPMqJkFBHyigZXr4MSO6zjE7+jqnkkX1ZUi+xDLKouRhCfdBCQr6H/nk0mUp5vXNalyhJVflIHvLxVev2pr8bGTC+8W3XQCT9XgyNKp2kfRvAwuubGAGvZpOEzT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxVLPAil; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxVLPAil"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso34837705e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 17:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788654437; x=1789259237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WmwzJcel3VfLt6Lpe6LNfEoo3vOWPkIx9eCfAv/ke9k=;
        b=IxVLPAilMhnwq0GbJM/Nz+0ufwylUYO2HUm31iwFddT18h9LHg3cwfCWu/O5pT+eLu
         itegbDGqaSoiwbPocPQ1x4985iRgfJWK/8HYCtDp+mawe05djxxl9pDeteRyzQ6Z/R9f
         idHcNnJsxS+hcmDkV38IdeY1EQjb1YX2qVneiyezWFqyqch8Bel7ex78FwCma3hlvFjA
         F6VDlC0YgsNyHWzsK43OW8rDJxQ1I1wo+ofVLeBy8yy0ZeQsf9OwQ5gRvRwrc4ti+YPH
         QnAO2g0WEoZIN1nMjSTPIVIoh7sFtuhvba0fKFTrT2M4rAAKj/EDZrupTV6TQ2+DqYCh
         FuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788654437; x=1789259237;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmwzJcel3VfLt6Lpe6LNfEoo3vOWPkIx9eCfAv/ke9k=;
        b=gwvQT+ocuCke2//hdfry+Tch8ImnPIHIYmajZvVzHiX0H7LZ6TobVarYqhrG/BvL6K
         sKp91jgST9q6m8NR9bEEFTorM4oFToXWg+nurIo2IHN66Rhu2eW+dhh6JDC0OO2+j4jb
         KDvEZzQM0E88GlTBuQ42SpDw6KVs6TjeXyU0kYWfSPfZq8J/QljzmcZb6xq9p7VNMwOF
         wwQsgChfKpr5s5GViNRleOVYGdsh5JN6RICQRoYNGk4mD6ZajI8u3bwFgimsg2IQ0teM
         6ZmUb+a31RVt+LERx1SM8FrXUDf5jI0wFIwbxPQ8FIN8I25Mv/EvnITBXmScNqZAdcK2
         /1QQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1eGjKwiTp6F/Y+01Y3MFpbREe8dehEyFfgHLW1WDEH/Ldaj66TxgmBoeK/YXDpuXkvwfDKtB7Ssg+t1w=@vger.kernel.org
X-Gm-Message-State: AFuF++nVqltIrWXt/gWzJg/eXTDjlpXrM2jOH1po/BDM5AsMDf58Aicc
	NOC2Q4OdY17RorBIzx07wmmeIe/FR0hDNuqyQ6VrZRtmXQz0DQ2fUOi4
X-Gm-Gg: AYBFou0tltO4/BZ8eIp3M77CftzjRxAXVafWZ37Kki+ENZRGZgjoKhF5fKOGjvexXwW
	4Yb8kD34bkWssLV3divKDWC60Fz8GqAJXQe+KeqJYqT5bnTEkj80sp9XaGjgTd5aj8sd5oc9yzE
	3OLmCpuP1YVbp6ADDbvLjm57nhRfaZJMdAkhk8S1fwfln8jr7+VqU7x1UCUOvLuSjTBgGMMGdue
	J0ETxP2LXI7puVdy9eOjwbjNWFxc5gz4BE1gtpggtLsRQlY4RPatfoD7En19F4h3rcGafumhHfz
	P5agdJhmJbVvj+79dPeYFbonY1BPbDIYcBnhDOaCfw69BZZlrTEhmFz3/oD8NA8WWOvVyeU9hCd
	e/9p9Y3KFl8OIiZcFBeQiPyEtnqv9Odkec9jJQpvjH+LMfCegt3BFW9n8rMpoEP2Mqa9X9ENhOX
	7t/GJcGBE2wADQcqMPkRySkyRnevtMSWhGZR7Y1ShBk4mTx7i54ERU6XSZn7U=
X-Received: by 2002:a05:600c:474c:b0:49c:fa21:1c8b with SMTP id 5b1f17b1804b1-49cfa211d53mr122489015e9.32.1788654436801;
        Sat, 05 Sep 2026 17:27:16 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm236791575e9.3.2026.09.05.17.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 17:27:16 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	kvalo@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>,
	syzbot+adeb8550754921fece20@syzkaller.appspotmail.com,
	syzbot+101224300649c3eb8af4@syzkaller.appspotmail.com,
	syzbot+8141dcbd23a8f857798a@syzkaller.appspotmail.com,
	syzbot+b0ae8f1abf7d891e0426@syzkaller.appspotmail.com,
	syzbot+d6bbe0f5705cb8a5aa2b@syzkaller.appspotmail.com
Subject: [PATCH] wifi: cfg80211: avoid holding rtnl_mutex across all cfg80211_leave() calls
Date: Sun,  6 Sep 2026 03:25:46 +0300
Message-ID: <20260906002657.620076-2-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906002657.620076-1-omermetekaya0@gmail.com>
References: <20260903151542.486376-2-omermetekaya0@gmail.com>
 <20260906002657.620076-1-omermetekaya0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

reg_check_chans_work() holds rtnl_mutex for the entire duration of
iterating over all registered devices and calling cfg80211_leave() on
each invalid wdev. cfg80211_leave() can be slow (disconnect, stop AP,
leave mesh), causing rtnl_mutex starvation when many wireless interfaces
are present. This results in tasks waiting for rtnl_mutex for longer
than hung_task_timeout_secs:

  INFO: task hung in inet_rtm_newaddr
  INFO: task hung in inet6_rtm_newaddr
  INFO: task hung in nsim_destroy
  INFO: task hung in tun_chr_close
  INFO: task hung in switchdev_deferred_process_work

Fix by taking a snapshot of cfg80211_rdev_list under RCU, holding a
device reference (get_device/put_device) to prevent freeing, then
acquiring rtnl per-device so other rtnl waiters get a chance to run
between devices. After acquiring rtnl, wiphy.registered is checked to
skip any device that was unregistered in the meantime.

Fixes: f7e60032c661 ("wifi: cfg80211: fix locking in regulatory disconnect")
Reported-by: syzbot+adeb8550754921fece20@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=adeb8550754921fece20
Reported-by: syzbot+101224300649c3eb8af4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=101224300649c3eb8af4
Reported-by: syzbot+8141dcbd23a8f857798a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8141dcbd23a8f857798a
Reported-by: syzbot+b0ae8f1abf7d891e0426@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b0ae8f1abf7d891e0426
Reported-by: syzbot+d6bbe0f5705cb8a5aa2b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d6bbe0f5705cb8a5aa2b
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/wireless/reg.c | 44 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index a8336baf85dc..7a3f1e470e14 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -2463,15 +2463,49 @@ static void reg_leave_invalid_chans(struct wiphy *wiphy)
 
 static void reg_check_chans_work(struct work_struct *work)
 {
-	struct cfg80211_registered_device *rdev;
+	struct cfg80211_registered_device *rdev, **snap;
+	int i, n = 0;
 
 	pr_debug("Verifying active interfaces after reg change\n");
-	rtnl_lock();
 
-	for_each_rdev(rdev)
-		reg_leave_invalid_chans(&rdev->wiphy);
+	/*
+	 * Snapshot rdev pointers under RCU with a device reference so they
+	 * cannot be freed between per-device rtnl acquisitions. Using a
+	 * per-device rtnl_lock() instead of holding it across all devices
+	 * avoids starving other rtnl waiters when cfg80211_leave() is slow.
+	 */
+	rcu_read_lock();
+	list_for_each_entry_rcu(rdev, &cfg80211_rdev_list, list)
+		n++;
+	rcu_read_unlock();
 
-	rtnl_unlock();
+	if (!n)
+		return;
+
+	snap = kmalloc_array(n, sizeof(*snap), GFP_KERNEL);
+	if (!snap)
+		return;
+
+	i = 0;
+	rcu_read_lock();
+	list_for_each_entry_rcu(rdev, &cfg80211_rdev_list, list) {
+		if (i >= n)
+			break;
+		get_device(&rdev->wiphy.dev);
+		snap[i++] = rdev;
+	}
+	rcu_read_unlock();
+	n = i;
+
+	for (i = 0; i < n; i++) {
+		rtnl_lock();
+		if (snap[i]->wiphy.registered)
+			reg_leave_invalid_chans(&snap[i]->wiphy);
+		rtnl_unlock();
+		put_device(&snap[i]->wiphy.dev);
+	}
+
+	kfree(snap);
 }
 
 void reg_check_channels(void)
-- 
2.55.0

