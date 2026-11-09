Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233503;
	b=aBQiTgXX+O+qOOpkCbJM147xVeAn1OoRBujCc890kNMa7y6DPoncx6JcyD3rl7Hgpvf8
	 Gispklcf60ZhgB26RE5b/iuZ5BxcQD6mlcVZuKRgSmKMtVvAC90dJFc0w4RMxe3pyhyd5
	 8D3daFn1MKxlUo7v1z6iNiPveJHdrGIrn2g04pEZLkUbfgTwxhOi7yQjmRVznR3BEwV2p
	 XKY6r7RxPfKhgL4Gy9hzKyk6Enxl7+lTGo9Hnhk2qkGcgWbo/FaRmeUTVQE1WPK5YKaDY
	 joX9VTfa7djAqCaqaA9svOQCEhXYNGdkCkF8XXt1J3S3W5GhpQh5rDBZ3iy/vAssNAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OZAb6lnBWKXnQecNrOS09cug5s14VwaaeGt2z/u1g1w=;
	b=I1aciKVDm9nbZ5RYmfeEBc4Gyx7eoaTewTvhnFiObv6z5lxN7JqL1nhnXZF++X0xyY3J
	 d6JwdesE/Jv6e1Yusqvmjlvb/3ZYMUq65H12f2rwbT7Iv8nViaSs8tbdv/ZhLGHAojjPw
	 Dje445gWk0FN8d0QC1qFCo6pYkkq2i51XcaC2tS5x0rcsVlLMX55qBQsXKcfZFvxjBYZv
	 9vkxSuVxu6m7JakPGezabcdcbCLGo7tJLEfgNBZmT172CBJMitw27lQCY7uWDMJNzEAWC
	 NyZgEW0aIoB7WPX0t9tCT+KmC76/igwvnQCWqj534KC+oOviDlTKz2Ewz2jFHvXu6lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpY5AHzR;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C375606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C375606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpY5AHzR
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1782253eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794233503; x=1794838303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZAb6lnBWKXnQecNrOS09cug5s14VwaaeGt2z/u1g1w=;
        b=RpY5AHzRxwJ+7kg2LOASUK53qzNOCbDaOc+YyJElnpVvPXtu2C4IIuwgjeWaOEjV8e
         mDOKck7Q0x8Dw7Hmfqw7XARxIKeGyU/dnG6DgEfZ5tlVZ0HymvJxCGUdoZxnz/Gi/nQc
         LlQRNHIljkjNCwQIVVvtpLoFY6zPA7tIYKUPGMFnOIw95DsYmi0Bxubd3kKIom97MX7D
         i8iqS+ass2MijyM3i0nDZz1snvV2V/5UjSTUfVC96yLb1LsokkS6ckoVL9jG9m17dH4/
         dmLJeMjBT8T0TO63NYF5Bpg4kyC0fehPpTZWolz3u2fQsyD4cjo9n+TAJveXQegS7/4w
         FzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233503; x=1794838303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZAb6lnBWKXnQecNrOS09cug5s14VwaaeGt2z/u1g1w=;
        b=syCkBZyUk4erGQtCRpQhXVOk94HNzxBkf4GXYloYkwifAZSQoBfWwuCTp6x1iSjE4T
         wwYZug4Cx3/QYQT74lsRWG72ZEKEw6UKDRQ+dc8QjPJ/cWJLNzrsqFkXmk1pnejr1A//
         pdCV/O0GT0SLyZntcj2aA9sIhyKTDO9o5kRxSEElLvCdYppTSShrpqZyH6v3z4NryR6c
         qSkuvayR5eXnrertqD6NsVPBtVir8MvIExHRpmWImCDLRJdTs8z5B8KyuSH3uHqvWgiY
         CoZLUPjJhaHSiuViNZIApDHfIi18MyZCBXyrRgxI3qTOYIKIpqE7m3nJwG21wQy/lBhI
         x9GA==
X-Forwarded-Encrypted: i=1; AL+hErGLcSSl3rLIFokVzvIM3SBNGnh+HDToV4DsFPpO1tPR2PbyCg89OAZq89m4q3j3zO863kA7aWS9cWWykn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z98Io6gBufqF4pQKlharSEXaAtclG7lp6JatYcZgazWvuz1GMi4
	oSChAfg0xZhq+YRcEPRtzNhKTq/FtJPYCjHa5nYZG59OeoV/fKaJcGft
X-Gm-Gg: AYBFou2FGCuG5KbrW1P8zezgjCLW+kIaIXHGSpyyVIpXr/K67RRPZUpl8af03AL44d/
	mJKn4D7o7of7WJdbqdMZDANhAKfK46Kan3d7n+3iOaGKOR+iHeI7x8LIRHxx9egTVzxi/aib4KO
	Jeyg3w5w2Cf6M+XY4pGXGSBfzRMyeqWfO2Qj7itdpwIJ4JFpBy48jb+hoKErkfpmFYjMsq2vPTu
	RhPVeluvEehZHgcj2a/gFRtcWvcRY4UhngILn2Os/LWVbZzBTKWW6BuUncil/3Bigf5DAL54FIT
	s69KD9hIw2HUPYtsdArQ3ABpLCn4gcucmcKJFCFlAL9NUyxqZELx36X/aFu2x9ZnY0tdyAgs7wM
	LYQCpBTCd10Pprs930roal/TpeiSPuGRBrJKWBsev+ZMhbF+XoacRRiBZ/df++PFYFoNu3fiBOv
	Z5MIs4/TUrTAnO0WKETmQp4frJn3DKuFTeyy2AawZBiLd64V0XlAlceJ7dr0sUTvfEEyfNNapNw
	wMTGSbkQgZVqmp/A44UYsrR7m764LmYt0crLPYkAG7gM40IfC+9gTUcABw5oRuj9C0kYdQw9w5o
	KeWg+Wrpc3zQWYsFPGtVyRSuID2FoaJI7Jnnh93K+Ru0PLBKPbWmdidYuK1ZjEddOEmhUphbN15
	YItn50nBI92943tA/18EEuptXxbrb/u4r
X-Received: by 2002:a05:7300:de4b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37256bf17d9mr7672054eec.25.1794233502484;
        Mon, 09 Nov 2026 06:11:42 -0800 (PST)
Received: from localhost.localdomain ([103.71.17.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm12727082eec.10.2026.11.09.06.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:11:42 -0800 (PST)
From: Varun Singh <varun.singh10011@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bigeasy@linutronix.de,
	syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com,
	Varun Singh <varun.singh10011@gmail.com>
Subject: [PATCH v3 1/2] usb: gadget: u_serial: serialise line setup against line teardown
Date: Mon,  9 Nov 2026 19:41:09 +0530
Message-Id: <20261109141110.3538-2-varun.singh10011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109141110.3538-1-varun.singh10011@gmail.com>
References: <20261109141110.3538-1-varun.singh10011@gmail.com>
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

Creating a u_serial gadget function can fail with -EEXIST for no reason:

  sysfs: cannot create duplicate filename '/devices/virtual/tty/ttyGS0'
  gserial_alloc_line_no_console: failed to register tty for port 0, err -17

ports[n].lock protects the ports[n].port slot, but the line's tty device
is registered and unregistered outside it, so the two can change
independently:

  gserial_alloc_line_no_console()        gserial_free_line()
    gs_port_alloc()
      mutex_lock(ports[n].lock)
                                           mutex_lock(ports[n].lock)
                                           ports[n].port = NULL
                                           mutex_unlock(ports[n].lock)
      ports[n].port = new
      mutex_unlock(ports[n].lock)
    tty_port_register_device(n)            <- device for n still there
                                           tty_unregister_device(n)

The allocator claims a slot whose old device is still registered, which
is the -EEXIST above. The reverse order leaves a slot with no device
node.

Hold ports[n].lock across slot assignment and device registration, and
across slot clearing and unregistration, so a concurrent caller sees
either both or neither. gs_port_alloc() is now called with the lock
held. Neither tty_port_register_device() nor tty_unregister_device()
takes tty_lock or ports[n].lock, and gserial_free_line() already slept
under this mutex, so this adds no new lock dependency.

With two gadgets racing for line 0, 25 of 383 function creations failed
on an unpatched kernel; 0 of 530 with this patch.

Found with the assistance of Claude Opus 5.

Signed-off-by: Varun Singh <varun.singh10011@gmail.com>
---
 drivers/usb/gadget/function/u_serial.c | 54 ++++++++++++++------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..e172050f1392 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1203,23 +1203,18 @@ static void gs_console_exit(struct gs_port *port)
 
 #endif
 
+/* Caller must hold ports[port_num].lock. */
 static int
 gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 {
 	struct gs_port	*port;
-	int		ret = 0;
 
-	mutex_lock(&ports[port_num].lock);
-	if (ports[port_num].port) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (ports[port_num].port)
+		return -EBUSY;
 
 	port = kzalloc_obj(struct gs_port);
-	if (port == NULL) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!port)
+		return -ENOMEM;
 
 	tty_port_init(&port->port);
 	spin_lock_init(&port->port_lock);
@@ -1236,9 +1231,8 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	port->port_line_coding = *coding;
 
 	ports[port_num].port = port;
-out:
-	mutex_unlock(&ports[port_num].lock);
-	return ret;
+
+	return 0;
 }
 
 static int gs_closed(struct gs_port *port)
@@ -1267,17 +1261,23 @@ void gserial_free_line(unsigned char port_num)
 	struct gs_port	*port;
 
 	mutex_lock(&ports[port_num].lock);
-	if (!ports[port_num].port) {
+	port = ports[port_num].port;
+	if (!port) {
 		mutex_unlock(&ports[port_num].lock);
 		return;
 	}
-	port = ports[port_num].port;
 	gs_console_exit(port);
 	ports[port_num].port = NULL;
+
+	/*
+	 * Unregister under the lock, so the device cannot outlive its slot:
+	 * otherwise a concurrent gserial_alloc_line() could claim the line
+	 * and register a device that this unregister would tear down.
+	 */
+	tty_unregister_device(gs_tty_driver, port_num);
 	mutex_unlock(&ports[port_num].lock);
 
 	gserial_free_port(port);
-	tty_unregister_device(gs_tty_driver, port_num);
 }
 EXPORT_SYMBOL_GPL(gserial_free_line);
 
@@ -1294,13 +1294,18 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
 	coding.bParityType = USB_CDC_NO_PARITY;
 	coding.bDataBits = USB_CDC_1_STOP_BITS;
 
+	/*
+	 * Hold the line's lock across both, so a concurrent
+	 * gserial_free_line() sees the slot and the device together.
+	 */
 	for (port_num = 0; port_num < MAX_U_SERIAL_PORTS; port_num++) {
+		mutex_lock(&ports[port_num].lock);
 		ret = gs_port_alloc(port_num, &coding);
-		if (ret == -EBUSY)
-			continue;
-		if (ret)
+		if (!ret)
+			break;
+		mutex_unlock(&ports[port_num].lock);
+		if (ret != -EBUSY)
 			return ret;
-		break;
 	}
 	if (ret)
 		return ret;
@@ -1315,15 +1320,16 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
 				__func__, port_num, PTR_ERR(tty_dev));
 
 		ret = PTR_ERR(tty_dev);
-		mutex_lock(&ports[port_num].lock);
 		ports[port_num].port = NULL;
 		mutex_unlock(&ports[port_num].lock);
 		gserial_free_port(port);
-		goto err;
+		return ret;
 	}
+	mutex_unlock(&ports[port_num].lock);
+
 	*line_num = port_num;
-err:
-	return ret;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(gserial_alloc_line_no_console);
 
-- 
2.34.1

