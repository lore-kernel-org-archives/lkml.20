Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0F4382F1C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769350; cv=none; b=HIJLMSA66vIMvU8cIAQqSVO9A7vECy0qLLlqZcMTtLncYdxpQJjv7JCmIJQWCMo5ds9JLi6msw4KAQASqc+MHBY2RIG4lVymW/nxnDqjXwKJXm6WMEsDFL3YE8SIJdgoOXkM3SiILB0LyJDcibapIBZSJy0UEax+z2eKpKXgUgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769350; c=relaxed/simple;
	bh=SzFJP0jiUiQAnyIUqADYku5K5Hz/gi3DhoMO0xBKTaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JzfP7jcW+tKlbUou5W7tCYFUbBVGnawydpRlZkVTe4IksLbEzDQmmw4Ll/fUIUjDY9P1JlV0AA3A8jVwD23vKaAiM+8M36+skwdBJLecuC595vsYCH4Hk0TRdWVCRle+cbcOKM7vFAWTqE8bc7+p1+54lz4Ci9CbsOWoEhYB1fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTq9ZTN+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTq9ZTN+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso29465445e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788769347; x=1789374147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DsPWwpNpl6k7wrCmG7PQd50StcBQygwTK0Z6Y3sGKaY=;
        b=UTq9ZTN+nlqcMXh7euzK5Z2NwVgkFpRojepdP0Zy9/4mIMO5W2Xr8l0XDl/6Hha5JP
         SVdDWruXwiy/jS5DTCTKNXFrRptubY48qpYSF9c9ahA26+PKv/ZZSQQIUuiWHnDMIDKY
         Lb6Mm3N+RxjIxFOh4s2lws3qgpbS4Lji3eS9dJx7oig679eVY5ZGVIMjSF8Ps0/Bb3So
         VAJfQkUSAyuiOwHl1tRac0ctpo8ezzXJdR18ZO4PrWIe+L3stYV6kCuIBOX4o/NmLGQS
         4KSE9YuIfT0k4STkLG8XlBFwLbmTka7bILEXT5ehot3Mqh2I3a6B+balKspz8F615XKc
         dV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769347; x=1789374147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsPWwpNpl6k7wrCmG7PQd50StcBQygwTK0Z6Y3sGKaY=;
        b=NnDW7eRwVBrbbUoivX5qK090aCoy9iiyI8/o4PtSCBaKom+l1cSoGQjspNRcBdn5c6
         NKLOy+rk7v2t4PTSWuUoeURrT906aIRZYfx9iqdNppl3tn4Y5laOpztW4WSV4IbXmFtI
         6v4fNzsZkX8Jh16bI48N3/+HIibV8/NKX25nEDLu9rMQrvLpQ79FVyhTJnjdLxOAHXy1
         ZIcHxmcgcDykdvlJ47YnjJK+A4hf2R+iZld4GKlfWib4rXn+sGGmSHOLqPWA/f6SKl8G
         zs71Ds434Bro/9A4299sfDRTTMlegbb50J+M80IHjZCjs4l67r2ZKDhIj4Tfk6ahOMy5
         1VLw==
X-Forwarded-Encrypted: i=1; AKwUvBw0Q6PTVaebnNHeOQBo1Z6u08S36PiZxDjWpzzLEkUq8yx3sKOnD+oX/lwHnsmnVGF5+a+riBEY8KsnQSc=@vger.kernel.org
X-Gm-Message-State: AFuF++k30o9l/bIUJyX+slTYiXTvdrCYJ1v4OwZ+SFkiBk+X4bZFpnYt
	BNVhMEhtL7BrLVXXuiji+YZGNFqt84lpzTD3XZ+8oNiXWgrT6xXTejsE
X-Gm-Gg: AYBFou2yGbbyYTu1b0WWhBa5PAttuS6AHKEHXxhZXNKjbny1wSosHyP3GWoZ0UeV8QP
	0kNM0ee8t8Ah6gEFMB/GKit83nxFhB5yrxVOwlR83l4H3R9pntxW74V1a38kN44CM55ao0M9ZMM
	C4so6SH+y2lJkPAYhcz1Gqdwu+Lru7kiWe73cBsrAsKgHWek7lQSt+tTn7EzdK2K4i99gxweftg
	fhNuOoMuD9ylbCspp7NZ9UNnN3Og9i56bfzCPDcpOne4fnIeFE3fgvZin9Vx8Nva+82GaeqUQx8
	zR3TNN+xABxIE5beN1LKzv/Xw73IXngkvZp47fIjF1eV09W/TNBRG5BUs0IJUSjQsQ6Soa6+mQi
	AGfHmE/vuhFAErqIVK0IW3Faf8oaOJUdV/PdqDDhW8UKPNKAmBqKYSTjNCjALoulwX7wx6bqKCP
	2knALa6jHxtmT9zV60iXacpwPGFVawg1X7IDqr2o9vP79pa9DuNCcLPKqXQ0WwKSTrVOnhUBN3
X-Received: by 2002:a05:600d:8497:10b0:49c:f13e:e4f with SMTP id 5b1f17b1804b1-49cf891bce9mr137013075e9.12.1788769346885;
        Mon, 07 Sep 2026 01:22:26 -0700 (PDT)
Received: from localhost.localdomain ([165.51.77.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm191106465e9.0.2026.09.07.01.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:22:25 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] iio: temperature: tmp006: Fix endianness byte swap in trigger handler
Date: Mon,  7 Sep 2026 09:22:15 +0100
Message-ID: <20260907082216.52821-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In tmp006_trigger_handler(), i2c_smbus_read_word_data() is used to read
the VOBJECT and TAMBIENT registers. However, the TMP006 stores register
values in Big Endian byte order, while i2c_smbus_read_word_data() assumes
Little Endian.

This causes byte-swapped values to be pushed to the IIO buffer on Little
Endian architectures, leading to corrupted sensor readings when using
triggered buffers.

Fix this by switching to i2c_smbus_read_word_swapped() inside the trigger
handler.

Fixes: 91f75ccf9f03 ("iio: temperature: tmp006: add triggered buffer support")
Assisted-by: LLM
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/iio/temperature/tmp006.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/temperature/tmp006.c b/drivers/iio/temperature/tmp006.c
index d9f6449ec0d8..f3b3de0bf221 100644
--- a/drivers/iio/temperature/tmp006.c
+++ b/drivers/iio/temperature/tmp006.c
@@ -256,12 +256,12 @@ static irqreturn_t tmp006_trigger_handler(int irq, void *p)
 	} scan = { };
 	s32 ret;
 
-	ret = i2c_smbus_read_word_data(data->client, TMP006_VOBJECT);
+	ret = i2c_smbus_read_word_swapped(data->client, TMP006_VOBJECT);
 	if (ret < 0)
 		goto err;
 	scan.channels[0] = ret;
 
-	ret = i2c_smbus_read_word_data(data->client, TMP006_TAMBIENT);
+	ret = i2c_smbus_read_word_swapped(data->client, TMP006_TAMBIENT);
 	if (ret < 0)
 		goto err;
 	scan.channels[1] = ret;
-- 
2.43.0

