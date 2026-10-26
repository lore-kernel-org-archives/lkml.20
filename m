Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013821;
	b=hMbaZKHFPYnEm4TECrFXJI4iGc3tS9shA2jO1MZ/4y/mM0QBG/jjS9EJTSKneRud+spB
	 +XK9vMqfCEQBB4jDs+wdtJPv+hp8d9RJFiDnjOlloExgs0z54j1iVhLwIlYbTJWEBEsUW
	 Gi0NvVXh+zxbNNzvMzb/M03sL6tYEHObBBbnjV4mUAJIBD8BPHs3iu/KH5poLLnz2EXJT
	 fglb/iAhu8GTAAEXvQQvmet01H4laWcq1TcZddMsJ+3Np/3TFL6s8/jsyx+Myj7SiDA5F
	 eYekEk5JW2P+8imXHhXjhVbaCwGG6C1ToBZmpaS47O26PEPcxk5c+DmvzrRyJ31YrBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=91CxdySFaB5DrN/6er6Cmr6Afr/bZ+u4IgV5MCTNg5A=;
	b=LuJZw7Sc52MzcRJ9tWwffTAzf4lAUrUKfVbgf3UJLuEhV6GDbO7srFR7cehLFop0Oa0w
	 z/+F8Bxv3hHt51F09AibIr6Ob9+rtBa5QhAkeVU7QO+dGVkuxhpRmrxix5F2gljPYQPYx
	 aipMRNQ90XPFfOnmvfcRikJ7e6M6k/d7d5ka/Uyduuqnem8UUri6De1yAsTJ6v+d2/CBp
	 P5CyUUpALVYknSxdWhxQc2U5cElc/AmRc0NMspgQuc1ibHqVRl7PzfaYh/GTyD6B1a6aY
	 GYvb8xh1DLdNv+TGXefb/dSDI7/M0sIna3Fa5IIZFCYG/uFx8Kchofk2fpBxMPVEQtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Eb4ZJMaB;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F30060A2613
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F30060A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Eb4ZJMaB
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2514156f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013819; x=1793618619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91CxdySFaB5DrN/6er6Cmr6Afr/bZ+u4IgV5MCTNg5A=;
        b=Eb4ZJMaBS/j/18Xff5SSSRLSO5m6c+4/yCdP3mEudBGbGe0vsqOFOrIakXk+ZZFbtz
         bASIbgpQ85FzN6gTp29PdM2T5m4LgojqERS15a0rKdDblaNtD1HD9h2D3lvGrVUfjSU0
         U0MUaWvl2nU0csnzoStmK8OgsTZCJ4rVb3voknZrepPZyYnbt5yTfQTW0yoAcp2Q2AY+
         +D1exgXkc/WNy2+osYudTY+UmemK/L1e+u4xC11CrnVnWIF+QfaBEGDDp2uPNOX6cSbD
         qeHcAg3Motw6CCIfyPngFiG5gvBxKRtqwAyVh32LBNIQ2J9p3PTbQVcXpwhu2QU3GABD
         Ikvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013819; x=1793618619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=91CxdySFaB5DrN/6er6Cmr6Afr/bZ+u4IgV5MCTNg5A=;
        b=lVp6TT3nGICkEUk8xut9MtMbQqKh4M9m1fqqO9EOPa4g7sM5WPDiXJHk50pvumTfNE
         yt7+UW6/eKyzkjdkv5xoBZ4Al/1X0q4UpMM8GQrjHmcG4y1v0td1pYcFDc51ZZw6dzTe
         hsrkaRxAqRE5zFZzonha9nsXXj44qVaRsSiZMOoX2mqEm64tAu1Vjf9WRpGIQnsJNAXw
         S6X9qh8xW/OUWqPDGWgwJT5hTHLAi+tp2pLNYaTyhVCxIzYSSfj0duPcRLgRxIheMt6a
         3BxnAMcKEdHm8fb8J2AnRSePMX+Yzd37Nz5E1Z64F6jWC6RrgJd7Lw/W9J1MBkiQ4xQW
         ImdQ==
X-Gm-Message-State: AFq9FYLCGM7d7P3wIoyEiCOqpAAPeetFYSO+nUZoJTX1IHpPSEssIZJr
	PJk6jRnuSvgfcWDrYJVyra9ceuueHlxHqAsNqkHn5LDOKcw+Sv1CkfVx
X-Gm-Gg: AYBFou2U4bc2QhIYxF/dfYOieK+H4k9+aTIOse/oN5+BkDxoeXA0Kh2AFFNEADL3uUT
	7stFEp7GZQEMIY0c1KKEjbiVf1vkEv1Y5VCTzmHAq8b98rNPo2gfUATB4jHKtam6GdHRDOZIFLw
	QNk2HHfIgruQvl1tvCUeTfNiwsjkygHs4Dpls6LATxcV3LZ3LNXjxH3XkimOuu0JxVYZv6sFKOV
	ViAgQyZpKZM7jwwULrmMJARur6MSqbePiHH0Yqqtr4nNe1zF4TigsmdTb9Rigs97tf9N8R40HiC
	HQA/qIbrL7I6iq/qw2xRohgVLcgnUJdAxKMphbaUZ5btBl4cO1AMahmyWQyS68cZMg9UvFjDqXx
	c6VGGG19YzhKvmWaG8cADcerL3gurcRrOqg76qWLMSgOB8+eUBZKiljDeTrP1ay9QnqwFWAr/oj
	sVfsRXjlWCUHrBWnMo9KummYQXHqVmIAnwzJRdkxgE6ER8m6D6PqVEys64pe61cblPF/o7lmFkF
	S6TbflOyfGsUps5pWamLmbntiwA4d/3qjWO9tWapwoEDDqVsNwkK0AV5+gkskNG9Ypcd+GEcO8x
	+/AjpabyXmPNfqw7Sg==
X-Received: by 2002:a05:6000:2999:20b0:48e:d57:9bad with SMTP id ffacd0b85a97d-48e3eb4593amr8523490f8f.3.1793013818741;
        Mon, 26 Oct 2026 04:23:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:482f:657c:9770:475e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm15959263f8f.54.2026.10.26.04.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:38 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 26 Oct 2026 11:23:34 +0000
Subject: [PATCH v3 2/4] serial: sh-sci: Keep TX enabled on TEI while data
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
Message-Id: <20261026-g2ul_sci-v3-2-b3097163edd5@bp.renesas.com>
References: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
In-Reply-To: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793013815; l=6886;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=qboa2rwoVt+GqKOS/MAhP42f7309eks4Yo8BKQfQrOI=;
 b=z2Hmp1XHW0PLOLrHLhw+d3/pu5mIslrFsUqLU733cT5JadIPoyW3PDYEpzDLi112BpgJaLQA8
 eF/KVqFvXmNDe1mXlYfXOeqb8UYBj6gn5gD1HJP5WA5h+GV6a6aP5Dn
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
any, clear TEIE, set TIE and hand over to the port's transmit_chars()
op so transmission continues normally. The existing TE/TEIE teardown
path only runs once nothing is left to send.

When the port is stopped with data still queued, the transmit_chars()
paths (sci_transmit_chars() and rsci_transmit_chars()) now also swap
TIE for TEIE, as they already did for an empty kfifo. Without this, TIE
would keep firing with nothing the driver is allowed to send, and TEI
would never be raised to complete the transmission.

To keep the handler independent of the register layout, add tie and
teie masks to struct sci_port_params_bits and populate them for the
SCI, SCIF and RSCI variants.

Fixes: d61ae331d6f3 ("tty: serial: sh-sci: Add support for tx end interrupt handling")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated commit description
 * When the port is stopped with data still queued, the transmit_chars()
   paths (sci_transmit_chars() and rsci_transmit_chars()) now also swap
   TIE for TEIE, as they already did for an empty kfifo. Without this, TIE
   would keep firing with nothing the driver is allowed to send, and TEI
   would never be raised to complete the transmission.
 * Replaced sci_tx_interrupt() with port's transmit_chars() to avoid
   lock drop race in sci_tx_end_interrupt() before TX handoff.
v1->v2:
 * Updated commit header and description.
 * Take the port lock before reading the control register, so the
   read-modify-write in sci_tx_end_interrupt() is protected.
 * Extended the pending-data check in sci_tx_end_interrupt() to cover
   x_char and a stopped port, not only a non-empty xmit kfifo.
---
 drivers/tty/serial/rsci.c          |  4 +++-
 drivers/tty/serial/sh-sci-common.h |  2 ++
 drivers/tty/serial/sh-sci.c        | 47 +++++++++++++++++++++++++++++---------
 3 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 40db9daa4272..0391111db8ae 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -465,7 +465,7 @@ static void rsci_transmit_chars(struct uart_port *port)
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
 
-	if (kfifo_is_empty(&tport->xmit_fifo)) {
+	if (kfifo_is_empty(&tport->xmit_fifo) || stopped) {
 		ctrl = rsci_serial_in(port, CCR0);
 		ctrl &= ~CCR0_TIE;
 		ctrl |= CCR0_TEIE;
@@ -627,6 +627,8 @@ static const struct sci_port_params_bits rsci_port_param_bits = {
 	.rxtx_enable = CCR0_RE | CCR0_TE,
 	.te_clear = CCR0_TE | CCR0_TEIE,
 	.poll_sent_bits = CSR_TDRE | CSR_TEND,
+	.tie = CCR0_TIE,
+	.teie = CCR0_TEIE
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
index 9eb297dbc901..6df25fef5a5f 100644
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
@@ -1007,6 +1011,20 @@ static int sci_rxfill(struct uart_port *port)
  *                   the interrupt related routines                       *
  * ********************************************************************** */
 
+static void sci_clr_tie_set_teie(struct uart_port *port)
+{
+	struct sci_port *s = to_sci_port(port);
+	unsigned short ctrl;
+
+	if (s->type != PORT_SCI)
+		return;
+
+	ctrl = sci_serial_in(port, SCSCR);
+	ctrl &= ~SCSCR_TIE;
+	ctrl |= SCSCR_TEIE;
+	sci_serial_out(port, SCSCR, ctrl);
+}
+
 static void sci_transmit_chars(struct uart_port *port)
 {
 	struct tty_port *tport = &port->state->port;
@@ -1050,14 +1068,10 @@ static void sci_transmit_chars(struct uart_port *port)
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
 	if (kfifo_is_empty(&tport->xmit_fifo)) {
-		if (s->type == PORT_SCI) {
-			ctrl = sci_serial_in(port, SCSCR);
-			ctrl &= ~SCSCR_TIE;
-			ctrl |= SCSCR_TEIE;
-			sci_serial_out(port, SCSCR, ctrl);
-		}
-
+		sci_clr_tie_set_teie(port);
 		sci_stop_tx(port);
+	} else if (stopped) {
+		sci_clr_tie_set_teie(port);
 	}
 }
 
@@ -2012,6 +2026,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct sci_port *s = to_sci_port(port);
+	struct tty_port *tport = &port->state->port;
 	const struct sci_common_regs *regs = s->params->common_regs;
 	unsigned long flags;
 	u32 ctrl;
@@ -2020,8 +2035,18 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
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
+		s->ops->transmit_chars(port);
+		uart_port_unlock_irqrestore(port, flags);
+		return IRQ_HANDLED;
+	}
+
+	ctrl &= ~(s->params->param_bits->te_clear);
 	s->ops->write_reg(port, regs->control, ctrl);
 	uart_port_unlock_irqrestore(port, flags);
 

-- 
2.43.0

