Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3C4EA38E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794885; cv=none; b=hlQ3tCC9fz3AZ+S7Jc6n9wjrJjnUMII6gr7npEysnsMliGfILbgCxWhMrHo3wIJnUuU/Su4+KpR9zCD3IgTwzqysRWF08PRyCTNTWPfFnuBwrCEJDNHOjDz9DgHBBAk/s4FKiAg9uhx4Wp0ylq5VxuV2VBU/Fp+45byO2+wuosM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794885; c=relaxed/simple;
	bh=vhajuZrsqmCwOt5dYh0K0ju9UJkTcDDqh+0g8hbzEHc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TXCqK5nyi1YBh8HO0kBilwZihbJvDJN2ME5WUGoRcVH+wHjx37vxlQOecB37qHY6RdVe3oYUnEf9Q51zOoBoApJstUFGGfc8QjGM3Rn1+N6J2qvzpJq2S00boIdH59Y3AA6v9zLthNZM1iD2u9PDPfZjG9JSBEmO4cdYnarUxvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNeULgsG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNeULgsG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4858595f997so2198696f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788794882; x=1789399682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZQ7Pm71SixvZJgMI4PIPsvZ2aqIswjWhqrRzsbUnlg=;
        b=oNeULgsG+OmZ+vwrMoX/PW+Y1cfCIc+lj3pg0/j8kZ9oxqT1J+Xthr/6QEBKed7PqE
         7xy99b9Cw9R4jS3WZaV8O7mJFuF1kSriJbWNRorIgEaO3KoXEiQPZeXm2sdln2tvN8EC
         CWxwCpq0Bn+vVsrTJ3JAWbBBF7s0u/PXL2XOCukzCkg2RGUuCnELFzjcKgRhG5zU/ngm
         3MhgcyQ0pxW3SG9Mhc7YC7krgjlhAxdrSebOo6tYoxlvcTsh+BLacIDkNFqwAGYKD/fK
         1WeoPyvHKr0ybFe2JgramOyysm6wCK3M10YjcotPPJFMN6rF1lYCpx/FD6M8PZ6p3ZvF
         04Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794882; x=1789399682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZQ7Pm71SixvZJgMI4PIPsvZ2aqIswjWhqrRzsbUnlg=;
        b=psVOe/kNuqSaY5g4GdEBidCTHXs2H6IUN3i7kEidw/ZrANFSZ0eemArRfPfbM9GJ9V
         /vokZ1dpQh3/du8GTnExJyy7d7PBotaBWzCp2f97wtIsPV6kM6ORSoH/XaTTYerqq72d
         LxmiGVhD2iP/4DbgHmOV+3OwKjb8DHwUyLR4oKI87eXLFoXUfG8LrXcKQjjaouF2GA+U
         55Y1Mc0AoIMeAnkgYSgtWKze98Z2VLj6GP3Ge3FKNBMNwUzSRGNlWUkqstBfpt2MfanD
         7yXFI/EpJ8Qki509Df6yDPLUJ1wZhxqDHUn5Qtxzm/jC1tIdS7U02WBwrZWyxfs4bDBq
         dzrw==
X-Forwarded-Encrypted: i=1; AKwUvByzDx3mkiD06hfJy2o6h4IZu+JxbkAQEWx5T3uZPsMjvoR5swwrok1Hx5Tl/TvtiKMBZeLYwMmRdTzkyZk=@vger.kernel.org
X-Gm-Message-State: AFuF++l4HwM5pWldKVXDGVlzvRR+3EYGqB3p5i31qjQogQ361mtgrfHp
	kYYWf2go998ZD5XlLdRouDHTiTL90RLQNWburhBLiQbCTeoGE8cJw8Da
X-Gm-Gg: AYBFou2ai7ydvFa7vJT0xHg3w5WMuRaIeffXHQDI7fMWeFggXzfsIJC8AdqpMve8aBA
	H8Fh1mzb9pmI6VizuigLiBtpU9bNFiyCe6cuVj0Dnd7KpO+LEAqsnhf+eQ3maeUM1B5vKI8fvi1
	t8TPTx3uuZpHKsXCijpJGCgfNc7RH2aBH5biApJogtyRQwFDc0HhVA8s9H7jdJLMpEfIbsIkZ+z
	oxTIIeV3ZEALk0uPskWhcJI4jOk15rX6p7Jxz8UM7JIGsInyWGIwpZ6bsGDf7cUJJ5mKIYwOeYi
	wEcR2Q4Sq3JjITVCkWaCAziS2u0UnjkbpXHKpN2QLePs5hz1+nXRXrMaxEDxiY/pXVJFiblMobH
	vV5aJRDhHeuMPzaJrOvZHhZRna35N0BC253/TIfKXNdlKQHSdMKbTFUTgPaHTLSrvgbZr1dvqAs
	TqbT6Y6PG3u6jJFJabqhzBQWU8pF/U16aFYpRt2kTqt1RZIWbf4f4MX6vThjRx+Hclk5mHKcNm1
	6bYFrxL51TzcDZ9cebvR/VaskMmVrJ+PrqmWi2zADLsJzF8WidzY9wVaU3qCC8bsWVBe2T8H6bZ
	d04=
X-Received: by 2002:a05:6000:470a:b0:485:8101:dc40 with SMTP id ffacd0b85a97d-48587057037mr38784665f8f.9.1788794881422;
        Mon, 07 Sep 2026 08:28:01 -0700 (PDT)
Received: from MYL150-3871.localdomain (80.151.89.79.rev.sfr.net. [79.89.151.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm28525915f8f.23.2026.09.07.08.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:28:01 -0700 (PDT)
From: Nicolas Thibert <nithibert@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] serial: 8250_of: set UART_CAP_NOTEMT for rts-gpios RS485 direction
Date: Mon,  7 Sep 2026 17:27:44 +0200
Message-Id: <20260907152744.1084359-1-nithibert@gmail.com>
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

of_platform_serial_setup() unconditionally wires up the generic em485
GPIO-RTS RS485 support (rs485_config/rs485_start_tx/rs485_stop_tx) for
every port it registers, but never sets UART_CAP_NOTEMT, so any board
using this driver whose 16550-compatible core doesn't reliably surface
TEMT for its shift register hits the stuck-direction-GPIO case above.

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
margin to ports relying on the native RTS pin, which has not been
observed to need it.

Signed-off-by: Nicolas Thibert <nithibert@gmail.com>
Assisted-by: LLM (Claude Sonnet 5, Anthropic)
---
 drivers/tty/serial/8250/8250_of.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -156,6 +156,22 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 	up->rs485_start_tx = serial8250_em485_start_tx;
 	up->rs485_stop_tx = serial8250_em485_stop_tx;

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
+	 * RTS pin, which this has not been observed to affect.
+	 */
+	if (of_property_present(np, "rts-gpios"))
+		up->capabilities |= UART_CAP_NOTEMT;
+
 	switch (type) {
 	case PORT_RT2880:
 		ret = rt288x_setup(port);
