Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794045785;
	b=f0fvi78NU2C0jwTHpMlkerwPZPR8MjTezgzSgXBvSMmR2X2KOEKlLalE8dsKRVUssJUy
	 0RGCWpcngpN0Faj1m0nc5jPv5Zb2A3en66uXQKVk0e78aDy5nJ7M2ppGMNpxJJpOh7Vw2
	 JXtxK0XXqIiAnB91j4K9I9EBNV3EFjmWIdZiaNTliLfE+iqCsKwmTCWEBnAOwYGNhPxYm
	 c/in2QsDy7nZGDvWLPoVtyZ5mfDA49DpMND0+FxV8b3GZdybJdsK7kihJ+za64lUOkGGi
	 KzuwVY7GRkXvMUr+W/nJegWEblW97l4TY8Fyvc6WIt3isFBocsGy6wsJFcP/1zIaTTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794045785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hjw8ufxY1uqj/hElRvoiFVTy1rX/3DfCiEVnshIZW2A=;
	b=20Jhn+R38Ota29ZWFlFI7NBkuQ6oxvgTI2v0HJTp7M8n7Gt9Qb3U9mAn2z0BkLZb1zqS
	 /AHZN3Zb3QQTO5cOA/tM/R8zsHLbasH7xfifHKqfM8WnjuClZRXCtipS4A6mDcfsoS84b
	 eZaO7we4c87KKvsv2F4DY1KPh1Ai1LWy0vPXYIiyBfjW8vRexlaJ14Pt7R4oSQTeYvqWF
	 gh68w3zk9UM/IeLRKz2YgPOSKC+Tw2nwUygq/3DR+gCxGuweNG7rBDILwpUMw2jUY1qJP
	 WB6x5m72OlR3tG8yunoAbuGnknv/6rJ0fu0L92XwkAoLaK+GA3uKHhMNhtrZYVQAn6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWcROtAn;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C42606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C42606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWcROtAn
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb684859cbso927370a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794045785; x=1794650585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hjw8ufxY1uqj/hElRvoiFVTy1rX/3DfCiEVnshIZW2A=;
        b=lWcROtAn5ro20ByT9pzIBwjOOXNBIlWks/Fn0Nn7kzh+SexDXRr99TJWnUGEVCa8yL
         UlKZZKVZsKzKCYJk+6BMNZUd9S1eMN9b6s9WkbTROt3v04LvxGDERPFVNoZ07BGY23U6
         ATO4Meb5Vg9izol4qgk4OxWnGDuowW3gpGWJ0BhxYAVg57b7IcynogZ0DcWLQgw+3xH2
         0rpQdHqm2jlmAbGlsrQ/R/ve5ZBrjPSXjjKyBD7FVOjSpyRyMHLCd8SF7SHZEYnkGfs3
         mEgYnru8FvA6WDemNBkKlFhE+3M+BR4JmyCgOqip4pPM8fAwxgLcZTLxod5HL3Xp3tGp
         4gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794045785; x=1794650585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hjw8ufxY1uqj/hElRvoiFVTy1rX/3DfCiEVnshIZW2A=;
        b=tQrBQ4oFh07ceqmZ/pSg3WEiyIHjYFurruq6ES1/9vucfpy1L6i7cn79Q+Iz0ZtB2V
         ylgReFcHSQ6tjhb5J4Z183T/WW/KwDXjD13uDXkQz7/AHR3d+pr69ElNzqZWvgP7q3U5
         lpCL7CQJqA5c4qsw4y0SSvSTx5Oe7F+Axo8ea+FV3/r1V+nfgzGbHznjNNSnIYU3XgX4
         ojWdhdq+ISvqvbdwOVoWpc3C+Qn1avJd14TrOXZd13HwRwE4y2s5C5RyIfAv+nFiwmb/
         NCG8YguET7imJZiAUga+af/lwXRjI534eXnPs7RKBqXqY/sDzJiIvwvo+D1M0jdPcRbK
         Ak0Q==
X-Forwarded-Encrypted: i=1; AL+hErGOw9vktCHb54nHN8CN5Z+lYLBmH1aZ9SeuY0ivuWqa/i+9Sa5p4nY3pCd31rynm/Mt05fxSjk5snMs7MA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dpmeJEg2fJ0NDZa+wrMBmABlf9rZQRPNX1DiHBEa3PYHf/L5Z
	/wzIyr+nP3hwpyJcjFx6RibX1tOkJYJCmwCN2mmas2QYo64T9hSgsNU5
X-Gm-Gg: AYBFou1ONAHsdSjc7MrQn6P4dKn0sHc40z3aFFItfelsmsNwhCZ+dGS5fTkm4v+PgfS
	oY20jYURAdOnFP13QTzauy7iTP0VOujoY+Qikj1Cid40uhCuiq5pwwpO6YMOOfXrgQoS6tTPXnN
	aydQ6wFA1EUHFL5SKF6aa51yxnV5D79jB0ZU1EDPUF1GVmqamgF7r0+Fwp7WMUJ17VBYZie4P5V
	e5cKzbd79cKxP/9372D8BMVJtLMf+Sd6zr8Ggc3X8AWGLE2yginYVrXGhFT6BRkNCwnMinVyhMg
	5T7BL/bY+A46S801JTVEVGTPfDViE8qbAlD7PPFwxvSSpThDf8QpAdjyNZatWDe+mLOJ1JEVizQ
	zhC0ypgVBHl9gQQq09DJm2+/OTj4mAJyHtiHds2cMmWkI0dT5Nbx7LIM+PK+68k3XcOqC3Xg/m3
	Dwsys64lMRwZ4b5BASTVKDmhDs9xNS7rGGZOcyj7d+n14eLba1ihteXUOqEwilrkspuZBP9FhGw
	CrOedL/D7gShlZ3tmSzHKcpyQviwcWp8MNS84XCceEvBlFTKDUJPR+wN/3RHNGEYof4FTJFz2tL
	lUs2T0Vl1SLrMEiFEMr6WJJO6pbqBLFV+bA5H4pthF4e8QwF
X-Received: by 2002:a17:90a:c10f:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b0db6a8de8mr4788271a91.17.1794045784240;
        Sat, 07 Nov 2026 02:03:04 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c2bbcsm2857110a91.1.2026.11.07.02.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:03:03 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-phy@lists.infradead.org
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] phy: phy-bcm-ns2-usbdrd: cancel extcon work on unbind to avoid use-after-free
Date: Sat,  7 Nov 2026 19:02:53 +0900
Message-ID: <20261107100253.3543022-1-hj351016@gmail.com>
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

ns2_drd_phy_probe() schedules driver->wq_extcon (extcon_work), which is
also queued from the ID/VBUS GPIO interrupt handler gpio_irq_handler().
The work handler dereferences the driver data via container_of().

struct ns2_phy_driver is allocated with devm_kzalloc() and the driver has
no remove callback, so on unbind devres frees it after probe's resources
are released. The GPIO interrupts are released with devm_request_irq(),
but free_irq() only stops further interrupts; it does not cancel a delayed
work that is already queued. probe() queues wq_extcon with a debounce
delay before returning, and the GPIO interrupt can queue it too, so on
unbind the pending work can run after ns2_phy_driver has been freed,
dereferencing freed memory (use-after-free).

Register the work with devm_delayed_work_autocancel() instead of
INIT_DELAYED_WORK(). It is set up before the GPIO interrupts are
requested, so on unwind devres frees the interrupts first - after which
the work can no longer be queued - and then cancels the work while the
driver data is still valid. extcon_work() does not re-queue itself, so a
single cancel drains it.

Found by static analysis and code review; not runtime-reproduced (needs
Broadcom Northstar2 USB DRD PHY hardware).

Fixes: 787f24543c4a ("phy: phy-bcm-ns2-usbdrd: Broadcom USB DRD PHY driver for Northstar2")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
index 171bf09..4b8930b 100644
--- a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
+++ b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
@@ -6,6 +6,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/devm-helpers.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
@@ -339,7 +340,9 @@ static int ns2_drd_phy_probe(struct platform_device *pdev)
 	if (ret < 0)
 		driver->debounce_jiffies = msecs_to_jiffies(GPIO_DELAY);
 
-	INIT_DELAYED_WORK(&driver->wq_extcon, extcon_work);
+	ret = devm_delayed_work_autocancel(dev, &driver->wq_extcon, extcon_work);
+	if (ret)
+		return ret;
 
 	driver->id_irq = gpiod_to_irq(driver->id_gpiod);
 	if (driver->id_irq < 0) {
-- 
2.43.0

