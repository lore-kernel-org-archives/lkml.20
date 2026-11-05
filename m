Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911941;
	b=xyP3VZflyPiKvGQV2u/3U/2gHi5/3WvF5rgz/Z5E9XxGUriZRmcENHSJG4sPRQs2SNvd
	 tSoIrQZd44ZqlIwAM6rhcPQEPQaiTWP+pHg3LW/i7wt1mzgzMICy+JDXsKRd5LoNBPFeS
	 4fCBHgrZMbBEOq54lmvQjXqAb82o/PkCWUXUywHYjvO1089VLbhYdgzPE6kwJQMa656rm
	 iwct8Ss8rYfrp05V/QlOP1Choudgk8j7wkxFnyDGIAcvDL42XOYP/F76xK01oIM/fQgEc
	 KmXDg3TnRa1NlSNomuKBBbbXqL+jdXiYRqcPvXMyAEk036Evp9/tb5W3VHTm2jH1r0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
	b=xssKByW5bk1YtKh3KTYeuyd99VEwt4Ic4vTPGYEsui/srk+rRTgMyhrxF0lRKwAgYrTh
	 GpZjc+pSpyMgX/iM4MjR0evzCnSA2MlpxA1l5pOdI+XTT7DkkePuOGGNBrJ9zgLLf0zHf
	 AePw/czoy7mu57uTgY19plAqjm3taBbU1V1l7+U5+49HTQ5mURdy9ijTBpHtSee5KPlLi
	 peaEIWzOJLAlUSxlVxQdbvVLZx6qGAwW0yjOyUf7yMFqJk1UblNlykhNJQIUuvfgRLny/
	 MIZNQb8oSR6bAh+9HPQ0aMKZffYlLRFccF1n1pvAZh0RPERvqkEOW/ASkaABazaZUkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ukmSREQg;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A171606D815
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A171606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ukmSREQg
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8253bc5a613so8313a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911940; x=1794516740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=ukmSREQgwBeIB4js+IejMccaKW/ADB9+k31VP81/WzScU/Ks2yx08Im3dIzzmsk/hx
         ngQ7p0W3A5VlL1l28OrlDL2Tj+q6rn1XKOsKjzPc/zc6m1EwFLivcf2ufEcpzQ4n0iPS
         IEYyIrbn66qxNauprZNZpIScS5DXmiNfiun1AkfBvNby4neG/xD2eDxozI3zYbSBF6aa
         /oG4SYj4fn/QGbVVQ+Vtt1jbyMEMA6pJwcYuaYG/y226B9rFOWbk1k+fPDcygTwvPMum
         oFH5BOdZHW3MPXyFp4avVZpSWjHC/67XCCbFMf2rOjllbxqgg9j5jY/6BcnMFWXL1fSC
         k8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911940; x=1794516740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=zgd7DEH9lP4cznzlmYpQ9GQvWB4ttNrMhIfZ1nwkJL4TP8XCdxyecdADFOwJ9gxHgA
         phqmR6kSw7AqJ3wCS1Z5YmgsNvjTWbQ8YlHJzNatc7W9lqc2JUHUdBhZngwUpgJ5G1I+
         I8f4I6V41nT/YwygCtq90WYy7+ZQ7cQiKhj1mnWEtAjPl488VKQMn9yB6vY501+f4x8k
         +SVojFV5Hr5mvl6e7uBkzZIprgAKiorLD/cyFnjJP+c9K+HUY/G9sGCN0Jj6HjOzc9nb
         Zq51NAdYfAvj71i0IRUvSIXW0yRYzQVIbVur8Fsi5wPCfe9hhrp4dZDTFYwrZCKXGIZo
         3hWA==
X-Gm-Message-State: APuU4Z8AQj/quTxNzzLthSSUP6UJ2FxPaMI8B9mqrHFR/sTzbOv84O5T
	yXVRg+dOZwPcAGyx/2GcfSMxzq4HdtSrArekzQN9I5Ng8vcxbVZwMQjB
X-Gm-Gg: AYBFou2iqpY6PX0ayj/dqkrUc8ox5LH6Te/UBVLyAAhDWrk3GAsouWI7thVFed0KEhp
	mir5HlEZ9WfhZv+TUskIZcV7EgaSsuatMJO/fs6xx+ZzH8Bh0RE3yPQnmIH9+mlmOxhbP5aSjjk
	BPUYH/LnSiIIIlPgdGlkIhw8Ywxz/fN6wCaSDwwreYe0zeujg+GqBXcybBT44v8v3WIpKq85FYu
	5qq7FGWi62fpDQxJAvVav7yxy5PtaMqeF20ebULNAr9pwi4iXMhrrT7U3CWwzhj4cuU9jBkNOz8
	gO1c0u9No2FbLnra+8WvM03LYs0RqGSszJxlisE3zM/rXuxx/D5717ucR0jj8rafQZj9Yxw9+oz
	cgSZ86/uPpYqLhZGzivE9IrEqad8bpoiJzgDbnT7NgWQpwZGQNagX58RUsPxDTgH7JJvi7UsSAn
	T8fNB2YG2DinTDzeDSdqlHzCiKsIIB0tbseFGqaOm2PFLNrYr5EW2Pu16jqYCeTP9XVDopaGVDj
	86DEYvzZjzvB3MjkzOCRl2WiqxFbK3rB0zbjC4NUIlbqr87nk6m/XMvbo4fhd3rLqE3QlEoIjpQ
	arbAHwIiWHqFB69ss0No8bM4oGgtC7VefxoLvrNyGX0Vum2M2uRd/SlHsxjzRFFleLe5PI+UIwt
	4wPEvnIQt86W+MSvrT78tpF7YVK/JxcTLcy+k3pcI1RL9IaJIuT4PzC0Wx+6y/hl/DFNPYy43Y7
	L142SJH5HWxiyUAx6BeW9QR00lpVEZWryk+dWyOJ8tjS/2eHPoFqk=
X-Received: by 2002:a05:6830:310e:b0:821:d65d:37c1 with SMTP id 46e09a7af769-85f1d102bf6mr708163a34.25.1793911940392;
        Thu, 05 Nov 2026 12:52:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:05 -0700
Subject: [PATCH v8 04/11] serial: 8250: share the RX trigger conversion
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-4-14024d2b184b@gmail.com>
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

