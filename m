Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA108386559
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 22:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410611; cv=none; b=lZiv9WhJPevVLfWRHxaVPb/SYvFDfA5lHzFac0eEm41JqtQopm/hLlaaNnxFZxcCNlji8OUP6C6ZUmemfeyoKlzxktI7paQp1ph7CDMkDgo5N+qnXAL9cRgrzIl5aPFtMHZgX6rKqFZpinXY50n0whVW8Zbo0l3798+mdDbYvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410611; c=relaxed/simple;
	bh=tke7slPNWOX+7ELjRSDZ8oPCXNvkKtFXU3e3mtWBRDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X7o4gOwbwzCL8T3HuMCoKFAqsT0TWkHmcP5tFH5IUyJGmwtmQD1Zu0SAH8CAAPRgRxYnD5HvfDi46HEDIB1mgV858PzfGBfzMLt5lBmYARjPkiD/JPSOh5xnMNluXpvCuaZ7q8j8/9pGmFmNIBSVPtMhf+Oi56NIQqPIWuGazOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2TjBLq+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2TjBLq+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16c399641so23345135e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791410608; x=1792015408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3vc2Iva4KZFpZlvP0+4NbjFh7c9GdaXKEPiQjjCtn0=;
        b=n2TjBLq+HnVXJfrTRgNaGdBF7+GWtHebwUzYdETmnVxyzf8jrbmMkwpTUZ4tE16o5w
         QRjdiPS1Sp4qUEzxBXnQKt8VNornqq97QKbI91dn3R5ApSYEWVBVIiul+XuuMNyOc0Fk
         Xn7hBSnp7zuWvQg5TIhKBXSNIMYByjUJCl9c0TZocO3f1fKMzxNVucRg/0qM4JFmVg4n
         iZRsP0SyC8ShZG3IDc0TE7VO0MbaVpQJXnIhJ4w3U5wXVfa992FAE3PzFUZsDWQ0C5Rv
         xKS0xE4b7Iy+jkjSi9fwDn510TKCBCj1Ezdi0ObzJR9sd6T1jJof/g/XkqdVyaLlxfnR
         R+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791410608; x=1792015408;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3vc2Iva4KZFpZlvP0+4NbjFh7c9GdaXKEPiQjjCtn0=;
        b=dfQetFjwLMlNgSguIwkLGM7k9jtoSdAtdgEdjlTWwbkQ4/lQY7iDw+iXSlY3vhU8CO
         Bg+XP+kWduiu/5tTX6QJxF4a7LCQxb8JotnvpvM9CEeF/P849O4jIcbaqhCliuz9u9rn
         gBFu2Q5+YvqhQP97xBiOYDmGOxhtB1o3pGE+9wl6KOTisBKazBl9TON1yq1UqTEz2bJ+
         Vcyp337uDWX+ZmVol6oul3KPmXKvidW9xlkxZcyl9OARF1umsfsEjmGtyLOu/uSsXU4D
         rSWPwoqAM7vEJ2KyrfUgDAGSmrkEZG1iRZjZyRn7VLBk5rJ2gBbEBFbJ9dX4CMGnlCNF
         wKeg==
X-Forwarded-Encrypted: i=1; AKwUvBwS7gn9GMZnTjjD7GxqAVGqBPImvRGb88aOngq4ZXdS6RaP8KgYy+sg1r7q4ZhMST4S3VUbhrulUUAsj+I=@vger.kernel.org
X-Gm-Message-State: AFuF++kcMUGIBsCXT5SetDdZsXCMbEnUQCOITPQcnBW2GEHJRfV1e115
	hM/tsCqppJnT/bspF8q9vIIuiTdaYFDT2amoBIHt63KMSIefcVqSZfDp
X-Gm-Gg: AYBFou1lXBSy7UEOmZb3r2jRbpfQa8A8//dd2ayJUsIHeDF1J1xBEKwo07e5zau8BET
	mKkFbDtqhnGa6LkNEVujOFVGcMUl+MG7ZaoNhkTi/4Dh0EFmVEiWysIVheNWrdDkF5YHRqx0GAi
	X1+4J9wvq7aNy8tLOxgJbIGd4eWoYX0sa1eOn9cji2i8Llh8r5P9yZZZTJ3Yc5JxlW5JK13INXA
	Uatz+69I6LHZZwLGKu/a4XIXdJ1oFH1384R9pHGYkZw/A9TKQCQurR9vaHlZ9GopxtSdaNBNhCG
	Z2PB1EP+l+PA6t9YxRnQgvVo6jIsbHYLpmwxSaxwe8yMnuBbvDiWOejaNxwTKWizfH6FHj5A2WS
	kTLjuagrLeYCowRRQru5KTb+YokZcBRXCNjQkyF2241kjCgrEAK6kcl0+ZiIlhuzR5p1jtLyjBW
	jeBQJNTjBpZ62MfbKvuj6zLwIviu1Abfs+bYpf5e05ZJuumWLPElHrX7cgy1cpcH0NwP3C
X-Received: by 2002:a05:600c:4fcb:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-4a1804557f1mr54545795e9.22.1791410605701;
        Wed, 07 Oct 2026 15:03:25 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm144404405e9.2.2026.10.07.15.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 15:03:25 -0700 (PDT)
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
Subject: [PATCH net v3] usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()
Date: Thu,  8 Oct 2026 01:01:00 +0300
Message-ID: <20261007220311.113827-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On SMP, usbnet_skb_return() can pass the test_bit(EVENT_RX_PAUSED) check
on CPU0 while usbnet_resume_rx() clears the flag and drains rxq_pause on
CPU1, leaving the skb stranded until the next MTU change or device stop.

Protect the flag check and enqueue with a double-check pattern under
rxq_pause.lock on the slow path, keeping the normal RX fast path
lock-free. Wrap clear_bit() in usbnet_resume_rx() under the same lock.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>

---
v3: Use spin_lock() inside existing local_bh_disable() section in
    usbnet_resume_rx() instead of spin_lock_bh(); move local_bh_enable()
    before queue_work() to restore BH context correctly.

 drivers/net/usb/usbnet.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 84f97f448b2d..d138d353fd98 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -329,9 +329,14 @@ void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 	unsigned long flags;
 	int	status;

-	if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
-		skb_queue_tail(&dev->rxq_pause, skb);
-		return;
+	if (unlikely(test_bit(EVENT_RX_PAUSED, &dev->flags))) {
+		spin_lock_bh(&dev->rxq_pause.lock);
+		if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
+			__skb_queue_tail(&dev->rxq_pause, skb);
+			spin_unlock_bh(&dev->rxq_pause.lock);
+			return;
+		}
+		spin_unlock_bh(&dev->rxq_pause.lock);
 	}

 	/* only update if unset to allow minidriver rx_fixup override */
@@ -702,15 +707,16 @@ void usbnet_resume_rx(struct usbnet *dev)
 	int num = 0;

 	local_bh_disable();
+	spin_lock(&dev->rxq_pause.lock);
 	clear_bit(EVENT_RX_PAUSED, &dev->flags);
-
+	spin_unlock(&dev->rxq_pause.lock);
 	while ((skb = skb_dequeue(&dev->rxq_pause)) != NULL) {
 		usbnet_skb_return(dev, skb);
 		num++;
 	}

-	queue_work(system_bh_wq, &dev->bh_work);
 	local_bh_enable();
+	queue_work(system_bh_wq, &dev->bh_work);

 	netif_dbg(dev, rx_status, dev->net,
 		  "paused rx queue disabled, %d skbs requeued\n", num);
--
2.56.0

