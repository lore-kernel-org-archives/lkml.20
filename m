Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82F53AA4FA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677104; cv=none; b=Uh464WOCGx/J76KgkLChssn+YNPV8p8RXhbGjEBzAjYa9afchgUqg8ZI8+CAV0N0H7EBv5/sEkNOrGlEmx5eZFmwVkaLVQDg0/6EVAUMNd34XTBc6N1RXD0LYTnFvkSPb+0OOCY5G6me4LtzOi3VejlpqUdZzm/Z4RqzvfrGFMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677104; c=relaxed/simple;
	bh=jjW01VLSoIPxZW4fDFMR7nraOFBGpt6W4TKrJ1/nJ+I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=X2mOZ+R/GV1eEfjjNvdeL9kHwK/v+SBMEoA4ealteJwHLmu1BZy/fRKUAy4cYgbvD3Ohng0KBpDzTW1EtkhF1ytqaK6R8nlERSyFMbJerAdVhaIaRcd0GsG215tCAG9NmfuEI5LDAoNFrDHCwJn+4ICqtXzHK00JkmADCaleMFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48e5de5a23cso156171b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677101; x=1790281901;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0NwrCQwkqCO4ZxeGRRn18jLE7nKNEmEBo4oXo+KExrQ=;
        b=s78eGdSoRT6wS0JjXxDlw2Vre8+vD45NJ89krjQHAsNC+6bJyzpx/9eaharRhaUQiu
         zlX6n0P//e+fgex0He8sPYrs+JoKldgNLIeVqzdstz+0cNKeUeVrtKkbGy67OIaY6HZ/
         r6BmitNCbaPTOVJHQtDeEgpwLChzlcTlb6pBXCrGp2lo2aWSMRYhPQL5VzLPgqNANPgi
         KoIeVM4Tfd2unnA94TMqSIUTN7rRQRVTMIM39S/4WGe0mUBSwSTPLZZMM+wDygJBmC2w
         9AzHTwOpSlNOqqr8l5LgcmobTIG2phDZQ0srvedAcWRDE6dnu9UdKv18jW9roTbwjQIG
         W0PQ==
X-Gm-Message-State: AFuF++lXwUa5oEhSL014C7Xs2Bl1rxhmnNAErtn0VnO5+1PGR9Zuqn8+
	Ud/olLTh6Iz3t5pAXuXmdoe0P9G/KOyuo4q7MQAtbdPElv9nW6Tzt5FUT+TAtjUCRtQrg4SBLAv
	U2x9hoONuju0nga//W3wrpMKeJ1B8ew87V27R9k8wCNU9gTQE7CthkN+SpnA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3a10:b0:4cb:f21c:a798 with SMTP id
 5614622812f47-4ccf915e618mr497680b6e.32.1789677101696; Thu, 17 Sep 2026
 13:31:41 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:31:41 -0700
In-Reply-To: <6aa96ab7.4c28b7d0.c1bba.003d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aac4e2d.71f81b7d.278072.0021.GAE@google.com>
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

