Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06A05013C0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650071; cv=none; b=KLTYWXsOn6iGvFPs4OgbZJA7+zypVCH78zkYfQqGa8kdpqWFP+AqhqknVHr3JdFUs1D3VyvKle9iZcPFDeNceEdxEkfhuMLV6tnb4/19NMNfjUywxqqryrhcVUeH1o/lvDaWhAOEli04JCGfTP7LQ9uVN7L+ped6p+uN/NuMsrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650071; c=relaxed/simple;
	bh=vZ6fA7X/Ujep4p6pROxA6vhNUz3bOVdFITdBs3jOIEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FpOR/AbAndUKIp8Y4v5T09HPeLtviiez41JTASaqGNgIGEwG/FDidhFvA9Ppmt5TPoMFIoa1G4fhGabJivngSOhmxsGSAutZ+USCMqJ0SLSGg5egciEy5NZrpNB2H9/NYy+pxoMn7IOeDiEpz1b9z6md8yV8tk8HdQ3QxYltTxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7UfEOOv; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7UfEOOv"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so448074f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789650059; x=1790254859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNGTP0eIfCOVthvscWL2P3zVM+9TYAbEJ3MaBnL5i7Q=;
        b=I7UfEOOvAQKtn/9oMKLphygi5BQsdAjZm2x5tthGrF0l5/se+N4Q9dV+kf3ij01KVI
         yvALCGt0ib1d6MG8wOhs0Uv52QGyrnEfmDmK215Wx2mrYbBYUisOfe+/UWcwvHy+cjp3
         ZCZRVCelgxkBffZ/uzgSoSsn0gQenQKlNqVkT3f48WRCZsiGMAFi2sjTOCZY/9nVadOr
         E2Q+UKslyu4yQ7WEmqQUV0zV1dot1Z2QWGy+LvKQNg9J+TgYR+/R8bBi7PmHwJfJA816
         BJrqnovgzE7GkfkHjIKKk7f1ra3a9hBVVy3DSY+flGHDJvinxiowCvGtS+11MDHZMf45
         Cefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650059; x=1790254859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNGTP0eIfCOVthvscWL2P3zVM+9TYAbEJ3MaBnL5i7Q=;
        b=hMfso0KPmX/NVdR+hBQmscUzsWLiRkOfZrueUG0xvniHsKl+BAupxDiVRdY8UGhiIX
         V/akJ60jMmMpAr/aR8fDU4KGZj8c67Uew9LdeGNjFA0LtH99ppEXM4Wly9P7rYXOPj9w
         LYoqizMyVNR8Jf4X/28wFxP9RjPfksCsCIYCAulhQuxOCWbq8IoxDA+x42OBdUbzkQ41
         wU2YCmfDoQF22j4go7XV3/0lRWMp5gtMOM2apBG6zCn+a2MJBy5FNpPS9833RGv5FgP0
         B1L0M8KVisbPi6pBwesISzISYj5LQOy+4dpP4jVSaRUvv6/adpXFYsFNdxygETrZE0RX
         +JlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoQfca15mgprf4XJiELX8oRF9RceHEPd7xaAxqFQMCj8q31I5Cc3+h4v3ml1y4azAMy/EhHKtZ4r9EsyM=@vger.kernel.org
X-Gm-Message-State: AFuF++kR0FOiMyeU7DfAOwIOygPhEszuF3D5Pt+U149T5AIisqwoxAzB
	jBQEjEiIifQxTczJ4Jf1TiDXD07Kn8GIIzbMeDJawEvdch8OtM8n6BwN3zf/ew==
X-Gm-Gg: AYBFou2B+vTR4JZ3EbL/xB5yEn3g49FUkP3Y509aFkL2qE6kx73YBwMjuJTenBBQz65
	ISZOf3pEbIk4J3l16iKtctbF918u+zBMtubciGHh8rfu4o6WjOSJ0kYMJEt+OiVfLQXPY6XOI+a
	yzfUn4iSz4INCxeoqrd+H/mW+QDK+3I8J8DGfXXKy1Wa5OhMUonCcmIZFn9OgC0UiNK3TeRu6ps
	ef8iHF6XPCiRZgqYRq+xqvD2QNp+Ujhoa4YUA7Tee6f6+J066z6xMTkKM5wS6CyUduQ1uPVZUtw
	7LnT7WO1UdhXl+BFMUeqCQXKkJTRCkz9Kb5V4sr9zembNr3hpJHK/UQ3sJXqoA4kFcfLURhkfNm
	qfkw8RpHdzEp5h7Y4gWqWiNfPgVQaOU2wS2tTpB0ijTwFMQ8y/cLGValrIIS5v8aQyHUQNgQI+h
	8xBnKKY1hwetgJ8OzK1XGdhmw9RAGixrf8nlWABHI6JuPDmI/vcOIBU5B/0Cu5HolZ6uJjHTHZV
	BQiZOogMYuc
X-Received: by 2002:a05:6000:41e3:b0:487:62d:37dc with SMTP id ffacd0b85a97d-4870cf36d6amr8453311f8f.32.1789650058775;
        Thu, 17 Sep 2026 06:00:58 -0700 (PDT)
Received: from localhost.localdomain ([196.235.229.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm15462608f8f.29.2026.09.17.06.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:00:58 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] iio: proximity: isl29501: Fix return type of isl29501_register_write
Date: Thu, 17 Sep 2026 14:00:52 +0100
Message-ID: <20260917130052.636055-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isl29501_register_write() was returning a u32 instead of an int.
Since the function returns negative error codes (such as -ERANGE or
return values from i2c_smbus_write_byte_data()), returning an unsigned
integer type prevents callers from correctly checking for negative error
conditions.

Fix this by changing the function return type from u32 to int.

This was found through manual code review.

Fixes: 1c28799257bc ("iio: light: isl29501: Add support for the ISL29501 ToF sensor.")
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/iio/proximity/isl29501.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/isl29501.c b/drivers/iio/proximity/isl29501.c
index 95fb7238f678..a98a9975323c 100644
--- a/drivers/iio/proximity/isl29501.c
+++ b/drivers/iio/proximity/isl29501.c
@@ -226,7 +226,7 @@ static int isl29501_register_read(struct isl29501_private *isl29501,
 	return ret;
 }
 
-static u32 isl29501_register_write(struct isl29501_private *isl29501,
+static int isl29501_register_write(struct isl29501_private *isl29501,
 				   enum isl29501_register_name name,
 				   u32 value)
 {
-- 
2.43.0

