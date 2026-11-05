Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841548;
	b=IvJrJv/tYC8vl+5FPOVndL3HFfj87kp/UyK1hSO7v37BDd0tA1ME7Tut4cqSOhhgaMO0
	 tDdiTTDjcrUJ7Vb4d1wKzxebd2xJfdfyYYfUDmHHI1EvN1kUiZYb0FiGZtn8ebonqJnxn
	 IH8iv5OtxPsELAaIrGk72f2p05XLw2YauwXJz11dmnQ3JZ18aJ6KJO4KUb/ZVe4FY/C2l
	 41gKljm0QO9Fxmx3t6kNjatmrvbLFkL29WJ7m+m9mcD3zjdZC1EvJixshviPrZOZPINs6
	 vkQ3ZOO+RqwoOXySOhKzG6UVPCUhuoKTXv/c6dTvkGU/3tX1adPoQVtNPfiV7B8iilQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQbGbNxOCWb9ViVgjVKbYzkJ8A0N0L1Js/jwT7TdCjY=;
	b=1JY6vKNgxxm+tvYyLYjBJFScfxJMPqSM/b5NHQIo53X8zdEaKkldp+hMPi1CdLpGuLj/
	 WomW154zg4nX0WDivIEosdSojV+yJolxGEusUegNrNczT3IBvpuTao+sf/LzILioKTRLV
	 B+hmpfJDsqSUkPSAhOq3wpPFC60gmH0GFr7O/HvTmW3I6f6xF8w507lwNeeaLuQx3GL3t
	 PW8rbiUKDm4uvy99jVwAJvcJbaM8nmAu0CNSQZ93aLEda+Mewbl3G4oRv6nSpm8DEWHC8
	 ag6mOMjB59qqTF31tQa79IwlcztQxOdbYLb+UppI5bMvT0Lci3oritIw6X7+ERbiRSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=imwLaBjL;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F9F606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F9F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=imwLaBjL
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so7967775e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841545; x=1794446345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQbGbNxOCWb9ViVgjVKbYzkJ8A0N0L1Js/jwT7TdCjY=;
        b=imwLaBjLn7/VdT4E7sY36AgX4lBu2ewIdi5bBfV0GGi2FucSMzzPFHnLL5ypCLjqmU
         kBMyqk6mQZU5c19WJ7P0/wxIhhyf+BItEoKUtBaORhmKLvhXlNutHlrN0K6m86tmvuUf
         ax4BlzKjPxPGt0ZLwZ2hQGH7uV94Jus+ZvJDev7hsRHziLamcB1XyFs0KaAyPV6/Bqv8
         iIcJgj2V70B60Df1OyUmEqbw96zKDqqBbvT7/TE1ZzCWlbHK20rwrCG2oUOn4YRgrdAk
         2yRPqNMzGxVUlvQvCnTf5Lgy/zh06p+U0GL8jWfO9kneWPCbWewRHkrnngd0dR0gOyxt
         HC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841545; x=1794446345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQbGbNxOCWb9ViVgjVKbYzkJ8A0N0L1Js/jwT7TdCjY=;
        b=B0Ypf0YCAyC6Lg0o8sIUMjxu5O42dj3wi+uEjX8xGVFS1Qxlhw2/6srIcA4FFmAAjb
         RlkqNM2fXIIjXl4qcm/sZsH9cviCqcuKqj1Gf0XfbqDUtU+vVHhTdDhZ1IOPKgMoWOxN
         oxo8Px4onem0tsv8kDKMz3qkyVZlzy4tYs3gl4mvZ8E7cl1LzF3NpZkKaMJCWcMl3cYh
         FY9Pky/OdJShY0Zz8YMBMwqJ6NLrFyyutBaXePQqmGCWav/U6yZqc1Z6z0afFfrb9wQ4
         BI59GA6dJC/SnsnjYkU7Tf9QEqnRtKlIAl0M8cvqLC79dORQnnPFgsn+7PgvQ4GvWo8b
         tSpw==
X-Forwarded-Encrypted: i=1; AKwUvBxENXhHXqDGKfa9rxZmIervG/ihMYVLraczWd4fbQiwl1uv8D6EtaBAnj4srRFK7pN/wjiJbTTE1c8Qypc=@vger.kernel.org
X-Gm-Message-State: APuU4Z++9yXcJ8BEWe38KfLI8rRobqNs7byWguUHJ1jPZfxkk+IVdIZd
	GpIDKQOBkqes2Zf8Con89ZCcPIIfbvGBFxzUFRSYnNopxI0FDKv/4x9D
X-Gm-Gg: AYBFou3nNnO2cLr63oAcr/cQB7L4CNargwJEyZxLmj8txlrNAN0wJypD8vEscCN3dl+
	WTrD2LEEOzms6LWwPhZQerrTpah6+dkmwJDG4mL8qra4IfNSA0X2e/bZW2jIcWuMgx86vM/nDHK
	lOM4FyBx0O1mgKVv8dcrXmNScu6m8jcBeDeMMgJV0frRKfJuAWTKcKckFvUwcVmmm1FJEYrPwxZ
	fOGlpiQXJQfZPwV5Ktf/qWZhBVT2EN8UNdlYbLQ2xCWjcoeb2lBibovC1M+yTy7HOunxoKGy5Ny
	UntHfLhs7S2LYuZjMHZJq3PkSAK3F0du+7s8hZ7MSRdLwvQXhW7vVXXJFuy3OClGtBrCV1SKaOe
	Ka2+Qy5OV+tDNFgtjDLshUgIOqDI4nH27VeZkqMZz37DYKOa1sYeGEVEDRSxkkXuGZJFHr/QXk3
	EBN0o9uv6Gbin5QqvS67Ku9xygOqlTjRnwOzseJYTuBnwA9OphwIN6RX2v8cJwsj55yhw3Bzt9g
	gqIyR0kyZru69HH0IitRT5rUXWEqavatdF8QEGm0sCgDMKxRoHlJqV5sDBW7qmmOMkpw1AEpBmg
	2JH/trnS/wbyJyvMKMx85J9/w4DniE3Nxjk4wjK0xAk8ygmkhAPMzBdhN7nieEv7JafCWj3BMRt
	GC1lLNfqVlSKsuFNDYTDgmQRW0cuo89iKcwpHHIgwoXLXta6l9x0ymoiFUYrpNGhz3/M=
X-Received: by 2002:a05:600c:e555:10b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b261e5b38bmr113035475e9.11.1793841545395;
        Wed, 04 Nov 2026 17:19:05 -0800 (PST)
Received: from mint.homenet.telecomitalia.it (host-188-12-85-236.business.telecomitalia.it. [188.12.85.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm122615335e9.3.2026.11.04.17.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:19:05 -0800 (PST)
From: Jacopo Di Lauro <jacopo.dilauro04@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jacopo Di Lauro <jacopo.dilauro04@gmail.com>
Subject: [PATCH] staging: greybus: light: use sysfs_emit() instead of sprintf()
Date: Thu,  5 Nov 2026 02:18:45 +0100
Message-ID: <20261105011845.130704-1-jacopo.dilauro04@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Replace sprintf() with sysfs_emit() in sysfs attribute show functions.
sysfs_emit() is preferred in sysfs show methods as it is aware of
the PAGE_SIZE buffer limit and prevents potential buffer overflow.

Signed-off-by: Jacopo Di Lauro <jacopo.dilauro04@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da867..2689f9a7524a 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
-- 
2.43.0

