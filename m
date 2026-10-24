Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792822463;
	b=0m19DbyJyJnFCY51HUQl43oU+TaBs7OFedGpfWQHhB9vOnZzLrJVdJqOnbNp8nFMOJdI
	 R5ItGFSv8ef/xvC4vMm5+03cyflHRdtfT1vqJBsPAmfaQ2RYBLOP5b4GSHYeLMi6gyYuj
	 mUv7jObNOYsLdseraO2ZvSWY7cU81z+8u2z91OhKUYHFD1hIJ6QaK7uPf7BL157/agWnK
	 ngOESVpghFnSzMktOGZXSXm6W4g/ZBcoOmcH8Nr3bQyVLIl46cova1oaPMrHYs1Td1MOs
	 w3LHKiBxsc1AdsCphfD/OF5Izhag9RSi+T7FE/a4jShXt9gv479iUiTiB2F0JEDPgXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792822463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=l+dQSq35iMWLaAG/hUbby+nPz6VKUfVtqj6bR0W+roc=;
	b=u41vT57OvllO2QB24KRjdH7/VxKPonoQegsdMMrLztT5ntnCZDvb701YUImbo3GJhmco
	 7s2OiQhp6/xbShsVbr4MalXxNbw3CzYQVfVxxnYu220GeRwn8NFlyO0jvmOf6FSZmH5yE
	 EhGfiaeVGh0gmCyIw4w5Iw3xI9f8BPFozCZi/Njkr9n1qzbGOqeHiSoXaslOcRPTjRnHd
	 5X1nV4l7bqVwRKkxvjG7wVCR9/eO/MCllQ5wtuzx+piVEkcdhd3jdzKF/Y0ELdOIPeHEP
	 mEAtb9Cvl1I3XtksTGzHD48L0YXNTcAJb1Vjdma+ghD98ASdJoWIwmPPSdUBko6AQVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TS3HvRq2;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEED606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BEED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TS3HvRq2
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f84a55cc06so936301a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792822462; x=1793427262; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l+dQSq35iMWLaAG/hUbby+nPz6VKUfVtqj6bR0W+roc=;
        b=TS3HvRq2ZiEHda5hrwQtN4NAs0us8I+D66E0RqqjsxZb0a0emzNdWTVsRBt8ygSEM+
         3ySrug4ZfF17PAixiTPLhW6W6m7oMBrDoWBFiJUfE3HCO/tmRLyF2SjeNAL8U0J6UxrZ
         B0lWkBX38lv7V7WheGyxU+UEQfSm3iWaU2BG8wlAlKwGt2DoK6pYX4HNikOHqFCvLgMw
         FaFD8Hz+eV3p9Q2BHniD1yQHClR2c1yMyzGCEQXHkIq/J8D0eFCly5XSoLKr64qR1beQ
         vO7LCIcS5I074xA8W2YQhLhSJWl3Dakbe+HNBwxerzTm620wTsjTGgsNjTpwTj9ua+/8
         OQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792822462; x=1793427262;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l+dQSq35iMWLaAG/hUbby+nPz6VKUfVtqj6bR0W+roc=;
        b=TTu4+rcWXLGb+n3h8apQo+y9cMkvQDE4Zl1Zo4NA6oIgOd3dydnnqdGQQR3TwvpFee
         5eHUzzP6ltGLF0BsDItyLeZTlI42k7RJCpsQ64som4ebl91/SYHCSy1gg+PDJyWytHWl
         vXQBHkUGuT+3iGJ/KPNiFPTtUpVQi6/HGoJiYo7Ni/5Yb/9mB/Gj3XL2YX/Bh9QyhJD/
         Xv8NGFdymINezbg/BXcT3o0onbdf6f6yyELXs51k/0zxSlszDNqBpsxkhK5Kk3abmVa/
         6ovBwcNXl/qnRFyAbLMUQPQK0gF9D4CbzmHFm8rBKJ0oVB+g4A6KvJtGIYsrDexEA+K1
         ynBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzIY8gOnKF0dPg56QXPlMDDuO6nHVPJLPtwd7Ro2jlzL4R4nEDfPMYoNS/B6uv5StsZZ2nTr84T+tvYQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8N9rjZs7C2z8Az3DETUfbtwPPsSaFLwD6++2+O/2/g2OxyPq8
	WBW6LgJdUYQeVwjhp2Im98pG4VZSiohKlhkx2t7qoL6rC+b5Da1RPRWZ
X-Gm-Gg: AYBFou0J4pIV71e04jdo/1QyIfvEa0gHX44xXUrNorVc1Ef1t21BnEzlEmzstMOZt11
	DUb1jjybvEpx2EsWbYWRfNNVWb8hrrHqoijwSxrr513bhUYjfbeiQC5q4givDNSi0Mm73a+a1VU
	KSvUgpFNAZniJ4EKMn83RaYzselOIbkqxB2QIZ7WVmLe+tXCUILOV9fUja6fdZwxLrdbI6nEZqK
	+4EqR2r9VLuensI3zlBjNOlUzBNzy77m/i8ypZclRK+GeQ0yhE2gNYDFsmtzD4gcGptWlq9Z2ZO
	8vrK4LJVu/VJpRSugzMykvFvjnbYVOdlYtXiMMLp9cvhBFaReFhlclnPJu6vxZZxNeCPnBNeRYw
	/5yhnnRsV6tvcS4NZP8Slq1t0d0JY5cInu3ajB1d2iIbUtoreYazMBvxz3GTojJjcA1SqWBhevt
	cOvYAJXF390GIS5PGE3lLOhPsc7cay0jRR6NCC6LrbEr15PRpJgqOmd++rFa1O+uktOokBwejnu
	NinV/ztPqdUFf/ICofshuDUj8dgrYHg5ALzTSTW9DNKgwr/US0Zu03wc9iJa+H8b2X1DqR8NvD+
	pRXzIn35n2SVel2m5wQcDTwSAhI460MVX4alCFPn1y0CKYzsUqpmRM9zs9b2/0IXJKhBnqmjC70
	jm/nXb/gSIZMgtZTpSV6VlHVhZ0otURf4S66ksg3RBJcNp0OiRB72OwppWhSTl9pvm5nwANTfmB
	sWMms=
X-Received: by 2002:a05:6830:916:b0:81d:54f9:d6a3 with SMTP id 46e09a7af769-850fba2af5fmr1170106a34.4.1792822462041;
        Fri, 23 Oct 2026 23:14:22 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fa99c4f2sm1516420a34.6.2026.10.23.23.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:14:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 00:14:19 -0600
Subject: [PATCH] serial: 8250_mid: lock RX DMA timeout flushing
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
Message-Id: <20261024-submit-serial-8250-mid-rx-lock-v1-v1-1-2b9afdf869d7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw7CMAxEr1J5jUUSQRRxFcQiH5ca2hQloSqqe
 ncSWHjxRjPPG2RKTBku3QaJFs48xwry0IEfbLwTcqgMSigthTphfruJC7aZHdGos8CJA6YVx9k
 /cZGopNeajAi9EVA9r0Q9r78f19ufq+RBvjRxazibCV2y0Q8tKuVzrIeR1gL7/gWFevp9pAAAA
 A==
X-Change-ID: 20261024-submit-serial-8250-mid-rx-lock-v1-21c66e80df80
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "Chuah, Kim Tatt" <kim.tatt.chuah@intel.com>, Vinod Koul <vkoul@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Raul E Rangel <rrangel@chromium.org>, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The Tangier and Denverton DMA timeout handlers call
serial8250_rx_dma_flush() without holding the UART port lock. The helper
pauses the transfer, copies received data, updates RX state and terminates
the channel. The DMA completion callback accesses the same state under the
port lock, so it can race an unlocked timeout flush. The IRQ-chain lock
held by serial8250_interrupt() does not serialize the completion callback.

Take the port lock around each timeout flush. Release it before handling
the UART interrupt, since serial8250_handle_irq() acquires the port lock
itself.

Fixes: 692aa1905679 ("serial: 8250_mid: Read RX buffer on RX DMA timeout for DNV")
Fixes: 4831e0d9054c ("serial: 8250_mid: handle interrupt correctly in DMA case")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Previously included in the DMA cancellation series v4:
https://lore.kernel.org/r/20261023-submit-serial-8250-dma-cancel-v1-v4-0-e759de1839de@gmail.com
---
 drivers/tty/serial/8250/8250_mid.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mid.c b/drivers/tty/serial/8250/8250_mid.c
index 44b43163df51..83f928b1f643 100644
--- a/drivers/tty/serial/8250/8250_mid.c
+++ b/drivers/tty/serial/8250/8250_mid.c
@@ -94,7 +94,8 @@ static int tng_handle_irq(struct uart_port *p)
 	/* Rx DMA */
 	err = hsu_dma_get_status(chip, mid->dma_index * 2 + 1, &status);
 	if (err > 0) {
-		serial8250_rx_dma_flush(up);
+		scoped_guard(uart_port_lock_irqsave, p)
+			serial8250_rx_dma_flush(up);
 		ret |= 1;
 	} else if (err == 0)
 		ret |= hsu_dma_do_irq(chip, mid->dma_index * 2 + 1, status);
@@ -148,7 +149,8 @@ static int dnv_handle_irq(struct uart_port *p)
 	if (fisr & BIT(2)) {
 		err = hsu_dma_get_status(&mid->dma_chip, 1, &status);
 		if (err > 0) {
-			serial8250_rx_dma_flush(up);
+			scoped_guard(uart_port_lock_irqsave, p)
+				serial8250_rx_dma_flush(up);
 			ret |= 1;
 		} else if (err == 0)
 			ret |= hsu_dma_do_irq(&mid->dma_chip, 1, status);

---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261024-submit-serial-8250-mid-rx-lock-v1-21c66e80df80

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

