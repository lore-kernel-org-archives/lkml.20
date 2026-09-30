Received: from mail-pz2-f14.google.com (mail-pz2-f14.google.com [74.125.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF495172F5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788349; cv=none; b=eX05v7m8LxWdIDl3JTfzfwvuMBH7gWCYZH1eR5mznuuEEXUkTXYIQJL/AJnW0jTDqY8Oh6i/vGQBNL+5zNfs3dhIiEqe79k22MbL6zRkiRN2f/uAe6DHjgGQBB8gxq5f8u5Pd3FtgVPzzJh3H/jMOHlUngwLZeCOSnzmHFxqxAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788349; c=relaxed/simple;
	bh=Xvm4nW+2P4F0n2X493r3Kfa+UVebUnUFiPYaF5DZ4z4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oUWA8sdM/0QMZwvv+MDU4/f4bzUHDOxO3Vd4ws/Eyyr6jIe3Tey2ena57XLT0Kwac4CoS8Tc3U95NsCom5MDNHI6gtZ+Kooil7oWkktW9SDXRkFaiXOSIzp7B+doo/Oekw/oFRTgZ53WNnMMtUx7xxkr+IqVFr8qIanr8OGs9uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMvqhd+2; arc=none smtp.client-ip=74.125.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMvqhd+2"
Received: by mail-pz2-f14.google.com with SMTP id d2e1a72fcca58-885f0eca6c4so853863b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788347; x=1791393147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=refqYpnhzgPaSHSNEFWOu6CJsyfTdwor7wN0Moi5irg=;
        b=qMvqhd+2ql8NSOMjioqrA6jn14+/vaYJ5Hrov1rja2UCuF5ypEH9NWcl31sPcqXRra
         5g51QyYJkp8hMwrF0UpumP+cPIapyT0veM92bFZ1NegM1bIs0lvWgkG5PIrgbAYvoFff
         bybDkOukqZUgbk/cqTTeKuxoxW1/iKC0YpdTX9yiCJz2n9igi2PBkLZa68fctjYSMQnj
         5k2TFsWrikbBaRH6t4DfeYRYgEiDKBKYFBkuQhterLiNJUsRYAW9D/QAC0mUqtScMulR
         /BH4alnmoXSqvME3Cn2zXIOkJBxa/SAqf6/4uEwgEr++hNMyTZxWo+kpnpsoiRDX4a4T
         2MbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788347; x=1791393147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=refqYpnhzgPaSHSNEFWOu6CJsyfTdwor7wN0Moi5irg=;
        b=CeN4ANdBNQwk1O/o773mHdf6EMmstDWiZ+GuFgrI0Ed6raZWTLctsLjNuFZ/DKFg0J
         zBWrenY8cys+b+0KnmT5FU0EUO8a4u19okFRP+mYN56NL0WlK5kbCKNPEGh/21jxoiNb
         TfbizwHEar2YMrgM6cTZnnAmgC8Ev6etbWMlx/8Cp9C6lP7ReTLVZV2vZnF/1I/p69h/
         zxFCR/a5Q7BFNXQaCCCN6bajhvWOb7VxU4R0g2s63xlwVcPMUB3KqxYN0k5og31XlAWD
         mpAB81/eR+rx2yEXJF0tCFqV0uETRNdCpVzVE01F9+4svI1nvupKaJ7e+ftrsmed/fxT
         u2Xw==
X-Forwarded-Encrypted: i=1; AKwUvByoHUHi1YcTEcBbKytpnugc5mYS4kVzcsQdCz+ddwjwM7gpYDgNcj70nyi51KFp/Pk9MI0i1314H52NW7A=@vger.kernel.org
X-Gm-Message-State: AFuF++ncuRbstJeLhUcFku8Hw0DB1ajJqEee9yrTtmX7CxHT3A8A2gkT
	7UVlTAchBAcvbmAcu2Zlrs+1c2fcsu45vXh/rsyerdCLajELsvAV/n56
X-Gm-Gg: AYBFou2fBqcPFDanSLIVg5BAUyqbyNEWdXneNsYdIYXXOqzvrJRjaCa9MBz0ojGwPBN
	8J3FKWClgx9Zc013gipzrPkc2eEc31PAVq2WQx/UtpuHChlPnSZciFfY6o2cPX2KwCIqvLWQteB
	0bFrfeEaT//GM8oti6E+i6Yv6e1DJIr5gN651dZ7/+s5N6UM0FK+kz4utYiSSudTndqy+N6b2Xb
	uLqTis9DAqYcmo1UohHg8Omu3r62T3vNb8sIoc0IZq4INXqhMYo3fj0AwV8gW3vZmvhMmIOI6Bk
	zhyS0eipmXI2fDoYTkH1K70/bnXb7H04WtD141rglKWu1W7fkJ9pERrMSOQlNeETM5bT+EONUqB
	TpAwCzteKfof+eeNtUDzS3hh+/W3PpbFpqvWEbe0IT+dz/c1LixbyHtrQ6CAt22g4VOhZpAZPuF
	giS0E8aSFQndttU6fvS5D1+Xdtj4UpJspcDaIo9tZiCyIBoSrOfjkt2lsJqUS837FNRlKXkBpoD
	I6F1jv42Lq7l7g6ZixSRBvII9HWRKbIc/5jy389dG4nDZDHeNY=
X-Received: by 2002:a05:6a00:bb8d:b0:880:8c63:657e with SMTP id d2e1a72fcca58-8874d77fe18mr1519487b3a.13.1790788347310;
        Wed, 30 Sep 2026 10:12:27 -0700 (PDT)
Received: from debian.ari ([152.58.182.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm636872b3a.46.2026.09.30.10.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:12:26 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 02/10] iio: adc: ti-ads1015: sort headers alphabetically
Date: Wed, 30 Sep 2026 22:41:56 +0530
Message-Id: <20260930171204.12863-3-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930171204.12863-1-architanant5@gmail.com>
References: <20260930171204.12863-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder include headers alphabetically to comply with the preferred
coding style and improve maintainability.

No functional changes.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 93a165c5416a..ef03b74bda3e 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -11,24 +11,24 @@
  *	* 0x4B - ADDR connected to SCL
  */
 
-#include <linux/module.h>
 #include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/irq.h>
-#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
-#include <linux/pm_runtime.h>
-#include <linux/mutex.h>
-#include <linux/delay.h>
 
+#include <linux/iio/buffer.h>
+#include <linux/iio/events.h>
 #include <linux/iio/iio.h>
-#include <linux/iio/types.h>
 #include <linux/iio/sysfs.h>
-#include <linux/iio/events.h>
-#include <linux/iio/buffer.h>
-#include <linux/iio/triggered_buffer.h>
 #include <linux/iio/trigger_consumer.h>
+#include <linux/iio/triggered_buffer.h>
+#include <linux/iio/types.h>
 
 #define ADS1015_DRV_NAME "ads1015"
 
-- 
2.39.5

