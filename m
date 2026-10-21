Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592150;
	b=rOFnokAS7j4t6GDAKTlBC8zL/KFwmXM9M+aBQ68f4w4Lxr9OKkIFHlcnJS4OxTN7W6+d
	 eJLTT6bkCRrWoy1646O32ewsQ7XwihlQOydEEbitm0ka5Ujyeb/nlh58qgNCyUDQGyv5u
	 NI1+pQZgFDxRbhors2MVsB0O5/9gUYD0VmsaTUFalpoKw9+fk8ajmHvNCSEgfPy8YWCEO
	 g8E75nTLDAU0GQtMFab568q527tXnvdW4xt/yLgXmohg4upkVUt3+imm333U0oGt/QBo+
	 FzLgANwwIol3WghAjq1v7RPW2JP+4xBMPjHaQeDbinUAoiObmBvqZHt+h16dbuDf7uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592150;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LsO54+owSw/XwvVHowlz9SRsM48E7KR7rSRiJ6MNDfw=;
	b=c3FuVefRX104CHydIlj3EGdNo8djLpmbm8AoNfAnXuBGjT7APPnXFFpZkpqXpjBULbH6
	 QzMdhY9D6X1Q+jMa4WeVyQNt9LXxzcFz1GNR7Rfg1QopPu+F2xXopBywEuRk1ZmmksY6e
	 jgTcInKQdcyKFtbdH1NLcwhyOq6yn1ToyNEGAhctNTAHeLiAOd/dI9ELYhpOOBoRape0p
	 AqzQlfIUdVlIOn2e0g4exfd804nmuTf0EM2U7uM6TMLFxq+iY5EMLs1lBeX/20VL5xBJ6
	 yOAs2LN3+jXCHLQmbh4qsSNWkH9GT6+cxxeljXGj8USwttiGOZfSj01t/QUkmpzSchA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YBefnMEL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76932606A31F;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YBefnMEL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FA91F000C6;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592150;
	bh=LsO54+owSw/XwvVHowlz9SRsM48E7KR7rSRiJ6MNDfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YBefnMEL+YHYH+DgxZT+cqtRKJ7w6bpykWofbjOfMK8HP/wRGSUpXL2bcC21J2+Q5
	 zGXJq2Lz3McYTSzzUZl6lY2Xhuj4RN+dp8KIwnURuzUfBfplBhH2r+GzFPRpxy4gkk
	 b8rJiunlPogKP9D0wGoyKHWuHOR2NgcRYF/G30oLkO/ReaA+bS9PWk60CX+YcKWab3
	 BUsYPP+PNqZ7XHksirgzChB4rG380E/0kDeUyjdxqpbTMhUEtDtC0PO1DRa8NijFrh
	 9E9SRpQlmsO+3MEZStOb97q0McJkUMuKsRkrHtbS8Va0LWW0so/WKqJOHpMcMLOJKG
	 EGiyOF7xG5EFg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJX6Z-00000009kqU-2iav;
	Wed, 21 Oct 2026 16:15:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] USB: serial: io_edgeport: switch to synchronous commands
Date: Wed, 21 Oct 2026 16:11:54 +0200
Message-ID: <20261021141154.2324793-12-johan@kernel.org>
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

With the line settings no longer being updated from the interrupt
completion handler command requests can be made synchronous as is
generally expected.

Note that the five second timeout matches the timeout used by the
original (ifdeffed) synchronous handling (see commmit 421ae6e3db69
("USB: io_edgeport: remove unused defines")).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 86 ++++----------------------------
 1 file changed, 9 insertions(+), 77 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index fbb8249bb5b7..3f04898a7cf2 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -52,6 +52,7 @@
 #define MAX_NAME_LEN		64
 
 #define OPEN_TIMEOUT		(5*HZ)		/* 5 seconds */
+#define EDGE_CMD_TIMEOUT	(5 * HZ)
 
 static const struct usb_device_id edgeport_2port_id_table[] = {
 	{ USB_DEVICE(USB_VENDOR_ID_ION, ION_DEVICE_ID_EDGEPORT_2) },
@@ -181,7 +182,6 @@ struct edgeport_port {
 
 	bool			open;
 	bool			openPending;
-	bool			commandPending;
 	bool			closePending;
 	bool			chaseResponsePending;
 
@@ -262,9 +262,6 @@ static const struct divisor_table_entry divisor_table[] = {
 	{   230400,	1},
 };
 
-/* Number of outstanding Command Write Urbs */
-static atomic_t CmdUrbs = ATOMIC_INIT(0);
-
 
 /* function prototypes */
 
@@ -766,44 +763,6 @@ static void edge_bulk_out_data_callback(struct urb *urb)
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
-	atomic_dec(&CmdUrbs);
-	dev_dbg(dev, "%s - FREE URB %p (outstanding %d)\n", __func__, urb,
-		atomic_read(&CmdUrbs));
-
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
@@ -2105,49 +2064,22 @@ static int send_iosp_ext_cmd(struct edgeport_port *edge_port,
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
-	atomic_inc(&CmdUrbs);
-	dev_dbg(dev, "%s - ALLOCATE URB %p (outstanding %d)\n",
-		__func__, urb, atomic_read(&CmdUrbs));
-
-	usb_fill_bulk_urb(urb, edge_serial->serial->dev,
-			usb_sndbulkpipe(edge_serial->serial->dev,
-					edge_serial->bulk_out_endpoint),
-			buffer, length, edge_bulk_out_cmd_callback, edge_port);
-
-	edge_port->commandPending = true;
-	status = usb_submit_urb(urb, GFP_KERNEL);
+	status = usb_bulk_msg(serial->dev,
+			usb_sndbulkpipe(serial->dev, edge_serial->bulk_out_endpoint),
+			buffer, length, NULL, EDGE_CMD_TIMEOUT);
 	if (status) {
-		/* something went wrong */
-		dev_err(dev, "%s - usb_submit_urb(write command) failed, status = %d\n",
-			__func__, status);
-		usb_free_urb(urb);
-		atomic_dec(&CmdUrbs);
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
 
 
-- 
2.55.0

