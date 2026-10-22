Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689286;
	b=CkoTkZZ1VbNWrOvjZvDpKXOuzc0RACg8n3U18u7gOGmPAptnPoNegMnOpBt2OpT5QPfy
	 JVZNNWsmku0DUgqQw4tdTB1LGXhi95TP0mH9uanKMrJ+1P3nxiaf/MLFa1TEf1HnUXNqM
	 6QcHETzeWRWTziL2Ye39ONr/bJNIjnQgSD7mUPcnr4yFAs4QdUVdLXXBP1U/on6HgBZR7
	 FatIuqmLrhka/8J5jTrJ1Qb1ePfhN7HOEISK90eSEBA31CuD7D86EvfG0oYH3BkzxzRzW
	 8hTYGqSaRVS4yX52vipJfn7gyMb4rkUabnUWJfesx8IVRPNN+Jy/lqG9bCd/hOpo3pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=3DFHN/osUdzyJRwdOHyKkTlNrKLynKFcwarVbxA/Iho=;
	b=aIipeJUNx1dG9VGgEifh+4Vd6OUw+vJmkUmKWBPLBMk2njzYZer77Qc+biX+XWNGzOqx
	 HXSKUri4J1hVNFGUAxOjh2Zpjrh/AswfiONy2jVKxgX2m5FhxwzCUkQ7+RFnz2VZeTvz6
	 rCoa62k+1Y+Axkd2t6QzAYUUlc4wyPHNbw6hFn15eJXdwUqeehNYVoWcJoeKaXBCNmAGF
	 aSmExsOpxlpk7wWi1WhiyupmcWDkiQi6H4VbvDwxawFHKX/Oz+Q+enwEDioVhTLX5vzBz
	 d03pFBWw68dssVENu2q7YUrI8IphbXezJTjpLxcv9po5+iVMFtRLjpQGNYcjCPS1rRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PmAP2l2f;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE94606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE94606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PmAP2l2f
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6ddef424972so14213eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792689285; x=1793294085; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3DFHN/osUdzyJRwdOHyKkTlNrKLynKFcwarVbxA/Iho=;
        b=PmAP2l2fgTOlTs7Js+AOQ0lKPXSwKMPjR4pTxJ+C7QzACp4jbRhJJ4pbDv9s/bfAqw
         g+RLeZPhJrDH+jPccM7dyh4WeC6wI00zY2nd1QGxJgWBDub6ifWx0edBVBjBX6D7fJd8
         GXFqzYrL4IvRNsRY9CjB3pgKUdP2foPfiK1VYFV1yKPlNdgi4nkvTThGUulEVZ/1UwcD
         g9TmBOmATybrseMzhD3BlgD/EjzK277/R1OuYfrF+mRDMurxqUkpcXb+D4XWYVTLgOMu
         cAT4pNfsKbanDKvSkkV6m6iiRF0fKP5av++FqGJwCyUmYxK/CWzGC8bPtqdPVJhgcaXf
         gOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689285; x=1793294085;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3DFHN/osUdzyJRwdOHyKkTlNrKLynKFcwarVbxA/Iho=;
        b=LdlB9wk1geeD0GqQeo1uVGPchUFNUIh54EHsaWdqEKN77EJHO9wSyVjk25HddG5mrH
         4FTtczPLqsCEWOITdhgZ3TS7SwMTsHeTLwxXpewl+gp6trTPJfvCTgzi7Eg4CLAq9t8h
         8jP2+4mYJ4tlzbl4ly1FsEwo3gO7pxZhoEBINqVj6pk2KFpWGaKgeeimyFZuBy3dOAgJ
         KPBCAyvk3//sRbV9Q8zdk72cotA/PXUqtsnPfXV5zQsHAhxYfsucHVFYgQ+vA1+zPVjF
         zQ25pGsdxGoTg5PG6i2xWnsrLQsy2hrHrLsE8yoMGcqKpde+oeuKrB5gyd/zQR3WN6ft
         +dlw==
X-Gm-Message-State: AFq9FYIaSyqIKieaXDdgLMZjSvRsJmegCvV2twg4lUT+XTF6YFaAJ+FL
	muK+wuGrDROl/aBj7hBJiBDr9bWkJNIAyfLbc6VruuqwA7acD4wW+4Ww
X-Gm-Gg: AYBFou0xckSgUR4za/5ct0CrERQwuOIHNsINn+S5QkWBC3rdO5TN7mrOgcFD9+WXneO
	HW4QcXOyeJnLVjMz5fq3ob303d2a/eE3PbwOVbAwFGZ3T4RkuY6LfEcQ54rKDBVaXmuLptwIOSc
	kvRaOcMZQOj7vNVzA7FmZBZdK20a5e93dA0xsmaGc67CAANeen/S1/Rgu6J2rm+iDIkkkHxuEjc
	q7utRS57MXA5WnIY4q8xySV5okQdEa5CdBbwoWy2qa3oKkh5V5Jxh9eFd/bIECTO++Zu9hKNwSj
	IkNvN7YBLR64eKpTBHSX/Hrg97/YztmYuzh+Ye0ewV8VQe3RHtSmu1PHg1JAZMnbL8scW5/2PhD
	UhOQB+soeLyFn/vcfpahpnfcpLOrswQ2Bj4w53zCDOs0HzFUkYcbH6pPOBjtBiL7NWO+CCggVrn
	k7Eo2IDz/Qd25uhge2FquiPcQGQq//KULIvhYblS5DI51b8r58EiT+zKMkeElL2+/VwJKR89om1
	Pr79iWzgD9er+Zo5YvzakOzzqWkuELcOndDjJUdUmgqt0Sl6ex2OglVtq57aY8IZhVgS/JIBv9H
	hKTdJpSyzBQAMM2nhHanIMqrgj6zHfw/i+22wMRWxi6ehyjJIN/sDS/7yvxU/ggJQpljbCXRrQq
	BQklAwZOqbwHgTUwPOfgxsWTT/Tgod2mB53xsNFL00BJeWpZL6Cp5giO6+X5Da3TtlcnNuPzJNT
	ZHhEEDF6TLRi7YiAFjiNnT1r47
X-Received: by 2002:a05:6820:2007:b0:6fc:373a:176a with SMTP id 006d021491bc7-70b88af0e4fmr33116eaf.77.1792689284805;
        Thu, 22 Oct 2026 10:14:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f788ec31dsm270811a34.24.2026.10.22.10.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:14:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 11:14:41 -0600
Subject: [PATCH] serial: 8250: calculate TX length before preparing DMA
 flow control
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
Message-Id: <20261022-submit-serial-8250-dma-tx-length-v1-v1-1-18cecc89a099@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBBFr0Jm7UQ6iYBexbBoYaA1UE07khrC3
 W11MYv38/+bHSIHxxFu1Q6BNxfd02dQpwoGq/3M6MbMQDU1qibC+DarEywzvWBHlxrHVaMkXNj
 PYnFTaKaGWmo7RVcN2fQKPLn0+3Lv/5w1Dx6kqEvD6MhogvaDLZHI55wPPSeB4/gCSLEWKKYAA
 AA=
X-Change-ID: 20261022-submit-serial-8250-dma-tx-length-v1-bf627278129a
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Phil Edworthy <phil.edworthy@renesas.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The Renesas RZ/N1 preparation hook programs the UART DMA block size from
dma->tx_size. The generic TX path calls that hook before calculating the
length of the new transfer, so it programs zero on the first transfer and
the previous length on subsequent transfers.

Calculate the scatterlist length before calling the preparation hook so
the UART flow controller and DMA descriptor use the same transfer size.

Fixes: aa63d786cea2 ("serial: 8250: dw: Add support for DMA flow controlling devices")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 1da605cc8601..2dc47adafec0 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -110,8 +110,6 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 		return 0;
 	}
 
-	serial8250_do_prepare_tx_dma(p);
-
 	sg_init_table(sgl, ARRAY_SIZE(sgl));
 
 	ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, sgl, ARRAY_SIZE(sgl),
@@ -122,6 +120,8 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 	for_each_sg(sgl, sg, ret, i)
 		dma->tx_size += sg_dma_len(sg);
 
+	serial8250_do_prepare_tx_dma(p);
+
 	desc = dmaengine_prep_slave_sg(dma->txchan, sgl, ret,
 				       DMA_MEM_TO_DEV,
 				       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);

---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261022-submit-serial-8250-dma-tx-length-v1-bf627278129a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

