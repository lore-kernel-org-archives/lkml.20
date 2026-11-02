Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649329;
	b=QW7a3CFT+/g0ioArq41zel6imInGsEdKktDo5oRkRsQrRrxV9b+Fy6uljN5Xs+UviyZt
	 SFQ/rLifMCR7mI0efmcO5KCGq6esP1t1VVckuMEyoPhbHkfgkcGc4BTALqrY3adT+wKaa
	 dBPLFlY77vzD34mD+HW6O69gnlUWs6zeSBN3eC1aU8fzGTlg+z2x9p+PifyYHgSxxwCjV
	 DLEfDmb7H8JQ4ZzB67bw8UhURY9Jp03c0BLMn3kPXGuiBbrH5AVE6f2cunMEQxa0OSt7U
	 iIx7IOi3Y1LAJMM+wmPTxcMWR85FyFxo8Q9/NTvGQPbmwoUeZ3EPzxD/GdxgJiPhFWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=;
	b=ucFcWso0sNww5mkpeGS2eQzPPgRt3OluoLvM7te2kQDzOixGX4C9Cpz4ZoxdRXoRX2KV
	 LfoeyLsaLkWiYghKNzRQGHGhNtoRVC2EOJMsaDoM6VPdjZ++IKvJrCzpHDNr/NvwIiBDI
	 tGnTgv2hhDWa01nQxy/hOL39TUoQA3vQSgplLJlZMhnUsmhCQQDCrIGGsHZdpqsSUu9Se
	 SxOOy+PU5zrLwDvZa8wcbsI+/zPkYXzn1Zo0CO0UwhBtT5a9ROmNG2LHDa5xyU8EAl3bj
	 z/84muZEuinsEC2A+JatwFthw7/51dugI8RcG1tpTioBux9lh33sYka1IF9YcaoOMdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RHrcYLtu;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F0C606EEA8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F0C606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RHrcYLtu
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4911df1e196so2172758fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649328; x=1794254128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=;
        b=RHrcYLtutXWsZ6SzT0PPS6ZO/wc4raZ0Bykh5LV3aL5yAuRicpt093K2BGorJtG5YX
         0onUZoGnUgget57tuH9JA228CPhjtMyjwfLjoc+5XlHt+JtTxrVffWftnNR0pm8NKUbW
         r9jOxek8y3eHV5Rg0rsFEM6PEGtQBc+gJUFNmiCRZwC0+3N7zG+v+u2bnT2L8Ofb/vmh
         ZAqTCJMsx1JLv+Oeyh6zRT063BldX44YmhK2489ZFGZgsfCskZmZ288Ppvel5DddXKTW
         Yzo91lJXWU+KxsDlhG0CCUFCe/DTSm4UhVC4un1K2/SQkbpXHUgJOsc7FSJvH/Zuu5ZL
         XPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649328; x=1794254128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=;
        b=msNAcu/clx3984Ch32QW2aYKLRjcUHJoomuASYokdjFuMhu+K5J5NFiIZT/fi14nbZ
         P/btJQEC8DSUwgsDM5e6Ur6HC6t4K3oY+Tht9OGBJadmQzcyRQrGJ5qLLOPAhivsZxc5
         rj8QYHZc2/SofHHiFR4gqSejjQlkpawnlr6TPjIy4XAuaj61tTxmnh0JF9KfPI/yP6m4
         MndUZ9zD3J75obsxGdytPheu80VctK/3fGhbGJnByQcKloyROT6VZ23aZw2ZAPRs7whg
         kZEnGtDrqxFPFypub8V3qO7757bhOOqClPOHSQNv6cdt1WDg2VCGAlYEiJtNSWctwm8s
         uaEw==
X-Gm-Message-State: AFq9FYLlYgrdSBTQAJdhtN4f3dy2+muG8Wh7N3iJq9kvcSe/7u6eri2u
	fDn/2k/iWLf8e+nXwyjdf+QwbPCJcUftalbJLVT+I6l5L/dBWp1Vdvx5
X-Gm-Gg: AYBFou3XLRayScly7xxqA2EmeWuK/TVr88UY5Yep/jWNs9G0k8QqGNnTetOzIglkM4u
	yfN17D2bxqI93bKelok9ed+s9PWRIq0rN3nA/ZCK0frpqgK0J5J6yYwDa1FMrlfcBCAHLYD4dxj
	br+GuyfNRUcREWGLwcc091x+i8o95HWw3+8nGwmrmg6bQWn15TYzs178AmfSbC8RNA2dNuklBIC
	SoIjAQcu2MsYBHtjC0PiC9Eq9NdEJrEKqIo+VRWUpgikkRvNdKV5FUPkooHMO7IIzCosU8paIMW
	YRPrtG0qMJomG8p2BtukaC75E9aYSMOEx0EWfTY61Oa/yHsEJWOC5Qm+iLuZRE74ukQACTftCM5
	hydUG0iTLCPICwWMT4QFSHNnAZFizh7+PzX4IdqOgXp4MdHuGZ3/vmtzYehb0Mat1hmmg+7rmX7
	j5RlP0x91Hv4ixIn9gKukVJTHpqsDLCQQpbGSiC0zSLKUY5Pxyk6qt75Ig5AmyEdQyQ6J0/07iL
	uTSvx53mQ+VyOWrarJwG/iDsZo4O8ML5DrDK1leiHZ8yxEULU+Uz6lysGB2cQzykLxVWAOChSF0
	RVDUO4S7MidbWqXGwW5xJlwSCLyr6C1Hqlzo0cRbd+LhcPN0O10Vm0u+k9RaiUfa1gpykY7RynT
	lRnqvLGK86Qu7o17DuC7CqmHHfiMY9a4pupJbB1MbEKaVPIstWAqB31VN/gqiCcr1Da2JoYdTmw
	O7tDihWcj6ziX6N7JdKZH6wBcNDEyKaEUCe2Dzv31Kit9Wirc+Ng4=
X-Received: by 2002:a05:6871:e41b:b0:4a6:f610:87eb with SMTP id 586e51a60fabf-4a90729a753mr6897453fac.3.1793649326753;
        Mon, 02 Nov 2026 11:55:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:17 -0700
Subject: [PATCH v6 2/8] serial: 8250: share the RX trigger conversion
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
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-2-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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

Keep the implementation in 8250_port.c and export it in the SERIAL_8250
namespace. Include the unsupported-table check and preserve the existing
nearest-lower selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..1600f2e45d76 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned char bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..4a25badad3c5 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,22 +3015,27 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned char bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	int i;
-
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
-	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
-			return (--i) << UART_FCR_R_TRIG_SHIFT;
+			return (i - 1) << UART_FCR_R_TRIG_SHIFT;
 	}
 
 	return UART_FCR_R_TRIG_11;
 }
+EXPORT_SYMBOL_NS_GPL(serial8250_bytes_to_fcr, "SERIAL_8250");
+
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
 
 static int do_get_rxtrig(struct tty_port *port)
 {

-- 
2.53.0

