Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB631E858
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790982204; cv=none; b=IpNbP2c/FWKRUtwlGfL4AyldnPtqARxggsDIY0MFYofExkygtdKfPFjH78BqwzZ+60dMlcjtY+JpMyEPGEvpFoz9ZtUcF68fJAARqLkORjm0GygBQaZcLWLbf411pJUNOJEecooPjeKTYVY0lvZGIEfLvcNqE+UEoE3s5midGPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790982204; c=relaxed/simple;
	bh=r/AJBBLkj5eJyh+5yIP1fyFPsNPYV7rwdKO3fNLcaEs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DLD+595uGrQ/4RiSCO7saNafaqUC6d6pOhcaLwYMWxi/fluF9dR2xF9AWw/eCltLU+3WBjHm3Ir3AoTyBftvgfU5zopDI+1IVqkjbKigri0s7r2gJYnKtWwqA5t1FnkKOw+eyfMvBkTil0isnT3Pi/+uZ/PGBKIMGd/Tz1LOmWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b26d8d2498so24347b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982202; x=1791587002;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1wNTK+lsXVUVGVMG79M0VZYtfHkK7025uRxlb9+gPRI=;
        b=BoVZW6y+69eZ/sd79LsEaglsDzFH3WsGzphU8I6Ht7xV/NbkTWZ+FtTQI8n4POLPsM
         Wuue7ji+E8vc9EHWa1fc10E5Qo2/ywjOFsMOc29eJ6AYMFDdOXKgnM29zgXcWMglxDxA
         4hJNLxd6PnRyBz9XBqJzKQl1fhV/cY3dm5kMUlo8fMwI/2T7nQejuVGPHZPkT39r56gb
         X/29Nij6puYWGY6XCGzh8Fy8yRUFscSLP+Z8RB1/O4COxmH2egy44tNNqYb1/CqN9jto
         oZYT2/jWvJklgY671RwRKdRB5yGb0HSSUBREbwW6hDCZgFhEgq1puAGV7VcOKYZMcMi5
         1MJw==
X-Gm-Message-State: AFuF++nC0TLJyfmdqhekyfvHgqlzpv/M5QED0mEReBh3PtDf+5UMKvVX
	0K63jQG1VqhtwI5Lp+oKwFORZURZWUoea4jWjdZYPj+0X+c1PhdBPdJU8c/Us8YWsXyApd4fP4f
	YNgndXFXgMtAMdB6Lhi92sa7E4KT/yqg6fyX8KNPwEA9HFRhhgSmyIkriHNM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6801:b0:4b9:e88f:89dd with SMTP id
 5614622812f47-4f67ae2f8f7mr826818b6e.43.1790982202319; Fri, 02 Oct 2026
 16:03:22 -0700 (PDT)
Date: Fri, 02 Oct 2026 16:03:22 -0700
In-Reply-To: <6abfe679.b50370da.302ea9.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0383a.9ad129c8.3858c0.0008.GAE@google.com>
Subject: Forwarded: [PATCH] wifi: ath9k: kill WMI event tasklet before freeing wmi
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] wifi: ath9k: kill WMI event tasklet before freeing wmi
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


The device becomes visible to the HTC/WMI RX path before
ath9k_htc_probe_device() has finished. If probe fails, the error path
stops WMI and kills the RX URBs, but ath9k_destroy_wmi() then frees
struct wmi while wmi_event_tasklet may still be scheduled from an event
that arrived earlier. tasklet_action_common() later walks the softirq
list and reads the freed tasklet, causing a slab-use-after-free.

Call tasklet_kill() and purge wmi_event_queue before kfree(). Callers
already set wmi->stopped and kill the RX URBs first, so the tasklet
cannot be re-armed after this point.

Reported-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e91dc13b1b37759b3d9f
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/net/wireless/ath/ath9k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
index 4a08babb6d9d..a629de91015b 100644
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
 
-- 
2.43.0

