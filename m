Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623095;
	b=M2t3ej8bAvo8SuQMyQGmklLkMjfCTITl/urSYiTgUql5WuvhCjcc3LtXeUFDYfiE2kHZ
	 z+X1FZJZKPdjd/3jIynchBgBBxbfwdjW9UPqiJDlojkipxpk3H+VjMp3Ebu15XO/t0RTB
	 vW8VH5C2kUma+f0onhmoSIXiYmAJokJfuADwB1mAa1fJ1P0yhHAQdItQChSC0wv1Q8s5c
	 yn+pPI5eRlMBl5lzTP3rIN6tCySX+nvC+wQVov/4XqjfdSyV68lpXW/Cza0k8/dCjoSIa
	 Mp7Ryo51DcUy2vnGhPgSalhFe/ywkzI+TM1CWTE/eU+MVuZemKMy56XK8e6/LBpRwEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xgQldwexL9hJ4JqwERRZTsYLRRnSgh2zeRX5tDkW3Z8=;
	b=LE9z7yfeXZmoFVUV4Gn+WwKb4XWOwsB6/uju4hRT7SmR6RgffRBHcxc3kmuvIYDZQxfs
	 Pa5N8GDAMYp5yjt08t2Te9D7u0mQ85T2hpjFB0EdOs7Su9mrylUXSLd73mVplKSrKGPsT
	 lqrLvVsjlAaY/LfQz/YojIBRToRbsZrW9z8exot8MRIyziTNXKGWe4IBc7OrdrTYMkJnY
	 CIa2gx0sqgPzDFYqAVO3dZ71klA0Jm8Z49zCq6GRi6udoPtrpX8K9XM8hwNiLD5kJ7y2o
	 Uu28UTSm0RLKjhSK5K6PQn3iBbckAe1Ba/do/xm6pjLV4Mkd2QiF5WBYIwbzAH5rd3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=akf4a5HX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49EF606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E49EF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=akf4a5HX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso29877365e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793623092; x=1794227892; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xgQldwexL9hJ4JqwERRZTsYLRRnSgh2zeRX5tDkW3Z8=;
        b=akf4a5HXYlpuLwHeyGGcRnNbUuYtCEZN47B3VFoYrzJTIfXn+wtqpUkH9oO4Lbbfpx
         FnRh/sfPoFR5rRg652d6GabTs7POaq42VkHvPIDb4FF+6ecuABkC4A+7wySax1PJ822N
         zRZW5loqSIHOleT8s7swO61JTGdTeUdBiIjkTFH4QWgMGVbGkVJg4x+D1mbJJ17kmSUD
         k89UXocrR50mfIJKh2BPlVT3nhYZCA+wqHHvL13K7bC987tTbUpv30DCNgp4r71weDTE
         /GrL+FFuD1q7KgzN4lRnJG9kMnJRY0bgGV+xV1TsY54bLWq24DrxKbGLuRLtXyov7fLp
         Aikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623092; x=1794227892;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xgQldwexL9hJ4JqwERRZTsYLRRnSgh2zeRX5tDkW3Z8=;
        b=Fkq9OqviABrXWcoFU4EqpuHxst5bYc6KUgZnR+gmqD7z2e7EWJItg30fn5/ev4TABW
         6wtLgnRZPRao2HsDnsctk44oqy9BGB6ep9ZlQSy7maCan/Wn8kvMhZJlFoW806CwEAS2
         hwlJUok8qvoek7n2x5RI3/D4t7nmPUd189X4LfB3vN+USZJRsdanAT0W8+qYIaQ0G1TG
         lxwAMm3EdYYGQzb5rWzRZkQAQ8dwyUcSCrVWHjcP+lEDaeClBX1xF3fDHyurrJ2cP/dH
         Adjfyx+iRAUyNmbpamGkCWp1gSQHJFr1Tq5N0LtyLNEcz0Ra5y7qNQQG2F2viIbRBt2F
         XOjw==
X-Forwarded-Encrypted: i=1; AKwUvBw8sCxK/7NDPSjhVfoaZkjR6kJpIL0gK6mnAsDfoZbR9br4al96+wG5iDxa11lBfKeIrSowsQOFzjOKvGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK514YuNZ2k4GKMmaH8SFpnta8ac37gCFwL6LFhGfOV9HTw9jIq
	JSPamW3yyuJuto0onq/vmwQN3pjEOfiGAfrNsFjqIQnHKcRcmYXE+7w9E9Zc9LeDxJI=
X-Gm-Gg: AYBFou08+hVv5t+33+jF+uv5wjLvj+BlmVn9b/ac/Azs+irCuoLO0OCMI1AdL4H8LpX
	f5ywmFApGeVyGwdrq9rdv3O36D9pJ+ezBd0E5HW6hWwOjSJFbDkcAxI9s687NkZAIIFVGhCFa+e
	4GPMb7Eub5UMD8t+/eRohqWkg8zxBdRKkI1sjqaHtbt6t0rVDOLd22ssIBXRXG5YjLHkYpnv2BL
	ez8R0BBb4sKYhKYlvt4q1ZzbiiUIhwK2e8mKmsHqFbo/mNwK8Z+sh7bIvhInMGtE64rQiJwAs8g
	Qg8czV5hYTfqFGadx8Zo/I5DTo0sqLuk8am+JRG8m6216XiNU+VlY7/fHIY3z0yxao+PFBAXSWI
	F4QU+ThNK+0HM6GFT71mjoxjQxYqK3i1x9bXM9M9D0p9U81OintZvJsEf23CA+nTxyXK7dq3cAp
	Ols2v3QfKP991rzcy6xWpeCV+yfDZMUCJuQf/kVf/D575+DN1xIYv7kPpvWhSvJks10Q0OQcre4
	36k61vaRrgQO/S6oLVBHKFLYFx2H7viUf5EAwDyUW89idXSzhgLVfG+NPB39mwzgWQqeB2x+W0P
	m94JF+hr3YYeIB/n6hB86VTTQrPcyh7FyiowxK7l34EYd+6r0hQgNNzlqx+UuwY+bENjPc5q/WD
	4ZnWs9dr1
X-Received: by 2002:a05:600c:354a:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4ac17e10ac3mr238611195e9.19.1793623092268;
        Mon, 02 Nov 2026 04:38:12 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm19052256f8f.56.2026.11.02.04.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:38:11 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 02 Nov 2026 16:37:59 +0400
Subject: [PATCH] usb: typec: fusb302: Drain the RX FIFO on each PD
 interrupt
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
Message-Id: <20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAyF4asgz43kpCpquQrqkIBN3SEgGyokx
 N0JZXr6hvdvYKRCBk21gdJPTMZc4G8VdJ+YB3LSF0PAUHuPwfFi6V621yjZ6crCo3s8KSK+sI6
 coFwnJZb1n23fl21JX+rmswX7fgDE74eyeAAAAA==
X-Change-ID: 20261102-fusb302-drain-rxfifo-58ea00906afb
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3619; i=alchark@flipper.net;
 h=from:subject:message-id; bh=qqLSxGOBQeSipXoovDqg2yP5GSnmtQjtby1ZXrRyHms=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9aNFdNpP3rI7PZbF7Ygy3J+ZJO932u16h/eqvmb/T1
 7dnD93c0zGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUT3jKyPCJ5W2S7y3VBepanw4lXBU/ZuDumhauviHpt6THpFbdzGxGhu+319d
 MedjStJjX1y7yuKHgUYW6qRPZPA/sOrduAcOmczwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The driver reads one message from the RX FIFO per GCRCSENT or TX_SUCCESS
interrupt, assuming every queued message raises one. The chip, however,
queues some messages without acknowledging them or raising any interrupt,
e.g. it decodes only the low four bits of the message type and mistakes
Get_Source_Cap_Extended (17) for a GoodCRC (1). From then on every read
returns the message queued before the one that raised the interrupt, so
replies answer the wrong message and a Soft_Reset is never seen. The
partner escalates to a Hard Reset, which an Apple Studio Display repeats
every 1.5s.

Furthermore, two different messages received in quick succession may be
queued without raising separate interrupts, causing all subsequent PD
communications to be permanently out of sync, which usually also leads to
a hard reset eventually.

Read messages until the FIFO reports empty, so that each one is handled
on the event it arrived with, whatever the chip left unannounced before it.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 3319f6a2b0c9..6841db172e11 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1481,6 +1481,36 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip,
 	return ret;
 }
 
+/* The 80-byte RX FIFO holds at most 11 messages without data objects */
+#define FUSB302_RX_FIFO_MAX_MSGS	11
+
+static int fusb302_pd_read_messages(struct fusb302_chip *chip)
+{
+	struct pd_message pd_msg;
+	u8 status1;
+	int ret;
+	int i;
+
+	/*
+	 * Drain the whole RX FIFO rather than one message per interrupt:
+	 * messages the chip does not acknowledge raise no interrupt, and
+	 * reading one message per event would then leave every later read
+	 * returning the message queued before the one that raised it.
+	 */
+	for (i = 0; i < FUSB302_RX_FIFO_MAX_MSGS; i++) {
+		ret = fusb302_i2c_read(chip, FUSB_REG_STATUS1, &status1);
+		if (ret < 0)
+			return ret;
+		if (status1 & FUSB_REG_STATUS1_RX_EMPTY)
+			return 0;
+		ret = fusb302_pd_read_message(chip, &pd_msg);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
 {
 	struct fusb302_chip *chip = dev_id;
@@ -1513,7 +1543,6 @@ static void fusb302_irq_work(struct work_struct *work)
 	bool intr_togdone;
 	bool intr_bc_lvl;
 	bool intr_comp_chng;
-	struct pd_message pd_msg;
 
 	mutex_lock(&chip->lock);
 	/* grab a snapshot of intr flags */
@@ -1602,7 +1631,7 @@ static void fusb302_irq_work(struct work_struct *work)
 
 	if (interrupta & FUSB_REG_INTERRUPTA_TX_SUCCESS) {
 		fusb302_log(chip, "IRQ: PD tx success");
-		ret = fusb302_pd_read_message(chip, &pd_msg);
+		ret = fusb302_pd_read_messages(chip);
 		if (ret < 0) {
 			fusb302_log(chip,
 				    "cannot read in PD message, ret=%d", ret);
@@ -1622,7 +1651,7 @@ static void fusb302_irq_work(struct work_struct *work)
 
 	if (interruptb & FUSB_REG_INTERRUPTB_GCRCSENT) {
 		fusb302_log(chip, "IRQ: PD sent good CRC");
-		ret = fusb302_pd_read_message(chip, &pd_msg);
+		ret = fusb302_pd_read_messages(chip);
 		if (ret < 0) {
 			fusb302_log(chip,
 				    "cannot read in PD message, ret=%d", ret);

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-fusb302-drain-rxfifo-58ea00906afb

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

