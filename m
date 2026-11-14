Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641787;
	b=E4u8bhfWlkEsmuR/C4g7t5b/EVdT0GU4w2j6K0AbPNHAKob4YSUL1elRzCyPh1FZWUqN
	 NPNVp9vnw29grdf+hZJ37cyL7LEN7dadD8lZmU3D4DeRaDoNxXDaEuDpnsdpq0jiUnXXk
	 xPb6QFv36rx1zLebrQX1SiR8bvy0cuHpsDqO5BfVehPE42h32W2wb3gU7gThx15kfwykO
	 w2hJwGz80welq7LsN5LvmzR8UX/8ECwarp4K+15QfSWGGVNgNQxZ79dQFWLfGoStlnIZc
	 fh/dEmwSqbFTxCbVGezbiRnPOqkCq6Fu8fr+4zTlIuqKf2eWYTnZ6dHNUl7vMiZZZsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gWtPdoWO7R8JhnhKE2fYO2lEkWLFZtVvjPE+5aCE8so=;
	b=Ngi0q28x/OlQwU6nfxyoSdz1xTDKim/WiYT+ynoJJWmBxdXkRQ7rMb2ytt/EYG+G0LFj
	 5piPlDClwgBFCDogNFNuQnxmhQwDTQoXZBq2CT++aT0HGK0HVcymdHHi8ceIJIy0vI0HP
	 mkMeNqbSTcZiuKfnnyUavCoHdOZwJfhuqNrtXb0Nb6OhuM4JcNHj3WAuf1+AF0IvAX9c5
	 B0ka9FCzNDr1VxHX+4QpspxCe4q/qZ5plvqzBy9D3hPSlTIyc2P1q3XIDWitAdmpZc0H7
	 xhFHxeKkXkQEoPBLZfzEXQT3BHDr+yxnPD2NZt4rnW/zFzbt7DMNIGpIGKVHzwZ+dxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PiUV6zW0;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA68606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA68606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PiUV6zW0
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so2473019c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794641786; x=1795246586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWtPdoWO7R8JhnhKE2fYO2lEkWLFZtVvjPE+5aCE8so=;
        b=PiUV6zW0ArlC4qQyn1eA4aIKYWd/AJKrAmdDP4P6PDmQeRMq8ukV1d2JjBHeTURtu3
         jcp0JmHYb6jf2I+nHiLNxzkwJovLMfX+fe9GOY1NqkdS5CxLGp6GQ2ZRgflPTgYj7TaX
         BnVLA38r+dSx5mHJuLOYt2d4ZoHClTQx1eApfae51cdSWlmxdeY3Fy8H3xleYO2OoSiP
         lTWpIgSqWISgxctOuxaLwMEhw0444aaGm+jhnzkvo02x40+foHpui+q06IT0d/6rizLA
         MgV5gXqE6YXvRVtuwRHRNhzqWqXlsoyk0RG6UqIqQYjZ+aS2Ffqjr8B+t4MCW9qLNl2g
         fXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641786; x=1795246586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWtPdoWO7R8JhnhKE2fYO2lEkWLFZtVvjPE+5aCE8so=;
        b=wLgzyZbnxO9C4OcSL0ePKdi0d2ohb+EHtwjje6ZE3DfYhlZ2ce5mzmyEIbZjYLIVd5
         JL8vDaB20fz831uzaudSeqFTjVJ88T8YooY+PLrkkLaddpmBS461y9TcqJOqYMUlB7wf
         fjWdJTSBtWc+LIFNUU69K+ubl4pilqL3JccA1JgVNOaW3pKIlXmx0htwDh4W8wVQ/2zY
         QVamMeVnkdkgBx6Vrb06Sw9Ibz1eDbc0UqxPpEZFKtOPX9HbKkqvZhcSSyjx26/d55gv
         OURlZ0FjXfaKDncL2+72lZD4oIGzCE6geY59WBIiVBW0QodEQE2Bs69Pze7zqlG/zo9Q
         zYjg==
X-Forwarded-Encrypted: i=1; AL+hErH7ErNb8fJGis+QAqH5IlrlK2tzu2Tb5sjtQ4eqJwD+Qy9ZDnISDGd4vXLb6SbzCV7WeiENcylEd3lg5HQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w+FPy+E507tDj5CfXjxF7Cb5XboNTsOvze6LVw1uWydyGMk5e
	gT/y7FA4Ch9fm51moRYuYZVzuPKswh52alnh3iVoB/5lB4KSqKPIYwq6
X-Gm-Gg: AYBFou311FVPYwEHtOm0bRFFA9DDlt3wNoGj2E4jGj0KdBbnKaSiF72ABTtxpXaECiW
	Gs9vmLlLUSLfxUZE92IBQRRIZY7iiVPYH2mRAwbb1E8bbKAeAg2Ho4TaFbMQG02BpBuNWlDcKbN
	PgkdCcFnqaklN+BA+7dsJpvgd+4gErxRQsO9eXlTviddWLPom0P3TN7E/uP3aJjpxu8+nTrUtJq
	rPzJHNAst7AZ5Rom9nB3ZKD9yBGEHx4BmTJ3sS3vr+FjhOF6L7yH+6hx0FNP8DWZ09HrvCB+epS
	CVLuCAaa1Yo8ZdDXnM2XGeumfomSsK2JTq0z1ts9KyFbvqeRTvUm/mB2sHgxK+2cJOsBqSu9ToM
	DK/JxCoCkVx78q9LkekPg7exveeFichsUbf+WPcP8jEPbA3Sz6jl7+3oOtV+HtB7qoHg0clUEDU
	VAv5YMQZlggDl28VmoOB9g0JMpJeZZtdT3HKQtXVJLkNGSp5LibdGlm337YUKmCVpFfUnqwUdUQ
	OIljs59p93eEGKAeDSgO7uCwPithCBY/OMGQaa239eQsFAxgVNh6uEh/e7tD98Zcz84z5j4FJAL
	7qIX0PLPKFr5Ctgbg7nA32amEIOE9BVw2fvQC5ETn/39ISlgkvx7O9viM+FJ1TFgD0xN7Ojd5Zd
	+fjMt8jpi3ycmcA0VsKFfRzoam6LIY4396NjFiyc/t4Dj+p4bgzHG8zr11TDhE406b5uFcRWzEl
	zH5S8RNO+joSS39plrVoH8bcWQ74A0AWDe2FSokd6nOw==
X-Received: by 2002:a05:701a:8458:10b0:1b5:1ee6:b6a1 with SMTP id a92af1059eb24-1b51ee6b6ccmr398153c88.38.1794641786148;
        Fri, 13 Nov 2026 23:36:26 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d990sm16082635c88.4.2026.11.13.23.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:36:25 -0800 (PST)
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
Subject: [PATCH v5 3/3] iio: proximity: sx9360: keep the IRQ balanced across suspend and resume
Date: Sat, 14 Nov 2026 13:05:57 +0530
Message-ID: <20261114073601.23404-4-kapoorarnav43@gmail.com>
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

sx9360_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9360_resume() also
returns without enabling it on error.

Enable the interrupt again when suspend fails, and enable it as the
first step of resume, before anything can fail, so resume mirrors
suspend. Use disable_irq() rather than disable_irq_nosync(), and call
it before taking the mutex, which the threaded handlers also take, so
none of them is left to run once suspend has returned. The driver works
without an interrupt line, so skip these calls when client->irq is 0,
as sx_common already does.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 45 ++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 2a9b37df8f62..fa89253567b6 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -808,15 +808,13 @@ static int sx9360_probe(struct i2c_client *client)
 	return sx_common_probe(client, &sx9360_chip_info, &sx9360_regmap_config);
 }
 
-static int sx9360_suspend(struct device *dev)
+static int sx9360_sleep(struct sx_common_data *data)
 {
-	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
 	unsigned int regval;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
+
 	ret = regmap_read(data->regmap, SX9360_REG_GNRL_CTRL0, &regval);
 	if (ret < 0)
 		return ret;
@@ -824,25 +822,42 @@ static int sx9360_suspend(struct device *dev)
 	data->suspend_ctrl =
 		FIELD_GET(SX9360_REG_GNRL_CTRL0_PHEN_MASK, regval);
 
-
 	/* Disable all phases, send the device to sleep. */
 	return regmap_write(data->regmap, SX9360_REG_GNRL_CTRL0, 0);
 }
 
+static int sx9360_suspend(struct device *dev)
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
+	ret = sx9360_sleep(data);
+	/* Resume isn't called if suspend fails. */
+	if (ret && data->client->irq)
+		enable_irq(data->client->irq);
+
+	return ret;
+}
+
 static int sx9360_resume(struct device *dev)
 {
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
 
-	scoped_guard(mutex, &data->mutex) {
-		int ret = regmap_update_bits(data->regmap,
-					     SX9360_REG_GNRL_CTRL0,
-					     SX9360_REG_GNRL_CTRL0_PHEN_MASK,
-					     data->suspend_ctrl);
-		if (ret)
-			return ret;
-	}
-	enable_irq(data->client->irq);
-	return 0;
+	if (data->client->irq)
+		enable_irq(data->client->irq);
+
+	guard(mutex)(&data->mutex);
+
+	return regmap_update_bits(data->regmap, SX9360_REG_GNRL_CTRL0,
+				  SX9360_REG_GNRL_CTRL0_PHEN_MASK,
+				  data->suspend_ctrl);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9360_pm_ops, sx9360_suspend, sx9360_resume);
-- 
2.53.0

