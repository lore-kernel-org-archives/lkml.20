Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8CC495021
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057029; cv=none; b=OzdBYD3hbTvCyflUygvCVG/+2CytFH9pPHQB8RSRg6JOO37vf2RZNvQUmItPGQ3EPh01BBHgRb2JXYwSFruqQNVCV1ihYnck8DnqTL9/qh4hgvHaztfo82B5PwwdJRuOAOoVDMxO/bHnp3mbzNZDfWbayKMLsF26QUu9vg8xQIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057029; c=relaxed/simple;
	bh=yKZ3RAuB9c8QvP51Mnfq7TMJVSdVuwbAyl129LQ9ebY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7CVxMymBEFB8ysnUhw14OunoZcnl/7lCQ4dmUEfmDfIxQ283/EbwolIrwj766YdZma7FpBvVmjCg7TDbJAhbJC65BfihR/jY+TiBqqxQbYwWY4JpHmgjiGcYWjBRMCNFde/eZMch5PXu7Zgqq3g0JyK01iTDpf6jrekn4i6vC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lyqb8zE9; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lyqb8zE9"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso347619e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791057025; x=1791661825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5x87dEIj4ZkmRs3wXiwE88rd8/NOqK6OzoSInLWsrs=;
        b=Lyqb8zE9sgqhqV0kyP3ceGmPlg91WdRWhkk5T3fGgHAO7ucWpiCxgqIrOYXYHzRfzU
         2Sc8KOQgutl/iBTfeASgQXavElWsAUycjxltcrtN+GWoEQlIZOD0t2oNHHbEDjMctiEN
         5r/wjCZw+uTmQWa3KRzA8CkfNuaIXxgwVri+aszSq3G3UHfHThlHqzYm+c7rEvcS4xBy
         G0tKmUewWXh82Hj5RECJRwT2ffvZOA7DavhhJv716WYH9/3hZU8cZJu7+UY085UEKfJs
         T2l5Nh9ETWw2Yuamx04p7hJgWf9GuHzxP6O5UnuyGUAzrBtoFFv9ssngwsnZIWXKwnrn
         fvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791057025; x=1791661825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5x87dEIj4ZkmRs3wXiwE88rd8/NOqK6OzoSInLWsrs=;
        b=bWJLGhZVKSB5YYQrOlr6lVfMfgWpmYSqQfCeZNjTf/ceRgR6oOQNnwTvG3vglqCnIN
         lV2iqMwgMgJU7heDNUF2DFbSSfgHwp+9Ub1RU/9DhRllL7utSAKN3P7ntpjHMO0z7Gyb
         cVSxsSKqyLBp9ELsE7Ec7x3Ddd/6NnjkexKB7/1aRnsIQMJqwGzYlpRBKiCcYA84zwDA
         pEFWvtZVgL3dpHdbwzn7wwkndNXSEVmOY8zGsB2Uowe0G6gZHSyyYNFHsu5v1YF/anOv
         mgFZRIU1EzXO8zJVnmJqHu186L0kP8LnCZ27XRjM0umHd2ZtoCrLkknnD6OrBwIldXWZ
         lxfw==
X-Forwarded-Encrypted: i=1; AKwUvBzSjfkFunJ31UOaY8Vs7AbGQkIC+W8YzaP20MyZbQ3gLgM9xe3wTQ0I7YQxx6y+9p1gO70I+onxtDu/AiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI40lbgubzhff5EJUa/RvhGRnC4Rs5pKpb4M3Gu5jv2RlKJV67f
	lu+9juOv3719rU5FwJ6UgD8BRmT1LWVRqOZhMRyObtYT9/w9OhEG1yFQ
X-Gm-Gg: AYBFou1SP8R7ngr3d3nDJOVIYpm7UyLljsCpxSksoepwjBLlBYR7z/wz3sIjuJw38V5
	oh98W3zCHEHuX3Tqu6mdbmNs0ovOnyMzLGUCmG/V7WhtvKO0qTvh1uqPRHzf7XHBLn3U44BT+Oe
	/NW1/eO895wYXq0cIMB7A7SbCqf7bvh/9tw0vSdz1JdC5Vz3hxA4cP3z8q7Jv7BBEBuo6TUhFJG
	jN9apoMugAK/hKJBrK6jIzs0kMCrVo0MtKmtf+at4l9p6VpGbYhlWewspbKlPT/RdAxvbIY80RZ
	7M5E9wtD+oEL2V3vv1nwsLL990ZdqUUvma1w2hrnoEdOYf/TqTR0GlfbHDy0VRBr3zcMvJQwmds
	HDh2G7c0DaKtMRu32jxxp1koOq96Yq50yNj/idhoG+nvv9dq3eyOeyF9ULuETL5q8jwUVkXKHQ8
	kuBIyFDf19/BtjjHVd70lRoDcdvPKMCNC4kEcu7pq7V+9UzUVOWEQhMyGPDWkxwYV5mcFbWZmh4
	c3V5uhXb5LK9KK9oPN3O+SsB+i7vdqczLQl94bUn0lgkb4AMxb7FgbXotT9zawEquyxLg==
X-Received: by 2002:a05:6512:110c:b0:5b8:f7fc:959e with SMTP id 2adb3069b0e04-5bcb546ac23mr1367126e87.34.1791057025052;
        Sat, 03 Oct 2026 12:50:25 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7abdbfsm1762608e87.65.2026.10.03.12.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:50:23 -0700 (PDT)
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
Subject: [PATCH v12 4/5] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Sat,  3 Oct 2026 22:50:10 +0300
Message-ID: <20261003195012.92948-5-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003195012.92948-1-zoone.rupert@gmail.com>
References: <20261003195012.92948-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let userspace drain the FIFO on demand rather than only from the
periodic drain.

Hold the mode across the drain, so a concurrent buffer disable cannot
free active_scan_mask while it runs.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 528dc9283738..d70a0fa69c25 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1086,22 +1086,29 @@ static unsigned int dps310_fifo_push_held(struct dps310_data *data)
 
 /*
  * Read the batch out before compensating it, so a pressure entry pairs with
- * the temperature preceding it rather than the last one in the batch.
+ * the temperature preceding it rather than the last one in the batch. Stop
+ * at max_scans, as reading an entry removes it from the FIFO. Zero means no
+ * limit.
  *
  * Returns scans pushed.
  */
-static int dps310_fifo_drain(struct dps310_data *data)
+static int dps310_fifo_drain(struct dps310_data *data, unsigned int max_scans)
 	__must_hold(&data->lock)
 {
 	bool pressure_enabled = test_bit(DPS310_SCAN_PRESSURE,
 					 data->iio->active_scan_mask);
 	u8 kind[DPS310_FIFO_DEPTH];
 	s32 raw[DPS310_FIFO_DEPTH];
+	unsigned int scans = 0;
 	unsigned int pushed = 0;
 	unsigned int cnt;
+	bool is_pressure;
 	int rc;
 
 	for (cnt = 0; cnt < DPS310_FIFO_DEPTH; cnt++) {
+		if (max_scans && scans >= max_scans)
+			break;
+
 		rc = dps310_fifo_read_entry(data, &raw[cnt]);
 		if (rc < 0)
 			return rc;
@@ -1109,7 +1116,12 @@ static int dps310_fifo_drain(struct dps310_data *data)
 		if (rc == DPS310_FIFO_EMPTY)
 			break;
 
+		is_pressure = rc == DPS310_FIFO_PRESSURE;
 		kind[cnt] = rc;
+
+		/* Only the measurement that drives the scans counts */
+		if (is_pressure == pressure_enabled)
+			scans++;
 	}
 
 	for (unsigned int i = 0; i < cnt; i++) {
@@ -1146,7 +1158,7 @@ static void dps310_fifo_work(struct work_struct *work)
 	int rc;
 
 	scoped_guard(mutex, &data->lock)
-		rc = dps310_fifo_drain(data);
+		rc = dps310_fifo_drain(data, 0);
 
 	if (rc < 0)
 		dev_dbg(&data->client->dev, "FIFO drain failed: %d\n", rc);
@@ -1180,6 +1192,22 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
 	return 0;
 }
 
+static int dps310_hwfifo_flush(struct iio_dev *iio, unsigned int count)
+{
+	struct dps310_data *data = iio_priv(iio);
+
+	/* Holding the mode keeps active_scan_mask alive across the drain */
+	IIO_DEV_GUARD_CURRENT_MODE(iio);
+
+	/* A trigger drives the capture instead and leaves the FIFO empty */
+	if (iio_device_get_current_mode(iio) != INDIO_BUFFER_SOFTWARE)
+		return 0;
+
+	guard(mutex)(&data->lock);
+
+	return dps310_fifo_drain(data, count);
+}
+
 static int dps310_hwfifo_set_watermark(struct iio_dev *iio, unsigned int val)
 {
 	struct dps310_data *data = iio_priv(iio);
@@ -1315,6 +1343,7 @@ static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
 	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
+	.hwfifo_flush_to_buffer = dps310_hwfifo_flush,
 };
 
 static int dps310_probe(struct i2c_client *client)
-- 
2.43.0

