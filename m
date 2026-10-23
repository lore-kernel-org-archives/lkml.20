Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757816;
	b=1KEg/Kj9PvRcxVtn9ovr6FQpyZV2sjyQB67BNGJZEiHlBnhIG3cpQQD59yqr1vL0jZd/
	 N5dbUce5xFJUL9DTvK7aGPEtzlZdv92uu53iglUj0EwPyw5UxOf/O87EU+1e/MIihsKKZ
	 k9qBapMUwGcX+pJj1DinKwLK9Rku2SzwXRH7l4MaVVhXAbAVZEtRaPs5GEuxKvHVSNOc0
	 2ddDu0H52pjXI239H1UlfY97Z76mNHEW1u4vXdva9qrs23ZvPnYeHJ/Jxm77Ho4Jwd8pY
	 0LaRDKpDKLSnsF43j99F8UW4KYio7xZKSAjUcx7oYHe/5zWIfCKWVjgHAHXf6vU2JVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757816;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2yDY7kHZjdewJ8tjregs9aiCzqMS6f2UoZUzlbWa8wA=;
	b=jj/1A9zSadFnJP2pMaZxy5LhfDkwiVK77G2V9HtInCFN/5A2UmQTnhLykIL4ItaUh9HK
	 zi5L9eXU12IA4I/EC/xnco6Pi/Xts3JqNidzghW0CqqV9zEZYcgxMVscHbYxiaM28HxSV
	 sa0JkCFWVYYVNuy6R2ybGy5+U3e2CuL4TFGmbaPucRigFnjI7LB2qMAdobmz7HVheNi9x
	 Hjd5ROxHiCqXkpp/ff5S5PMLOnjv5kDNdVY6KnG2G63n2KQ9BjytelYN1i+vDF1JnOuX+
	 /FjCacOnvfAKBEPpWG5Zawi57NuQZWID/tEnpxdWuc3cDPzpAYcFQ534g+Gu5l5d4qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gOPoFqAb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80484606A32E;
	Fri, 23 Oct 2026 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gOPoFqAb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AEE1F031E7;
	Fri, 23 Oct 2026 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792757815;
	bh=2yDY7kHZjdewJ8tjregs9aiCzqMS6f2UoZUzlbWa8wA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gOPoFqAbeKo7s+uRRa5rqMXVe55olMtaYdUp4cWsxwQ+hf2KASfGY9bKw1OOkAdig
	 WKUsSBfxqDc4RsCV+6IJFmtlMIluVNh9CEOXC1LGNkzQIUrsJK4gwFXmhZD9umlzK5
	 HEQNLnuQd69K52CVuvrfxr6jVRbjd9vqf3hmewPw0D/b0o1oVLOxlUPrg7c3czhWld
	 8p6+PfxOrP7/fEK3A/nTeq+w+CWgVkdm+wQ4bRb3zKvAEddkt1d8NkCJvazKMI0m3v
	 RO008OrKBMoS+TvDvKPNA9ZTOrIc3Vnm9d5yuY/kw6wfdEGD6KYfukAlPmSZ1Q6k0W
	 4U52HBYG4JkPA==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xKECb-00000000mZi-0jaa;
	Fri, 23 Oct 2026 14:16:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/12] USB: serial: io_edgeport: drop redundant open sanity checks
Date: Fri, 23 Oct 2026 14:15:27 +0200
Message-ID: <20261023121530.186541-10-johan@kernel.org>
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

The throttle() and unthrottle() callbacks will not be called unless the
port is open so drop the redundant sanity checks.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index d00fc99d13dd..566f0f1a1632 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -1369,11 +1369,6 @@ static void edge_throttle(struct tty_struct *tty)
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
@@ -1406,11 +1401,6 @@ static void edge_unthrottle(struct tty_struct *tty)
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
-- 
2.55.0

