Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467041;
	b=OPYeDs/BuaMVW4d7wEoPAoY4Fg45oqaPPL5jGeRAn5WefCvYlxZB4h8RdQ1gPiP2DI1V
	 fK/u2mdr4A+VMWAKh7KpLVAh7ZIwpKobx/oOBmTcNw+riMXwQSzGC7Z20n19DRRSsHvSR
	 VwA3cOJWVSNynKY5Kd5PcW0ckHEOW1yNmlaschobNA8ZbBZCeuRrCHqwHrzBtukmJwzxl
	 zN2eHARhcChQN/cvZe2+UsDOi9gEo2jw+rgfSSKroo2sHN3au6ags2ijx23otRJT5J71g
	 xGSc/BjgO8UwMK2pE0Y0WlXjmZEXdSTEA6ZoMK2lxnS0/qPsVQIzdPABJlLEQfVnugw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p+q3LFIMHbm/nMce+FLXOK/M2t+rToT1SbCyE/uCano=;
	b=OX5vcEBj3NYbq47Xp0oQHqf3JOmoTxKC+qDT3JKeF43YOQFzRHYsNY9T5fZPTWr0N3ic
	 exjqz7wWLrG0xj5Sqn2nGe4n9+K+5RhlgKEb1wRlsfnPmAvb0vnlR89BJoI5S4eumzptQ
	 vkAXGtwOBCcDgbyhUPbJxuXouGTZdW1zTh9BVhqxmygTX8s0xzgMyUeRUWhxv6Uo7Zuu8
	 XdzlcGjIdzm8wF6MFs2xAYdkUG/Qg3xsR8F9J+qyfDdJZZlldwCwUxMWLTD52x0PdHc9a
	 4k511WSaoUVnaaL+LaUV6nzXFsItNzCtzX6UtzcyCyYKAZtEAuBATu353u+j5fDsAxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W/CZqpJK";
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E2D606A337
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E2D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/CZqpJK
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f3c8958d5so451914685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467040; x=1795071840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+q3LFIMHbm/nMce+FLXOK/M2t+rToT1SbCyE/uCano=;
        b=W/CZqpJKA65YtvxwT5MNQLZEU0BhUMGSqQ0F+WBRSXAMuwkyGFtMhx7Dpg/Uw7fY52
         kr1QEZYGJ/tVrF/2FOF6XduooZ1qqpF3r/2HdNSJ/0XfaFxvRAxzEGj2vb+xyfmXz9qR
         aV8KsGDkvRtJGts90nNF9iBIv5AMkRtUrh2X/90fRKNYilocVj0vcsTQHfzxwkRfPNRw
         Je2D2/JM9q7j/Hvr47aRQpoRjvxxgIiihCh7klL85KZBPj2x8uYvF4yYMcz7pZog7I3x
         2uz1BtzoNq62UkmSmXm7FSk3bEGEMrFhxjUiXgGLDRlu36RWfiP79uSBQnftMnXjocPM
         S2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467040; x=1795071840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+q3LFIMHbm/nMce+FLXOK/M2t+rToT1SbCyE/uCano=;
        b=rYIBicxKgXRKj6Whb552tmVn5HuZwrSbfF5sdAfgKHC+YLz6y7FpNtr3SXHSMwslls
         idvZInPLA8fPsrD4CuWGlfwkfly5LCRkH6HHdVjQIWg3Cdq85GFE7AJh1+fnIC3Aqizt
         RXTOlyfLJ9t7uLxNsO50/hTdl/gb+z/VgaDvjgZgFLWTZbXTtHu8bkFLyjvHYxbYgFKQ
         gUkM3hVJGlXC8uA0PwxeeThZ+0nWqAEh+b6jZnloeIZGiRVsaATa1tQaYd+OzUq6R7nN
         LfCU44RwgvE4McQ+2SKuLhX5xRBcE3kFpdpHTWQo/F1BJ/OLfHOUYGTZV4/81vIr/S7o
         ORdA==
X-Forwarded-Encrypted: i=1; AL+hErHqZHJ21prBI9diVri9mi9+593hQYzz2rX2a7+7FIrjQ5cQEAWXd12zB/PonCEPYAPQzOeuPVK6yjzN2n0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IcelldNhsGpkARgBXcHcZZAezPtV3i3PVUk0N7lyI2yS6dyfk
	GG5+bqSeL3+9xrcXw+ov6B7dCsqrRrKpr1AYg4GHUe3+W74tMxUq4M0=
X-Gm-Gg: AYBFou2VMhaWzqqTrGASEdUhyfCXgCIIWb1euKSWti7rUzFqa+36uFtT8cdTtg4cOOC
	nf1DZahBxZkt4CZLPCKQNCKlOF60BoY9fAIeiIr7YDguLHFPbEBqQcTsPLQzAIGCUy4aTLHW85A
	gEmtZC5+G5EiAOGBnGLDKlIqvaWBCL8RxM3t4mb/fmzbLfnGtiTMFP5yrISrw8GpfiymFnGMyyW
	IdFwcPy8CwAd3moRfCcVQJS03JJxDRXNKvt4k3Utmr9PF+AyBpZSV71wCu8BAP2Q5j/zIqbMIVW
	6QynotVnCMP7oRd2UM6pB2u6zIEmDz4U1O4vqrOm5dIkXja/7bNNM4hNi8UEIPZFXMUvxvzkqAV
	B2Py8UKRG/TO4Ge/PPSz/c3b07rDTu10Vvf/BOLqGRjaMEl9zrgtXaTZlqiZqMZj8Pk55rrL1Eg
	gKLEo9aaGM1j1U5bXkXGUiF8UXL/T/7+k3KOsknlH7cUgNcgtoqSF/+fe5lwIL6wC61ctQOnJdd
	NMBLpkI6zT+djnCuPfO2XW6HLv8E5CGZCaO8c+J1t8NNW7R9ch1mJuZCc3AzgGpOKQE6X1mOXF0
	E2mLi1aaDaucG07xftLd7P4nadxUEcybfObmuR/kC4Y2Db8/hjxmuIk3j9QA5M3fo7JUrGQwOWh
	L5jAv5UdMHY5ZIAO6yd+uAWqV6f2HojebyGrqfnlXO1EzpaBJTaJyPQs/1cpD5joReTO92QEgK1
	kmehWGIAIStZhVuTEnEY4IfvsmsylAdhBKyPOiwotDy8lHZneuljwyyA==
X-Received: by 2002:a05:620a:460e:b0:93b:ef24:bc8c with SMTP id af79cd13be357-947afff0a6amr852657585a.47.1794467040229;
        Wed, 11 Nov 2026 23:04:00 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7f2edesm663463585a.40.2026.11.11.23.03.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 23:03:59 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] serial: 8250_aspeed_vuart: shut down the unthrottle timer on removal
Date: Thu, 12 Nov 2026 02:03:57 -0500
Message-ID: <20261112070357.38870-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

aspeed_vuart_remove() deletes unthrottle_timer while the port IRQ is
still active. An interrupt can re-arm the timer before port shutdown,
allowing its callback to access freed driver data.

Use timer_shutdown_sync() to prevent rearming. Keep it before
serial8250_unregister_port(), which releases the register mapping
used by the callback.

Found by a static analysis tool under development.

Compile-tested with W=1 for arm64 and x86_64.
Not tested on hardware.

Fixes: 5909c0bf9c7a ("serial/aspeed-vuart: Implement quick throttle mechanism")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/tty/serial/8250/8250_aspeed_vuart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 452bef82bec2..0776675b8382 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -552,7 +552,7 @@ static void aspeed_vuart_remove(struct platform_device *pdev)
 {
 	struct aspeed_vuart *vuart = platform_get_drvdata(pdev);
 
-	timer_delete_sync(&vuart->unthrottle_timer);
+	timer_shutdown_sync(&vuart->unthrottle_timer);
 	aspeed_vuart_set_enabled(vuart, false);
 	serial8250_unregister_port(vuart->port);
 	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

