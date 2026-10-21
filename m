Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617537;
	b=VH6VHy4gXc/14AyXFFnYpbQeEyV8ZyHfXizsz5qhhe74BsfkKH8b7K5IZwsHXVpANZls
	 GY2FCW93WErxZDzpCxMF4HEe7Z+6I/qCY7rAJBlCjIkcMiHaHeRxCqyIgAIHOecTIv3bl
	 VlZ4vKmazZ8U5Yqd1DHO2vB5RIXcwJ9bWHBHyPGBssi/Uo5kILKanKA8wtRtANaZlVQtW
	 OOcYHagBOtvQlHHX/dqbXIPOVI8rlMZdGJo7PDvlxAbNbOpvK2dbPt34UXJYKzcDAICzA
	 K63I5njJXTnxcuu4cPA5fF6emwtEZFjICLPYUFGAksqdyXCDrPHwPyh1tQVS3dcmsfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=RsN7rZ2dbjSWgctf/6anE9q3RrhIqoFI9PjpCDIzg9s=;
	b=DKGz6X+wPPxmHD/F7SjM3dcYqshhvj3MBKEWYL1Y/ldStwjh1M1dp1D2/dSw/i5xqcUx
	 OgNl1K2MVkHifeLCevhgVZ/oh97r8CS197adxvoTajK8tXme1lZ8cF56CJuBDXbaBcTlf
	 lOiAP6IY8F0tKkqthrE73P1Q137gPVu9y+h+Zc90bL+iF6b6dL1orM6xqTj1nnSv0wSsH
	 axGRdxQvAwwS6pbwWL5eEjoYREM6iJXfrpunfiZl1w571dsaH/UeIQzYNhZ+upkjKdKh2
	 KkGATJ0cyfmenAfptB1ZfGJXA5LyKDn5Ank2huntM2LIHuca2HDLJg/TCHotunSis6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ddd8X3OR;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31020606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31020606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ddd8X3OR
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-81ae6aefdceso1156486a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617536; x=1793222336; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RsN7rZ2dbjSWgctf/6anE9q3RrhIqoFI9PjpCDIzg9s=;
        b=Ddd8X3ORgJseDZnnHJQFlXS3oVGl5pdotkyE6IqcDl/0bdwyFA04ndcny4IJnn95SC
         tl8q7EKSfeuKvLJNepIVZy7dgrEingoqOT8zkst+qj6BoLiLyrWCUz0YPJiZRu4k0dQ+
         iCYU9QsarMs/SldI1b/zQyo9k1HDCNTKLi3k5mX7EL6YPvcTRKhtFJ1VQ81lC3USC0cg
         +g7flPZCVy3fRySl5WJm+qQdAjdf5Az9srv7tvqr+vxbYRh8QTbYSaOkH/RzmP0sWGmE
         Bh8XNGh2khf0LGEdfQSYGOQ6iDiO1N6iwqClypUHBiPX7wscRSEN/46MJOA2OW5DIvcJ
         RsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617536; x=1793222336;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RsN7rZ2dbjSWgctf/6anE9q3RrhIqoFI9PjpCDIzg9s=;
        b=PoIci8lHJOG8kJtievSERF7EtKw1VS5PobRlfKJB8jwwr1IBdmzAzI2xAbhA1R8SEW
         bvtU0SG2AzLssCeq8tXkwvICq0l6L++4c/Ty+TPyyW+CUERka3FZJgeWAz+NMF3DEY/k
         MW5lMURz5S7V+6eCYO4puGSW2LDX7WJMU+BcnxdXEHSGiap7SMNHzP08RMJedTGsOKuj
         CkLg7XdO9ccvUJ0UahaqWy5OLlQWxpMwwCtv2bdu0btICCgu1bP4GNRi7Hhf+8i+mWhR
         brT3pWepIdy85jUnSh8APjEVYUNkVkzOpRFeNeqgEsd6/Wzlf5w7sAKvqOgIpXreAazF
         /87Q==
X-Gm-Message-State: AFq9FYKRs+PWridPnv1Y/iTFVrPOlX93cZEK5L9uGJv3+C3c1d2XCGOR
	g4S+dNP1LEQ/eYZZ6kkfYxByX+jgU+R+xeRZ1Dsdm316KfhPxYtXfeR1SZwqxg==
X-Gm-Gg: AYBFou2VPSq5U78gsWouo4hc6nd0umA4D7LsCD/7an3WpI9QJMSjFy+mdQGdeHsRtIP
	/aSuSrWHd63OSF4VprZ6qD+uNXAnr/7LQb/DTNU5JbK6qsyIrmqv1QkQT75QEpD8DVjB8aZW/wF
	iI6Im7Y9340hR05MYAxCW9v5DLA/TpmmlYxl4P5mxcM+tTX0mBzA5SGMCQrTtn8FbWNIzHLnl2b
	JFmdDzE+idR8UH3v1o+yjoawNNHI5rC6TSBpUVQvM1TCBJr49hKKA8V2GhZ8M/8WZ8b4ayItt0E
	hVkZgrAIev8ltvVH8JFoSKJekMmtnqtEyhbDhzfSmar0ldFJ1cZklERFnEf4Rr1GZOv5XHo/30Z
	PL7PfySgTkmQf6i5iQwYExsoy6AoRjYaKJiySUwYSPwBZymCNgN0kZPLulVqicE6r10eqjoakCk
	fw+WklGvBlYNWAHaSUY8an9KX2AFbYwzb/TQ/GzCglVp1Xx/oAjatJcBU8LJ5qn19F9Bqn4MMEz
	rAHwMEN6MNPoV0MrpirhNb63nv9Pqwrt92q3sHNiKcLntIMoNaEWpv5HdR3NOPrnG7k66z4NMwA
	1K0fhaHt5HXni/oro5+4BWCe+E4zyN2uS4ohbn7nPZavDITkzzzENn5j6LjQV7cU+p7TMQCsh5h
	J1ivy760ZqYAJIfkLP+XefLxidu0E/ckgkMSISUth64HqTMXLNb/T4XFukHKRBf1SrQuwV2EomJ
	ljib0A
X-Received: by 2002:a05:6830:2985:b0:805:2785:fad5 with SMTP id 46e09a7af769-84d09d0a654mr2293305a34.27.1792617536081;
        Wed, 21 Oct 2026 14:18:56 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd7d4431sm3527487a34.19.2026.10.21.14.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:18:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:18:48 -0600
Subject: [PATCH] serial: 8250: check DMA channel configuration errors
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
Message-Id: <20261021-submit-serial-8250-dma-config-errors-v1-v1-1-c067587d1ef2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBBFr0Jm7cS2BKJexbAo7QBjpJhpJRjC3
 W11MYv38/+bHSIJU4RbtYPQypGXkEGfKnCTDSMh+8xglGm1Mhrju585YZnZJ15Mo9DPFt0SBh6
 RRBaJuGr0Td22tRqUu3rItpfQwNvv0737c1Y9yKWiL43eRsJebHBTiVL6nPNhoC3BcXwBOyFfE
 qoAAAA=
X-Change-ID: 20261021-submit-serial-8250-dma-config-errors-v1-d536630f0c9d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

serial8250_request_dma() checks channel capabilities but ignores the
result of configuring either channel. Those checks do not establish
that the provider accepted the requested slave configuration. If it
rejects the configuration, startup still selects DMA and later attempts
transfers on a channel that was not configured successfully.

Return the configuration error after releasing the channels acquired so
far. Both the common and OMAP startup paths already fall back to PIO when
requesting DMA fails. Check configuration before allocating the receive
buffer or mapping the transmit buffer, using the existing unwind paths.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 1da605cc8601..d6cda9a121c2 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -262,7 +262,9 @@ int serial8250_request_dma(struct uart_8250_port *p)
 		goto release_rx;
 	}
 
-	dmaengine_slave_config(dma->rxchan, &dma->rxconf);
+	ret = dmaengine_slave_config(dma->rxchan, &dma->rxconf);
+	if (ret)
+		goto release_rx;
 
 	/* Get a channel for TX */
 	dma->txchan = dma_request_slave_channel_compat(mask,
@@ -282,7 +284,9 @@ int serial8250_request_dma(struct uart_8250_port *p)
 		goto err;
 	}
 
-	dmaengine_slave_config(dma->txchan, &dma->txconf);
+	ret = dmaengine_slave_config(dma->txchan, &dma->txconf);
+	if (ret)
+		goto err;
 
 	rx_dev = dmaengine_get_dma_device(dma->rxchan);
 	tx_dev = dmaengine_get_dma_device(dma->txchan);

---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261021-submit-serial-8250-dma-config-errors-v1-d536630f0c9d

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

