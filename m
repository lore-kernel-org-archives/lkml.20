Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ED44854F8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051914; cv=none; b=oYMdx1xlZVfMm7dRrN5XUW6BvYW/RVUn8sNdydCzRZdfqyeoidzZVDb1+tnbnvXevEJK1epEuN+r+V4FkdWYCSTjBqWvHAnQimenRhnHE4AKs6A8qSLhmv1+EJiXhqsu8SsBCZ8PQ9XBHLBGf3M8diqgSFjn4ASZwyhw53yLJxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051914; c=relaxed/simple;
	bh=vrhZaN6ooV1HGu7a49Ko9I5VJwDAUWDuBNbBUxL+xCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=StHpp2lKvXw8V8Sx9K4yMUce2wQI2/7G6T5RNmJpD4mNPp4C503EGcODMV41b2YzwAeuaS0FZ81ikO3eBmllcTCDPSpvyIJfktJYslhlGJCnY7BtlwvnTPy9fH8vrLMJAXorQPi6IrwliMThMD1PPqAV+cWaHHb7/Qi+ynsMGio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYRd8rR7; arc=none smtp.client-ip=74.125.228.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYRd8rR7"
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c3184a307cbso80903366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051911; x=1792656711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/g4HQu5UdzQeNim7+4cxYTFdG2dsVY/hmSvjIkvj5U=;
        b=hYRd8rR7lIXQFryBTHkv0KQ4l1Z/q6caKOXdxesrx2VDJs9VptRqdJWmwzQRCwoyfO
         Cl3n8T5sOYU8ANb7fUhe4J87mbTjukV1mbFFYMUBp6O6jQHn8YHPCpu7ADI0UlylOikT
         b/6cyBrZP+YlPHy8PHvNrPpZnvJiw1sx5Nv4mqJG4uufjFtmNleG6CrdgrBR1o8MedTA
         LaqFf26dEMYVQI2CcNaKWjbN3ss5RUxmZz1LXqsnJsdT+B8T1CbEaJcFRT76d2jJsoCh
         MXdKBwPrsTdN/Vca68d0nunoehGdfT7csOYvu/KROo1vGyNzQVF5B5ONVz0KTwRblYNq
         2gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051911; x=1792656711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/g4HQu5UdzQeNim7+4cxYTFdG2dsVY/hmSvjIkvj5U=;
        b=Wb6TbL4E9QvOd6qoyezybCOv2hvKv28HDkqyl3FoPmzdVBCSGIbPdv41vbCgIsweXk
         Mqvh6L7z08gUTKsD5qwr6cR0J6heiYrGNfMXejxbB50Bh8/LQOB1ll4rwQygxRXTiula
         CPuodgQ+IpgJjLuWBBznN1G90RN7jiq0Ctn2JInVgdUsPm5jXR/QYtvaD4lsEWSkIgQD
         h8UAvjR39UZrhM3Noy/AHbi5P1ND96YLCYt6f7WV8hyYX9y7YXdOTslyGOdu/SLT18cO
         NTVk6krMGOl8K9+GDExqwxpy3WQLj5XvqkqNEdDa1DVcmwb25eE1863PyPxcbBxfaHo7
         iv9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3CvdYlbjayqKV3G7vMKUhKTgTa6/yCQ88VTT/Rsa0nwsXqDW4ElA/Bkf3YLOZwFaO4YMjJKJ+iJuRg9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsoTbkpXau+JL2T+O85hhPKqnxaxLz6QRnRe2sFaPDqRw4sxEA
	+bewjulVI+1N0WZI9iGgt6cIwBognKBqELxw6Je1cL1GG1GrlDybeyBh
X-Gm-Gg: AYBFou2NA9GT3uK3M8XB240f2Y5nyJPjBt/+4xz9qO27hoHKmjzuP7BAMM002XZvmmy
	tYvgR1YR3eyoRZFMgLd5RIaMU0NjgLk3NXwxsUsA4Vc0DB/llbyuAx6O4YY6YxCJSNwFS70Faik
	UZeTCAZuit3VBBTB+fG+5wjuKANj8PbKwnHp7jNUuVOE+NAIbpYdw1y4cNJSVmHsWt6HD10GbMM
	XFeRFtGcK5kOb/HbfvnPKCW/vJbm7Xiu0VlxNnwHbiAk/7QONGY6ZzC9OWvzYVw/4TF+7+APFGQ
	6TVKNXXocB47SiEBqc28XJOv+g33tgCef3BtSeFYeNaMNYJJYjXzWFzT6n/suk3Pr3uUrsCvKxx
	vmGTMUU/lioxMHE5hK8ow9MaUJ8NF+UUwNgLT8sp1PmOieqtAE0tXX6J0bXCdAFNNzoVgrUyHF/
	NRBG16V5uDWEtXTo2Qs6BqIwquII5ksEV+gYIEGfDFDchd3D1zAitM/5P2kb/peaHUkXvSGxwW6
	+2+Os9uOJZO0iJzUVriysKAtuDqb9uNTezHFhfNGZT05N8QJvkWyK61V3O/F/Wx/AapwcC+HbdB
	E6bXnL3OyM7eJqwcxUAxXN8miw==
X-Received: by 2002:a17:907:3da7:b0:c26:2fc8:4e91 with SMTP id a640c23a62f3a-c31a9d579d8mr1702132566b.29.1792051910602;
        Thu, 15 Oct 2026 01:11:50 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda5297b0sm96080666b.63.2026.10.15.01.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:11:50 -0700 (PDT)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v2 1/1] i2c: i2c-xiic: fix clearing of bnb irq
Date: Thu, 15 Oct 2026 10:11:27 +0200
Message-ID: <20261015081127.1566244-2-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015081127.1566244-1-thi.zirnstein@gmail.com>
References: <20261015081127.1566244-1-thi.zirnstein@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a function for clearing the bnb bit,
It waits for all preconditions before clearing the bnb bit or times out.

Tested on Zynqmp dev board with some custom logic.
Tested-by: Thilo Zirnstein <thi.zirnstein@gmail.com>

Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 42 +++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 5e397a7e63f6..da9cedb86f94 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -230,7 +230,9 @@ static const struct timing_regs timing_reg_values[] = {
 
 #define XIIC_RESET_MASK             0xAUL
 
-#define XIIC_PM_TIMEOUT		1000	/* ms */
+#define XIIC_PM_TIMEOUT 1000 /* ms */
+/* timeout waiting for bus busy */
+#define XIIC_BB_TIMEOUT		(msecs_to_jiffies(1))
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
 /* timeout waiting for the controller finish transfers */
@@ -392,6 +394,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	return 0;
 }
 
+static int xiic_clear_en_bnb(struct xiic_i2c *i2c)
+{
+	u8 sr = 0, isr = 0;
+	unsigned long timeout;
+
+	timeout = jiffies + XIIC_BB_TIMEOUT;
+	for (isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
+		(isr & XIIC_INTR_BNB_MASK);
+		isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET)) {
+
+		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
+		if (sr & XIIC_SR_BUS_BUSY_MASK)
+			xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
+
+		if (time_after(jiffies, timeout)) {
+			dev_err(i2c->dev, "Failed to clear bnb\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+	return 0;
+}
+
 /**
  * xiic_setclk - Sets the configured clock rate
  * @i2c: Pointer to the xiic device structure
@@ -881,9 +907,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	}
 
 	if (pend & XIIC_INTR_BNB_MASK) {
-		/* IIC bus has transitioned to not busy */
-		clr |= XIIC_INTR_BNB_MASK;
-
 		/* The bus is not busy, disable BusNotBusy interrupt */
 		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);
 
@@ -1028,7 +1051,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
 
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1095,7 +1118,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 
 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
@@ -1179,11 +1202,11 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
 				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK |
 				((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
 				XIIC_INTR_TX_HALF_MASK : 0));
 
 		xiic_fill_tx_fifo(i2c);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1225,8 +1248,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
-				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK);
+						XIIC_INTR_TX_ERROR_MASK);
+
+		xiic_clear_en_bnb(i2c);
 	}
 
 	i2c->prev_msg_tx = true;
-- 
2.43.0

