Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988624ED1BF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677556; cv=none; b=W/bdbrl6vT1tNcIUiDkKKAP9sTu8IH9N4DgPFOUYIb9vwZJtH9y7x8wOsQIQi3rsjAPqoEaLjVre8z/xMwAInY2R2dYTUpSSE1yUHFZKY0fP+Gd+HeNoUyeqVY3GgExvrtBF2jmmx1DF2j8hSVz0opXOo5klckcKmu10D5fK0PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677556; c=relaxed/simple;
	bh=jjW01VLSoIPxZW4fDFMR7nraOFBGpt6W4TKrJ1/nJ+I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KVsp5a7QBiTogDB52TCuClNXg2MA6yotWO13XqgWSLwAp2hGz7OIZxr3QdNs0l/3mJhhvy/rYT6w94dYcOH/nwQsZcK1vzDEA6Z5kqdp1WF+SOhOCJMniem8PysMUtCHOEz8gUlAkqpH6civWFg0QT4HNMd/6/i83xoHCSXgLhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8064fadbb1dso1884a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677553; x=1790282353;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0NwrCQwkqCO4ZxeGRRn18jLE7nKNEmEBo4oXo+KExrQ=;
        b=mcLJqED22mVToCaLEd2rFuK+gL1MtVre0lW3VtUP+hawllprgM5SaE/sdjx9yVc49p
         bQBzba/w7uwmhp5Cc6q/3/sUBeDnCQt1lq6CrrDemTOugZlu3QcVeQlQcHWNQzP43usW
         EFQ3RrxRUg2jiLTDMwKTSwXgmPUicWzwGOITH/0vuMXUbYlmGfYfMLAbN9tal22odbrU
         2BTO0kg6IGtuxZBeU2yT3cVCYtTghg1Ypas2HQqROZ1g4vcYvAmXCxvdYnEmI+f3oX7v
         XljoApHQaE6X6DvI9Zb6fT9v0SleM+0RCe2SzFW1NxCOavErs4sGWdt0RrsqidON+BxJ
         HLqg==
X-Gm-Message-State: AFuF++kv0+/6JhKMBZzV/lbB1/XVrxtUWUJxMVR0lrlJ2bzbXHvwtu+E
	KVa4T3KSvnz072WyvfAbjoourJ62nVZX1F1j8g3KSkwWEdxNOddmYTstfPG9SiUISkHzR6iaWeZ
	7t1/TV4pS+sjdSFvQP4zf2FAtklG4yYCcWa15bsAIDUxcA4kS0OdD6CcAfr0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1f03:b0:6b7:8396:f3cf with SMTP id
 006d021491bc7-6ca9ca59dfbmr191178eaf.49.1789677553429; Thu, 17 Sep 2026
 13:39:13 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:39:13 -0700
In-Reply-To: <6aa96ab7.4c28b7d0.c1bba.003d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aac4ff1.87c06881.1db2b3.0019.GAE@google.com>
Subject: Forwarded: [PATCH] can: dev: fix missing skb header initialization in init_can_skb
From: syzbot <syzbot+1aae11dc8d42ec1a87ec@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] can: dev: fix missing skb header initialization in init_can_skb
Author: shaunakkdatar@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

__alloc_skb() sets skb->mac_header to (typeof(skb->mac_header))~0U via
__finalize_skb_around(). skb_reset_mac_len() checks if the value has been
updated via the skb_mac_header_was_set() and fires
DEBUG_NET_WARN_ON_ONCE(1) if not.

init_can_skb() previously included three header reset calls:

skb_reset_mac_header(skb)
skb_reset_network_header(skb)
skb_reset_transport_header(skb)

Commit 9f10374bb024 ("can: remove private CAN skb headroom
infrastructure") dropped these calls which leads to the skb->mac_header
retaining the original value.

Restore the three missing calls in the init_can_skb().

Fixes: 9f10374bb024 ("can: remove private CAN skb headroom infrastructure")
Reported-by: syzbot+1aae11dc8d42ec1a87ec@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1aae11dc8d42ec1a87ec
Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
---
 drivers/net/can/dev/skb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/can/dev/skb.c b/drivers/net/can/dev/skb.c
index 95fcdc1026f8..9cbddc1edd41 100644
--- a/drivers/net/can/dev/skb.c
+++ b/drivers/net/can/dev/skb.c
@@ -210,6 +210,9 @@ static void init_can_skb(struct sk_buff *skb)
 {
 	skb->pkt_type = PACKET_BROADCAST;
 	skb->ip_summed = CHECKSUM_UNNECESSARY;
+	skb_reset_mac_header(skb);
+	skb_reset_network_header(skb);
+	skb_reset_transport_header(skb);
 }
 
 struct sk_buff *alloc_can_skb(struct net_device *dev, struct can_frame **cf)
-- 
2.53.0

