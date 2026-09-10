Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8946A361977
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013263; cv=none; b=pEL1gStT3aXjEnqz3eP65K4/pGpectolHSsXYN/z7Urnp52ksXadKEbjlSUZJp0a9aS3joWRwEPqEg7Rmw23j7+Da5yoFHf5sgbibaRLN9GcdK/Nj/1CDsZbtIKZFRLvmMLPPI1qg1jegTB6V9XsCjhV0HVtVWYcWySwMzmCMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013263; c=relaxed/simple;
	bh=fCa743Q9YcLlzoe4YeE+MEEG8mO1QCD47XapiVzdCro=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=biHEfFJdRFnNcyV+yJjvbrcuLZGzJMlA0sLunGwgGS2YS90+SpgsNKV6MQkXYr1AzIDd4AywUGC8AnQbcL0ZKxfZhtV7KtI0oMz8Mp/0t3deQLwCP7REQ0ssn2n7u7JFhs+vzT+gr7umad0e5aCKC+76AYGT/IZHiekwxpYaIK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab7bb257bbso8171786b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013260; x=1789618060;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fz0Fo3jFb/MBiTiXYkdYyqjl6EDpysPJPmsibOv1j8U=;
        b=kP2VqyY6s1byyA62LxnZfvOwZCBw1JxzxsAAtTd2jY1Um0Pq01GCXDl2nixeEdEF4V
         vLjHSuHcW9ShSOtDgKMiL+2QYcXrePPUCtoVzReybF++SDZ/A2rJIlLqchzSO4Fejymo
         lYGCyay9P9+tb0dGKNCvOH62vnAb+m6TxPj7d47EndU2EdLOdzJz0dCWK1tpyd4K/3y1
         HS8OYGHPNlPwieKbpnagjzdUKfbUm6aJC3RzLbOKVurJzUsaHbPSa5oxVjw3VoRpKyn7
         DfKkPNOm6xgfktG6/SSeOp/Q2ZYiIM5Jn+aWvpNl7kAvv8h4yMcMyRDcmQAXefE1KE4w
         CRQQ==
X-Gm-Message-State: AFuF++maWsteY9+ew5zae8GynPGx5vglIXdbUu+yw7B/666IIOWBoGKN
	bShy+6ZEy5lJ8L0zMhga+yseJpIrj+ylxquC4hK21iyThdIsO9v1KsUw3MFH1iTMDZ3LhtdaMT4
	Iv/usYytnCX6gL6httCc1ojnTdHsR68OTNnXOhlgZIiQcMGeD528SPaoLcJg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:190b:b0:6b7:83c5:fdf1 with SMTP id
 006d021491bc7-6b783c6039amr20914594eaf.50.1789013260155; Wed, 09 Sep 2026
 21:07:40 -0700 (PDT)
Date: Wed, 09 Sep 2026 21:07:40 -0700
In-Reply-To: <6aa1e15e.f81106d8.2ab401.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa22d0c.f81106d8.2ab401.0005.GAE@google.com>
Subject: Forwarded: [PATCH] mac80211: fix using smp_processor_id() in
 preemptible code in ieee80211_tx_control_port()
From: syzbot <syzbot+d979bd35c8a76fd1b6f5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] mac80211: fix using smp_processor_id() in preemptible code in ieee80211_tx_control_port()
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master


ieee80211_tx_control_port() can be called from nl80211_tx_control_port()
in normal process context via netlink sendmsg(), where BH/preemption
is not disabled. dev_sw_netstats_tx_add() uses this_cpu_ptr() internally,
which requires preemption to be disabled, triggering a
"BUG: using smp_processor_id() in preemptible code" warning.

Fix this by moving the local_bh_disable()/local_bh_enable() section to
also cover dev_sw_netstats_tx_add() and ieee80211_tpt_led_trig_tx().

Reported-by: syzbot+d979bd35c8a76fd1b6f5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d979bd35c8a76fd1b6f5
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 net/mac80211/tx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 74ab27534076..7b1a3c63e5dc 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -6687,10 +6687,9 @@ int ieee80211_tx_control_port(struct wiphy *wiphy, struct net_device *dev,
 		return -EINVAL;
 	}
 
+	local_bh_disable();
 	dev_sw_netstats_tx_add(dev, 1, skb->len);
 	ieee80211_tpt_led_trig_tx(local, skb->len);
-
-	local_bh_disable();
 	ieee80211_xmit(sdata, sta, skb);
 	local_bh_enable();
 	rcu_read_unlock();
-- 
2.34.1

