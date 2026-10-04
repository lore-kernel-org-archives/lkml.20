Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A7D30E82B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791153550; cv=none; b=Ee9a2bprW2fPvpbS4ZEsohtoyy2jbHp0fOYQXdbMGRXD7KJDl7UzmUEmzwkgyUcJsGSx0Uit2i8G/c81+/OeB6r5FIo9phxorJjfJOv1U9TuH+OJPeHNcxJrXkPBT9sUZrsrGcasUYx9bNvMmW+zidSzrPv09nzFS435arapbeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791153550; c=relaxed/simple;
	bh=kpfoFP85QxskQMWdeJTmn1cMu6N17HV/5+t0UmRxMyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XEGJZXyZmqm/hzPJCft3XBE9KtRTFwQa2+DIJP7snWEY1uiVwZHYd0bZhp7lzfOP9XQNBw+gfrp4T5BiEbWN1ODxZBcSxdjosgzG6Wa6z9e97I8yVKbB9GTw04YAbMHxjoLW67WPcvGT6h5XIZbulgp9XrHHRUs/V9OciUbjFbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bThpFflN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bThpFflN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1626d6a6cso6537385e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 15:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791153547; x=1791758347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCS9VK4fVIFomf4fJxIO0n4SeDZ0WR6fIeRqcF0W94c=;
        b=bThpFflN/QNVriZxgcZsBD/dXosCo9iDrB44FDnmAfJZAOxZ/ueNph+KJ3SQAVKyef
         k1d+qBLIV1iX8PCykD+LFjoIxSklEuI8CuFC7XusQt81y7ST/YhopJtl0U4p7DsM4wLl
         SOCNNCnEh1xWn89LFwmk5YDgFVrIRId17PUZ1WOT95/3jM2jJ+RinwTadEiODDbuFUSt
         9fkk3vsjI4o2dNlQCBtbimQOWK3QeVSkP/B7FMyVUrJQTtaYvamIuynwSTcckcirtGVv
         w+mArk7GalQ/ssiy/IMVA5vRoqOr7IIzh306lnHs9vT/CfIGqZzO7aeOMBEMZIm40qFc
         qIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791153547; x=1791758347;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FCS9VK4fVIFomf4fJxIO0n4SeDZ0WR6fIeRqcF0W94c=;
        b=N4ZzcoT6zF/EllGvnkheeylv9rn8Xybc0F6m7niAMYk+qQgBbtJBG7k68J77Y4vVLC
         KOQncLyTGZJCN+Oa/GOf5RWBYVJDj2fdjVHCDS9w2ZIlA89F9H33qmovJXrGw+x9SFH+
         sF+Bx1F+kY0lNbstOwDstcHpHGkObongi/PgOEZ/EoYl5XFC4ezk/UhRAvcj584y0wag
         S++hkafzt7//9czfhcS/XA+La3kUT/hv04KrfzXp26m0XiqSO/CUwg8G5yz9/qOmgLkQ
         4Mz10oMtpFnfqDy14PgKqT51xxFri/IZFltbahcG1mAgsH2jbSGkQzMbl6hn/G7kNjge
         tN6A==
X-Forwarded-Encrypted: i=1; AKwUvBxQ/ZiWkJYYYLucDemHxU5jxkQLj6Dz3OhRhUMKxou9JKsAjo1ThVGRQW4iY5pbKZC7uuBduE3u99CxWLc=@vger.kernel.org
X-Gm-Message-State: AFuF++lP2nZfiYqNQCRgsYHv3eCAcW3c+8/rO8HBj/KA0XJ7wTCJzSbt
	ZOzLY4tmpo+Rq/jJbiwKjgMkHooNQESz0+uhzTEqeYMbJQtmH9C6py1I
X-Gm-Gg: AYBFou1IuJzEOKNz0EJOeRMtVql90JR4PSsez139wco6qWGaIxqU4bqCxuz+A1yIUQu
	kPd2GjYCqjDJxWoL/dBK+rCsY7A6e3kX64F4vKBaMZKmHJZNSIDQ/xNp5s4nt4T5rAscl8PnhGl
	pZ8yyzqpBF4o8RWhX+VLIoCQ5W9s6gyq5HnfihfI7URrbRWleSReNnOh+zhSLQFaJtEpShcye8W
	3Lpl7JaJZtre6xSUpalk9bXk35YAIPhsJN93NgsVcOWrjcNwIAQ1InrzTxUK6mFyg5g0h1Bs88O
	j41OO+xibnhSMsn4bmv3EXAfSMfUSjziRot/8VFL+fKwfQrRw+ox0a8kbNB3sYCuCD3r92foo+e
	D84jRCtlA+Otdf8Vy/ILPPRnv/8ZDfxL+p2tY+xj8uIZaIaH2K/vjMuc38OyNUdwdLhiPLcuy6d
	zYaf9L2V4KJ6GcaQffFRGxeRttkvIM3k28tAPpur/ZlKKmmt/Bawi1dMsnoiGMMTQCdjhLNJQGG
	OyptHA=
X-Received: by 2002:a05:600c:154f:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a1714d1071mr31807835e9.14.1791153547399;
        Sun, 04 Oct 2026 15:39:07 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1698f7910sm97775755e9.3.2026.10.04.15.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 15:39:06 -0700 (PDT)
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
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()
Date: Mon,  5 Oct 2026 01:37:24 +0300
Message-ID: <20261004223852.312487-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usbnet_resume_rx() uses local_bh_disable() to synchronize with
usbnet_skb_return(), but local_bh_disable() only affects the local CPU.
On SMP, usbnet_skb_return() on CPU0 can pass the test_bit() check while
CPU1 runs usbnet_resume_rx(), clears the flag and drains the queue,
leaving the skb stranded in rxq_pause until the next MTU change or
device stop.

Fix with a double-check pattern under rxq_pause.lock: normal RX avoids
the lock via an unlocked test_bit() fast path; on the slow path the lock
is taken and the flag rechecked before enqueuing. Move clear_bit() in
usbnet_resume_rx() under the same lock to make the flag and queue
transitions atomic.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 drivers/net/usb/usbnet.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 0288d89e1d13..5eba2cef8bac 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -329,13 +329,15 @@ void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 	unsigned long flags;
 	int	status;

-	spin_lock_bh(&dev->rxq_pause.lock);
-	if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
-		__skb_queue_tail(&dev->rxq_pause, skb);
+	if (unlikely(test_bit(EVENT_RX_PAUSED, &dev->flags))) {
+		spin_lock_bh(&dev->rxq_pause.lock);
+		if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
+			__skb_queue_tail(&dev->rxq_pause, skb);
+			spin_unlock_bh(&dev->rxq_pause.lock);
+			return;
+		}
 		spin_unlock_bh(&dev->rxq_pause.lock);
-		return;
 	}
-	spin_unlock_bh(&dev->rxq_pause.lock);

 	/* only update if unset to allow minidriver rx_fixup override */
 	if (skb->protocol == 0)
--
2.55.0

