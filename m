Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B332A37A832
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789706526; cv=none; b=SgEFAQGmzQ6Ftt1BB7GttA1NlV+xhBC9WUVevt5GsRRHiHza1j4Xz88y0pthUuCVV9EmUwT/OVa+lLGw7jod4wyCPM+5nPkFnOXl20+jopdSlo0X/35dISqDWNCdjMDZXwRbJyg/eYGMoM1JN+9sX1l1An3BkTWxC78iI1gL0TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789706526; c=relaxed/simple;
	bh=EEwItVDn4j3sjRXIFX6oSgxd5iEJbZVXKN97spsMCpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bFY5Uz3MvUel4/VLUNIIknpn1yBmu97I5wBIcKMrG10T5JpAmnSnvsNPI4ztsn5Fzhrm8SgD8lTSpd/p8w07BlMzr5kknPlbzqba20XtnuiLnkPC8wTjso4BHCnXIx9a+nzdVqz+PUj48+hFiSj6ena3D9S6I5r2u0xNGRh6h3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULEDbFCn; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULEDbFCn"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f9bso2630285ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789706524; x=1790311324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLhSQVS66izuo4+FI7QDBqq9bxYvfIHSP1AdZGaUGT4=;
        b=ULEDbFCnojf41EW8LgBff1WUFxx0EjLxHQO6nR8smTdvHT85ZMLicU25QS/fR5Fn7e
         cMtGWQQBq43wlI3w9bgL9EmWNGNHOc3vg+iuAEU8Fow/ZtypmGBiMb2ly33+OdpZUz9u
         PN/vyNDaW3CfsWNbUhIthPRbOTc0wdZSQyjxSzCPJ5/gg2fSd5R/xvQvyN9HV2cCgBmj
         TypjXFOr4VwqI4tHkDxcEvRfSBS5YlZT9bu4/9D32uyjmwO0US6ykSHYUC+d1B1EI8RG
         T6eJwC7DqqBIqMHy/d5KZmyS21guiIsNJEYlpCxMANSU9ZCpYpZMnak6rFKJ9bi7itb6
         se6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789706524; x=1790311324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLhSQVS66izuo4+FI7QDBqq9bxYvfIHSP1AdZGaUGT4=;
        b=AopNbfJ/SA6BDA/09jcdkucS2tOCUIHHRCER5oFJd13GJUvltkjjy5fl/uIKo8JQrZ
         TW4fmPoe5tMamXu49TcDfCpoL1oB9E3H7ucxXl5Dw7DUDNK0mGtYnvAh1nBxFhPOfTK6
         186oROlr9nGAwKVftHXGfaKD83fDatGCJdP0cHmGkRRGFwvk7BMZkhIyMQTB0uAoo541
         7asrErmoT/Nb/X1PMdXfhC1BYLh8Ku+rlv5RnNqqnFTq4vEsHKu39OFdA3NfmNtrVbtU
         DFaGSSDmqUHZeBpq2aCUVc3VKf8+aJZYOHEgzr8NwfhyYNbRfpmi+4KDZLvT5rO/uLCb
         I3GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQ17uDkrYNPvzMYbgpwC5FK7F8KI/dMKUrp0b/l+ytBAx/wTwZhM7L0pz3Oy8340fLDsHwYnvdh7SIn74=@vger.kernel.org
X-Gm-Message-State: AFuF++lQZKSK4SFZy9+nzZa/nrxAUW0rBctqEq3Fd+QhfIii5wsS+9+C
	ju5rzUi1CSys7PCcnD9Wsjju04ZqcFUOpha77sYz7CQkkj2hZwNuktXElDLxxZk=
X-Gm-Gg: AYBFou2tqNH87wMOt/oFaw8oxKuF22jpdrBDp2t32a2UMI+0dYwXMiAhCR6xRG5sV7A
	Jvzn/mK8oiNMj9OnhtfkI2kOTScgixhZJJzo3YKCNKVayQAp6Q6Y8yVlNWU4PbjywhBhW/qrW4m
	xgDQLjd4d9One/sQC2dDo/G2PU8haed66OfUQpb3bPcuYhaTzTBzxvR8ro06V1jHHOe4NCikS8L
	L9wut5vGGY8zGB5+4n/BY3SDIQsAQly8UtIloUJ4C3Z3JzcUL2RYNsKuXQxbGy3Qbj1fEjRpxqB
	av7j31DvUywm3xaNrgMRCJPL5EPCmZw/QwpWMk4+JRRTyaEkPBeJwxHxsfXV5LlHhHyRZVwd6N2
	BO/6gpMDTvzm/YJNFLM0LCZHXe0DQJWDcfB4a4z2HUJitTS4ONYKkx8G3twKn7qXTA4ZIEAhGrj
	2R6LZvU5CO7V//ncvoZLLjwh0OzZqgGtSikFd602G7wRAayCXKLucJ1wTXg/PzMSKw7rE2OWEOo
	5IjntitAbFEx6rpj1ntUh0=
X-Received: by 2002:a17:902:d4c2:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2ddb1c15766mr23812395ad.19.1789706523953;
        Thu, 17 Sep 2026 21:42:03 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb760d684sm1704675ad.81.2026.09.17.21.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:42:03 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sboyd@kernel.org
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	mcanal@igalia.com,
	wahrenst@gmx.net,
	triet.hoang.dev@gmail.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: raspberrypi: Handle cpufreq device registration failure
Date: Fri, 18 Sep 2026 11:41:30 +0700
Message-ID: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of platform_device_register_data() when
registering the raspberrypi-cpufreq device and propagate the error
if registration fails.

This prevents the clock driver from reporting a successful probe
when the cpufreq device could not be registered.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index f1a99de6de4f..9882f243d681 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -553,6 +553,8 @@ static int raspberrypi_clk_probe(struct platform_device *pdev)
 
 	rpi->cpufreq = platform_device_register_data(dev, "raspberrypi-cpufreq",
 						     -1, NULL, 0);
+	if (IS_ERR(rpi->cpufreq))
+		return PTR_ERR(rpi->cpufreq);
 
 	return 0;
 }
-- 
2.53.0

