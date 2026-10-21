Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588401;
	b=nb2o7/vOTexn5J3GSYg8Uj/zJovnJDftTu38/Qr8aMLn4tfHf0+RYcd8o/ZEY8L2ftNO
	 WMO5cuogWJflf0YNdSS2iXYZ9REPMOYgq6SEZC44CiY0ciEtiglTXCV1cIRT6EmYTf0Cw
	 WCv0AJ1rk/lv97xDCFHL+upc73I0jkRnf0xRz4k+9U0tfeo6xbMzSStPPD6CXEzUrKKtN
	 1S/eJZr88Ap86rbJAcaNEol25odMovUFjO7XoYXUZR+iDkqlQhA0wvjlQhfIBVm5CpdSX
	 Fx3FYxAKcy6HmWCdAicCG6GWXzGTR7YxwDfiyO/B3XypWZvJCfTpuF1IOB7o/pwpbfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=292nn4bD9cz6vKfwxdJIYuZQqNn1YltUeNe0zaIQXIg=;
	b=M+cMbT/NNIKDFvA2tFpaxLXh/1KYaijROQ5LbKaKyEbqVv7IJeT/scNuhOw5dEWuurHt
	 t2PoDpKLKgvGFGMMx1QyEU00Lehow0yvOBgwvqzlCFKaGKseRcv6rnR06i3eEiC5rp3fn
	 KRohok9Xxv5C4k8GIZBJod5v1AXGv6OKGku4n0A0pN34fLvYKUW9bg3VTmH8kYLGFccZv
	 Zr/4iCSK6I/o3PhE1bFs3ElM1E8DYOBonbmzk4UmIbp3c/T9CdKYez3BGJPg80FmEkw5E
	 LiZMmPWkgzGSDb0SGzlUT70q+IEUboiprzgaC2WGrTj3RqVEJ6/PlVwFdoS8D2T6wLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tIulHIam;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15A360A2606
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F15A360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tIulHIam
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4be28b82so635919f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588399; x=1793193199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=292nn4bD9cz6vKfwxdJIYuZQqNn1YltUeNe0zaIQXIg=;
        b=tIulHIam1pcnbmL5Kq1kdTiV3W1axLfHu4Nw7F/nOOg1AbHj2CGUT6+yFMcT0fhP4k
         1H/49MNYKrzwUB7PNZe9WwYnNJlwH/aAjRWiidd0lAkc+TmMYr5gWVuYMGLsc6BqW/jI
         ohmXzIztd3Q5lnKzROcnCxk7rpvoi2AX5IH0aOpQ8F9F+PTok836+oF92hmZI4RIYL9c
         91iCOnAm3vifGyZ7DU7RHr/TO8ZBoAtaqrselCVL+6Sw45IklYzSjM5uwR4ogl1UQA56
         r7E7tMt+qnnZd+Sog1+FMG/+E23gzEI4AL4BOS2FB3KIo0wsT9E5CIo+ops+ht7vlzCp
         cYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588399; x=1793193199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=292nn4bD9cz6vKfwxdJIYuZQqNn1YltUeNe0zaIQXIg=;
        b=j1bHwVgUa4Ta6aRDHztxL0cliVZFCx/h9TECRsjGMobuAz9HNSAPsQc86k8VzC2ehW
         2ys+408CfvXpwV2F2Plck6ZTRCun2rdifZe/b+A2bosMV5K/Vs34xrIRzsD6wNx1arVY
         OQqRRGe+2RkDjMKfmocDGEqUE72otoCJQw2ncKUfgQ5rD4/KTJzw6AUZrjQ+OK7lDzBS
         RS5CSHfd5JgCzDZEgppbvMOLp2Jjmr7DZRtp017IoF/1BxlSbI7QFWH3tdycm+eWZPMr
         6DBbsaog7rqKeDOJQfkIpy0FoJkkHPODNF9PxV971n5+SRm529T+9I+pXxgIPAR31R7i
         60YA==
X-Gm-Message-State: AFq9FYJYYoH5Yw9Fc0wYLsG3WhMqxV41AetwKA2ys5EEC/3gnO/7Szos
	NItYVUEYwJgzRzqwNOyfYi6rkBVryjtbT294Sv6OEfIVq2IcLDObI6zM
X-Gm-Gg: AYBFou3e4/PCpsivfPKXr10+J8UPOqA776GuAdLQtIL0Lkt5Oaj7XBWBeA6WhZAqLfY
	W1C5k5a510tTXJqrnMCdznhdgk+9RFzn2EajZsN+qN57ySca5OOAIlxwBZBdgCTrg4+LqfXLVWJ
	LYZZyxwjL44Wgc5e0N/cO+ejuRhHzqoi/Hi+W8bVI7peyKh7xHVgthrSoOLn/kqzuUUFPQReAgg
	NA31QNL6vGxvVGt7XBs6UPxiS2ZvU4tF090sfRewEd1f2oVEnerzfmdQ84IbAcIkn4s+oHvP0DC
	qQxu8TU6gA5lqOy81fpgFtWhSrHe/S7pniJUiiW53cmfK5qIKIxeZtSF2L/KK9x/Br4aimdLUyZ
	3ZbHaf9mlN+ks+tcVKA3Ix0ola/UL213yquySf54pNwWqUbb4TfZ+pSvkKZy5gvQtAUqzKQKI/v
	cRRZ1njclWPzexSkMQQq4NwMTH4DSZAojDQtqK1hAfCq9/IdRH4rh3Aq8O1dThFRS4QiUpUun/X
	r4o9KcNibsNL5Dhrw8ax0WOPrqTYqxbbn67yODxra0/SIla5sTjg0cvZyOM9xNV3lDuxslTuf6G
	YgqCeSjcwyqC2fEG
X-Received: by 2002:a05:600d:82c1:b0:4a1:cdab:f5c4 with SMTP id 5b1f17b1804b1-4a1fdd24674mr41785685e9.5.1792588399034;
        Wed, 21 Oct 2026 06:13:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:18 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 21 Oct 2026 14:13:14 +0100
Subject: [PATCH v2 2/4] serial: sh-sci: Keep TX enabled on TEI while data
 is pending
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
Message-Id: <20261021-g2ul_sci-v2-2-b4e038220018@bp.renesas.com>
References: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
In-Reply-To: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=4482;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=wf7d22n14z+6F4u/wCQpq1DvU71Byp9AVSJ1tL9JEOE=;
 b=3DOA93pFE4K6cXhopLwouumZlWA6bnQJ1hSGxktN3UZJKfjNgafV0q7xDKtLCmS9dl8I2yZJU
 l4btajxbEBlB8KGTpE5QoEvIERyfrHWYwz/D/jc4J96vrEZQwRfwEza
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

sci_tx_end_interrupt() handles the transmit-end interrupt (TEI) on
SCI and RSCI ports by clearing TE and TEIE, which turns the
transmitter off. It does this unconditionally, even if the xmit kfifo
was refilled, or an x_char was queued, after the last byte was written
to the data register and before TEI fired. The pending data is then not
sent until the transmitter is re-enabled, so output stalls or is lost.

Check for pending data (x_char, or a non-empty xmit kfifo on a port
that is not stopped) before shutting the transmitter down. If there is
any, clear TEIE, set TIE and hand over to sci_tx_interrupt() so
transmission continues normally. The existing TE/TEIE teardown path
only runs once nothing is left to send.

To keep the handler independent of the register layout, add tie and
teie masks to struct sci_port_params_bits and populate them for the
SCI, SCIF and RSCI variants.

Fixes: d61ae331d6f3 ("tty: serial: sh-sci: Add support for tx end interrupt handling")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit header and description.
 * Take the port lock before reading the control register, so the
   read-modify-write in sci_tx_end_interrupt() is protected.
 * Extended the pending-data check in sci_tx_end_interrupt() to cover
   x_char and a stopped port, not only a non-empty xmit kfifo.
---
 drivers/tty/serial/rsci.c          |  2 ++
 drivers/tty/serial/sh-sci-common.h |  2 ++
 drivers/tty/serial/sh-sci.c        | 22 ++++++++++++++++++----
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 40db9daa4272..52638db7bbeb 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -627,6 +627,8 @@ static const struct sci_port_params_bits rsci_port_param_bits = {
 	.rxtx_enable = CCR0_RE | CCR0_TE,
 	.te_clear = CCR0_TE | CCR0_TEIE,
 	.poll_sent_bits = CSR_TDRE | CSR_TEND,
+	.tie = CCR0_TIE,
+	.teie = CCR0_TEIE,
 };
 
 static const struct sci_port_params rsci_rzg3e_port_params = {
diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 01ff9fced803..273856fbc20b 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -56,6 +56,8 @@ struct sci_port_params_bits {
 	unsigned int rxtx_enable;
 	unsigned int te_clear;
 	unsigned int poll_sent_bits;
+	unsigned int tie;
+	unsigned int teie;
 };
 
 struct sci_common_regs {
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 9eb297dbc901..58120b523ca1 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -261,13 +261,17 @@ static bool sci_uart_earlycon_dev_probing;
 static const struct sci_port_params_bits sci_sci_port_params_bits = {
 	.rxtx_enable = SCSCR_RE | SCSCR_TE,
 	.te_clear = SCSCR_TE | SCSCR_TEIE,
-	.poll_sent_bits = SCI_TDRE | SCI_TEND
+	.poll_sent_bits = SCI_TDRE | SCI_TEND,
+	.tie = SCSCR_TIE,
+	.teie = SCSCR_TEIE
 };
 
 static const struct sci_port_params_bits sci_scif_port_params_bits = {
 	.rxtx_enable = SCSCR_RE | SCSCR_TE,
 	.te_clear = SCSCR_TE | SCSCR_TEIE,
-	.poll_sent_bits = SCIF_TDFE | SCIF_TEND
+	.poll_sent_bits = SCIF_TDFE | SCIF_TEND,
+	.tie = SCSCR_TIE,
+	.teie = SCSCR_TEIE
 };
 
 static const struct sci_common_regs sci_common_regs = {
@@ -2012,6 +2016,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct sci_port *s = to_sci_port(port);
+	struct tty_port *tport = &port->state->port;
 	const struct sci_common_regs *regs = s->params->common_regs;
 	unsigned long flags;
 	u32 ctrl;
@@ -2020,8 +2025,17 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 		return sci_tx_interrupt(irq, ptr);
 
 	uart_port_lock_irqsave(port, &flags);
-	ctrl = s->ops->read_reg(port, regs->control) &
-		~(s->params->param_bits->te_clear);
+	ctrl = s->ops->read_reg(port, regs->control);
+	if (port->x_char || (!kfifo_is_empty(&tport->xmit_fifo) &&
+			     !uart_tx_stopped(port))) {
+		ctrl &= ~(s->params->param_bits->teie);
+		ctrl |= s->params->param_bits->tie;
+		s->ops->write_reg(port, regs->control, ctrl);
+		uart_port_unlock_irqrestore(port, flags);
+		return sci_tx_interrupt(irq, ptr);
+	}
+
+	ctrl &= ~(s->params->param_bits->te_clear);
 	s->ops->write_reg(port, regs->control, ctrl);
 	uart_port_unlock_irqrestore(port, flags);
 

-- 
2.43.0

