Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE4F35DA47
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262479; cv=none; b=nSPJY/N0VJePYxkgg45bUzjNoL7oh4UYwcj3UzkuFb6t/4kasmlkzt750qZ3XkSycdL5NZX5BOs3Rh3I2Hq0IJsbknZm7rgahiUBtW+wIozZNe8l+zT1DZcFPmDsKHo7uZ15hWYWLAoChN4D/Cy9AHQikhkrct3pf2aOumOecJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262479; c=relaxed/simple;
	bh=yJl+eki8y7adl6ySMsp8W00sF5OXWrJCwq3qB3qXtZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBmZc1I/1zqnFijHyzqPKKQIJiSxiknFsaZQqNUO7zcyjLaqWLZ3nYeavjLnGoi6M6O2u7yQK3pDF0f4fMB3SoynLMOJvLGCNk3qj0CbfGvNYcpM2mZWvMwIWP2v9eUEQIQM9eumACd+cYZbBrtluCS2v/rv6Vmqlhr1C+/6Yv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOg8YqLn; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOg8YqLn"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1052702eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791262477; x=1791867277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QwD0GFUpEuWBYXkfCj3Gkl1PIYwOPa4b9NPZefdqx4=;
        b=sOg8YqLnHJVbpDZy2H/EYmgunCmM7vIYrwoXbQz8z8VpeMMXjUyqUTYPIdcIwuf4jU
         rmxLLH9i+eCEGJQR/UpxFT7TL0k4PK62IHj3GXVYRKyKb9vPct1dDVfd1NPb8BIZDCEr
         NeZIkEHCnufwyIP3Xl0L884S9lXafCSSTVnXo+eW5ZLvPxMZ+yUCKYvxaHhjQLM74C6M
         dIUoH87F/3f6jMqr+VrBKG7kU2cVh56T5dd/dsZRcrD2WYWaZgy8j3m6B02izGVMHpno
         YANoU5D3QyYzKaf08XdwI02Lr1ECps+Pd6o2nVRTBlKiGQZRIRzL55FIGUMuIZrJAaos
         cxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262477; x=1791867277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3QwD0GFUpEuWBYXkfCj3Gkl1PIYwOPa4b9NPZefdqx4=;
        b=OchtXqmDMT3VLidrsNpnJ5tSdDkBwVL3bwTfgUJoumX6L1NFACMepOyWBWfI1uhWcB
         TuwrJitTeSxtYqvQ3blTcUhFeN9jrOOLgGGiO69ruFk4N9uj1+NZlJjf4AhGVSl+HOav
         csqKhTwtzL4UaZhd9BQl/IhHWTzgZq1jclaDNHB0DFXF9HfS4sHXuA/GC3t+grCGrorA
         xSxEGOn9cKZ+Yn9HUIQr4iMywShLMZj2lbIp1YSFlof6kVb5jtWhHo/u4FmlvtbbPd+8
         +Xh7uUMgCmj5LW+fnyto3Awgn5m39dzM7HvWaLUbFjRJ2gCaup7b3kjQ8QC/1q08J00m
         Ssug==
X-Forwarded-Encrypted: i=1; AKwUvBxr2Ghk8Fco4dgCidmUaZMSyhr3RxoUbYmYw1ObQ20dig/AhdNZ/V+3cFcE/uLg/QipKbf29v9jCRaNOJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlsq3bPzv4Vg4RgGeyNWA/xEs02r2hh9b8KhNznF/3VeshfRPd
	pTaWARWj8rqqE6j6BLLDRh8Cv52fWzAcDSDtpxys9VmlKiGjF0WUrV/T
X-Gm-Gg: AYBFou3a+ssK15XvVK/iyxo1B0A2GrqMUncF0craqESSXB1ZfhRDxgPmwH/X8Sx8hwF
	dg2BwJd1Ze9sY6W/7sXTBTVAEMc2CTefsRMoQLIFA6UVT09VGg+KCkZTydnx0iHczNP6rEVGwDp
	fU7YcgIWnPVjm12uVkYRMhnco6HF9KchAtvdo2qce6gvfYOmjHlWHC0b5A8U7jc+i5jLyUEIIaG
	o+ySyVXWBM1xTjk/HLLGcPqlRvhlybrFI5NHKOxxPgxjBq6o5Hd3Cp86iau3QbLH/81iHlRSQ26
	PyFeH9YxSKOlWySjdoAgM0Wrx6nHz6BIGIMEHqmph2X3lLEF9EKd6RST7eVh36m1Aa0ThsKjg0x
	Vsw9N+9RHIgwPS8vepqQegTVOwgb/MLojHq986Ea9fyfMuerQmtNWtYl5JiAQVO1ZgYTbRw4dVr
	wrXs/BziEN4Q4V3RQvZZVdUhKxFomcxGH4Ml5vVEgI3MOKO9nKrA6qT3xlc8a+G1CZligfUViah
	4Y9nE38uGMCpwMZVn7yTTkT/yAdBweS8WO8JiEkzxeCtR5TOkI1EzeVN3xItkTab4ubYSVnVlXO
	+LCIFchDq8aXEluhnec3m0yG0ro9JQ==
X-Received: by 2002:a05:693c:6383:20b0:33b:e47c:f3a3 with SMTP id 5a478bee46e88-3514e3dad52mr174970eec.39.1791262476611;
        Mon, 05 Oct 2026 21:54:36 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b3b5aesm5539737eec.29.2026.10.05.21.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:54:35 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Sean Nyekjaer <sean@geanix.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 2/2] iio: imu: inv_icm42600: fix kernel-doc Return: sections
Date: Tue,  6 Oct 2026 10:24:04 +0530
Message-ID: <20261006045413.14320-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006045413.14320-1-kapoorarnav43@gmail.com>
References: <20261006045413.14320-1-kapoorarnav43@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc expects the return value to be described in a "Return:"
section. inv_icm42600_buffer_update_watermark(), inv_icm42600_setup()
and inv_icm42600_irq_init() use "Returns ..." in the body instead,
so scripts/kernel-doc -Wall warns for each of them, e.g.:

  Warning: .../inv_icm42600_core.c:511 No description found for
  return value of 'inv_icm42600_setup'

Convert them to "Return:" sections. In the watermark comment, move it
after the description, so the description is not parsed as part of the
return value section.

Assisted-by: LLM
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c | 4 ++--
 drivers/iio/imu/inv_icm42600/inv_icm42600_core.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c
index 2bf9fc29d7d2..7ecd7257921c 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c
@@ -172,8 +172,6 @@ static unsigned int inv_icm42600_wm_truncate(unsigned int watermark,
  * inv_icm42600_buffer_update_watermark - update watermark FIFO threshold
  * @st:	driver internal state
  *
- * Returns 0 on success, a negative error code otherwise.
- *
  * FIFO watermark threshold is computed based on the required watermark values
  * set for gyro and accel sensors. Since watermark is all about acceptable data
  * latency, we should need to use the smallest latency value. But it is not as
@@ -188,6 +186,8 @@ static unsigned int inv_icm42600_wm_truncate(unsigned int watermark,
  *    dividing this computed latency by the smallest period, which corresponds
  *    to the FIFO frequency. Beware that this is only true because we are not
  *    using 500Hz frequency which is not a multiple of the others.
+ *
+ * Return: 0 on success, a negative error code otherwise.
  */
 int inv_icm42600_buffer_update_watermark(struct inv_icm42600_state *st)
 {
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
index cd2e53416f5b..ccaf8ec468f9 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
@@ -505,7 +505,7 @@ static int inv_icm42600_set_conf(struct inv_icm42600_state *st,
  *  @st:	driver internal state
  *  @bus_setup:	callback for setting up bus specific registers
  *
- *  Returns 0 on success, a negative error code otherwise.
+ *  Return: 0 on success, a negative error code otherwise.
  */
 static int inv_icm42600_setup(struct inv_icm42600_state *st,
 			      inv_icm42600_bus_setup bus_setup)
@@ -639,7 +639,7 @@ static irqreturn_t inv_icm42600_irq_handler(int irq, void *_data)
  * @irq_type:	irq trigger type
  * @open_drain:	true if irq is open drain, false for push-pull
  *
- * Returns 0 on success, a negative error code otherwise.
+ * Return: 0 on success, a negative error code otherwise.
  */
 static int inv_icm42600_irq_init(struct inv_icm42600_state *st, int irq,
 				 int irq_type, bool open_drain)
-- 
2.53.0

