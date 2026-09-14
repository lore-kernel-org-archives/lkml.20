Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED9A443A89
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386897; cv=none; b=cu6p4jOsKYeepyKiy/rC847hAqKNWdVj43ZoDMrLkAlCGEy7WXFEjLvJmJohOhCwXwQLOfwUEsTl22bod8nRVaM5Rb7X+NKECwtO+Sftlowpg3G7VteKQBKBTzsKL8ZdWBe+8gk5W/bZuVph9ClMEVwwElWrPL6eUwMYjd0xvQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386897; c=relaxed/simple;
	bh=3uWLS0zXi8hbzN1pQ7fg4WKf5YdWAavl/C0SrqFsdwc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kptwLV3Qv1QSjwkjn+BVXazol17dbtdF2smtr6AQpj+vs4c5ewFdUNpLxstzf1ueCmhaAdWGBmfuzRRfydl72mVV8Il3Hehc2xeHC0Z9WaFJcOPowYDM4iej9ddXdcK9Gs+2bGSCCDOvhPx4W2NM4gXdl0EbQ/gG4xo4eM1pVYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtDFJXqA; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtDFJXqA"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86868f7707dso596120b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789386895; x=1789991695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xz1oPaQal4obx4wv+mUPfBXv881JUQVzx0KD6p2In74=;
        b=RtDFJXqAAFrXir1v0Kh8V4WaZraUQrGnH6QvzOu1plXMa255tGCbcQBeaEqygkj91I
         Kbmsj8iEiHvZZVaqgT8s+mNbaD2EX+PPeKrIvMl8brEsx87dLOr+xLboLM4sR3htvn7i
         mzQq88e45+yyZ1NXFEnNmHqASQNvrAQfajCuxyThvL0FbIMWa6QmDJSSJOzi7q+vrk4/
         BdG/uudI1FV+tzAD+lIjjpD6MCX9qCkovW72wcm8Y/iZCIhFYd6dgOoTnIoGWHv8xZJv
         7B4li6XahmlKxmC5i8rtm8SciXIma8PdB0mOcXZutGiZTKu1TXVjYCccCTBOgojOVBgB
         0DAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386895; x=1789991695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz1oPaQal4obx4wv+mUPfBXv881JUQVzx0KD6p2In74=;
        b=a5RT8IEMMhO5clq7W4Njj7buhYLmggYLJHUSInI4FhYMKYz32p1G3HPF3epGzynAoR
         RcjPsFjyOh91dsU40hQ9ksYZK7Cb1bswE9xd1In9i9dABzxWZwWWmHXvQY6OcTtbcdll
         SpDMkgF014Zo4BFE4skDSjHPPJ/v6UMFcFjH3vchLxoQb6ukh2fInJkLOp5epTqiWh5i
         9wB9uqA9LjoaIN1/dcl4rM5T9Q0iDQm6yc2rXvI+JyJ/2H5A0vHdaCElYp1u8iXcE0aI
         0lqKeWXvnD5ps3y1pi1l296FSduHd2+t9MrCDGKe6j4FUCZ/xVjTk+EsaLSjctrSz1Ew
         UdLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeFSALU4zfPQT1g+34FIlPk4zsSm5qDDvnXKrHRRFmBZCNHI2s9+dd5+IWJmcwW/VcYHvMUqnmPwRcj3k=@vger.kernel.org
X-Gm-Message-State: AFuF++l97tPCPFxVw+TUce3wj9kNpvbmDm1ABEumJ5+8/Vew30kERmrh
	AvIffjPUewo5JSnHERzBJ6Hvx1XbxsbgXBR+fBmGVCEhOHrz6rPcSKZK
X-Gm-Gg: AYBFou2R9oxOUW8+DYnGdheQtXhNMpvPAZD+AetiXp33TtklkLYZ3/QNvw827tVH74u
	NbRs0Qp52EJ9H7rOQ9WIv/Vg6e1FCg7E2HG/wOwTBJNM9SgcdiSYvE59CBkjJVGqK6XBRSpdz0A
	bQkvbAu85RrHJqiqKhUIUMm3PWgOpQZ0EJER++LI43IIft9zZDrq9AhQzmSxYqxTAoTepvJ71ry
	bLFZ45jUFRBr4BYyewCYXg4W1U+3ys4eVrAoAKaVQLLk/y00BygYo/4aiy4pDCl4UCz0TdHyGlI
	zuOk4CkDzcx/lBHfDnxX+4qHkB2FtRYWuitLnHsGYMqO3cGzvGIBS78eqSHgjIYOsb/BX2Pja2e
	UZKVnvwgWV/Nex1YLkhXHwv6kXT70MAnGi1quJNQ1UjieA2esYgUWNeblk5WTHDSV1GU9dILd+T
	T1Jkgkwp8w91jhyxsOJGiEqrIQ8NhFJeMG52vK7wYCUOuPb56srr7jM2bZBmkGLqXg+QnGmfHc9
	Jn49YXSyh9e6yCKCA==
X-Received: by 2002:a05:6a00:2444:b0:857:7337:5dba with SMTP id d2e1a72fcca58-86f862c48a6mr4632403b3a.24.1789386894733;
        Mon, 14 Sep 2026 04:54:54 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29bb9ff4sm4565342b3a.44.2026.09.14.04.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:54:54 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Simon Guinot <sguinot@lacie.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (gpio-fan) fix use-after-free of alarm_work on unbind
Date: Mon, 14 Sep 2026 18:54:48 +0700
Message-Id: <20260914115448.2039438-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fan_alarm_irq_handler() schedules alarm_work, but nothing ever cancels
it. free_irq() (via devm) only waits for an in-progress IRQ handler,
not queued work -- a pending alarm_work can run after fan_data is
devm-freed, dereferencing it in fan_alarm_notify().

Cancel it via a devm action registered before devm_request_irq(), so
teardown frees the IRQ first, then cancels whatever's already queued.

Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/hwmon/gpio-fan.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..b1b57bb63a33 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -81,9 +81,16 @@ static ssize_t fan1_alarm_show(struct device *dev,
 
 static DEVICE_ATTR_RO(fan1_alarm);
 
+static void gpio_fan_cancel_alarm_work(void *data)
+{
+	struct gpio_fan_data *fan_data = data;
+
+	cancel_work_sync(&fan_data->alarm_work);
+}
+
 static int fan_alarm_init(struct gpio_fan_data *fan_data)
 {
-	int alarm_irq;
+	int alarm_irq, err;
 	struct device *dev = fan_data->dev;
 
 	/*
@@ -95,6 +102,17 @@ static int fan_alarm_init(struct gpio_fan_data *fan_data)
 		return 0;
 
 	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
+
+	/*
+	 * Register before devm_request_irq() below: LIFO teardown must free
+	 * the IRQ (stopping new schedule_work() calls) before this cancels
+	 * whatever alarm_work is already queued or running.
+	 */
+	err = devm_add_action_or_reset(dev, gpio_fan_cancel_alarm_work,
+					fan_data);
+	if (err)
+		return err;
+
 	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
 	return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
 				IRQF_SHARED, "GPIO fan alarm", fan_data);
-- 
2.25.1

