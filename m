Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641776;
	b=cAibHv8DGqZTlG8Ftbw4gF6MQMc7okwHAryZ5Uq5yFuj2stIb18ASTAKowDsgUOk7hvo
	 +14nrx7xUeZiOtOgARmeHQSoPVy4YjMp8Jc3Dy8cB47cr9qaL5eAlLdjRk619O17ULp/9
	 DEoaLHyPiQWj+k8EQPWeKkWYpG8Wy3aSEaaprICedD21Zsv2Z+dPHeuSFPV1ycHYfWLKw
	 ySpntWh0GX5wNbMBP/zrjbqqPf1XT/y1jN37xBxSG5tqSfHYPejIPzDfu46lif4+/J855
	 mLXmyRnn/UtGLARg0kw1e+BThNBTx2yojzBoFVnpkGH7v9MGHkWKHRI18tOvm9lxUkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b+IFA55NfN5aJuZh+7JKbUaWL26xhQI0occ4BKED0es=;
	b=ox07p2F9Pm/IgmdGMytKcPa6giLH7gCnuM209/Jwl2NyE4XixCVRJqCswXCyJoXsRo8X
	 ddggPyjJ02+J6r2Z7Mv7GYN2pNitfalY9p9afn+gQFXKTfoVf+TMv6vjW2UuvCsZuBfp6
	 enedHW08dV8rmvHa8i5KvMAsl72P4kd8aVrHF8q4WNT7vAXt2sapd2kvhpMJl4yQshxS6
	 82YRDJFT93IMkKCEM77wdczMPbwbsS5wETQ7ruTWf/F9gOdKopIx4Dz0JP4aHok75ehFZ
	 X9owW12/ihAV4MQYR6PD0BIQYc1KkZe07kAHMfbsQyQqrErP0nNPpLiB+81L40JMtrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UmhjIhPq;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A98A606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A98A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UmhjIhPq
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1630714c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794641775; x=1795246575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+IFA55NfN5aJuZh+7JKbUaWL26xhQI0occ4BKED0es=;
        b=UmhjIhPqx2Gpe9rwVAApPPqCgLG4f+Tag3njC4J86OYbqawZAaZfuhUlM+mzMnpJ1h
         G3DQCX40cUCDU+N6q65ttZRLG8LS1y1la8eU0XSwxUryE1GCHTaQsZjgFKdOz4wAUdLR
         z46Et5lGl7LxJf7q4KBp/Ohp8+1tRUDxr91irSZf2hKrpCc8W5PAcwvJN4F9YYeM2Br6
         1gVMuAJpJ2BMPhu06Jo3VbxHyTpVkXuz3GXPQfd5TiBvWbmq4qYPO35QEPgVrFL2TOKK
         UABgKpmwml8WLEVHb7SJEaLzNexEfjNXZgAKmDszHt04wv0LpVcFB7COZK/WiB75ctKV
         C2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641775; x=1795246575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+IFA55NfN5aJuZh+7JKbUaWL26xhQI0occ4BKED0es=;
        b=XnZebTbZ2SRm9HbnC2X/1gUFUOW0MdY7CSrELJMwj+9X98xVvs8UrBMOhc3HqrAw9r
         EkpPgvkTwGEXkkexPT5tIekAwnstYY/q8C/mQ7EbXSaXm4pU/bthEV5K3bas33ZGqsAH
         TSXiTfRYDNr6+KP7OnJ7UmjjlaLUOgTuWjRst46ZVhjWoFJGjhls01SrZqxpup8mN9ug
         sjA5V4ia7VLF4PG2s17WsFSAfaQltFM++/84vh706APX5zsGBQ9YCHvaUB9NfdhH/Ol1
         bVdyfXBBdrARJgObfOMrVma7wCBjxFbBGDO9xrOS1juH7pKKRJ8PAjShIZYx4mfyNYMZ
         zQEA==
X-Forwarded-Encrypted: i=1; AL+hErF/9j+PZqk0C4A+cOY6QmYpghZEbjFnkx07bOV+7srna6l1rtG4Er4b1mfmyIvlNxxfGywlD0y8GicD7y8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cQ7z1ltjyaKKBHtwhuCu9uQY/LqOEuiAAFr3hUm1QfICwT9b7
	l8oJioBwsQ6AfjpeC4zrNyTNfgbSvyRqBSQ6QyloHKSW4Tktp4F91LTP
X-Gm-Gg: AYBFou27CEI7L8/xtF4SzpfCElNW+qyhJHE5uvv4xOd1vLHz9gQHViBVMGtkbLG5Z9d
	dicMNnp3Nx84nE1dW0/VAUuZ825D/jNE+5jJzfoTDDCk+4c6y/kC6Mf4F76ctH+HW4JqN/nQPJw
	wNu5XQGGfk5VOSDcrA+U/VdwPISl/I8PgxC3+VmXa4wAxp/YItfc1gkFwmVzAT3PQxp5MGsYzKz
	A3++7RNKrdkIV/Ozb2XDLjvWUuZCxIMXzFTCVPUkEbVXCjNm4HKrO397n9bs5OVGO8VDB1PNOzF
	IlpNhOQEHORY5ZVijgh5ePBARswNrzTmyQ976+3OtZfjJfBT6Tg+rrjmicogmo6YjW9jxWoYhV8
	s9+bmZ74u6KeANWrReDsYF5PaQi+KfpgRkXLC47ivFZKYoXSetRZ5AMjCG9f6Dfz4LBRJ8+USzP
	wLYmCV1NTBgxk+c+VHc31Eqo4B0OrszhoitvuPG3l7vq55Pcw6msLOtrVa5ISTphW2GXMTzRug/
	+ivkxCfw84eTC3E0CcmUmS7KBzzZ6kVCSCRkUmnOUNjCVdbLHtklBizCAOd70TzVl81pctZ1PUI
	32c0+WYvRHxWRafOiZpSBHcKqJCaRzVnqjBCMes3NALButGMHQxgSHILf13g16GtvAZ5fJXDxCC
	lLfGpoWZXJXnAjQ3pWktyvTXJLMWaAd5J5LVq5LWB3+jr9LnD8tIWe05J/u6LCCxa0IeV7zu5Qp
	uGfmNdD+gIgtt05ABUPSLsm0Y2ct6nwhmv7dp8+YXUog==
X-Received: by 2002:a05:701b:4541:10b0:165:90af:a25f with SMTP id a92af1059eb24-1b50315017fmr4613879c88.41.1794641775234;
        Fri, 13 Nov 2026 23:36:15 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d990sm16082635c88.4.2026.11.13.23.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:36:14 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v5 1/3] iio: proximity: sx9310: keep the IRQ balanced across suspend and resume
Date: Sat, 14 Nov 2026 13:05:55 +0530
Message-ID: <20261114073601.23404-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114073601.23404-1-kapoorarnav43@gmail.com>
References: <20261114073601.23404-1-kapoorarnav43@gmail.com>
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

sx9310_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9310_resume() also
returns without enabling it on error.

Enable the interrupt again when suspend fails, and enable it as the
first step of resume, before anything can fail, so resume mirrors
suspend. Use disable_irq() rather than disable_irq_nosync(), and call
it before taking the mutex, which the threaded handlers also take, so
none of them is left to run once suspend has returned. The driver works
without an interrupt line, so skip these calls when client->irq is 0,
as sx_common already does.

Fixes: 72ad02b15d63 ("iio: Add SEMTECH SX9310/9311 sensor driver")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9310.c | 54 ++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 2585b9c6fb69..71d1111215af 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -937,46 +937,62 @@ static int sx9310_probe(struct i2c_client *client)
 	return sx_common_probe(client, &sx9310_chip_info, &sx9310_regmap_config);
 }
 
-static int sx9310_suspend(struct device *dev)
+static int sx9310_sleep(struct sx_common_data *data)
 {
-	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
+	struct regmap *map = data->regmap;
 	u8 ctrl0;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
-	ret = regmap_read(data->regmap, SX9310_REG_PROX_CTRL0,
-			  &data->suspend_ctrl);
+
+	ret = regmap_read(map, SX9310_REG_PROX_CTRL0, &data->suspend_ctrl);
 	if (ret)
 		return ret;
 
 	ctrl0 = data->suspend_ctrl & ~SX9310_REG_PROX_CTRL0_SENSOREN_MASK;
-	ret = regmap_write(data->regmap, SX9310_REG_PROX_CTRL0, ctrl0);
+	ret = regmap_write(map, SX9310_REG_PROX_CTRL0, ctrl0);
 	if (ret)
 		return ret;
 
-	return regmap_write(data->regmap, SX9310_REG_PAUSE, 0);
+	return regmap_write(map, SX9310_REG_PAUSE, 0);
+}
+
+static int sx9310_suspend(struct device *dev)
+{
+	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
+	int ret;
+
+	/*
+	 * Before taking the mutex, as disable_irq() waits for the threaded
+	 * handlers and they take it too.
+	 */
+	if (data->client->irq)
+		disable_irq(data->client->irq);
+
+	ret = sx9310_sleep(data);
+	/* Resume isn't called if suspend fails. */
+	if (ret && data->client->irq)
+		enable_irq(data->client->irq);
+
+	return ret;
 }
 
 static int sx9310_resume(struct device *dev)
 {
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
+	struct regmap *map = data->regmap;
 	int ret;
 
-	scoped_guard(mutex, &data->mutex) {
-		ret = regmap_write(data->regmap, SX9310_REG_PAUSE, 1);
-		if (ret)
-			return ret;
+	if (data->client->irq)
+		enable_irq(data->client->irq);
 
-		ret = regmap_write(data->regmap, SX9310_REG_PROX_CTRL0,
-				   data->suspend_ctrl);
-		if (ret)
-			return ret;
-	}
+	guard(mutex)(&data->mutex);
 
-	enable_irq(data->client->irq);
-	return 0;
+	ret = regmap_write(map, SX9310_REG_PAUSE, 1);
+	if (ret)
+		return ret;
+
+	return regmap_write(map, SX9310_REG_PROX_CTRL0, data->suspend_ctrl);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9310_pm_ops, sx9310_suspend, sx9310_resume);
-- 
2.53.0

