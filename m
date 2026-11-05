Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911940;
	b=WueXP/Cxb21FjV/lsZeYEFDLC9eUjFCMyFNsCWa9iVYIyff2gW8s+J9lBZQVk5L7uCbl
	 WFHyYNPZkxFgW6qwAVoVTA8Sl9TxmcPOvNcN4lCVZYpbSTOQUGdzlJoceiwJHsV480Sr1
	 0/E2W3EmHjzv/66keejpVinu9nXyCv86u7pcvgVadWD/YejDj/iD1LP8Sfbg1tmpjGn+v
	 XS8eareSBbvRgWck3nlDeiZZK413t8o4OUaHWz3BoiUsMJvzjPhg6PAecRFme/0h+B/7W
	 65QhGyhqn6trXFFi/8AwynG2qbsx/8vf6deTLpqfZSEiBtc7ALo4FflJn28p5h81n/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
	b=xxR/FHEEtxkVnqcNuXEBGQ27xeiMRR6HoLD4X6CFmr1tjIzDX7mA8jhRTuEHDi4qsb8k
	 d0tpIWAsns6xDZzC0AX646zIlrNAigMVaD/5kXjflZGkHrl5B7g1iPNnrQbx6XW6KiR/6
	 IizeJzSccipUzG+Dd1Duvwi/zYfH8uSTujsk5eky9hfk3CossjmXCBPQHs68gHf5kQ8KB
	 S8JTPgPJG100XkpoUMbn/JBousoYb2vN9PmjdRZCd+K/MRKdwDGiXUt6DL2E5aPaeAq8I
	 bdGECXPmcJ+n55OuH9dXIMn5QHViAIoPw0b7PneTDAvdvip0UVQLE23bH9lLX48QeXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mc7siVKY;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E8B606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E8B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mc7siVKY
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-85a5455bd3cso2487a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911938; x=1794516738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=Mc7siVKYA2Mp0wkrwtv02WP1UWanxUpCYF4fxsFjFGzJahcflsslfo0UWJCM8QCTIQ
         biAKPN/fjADxtxNNA1XMHp/q93eet3+F0XItruAUIJQxhw1rriJAdO4bqZZoBtR97tV1
         e4dAn4fMRsIKdRN8bYG9fcaq4fOzHO7GlYIw7qM8Q9Dz2M3xkfltDH+I8Qj+mxNmvxlU
         CLt7qlv13XZt1dueypdComgv1ZhQgVhoCYacHlY26tX9NW8BVzZp/HAOZKN+reAN2gMl
         +WCmzClTZ371cX3ykK7e8eWwKNgoYCFsRdUO6lBKEsD4GFfKosj3hEFGu5DSvoSXpkKa
         vgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911938; x=1794516738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=U0l0IuzSDn+Mor2OGVzUX7kLUFrJcw1Iu7apWrjVOOT4cPHoxIr463h9SukCKunCkU
         e/7LC8PqULw4PfCsBBDz7R+itZWJ9hBEpuNxnsmk+A2Hy5lnJ6x5mbl6rHYTiYulcoy7
         1/nrJNlYxWs9qoGYVMGM5DOhwi80DYOEG+sjrdU9QLCKzqsrXGBoBaiInEChpYn6xb/R
         r3GZZsZS5PtmB5HfnC96g6hSqgwjpBXzGW47g4OVSx3RvEUKQeUct8dYoTIzaJo2K2Dy
         W/OwrC7+Ljd3u9440C8cW/QnoTHDniyp7lri2HwYZMvr49guMP3qXqRqLt/0yRPkZkXf
         oQpA==
X-Gm-Message-State: APuU4Z+q6Xoq+Vjzv7v08zaxBz7UaqkOpIejFSZmqp6sPVXqGERQrYtG
	y+dHOvpKhw1AQO483aAUZOw8HnQgBwj9g03ucxfs10kw7+sM5FZlOxaB
X-Gm-Gg: AYBFou14tTj4SlQjoQiqnYtfdtUF9HsvfoIO2hP9RerR6AciylW1Vx3ptNs2+e7Yzdj
	11LOSqduNam2KM7fu1IS49Se3JHgHsrIzxw4svEV8xlFBjaqVtZIAMWBFvSOglh84coqhq7GoI9
	wJgCACX8Eaxkh63L6YjtfsW+PG0EdYmqg/sKkhQEYKR2LnBMEDXLd9Rc2Dwj5ZnS7WmvAVCSsur
	I4PduGvqyhCIFo+VUIXmSAF0sFmMftzB5WZpfKy5Ri1KKK7FnEv1SfQfj7JU5E78gZ8th3NTkTc
	CWdiKnNoNp7j8utbMzh98bO5quQW2FPRMg4Cka+C9xn6+vftE5dE95SpIOZEhF4Mxc2p7d/LEYS
	P7P2lsdrYkSQW5wT6SWLLlhy8D69lD2BwuC9H0jOy+Udd6uNn//gJJ3pU1EZxbEy29ouMpLtdTq
	eBkZ04MKZ2QcIE0uugYYFMAVup6chRM+I4a4cmuaxEgFH3M0xssX+HXSueytk4K16MlO2RfVK8G
	N9YTsWX/655E43wLrH3TcDtaFWs+pV6RtnjzRfK84JzxQoID2GDoNGFtbW1Ez6vrRRuwmt1ANMs
	WzSe5iSayszkDz7v4cq1iE26c2vapLM7bG6gSVYejYivSzJXJcHloPENH7orrBSOsKsRTv61vL9
	8MXeZNjS7e/8VzOEju6QdECa8RZqFSna0iuMMaS+NzaAhXgmZTN3i/OJ3TvzioY8FOusyAi8tFA
	abtKwFmFoEF+BBBcQcy55CeemQR24DftBRVMiA6i7KKaltea4Iv9lGQCQpzWtwWPfk7DnZlaUd
X-Received: by 2002:a05:6830:2317:b0:85d:6045:52c6 with SMTP id 46e09a7af769-85f1d086f53mr580936a34.24.1793911938304;
        Thu, 05 Nov 2026 12:52:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:04 -0700
Subject: [PATCH v8 03/11] serial: 8250: widen RX trigger byte counts to 16
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-3-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
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

