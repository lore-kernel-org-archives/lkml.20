Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE62388878
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601055; cv=none; b=GlZFPxTj7bXVvZYD7qbtTQDhvAQb2MyA7Ti7A0Mnvx3cJ1NK0qQLJ/hUaWBjJtcGN4pz/TcSSMfK4zOaufj2rDcO+rRIg1PpUKxJXWBtZXOp18zqN3+Pi44cqX5ASNtRRnigWdkrRSlvGZ01c5rrUL7gYQ9wB6fX9BXfivABbjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601055; c=relaxed/simple;
	bh=Xp9ENmv/lelwk4unttBWYQyxWUh9lt3BGxEuS6wNFkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeq04YMjl5Bf9LTQVwxlRp/pjy03s/dJSIxqU2/avSBvi1J8RHiyKYHDrN5nNoknsELADj4EqYqkko8nFj4gXzChAIoh0Lqt5LxQ9dBLRJqHJt+llDGXPqfperPD+ZkosV8hLjMbuo5MC3kDSmV2ZKYMfGOgdoismUzvj9ZQVMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/6pu3pz; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/6pu3pz"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39b35105ba4so1232730a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601053; x=1789205853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9qSf28+gMU1cPc/sgLS/ZHLrlXSMGyx8oSsqQzyWeBs=;
        b=r/6pu3pzfhbiP6NDy5oXJU8bHG4PUYoqswdSgm1oCFDSY2AkCvxUDM8fjqvhmcyw/F
         Ln3AcTdW6VAZV5O55BJi4YnNbRVyafctoo9ghvpDgknXJWpv2MuprBMYqtfM5KOOYnoH
         vWP2PnhQ5Q0YuGwCQMbkWUt+QV5Ga4CHmzkLnGRvB0sP1JECMebyqIZea7MGR0ugoeYN
         hgfw7D2mSBMzcQOY8Nm6MuWpHXJcMl9XqykPuwxrquYJW0a/BtL16XiGrQt/L7hclLEz
         n/D1k0D33+PmMDss7qQ6T1usQ1l4Mrcz/b4zZjctw0bHOS3/ftJKFRYydI6xdnQHniRH
         QuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601053; x=1789205853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9qSf28+gMU1cPc/sgLS/ZHLrlXSMGyx8oSsqQzyWeBs=;
        b=D0sJtEHvyoxbug/qzokbjU/us8/wrWXK9bDe54Ln/0yleS+8F+xz4V7VDshQNNTtNx
         r32+iAx4pBAqOeAyb5f1CBMpTn+Su5gbut1T4Q5JA4s5RN5AE6Jq1ReInmopT4/uj+Kc
         85Jg6D93fswsJut9rCNEfaMreXnHwuwVyXLYvtJH1qXvEwc3BJdKiAs7k0UCVqyTrq9q
         Dg7mZ87Zevz2i2mThlEXj/NH712ND9LvboRs15G6nRtyhlragfjDpaG9bS7stwjCgpoT
         OO/ggsI3jDXGjTJqny9FJbhMGUVW8vFE0L2LVQJ3dqMvYsUHQrjeVpY3lGPFCx1ziwmc
         YFwQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0uwm7B/s9p5in9esL2tk+IbUt3D2ph7W/Mi0wSlxko8A2lQ4dKxt1vLBCIgoqfLzNjDOw+Wc7afQ8zME=@vger.kernel.org
X-Gm-Message-State: AFuF++mxcKO5bY6+9FImrfDAZR0eOruEK+38vQsA3SkoYXoas9huIp5T
	KydB5I/SbHIBhxCeLa+4gry2KH1wxXtHyZUpyGfwyql+uNb2q4g7HWz4
X-Gm-Gg: AYBFou170mfv8sg7DFE2aLK4ytn5T4mHbRBP5jUwOgJTGAIEohLxRMeqxNz8wKIdW3p
	YJ7pg40pR0rjgYCnNj6xTJgl2L1GxvXYJKpoakNWQcHIntnUeWEOnEMKLSOAj+pkySuHlh/ItSl
	XX+puuszGnULecGXgcvKwy3QrWxxHkmOonHhu9YOrTeUAWuUMEx1oEfjuoeLVz/DDj73ywgmw2M
	ui6hm07bfTrQiSP700FMTdcIb14OmxPgRbCTxCizWzHg26+G5FMgo31suQ/QPO5q+bRmmF4WtZM
	yiUMSt6V8CrZScFIECno/nPoGkPPsmjznbkVP0vhxNzTVhhu/Q2h8IhwrDrF5wp1sgP0KlWeF8H
	7Y0RTGfapSh7MI94kcMdsdivBF0Up+Af+J1uMDme4OuHFNC8+d3mRojT6M9HBMdr5QAAKvyh7u7
	ap2oDBq3yy+VYXGQI5tHwLGn3J/xCKWiQ44UEpBx7rRB9fw6LbkXhsyNkJrw==
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr16362724a91.1.1788601053217;
        Sat, 05 Sep 2026 02:37:33 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:37:32 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v3 2/6] iio: adc: bcm_iproc_adc: fix include dependencies
Date: Sat,  5 Sep 2026 15:06:27 +0530
Message-ID: <20260905093631.48667-3-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093631.48667-1-mdshahid03@gmail.com>
References: <20260905093631.48667-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

Add the headers required directly by the driver for the APIs and
types it uses.

Remove the unused linux/io.h header now that register access is
handled through regmap APIs.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index e46e3761993a..e54f613d266a 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -2,15 +2,18 @@
 /*
  * Copyright 2016 Broadcom
  */
-
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 
-- 
2.43.0

