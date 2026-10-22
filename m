Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689377;
	b=XFezGLrvz9VYzOXg62BX1CAl3aDDiKV2Sy7F2px3XcwqdbKH1sjN18iKj3Wgicr6RAXS
	 HPuYffEl70z3Rv3Tv7z5fFG9ykuevYkmHzo78lahPl1KtxVRT6ytaQqmWKa4gkJCV8QKA
	 76CjJTPujOyn0PvA16q/ItRZhZohLjP8TeOQQ4oClEWSSGOl83Xyhtpdcbp/TdWzLfc2p
	 y4/Uwa/YvJSoAkwJ5gfNnMPriAxyJxti9GNwX+j+WaHVd3g1/xMGegE58xZIDDch4h8nY
	 xo73oa7XZrPbJ8z1i5rqAFkwmLbOLI/Myu1Sebi+iSsTZL/PHdYBY4zXrDuzpj+Vsdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=MMBG8QKSR0rhDtOWejNhaXgUwJDCAE1G7Lk1+og1YAE=;
	b=2pXYRqfzRDu/JYDuDN3VWd+B+cFJQhUdTXaJdCcscp4KwUjAyzp81BP4usiXK1Czghf5
	 wCX+XZnkhgoGlFXXtQxFupYFOMvLkESDh2bzRQ8KrHGiJcnbc0iTG/zoal+VskZUmqYp/
	 Y5e2e1DQMU33rXdq1NF5dQGfPWfRs0Nb6Wp/v2n04PViYmUOqLnjXPKNWVbmKpzFiTZwE
	 0NmZ9p7NZ/u51a0lT40Ny+RdFQ09PkkxJCRNYAoQ/a3poCk4pAjMnZcg2/ZbOC1SrvAHE
	 1DyT6jPwn42qYOFHagL+iOZYwYLgYukHVFzx4KDZTEXaz4PSv3JRZG9HNmsl9ArBGdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZbAFahrD;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01183606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01183606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZbAFahrD
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-451a49abd8aso45652fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792689376; x=1793294176; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MMBG8QKSR0rhDtOWejNhaXgUwJDCAE1G7Lk1+og1YAE=;
        b=ZbAFahrDCUfbmLIcschgp3VGFEBHdDfeNAh65p58FNTDyCjJ2NI6XbX/m6jzfRzwrU
         ZLlJlXH5cTS+21RnZbnQfRWIDIDJuda51lAWKfLX1frlpGcZPhcGzpLuIw6h250/nupg
         cvx8h3oGM+di9E8dI+lvuZ/pjIu5PMuaRrdak+BTFkuPcl/OGx9VuzjFC6lroz7k/xQa
         PCAc93OGEoqDpohaFYQfx41aEgcWQKJo8NAfBslJZ/qqluyXo2yKUGWR85mikyTE1FzD
         L2RAhqlTgjOPMqYvZRKNx19JZd0ZWvF/D8N3SmF5Rl7urnninYZZGonNpMUICOpEuqEC
         X/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689376; x=1793294176;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MMBG8QKSR0rhDtOWejNhaXgUwJDCAE1G7Lk1+og1YAE=;
        b=SULvYujDB52qf3OjvVf4i4dmvEim+lv62UBu0Ow6BmQpUBHNy8YPj1cr5BEhfHr7wE
         4PGYkFufgmUhx2wPDjFcjMW3NfodfFMnTLszKaGtt5He2UK0D0ow8XDzGFJIISU/L14I
         2KIDRVw8ZsmtVjalkSTaXWmqAcMlxkFXPv4As20nPGuI2kLqNbB6y+ukHfcX3s3GoYZv
         2j2mbhgT76LfsvtZJOByQSEM9IWhHFmIwlJUA0MPadiOeMG7FeBK83DTbsuRlpQtQcXD
         VXrW8FXb2VcysBppdk7cV3mjjt7ZHCQSPP9uXXtTf8dFfBFcx4sHR7n1LMHtE1FrWLS8
         arAQ==
X-Gm-Message-State: AFq9FYKoIBPVitu4rJsCNvHak9FEKJVjrvc4BNGLFOvSljM2AwYBqFh5
	es9hISo3Qas5p3NBGpRq2tnudON8PWw8wzNWd1c0SNOvpzYos69Aq2Eo
X-Gm-Gg: AYBFou1gYJsrTH03oVz9mzNwGK8KgYrIibo1m5jHyqwHjHiNS97NWQf3uG1w4D656jO
	r6hbVQ4ZJDOLnJJfOUonAf9Arn3mL7Y/e01PQy8PhAWVfliE1n9zUnrHFiMSsEZ6nH72G3WdEAH
	6uaN/HCHj0r54HbahLt3Y/HLYCVRnE55gHF0Be9oEKg6Vl2btKAQ7UxJYqCXE9UVOrdc0s6GqwI
	RFiy7kg9l6jKMuWx5izLHMi0p3sOjLhS7vDdmlFIR7uv+NNJQ2N4mEuxXQsmoXWD5wsGJq6MOlB
	9g7bCwvon8cPJMp/G2aY3gLeGzj7Ic4TpZNsEt9jic+rPMU0J5M/rUEsDtdQKiio3AyJu5//iKf
	x3U3ZIiqiuui26dIG/1w4pzd2tXiCciFM3+aJSSXCSJr0hbRw1xxiZW5W0iBi9k6UZpTxmG/PCl
	L9lCg11QAVeU1oW7fFsEcySEpQCjYbOY6VdQr+PZjLe00vJndJQa9CU8tTmfn2h+dZrXmhrV+Ft
	vs/caS1AMkjDSa6HFFYNsyxP8n7ZKU/+jE/ZiA90EMkaL858FMOIi0ZdKdIOE4Z91lqcKBFkGSk
	iCv7k7l7e+F7Q5PTS9qiOH29QqsT5EA6fIXyMbVhd2RcPVO3BjgmATnUJdLeQOjj8oxzaodsOJO
	wWK4cj8t2ILpMXqjiUVHdI8TPz47yjKQm7QrNwvqu/YBLh8llF/9geabaP7oLy7ZEao6B/Y5HUA
	5mQPk=
X-Received: by 2002:a05:6870:b3e8:b0:47d:f10:686f with SMTP id 586e51a60fabf-4a7dc1bdb12mr4297357fac.23.1792689375838;
        Thu, 22 Oct 2026 10:16:15 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d611b380sm4997022fac.5.2026.10.22.10.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:16:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 11:16:11 -0600
Subject: [PATCH] serial: 8250: release the transmit PM reference on
 shutdown
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-serial-8250-tx-pm-shutdown-v1-v1-1-0e894afa3bb8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw7CMAxEr1J5jUUSCWi5CmKRj0uCaFolbimqe
 ncSWHjxRjPPG2RKgTJcmw0SLSGHMRaQhwas1/FBGFxhUEKdpVAK82yGwFhn+oWtOgnkFacBs5/
 Zje+Ii0RnOtFJ56jtL1BUU6I+rL83t/ufi+dJlqu7NozOhCbpaH2NmD/HchhpZdj3L7ZQCsynA
 AAA
X-Change-ID: 20261022-submit-serial-8250-tx-pm-shutdown-v1-db9091dde8f7
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Transmit holds a runtime PM reference until the transmitter-empty path
clears THRI. A hangup can shut down the port while that reference is still
held. Shutdown clears the interrupt enables and stops DMA, leaving no TX
interrupt to release rpm_tx_active. A suppressed DMA completion cannot
release it either.

Drop the transmit reference after shutting down TX in both the generic
and OMAP shutdown paths. Their separate shutdown PM references keep the
UART accessible throughout cleanup. The exchange in the helper also
handles shutdown after the normal TX path already released its reference.

Fixes: d74d5d1b7288 ("tty: serial: 8250_core: add run time pm")
Reported-by: Raul E Rangel <rrangel@chromium.org>
Closes: https://lore.kernel.org/r/20261022152019.1621716-1-rrangel@chromium.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      | 1 +
 drivers/tty/serial/8250/8250_omap.c | 1 +
 drivers/tty/serial/8250/8250_port.c | 5 ++++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..4a7d26e2dbf0 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -190,6 +190,7 @@ void serial8250_wait_for_xmitr(struct uart_8250_port *up, int bits);
 
 void serial8250_rpm_get(struct uart_8250_port *p);
 void serial8250_rpm_put(struct uart_8250_port *p);
+void serial8250_rpm_put_tx(struct uart_8250_port *p);
 DEFINE_GUARD(serial8250_rpm, struct uart_8250_port *,
 	     serial8250_rpm_get(_T), serial8250_rpm_put(_T));
 
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 29a203ed93fd..bb6c312c8cdf 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -795,6 +795,7 @@ static void omap_8250_shutdown(struct uart_port *port)
 	if (up->lcr & UART_LCR_SBC)
 		serial_out(up, UART_LCR, up->lcr & ~UART_LCR_SBC);
 	serial_out(up, UART_FCR, UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT);
+	serial8250_rpm_put_tx(up);
 }
 
 static void omap_8250_throttle(struct uart_port *port)
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index db066a42f61d..76f35d1b3203 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -672,7 +672,7 @@ static void serial8250_rpm_get_tx(struct uart_8250_port *p)
 	pm_runtime_get_sync(p->port.dev);
 }
 
-static void serial8250_rpm_put_tx(struct uart_8250_port *p)
+void serial8250_rpm_put_tx(struct uart_8250_port *p)
 {
 	unsigned char rpm_active;
 
@@ -684,6 +684,7 @@ static void serial8250_rpm_put_tx(struct uart_8250_port *p)
 		return;
 	pm_runtime_put_autosuspend(p->port.dev);
 }
+EXPORT_SYMBOL_GPL(serial8250_rpm_put_tx);
 
 /*
  * IER sleep support.  UARTs which have EFRs need the "extended
@@ -2486,6 +2487,8 @@ void serial8250_do_shutdown(struct uart_port *port)
 	 */
 	synchronize_irq(port->irq);
 
+	/* TX interrupts can no longer release the transmit reference. */
+	serial8250_rpm_put_tx(up);
 	serial8250_rpm_put(up);
 
 	up->ops->release_irq(up);

---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261022-submit-serial-8250-tx-pm-shutdown-v1-db9091dde8f7

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

