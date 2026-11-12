Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497641;
	b=RR6ZokgaNpJhxMMIyy8lF//ghEft87dyib5mBY0gnUgpcr73rm4iSueJ0997YiEYzhju
	 HOfbc9/AKmpsbmDo1ZcKdoPW76j7Ma9UFlof3+KbL72NTWeHiVONp400/toT7/t13xECh
	 JRCRkJPQNByOQTutNsBr5hgOrFytCxhQXQjf+81Waj/b32uz1jfK62hVkUlGI27b4KqP1
	 N8w/3rOApCUcDA9ooDQ55y02PKGKeAJiZFUNooU0QPOluiHwPWKtScZ+Kx5OFrqIQlueQ
	 MWSGoTGcEIhiHCTxl3YAYo01IBlZG8gIQ3agJoaW1l+IZXjat3pMhZM2YYMwEVX4lEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6lC9fobCw8jtySKuvUyiU/10ib75zIoG1CNd+i9ZAGU=;
	b=sZm3aH5UqPGKcFKp71+ehZwRREdwvKnxQrK8it8NufJ9bwbPN8gwXuYsLMH7kaMUucm6
	 NGb//dL0UyT9KMaT4xj91T4U5FDs6jr9wbzTGlHDDEegiRAt4ArlehATqvXoljxR7myOu
	 yaaXh9ij1xDQYcrP3IFwT05dJXuqEzQk24tHYGo/IBVwBK1p0un0YCdIf9bkPIMTjwTgO
	 3QtfFRarO554eiIHmfv9KZ953aex08+2bqVgHThtul9L0H9cu9BtHQI56YgylSCWfRHRE
	 o8CIdgIMomglSZlTLwvSjCbTRpzrsXfxVWz2sxBCmq6eAJo10GBzDwSXglQLHu4/6LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EokDPv8x;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E95606A887
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E95606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EokDPv8x
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so47283525e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497639; x=1795102439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lC9fobCw8jtySKuvUyiU/10ib75zIoG1CNd+i9ZAGU=;
        b=EokDPv8xKSqSlNX9ETMSGbsztjgoWIdnSbgwLZlFpc3HMtyZTokbSKgZN4mWoU0uzE
         MUCSAh6WltB95VqEz+zVH4BmmcdwT93k99XWkelkaD8EvE6SdfxiaYzCmG7mh5vNMimg
         7U6V/HeIXlIRikEI92dq62FEzvFEuK34ErpsEv2aqnPwY5pfyUhqbjCiAFzZ4eqhLRn6
         2gnnIyMA+Y53ot4D3sREtol5p9EDnPEQ1up21a1WQNWKWmM57Mw9fGNwghUovWAv35Sc
         pNmASa1xZWspTA3/fABLO+z/Blq6WDuqnO1OCKiYlsUmM8S33hA/xUaoxN5hWlemg9sy
         B7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497639; x=1795102439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lC9fobCw8jtySKuvUyiU/10ib75zIoG1CNd+i9ZAGU=;
        b=bfRzguJDgV3jfdUjy2uU3v3wsmeE/evSOHXqysYQY1ZxwfY70u5+T5kTJanZ7djfUq
         C29gJINKgahbtEcQzlyjR5bXraliCRJxA9zRnL1BHSproWDyxhlGL7VPSXecqs4yEX8O
         6niTanKGYTDsSeZKdqdTMd9MZjxzUpAXSOns4YbPUnriQ8w4HdiuZbNl6Z6Wbsquol+Q
         0ahCnDjL1sOAhM7N4ZvBzd7mbzM3az6f1LbpZrINrwtGylfTjNM1sg1TYDl9uLGIK46R
         yit4X9swZ1TCv6AWnVUUEnykkD5qp/KkOWqzfrzbUUKzNgj3is8sAd2HP4o+ln0HSQcb
         QtAQ==
X-Forwarded-Encrypted: i=1; AL+hErEOdeFp/rNL35CnDNp4sgqCTVd+caknpOG+vRxwYJkvGPZIDsNmUmMOwooJnqkCpvY3TKhPzEkPpMbNggY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fvXagDkIcd6qc39I9YTKiGTUzxIfrvdccNDb0dqYtqcO9ITJo
	+G228KkBvrsqFDTRE1VHoyRonrlAq4bHdUvqolBBHM8TS4hQ5j+1//Uh
X-Gm-Gg: AYBFou0O5GjZvf/xkVmp9oy0GZHxFTrqde8MlYSHrSLXh0NQ6BCrEYZaKDBCG9fRuzi
	eyF5e47se44GKlnCAlMhMpiZPI71S1O1EWGSrHwASGeXLCv165ANgcbnJ3zXRTgzd3qYR+i7PS2
	ZD6W5i0A7LKgzrGfxfFYiMJ6vW/q+fmEUZqyTSdfg5H5Iotsi0pr/eSHDBLIrrymD0K4eo8L6eR
	Zhq7lID0sMZDhXtS/l6kiTEZxl068kQ3Afh3iAQt17/7cgDwPSU2Ir87ATE+RprY4pV82NQ5H72
	63U3rJm3V1QMQB9+D6wShZD7ACgblGwLlZIyS91kyLoxua081LSqhWI5PP66XDktGhZi1/J77Pa
	xstNTtpc+wrgtr+auB4u8vXFi4l6ck7yHQmPN2MP/axR514250i0G1EotANkN2xuv1fIK8dgnCV
	dht8cd3o4Pgg9W8kdkgDdaoc67QlBNh6W6+ErSjiMAnue3V3UV6u1ZAyPHES0JETBI3GR/hkYJu
	dD79t25tMicgZmYF5ZoTOeK7jFwwdpKghmEM4Qy6VeKvIpjLTZVgZ8IpA5Fx6o+MQ/tCst+NZeB
	7ZcODUKS+vBQHHXpddO1EwTsqjOBzUOaubr16qdgXrde2bv0+Q3lZBKLsngCbk6oBS6jFQ1HW0n
	H+gBUkQ==
X-Received: by 2002:a05:600c:e558:20b0:4bb:4b30:8042 with SMTP id 5b1f17b1804b1-4bb4b308088mr60698665e9.19.1794497639340;
        Thu, 12 Nov 2026 07:33:59 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2593e4sm87105855e9.5.2026.11.12.07.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:33:57 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 19:33:12 +0400
Subject: [PATCH v2 4/6] serial: vt8500: Drop the port index bitmap
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
Message-Id: <20261112-vt8500-serial-cleanup-v2-4-36b258e0c0dd@gmail.com>
References: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
In-Reply-To: <20261112-vt8500-serial-cleanup-v2-0-36b258e0c0dd@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3072; i=alchark@gmail.com;
 h=from:subject:message-id; bh=jcZiVN1H4g98kKKxKtvLfwo5DJs4n8bgP8iSaXWS7PQ=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9veNVbnW206G2RPjcydy2gPKuWSVLNTMqt6RvDzt25
 HHy55jjHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy11D9GhulSd9anyf49pKkfUaeiMq/uS/NlzjdFh3w7rMynn/G6Kczwv/aaJYs
 025G1j19l8Ch1hTznyC1fN6O5oT/qgl8m0/cyDgA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Stop reserving a line in the vt8500_ports_in_use bitmap before probe
acquires its resources: nothing ever clears the bit, so an early probe
failure strands the line, and a retry then fails with -EBUSY on an
aliased port or drifts to the next free index on an unaliased one.

Keep using an in-range "serial" alias, and otherwise let the serial core
pick a free line while it registers the port, so that a line is only
ever held by a registered port. That also stops an unaliased port from
taking the line of an aliased one that probes later.

Fixes: 4001130df1a7 ("serial: vt8500: Add devicetree support for vt8500-serial")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ca000721-4a5b-4d88-bdb8-7f1e438dc81e
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/tty/serial/vt8500_serial.c | 37 +++++--------------------------------
 1 file changed, 5 insertions(+), 32 deletions(-)

diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index 4abd4a8d5ef3..0c8ddd55f94d 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -90,7 +90,6 @@
 
 #define VT8500_RECOMMENDED_CLK		12000000
 #define VT8500_OVERSAMPLING_DIVISOR	13
-#define VT8500_MAX_PORTS	6
 
 struct vt8500_port {
 	struct uart_port	uart;
@@ -101,13 +100,6 @@ struct vt8500_port {
 	unsigned int		vt8500_uart_flags;
 };
 
-/*
- * we use this variable to keep track of which ports
- * have been allocated as we can't use pdev->id in
- * devicetree
- */
-static DECLARE_BITMAP(vt8500_ports_in_use, VT8500_MAX_PORTS);
-
 static inline void vt8500_write(struct uart_port *port, unsigned int val,
 			     unsigned int off)
 {
@@ -606,29 +598,6 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	if (np) {
-		port = of_alias_get_id(np, "serial");
-		if (port >= VT8500_MAX_PORTS)
-			port = -1;
-	} else {
-		port = -1;
-	}
-
-	if (port < 0) {
-		/* calculate the port id */
-		port = find_first_zero_bit(vt8500_ports_in_use,
-					   VT8500_MAX_PORTS);
-	}
-
-	if (port >= VT8500_MAX_PORTS)
-		return -ENODEV;
-
-	/* reserve the port id */
-	if (test_and_set_bit(port, vt8500_ports_in_use)) {
-		/* port already in use - shouldn't really happen */
-		return -EBUSY;
-	}
-
 	vt8500_port = devm_kzalloc_obj(&pdev->dev, struct vt8500_port);
 	if (!vt8500_port)
 		return -ENOMEM;
@@ -661,7 +630,11 @@ static int vt8500_serial_probe(struct platform_device *pdev)
 	vt8500_port->uart.irq = irq;
 	vt8500_port->uart.fifosize = 16;
 	vt8500_port->uart.ops = &vt8500_uart_pops;
-	vt8500_port->uart.line = port;
+	port = of_alias_get_id(np, "serial");
+	if (port >= 0 && port < vt8500_uart_driver.nr)
+		vt8500_port->uart.line = port;
+	else
+		vt8500_port->uart.line = UART_LINE_AUTO;
 	vt8500_port->uart.dev = &pdev->dev;
 	vt8500_port->uart.flags = UPF_IOREMAP | UPF_BOOT_AUTOCONF;
 	vt8500_port->uart.has_sysrq = IS_ENABLED(CONFIG_SERIAL_VT8500_CONSOLE);

-- 
2.56.0

