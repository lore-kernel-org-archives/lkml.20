Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852603;
	b=pp6ntfs1YAjbr17n7K+HWZrC7TIi75KZxqzWQldTpRE8hZZBuZ2pXH4zWFvR1nTOZ2JX
	 avoZ7rAuPvo6hsLCwIBFazgeq+yQ/ryWcKQikkAU300NxNJYjHKUYWnANyNYsevZMhwuC
	 tDeMKS/IawRcxiK3gl2GiJZh8M0Flki5J4DGt9n9m0QQOLOUW6ZBTSXbvKD3af71jbZml
	 7Wk4k/gmGyJ7NbrWuitsEfYuAwyjJR19vHNuF7xl08/nZxmSN4WYHYNjipA3YW+RBN+GQ
	 MoIEWpyFPu2g+uU8tMMFjVyprmwdigkXKnbr2B0brBN68zZp+pGch7D3KMIHIEg/m4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=cBVf5mMNM+rUUCpU78C1Na+O2C5lEgI6gSvRU8cE5Mg=;
	b=0wQOYuP+eMdQgDfwlJg72aC1Ekcf6a8XJaMeg/6FBafraBLvGlN7rnQ0mkZyeWwy9aPR
	 ioEVztael6kNBK/AdFqyxlIKIJqrd5/F4hkJ4xGcmL0DzsBH6zyKmQ4h2ektONtBSZVXo
	 b0jFAj2+1aBqCATYUwMQ3vGvZOglp2YAqVkkeplJLP5xjZFAe+sodzGZAGWfAY/jx9qj7
	 dEf+iPZiHyrVg2gGmqDRKDzOACv1YmvBRaqecvypnbaziGASncOU8RDbWg4O+esvV6/c3
	 VbExMPNYsqLPsXL29dy2GgJBH71MAemH85qAmL1b5xyDNZQIl+FYveAHMQk0K1b8g/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n9F9PBR3;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E38F606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E38F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n9F9PBR3
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so29958695e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794852601; x=1795457401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBVf5mMNM+rUUCpU78C1Na+O2C5lEgI6gSvRU8cE5Mg=;
        b=n9F9PBR3PlXR2GhSMuifM2drQ6Yok4I50iIDZ8542xFZ/MY2OYK2HQdoe/0hJBFHIv
         XWbNqVphQtX+2WYMsU/gkeiK5fJd6GTEjAA39ZzDueQbyt1INMYZl5p0eykt2+dF7GN6
         NGBMRHVOUWa+cZaKahXSM1WxuRUYM8GPY/rXzwA24Fa3KtGzM3ORN3aKoPLd5Bqe/yL5
         OVDywTx7M7oyyYH2gQ7TLycC0yiWkHkgiBiRJCuPIvlhKPyQCz0/iGt/KP19PwIQz8oC
         Twee+FF5pXa0tJpQxAL5HSanM2nYND6qIgHRzyKjGYC33MwX+xt565hyA/9nBkUiMvxt
         oGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852601; x=1795457401;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBVf5mMNM+rUUCpU78C1Na+O2C5lEgI6gSvRU8cE5Mg=;
        b=YYp+/+dBynLUAoeGsWyTf0GnaQt4Nn0Nle4OD5jI6w9BwNy9vOrZge8DAVyHbKKvKf
         S0xRmRGk/HhzBu8OxR6JXQGQE7T8ZXlqOof3eVtUcMd48mlkZE+ohBG4o7NSHuKr3P2T
         HzCv9IX6ro7KLW8t27v7yVdOovrdu2ySYIgBv5qe+8gua14HsMH/Rh1vqa6yJ87BstW1
         +klCZixB/UpOSmeEowmnSl4r4JbOhEUQcPfnoI15aZrCeaIW/Bmw/v8h0SBCYD825VIL
         Qfymrz26pAwdzsDDYnAubPxZDGxdL1/13OH/AMsJHu7ntP3ddEiSfI/HAI0yHHm8Kstg
         nJVw==
X-Forwarded-Encrypted: i=1; AL+hErHZF4M0tixKuysiMaHZ3cHMFecS9q88y0bdBhlIy0RgbCoJVJvCld+lr3690gRwe2r0cSUUvI0oEpiiR6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VRFAfV2Dgup6mrkfsCxguPuJzQmLP2dHz/TPfr5jH4bMHnDtj
	BH2RaBjBGNLIMnMHmDkLF0AYaPalUQnNPrBjJCfJJgWnpgLMcKojWr/FN14/yuOFpRQ=
X-Gm-Gg: AYBFou3TCK49tNbGDm0Hw2DeSu69pDNddWAgk6ZaeI66EYTGilDntkqATALYRH6F2wv
	2b8vzXsA9xIDy0SAo5+IUL8pIPoN3cY/L0+aeWlaaPlhis36sH/EA8pxA6EhcgJAuvD8rG+eaf+
	SiPhOqt/B8XprYl8eQzVk7YCCFvlCzgwXu3vJ44WS2/yn4wh3aMJsPidxLnlp1xKcJsrv0H6vjF
	9INptNqpfinzX2ZNTyukg5x74fB2vHW/LvK2yBMjNAutacaJlqdBQdobD66vmV1WKTUgF/NON6R
	qFhqz290Dott8iU0XqOG6m8XIdYvtYoNMTv0TnSToGg6x3m2L3oONm7fa16+w9m0r2JJKaF2qkE
	5gPUdSq/2eRVxWEzg7ovRVozpP8EI1Bubf9UZuqg0u4A8gZIxwCWGJY/Aqi+m8O8KhWHTjKA4ry
	c5WdUM7mus3jIFYus/QdQm0igLMAVBDKDCSGeVmEJ8HHGlirBqaEnvtASJryXPEBUScwpJ/oYRM
	c7MOtpUn0e35AtRHtc+nOZM2lplBQnES7nK8DG7v5ZQWsS5dWMeKLC18PwmV+U7T1XmRtnU8ADJ
	kiFbuEF0cVGAHsr8dc34xF4qq7hULDXXwhX0T1JOLUu7YitebPUVSAqqDYgg4Oh0KWxx/p4uDWx
	37bwo5d6E3emSVv+4
X-Received: by 2002:a05:600c:3e17:b0:4bb:69b3:2b42 with SMTP id 5b1f17b1804b1-4bb69b32d31mr116485485e9.16.1794852600961;
        Mon, 16 Nov 2026 10:10:00 -0800 (PST)
Received: from localhost (p200300f65f19a90439293c698a65b414.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3929:3c69:8a65:b414])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb69ac4e16sm131653625e9.0.2026.11.16.10.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:09:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (ltc2947) Make ltc2947.h self-contained
Date: Mon, 16 Nov 2026 19:09:50 +0100
Message-ID: <20261116180950.3894659-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=FNVtl9KAT6PQLlCBkhq7t0uj2wqVo92ScDOnUKyzYGI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq+0bvd+IhWDQJX9srO7f1evrOCFaMglAxavbJF jm/VtS/+16JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavtG7wAKCRCPgPtYfRL+ TgwYB/wPg8brdCByIxPgguTSE9fuNlyZXLPQfDLxdo7R1E5KbYC9X/SKImZ3+cxe4MlPknE1Ma1 Z1GgVQaOvuXMbjP6pDRWeLnQdGXTX1aXkrjiYGX5Rd/aaiU2gUR3mf9EPKo0x+xb/yVP0/lISQR nisKRq6gqQ/Og0RsW3Curtjud3nxR2fBImeG0EEgaFt09K241qkcXMhzewx/uHNCY1vgtmM7uHm 6aiUpZTjnteMW2sLqxtrxHXEZV5oxd6xQKCRAUupI+4anVlDwxPhVKs48Q64POHigbiJ4Tu4za7 sRNDd/cKIzF3mAnr+7mXVb/u5DMdsfw3b6M1qFJOAXMNC6TQ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

When ltc2947.h is included without a previous definition of
of_device_id, the compiler wails:

	drivers/hwmon/ltc2947.h:11:34: error: array type has incomplete element type ‘struct of_device_id’
	   11 | extern const struct of_device_id ltc2947_of_match[];
	      |                                  ^~~~~~~~~~~~~~~~

A forward declaration is not enough to fix that, so include the header
providing `struct of_device_id`.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/ltc2947.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/ltc2947.h b/drivers/hwmon/ltc2947.h
index 5b8ff81a3dba..eb3613f4d4cd 100644
--- a/drivers/hwmon/ltc2947.h
+++ b/drivers/hwmon/ltc2947.h
@@ -2,6 +2,8 @@
 #ifndef _LINUX_LTC2947_H
 #define _LINUX_LTC2947_H
 
+#include <linux/device-id/of.h>
+
 struct regmap;
 
 extern const struct of_device_id ltc2947_of_match[];

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.56.0.rc1

