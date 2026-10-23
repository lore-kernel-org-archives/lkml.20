Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757816;
	b=3A5ewMv7i5uceMJ0LTstbFiWdmSUlw923XsrhEELEdma6xmy+Tx7c29UI4iK9WSRoA5h
	 YUOgvwIcJZPcXiiHMk9tSqsQt93X5l+qpf9vT1xGp/i/fOMdmUXm5umoxdXhuTuhseX4B
	 rpwYHSMR9aHvri3QuvlKZFkVg0XbD5f3Ar+UkZuzimYAGrJ0j8whWsPect8Lfs8jxefGB
	 DwL3xc6X69oTRe7jDrHOptMhQdjw831XjCAfld4JsdtyvK1CwuRHurdAVnwlDc5LIrEO7
	 NLFpvazyBrUc0bApEovRuEzAwlDksbFjg/+mfquL4Q1l+p8Am6r5j/v/OXRrdEMpxIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757816;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X2plfG3XTbTHe0zFpTJ4P2j54Ro3XfAJZnVjCjb8E3g=;
	b=wYhGTK7uzW3/nDkeIZovNuNHdM+ZoIokbao83uWXfxpIaUnFvdoWn0ZPtKq2YmThkI4M
	 YeyLHEhe0eXawMTBuw4D/lY4b3TvuiH4PPsbVJ38rQiFKyHkgXWqs1PipUsusARCsHRPE
	 xVMyQ49bBDlucHEcekzkprZ3rSfa3HV8iHUTsnNkfc4EKZ4CyWja1a9CYGTgF6BcR+Q+9
	 SdaDWsGvXPWN1b8gsAJ7dYCptvjas/Bd6Ee+hH2EMb6rl+JfiG6W0xhbbnHuu+sriBXi5
	 Wl8fKl90GUDahEYpyJ27AV3g4YUDuYLgjLFjqXry+P+eS1MPMOGkGvbuVQOOByMxdDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtBufDS+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B730D606A31E;
	Fri, 23 Oct 2026 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtBufDS+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B37C1F031E0;
	Fri, 23 Oct 2026 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792757815;
	bh=X2plfG3XTbTHe0zFpTJ4P2j54Ro3XfAJZnVjCjb8E3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dtBufDS+Qazi6mdhcaBTanP+ngx1ybDfkwDyr1mOyTxOml1g6JIFrg2EcpsKLKXZ0
	 kCFQVcqRKccLXN1p/JIbyIkUisqZNpquMqWqnlEHf2UejM73lpn03gnIaTyqw5sT0l
	 6nbTf4rQXJnxo2Brcm6+YJCZLH0ZS7s8qDeJlNBMCMBDLeEOAUVaPvLwv2dFktkbTe
	 a/KNsKRg3tQgFbKkftN6MFxhxbKb3gheetufJZxsUKtz9vFUC5yyFQwVd8nSoEqDgP
	 oBTNljWFawDCdfbMvfLqM0aNpmaW9f/bIWbxHi6pRWOk8gf66GxQtUYeFdXf9OZCmB
	 wSwd259d6BNTw==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xKECb-00000000mZd-0gKt;
	Fri, 23 Oct 2026 14:16:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/12] USB: serial: io_edgeport: drop redundant sanity checks
Date: Fri, 23 Oct 2026 14:15:26 +0200
Message-ID: <20261023121530.186541-9-johan@kernel.org>
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

The serial and port driver data is allocated at probe() before
registering the ports and will never be NULL when open(), close(),
write(), throttle() and unthrottle() are called.

Drop the redundant driver data sanity checks.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index 0fd68faa8427..d00fc99d13dd 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -810,20 +810,13 @@ static void edge_bulk_out_cmd_callback(struct urb *urb)
 static int edge_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
 	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
+	struct usb_serial *serial = port->serial;
+	struct edgeport_serial *edge_serial = usb_get_serial_data(serial);
 	struct device *dev = &port->dev;
-	struct usb_serial *serial;
-	struct edgeport_serial *edge_serial;
 	int response;
 
-	if (edge_port == NULL)
-		return -ENODEV;
-
 	/* see if we've set up our endpoint info yet (can't set it up
 	   in edge_startup as the structures were not set up at that time.) */
-	serial = port->serial;
-	edge_serial = usb_get_serial_data(serial);
-	if (edge_serial == NULL)
-		return -ENODEV;
 	if (edge_serial->interrupt_in_buffer == NULL) {
 		struct usb_serial_port *port0 = serial->port[0];
 
@@ -1052,15 +1045,10 @@ static void block_until_tx_empty(struct edgeport_port *edge_port)
  *****************************************************************************/
 static void edge_close(struct usb_serial_port *port)
 {
-	struct edgeport_serial *edge_serial;
-	struct edgeport_port *edge_port;
+	struct edgeport_serial *edge_serial = usb_get_serial_data(port->serial);
+	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
 	int status;
 
-	edge_serial = usb_get_serial_data(port->serial);
-	edge_port = usb_get_serial_port_data(port);
-	if (edge_serial == NULL || edge_port == NULL)
-		return;
-
 	/* block until tx is empty */
 	block_until_tx_empty(edge_port);
 
@@ -1125,9 +1113,6 @@ static int edge_write(struct tty_struct *tty, struct usb_serial_port *port,
 	int secondhalf;
 	unsigned long flags;
 
-	if (edge_port == NULL)
-		return -ENODEV;
-
 	/* get a pointer to the Tx fifo */
 	fifo = &edge_port->txfifo;
 
@@ -1384,9 +1369,6 @@ static void edge_throttle(struct tty_struct *tty)
 	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
 	int status;
 
-	if (edge_port == NULL)
-		return;
-
 	if (!edge_port->open) {
 		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
 		return;
@@ -1424,9 +1406,6 @@ static void edge_unthrottle(struct tty_struct *tty)
 	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
 	int status;
 
-	if (edge_port == NULL)
-		return;
-
 	if (!edge_port->open) {
 		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
 		return;
-- 
2.55.0

