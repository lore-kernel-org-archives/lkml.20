Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BA34963C8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851308; cv=none; b=qKP+P6ziukLpk4tjgUur5NR9G0+f0CmPSEsgPYQwNoaz+wNwgnyVjPgRsyA/QRlVYkF6v0m+maDZHJLfzBW2bVffqJe58RDJFfh6ef8fdILQVRyabdo2oAT0+8XJmccVZFFUlhhOeHm+5MpVyPF+Hb6eNqJ/0hcyY4hDCkU8448=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851308; c=relaxed/simple;
	bh=Xvm4nW+2P4F0n2X493r3Kfa+UVebUnUFiPYaF5DZ4z4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KuZmOAQp7M70xFrCiAC1RDQn7bFhEmWZhn3qol3qiEXff/s/Ei/FAJivlECyTQ6yalOZP7a7FX2c4S8zhQomqCc7r3hS7A9lDq4DUkWRYI7lCnxuAiY/J77XHn16QZC01sKB4QfHDoeAIMoLzwlo3Xl0hWdS8wdXmxskrXeZOjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3wlUI0z; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3wlUI0z"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so114616a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851304; x=1788456104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=refqYpnhzgPaSHSNEFWOu6CJsyfTdwor7wN0Moi5irg=;
        b=X3wlUI0zVcmUd7kX0E49qG6NSSjerq11J4S7Yvr8Tujd0ryT+Q6voJZkRY5659grXn
         Gq1CFJpBbn9geb1lYCA4bGgRup2u6bT+cu0YhGTVg9h+1gi/ozMpGnJ+OuutXjKtllJ0
         trKhXfcQq9PpzJ3OSBwKlw6MjkCrIzvdto+3kekeN3H/XT3PVocmrzkxtXDoUCIqodnJ
         xdg/5K8zs+9NQsqJjPzlvFMbCLGlNnUXbBfbODWUa/HFmjzl1Dp+GzTUA0fUQ6OQM2Rg
         fRcc0RGB3u3n1IVgjU12HI7PTTm/b8S3r23z75Z4BHg/HQ3zibFAqqmk5mcNbthw+kmQ
         0A7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851304; x=1788456104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=refqYpnhzgPaSHSNEFWOu6CJsyfTdwor7wN0Moi5irg=;
        b=GKxt4m8lqr8B7qjZgWwAIEKCeuVkngHjmJtg+1HgFSTSneFhoedjbY0vjb7Q5FvI9c
         ILKRJ6TWXjePtCvtRd/HSzxTo72kXGud5yy3GJsWYfHoYTJ9coymEg5LCVQp4DBbqFe2
         uFfV6NpKk0w9x448RaCYM/HxdVWQW/cpSIsJUbh8J1Ak0KWWqCQ9SWHWKa/BwJRfwR7w
         4ZmWutAO8J2OcqSxInscrNYj/cUEa8KoYbbUThgOtxn7+SIQYBSDYB2bpfspGB/P9z0Z
         V5mQrqLvMfE6qhRr29bKZiwB+EWXR2MJr45hBsVfdrBhe5/20mBPzhVxNYlRGj4fjKAu
         9o8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqsKaNBQDgiqo44SLRqxfvlFen4Pl9ourvnb2lJRuig7OnbfdyVY7hTn8/ttGZmQtSNWB5ZjB6zOjsaYEI=@vger.kernel.org
X-Gm-Message-State: AFuF++mBUZuMHNikJw0xEACIsSn2PmoyQO59Y8f1qEsF2QtOduh62PNC
	zhdvlNDkdTXg64pzRsg1x7lCzxRjFmGF8U1upCkHC4Tp1TkT5sOAvXzz
X-Gm-Gg: AR+sD13T1k9P0rCa6DTxlmwfXAnllbIXI32DwOLS6By1mMKd3i7f0QzJor927r726I2
	ojvAuKmw4LzcncoFIgJeMxIUH1+UXT46I+7B4UcAhovfE5O5eZk/cnhNd8iFzMEYIjs3KcWx/OP
	RGq0pfIA508Z+qhf4weHOAQnOrzlR1j12D/yCWIth+g6A8IaKe2bZ06d3dAhN16RxPbABA8M9Yk
	S1dB8rVxuz7inURMuN15DDWx1bjnRj2FGyNhJNpsWYt4qD814PxlIViwGJ7KH4DX2eaOgHWcR4o
	aWk1d+dUssmjdn14XbW7CTARpCJyBPcVFdmLJD+YEfBP/ju6VFXBg4pEHu4Ku8M7YKSgxwVENDI
	NiMbxvnZCFl5Y8Fyblsb0y8SKXqBxmoS0F1AUyLNQNZVdM2w0MM9hN/DaNDSXy6/AE+rTcXwFc0
	mBo6t200r9ppBhaOSpb/AUf1iCwc1nHBU5lkUn5dE7Mn29KCQ29yjjX3jBh563azUZmPSHojzND
	Pdk040b0TBCOUnKAHqUMNkVy6fWnBSCxvgX
X-Received: by 2002:a17:90b:2f0f:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-396d0d92d15mr1655610a91.3.1787851304248;
        Thu, 27 Aug 2026 10:21:44 -0700 (PDT)
Received: from debian.ari ([47.30.51.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eedd13sm17797165c88.1.2026.08.27.10.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:21:43 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v4 2/8] iio: adc: ti-ads1015: sort headers alphabetically
Date: Thu, 27 Aug 2026 22:50:54 +0530
Message-Id: <20260827172100.39176-3-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260827172100.39176-1-architanant5@gmail.com>
References: <20260827172100.39176-1-architanant5@gmail.com>
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

