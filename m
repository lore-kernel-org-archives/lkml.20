Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592151;
	b=eUO6VYmAbOaRnnzPIJLgzCzosYhm9ts2uL5dqnY1IFEl9aBMgKHptdtRrLYOnPb7GB/w
	 neTg13r2Jy0kDxwQKHIIzbE7umwyVSnaD9w0OeEkqsJ9A34eI6MGgLBXE+X+vqmsxt6Tg
	 y/pZyVAZuYHJncKVZFb9MDxMM0nbCLd7ojaGEiuoqVK7GnWv+v4Js6XhSuyug1XF/pD6A
	 80CGAUKAR5Ch9bOhno920p+evDlUC4GJWkTzrCT8XjzKdOuCroXBnd+ZsMCjrD8SA58ye
	 vLTu47dhm7qT2d09WjWAkpUw2NLY6UEj+PRJKDaT8Psan52eglrV6hmZub9XI8Hq+oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592151;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jv8p+gkIu9fwBgeOmU7mvZqSpe9xxjP/ymQn7B45xWc=;
	b=EFiFWPawHJC49HZWcBa3vk28/YfaIm0M3IWwhhimqsJwHYCcT6Nn8ih3UUVw68nLAvXL
	 XW3VGXvVNUIIFLX+YbuoD32fs/vL8ZGdV1AwOTAjYfvBjszv4A/OYHpBlEpeeH4Jd8vPw
	 psVty+NTm3H+ICKmaDgxlFXvQuFXwwDpJuwYF0U5ruGM8088hQjFVr8+uBrGxCSchlsLi
	 nGrlSOTVc6etw4zDGGq3M1Pnk5Lhuf9QxyVg6fL63FMLXf3iN5rSGQIcln7y3317xUpIp
	 obNiDS0tOZpvQnVgeAizx2xYqbCCi8lX3hCYMShvnquCsQ18ZR4s6EIpxtoQG/voyhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqVMw7EF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF5606A326;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqVMw7EF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B221F000CB;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592150;
	bh=Jv8p+gkIu9fwBgeOmU7mvZqSpe9xxjP/ymQn7B45xWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UqVMw7EFhWXC7SjdIRAmV4IzLlzGJTEooufjhnGDrQppuTFDc1dtHkNGdnQMz0h1V
	 IysZisbcxxBnDeGn6ZSsbd4Mud8EIUSnAVTl0rjyaA0NqxZnO7A/Ks22d38o1jFesV
	 CWmQuJggQ9SO2u4PF2daqD18u/CAb1K0zutrk9kdlEQ6vJoVGXNGAaL4n5FMD7ILDY
	 iGzjG/86MWb5molR8QXsJVc42DgIqYnunGJAX7VDGXWDAi0NQJ4seVAijYZacsrVic
	 HoaeLt8Q2AKO9a4DBepyjtWQm1UnLUr6enVgpzgjbq4+1oBvqtL/g+/kptAZnUKi0k
	 KWX+8wnZKOf/g==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJX6Z-00000009kqL-2YFW;
	Wed, 21 Oct 2026 16:15:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] USB: serial: io_edgeport: drop redundant open sanity checks
Date: Wed, 21 Oct 2026 16:11:50 +0200
Message-ID: <20261021141154.2324793-8-johan@kernel.org>
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

The throttle(), unthrottle() and set_termios() callbacks will not be
called unless the port is open so drop the redundant sanity checks.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index b8e78c749f9c..cccdcfb203e1 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -1368,11 +1368,6 @@ static void edge_throttle(struct tty_struct *tty)
 	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
 	int status;
 
-	if (!edge_port->open) {
-		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
-		return;
-	}
-
 	/* if we are implementing XON/XOFF, send the stop character */
 	if (I_IXOFF(tty)) {
 		unsigned char stop_char = STOP_CHAR(tty);
@@ -1405,11 +1400,6 @@ static void edge_unthrottle(struct tty_struct *tty)
 	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
 	int status;
 
-	if (!edge_port->open) {
-		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
-		return;
-	}
-
 	/* if we are implementing XON/XOFF, send the start character */
 	if (I_IXOFF(tty)) {
 		unsigned char start_char = START_CHAR(tty);
@@ -1439,11 +1429,6 @@ static void edge_set_termios(struct tty_struct *tty,
 {
 	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
 
-	if (!edge_port->open) {
-		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
-		return;
-	}
-
 	/* change the port settings to the new ones specified */
 	change_port_settings(tty, edge_port, old_termios);
 }
-- 
2.55.0

