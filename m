Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC148A2B1
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206435; cv=none; b=UpWAMPEEHv86DHtIwM+LTtUX5yy18IYFiNEsxrEqqymHR79nKp8mLWTxv7Uxbo+LMniNLax9ko/NS2CYTDz23KctbnQx1RdSI1fx3dAQwqXagfJoHNOTV2ZJC2hphC0PH1LQupQgcVv3e42PaT35NWxM3KJvkXTEBXDfLd1YiZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206435; c=relaxed/simple;
	bh=Wke9HpYj8rajyjDe/WQXo5QKw7B9i4Wf8sIf6ePyJhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mLM3+pCwNr7EU69Fwz7fXyWaS4O1RZXQOxTtPGoGHQ9qKVycgswrvuTnmXUweK8Vo0025S8Kusr7WoQXSuPXgRoi8/L8xtRUNSCp55HLvMJL0BAXU0i1tiMn/48qgUF1Bp1jsdC3GRoT7oQCiuBcy2a0ecxb9a3QcJGN1di9xyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCzyd0gG; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCzyd0gG"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so1066808f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791206418; x=1791811218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lxfXgU6J2Pe/OFfdHlqW2Qga6zf9kDBoyeMvz/c9QrU=;
        b=UCzyd0gGPYyZqf/DS/GyUvw4+uSbAldaDpDd50v/obcEsuOvmsqcKY4856nreHJfkf
         wyXFp1xDkhiSzCyXxfjI00Azh5pl1SPnHR0DliRbgjfHGcwnmMoXLY8TYW5LvvL09sCs
         RAaIkSwZTYjoDVUcr8LJqzrp+EOHmRCwpoNtaNnBnErQ1oomGe3ZBnPTgAxIBCfZ4GGe
         IooY2uP7hm0/pvhEWNWC6ZzImvplkMAyQsnQlkKVG+rYvwIcvbdtHNSlf8nKzvyqIcPj
         S2fjk41wx6R/t6e7sE4UjlltNi8ZrdCbEfJMzI1GhcopaNjkqH1vEnf5wrKctf0dVvRN
         2rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206418; x=1791811218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxfXgU6J2Pe/OFfdHlqW2Qga6zf9kDBoyeMvz/c9QrU=;
        b=SpDAQUO7w2tA8edmhOAzEGE/PLJ2qh3Xc7qTPMXH3W61bjc4VgCfDHBaYZuk4Cn/px
         edSI3Dlm3bq8Zjk2ocZdBds3aA2ifVzmwt7y1mHnsLU2iG4xO0g3YKLRBllDGq7MBOa+
         C11/IqDhO0NW6LG6vTKsenBHY2N35cigassDufGhvb2uCleq0StS/gZC9XuxuqmdfCri
         J27QKz5gVTVXQbA82YLsN1UA3ANMO8CgfhOi5kO+QTohPRaBebzbDLBYM8r6fZNGNh9/
         z2K8jh5FPZIBw1vb6oNEky1Ibw+Y1WMAGlYMs93Dvxo4OYRS89GkPgeAxzU7RsPxRS36
         efEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOYO/aqNStCIYXF2LxErbSuUowUfYZb1EsCB4mGUmzNIrvr0PFd5oxQg1hJgm7ObINh9YFkLuytv9thXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY97QRgIQBTcYEE7cjUjOIl8iaTkcqgy4if3uqQsfoHAYVVupG
	qfsSPwpzyQIkPzOXhpJgMB8fwJsjUk13FvaJkKVdTLF++m4BKuE17pRI
X-Gm-Gg: AYBFou0CwXF2cS7QhRk8OZyiRAAWW6/JczlajvyDc7YhzppryWcrX/aHsYHeTFVR0z/
	M5tEKen++Pqj5x05YAcxTBzyqZFP5OGnGYjjEW7I/O6FD68MBpE7+FHHAqF1AVZzz3FHU4lKZq+
	JvqmEfjHrmbV3Lo5S10J8qRPBM4PsOW27WSBq+5OAeZ+yCJ0tWbHZO+8fSBMvQqc6kgf9ez5FaF
	fTXqQKFXz1gR/Rv6GdIOyKhumvzHsPl+/NHQZMBuJkXK4UUeb6l/3qoOjNNDLraHjeWPVN8DSEP
	GO1O21sEVSh0eUCLiEfv2DvkJFhW3NHyQYjcdZIF6LIn56VvNz55VXBFfxQTUqbylDSF2iKHaQb
	vmof33YTzz2LztVNuR3O/rlcze8e1B8KcnnhGwXPJQxbuctfUiYkMiNTIkz8mbDfEzOG45RhwoF
	uL/R2ZZDmYoOf/6UVngJbd63eZZuAfnJLSog4Hsewd340EMesDlN7jl86cVYpHcrx5aeeI/fK/G
	IhEIiC99pGxAw==
X-Received: by 2002:a05:6000:290a:b0:48c:490a:3370 with SMTP id ffacd0b85a97d-48c490a4c95mr12518365f8f.8.1791206418219;
        Mon, 05 Oct 2026 06:20:18 -0700 (PDT)
Received: from localhost.localdomain ([196.235.239.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62290381sm3660017f8f.25.2026.10.05.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:20:16 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: joshua.crofts1@gmail.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH v3] iio: temperature: tsys02d: Fix state desynchronization on resolution write error
Date: Mon,  5 Oct 2026 14:20:02 +0100
Message-ID: <20261005132004.255462-1-salah.triki@gmail.com>
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
v2 -> v3:
 - Include <linux/cleanup.h>.
 - Enclose case block in scope brackets.
 - Add missing return 0 on success path to prevent falling through to
   default case.

v1 -> v2:
 - Use error-first pattern (if (ret) return ret) instead of if (!ret).
 - Use guard(mutex) for clean locking and simplified return path.
 - Add note stating the issue was found through manual code review.
 - Add proper blank lines.

 drivers/iio/temperature/tsys02d.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/temperature/tsys02d.c b/drivers/iio/temperature/tsys02d.c
index 2c67faebd90c..3dd33eb3c310 100644
--- a/drivers/iio/temperature/tsys02d.c
+++ b/drivers/iio/temperature/tsys02d.c
@@ -12,6 +12,7 @@
 
 #include <linux/array_size.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
@@ -71,19 +72,24 @@ static int tsys02d_write_raw(struct iio_dev *indio_dev,
 	int i, ret;
 
 	switch (mask) {
-	case IIO_CHAN_INFO_SAMP_FREQ:
+	case IIO_CHAN_INFO_SAMP_FREQ: {
 		i = ARRAY_SIZE(tsys02d_samp_freq);
 		while (i-- > 0)
 			if (val == tsys02d_samp_freq[i])
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
+
+		return 0;
+	}
 	default:
 		return -EINVAL;
 	}
-- 
2.43.0

