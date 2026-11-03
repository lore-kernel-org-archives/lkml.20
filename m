Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742009;
	b=dy6d1JZHD/1oMg4jjdu/kzTBb7j0dYRuBF5OCqeLVT9HhnQMUuzy6CNu1ng/utn6VikX
	 VjqmzbtNrMyyPXFkJoyyXwtYU+mlmkr8K2qvVKZ7j4wURvGg+ET6qXhVO72i6Nw+9B4Cl
	 mZ6vH8GM+bSgbFXMMo4taDvumokoqYehx1EdvIZAusF8XFuj553eAvkf/DdQwZpoBuasw
	 tAmuCMZGYOVF61xpGx50tenbEAefocZwl0VNk+GDB3FbE1+MKQ+9JGkqVwRNK8pyS6J4U
	 WQboMBNJKHFVzt6wjAPtV1tf+kEt+MIEUxaJYLLn26U2/vSfsi8rRIl1fR+LdjzKOnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
	b=CoeXqkurQukegkrVLHWUaYQ6FetiiwFazb2HOqf2HzkVEWV5iV0b2rdk3n4clmm1CYHh
	 iBDvLsSA5BsSi0DgO6Sh3GumCe3Mejsxpc8UPYlZSZK96/Jl1WPed7E0RQt6zM5Sytelf
	 Vg5XsN5bZM6VGm/O03SjWH4Rfw6OlyJIT/+kvRVbXQzBv6xDNmy5tHaqhiIU12iJpsNMt
	 zduj/4/tZnUSiE5cUcacQAPnfonQv112h8Gj8eUke4G4kGDuUBvj3rmr8jWPV6vl8RWQc
	 mbhzQflAg8YZ+xLifYnXIK/dXi9ScJiEBcY96metUr9FRByLc0HhLzLYP/ImjfTiegA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJIx0CSX;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32656606D802
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32656606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJIx0CSX
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-48e9476e26aso51521fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742008; x=1794346808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=XJIx0CSX0t05km3oi72zgQp84PQKqw3zLZpOV8xPVOVcJnbKbUM4u2U9SKueHHOck8
         DqB+6Coi+bdr4bQN3i/lJzdONPZZh4Jzwk7IZLd31yQb0yBc3ai0qegUldHBqFvm9ORt
         JBb0Bk5BWeC6Gwpovb1vwzDSpTqPs62FmlUPET6tqTsAolJQBO8kT4IsUn5XxqCoRLdj
         ji7n36UdsxPL6xG/sGkUMjup+f9S14T6p/eYUDGt2a/xJywa1tmQ9DsGkbIo4nUtsYqg
         oP3+NIRN6u0d7K/A5r5BDcmhNXbqVNZfd1WZFL/QpSVdO7fMxNuIOz4PCDs321FtLNlP
         UAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742008; x=1794346808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=ljUzN8dpkzkskgMqjTezZ7VdeheJLhC8PyVeV3+r4pwFYNlZNZDDfZFHNig7NIc0Km
         euTxVJbFSoK014KJHI+Rd8Us8C+TfXSAupmGmkfM32vJgdYYK7/pBHvbTMAq9X4gK73e
         6oDrW5UdL292hpGay0GDVcKnC0QeOj+XqxgLM+HuspsQA+1/LOaXVRI3tvm1orHsDsHm
         xjzEvQsK6C7HlkrtSep0qb5nDjt0Ufz5U2Gz7aWIRZSZcu+kCF3PXecyh1k4EVI/zxTd
         cHiEDR+uXWkIFcIkr41iBC35dSGcwpTA6UiYQbnAbpPJnEJDtadteUpM3KJkca+3Tayh
         hATA==
X-Gm-Message-State: APuU4Z/LPAus+m/5944sixvfiOgdFr6Rnp7w0BPuKVFkZrOUzjU14GXI
	77MygveeAbh5WhroGSwem2hCzYmsvCoep6FUSPRgc8a8i2MI/SRNPOa/
X-Gm-Gg: AYBFou3oA3IJ1Z23tjhg3GmlKN7PE8SvPgfPTPbVxhltZ6XVsRY3/d440sscKerQ0oZ
	8SJrYqhOXddEkQgAspWatcPN0LDqz42jPNuMJWkyYrb46xFKjbE0/j/5p4LLmbfRx79/XUg9/9q
	gcuGPSGNOoLuNbZ94df7qWcWYND62y+IPV1vEA6YyZ8iFSyXg77HU/LrnHMyEJBhFxCC+NWU1eU
	t1iSak6K3LFw8E8aOqiHXHZ9/QXSeMjn6Fv2LwzlRdw7hUjVsRhWH2qJ/jmvyxkkXDwoB1+HZ1I
	N7v0rzgfQNkwGbgbmYmU3hdxQ0IALLxq21SMuAaQW5tnoBF3XtPvAlYYlRumUVS3qLvImvHJrVS
	YPEwNcNWlAlXjmvlUzfDBKsK9pASLV/whjWDDMrLVxDtWRMDdgvlK7BZvZMg5GLvHzYShPyTFjB
	EZ2nJ5+F//dI1SEBvxznDDXnK7+bKQnBwdLT0NHbJPg2ZGqO2MJG1uJXvoEXxSr0VvgXRcQ/NP6
	Ob9NIT8fz+W0WWOQ49ZDHJQdwWneWQ7lYSA4d9MihvxFE0bcGwKpcXbQRXRfc8dW9PNWlgz/g7T
	3LPF/CFBBZkOtRyxYEp3kxZn+yIoJDRvp7i0x+1gEQkIzUx7+OvWHGP+NUIWd9NIO6RXjgCQmLL
	hP4fIPixoqEw0zj4tnJnUDaMxRVsY9gEEl8lGRx6PmNi2bQYMwvliTVeVVFphpY9z0YHQIuxRCC
	50eRYphM3ahlzwNKi0jIDUZu3kzXPBEwtsJKFQCDox3NCfrylIARSW
X-Received: by 2002:a05:6808:4fce:b0:54c:7ce7:33ba with SMTP id 5614622812f47-5640dc9006emr9815263b6e.28.1793742008124;
        Tue, 03 Nov 2026 13:40:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:56 -0700
Subject: [PATCH v7 03/12] serial: 8250: share the RX trigger conversion
 helper
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-3-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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

Drivers can supply receive-trigger thresholds through the RX trigger
callbacks without adding a legacy port type to uart_config[]. Extract the
threshold search into serial8250_bytes_to_fcr() so those drivers can use
the same conversion as the generic 8250 implementation.

Keep the implementation in 8250_port.c and share it within 8250_base.
Include the unsupported-table check and preserve the existing nearest-lower
selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 14 ++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 939b7d4209f1..8729619160ea 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 452851815ffc..73bc9e7ab703 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,16 +3015,15 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
 
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
 	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
 			return (--i) << UART_FCR_R_TRIG_SHIFT;
 	}
@@ -3032,6 +3031,13 @@ static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 	return UART_FCR_R_TRIG_11;
 }
 
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
+
 static int do_get_rxtrig(struct tty_port *port)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);

-- 
2.53.0

