Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577311;
	b=aOxdHCEiymtguKELMHekZdMWite944xU/RCgSeg/9XgXxbjZ/AUh+muEemGJCpgo3mI1
	 9Vg+b1r3G0m6/xl/Uo7prh3V6weNpHjvIamMAccc1nFmGB2D0lEijIVvXhSrPSuBeDzLH
	 4vRst1uHsPN4D0E8dHfjYOtHF45dyST7j4LEN29HV/8lmSig7ivdp10OyEabUf25wc1eG
	 uT0XIpx6AIpTa5iBWpQ6HVQD8P7RMikwFI+8jRUjBln/38Jpv79K4CrNQdyfqNOfbX3aE
	 hZV6R+6ywT+IsxltWXCJO8f3g7D6SkqmJSw5x0bZlSwS1DAGadEglaFU0UzQmISSvzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577311;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=rRzxZ7iwIOBiePG4SAdV6CBwDY3sN40DF+M08C7qQ2Q=;
	b=JkIGwCPiq9DjRV8PSsYbHDXXbZj5tu5hPqizwS+GMfnImxE9GZMKHXiinX58Km8zLBQr
	 rFk+KArdZmTVY3iqqwM+aL50HH6XtiVgriW9JXZ8jLA5wUkf0UfrWvbG0sK8rMvqwbaEt
	 LC9WBZ4Koo8dEkSRuZHFtZmJvnkjL/s7P16e9JNR7ClH+h8NKKFbkjDAPKnOZjkiH8HsK
	 LK2iBtKte4IU3Dpg0YwiIPLaAlpgbOjLXPLYOh4oi/pNVTrx5Es5X0oDIVUfsLe+EW9Ya
	 zqPKzjIEYOCE4LuLA3VUphRLrGfKcVuJ2EeelRHAu//d/wiD6/OZLE1ATNQQYuNG1eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jUACTdpg;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D80606A890
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D80606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jUACTdpg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 430F71A1655;
	Fri, 13 Nov 2026 13:41:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10E3660015;
	Fri, 13 Nov 2026 13:41:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 324EF11BC1D6A;
	Fri, 13 Nov 2026 14:41:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794577308; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=rRzxZ7iwIOBiePG4SAdV6CBwDY3sN40DF+M08C7qQ2Q=;
	b=jUACTdpg3zWvRaZ7tFlqW/ZXczkhs5gQqFb+6mEsqvzJGbrRmxxLTgjHarRNBJ8VyZsoRM
	+3w6YBu2zNYc9a8EhYbn3HncUJmOKIF120cFPTr2XnRCoJsrVzf9scMWE+aJFWBqZ5zqI2
	4xu8ohvMCig1fvpUblg3jkYaSwS5QYxVyC49c/LuYzjwiVJ6qfdobidIwcpkHMPOyUncZC
	OK15VHzmir5YwryxFB5zVm1iaOJrSxHzXm14F/H1vMTO4sRMIoTwAqoMQJn892s369uohq
	TGLwdUpyn6qRDFZJ0MocIPBwt6U7wMQGM1hc/A9ZINRFACH6TiL0p0QNN5VqRw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Robert Richter <rric@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Umesh Kumar <ukumar@marvell.com>,
	Shashank Gupta <shashankg@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 2/4] i2c: octeon: Add error state recovery
Date: Fri, 13 Nov 2026 14:41:26 +0100
Message-ID: <20261113134128.58826-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113134128.58826-1-paul.cercueil@bootlin.com>
References: <20261113134128.58826-1-paul.cercueil@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: Tanmay Jagdale <tanmay@marvell.com>

Whenever a Bus Error state occurs, trigger a software recovery to
attempt to return to a working state.

Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>

---

v2: No change
---
 drivers/i2c/busses/i2c-octeon-core.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 85e18ca2410e..c4f80d178c2a 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -205,6 +205,17 @@ static int octeon_i2c_hlc_wait(struct octeon_i2c *i2c)
 	return 0;
 }
 
+static int octeon_i2c_recovery(struct octeon_i2c *i2c)
+{
+	int ret;
+
+	ret = i2c_recover_bus(&i2c->adap);
+	if (ret)
+		/* recover failed, try hardware re-init */
+		ret = octeon_i2c_init_lowlevel(i2c);
+	return ret;
+}
+
 static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 {
 	u8 stat;
@@ -265,8 +276,9 @@ static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 		return -EOPNOTSUPP;
 
 	case STAT_TXDATA_NAK:
-	case STAT_BUS_ERROR:
 		return -EIO;
+	case STAT_BUS_ERROR:
+		return octeon_i2c_recovery(i2c) ? -EIO : -EAGAIN;
 	case STAT_TXADDR_NAK:
 	case STAT_RXADDR_NAK:
 	case STAT_AD2W_NAK:
@@ -277,24 +289,13 @@ static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 		/* Set BUS_MON_RST to reset bus monitor */
 		mode |= BUS_MON_RST_MASK;
 		octeon_i2c_writeq_flush(mode, i2c->twsi_base + OCTEON_REG_MODE(i2c));
-		return -EIO;
+		return octeon_i2c_recovery(i2c) ? -EIO : -EAGAIN;
 	default:
 		dev_err(i2c->dev, "unhandled state: %d\n", stat);
 		return -EIO;
 	}
 }
 
-static int octeon_i2c_recovery(struct octeon_i2c *i2c)
-{
-	int ret;
-
-	ret = i2c_recover_bus(&i2c->adap);
-	if (ret)
-		/* recover failed, try hardware re-init */
-		ret = octeon_i2c_init_lowlevel(i2c);
-	return ret;
-}
-
 /**
  * octeon_i2c_start - send START to the bus
  * @i2c: The struct octeon_i2c
-- 
2.47.3

