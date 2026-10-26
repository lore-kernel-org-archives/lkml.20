Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013822;
	b=s0Q5x1ZMrnEYsWL4XKX4I3M8rnc4DbnLuDyq812VKeTMEiiNp0Zkx0Sb30Mm1ks2U2tG
	 vmTC3PDk9ScMvrBYqlBu8v3xzJtakW1/WG7J6E6g9LeS5cq+NSQC0KShhT8DOEze+g2Ns
	 +2Aa3T8w7MpXtZc3QgHiF7XjLpz8qXMF26THRc/Dh2WgH0r0sBrTWBZNlf3DocmeUnQMf
	 mKmseN4HvWRqG8TPvGxI8RD1aQa+zrZuuKTbC27rvfCgL7ryRP27yBZqEoJhx8MgzWsKx
	 fOyZVqKCXm74AbpXuKja8dQzv4malwzGr71ciYYxtzFSz4oWFWBUoljX8RBMmfcCmeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=NkHFqvFUiAfPwzGNvVdLDGTDUaLNG4S8G8Zms7Ox124=;
	b=hyYh1YZOO4zRBef1XH3l4gnye2wTbnF0eFSqZNmFLckV0u6m9KM/6VuczCfrvMErsd6i
	 Z/zUX3djkXGN24Y9hqRcj5T/f/9IQ7s+VEWJs3Bfb9CuFpEGCPggUWh2fqZFia8f8hcT5
	 xJvd7UlxpPh532551w2ggTA7iiWDTqIfh9ceGDTI6dJ14HYW+8bpod6klalDDjIuZWv++
	 RFpx0xj9BSTccvFoBdG1Rs/Dxs1Ay5cDUC2GMxc8NPH9yJ3fVVVg7kjHi5pblXTOlB8MM
	 0yWwm7S/dc1duYBwruaDMidnEV976y7sC7TdztRJr8jx2wq5Egc9DRZwTxRAsjrMojw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h4s5zCyQ;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED7160A261E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED7160A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h4s5zCyQ
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e46e449e8so867513f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013820; x=1793618620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkHFqvFUiAfPwzGNvVdLDGTDUaLNG4S8G8Zms7Ox124=;
        b=h4s5zCyQcTz922ZU8qa+kLa0ADt04uotU1dYVXVKNPs2n6HqMB1AZ44+a+bi/aD3Ql
         zmdVMUICGIqnQ+WBEA0SPQFWEXPmGz/hlDGCLv+rI8nV9lB+HdB4sL3gtrSyCEg9Mx2Q
         RkyTb5gEESzf25R2EDTPNj37nBMeeLgU/HaF7RzSArWUNoz6RTV/T8isGi+x1XGs+gBe
         tLL3SbOhKD/OrncJSFVWqabtn008LsgdZClSrvZ8voUsyY8wDJfO9ZiXUBGgSQxVd1U0
         gWcH2Yj3fYujXLwwRfEgnuq1lDJYI4kFjqntp4zTHEQcXdvdz5DqPyKAUyyVCP9v/qs3
         496w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013820; x=1793618620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NkHFqvFUiAfPwzGNvVdLDGTDUaLNG4S8G8Zms7Ox124=;
        b=h/+6AZNS0tCnQHJHwEGfAVLUN2NkK5EN6IFGN8zaz2AoOP0sZw8wOzeR52+k1idRMz
         xTh9i5URQw6yoyLToPCsMbkneOpNI5acYdKI1zZIZABmA6QM4bH3yDkkWEm7I4HVeDAi
         TdFM9dCsgXySHnroGzoDYsqplFknxW+WfOB2SVnqltYtd2EntWYvKqVLjpi1yEIb5XSM
         eAXfgeuqZEyb48TWofMRSIzBrQcCH2xCTtUc+fyV4a08bOljC6zer1VcpHJcyL3v8TJ1
         sxfvQtj82ZEXe922WRj4GOHjQ686hmMnF9CyLOIQVUhGNSzj5yLWfwca7shBTmsHC2hn
         IQ1Q==
X-Gm-Message-State: AFq9FYIp33VyVZ/b8t6T359rR4zlYXlOLyMLFzLA9dDc7Wl0XBkUivMf
	tVoa6G/XO36Z9/Ww5WPcCeKIp0QsT9ZDXIv07L4y2OTahVnrbUkENOZb
X-Gm-Gg: AYBFou3IDbcD/JkmnLENwSXlUXPBZXylqpo5oqjxCAYIFCEiORpwHccFFCWkMjZcXgi
	cadVQWnbMrGQKRe4lsOD35jZkzuZovH/TFCG8MSYmu1SSli2HVNeTGeimCIxakTWIXBWh6g+BYI
	BPOWFexcM8V9zhVIDc8a0I+PPHk0dScAAtj/H5QAsSEhnQ6DJqQgOoNOtOFZiEzAXvY/noz0aGC
	GN8gxDaA5T0i5E4CNQaPFJ2/UN1juRY7S4JirXgMgRHxkSEEQqdPyPeHrZLKNnVrxQ5NZsF5adl
	HMUb0MMGi5WjvIF9TTlGHXMSpE9l0RJzo+62n7MQKQaxOz2zPC6hU6cPnvk6TuvUJ4wsRMWq6jd
	ZByZVXiGSVs+6in69d+gAbDMmDEYBtXElSoIm4yg20SAr/rFzpxRDtUBGRbPDwdfVFfbNM/Adw+
	WNYjuooGph2+LgCW3EHAF5mpx0kYh+GdtoRQayv1EeHmQeHmnCsvuJ+6AqgOafCoEOycowPwwFW
	iE3xKQ4trJuRnx83UeoLU5f6nygmcGpENdMbuw/iFDV2eXVCCoVvaIspZd7H1e3EgDxdxmNdPJT
	fC4ONXJpmrntVtiPw2fqt8bi4NQnrr0gBksiYgs=
X-Received: by 2002:a5d:4383:0:b0:48d:fd53:828d with SMTP id ffacd0b85a97d-48e3eb8a1b6mr7627995f8f.30.1793013819697;
        Mon, 26 Oct 2026 04:23:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:482f:657c:9770:475e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm15959263f8f.54.2026.10.26.04.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:39 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 26 Oct 2026 11:23:35 +0000
Subject: [PATCH v3 3/4] serial: sh-sci: Skip TDxE clear when hardware
 clears it automatically
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
Message-Id: <20261026-g2ul_sci-v3-3-b3097163edd5@bp.renesas.com>
References: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
In-Reply-To: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, Au Dang <au.dang.jx@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793013815; l=3620;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=KB+kE1+shxRd3dGwjTbXEQz+rrpnAjxkBvUYxhCqGQ4=;
 b=FyiJOLjQsEgh7hED9u6Vg84+oXVavAcckL1O3uxMZb2M4M6TLvy0YXizK/YFDsHSZWWowmR4Z
 eVo9V5O27wgD36iRG5CapP2RVofAO2y0Su45I6MBJOB4ez2CMGOmxRx
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Au Dang <au.dang.jx@renesas.com>

On some SCI variants, the TDxE (Transmit Data Empty) flag in SCxSR is
cleared by hardware when data is written to TDR. Clearing it again from
software via clear_SCxSR() generates a spurious TXI interrupt, causing
the last character to be transmitted twice.

Add a tdxe_auto_clear flag to struct sci_of_data, propagate it to struct
sci_port as has_tdxe_auto_clear, and skip the clear_SCxSR() call in
sci_transmit_chars() and sci_poll_put_char() when it is set. Enable the
flag for the PORT_SCI (of_sci_sci) variant.

Signed-off-by: Au Dang <au.dang.jx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added missing has_tdxe_auto_clear init in scix_early_console_setup().
v1->v2:
 * Updated commit header and description.
 * Replaced the PORT_SCI check with a has_tdxe_auto_clear flag in
   struct sci_port, set from the new tdxe_auto_clear field in
   struct sci_of_data.
---
 drivers/tty/serial/sh-sci-common.h | 2 ++
 drivers/tty/serial/sh-sci.c        | 9 +++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 273856fbc20b..b75e5e1d3075 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -108,6 +108,7 @@ struct sci_of_data {
 	const struct sci_port_ops *ops;
 	unsigned short regtype;
 	unsigned short type;
+	bool tdxe_auto_clear;
 };
 
 struct sci_port {
@@ -163,6 +164,7 @@ struct sci_port {
 	bool has_rtscts;
 	bool autorts;
 	bool tx_occurred;
+	bool has_tdxe_auto_clear;
 };
 
 #define to_sci_port(uart) container_of((uart), struct sci_port, port)
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 6df25fef5a5f..1a4d9467d2be 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -913,7 +913,8 @@ static void sci_poll_put_char(struct uart_port *port, unsigned char c)
 	} while (!(status & SCxSR_TDxE(port)));
 
 	sci_serial_out(port, SCxTDR, c);
-	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
+	if (!s->has_tdxe_auto_clear)
+		s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
 }
 #endif /* CONFIG_CONSOLE_POLL || CONFIG_SERIAL_SH_SCI_CONSOLE ||
 	  CONFIG_SERIAL_SH_SCI_EARLYCON */
@@ -1063,7 +1064,8 @@ static void sci_transmit_chars(struct uart_port *port)
 		port->icount.tx++;
 	} while (--count > 0);
 
-	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
+	if (!s->has_tdxe_auto_clear)
+		s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
@@ -3664,6 +3666,7 @@ static const struct sci_of_data of_sci_sci = {
 	.ops = &sci_port_ops,
 	.uart_ops = &sci_uart_ops,
 	.params = &sci_port_params[SCIx_SCI_REGTYPE],
+	.tdxe_auto_clear = true,
 };
 
 static const struct of_device_id of_sci_match[] __maybe_unused = {
@@ -3802,6 +3805,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 	sp->ops = data->ops;
 	sp->port.ops = data->uart_ops;
 	sp->params = data->params;
+	sp->has_tdxe_auto_clear = data->tdxe_auto_clear;
 
 	sp->has_rtscts = of_property_read_bool(np, "uart-has-rtscts");
 
@@ -4088,6 +4092,7 @@ int __init scix_early_console_setup(struct earlycon_device *device,
 	sci_ports[0].params = data->params;
 	sci_ports[0].ops = data->ops;
 	sci_ports[0].port.ops = data->uart_ops;
+	sci_ports[0].has_tdxe_auto_clear = data->tdxe_auto_clear;
 	sci_uart_earlycon = true;
 	regs = sci_ports[0].params->common_regs;
 

-- 
2.43.0

