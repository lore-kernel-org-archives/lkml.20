Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364287;
	b=HRjwBg/3czLFY/GTtVVzGbx4R6wvcHjdVwO2BeAL96nqSDJYACdfr5J6Vu09EGfhm3Yh
	 1AvtlOHmm9znrvn+qcpy8YV8ibC+mPMPI4F5BlVOwHN2SMcUL8vynx+qTPzBeXGZ3EQcs
	 JpIp/QazUl0br6OTPNqLl8bnfOFlrQqYaj9Yd7emfDt0lSpy8lZYa6tJmhA29Xw/iv3IF
	 WTP2o7qpFNLT5+6YQ3AOVGO3vWakBUB4cIzq9ol2chixa54hJ8fAC+ZtQ6URJw91SrbH2
	 v6qOVcnHGmOqFXegXmg4Ep+w/DXbwcKBGC7JE4AGGGOZWjI+t+ApBgwrJS7rqihfi9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tvIZ7pbWoBRbHRTKo7ycS404yAoUTHoTkTV3VzeS6nY=;
	b=dykoJtaXPQF33OqFe16uepEoJoW79JgOrtBYmF2Ea94qegJEdGQ9e8+e3jXiBLapXgxJ
	 GuVj2/y34kzXaeTElBdl5TORFqqOZ8dM7HVb82iXXXlUhT0KRMvnUTX6d9uTzAEFGgHn1
	 XyAeZydO4TwuDegC5uWqtxbMKvuNc9aSGHB9oCIxgdJ4dfweLkVG8T9k9kF1JEEh0ICsd
	 2PGvj/1PvID6s1q/KlS73wyjFarNdS/riqroesMzlkamHGH+gH4NhoiBOpJLm582W8cd2
	 0LgJ6sGVUg2PYHqaeu+/c9VHhj3S0h+uetr+s1LRfzQgaVmyeZAFDkDw7EgNiPQS2/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nxog5xnt;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E8D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92E8D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nxog5xnt
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so2817422a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794364286; x=1794969086; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tvIZ7pbWoBRbHRTKo7ycS404yAoUTHoTkTV3VzeS6nY=;
        b=Nxog5xntwwP4C9Dm2uC/m+UZw4PaJodBb1FtucoEb34YU6SpsAFTrPlLH6MkGbbRCo
         NAJfTcWoTn9uu1GvLting5AG+KSFwslAvcJyaFu0wtuds72JiroSF/LIphlb9ucoqd9U
         d/D/92b5sybYWoWTipMJL0Auq9bQ5poJ6+pYzgCuD6FI9NfpDRgQkxd0QRuNzLp2Y3Of
         3tPk3M6mU4bEB5k5B8LiTdeczqyPwNLxKK3yQ+BiiqEH7cGvkr1pOXHJVVkQ9Yhpyt+7
         iHpD7B+qSUH1zzC71e6lbCc9qYM1zMIvDldwhdgoWf9WEIvRU0393SVBHurOCR3KC7uv
         i3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364286; x=1794969086;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvIZ7pbWoBRbHRTKo7ycS404yAoUTHoTkTV3VzeS6nY=;
        b=MzJK9E7HYt7O88XZN5QfnWq0+cRZd2YNRCOOj5yixZOBxUjVYZUa/R3m7FF4+xUsp1
         y0sPOl943wuwtTA/KbaykdAa8Ncxv2/TO/ehgd/nnR5h016DR1bwRMxSF4Q6Xov8hN/k
         ivZVylOoNv9qHgoO2TnrQs9yxg7xjLQie7hTqsGc4YU7wrLEERZvakZxFMxRis1hnD9W
         fiIgrNHbUNeau8VifEx92Qcs6fAD0D8o8XzZF7D9x/c9L1jIQqK/Q9CpyzBmU7CUlDVH
         +EQrc+4wASDU7omh+wELZIHwkiqSqzpeqNMDTvS2jRk6Y8MzMc1pWQEeNwmBuQRxRNbP
         dRnQ==
X-Forwarded-Encrypted: i=1; AL+hErGRWY/GYUbIFcbHYdy/0yU9j+DSER9MdQgRhYE5Oa8egPMqVUGQb02fUvEEHk98dNxg3tm20vHsqpjzLKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/26hpukYB82fJzLYX4qkShl7VelsisDZsO0x0ecAMUcd4jj5fV
	Xx6Q+eiLapsuEIqkS88nkUsMTWpMriLG4J+iGqLLZxzy4rJ+Qu8oyr5ZcUYAnHb0vW6kHEpTNDB
	2EFfo5ZKhObpODxlSVG27vWOhow==
X-Received: from pgby2-n2.prod.google.com ([2002:a05:6a02:6502:20b0:cc7:e6a9:8fe1])
 (user=yuyanghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7345:b0:3de:456a:6e07 with SMTP id adf61e73a8af0-3f2febd5c74mr1226594637.46.1794364285628;
 Tue, 10 Nov 2026 18:31:25 -0800 (PST)
Date: Wed, 11 Nov 2026 11:31:21 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111023121.1511995-1-yuyanghuang@google.com>
Subject: [PATCH net-next] net: replace mc_dev with a flag in netdev_hw_addr_list
From: Yuyang Huang <yuyanghuang@google.com>
To: Yuyang Huang <yuyanghuang@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 646cb8868bd2 ("net: add a generation counter for dev->mc
changes") added an mc_dev back pointer to struct netdev_hw_addr_list,
so the list helpers can find the netns of a dev->mc list. Only dev->mc
sets it, but the pointer makes every list 8 bytes larger: 32 to 40
bytes on 64-bit. struct net_device holds four of these lists, and some
drivers keep arrays of them.

Use an is_dev_mc flag in the hole after _count instead, and get the
device with container_of(). The struct is 32 bytes again.

Link: https://lore.kernel.org/netdev/8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com/
Signed-off-by: Yuyang Huang <yuyanghuang@google.com>
---
 include/linux/netdevice.h |  6 +++---
 net/core/dev_addr_lists.c | 12 ++++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index c0ae442c4344..e00687e8e750 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -257,11 +257,11 @@ struct netdev_hw_addr_list {
 	 */
 	int			_count;
 
+	/* Set for dev->mc only */
+	bool			is_dev_mc;
+
 	/* Auxiliary tree for faster lookup on addition and deletion */
 	struct rb_root		tree;
-
-	/* Set for dev->mc only, the device the list belongs to */
-	struct net_device	*mc_dev;
 };
 
 #define netdev_hw_addr_list_count(l) ((l)->_count)
diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index d827cc21867b..b6f25e487984 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -25,8 +25,12 @@
  */
 static void __hw_addr_changed(struct netdev_hw_addr_list *list)
 {
-	if (list->mc_dev)
-		atomic_inc(&dev_net(list->mc_dev)->dev_mc_genid);
+	struct net_device *dev;
+
+	if (!list->is_dev_mc)
+		return;
+	dev = container_of(list, struct net_device, mc);
+	atomic_inc(&dev_net(dev)->dev_mc_genid);
 }
 
 static void __hw_addr_count_add(struct netdev_hw_addr_list *list, int value)
@@ -538,7 +542,7 @@ void __hw_addr_init(struct netdev_hw_addr_list *list)
 	INIT_LIST_HEAD(&list->list);
 	list->_count = 0;
 	list->tree = RB_ROOT;
-	list->mc_dev = NULL;
+	list->is_dev_mc = false;
 }
 EXPORT_SYMBOL(__hw_addr_init);
 
@@ -1215,7 +1219,7 @@ EXPORT_SYMBOL(dev_mc_flush);
 void dev_mc_init(struct net_device *dev)
 {
 	__hw_addr_init(&dev->mc);
-	dev->mc.mc_dev = dev;
+	dev->mc.is_dev_mc = true;
 }
 EXPORT_SYMBOL(dev_mc_init);
 
-- 
2.56.0.542.g3ef89b7020-goog

