Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311602;
	b=BZTvgeMkhRbMHDC+1bzFmIweyuBVlO1/rq30IpFRXQ+DRHUBVf8Hl7//U9zwusLi6tVn
	 PRxvGwgsJsNBL5LoHF7hWOOqH4FF0KxuNyeBItFbKdqGlbRREZ1/DNOgOc3lmHGYL8T0+
	 Zeh7YhvzieLdzgNNwg9EmwRUzrE1E2N1YyQk1mlurlR6aXz1Z135j4jjaRbUZs5pbcBXY
	 Nk1CSnPKQSxU7XLFpIX9hFfoUdDmV9bJuI8UaNVsRs4HXJeHMMVAIy15X2n3PPkk5dSQ3
	 LMnfcCKG/Cp3fUBbsW7tORLxXG9gfs29VrLZuVhgIOD+IPTpD31QnjYzl5gUVatMvxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mSakZyK9vHjxdS1xBbxtvkjfj3Uy7nFotSNsY/U9cyo=;
	b=Y29VfJfYJCrp4ZdYoc/D7o6w+XEO7ILdUJ7aWWVs4StfPT1BUj8gZ2PfZ49oobQMW+Vc
	 XBGtv0jM3qsiAqiFTTxWmb8Eyczfj2YqKN6y6Sj0aqG5WSWRke0xnpc5wuWIML4Xp+Jah
	 aqhynhxkV1DdlSyLSmEdCK6bgrdK3gN35AheIdrVZFbtoteKj0ho5b6hbo4QD082nX/3j
	 jv3r87ILFIR5cYSYC9+W+eRfWlLD6wcynzilhH5MohJveVLgdk/BbKCrXLNTQ6rIeWstx
	 pDVgKEXnWvIBdoBy4yqe4BWToiemZB9gemrvQd81Gc1UmnLrt8guPISrNTjaPFIT4CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QkybjMzS;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE913606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE913606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QkybjMzS
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab4354db11so1302731fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311600; x=1793916400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSakZyK9vHjxdS1xBbxtvkjfj3Uy7nFotSNsY/U9cyo=;
        b=QkybjMzS6x6rdyXiz+OUh53nQ9a2EPobPDtDNswmKhBrViCOiEOdQwxjTq3bsr3VZJ
         MiJxpffem/ETRRv5M7/MMQGcICg1L1faDvWBtd+aLYvECIZv0/xh13sx1gSARf24DKXG
         zg86l3qyrOv7DaArYbgWS9HA7le679BN7QEgLGyukeiauABmoi0MypAE8QcB399v43zO
         rjE+ZCrR0fEU9KX7BpNdBrMEdAHC7d9Kb1oSIKNQe3b9atnIXo7cmq5YXZIITBwant+S
         0n8iprSiqjDmySim5h1CHVR0DUxs6DCm8i7GaSB8BYydEVNrye7KtHJHkbo2TVPdQnuq
         v59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311600; x=1793916400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSakZyK9vHjxdS1xBbxtvkjfj3Uy7nFotSNsY/U9cyo=;
        b=b2uiWhcALNbFQPOu0bapDbC0d0nEMm0f9aIkXom4gW5z2lNsHqoNrvf7p9UYJSvPxw
         ZlyuH3odM8xSWApdCaUiMpmZlLsFsXv9r8L2z/FvNo9qo/PyoxIa4jwi5JWd2vZon/kT
         K9ZPRDc2wSIxynVfqBGfZfmH9IEpb1A2v2P9ALZHkuBQX3bUKIJOAX8ADnjSrYL7xjLC
         lFaobXe7NmREBjozHQxHlzUDguX1biqa3gHqxsX2lRNKhvyz1oM30xFuw5hW1Z2dRaZF
         j0rGGGWVcJTGOWdIOaDNn12kFZ7zd8KDeLEcqrdUghjG7X341iPOwhwtX9gRUSWam+hq
         O71A==
X-Forwarded-Encrypted: i=1; AKwUvByTYkT7F5qDR2qXwxi90rY6YnhXnfr7MMNsN0JnVu+TT9oIUER7I1jzspu+xLYC1mblf81GMsd4z+8YKn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKglJSpeM/XdM/QBmmagZLuNj9vUXLRL5fObfhydyuoOOJQHzrC
	WMTZ2WnhbyT9p3rgwCgSznsS93TBMrLx2wdSJPgFyXHCR0eIFirqlAEW
X-Gm-Gg: AYBFou0aeSchnuD6Ox2snaJ5XAYc0EKAiNX6wXn7e07ryEM4kCGpxvxCPVZvgYxdFp1
	jUb/cfktREMa0fPdWcMllZR1BGZIh3UcvcLJovn+J3hrByPr6xZXdAH+E/dcCu8Z18bXhG1ZR5b
	t8/CidNWlYuwjoGmZoSNixnNXxdlakWbX2nxnIkuiaDNsACE8LKemFYr1nYXwyW1TS6Z78lmb8s
	gEBPKWZTMO52GbFyIgrbM+VI5darZlX+0Y84LZfGy8MtxAyEpHKX+NEV907Erub/lUTz1PV6USy
	JZ8h7tBpy5g24aPj3sCzNUeceW1xLJ/tla4ny5iIDbRa9vNeKxD8gT8ILh5bZGDuUOSvbQ1/GOK
	nxufdPoOGyGWG6GeVBv2Ld8FU1QiDRlhcxMreIgCyzlmUIsBMwXMhVWJGx5aBgxm3HcZjnYIiT+
	fp8aMdiZXqA1K4kxKC2sG0YByfq0Whxhq62PcBNG7v5NhFpIN4mGfJcJ0cv/JIMSMOLPJerP7g5
	AYEtSu2WZbqciboyvYhbTATnRNyOEO/0NV++usbtEICwo54g9+5P/IW7mIWF0Eq0KHB2GAXmFLn
	mpq2F8cZy7DFjZJKhdCXK9SvxeRRk0bB/J9WcNR0lRkvCOIxvfleDFpGjNnXsZHmX5SKJBBNiSI
	ZBk5q2ve587stKPDWdtqyP96y9o2jFJI9vOV/uQ==
X-Received: by 2002:a05:6512:31cf:b0:5bf:b96b:bce6 with SMTP id 2adb3069b0e04-5bfd94ccb81mr96046e87.0.1793311600012;
        Thu, 29 Oct 2026 15:06:40 -0700 (PDT)
Received: from yantra.. (nekmmqtmquaao4qwdoc-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:6842:e549:8c95:f73c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfd9c507adsm9605e87.65.2026.10.29.15.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:06:38 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rupesh Majhi <zoone.rupert@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 1/3] iio: pressure: dps310: reject a zero rate or oversampling ratio
Date: Fri, 30 Oct 2026 00:06:33 +0200
Message-ID: <20261029220635.18816-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029220635.18816-1-zoone.rupert@gmail.com>
References: <20261029220635.18816-1-zoone.rupert@gmail.com>
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

The rate and ratio setters accept 0, which also covers 0.5. ilog2(0)
gives -1, which masked into the register is 128 Hz or the reserved
precision 0b1111. The latter makes every pressure read fail with
-ERANGE and temperature read 974 degrees C.

Reject values below 1.

Fixes: ba6ec48e76bc ("iio: Add driver for Infineon DPS310")
Fixes: d711a3c7dc82 ("iio: dps310: Add pressure sensing capability")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260921183132.233136-1-zoone.rupert%40gmail.com
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

 drivers/iio/pressure/dps310.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 71053f4463e5..b6aa5dbe2bcd 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -410,7 +410,7 @@ static int dps310_set_pres_precision(struct dps310_data *data, int val)
 	int rc;
 	u8 shift_en;
 
-	if (val < 0 || val > 128)
+	if (val < 1 || val > 128)
 		return -EINVAL;
 
 	shift_en = val >= 16 ? DPS310_PRS_SHIFT_EN : 0;
@@ -433,7 +433,7 @@ static int dps310_set_temp_precision(struct dps310_data *data, int val)
 	int rc;
 	u8 shift_en;
 
-	if (val < 0 || val > 128)
+	if (val < 1 || val > 128)
 		return -EINVAL;
 
 	shift_en = val >= 16 ? DPS310_TMP_SHIFT_EN : 0;
@@ -455,7 +455,7 @@ static int dps310_set_pres_samp_freq(struct dps310_data *data, int freq)
 {
 	u8 val;
 
-	if (freq < 0 || freq > 128)
+	if (freq < 1 || freq > 128)
 		return -EINVAL;
 
 	val = ilog2(freq) << 4;
@@ -469,7 +469,7 @@ static int dps310_set_temp_samp_freq(struct dps310_data *data, int freq)
 {
 	u8 val;
 
-	if (freq < 0 || freq > 128)
+	if (freq < 1 || freq > 128)
 		return -EINVAL;
 
 	val = ilog2(freq) << 4;
-- 
2.43.0

