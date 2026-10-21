Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592151;
	b=FPh/4Qb+vlQLCgQWAvpozATTqvaylQbzW4ZM+xuwCQYvZ/7+8XiRAYErgVqcWN7zjgR4
	 BxwodNrwiGT0j8DrjA7utaiy/5rEz+uzatWnlU1N3hS+pHbi3CHZkfpDbwz4H8tYxinVb
	 gu0GFuDwSAaatMs+mZpy/b8Lyri8tiChuMB/DJgyLDKsv1H21Nc+Adq5aowoK5+9CThac
	 cVJc2bYfMFSAZNvG99U2pMce0GFjgKmQ6js58B42zXQVcep3/KotE4Zs4X8iy6OgU7Q/V
	 eP2wiNHC26MqRSisjb6E9ESirEznsn9uWSDBUsN7+rv/rZoSpOt1QkmVqbyWDKlNyYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592151;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zu7fC21Rn8rF0NdsmlFgi2byl/XFuRPPE9ibK7cz1cI=;
	b=iyydyk6h+gSYMhcjRUjIBYdCPX8QoSlNmEdAzm45NddgXAsu5N1kIQ4dXFPofIzNDnxH
	 exvuYlWZ3T43kQpcMqgSozc0JHt5FQZW36GPyM0sg4eLHAY5sNrhqUai4V0mhfQ0xzwxy
	 1VjEhKxfO9WZgatHISHcyFnUyD5vP3I/jPHqJ9O5ZaWOtbJeUGQR5Pg+w430s0oMemZ2s
	 GsOPGjK3c/bWeRejMepWVkV+/QkuTYfSrrd+moYjpVcNwym2I7m85gc+m+1DplZhw5TYK
	 qYWjdFwkNNXZUmCdVC/CjI6Nxo8NAroYWrmtvnthXGnAVzAO3qz4ZQzTmkuh4IosbGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NE3zbQK8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE20E606A325;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NE3zbQK8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214801F000CA;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592150;
	bh=Zu7fC21Rn8rF0NdsmlFgi2byl/XFuRPPE9ibK7cz1cI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NE3zbQK8ok4f6rG5o60J5nvVJv/4IaI4HT3FnScHUPB2iBICOXiO89dDz1j2Rgcuy
	 hfN+wfJ4RbUhbnaPD4rwHqfMcE4qWt6zCJ/rbE81DtGafhU+CDi2xgV6eCY+oE0FU4
	 LXB8FUesRemDaZamzGoiAYzcMxLA2FDDZm9ZhsSIt7iLpijCIbfZRsqzc2EQqxlHft
	 lseB0aHEph8eaQak5pRzRdQ6435Awc/IDlv0dxnay+mAVTPVhY2q1vu3TY47ZXQf+w
	 6d7wNwAWktaTEEXxNPrFf1QkCzFR1V47pHUflE/Zy//tKJuYpfDlX35Mm38caqoaP7
	 SxnOZt7goTwXg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJX6Z-00000009kqQ-2dJi;
	Wed, 21 Oct 2026 16:15:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] USB: serial: io_edgeport: deassert DTR/RTS on close() and B0
Date: Wed, 21 Oct 2026 16:11:52 +0200
Message-ID: <20261021141154.2324793-10-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021141154.2324793-1-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
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

The modem control signals DTR and RTS should be dropped on close() if
HUPCL is set and when requesting B0, but the driver is currently only
asserting the signals on open().

Implement the missing dtr_rts() callback to handle open() and close()
while letting set_termios() handle B0 transitions.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index acaac342f43f..fd983ebd1b6d 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -1567,6 +1567,23 @@ static int edge_break(struct tty_struct *tty, int break_state)
 }
 
 
+static void edge_dtr_rts(struct usb_serial_port *port, int on)
+{
+	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
+
+	mutex_lock(&edge_port->mutex);
+
+	if (on)
+		edge_port->shadowMCR |= MCR_DTR | MCR_RTS;
+	else
+		edge_port->shadowMCR &= ~(MCR_DTR | MCR_RTS);
+
+	send_cmd_write_uart_register(edge_port, MCR, edge_port->shadowMCR);
+
+	mutex_unlock(&edge_port->mutex);
+}
+
+
 /*****************************************************************************
  * process_rcvd_data
  *	this function handles the data received on the bulk in pipe.
@@ -2415,9 +2432,12 @@ static void edge_set_termios(struct tty_struct *tty, struct usb_serial_port *por
 
 	/* set up the MCR register and send it to the EdgePort */
 	mutex_lock(&edge_port->mutex);
-	edge_port->shadowMCR = MCR_MASTER_IE;
-	if (cflag & CBAUD)
-		edge_port->shadowMCR |= (MCR_DTR | MCR_RTS);
+	if (cflag & CBAUD) {
+		if (old_termios && (old_termios->c_cflag & CBAUD) == B0)
+			edge_port->shadowMCR |= MCR_DTR | MCR_RTS;
+	} else {
+		edge_port->shadowMCR &= ~(MCR_DTR | MCR_RTS);
+	}
 
 	status = send_cmd_write_uart_register(edge_port, MCR,
 						edge_port->shadowMCR);
@@ -2959,6 +2979,7 @@ static struct usb_serial_driver edgeport_2port_device = {
 	.tiocmset		= edge_tiocmset,
 	.tiocmiwait		= usb_serial_generic_tiocmiwait,
 	.get_icount		= usb_serial_generic_get_icount,
+	.dtr_rts		= edge_dtr_rts,
 	.write			= edge_write,
 	.write_room		= edge_write_room,
 	.chars_in_buffer	= edge_chars_in_buffer,
@@ -2993,6 +3014,7 @@ static struct usb_serial_driver edgeport_4port_device = {
 	.tiocmset		= edge_tiocmset,
 	.tiocmiwait		= usb_serial_generic_tiocmiwait,
 	.get_icount		= usb_serial_generic_get_icount,
+	.dtr_rts		= edge_dtr_rts,
 	.write			= edge_write,
 	.write_room		= edge_write_room,
 	.chars_in_buffer	= edge_chars_in_buffer,
@@ -3027,6 +3049,7 @@ static struct usb_serial_driver edgeport_8port_device = {
 	.tiocmset		= edge_tiocmset,
 	.tiocmiwait		= usb_serial_generic_tiocmiwait,
 	.get_icount		= usb_serial_generic_get_icount,
+	.dtr_rts		= edge_dtr_rts,
 	.write			= edge_write,
 	.write_room		= edge_write_room,
 	.chars_in_buffer	= edge_chars_in_buffer,
@@ -3061,6 +3084,7 @@ static struct usb_serial_driver epic_device = {
 	.tiocmset		= edge_tiocmset,
 	.tiocmiwait		= usb_serial_generic_tiocmiwait,
 	.get_icount		= usb_serial_generic_get_icount,
+	.dtr_rts		= edge_dtr_rts,
 	.write			= edge_write,
 	.write_room		= edge_write_room,
 	.chars_in_buffer	= edge_chars_in_buffer,
-- 
2.55.0

