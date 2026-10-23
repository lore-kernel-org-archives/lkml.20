Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715663;
	b=uiSmmcdXN30svDz7MxHrI8dgrdxZWLmwm/WCzy1frKHZeiq9mROgT1GHMyknhPcWp4y5
	 yYG5rBE7/I+kC5vbCQvpaZxO3WdjXgNHeQHzfSstxK4sACrsSvOGrRqbfHIo2V6jt9kWV
	 lttgRTosE7coebFpo7p6IibydhpqZDSJjgdv+K8hd2w4MGAqH0Yoa4qyF0zJjkd4DC7Af
	 HVsuLl9DWGM+pBdD2rkgK7wyuyDxa8ZMwXHW7/FfvLii4J2B1WIsSapZjM59qNcVfrBJI
	 etqItKRHNJ5cSNGS2HH6d5rQvak0a00sMuauBxj3Cc0pV3GrQ/qteuk5aDlKoWubihg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wOqIFGFfDcVsYZmpTIKhCRD7GalMgIESXWig5VjcM88=;
	b=x2nEpj/aQrC9JJgs1/xSSZMvNeizRMvOS8Ela9XTw735SXKJxRy42GylSa8UtO+os8vn
	 XTHeY8mLd56IGTSC4PMBrrUpJ6uz5Z3NpaSRiFYYlT6WKV0U26rv/giQb2UuDcdQ12sa5
	 SSxVxgGBeK1yhW/pJGdY7gSh1+IQhc1IyGACcfutvXmEzOokKlfLMJNa6DPCHpYh/loSH
	 DxxFypf201ap7ETvTv55uGoIdvPzDFln7glJ6cNlM82NjJSoz464z0CeX15XstQtUxT0x
	 di57+5a0ncFNYSMMSAeLtygk9u170BrEqQeFqZULQeoP3vk1+vSfmOp/VdYnUP/0k+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H6Xz6qV7;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E679C606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E679C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H6Xz6qV7
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6d290b10a35so160592eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792715662; x=1793320462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOqIFGFfDcVsYZmpTIKhCRD7GalMgIESXWig5VjcM88=;
        b=H6Xz6qV77D0PhKeccZ/JLv02ehjDKHGE5HVbFyKlA5eAg3yMvgUHVsRhKC9ThGO4CF
         CVef/LaKAAAYD2zGDFI5XuPJZ0IN847ZtmnX26jYVfo/gBHB9VDEr3MPkmG/oeJO9cWq
         /qmmblTv1+LaFIsMW0nom19V4ypYhVBTc/MlSHs91SIkWT9qdD4xdEynEZLSGxSOy61G
         QrVzhID+K9fui4pVbRhXxRowJV6IkON/sAFygEgNmmhmM4ZhwBR1GwiwTjU/kqVs5WE3
         7JB/H6FNvlg+GQwMJpcmo4e/qnvWMULA4Ls9l2cuxgYjJ5Cb6mZl3AxeB1Nk56w1IBRK
         t1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715662; x=1793320462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOqIFGFfDcVsYZmpTIKhCRD7GalMgIESXWig5VjcM88=;
        b=VKo4/X2qapc9edyH9swPSp7gROWKwK1NxX6Kpnd1anr0Ww5sY604tSOO2Blmllb+gR
         RG239cQTtuh5RkFl12y3i/4vxjAjfm0laXZBvIxi6WBbOs8b3+ejDMB20BazHo16wczm
         spX91vtINWkXlGO9751tlxqhfH2EOwO8xxnwXsrXIPdeQkBkW2X/xvmCxfGWPzlIUjlG
         Id/wD3xaD8W8cuwY8U1Ui/BlJ+r9GWYw4SRlHbUjvtGI6ih7Q6zAl/NW2jY5vFdAa0a8
         qOBjA7PyXVi1Od6US02rv8+4eDfltOoiTNQYaRFN9wqCGjW+IrnKFst9R5E8dkbFIL69
         o24g==
X-Gm-Message-State: AFq9FYLVgbc/MjtEYRmkW43jMMJH9ROuHxawOiRwDHLXnd/J1LNfQLXm
	ASBP5la/y3C6IRIAQDM7i8oZRYeM634kmQ++hrp7AirCfzLRYOSOotqk
X-Gm-Gg: AYBFou2iKG+1Noi0e7PPOaUB6ZW42/rnbtC2bTsbiwScaD08pDWcc1BXoyPAPv2R5TT
	s4ATlWBg1K99EAI0HJrETopSz+A40PJPtQtlNR9AZEq1HLfo3xkz0YA84tNvuheFXznM5CDhTp+
	JO+YLIFIBCGWfHFJpdvnQNBxsbWXWabXR3JoGdY9KkMvGk0vcqkMAXmtQN/S4F6TiugP85Zv4n2
	7I9jJ9XjCvvMDKaPd2zGzpVRTBg9edUDJZ4CZ12ZI++CvW6wrR2jXpOeQmAfMURQmFxwIslirzr
	jUcOG3a/koiJJ1B2PWJLus2lU1nmrUEnyA7vI+mD0kPGgiXQO0GPwKCZWDqxUASqhdxrsYzwmaT
	/pPUmubPt6xkJxbFob1PXxOyNcc018LkpAhkyWTjIOsjb+A+/4fDonV/LYe9NQLYeLNCy8UWYxO
	M+26QLMjSN/2J75clytTGcY4khgc8l+XmcKa57d/t4sIm0GQFIIBsEq2554bgVn4COaTRnm6uc2
	OTbGq1TEi58bAyxx7zLEZWJ4m+WD+P3AteTwgka5Aqhk8EFltk4Qh4RFBW2y1YtGG7Nkma6IJGc
	32elzMJ+/dFPaBCO9EIAaDZRVAy1VT+Pa+roSUjHOkf51DT4obqaSQk70zzrthrGzlwYpHVXQKR
	xNUSfUbUDHadPg5ayx4DI2lrZcNddrRiN+CBcviqcs+xCdPoE8yFowMWYUczijVuMWMNCrwzN49
	LVtQ==
X-Received: by 2002:a05:6820:1689:b0:6dd:1d43:8cd0 with SMTP id 006d021491bc7-70b88aea676mr690857eaf.80.1792715661900;
        Thu, 22 Oct 2026 17:34:21 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a820a9bcf6sm459716fac.12.2026.10.22.17.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:34:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 18:34:02 -0600
Subject: [PATCH v2 1/4] serial: 8250_omap: separate locked TX DMA
 completion processing
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
Message-Id: <20261022-submit-serial-8250-dma-cancel-v1-v2-1-088ea51e3891@gmail.com>
References: <20261022-submit-serial-8250-dma-cancel-v1-v2-0-088ea51e3891@gmail.com>
In-Reply-To: <20261022-submit-serial-8250-dma-cancel-v1-v2-0-088ea51e3891@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Separate the port-locked completion processing from the DMA callback
wrapper. Keep the shutdown check and locking in the callback, and retain
the existing FIFO accounting, delayed register restore and THRI handling
in the helper.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 4805b644ccb1..46f1fff361dd 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1080,18 +1080,13 @@ static int omap_8250_rx_dma(struct uart_8250_port *p)
 
 static int omap_8250_tx_dma(struct uart_8250_port *p);
 
-static void omap_8250_dma_tx_complete(void *param)
+static void omap_8250_tx_dma_complete(struct uart_8250_port *p)
 {
-	struct uart_8250_port	*p = param;
 	struct uart_8250_dma	*dma = p->dma;
 	struct tty_port		*tport = &p->port.state->port;
 	bool			en_thri = false;
 	struct omap8250_priv	*priv = p->port.private_data;
 
-	guard(uart_port_lock_irqsave)(&p->port);
-	if (dma->shutting_down)
-		return;
-
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
@@ -1123,6 +1118,17 @@ static void omap_8250_dma_tx_complete(void *param)
 	}
 }
 
+static void omap_8250_dma_tx_complete(void *param)
+{
+	struct uart_8250_port *p = param;
+	struct uart_8250_dma *dma = p->dma;
+
+	guard(uart_port_lock_irqsave)(&p->port);
+
+	if (!dma->shutting_down)
+		omap_8250_tx_dma_complete(p);
+}
+
 static int omap_8250_tx_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma		*dma = p->dma;

-- 
2.53.0

