Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526384;
	b=Cny+6pHqSWTonfxR8Ed74jeC1s2QbXP9uWcTZc5KmWdfDGEjEZTMRvEVoGCYrgsG6F4A
	 x7DU8WSnAvWLVOQTO3Uut1UHUMletXh3C52+cjlEaOPVEPx7ilVAJQhg8d6osY3ajZ+Z8
	 Qsu0XNk+Uy1ccCAZZ13XTzKoTzGXJk3BvWcVt3QXHALhBfb58lDqd10SWYSCpS/OQgHaK
	 tEfrEuL2rvuIGvQ7SbknWbtJ3TN+lOBxwqUlqHXsjOvXOdXtZtESxZizBx9ZZaNU73e0q
	 qp2dgGQ5tmwZIV3oaIvnyV4t3wm2fsPYXbRjZDHoOSzvD80f7lv9vnJW/Y2IavO/CLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+eR0lfDXlGBkQITg/93Hqy9Hz6un2dFbfB8Q3L+Xa5Y=;
	b=ec1AfBIEY4bouz8J7S2A4+HdsUhckeFgfIJg6wjXNOGHh0giYXINuNpPhw8d5t3Zo75g
	 o32e7n/mA5xkJLlHigD9bchHrXDuIDkXA5FpxeUNYz/8TnGZVjK2YPsD9ZBtR4LwTUi7C
	 QlMa74bozj2SoDdqzrUOhYl9/hm/M5DZt3Le9ZRid09r7xChRm/i1UfGPtw8rHzzAPkf7
	 NgaKd9fGczRhtEfVMp6vJEn5208dplLEiWSsXmPSo3S6vy/6eCMOljgV1voMqFuihW1jF
	 zaJJ1t0WQCvgIxN0oe7zWUyXYGmT8ETQf0195U9DojXsgGRGmUtYul0SZv02hrR3JaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jpDb8266;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C96606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C96606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jpDb8266
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e10a70540so2497f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792526382; x=1793131182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eR0lfDXlGBkQITg/93Hqy9Hz6un2dFbfB8Q3L+Xa5Y=;
        b=jpDb8266n0eF8d/i2ZXHKfEYgqEsLR804+WEEzWiZiRgJmg9DmrtWWJmPob4hSs7uf
         Yc8Kpxcwie9eGJiuOcy4end1XQ8xzlc5Mjt986wQpuK1NA49eQ+uX0yAwXuYaf5XRKLp
         Jap/0yRqHi3E0Et4qP5I2EgvTqSrpadzAfaY5lsVKpYm3y1oOWqipSuvLYDYO+489Le4
         WcW7tQW8E8yz1s5X5zkHJ1H9WxqgnHNfbo8OiesEx6UIF3VlB5ed6bxi7Y/LroCVIYcr
         UGv8CE/ezRbG+1+qjg3g3qdiSD1Qrzc/DW1npAsL7PbVYYEz+LiCtSNV3IzRXU+nOgVy
         GBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792526382; x=1793131182;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+eR0lfDXlGBkQITg/93Hqy9Hz6un2dFbfB8Q3L+Xa5Y=;
        b=A1erb+D6Ei6yUnrUbFcXNVlf7O8zFJ8yQwCAON4yWJ0DJBlFtm4IYtLIoPcz+/Nd5b
         WBEfoJ3zIBz7r6i5AJDBy8KTupdsZGPgsdMyGQ0Gjg+ws49/5cPZZIMRxwxqUJGQAfMH
         ez7Y4GJwpcJaUnZvicLLfR1VxuUtxMnoI0GQThEsttemEzH5VCrjjmB3ohdWlWOMlQjy
         iC/PodgaM7WI0RQMC7EVsTnckwLjTRAnnvPxsEfnrcwAXQ3fEt5F2YUUqnFJSUI7XvzM
         5WeX1cvcjiFHTkegTeYqPb4XFbihtUY2K2uIn8bDIOEDUB/nR8hgJauIBvEXIx/6pXrI
         IV8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwO8l3k7C3K52m3NA8zxE9EvvjXLps4Ld8nxpsR7mhm24Lzn4UZrBp94CNRqlZWE1DabHgPUOE72fijEbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxmJxwlfykqM5x6LXrSD4OLklSJsk0kkiIJISeeSDrS3mkP5R+
	vqyjh66NNytZmNGwLOzBTULS19G4bWKh0CUDc1DoQGO0HZO+XePN0o04
X-Gm-Gg: AYBFou2hRpwSHdEJTOGIA27b2ISJZlO8VBSvwlA06709aAvw7eOeITxL1XhQdu59fo+
	AM+b46wfwfQykvPeqB/pvUbVGK/bqX/HUfYuad2tU4Yv/CY3NY9xa9ivQa3Ts3QKr+lVIXX/mjV
	31diFieWtJYsNrU180d+9liiVrn3GVBXkzcoR7UaLwFU1TcKbDq0hCFgbP32fKEz/gx9v+j3Axw
	lao8ACrI6V00Yrgu1e5JxXzijq9MMZrhX3AyUyS6jyq8aGTU8IgtaPzCHOT2kMcpj7ChBJR+c1H
	qlLr3d1KPt1nXCDznOOPcWWKmf0llnTTcDBh8xpb2HrbxNOGR/Vf98zKxiwdUY3UPWA2SNnUk+4
	PAjyS7lMMJvj1tVsC9TmPH22Uv4CajVvIHkOjYwclAjKk8bCdGe/t0OfUeNW/p9N4CR9oVemFHq
	/wL6duP4yb+OPlPXRlknSUsVHPOYjkzIiY+gmTxMKgKvktDbGX40rEIftQ/ITqGOgdY3+417Zqc
	nbRuFmjxDm6
X-Received: by 2002:a05:6000:1847:b0:48d:e5c9:39a4 with SMTP id ffacd0b85a97d-48e07f9f0a1mr23318111f8f.33.1792526381890;
        Tue, 20 Oct 2026 12:59:41 -0700 (PDT)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f412sm594323f8f.16.2026.10.20.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:59:41 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: John Garry <john.g.garry@oracle.com>,
	Jason Yan <yanaijie@huawei.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH] scsi: libsas: Add __printf attribute to sas_ata_printk()
Date: Tue, 20 Oct 2026 21:59:34 +0200
Message-Id: <20261020195934.250768-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sas_ata_printk() formats its variadic arguments via struct va_format and
%pV before passing them to printk().

Because %pV hides the format string from the compiler, GCC does not suggest
the format attribute under -Wsuggest-attribute=format, and callers do not
get compile-time format string validation.

Add the __printf(3, 4) attribute to sas_ata_printk() to enable compile-time
format string checking for its callers.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 drivers/scsi/libsas/sas_ata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/libsas/sas_ata.c b/drivers/scsi/libsas/sas_ata.c
index 61368e55bf..53eac56c3a 100644
--- a/drivers/scsi/libsas/sas_ata.c
+++ b/drivers/scsi/libsas/sas_ata.c
@@ -372,6 +372,7 @@ static int local_ata_check_ready(struct ata_link *link)
 	}
 }
 
+__printf(3, 4)
 static int sas_ata_printk(const char *level, const struct domain_device *ddev,
 			  const char *fmt, ...)
 {
-- 
2.39.5

