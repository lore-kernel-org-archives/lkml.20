Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424775;
	b=HjT21aV66L0BJEGGYgahqPeHTGr2Lt/ZuQzbTINGiP0Bn4MwN5b96zEtIWjHBfbEKEke
	 4Riqgwdfe65EGaNPavQuJFCHQ6++J25WZBK09WeNYYWbyMthxnDVHy6cRNwJ2wa8y3QW7
	 Zw22kTtFvEHFHOMJ1ToWEkDfflY6PHTs3pAZPwF5maWsKG/ZRiPkDjYwMwqJs0u2OyHfi
	 6cuZMyAX2mtRDLtefHZhBi51SuTBRvBULkaKmbpckjXQU/vVxnOuW/n9aaid7Oqu0iNL5
	 i0EEqg6X0C/VpCkM4i2pQB6iB3x2H/+rNxglFCRpAT0ocD/NBCdSnxuH3irT44DdWqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8CLRxjGrgnc3g9yFPsKCLb5zi7Ab6DJWbbm7vTXq7rU=;
	b=ZZq8FBk+jlt6bkES2JnbOewboOPTmrf3o3eFArk4a4bOEiK1AYf5eLm7fCssUqObuNCn
	 fD8oUqRW3TDVpCQnmtuLJd1aG++/YJE5D5kilkB/nJR9EunEQ7IZAcUkPgUAfmYt2mj8n
	 QTzkvf99Gt6HqdJKMGihfwaQ2YzbMEd6U5FNMOHE5PVy1odCR7HKGr6jSZ05UIHdu8tJi
	 Iuf4BHsvY3FtjerogwYDxF54+sCs3C6u0Y4kpPHl6N5JdYUbK/2XudlfbO4b4PvjITB0G
	 Mt52Qkt23cBZNcDu3IEduMWelBOMAG5Nah93Vjt+NygqIFnUlLD0PJGThnrSqIsdOyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wZKN2tQO;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C57606A885
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C57606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wZKN2tQO
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so22261745e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424773; x=1795029573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CLRxjGrgnc3g9yFPsKCLb5zi7Ab6DJWbbm7vTXq7rU=;
        b=wZKN2tQOCkD9ywJFG6rGISczED63TO/YVKwzUVOLVmvMuyhJkgTxAF+GDqyf8Vj/i0
         NmC8/t7UJ5koXLA+LjQNn2zQx0V00uxkLo0u7Qx9Y0DVxmDzbQlTnh/s3+Lq7UofuI+G
         UEJejmcURh/wkZSU2MWnWReY65ajUpftO9gxt+AWssFt+eJ3DJOLaSRplsrY/jvz3jbi
         zWXatmXfy413N/IiErQ4t6AFS/i8bpCli4sbUnixLGEAXKF7aoUDaLbp0PiateU8G50d
         RMFThTL1Foe8d08v3yqPViK8OgByC+EMSWJXagGv72VT7hU5JBhRjACCfXZDoSjaUN+h
         zRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424773; x=1795029573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CLRxjGrgnc3g9yFPsKCLb5zi7Ab6DJWbbm7vTXq7rU=;
        b=jMZmKHlTuc1VOyv7gdEn8B9p9OK3X8dzfB0npUJ7gDuYrRaN1vI/0l6SSrZspFDYeW
         AdKKqDcAsYu84MKN2AyjFVKtF2olbU5gHQyFiPufMLcbjIgheJAAcpQQgBTTbIY3Zd6O
         0PeZgaPapC9VohUMrob4QnOkfMNxJc7K6VkMdUVbBytFnos/PVd89cdbzovLDbGLFZrg
         JCp1viLy+nW0w23dslytaJQz0/dE+SCkM3/aXAhVH5w+sat2BcdO7EAZigFDAc5O8n8Y
         As/vS8tqSXg4h8f4LoPR7tVa3jh81vl0EIoABgVMOuUOkwr6CbxqXAS18EBSDbW8qi1e
         XFKw==
X-Forwarded-Encrypted: i=1; AL+hErFdDj1SpV9QotQBlvWJ9lJM5BZrbw1th31GMLgpCmoj7q0gWL92yST61fQihsGGzGHIDjczJJwX0uREKIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ihbaKhYkbbJubFWkrDfVZSQ79QH3vkabdn9Smmh33oKcMnTp3
	yTaxyF5dLORi6bL3ai6PocN7IWF2ZBnHHTi5F7xLKwhtT82pxtfl9/cN
X-Gm-Gg: AYBFou0GXhFNXFE+f8yCZsevnIwPl2q2PMyG7GspHQRFUrMdaZuhKsQpsIkPT+im06K
	W0lz69ZIWe+QS7I7jtEuqCHRLwpeKvFN9NheDM78solAyN8yuhqKj4Jo8r0wAjWWQSAsZhFZu2l
	lfDXQKnysR0eKRV7nSfNQ6wdiyw1mZ4xbSK+7zRpamvgph/UAoOiuBonv+nrgQ+d8mCcFKCyAAU
	25kMWMYeiet3YuvCVvxDmVkNqhwQJ2fRcHYchuvZQgT2iG9FIHzT/1eRPRBrlv3a2SOUDk3n9F2
	Qhyt8jCGSDBRsG2tbw2thnbMZHiU6NZW0EiXM7JpJRtP4XRcI+xZ2wVxjXU8S9fTCfkwYaksueY
	PlfP8RO1DnEyipPHp8xOp/NIccjZ7n60X62jlN6/kOQiXsnszrUDZjgRjV9L5kJWECyhaPSLfj+
	kQHRfIgm38/UxQtB+BinJ9y44YYBGRQO6kiRf08kMMiwIfoH5QPdjHH84x1wTiUKoVK818Z1Lak
	MBE2qVEDzbxiih0f8Odo1zvAnq1ixKqogWgXyX5j3StuW3rYhdKoh0Kn5jDvpCyvVSQLZP/vFFV
	sWwd/zE79rboa1VPJnuvG5qYm0z6EcHGwTp2z5DCf1hgOn4gf2lDNoXkqEqPaaZ1CD2uCLOI71J
	SE6PgEFeo
X-Received: by 2002:a05:600c:3f0a:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4ba091a5148mr63037045e9.0.1794424772838;
        Wed, 11 Nov 2026 11:19:32 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e267dcdsm9345305e9.11.2026.11.11.11.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:19:32 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 11 Nov 2026 23:19:16 +0400
Subject: [PATCH 1/4] serial: vt8500: Find console ports in the serial core
 state
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
Message-Id: <20261111-vt8500-serial-cleanup-v1-1-b33594a25f87@gmail.com>
References: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
In-Reply-To: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3082; i=alchark@gmail.com;
 h=from:subject:message-id; bh=p/31Oy3JuvkdbBOoFFziUsr3TcuAESl+1LC0x6wy1PA=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR92b+/eAJzGzMbv4m/V+obwQmrEr9/SZu88cLqA/fPf
 dAqqzk9q2MiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpdhZh+CtZE6Fknnt3ucVx9cWJgpt0ArYEB3G0BkqHRPB++qJaPIHhr8Bn199
 h3+tb8ye6vRPyab/pdz0jvTy0rpfxzrbFM6qVuAA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Look up the console's port in vt8500_uart_driver.state[], which the
serial core fills before it registers the console, and drop the private
vt8500_uart_ports[] array that only mirrors it and gets in the way.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/vt8500_serial.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index a7f167a73416..6c53e108756a 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -444,7 +444,6 @@ static int vt8500_verify_port(struct uart_port *port,
 	return 0;
 }
 
-static struct vt8500_port *vt8500_uart_ports[VT8500_MAX_PORTS];
 static struct uart_driver vt8500_uart_driver;
 
 #ifdef CONFIG_SERIAL_VT8500_CONSOLE
@@ -472,28 +471,27 @@ static void vt8500_console_putchar(struct uart_port *port, unsigned char c)
 static void vt8500_console_write(struct console *co, const char *s,
 			      unsigned int count)
 {
-	struct vt8500_port *vt8500_port = vt8500_uart_ports[co->index];
+	struct uart_port *port = vt8500_uart_driver.state[co->index].uart_port;
 	unsigned long ier;
 
 	BUG_ON(co->index < 0 || co->index >= vt8500_uart_driver.nr);
 
-	ier = vt8500_read(&vt8500_port->uart, VT8500_URIER);
-	vt8500_write(&vt8500_port->uart, VT8500_URIER, 0);
+	ier = vt8500_read(port, VT8500_URIER);
+	vt8500_write(port, VT8500_URIER, 0);
 
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
@@ -502,16 +500,15 @@ static int __init vt8500_console_setup(struct console *co, char *options)
 	if (unlikely(co->index >= vt8500_uart_driver.nr || co->index < 0))
 		return -ENXIO;
 
-	vt8500_port = vt8500_uart_ports[co->index];
+	port = vt8500_uart_driver.state[co->index].uart_port;
 
-	if (!vt8500_port)
+	if (!port)
 		return -ENODEV;
 
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 
-	return uart_set_options(&vt8500_port->uart,
-				 co, baud, parity, bits, flow);
+	return uart_set_options(port, co, baud, parity, bits, flow);
 }
 
 static struct console vt8500_console = {
@@ -683,8 +680,6 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	snprintf(vt8500_port->name, sizeof(vt8500_port->name),
 		 "VT8500 UART%d", pdev->id);
 
-	vt8500_uart_ports[port] = vt8500_port;
-
 	uart_add_one_port(&vt8500_uart_driver, &vt8500_port->uart);
 
 	platform_set_drvdata(pdev, vt8500_port);

-- 
2.56.0

