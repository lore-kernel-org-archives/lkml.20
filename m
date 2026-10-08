Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91F73B2FCA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480142; cv=none; b=G8RrFi2KFp6kHkWVmWb2ZJ4cmVC85C33tIyzlOwyK0LU5jNYzt+Tp1SlU0/hNDFNoOPcVaGftefkA9Ok/uVDk7Xy0EWCTUKbyPiU/Ba/zAVIynW85jx2LSPsbqnYzohcO3ZKAVZBo6ruOd5Pc6ooDabiCZhAfqwOaaXXfMRIjh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480142; c=relaxed/simple;
	bh=HotJ/XzsCrodtQ2bbgDaQ9bwihLrz48HD6flurlhPq4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dhINsqLjJlhJz9OZe0cWqBUwrNP6S2QFK2dDXdIs9xDpFBuebFPWpoaSNhSewq/wpgxVdXK92U4x3/YB4a9bQgpJz6yI7nfKhB7LmjNXPBmTyAdcOK/FT4crYfDz+rKH4/QiJPAEYXxSbWm2cxOu5SFTki+xY1tlswYJA9/uQuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--scollyer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KziQJVbm; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--scollyer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KziQJVbm"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso10536420eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791480139; x=1792084939; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4k06tcFvRAnhumMOE48bxU4Vs2OeJgI9mhm6gdcYrE=;
        b=KziQJVbm3aQZw6cmOVbWCLXL9wEFXm0uDuHWD2OA21EHAVgimj0ItFQsLOv4MbM/qO
         V60aQgaWSR8CQEZ7VHJ1KS3rubdUnER7gniHVVbw+XvrfTw0oqWViLN8jKO+pOdDj2BQ
         1kZ2NJlIouxkGBT655aJT21sBIBPNLyFz/E1gROv0mSNzbBDaXhv9o4JG9YWz2sR1Onm
         40Zzl1IBg/w8ID4HiMUkfRhPaSeimr30f314uMmA44wcntObuy5wE1o54swZeHrmtAgc
         pT7VCW93OqUBbY9iUqvxwHHfsk3TkDfGzwGtuL0MCuyPD9tbjZyV6D5aYvSwEH6q11CT
         KWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480139; x=1792084939;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4k06tcFvRAnhumMOE48bxU4Vs2OeJgI9mhm6gdcYrE=;
        b=NP+m0ExeB5fQ4miyl3Y3uxdlH13vofbbxihjpeR2h2mL5NKku53p3W0P2ZnqVjWVaU
         MXf3JZAc6+eNtyrMI43TP3uTsOlSWglvIO8o4a/KqUDRbR9bU8ucReES6701RIS3P1QT
         U6OYtgbecvf1hR5WgDR7C7t3GEaoQZbmwiE1q76F8gTkbzs7yKK6lRuy9xyYe6dNC9pQ
         9HHdm39pHjuC0k3GwuANrXPxivOb1Q+OC0emG89bsbxzs2ygBIpSsSVLXx47mgD2naJE
         lRmkpCupiRpmG1hvPSmQejOX29OM6vFe5D8/3xEohv4LFqx2CDvvPjM1IwGpOo/L7coj
         erSA==
X-Forwarded-Encrypted: i=1; AKwUvBz/p6Vu/aGfgeVBCtbKPA96jqRho+Nt5cWVwhiTbQiQZCfi3ptk96jDBKNi1PB43QI3FCnx5iSqsuQMkFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLkx11+Hn1C4cCL8KHI2gwIM2+wBHbfe3JFUIfon2uSG9vy7Re
	WBHq34RcJgj8jqI/FknVTfn8g3GRV90AP4q0kkzDnCBmOteJmEpvSOd4nB7B5SzRGpd5jEx25dx
	1+yUylKGftCTydQ==
X-Received: from dybmd2.prod.google.com ([2002:a05:7301:1802:b0:353:592a:df6f])
 (user=scollyer job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:fd18:b0:351:1ff2:d013 with SMTP id 5a478bee46e88-3515de6b0f6mr6718940eec.37.1791480138489;
 Thu, 08 Oct 2026 10:22:18 -0700 (PDT)
Date: Thu,  8 Oct 2026 10:22:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261008172208.1139281-1-scollyer@google.com>
Subject: [PATCH] platform/chrome: cros_ec: trigger kernel_restart on EC_HOST_EVENT_PANIC
From: Scott Collyer <scollyer@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Scott Collyer <scollyer@google.com>
Content-Type: text/plain; charset="UTF-8"

When an attached EC or ISH device reports an EC_HOST_EVENT_PANIC host
event, the EC/ISH subsystem has encountered a fatal exception.

Handle the EC_HOST_EVENT_PANIC event by:
1. Logging an emergency message (dev_emerg) with the device name.
2. Calling the panic notifier chain (panic_notifier).
3. Emitting a uevent (ERROR=PANIC) to userspace.
4. Triggering kernel_restart("CrOS EC Panic") to cleanly restart the AP
   so that panic logs are preserved and collected by crash reporting
   services across reboot.

Signed-off-by: Scott Collyer <scollyer@google.com>
---
 drivers/platform/chrome/cros_ec.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 1da79e3d215b..cee7018a2d7d 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -11,11 +11,13 @@
 
 #include <linux/cleanup.h>
 #include <linux/interrupt.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
+#include <linux/reboot.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
 
@@ -109,8 +111,10 @@ static irqreturn_t cros_ec_irq_handler(int irq, void *data)
  */
 static bool cros_ec_handle_event(struct cros_ec_device *ec_dev)
 {
+	static const char * const panic_env[] = { "ERROR=PANIC", NULL };
 	bool wake_event;
 	bool ec_has_more_events;
+	u32 host_event;
 	int ret;
 
 	ret = cros_ec_get_next_event(ec_dev, &wake_event, &ec_has_more_events);
@@ -123,9 +127,21 @@ static bool cros_ec_handle_event(struct cros_ec_device *ec_dev)
 	if (wake_event && device_may_wakeup(ec_dev->dev))
 		pm_wakeup_event(ec_dev->dev, 0);
 
-	if (ret > 0)
+	if (ret > 0) {
+		if (ec_dev->event_data.event_type == EC_MKBP_EVENT_HOST_EVENT) {
+			host_event = cros_ec_get_host_event(ec_dev);
+			if (host_event & EC_HOST_EVENT_MASK(EC_HOST_EVENT_PANIC)) {
+				dev_emerg(ec_dev->dev, "CrOS EC Panic Reported (%s). Reboot is imminent!\n",
+					  dev_name(ec_dev->dev));
+				blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+				kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE,
+						   (char **)panic_env);
+				kernel_restart("CrOS EC Panic");
+			}
+		}
 		blocking_notifier_call_chain(&ec_dev->event_notifier,
 					     0, ec_dev);
+	}
 
 	return ec_has_more_events;
 }
-- 
2.56.0.385.gd3acb90ef8-goog

