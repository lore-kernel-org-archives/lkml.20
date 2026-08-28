Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AD53921D5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939895; cv=none; b=hJdqIU+gscAzI1GuXuQUolR7lZBtriBI3cgYfXmvNDr1JB/SrD9Qb/JzyLnJDHw8baMr4NqS0oiyqPRhWaIw8cEo4zcY1Y6nQz3C5CGI+miMgYPl9ZczhBbD7pPhdQZSxlX33NV9DXwjHoeCNobOjDLB5Bb0FEFKXWOjZg6NkUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939895; c=relaxed/simple;
	bh=2syIJmjcswpsVgwEi2ImAtlcAqYfUfd9bprdJdMk+Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References; b=KPZZyT8L6jcp865BqhRTyIY6rRa9Xp29sKBT3FqfEJ+ZUjwwTVUncGJKdXLOj2dJP5KZOyoJzsaXJKRlpVo4pONbzhEnZri8HqPOds4Y4DZxtRBKgXYPDIVaDS8d/AYKD7i8nTPs4BqhTJ5ZO6J4o8mDuPo+AgR6wgeT5SJpBB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=KlhWY1YT; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="KlhWY1YT"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2cf452def93so20005035ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939893; x=1788544693;
        h=content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZqFY5uK60R/5xw6Negun7eGTEaorGHjqlQPmWGNoYw=;
        b=PXysaCJc7oergVSaQ9GzwHM2nAY2On7P4Ut700zmbV2IPtJvz2JUQ1h5T01QlzAV2D
         FjGfYKcvBCPrumrjBnTN4j9F2rgc4Fkuka4RO49SKTaKfIZDSP9SkuE+IIrLbFoSI1Vd
         YWR90AbWn00nbThChoe5NGlM3HFqUf1/PdY6KljiBFmXX3PQpK5UP5W9ab3LPNyvCPwI
         GRITzUs2fxVp1Z/TODtidRZA/HB8pE814mmhhua8WjaeAQJqcct9BlQ+FdZ9IcwVKMrm
         CZZWf1EG/F+3VWTjoTesfc24fIHfFx0YlSm0wXermugS8J0jDKwLNpY7G/LMvI0camh4
         aY9g==
X-Forwarded-Encrypted: i=1; AKwUvBzAjGVKiiHc9hmMEv5GPCqAnRS+7eTipFV8HSdvqEFw0B64Xqe+2NW3fzIA4GRFzwKFnmH40KU+sP6YHvE=@vger.kernel.org
X-Gm-Message-State: AFuF++lx/wgQn7dncYegJIqcPnEKE58zAXiVqbZMOXNQg6ASfNR6nx3r
	CnOpygxaFjhUlKAoavOcuTlyIYwZ+s3UV4Gz4Tud0cYiP8itMW6rIbUiwCrfphsGYxSUmYtT5Ad
	uVINQqscj0AvMQE5UjOMyUSdm2j/yJO3qyA==
X-Gm-Gg: AYBFou1zN6AsINVi4WmgnEMCmF5samxN6qAkpjT3CBOJXJQFnFbSX0DH6sCEC8KWeGX
	25ZTBa/5kCglLJTUSXBI4PfLxEjIAFy+aaS05id2suCUoumhiGOXOJL7Pzi4C1sFj4pB13417Gj
	qeDf8BskwUduk4DsGldMUnIqI/hzC4wyFLrp6PSNk3cSWAdNzDoznc7JI5zg3axYvRfy74xilxK
	Ma/afKkQ5CSqt6ZOYjfyiLEn0O9d1NBGbq377/2CFlsJXX9i/zvm+5AYTt7RGNcugxW+N+ORjry
	TpL8PaGNJgUne7+92RD1x1iHtyBH0HI8bc5B8PDVtHPTnIQZrIVIPsUS/aHZhwd9R0G706a0O7k
	vb6cU4nk57dtmO9jxM1Q4LhFWBDbOx7fxV2IRtb52/Dgf+TjKIwnkhTuFHfON
X-Received: by 2002:a17:903:2ec5:b0:2d6:fddf:a890 with SMTP id d9443c01a7336-2d72634612dmr225105535ad.6.1787939893319;
        Fri, 28 Aug 2026 10:58:13 -0700 (PDT)
Received: from smtp.aristanetworks.com (ec2-54-84-120-176.compute-1.amazonaws.com. [54.84.120.176])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2d7595288d9sm323555ad.15.2026.08.28.10.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 10:58:13 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1787939892;
	bh=PZqFY5uK60R/5xw6Negun7eGTEaorGHjqlQPmWGNoYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KlhWY1YTVrVUpFn2IfTH5Q8uC2Lz9EigFuoTSbFpqx1Mhk5ILvc0vhfqbFqVZ0qS5
	 TrI0hlw0Q4Kd5lB79LS193AXIxWkEM539VvH8r+khQDhQj7eqjYdHZ0s3Buq4V0n5+
	 NL1upoY4bJzSZtgc2zCfyK6tFCTZQlmgtKHS9fsgBjQCwb+FIB60hsdic3KkHh2ImZ
	 fA5tv+Bq9SLZ5myormuySmLxNVkTy8KgjhRulWZFa3dkz+8ZmDH/HUEGO8WP8SemnS
	 90q7HNkLCqk6UlC+k+/1qgtF1w3lLQWi6kY35Nkwg9SxAkI0NuCdEbaQw0i0VBNinP
	 nMnUxEJI7VthQ==
Received: from vm-whiteberg-ubuntu.aristanetworks.com (dhcp-244-90-77.sjc.aristanetworks.com [10.244.90.77])
	by smtp.aristanetworks.com (Postfix) with ESMTPS id 75F05C0CE0;
	Fri, 28 Aug 2026 17:58:11 +0000 (UTC)
X-SMTP-Authentication: Allow-List-permitted
X-SMTP-Authentication: Allow-List-permitted
From: Tate Whiteberg <whiteberg@arista.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Tate Whiteberg <whiteberg@arista.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 1/2] serial: 8250: export and rename wait_for_xmitr()
Date: Fri, 28 Aug 2026 17:57:27 +0000
Message-ID: <20260828175733.1650267-2-whiteberg@arista.com>
In-Reply-To: <20260828175733.1650267-1-whiteberg@arista.com>
References: <20260828175733.1650267-1-whiteberg@arista.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Export wait_for_xmitr() and rename it to follow naming convention.

Signed-off-by: Tate Whiteberg <whiteberg@arista.com>
---
Changes in v2:
  - Separate this patch from successor patch.

 drivers/tty/serial/8250/8250.h      |  1 +
 drivers/tty/serial/8250/8250_port.c | 13 +++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 9337fec9394e..f99620b1cab7 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -180,6 +180,7 @@ void serial8250_clear_and_reinit_fifos(struct uart_8250_port *p);
 void serial8250_fifo_wait_for_lsr_thre(struct uart_8250_port *up,
 				       struct nbcon_write_context *wctxt,
 				       unsigned int count);
+void serial8250_wait_for_xmitr(struct uart_8250_port *up, int bits);
 
 void serial8250_rpm_get(struct uart_8250_port *p);
 void serial8250_rpm_put(struct uart_8250_port *p);
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 38fa45e74a37..4eaf417f1fd7 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2024,7 +2024,7 @@ static bool wait_for_lsr(struct uart_8250_port *up, int bits)
 }
 
 /* Wait for transmitter and holding register to empty with timeout */
-static void wait_for_xmitr(struct uart_8250_port *up, int bits)
+void serial8250_wait_for_xmitr(struct uart_8250_port *up, int bits)
 {
 	unsigned int tmout;
 	bool tx_ready;
@@ -2052,6 +2052,7 @@ static void wait_for_xmitr(struct uart_8250_port *up, int bits)
 		}
 	}
 }
+EXPORT_SYMBOL_NS_GPL(serial8250_wait_for_xmitr, "SERIAL_8250");
 
 #ifdef CONFIG_CONSOLE_POLL
 /*
@@ -2098,7 +2099,7 @@ static void serial8250_put_poll_char(struct uart_port *port,
 	ier = serial_port_in(port, UART_IER);
 	__serial8250_clear_IER(up);
 
-	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
+	serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
 	/*
 	 *	Send the character out.
 	 */
@@ -2108,7 +2109,7 @@ static void serial8250_put_poll_char(struct uart_port *port,
 	 *	Finally, wait for transmitter to become empty
 	 *	and restore the IER
 	 */
-	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
+	serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
 	serial_port_out(port, UART_IER, ier);
 }
 
@@ -2223,7 +2224,7 @@ static void serial8250_THRE_test(struct uart_port *port)
 	 * Synchronize UART_IER access against the console.
 	 */
 	scoped_guard(uart_port_lock_irqsave, port) {
-		wait_for_xmitr(up, UART_LSR_THRE);
+		serial8250_wait_for_xmitr(up, UART_LSR_THRE);
 		serial_port_out_sync(port, UART_IER, UART_IER_THRI);
 		udelay(1); /* allow THRE to set */
 		iir_noint1 = serial_port_in(port, UART_IIR) & UART_IIR_NO_INT;
@@ -3293,7 +3294,7 @@ static void serial8250_console_wait_putchar(struct uart_port *port, unsigned cha
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 
-	wait_for_xmitr(up, UART_LSR_THRE);
+	serial8250_wait_for_xmitr(up, UART_LSR_THRE);
 	serial8250_console_putchar(port, ch);
 }
 
@@ -3504,7 +3505,7 @@ void serial8250_console_write(struct uart_8250_port *up,
 	 *	Finally, wait for transmitter to become empty
 	 *	and restore the IER
 	 */
-	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
+	serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
 
 	if (em485) {
 		mdelay(port->rs485.delay_rts_after_send);
-- 
2.43.0

