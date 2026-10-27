Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098256;
	b=JZQkL2rYBsxGhnHgVUNiSNyEs7iqmSGE5wOnqG2kgjEdCnWCBpKeNN1MXwhJZRGNQWjt
	 H9Yz4SXbam2VlHfNOthXCGeHLdHRvEkqXafJjcs2jD2xZHNMJwe6v5tbGUvQn5VAatWdQ
	 2GRo9cUkGegU+JRr7h+3rmXmlYcBIS/QvMwUFQL+lDMiLTNs2sOZuBGrYIRsqzGK6pg10
	 PbE3y7OpkaXp9300jyiuzoHvjiaeh/XpptDEWxxa6UEejwgEGNXFCDzOCoVcYuwVvrT37
	 eJcrgzWZE4ZRWUvvtCYgApcp+bCY0cWCVbSPV6iDMqsLDVa4J/txacBw1NZN8JCqOJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=4Ev4Q++YzojM8jhK0gqwyICK0B7tnR3S7VN4aaA1E4s=;
	b=p0c/uPU9F+libEIyUV6/f2gcDeyrK2Ln5LbbRxuJsZBEdlhYyKTAnKi4noa6Y7Jh/VOl
	 JHBqRIJBTBzJa1rE5FBxtn0rWKnnqat9rE52Tw43FEvsBEUjWLIBX7aoSO118mzdJ8fjH
	 k832G0S7LSadYHtGJXWLmtn3RTE8azuY/QeY6trb+JVAkbp+j8g6iM1Ak/OQNnFKjLMK4
	 L+N8lpbPVw/dlCjIFdV7ZzeZkb1SYHQe6ywt+9qSxpUIEYDt9LSobCvEta/qnwwBHyk0P
	 OwfijK1dam1XBP2LChduijjuJbQgHprHuEOrhf076t3c8dyDPgQJ8TOTfJ06uOcZVhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MJqP+7lP;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350D460A2621
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350D460A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MJqP+7lP
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2494648f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098255; x=1793703055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Ev4Q++YzojM8jhK0gqwyICK0B7tnR3S7VN4aaA1E4s=;
        b=MJqP+7lPXJuV+0LLWrm6PWKjIwtjZGplhA3FJ0Qc8FtYAQSa+hqPAHomvkNIusSY1k
         oGV++n5R84xxc4O/c6LyFLZgJZAXnMxu3iBQv0Ufh4Beg/JHGAgc/01AaYD74JXJkeat
         MYXNjvWoOBaeLNzrdTX5nSViXH6/bEB9tDBr5B+FquVFxnjzFAM97N9as6Uu4h4e0yKf
         AQFtY/ISp6Wk36vtNNtGOtm9eb9FWFYh4++0mxHPiUNkjqEq2dOhouoWOX/Z9GC57H5P
         8gQ/fjhH7iScibEfGcCi+xkaoHRs1qZgwwFmfTMrq9Fczke7IymKX2havDLq0igSK8QR
         aHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098255; x=1793703055;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Ev4Q++YzojM8jhK0gqwyICK0B7tnR3S7VN4aaA1E4s=;
        b=yCgiufIiCzPbiHcJAA40ogXBr057llVfNNOMBfNYvnrkgeEyP+PzjtQRazxiViN/Yk
         WybylDN82tLwC8pVVN5iB2eg9vG751yxP2dCLRCsdZe3DiOMvHFoko/jr9W72WcSiFx7
         CLotZmUXmRp1zhgmreD8tM+uxdCq9p960/Kq2WSBvuTmA7aDRqBBShgvtmY6dWAYdtH9
         GpTTnKtIq5qi+pnplq6NGZ1ukskdodeAWvOVDhDGuJ0QI9b1TrnFsYl/YX5BMT9TGy+w
         TsrHA9PpVCiJQovXwU/efXiIdTjCtaQ6Apzf9QTGgrp3WcxfhfObg2GZEt3Eea6+Y6mD
         WOgw==
X-Forwarded-Encrypted: i=1; AKwUvBwk/6OJDWTvjQlRYDrR5SrTbc85bEyH9GWl/Mjb8NxFccXfuEL/CNXport12UQ5gyeuPmWRD5VlqADqLBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIQd51u0yJGcuHc69yQbIQz9xCIBhRCyTAP30DkemmSEyw9Wk7
	Ay/F1+GBWmhOn5ODbtIb8dCJNhG7Fyo1tnlmIi/NCIjRO7QRMfdUrsRZHSXGlIGb49s=
X-Gm-Gg: AYBFou123+hTKWDOiF09eC+qsaOuW16l7+ioxOUYue0Dba2I092THgK+QWiNNX6eJtC
	zuHG18radpciNUE9csCvt9LDDvm/Zr6i5uElRlh+uLVNJm9r0rUeOb8b9tSjUdW3efnTatdufj/
	xGUf4EmIcUH1XJNfKJ2PatKDwUEz2Ym/cWtHQHHbPc6WR3t5dztKi32cdJZyE8GZUrWA8YglHfU
	wMQH5d63huRLip91933aD9BvAfuv2628djYr+GHIpNGMO/uNfIoBvFNhJP3ylVPHtIZyXLo7x5m
	ENlrbKkatyXWh6o0ZDO2Qr8UyGAXSwvBb4QKcuyTfBR9RaSlJ4l+J/+wjAa5Tnn0vYcoSgni8h2
	j2gQsRVuJEcjqYy0FlaOYHDi5b4U3iDG8ZnxpgPMJ16hm7PJEc1hK+qdTekIvEO7SNkJ7lctlLC
	rZokT7k4mesvweC1yLDVFbyvdz2TlWA4OZ4kJI7CTnjoXhxWERqXaOGmPs9bGKHpH9P6XMKE2Jr
	8ykNSQsJWV9M0RF+nBV9VCJrPz6mMXQM3UrlJceckiO7ZoTBYt64uaYIrmr1/5USxhRhAWO+a8H
	Y3NxEvJ0NM4GW4S+LJSqWKhGlL1ZIeqVzmG5nF71XkY=
X-Received: by 2002:a05:6000:29d6:b0:48c:43a3:6a74 with SMTP id ffacd0b85a97d-48e3eb75e51mr9963129f8f.12.1793098254583;
        Tue, 27 Oct 2026 03:50:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebd48fasm21907845f8f.31.2026.10.27.03.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:54 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 21/23] gpio: Unify style of spi_device_id arrays
Date: Tue, 27 Oct 2026 11:48:58 +0100
Message-ID:  <d12adea6b933a0fd358336807f5c99f83794e288.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/4Z9VsdZSag1oZ46enQb7zlX6AH9IP2d+Vb14r2Q/YA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHb+6wERuyd+XAgL3boe6h5ukv+019+BJBSS yqknA2SqzqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCB2wAKCRCPgPtYfRL+ TpzTB/9eojcsoktC+84+4tigHHM+oiVJeT1egFd5XuqMJhHXLCa8/86R6uWxnxJFq2+5rR1eYSn XIHjdq5F1KEJ/bKBgwctnmwCEdhTohqQHPAd8RnSKZQ0/V1ntm8FvXdfUfnL4hRrHlq3KgmSADu pNZIuQWMktu+Cg1Y3GYA/hZuL6lqR4uulu9RuS7OhIt+JeePC4HZypnzsKEn/RKDRnemL6sgNvy ey+k98XbGYYW4NwtKfUEXowLHm+2ZMKoMUr5ioQIObTGdBoBTF/pBXI0ZknET7dCELawEeLvKO+ yT2tYTwU8w//WroLtfC/EUQjXql+saCg1KjqU2UrY3Lwf1WM
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various spi_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-74x164.c  | 2 +-
 drivers/gpio/gpio-xra1403.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index eeed612e7c80..acda26cc4cc8 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -182,7 +182,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 static const struct spi_device_id gen_74x164_spi_ids[] = {
 	{ .name = "74hc595" },
 	{ .name = "74lvc594" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
 
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index 03c216d6d03f..5089377b67ff 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -186,7 +186,7 @@ static int xra1403_probe(struct spi_device *spi)
 
 static const struct spi_device_id xra1403_ids[] = {
 	{ .name = "xra1403" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, xra1403_ids);
 
-- 
2.56.0.rc1

