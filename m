Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793524995;
	b=PMr7EE2yFTxo+uGP3KtYgtx09E2flhUPOQ5rKnfM81k4AZcRrwvHWBP9TN88Kf5416NX
	 vm2m2jqcGzLmX1+iXvfjlAm2iPW5Tr+2rEqnUmzYokiRWV8EcOD1VJX7w9uqUBoS/Zwu4
	 TpiK6P7rPBVkoeFS2VFWCg9ZwA3q7f9/dCFw+SZ+khwYbNI7B3KjV4lLOuWOKAAVKXZtG
	 WVK03Un6EMde7oRvKrLQWu+rO+vdwA77LCjUO5SkySvhIVyLbbYKLiHgDzA8HkmeEHZ0v
	 snfifw3PQHhOlESA6P9SIgvXrfCVMLs9pUVHcwByGE4eVr0gsMAxeBKBGtU+RNCmjzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793524995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QKQXXPx0TtnAH7kUYwvPG35lGpK3RW8/bNQYeuZv+r0=;
	b=K52fwwrlwx9QyAiqMRMdc1sfKAagFpLS0Q2IPHptk9u4WzhrbEhWwJTFiwM2XR9tIrg4
	 ltqBvD7F5GvqQV5xjompznDXHd6vqetCQSkJ5plIlhKhlJWBVNosnPjCc7Z7lBzQN2vn5
	 tBUF+FMa3Js4/4sWi20KlPqUTW21IgLlYSNI/S2mb2HRtLyTqtXjVtjofgf4z5bO6VJ2I
	 zoS6y2tXLddfQmMOZzoqCwKJskK6QMFfpPo9oJrzZtsqk+oZAlwmaxQkbjC6okQQSNCOZ
	 RdrEEUMvLBzZJAUk6ji+Cveb79VD8fpWOpYsd8b4OXkYxMvnIAjRD4YBp/nmBVanPTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHyohmlz;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A7C606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 09:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A7C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHyohmlz
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a2551d7b5so4048520eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793524994; x=1794129794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QKQXXPx0TtnAH7kUYwvPG35lGpK3RW8/bNQYeuZv+r0=;
        b=pHyohmlz234FO5ddhkGK3CGghjQSnOPw0U+b7mp+iQ2Qog0pyEnV05r2o/KWSU8x+s
         XyjePTJfY4Yr90NiqcD310MAxjgzU08691YReLHd9Ggq1HqgtsSRdWXu1Z750l8s5MRs
         kJZG2JtcISaQT7kwDUOLBQgnOSMK5S7CMmRAX3pN4Vx6w/yqbQZ5OK1jyKmCDPzcSItk
         GB1gzj365eeujHiPjay8quZNM7Q0AlRzc+b7Mktp7Jkjc769Xz4IMEwmhpaBWTUPr1Dn
         +Kdrx+IqzROl9knrPszFTYBKlorg0c3x8NxszRwtQ+NiKpjQG2Ejy3xcUFkBKP3RH1Gl
         atlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793524994; x=1794129794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QKQXXPx0TtnAH7kUYwvPG35lGpK3RW8/bNQYeuZv+r0=;
        b=RrnLCyNU7lpbbwQrC1OqGKQsYvDmLc44fz6eh1DGF21JNGI3S/rMxkYDlB5Djid0WR
         1IRnqM3E4TWpJUyuDBMkN2JSr/NOrAKtaa6/BJ+yAqJCyic0MibMQwfzGGVqpi5t5r89
         mSQqiGJbTsFOTlaZjRioSgQhyR8wkUwq8sjzS2xKy7HuXW3bvtv+lXqEyLhvWX89Ojfw
         ViQayg9uCKuzC8t9wLG4DLO3CCGJ+cI2g3gcH5JZ1EqbbTwCG5jAu8E06acKNmgZ40dN
         7uIiQCNyuCZ3Lb/zZvXwKCba39xZmVPQ6EHDTF0kzbIRhCIzmmIHjVcoLN2XNFPHqRfj
         cP+g==
X-Forwarded-Encrypted: i=1; AKwUvByxJvNqkLNulJVnWJXQ+el3fb1wGuYPA3G72GgyRo+qhJljLkFOzJhJSrwp0qb0iDZX8fAMxOW1fffTDos=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNfUGruWC1VWOSZvlendpAn/eu71GnmfdsHObQlJsQhy0v97l2
	PQnaKvXUSG4YAjBEGzAZZivmzkdiSV1h/QWlclgEzNW2YNdGkMgKSQmO
X-Gm-Gg: AYBFou3A7OSyXr8/S9fSsZKLW5I7SbSjL49LmW0Eui9lFoF9z8rcgRXEwEqlGhpa13K
	8L+ryOM+4+JoWYMRIESapJlBmw+xhwfEfQohk7Wqrpzumv58+cc5PRkgczv5LDZpfypQXC1ZNmZ
	KQcSp0TsBaAuZgv8WKMKXm4DeMx6p+tF1RXIROEqPlyHajEPvgPZBQ8iHLC1SIuAb84LrJO0beF
	h7+NqIOvYq5x3SLEr3U9daS2GJJcMP2tqDuQX/qBPs2x8B+xLxHpjxrdjXHNTv9u/sv+u5qFYh6
	Efs6ioZW9z5/cXwYIHHIPj2+plTqhXAB1gE12jgvhVy5WtVsUY2Q39oc8wTqOgnDd9Zq3K5zTPb
	B6TECjYXF5kJqnB+wR8CzWNbkKKfO6xxp/TMZrLFMztMiWlMxbtZ0wd53OuFIFvL0CEW2MCpDqF
	a8fOSicU3QRxpkvl8vcU6eRs//VoLfIExigV28FrpqvXlBk/BpUDitHtRLmgukSMRJ42L6X76nI
	qoqefkBOLQIK47SAT+/CcUhODZvJEumWulEOpS+1tCciTeF02b1c+VWkIkFZgxp1/oUV+LPGCwX
	RZK1x2FOAhw80aanDgSF35sdjyYUD5U/1D6J
X-Received: by 2002:a05:7301:53c8:b0:36a:22de:d85b with SMTP id 5a478bee46e88-36a2fd48fb3mr13979029eec.2.1793524993618;
        Sun, 01 Nov 2026 01:23:13 -0800 (PST)
Received: from xploitoverload ([2406:b400:f11:1bac:4040:640b:8a1:8629])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm29407539eec.26.2026.11.01.01.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:23:12 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com,
	Kalpesh Solanki <skalpesh942@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ieee802154: nl-mac: validate device pointers before dereference
Date: Sun,  1 Nov 2026 14:52:19 +0530
Message-ID: <20261101092219.1278751-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Tested-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
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
