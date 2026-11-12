Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497637;
	b=tjZAg1fvQ8jXn3dTXNlIQqsfFkp0MbSEUTNqQRoQuN6YChRaEwSegsT7lXVMY4CQVDkO
	 CVcl1rtr8FXTsEqaBaodGaGcOaFo8/GqK3K1FkS44llAhRP6Yrs8WaH/8b7Ckzw2lk1oE
	 Q9POUgT9sCKOpyDiLouWul6a88JNCcYbCPfqw8QVEIgwRrEFd81+1lMYtTlmqeHRid/JR
	 OV+Us8i8TEt5z1C4nwTuprFQTi8hfsRqcsPfmF1OpxCNOUCYpAGBFI/jPRfmi3nyp5+KM
	 qMSWidrXB6C0jbb5xggbMLq3vrO7URqmenRFC/i2AhQmH2TRTaPg7f3XfrdDTeraWdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VvrdohMl1QV4VMTfBknOdBjsvgvvJgr+uP4Xo2NyrYU=;
	b=F1DOxRjeHqNMzgAGH53XJAwPxE7zHkMCt88qs1ANJ6U+qxDLxjxWu1t4A+z/EgPThlfq
	 epzW4KAKFO+rntZgRtkilb0sHfmqz25O0CLdkvrmLX2/fFHaVPAftNBL/k2Fat6+5Tcey
	 p/R4sK52TjYLBhaGXW9Sxe8uqEkWXi8H2H8YeyMNQkzaTrYTjPEPDqnNDPJOHGAhNtsXs
	 7XC59GCBVIOhp8Tb7/7tRRqrOgrsoi+8zy64Fvk9c1uwAc7wea2mGZiyvS9evo+qpbmrl
	 qt/hep24a3QZnpxYqFw/8rLvkFw1GjK9eD6Ndc7yq8GSVVARtcHBuOIQ6dKHyXMF5RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZrF3GV/I";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF15606A89D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF15606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrF3GV/I
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso39081365e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497635; x=1795102435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvrdohMl1QV4VMTfBknOdBjsvgvvJgr+uP4Xo2NyrYU=;
        b=ZrF3GV/Ijit5cJpcLlKNZMUbCXcWY75b4SvDZpmXFxNzmsuovLiNt1bxikbiuBa003
         pneT3M9Tn+sbVERHYmDWxbPBfDY+T8kl9kQtEY7ffhGUvjvzS5d0+mETI/wZbOyPf1Kv
         fr05Pkt61gl0So+rLDR2kqU8ofpFotF7RXYP3Yneu6oBIWmnaIb2z3ZNVTNGBBo1yd9W
         P+JoaRIY+A/TBpP/oXB5bkh/j8WgGbWQOEc+ND92WaMNQTSB5nKxa305l1v9VEAsQDM/
         k8p1CqodAf8cIRDsb7towDhb1101qe6rd9+Snh1WA1a0LX2yoP+Zga+NJsf8WnBR5yUs
         VjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497635; x=1795102435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvrdohMl1QV4VMTfBknOdBjsvgvvJgr+uP4Xo2NyrYU=;
        b=AKzElsNs7zkxCvajQJWwLo2tSL2bw+8EUM4S3MQI0EXMjLDeTVk74NEzx4Stisfhoo
         SCnpnSnCnKsq/fMK5AkgkhMAUkPxJH9C3aHg+9paNvbK7CK5U9VWGfzMYiDQ7vVSijQo
         R98CackedVTnl+2DadKgdqZcQ8A4J5Z5qT3EUdC+UrSbQInRmEGrcPnJW5yl+QSdUCv9
         pHmELTAtJYCUJHYxXAwVsStNY16Sv4m5Sk932EbCz/Dxix07jwtW0Ua+xF8+2ELqZLtb
         HEDemCunJ/EazyLTihNlnByenXvlMSyG+FokjlEwxm8IaBb4YrPRNbQgjCey5e+dRXu4
         Rvtw==
X-Forwarded-Encrypted: i=1; AL+hErElD3+QHNqgzd5ksA5bvg/GikEDBkK9b9eMNJtXiQ9tHgt7sWeQSgmFHE8EoFtRIwk+DgN2APwf6tvmknc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Yh3i7W4poFcBrlywKC4ZhsTCjaNiQ0sxL0lBt4/TC/lGhW1I
	3scQECWWdydP88FDyBwefHA8cb2uXN5scisf6/MXzzvHWmEvZi9EOQDP
X-Gm-Gg: AYBFou1lCg17TmnIXG20CiY5wRqk1uWI0Y/QKKc6GBNWMs5X9SeRxCWAvkt3chICT9/
	mpbczDVBYhOSyRs+5BfHKisquA9hkwJeWyvg/ye3j/orst1N3vd+Sflfve0mFjbRagT+w/UX9Ev
	xJcAy0+hwXBaK9rahfxdjPvkXyGXHa/6kxmTucWo+IiF0AIkmHPSBCmlRNwHicz2CjCmgoaR0BT
	G9/cYQh52R17BLnwrxo7K+N7c2ZXaqg+mHJdl+/YfqCgE7hOYFLwdYL1mpq22R1D+vsHuM2nzi5
	WFRG/ZS/BvhCSmGQryvKTXigbga3MKpVPlwQs9zPnc1V+wluIb8g4OnFBB6Lx6Zkqx5Qts+bs/s
	rbUbsVC5ckF6AQwhAdl0qk3zI56LaSOY/MsYzRcb8tQL+zq88RC994s0BD1otFohxMqKBcXstB0
	TNgPa2LTdurrXrIuvfJ7Sjxu8EBeHQNmWt66XiBtFLnW0B821eBelx1sdAk57kd2WrOPA2njB6q
	D65eVenReNRnLQed2QipREGzi/MSH+AqJnMM+ArRh+zqk3XinHQ94FUfIrpU8HQ9KUJo9TAO5ks
	DvzvtdMST0l1x/HEIvdQuDRqRVrTyp2W2q1WQy+VMp/PGGAIbbri3806OTSAG/YDCyqpGmngood
	UUI46Td4=
X-Received: by 2002:a05:600c:1c01:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4ba09395574mr132571925e9.35.1794497635084;
        Thu, 12 Nov 2026 07:33:55 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm87105855e9.5.2026.11.12.07.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:33:53 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 19:33:11 +0400
Subject: [PATCH v2 3/6] serial: vt8500: Look up console ports with
 uart_console_port()
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
Message-Id: <20261112-vt8500-serial-cleanup-v2-3-36b258e0c0dd@gmail.com>
References: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
In-Reply-To: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3052; i=alchark@gmail.com;
 h=from:subject:message-id; bh=3liCMnx0+/nFxGsSTGfQu36lLL1bgD05zvuvM2xQkgE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9vePFvWXRnptJkmJnv8UtXvbDco7zgzAHp9aHWw6Zy
 nEV37A92zGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUH/rC8L/sSa3g6x7lMwryTiW136IWf8zIrmGN2nTRQXWzZ6yUWwLD/2qp/a/
 yOLe2/fzZn/esX+xGv/XpkrhOx4NRx997H9nByA0A
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Ask the serial core for the console's port, which it registers before
the console, and drop the private vt8500_uart_ports[] array that only
mirrors the core state and gets in the way.

The helper also range-checks the console index, which makes the checks
in the console callbacks redundant.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/vt8500_serial.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index a7f167a73416..4abd4a8d5ef3 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -444,7 +444,6 @@ static int vt8500_verify_port(struct uart_port *port,
 	return 0;
 }
 
-static struct vt8500_port *vt8500_uart_ports[VT8500_MAX_PORTS];
 static struct uart_driver vt8500_uart_driver;
 
 #ifdef CONFIG_SERIAL_VT8500_CONSOLE
@@ -472,46 +471,38 @@ static void vt8500_console_putchar(struct uart_port *port, unsigned char c)
 static void vt8500_console_write(struct console *co, const char *s,
 			      unsigned int count)
 {
-	struct vt8500_port *vt8500_port = vt8500_uart_ports[co->index];
+	struct uart_port *port = uart_console_port(co);
 	unsigned long ier;
 
-	BUG_ON(co->index < 0 || co->index >= vt8500_uart_driver.nr);
+	ier = vt8500_read(port, VT8500_URIER);
+	vt8500_write(port, VT8500_URIER, 0);
 
-	ier = vt8500_read(&vt8500_port->uart, VT8500_URIER);
-	vt8500_write(&vt8500_port->uart, VT8500_URIER, 0);
-
-	uart_console_write(&vt8500_port->uart, s, count,
-			   vt8500_console_putchar);
+	uart_console_write(port, s, count, vt8500_console_putchar);
 
 	/*
 	 *	Finally, wait for transmitter to become empty
 	 *	and switch back to FIFO
 	 */
-	wait_for_xmitr(&vt8500_port->uart);
-	vt8500_write(&vt8500_port->uart, VT8500_URIER, ier);
+	wait_for_xmitr(port);
+	vt8500_write(port, VT8500_URIER, ier);
 }
 
 static int __init vt8500_console_setup(struct console *co, char *options)
 {
-	struct vt8500_port *vt8500_port;
+	struct uart_port *port;
 	int baud = 9600;
 	int bits = 8;
 	int parity = 'n';
 	int flow = 'n';
 
-	if (unlikely(co->index >= vt8500_uart_driver.nr || co->index < 0))
-		return -ENXIO;
-
-	vt8500_port = vt8500_uart_ports[co->index];
-
-	if (!vt8500_port)
+	port = uart_console_port(co);
+	if (!port)
 		return -ENODEV;
 
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 
-	return uart_set_options(&vt8500_port->uart,
-				 co, baud, parity, bits, flow);
+	return uart_set_options(port, co, baud, parity, bits, flow);
 }
 
 static struct console vt8500_console = {
@@ -683,8 +674,6 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	snprintf(vt8500_port->name, sizeof(vt8500_port->name),
 		 "VT8500 UART%d", pdev->id);
 
-	vt8500_uart_ports[port] = vt8500_port;
-
 	uart_add_one_port(&vt8500_uart_driver, &vt8500_port->uart);
 
 	platform_set_drvdata(pdev, vt8500_port);

-- 
2.56.0

