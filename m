Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757817;
	b=4xg9BSjv0X8ckyJdbimpxNxKmrogCP8OG28SPQQtp3Y++KKrYnH9AqrTXXhej3HxWt54
	 45kQsOKmbv4A28nFuFxDwSBZqkdVQ1rcG8vNGYBMVKr2YQ7/E1iSWz7Ico/Sowe9Dew/q
	 IWG3F4DolCFMvA+bDYrJe6sybMOtiewksw2FS9MK0WxqaIWpVl+40Le3OH9KIDdVHIJdQ
	 +Q/W+BASC+OBmLRy9n3QERGju5mV8dxztvxRpVc6qvnqntuICMxSNlb9vQEU1DG8YsFPh
	 bZ3Ig9DDajogep8OdBNrfSvHAxpP34btIouJUAg0K7fY7RnN6TJAX0JsF9QDV+ug4Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757817;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WR/BeF+5alqLxZ/FrYoX56UdtOLWZ7XANvmwu22zc+M=;
	b=v2v3YaApseJN8QVBL19Khpuya9+PXfbX4rJk3ghIpY8MFjjO2Lh6plmagKi3M06JBfXr
	 ZJpVvx9Hzwn/E++8cyVKkmJFwAFmUxdZKh6DNDJ68h7SS8RtcI/00ZTg45T9AetajGFJw
	 MAU0Y5retfgu5lZRo80kJ/IlIlCRuOQ6AIlUQmdLJNwuoY0a/VsPcdHytSiUCTUSJZzSs
	 QWNOM+UbwQAXXsKqevUQKJmCBGud95geNdRqA42ptAWyvMwwLmpyjC9w/d25kV4MKr5O4
	 XYdABO3WGkqyy0vF9n9sBOyp9Kq5h/chIKrxBEWVaGHGxpGhAoBBLY6ttnd/T0twCAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YmP/R8uN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80588606A331;
	Fri, 23 Oct 2026 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YmP/R8uN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BA61F031E5;
	Fri, 23 Oct 2026 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792757815;
	bh=WR/BeF+5alqLxZ/FrYoX56UdtOLWZ7XANvmwu22zc+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YmP/R8uN7UYqXlLnzJCFr01ujZE/0qxKGs8ZRsiDultkEQlCMKRtsEOO9bcMEgSsg
	 08D2BNllktNt/I7lr0NuAlIlpbIs9VGsw2++uYvuxQE2Ltq3dKBEkh4zat7xRhs0Nb
	 QFv0zDiNkVlJozUuuOuHQOpieNVilUdN10ylbLa9cAMPEjGip5yOKPjJgk1Oov3Snz
	 fiS4Cxcy96Ilc2e+orBs9XNm3OsCCSr86Fg3iXRsvAkObLk4zHdmeXeCvx1eWU5Bzi
	 KcUPtlIQ9s6mN6ZwuF+xQiu6nfdix+ZJuW+bSWeeZP+FLtGQxsc/cD+l9nwDI7Q+bE
	 j0SIqsy/1ZYiw==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xKECb-00000000mZn-0q4m;
	Fri, 23 Oct 2026 14:16:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/12] USB: serial: io_edgeport: replace atomic command allocations
Date: Fri, 23 Oct 2026 14:15:29 +0200
Message-ID: <20261023121530.186541-12-johan@kernel.org>
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
completion handler there is no need for command URBs and buffers to be
allocated atomically.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index ebbe8c5370cd..d47c2295a7cf 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -2079,7 +2079,7 @@ static int send_iosp_ext_cmd(struct edgeport_port *edge_port,
 	int             length = 0;
 	int             status = 0;
 
-	buffer = kmalloc(10, GFP_ATOMIC);
+	buffer = kmalloc(10, GFP_KERNEL);
 	if (!buffer)
 		return -ENOMEM;
 
@@ -2114,7 +2114,7 @@ static int write_cmd_usb(struct edgeport_port *edge_port,
 	usb_serial_debug_data(dev, __func__, length, buffer);
 
 	/* Allocate our next urb */
-	urb = usb_alloc_urb(0, GFP_ATOMIC);
+	urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (!urb)
 		return -ENOMEM;
 
@@ -2125,8 +2125,7 @@ static int write_cmd_usb(struct edgeport_port *edge_port,
 
 	edge_port->commandPending = true;
 	usb_anchor_urb(urb, &edge_serial->cmd_anchor);
-	status = usb_submit_urb(urb, GFP_ATOMIC);
-
+	status = usb_submit_urb(urb, GFP_KERNEL);
 	if (status) {
 		/* something went wrong */
 		dev_err(dev, "%s - usb_submit_urb(write command) failed, status = %d\n",
@@ -2183,7 +2182,7 @@ static int send_cmd_write_baud_rate(struct edgeport_port *edge_port,
 	}
 
 	/* Alloc memory for the string of commands. */
-	cmdBuffer =  kmalloc(0x100, GFP_ATOMIC);
+	cmdBuffer = kmalloc(0x100, GFP_KERNEL);
 	if (!cmdBuffer)
 		return -ENOMEM;
 
@@ -2277,7 +2276,7 @@ static int send_cmd_write_uart_register(struct edgeport_port *edge_port,
 	}
 
 	/* Alloc memory for the string of commands. */
-	cmdBuffer = kmalloc(0x10, GFP_ATOMIC);
+	cmdBuffer = kmalloc(0x10, GFP_KERNEL);
 	if (cmdBuffer == NULL)
 		return -ENOMEM;
 
-- 
2.55.0

