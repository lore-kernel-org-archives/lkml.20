Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784804F30FD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867700; cv=none; b=Ebpfydbjk1hgGgplb38m7TIgEVGcLumDGUOL9ddYRt4iuObznA8M3TIwkdfUSU214S8SNAF2dxEiTAQlO34UKptl3evT9zOHolHT5EWfC1+0a0DlQHREbxObfUDlCtNLuyrTEde4+Al/zIy1bcUI++P+uUT7DmDplHwODv+Kz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867700; c=relaxed/simple;
	bh=JEriB6GDjlcrCUa78TKwGOGGWVkUgVsCS1pUbwbx7n8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ekWykrd9e3fN+gruqiOjamvLLq5b/mCo/2YWZ+wxfofuSkfmnSKVTCDYI4d7PQWl6weNJv63q1QJi8lcNzJyRZEDhyvgusiqeE0tYzveoVog6OvcUklqAFnyVQbxNtbMlTQwhv8bPejGOvW7F2GnyJgUUmtrLj2CdNqKuY0mmVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lR3I+aF3; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lR3I+aF3"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so8082378a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788867692; x=1789472492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=geWMNX1K6rx9sqL3rAvPz4Otwn4ZznXQlhtRu8yNQXQ=;
        b=lR3I+aF3JKqFWmZq7/dZzhbQmd1vFF/b02TxJz5tfP4Tvm8OokaTHNqKVom4tnGf33
         21XxReeSPgCvtuIwaXSBzXddEWexpY26rH0+o08xcg7trZpb0ZNmXg9C0W520QTNdDFI
         IUxTYyppQX6f5KWLqnspucJy5rFe1Kro52kI4aStsfnVh5PZvacINOMO7MPUyRRC5sNE
         mMdB+o3g/ftfUInN2FahS12Sp3NY70sJqRqMmzbbS+lc9uVEzjCDeamWyq+rcEpqVDUr
         9Yxf+cOGtx5e85c16ucFPAfQD7Bv7uqbbHBqqcuPsaKEpUGGzghZvEsiD4PZbebqZpk6
         I7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788867692; x=1789472492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geWMNX1K6rx9sqL3rAvPz4Otwn4ZznXQlhtRu8yNQXQ=;
        b=NO7YlWDbVKGY7O+7Kko2A6Wx0gFNquiw+cG0QGqVeXyiEunDhMoSoZT20td4rqYXoI
         8FDmkDBeMWKutOVurMCnaumBhlyzww55kUZsp+hkMG7B4UIZ7DLRhjlVvEENMPI6O4/g
         hOxhO01sJRSY260DpaPz55THc9dAZjMp/FoOCSwXI8l1KASk7tvGLbzGMSiZpYyttuB2
         qtfc5xI9VkW22TpefCVO5jq9uqKEAUVwoZDXJdmSrCnBapwkFgUGCumyoN7UrpTEYvrS
         960VbIomORRb2pBSjVaS4NyGajiLE2F9H9eFiYTJbrCEj4fisUVv9/l5HSFsOW+2ZVeO
         I9uw==
X-Forwarded-Encrypted: i=1; AKwUvBwVNi6hdMezSr374TzgEOM2t1nX0zs34AF49eqXTy8j3SV12xBdTy/K6hBN8Ju50j3SCDm8q5vcbEtJmXI=@vger.kernel.org
X-Gm-Message-State: AFuF++ltS0M/jVIT3IR6IbSdqQ+Llg8AjZepARSp7ajQZ8RnWOKKRnuO
	2d27A2oO88i3J/IinnjEjZl9I4ySsyHqq5+7TKbjV5T5fIh8BQOr0GF4
X-Gm-Gg: AYBFou3t8Egr0+sjBjKQ9KIbbah6QZ3okplEsglnGrUfBJR+aV+86K5T6pMyIK9jVUD
	wVh+B99fLSa0eVuKwRVPh9EjKImwjn4vnIAisaYutjjTz0wex3Kr11btD1CWaum9fXEVMYXoERF
	XV5l9u83akFgHNFDHBEnX8sF1LP+qZ9517ZiqyAGiIfYeXTGgEUCCI+skwnDc7FN6Ku8lSNEDMA
	K3ynNHEya5ioWoFcT/qw1W9xwx9aaPact/J9sq9mg4SfDYJcXMI+PfQP5NUxxR8Qg+sL6KV/U8c
	sYUmLM47/ajWNApmnbbCuCYDghXpL6yVxnJVocGkWK0CIZp63UnwzoizgZmphOJtKVwdZ/qCSn1
	3rXJKA6U7upu3Dx55TwcW8FgH8y4PY81OHHMjLULgF9hKTilz6q9SuhlkG5gAV89FRTscIRuHl0
	g7PFWPxiHQ4WF8bfYzMLduroCIwFSwUhHRh3mYQ2KC3d+qXnL5CNtYwbPt2WblmwKbP/BdjMHHo
	HXf8XLO01v8yy2757oxslcH16KqDAuyscbKXwkyANtvWewqs9k4WMGNvkSp0W4RiDrehAns3o82
	k1wXSoUo+7msMQYVO1eNLhPNh2bEyrcJAAEeT8xHoZA8C+4JtCFPrND4Q8S7pGOnv6JhWr/uJQg
	UBzRjJ04+kKvnOJQM8XgYE2TxITaZE/ibSTAn1hEckkUC4Z3yDENRVhaxePjQ9DvgVgUxDZdQG0
	wUAPykh3Wysfogul1QpGBAM/rXpkjzFegZ6x44cTer2ItSX0xFGcHAeI7YnTL33R40/TNs6jnQ
X-Received: by 2002:a05:6402:4050:10b0:6a6:92d6:daad with SMTP id 4fb4d7f45d1cf-6a696a98b4emr9152785a12.10.1788867692285;
        Tue, 08 Sep 2026 04:41:32 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (209.47.7.34.bc.googleusercontent.com. [34.7.47.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6beesm5530489a12.8.2026.09.08.04.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:41:31 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kim Seer Paller <kimseer.paller@analog.com>,
	Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] iio: adc: max14001: add missing MODULE_DEVICE_TABLE macro
Date: Tue,  8 Sep 2026 11:40:47 +0000
Message-ID: <20260908114047.1360-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX14001 has an SPI ID table, but is missing a MODULE_DEVICE_TABLE()
macro.

Add the missing macro.

Fixes: 59795109fa67 ("iio: adc: max14001: New driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/adc/max14001.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/max14001.c b/drivers/iio/adc/max14001.c
index 58adeac62dde..7694fbb6a9fd 100644
--- a/drivers/iio/adc/max14001.c
+++ b/drivers/iio/adc/max14001.c
@@ -366,6 +366,7 @@ static const struct spi_device_id max14001_id_table[] = {
 	{ .name = "max14002", .driver_data = (kernel_ulong_t)&max14002_chip_info },
 	{ }
 };
+MODULE_DEVICE_TABLE(spi, max14001_id_table);
 
 static const struct of_device_id max14001_of_match[] = {
 	{ .compatible = "adi,max14001", .data = &max14001_chip_info },
-- 
2.47.3

