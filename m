Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911935;
	b=KWC28Qo+Vnu/AwYa2pCzPMtF1Tlwwq+Pqso1Eh6BvsMDnPDdysMgkEp2kVU07pDWc5+u
	 G31CwmjwWyvMw1IhKBl3KnLIUqHQfKsp83V0UTvUKG7qphlUi0LhqfIYwWW/7ofumrwuc
	 E3g1V+kLeY+GsJACoWDeGUgKMge3D0q3JLY85XPubC0bNj+3KdgStxwraGZz6jXdiREMW
	 i18IFh+JgCWgPPQPTdbSqtiih5c2LbGOLaAPKuSyG4RapWyjTZcUWNEMI42OLF8YgVcUU
	 L5y490L+B2DBk6nMbva4g2M+bVSZYEb+HvRFEsZcmHg4w++VkGrajP0bX3mg8+AwKMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=;
	b=IsZHuAd6Is4LhSbrUm5Lc3NQx9tI5zxyabzj8Ie6eSIyrfv+1LkW+OKjbC/U7XQ0edji
	 QFHbL+5SOtOI+VH/R2pv/j+vzdF90Vvfn8AF5DhRvqsjbYtgCTu1Y+SubDTPlRKNKsfbO
	 NlGPlrggOgnHms1yp1jniJoeqDG4awj77XAnrTKPMp532EWqUEiUhQbo9vXd5zwO6XhjH
	 kAU+F/VXBC6bVFo6VhKZSKJrQlc40rt53/m4bnBzhrAwkkYkyNOUsDrmTCmDCxMwbbpSt
	 qNPcmGEpZs11V0hKmL5Cet5ZKc0DZrro57TsLO5VyERAuV7bNS4s7ORqgkVrZSd5b2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjJFfOjv;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E617606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E617606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjJFfOjv
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843cf077f10so9355a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911934; x=1794516734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=;
        b=NjJFfOjvN6OJTs3+ELek/WM2NFYhKA8wuBUCcV/NcpcAQOMD4pbyCT7DIj9R4Q3750
         Dxj0lY4YQLN6U2n5CCcHaDOW6YgldlFsaf1LFiwPnMZ9nXDg0cuHo5C3JDrMnf9iqjPQ
         lZz2Tc0My7nu/aNOvv0uEdY9Fh4tDZKZkAq9ECYhgOgEjRj5SljbIqV+mp55uq6kZODy
         HC1N0WrLCfkOxw3lHfba1dIoVeMTE3pAc600+IA8rBpKChSuh/q/y4DLfM3BGIR2JYR4
         CjFb5yxnJB8hv/KoSXC9t1Ar9uFPt+xzLAwDKrXW3k3kysjLjbh4P0e4SlmtbRZd7LvK
         yTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911934; x=1794516734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=;
        b=yqnloYLGnK3S8FY4h3F56jq6iQK33MkCqLYR+K1B0DQVe1LkpiF2rl46kvus2OQiPE
         6xWDMWZV1xVjCm2iFts7BWYBkehfsj/+zykbKBcB8+thp7QlRDFoYeT8/kJnZrMvEBDh
         QFbqwC2DSJwoZZSDVSgcaLK8OU3F/yYhEkigWRkbKViVPnf8Qt+ivYa5YV+PQIshRLOd
         I/De6t7PdsZLlMLd/elKETyeZUQk+ZzYk6xTHg9G75KFFUv5nHmaXlrC6C8PnlXtxaM5
         5MsTcIqiNleeadTbWP8gB/PBhfaz37+4aIhmNlz8lyQk85uPQvvOPI/12lTcvCGcf2HV
         O81Q==
X-Gm-Message-State: APuU4Z+x7Pvt/kJMwH7zDUI8lC2Sq8ITNaHTtOf+sAtOKb9ZLYQRwOA2
	+UHL7E0q0Fxm5+p/yu5dSrTXGpfeD9i/HmI7p18aVCGYaY1ND9E/iHC5
X-Gm-Gg: AYBFou0D4M6YJx69GhYvglvt+mMNiBC98Tb2tkqi6YhneqaCz23nGrgDi5dY/Ibzq1Q
	OAFSe2ETzw87umbKFjasVL40gI1I2cMURruYxvNFtlw+VoEbN+5fSLgcc8ugaxsQavN1cvqvnLv
	7WiscgF/iAxhzHcfsAd9xg0YTqd5fubWkxXOHUtEq3+w2PXqDfOIc3+H7OwL62em1usFLTBqdYU
	zK8QJeRCalzW/6bEeksmHg/nA/HkxecRo4pX1yWMrMrYhKsKjAOtIIXxQM934YLu4p9Q6yS0tyH
	qKGe423bj6oWzIIKeQ+cBA4eY26V+3jnSEjhP4rW0o1dNRUtxxUwx6mbuwEN/76wJYXpRLZr1X4
	NIK83SQEfzTRKk94yP3DP+ii2dmjIlgCxXvxSqc3Rp9mnfpg8f9Kss3V07NN1nsSA6NyIiN4mxU
	tJkyXY9TgpyFg7v3O08PTQdu6jC9RDxcjdLABs+lgw7mcFSSKaJN21XH8BblIEtBDPh7F/tsSDV
	lQaRqlzOrETfr8xIik4jlln8x3HWqRcub0DnETfvUzp3IxEq7Q2fNu9VI4dEsF80fg4KInQISEZ
	H8lThOp9+YConeih15QjoxHYTjqgHVYpgk5zrKLMhMiTuJcT8HdyaMLNdqLnyu+/6vsroJEnwwU
	g5BaCJ1xWL9YX/bdJrJgCDx0n0yVanflclPh1e0qHKuHz6pEmPp4+S1kBp3h//33P/wRcwaFROP
	fYv1rohnhhMgCSnSaGDtNuITqwLJGxt6I4xKKwfzWDQ4BdGhehp7FeKS2dV1Yx7uN0+BlsPtV+
X-Received: by 2002:a05:6830:2e12:b0:843:cf07:7a99 with SMTP id 46e09a7af769-85f1d14ff4dmr511092a34.31.1793911934069;
        Thu, 05 Nov 2026 12:52:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:02 -0700
Subject: [PATCH v8 01/11] serial: 8250_dw: allow port setup to report
 errors
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-1-14024d2b184b@gmail.com>
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

Return a status from dw8250_setup_port() and propagate failures through
the DW and LPSS probe paths before registering the UART. Use the existing
LPSS cleanup path to release board resources and IRQ vectors on failure.

Keep the current setup behavior by returning zero on both successful
paths. This separates error propagation from the configuration validation
that will use it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 7 +++++--
 drivers/tty/serial/8250/8250_dwlib.c | 6 ++++--
 drivers/tty/serial/8250/8250_dwlib.h | 2 +-
 drivers/tty/serial/8250/8250_lpss.c  | 4 +++-
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..80b2b673b422 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -765,8 +765,11 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (!data->skip_autocfg) {
+		err = dw8250_setup_port(p);
+		if (err)
+			return err;
+	}
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 91b3607b64e6..4a06dec6e263 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -208,7 +208,7 @@ static const struct serial_rs485 dw8250_rs485_supported = {
 		 SER_RS485_ADDR_DEST,
 };
 
-void dw8250_setup_port(struct uart_port *p)
+int dw8250_setup_port(struct uart_port *p)
 {
 	struct dw8250_port_data *pd = p->private_data;
 	struct uart_8250_port *up = up_to_u8250p(p);
@@ -250,7 +250,7 @@ void dw8250_setup_port(struct uart_port *p)
 		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
 	}
 	if (!reg)
-		return;
+		return 0;
 
 	/* Select the type based on FIFO */
 	if (reg & DW_UART_CPR_FIFO_MODE) {
@@ -270,5 +270,7 @@ void dw8250_setup_port(struct uart_port *p)
 		pd->srbr = DW_UART_SRBR_0;
 	else
 		pd->srbr = UART_RX;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dw8250_setup_port);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 7191cabfb086..4d32651956ab 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -100,7 +100,7 @@ struct dw8250_port_data {
 unsigned int dw8250_get_divisor_dlf(struct uart_port *p, unsigned int baud, unsigned int *frac);
 void dw8250_set_divisor_dlf(struct uart_port *p, unsigned int quot_frac);
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
-void dw8250_setup_port(struct uart_port *p);
+int dw8250_setup_port(struct uart_port *p);
 
 static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)
 {
diff --git a/drivers/tty/serial/8250/8250_lpss.c b/drivers/tty/serial/8250/8250_lpss.c
index f1b4b975571a..7ace0515038e 100644
--- a/drivers/tty/serial/8250/8250_lpss.c
+++ b/drivers/tty/serial/8250/8250_lpss.c
@@ -350,7 +350,9 @@ static int lpss8250_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
-	dw8250_setup_port(&uart.port);
+	ret = dw8250_setup_port(&uart.port);
+	if (ret)
+		goto err_exit;
 
 	ret = lpss8250_dma_setup(lpss, &uart);
 	if (ret)

-- 
2.53.0

