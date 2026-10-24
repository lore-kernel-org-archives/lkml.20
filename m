Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831580;
	b=L8H9rg+0PTcM5sazuS7Mt5x4Q8p7fmy3B8CVmQu09tjAIvuKB7JjTwN872+bioqtcaSM
	 0YJ1rpDEglK2wq+aG8uoZ4BtyE4rr7ekP440phBDq5qIajoxvuqy1yKKWHlT2xxcIrUJm
	 yKIQgZal/XFYqsXodbOt/F4RqVPGPt6QSzqOIEWTYYTgNzXhSh/2BTsDm7t8X1cJF4CxD
	 Vkb3aq4H0gGlCa7Hi0LSyvktBcUYC2YyAqcMDejLDCdUUr6gfH9Y1473Lsq66yEUmEf0r
	 m4GJuN/95yk21zeq8Brr+EX17hGQ4pf+aOZhQWYu08L+qcO7gU8vivpUTcInSuXAhNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VcwFgC5lVsHSbW/ej+cAGy1X0tEOwMBM8cSBGLupnzo=;
	b=07KylRv28KA3JDR0sKhlO4FOi0r8lNBazzuxslKqXpSQYDZieA6aaUj4pFdAuP45xEDv
	 kbQHVRWF0yZLpWV1Pk2FQVk8RfjyYnLi/DRCafzDzMBj34bxtMaNuaw1eC3AUozpv2te1
	 t0GRqU8EH9J/XUwxbUM9pocNB5ZuYBxLY8PG7mxTYvp10jkY+NRydSRPuwWP/bhnPM+st
	 RS7VUz2bzvueMVE2oQnJownU9PbtD2hS+xrVTCTgzxSmNax9HswfsSZqWwuMt2PAzeYTC
	 NZiVTewyBZ9grAjF5huvXgPLVmL7QYBTFzIcd1WtE2tCFQQVDvrkGbykwnMlLhYIcSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iv+cuac4;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DED606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6DED606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iv+cuac4
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e10a70540so912959f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792831578; x=1793436378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcwFgC5lVsHSbW/ej+cAGy1X0tEOwMBM8cSBGLupnzo=;
        b=iv+cuac4Mpwnskit760iQ7AyyUCigTOtw7zZS+Fudv+NRmIVyuZrpMyyKV0EwEaZxG
         p8/ibiwHkQxMuf/cRLJ5wME3cMEQBJoXNXyzQ+frGnuEdHad9y0Byv+nSqDCcYHXXwUv
         /qRI09AEirEvKH1aHUg4TbzbopxvNv9AB5rs2qwjR3ao3Urc7BUUGFRmyH0cH5PzJcQr
         LXM4GeDA3mgPrsMcvURsqjeGseJI42LDEa4p7IMrtyoz/2v78hh0j2Rw8TG5MoZdXp0o
         aJGEheWhTK5VQQz8UBQQAPAj2at+bgOXUZxlXiQysyWWIj+yYIudNB6HsHfhgiOqXrTG
         vowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792831578; x=1793436378;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VcwFgC5lVsHSbW/ej+cAGy1X0tEOwMBM8cSBGLupnzo=;
        b=v4bqVndTSSu38EVBrOWYjiDaEybaP7KnIbA+L2SXpMsZgalolfMHqKvUFndtDcRWtO
         2ae/Z/JmeEDcuBrC2/QZ5JV4Y7EXDiBGJvL7zj3rz+69EmM3mkIS6VKfVnOhPpnQhesF
         ZRGB/FSuZE8zryx85U08Nd70UTjqO6hvZ6QkwpTvhPT1OkkrMbhxsTNo2FA6xD7oufHB
         ljNsg2ICldhjWUsc6d7gSjpl0/2ZBgjXZBJMK+MWz1uwE+OCe3SAwfpVwNNCiB6C7/9g
         0SYIX1xCD9Ky8EygQb8BcEAS5vkORl7kj+bveIJ3g13oKc4Bpuhny/rm0Hu3D+EUVr1W
         gt6g==
X-Forwarded-Encrypted: i=1; AKwUvBzkLETxRu6D/5uAaKdKnj3BunfWgcpT/LI3VkIFfzxq9HxQVRkqLzxC5aNsMx8C2HhL7ViU9a/Ss0dCCxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM183ppLkmMkwWlxkCSuzaGtp/5laCaECxAER9zgGWqUe71a3q
	h4aha+GxOSDqxCp89Ee0DKuZRq0Ms+lZL9juqLyXpock6IRBDv2ftY4b
X-Gm-Gg: AYBFou1Xp/JghhFpY9ZQC44wP9NmvdHFL4CaPBDzDjiIItlKa0UiFmbv5nirF++LrHj
	5MHgC+HxQ+xuJMtYro+YF/KSQSCo8EWUrttw8l1Ej/Vvpaxjrvl9/f5O+tWGlfhk0oZM1w39bat
	haZBRjGMQrwtvpEPKWvl++kbv3w9W8+9wXSxsD1UDQLlOENHlP5GCKLiDzgUd9Fv1p8oVfp1U6E
	4sbpcPyYNCC97E13iHMacWkfaSwKpmRRAXWucwWUOJQr99+PrOWU4aN5zs59aA9c/waBbwASjZx
	UM8zqa/F2xNdnQ+fXIBziO9sISIJeT93KIfI35KHBUnR6GiflR+ViC/37gYe/vyTFRWokiYLfhE
	mcCBCDaE4qmPSN5StoUH7R5p8X5196fdETAg7ZuXO8JXWjj4z6qp1MS0EtV/qWt6CsfdykTrvrl
	0/w3l5csRQ9mM+j055a8wMI/F8aBjvGQu1xtOAJnlXirlUyA7g19fORXfVCQcMu6QR3dJ4TsA7o
	Ipzc8ZhuVB4JQnS1MBJbYuh0r3TRFrgywCQUrf/HxpaYdg2vT71lw==
X-Received: by 2002:a05:6000:2a85:b0:48e:476:99fb with SMTP id ffacd0b85a97d-48e3eb7f435mr1278544f8f.22.1792831578058;
        Sat, 24 Oct 2026 01:46:18 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3662sm3481217f8f.40.2026.10.24.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:46:17 -0700 (PDT)
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
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net v5] usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()
Date: Sat, 24 Oct 2026 11:42:08 +0300
Message-ID: <20261024084538.256596-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On SMP, usbnet_skb_return() can observe EVENT_RX_PAUSED as set on CPU0
while usbnet_resume_rx() clears the flag and drains rxq_pause on CPU1.
The skb can then be queued after the drain has completed and remain
stranded until the next MTU change or device stop.

Synchronize the EVENT_RX_PAUSED state transition and paused-queue
dequeue operations with rxq_pause.lock. In usbnet_resume_rx() splice
the paused queue into a local queue under the lock, then drain the
local queue lock-free. In usbnet_skb_return() use a double-check
pattern under rxq_pause.lock on the slow path, keeping the normal
RX fast path lock-free. Use spin_lock_irqsave() to match the lockdep
class shared with other sk_buff_head locks taken from hardirq context
in defer_bh().

Discovered by Sashiko, not triggered, not tested on real hardware.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>

---
v5: Splice rxq_pause into a local queue under the lock and drain
    lock-free, avoiding lock drop/reacquire per iteration, as
    suggested by Jakub Kicinski; fix reverse xmas tree ordering.

 drivers/net/usb/usbnet.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 84f97f448b2d..97a30dd22c54 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -329,9 +329,14 @@ void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 	unsigned long flags;
 	int	status;

-	if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
-		skb_queue_tail(&dev->rxq_pause, skb);
-		return;
+	if (unlikely(test_bit(EVENT_RX_PAUSED, &dev->flags))) {
+		spin_lock_irqsave(&dev->rxq_pause.lock, flags);
+		if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
+			__skb_queue_tail(&dev->rxq_pause, skb);
+			spin_unlock_irqrestore(&dev->rxq_pause.lock, flags);
+			return;
+		}
+		spin_unlock_irqrestore(&dev->rxq_pause.lock, flags);
 	}

 	/* only update if unset to allow minidriver rx_fixup override */
@@ -698,13 +703,20 @@ EXPORT_SYMBOL_GPL(usbnet_pause_rx);

 void usbnet_resume_rx(struct usbnet *dev)
 {
+	struct sk_buff_head q;
 	struct sk_buff *skb;
+	unsigned long flags;
 	int num = 0;

+	__skb_queue_head_init(&q);
+
 	local_bh_disable();
+	spin_lock_irqsave(&dev->rxq_pause.lock, flags);
 	clear_bit(EVENT_RX_PAUSED, &dev->flags);
+	skb_queue_splice_init(&dev->rxq_pause, &q);
+	spin_unlock_irqrestore(&dev->rxq_pause.lock, flags);

-	while ((skb = skb_dequeue(&dev->rxq_pause)) != NULL) {
+	while ((skb = __skb_dequeue(&q))) {
 		usbnet_skb_return(dev, skb);
 		num++;
 	}
--
2.56.0

