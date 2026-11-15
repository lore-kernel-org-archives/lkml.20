Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733326;
	b=ZUGuNSh/TY3jgFAsa49N6vwnuheQVkbAzQy//by1PYlUMo0ZLpa/sH2FjoKcIG1HKfPa
	 5GbCqlSrtSd2v35JHRjVBOSZHYiDx4euThXOfKm2FFEZkHk5ratwjuh2L/lLzZLY3SVAy
	 5B4/qtEhM4/hyqT3NyNTEC+h52iHzwa9DdpZ4wDkl89Tn+EGXBo6YLgrxi9fB3P/sMO8c
	 9cqZStyvRvIH/tI0z5inckl9wYANjdZ4+Muci1JDVX700Xyp/Ei15wj5VvXkysftl60o9
	 AdnGz0CpFO9dpt5hLycGFyG9uMV4E56ejAT8cjLy4G+YunRqi1FIUlCiFYII0/fP8Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JyM31cGx8Sg4l+C801TiUlTl53Lt9FfHftI5A2bsynM=;
	b=aoZpoDiQ5x36AM6uNh5OKQmmr3LONx7JvI117Qa9DfPXz+Vlapyv470hlmG3udQ2BOhQ
	 KKOBlan5TBHV2RtUwfY0tdUhYAhP2kwMK4AfDR0tjOP8yYmhrZYKcx1gSwPJHc8Z3LMHn
	 kjpL2jyLS1zVUaPcRhexZlYN1JdolNGqpLJ0vH/sl0eSiSv4zfEew9x1XOiNIkpYlQH7S
	 sun31G8WlAPXtIfGEIfyh0W7jOTUMDJ4nopjXsB8aZ7INjCQEQ9P5ebRX9FKkF4yXZtOj
	 kG52IHsf0mU7crykcR8R2sZ2+c0Unms2950sHdBGXzHH38M/5L1a7cHYVl3IArI5Gqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQCdfKgR;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A8D606A8B3
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A8D606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQCdfKgR
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so421928766b.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733324; x=1795338124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyM31cGx8Sg4l+C801TiUlTl53Lt9FfHftI5A2bsynM=;
        b=wQCdfKgRjSDN5un7cIV5u/eVKfHrhGXf38UEdfx/2tMsnkOf4bSZ5KcELOtnSXb5oL
         0tGvC0lS9lmQpyuvLAaABKnxB3l+RNeKAR1l34OUpt/oEiX6PzIWH6udcdgOafJk5ivB
         QoOo7uV8fnjGpBIuu9aCKPrkYi4Kka3TMnitG2I8Ve0hXGyhb1X145QLcOI3Ds401dGB
         aGigjOzS096fxuRybJYYOBRr9WapmXhXvfi427cUq8fpTYnO/jlV3+S6TofwNPkgEZ1J
         7p+7XcHsrJEtfN28qKBNLO2cmbar/eZpfPZ0aXksY6UbNQ87HpNE99ONCPG78335llAS
         4e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733324; x=1795338124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JyM31cGx8Sg4l+C801TiUlTl53Lt9FfHftI5A2bsynM=;
        b=ZKveCXl/7cIiQlFWI8Nxhkgl2xYRZLn+R9PtfqYoPmkerR2+o39TT3lf+HE2l0vpi8
         Ct3McqozUc+hkand4lPRMSAwxoq85BKW1kfVr4sbs9L+OJh0q91HB83kNKb0dxjOwMQf
         cubDMroBB52XFf9l1NY3kYDGaiwLHE/lLkYJMT30GZb+o/zBPM1BFWRatWAvUtbNgyMJ
         w8GVyEcDknD5ft1beN7s+HDRkbQvqF+PJRGGF57z2glfLAcdhLf3xSO2YEZToSWloIf7
         jykrlJgCV6GOiPVrLE4ReokShZFA+zZCh7wcCpiV6+XQpLI8hWI3Y4kLCqX+aFs9o8EG
         03Iw==
X-Gm-Message-State: APuU4Z+pEsKc8ydLOfpOntrVYkTNqWexyN1S0Kx7bnYmHHn2T3g5n0d0
	Uf8dk2rpfo4pGrleus2CteReqDYiRPNGeuYpoeFQW3sh3+vgDQFCkVh6
X-Gm-Gg: AYBFou07ONz1ALVARFO0O3perO0p8bK0hDJEQQa9teBxutdqv/GhJ6c6xJOkAdOVEci
	TeGFh2RgeVaWMXTxvFtWrxQOqr0HefdCAdVJNLD2996D+/y9mEWFM/btMlIjGQvvLIiAgWl56hK
	1TD5CD0ayXb+yyqhr6p7Hr7s8+htqfUvknNbwEkU99MOusJXjODMGZM6NsbdlkORS/mLHkVIkAI
	NRBWIQDNAHPM3b3/WUAnmJ1mBVWEpPxYVV1xwcCkJ1caM+OvjSK02QLQMUSwgaYHH6UcYML/dRK
	wxdeSurBdfe+bouv7QLsW49cnERDrCM898t4AxCO/iJXz4UooQVpZ7gAeKX7tHJgnFc2aVVjIx3
	K2OvLLOewurJeQfTjy/WruTi1IgAW/GREiMzGwOblqhCI+uvLP/vNnT0iJl+ddvPt/RC2V+7qSS
	RhvBRrJ3zFfcoRU7TJmSdVTvCgkjtxo7QB4i+QM+26ixu9RnOL24+vPdOclb1bg2CILGLBW5ZFN
	sbx+T807OF3kYj5J92GJ5kKigpjKcn4frBrM+nccyNcpbksw+4IMmH1hM9KKiEusaBZBKtN6PRp
	9AivZ2mOv+upDrQqI+82W+KNghvDPEzOQHHBJPyL1oMCJtFlynQ9ZtXTp7bmBUYQX9TJY6uZpqp
	fJguXM7xZ4A==
X-Received: by 2002:a17:906:f595:b0:c50:94be:22ab with SMTP id a640c23a62f3a-c509633e68cmr632454066b.18.1794733323864;
        Sun, 15 Nov 2026 01:02:03 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:02:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 5/5] mfd: max8907: Add restart handler
Date: Sun, 15 Nov 2026 11:01:47 +0200
Message-ID: <20261115090147.95337-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
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

Add restart handler to reset hardware properly on system reboot.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 17 +++++++++++++++++
 include/linux/mfd/max8907.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 8412dab2133e3..b57c497334ea6 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -187,6 +187,19 @@ static int max8907_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int max8907_restart(struct sys_off_data *data)
+{
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_SOFT_RESET, MAX8907_MASK_SOFT_RESET);
+	if (ret)
+		dev_err(max8907->dev, "failed to reset the device!\n");
+
+	return NOTIFY_DONE;
+}
+
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
@@ -246,6 +259,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
+
+		ret = devm_register_restart_handler(dev, max8907_restart, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register restart handler\n");
 	}
 
 	return 0;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index e222250f0cc1e..025874e5f8808 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -164,6 +164,7 @@
 #define MAX8907_MASK_OUT5V_VINEN	0x10
 #define MAX8907_MASK_OUT5V_ENSRC	0x0E
 #define MAX8907_MASK_OUT5V_EN		0x01
+#define MAX8907_MASK_SOFT_RESET		0x20
 #define MAX8907_MASK_POWER_OFF		0x40
 
 /* Regulator IDs */
-- 
2.53.0

