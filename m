Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792620554;
	b=f5C7cfpgYKBG7u7ZN31gmrAsdBEuv8MJFI+kg6ii+V/XOIXRp0l5mU+XU4KaBiFlEUy4
	 NOcsIHR444dr/wHDE9i/AiFkTE/P9S14mlm0bdbeUC4seoMwT7nI/XkUYgd6PRR5Hsisi
	 txi8JOB40hV9eQD2P8GQU/pziR1X8f292uJ1GdapkYBc2Yuv/oHqD8pCMKhkPkdtiNenl
	 SDTCOt1mqk9UCZhfC9xQP6LG+lVlKF+sZcILug3ps/0D95VJxsua/SuxfxsYjQNH63yw1
	 55s+2z6MMrOhnqNq4a8dqS66w8Ddhoi6WtYmb7yIU+c5SmU5+fK+F2fGFYvwGJs0HEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792620554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=vQqym24+If5ELVVFnbBoXAdZ9f94OZTCB0DYtaAU0iA=;
	b=XFYjt2Gj9cxyvaHXU9EWiImTbac6SkqsyS8dxjdq3jImyOdOg0uQFIGG85b+cn/1grln
	 WSt3jD3dysV9LBiWmV1E7h8OttJE4Y36/zBS5lkNJdraWcvCu8zPQh64mDstC1n6yYQEO
	 7qHThAo5tGO8mHuWsdITLJb13N3ZGZ9DajJQe1kX78M6MW7pkj8rUg8Nc7bX2VVl03+TI
	 +LT/Ozc3UeEmL7NKf1ZwwBcDQ9sVYP7P/u9KzpoSEx8EoLc3NTEfefqVultQ4xIKEPRoK
	 RYJ3vRLGEjlPlYYnSku0yU6d50F/pmsyi5HknNrRVSvLdscFDg/pA0fujNOw484fepQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jgU9jZsO;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA9606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FA9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jgU9jZsO
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6f8a519e215so260282eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792620553; x=1793225353; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vQqym24+If5ELVVFnbBoXAdZ9f94OZTCB0DYtaAU0iA=;
        b=jgU9jZsO8tiFUvmqMoyMReQoqnUJZ2I8mJ7I/BfCRTART2gBCL+6eNQnkPSB/DEBvE
         aV41lvP3ZnQ57oCzf/kIkLjUwFvLFUiG3Qgr6AsTWgw8w8WzUFbtxhXzNAcn2J0YbtMm
         eZTuVQyrViNupw9+KiuZBWHGhodWvIFe8+fT+fAeIv3M4KyvmsIe2enAZikvKmADRVVk
         2FfCQKyAqAbJETAAVYhQg9j6epO3A3NVyGcVtWf+QGBvnLlJaD7YHhKo9+7HeHiC8S1E
         eMYq6Z27WGyUttVXgq8Ki6YK8O2GjvzE1SzMTOR1oDmUo6NMotSSJOP5e9xFY1/YTXVs
         cwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792620553; x=1793225353;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vQqym24+If5ELVVFnbBoXAdZ9f94OZTCB0DYtaAU0iA=;
        b=X6Nx5YLl2QmyusnJLA5Kbub1EpiQr6qRJGrT52kQEH/ncNLnAG85gHT8wtmJAHA25k
         +y59LdSOGLk3JBYXuP51AzWP6VW4KGShyIRj+v8c7uM+8d6cE4dmTJcI8AMvnTuNavjw
         YzrV+19WCxgIreWm+6XEHHaj/XWGrY74Vm/9bbzaqY3GRVvMj7NZWluy1+kML1W23GfQ
         DcmO1FYRZkriPelo0Zo7laRS0dtAz+uEPS+8dkSDCuU42vrww6pFNsft2lsILFdv1xga
         QMuMljUeL5tTRttYHwCbdidn3/4sXnMd5TgSenVRq0IdbRxvozxtjqca3lY4vZMW4P8F
         PYiw==
X-Gm-Message-State: AFq9FYKizSLtaRTrdPVbnbH7TANxSAj9ZQ/m+1+MKjtqZlgAVEj4TsKW
	FalfA1OfoTrfuucwm4wK28VwdXFjpAsjSM2gAila0HC4ZUmef9YlsNz6FEe6Ew==
X-Gm-Gg: AYBFou2z7Ndt4V9XOLTk/ZdAf0upxs8QATgxog3d+impGWAoWa8Y1Q72XoEk6lEoTYr
	naDTjziSSu9mB35cvM1wPLTV+zzgQTnMxhRfopP1kE8E9Y+/ls2oiu0ytoa6GC4nI2mqzW0ghqw
	wlY3kFZQakmYXvajucbE61IfV/SvFbjj0P/8zvCW0r4W9Iafv+2L1FSv033roE+wnIjD5gGo59L
	qlBbIQlwRh0If+UxIKoIewSbIYqkvrmX62IMlxT1FpPqOUsk5WSuG7VinO58rmX0APcZ5DJsBdy
	dyMEVxRNriw8pxdzNo7UQ1DgpqePZayJfsfqXLGE0vsyDqRxyJrhT0yFINvJSRdpOpGgSlZY+Tq
	mNCixp+EYcETnoRQ2WqCfQDtHt9qrypZqjocP5ep7ASwNLBhpU7vb000SfpmpUuRZkEUbJ4exss
	CPco8ygFPVXtvDmxjlkGyEaSPk7EP2I8084s06AvRNFbKsE6QZbfLvvZcAMRCVpDwEHJJ2apaf7
	QPjDm3C+Br/Y6SEgAKu8KU/QvZ9Ws5ge4KwX8CZmdm5fkYXPbfOhbfbVEEBljgOnbCTb8iTEFWy
	WuKR6LgWCBF4SFKN2L2M04YgWo28yq32Tv3tB3riwtTiJM4wc0fYnMPackWIaq/c1VxVlNj0h31
	WvtxWBhmHXnqDNMc63YAT7qErh/sby2Mjqog0WOembOTdVPbTUG5lce0gCQJ1B2QwgyuL+UBYNr
	AHjw==
X-Received: by 2002:a4a:e90c:0:b0:6e1:d8af:6e85 with SMTP id 006d021491bc7-70a7e7eed90mr402677eaf.24.1792620552954;
        Wed, 21 Oct 2026 15:09:12 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70902ec488fsm3092410eaf.5.2026.10.21.15.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:09:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 16:09:08 -0600
Subject: [PATCH] serial: 8250: account for partial receive DMA delivery to
 TTY
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
Message-Id: <20261021-submit-serial-8250-dma-rx-accounting-v1-v1-1-c11795914ab4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2OSw7CMAwFr1JljUUTAQKugljkY1ojmtLEqYKq3
 p0EuvBinux5XkTEQBjFtVlEwJkijb6A3DXC9tp3COQKC9Wqk2yVhJjMQAz1TL/grI4tuEFDyKC
 tHZNn8h3MEg5SKXuRDp1BUWzvgA/Kv6bb/c9F9UTLVV83jI4IJmhv+xoxf/ZlwGPmTRBwSuVD3
 izr+gVtIzLrvwAAAA==
X-Change-ID: 20261021-submit-serial-8250-dma-rx-accounting-v1-4122c91dedbe
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

tty_insert_flip_string() can accept fewer bytes than requested when the
flip buffer cannot grow. The DMA receive path advances past the entire
range regardless, but does not record that some bytes were dropped.

Increment buf_overrun on a short insertion, as the PIO receive path
does for a failed character insertion. Keep rx accounting for bytes
received from hardware and do not retry data after the DMA buffer has
been released.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 1da605cc8601..46fe4ebbf451 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -57,7 +57,8 @@ static void __dma_rx_complete(struct uart_8250_port *p)
 
 	count = dma->rx_size - state.residue;
 
-	tty_insert_flip_string(tty_port, dma->rx_buf, count);
+	if (tty_insert_flip_string(tty_port, dma->rx_buf, count) != count)
+		p->port.icount.buf_overrun++;
 	p->port.icount.rx += count;
 	dma->rx_running = 0;
 

---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261021-submit-serial-8250-dma-rx-accounting-v1-4122c91dedbe

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

