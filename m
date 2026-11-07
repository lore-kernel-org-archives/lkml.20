Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794034990;
	b=mwZJxWEGB4kJqa6IcY0XNJL5avsSUdgMvdyyGrcmsxIOiYcaN1jQkGLx88QIPlnxWCO7
	 4YodS1SAabAjn8Le8WpHN/Hc65VZMXDMECMRypnnqY62IZKN+OORrjW9v2b5Rqi/StRnX
	 GKKfyvGEcJNDm5JmvOxO9OGsrAj7vn8wcLFG19JxQVPCVPEv/ZTffpDme0ejkOueyVsF9
	 NT+6S0/GD/Zl+3tEM3nEnOLwWIsYfYGApGk3B8ulQzI4sNNJ13LYsZIRO1fRYqWLdMnXR
	 RDud4Oyh7EbUkSMXkA+D6JPQvvr8+ctYt6UESc5y0UMNjAyQF4XPrlgibndN/rD44Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bFEfHL+TsS1kVBZGSFsslYDN/djqa+P4kfXVi1Yph7g=;
	b=yZRZ1MWD2ctJMdAVCdjvQabaWeZpxQET9UDT40XB3yHFDye9xtl6IOJlWJxg6pl3N5V0
	 2DVuxVy3OlxfvlqOYpFaSYhncIouhGCCzuj91jefCKMfhwpjnNwQkfRgw2vR/UKHIIUyl
	 by9mP8ZXPew7tRLXFIZLuh7God8TCzAvAJnt1j/MiCBY/D7m+PpOaqmRUGWberrfrlLBL
	 H4Xpf/eXcgRD/TyjGFRgKv0bCuHiVDR1RxAewDzBjTfKkO0sXuWDnf3+odJ2miPsyoJLd
	 SLT/DMs1LyGEbcVuGJ1TjOWLqJTvWTyNO9RmkijbK6e5qEEY8Je9yr2BvX7xr7ehULQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcmYpw6e;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ADB606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97ADB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcmYpw6e
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso824616a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794034990; x=1794639790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFEfHL+TsS1kVBZGSFsslYDN/djqa+P4kfXVi1Yph7g=;
        b=GcmYpw6eafQhXUAXEwA8jwummuHvOzaIwSi0Y74SZr4ARQSCpITqDEnVzsgzgEsFFK
         8XA3N+FlcWdCRo6cxvHhjVmbXoQCBTMnvihWtnebvnUL3NP3Kkpim/1OsujmN6CK+fW1
         geLraiZRO6B8jG4UZdjv+zwi43Jlr2aXeZgNaBPowHqPglGKqkButi623n2sV2Bvqsrv
         t+disbEPHRq8Qd0BP166jNXPM9Gqr5OHyQmNU0ce3pgBHLxLRP9CqDP2hWoTHyRYQzdY
         0oQlaX9hiO5XM3aPoarRtrL9S76WG92mEJ3+29HAyk72Et5dbOW6rKyGY9BwwARORPD6
         pEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794034990; x=1794639790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFEfHL+TsS1kVBZGSFsslYDN/djqa+P4kfXVi1Yph7g=;
        b=D14cem/g/Qs+piw3uG7139BFyJ6Oh7QCd11fW29zMkZHyCF5U7AMV+dvoudVjqzm4f
         ufbHcvjcPtu1ZbZjLwUp7fCbRooYvHi3isfiI12vJFHQB55JR7P/pb0D9DtUBINfgm4J
         1+rervEBUHk6Z2v+EETxu2gHeWxcD/IL26o07Rh8Hqd+tUjTqhGowNNL5QHLd/O0kXxO
         hpQXN4hfL4MB9QBpb47HItNviiJWFHBw3hjc5J/tc8+uiXgH3bQUCxRnJWm8F2RGKPln
         YY9bnu179nyIWX1JIx/k8ZqXE0PK4Y9Z2ykI5PTQ0HIRWQTeU5WFJ06pg0Gu4aLMb1YI
         ERgw==
X-Gm-Message-State: APuU4Z+jR4DQoX9mk68081kXxMBFQim4/F4y9wda6gbVt7uf0NtJ39sX
	fPvbdhog5IM6ewPjWUs6YetqwWg/cM07XSDF2LAqbM9I+ZI0y7x8kUSB
X-Gm-Gg: AYBFou2RKMhEgBk7IKU9qle1rBulqBl8S53W8mgOwyjn9A042zI7T5VRJWEF9c2KXT4
	6BHaUkl68s3xF4iYo3hG2tkR+2cC/38emYjMuQZ7DOJ/5EqOIf79cW96hsOwQid4DqH/U/yLsOL
	bpM/sih7D3dztZ0jLsIjDy5ks3uGPCieFO+bVfDDlaRCvScl9my65Umuy8GnU0FOE7ReS5NzK5c
	+UqRRr7gJq4PjGTqDZT5PF9X+pnVew2Fsn2dWjT87X3/fwA5rXwSKqHdfyRDVBUKS+bW5uLL9JO
	g5XSR0xOof26k3CFQG0PBgJawbnEu7lYPwS4uSSf/eXobxwijdal4q3yRZt4fv3qKRTh/HrSJtE
	6Qz9+XGbHA9ftGULZPGUboCj4Ij1UpFU8RiYnf19kA4PVcsB9lw2LPaIVPuy/mpMQM8tCm8+a8g
	IFAYfHx0xAM3dBREAAJiUO1Aor8HaFjWG7hhX/qdpCap3mi+YSHVPxeRi8UP822vFGWyMUhzp93
	E7IiDpVPAkEThqv6+OaaG4susZ76oD8kHEIxp5azR4Ijm3ET0eRZiqbMpDmxV70Cz4P61n1PivK
	VwP5QWFW2k6dVvL3FH9y79OGGSa3KBSMRj8Tzj/XSUi0S5Ga
X-Received: by 2002:a17:90b:2792:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b0db7109d1mr4442933a91.67.1794034989765;
        Fri, 06 Nov 2026 23:03:09 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c1c2csm2220866a91.2.2026.11.06.23.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 23:03:08 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: gadget: pch_udc: drain vbus GPIO works before freeing the device
Date: Sat,  7 Nov 2026 16:02:58 +0900
Message-ID: <20261107070258.3413402-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

pch_vbus_gpio_irq() and pch_udc_dev_isr() schedule
dev->vbus_gpio.irq_work_fall / irq_work_rise (pch_vbus_gpio_work_fall /
pch_vbus_gpio_work_rise), whose handlers obtain the pch_udc_dev via
container_of() and dereference it (dev->driver, dev->pdev, and
pch_udc_init()/pch_udc_reconnect()). Nothing cancels these works on
teardown.

pch_udc_remove() -> pch_udc_exit() -> pch_vbus_gpio_free() previously
only called free_irq() for the VBUS GPIO interrupt; dev is allocated with
devm_kzalloc() and is freed by devres after removal. free_irq() only
waits for the interrupt handler to finish, it does not cancel a work the
handler has already queued, so a pending or running work then runs
against the freed pch_udc_dev (use-after-free). pch_vbus_gpio_work_fall()
polls for up to PCH_VBUS_PERIOD (3s), widening the window.

The two works are armed differently. pch_vbus_gpio_init() assigns
dev->vbus_gpio.port and INIT_WORK()s irq_work_fall *before* request_irq()
sets dev->vbus_gpio.intr, and pch_udc_dev_isr() schedules irq_work_fall
exactly when dev->vbus_gpio.intr is 0; irq_work_rise is only initialised
and scheduled once intr is non-zero. Cancelling both only under
"if (dev->vbus_gpio.intr)" therefore misses irq_work_fall whenever the
GPIO is present but the IRQ was not acquired (gpiod_to_irq()/request_irq()
failure, or a device interrupt racing removal before interrupts are
masked).

Drain each work according to how it is armed: cancel irq_work_fall
whenever a VBUS GPIO port exists, and cancel irq_work_rise next to
free_irq() under the intr guard. free_irq() runs first so the GPIO
interrupt can no longer schedule work before it is drained.

Found by static analysis and code review; not runtime-reproduced (needs
EG20T/ML7213 pch_udc hardware with a VBUS detection GPIO and an interrupt
racing device removal).

Fixes: 637b78eb31e0 ("usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: drain irq_work_fall under the GPIO-port guard rather than the IRQ
    guard. irq_work_fall is scheduled from pch_udc_dev_isr() when
    dev->vbus_gpio.intr == 0, so the v1 "if (intr)" placement skipped it.
    Spotted by Sashiko AI review. The separate pre-existing missing
    cancellation in pch_udc_shutdown() that the review also flagged is
    left for its own patch.

 drivers/usb/gadget/udc/pch_udc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce2..5351bd9 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1406,8 +1406,12 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
  */
 static void pch_vbus_gpio_free(struct pch_udc_dev *dev)
 {
-	if (dev->vbus_gpio.intr)
+	if (dev->vbus_gpio.intr) {
 		free_irq(dev->vbus_gpio.intr, dev);
+		cancel_work_sync(&dev->vbus_gpio.irq_work_rise);
+	}
+	if (dev->vbus_gpio.port)
+		cancel_work_sync(&dev->vbus_gpio.irq_work_fall);
 }
 
 /**
-- 
2.43.0

