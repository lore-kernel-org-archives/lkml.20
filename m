Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793522254;
	b=Ol7O+rvi7Y3uplI3ESoUORlCwmdgPxJ5H2Qlq0C7CsKxJptiwAbOUnZ3YwesPbn1t3e9
	 q8K3oYR3uhI9eaXMRBrN4G84ljRSrgMpqeBWUeWzOXFjO4Vh+occb6785SV4jdZQObOg6
	 IF+sMkkgq+jLi5jWaQOZqUXhEwU5w1WDwnKZC3Mw0Xjj8D2Xk5rEAXwwofTiIimK0T6+s
	 mL6kS17eB8eS/t17/alJwHw8aHWxkASXLh0Xl17bqzhUyN6qkiAwYpbxQqUwOPraiRsf0
	 1TXQ3Ap1oV1KN+CK4LEve+W4sekpu173FeHR3Le+TUlzROIsscEWnJ0ACm0sixAqhOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793522254;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=wvB6Mil27Jukwo5CBMy0VZwog/P7C0KUcWgk2WEkyME=;
	b=LbyxrVCcqN1qt9fsNb8VBHgV2BEh3336ReTZtmBDmK3QKJMeb39LKSvwzj4XQJfnZe0e
	 bvLILGHTFV8+C67mJMYDd5Ys7puz+ROV27TwJQoSMWYntoVxCJgln9QFSDt2Vt5OzR31E
	 8ym/AOqjqXX0B90+zOMCecaFRqPfeTggfYndDNDW/jKP27HuwfqPexR436yvtbWYLevSo
	 QxFFc4lsQhyuzw45t3ZIZLDZUBrH7jpZ99Of3PFxsWSmCQB1Lbkf1hfrZgecVIxYHc9tc
	 OCVQj3fd+VtngOo7tWcjoyitpiUp/xVOIUQAip9f2Dq+hzr33cSo4WJr4drgjjKZ9ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EB9606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21EB9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso3217973b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793522252; x=1794127052;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wvB6Mil27Jukwo5CBMy0VZwog/P7C0KUcWgk2WEkyME=;
        b=pfVTgei8HACcFqeDPL4GK32NnvIrPfw+YIHsYSYCRbNL5FXTiIfcvoB7T5aJ31sJdp
         x5KCSYPKih/ojxpbEAf+e5Oj3r1SOg7i9XDfymhBW9JYJxzzClBZng/q6kXvL3AK6xKd
         bIucjyVChVOpwoKSMcSuUqCfgaEacrT+yfYZsK8U10Izp3EYp0mD/OBW8dJk5Ogihi+U
         IUd+Xp1BfKgu9zwY2sw2UC71uEs3qZRmo2x8Kb1sL49Wc0N55bH7LuJZxga6/gu8Tt6z
         iOwDtE1GfmgHBYS7cNNWbZhoi81w9xpBNjL9eV/wz3ub351yI30Vdo4V8ZjNWdckcDY2
         t2eA==
X-Gm-Message-State: AFq9FYIIplUt5HU5pTVS7krTGfjVXrWzBQBfAJNvZ+e8ly69NzDFo3Dj
	YmkEiChBpMJn/6KUnAJTeJATv922GWirsLwAVCXiDBQ7k3QQOkVypgjp0ivyhBU7K3JJv1amugP
	D4/Dej3zrBneREYch7/sbVTzX+Sk9A67EHtVQ8DfLCT7dzT6wU6Bh+StnfWY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b24:b0:4d6:9355:7547 with SMTP id
 5614622812f47-5640decc9e0mr4372029b6e.66.1793522252705; Sun, 01 Nov 2026
 01:37:32 -0700 (PDT)
Date: Sun, 01 Nov 2026 01:37:32 -0700
In-Reply-To: <6ae48a2b.6713f5d0.92cad.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae6fa4c.7fe51036.1ecf7.001c.GAE@google.com>
Subject: Forwarded: [PATCH] ieee802154: nl-mac: validate device pointers
 before dereference
From: syzbot <syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] ieee802154: nl-mac: validate device pointers before dereference
Author: skalpesh942@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

A virtual network device (such as a TUN interface) can have its link
type set to ARPHRD_IEEE802154 via ioctl(tun_fd, TUNSETLINK,
ARPHRD_IEEE802154). However, such devices do not have an IEEE 802.15.4
private context allocated (dev->ieee802154_ptr is NULL) and do not
register MAC operations (dev->ml_priv / ieee802154_mlme_ops(dev) is NULL).

When dumping security keys via IEEE802154_LLSEC_LIST_KEY,
ieee802154_llsec_dump_table() iterates through all net devices and
dereferences data.ops->llsec assuming that any ARPHRD_IEEE802154 device
has valid mlme ops. Because data.ops is NULL, this causes an immediate
null-pointer dereference / General Protection Fault:

  Oops: general protection fault, probably for non-canonical address
  KASAN: null-ptr-deref in range [0x0000000000000038-0x000000000000003f]
  RIP: 0010:ieee802154_llsec_dump_table+0x204/0x5d0
  Call Trace:
   <TASK>
   genl_dumpit+0x125/0x230 net/netlink/genetlink.c:1026
   netlink_dump+0x53b/0xd00 net/netlink/af_netlink.c:2351
   __netlink_dump_start+0x6d6/0x990 net/netlink/af_netlink.c:2466

Similarly, ieee802154_dump_iface() and ieee802154_nl_get_dev() assume
that ARPHRD_IEEE802154 devices have valid dev->ieee802154_ptr and
ieee802154_mlme_ops(dev) pointers.

Fix this by ensuring dev->ieee802154_ptr and ieee802154_mlme_ops(dev)
are non-NULL before proceeding in ieee802154_nl_get_dev(),
ieee802154_dump_iface(), and ieee802154_llsec_dump_table().

Fixes: 3e9c156e2c21 ("ieee802154: add netlink interfaces for llsec")
Cc: stable@vger.kernel.org
Reported-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9ea34da5ca6100593c90
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 net/ieee802154/nl-mac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/ieee802154/nl-mac.c b/net/ieee802154/nl-mac.c
index 74ef0a310af..1acde5af4b5 100644
--- a/net/ieee802154/nl-mac.c
+++ b/net/ieee802154/nl-mac.c
@@ -162,7 +162,8 @@ static struct net_device *ieee802154_nl_get_dev(struct genl_info *info)
 	if (!dev)
 		return NULL;
 
-	if (dev->type != ARPHRD_IEEE802154) {
+	if (dev->type != ARPHRD_IEEE802154 || !dev->ieee802154_ptr ||
+	    !ieee802154_mlme_ops(dev)) {
 		dev_put(dev);
 		return NULL;
 	}
@@ -437,7 +438,8 @@ int ieee802154_dump_iface(struct sk_buff *skb, struct netlink_callback *cb)
 
 	idx = 0;
 	for_each_netdev(net, dev) {
-		if (idx < s_idx || dev->type != ARPHRD_IEEE802154)
+		if (idx < s_idx || dev->type != ARPHRD_IEEE802154 ||
+		    !dev->ieee802154_ptr || !ieee802154_mlme_ops(dev))
 			goto cont;
 
 		if (ieee802154_nl_fill_iface(skb, NETLINK_CB(cb->skb).portid,
@@ -771,7 +773,8 @@ ieee802154_llsec_dump_table(struct sk_buff *skb, struct netlink_callback *cb,
 	int rc;
 
 	for_each_netdev(net, dev) {
-		if (idx < first_dev || dev->type != ARPHRD_IEEE802154)
+		if (idx < first_dev || dev->type != ARPHRD_IEEE802154 ||
+		    !dev->ieee802154_ptr || !ieee802154_mlme_ops(dev))
 			goto skip;
 
 		data.ops = ieee802154_mlme_ops(dev);
-- 
