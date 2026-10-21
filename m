Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592151;
	b=sAIOuGzNhl4fNelAunpFv+X7GA/HMOUoiAsElSZH8vuWnRrs+yVw+kwG+eXA38XyNyt+
	 NJl83mbSMpAyVpDt10hwhiuzZ69rdWFpsrro4b8rMRyqZf0TMcqj2bDnCLTuw000pFvFS
	 +KdsC0BnQBQDYYmanBu89lSC2fPJ8flxTdQmJISdkY4k++3lj7AUks+gTSI27hqX+aKoR
	 9nuOo7iF2RSe9qGSHWMV9N0nBkAsJI+MhC5Cpu1gFcgLDwbmSdcj4zH7tmGS0EEMXW/dS
	 Kp28QgnTswdJj8xAJaWB6JYbrXhmkqqTgH8LF/OFTxMVvAfdhdJX2o8fXtD8ptQkyFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592151;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Gz7UrjJs3r7Gx9XHhBG98l/jwVwK6E9OfMtd9P0C8pQ=;
	b=w3+Wr3QNRbCQnnK1//S+59c4hlMj0NDJC6OsrzoCRvLWl+hE7KzwaUgcqytY/CBaCTK7
	 6fhc8SQQ1/TcRfzqeVZCuRGORge+roJuqboMuBdpfLNl99j34bdkaqlDNUtWgvnG9wZO8
	 YUFRYDT+a68nC9xPtM3CLtif/EmKxOtZ6aXuJquV1beVOMMX3LWbQ9szD+1B4/5+5Didu
	 IE5HRnHfh1Yj+RojNT4egJyXkDhMGkVegqy/9wyILRcuFNi2q0ySmSiW/czUV66bKmhPm
	 SKbsLTXrP+BMOhf7+MsDbaC6pUQddB4Z4Gwicd57p6Lhi9HQZGDSThW8ROz1/1St8dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojCPn0DL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76899606A31E;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojCPn0DL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C251F000C7;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592150;
	bh=Gz7UrjJs3r7Gx9XHhBG98l/jwVwK6E9OfMtd9P0C8pQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ojCPn0DLtSG/OsoacQHUSGMzC5XFFwcIAdHc48tAt1SXJ+KKDOR/s8ItW461K59O6
	 Q8gTeHgNEOyMcqymLK2HrobxTYPbB0BbUoxhtJYpQ1vvl4il5Bro+L4TV0ifETqYhB
	 iUb6YMrta6+pf1RbtrdPFwem8z4PJ5D5gXiWkp8FOcAG7eE/CU9WAjW9k89q/uzfgU
	 3PhMYyvY0RwXi8q5ViemTjKP4j1DudGb/rKq2JTrmUFG/YcKhlJYY2q0nIgq5uz/yG
	 QIL7RSh/cXXIVKrIGC99vn/3CIVczolAEpk+lSxcRxb3OLgJS2qjLC3L3AN4deIrWx
	 4yo0QKCfChBQQ==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJX6Z-00000009kqJ-2VkF;
	Wed, 21 Oct 2026 16:15:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] USB: serial: io_edgeport: drop redundant sanity checks
Date: Wed, 21 Oct 2026 16:11:49 +0200
Message-ID: <20261021141154.2324793-7-johan@kernel.org>
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

The serial and port driver data is allocated at probe() before
registering the ports and will never be NULL when open(), close(),
write(), throttle() and unthrottle() are called.

Drop the redundant driver data sanity checks.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index 0b50c6b99b0a..b8e78c749f9c 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -818,20 +818,13 @@ static void edge_bulk_out_cmd_callback(struct urb *urb)
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
 
@@ -1058,15 +1051,10 @@ static void block_until_tx_empty(struct edgeport_port *edge_port)
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
 
@@ -1130,9 +1118,6 @@ static int edge_write(struct tty_struct *tty, struct usb_serial_port *port,
 	int secondhalf;
 	unsigned long flags;
 
-	if (edge_port == NULL)
-		return -ENODEV;
-
 	/* get a pointer to the Tx fifo */
 	fifo = &edge_port->txfifo;
 
@@ -1383,9 +1368,6 @@ static void edge_throttle(struct tty_struct *tty)
 	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
 	int status;
 
-	if (edge_port == NULL)
-		return;
-
 	if (!edge_port->open) {
 		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
 		return;
@@ -1423,9 +1405,6 @@ static void edge_unthrottle(struct tty_struct *tty)
 	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
 	int status;
 
-	if (edge_port == NULL)
-		return;
-
 	if (!edge_port->open) {
 		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
 		return;
@@ -1460,9 +1439,6 @@ static void edge_set_termios(struct tty_struct *tty,
 {
 	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
 
-	if (edge_port == NULL)
-		return;
-
 	if (!edge_port->open) {
 		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
 		return;
-- 
2.55.0

