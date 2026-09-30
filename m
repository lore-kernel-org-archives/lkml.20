Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862203CE49E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762534; cv=none; b=nUhLr0n9++MG88m/014TRN2qS/FuZ39CE8XHcChZYd/wvUyCokY3aUHTEb6ZZemXbKriMPQTojqzwRMSn6m/9FNzfSzaI/tcSv7KbRvLnZfxaeEtIr1ucyyLKp0Mv5yW560yY+7r92F59rCNf8d3OJt0gv05Yunvl1L/pCaarTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762534; c=relaxed/simple;
	bh=1rFZsg+Z5sWsSqhdGi/mlZV+y/+IRKzY2Itze28hDCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IhKTDgAA63MJPhPoZ1IUKXpnk3JDWV0LaXoM8n1aZ9Q0DsjN0UuzUl1/wuy80J5S7JO6zv4aKCpbHc14DtQ+Zzra7mo9pKVpOl8AwW5UsUnkMaWbqkj0/45Ct2lhSvjlHEY4xQSktm05N516ZzGXAPB23eP9o7TD+I782lILAJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndzOvIeV; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndzOvIeV"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8ea203e5bso4369806e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762528; x=1791367328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQXVYE5SQMyZN1p+2/OR0/p0MeYTZXXNgWFF5Z/oQKc=;
        b=ndzOvIeVft5DDCmnTQ/PcDueKUj2EDYpOZXUqXmXvo++QLNBmmLrxj0p6FjLkq7jt/
         NZj1TdRypObANNd+LJLjSQoMT5dbxake7qW5WZyAH9hfJzjztOepK5L4eZ0622NZaV5X
         wwneKWRxd7DSj0Er0n5kBkZPd1pXh8vJYUf7PbvRwj5dvHVD4fx2/EtqYqMXZC+Z0hc8
         1/kCMxeAD4tELrtCBJKh2ps6OSJHlbpp7mizxStc4HhLAArCtoP4PFIMI9RPCzZs4cp3
         Y4yYlB9aEpuFPLGwWO7FFu98tY8Ct6nNMoEL1iGYQuRonh9xifdVnqmc5eHyskh0U5yS
         5vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762528; x=1791367328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQXVYE5SQMyZN1p+2/OR0/p0MeYTZXXNgWFF5Z/oQKc=;
        b=g0cHNNkU0eeSs0T91G8qLmM1iYZWQL4RVx5/X7Wtn+n/YVkyDAOpx7saglcn2MkGq9
         Ozpi3V2QZ/0/oUx2cW0iMIcz1m8kJS+T3fsUnHz2cZUiEaXWv2vpluuLsn72lIjX4pls
         d2zgv19BTSsRMGheUiQTOIbrAMoah1TkrorfYpQrJvn/OXUhqu/HzEcCrXl1BmpSgH/5
         Gwb4qHFbD7PdPXWJOLkaC8qcoVna501lCOPYkC8gbpiE7Vpntc05aetSTzZXPxZ+NdxC
         7WpDQehvnflrf+JenTHrl63s9vughb0ijOPRwe3LPECaWJpI4HT+E4eMkrU8y55qi4qD
         HTcw==
X-Forwarded-Encrypted: i=1; AKwUvBxrrHQXv9A5fervrMNvjP7lzPkBFbUx5N1QSx5eq0PPWzskDyOxfQI5589kDoWhC5xFCMxoheb7c4tvLAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+kTyMzPUpKQ2VFp05pNri+O6eq9xaAcvfYCf5464oiW7gEz9Q
	4oaMOC7uZ+Qk53P335m3CyEwM2N7kFAf0eBTeLQpGNS71Pnlc2VEACnf
X-Gm-Gg: AYBFou35j2Kks0WjBHRMUaVaS/eWfmb7ldc0cHFwKUFkYw18SExhdhARBVp+6hJCiVG
	cvAUnhRdgPk4nIpeCvaSNSrQ2rexlPK1egoiwxen4z9EOTseYd4LcdUncfFJ2/UtadakWmZ3jqp
	Cx7e3tOmSg7Z2bXOMk92EogIiM8E1sIberqrWKv5atBXtc4aYiR8h8OI7I1fupI/L2KS111GOI/
	9Hu2GbC3whlxhTSD0gFhYy+qGyt9VKqkOzRALBD2tE/NaDeh2gD11Gg8Bw5zj6bJXpWp8K/eefh
	xHDazDvz59aaf2FXTTjOtiiW3/LUiyy4sKFL13MfJTOmau79OStmq8j3L/1HAaa8//2/sHx4f/y
	sk7XvmqjDF2ArsBE7+TKz1zaO/JHY+/6JKFqsq1E3HaHcvnMMwVhaq2ow6RcCKtAvDdzCdJHV2g
	u2kx5pZcBN8+bIUI9hJVYX+PkqMfwky1ksl7TttIeXstN3mGhCPj/KYYOPjfp69t2PndIpiwB6V
	Jr6iiQSNPP9UWkUQMsGzsZZX4Wuyw2PJtgonnsrNTDEcNQe46t4pF/udKt42PMZz4qUIA==
X-Received: by 2002:a05:6512:292:b0:5b6:1a7c:fd83 with SMTP id 2adb3069b0e04-5ba40602483mr257747e87.41.1790762528177;
        Wed, 30 Sep 2026 03:02:08 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbe6c06sm240422e87.22.2026.09.30.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:02:07 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v10 4/4] iio: pressure: dps310: assert the lock at runtime too
Date: Wed, 30 Sep 2026 13:01:58 +0300
Message-ID: <20260930100158.957977-5-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930100158.957977-1-zoone.rupert@gmail.com>
References: <20260930100158.957977-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__must_hold() is clang only and does nothing in GCC builds. Add
lockdep_assert_held() next to each, so lockdep catches a missing lock
too.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 01fca139433a..791ff22b0304 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -12,6 +12,7 @@
 #include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/limits.h>
+#include <linux/lockdep.h>
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
@@ -358,6 +359,8 @@ static int dps310_set_pres_precision(struct dps310_data *data, int val)
 	int rc;
 	u8 shift_en;
 
+	lockdep_assert_held(&data->lock);
+
 	if (val < 0 || val > 128)
 		return -EINVAL;
 
@@ -377,6 +380,8 @@ static int dps310_set_temp_precision(struct dps310_data *data, int val)
 	int rc;
 	u8 shift_en;
 
+	lockdep_assert_held(&data->lock);
+
 	if (val < 0 || val > 128)
 		return -EINVAL;
 
@@ -395,6 +400,8 @@ static int dps310_set_pres_samp_freq(struct dps310_data *data, int freq)
 {
 	u8 val;
 
+	lockdep_assert_held(&data->lock);
+
 	if (freq < 0 || freq > 128)
 		return -EINVAL;
 
@@ -409,6 +416,8 @@ static int dps310_set_temp_samp_freq(struct dps310_data *data, int freq)
 {
 	u8 val;
 
+	lockdep_assert_held(&data->lock);
+
 	if (freq < 0 || freq > 128)
 		return -EINVAL;
 
@@ -508,6 +517,8 @@ static int dps310_ready(struct dps310_data *data, int ready_bit, int timeout)
 {
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_ready_status(data, ready_bit, timeout);
 	if (rc) {
 		if (rc == -ETIMEDOUT && !data->timeout_recovery_failed) {
@@ -538,6 +549,8 @@ static int dps310_read_pres_raw_locked(struct dps310_data *data)
 	int timeout;
 	u8 val[3];
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_pres_samp_freq(data, &rate);
 	if (rc)
 		return rc;
@@ -564,6 +577,8 @@ static int dps310_read_temp_ready(struct dps310_data *data)
 	int rc;
 	u8 val[3];
 
+	lockdep_assert_held(&data->lock);
+
 	rc = regmap_bulk_read(data->regmap, DPS310_TMP_BASE, val, sizeof(val));
 	if (rc < 0)
 		return rc;
@@ -580,6 +595,8 @@ static int dps310_read_temp_raw_locked(struct dps310_data *data)
 	int rate;
 	int timeout;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_temp_samp_freq(data, &rate);
 	if (rc)
 		return rc;
@@ -601,6 +618,8 @@ static void dps310_refresh_temp_locked(struct dps310_data *data)
 	int rc;
 	int t_ready;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = regmap_read(data->regmap, DPS310_MEAS_CFG, &t_ready);
 	if (rc)
 		return;
@@ -706,6 +725,8 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	s64 kp;
 	s64 kt;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_pres_k(data, &kpi);
 	if (rc)
 		return rc;
@@ -831,6 +852,8 @@ static int dps310_calculate_temp(struct dps310_data *data, int *val)
 	s64 t;
 	int kt, rc;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_temp_k(data, &kt);
 	if (rc)
 		return rc;
@@ -939,6 +962,8 @@ static int dps310_fill_channels(struct dps310_data *data,
 	unsigned int i;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Compensation needs a temperature, so it is sampled either way */
 	rc = dps310_read_temp_raw_locked(data);
 	if (rc)
@@ -969,12 +994,16 @@ static int dps310_fill_channels(struct dps310_data *data,
 static int dps310_fifo_hw_flush(struct dps310_data *data)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	return regmap_write(data->regmap, DPS310_RESET, DPS310_FIFO_FLUSH);
 }
 
 static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	return regmap_assign_bits(data->regmap, DPS310_CFG_REG, DPS310_FIFO_EN,
 				  enable);
 }
@@ -1015,6 +1044,8 @@ static int dps310_fifo_read_entry(struct dps310_data *data, s32 *value)
 	s32 raw;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Entries come out of the pressure registers whichever made them */
 	rc = regmap_bulk_read(data->regmap, DPS310_PRS_BASE, val, sizeof(val));
 	if (rc < 0)
@@ -1039,6 +1070,8 @@ static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
 	unsigned int i;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Direct-mode claim keeps sysfs reads off these */
 	data->temp_raw = temp_raw;
 	data->pressure_raw = pressure_raw;
@@ -1065,6 +1098,8 @@ static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
 static void dps310_fifo_hold(struct dps310_data *data, s32 pressure_raw)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	if (data->fifo_held < data->fifo_hold_max)
 		data->fifo_hold[data->fifo_held++] = pressure_raw;
 }
@@ -1076,6 +1111,8 @@ static unsigned int dps310_fifo_push_held(struct dps310_data *data)
 	unsigned int pushed = 0;
 	unsigned int i;
 
+	lockdep_assert_held(&data->lock);
+
 	for (i = 0; i < data->fifo_held; i++) {
 		if (!dps310_fifo_push_scan(data, data->fifo_temp_raw,
 					   data->fifo_hold[i]))
@@ -1109,6 +1146,8 @@ static int dps310_fifo_drain(struct dps310_data *data, unsigned int max_scans)
 	bool is_pressure;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	for (cnt = 0; cnt < DPS310_FIFO_DEPTH; cnt++) {
 		if (max_scans && scans >= max_scans)
 			break;
@@ -1180,6 +1219,8 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
 				  int tmp_rate)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	data->fifo_temp_valid = false;
 	data->fifo_held = 0;
 	data->fifo_hold = NULL;
-- 
2.43.0

