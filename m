Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168932;
	b=mp2vmjm4G6NCGJ+CQDyTWlfxo9mFeJoh5YAdz6WbkcrBMICVuUlDCZ9TpRvgCPYzdupY
	 fiwNe5tLv9w1rACXRGRkFgtbMz7N0j6Vn4ET/OiwKgjNmgjDpWrD3YwVRNYM3G+0QehB1
	 YPUDiA0ujUrJ0HCZQ/bPrjlvquLHfF+mgioGevoV7h1/kza30f9nL1/TzCTdJTg9E2zTz
	 UUTP8mM/6BdYU5o1biHScf9s1Ssukr1kCT9Ll8/xE0C2yfwCkeN2pozMUB2e5eCya7dL7
	 oUasGbUqr5mYeXcvQxUfGv5o8Ni1smwm98iiyNiA1FBKWiuGhrG2bIFd6ZIc2lAJ0rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mwMelPe2uptqUBkelQM2Ts74WNYc83eK9MED/jsQkHU=;
	b=Xm0umrAzpGL4JAUT5/GodR+aSKxlrI8G9uYPgctIzcO2Nw1K93/GU0NW7nyOvTegfKPv
	 jG45AusB1fjQiA1u5qpjccH0YPOyfSf4kVpNemG3PcBki4SaYXZghsd1DtSShp+pMUmEU
	 hQtKDhNMPcQj5qKM9NN46BHkhrUeKbD6IXWXRARJM9IW5iropnph+b60kI9Byso6f5AVY
	 El9ofXCH39F6msbuZ/3QbEUSY9JqYsqyWj4YX2UUifAZZgo3VxhkCyjttWaL0NMWNerZ8
	 R5tfcVO8eijRb5C7c8Sw0JsMThuU2xg1VZjb971wk4aL4rUS0SBJith+qrkgdBYwZ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T3XYe+DJ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ADD606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46ADD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T3XYe+DJ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so207679f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794168929; x=1794773729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwMelPe2uptqUBkelQM2Ts74WNYc83eK9MED/jsQkHU=;
        b=T3XYe+DJ0ow+8/m5Nfkgc6YJZbcr6JXmCQE7X8NBAT4JUfoIP935lMDv0qqa13Uh23
         w9N5pfUc4PNrMoYon5Dj/dh2x7ffGjyCw0VwRSKH+s1grA06t/M3Bi4qSqCoqFsGPKxr
         DfIf9fYUzB5cVtktzxzM6WtP4yRi6lZ32B3HkyzFy8sT16YrS+LPXRLqJ/jJg1yf0MP1
         e/Wlh1eDEIKGJ0PxJXc8YnqnDz6tySknzt5XL9K7M34pr2oeMk+YYyNjqIQoOzYwJkO/
         cav0C53OnF8qWIHgShirvJR+X31IeGjzipeIu9n2lGhbUHUi9EHh1vIYnqGTChDP+957
         fTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794168929; x=1794773729;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mwMelPe2uptqUBkelQM2Ts74WNYc83eK9MED/jsQkHU=;
        b=ghlNZOlGg2qM1X0TufeMadGlEqlbQE+GDu4QDjOiBupVbBGaQIWogcP5YorkcZZ6ni
         wb4VaTOGF1jucKllfcFFADmpp3QoAPejP7F0sqGontpyYSJSJbhtfe9pJ2zkmFVP+G/5
         L0oc9KWqEAazR+Ml3nTG2ttVEY8YFkT1gp8Osv1DmipTXHl41Xe5zkmphz8ZVNenam5j
         5u8eCUu+3SKsE+jhshSFTgb6RygZcN02MW0AjY4XeLj6F3NkghGtyPUVsmW7+vlzX9np
         fzhSep0jUDij3X2bi01SHFDGYY0kXzIdJS1jdNWE/S8AVRILLUH/8sa/PyTKlDtO/XXM
         gjQg==
X-Forwarded-Encrypted: i=1; AL+hErEnOxWcuEa/7ibksgVaxOTGtKWXItJgjPl8/A8GUrGfJ62109UXgiSKfO2eciK2W7J5N7FEUNr5Wae756Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Uy2K4Vk4fkNQi/Npsa6Ne59fL8L297uGX95in7TvU4yKKpeMm
	sBkerszybHdqL5cyfWWcVAwAiHvANT8aWW841PfE6SOk+4Wu2xzPhXd+
X-Gm-Gg: AYBFou3HZkoh43KW67DfUWOzc7FvmnM51mLEk3R+OXu6Uj7+5GvBW3gyWmzGE5mXl08
	RwhrY+kIX1zh/0tBsaB4JDnCbs7SLBPJfrd2kRWPIwGWH3PlbWUrEY6UNaC7bPgLDJd89ZeaXRS
	cIIlEuuKDSS+cRPuXVnC4ojWPXcDFMWNdN74hZrpIElY5aLr+v9aFMSTzF3Va4j/Mz5hEZFGoec
	jqol+jNDjvJFtbqiqrJXquOOTG7NhwzOpU5FCmSQw1He+gEEKn5rAZWB7X0gYn2EYkSryDdvj0p
	G3eFY2gED2yJBpyTm1TkGz1vf1MqfvwcHpDGLsaNTYDD/1yXsE8Vrie/qBJ+ce991FaHrdvjX7t
	99l/Yp+bSNkv7+fWpHbsZU7fyRnPoXOs2rJe/TZQE81au2vAWK1ZmHS+UJIpySSCO0g3bI83AMf
	8LjO90nQLk1/rkLMd9KR1O4BYYSiSEKolxik5SSsnXVK0FlSEgwcjuvLxGWlLuCIBzA6JKONYNh
	jLTp/8azlMuURiKa4y2ilqqx92jg1lLthj2vzARTN3TaxoVSvIzsJZhj73Sc7uOzTN4E1WzVrx/
	e2WcAkjExKSYDprwQOlJd3eoKjbOJUHMuYBT1ueFgebMWtOJPlgZBTo=
X-Received: by 2002:a5d:588f:0:b0:48b:e50:714e with SMTP id ffacd0b85a97d-4958c3a134bmr4334789f8f.36.1794168929453;
        Sun, 08 Nov 2026 12:15:29 -0800 (PST)
Received: from legion.. ([5.43.81.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm6047077f8f.39.2026.11.08.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:15:29 -0800 (PST)
From: =?UTF-8?q?Adi=20Kadu=C5=A1i=C4=87?= <kadusicadi1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adi=20Kadu=C5=A1i=C4=87?= <kadusicadi1@gmail.com>
Subject: [PATCH v2] iio: adc: ad_sigma_delta: use __free(kfree) for temporary buffers
Date: Sun,  8 Nov 2026 21:15:22 +0100
Message-ID: <20261108201522.249539-1-kadusicadi1@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace manual kfree() calls with the __free(kfree) cleanup attribute.
No functional change.

Signed-off-by: Adi Kadušić <kadusicadi1@gmail.com>
---
Changes in v2:
- Keep reset_length/size declarations in ad_sd_reset() as they were,
  only declare buf with __free(kfree) at its allocation (Andy)

v1: https://lore.kernel.org/linux-iio/20261108013328.125069-1-kadusicadi1@gmail.com/T/#u

 drivers/iio/adc/ad_sigma_delta.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_delta.c
index 119ddc5a13e2..934c9965c69b 100644
--- a/drivers/iio/adc/ad_sigma_delta.c
+++ b/drivers/iio/adc/ad_sigma_delta.c
@@ -205,19 +205,15 @@ int ad_sd_reset(struct ad_sigma_delta *sigma_delta)
 {
 	unsigned int reset_length = sigma_delta->info->num_resetclks;
 	unsigned int size;
-	u8 *buf;
-	int ret;
 
 	size = BITS_TO_BYTES(reset_length);
-	buf = kcalloc(size, sizeof(*buf), GFP_KERNEL);
+	u8 *buf __free(kfree) = kcalloc(size, sizeof(*buf), GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	memset(buf, 0xff, size);
-	ret = spi_write(sigma_delta->spi, buf, size);
-	kfree(buf);
 
-	return ret;
+	return spi_write(sigma_delta->spi, buf, size);
 }
 EXPORT_SYMBOL_NS_GPL(ad_sd_reset, "IIO_AD_SIGMA_DELTA");
 
@@ -249,7 +245,6 @@ static int ad_sigma_delta_clear_pending_event(struct ad_sigma_delta *sigma_delta
 {
 	bool pending_event;
 	unsigned int data_read_len = BITS_TO_BYTES(sigma_delta->info->num_resetclks);
-	u8 *data;
 	struct spi_transfer t[] = {
 		{
 			.len = 1,
@@ -317,7 +312,7 @@ static int ad_sigma_delta_clear_pending_event(struct ad_sigma_delta *sigma_delta
 	 * shorter than the reset procedure.
 	 */
 
-	data = kzalloc(data_read_len + 1, GFP_KERNEL);
+	u8 *data __free(kfree) = kzalloc(data_read_len + 1, GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
@@ -340,11 +335,7 @@ static int ad_sigma_delta_clear_pending_event(struct ad_sigma_delta *sigma_delta
 	memset(data + 2, 0xff, data_read_len - 1);
 	spi_message_add_tail(&t[1], &m);
 
-	ret = spi_sync_locked(sigma_delta->spi, &m);
-
-	kfree(data);
-
-	return ret;
+	return spi_sync_locked(sigma_delta->spi, &m);
 }
 
 int ad_sd_calibrate(struct ad_sigma_delta *sigma_delta,
-- 
2.43.0

