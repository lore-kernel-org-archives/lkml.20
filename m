Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7151237E5D0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802225; cv=none; b=DAYv9CYVD8AlYLxbvKdgwzfUCCCpSw9urOWGXTXJcvBGhZmjs+9D8IMrV2jKvKiio0iAnVQbjFcU1kY6de9VTbip0d6NkYoIvYqwkQDvdhPujZIuWD/yzH6O0QtAP1O6qn0rzyXwFkEBETCUUZ3KX84ZjoU6s4GgLGAyFv4nhd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802225; c=relaxed/simple;
	bh=T4JwvNiKyKe1vIFy4XFJVYqOHV8iMgDhRVjX5xCltyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q2HLLmnRM/7cdAZEPe799ys9Kt2aY1+d9xl6DkuCbzuhfJ/dIXmcnwgL8T1T5L19P8XCYpIz2NP5VoJq2CDv+X9GeiP5EGL+KMGKX/vvZObwitFnjTH7QW+Z9Zb9AxStyidvGcd8dTM49PKIGH7e52nNaffkhn6e2DPMkycrR/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fa8rSJVC; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fa8rSJVC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so1969285e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788802222; x=1789407022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZ86GWxn7cMIjKY1gWNPGGldMktBFPiJBaQxAJalFVE=;
        b=Fa8rSJVCRDbKIO7HtKyTbp3hkSDzb9J8FtTa55yjn6giHRgN2Y/ubgNFJ6m4D355hZ
         tDskQGq+j0imtotHytqjKyUeIMM/upinoKiqQXmv9yv4e8xSHytRxha+CcpWNpnJdDuk
         CG1ytZofHnv6vBgpVg0LH8eCPokiDIrHviI0dvDW5lDmQIW5TwYPO2YW1QWYQbBae9jv
         isPCiUVeZ6DXhrhbwg2iyz/21weuHSYdtTU5yhigxdFEUSldyDSnqcSu/EFcZ40aSCV+
         FpBqYl+E7F+FB2bd+p1swrxWWd7AHMDCfuKDa3CmlkUsmbQaM1qZTdR35cp/tnuBPq/N
         3fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788802222; x=1789407022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZ86GWxn7cMIjKY1gWNPGGldMktBFPiJBaQxAJalFVE=;
        b=q53/GKGq2Lyv65ibe/KIirVNAIPuz0PJ/alcs5UjUY2amlU07XfVJ6ON/LDdyC7s+M
         5zA80Qc7X8KiR17FTG4M7K59U190oqeWg1lNeL0c++ioOVm1KIVdqfzYhPIHgrpF1A9w
         Hs6q0AVqd16xD5xdNh/IFssXIm0hiwQXMBSTbW/Y1gcRY6fTV+mT7XvKVoFY4PaSJXM8
         QE+xncO0ItcCo3oGptulZNiGBnHxr8zlaLKfT9gZwxkq0yFFRjzGg9vO0w2RBW4rTcsr
         6HY0yZ0GuOAubTeqyXnC7RAtCgVgFo8/nk+sPFPRDudFfIiuOCX2Y3iNhqNqG5ZmMt2I
         cm/g==
X-Forwarded-Encrypted: i=1; AKwUvBwHX7xbAf1G0/cDfMhzguJnOo8tWO1OVB5XDTpHU4TTKEzXUlSATEj0bZaK+0fvOHO0bleyTmx39SXbuEY=@vger.kernel.org
X-Gm-Message-State: AFuF++m443KuqqWyU6iwE1du46ksoU+KrTJ8V/7iTXlW6CyX761vo6mH
	KtCSVR9Jek707FUU98YayOXm8is3xCPz1kd7Ie62ymmRxlo+zcRwIeK2
X-Gm-Gg: AYBFou2NxZozyOJF3WqRWPapj3W0aJhzs3x0VJQX1/Pt84H/SuCb3AfvK3d8gj3b6dW
	wgujTS4Sj8gZZD1EjNjeO3G/qH4R+mnRnrSEn5xRvWE7waAwJCWxfZQK8i4PpTYDxLyv76MQ/Pt
	/Kfu+wOIDU1D+QF2/+X9b+Y9C+raBnyLgtOIfoDukbxMMswURfcdUIH/Dmm6jgU3ksppfmNwLYK
	6Z4TPYqfWPtE/El1867/h4AKKPbO6cNm15JNSJJFyCySABJbHr56H3TE/29dwbMTX2lDGY6K6Ja
	12m7IdQvzCkosR7mIqhRTqvpKoP312dKdoUI/+y9wLj4+go+G/ClNZXAkAdQJCrNTB8PihE+zfL
	phNMTYlbS3awyyJ5O7UlByNRv/useATGSQJGzvh7ih4RP2dk9bQqndBOLn/ENEBplPIGFlNwphT
	N5VAui9CPdtHIfQFCX90xSjXn7sQjl42LEAQRvfkMtoO6W6ag4b8HbA4+VAWI3oLaFku7EgkUv/
	96IYMTDS2WBCvuHLIhcMnzqaMMyjvjzmmG9Qgp6lVhI39fRxFxI698Wvj7Bg78tWRN6e97WgWZF
	Xfk=
X-Received: by 2002:a05:600c:4fd6:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49d1754ecbfmr25475085e9.5.1788802221462;
        Mon, 07 Sep 2026 10:30:21 -0700 (PDT)
Received: from MYL150-3871.localdomain (80.151.89.79.rev.sfr.net. [79.89.151.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm444595195e9.14.2026.09.07.10.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:30:21 -0700 (PDT)
From: Nicolas Thibert <nithibert@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] serial: 8250_of: set UART_CAP_NOTEMT for rts-gpios RS485 direction
Date: Mon,  7 Sep 2026 19:30:00 +0200
Message-Id: <20260907173000.1254045-1-nithibert@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__stop_tx() (8250_port.c) only calls the RS485 rs485_stop_tx() hook
(which de-asserts the direction GPIO/RTS line) once it has observed
both UART_LSR_THRE and UART_LSR_TEMT for the last byte. If TEMT is
never seen and the driver hasn't set UART_CAP_NOTEMT, the function
returns without scheduling any retry -- the direction line is left
asserted (driver enabled) forever, with nothing to un-stick it short
of another kernel-visible LSR event.

of_platform_serial_setup()/of_platform_serial_probe() unconditionally
wire up the generic em485 GPIO-RTS RS485 support
(rs485_config/rs485_start_tx/rs485_stop_tx) for every port they
register, but never set UART_CAP_NOTEMT, so any board using this
driver whose 16550-compatible core doesn't reliably surface TEMT for
its shift register hits the stuck-direction-GPIO case above.

Confirmed live on an ath79 QCA9531 board (SoC-internal ns16550a-
compatible UART, RS485 transceiver DE/RE tied together on a GPIO via
rts-gpios, linux,rs485-enabled-at-boot-time): the direction GPIO
correctly asserts for the duration of a transmit, but never
de-asserts afterwards -- confirmed by sampling the GPIO's debugfs
state through and after a multi-hundred-byte write, on both the first
transmit and repeated back-to-back transmits. Setting
UART_CAP_NOTEMT, which makes __stop_tx() fall back to a frame-time-
based timer instead of waiting indefinitely on TEMT, makes the
direction GPIO reliably return low right after each transmit
completes.

Scope the fix to ports that declare a GPIO-controlled direction line
(rts-gpios), rather than setting it unconditionally for every port
this driver registers: this is the class of hardware actually
affected (RTS state has to be explicitly un-stuck by software, unlike
a UART's native RTS pin), and it avoids adding the extra frame-time
margin to ports relying on the native RTS pin, which this has not
been observed to need.

Set it in of_platform_serial_probe(), after the existing
"if (port8250.port.fifosize) port8250.capabilities = UART_CAP_FIFO;"
assignment, rather than in of_platform_serial_setup(): that later
plain assignment (not "|=") unconditionally overwrites
port8250.capabilities on any port whose "fifo-size" DT property is
set, silently discarding a capability bit set earlier in setup(). Not
observed on the reporter's own board (it has no "fifo-size" property,
so port.fifosize stays 0 and that assignment is skipped), but a real
regression waiting to happen on any other of_platform_serial user
that does set "fifo-size" -- which is a common, documented property
for this binding.

Signed-off-by: Nicolas Thibert <nithibert@gmail.com>
Assisted-by: LLM (Claude Sonnet 5, Anthropic)
---
 drivers/tty/serial/8250/8250_of.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -233,6 +233,24 @@ static int of_platform_serial_probe(struct platform_device *ofdev)
 			&port8250.overrun_backoff_time_ms) != 0)
 		port8250.overrun_backoff_time_ms = 0;

+	/*
+	 * This generic driver never enables a dedicated line-status
+	 * interrupt on TEMT, so for ports whose RS485 direction is
+	 * controlled via a GPIO (rts-gpios) rather than the native RTS
+	 * pin, __stop_tx() (8250_port.c) can see THRE without TEMT on the
+	 * last byte and bail out without ever retrying -- leaving the
+	 * direction GPIO stuck asserted after the last byte sent, on
+	 * hardware whose shift register doesn't reliably surface TEMT.
+	 * UART_CAP_NOTEMT makes it fall back to a frame-time-based timer
+	 * instead of waiting on that interrupt. Scoped to rts-gpios users
+	 * only, to avoid changing timing for ports relying on the native
+	 * RTS pin, which this has not been observed to affect. Set here,
+	 * after the fifosize-based capabilities assignment above, so it
+	 * isn't clobbered by it.
+	 */
+	if (of_property_present(ofdev->dev.of_node, "rts-gpios"))
+		port8250.capabilities |= UART_CAP_NOTEMT;
+
 	ret = serial8250_register_8250_port(&port8250);
 	if (ret < 0)
 		goto err_dispose;
