Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528735;
	b=T7aukvIBVc651C2u9NcIbjlFdVr5YrJurSs/OmXiVCw5Wvd6izjlkMquuAc8J85+/5jG
	 8to11u6MtvWve/g8yuqpjOYhfukxPx2AWz5zMKF8Xujxc/o6b4QdxL933PdMrWzzUoMkZ
	 seq9nuEBocMhov7onipm8c7DOEFaMt5z9LbVZvHLxKnpE2dlnCfLAsMsIDrWWAXoABrDv
	 wtesbI+KZSnbfI/rV8T5hFMOrxsOkPkUQglTL9YCoUGGXQChMEFJR8oJSMdVSFUfkbs/k
	 dcJU4X6JT9HW5dIGdKTfr0ayI27gcOy9iVhUV9JUJlUNVKg4twej5jbRp5NOoqPrbEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Yz41EgmzVHT2TrkuGKMcash2HLmMxiz4Mrz1ARsoS3s=;
	b=hE+p8ToA8DvjDPJo7FRsJnKJggOv4AZ0E+hszpZH2MA4olpvVQ0zzcSEsbHJBRNnv6uG
	 SmMngBjvhvg1w4ZL76ghkjtTHL6prJ3gBGPB+MTn5GgQ3EGlWQx/tl5lTkpcXVdv7GDgb
	 i+E2lsU26IVIeY9qr0miSyEYqmJZ9nIo+W+KCapqaGr7VozAz3creQprPZXf8/ZrK0hYE
	 sZSzjpx5gjj5DVA56WqhZ7+jkDTgF0mn2VubTv3+8bEHJoOKC47Gxtn21QHvyGyM+qwem
	 TPceRS1S/PlXb2tMPtH4lb5DSrwQDshm+/BtrOFJRI9Z5ueejdUyyWM3f2h1Imjg9gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AB9JOhXl;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A0E606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A0E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AB9JOhXl
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2429967c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793528734; x=1794133534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yz41EgmzVHT2TrkuGKMcash2HLmMxiz4Mrz1ARsoS3s=;
        b=AB9JOhXlSGRcFDVt+Qse3eeEne4tv+2gZSTmaaeOVZoUVjvQ+dd0ieJhkSwZ+bOT6r
         4KFuyQX4M2z3OLCfuaR7UkeOLSl3cHkiDDDK4u/3Wfqcbvn73RMRmCY81TaaKW2RN9WC
         hDK+3cnfsxUYFBhDHOu0FpeMWUSyNgGNhRubpG7L7hQ58a5w8CROVRqVwb02HawN0UGO
         vW7RlNIyYAlw/Y1uI5sDnAhZdOddYcqi1Kr6e87TncMt/8SSZujv598hkUCo3HCMu4rh
         oJaq8xN+xbuZ1k7uj3DQFthP2vJbM14ELW6+yIIVukJLo9P/qfaTeOrXTumjNVRa3CHi
         dNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793528734; x=1794133534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yz41EgmzVHT2TrkuGKMcash2HLmMxiz4Mrz1ARsoS3s=;
        b=FJ4vgMAgFU42vJoWQT+OEpqnxEBWzB0YPg/k4o59ndMI4HAttAkEqsop40gBu1JvI+
         zvl64IB6EhERk3X1uBrY96K53j4pIq8+NnCb6RCUG842x2wxnvcKCOrYwNNEpngGr3aJ
         fdFZ7rxITa2tunxYoHI809cH5dK7B3koXaFEWc8hEO82txzrqIScSJfN3aGNibovoJFO
         vMzGvxBZNMX5hlnYipq8whArio+V3OOjQhZ9zbzkp62Ppc//nTb+FVcgWNjG7nSa6YAX
         LKS+vjMAQ66jL6cNvrJNWszY85mVbYpMWlP83PzNWduN1xzK8VTBTykHboW7MhJ48+HF
         GD4g==
X-Forwarded-Encrypted: i=1; AKwUvBzGgTH4Vc5L+HLA0eWL2YQkN0p+s8TCo93374A4APGrgiYO3KAoNJjmBwZVwNJIOqIKvdN7vWIjRRI0Nlk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiQlUFqO/fQN+gy262NrK9xV723YP8Od5owx3/1+ca538MEXaU
	3IFKKDAXA/+6U7wxo2IxyZGTYokVDWP0oo5+KS+gqLVJhnPGK2b0Em+/lKLIoA3/mgCHCw==
X-Gm-Gg: AYBFou3iAVpWxcBIC6u1o+WEkpplVSiAIxQAsDGkEPEjvevBmgE54RTSGhz7QZYz54Q
	B3E/wfeTHtoppprmTI0eg6dkUqLC7BYrhxd071+ageBIIo/TWYRMxUUeBaY1O46SFNeCd5cNj7Q
	3C1QBitI8yQve/PEjGNrrPuEY9GnEWoF9+yLPixWaHp6l+/7Uw1scRIG8xZxeVdJGDl13JzbAWk
	/s0EfsPivifWIgu5YqssjAhu8ATkrwUehvdseVSdUrnwpnQq5cgGWqFsL3ojwpCQCPiYIiZfkM2
	t+ITNdR3q+FAVcUBUAZEq+zRAlMk+30tv1XRtI39UPPwPnZHTfi9BN0q2K7EEGPTTmFOxgadYrn
	IouuFZLYL034DrIzsL4EZ4pjres+A0TI1+TgglItMSdLsGOS+2eXZqixB8Ub3qZxI+RwIcZKe3V
	xDQoiU+hSs4pUhVth459Npi+FwSnjlsgN8/dib8st4ZEGXz3cMFfl6W8oPqc+73URiUng7HEzNZ
	P/NrgbC+f8R3K9tBmwqt1adlGrB1FjTbbsqKTYdvSt15RxxdcAb+WRC0yj6G/dBbDv8ygl3LgZd
	dlsM7Liu5V2dZJbhuN7Mdo/xDS8uQ381GATm8l2jBQbyEutB4WvisP3l2jDUxGOMlP3rpT/LSsC
	ukRgAWCc2YZbPY5kfy89Sqje6k0TwmVfaRBnw+XGODNRup0MP434yVa2ocDT2XqrUJl3J9lr6Vy
	a2g6VSHo1qsC9uJ4R6zUekyCvzkDIugYV0ULnRq/YUfw==
X-Received: by 2002:a05:7022:68f:b0:169:3706:d61b with SMTP id a92af1059eb24-1ac5bbba040mr14277811c88.16.1793528733897;
        Sun, 01 Nov 2026 02:25:33 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm6767163c88.9.2026.11.01.02.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:25:33 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v4 1/3] iio: proximity: sx9310: keep the IRQ balanced across suspend and resume
Date: Sun,  1 Nov 2026 15:55:02 +0530
Message-ID: <20261101102518.22757-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101102518.22757-1-kapoorarnav43@gmail.com>
References: <20261101102518.22757-1-kapoorarnav43@gmail.com>
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

sx9310_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9310_resume() also
returns without enabling it on error.

Make the two mirror images: disable the interrupt as the last step of
suspend and enable it as the first step of resume, before anything can
fail. The driver works without an interrupt line, so skip both calls
when client->irq is 0, as sx_common already does.

Fixes: 72ad02b15d63 ("iio: Add SEMTECH SX9310/9311 sensor driver")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9310.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 79ba46d8a0aa..373037ca67d1 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -943,8 +943,6 @@ static int sx9310_suspend(struct device *dev)
 	u8 ctrl0;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
 	ret = regmap_read(data->regmap, SX9310_REG_PROX_CTRL0,
 			  &data->suspend_ctrl);
@@ -956,27 +954,33 @@ static int sx9310_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return regmap_write(data->regmap, SX9310_REG_PAUSE, 0);
+	ret = regmap_write(data->regmap, SX9310_REG_PAUSE, 0);
+	if (ret)
+		return ret;
+
+	/* Last, as resume isn't called if suspend fails. */
+	if (data->client->irq)
+		disable_irq_nosync(data->client->irq);
+
+	return 0;
 }
 
 static int sx9310_resume(struct device *dev)
 {
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
+	struct regmap *map = data->regmap;
 	int ret;
 
-	scoped_guard(mutex, &data->mutex) {
-		ret = regmap_write(data->regmap, SX9310_REG_PAUSE, 1);
-		if (ret)
-			return ret;
+	if (data->client->irq)
+		enable_irq(data->client->irq);
 
-		ret = regmap_write(data->regmap, SX9310_REG_PROX_CTRL0,
-				   data->suspend_ctrl);
-		if (ret)
-			return ret;
-	}
+	guard(mutex)(&data->mutex);
 
-	enable_irq(data->client->irq);
-	return 0;
+	ret = regmap_write(map, SX9310_REG_PAUSE, 1);
+	if (ret)
+		return ret;
+
+	return regmap_write(map, SX9310_REG_PROX_CTRL0, data->suspend_ctrl);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9310_pm_ops, sx9310_suspend, sx9310_resume);
-- 
2.53.0

