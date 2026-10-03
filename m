Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C983911BD
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 18:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791053844; cv=none; b=gi1q5lV43YyM3/1iQafD/GUuD6n/0KME8JOM1+O2+QtwWII7Fmqf/btm+Z9o+ndwOg7aqKItWn9sLFEFnIlfbavbyZ66WHa/sClVIfzDXatAFQ0kf8XoRSvWdwsgXFSFDvsjr73RLkOU2DPg88ceYVRhuaqxwLcoydhRcCp5UCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791053844; c=relaxed/simple;
	bh=OqBTQ7fizQr+GgO02f1aj4NdN9mfy5Y8AJ6Mh3rmrq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LEmWLoERbEqb9El9WPAcXavrHMu9WfYMqqvp8/HiWpv/q2UG3uZWl7dQq3E2Y++6xKaxrSQVDE+CpAAJs3T/xEmmuWM/ckWkTeMEkaDAvxhJH/uSgw+m4DVn7uXNz9hzrpKDxCMEt8VvHpAT0WaZ59prfL4ni7OS/qyeWEYMiZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WV1cljOi; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WV1cljOi"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a76ac0bdafso7889511fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 11:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791053840; x=1791658640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLPUqPjfJXB7AQ00lgXYhZJtC1Wq/diOvTITLMBAtGY=;
        b=WV1cljOi86OvX/ZnjgLo5d+T1Okr4Y7vcQYi0b+tpoUPA1eQSso4huXpQ4TSoXsY59
         nxTxKbHuXgXj8ePudv0x1S9wbyU/OhlEZGIabaoTGZF5PadXyr/pjkOV1AkWPv8Ln1Ai
         UfRKRcqUAaalkkNhQFfqeDXuE0vLxgg0/uIZRReS5KqqSJ8zy+sbgLxKR/JahM4S/4nH
         pUvrqc78Etq3/pLC2IgtdCgo1rRx8VX6UQswxZo1nWPiwXekMYMK3mkMc2esZ4Gewnoy
         3VJijIXqJIQoMfVBahwN8J9TZNd70Po/KHB1rD9gTDrTQxpgTKQ9mEyvEhIU8DW/O5jG
         K2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791053840; x=1791658640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLPUqPjfJXB7AQ00lgXYhZJtC1Wq/diOvTITLMBAtGY=;
        b=Idv2Em2MuKL3nwgTyQo7+QUfQ7JakO0vcug8CNcVRG3QDz8wbciVyyvP+rN1thsP5o
         6cha1Y00C1VLevW2oLUperP3hhIAxocQZACeT1hqoYupDjKY1CDogb/GBzbyfeHttwaU
         EcR2gpWTzPOfPPU1Uzp08d2aZi+H489Svbk6MIdxVJN2yqiOdkzLrDBvOtLvUYBXwBuL
         nlNV9b/aZdTFn+/SB+Mz206ef9ypGtxwZMevqi/ZWJlNDu/IEaAr/11PkeKL4S+EBANc
         Dlh1Ng2efo5rovXa02f25hz1P5652enIWzgePvWEyn1uSWJGjlw7Hpc4nfMA+p4IH7Hm
         FJvg==
X-Forwarded-Encrypted: i=1; AKwUvBye4GBmQWlyKJIYVXdihKjp1xrPNBKq/QMtnU001zmnie7f1FtzMkieeZLLC+xRuE7aPVGykxmJOgiWwkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeLu4J+4Ecq6aR/iH5u4Jehv2QWIvIunfBhiq6hNdZoOhk2ZeM
	lyT+eutCMZVadNE41uoxtohJ0Fy22CfWu83/7BucgNK93/kGmYFSwJXE
X-Gm-Gg: AYBFou0bVf2Tlu1K5+q2aciQqOPQynJ2oHVFx0l5r8Foihake1kfw468HzYN36MKz2Y
	i8dl2BsYYZ5QE6sL1wyU+JskNJ8EBZeXcmOQA4gxGxCbJ+KmWScuNPIV8mJgHhXvi1LsrH4EvvT
	UVrHPkCy3GpvfKts9HsN642QMYWln4x9RqG68FbIi7/lwqWPtg8F4Eg6MU8my0hZl6KZNJ6kkfM
	qcWzGjV6aYOFrgGci9HklM5ruZ1h6ej34uIwQuJwv077osattytLmPeCdkwQ6lGEfPIRQph5NV2
	Lnk3OH4NMa2oRXTRq4fVCUfkNsy6tFoNVJdcXrxK7RTAMPfSCtoiYV8x1YhvuyMFWW6vngOIn3l
	DWYfBWgc3zORbUouud509yoWo/P7ORBIPRzn/5cgOb8MLCio+6it8hyJJp0apOu9HFSMsMc6yMB
	opsZ+pe3DIyjlZoA7/xgcAjXCK0G0mC/RldcJ0KQZxvk0kxROYycjtrHh6U5Gt08qN/QfbXG23x
	0OSX8mij+5mbDTQ9+l+T5uQzWSiKuHH3WmMc6HZpOXbgoR74C4ngf595+3iO990ui7Tbw==
X-Received: by 2002:a05:6512:3050:b0:5b6:10bc:dc45 with SMTP id 2adb3069b0e04-5ba433f04admr3155990e87.28.1791053840120;
        Sat, 03 Oct 2026 11:57:20 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bca9f7be9dsm1575264e87.73.2026.10.03.11.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 11:57:19 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4] iio: pressure: dps310: fix overflow in pressure compensation
Date: Sat,  3 Oct 2026 21:57:16 +0300
Message-ID: <20261003185716.32732-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

p^3 * c30 and t * p^2 * c21 overflow s64 at most oversampling ratios,
and pressure comes out about 150 Pa low on a DPS310 here.

Use Horner form, dividing by scale factor at each step. Overflow then
needs a raw value far outside sensor range and returns -EOVERFLOW.

Checked against datasheet formula at all eight ratios.

Fixes: d711a3c7dc82 ("iio: dps310: Add pressure sensing capability")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260921183132.233136-1-zoone.rupert%40gmail.com
Cc: stable@vger.kernel.org
Assisted-by: LLM
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v4: -EOVERFLOW for the overflow check (Andy)
v3: min_t() line left as in mainline (Andy), comment cut to one line
    https://lore.kernel.org/linux-iio/20261001121616.109973-1-zoone.rupert@gmail.com/
v2: (s64)BIT(20) instead of BIT_ULL(), min() instead of min_t() (Andy)
    https://lore.kernel.org/linux-iio/20260930085819.886339-1-zoone.rupert@gmail.com/
v1: https://lore.kernel.org/linux-iio/20260928101803.547005-1-zoone.rupert@gmail.com/

Based on iio/togreg, since the buffer series reworked this function.
Can send a version for fixes-togreg if you prefer.

 drivers/iio/pressure/dps310.c | 91 ++++++++++++++---------------------
 1 file changed, 36 insertions(+), 55 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 85df58ac1809..1d0b3232db9e 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -19,6 +19,7 @@
 #include <linux/limits.h>
 #include <linux/math64.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/regmap.h>
 #include <linux/unaligned.h>
 
@@ -660,72 +661,52 @@ static int dps310_write_raw(struct iio_dev *iio,
 	}
 }
 
+/* Fixed point one for the compensation fractions */
+#define DPS310_CALC_ONE		((s64)BIT(20))
+
+/* *acc = (*acc + coef) * raw / k, with coef scaled to match *acc */
+static bool dps310_horner_step(s64 *acc, s32 coef, s64 raw, s64 k)
+{
+	s64 prod;
+
+	if (check_mul_overflow(*acc + coef * DPS310_CALC_ONE, raw, &prod))
+		return false;
+
+	*acc = div64_s64(prod, k);
+
+	return true;
+}
+
 static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	__must_hold(&data->lock)
 {
-	int i;
+	s64 p = data->pressure_raw;
+	s64 t = data->temp_raw;
+	s64 prs = 0;
+	s64 tmp = 0;
+	s64 pressure;
+	int kp, kt;
 	int rc;
-	int kpi;
-	int kti;
-	s64 rem = 0ULL;
-	s64 pressure = 0ULL;
-	s64 p;
-	s64 t;
-	s64 denoms[7];
-	s64 nums[7];
-	s64 rems[7];
-	s64 kp;
-	s64 kt;
 
-	rc = dps310_get_pres_k(data, &kpi);
+	rc = dps310_get_pres_k(data, &kp);
 	if (rc)
 		return rc;
 
-	rc = dps310_get_temp_k(data, &kti);
+	rc = dps310_get_temp_k(data, &kt);
 	if (rc)
 		return rc;
 
-	kp = (s64)kpi;
-	kt = (s64)kti;
-
-	p = (s64)data->pressure_raw;
-	t = (s64)data->temp_raw;
-
-	/* Section 4.9.1 of the DPS310 spec; algebra'd to avoid underflow */
-	nums[0] = (s64)data->c00;
-	denoms[0] = 1LL;
-	nums[1] = p * (s64)data->c10;
-	denoms[1] = kp;
-	nums[2] = p * p * (s64)data->c20;
-	denoms[2] = kp * kp;
-	nums[3] = p * p * p * (s64)data->c30;
-	denoms[3] = kp * kp * kp;
-	nums[4] = t * (s64)data->c01;
-	denoms[4] = kt;
-	nums[5] = t * p * (s64)data->c11;
-	denoms[5] = kp * kt;
-	nums[6] = t * p * p * (s64)data->c21;
-	denoms[6] = kp * kp * kt;
-
-	/* Kernel lacks a div64_s64_rem function; denoms are all positive */
-	for (i = 0; i < 7; ++i) {
-		u64 irem;
-
-		if (nums[i] < 0LL) {
-			pressure -= div64_u64_rem(-nums[i], denoms[i], &irem);
-			rems[i] = -irem;
-		} else {
-			pressure += div64_u64_rem(nums[i], denoms[i], &irem);
-			rems[i] = (s64)irem;
-		}
-	}
-
-	/* Increase precision and calculate the remainder sum */
-	for (i = 0; i < 7; ++i)
-		rem += div64_s64((s64)rems[i] * 1000000000LL, denoms[i]);
-
-	pressure += div_s64(rem, 1000000000LL);
-	if (pressure < 0LL)
+	/* Section 4.9.1 of the DPS310 spec, Horner form to avoid overflow */
+	if (!dps310_horner_step(&prs, data->c30, p, kp) ||
+	    !dps310_horner_step(&prs, data->c20, p, kp) ||
+	    !dps310_horner_step(&prs, data->c10, p, kp) ||
+	    !dps310_horner_step(&tmp, data->c21, p, kp) ||
+	    !dps310_horner_step(&tmp, data->c11, p, kp) ||
+	    !dps310_horner_step(&tmp, data->c01, t, kt))
+		return -EOVERFLOW;
+
+	pressure = data->c00 + div64_s64(prs + tmp, DPS310_CALC_ONE);
+	if (pressure < 0)
 		return -ERANGE;
 
 	*val = (int)min_t(s64, pressure, INT_MAX);

base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.43.0

