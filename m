Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627283;
	b=U+Wkne882i/dPgbcUUmhOT9ASDUYo5xn+tcy2/OLXyXG1dyFcwYp0mt4iF2TDzloDBVZ
	 o4mEMMS26orIkUK6xJt0GAXmXtlQ+YMsjCLtG5M5ijm0CTquZCWnHMRbGkNOnlvfV0CUF
	 +Re206MkdgbKiZnhcI7ZfOMnPjPm2zhz6A2nx1fVr5pNuAzom0NaHP84TEoYDvgyGnT1P
	 0sUD3iF39g6CRPi/7LKgbiUmlAaKdhlxG/+yxsv93bO0JRhKBBj2W3CN1aexeRcSHPDYL
	 Gb8pqHNIbDYceAYfWOB5Nr7+rw6Kaqt+fJ7hyRLptskigK2UpkaYn2xwp2qiaFxzZVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QhFY06BE5+5Ny++OsMlUpBWCJIit6t0dr+PR4S2GFPQ=;
	b=CirlUOtbDLfEN5L8il7xz0JuUJxglEFcAwrGgEAuvMXtHJqz0/XacJaQ7JC7FBw1Jw8h
	 D1o40BR5q4BC0gHOk2PLIlz3mfZSIxWYG7AN2nLtIOV7V7CGv1W5Wy2XMOw7pC/tBdiPJ
	 eRJsnF/JeIaz47cvzwQSM801fG1HVq0yh+bBaygq874xS3HKYrG1pp90skBGOl3OM3NDN
	 npG598XNJgc5SnlhJ3X5M9VRYmoqUh5Sb+DGXT5Cr0gCGq5pChDqWrpKHxKBudzTuC6AV
	 LbmaUOMTEW/6/7BzeQ0Qz7yvQNBVqPXvtmhT4LWohMAh9U+u3hWbQnEj3seU34SPeJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JCnV45l2;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6B760A2619
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF6B760A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JCnV45l2
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535a54bed9so1800920eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627282; x=1793232082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhFY06BE5+5Ny++OsMlUpBWCJIit6t0dr+PR4S2GFPQ=;
        b=JCnV45l2gjhL8eXSXiTD0ggLu1JVZYJ7/gqPa2pkoIMoeMAaUpiykPaSoZI7Kd7hW/
         nU9/6fgUOzO04L1LtA+R4eyd/Yj5fpzi7YEo++UeFJdA0w8DviVd0o5bKgX2A/oThuNk
         R81RsG7n9+0spQKNjqzpAgGTSbj9LaCZhYPW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627282; x=1793232082;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhFY06BE5+5Ny++OsMlUpBWCJIit6t0dr+PR4S2GFPQ=;
        b=dnwdvF2/m3lBRc4vJBwuB2Jz0LsYw9AYQBZLxzLWqQ8P5tdpLAfDNDIzpmAvneJY97
         g6X660JNPvDcbxASFpWZCsft+cOXKy/76D2mDiMlDtmPKCOoESxRQZ5LLW3BE/gCGOpW
         SXOMHpJIbLRjSLMBbu37H3n9Z9DEt1RrwAdCbpk0au9i8DwUOlmrgPzIOpf46gcTR8XN
         Xtxqgawo7K1r8BpLaR4nzE7ShRChOY/Ve5UnQtPWVMOTmE20jG2Zllr/ByxcjGvxBjZX
         0fttlFBRYDxkMSwMocgGOX+hRfPX47oNOs9YaFpS8FymsbkfMDT93IwMJlTuE1SNWbTx
         IV5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRGDkq1tENCvLQnTRpShsygFDkR5x3U2FQBoJ0lQFJwwzX2B4yfi+sk79eqDdG5THzYl/oBf1kuhlX568=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpxep5B3dvD4RTYhhP4M+k1EC+dNTdWh8Nz0twB4Rc5+8Nv+lv
	hjbWY3DNW6CzKjF3SIsfyPnWKm9WGfBC9ORxck1ig9zMDwwn7Mk5XRQyfpKdxZeJrQ==
X-Gm-Gg: AYBFou2w/+oF4RlUX7ZRf2hvow+/Jvx9tC5TGi0RiMF4X/rg9+3AtT+AYBQDHnpYaIJ
	5MgioEBVxB0oX/jbnJ+OA2jMMbdntkqfsybqU5HgcXZHwWrHnr4XGm4JkL7CCbPFR/c3tdX9s/l
	XVficLpKeBMACA4rFtSsEzebtdd3YHzSc3yFuanVlb9nFkFc6ahMJ7Z/HPeStJYVQkXrHB2M96o
	ghI74Y4o6iGLkNNebywn9BWPmBU4HS1kzGUd3Tfx/EMD9SHovqRqU6cmHTxtJcf6T3zhzEIpqFy
	UWzNEhPc372O2JZn3Tj2AQVGEaoIWU+QyPUbpEmh+iXT2Ye3uCChAMEuwLDWrivChUvgv0FxTbX
	F8l2s6yR38+7q+NQHbRMHu+EA6xI3iwDfn9gJwrNH5A86JE3aRSdFx8zuDgoBlsNHqnbjz3JgqR
	dsSHOf91j5OtzUMAse4rHpGgTXYwTyqm0qFGNvqGDoDQO+LP1II4X1tx68vrbV+sFCA73snM6ti
	ht7gnSkSrtITz3vioIexINP6elSfUQwwTqg2EJ12tPlYwgVr7m3lh/z8J4MF8SAVvsxgwBtXd+1
	Kfs8ADjD3ET/VmgBM/8=
X-Received: by 2002:a05:693c:8399:10b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-3674a40738emr5533249eec.5.1792627281152;
        Wed, 21 Oct 2026 17:01:21 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3674198f1d8sm15879233eec.24.2026.10.21.17.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:20 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/17] iio: accel: bmc150: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:06 -0700
Message-ID: <20261021165858.v2.5.Ib5830d24f9dc7f06103c568f53134ecb7825ca4f@changeid>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021235818.3059519-1-briannorris@chromium.org>
References: <20261021235818.3059519-1-briannorris@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This driver propagates the return value of pm_runtime_put_autosuspend(),
which is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

For this reason, modify this driver to simply discard the
pm_runtime_put_autosuspend() return value, and inline the pm_runtime
helper, now that it behaves the same with and without CONFIG_PM.

While at it, I notice that bmc150_accel_set_interrupt() mismanages the
reference counts. It should only drop a reference after it's done
touching the hardware in question. Adjust the local &intr->users
reference count alongside the error handling too, to ensure proper
balance.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Split iio patch into per-driver patches
 * Inlining
 * Refcount ordering

 drivers/iio/accel/bmc150-accel-core.c | 75 +++++++++++----------------
 1 file changed, 31 insertions(+), 44 deletions(-)

diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
index 46bb36d9366e..9ad6429fb584 100644
--- a/drivers/iio/accel/bmc150-accel-core.c
+++ b/drivers/iio/accel/bmc150-accel-core.c
@@ -326,29 +326,6 @@ static int bmc150_accel_get_startup_times(struct bmc150_accel_data *data)
 
 	return BMC150_ACCEL_MAX_STARTUP_TIME_MS;
 }
-
-static int bmc150_accel_set_power_state(struct bmc150_accel_data *data, bool on)
-{
-	struct device *dev = regmap_get_device(data->regmap);
-	int ret;
-
-	if (on)
-		ret = pm_runtime_resume_and_get(dev);
-	else
-		ret = pm_runtime_put_autosuspend(dev);
-	if (ret < 0) {
-		dev_err(dev,
-			"Failed: %s for %d\n", __func__, on);
-		return ret;
-	}
-
-	return 0;
-}
-#else
-static int bmc150_accel_set_power_state(struct bmc150_accel_data *data, bool on)
-{
-	return 0;
-}
 #endif
 
 #ifdef CONFIG_ACPI
@@ -530,24 +507,18 @@ static int bmc150_accel_set_interrupt(struct bmc150_accel_data *data, int i,
 	if (state) {
 		if (atomic_inc_return(&intr->users) > 1)
 			return 0;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to resume: %d\n", ret);
+			atomic_dec(&intr->users);
+			return ret;
+		}
 	} else {
 		if (atomic_dec_return(&intr->users) > 0)
 			return 0;
 	}
 
-	/*
-	 * We will expect the enable and disable to do operation in reverse
-	 * order. This will happen here anyway, as our resume operation uses
-	 * sync mode runtime pm calls. The suspend operation will be delayed
-	 * by autosuspend delay.
-	 * So the disable operation will still happen in reverse order of
-	 * enable operation. When runtime pm is disabled the mode is always on,
-	 * so sequence doesn't matter.
-	 */
-	ret = bmc150_accel_set_power_state(data, state);
-	if (ret < 0)
-		return ret;
-
 	/* map the interrupt to the appropriate pins */
 	ret = regmap_update_bits(data->regmap, info->map_reg, info->map_bitmask,
 				 (state ? info->map_bitmask : 0));
@@ -564,10 +535,18 @@ static int bmc150_accel_set_interrupt(struct bmc150_accel_data *data, int i,
 		goto out_fix_power_state;
 	}
 
+	if (!state)
+		pm_runtime_put_autosuspend(dev);
+
 	return 0;
 
 out_fix_power_state:
-	bmc150_accel_set_power_state(data, false);
+	if (state) {
+		pm_runtime_put_autosuspend(dev);
+		atomic_dec(&intr->users);
+	} else {
+		atomic_inc(&intr->users);
+	}
 	return ret;
 }
 
@@ -625,8 +604,9 @@ static int bmc150_accel_get_axis(struct bmc150_accel_data *data,
 	__le16 raw_val;
 
 	mutex_lock(&data->mutex);
-	ret = bmc150_accel_set_power_state(data, true);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
+		dev_err(dev, "failed to resume: %d\n", ret);
 		mutex_unlock(&data->mutex);
 		return ret;
 	}
@@ -635,16 +615,14 @@ static int bmc150_accel_get_axis(struct bmc150_accel_data *data,
 			       &raw_val, sizeof(raw_val));
 	if (ret < 0) {
 		dev_err(dev, "Error reading axis %d\n", axis);
-		bmc150_accel_set_power_state(data, false);
+		pm_runtime_put_autosuspend(dev);
 		mutex_unlock(&data->mutex);
 		return ret;
 	}
 	*val = sign_extend32(le16_to_cpu(raw_val) >> chan->scan_type.shift,
 			     chan->scan_type.realbits - 1);
-	ret = bmc150_accel_set_power_state(data, false);
+	pm_runtime_put_autosuspend(dev);
 	mutex_unlock(&data->mutex);
-	if (ret < 0)
-		return ret;
 
 	return IIO_VAL_INT;
 }
@@ -1477,8 +1455,14 @@ static int bmc150_accel_fifo_set_mode(struct bmc150_accel_data *data)
 static int bmc150_accel_buffer_preenable(struct iio_dev *indio_dev)
 {
 	struct bmc150_accel_data *data = iio_priv(indio_dev);
+	struct device *dev = regmap_get_device(data->regmap);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		dev_err(dev, "failed to resume: %d\n", ret);
 
-	return bmc150_accel_set_power_state(data, true);
+	return ret;
 }
 
 static int bmc150_accel_buffer_postenable(struct iio_dev *indio_dev)
@@ -1540,8 +1524,11 @@ static int bmc150_accel_buffer_predisable(struct iio_dev *indio_dev)
 static int bmc150_accel_buffer_postdisable(struct iio_dev *indio_dev)
 {
 	struct bmc150_accel_data *data = iio_priv(indio_dev);
+	struct device *dev = regmap_get_device(data->regmap);
 
-	return bmc150_accel_set_power_state(data, false);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
 }
 
 static const struct iio_buffer_setup_ops bmc150_accel_buffer_ops = {
-- 
2.56.0.218.g1ec904b173-goog

