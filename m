Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510276;
	b=a2YCB9ZQ79Nsjp3KetmMc8irCePkmOEaQ5MtXH/vGxMR+lzNc4lk0F/Kd96sbeN+jfmy
	 9BgCLXkJRA8EA0ke51fcTYP8fR96XNqQDJJOOwBGHeNFoYwIn3Kr1636T/HlgLTLikk9N
	 SMWlk3iKOzpBo7kFMFqxfK+e8qlro9ECJomyKrSxIzDyEssF5fRqNwuSv2Ps+a0IjWtfO
	 XYOKAzTj+tkydeDqeizR3O2fdi17dg9Qo9l0Lf6IolY1kcmtAV73aCIuWG3RU2ob66Hfh
	 FdaTFGlNP62bquf9bC7arRMElYT93/eX/zepKL+2IJfmmvyL8+8+1JyuBC6tHcr3kkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qsoSLYus+M1tCAzqI/ZNpAHRrLwoOIcxK2qsa3BkpZs=;
	b=GGXaqwUYI4W4q5kRnG8o1bPphRfJjip41zaROL5i+NgMurK6SxU/i14lAiDgNBL6oS6v
	 YcGjIJyMhjvn/4LNJTsksFc3OR800syUA4/PQOWsDtrLlVyHbDZA4DqjrUbNUn8IiHobr
	 53XpnKkMONS53cXO31NsFjVgPHsmxp2l/7Pubq0s3p1BkTe39OfE77uhqjNGWyrQuzkKY
	 jXtsW0ZdQCUHG8jy6UqENGj9w2TLWVzwnlUNx9umXjtqFz8+PBkR5DqN/xhFJALbG6fb3
	 cxiQQpats4NkyHiFP4/0BZH1CjrvdXtjvba9wuWV1fBC9IiSlrisnhm+E/x+S8Krm1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p9V+we3v;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4608606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4608606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p9V+we3v
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so9760915e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510274; x=1793115074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsoSLYus+M1tCAzqI/ZNpAHRrLwoOIcxK2qsa3BkpZs=;
        b=p9V+we3v1bSecIybHxsxM454TeWmuCMmdqKwv724cigxeNMU3C48odpzjFjJVRTeuL
         FdahkGhmGg8Vk3aMjbUQmF2HnnyNM2EqVvVCpp2HqJ/gO+vzYMtAOXAedCsninSfZ/18
         S2phVMfDFEDnoktgmtMqyo2/jQqZ3p1FRPKIUOP/iB6dn2ND8eSsQ8SXotGJUM/GKjah
         UnQoE2JoO+FdD7A9g7At9H5ZIKELCyCPHnJp1/NIN2/CMQn9INRy1FSs450in2BRz0Zj
         MG0qOD1Fx2YHBke7goite6W1MayeX+DniL0xoCuKveN4maA3IMZaFfaU/8U74tH7GTjv
         1Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510274; x=1793115074;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsoSLYus+M1tCAzqI/ZNpAHRrLwoOIcxK2qsa3BkpZs=;
        b=IPgMeuKwNGP1CKubJUo9pxbGlXakWmCGCBOR5d/QAfxpOBEakYBdTwu7rviuviSAs/
         jprQyG1EZ2EO8Ibqtxaa+Ho1fbXLRWsgJxjKKaM9yptho0RsYXlUOsIZmhR2x0inu3ay
         5yEzR21FupqqQpGl11jQQCcFi/PTi3jYP+sOk8NNVRjfGw1+ieq1I3cQMHBoYM30EacE
         B54QNYVvvrYncQS/8ZWu7Xr1FlY2Bxko7vLaH/RUnu8cnx4EXDuZV6B1cRcZWUD/xg/a
         1DlLgIEyYZxFcqZuZA8YUzC8rr/thc9XsCjLnFzifoMh2NLc6fc3WjAUiUGip6FC0pPZ
         mm1g==
X-Forwarded-Encrypted: i=1; AKwUvBx/HPZFy1K54eBdDYlHdJ9mvu7eDm8M4IizT4VTME+B0mmOCbhzq8Zivt40SlwGSm6ZuzVlhmzPSm9Ar9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrc47GV9rH39R0oHKz/M/PgGCEA3Wx8VhjRYaiSPXrdraGbexX
	VS9EEVnvSFcX5T7aUv8GIiVbUeyR9H1IpOOnmCxemOs5ZflCrT/bJAjn
X-Gm-Gg: AYBFou1cwPrBAAVM50NpLxUY0IhS3HX+NbCs0nw0Bti711/kvVDfuD0kI97ODEQ1IQe
	1T3s61pcHKdNjrVwFR4gKeWFhKxAQN8GY/5akYn8554Ldl/BA8etK9T8rdC9HnRsE/Exb9i96v1
	Ijkin2TtBNDdOMPrXoRJkoU3C2ToC/Go+aQDshFjDr24g6rnVM64y8jylnWrVAZ24qGsSgYyETc
	w3DB0HMFWpLtBDDjbnD5mys5tmOmXrkTAV0JLhzMWmTi9x+w5GNQetZEGrWiYR88k0VulbpKmJQ
	gBU3cGiJRRUT6It14V54uvvTydvaBUV1C/Cn2n9XSO+qEvvs9m2e1ZWbW0vRMxxhbUhnN2tWEjj
	nwuBU4+wV9BulejaxeBhC9TzZC3IZgYnVwmvV+N+IPsH5bij3RTn/JB4OxCss9zT5Ucj0uWdi8j
	wyoR5RAWopwL5eHreLOlMXNLZn3da1OXi6HYRDO7ClRRfNK2wZa1WNIfuq+y/EOKj5YZFj
X-Received: by 2002:a05:600c:8b2b:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a1f4c80374mr69433495e9.6.1792510273908;
        Tue, 20 Oct 2026 08:31:13 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818c59sm7271629f8f.30.2026.10.20.08.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:31:13 -0700 (PDT)
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
Subject: [PATCH net v4] usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()
Date: Tue, 20 Oct 2026 18:29:09 +0300
Message-ID: <20261020153044.18828-1-omermetekaya0@gmail.com>
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
dequeue operations with rxq_pause.lock, dropping the lock around each
usbnet_skb_return() call to avoid lock inversion. In usbnet_skb_return()
use a double-check pattern under rxq_pause.lock on the slow path,
keeping the normal RX fast path lock-free. Use spin_lock_irqsave() to
match the lockdep class shared with other sk_buff_head locks taken from
hardirq context in defer_bh().

Discovered by Sashiko, not triggered, not runtime-tested.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>

---
v4: Use spin_lock_irqsave()/spin_unlock_irqrestore() to match lockdep
    class shared with other sk_buff_head locks taken from hardirq
    context in defer_bh(); restore local_bh_disable()/local_bh_enable()
    around drain loop to preserve BH context.

 drivers/net/usb/usbnet.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 84f97f448b2d..9c4a23d8cb86 100644
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
@@ -700,15 +705,18 @@ void usbnet_resume_rx(struct usbnet *dev)
 {
 	struct sk_buff *skb;
 	int num = 0;
+	unsigned long flags;

 	local_bh_disable();
+	spin_lock_irqsave(&dev->rxq_pause.lock, flags);
 	clear_bit(EVENT_RX_PAUSED, &dev->flags);
-
-	while ((skb = skb_dequeue(&dev->rxq_pause)) != NULL) {
+	while ((skb = __skb_dequeue(&dev->rxq_pause)) != NULL) {
+		spin_unlock_irqrestore(&dev->rxq_pause.lock, flags);
 		usbnet_skb_return(dev, skb);
+		spin_lock_irqsave(&dev->rxq_pause.lock, flags);
 		num++;
 	}
-
+	spin_unlock_irqrestore(&dev->rxq_pause.lock, flags);
 	queue_work(system_bh_wq, &dev->bh_work);
 	local_bh_enable();

--
2.56.0

