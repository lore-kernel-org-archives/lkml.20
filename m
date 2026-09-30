Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312E7511208
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790805067; cv=none; b=YSXfIusbt+aEwnqXdgdcO1q/1fwgUNXDNPsOU2l3XlFQ4vxe/VN6GdHUyoeEdi7DrwFGKBKKcUK6yaheWiWDrFyMj/A34sGWTiwyCSSOdXSMEosR11kbt7gv6EYDp0R1+6p0FK36Y0sZk0a0+RgxpnHwKqeVD9ZaxpGa4w41aIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790805067; c=relaxed/simple;
	bh=S22VfBD4pPls7UNG2NGxhpfRB45ROGORhMSqMHSQu6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kem2bAsACwFzRUaDfCxJQ+KyapQWmlQJRAP5Vrd+XgW+tlO2V/mJCrgXkZnn5eMhsR9HetY/dY5OG8x+1FgDvJCPpurDNedTE9uJ/7q6mtMTX6i2Xy3Oks/lwyz4LuDZ+N6pbVwWHD9QIx5bzdSuf1IZbTYi1xHYlO1mcGUtojY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qts7upZX; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qts7upZX"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso43395975e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790805064; x=1791409864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8LP8CV7WHWqRDeEIDZ1+1JYJj+ocKrw1BORKdvPxNb8=;
        b=Qts7upZXHfzDn7Iy13fsIBPnv9thUWdpaxbsjgvCS5XgctLBIyjXxyvi0hcj2oSZ+P
         YD2DgPXYRxspt9bDXqkuByIjD4moULTqf7YOHHrh0NvhHIj+YabcuED2tbXoSw3CypvU
         o/DiWuPZXeUi9q7Xuv9Gfyfvw0k2Npm6aXozgm/c4+ReWAz+rn9K86/bjXXJGq8j/kmd
         m9S73z7np8+TQPkxxXUPzs8L8//ke1Y2Xp62bkRWye2wU0/WCi+zJHw1ag7qpAWiQo9n
         efXrt8zMDfUth3lgcARbV3MqfNyTkUJponBpl33dQaav7jr2aPvPnSqOOpSN5/ELofEx
         KqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790805064; x=1791409864;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8LP8CV7WHWqRDeEIDZ1+1JYJj+ocKrw1BORKdvPxNb8=;
        b=KTdDC4PcZP37a1HbRr90abe/Lrn1Gv/6j2OvjAFgj8Z+XRnJL45TyHII2AB8qQ5KlW
         N1Kj0/RpTldamI8lOrmC9IZsPT/PGB0ZosUrQk+cdHK8bGKO584YZ1oU7EI7QHL4ruw7
         /uzkk5Q+ZC5cWvevZI8ZeESX3xh6MLs6qkz09HbbhY34lhqYhOTvz7L28JjtQSk6yoRC
         G6Nm+1sSrw7o06o8hNE7vB97xTzFS5Eiygd4vuh6kEzNntnrwupPvOr1tG91QXUqj2oI
         f0V5sJn7gUQ8osdVpfcRBrt0FiR8rJvc7pM/wVyOLxTWHb38FKUAsL3XjmeyaeHg6kUV
         rxdA==
X-Forwarded-Encrypted: i=1; AKwUvByh/gKRULL3PSQTDsW8QpxKiqTUeDiY/5TIdZ6sl3DWYE8rV57wBhsdLw/XqTcekVMAYqr7J7f/QGAU/Qw=@vger.kernel.org
X-Gm-Message-State: AFuF++m7Y6p/cRHfzsBo2FImj6mEUn4I/P3Z6ibhof/X4JtxDFFog0NX
	8/FLQb/Ruc6xvoxA04ilqNRgRoL17TY80yK48UoAwRMkh5/tVng26IpD
X-Gm-Gg: AYBFou3QaizwRQ/hjHMAoryzS0eKh6+XzEbsZ2D5f+zXQIVYWzGPXQ22MQObqrk/9Rt
	TXOcyEcIo96ouAW4h1X82g3rQbYNBiwuUOg2pxy5ohN3eWWCMSDi3Drw1Pyhuz2lyGIML4pW6eP
	6hE4x25TAv0BQ+1I015gewYWc7VuzhUeT7JzBx23biXPkUqGnHxQXXuUbP3OWn+tzgLyGuf7EGN
	9HwBgCNkfymXQ0AsxgVDcJWGisV3416tGj6FS3Z6ElV+Aqmzvt+1Unr/mzjygilAWpmgRKw1x4P
	DZmqTJQmNZ8A7x12SB8gT+N0j359Cvbz39vqkjMf9KLY4JbJ+FDbUR/Kk85dRIFpMgjR8HheVe5
	ef7aKIyMlz+TfvC3CHCFBNkJ4N4rziiaXwyVRpmOfWkFiKJsiaoINShuPbXpA6pFkmhldk4LAp8
	gbRCZdR+wFPHfLQq0vSy0gphenZQb3xrVF36ilOojMo31ehTvUD1Zx1ogZ9YSHnFbBPGm+
X-Received: by 2002:a05:600c:638e:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a01aff908dmr42791025e9.26.1790805064167;
        Wed, 30 Sep 2026 14:51:04 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f979bbcsm12937155e9.5.2026.09.30.14.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:51:03 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: netdev@vger.kernel.org
Cc: oneukum@suse.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net v5] usbnet: fix smp_processor_id() use in preemptible context
Date: Thu,  1 Oct 2026 00:37:12 +0300
Message-ID: <20260930215047.718270-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usbnet_skb_return() and tx_complete() call this_cpu_ptr() before
disabling preemption, which triggers a BUG when running with PREEMPT_FULL:

  BUG: using smp_processor_id() in preemptible code in tx_complete

Fix by using get_cpu_ptr()/put_cpu_ptr() which disable preemption
and return the per-CPU pointer atomically.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Suggested-by: David Laight <david.laight.linux@gmail.com>
Reported-by: syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=04cd90bb99c6ef81a65d
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>

---
v5: Keep _irqsave seqcount helpers, only change pointer acquisition
    to get_cpu_ptr()/put_cpu_ptr() as suggested by David Laight.

 drivers/net/usb/usbnet.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index a19ecf718f36..84f97f448b2d 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -325,7 +325,7 @@ static void __usbnet_status_stop_force(struct usbnet *dev)
  */
 void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 {
-	struct pcpu_sw_netstats *stats64 = this_cpu_ptr(dev->net->tstats);
+	struct pcpu_sw_netstats *stats64;
 	unsigned long flags;
 	int	status;

@@ -338,10 +338,12 @@ void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 	if (skb->protocol == 0)
 		skb->protocol = eth_type_trans(skb, dev->net);

+	stats64 = get_cpu_ptr(dev->net->tstats);
 	flags = u64_stats_update_begin_irqsave(&stats64->syncp);
 	u64_stats_inc(&stats64->rx_packets);
 	u64_stats_add(&stats64->rx_bytes, skb->len);
 	u64_stats_update_end_irqrestore(&stats64->syncp, flags);
+	put_cpu_ptr(dev->net->tstats);

 	netif_dbg(dev, rx_status, dev->net, "< rx, len %zu, type 0x%x\n",
 		  skb->len + sizeof(struct ethhdr), skb->protocol);
@@ -1298,13 +1300,15 @@ static void tx_complete(struct urb *urb)
 	struct usbnet		*dev = entry->dev;

 	if (urb->status == 0) {
-		struct pcpu_sw_netstats *stats64 = this_cpu_ptr(dev->net->tstats);
+		struct pcpu_sw_netstats *stats64;
 		unsigned long flags;

+		stats64 = get_cpu_ptr(dev->net->tstats);
 		flags = u64_stats_update_begin_irqsave(&stats64->syncp);
 		u64_stats_add(&stats64->tx_packets, entry->packets);
 		u64_stats_add(&stats64->tx_bytes, entry->length);
 		u64_stats_update_end_irqrestore(&stats64->syncp, flags);
+		put_cpu_ptr(dev->net->tstats);
 	} else {
 		dev->net->stats.tx_errors++;

--
2.55.0

