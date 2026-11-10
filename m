Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280397;
	b=a3cSHIHWBYyk4EnmatxduBAZ5qGrjU5b2QfUkFaVkQvZFvp9I8R4YCY06knnEEI7oe6Y
	 Jvm+EVz3bmJaXROGTu2Ozas7JUce8Z33jgFnmjY15CN8V0UADMDE8TFtNn5p6VtyVUx+F
	 XYUoa0BQEH1nHbymL3LJle80HBR2/+zfPceLIa4LNT+Szkcyr9ppORJsvXDP/JoAE1Vrt
	 BDehaYzmgBPGxGvs4wv/ZcaVNI5CNEV7GD4LeuCkwA//jSKKAdQs8nCc7ovbg2SBxwtia
	 2WZrpZzenrNYawRNIJ4Gb2BbC4Yo4dw+G/yjEePRJyDN8i92M3eY4+AHpIPG7Fmpu7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
	b=ppxfWX5CEXdv6Rg/0nILXRD1yF8xeFBfECle7nqWhz/3buIVU23EvL0C0Zo89z2upE5d
	 8ybBb/fupcjRlCAq6eDDckRX9tpeWRxVEUMpqjrSGlvG95v1Luamjo/t0+DiQzNrvYDxb
	 7mffBijf2Wl9nFrXpJJWZOLu8ErupfMWXr2hQ1dOyPieQyNCas+Ir37N3tINg39upDVfv
	 ZNpbpLfjlCztqwo79WzY5A7LfB2k8xyefc5NsqTbINDyghWpT0wbgzWU17vOUtjcdAW7b
	 GHCLiw03fRvNwEgLQvkIQeGyUvuGjkzTGtX+2Ni6Oo/x1PA8UWtihFrSZQ0DIMxxlGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TS7KB5Ro;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7779060A2622
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7779060A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TS7KB5Ro
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1283550b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280395; x=1794885195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=TS7KB5Rocmq2cqLp4Prtr0rleuF6YNd1tUgIf+aulTXpKjuB2JVHvPoWOuh6PwH8i2
         mmT/yHxIToZnG0fOK+HCYlzOkFYrhVEMOV2IUM3t1OgHjEdS0ZoFfx/MHhPY3w1CVD9L
         +i2OAG/g4wWPvDakwcyvELwmiNfoeeSmYgS3PADTYpyXi5tachAttJ0qzEXSWCKxrVUx
         htTkZZFq1cSE+2GQpoYAZeBXwf1R1cv2hsufgkz05fFSSd3shjr0tkGyGwztHML71eky
         CDa9He1vkzMLXXGo4fp8kAEeuFuUorLtv2ygxOA6hJ8FqianjI93elExZ107nKfKtRRV
         XIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280395; x=1794885195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=EgT1jwVTUb96kd07jwPlDx6Lo7EuGt2lipo2IwNHp+mO0sWHjodY5hmzafF5124gpN
         njJEOkdElbQxygweS5sjnlHOJQGuvFEYmm60guP6U9P36x7qfdcGYey9N1xys5xVKdQW
         8ElAgOqoqoaZy0XwWBXxMElAnTi6ipA4b82zSrYZ3gDDvuZzeE+ODSExbeW2Ba2MXaQM
         SQJz4/hCEMPsVzqv+ixF1vgZh5MsRDu+vuJRWb9o8Bfa7LKiVFb9Ymq5GBaIpvQRn3o+
         wKGkQZJzJ1lAH97mXHwmuEsSAqYDp4d0EKwo59/jW4WuF3EHc8kWGlLAlKN5RNY3RwQv
         IRmg==
X-Gm-Message-State: APuU4Z+I2ZsAfsFWs5mYw6pj3GnlmuUM3U0R327dKwze5ZdCkMnKf2TC
	0SPG9c7z1ZnC2ZmGvzn+eHXO3A0eODFI34UvOSrEZT/G4eY2P/DVrcMn
X-Gm-Gg: AYBFou313O+LcfjZ9QlVzJ1whYyDb4HJA1rjMj9qO4PzScdF/nxfZLH4PtWUNGORN/I
	aTz+TlD+P2I+rzSodpJn5VhlkdCI2K3YX5Or8N9POjJHiXtb9G0F0I2p+6s4FkARqQbP39qESIw
	TYL+np39Gy5/1zZ19hUTKDWUt8jsqCTllslyK3fuxOGzrggPXQ10OJuRcOGoIArboHSufOZunb/
	Q50mwBLdGYg0IMYlEbdQIhkSJJcvG+Y98vxnh1ZFrFu44n9jBEpU3M9y2cimBPqsKYLhmeEjAt9
	ZxQ1oA2LcwEu83BBKHivdPNaIEiwxF3IRU4+2oP+CneBL/XLrS1oDIQ+M3osei1sgHNQd/shdDR
	Ykc9ND2z3+TA4TrKExzUi0K+BfOmJ1nISQ50lqbwY2zfwtmRxRfRWqVJOvaDwaHt5hlzMkKVWGJ
	L3riykopNXXzcGN47/NomfXodh/3936bP2RZ1p79Cl1BhHohY2pT+zLG2EqTOV/tW+tBCpJPquj
	ePpWG7aq5LqBzBPCOlgXqilykoP4kKLAQrCDkNNx4HR++ud7g8kKs7bA+beFkCtAAB5L1Dz97u+
	eJMoWyk7KmpYiaBExdAVAEoltCKlV7KfVRcDN5wGsrNF5dUf4wlH/EYcqViBKtzipewuoc9XTU6
	ea9JqUQh7VyEmlLiCzhF51cMR9ej6ei0yT801lQR76rz3UBgtNgBZ/zFrk+JcEF37Fz0tLzpNeM
	iyQ26d7Fw3N/Kcice89BvKrJybiHpvibJiP7g63RYiHLYW/qDTupmfHxjrVnzmhM7pG0VTDCBE9
	Q==
X-Received: by 2002:a05:6808:3089:b0:4fb:c2dd:c7a5 with SMTP id 5614622812f47-5688127ca80mr655733b6e.31.1794280395471;
        Mon, 09 Nov 2026 19:13:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:52 -0700
Subject: [PATCH v9 03/11] serial: 8250: widen RX trigger byte counts to 16
 bits
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-3-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

DesignWare UARTs can have 2048-byte FIFOs, with receive thresholds as
large as 2046 bytes. The byte-sized threshold tables, setter argument and
sysfs parser cannot represent these values.

Use u16 for the threshold tables and byte counts throughout the 8250
conversion and sysfs paths, including the uart_port callback interface.
Keep the FCR encoding byte-sized and preserve the existing threshold
selection. The Moxa setter continues to validate against its 128-byte
FIFO before writing the byte-sized trigger register.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h        |  2 +-
 drivers/tty/serial/8250/8250_mxpcie.c |  2 +-
 drivers/tty/serial/8250/8250_port.c   | 12 ++++++------
 include/linux/serial_core.h           |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..939b7d4209f1 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -69,7 +69,7 @@ struct serial8250_config {
 	unsigned short	fifo_size;
 	unsigned short	tx_loadsz;
 	unsigned char	fcr;
-	unsigned char	rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
+	u16		rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 	unsigned int	flags;
 };
 
diff --git a/drivers/tty/serial/8250/8250_mxpcie.c b/drivers/tty/serial/8250/8250_mxpcie.c
index 4935a5d1c1a3..4f0b881b4f83 100644
--- a/drivers/tty/serial/8250/8250_mxpcie.c
+++ b/drivers/tty/serial/8250/8250_mxpcie.c
@@ -257,7 +257,7 @@ static int mxpcie8250_get_rxtrig(struct uart_port *port)
 	return serial_port_in(port, MOXA_PUART_RTL);
 }
 
-static int mxpcie8250_set_rxtrig(struct uart_port *port, unsigned char bytes)
+static int mxpcie8250_set_rxtrig(struct uart_port *port, u16 bytes)
 {
 	struct mxpcie8250 *priv = dev_get_drvdata(port->dev);
 
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..452851815ffc 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3008,14 +3008,14 @@ static int serial8250_request_port(struct uart_port *port)
 static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	unsigned char bytes;
+	u16 bytes;
 
 	bytes = conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
 
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
@@ -3073,7 +3073,7 @@ static ssize_t rx_trig_bytes_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", rxtrig_bytes);
 }
 
-static int do_set_rxtrig(struct tty_port *port, unsigned char bytes)
+static int do_set_rxtrig(struct tty_port *port, u16 bytes)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = state->uart_port;
@@ -3094,7 +3094,7 @@ static int do_set_rxtrig(struct tty_port *port, unsigned char bytes)
 	return 0;
 }
 
-static int do_serial8250_set_rxtrig(struct tty_port *port, unsigned char bytes)
+static int do_serial8250_set_rxtrig(struct tty_port *port, u16 bytes)
 {
 	int ret;
 
@@ -3111,13 +3111,13 @@ static ssize_t rx_trig_bytes_store(struct device *dev,
 	struct tty_port *port = dev_get_drvdata(dev);
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = state->uart_port;
-	unsigned char bytes;
+	u16 bytes;
 	int ret;
 
 	if (!count)
 		return -EINVAL;
 
-	ret = kstrtou8(buf, 10, &bytes);
+	ret = kstrtou16(buf, 10, &bytes);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..97301ef66af0 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -461,7 +461,7 @@ struct uart_port {
 					       unsigned int quot,
 					       unsigned int quot_frac);
 	int			(*get_rxtrig)(struct uart_port *port);
-	int			(*set_rxtrig)(struct uart_port *port, unsigned char bytes);
+	int			(*set_rxtrig)(struct uart_port *port, u16 bytes);
 	int			(*startup)(struct uart_port *port);
 	void			(*shutdown)(struct uart_port *port);
 	void			(*throttle)(struct uart_port *port);

-- 
2.53.0

