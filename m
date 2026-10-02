Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7D43D9557
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790982543; cv=none; b=B9eht8IjlRXnXuK9WkoGul4u8ZEzZvrNHRKGV24oMcXHeiGblehuMohJx0l1iXV3VolnS29wxeL7RXj+1TGnKLRY5ZOtksbVK61rto3PvI+7Dd15z/ngJJnaYAMN6w7hmlPjD8DGNochG19n6n+8EsH19OMVFNJvkuEM/qu8GNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790982543; c=relaxed/simple;
	bh=lsY16qoBp76EI6m2GKbX8iwe7Ff6nfXlRWDyOFKne1Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jml3ehOQdbBX2Q0H72OJX3ws6GuOdwcAsgfi3YiSgWe7lGr6g4ncO5SviBzHRpfkRdvnHmiba8PsG4kGzknLBDKL1qaD0xfolBB0EpFiypE4EyLaJKu083YZyEa1naLmTmB7p6GqwhmmGZ3+pZkaEgfwT+lihU6LzfEGvvKNmBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4d2f0f77124so485108b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982541; x=1791587341;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O+d4/4cTSjKdwEburEGa9pKZvxhPY6qDjvECmwyykPA=;
        b=PqlPdh0phV9DRTtk0KrWEPEIyKiK0Jv517M+ixb/swq5z9vPx3HtCoNnv3z49O/7Jb
         /zFKWOD0fZK2lXU9lgdegzi1jGga5of7XLqXmdKuO9T+7HwGRiTkx1rWPx2AZUAfc/pI
         nGuuQPwgxBIZAgsc4Xzg0UwLiBUbLwSNbOe/ixpJVwKp/pWqwQeVOlI50NiLHr80vFeo
         6NQScPLjWvvVpF0qEKqeDUBeNnl9bIWowuOZQHY2GIr8VbHxhpDDWb4umF2SnQP1BA4Z
         dGeJCHQevX15OtiquSOPZasghAG8M/1MIUy8yETip12MC6DxhC7l/qDwlE0mfhknoEI1
         N53Q==
X-Gm-Message-State: AFuF++kbTmzFhrqPDhF7JYT3rt4YwoxT+RO5bVdmBkkHopDrtbmZezZC
	32tsFBvtJWrU9cyw2wn2zkQzwZzjoVz8TN7eoUOgvbs7GC3yCyc6YtvcPdyl8oU5CUfxObZAn4i
	/bxV5yscZI1/TGvhdcXM/9ZkDA90p+dAnXDR2+RMslr9dEnV10v3/kwbB8K0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:470b:b0:4ec:19e3:4072 with SMTP id
 5614622812f47-4f529d205afmr3566025b6e.18.1790982541082; Fri, 02 Oct 2026
 16:09:01 -0700 (PDT)
Date: Fri, 02 Oct 2026 16:09:01 -0700
In-Reply-To: <6abfe679.b50370da.302ea9.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0398d.9ad129c8.3858c0.0009.GAE@google.com>
Subject: Forwarded: [PATCH] wifi: ath9k: stop WMI event tasklet from
 rescheduling itself on probe failure
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] wifi: ath9k: stop WMI event tasklet from rescheduling itself on probe failure
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


Since the init guards were consolidated, ath9k_wmi_event_tasklet()
reschedules itself until priv->initialized is set. If
ath9k_init_device() fails, initialized is never set, so the tasklet
keeps rescheduling itself while the probe error path calls
ath9k_destroy_wmi() and frees struct wmi. tasklet_action_common() then
touches the freed tasklet, causing a slab-use-after-free.

Make the tasklet drop its queued events and stop rescheduling once
wmi->stopped is set, and call tasklet_kill() before freeing wmi in
ath9k_destroy_wmi(). The probe error path already sets stopped and
kills the RX URBs first, so the tasklet cannot be re-armed afterwards.

Fixes: 1af8dc9ca726 ("wifi: ath9k: Clean up device initialisation guards")
Reported-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e91dc13b1b37759b3d9f
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/net/wireless/ath/ath9k/wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
index 4a08babb6d9d..f8b174b0f209 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.c
+++ b/drivers/net/wireless/ath/ath9k/wmi.c
@@ -122,6 +122,9 @@ void ath9k_stop_wmi(struct ath9k_htc_priv *priv)
 
 void ath9k_destroy_wmi(struct ath9k_htc_priv *priv)
 {
+	struct wmi *wmi = priv->wmi;
+	tasklet_kill(&wmi->wmi_event_tasklet);
+	skb_queue_purge(&wmi->wmi_event_queue);
 	kfree(priv->wmi);
 }
 
@@ -148,6 +151,10 @@ void ath9k_wmi_event_tasklet(struct tasklet_struct *t)
 
 	/* Check if ath9k_init_device() completed. */
 	if (!smp_load_acquire(&priv->initialized)) {
+		if (READ_ONCE(wmi->stopped)) {
+			skb_queue_purge(&wmi->wmi_event_queue);
+			return;
+		}
 		tasklet_schedule(t);
 		return;
 	}
-- 
2.43.0

