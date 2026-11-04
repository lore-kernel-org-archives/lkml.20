Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793833414;
	b=yNjgKxcednI6qbBAILV3bxpIo4xwOYWS9N/LtulgfyxJN8xzhGN9cvEFXfM6gTV5jS4d
	 OU+aWi5OZgUg13I2Iaj23ppMua8Y1GcA8VE0pa0umVGDpI7It5nX2HqWn8C9MsoO3W7rq
	 c/kCBgaETkob6glz4JLzT6+IBdsvB2H9Pq03/uKUlIzhre9qW4Tmu827KzIQplkOxA8G/
	 zlc8pHumibhkugP6QUlfqTJ2XNuSQRgfw2YMH6b/Kl+E8cIMLetwZYFvjv8E2brQiOxES
	 GEKnvKMUQ0qNT8yEiLpSA52ydBBDf4wqx+zVx+CSkzi1WMPgbT5vUEhVS71kuyG3spw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=E3/qpbZQVNV3lMpL8sax6liyRC8rCnhmkYMiRpukkUM=;
	b=SzSlJ55cG9V8Q6bYkB5KWdkRUiEEgGAkTbLjkKMkgQ02XRuRixFldDPD4NVhvtDr4AwL
	 6vW4vdI4pWyIEK7iRfqQpLEYzroAj5s1CdlQtpNlpep8g5rgTsY1DCYOQ2pZuHAR1wAnX
	 NIxo0XYT6WRmT9Tu+Zu8kHfQlCZzn/l8tFpj9/bQFYl5CrS4/auOmAxI6amfSRlvllTB7
	 r2/GsS6UMVSAhikSqCIy3NML2ElcUAkcAbB7RSJ51dqhIOZbD8CtQ1N82ySB7IeNDw2+U
	 6t+rs0L9CdmZ8LsKzylNM8VVB6zotSYkKrX7SjCh0aDmu9pBBtpgDNvRc+rHK7ESdwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu4+VLWG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0116A606EE93
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0116A606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu4+VLWG
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-53dbe9b8d6eso77116b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793833413; cv=none;
        d=google.com; s=arc-20260327;
        b=fseTcFo/KoiavlGOJ3IYNUo48pPvzvcC1JhXHjhXRCpEyKOWOSNZOx48sSFpzI4ujD
         j41xjfgRup0etJs1RpMSCR0K9fhWFhZCngmImLNuG8kNuVEBYmTyfiY+XXB9xOyzSNaM
         Wc+TIoIZRl9ifzuM91z9GG4GuFKsI6tzeEiKad6CbYltAGriJDfI1O0C0hrdEdDs+BYX
         va/3hjvPhi1YmzRz0nWVIj7jvfeRFzZ0RAcdB22mWvLr9cQbda6CB16PGa+Yin6v0zif
         h4ogofGQE4u+r1yZ10BZNMjyTx08NXPEWwJeNVXBfqZYfJxTzFU8kEIrrKUsJbzWmNAn
         4j+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=E3/qpbZQVNV3lMpL8sax6liyRC8rCnhmkYMiRpukkUM=;
        fh=FriDsy0fEmThVxbBI/z1R9UebR5VEQJ3x3WXHJJXyHo=;
        b=jc+U0yL3SaYl2p9OG403+6gWIEEM8cIPPaIjY3kvZPHJOKTkJk2q2hx2odNGoLMuTV
         gYuhcaG9LEyg08zQ/21ig6EzaSkMLozMiDTTBqptkyzS7U4j0AbA21RyT/FgYwR8LTEK
         IkWY+UkoXrVBV4BXRQUEpfPPlszf1r8WRx1D6BNpLYq2x0wWcdXYieyEFT4QOUWrZA49
         CS/bnoLcHSoOYSYVoZ85mw1zOBlCKg6TqGk9oYQT1xaOlREp4zVA6ZHOFU+nUO179b0e
         cbuczjNSO7xfinubho9PVuFyuQ5YtqUh/esOwkPxIXfCYPCzOj1PksdpyNimJwyRLDPk
         ySXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833413; x=1794438213; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3/qpbZQVNV3lMpL8sax6liyRC8rCnhmkYMiRpukkUM=;
        b=Wu4+VLWGmMjjBoxRHJtRMJhfwRcobe8fdS8Amtqz9PKv/C+h/sWuWwSi61WZeR/N1o
         0rLNvMQpZDoBcjl6hckr5Xks0iLQ51BnGOfVwmLlRz7xZEDIwgFtK8ktILHfgzTkZk8o
         tbdYdFQdelddvOjrEUnSRtU+SsFkDsIpTf3hSYCH4vqRp/0LgMIO1kP+GGG9TV2sgsr/
         V0ewFvLUbPDIlNrGitUpkwTMuFzisoEPauD7ODjrQ1TFBysqkgdYUx2ybwMlFl6GOKug
         8cvaRBaqp64VsYQMSc0GXj3rQhpTk8jeTpBKrAJYPyfjoUNhvPydnznmdjYFv8aGBTDP
         8PAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833413; x=1794438213;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E3/qpbZQVNV3lMpL8sax6liyRC8rCnhmkYMiRpukkUM=;
        b=22I3ABvUZU5czIjC4ZctvXio/8hjryT31cx06tu0KLn6cO7kqW9ttbchHt/i0fZXUW
         zoxiCneGSzPmufS/0YvDAsIX8O3mhDlOl45CCqxd3Rd/mFczxXgHu+MVVFt6uu8NjHIE
         fW0uX0p7qUsPqnyt1Srt4097TFLfJ9m3t1C8Ejf3AS50U3Y5wf0XYTK99PFFCN2zsVFw
         ExfM8jVmVWq5ObpaB+ZEoZt97Hlm3SnlpLHSN+mnZfbMFtvqec1EaIflLIrpkQsJzHjR
         3Xuu1SQqRZ00TKwr51If7Xo97IxfczHJ6BJRdqz3MzTV24Xdc1JJvpcRiOuzKIrppgpT
         OTtg==
X-Forwarded-Encrypted: i=1; AKwUvBwBEmDCj4vjVsy3aK0WrGxSS+7ZBCwIdI9AQjjmi/xT8Ej9lQKelF3lyIQcjEJT6mG+dW64foI1JQd0Ypk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YHPLq0r2KuuLwdDK4snWVSKD+PsD2dVGDP+999YnFmDaNlXsT
	DfJPvVupKkOTBs6VFQgGzHRE5RJpbGtRYn8Heq+tDTi2V2BsEI68K4URprGdT3HFNcxTFkq6awy
	UfwbJPY+FZv3tkh0MmtrH3NY423U+hd4=
X-Gm-Gg: AYBFou0hWW0p+U86fHWr2uXKMhCj3jSX/4C/sqD0hUNaIspORPEOGgGAskG9sI3wA71
	LSOY9IBxawwE+DA1wC5JMhzO/nAJbqoYetVjbmkj2Sly8jV5mQQY8Eofevlq4+vQeEn1V86iwWU
	aj+P+yhlQrHJ841Zhjj0trk5IwquAUD/OH4/95Q7sgj8+C2+elD+n78UrpAizXsFM7tfMalocZZ
	yT6pNZG7++iyKTDqh2cwo6//bW1eEdaL8bT9Z9IOaXbJm87MUxiXgoxUAtwr/0Jwi8qUJgiqKJ/
	rk2cDdgBKxthl992Ce2ns9N99IjzavLZCjQ5zPUOifgA+uyPp8moWKzd7ZbrjuJc/VD36dtY/1D
	6LgNNUsWSapAqOsF1k5BMWObt08qxMJMFx0w9U4MUe7fam9qnciOU2P+K5Q704i+vh4Wkqv0=
X-Received: by 2002:a05:6808:1513:b0:53c:4502:971d with SMTP id
 5614622812f47-567be6c8a4dmr544823b6e.36.1793833412958; Wed, 04 Nov 2026
 15:03:32 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 18:03:32 -0500
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 18:03:32 -0500
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 18:03:32 -0500
X-Gm-Features: AclHuK-E5HhSsymovm6gqqi0LHwYAX2YAQzu1NYpLgCPDxd0d2GuBDjgyNjYCSk
Message-ID: <CADZg-m3Mnk_QJ44HrH4SkCm+pN5QteeQv8zY9Q7EE7RQv65O8A@mail.gmail.com>
Subject: [PATCH 1/2] devres: add managed timer shutdown helper
To: Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Provide a devres action for initialized timers. The action calls
timer_shutdown_sync(), draining the callback and rejecting later rearming
before device-managed storage is released.

Use devm_add_action_or_reset() so a failed action registration shuts the
timer down immediately.

Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
---
 include/linux/devm-helpers.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
index 708ca9131..ffe8b68b7 100644
--- a/include/linux/devm-helpers.h
+++ b/include/linux/devm-helpers.h
@@ -24,8 +24,33 @@
  */

 #include <linux/device.h>
+#include <linux/timer.h>
 #include <linux/workqueue.h>

+static inline void devm_timer_shutdown(void *res)
+{
+	timer_shutdown_sync(res);
+}
+
+/**
+ * devm_timer_autoshutdown - Shut down an initialized timer on resource release
+ * @dev: Device whose lifetime the timer is bound to
+ * @timer: Initialized timer to shut down
+ *
+ * Register a timer_shutdown_sync() action. Register this action before
+ * arming the timer, and after resources that its callback may access.
+ * The timer is shut down immediately if action registration fails.
+ *
+ * The callback's resources must remain live until shutdown completes. Any
+ * independent user of the timer must stop before the timer's storage is
+ * released. Devres actions run in reverse registration order.
+ */
+static inline int devm_timer_autoshutdown(struct device *dev,
+					  struct timer_list *timer)
+{
+	return devm_add_action_or_reset(dev, devm_timer_shutdown, timer);
+}
+
 static inline void devm_delayed_work_drop(void *res)
 {
 	cancel_delayed_work_sync(res);
