Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D953B8124
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788807987; cv=none; b=cFuu35etYIfBe3uiQttOL2Jimg9el4Khn1mGsAcVbcTdnUS9MlISRfNZUAqg2w8PxaPT5aUIEId4xhNJQG/z/tc88wgl2z0VaX1oSe5IQTyVeasfNUk7uPKyw8Kx2d2U+ECS6Rukn52KklnMMJHt4RDSrmstHvQc851t0wP6HM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788807987; c=relaxed/simple;
	bh=mluAk5/UqByeXBGZD17+nPzIfHLNJbieybfivLfNjIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IxCcsDomvS0uHNQVTnc4Sz2dFYjdPjXXn+jZ8t0iCib+rzx4rw44pTkCmcT5S/HCDUyOUK7y1hLgmnNFK8e2Uyv9lS/7YiLNSjyVySqNfauaepBqIs8cIid201YP8v0+eQrN/0vplJ2BqNtwLiODLl44ERJrTVeK68mS/qLWQvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HN28/w02; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HN28/w02"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso57999295e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788807984; x=1789412784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fNV/PaJl+7hbfGUtqotiisfuRbsQmDVNj+CEuEcj11g=;
        b=HN28/w023d543QMHIfXV4uxdrMn0aIy3PWLF4hZbICgvkG8r30E2fT/pcY/j6Ama+t
         O0HlVTNe5HkundSFS5gEXFRIfnVSAnl4RIFcHaidbyQImEyCicQA+K4Uu9GN4bajnthN
         RGUUpAptXs5gonbTZ5ivZiShaVLuTWiyW+ofV15DCPIXrHiVuPQ67JNMiFNgTmoaJCx6
         OYiN/dkueSHUTnpodcTsA+jxKRNGPU5crrw0AgXynofv5z9i4TJ4dvWhXI+eBPcmUBBK
         wQSZ0vBnK+3Caq9FBWVt4+Lab1Ae9JO6aYn5oghT8nA+tS1icSgRDoa/tmIBYfSjSRM9
         kY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788807984; x=1789412784;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNV/PaJl+7hbfGUtqotiisfuRbsQmDVNj+CEuEcj11g=;
        b=mdMT9wKtK1ZLKLkSqKUNbSD7no0f6ub3rzPDVi8USKax5CAdvWvKGQa5X/eFDLaJQw
         O54ywwZm+iLsK12cT/wTJHvdSVt24OFsJ6199BDGGlAKJCeEuYhZhqYIgNaqeppnEEup
         9pKSNmkqA9J34ALFXzc05v++s52fqzo8L86buPG/iTsAzX5OVr40G18KKtLlvWGPD5eT
         i+q+pLRJijQ6Rkj8QQ0e3GXmmyPw+RRkkqPBTqlJvC2zBa2Pfxu6fyvG3FlQlwEqcB7+
         DXb6CK66PfXgKXzlsPkNGzE8ae3GfNY3Yrfl31kNdMFJnf9CGgIwSAYFD7MzRhALy0G4
         EOZw==
X-Forwarded-Encrypted: i=1; AKwUvBxCjPs86iOoS+Re3TpMC5/BUezAzer8QsglSaFbnvj4lmUVzkg9gfMKV4cCdCjJPb9CERe0bPPJctiQbos=@vger.kernel.org
X-Gm-Message-State: AFuF++l66IGmwDFgIRTO85uUPuvdmrp0/+GHsVrqfd4rlS85kt2hWGJ0
	Yvj78rwpC9Ht7WhHrEGUGcyJJWKEwErUYJZpNi6P+tcfuSOKvk2ch+Bp
X-Gm-Gg: AYBFou3iWpGosHYc3RweO/kiOpPoDMC0PJ5le4c3rzWeQIjM5McxVcbNSADuYiF0AYh
	Qrlq6MskWZpTydfeCDDmDPw7K14Q1/HT5ohDbD6CqBYReIMsfMdIBycUmCwIPU5k7OaFfiwoREp
	0vR36jwL/Lp8NaiL3y5yC8ajPLlwULCN4sIJhAfICQ65I3zEqShgEYLFrfIHl328huaoiOfUqqP
	33eTmQRE5QVyMMDYAeZ7ZL7nNUy6DUVdY6GmdeDVxVbq527Af//trFURJfPU/dqoQCMgfosn3ku
	4e9hZtAxv9aynnXlEusMgvuj1vxcS3Desrvk1mDTOuJwMuTQ1FCEHMBYB+0rpc9Lxc/LP8Ep5kH
	oGYeYN3b+329DarxBSBwcDCMOXXt0Y/JbFNyKKw/KkpVFBgloxYhayPIOZ0h65eS+3W45/63ZTz
	cmD21f/TD3TrTWS7Ex6ruWNwXPGJYdNWPZ7YtsCv214Sf0tiVPA6CxVmoh3g==
X-Received: by 2002:a05:600c:4e4c:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49cf8206e4dmr255845505e9.3.1788807983653;
        Mon, 07 Sep 2026 12:06:23 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm328296815e9.6.2026.09.07.12.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:06:23 -0700 (PDT)
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
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Subject: [PATCH] usbnet: fix smp_processor_id() use in preemptible context
Date: Mon,  7 Sep 2026 22:05:25 +0300
Message-ID: <20260907190606.662033-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6e0dbfed-cadd-4274-8165-886725413d0f@suse.com>
References: <6e0dbfed-cadd-4274-8165-886725413d0f@suse.com>
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

Fix by disabling preemption around the this_cpu_ptr() call and the
per-CPU statistics update.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Reported-by: syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=04cd90bb99c6ef81a65d
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v3: Use preempt_disable()/preempt_enable() instead of
    local_irq_save()/restore() as suggested by Oliver Neukum.
 drivers/net/usb/usbnet.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index a19ecf718f36..f1e5bc8bf932 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -325,8 +325,7 @@ static void __usbnet_status_stop_force(struct usbnet *dev)
  */
 void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 {
-	struct pcpu_sw_netstats *stats64 = this_cpu_ptr(dev->net->tstats);
-	unsigned long flags;
+	struct pcpu_sw_netstats *stats64;
 	int	status;
 
 	if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
@@ -338,10 +337,13 @@ void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 	if (skb->protocol == 0)
 		skb->protocol = eth_type_trans(skb, dev->net);
 
-	flags = u64_stats_update_begin_irqsave(&stats64->syncp);
+	preempt_disable();
+	stats64 = this_cpu_ptr(dev->net->tstats);
+	u64_stats_update_begin(&stats64->syncp);
 	u64_stats_inc(&stats64->rx_packets);
 	u64_stats_add(&stats64->rx_bytes, skb->len);
-	u64_stats_update_end_irqrestore(&stats64->syncp, flags);
+	u64_stats_update_end(&stats64->syncp);
+	preempt_enable();
 
 	netif_dbg(dev, rx_status, dev->net, "< rx, len %zu, type 0x%x\n",
 		  skb->len + sizeof(struct ethhdr), skb->protocol);
@@ -1298,13 +1300,15 @@ static void tx_complete(struct urb *urb)
 	struct usbnet		*dev = entry->dev;
 
 	if (urb->status == 0) {
-		struct pcpu_sw_netstats *stats64 = this_cpu_ptr(dev->net->tstats);
-		unsigned long flags;
+		struct pcpu_sw_netstats *stats64;
 
-		flags = u64_stats_update_begin_irqsave(&stats64->syncp);
+		preempt_disable();
+		stats64 = this_cpu_ptr(dev->net->tstats);
+		u64_stats_update_begin(&stats64->syncp);
 		u64_stats_add(&stats64->tx_packets, entry->packets);
 		u64_stats_add(&stats64->tx_bytes, entry->length);
-		u64_stats_update_end_irqrestore(&stats64->syncp, flags);
+		u64_stats_update_end(&stats64->syncp);
+		preempt_enable();
 	} else {
 		dev->net->stats.tx_errors++;
 
-- 
2.55.0

