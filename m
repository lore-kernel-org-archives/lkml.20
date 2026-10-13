Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8014EB867
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890510; cv=none; b=LyPxAHdQdBnvosJSZVFwaod/cNV+cCDGNLKyVqS06TjTGd+ZCsyAC/oa3W5E7xesJFFqaksuujHZ/8bGPtW5n7Qz5SflnoLMgw0VN3oFpQArmIDIy2tT4OuMP4XTamg0BoPn5BUBV43A+8Jomy1qNe/5akEFNBacwby+t1qEmmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890510; c=relaxed/simple;
	bh=tuLZHNjquzONR2MTJc7uIKwUlOA8ZRiHQQb9yafJyPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+MLPuaq4AVxH8WLxXcDdPblQkFl4/mfSMPY/Xk/5qXglqeOxNGSafst4Y6GItcDy78MOu8jKH7hZsn8i8yD/0NujzSd7CqW4+ccK1+Rm1ZfrUhC14ZWJHcTECjel9LZuz1seR/iLEE7QC+3ypzvOMjlRbaZoxS9HI2gdkWwAe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Btbrvur9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Btbrvur9"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bad794b197so2966411e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791890506; x=1792495306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55EMxPk7jy7Kh1gVtgXbU/Huv6cJaqD8bSuR0ttRdCw=;
        b=Btbrvur9Y/KcHmUlOzgTpMYxTmlV51IqDQFvbKO9eC/nqBeU0i7aExqd8T6uiKzNFS
         JgeyoQ/Dznu09Nj0AnhS53/LHsCuCD6Rjuokkbwdiyz9KUJzXGwNdqxT4wfqJDRDFc6r
         Fn2aiwr/D2WOFmNupytrp2FJqFwrAqqohrpIcKRnNAMkAQEtRXl20NCrbMJmGEaVB6wt
         QQqtPpVsvWsFcLTiYJIXl8zTfcPtq9L3hwlszwJtUE4aK7cV9lgulOsdFEu+LDcDKFy0
         fZtWKM0WSmBX8ZzRmPSXionfwYu+5wHI0t4yWyzczoap6bbk759qGOiw584UBBmW3SCZ
         0ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890506; x=1792495306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=55EMxPk7jy7Kh1gVtgXbU/Huv6cJaqD8bSuR0ttRdCw=;
        b=lyHUDkRj1STtbNsVXXwtQHZOyDYKVRDKAJgi9NYplOiPxaj8EvewxZ5xye6tT7+cYW
         V5tzDRjFaqL8OfWqTj5s4WPy3J4tJPlPsfzLw6j9x0xHGuKN4/kUN6y9IGaTaJydMFeb
         v91vkBtCVYnxMIrG0gQjb0LLgXGW+yh5GWDkHvec+qfHEDWo/u1R3KneKA95dM81KRlq
         I7uyWfNM3rBmZvAMVcOyqwGZkDEGPJIi5KjpHVh0fo0AISsatXR/cjv8Rc0PxaZ4oa/6
         tFOf279GsdMdoMTkCqkpLPhnLOTpZfMx1Pp84qkXF6iBjC6eKkQ1S8610plMkqAjIW8h
         L3mA==
X-Forwarded-Encrypted: i=1; AKwUvBwqMc/7ShXN69yQeZ72HVZtJkp2UpSLy2M+Fk0Le/ZHNTOub3DY1r8eFK36ZweS1Q7VlJEEvM4g165P5Z0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNNvzgsd8QrcufjLI7CbdhrH6si6c3xmP1Xd3RwKat70Kg1Spk
	fK/zbgstaktjTEPDqYaCoE5eHkr6Bm6NnIvjBOWSevi8gM5QGUeCsIgI
X-Gm-Gg: AYBFou3VOXlE1cs3ywtr/gF13NtONyx3CF89M5Qn7OXUg0TPj0Uhw40HhSmmuvmn3jD
	AhI/924kTCni54K8Jycifa/9tMe3nGbwMrVjrOeN37+4KiI51rNaGH+EtU/ml7XkcOlzbeLRdCp
	FC/WzzOMInkcgfaqzQ15HRqz5F/4qB3wal4K4W0mUomdfOTJEkh/QVqj3WCIqbOtmYkNEmOZG51
	s5Rz4ISK0j+bH7B8wQpVIlocpYRQKHJB8L82stjGUQtUVQ3c+bJOZnKjU7cXb2i7NMDrDlKfzaJ
	YlRqFH8kiyl/zqi4JM6bor3dlbF3TiKmgriNLgh2FDUKH7jy9cT5MO8HFj6X6g9/bUpCEVd+m4K
	OTS9F2S3lrviQxfCIIvI0mAYtc8R0LMVXepvapirNtHYg6f+M7FED4uFZsB7HVkF0oPDzLSnDeo
	QEhKblRbo2HMb3l5xCykyiqzMMFXoOSt2OV9Jf2jwk0Ak7bWwmh1gGuGcoLcuKnu8cwdDAOxWm/
	J7KNC0pJo+ScO3oD7w/28GGm6UQnYo4Y3avhOPeXLnekIy6YB3ORquJ9GKugShdju3/oB1zA6pb
	1NrobvnPwNVj7rXIjy6CuJFzqiA=
X-Received: by 2002:a05:6512:3d14:b0:5bc:c7cf:61b4 with SMTP id 2adb3069b0e04-5bcde6c7386mr4196485e87.27.1791890505804;
        Tue, 13 Oct 2026 04:21:45 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf8a3970asm1116148e87.79.2026.10.13.04.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:21:45 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/6] iio: pressure: dps310: fix overflow in the pressure compensation
Date: Tue, 13 Oct 2026 14:21:19 +0300
Message-ID: <20261013112124.1878296-2-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
References: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dps310_calculate_pressure() sums the compensation polynomial as
p^n * c / kP^n fractions in s64. The raw pressure scales with kP, which
goes up to 7864320, so p^3 * c30 overflows at most oversampling rates
near sea level, kP^3 wraps negative at 4x and 8x, and the remainders
overflow when scaled by 10^9. The c30 term is then lost: at about
1006 hPa the pressure reads about 20 Pa low at oversampling 2, 4, 8, 64
and 128, and hundreds of Pa off towards the ends of the 300-1200 hPa
range.

Evaluate the polynomial in Q20 fixed point instead. The linear c10 and
c01 terms are still divided exactly, the higher order terms use the
scaled raw values. Over 300-1200 hPa and every oversampling rate the
result is within 1 Pa of the floating point formula.

Tested on a register compatible Zilltek ZTS8032 (support added later in
this series) at about 1007 hPa, against the datasheet formula evaluated
from the raw and coefficient registers. A vendor driver with the same
algebra read 13-20 Pa low at oversampling 2, 4, 8, 64 and 128; with this
series every rate is within 1 Pa. Not tested on a DPS310.

Fixes: d711a3c7dc82 ("iio: dps310: Add pressure sensing capability")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 drivers/iio/pressure/dps310.c | 83 ++++++++++++++---------------------
 1 file changed, 34 insertions(+), 49 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 85df58ac1809..3bc690cc8609 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -660,71 +660,56 @@ static int dps310_write_raw(struct iio_dev *iio,
 	}
 }
 
+/* Fraction bits of the fixed point pressure compensation */
+#define DPS310_Q	20
+#define DPS310_Q_ONE	(1LL << DPS310_Q)
+
+static s64 dps310_mul_q(s64 a, s64 b)
+{
+	return (a * b) >> DPS310_Q;
+}
+
 static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	__must_hold(&data->lock)
 {
-	int i;
 	int rc;
-	int kpi;
-	int kti;
-	s64 rem = 0ULL;
-	s64 pressure = 0ULL;
+	int kp;
+	int kt;
+	s64 pressure;
 	s64 p;
 	s64 t;
-	s64 denoms[7];
-	s64 nums[7];
-	s64 rems[7];
-	s64 kp;
-	s64 kt;
+	s64 ps;
+	s64 ts;
+	s64 x2;
+	s64 x3;
 
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
 	p = (s64)data->pressure_raw;
 	t = (s64)data->temp_raw;
 
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
+	/*
+	 * Section 4.9.1 of the DPS310 spec in fixed point. Dividing p^3 * c30
+	 * by kP^3 directly overflows s64 at most oversampling rates.
+	 */
+	ps = div_s64(p * DPS310_Q_ONE, kp);
+	ts = div_s64(t * DPS310_Q_ONE, kt);
+	x2 = dps310_mul_q(ps, ps);
+	x3 = dps310_mul_q(x2, ps);
+
+	pressure = data->c00 * DPS310_Q_ONE;
+	pressure += div_s64(p * data->c10 * DPS310_Q_ONE, kp);
+	pressure += div_s64(t * data->c01 * DPS310_Q_ONE, kt);
+	pressure += dps310_mul_q(data->c11 * ps, ts);
+	pressure += data->c20 * x2 + data->c30 * x3;
+	pressure += dps310_mul_q(data->c21 * x2, ts);
+	pressure >>= DPS310_Q;
 	if (pressure < 0LL)
 		return -ERANGE;
 
-- 
2.55.0

