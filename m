Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778695;
	b=ASSwgoE0VVIKhnv8T/TZHMXZOi8ue3tkMFPKTUVhASC+2f2RB1SGxrxNXTZFTM7Jldl/
	 I6VkMJLPH0MEm4QIBPXLFZPT/CeW5Xed6IAmn2f+bJrKc/pCLRq+XcUi50ZXX5hecJV2P
	 bRIZQXLme7BURfYu1iO4Fr6Sx1WCnVJKuyLJYxdytlWZm8aQsfshRruWegw1n8p8Bt4RW
	 aSCOd/y3dUAdGHobQ3NEyUXcZsYQunyotF7dhfmtrWnG4zcGorf3IzJs7yTjsWrpwBIRP
	 HkG/h/Gd881P55DAjR+mGkmYw5egV/VfYFSB7fUblSdPewtu0F3OSizfUg+8MYjZ2Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=xOHFt+39a8y9dltLK4rpxJ2SUya/j6rgYzaVSpC4iwtM8dd9+iDnDLHfIpY27QNZPumi
	 m8/iP+e60mQg5wwb1KLLpDV+B1qmGPQFFTnwaBWhcB/b4YgvFOZX8wmWVwEUDGVhzn6Ko
	 h7DzZyc+xowAfA7hGz263dPcQDK0W99IHjJl25tgwGpXRU2dHjAUBu496wkyglvhMiJsC
	 IpOLgQVJi/p7i3e7Tl0d5vLJT3QCWpcgM6n6aOGi30UJD49GSCKszgD5pKZUOVOI+yASt
	 nPRO0AH902Ub6M9PDPNlSPRkZ5NzxoFqYSmaeMzjf0OjdoIE8V0ummlz4tL0BbodJSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q1pu7kER;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64BA606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64BA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q1pu7kER
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a6fb4040cfso397338fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778694; x=1793383494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=q1pu7kERnZgamfiFWXGhwve1ItyZ5fdtQl5KucJ9oWetk+5D10lEKBqAh2iEkVJD6w
         g8XBbecVWK00jgakA37TB7zRJ4zO+hVW5I5kLFVf2fhsbiykilgJhbQWDQuHSW41tNOh
         inzBmuIjZggSna7730tAXLOj0U42Xeln8+eCaBj02S/flq6x19sumjszehiC/vmogoDS
         4znMDt+sg4t++y2qk4YcuEbNVbIws8h47BXV21e+p1Coqct53be+yDQBgAfczHS+3e9n
         3WIIhNzNoC/gYqrAQOeKrjnGfWNMLFviTSk802pfx/FS0/R3oPrf1X88PyRlKWivGM++
         mn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778694; x=1793383494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=pWMmE8qNvOM3BfIqXHqmmd/ljxyRYlh0eTehbtpHDqBlOgfdFU8VKBYybkFjNUPx2M
         lHm44SAWbvW/gSq0pf4Tql1EtraRUoXJyyZ4D1rWTyBqZ5bz+1GlFqWRCOzDNragRPsq
         ypGqRkQAKSg1OLUv79UJ6mpwTU6Q9nvRpJjmA/BdYLGFp+s3AWY2qIXEWyZU+4rct7mc
         1HN9YsLkxstoCRCLYAWUJBQsmjYsq+VDfsntTjuGFgjJUSEal/4VYEtDVdQSJPAOraJL
         20V5rTDEXo4A2nSDgZa3dlyNil0piIbWphi/F1w+UueeFkvQWNS5mhbapLfbq66fG7be
         +LGg==
X-Gm-Message-State: AFq9FYLqHsEV7C7qrp8VCoWRcnh4ezL9x3JN3w5ZhEg+Sia/VSvoBFBW
	ah6d7iMSsk+kmerhnmn0Y43Oyp/5gkb99u8wnJS2MU9s6BIJ7tngOGbK
X-Gm-Gg: AYBFou3yI841/U1IiCp+bk3xV1RuDQDVeINT3YAv284fdikj1y1ZD7RRhaeZBMfYfJB
	h9RS1IyjbY3F3Kg0LdTiao8lCDJ0J9DAWTcpUnkxFbfXAeFZpVdPwueMhTYW2lBQTGv/Q7fWXGR
	zSsPWPsK4el1szDndUW4VnypVbOuqzF+9luMfb4ZZsHK9isV+fGtIkWbyEqZiJyJlIuM8Mr5zd3
	N7EKf/XnsAynZ+7FOsKGYglY2gWpCgR2TWdJeapLV9uhXint+yTMc+9jh2hQIXrZzuh+SktTZY8
	AdEdaDd5ANxr4BkBSGOCath61BbU+b/sjlYtShRJVaE20SzcmZS/b6uBN3jqRRUPmMsa9qqvcVP
	AtC73QlLlNOsFNQKpK1H/OTpgdLesV5astbGO7+kSX35XXmQNYFQmRWSuhYchMdqFM9LNZyNDla
	U/DJDck/HpQoXQejnDsqzpaqffw/pxzYOa+A4lze3nGMRgxWVFVbGQIDCmbtgcjsatQ87FUGPq6
	Ayw0HrP2hLyWPA6cg5iQFrnmmYkaog3nBorPv+rlt8PHsTyJWx7WlkpLNycyEAtbfViHMycbprR
	3iWxy3MurLdY/CTKdFdQLqrnv8RmrWfwQ7s75MeeJ4/7SxU66O+aXsJ/39WsfaPjLOTBLUB80my
	u3prqDghL0zthX5c4VBC3OTGpiAH9+49F0EAJhmGBlWCS1QN17vBL08K6200ARUSZtqcgBp+11K
	zv7Q==
X-Received: by 2002:a05:6870:a706:b0:47d:a12f:3951 with SMTP id 586e51a60fabf-4a83f51992amr101879fac.39.1792778693667;
        Fri, 23 Oct 2026 11:04:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a838207cb9sm544329fac.5.2026.10.23.11.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:04:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:04:29 -0600
Subject: [PATCH v3 1/4] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261023-submit-serial-8250-dma-cancel-v1-v3-1-d78f9e4c4932@gmail.com>
References: <20261023-submit-serial-8250-dma-cancel-v1-v3-0-d78f9e4c4932@gmail.com>
In-Reply-To: <20261023-submit-serial-8250-dma-cancel-v1-v3-0-d78f9e4c4932@gmail.com>
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
 drivers/tty/serial/8250/8250_omap.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 4805b644ccb1..b6f108d34854 100644
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
 
@@ -1123,6 +1118,18 @@ static void omap_8250_dma_tx_complete(void *param)
 	}
 }
 
+static void omap_8250_dma_tx_complete(void *param)
+{
+	struct uart_8250_port *p = param;
+	struct uart_8250_dma *dma = p->dma;
+
+	guard(uart_port_lock_irqsave)(&p->port);
+
+	if (dma->shutting_down)
+		return;
+	omap_8250_tx_dma_complete(p);
+}
+
 static int omap_8250_tx_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma		*dma = p->dma;

-- 
2.53.0

