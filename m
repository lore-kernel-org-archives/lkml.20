Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695444;
	b=tDRrVN0jCAUeNgNoMqiqXoohpeFcujunDKGVIOAI2NGkAV9d3KpYFiIHECq+9U82CK+g
	 x1TzXna+8HpuCQlex3rJDRqcyPinzwFpbFOjIP4AnTsvMDO20a6e6rH2+ORyY0muwj5Oq
	 oaKngBWnCb7FB/7VQnfFtq4hxSiWP1trbE4ydJt1IqpO6Y9QiC7P//oDIvwAWVv3qGx+T
	 HdlPA+hO8lC/lzcqxfWhsim/HxPLlk3FC+oDWBsea32gHKKQDF63d/+nCizvwUe1OIzKh
	 aaZDSDTyAeaLKfqWRX0jRrx8Dc+uru/DIyHbgMNy2d+TVbwsa8uwJrpY9rtjFuzEd6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=B+tKf5vPrDaOI5M5gTd4aFyXjI3r/OLdMYL4js+XQMM=;
	b=v2gTKKbHgnkRHvuZdUd1OYkeaCTG3hsydPLZJXrz0SjdD+MCRpfpHZ5nNzZEjS8My5rL
	 9/MHkbEP8s0ULlpWwb4/ZjGSgHHtxpbLK+1IgUMXuTU2Og6x5VTa1gAKyGuK6MezM0AP7
	 kfwWhQ5ZPq62UMUSrqTRPFwsP+ilTrT57tnHnBuP1NtGrAsRHs7Xc5Be66vbN8ja+faiV
	 pjecAxlEJQ+jSYeOqLeyToBxKUk2EGtK0QUbEyyvQ3qua1LpK0tEaODEP4uuPrZEw2Hbq
	 /draJ/XGvTbwbGZYOppJac2JjkRjzgZBJqLZuhQvsnXeHOimh9ZNFB6gB4BPrda7sbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JhF3R41P;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97DA606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B97DA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JhF3R41P
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d885929so76873f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695442; x=1793300242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+tKf5vPrDaOI5M5gTd4aFyXjI3r/OLdMYL4js+XQMM=;
        b=JhF3R41PjqwKSr1lg/42wT8Y1W9wsEw7F4bwvaCKdgAPFAm7nuF3Qp5VwD1i0e6Lvz
         46iCq/AZ5SV+4NYXeVjmRh4t/hbRc+t7L9JeAkL+HOFfNPGfDwHgfXZHET/lJ8uaAEM5
         fhFFmWL9iGrbElS+YhOs6u0C22xLqDRl4rZHIH796djk6SQ3NdCepwWrFTxGm35mU4R7
         +oxw85f96E2/yQ3Au8UwkQ6rLzHVsJB5/qgmQHnHCj6t4w3HK27rxHYH7Hy6ddTahREx
         QCQBHJ1KPKZWPseoFsqyH3X1cA16PQcd6VbFgnaickkzrmoqUcSgQU96Li3xv/LKLeh8
         V0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695442; x=1793300242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+tKf5vPrDaOI5M5gTd4aFyXjI3r/OLdMYL4js+XQMM=;
        b=tQLvf2uodzz59Wr9JrFDhdovMe1KRg/rUoAoU4QbC6Wh3GdT273ZYa3TxC1MmfHn1S
         ZXSpsunHo7UyZ9bnaqfWwA3Lg/VTEj5bvyFAye8vF1kiXJDDpXRhUE6+tzexDAO/eDaE
         3Ls1eZoAQXbwxHLkDvKyt5vRjRRnuGKNgPHNL139rfYeEaRie7VHkW0mwdswBV6TnSw6
         pxBCy4VtxZ4Qm3T8OPERh5OwYoi6RhTS2E33p1uIz5i5qiVcSN4Y093LtLhlW5ojyt8f
         kw7nZo0xayv1/oCK4+cBgM7Y4FHfKSzcGG1ruF51mAg7iMRlVD/LEHdDmqAtmOlTQTyZ
         PDIg==
X-Forwarded-Encrypted: i=1; AKwUvBwcN7/EL/mCP78YLt27UpM/Zkgi4+831A2p+vQGxFkDHXv46eXUq6QU1bp86AXpYlOq/sEIA2LZCYV4vq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK70KfI5PilvYcUPdEk59P22Y9JZYtv4PzI/6+PplXa4KQXjfhN
	pQJVfGQDxnkMhFVvn/EjCvXlAPBiGOUn0vfq8PfNMjcerwbxYrsjNuCgGw/000Teh0A=
X-Gm-Gg: AYBFou3b+Ko68qCiJ6jmgcPCZxxLwx0gtzdglsBiaK7YzFOEMWizEygGsHeT+DYbuGO
	sjESuz6d7v+ZI9pH3HNQsqTnsbLsMRJ9zsUyntiq29IC4Ognbx/ltn8jL6wRlHua+U98JMuhDiV
	XGZJrOrO0WuuHTbhci4720xUFhiPewzfdxYAceXxcOhzW37qp+p7cZKfEvDRB8VW1UDTZXq9D0P
	L9SSI4sHKH6G3N4LxpqJCIf+Wdm8C0qWCQSXPNe11YG3Bipr+uI9gPJlPOOpNws+CvsYBAZj9Ab
	5Z+fh8rFMD5sulekGsIZNjvG0/Rbcga4Vt+tEIG0wmwVxFHEWFfKcXELs1B6PN4WUCdAvRrNkze
	pKcV9iKdl/CuuCOBgazeuEJKBXJxT3ksWYXjQpZh6yqSIR+Zsw7JgQfrZzWEPryc10Mb1UOm0W7
	V9rKL+mYEkpT63fRaNB+WysVdOpzwri7BJRfieGjY/sTX899b3SaqajdXyOVfs1iFM6Oi0/9a3t
	FKY+AHMldGVU+BG5RtQafsUt2ggohri9yRyYJnAix9af3BescTj4w==
X-Received: by 2002:a05:6000:4b1d:b0:48e:cd3:b3da with SMTP id ffacd0b85a97d-48e2644f800mr12253638f8f.5.1792695441958;
        Thu, 22 Oct 2026 11:57:21 -0700 (PDT)
Received: from localhost ([2a02:8308:b092:fd00:d900:ff27:14a1:f032])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37a0f66dsm150275f8f.53.2026.10.22.11.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:57:21 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
Date: Thu, 22 Oct 2026 20:56:42 +0200
Subject: [PATCH v4 3/4] iio: light: tsl2591: report saturation
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-first-patch-v4-3-90b2fc6e8e28@mycroftmind.com>
References: <20261022-first-patch-v4-0-90b2fc6e8e28@mycroftmind.com>
In-Reply-To: <20261022-first-patch-v4-0-90b2fc6e8e28@mycroftmind.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Joe Sandom <joe.g.sandom@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jan Remes <jan.remes@mycroftmind.com>, Jonathan Cameron <jic23@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.16.0

From: Jan Remes <jan.remes@mycroftmind.com>

When the TSL2591 sensor is saturated, it reports its maximum value
(specific one for 100ms integration time, UINT16_MAX otherwise).

When either raw channel becomes saturated, return -EOVERFLOW (like
as73211 and si1133 do) instead of calculating an invalid number when
reading 'in_illuminance_input'. Keep existing behavior on raw channels.

Note: Datasheet versions differ in the saturation number for 100ms. Old
2013 datasheet lists it as 37888, newer versions say 36863. Use the new
value although the hardware can report up to 37888.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Jan Remes <jan.remes@mycroftmind.com>
---
 drivers/iio/light/tsl2591.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/light/tsl2591.c b/drivers/iio/light/tsl2591.c
index 8cfce720efb9..e3092ae77a11 100644
--- a/drivers/iio/light/tsl2591.c
+++ b/drivers/iio/light/tsl2591.c
@@ -139,7 +139,9 @@
 
 /* TSL2591 maximum values */
 #define TSL2591_MAX_ALS_INT_TIME_MS    600
+/* Maximal values per datasheet [v3-00] 2023-Feb-08 */
 #define TSL2591_ALS_MAX_VALUE	       (BIT(16) - 1)
+#define TSL2591_ALS_MAX_VALUE_100MS    36863
 
 /*
  * LUX calculations;
@@ -379,7 +381,7 @@ static int tsl2591_read_channel_data(struct iio_dev *indio_dev,
 	struct i2c_client *client = chip->client;
 	u8 als_data[TSL2591_NUM_DATA_REGISTERS];
 	int int_time_fval, gain_multi;
-	u16 als_ch0, als_ch1;
+	u16 als_ch0, als_ch1, als_max;
 	u64 lux;
 	u32 rem;
 	int ret;
@@ -417,6 +419,14 @@ static int tsl2591_read_channel_data(struct iio_dev *indio_dev,
 			return gain_multi;
 		}
 
+		/* Check for overflow; special case for 100ms integration time */
+		als_max = TSL2591_ALS_MAX_VALUE;
+		if (settings->als_int_time == TSL2591_CTRL_ALS_INTEGRATION_100MS)
+			als_max = TSL2591_ALS_MAX_VALUE_100MS;
+
+		if (als_ch0 >= als_max || als_ch1 >= als_max)
+			return -EOVERFLOW;
+
 		/* No visible light, this also catches C0DATA == 0 */
 		if (als_ch0 <= als_ch1) {
 			*val = 0;

-- 
2.53.0

