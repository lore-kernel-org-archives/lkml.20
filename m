Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440439;
	b=EGFWeeEINXZNvtvHuIw99ULO5bu8wSeGsGffxjrbAoyxQz88ck/j3QLEHqcvC/nRyt3o
	 NvNpc9zNLwaU0IHW+CA14y25yoyI3JxBWYdLmwvUwwZ9VSycbyY/g+w54nl+RkKCKCnYM
	 6Q7Ug09gsrluCgMu3yHWg28G9Qdym9pMcVYJAf19AVph1HImDb1HytthuuH9KQ85ZvFJ9
	 IrIZB1E2ElSVAKaVKeyqOqK6pmyXJZQ7jjXGjDqXEa6L+Ajl98vrFYWVjNC6UG1agCnFL
	 y/3GLWvw7WpwRJEg+7f5aPIwmfM/Lry6mQs8AgVq/B2+C0214Z1TnNOCZ4hSDklYhCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YPV1ND+Y5cr1ZRV7QTF9T5CIKQmib3RaWdAMyy6frHc=;
	b=n1cQ53gAW6UT2wwTbd87mbKO800xhrGvujXU4I8159JLgPHRgve7XydXpdHANfjzWuN5
	 g38qauhYPkPzctcY4k11bBrQeCvVDAL8hri4uT9JH/L+iW2E1iTj1yFCC0Alha0AWMpAu
	 j88M6jwI29VZe+gqMyn5cw9jLT1ZspZNvdDSwJGp+uyiG2cHSBiezVekY0QiJXYlBGNgM
	 Xk/sEKpOJyKtXFhIottMLlgm6h19LbJgU8tnHPt5uFxLlsmslIxYKm4vUiYodGixjcuZw
	 ScWp1MEQUwR5TxDyjC1AgeZE/HnqZwolcsGth+WVpBYLeoiEE0oWpwKaZ4s5Eu8ZWMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l69kuM9n;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5D5606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D5D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l69kuM9n
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5e519c39196so797305e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440438; x=1793045238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPV1ND+Y5cr1ZRV7QTF9T5CIKQmib3RaWdAMyy6frHc=;
        b=l69kuM9nBsR+l0ZfD1qjwGocl2TfXqkwPRTz9QKrnRXYHyEZEaUQB9/V81hETBJtTy
         qELQXTDhgpHVOiISHZ2PVXDIQRTw81JGSlXOIVsuMspQX00wJKUe+YOL0slnZdSnuInZ
         m4dUeryDiyUV5vu5zV83G79vFU3kAG9iMq0gpiQdXinEf+gV0T1zL1Xthi4IZ8wWH9G+
         ZHGcU3TQFPp0rkjpcKCUiNeSwMjTzG0uSbVVFM91nSVbuX/2wmK9L296XET3BfitHEGx
         INGY13UsZ1Zo6h2wy2kqU3D4axkdLslMai/yZ1G4bYuxDyYZm7Wn6C6wnEW5ZUAc0bV5
         8Ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440438; x=1793045238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPV1ND+Y5cr1ZRV7QTF9T5CIKQmib3RaWdAMyy6frHc=;
        b=mG6syh9zNOdAjLzjFhITes2h+JWZS3+hldVrwzLUM6nq7SMR2ZMmQv9eZmZ1dyBivo
         43EIExgG3LWJFUhsV4zUlKpPHa20ug/xxVRv2W7LdfNbC0AySS2C8V2iMz8Tq8g9PgNO
         w7uPmVvu/W/OJrD21sl7VAGaQ4rm8MVvfFLwufOehNiiycMOKu3U4bXTCZ3+dWML+FvO
         SYHp2AGnWgLOsZkb+/40W7pbdRit5LzaV3vMN6PP5tAs+eYDf20Y+lyVMbUVUszlOqUr
         rbXSbJ0KqkZ5QZlIsAo4Bw9EMeogxAQtSSyDJ9BRAQHans5Z1O1VgyAn8OPavTg4tu5z
         g8gQ==
X-Forwarded-Encrypted: i=1; AKwUvByCBKZZUgoOMkQ43IpSMPaCVPjpQEJzzzqh04iyCcyGYqSvj0tcyymQaiy9jBADdZbufccwOJje0ZqhbTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcL8uyFtqqU8I+L/aZyGNzRzsivFBaQUsewGac3aAuI9APuHkE
	wPPmqblJ7sXZ3m0q+lJNm0LzEK8AO0eGh4Y9j2NiVy/iVKTv2DrOAngO
X-Gm-Gg: AYBFou3GK/06rnNSw8liWyzsHq03HoN9RV5gv8isRALc96u6c1wO3+otQujvQpSSseM
	Xgh0iM8pohOIWaOzaPU3ezjvainIDKhL91tBqXdUca7oRaqAfJYR+q5hSE1CT6pIGGZc8h8yVJL
	S+Kg/FZyIhXHbBuDFLgFCG2vOBQczNAiqJAFSk9WEuCv52EquSekUq/RxKEGbN7IWKeENxtyhPs
	Iw8lcxpbMW1j5cxwZ4LDnmkkAAMWtfm3fv4hDAbcej60oU0y48SI/RT5LzSy6vR1mMu6Ixdd8yN
	J5Z2cVx7TivXBJ1jnAftgySUmoglvOZbSyKm0du9OE0fHWqZ3Emv+EnX7x0aT+VOJJTnOlenNjv
	LEQVL0LMfLN8Ujqrsu/NRinxFyR1CBmEVQVfwK0rpIXCk/gSHlEBoQt9Hk0ORT2jFEwTdlYGUv9
	1DcU1YfvEQKqFRpIGu2JClaRWb9kR5SwMrZvx7siVrvuBEvK4JEOMAUV3GYkPHsDtmmyN9ZgxgZ
	tISiXW+loBCZlAq2za1Vwd1jjVzi0DGLOKemCZkguE/5LVswI8WU1/+O3led+e5N3RrouToAFCz
	Iq3oRkRKCbymTCV4Vg==
X-Received: by 2002:a05:6123:12d:b0:5ea:c214:b5cf with SMTP id 71dfb90a1353d-5eac214b927mr1447944e0c.1.1792440438123;
        Mon, 19 Oct 2026 13:07:18 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:07:16 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH v2 4/4] serial: 8250_dw: Add Allwinner A733 UART
Date: Mon, 19 Oct 2026 17:06:13 -0300
Message-ID: <a3505ad8e74a08faa270881f0efbfe0d0d82d6e0.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
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

On the A733, dw8250_set_termios() stops the UART clock around
clk_set_rate() on every termios change that reaches the driver. If TX is
active at that moment, the character being shifted out is corrupted.

No baud rate change is required to trigger the problem. Toggling only
CLOCAL or CSTOPB 300 times during continuous console output corrupted
bytes in every run without the quirk and in none with it.

Use the existing SKIP_SET_RATE quirk, as the JH7100 and SG2044 UARTs do.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 4c86aaf9c121..718ec44135e4 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -906,6 +906,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun60i-a733-uart", .data = &dw8250_skip_set_rate_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
