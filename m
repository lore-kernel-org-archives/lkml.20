Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611972;
	b=MqljkrmxEx+lQjflExuKul8H//HNRxs6k+x+QCpOb+KGhplieqyn3Qw1Gt0o9cdPQieh
	 VcuwBybyGrxwATzt5MqQ3XROe2qe5zv1OB5tHyzsgBxH3gWKQHwz8hf9ViZtGGDIh4e1m
	 qfH8sdchQUkKd6P+ugs9mTQUHMHCCu++oZgbLMYNWq7QxQltFPNybEFzC7FZE1QdrRmJB
	 p8mUvWOEZdg0jjDqzaS/xdrC6EwPMAgNjZfEftJYHwPQLaNVff6WGlHU5Q6vCOTAG7Lld
	 g6YAzwIHX6yE8SrXfsIRIfBW28yQbDV0o933qtgjOpms9+Bsc9MKP8UTIyBCLIS/pYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kA+vTZ/Eeoad9jIjZ1JZy2rB2AcKRzVxwNFQY1s/X5o=;
	b=3Ikq3i22YfrFhHf9ZtWo4TMk97UxQoBq7PSPN+X/cGvavsWmQlw4tkgiW5fdT06Pff28
	 Nov0FatDQNdxJR4Ond2GPJTGucj9TShLlZhXv0fMbReXhz3cleIh1ntq9xlLBULjAFsJi
	 NelQ5mn5DOr3xd+XnlczW5XgSO1UYmpOInq521yC6V3AS+9KbPX9qhj1RexLjIIfPS3W/
	 RTlH9KMm9i6cyRx5h3Hw6PQsEZJx9kj9Qvy9IGEc8iCbTR6TO9QNikWGlNBlM4DCkXK0a
	 TsN+DTy48X85Go0hn+pmKE8WcL3A0fgKbVMgitF/kJBJLhgFya90io8g3z5rhIq4VEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cn10GkQr;
	arc=none smtp.remote-ip=74.125.228.73
Received: from mail-ed2-f9.google.com (mail-ed2-f9.google.com [74.125.228.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C958606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C958606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cn10GkQr
Received: by mail-ed2-f9.google.com with SMTP id 4fb4d7f45d1cf-6b4c466f6easo1948708a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793611971; x=1794216771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA+vTZ/Eeoad9jIjZ1JZy2rB2AcKRzVxwNFQY1s/X5o=;
        b=cn10GkQrQYu6kATy/dwSMsSIU8LXgit6pXqybm2MjT0SGERLcAft/h0umvgGAS0k2q
         rOB1wp/bTPqRe4B8GnhLKIKEgph7WW3a8+3PAG+DS5vAo4jzqbs5MIS4rwwasRIT0xuv
         it7E2n27OrI2UOqOPcHGKBIGJUTxYEw8GuO3IKJ8/0bBlvrjAz9jzPhQ2/vpEeEMqfZp
         9F9N2OqDi2+xgeRoCNol3bqt0KFbTSfUSSC42A6E47GSwGsxDsCT1TBbAa3vpWEEu4Kp
         O+N7mO7EWxLdjt2eU4Y7d/B1Q0faWeZxEnejJMlH3v4mCWqVR5jqOWezSSpZyGvZxHRn
         nMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611971; x=1794216771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kA+vTZ/Eeoad9jIjZ1JZy2rB2AcKRzVxwNFQY1s/X5o=;
        b=xpbKljJb5scmMWW9ef2IxgHb5+mbQjMgssyaRq8mDR35xwPW6HJG7Lji0MeRoYu+sL
         QWGqW3uXC1ERxo1utb4osz5y00QEJ8sehJ6PQinIFRey7KPoFPv56oPbBY+DJ73gomDB
         MM2CG3scmPmJemxK+ImrwogxfoYv0EDOUN76o9NwF1FdM0sE8rnDwezLQpNJ+AOvkiR/
         atu+YU6hrRuZMRf1/8MKg0z/xy/WI92EsFPkE7Pdp77FRfUsNNj5AhOji+ODyQKML744
         cmUB+CwjVBQ+HkmIEgKqDw7KpYhCJ5V/yqNxDJtxQCpQh1QZ9haA4cu/Dx9PsOL05/Dj
         k44w==
X-Forwarded-Encrypted: i=1; AKwUvBytaLqhFW8wdOd0AzOcQBRNnrCZCEkUQj7ebDMg8qm49v1qn1pN1syhS8mcWN8sfVvPzbs1rx1TA83f6Jo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2iKyWeTTgfM3s46gnINycxRNs5C5gO5o//fobZO1i/942TR3B
	J2DtBCcSg8ooXl9y7Euk0Yhi867IVglC98PvWfMpY3Rn723B0PMndPTo
X-Gm-Gg: AYBFou2lbuGz+9sC0NYue3E8oDYADn8ectN7wfYJ2ohEp0Kz5IS1QyzH3/+MPTaG7Za
	KRmjwWpnJQxSE2UWRwNgftxcUU4fl6jIKZME0TsBbZWza7v1EYuoaxlW4xexkIIsHMhh9G5+IAj
	kmoUb2IoxVJW2wrjq/tv8jdqv3RYMDVmqkfFzWrf9HfLVErPm4Y8jwd1ca3al6sm7qoZs8LvEeO
	nzWK4mgH3R5hfGWS19kg258wqrzmuRnnVx0ipOhSY4de3ig1OlKBnBpS7KJ5EfcdDDD3E8ppI3j
	NAZW0dT6wJuvR0cc2KR0TtED9joP0sIj7gqRwasEmO4YI5FggcEkepO3k96OpgXYusQ5ioDt5Qw
	as7HYs7mHLsK+2Adv5u8WRshJ6U8ROGCSnOTvyXUB8KxqfqEaHvL0bLbmkR8Jzgq0sKtPCMJMvB
	WMwu/1qhJFVDqVXT4v/QuphkJPyOeHo47xTRn/31Yg/cUzw5wMBYeALKvyH/nca+Gz0NrRyKCkH
	iXk5jPnNv4Zakg6/JnFcxuUh6p+tGRiCNyy1Vb0fc1X8VmBKyUXixE1muF7Kc5IeyjakqUWTad8
	z/YFtlsvpN7v0AE7EJs8PT00XbgYooJpcR2oXNX3lDOwRBOehOt0D/iwe3kcPF76EwrorCtFtJK
	LbDQ4PBC8c29lT5A6L1qvuNBZWzmDHkxLr21Zterjy87wdIVWzi9yryVF
X-Received: by 2002:aa7:c618:0:b0:6b1:c6fa:c45c with SMTP id 4fb4d7f45d1cf-6b4d60d6045mr5299690a12.38.1793611970629;
        Mon, 02 Nov 2026 01:32:50 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f2a0sm3214273a12.25.2026.11.02.01.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:32:49 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v4 1/2] i2c: i2c-xiic: fix clearing of bnb irq
Date: Mon,  2 Nov 2026 10:32:27 +0100
Message-ID: <20261102093228.2751576-2-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
References: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
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

Add a function for clearing the bnb bit,
It waits for all preconditions before clearing the bnb bit or times out.

Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 40 ++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ba560462d451..e68e17bdf0ba 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -233,6 +233,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_RESET_MASK             0xAUL
 
 #define XIIC_PM_TIMEOUT		1000	/* ms */
+/* timeout waiting for bus busy */
+#define XIIC_BB_TIMEOUT_US	1000
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
 /* timeout waiting for the controller finish transfers */
@@ -394,6 +396,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	return 0;
 }
 
+static void xiic_clear_en_bnb(struct xiic_i2c *i2c)
+{
+	u8 sr = 0, isr = 0;
+	int ret;
+
+	isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
+	if (!(isr & XIIC_INTR_BNB_MASK)) {
+		xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+		return;
+	}
+
+	ret = read_poll_timeout_atomic(xiic_getreg8, sr,
+			sr & XIIC_SR_BUS_BUSY_MASK, 0, XIIC_BB_TIMEOUT_US, 0,
+			i2c, XIIC_SR_REG_OFFSET);
+
+	if (ret) {
+		dev_err(i2c->dev, "Failed to clear bnb\n");
+		return;
+	}
+
+	xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
+	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+}
+
 /**
  * xiic_setclk - Sets the configured clock rate
  * @i2c: Pointer to the xiic device structure
@@ -883,9 +909,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	}
 
 	if (pend & XIIC_INTR_BNB_MASK) {
-		/* IIC bus has transitioned to not busy */
-		clr |= XIIC_INTR_BNB_MASK;
-
 		/* The bus is not busy, disable BusNotBusy interrupt */
 		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);
 
@@ -1030,7 +1053,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
 
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1097,7 +1120,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 
 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
@@ -1181,11 +1204,11 @@ static void xiic_start_send(struct xiic_i2c *i2c)
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
@@ -1227,8 +1250,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
-				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK);
+				XIIC_INTR_TX_ERROR_MASK);
+
+		xiic_clear_en_bnb(i2c);
 	}
 
 	i2c->prev_msg_tx = true;
-- 
2.43.0

