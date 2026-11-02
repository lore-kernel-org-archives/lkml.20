Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599988;
	b=Qoq8G4E++IIa0nPPcG6uhJnoK+u2zIJnUPgMLqeT++xv+EN2SPENfpSb60P2r/qiew3m
	 0Libdk16rDr8G+cBro33BvaXrbPhyWe088Ubb6AvkFnOgQ5mjqVfnTuUaEb+1Z4a1RhLf
	 MBF3CNIBLCnqIrLoZDym3PpSevgu3RGq56Nlg0iOATZQKbc+HWYYGRqt8zFWlHAmnPgYA
	 KkJXKvAozW70arVVnHOCNxQ2zHRQqM5J3gDeGNsO1lYKsMd6AXR8aLoLxBMCsTv2jLIhX
	 Y89XTzIAfU4VnCmCSSvoEDa0XDAxaR12C1MzBXBKmkEbJvj16wigYIvD9q35FORQbNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599988;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=eJRSpK6+TMBBtY/n3fgM2Uo8TRAmA0RhCG4CghI8WbM=;
	b=Td/N8FRgRiFccH3RCjdnoozTLxP9/r6FScwpLiP7JxyB7kTVb3WFbbhwunpU0fYJHqYF
	 13mHIdoOfHi4V3zkzdJS6dpjAkJWGBZGLfq9Tvg+OOGCxPzJV3GS7h3PJVBBWO/EekcoF
	 YN2/0bdAYo5clXAkR+Xq9pLICDzqlJsTj9mIK0gGZAtmcHpETHgjVhJ4RpW88avC1w+M2
	 OHilQI5MNJSC86AbVTaDRbg8bR9XzDguM4dKpMWyYNblUeKk25a6fGB1/xMbQ/9Zdj7AR
	 EYGCRO6xmYHiVjsrzd5Z1M3TPAwgCFXBYOq0sk1zjO0taVng8UiiPE9/o7ARIQgrfCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=K0V3W2DA;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4D1606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F4D1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=K0V3W2DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793599986;
	bh=R7WcWDahEiwui+2P0XVCTuf1FK48l2e53eu8vkW0giM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K0V3W2DAIIn3rQHRxfXaAC2G+46NTR3k6rK8nK7fleh+d98fngeN6A45ckDyd+qu4
	 9DpFK9WWErWbUQe/RZytY3fFLw2mGT5uDLWG4TTKNxU2e0QIjciuohEPKnFPfKi3/2
	 Hb8f2jeT9duj6x+lMXOA+OPOOUHkwoGI/kq6Ukhg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Nov 2026 06:11:54 +0000
Subject: [PATCH 1/3] alarmtimer: Drop the spinlock around the rtcdev
 variable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-alarmtimer-locking-v1-1-3c79a698aeae@weissschuh.net>
References: <20261102-alarmtimer-locking-v1-0-3c79a698aeae@weissschuh.net>
In-Reply-To: <20261102-alarmtimer-locking-v1-0-3c79a698aeae@weissschuh.net>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793599974; l=2151;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=R7WcWDahEiwui+2P0XVCTuf1FK48l2e53eu8vkW0giM=;
 b=/lCHGLaRP6osjM7/WuSRftZpkT9p+oymQzqU9+X/EF3Hyi33saaCjZ7MArGV+ZglXW62Ycru6
 xj50lrHZNoVB1p9NWR8oSYVhYFkGByxe03r4AIl0WbTPmvIx1z/PktU
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The spinlock serves multiple purposes. It serializes calls to
alarmtimer_rtc_add_device(), making sure the 'rtcdev' variable is
written only once. It also makes the variables values is read in a
consistent state in alarmtimer_get_rtcdev().
But alarmtimer_rtc_add_device() is already synchronized externally
through the driver core's subsystem lock. So additional spinlock can be
dropped at replaced with WRITE_ONCE()/READ_ONCE() for consistent access.

This removes lock/unlock operations from the alarmtimer's clock
callbacks.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/time/alarmtimer.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index ea5be5870e51..e60c626e326b 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -61,7 +61,6 @@ static DEFINE_SPINLOCK(freezer_delta_lock);
 /* rtc timer and device for setting alarm wakeups at suspend */
 static struct rtc_timer		rtctimer;
 static struct rtc_device	*rtcdev;
-static DEFINE_SPINLOCK(rtcdev_lock);
 
 /**
  * alarmtimer_get_rtcdev - Return selected rtcdevice
@@ -70,12 +69,7 @@ static DEFINE_SPINLOCK(rtcdev_lock);
  */
 struct rtc_device *alarmtimer_get_rtcdev(void)
 {
-	struct rtc_device *ret;
-
-	guard(spinlock_irqsave)(&rtcdev_lock);
-	ret = rtcdev;
-
-	return ret;
+	return READ_ONCE(rtcdev);
 }
 EXPORT_SYMBOL_GPL(alarmtimer_get_rtcdev);
 
@@ -98,15 +92,13 @@ static int alarmtimer_rtc_add_device(struct device *dev)
 	if (!IS_ERR(pdev))
 		device_init_wakeup(&pdev->dev, true);
 
-	scoped_guard(spinlock_irqsave, &rtcdev_lock) {
-		if (!IS_ERR(pdev) && !rtcdev && try_module_get(rtc->owner)) {
-			rtcdev = rtc;
-			/* hold a reference so it doesn't go away */
-			get_device(dev);
-			pdev = NULL;
-		} else {
-			ret = -1;
-		}
+	if (!IS_ERR(pdev) && try_module_get(rtc->owner)) {
+		WRITE_ONCE(rtcdev, rtc);
+		/* hold a reference so it doesn't go away */
+		get_device(dev);
+		pdev = NULL;
+	} else {
+		ret = -1;
 	}
 
 	platform_device_unregister(pdev);

-- 
2.56.0

