Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421448;
	b=RChfFmIwzLeHowCjEU37tnFYYFju56nI1iTsRNVTlB4RIHR8wTfEsu7wr0GAVZvH5jS+
	 hlyuzHKw5ADSKgDtAo/U3ch0hK0gtgQND95qFVePR6WY6Fb4VGr2j4CUVArJy+ux1+CUZ
	 V7tYJe8AaZmgujX4l63Qygx/M3rH+kQfEkU172Vuthp4yGS+O9EeIQxqpEGblBm5YoFfJ
	 TtC7ZWDmx5CTl4iWJzbDPAX1VR+r00Ne9hq2hdqRw/+khRR2eTxBTgyDT3esvKJNjP4WL
	 BSm0H74HwCHUyDCk1/lf5GuePrPbkxo7Ru08TsrikszKUeg68Va1CD7wgZEVpc0U4/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=347Pp69Py5INxphdKhJwVesDtm7rdLRoZQ/uEcxqqXo=;
	b=ojLwkGBpvnStbMB3w+sVfFDDKIiJ+Ti55c/VCgdOFukRvzllriwBFPNrHc6U7QWzj/ZX
	 j8ABBP0I1L0V71OsbZ80Ah55QcEHdXO43ptkWQM3avi5/9I1B6Vrp5PioRhIhYqyYI6hJ
	 LFAifrDoUrTiX2Z1M7Guxqiil3Zcsx8mNzS01uyxqiTucGzr/rLTTkjMom8TBuGa9ymXt
	 cmsKiGdVBjTnnQ0E5Q0WwzbPsCEWtiB5vakuDbER0x7RCj5MTY+axm3MHZsOYOP/H21Ir
	 /772NZHjAPAD9rSkXk41tcc9g1Kz/1cfP/rIc8u6rEaDChuZKg+AHFsSLOq3qfFSq1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywjFjTF7;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A44606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A44606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywjFjTF7
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490d59c3edaso84130f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421447; x=1795026247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=347Pp69Py5INxphdKhJwVesDtm7rdLRoZQ/uEcxqqXo=;
        b=ywjFjTF7KJojzcFV2ERmugH01cQKBu6rEDebqB0gujq0EqmaoB+gf1EBErttspZ6/w
         w1seQJppzkB6/9GkpJH6ImtGLTWwLxXoOx+Qqe0dVLaX60YNzMGyRFqxhU/WTwmv284F
         dAGGG0nU7NEum/1LDJdzoo/DdF2j1thTWxdRSUR/usl0qGwEkyFVmuTrEalyezoI7QHN
         8oN2cjBWEoJ2vlZhHAkC1IYuPUOAERXgL7FtctjOMIHnQONpsWIeXDSYPbbKJ2JR7u0l
         cOO5qPxfLgYRusNkKxf3eSJL63qNhdYesPtZ5ryRwWJFOLWcw2dBfqjKN/6Pt7o98V2Q
         92Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421447; x=1795026247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=347Pp69Py5INxphdKhJwVesDtm7rdLRoZQ/uEcxqqXo=;
        b=qwb1pFNneoyK7Y0soWuXS+2qzXcfVygSM+sYlGGA4pw9KKskLtPvDqR64+nTFDu+yK
         X11NkdwdLXGwWlqVq///7AvWIHl3a3X8qVu70scdpPvQR9pqiT6WI4TfsI5jBBG9EABI
         dRguDp2hf85V9N81VAubnu3Vz7v4hablkic7rXc1417tmS90NPMCF/RLlqPdhfMzK+A+
         JId6C/i07JVg47Yz7mftoHOnCpyereW+USfkwGcFVq7eT++302U7IBxXXCO/sYg6krno
         PbpUGjry6AY0ISueAFM9kZjgEVuz23De3LwpCSzbA5aSoKwFYb9bKJ3GwnAKQ6mkObnI
         uYMQ==
X-Forwarded-Encrypted: i=1; AL+hErFvP38xOf5mvivMVNjlPtmvmLTnx1kXXi0kIvYZhR6ucx3y8reer7sfUgpes4FVfmcMh7HptYT5F8MsDkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h4i78gCc72CFZIaHdft7gQ99Qx6FadVtyKkD7QeAztQRiLdQx
	AqiQe46oek6ZqSWRNQTyV2Oc16EmY4PiLzYGsfgAMF3np8zVzDMDt/A0
X-Gm-Gg: AYBFou1458hyaoJWN6642GFLp6HZuIpZqp5EYZVidDAuKwKe4mgiXEd5cC/047ixbI+
	eM4QdnBtqCJ7pwBidjlS3ekHsKp1HR10EInjri27BHiB+Rc407hGnP720v7CGSOTLGoLFEJgy+l
	mPZmUoc6P+zxAN6GUYhvG0SrR1uOIClEOCwGEkY3HeQWIHxAvvaj24nly6cfOB/8H2QyXz0b8wC
	nF71o3qHwnMnVHRreaJbPaZJVXIyzHc5QwKgJrS5HfKEMUWTLWV9s2SOmN2V0S+b/8fRRpFK9pK
	+MBkdNACcmN8ZrCGox15WrZ+WrD5GK1Q6KYsJeg53CFfacECzBwSIK+uKwwqK/sDJCq9ZuUDQL5
	cttna0zRbjhAzBJp4jXnXZYMEKRQPZZxsVEGHdo22Y6oILBp4cgr+BIddwI1w6KXWK2G15HL4Qk
	/s1U9dy5pd44hED0Q47KSRYofNAkyTcPH8vZCDId3UO7DizymazyW5C+QB+ZAzgd1FQKojOKvrt
	74LRKOg+keTBrqMCKrMVacy8YPFRXxOPaCXTZM0ok7jifNpumOHwqdh0NYyMWYECB33QKoRh3dk
	oDXVwJriP3GtTlbuFBFPjUdOQrknEtjP+99MIGey1xfIAVJ0Xg6yHa+4qico
X-Received: by 2002:a05:6000:27d3:b0:492:aff5:da60 with SMTP id ffacd0b85a97d-49b01cf341fmr341199f8f.13.1794421446431;
        Wed, 11 Nov 2026 10:24:06 -0800 (PST)
Received: from AVIV-PC (89-139-9-231.bb.netvision.net.il. [89.139.9.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm12564099f8f.10.2026.11.11.10.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:24:05 -0800 (PST)
From: Aviv Levinson <levinson.aviv@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aviv Levinson <levinson.aviv@gmail.com>
Subject: [PATCH] staging: greybus: uart: replace IDR with XArray
Date: Wed, 11 Nov 2026 20:23:30 +0200
Message-ID: <20261111182330.77824-1-levinson.aviv@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Migrate the minor number allocation from the legacy IDR API to the
modern XArray API to take advantage of its built-in thread safety.

As part of this migration, the global `table_lock` mutex has been
removed. Mutating operations now rely on XArray's internal spinlocks,
and the lookup logic in get_gb_by_minor() has been updated to use
rcu_read_lock() combined with kref_get_unless_zero() to safely
pin the device reference without blocking.

Signed-off-by: Aviv Levinson <levinson.aviv@gmail.com>
---
 drivers/staging/greybus/uart.c | 37 ++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index e1b73db6a17c..2b1a5d4671dd 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -22,7 +22,7 @@
 #include <linux/serial.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
-#include <linux/idr.h>
+#include <linux/xarray.h>
 #include <linux/fs.h>
 #include <linux/kdev_t.h>
 #include <linux/kfifo.h>
@@ -66,8 +66,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
-static DEFINE_MUTEX(table_lock);
+static DEFINE_XARRAY_ALLOC(tty_minors);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
 {
@@ -340,31 +339,37 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 {
 	struct gb_tty *gb_tty;
 
-	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	rcu_read_lock();
+	gb_tty = xa_load(&tty_minors, minor);
+	if (gb_tty) {
+		if (!kref_get_unless_zero(&gb_tty->port.kref))
+			gb_tty = NULL;
+	}
+	rcu_read_unlock();
+
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
 			mutex_unlock(&gb_tty->mutex);
+			tty_port_put(&gb_tty->port);
 			gb_tty = NULL;
 		} else {
-			tty_port_get(&gb_tty->port);
 			mutex_unlock(&gb_tty->mutex);
 		}
 	}
-	mutex_unlock(&table_lock);
+
 	return gb_tty;
 }
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	unsigned int minor;
+	int ret;
 
-	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
-	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
+	ret = xa_alloc(&tty_minors, &minor, gb_tty, XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
+	if (ret)
+		return ret;
+	gb_tty->minor = minor;
 	return minor;
 }
 
@@ -373,9 +378,7 @@ static void release_minor(struct gb_tty *gb_tty)
 	int minor = gb_tty->minor;
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
-	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
-	mutex_unlock(&table_lock);
+	xa_erase(&tty_minors, minor);
 }
 
 static int gb_tty_install(struct tty_driver *driver, struct tty_struct *tty)
@@ -991,7 +994,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.53.0

