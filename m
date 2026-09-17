Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48FE4AAC6C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636583; cv=none; b=TKMaJ1S8HM1ggJu7ZaMKeYazCvdtlExbGVmvca+4WInRioBL86L+Cf3IlvpdrD39GdVciONFa4F/YYKra/zb3/JwrKBL4+e52vRTmtHkw8xdtJD3fKqQ0lPfG8qBhLpqC8N1z7rp80geFTevKQW8PkzWDUxt6or3knSMu+naf+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636583; c=relaxed/simple;
	bh=R+nm9Wa+FeFv7xcNwmA/+Lk3Rork6TWTL3tbsr1nRXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SCdeoqwx74s+k0r3mYDmmF8ZTwsvvzQeVfZhKyNNzQkmnEZKdy1IuivLyazmzNpeI9BDK4++NsA7/Ygi/Bw/LoRGL1oSRhaB/MFCtAlTW7g00K1rPW4pzfgCwb83ZN7pFsEsk0bWjjRfXGzTMFLu33CMLuqzvdf1mwK4uyTYPnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDjMeTiW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDjMeTiW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so7980165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789636579; x=1790241379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=09UW21Y8Ldpo1k4QvWzXYRCxILCDr/EkzcXOvORWXRM=;
        b=rDjMeTiW9DTIcihM2qdFZBUADOYosvEKnBeUeRX8BMamJ1Fqyrc8Zo1zCd4N70BhGM
         +yVpXVjzwFa83HqZP0JTNOEBl1EyQZlATkTUt5sMKAzanhTsctFdmUvTwa82akJg+ZuN
         LhsFzCHkrEwt+OZd957rW+sxfOAogcE7sT2z0YAB65sumOaeMFAf3dzDUqG4JHlIORDS
         yRuoq6CqaGn3D1asFqaWB/Qwt+0ROJb6/Koscr1m5f3Q7hiPLT66jbGAG7SR5zB8Xn1b
         t4d70c3P/pDUd1x7C8fxdS+3xodx2Qa4Hs1VtVxsGsPm8c5Dsw5DbmkEM+qidPVv5pOF
         Kg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636579; x=1790241379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09UW21Y8Ldpo1k4QvWzXYRCxILCDr/EkzcXOvORWXRM=;
        b=fDgO6R562VbqtjLOmp08AZGmMnctVPPNeVLHksGIsmYpZHHeWNMukVGK4gGUA5p0Kq
         ytiOKeXjrmLkCEVpEaOPNQp+0uLJ6p5mXSvbXLPF+tATxbs2TS/HGAqGZd2cWP3coglr
         ZqEiD0QN5ePfQRPsDLipt6qgySGChY6rDk0o+b/8S9jAcGHBv3qlNNeSTzVqt7izs9uc
         jjoXeOAw9fwhqxmcB1zQ2HHRPwdidrXJR4HoiO8jGWVQ2IITybBkizq3FZC9uOuEksx5
         JI7Pl6RHYWkVZJutkeJMcKriYRWrFP2zS1XzK521PLbOTIRNOxtf8g3gyuqSQ/9q9cIx
         zp5A==
X-Forwarded-Encrypted: i=1; AKwUvBwKShjIJT2gRd5O6gU5W9PQcWBZdK2j8cooTTFOi2xP2u49Z/rOuIxEIqc5EYGputLEUs1cPgy9piWxZ3E=@vger.kernel.org
X-Gm-Message-State: AFuF++lE1tYVUCXOe/IKh4ALF1TxjxOeISkrLAGKudHt6nu1cKtSaVLv
	a3f+gmm3qylBMhPZ7fDQZv4K6B/3n/y5HWKy+3leRwOo5qtdewLydRM8
X-Gm-Gg: AYBFou1iaDa8pusZITKytTKy0GqG4EouIed8DYFVYArYR90apzQDxenTl6ga0oGrAKE
	wuYxmtfBLMTgUQ7AuQmndQb0+JyA1QJWkI5I2npu0KtK1BI8FqbIDdkGl3nQLOgrh8dkGSId98w
	KA9XZ5DX7WOzI2j+dgad4K2d/p9lIZwyXq+r/bclQCRg9fDjWVwCkC2mroJEeyH9UlyMtkBOkVo
	Y1vSP+ONJT+t5ELaurdPZep9WWVEefSFJVB2ekJ/XqMWJNiIB0uBvWbejvzvxpxD1ocq6h4qgot
	9SHWa/jjk79DXOBvH7nNRjkQ36bBHf0sZfSPNeP+WsfjFJOeg4i5dt4tMTiacm6DIlrXgF0tYY6
	/EcFVM2Fj4IQ51+xAyZ24VJ+oQiSpbUcLNv7bW2caedpUBBhA5q9HsYXMVQtc1lN2VXrtDkUwVu
	Bvmxxdv14Gu3mZb8cNQNxULrgMbQPScaLzcPVgnrIALU2ryvWsX6Ytu2wegKagixExZLutUd/vs
	AmYCeo8V4WW8WOo0E2FaCI=
X-Received: by 2002:a05:600c:548f:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-49ec0543ce6mr70867275e9.31.1789636578480;
        Thu, 17 Sep 2026 02:16:18 -0700 (PDT)
Received: from localhost.localdomain ([196.235.229.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24774esm96082595e9.10.2026.09.17.02.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:16:17 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH v2] iio: temperature: tsys02d: Fix state desynchronization on resolution write error
Date: Thu, 17 Sep 2026 10:16:08 +0100
Message-ID: <20260917091609.626043-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In tsys02d_write_raw(), dev_data->res_index is updated before checking
the return value of ms_sensors_write_resolution(). If the hardware I2C
write operation fails, dev_data->res_index remains updated with the
new index despite the physical sensor remaining in its previous state.

This leads to a state desynchronization where subsequent reads via
tsys02d_read_raw() return an incorrect sampling frequency.

Fix this by handling the error path first, updating dev_data->res_index
only on success, and using guard(mutex) to clean up locking.

This was found through manual code review.

Fixes: 53bf4d067d51 ("Add tsys02d meas-spec driver support")
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
v1 -> v2:
 - Use error-first pattern (if (ret) return ret) instead of if (!ret).
 - Use guard(mutex) for clean locking and simplified return path.
 - Add note stating the issue was found through manual code review.
 - Add proper blank lines.

 drivers/iio/temperature/tsys02d.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/temperature/tsys02d.c b/drivers/iio/temperature/tsys02d.c
index 3ef72347456e..20f67134affd 100644
--- a/drivers/iio/temperature/tsys02d.c
+++ b/drivers/iio/temperature/tsys02d.c
@@ -72,12 +72,14 @@ static int tsys02d_write_raw(struct iio_dev *indio_dev,
 				break;
 		if (i < 0)
 			return -EINVAL;
-		mutex_lock(&dev_data->lock);
-		dev_data->res_index = i;
+
+		guard(mutex)(&dev_data->lock);
+
 		ret = ms_sensors_write_resolution(dev_data, i);
-		mutex_unlock(&dev_data->lock);
+		if (ret)
+			return ret;
 
-		return ret;
+		dev_data->res_index = i;
 	default:
 		return -EINVAL;
 	}
-- 
2.43.0

