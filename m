Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841275;
	b=g7rNEFdG0QGV0Ci5IiXlKAf7wBnjmMGwIPjwvAaMlTyrZ6jZPMQ20hos38bCL12j/xCV
	 slVHFRfgvR8ftWIokPcaMMZDuPTotmDCmDnEFi9E+s3cmOix8ERqE/gUIo7GUasJIgmOs
	 1mw1gKYFys/R+SQS/IwJN4Rh2NwFuBlx0nEWMWGKaJFHFEh3VEMjzyf0VW8HmIFoV7CzC
	 L56ihJJSAfPxoz+geClUaHtAb0kv+UkaLEwFslOsipB6Xg8hyeQpp1Xo7KflgNnBfRK2A
	 ++V+XDOCn2V/yohF2RroaxSnzjrMlk++vI+x9Br/dyUjGgHwkHA8NEsYBw1HaByYd1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JM1zD3i7LF4wBwdktOmYzhj34P8A1bSegjMOIVKdeWY=;
	b=JVbYAot0caxC9TAY3ZCMTxBCWLDyspCMUWdaCu2aPnsGiUICbPtcFF6zA8vnrg9bbWZI
	 YrQkbHiyeoXZG4rgMMZoiKCWOWK1kAM4HaMwGgp6/CiO6aj/UGSanyuYLe59wtXQAhhhG
	 ARl0WF+bgHE5R6t3nW338LhiRfw2LYMBdMhecimyOCOlmJsl/xsfs9odbjqRuvrhIq65Z
	 lnQsNg4pOI5GFqQWf1CyxvVFODxryPPVvkW8mb2igqsFqVJK+ZHOS3uuL4gmnfyqHrMSr
	 AC/a/1ZurPbx6NJqOdvr9x0Z2EESruLuhVAK1QMO4o+xuvR5oLwgixBV76a3STeQvbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0tBilb/g";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1472606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1472606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0tBilb/g
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20184805e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841272; x=1795446072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JM1zD3i7LF4wBwdktOmYzhj34P8A1bSegjMOIVKdeWY=;
        b=0tBilb/grq0KTWcpgfvZHJEhJHJDZoVB1ZNl6nBMtRzNU9Grh7NXlCcydHsYpJnJgk
         NZ+yisV+ynLlIpvV3XwCmgWkRzI2tqeBaEiNchMgspDWjNESnlqJXrCMLvEMu+LtrM6G
         kMKqO/HJKMBK6e04G2pz8bnRCS/eMrGM4KcGY7u91W9t8GJD5v42D41fYX6Wejj+IGbQ
         nlL7cvjx5ZyJ2Hn2U3MMfOu6/QAFUC6A2iidq7Ha+eskKX5qkDmA9nV5JtipCK7x1otC
         2uD6PLCuXcC3F7Ip/OI4jWmdIYIgMl5AMWLVWHJXbidriX6Y5sR4LUzpaNJZjpU1u6Yl
         h2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841272; x=1795446072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JM1zD3i7LF4wBwdktOmYzhj34P8A1bSegjMOIVKdeWY=;
        b=WX+lodOkp+Faina4OTJvVnGGS+1rZvQa07LE59/hzcY1qz0t4kY/6ArYrgEakgOtpe
         m0paKq1kx6YYSqppcJI/zuz32CCrYCAFKgomu8SuNymKws+1GjkSgVzjp9Aj9tR4Z57m
         nvN3THhe3R21MJ1rgKL2l2/gF+sY8YD0wQD8tPH9y3jC6/QhXqWR1QmK8is8D6gZp3Uz
         QmaKbNG6jw7ZtWMBIzTzQsgpsbzQ0stDA4CHlBZfL9VLURVVK0kpA3bAM6oQlezmdHQf
         7AKtUEDxtD2UBnPz/VQjBEmsH8C4iVHd+m3GtyqhnP+sgscJpQtCnYWvzzRKb8XL9sNw
         qLYg==
X-Forwarded-Encrypted: i=1; AL+hErEMronXibSiMMDY7ZHdWJhBj/uejBSlISBczBllRfFir+Ghxq9y48QCobJnSU/iSBZSWIpBFJU37RKs+V8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V2Y+buR3nAZDBg1CJuyUQCfC/+b4hYMLU289W/aGWi6cTOWbG
	FqpmLQbJpjUsc+upprLDalGvdsUU6qyTHccBYmidk+S35PxZeJwpvOjj
X-Gm-Gg: AYBFou2R4f1nJs73c2x9eN7uzRuwhj+axTIBMLxKIirQ2VxkJcXhEenvZ/1kGdAv4JT
	IrFbqfKuaejzfiy9mYPK1vYRH6uzQ8QSnPJDTzNOpmz3QNpN9YHFnW0hiMqQa/e8hBW7LVcKelJ
	9vGdTKS9kXsGBvQViqru8ZvRgo0VT4CGFZv2UMUlqCs3OM8uuIxKJGlak5bLbnCMQYb5lThX6XH
	7X36ZLPa8c3uoFo+ihwRUic2oDzCzWtYvNuWCFDSiXPX5R/4BqSuRQGX52pbXGD589sSe35Cjn2
	xi/HI0ldH7HlQyG3GINt3plZxxOzeD+7ZVhJ9Id+Aa4LnAUb+5Ne1ISDnj3z77I/Isae8xKbIG3
	F15MuA68nPht8rUal54GL/i2u1i8FFfJTR7OgPsvFLykD4U19UjjpPGakCQmssDGAwOu9m0+hxu
	eMQ2Vf0Q5OVY4xqTkoGHTjLXmtXfPhEGRmPyl3tc9avfKeEDrxtonmuLB0grtuzo3WMwadZ4Lwz
	ecGP0lXCTodjDb3rTMscAQ0ld+aOsZHszx0pV4DYRVwgvLKB5zEU+Ddi1RIWPOoTgPiL3AgQJPF
	MX8uTG5Wzc7tvAzWK9/XO34DafrlzxT/8hk=
X-Received: by 2002:a05:600c:6989:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb68233edamr150358065e9.20.1794841270609;
        Mon, 16 Nov 2026 07:01:10 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm22912555f8f.23.2026.11.16.07.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:01:10 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>,
	Krystian Kaniewski <krystianmkaniewski@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v3] usb: gadget: u_serial: implement flush_buffer
Date: Mon, 16 Nov 2026 16:01:09 +0100
Message-ID: <20261116150109.1474880-1-mehmet.fide@gmail.com>
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
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

gs_close() waits up to GS_CLOSE_TIMEOUT (15 s) for the write buffer
to drain while the gadget is connected. When the host does not read
the port, for example because no application on the host has it open,
the last close blocks for the full timeout. tcflush(TCOFLUSH) cannot
avoid that: u_serial has no flush_buffer operation, so the request is
a no-op.

Implement flush_buffer: discard the buffered output under the port
lock and wake up the close and write waiters. As on other tty drivers,
a hangup and an interrupt character (ISIG without NOFLSH) now discard
the pending output as well.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    This applies on top of Krystian Kaniewski's "usb: gadget: u_serial: pin
    ports while TTYs are installed" in usb-linus, which keeps the port until
    the tty is released. A flush from a hangup needs that.
    
    Tested on a Colibri VF50: with output pending and no reader on the
    host, close() after tcflush(TCOFLUSH) returns at once instead of after
    15 s.
    
    v3:
    - Patch 1/2 of v2 dropped, Krystian's patch replaces it.
    
    v2: https://lore.kernel.org/linux-usb/20261019085855.3259716-1-mehmet.fide@gmail.com/
    - Sent after a patch that keeps the port until the tty is released:
      a flush from a hangup could use a freed port (Sashiko on v1).

 drivers/usb/gadget/function/u_serial.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 0a304f508bc3..ff912c29d6be 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -891,6 +891,19 @@ static void gs_flush_chars(struct tty_struct *tty)
 	spin_unlock_irqrestore(&port->port_lock, flags);
 }
 
+static void gs_flush_buffer(struct tty_struct *tty)
+{
+	struct gs_port	*port = tty->driver_data;
+	unsigned long	flags;
+
+	spin_lock_irqsave(&port->port_lock, flags);
+	kfifo_reset(&port->port_write_buf);
+	spin_unlock_irqrestore(&port->port_lock, flags);
+
+	wake_up_interruptible(&port->drain_wait);
+	tty_wakeup(tty);
+}
+
 static unsigned int gs_write_room(struct tty_struct *tty)
 {
 	struct gs_port	*port = tty->driver_data;
@@ -985,6 +998,7 @@ static const struct tty_operations gs_tty_ops = {
 	.write =		gs_write,
 	.put_char =		gs_put_char,
 	.flush_chars =		gs_flush_chars,
+	.flush_buffer =		gs_flush_buffer,
 	.write_room =		gs_write_room,
 	.chars_in_buffer =	gs_chars_in_buffer,
 	.unthrottle =		gs_unthrottle,

base-commit: 3149e8b3237f58d4dd440fc64c45c93404c4b064
-- 
2.56.0

