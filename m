Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8452E7162
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262375; cv=none; b=Nzpima1pGBl9auHVYp0KyNY78L0sSCyarTUKzRNzS9QYkxpbRfQjNlqmHSYjjKMz91LFWWMy2Vs2gz/r67hD2VnTO3BCLGUWwzQCat4kUktvq78clMU6J/7l6wd3I/U9IX7ZBpaJM3Z38UtGQeSwHDhmbpc7JNabDUbCoiWcWL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262375; c=relaxed/simple;
	bh=vAwxTOYdTbJqPJ5N0FRDMltoI9JGGUpE7W7K2butapY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVCk/vXhMUdjQccNovPPSCxDTt5anPx3HIAraWNvDiRne5gX/lxQ/tY/UOol6WxKube4ZFGV04Ox9KjfnvkGfFc+ir0rO506daurLIRQCMuCdTdL932+CYexKx5gQMnef98Cpz/eLLC4kzwLYrFTlNgnIBrSsy08SKvTHh1p8Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBpqL/sy; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBpqL/sy"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-34ceab2900eso155985eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791262373; x=1791867173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjWpsPP1YvaKw0KmwtgkUd07tpE8T1uZ+/jDWJ2bz18=;
        b=TBpqL/sywtmDBwpV9TPPu6sOXe8as3r/A6s9YwXaC+D99CWduwb/kJRGULA8itFvct
         dkYZ0ZS88Qyqfzj+GsOSwdH7ptE9MqCLpnGvwEcIvZtQBYp067iaibFOzlm2ESgIbk2o
         X/wb3PAJyW+Y8V2AWBQUTSZgV0RuR1zYOyBeDkPtX9GSlcTSFnQVPtbdk6ECustSiXue
         3+sDYj9GrwPCCu9rKgojLj9Y+Ha/v7PoIDqQmoyR+q/plX3XeJr1Q/yVN+hLf7/knYdw
         MEkZQa3Q1prD+eD7kN2CRCNTpo1IqT4JYxU0UBfmjsh1sRBzecHV+iuLSgmtjH8sHw/c
         rW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262373; x=1791867173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjWpsPP1YvaKw0KmwtgkUd07tpE8T1uZ+/jDWJ2bz18=;
        b=Kxag6CxY3D/yDhptOQAx07OcZmFQoZax8b2QikdYdd1HS7aKnlVBQMwtDZDb/2ofAs
         SuVmx7qbvEA6jzRxRy2omyQYeWf8pq38sIytqLSG7XTwVs+mPmozt8oIxE/8ehDftc1o
         V2ABcl9K9gH5fukmEWYPsqVbgs9afR8HNU5BM8FOx1OtGrDqIZsGRUnQr+LLS4rKWcNp
         jZbGEb4GN/LinPc1LsCE4gSM4pgr3EJMVHmRtQnshtFydyVnUg61VvUj0m5WNJiTT1Y8
         vAvrXUJdxeURtIRqlchUbpoPaibok9QXBw5SwLv1aZYbetYQzxWuoUbCqDZ1xk0RjTIW
         dM0w==
X-Forwarded-Encrypted: i=1; AKwUvBwm5u/ZrXutTfsTLELgrkT1+ELC3xGdp81yotJxz317IWsEjx0Q+5mGVuhr87I0F/qNWLjvAd8ysdrIugM=@vger.kernel.org
X-Gm-Message-State: AFuF++nTl58D2T/N5SZwMf2Zkf0YOalTtbTgka4tTEVJqpciweQFhpey
	yl/F7tIW8aSbqfuNsDFn5PHpfZSkwslcBqilcKzeZo1vS+WsblSqUDgk
X-Gm-Gg: AYBFou1vlNe4AR8UZs+lTkAw9HpI0VWGxfhQAuoN3+pN4bUUMIDsiYC5wKBZuf/bqjv
	9t6O/lZZM/Fo082HMy5qjCJ7oj6byFrMfslCj57MlfC6o/1ITLT7GMIZ8tihh0Xb9eCWy8PFZ2R
	AQtyMtgHnCJy++LLV3EJimmWpf3AxirU3f7z3GekhsKSORF8pU9SSgUrmxrbshwYGOR7aatxJGd
	TuZKFvnmECGecwwY6f6UK1NUO2FdWAAgWTRUegYCkXNwcUt2PtcrwoaF6Y2/grs4tYcg+HBfGow
	BhuT6lUqvI0Og2wTQgVdpZnahrpDmEsrViTDDbBpbrksvNfOjBJ6lT5rOz3P7U8Cbgs0agOAiE7
	MVtgfFUbQeCieebhR3jB4SODIu7m7bilsp+iFnj2hku/JXsowiuj5tJ10PZapz5exfpC1icFfgF
	OC2eBGf4tGugzh6NNp3wtaoXn9rlbUmk9S4mZ9YwvRSJhtY1F9U43l7i6BpCDoQSLd1+Xg2TWkV
	e4jiaqn20C8Jf7BWLSqpMRqc6VEXlUSbuQsFGkf0fVToC2jx7Wzj0rJebNbX2TTKILyKyDwphdQ
	qa9IVYXx4I3knTVpnej/Bm9DcFf9mg==
X-Received: by 2002:a05:701b:2315:b0:151:7f08:5961 with SMTP id a92af1059eb24-15ec01d35ffmr532725c88.4.1791262372695;
        Mon, 05 Oct 2026 21:52:52 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d816e983asm3728345c88.6.2026.10.05.21.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:52:52 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	kernel test robot <lkp@intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2] iio: common: scmi_sensors: fix truncating 64-bit divisions
Date: Tue,  6 Oct 2026 10:22:41 +0530
Message-ID: <20261006045244.13993-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_div() divides a 64-bit dividend by a 32-bit divisor: the divisor is
stored in a uint32_t on all architectures. The driver passes 64-bit
divisors to it in several places, so they are silently truncated:

- scmi_iio_set_odr_val() divides by uHz, which exceeds 32 bits for
  sampling frequencies above ~4294 Hz.
- convert_ns_to_freq() divides by interval_ns, which exceeds 32 bits
  for update intervals of ~4.29 s and above. If its low 32 bits happen
  to be zero, this is a division by zero.
- scmi_iio_get_odr_val(), scmi_iio_convert_interval_to_ns(),
  scmi_iio_sensor_update_cb() and scmi_iio_get_raw_available() divide
  by int_pow(10, n), which returns u64 and exceeds 32 bits for n >= 10.
  The SCMI exponent fields allow values down to -16.

Truncation results in wrong sampling frequency, timestamp and
raw_available values being reported to userspace.

Use div64_u64() and div64_u64_rem(), which take a 64-bit divisor.

Fixes: f774117c96f9 ("iio/scmi: Adding support for IIO SCMI Based Sensors")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606040245.XfmRpBhA-lkp@intel.com/
Assisted-by: LLM coccinelle
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v2:
- Keep the div64_u64() call in scmi_iio_sensor_update_cb() on one line (Andy)
- Use HZ_PER_GHZ and MICROHZ_PER_HZ in convert_ns_to_freq() (Andy)
- Use the Assisted-by format from coding-assistants.rst (Andy)

v1: https://lore.kernel.org/all/20261003055602.145118-1-kapoorarnav43@gmail.com/

Compile-tested on x86_64 and i386 (W=1); I don't have SCMI sensor
hardware. I checked the arithmetic with a userspace model of these
conversions: e.g. a 5 s sensor update interval is currently reported as
1.418373 Hz instead of 0.2 Hz, and requesting 5000 Hz computes an update
interval of 141837 (does not fit the 16-bit field) instead of 20000.

 drivers/iio/common/scmi_sensors/scmi_iio.c | 27 +++++++++++-----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/common/scmi_sensors/scmi_iio.c b/drivers/iio/common/scmi_sensors/scmi_iio.c
index 442b40ef27cf..659a2f888ac9 100644
--- a/drivers/iio/common/scmi_sensors/scmi_iio.c
+++ b/drivers/iio/common/scmi_sensors/scmi_iio.c
@@ -14,6 +14,7 @@
 #include <linux/iio/sysfs.h>
 #include <linux/kernel.h>
 #include <linux/kthread.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/scmi_protocol.h>
@@ -70,8 +71,7 @@ static int scmi_iio_sensor_update_cb(struct notifier_block *nb,
 		 */
 		tstamp_scale = sensor->sensor_info->tstamp_scale + 9;
 		if (tstamp_scale < 0) {
-			do_div(time, int_pow(10, abs(tstamp_scale)));
-			time_ns = time;
+			time_ns = div64_u64(time, int_pow(10, abs(tstamp_scale)));
 		} else {
 			time_ns = time * int_pow(10, tstamp_scale);
 		}
@@ -162,7 +162,7 @@ static int scmi_iio_set_odr_val(struct iio_dev *iio_dev, int val, int val2)
 	mult = scnprintf(buf, sizeof(buf), "%llu", sf) - 1;
 
 	sec = int_pow(10, mult) * MICROHZ_PER_HZ;
-	do_div(sec, uHz);
+	sec = div64_u64(sec, uHz);
 	if (sec == 0) {
 		dev_err(&iio_dev->dev,
 			"Trying to set invalid sensor update value for sensor %s",
@@ -237,13 +237,10 @@ static int scmi_iio_read_avail(struct iio_dev *iio_dev,
 
 static void convert_ns_to_freq(u64 interval_ns, u64 *hz, u64 *uhz)
 {
-	u64 rem, freq;
+	u64 rem;
 
-	freq = NSEC_PER_SEC;
-	rem = do_div(freq, interval_ns);
-	*hz = freq;
-	*uhz = rem * 1000000UL;
-	do_div(*uhz, interval_ns);
+	*hz = div64_u64_rem(HZ_PER_GHZ, interval_ns, &rem);
+	*uhz = div64_u64(rem * MICROHZ_PER_HZ, interval_ns);
 }
 
 static int scmi_iio_get_odr_val(struct iio_dev *iio_dev, int *val, int *val2)
@@ -269,7 +266,8 @@ static int scmi_iio_get_odr_val(struct iio_dev *iio_dev, int *val, int *val2)
 	mult = SCMI_SENS_CFG_GET_UPDATE_EXP(sensor_config);
 	if (mult < 0) {
 		sensor_interval_mult = int_pow(10, abs(mult));
-		do_div(sensor_update_interval, sensor_interval_mult);
+		sensor_update_interval = div64_u64(sensor_update_interval,
+						   sensor_interval_mult);
 	} else {
 		sensor_interval_mult = int_pow(10, mult);
 		sensor_update_interval =
@@ -395,9 +393,9 @@ static ssize_t scmi_iio_get_raw_available(struct iio_dev *iio_dev,
 		 */
 		exponent = exponent - scale;
 		if (exponent < 0) {
-			rem = do_div(resolution,
-				     int_pow(10, abs(exponent))
-				     );
+			resolution = div64_u64_rem(resolution,
+						   int_pow(10, abs(exponent)),
+						   &rem);
 			len = sysfs_emit(buf,
 					"[%lld %llu.%llu %lld]\n", min_range,
 					resolution, rem, max_range);
@@ -491,7 +489,8 @@ static u64 scmi_iio_convert_interval_to_ns(u32 val)
 	mult = SCMI_SENS_INTVL_GET_EXP(val);
 	if (mult < 0) {
 		sensor_interval_mult = int_pow(10, abs(mult));
-		do_div(sensor_update_interval, sensor_interval_mult);
+		sensor_update_interval = div64_u64(sensor_update_interval,
+						   sensor_interval_mult);
 	} else {
 		sensor_interval_mult = int_pow(10, mult);
 		sensor_update_interval =
-- 
2.53.0

