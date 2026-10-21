Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592150;
	b=ylkkSLTFEmiJ/y9g/AShuk1GOHr5jRZfzVfIpVF2mxBiKpsK8pkv3Lj4xEHtxpSbulr3
	 L5DWRSVhreF+P8dD2L6MZ4pvSYVUuS4ppsOh41WhZRv/46nvjMQ5l1TNWH4ODVXO8En/0
	 wjCsyuwj7DTLjpYVZg8Tdan1FqRMrKOG3+mP4qq9n34R6wGTsdtNSx3d5nzk67b8r2OEn
	 WEkmf53qPG5ct82EMzhUiMK3skp5yk0zkhhu07hsbJQIA1VioO2wXy6qda1igaayy2zIb
	 PUW+zOrRiBSmWDkgGQ08+vpSvHUetEcYW3OhAUUn9zew8EVSGVZlz+vh0tib2FPjKrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592150;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dMk95ar93omEy8TBqiXiLp4yMJ8XZtxmSz1tbwPRZrA=;
	b=wrR7o9/L68U206gwesxmia/gQZ3TarpYDLjtMQ/GiAOYTAsc3rv8/3rSJSTP5MjcLyiL
	 Kw+nYYarChzJrQ2NsXODSz3oyZDR/KexAVggitF7DQglbSbPxGcQnZXnAHA++wpzKudhv
	 15JSCZ2jLl+nGxZlwg52qZ4rf69lZ0Bg2LTM/nNCbdLyLwaf7mR9JiyKE/Ob1EB59qZ2e
	 I6ovFG5zEsRu2MuEextGxFgiBlAblv8mNGYiE483XBMalmF6UgSMON6b5gfIHpqKX8Ylf
	 wLfdG0uK0ze8tKWF8FyQxHGraFC+c/GwCxZenjRROqL3RpuQh7gBQJK4Du9w425JRaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PmZe+WYj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769FB606A320;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PmZe+WYj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1252B1F000C5;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592150;
	bh=dMk95ar93omEy8TBqiXiLp4yMJ8XZtxmSz1tbwPRZrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PmZe+WYjwKO7Sb+hrQXBglKKt5a9fLkI1tRpKxZeY8asB1w3IdkApleoIZ5lWJpdl
	 HBJXDwfv80JxDFhRhoD3dlFNtr4LKplyIEH11K3YrDKugvRh3M7Zfs555tfLccjO5Q
	 ddN/Z/Ps9vL2pc+dfEC2If36WHZSN8ew1jnEUZ115zz+OpKG/DY2HHA3GldZlnZmDK
	 /4ULcsGQv0gCAu8dJ6+CQbxR9GdZ6bKQ6FJrGUVpdJ04FqYzY7SfXeg8jEg9jv5y8N
	 UBfrfgm+ae5swh4NRVZT4zW+evPZjfEaKru9Fbx4/z+KD5d8aCAOFIS220RllnJVrP
	 Ydw147bAhBnuA==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJX6Z-00000009kqS-2fm2;
	Wed, 21 Oct 2026 16:15:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] USB: serial: io_edgeport: replace atomic command allocations
Date: Wed, 21 Oct 2026 16:11:53 +0200
Message-ID: <20261021141154.2324793-11-johan@kernel.org>
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
completion handler there is no need for command URBs and buffers to be
allocated atomically.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index fd983ebd1b6d..fbb8249bb5b7 100644
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
 
@@ -2128,8 +2128,7 @@ static int write_cmd_usb(struct edgeport_port *edge_port,
 			buffer, length, edge_bulk_out_cmd_callback, edge_port);
 
 	edge_port->commandPending = true;
-	status = usb_submit_urb(urb, GFP_ATOMIC);
-
+	status = usb_submit_urb(urb, GFP_KERNEL);
 	if (status) {
 		/* something went wrong */
 		dev_err(dev, "%s - usb_submit_urb(write command) failed, status = %d\n",
@@ -2186,7 +2185,7 @@ static int send_cmd_write_baud_rate(struct edgeport_port *edge_port,
 	}
 
 	/* Alloc memory for the string of commands. */
-	cmdBuffer =  kmalloc(0x100, GFP_ATOMIC);
+	cmdBuffer = kmalloc(0x100, GFP_KERNEL);
 	if (!cmdBuffer)
 		return -ENOMEM;
 
@@ -2280,7 +2279,7 @@ static int send_cmd_write_uart_register(struct edgeport_port *edge_port,
 	}
 
 	/* Alloc memory for the string of commands. */
-	cmdBuffer = kmalloc(0x10, GFP_ATOMIC);
+	cmdBuffer = kmalloc(0x10, GFP_KERNEL);
 	if (cmdBuffer == NULL)
 		return -ENOMEM;
 
-- 
2.55.0

