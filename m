Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592151;
	b=26PexLDrxsSet09Wkern8kJRD0ImjXNqoKAaiKj9M2QZWMmRbdTf7dxDLltUXmF+usJz
	 RHTgvzma1lxFxi+pG1cDlTibMliyxMQegdEMSaSHxO+6niJq3J7AiRWzjHtpzS/5KGoIl
	 rSNso/729t8VwUhSnnROZ+nDy/KvKE0J9NDHziJXpzmIclpugRAfBWJIBzs6Sh7C9GGxB
	 jqqq9g0gJGCfxlujadld+SzSZqgJhx49051W7SxxQhudxszE2ujnXO1A3GJihlJb6Ik1q
	 HG/Z4pB4VSk65WbzVUj/Z48RsKX03xpq61kibRMs5zH0hF5kQ82fqQSon1jwpdlg/Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592151;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AVo5n34JcS5b+jUZxPLsN2A7N/H9JeHyTh1W8GoeiG0=;
	b=dUVFz9ByUU2UWxMmgjRP7EoM+YziHbrhkIKcNnMbHCnoKtcwDfpPTIHJ9voo8ozpT6o+
	 x6hwoOfhbBqXXzID2oCJefquUfafrEXv/sNx24XuMwyO0uPjlpyxvJtOe0kp/3I4f+biX
	 3beYXBbiD5wRZRjT80kvvsfbbObc8BXWEWt0GVy6LSA9YfdYrqT0Shjiau1eh6t2qWuvQ
	 kX/IWLmQXcl/QYPBN7mRq8ioWz6k84i8F7spH+wveRSsb6tBZhA1Odlqf0URpJHdIk17w
	 wJE1OVmsoaPK3QReHG/tEhkk9ufqvQ6gAGgSat//cmLrr7rCxy3KqWaXYCbExrDS5eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4hc60Ar;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EF3606A32C;
	Wed, 21 Oct 2026 14:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4hc60Ar
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332E11F000D4;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592150;
	bh=AVo5n34JcS5b+jUZxPLsN2A7N/H9JeHyTh1W8GoeiG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l4hc60ArEBLYzkx12gAUamkfAesvha5UwumjMJ1camZwKvFT2Ta5MDY9vSmLUVU78
	 ax9CkRmxbcms7nBAMibfZ5ZhXHBjNfI08N6IbGx3NbNlmPVe06rOR+ekDCf83KzX74
	 gP8D+ALplsVYzNHJB8uBgIKlqyRDTomyxEWBNQkt/SIlyrPRkjuih0MJetXrc/sxvu
	 MUolofNu6U27LSfXohLCiAv9+Ar3UCcAunvQkIaUcexflNUSQwcguxZW0lCOMDpO7Q
	 5WnrwL/PQBTLB0qVvWfHCI78sqvFgjQ9ucjAAtH7pZnrjdRdFvXE3IVYeJbA83jUxr
	 mIWdzMWz32XdA==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJX6Z-00000009kqN-2aiA;
	Wed, 21 Oct 2026 16:15:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] USB: serial: io_edgeport: move initial termios update to open()
Date: Wed, 21 Oct 2026 16:11:51 +0200
Message-ID: <20261021141154.2324793-9-johan@kernel.org>
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

Explicitly update the terminal settings on open() instead of doing so
from the interrupt completion handler when receiving an open command
response, which in theory can be received after a failed open attempt.

Note that this will also allow for switching to synchronous commands.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 56 ++++++--------------------------
 1 file changed, 10 insertions(+), 46 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index cccdcfb203e1..acaac342f43f 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -282,8 +282,7 @@ static void handle_new_lsr(struct edgeport_port *edge_port, __u8 lsrData,
 static int  send_iosp_ext_cmd(struct edgeport_port *edge_port, __u8 command,
 				__u8 param);
 static int  calc_baud_rate_divisor(struct device *dev, int baud_rate, int *divisor);
-static void change_port_settings(struct tty_struct *tty,
-				struct edgeport_port *edge_port,
+static void edge_set_termios(struct tty_struct *tty, struct usb_serial_port *port,
 				const struct ktermios *old_termios);
 static int  send_cmd_write_uart_register(struct edgeport_port *edge_port,
 				__u8 regNum, __u8 regValue);
@@ -925,6 +924,9 @@ static int edge_open(struct tty_struct *tty, struct usb_serial_port *port)
 		return -ENOMEM;
 	}
 
+	if (tty)
+		edge_set_termios(tty, port, NULL);
+
 	spin_lock_irq(&edge_port->ep_lock);
 	edge_port->open = true;
 	spin_unlock_irq(&edge_port->ep_lock);
@@ -1418,22 +1420,6 @@ static void edge_unthrottle(struct tty_struct *tty)
 }
 
 
-/*****************************************************************************
- * SerialSetTermios
- *	this function is called by the tty driver when it wants to change
- * the termios structure
- *****************************************************************************/
-static void edge_set_termios(struct tty_struct *tty,
-			     struct usb_serial_port *port,
-			     const struct ktermios *old_termios)
-{
-	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
-
-	/* change the port settings to the new ones specified */
-	change_port_settings(tty, edge_port, old_termios);
-}
-
-
 /*****************************************************************************
  * get_lsr_info - get line status register info
  *
@@ -1727,7 +1713,6 @@ static void process_rcvd_status(struct edgeport_serial *edge_serial,
 {
 	struct usb_serial_port *port;
 	struct edgeport_port *edge_port;
-	struct tty_struct *tty;
 	struct device *dev;
 	__u8 code = edge_serial->rxStatusCode;
 	unsigned long flags;
@@ -1787,15 +1772,6 @@ static void process_rcvd_status(struct edgeport_serial *edge_serial,
 		spin_unlock_irqrestore(&edge_port->ep_lock, flags);
 		handle_new_msr(edge_port, byte2);
 
-		/* send the current line settings to the port so we are
-		   in sync with any further termios calls */
-		tty = tty_port_tty_get(&edge_port->port->port);
-		if (tty) {
-			change_port_settings(tty,
-				edge_port, &tty->termios);
-			tty_kref_put(tty);
-		}
-
 		/* we have completed the open */
 		edge_port->openPending = false;
 		wake_up(&edge_port->wait_open);
@@ -2307,18 +2283,12 @@ static int send_cmd_write_uart_register(struct edgeport_port *edge_port,
 }
 
 
-/*****************************************************************************
- * change_port_settings
- *	This routine is called to set the UART on the device to match the
- *	specified new settings.
- *****************************************************************************/
-
-static void change_port_settings(struct tty_struct *tty,
-	struct edgeport_port *edge_port, const struct ktermios *old_termios)
+static void edge_set_termios(struct tty_struct *tty, struct usb_serial_port *port,
+		const struct ktermios *old_termios)
 {
-	struct device *dev = &edge_port->port->dev;
-	struct edgeport_serial *edge_serial =
-			usb_get_serial_data(edge_port->port->serial);
+	struct edgeport_serial *edge_serial = usb_get_serial_data(port->serial);
+	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
+	struct device *dev = &port->dev;
 	int baud;
 	unsigned cflag;
 	__u8 mask = 0xff;
@@ -2329,12 +2299,6 @@ static void change_port_settings(struct tty_struct *tty,
 	__u8 txFlow;
 	int status;
 
-	if (!edge_port->open &&
-	    !edge_port->openPending) {
-		dev_dbg(dev, "%s - port not opened\n", __func__);
-		return;
-	}
-
 	cflag = tty->termios.c_cflag;
 
 	switch (cflag & CSIZE) {
@@ -2470,7 +2434,7 @@ static void change_port_settings(struct tty_struct *tty,
 
 	dev_dbg(dev, "%s - baud rate = %d\n", __func__, baud);
 	status = send_cmd_write_baud_rate(edge_port, baud);
-	if (status == -1) {
+	if (status == -1 && old_termios) {
 		/* Speed change was not possible - put back the old speed */
 		baud = tty_termios_baud_rate(old_termios);
 		tty_encode_baud_rate(tty, baud, baud);
-- 
2.55.0

