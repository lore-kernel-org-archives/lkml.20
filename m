Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34EE57D236
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888292; cv=none; b=V7jU8eInr+/Y2AADgZgJrpRi/agnHzQhYwVaeXWlznZ16c6ZJKzuoIpNqtJhW253nCl/MJqSJH4x0r5XbUC1xgDBBhGR32T1joq2cIUlR/BuTd/DywaqVqGMbO+zNSmenESFJ/WnJ7ZPgAHGO3pJ7qZ4yQiqjePIkgUASFJkwxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888292; c=relaxed/simple;
	bh=bgK+DZod7mmJgogZgW1zioKzetKNGqoKIW9z56Vpb+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyGa7UcgHP8M/wCfGGe+hhd6GhI/H9J7+qqYk/V/iH8J/uSMOQZbnv+yFhxXb3IdPmuqp6y0Xztlzx+V1V91IRhM8nzcprxNnPsOdirVbyYgtNvBr9z/EDHcgHgCQdr1OCWg+w//jWvgjzU33d6/bnebrQySoqQMNwybG/lAN/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DS0AYKoM; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DS0AYKoM"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso144224a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888290; x=1789493090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=DS0AYKoM/XtIzmvoogEW2zPP8mMC3wPBLkyPVMi+EpTzxEmkY07j/GxQqBkJH3Wrhf
         461MUClpHWrUrOEzHuxY8VloGRupqkIxwhXEbAYIPk6aAaJZhsdN2zC4fvT9b1+xn2N8
         N7+8HHVfBzSWXzokmylQUzsUQoK/gXx68STjdMqHefquti4KNAlq8qq8pZUyMGegMA1z
         JKZ5kscvnHSX1ErGw/EeXapdgTTCjkRYsXLgvG/iI+OHUEnG8QWNEE8wMiKLcfgfWaJh
         9ny+Km/KW0Ahfl64+8+3isN6y//jGg+OQZ2Vk+AEF2eUuwrFP+ZLBifHEfGHlXKuNhCV
         bI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888290; x=1789493090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=jYQ+9U5aM1ulQiyouEeD53DrDejSt6hoxmTexO+2Jk0mDIeWBvBJrMQ8+4eWhU/LLD
         irChr+nw/E3+s63TdMTPLElTcVU9+ZPLyt2oRA5UAQADooguEhhOMU0OJMeXn8+IiamW
         HXIU5mD26YI0rmPtkKncf0Ha+ZhqBfivEzLCjFpEX1rS95Yn2sjN8qia+5tbSWz3Mu0K
         BLR/nIu1Ak1oKi0ukY6GF0trhKuypayvwFLubRYHYx6Tc5L79uayXPp0Gg+GfohoOVTO
         pMewhXQB1WD3IWhKFUfgdmchofGhC+vgWcajh8ueEf0nPLgaxK7oMB6e1Nwd9U9XvzFb
         mmWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7/L8n9wVa+M+5lbtxfQiOX914+vvaOgTiXLFt95f9XedU31OlT7VOKYubceOED732EVK4t/9fS3J7rrA=@vger.kernel.org
X-Gm-Message-State: AFuF++k4w6lytgz8BkJGtu0YrOXcup1EPUEU7UQWCbktncRSwmP79If9
	b42s9LzR5By2SeFq342nzYztYRMa4/z4YMEO3h22u36Qqzc6t0+7xm0f
X-Gm-Gg: AYBFou2mkhZXzQxCoAASOI6TTV6jfqQbdkw4FwAlo3YoWG+T59fgjt/M8IwuR1DxfLp
	OVaKXb1K5eZUnCT2mhq0pPYp9VONXqTa8R0kdvXVQj4ya4KAXSg12uLyEM7J/RSgENxRGSiu11Y
	+4WTAVOn562i/PU2puAUsP6DEYULrlih+Jd0vdFbjMvVMvGQGnTj6VL+WWWYRwVsEMlMxppm4Je
	mX7LDAMsP4GRSs3RigztRhdB+4IxagzoREnQC+5H/PYfApvrToDnIjpHk37A2UMljJhgDYcm2L/
	3gI/D5f6vDMVgHsWyFBrSYgE+N/QeK7Ig3AD83FJLykd6Fzg5Qb1L6MIbgLlnHnxSGZgWwfffZ6
	JSF9gGvMpRDcASBxXktYs82ww2K80QrBjTE4HjCRhRBEb6St5v6Bc429wC3WL4Ggu937OkFwqbL
	NDYCNe1IUwY9ofZBa8KyBjydpazGxA1XalHtKHncV7Q5S8yTBdMeBQvzDIzhRDx+Pd00X8pw==
X-Received: by 2002:a17:90b:4d84:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39bac138257mr1168410a91.1.1788888290224;
        Tue, 08 Sep 2026 10:24:50 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:24:49 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v4 1/6] iio: adc: bcm_iproc_adc: sort headers alphabetically
Date: Tue,  8 Sep 2026 22:53:54 +0530
Message-ID: <20260908172359.30003-2-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

Sort the Linux kernel headers alphabetically to improve consistency
and make the include list easier to maintain.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index ab66b97d2f04..e46e3761993a 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -3,14 +3,14 @@
  * Copyright 2016 Broadcom
  */
 
-#include <linux/module.h>
-#include <linux/io.h>
 #include <linux/clk.h>
-#include <linux/mfd/syscon.h>
-#include <linux/regmap.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include <linux/iio/iio.h>
 
-- 
2.43.0

