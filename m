Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757817;
	b=hdTdkaiGPfx0aH/AZfrO+NO6Z0BqCnnSsLvffRBHwDXna4Q6ba0loqhOa4Je9E4n3b4F
	 fEIE0N1eNCusW3QDelG/l8s+pJ1l7MTQcQwXKyHon2exrJfYr/eeTS+blaaE4zkzxXqrv
	 JPR0jEX5G8KPhHX3xX1M3LBKAFnbjLhfFkZAmeO7pF7pqf6Fu2bPuFsvfUlyooIkl2Ugi
	 FJAwTwwSkQMz7Gnyb6c4cR2Mut8axigBj/kAM7P4m754vo+KOXYbEUFDuqyvqfHmCLDbX
	 OoANeRCM75/nM4s8aNbGWiRRAIxaYIlFFOtB8qyZ7+TRTQg35H3kiTRrfsvEhx2/OEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757817;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e+zY45yCcB9TTmMJtrjf6fRL4sM6D1hUjx7d3l7pAuQ=;
	b=w0QG7tEfqyfSPRAKNjShxw0wdmj1wRIzd/ACLL8u14yTWcxYFdx8b2IWWqF1z0Y1s1Y2
	 O3EAhsQSbAbDqZQR9T3TXlgLRf7SDtxsbnzqmiQvrt8+QEUIztBEWfqTrLyfptNiJQJOx
	 uKGeT3n0WCznbpiM+pUGPwJ9PQOyWaCHXU9rU93aJ57sKh24M0UaeTeXh+bqu/U4HlDWE
	 m2+HwQCFicLW9D2846YS7rtoPGdiU5X1Au9j1+UcIJWxOnCtQTqqRRz4kiXm+rPjuqgYz
	 v5FdFpmqPteBETcNKj6ZZA2+CwUnbMty0wzTqTOpVlfqUllgmlJ3iQeDwP+GVtiUz1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=or1qzbDk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804BB606A32F;
	Fri, 23 Oct 2026 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=or1qzbDk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6889A1F031E6;
	Fri, 23 Oct 2026 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792757815;
	bh=e+zY45yCcB9TTmMJtrjf6fRL4sM6D1hUjx7d3l7pAuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=or1qzbDk53e1+jhAY16o3Tre5fwPl5yNH6ShFsZLVzFQJ0H4wGkD76wZiM2RS0uOh
	 gF0NO67WxOJ4VGDAETO2S+F+97JwvnXi4ZhjuiFZT1Xs0S7bBUF+AHs0Q764IrjsHr
	 cEOjwz50j53Jc4wvSAwgCphx3wWEAxWjLJeX5/L7pKMCJ5Fyp4jAHeOFtJbsd//Ydu
	 lGLg72XbTyO9Y0D4VpNxo4QR3AWoVwYipeUk7ux0rshR61r9QOyMiw8f9qovQ5pewo
	 oEPVQXiixZVkpkqCaEpxYeO86cILk9xyVNBftfUyXvxev79HdCHZrWAUobZFg6ppie
	 XFUge0N72/qig==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xKECb-00000000mZk-0mnT;
	Fri, 23 Oct 2026 14:16:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/12] USB: serial: io_edgeport: deassert DTR/RTS on close() and B0
Date: Fri, 23 Oct 2026 14:15:28 +0200
Message-ID: <20261023121530.186541-11-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023121530.186541-1-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
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

The modem control signals DTR and RTS should be dropped on close() and
hangup if HUPCL is set and also when requesting B0, but the driver is
currently only asserting the signals on open().

Implement the missing dtr_rts() callback to handle open(), close() and
hangup while letting set_termios() handle B0 transitions.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index 566f0f1a1632..ebbe8c5370cd 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -1566,6 +1566,23 @@ static int edge_break(struct tty_struct *tty, int break_state)
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
@@ -2412,9 +2429,12 @@ static void edge_set_termios(struct tty_struct *tty, struct usb_serial_port *por
 
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

