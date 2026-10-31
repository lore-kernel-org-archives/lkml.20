Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407352;
	b=KnrnXF0CNO0mpyk+g+vD/gtM5Ab8zyoK6K1BKflW6JJVDvNQS0dmdy24kDCg9r5wxgKK
	 q467yBxUDyFIm+YSMSIHH218SQzCM8oJGT86f/QDfT/Ll6otvUkgHGCgqQ2QHhZEFZAR/
	 nRbjTVlzXrLso2q4zXE5tlx5QLs9U7Hp4hDg0LOPx6f1kFoBgsFLwx6XHGWuDWN7Geen7
	 jtt0oSlm3BwaV9VtttCtFAYk7WyNlQwbPi+1apBR+kOLAl9gYUjn/nysIb498rM3hWJXf
	 Et6hEM/oNi1TPxNbqIJ5Rfa2qqHBehoOJTztLZiUDkymlcEgMfxqhC+nVEpzgZBuUVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CSp+JrDvF+4x5emqlEOYM8+al5h5LvfzmXFhEk2YqvM=;
	b=iM5vYnpCXcwQ+XKJy0JporVNKQQI3Yu6L2kPsDbZmDbOUdIxKZIM/JysZjvaDSvp94wq
	 SYkfP7Z9PJkUIWhHQacCbxCHqiFfVEg12FoaAH9gif58fTAaDdyQ0kUxMjQ2qGa7x/nIj
	 x6im/uneYz+L5CTLxaPiUS3lwqBf0nfmUzBkq/thdhVGwexayWzvIAJ0/xCM/VfUus+XO
	 QDGXTg8jelq4AedKJwtVwJwe/95xOJ7PuJO34tONj9g9W3GL5KfT23Sx+dc/u580GMGni
	 vs6f8JpigoNm5curUU7C1etFGtL55StZBAHBnXLKsd9FjwBa7+u09YT2UH/JYNHOE5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xowMI382;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF62F606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF62F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xowMI382
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2191362eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407351; x=1794012151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSp+JrDvF+4x5emqlEOYM8+al5h5LvfzmXFhEk2YqvM=;
        b=xowMI382kXt0JlNAaISc4k7doxpJc4H7KqK3RcQHXxYwEPuaDmuCdCeT8vjQ0/BkuI
         rAGBmDV0aq8uU9ciZbt51HiIhebAZpONrCz0ycnsD2n/FAruk1wsdYr9QZAHlM40WEiw
         AOO+g26kPqVQVJzYFfmKcf+TmD0uT7t1a0OiUcEK9RJEDlQ/Dd+Yj8Bsm2NTRIOnT7v9
         KieBeewfJq3qPm0h3+SXz5ixZ5B0EJbUI9iF6siVi1Lk/2nTrrWdlEqeRFqQSoq9LlBC
         B68Y5T9aNMJuWXzNr5eX+37IFP4bQwZZ9qN5735AQ2v/IgkudPDP2sA6NGtRS9caYy92
         mXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407351; x=1794012151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CSp+JrDvF+4x5emqlEOYM8+al5h5LvfzmXFhEk2YqvM=;
        b=2uxLLoCwR1i0giWtD8mjcJUQnDJffdLTP6GDyWw/0v0u44tkN9KcUA42Reg17/tukZ
         ORViYH8nkCLNe4ka8Yqlboda0FUHxIK3bEmvYdNgS/zWQs9sV9QsjRipTzFAdrj4XWaJ
         lmPmrpf2YpPjbXvRcCUaKoYcUN91+VdNTn6vCeFpSDgiEiizJOP4r0o6y7ATb5SlQ1Nh
         s0npQd2WJV9TNUJxm27GqwRKX6PE6QHMMueJyW5rBKI8duynUIiWgZtTxO37OseWKoTv
         NIfbQMZfD7+SFAH3ghvmrxScACAL6xwVD1PKt+l7qejyJWNl2UIMLOg8w3V67tg7qdVN
         UqkA==
X-Forwarded-Encrypted: i=1; AKwUvBzHEFX7zWBKG0DFr/i9klEmZVySr6OdKI4UUkrTpEs4NiinPa6OoHMQf5h3XZpmkH0dHujLNKkq/0LeFWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJs6a55+widgkRSg+kIYDLXGYKF4CsdBKniEQSzkK6xHynh8HA
	p2FL+ps5sa+FdFmWrQHYkKWBsrW6C9n47nYWCS8Vu1A2mEB+nj2vOavK
X-Gm-Gg: AYBFou0/PUc/5IrcqSiHMPo1LAunWCmrsIHYD/Ycdy/kNEQcvfSqAM47SgeWc8x48E4
	CKMmpzUanaNLXSUn/OgUZYBzIKrDygpagp7J4/zyJ+nlAslFOKymfX1awYWQ//+4Dv4fmRuzR6B
	FXP64ixSVLdG6pY1juMWH7TYIoh6OX/AxYbTJ+XGpW5IbcjbH8QMpNTlt1Sz5jy1lXNTPHWuDOu
	GevVUIvyNKMIWMAIyhdVCVmq0+TdaZXfDMQVjbYY1EDTzRUJo4zmP3IQtDrduRdMX9HK8Cf7PUa
	koUEo7DnlbwH4KuRDNYVKG8jFY5XRQt/JI21OEwanv+ny7vZdnkugLMHLAdxlzEB1Ynl9/Fe4Jf
	ybVn3wCkpxLgim7SDo6jxDC0Wu+Sqi/2ueBaOM5UEOYmSSY453H8eAeGrsmjWex5Kncgqf4prkD
	vAvgWBZ2VFuoUhj9/FlAEUC/F3leX2DzRmRhlAJQ99Z/TERnAf9UWJ9r7wA6nFosHcsv8beo+Wk
	h9v3EkbTvAMOMlX5cnfSXyTW2vlABWvMd0DRtQxXsdO/pUkzyHnZ5/8QLWXbpvJuSVUSPQHRSJl
	qfqHTZUsTA+fCWjmDpzqrMsjz+kCvamhcyvmwI1u5cb1gs0eHDH75TNio0Jq/J1OfnIQkt0JADa
	gKhp6b7h+tGrG3LmnKrIn3u0ssSNrSTe8VJ/Gk6Yf1OJpAwwzWD+qOZe3qTlvtWlA5KfOJzxloT
	u/NT5WCJrCT7SDhLw=
X-Received: by 2002:a05:7301:6787:b0:361:306f:c32a with SMTP id 5a478bee46e88-36a42345b05mr7287000eec.11.1793407350704;
        Fri, 30 Oct 2026 17:42:30 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm10889097eec.8.2026.10.30.17.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:42:30 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH 2/2] tty: serial: samsung: do not re-arm RX DMA once RX has been stopped
Date: Sat, 31 Oct 2026 00:42:17 +0000
Message-Id: <20261031004217.3340610-3-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031004217.3340610-1-samarth.colleges@gmail.com>
References: <20261031004217.3340610-1-samarth.colleges@gmail.com>
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

s3c24xx_serial_rx_dma_complete() unconditionally submits a new RX
descriptor after each completion, even when reception has been stopped
or the port is shutting down. A completion racing with
s3c24xx_serial_stop_rx() or shutdown may therefore restart DMA after the
channel has been terminated, potentially allowing it to access the RX
buffer after s3c24xx_serial_release_dma() has unmapped and freed it.

Only re-arm RX DMA while rx_enabled is set, and clear the flag under the
port lock during shutdown, since the hangup path can reach
s3c64xx_serial_shutdown() without calling stop_rx(). Because the
completion callback also holds the port lock, any descriptor submitted
before rx_enabled is cleared will be covered by the subsequent channel
termination.

Fixes: b543c301c2c5 ("serial: samsung: add DMA support for RX")
Link: https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 2f6c69bec..3f2346f4f 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -622,7 +622,8 @@ static void s3c24xx_serial_rx_dma_complete(void *args)
 		tty_kref_put(tty);
 	}
 
-	s3c64xx_start_rx_dma(ourport);
+	if (ourport->rx_enabled)
+		s3c64xx_start_rx_dma(ourport);
 
 	uart_port_unlock_irqrestore(port, flags);
 }
@@ -1165,10 +1166,13 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
 static void s3c64xx_serial_shutdown(struct uart_port *port)
 {
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(port, &flags);
 	ourport->tx_enabled = 0;
 	ourport->tx_mode = 0;
 	ourport->rx_enabled = 0;
+	uart_port_unlock_irqrestore(port, flags);
 
 	free_irq(port->irq, ourport);
 
-- 
2.34.1

