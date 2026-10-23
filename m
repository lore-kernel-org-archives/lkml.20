Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757816;
	b=sklxG/nTlysm9TCrA4cq3LKhvVgJvvGubz5s5Z+4BaIAvILqDk5mVC/rDfuYansZaRjz
	 B3dWJBuwW6iMdkTaKWE8rAYCTM0oWL7wRu97ARijpHLoNu2aEriqBP484593zGLW3lzRx
	 92IEbj95khQuu4h00U+F2zo+G5YXFIT/t0vqde4gUZh77/w6+kH9gljSywlo9ft+6fe4z
	 aHidtHipNja7zBH3vTudZF3eoyRxorE/R/gnZXLilp0h3+m+lz4PI00PmirJQZWDap1Ri
	 4D6wlfd6Fot9GtfwtybC3+l7orYfvj8qEWiLLYFOIaZrajqH3tBKkCPxUuF95vXH0xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757816;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w3fbseOoIcm1H3+Md6Kt95ZxF1bYrHB6PGESXSHRWeI=;
	b=uT9a0r7tVFBobkauQt+sGpG4H0b9O9dk3CwT/09biixtsaHFEfikBFOPxWwSU0Df7R/o
	 PLGGGbPLo9S3DAqNaD6ILVGW8VcU55HI3+Wfy82MPzHLPQcrqAHoRWCnJmWd/rit+pdoe
	 dm2On3EwACSYVi/Y7CMIkbyhLn3xtl5pFasDvPurDBKWY/Brg+9HXKHyCLGo2o3+LthaE
	 7Zra83s1HVxFDbM+XWmtbbD2tHi7v+YQjMW/rj/2j/rqV/w0k4TtyQsQLKrG+A78/Dpfk
	 HyN2ZuYXqkwXu/N1NvsUg0Lc/ls7jJhnYEBF/omqBctC0Icml1bhfojifbrowbfmEKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otWqsZsx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71A5606A31B;
	Fri, 23 Oct 2026 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otWqsZsx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C1D1F01825;
	Fri, 23 Oct 2026 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792757815;
	bh=w3fbseOoIcm1H3+Md6Kt95ZxF1bYrHB6PGESXSHRWeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=otWqsZsx9yMNWxA5OyTw62JeNMQumOupaNAY/oQD6+ULQfwSBwg4Fg7ZO/Yjf/bOb
	 HEKY9Pq6qunLZbZqov4+fk99dCQWn4q0Nsc4cJb3gTpu6KSoR5M/PJmHdcBaxXBW9P
	 lyYcmmiyoJg20i0qb/IpISNzS7sNZDg6ikU1ykyISATtDFHZ6UueZF4a1IWZvHrxUs
	 1WP2dl/1BQ0f0QPbZ0WsUbKQ1UvFoehxA2v0pU2jQbS69Tlzyb4g30vuck9AFX559f
	 uiU+PSMoT8YodT5X/KOtNAC77FqwAX4Dt0qunk13+ArgY27A0SGjhAnguNmGTfT53M
	 WnZKEJ02IwEqg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xKECb-00000000mZq-0tEH;
	Fri, 23 Oct 2026 14:16:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/12] USB: serial: io_edgeport: switch to synchronous commands
Date: Fri, 23 Oct 2026 14:15:30 +0200
Message-ID: <20261023121530.186541-13-johan@kernel.org>
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

With the line settings no longer being updated from the interrupt
completion handler command requests can be made synchronous as is
generally expected (e.g. so that ioctls do not return until the request
has at least reached the device).

Note that the five second timeout matches the timeout used by the
original (ifdeffed) synchronous handling (see commmit 421ae6e3db69
("USB: io_edgeport: remove unused defines")).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 99 +++++---------------------------
 1 file changed, 15 insertions(+), 84 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index d47c2295a7cf..5a830483a22e 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -52,6 +52,7 @@
 #define MAX_NAME_LEN		64
 
 #define OPEN_TIMEOUT		(5*HZ)		/* 5 seconds */
+#define EDGE_CMD_TIMEOUT	5000		/* milliseconds */
 
 static const struct usb_device_id edgeport_2port_id_table[] = {
 	{ USB_DEVICE(USB_VENDOR_ID_ION, ION_DEVICE_ID_EDGEPORT_2) },
@@ -181,13 +182,11 @@ struct edgeport_port {
 
 	bool			open;
 	bool			openPending;
-	bool			commandPending;
 	bool			closePending;
 	bool			chaseResponsePending;
 
 	wait_queue_head_t	wait_chase;		/* for handling sleeping while waiting for chase to finish */
 	wait_queue_head_t	wait_open;		/* for handling sleeping while waiting for open to finish */
-	wait_queue_head_t	wait_command;		/* for handling sleeping while waiting for command to finish */
 
 	struct usb_serial_port	*port;			/* loop back to the owner of this object */
 };
@@ -226,7 +225,6 @@ struct edgeport_serial {
 	__u8			rxStatusParam;			/* the receive status parameter */
 	__s16			rxBytesRemaining;		/* the number of port bytes left to read */
 	struct usb_serial	*serial;			/* loop back to the owner of this object */
-	struct usb_anchor	cmd_anchor;
 };
 
 /* baud rate information */
@@ -764,39 +762,6 @@ static void edge_bulk_out_data_callback(struct urb *urb)
 }
 
 
-/*****************************************************************************
- * BulkOutCmdCallback
- *	this is the callback function for when we have finished sending a
- *	command	on the bulk out endpoint.
- *****************************************************************************/
-static void edge_bulk_out_cmd_callback(struct urb *urb)
-{
-	struct edgeport_port *edge_port = urb->context;
-	struct device *dev = &urb->dev->dev;
-	int status = urb->status;
-
-	/* clean up the transfer buffer */
-	kfree(urb->transfer_buffer);
-
-	/* Free the command urb */
-	usb_free_urb(urb);
-
-	if (status) {
-		dev_dbg(dev, "%s - nonzero write bulk status received: %d\n",
-			__func__, status);
-		return;
-	}
-
-	/* tell the tty driver that something has changed */
-	if (edge_port->open)
-		tty_port_tty_wakeup(&edge_port->port->port);
-
-	/* we have completed the command */
-	edge_port->commandPending = false;
-	wake_up(&edge_port->wait_command);
-}
-
-
 /*****************************************************************************
  * Driver tty interface functions
  *****************************************************************************/
@@ -2089,10 +2054,8 @@ static int send_iosp_ext_cmd(struct edgeport_port *edge_port,
 			 command, param);
 
 	status = write_cmd_usb(edge_port, buffer, length);
-	if (status) {
-		/* something bad happened, let's free up the memory */
-		kfree(buffer);
-	}
+
+	kfree(buffer);
 
 	return status;
 }
@@ -2105,46 +2068,22 @@ static int send_iosp_ext_cmd(struct edgeport_port *edge_port,
 static int write_cmd_usb(struct edgeport_port *edge_port,
 					unsigned char *buffer, int length)
 {
-	struct edgeport_serial *edge_serial =
-				usb_get_serial_data(edge_port->port->serial);
+	struct usb_serial *serial = edge_port->port->serial;
+	struct edgeport_serial *edge_serial = usb_get_serial_data(serial);
 	struct device *dev = &edge_port->port->dev;
-	int status = 0;
-	struct urb *urb;
+	int status;
 
 	usb_serial_debug_data(dev, __func__, length, buffer);
 
-	/* Allocate our next urb */
-	urb = usb_alloc_urb(0, GFP_KERNEL);
-	if (!urb)
-		return -ENOMEM;
-
-	usb_fill_bulk_urb(urb, edge_serial->serial->dev,
-			usb_sndbulkpipe(edge_serial->serial->dev,
-					edge_serial->bulk_out_endpoint),
-			buffer, length, edge_bulk_out_cmd_callback, edge_port);
-
-	edge_port->commandPending = true;
-	usb_anchor_urb(urb, &edge_serial->cmd_anchor);
-	status = usb_submit_urb(urb, GFP_KERNEL);
+	status = usb_bulk_msg(serial->dev,
+			usb_sndbulkpipe(serial->dev, edge_serial->bulk_out_endpoint),
+			buffer, length, NULL, EDGE_CMD_TIMEOUT);
 	if (status) {
-		/* something went wrong */
-		dev_err(dev, "%s - usb_submit_urb(write command) failed, status = %d\n",
-			__func__, status);
-		usb_unanchor_urb(urb);
-		usb_free_urb(urb);
+		dev_err(dev, "failed to send command: %d\n", status);
 		return status;
 	}
 
-#if 0
-	wait_event(&edge_port->wait_command, !edge_port->commandPending);
-
-	if (edge_port->commandPending) {
-		/* command timed out */
-		dev_dbg(dev, "%s - command timed out\n", __func__);
-		status = -EINVAL;
-	}
-#endif
-	return status;
+	return 0;
 }
 
 
@@ -2200,10 +2139,8 @@ static int send_cmd_write_baud_rate(struct edgeport_port *edge_port,
 						edge_port->shadowLCR);
 
 	status = write_cmd_usb(edge_port, cmdBuffer, cmdLen);
-	if (status) {
-		/* something bad happened, let's free up the memory */
-		kfree(cmdBuffer);
-	}
+
+	kfree(cmdBuffer);
 
 	return status;
 }
@@ -2287,10 +2224,8 @@ static int send_cmd_write_uart_register(struct edgeport_port *edge_port,
 			   regNum, regValue);
 
 	status = write_cmd_usb(edge_port, cmdBuffer, cmdLen);
-	if (status) {
-		/* something bad happened, let's free up the memory */
-		kfree(cmdBuffer);
-	}
+
+	kfree(cmdBuffer);
 
 	return status;
 }
@@ -2688,7 +2623,6 @@ static int edge_startup(struct usb_serial *serial)
 
 	spin_lock_init(&edge_serial->es_lock);
 	edge_serial->serial = serial;
-	init_usb_anchor(&edge_serial->cmd_anchor);
 	usb_set_serial_data(serial, edge_serial);
 
 	/* get the name for the device from the device */
@@ -2893,8 +2827,6 @@ static void edge_disconnect(struct usb_serial *serial)
 {
 	struct edgeport_serial *edge_serial = usb_get_serial_data(serial);
 
-	usb_kill_anchored_urbs(&edge_serial->cmd_anchor);
-
 	if (edge_serial->is_epic) {
 		usb_kill_urb(edge_serial->interrupt_read_urb);
 		usb_kill_urb(edge_serial->read_urb);
@@ -2936,7 +2868,6 @@ static int edge_port_probe(struct usb_serial_port *port)
 
 	init_waitqueue_head(&edge_port->wait_open);
 	init_waitqueue_head(&edge_port->wait_chase);
-	init_waitqueue_head(&edge_port->wait_command);
 
 	edge_port->port = port;
 
-- 
2.55.0

