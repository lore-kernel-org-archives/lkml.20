Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098224;
	b=hNi3+z+kCGJF7cCF5elS2kXj/Md7yAyDTXGmcdvgNkOUWIKyVtAAwNMf14KNgw4SrxcG
	 plPAhJ8Ai7f3sR1SKwr4ZQmyoH0otdpNVfNBkczOUm5QG1tHwDxA/onenDbop7pQCg2GT
	 P5DJtt7/3+Ii/RYMgH/jL73fuUXj/WdZZHun9teZxcHqvphsBqVON2Cing08SWZzL9a6P
	 2J0AajXtXzTFNMPCVgvC1RxWx3smpovvdmePb1JQPzZZ4E9Cz6iaX6UT0aRUvYDMwMynt
	 LLCO2gqNuzd2LHxXgdsXKbe1IMWG9XFoKgWbzeb2oKZYHBD2332qQdfhkCvrDeNfrwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
	b=ScwHhiWKjh/4ucg4NUdg8AyHJUe/n8Oh9PRF9cgU6ir4S3ltlIxy2fjTTyHDGCu3G14a
	 hmwKbxYuKSH6cxRUAMPge/FzkgeEvlTP8bV2+d9BGNrz5bh2ArkRyrQiG+41YuzHQcx8f
	 DJp5VFep3DYOHq1zqdNttuNU5CwNP7TqbB7FIBKpq426jEP1JvHFLeumejq6DiqTWyaHx
	 nmL2uCISukrLU/FCmh/U9EVESj724oBt6+0bWYHoV3NpBtN94f4gn+fa4GFkPDzvpFUVX
	 Vg0458dPuNzLZG9ZiDQxPvihsYpiWdXr7ZVaHg1/4ndc28il3QOGB5Z0UvdUKreMzNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=L1sL4jrQ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E660A3803
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084E660A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=L1sL4jrQ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214af2076so29426915e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098222; x=1793703022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
        b=L1sL4jrQCSvpDrIgzYRuWokv1fuGio+LEhtJHcgALSBEE9Qkl7eMJDC2oWhrsXA5Al
         7C5YO2zDQXSsM8QOw00HSkWvge2EN6PWUzFb4gh9dOtoSkCvs2QJ0I1JT9TAy7EcWaR0
         YtjSR1228QD2MoBRyUtUh7IZWK6+0jx5dMgfSKd35xmGYb3vt56BnMwHKPp+KyNXrFgT
         N5B8uvv57qjwkjHAF3tpmM2sn5Y6hl8ZPUIvdnz3jaiVCQTU+GwjduwS1jDzp6IjRoiE
         HC78VP4l0MD4bQrHHqmkpqsYYDFQ/zUlTf9fBkclPhUKfj/jazZlRq0lV4hLXsnd+L57
         RWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098222; x=1793703022;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
        b=JHpfGjwMMjz6Nm9WGuX4byLBI94FpDYEXtmXE4NK6rB1pK0C0d+Ej85jRFdUcBlbvs
         PLZjwDWFU8G+GQ+ehaNbwB0MaBMapn9r/C2TuA7oek+gZuvu9FiLJYDD8JbJfMD9JmzP
         D98RvB4+sXh2EiiwbHj1pxuSayyZHumhmMWAyXcIWvlSGYpDM5ALothWLP4bw+EgRQLu
         0yaQUtusrL4Wn2cvk//7D8PBizzUjUFiGiJ+53zTQKLY0kjxqc/zsZ88YEF+WJokttgp
         Bspq478aHXkN7VWUUVShRwSjgtojlJp2KWwSlua7JiCuHWqM5a0HvEMZVpZzarl7LSOs
         hOzA==
X-Forwarded-Encrypted: i=1; AKwUvBwkl8Vkav9p2ffnTLQqVSG5jeW7esCTqFoOA1rDlLYj8Eu7okx9hVR0NqH5CGrrJ3BcMZXEBJ/sTfMea2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEylnfBWbKpPIpWDYPL6X2A5iwwBwUO91MXNFrz7pV3XMLo8zL
	PDybGgfYjRcBvFxhqObVefHX4D1xvidPE0OXvEFe1xitNQbGgl+weixEj/GckLAC8J1rVCN3y7q
	pS5d/CjA=
X-Gm-Gg: AYBFou2wD0oY56c3v2eBxZ3MWpK1TAUBrcOFFPPc0DNBmmOEQpltLL83YQyEyR+ch9P
	ua9uvbuj86KbzvlNzz8OissOOjunlDDCvv25Wezu1T8vg4+mjnQqS01vhK3+S94fGWtXlKXEEiz
	XWFktff44zz6v8EbTcMCado4rKjL2XiDezjj5/LV2HMM3bxzyvRqzio7uA7YMzyY/aBde36SPU6
	EBDPQZAPWwj2alcOcBFUu0LA2iwuvjbI3iwoCHkydGFXv/sRtERHXHmQEdWRyN+Y5l7Of9bFdHm
	4+TkXSZ2yrn3Gox2nvnAEPS1qjlaR8GlyA9dxsJfb2yQEl/6np+7Rm7eXxNUdGtaClLe1jPLP6W
	5O7lstrOLtWmmygkrVooyJ5cQskaP011xwwqqTN7BfnCQdwdog2rfVQ9VuzNffkCEdXpOqE+rcj
	9ykAlWf9etw8F9nzU6GzTMe9fhDP92oVkT2RRViJ7+YJ3FkWyFAsHc3T4VKNRq7IsICIdSPoL7n
	vELHWKw9Dk9dWWfptjnIQTaIARSNOFkLdYJPqah3YgDNs0dWh6T8QxY9WXoKOB/hXxVp6AAXwB1
	c5gLqP5pDZ6VV7IliHXEjdc38rmR5iGIcqRDshOlUjw=
X-Received: by 2002:a05:600c:6289:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a35ac9f52cmr174081285e9.22.1793098222491;
        Tue, 27 Oct 2026 03:50:22 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm321119085e9.4.2026.10.27.03.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/23] gpio: max7301: Drop unused assignment of spi_device_id driver data
Date: Tue, 27 Oct 2026 11:48:41 +0100
Message-ID:  <ec89e9fe1050042ffa47d0807288e243b1ec9d56.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=N1ag9qLsPodh6SZJ2X6l/iSN9O9FLF3gpdlS+1pEOA4=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGZcAhbz2c+bxZV02dIADUwaB3SNP3DTSSoh FRb3RFu1R6JATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBmQAKCRCPgPtYfRL+ ThYlB/jSo1I+wisQXf8gHX3XhGf1CXFOphDem6EfgogWfaOH2dCg3RwRQmhII8Dl2enQDfRQOT/ S/6bQMz/4B7IkppUTJhVaswt5OVHFRreXAHBh9b++TQehTNxh3gOUFKmmM0yLwFCdwsoqcDqlW4 /j13nGl3lYJmjwEDDZ7fprvHXOhq045l/+VxXHZ1/HfQBCzwwBk4KuO9rcEs5mC8t7TTAtsVc9V vRa7oeta7hjW9L3kkkUOT3ob1d318OEm8cL2BuShH91e+aYtNNWfefrBCRAym7VpL/b/wij6ZCo oJ2opwBVuYqNKoB3DFkJiPFEYC5623IWkTUhspewslcxJs0=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
spi_device_id to zero without relying on that value. Drop this unused
assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max7301.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index 11813f41d460..c8bf6a9c3de0 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -70,7 +70,7 @@ static void max7301_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id max7301_id[] = {
-	{ "max7301", 0 },
+	{ "max7301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max7301_id);
-- 
2.56.0.rc1

