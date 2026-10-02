Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A48A42E417
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925941; cv=none; b=aHJDZVrJVGoyRSqGYANxmQPa5nhFbshZ1pa46+vTn/Y5IULeV5EaAHVJfqHy9ewFswRX/LKq7XvWkYV7+zPtqg9pnvkG3/EB4USNNJ9L2mI4V2CkgkBlMw4wltt/sznFinqfUbRG8lCDXGKqtb66rADEM+QPGnZKzU6nhF+iSbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925941; c=relaxed/simple;
	bh=/dgj7zfR6CSQyTlPW7LygJx5YglEs89NmIli7YdYFl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FxgkSrzX6u7ph8gMyh2PF8N8bsEURf/lAMJtXKnUmcPH+5mnH3ddWh8yuvwZqBMXVeOvMOCcneRe9/bmffx1sl9mgnceBaBfln6T6aI/4nKhgnnR2vKr2KqrqI4IrwLKSeNmMRowAwoCX5UOuFyfF2qPLX0j0Sy3z1Q9C5zJJIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjFQCXeo; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjFQCXeo"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a3156692c6so59458601fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925934; x=1791530734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+AWV0mPlOkcepX7XHWJC3YcNyaCDXOtc3fG330bCm0=;
        b=sjFQCXeoALB8QI6KEgBvU5dKaawhO3cUdpcdRNJhdOi9g3tKFifElJ+E6GIlRblGiD
         ZI87V8WLVxUAgA8SWE0fruD+PKbtSRCxer+HSH/eEmxqKjDCW2iwU7wWH02l2Y+L5Ryr
         exE94XH2Nz59Q4yFXdaMYxR9V2DVdQNRzUTY73Wwa3m4EjEVmkKUjPl15S+5ZRJ9L9HP
         Ed3lEBHnUX+/C9asuegQP6oLJNrqhOVELDYt1fWba+pBicfF2x0ociMaiblzWw76SSrR
         OmDGzzEC6lJvYRv19XK6Ty4fu0LDypAyzhurYsQ8cCDbi6YfKulsMnUNwXB51szpLVry
         8M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925934; x=1791530734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+AWV0mPlOkcepX7XHWJC3YcNyaCDXOtc3fG330bCm0=;
        b=nbIu0sTJdTTc8sPNW6FBNNvK+hnIj+cKcqMvzFe8csg4b53yzJru/44F9ohP78Dx0h
         B539j2nF54OPOUZ2L0tnBSQopflQUK/azdzeFOUJeDq9cSLhU5zC3binYRIA0rNkoGUt
         mDcgCq3+NJCDnVd2u9m5z8l5mmBOAzOsd5wFQ+y0IuK0IQ9T2HZ45+yzG/tBfJ98PEBG
         152W05zGXpGXfgW5u2/U7M5mzZ9FKNmEvOo37IDzpQE0eQJo2IRbOLAnyyFH3ixVx0XN
         5aQq/Np0xt5sggYqAP8IfCKmwOVzfUKOO+798CubnlsUjljNeUjACJ8AG3J2l7W9hiBI
         uceg==
X-Forwarded-Encrypted: i=1; AKwUvBzq4UQrvWPa0qqxt7yQuh8PYi/04EqUhqw0aLvW/laxnqLpU1sHMyaaWR1XzW51tw1DfGpuo9H7wHh/9XQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlpAmMw+3kqFEr95rFAHzDO1c/kXoPTDkul9Gjnk9qngyIRpcd
	EXNYVER+gPl5v/LbuKAHHsjzHpBVDCgXVpOMUfawgra3qL5bGBPrhhC3
X-Gm-Gg: AYBFou1o3WQcK/kw3g0Ta269umuvvF/poMT9u52Ge4g4e5s7JkypUHHjs9QdfgHtP+t
	0uh8zi0CD9VqBMB19fK6anbuG0bx00JAyNaTKmvKDd01ZZtMHLWrAk9ypMN+t6shf8iId5zzsro
	PAXINnLqTJ8aqE8Nx+hSC58sx5Z7PtARqsknMV4eX8EAvGHTnVLQuA2/tiBdC7tEwPwoRXf3xvm
	hn2FkyJEgwU0U1a5RL3wjJa1ZQ4xMSZUUIqr/eg9FdfvVlEmKLsvjqjqZuzcQt37zQdSeZR/WGj
	EuuhK6WA+j59ZyCbSvCc2cTrWSaKhOGGWQYjfItEQK3sC9n7xwVqdE/29TCqNfQFeE9GzHsPwo4
	/J8Zc3gHzeUTns6da8hv7LsEyBXE6uYetBWI3ceugo1RYjyPjJ+clC61FWZGr8YFCxSyMy97wGv
	FIoMjJoAJsyHrb5a/+tF5gwPiFyBNbufGSzB1SzQajNwzNUPNAqi2J43lBxwnu1v0EPMWJlqK8v
	v2mo8nug75Lnhx4sn5aEviOyDsIF0U9UbFhqPcgmvuNXKQFsAtjdRlj1wHPlPDsVNRJZna7Wlrw
	ouv/
X-Received: by 2002:a05:651c:a383:20b0:3a6:5ec0:796c with SMTP id 38308e7fff4ca-3a8877b77b7mr2844991fa.19.1790925933739;
        Fri, 02 Oct 2026 00:25:33 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm6724731fa.36.2026.10.02.00.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:33 -0700 (PDT)
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
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v11 5/5] iio: pressure: dps310: assert the lock at runtime too
Date: Fri,  2 Oct 2026 10:25:26 +0300
Message-ID: <20261002072526.250081-6-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072526.250081-1-zoone.rupert@gmail.com>
References: <20261002072526.250081-1-zoone.rupert@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 959f4bdd3995..1614255312ba 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -13,6 +13,7 @@
 #include <linux/devm-helpers.h>
 #include <linux/i2c.h>
 #include <linux/limits.h>
+#include <linux/lockdep.h>
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -359,6 +360,8 @@ static int dps310_set_pres_precision(struct dps310_data *data, int val)
 	int rc;
 	u8 shift_en;
 
+	lockdep_assert_held(&data->lock);
+
 	if (val < 0 || val > 128)
 		return -EINVAL;
 
@@ -378,6 +381,8 @@ static int dps310_set_temp_precision(struct dps310_data *data, int val)
 	int rc;
 	u8 shift_en;
 
+	lockdep_assert_held(&data->lock);
+
 	if (val < 0 || val > 128)
 		return -EINVAL;
 
@@ -396,6 +401,8 @@ static int dps310_set_pres_samp_freq(struct dps310_data *data, int freq)
 {
 	u8 val;
 
+	lockdep_assert_held(&data->lock);
+
 	if (freq < 0 || freq > 128)
 		return -EINVAL;
 
@@ -410,6 +417,8 @@ static int dps310_set_temp_samp_freq(struct dps310_data *data, int freq)
 {
 	u8 val;
 
+	lockdep_assert_held(&data->lock);
+
 	if (freq < 0 || freq > 128)
 		return -EINVAL;
 
@@ -509,6 +518,8 @@ static int dps310_ready(struct dps310_data *data, int ready_bit, int timeout)
 {
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_ready_status(data, ready_bit, timeout);
 	if (rc) {
 		if (rc == -ETIMEDOUT && !data->timeout_recovery_failed) {
@@ -539,6 +550,8 @@ static int dps310_read_pres_raw_locked(struct dps310_data *data)
 	int timeout;
 	u8 val[3];
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_pres_samp_freq(data, &rate);
 	if (rc)
 		return rc;
@@ -565,6 +578,8 @@ static int dps310_read_temp_ready(struct dps310_data *data)
 	int rc;
 	u8 val[3];
 
+	lockdep_assert_held(&data->lock);
+
 	rc = regmap_bulk_read(data->regmap, DPS310_TMP_BASE, val, sizeof(val));
 	if (rc < 0)
 		return rc;
@@ -581,6 +596,8 @@ static int dps310_read_temp_raw_locked(struct dps310_data *data)
 	int rate;
 	int timeout;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_temp_samp_freq(data, &rate);
 	if (rc)
 		return rc;
@@ -602,6 +619,8 @@ static void dps310_refresh_temp_locked(struct dps310_data *data)
 	int rc;
 	int t_ready;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = regmap_read(data->regmap, DPS310_MEAS_CFG, &t_ready);
 	if (rc)
 		return;
@@ -707,6 +726,8 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	s64 kp;
 	s64 kt;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_pres_k(data, &kpi);
 	if (rc)
 		return rc;
@@ -832,6 +853,8 @@ static int dps310_calculate_temp(struct dps310_data *data, int *val)
 	s64 t;
 	int kt, rc;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_temp_k(data, &kt);
 	if (rc)
 		return rc;
@@ -940,6 +963,8 @@ static int dps310_fill_channels(struct dps310_data *data,
 	unsigned int i;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Compensation needs a temperature, so it is sampled either way */
 	rc = dps310_read_temp_raw_locked(data);
 	if (rc)
@@ -970,12 +995,16 @@ static int dps310_fill_channels(struct dps310_data *data,
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
@@ -1017,6 +1046,8 @@ static int dps310_fifo_read_entry(struct dps310_data *data, s32 *value)
 	s32 raw;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Entries come out of the pressure registers whichever made them */
 	rc = regmap_bulk_read(data->regmap, DPS310_PRS_BASE, val, sizeof(val));
 	if (rc < 0)
@@ -1041,6 +1072,8 @@ static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
 	unsigned int i;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Direct-mode claim keeps sysfs reads off these */
 	data->temp_raw = temp_raw;
 	data->pressure_raw = pressure_raw;
@@ -1067,6 +1100,8 @@ static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
 static void dps310_fifo_hold(struct dps310_data *data, s32 pressure_raw)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	if (data->fifo_held < data->fifo_hold_max)
 		data->fifo_hold[data->fifo_held++] = pressure_raw;
 }
@@ -1078,6 +1113,8 @@ static unsigned int dps310_fifo_push_held(struct dps310_data *data)
 	unsigned int pushed = 0;
 	unsigned int i;
 
+	lockdep_assert_held(&data->lock);
+
 	for (i = 0; i < data->fifo_held; i++) {
 		if (!dps310_fifo_push_scan(data, data->fifo_temp_raw,
 					   data->fifo_hold[i]))
@@ -1111,6 +1148,8 @@ static int dps310_fifo_drain(struct dps310_data *data, unsigned int max_scans)
 	bool is_pressure;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	for (cnt = 0; cnt < DPS310_FIFO_DEPTH; cnt++) {
 		if (max_scans && scans >= max_scans)
 			break;
@@ -1182,6 +1221,8 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
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

