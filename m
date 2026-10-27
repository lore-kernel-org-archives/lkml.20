Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119425;
	b=yo9uqyeJDc/J9SZOWYJOgzZygNIO56UluFGTjCXYBIFvaPP/mZYfNRE7seMGWxitXw3Y
	 Xp9RNeXVZo8sf7DJtw7FgjWQkzPTo0zO9JxuNBeJv9xOMMbF7HF1K9WuOulErGEdyBiDR
	 51Bptx+zabCEzCBkyBToHGF5gshcVGg+m7kB9hjVf+Fcv8uHpxucpT+OOsgOR56F9Oefb
	 8ntnexjt8/PPhZSBe6uAy+ehES0D4uxU1e4/VM5htTJoJzhOXEL9yu1Y1E3JvbgjL2lqk
	 NoGha+qsUW7iYd6vowoQLaR2Vajl0DWIcshqSQcQnpQ3yI5OrRvDG9Am+WiivgNKJtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119425;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=b2OEDXtRqaEOlUqjaone3ufJVoeRqYEu7QBdQlbNa1c=;
	b=ucrci4aHOdWcypvA2uEB46WR3kiJu0c7q8GeIye7NSxsvfUEYr60FyxtkWSF0cNuHQrg
	 e5gQWAX/06Hzj5B9pv0utRyZNQiWCVghPrplHXY7Y816HqeJ6YbQX4zeyDVVt90RwDpMS
	 AePtJoKi2nhOoFoFNSBERQcabtu5X/VrCJepk9UI75SRuIRZ6xJL74myL2bSc0Rpylkji
	 nZKpHfStbgIsVAjEGogdGBfveqGW2KNM3EcUJP7cOp9XRKPxnUd4nuI9+rZ8pQnOIPypY
	 gyP0HJW4ur1anlP5hRKi62gPiUX5QZVvdyYSHn+g0mjHgaufVXQmOay9Zfb274IfZbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fKDzbDup;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B94606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fKDzbDup
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8071F031E1;
	Tue, 27 Oct 2026 16:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793119425;
	bh=b2OEDXtRqaEOlUqjaone3ufJVoeRqYEu7QBdQlbNa1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fKDzbDupbtPhbiKEsDlei0VTwy0NLd03ul+nFH0NsyCbnp6JyM0q/HxI2DcIYIA8f
	 jSnbSbdsA4/0YVEm7ICs8wAtBY7KbNJYX2qfBaxydXNx5XrBhASjYPU4pmb31Ymm3C
	 6dysftvzuXsTce5LcXHsPwvO8caf7e4LzPjZ0ha4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:43:32 +0100
Subject: [PATCH 5/5] comedi: vmk80xx: report failed transfers of the K8061
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
Message-Id: <20261027-llm-char-misc-comedi-v1-5-1899771ee15b@linuxfoundation.org>
References: <20261027-llm-char-misc-comedi-v1-0-1899771ee15b@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-comedi-v1-0-1899771ee15b@linuxfoundation.org>
To: Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>, 
 Frank Mori Hess <fmhess@users.sourceforge.net>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=3225;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=twPdbasRyn1FcntLl5Y1sYSnS68oObpYb5l2jEyFfI8=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPrmyse6NTdS1jAs9Cc/k2gTdWtnzvtBmuTdB131vye
 73Wg9Y/HbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjARTQ6G+Tli/Qt9lpdVJKst
 Lj/ySD9cvUfjGcNc6b0G3pd+zP31O1tuYuJv2bY+Aw0NAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

For the K8061 board vmk80xx_read_packet() and vmk80xx_write_packet() call
vmk80xx_do_bulk_msg(), which ignores the result of its two bulk transfers,
and return 0. After a timeout, a stall or an unplug the instruction
handlers therefore go on and hand the old content of usb_rx_buf to user
space as a fresh sample (analog and digital inputs, counters, PWM and
output read-back), and writes to the outputs are reported as done.

All callers check the result already, because the K8055 branch of the two
functions returns that of usb_interrupt_msg(). Return the error of the
bulk transfers as well, and don't wait for an answer to a command that
could not be sent.

Fixes: 985cafccbf9b ("Staging: Comedi: vmk80xx: Add k8061 support")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/comedi/drivers/vmk80xx.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/comedi/drivers/vmk80xx.c b/drivers/comedi/drivers/vmk80xx.c
index 84dce5184a77..ddb12b48c8a4 100644
--- a/drivers/comedi/drivers/vmk80xx.c
+++ b/drivers/comedi/drivers/vmk80xx.c
@@ -151,7 +151,7 @@ struct vmk80xx_private {
 	enum vmk80xx_model model;
 };
 
-static void vmk80xx_do_bulk_msg(struct comedi_device *dev)
+static int vmk80xx_do_bulk_msg(struct comedi_device *dev)
 {
 	struct vmk80xx_private *devpriv = dev->private;
 	struct usb_device *usb = comedi_to_usb_dev(dev);
@@ -161,6 +161,7 @@ static void vmk80xx_do_bulk_msg(struct comedi_device *dev)
 	unsigned int rx_pipe;
 	size_t tx_size;
 	size_t rx_size;
+	int ret;
 
 	tx_addr = devpriv->ep_tx->bEndpointAddress;
 	rx_addr = devpriv->ep_rx->bEndpointAddress;
@@ -169,11 +170,13 @@ static void vmk80xx_do_bulk_msg(struct comedi_device *dev)
 	tx_size = usb_endpoint_maxp(devpriv->ep_tx);
 	rx_size = usb_endpoint_maxp(devpriv->ep_rx);
 
-	usb_bulk_msg(usb, tx_pipe, devpriv->usb_tx_buf, tx_size, NULL,
-		     PACKET_TIMEOUT);
+	ret = usb_bulk_msg(usb, tx_pipe, devpriv->usb_tx_buf, tx_size, NULL,
+			   PACKET_TIMEOUT);
+	if (ret)
+		return ret;
 
-	usb_bulk_msg(usb, rx_pipe, devpriv->usb_rx_buf, rx_size, NULL,
-		     PACKET_TIMEOUT);
+	return usb_bulk_msg(usb, rx_pipe, devpriv->usb_rx_buf, rx_size, NULL,
+			    PACKET_TIMEOUT);
 }
 
 static int vmk80xx_read_packet(struct comedi_device *dev)
@@ -183,10 +186,8 @@ static int vmk80xx_read_packet(struct comedi_device *dev)
 	struct usb_endpoint_descriptor *ep;
 	unsigned int pipe;
 
-	if (devpriv->model == VMK8061_MODEL) {
-		vmk80xx_do_bulk_msg(dev);
-		return 0;
-	}
+	if (devpriv->model == VMK8061_MODEL)
+		return vmk80xx_do_bulk_msg(dev);
 
 	ep = devpriv->ep_rx;
 	pipe = usb_rcvintpipe(usb, ep->bEndpointAddress);
@@ -204,10 +205,8 @@ static int vmk80xx_write_packet(struct comedi_device *dev, int cmd)
 
 	devpriv->usb_tx_buf[0] = cmd;
 
-	if (devpriv->model == VMK8061_MODEL) {
-		vmk80xx_do_bulk_msg(dev);
-		return 0;
-	}
+	if (devpriv->model == VMK8061_MODEL)
+		return vmk80xx_do_bulk_msg(dev);
 
 	ep = devpriv->ep_tx;
 	pipe = usb_sndintpipe(usb, ep->bEndpointAddress);

-- 
2.56.0

