Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1794D52BE4F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813252; cv=none; b=g/e5/ogYaVtDGvPUzaGYEuI4jEluiu85Xs5lXcO12HtgxStjAr6jygmOPki2CKzEbn6Ai30U+G/jWdZEqMTBBeUGbgF3xxxGMj7TQbo5RbkWSmr/z6coQFcWjxz0ODoDGLyXE508ecyynhBNlxj3SHNVG9vYkgaofG1zhKq9ZY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813252; c=relaxed/simple;
	bh=Pc8AByMjSEUPU4qRRamFAyp8fdzecA/x0gsS3IoUfSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CwR6BEomXYzlp5VwfUJzh780j09Q3oPRjKfR55eg1WJrnEXvz0IARBXGj8bxpEQiLmH/coUqd8mEUb9B4n5FZs78xzb7W1yarBl2aY1YdAOTwAT2ECKVXerQs/ZGj6ZPnmauNU499AjvFd0K0NJty2YrSmXPqPbJcORnOCTKglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tL+WdLvl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tL+WdLvl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4858595f997so2348965f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788813248; x=1789418048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOxWsNxGR4Xn24fPORPxPNrQIFRGPR6rV/CUVrW8Whs=;
        b=tL+WdLvlVHeacyG7pNXCz+LBbWgzuCMfI8IL4/84KgpQPEZHpQTQW+JOwfObuzGhPE
         hD6HIBHNLfEfZgbpIRnaO2uhmred33RkG53ZoL0rZGqWdjvftK5xFclH3mFHO3W4P4hS
         XT7SJE8rLR5atiMNhuyy6kcfoc9TculGzrHFxGAn3HouzczRTU/m/IkP1LwsRV6dhokz
         YBuaxCy+R+A5MizNJKXmro0ag2xEyKzDhqDywe8d+oez72Cl+hzR2P1apSVhFahS2jXL
         cu4TBJZDNFG1Qk7z8i3gzKMEzEOzfvq0auL4n3IJqK7D0GLgRZbsGn9MR9bPiCXvek/0
         tQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813248; x=1789418048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOxWsNxGR4Xn24fPORPxPNrQIFRGPR6rV/CUVrW8Whs=;
        b=ms5ArfDluiHDsCpnhq68jkDz60fzhr2txZ7cr/yZ86pv56TvvxQZwI3P3eXJjR8my2
         /TyWldHWLUb6WzEHS2gSWC17R6yRJ3LRutk+UWy2y2p22zb0OAv+54eZ8N5csWN+F4t3
         il1xLGahHwPFFLq+JPJl4aTwJtsxxKG3/E4VLVVhG16P31xmwl2UYW7gAohLFzVxBFa3
         e0NVtPRbGVG7TwAKgjxo1eOLyagb+zGeYz0XYZ2OFgkbmutXYdQv+BYRTtNLGGxTGLGS
         S1P60BqA4oiCoo2vkDQBaSe/eii3SX+T3ZTmwAs36h3ie6KVcVXvI7KBaZc/VHPNQ7zw
         H3bA==
X-Forwarded-Encrypted: i=1; AKwUvBwL7G48SBAhs1Bi9yPa3cJs3iXrfL6HOUzghbBIkXa93kA7/iR3SYNY7q9Y5pWWsxIRooEt7NbVLcLhhmo=@vger.kernel.org
X-Gm-Message-State: AFuF++l+TIrmFkf8U8my/Nzv8rMIFrz6Vo9qFcx5x4PB2ANCBEh9sAjV
	/L2cfaxqeoSVK1Wuf19MCvDx56DCJ1wk7UHU4tE419cw9fL2zXUhuAnov8YuiA==
X-Gm-Gg: AYBFou0Fi4aAX5lcOO0/u/jhmVZ9l2kfWI9G2oeTAZ4YgZeWuyX9NtFwqsK9zkiSmuD
	8/B/3Gc8sl8eo/wNymhGcH33IQfbxebxh4dFvKwsJquJNNpk2IoqPcH5HaqwxQS2z9qrilWIJbF
	tU63pEN29aIMJqR83B/GMDORKhKlBnlXikro29wu7IF0MhTY9CjBhV536EI9Epg9Pnvr8ItSVfG
	n8EtjO3yGpbmrfiZ0/10ao7vagUkS8syOfpl5CSTQTzgphkeq5nXpDfniF/5HaUYlSpVTnWVoxx
	QSlhI2O6on8EjtREEJKmtVuM8BoAyS8wuD0/tOXssoRc4QJi7zjwfxs1sgioNNzznJ1BCyYiGXq
	ooUJytBne69xL70ym9KM2Gu8u8L0L+9ajXwYtXwL6ZT0shvYf4D1kiUPXEq6Ko4BHqxHUOBeogT
	e+MiuYhG399NIECezN2j0td5endfkYoHgxQeUg2FjT8veEmDhdphYMdx/ckMGlcw==
X-Received: by 2002:a05:6000:420d:b0:485:8ebb:be1a with SMTP id ffacd0b85a97d-4858ebbbee4mr40491144f8f.4.1788813248126;
        Mon, 07 Sep 2026 13:34:08 -0700 (PDT)
Received: from antoniarch ([78.212.37.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm25959116f8f.9.2026.09.07.13.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:34:07 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v6 4/9] rtc: abx80x: properly handle shared IRQs
Date: Mon,  7 Sep 2026 22:32:11 +0200
Message-ID: <20260907203216.53192-5-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907203216.53192-1-apokusinski01@gmail.com>
References: <20260907203216.53192-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The abx80x RTC driver registers its interrupt handler with IRQF_SHARED,
but the handler always returned IRQ_HANDLED and cleared the status
register even when no interrupt source from the RTC was active.

This could cause the driver to claim interrupts belonging to other
devices sharing the same IRQ line and could also clear unrelated status
bits in the RTC status register.

Only handle the interrupt when the alarm or watchdog flags are set, and
clear only those interrupt status bits that were handled. Return
IRQ_NONE when the interrupt was not generated by the RTC.

Fixes: 718a820a303c ("rtc: abx80x: add alarm support")
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 52 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 44de234efecf..8f9211bfb7e2 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -51,12 +51,18 @@
 #define ABX8XX_CTRL2_RSVD	BIT(5)
 
 #define ABX8XX_REG_IRQ		0x12
+#define ABX8XX_IRQ_EX1E		BIT(0)
+#define ABX8XX_IRQ_EX2E		BIT(1)
 #define ABX8XX_IRQ_AIE		BIT(2)
+#define ABX8XX_IRQ_TIE		BIT(3)
+#define ABX8XX_IRQ_BLIE		BIT(4)
 #define ABX8XX_IRQ_IM_1_4	(0x3 << 5)
 
 #define ABX8XX_REG_CD_TIMER_CTL	0x18
 
 #define ABX8XX_REG_OSC		0x1c
+#define ABX8XX_OSC_ACIE		BIT(0)
+#define ABX8XX_OSC_OFIE		BIT(1)
 #define ABX8XX_OSC_FOS		BIT(3)
 #define ABX8XX_OSC_BOS		BIT(4)
 #define ABX8XX_OSC_ACAL_512	BIT(5)
@@ -266,6 +272,7 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
 	struct i2c_client *client = dev_id;
 	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	struct rtc_device *rtc = priv->rtc;
+	unsigned int status_flags_clear;
 	int status;
 
 	guard(mutex)(&priv->lock);
@@ -284,9 +291,15 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
 	if (status & ABX8XX_STATUS_WDT)
 		dev_alert(&client->dev, "watchdog timeout interrupt.\n");
 
-	i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS, 0);
+	status_flags_clear = status & (ABX8XX_STATUS_AF | ABX8XX_STATUS_WDT);
 
-	return IRQ_HANDLED;
+	if (status_flags_clear) {
+		i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
+					  ~status_flags_clear);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
 }
 
 static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
@@ -952,6 +965,41 @@ static int abx80x_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	/* Disable unused interrupts */
+	data = i2c_smbus_read_byte_data(client, ABX8XX_REG_IRQ);
+	if (data < 0) {
+		dev_err(&client->dev, "Unable to read irq register\n");
+		return -EIO;
+	}
+
+	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_IRQ,
+					data & ~(ABX8XX_IRQ_EX1E |
+						 ABX8XX_IRQ_EX2E |
+						 ABX8XX_IRQ_TIE |
+						 ABX8XX_IRQ_BLIE));
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write irq register\n");
+		return -EIO;
+	}
+
+	data = i2c_smbus_read_byte_data(client, ABX8XX_REG_OSC);
+	if (data < 0) {
+		dev_err(&client->dev, "Unable to read Oscillator Control register\n");
+		return -EIO;
+	}
+
+	/* Unlock write access to Oscillator Control Register */
+	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_OSC) < 0)
+		return -EIO;
+
+	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_OSC,
+					data & ~(ABX8XX_OSC_ACIE |
+						 ABX8XX_OSC_OFIE));
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write Oscillator Control register\n");
+		return -EIO;
+	}
+
 	if (client->irq > 0) {
 		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
 		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-- 
2.55.0

