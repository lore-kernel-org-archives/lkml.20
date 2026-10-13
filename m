Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE974E324E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889093; cv=none; b=bjdBmd9euMs4MrdRyKl676Z4eWTQZhrvxRI8HMiz+k77o4emizAECtNvtvvex0yOFqdkshvvgg9DaJ0+zTFH5RWUfa9xqRSH6ZxXiPZETRPI/0Hu35NUeBEP9vn/9D2mwZCBERpDnF7HaE0O9VjKkoaEnGU2Dd+59wrtNX5L5mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889093; c=relaxed/simple;
	bh=uohpqKhhxFL4zyRkg0b3es+GFZBemwsbVUZ++JQWt6c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aXMImK+JtRyKQUkG+wmPlfoy6wUvQJhWyg6e2L/CvFPwBSDENnTabpK/gYY8Nod+DfAQTRqBuuoMvEvpDpJH/wl9UPB116gA10/WE7DTqeJ1ScsGZmbGu9HFoqZCc3GRPxgLMgUEpRGUnzTChi2ElRZRNNsFhtpjbslC/3DmWao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Et4zMD4k; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Et4zMD4k"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1837844a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791889077; x=1792493877; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwPbvwO6MeQ9Rx7dSfDFytJJDwpu+KUB4ZEbKExmA+g=;
        b=Et4zMD4kohUd88haxX7uJNDjT27AX7KnG+qleRddrmHIlVH+xlUvlW60sUYI9zLzG/
         8eJhLfE9UPgapO0RKpehUDB67kWkDYS9/BlWBSeCa0sKcAnY1iqr7L9BC67i7viw1oWL
         vwUJjp7cLZaLcy43ECgvtZntHEZhp5W4t+MzzxBO7qz2FeIqHQAUhlYaPH49GHfUj3US
         H5aLmD5Jwb0y8BptKgvN/l2FRIA4LCfG9Fe4k8z2ZySngiWiL1c9y9nObhhsqWRrtG4w
         6O7VI+v4Okbh5v+pdOIiBi9TmXIkhGkzFo4mRHP449fT6vmW/CitbSRqp4u0YOLTZF0M
         mhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889077; x=1792493877;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwPbvwO6MeQ9Rx7dSfDFytJJDwpu+KUB4ZEbKExmA+g=;
        b=0JbAQu/9zK1vDGOTuAsSI0vbItb3LjzB8JF1RzNkWKNs5lvxxOaJwnxYvkLcmvP5cc
         tbOJfaJBJ8z8AfQTOzOR+qPEnVH/IEL/BBxm4Ri46sI6Q/uQsbofA4AgOEEQxzeckmhO
         wk9W+d5abdCPsMFQP4WERkxsfnOeDxmAnmovsEpqeaObUwpDm2zVzAbknfofkuygC/je
         g52tesUQuf7f72ArGST6mZUmO/iZ7cT5ddAjucuM767Ez6WeYB+Smxaglpc81IP+6aSm
         ZlgsbEiGxvkaP2waY30LoYRbCIS0V68H6LAGgLbePDnnR15Bquz+BCMUlebopqc3VIRJ
         1Zlg==
X-Forwarded-Encrypted: i=1; AKwUvBwXT41AUPz+pClMUPI/ViKeLIe5rr5mas3CvJdXcGeXuWU7Mx7OukZ6LQDwPbyT9UFJ5npBziC/cwGd8D8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYdCofFh87zURs5B0+IJulx37Uj+sfIVtuvT2I+VDu187mo0cl
	aXtdOhPI9nhCGmNOYQJHDa5D5zbaIPZoHw6XL08wcj3KyvL/XFmd7jiOvqq5Z3mLaNiXORR4HJ6
	R0f3sYrIhgUu/qw==
X-Received: from pfog11.prod.google.com ([2002:aa7:874b:0:b0:890:aa85:1b93])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:eec2:20b0:3e1:af52:6d06 with SMTP id adf61e73a8af0-3e1af527d92mr2564059637.52.1791889076874;
 Tue, 13 Oct 2026 03:57:56 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:57:53 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013105753.1370713-1-sgsatyam@google.com>
Subject: [PATCH v4] platform/chrome: cros_ec_sensorhub: Modify clock drift estimation
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

Update the clock drift estimation and timestamp filter to prevent
monotonic backward skews and Out Of Order (OOO) timestamp errors during
sensor batching.

To keep the timestamp filter active across normal batching flush
intervals (which can be 1 to 2 seconds long), increase
TS_HISTORY_BORED_US from 0.5s to 2.0s. Because transitions between
active streaming and low-frequency batching may now fall within that 2.0s
window, detect Output Data Rate (ODR) or mode changes where the time
delta (dx) changes by more than 10x and reset the filter history so
streaming and batched samples are not mixed. Additionally, fix the
history shift loop starting index using min_t() so state->x_history[1] is
properly populated as soon as history_len reaches 2, and clamp the
calculated drift slope (m) within +/- MAX_DRIFT_PPM Parts Per Million
(PPM) so temporary jitter spikes cannot corrupt the median filter.

Finally, when a sample timestamp is strictly earlier than the newest
event seen for that sensor, drop the Out Of Order sample instead of
clamping its timestamp to last_ts, which previously caused downstream
batch spreading logic to misinterpret stale samples as a batch of
identical timestamps.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
Changes in v4:
- Reword commit description to clarify why the batching filter changes form a
  single logical change, and spell out Out Of Order (OOO) and Parts Per
  Million (PPM).
- Fix Signed-off-by capitalization.
- Drop redundant inline comment on TS_HISTORY_BORED_US.
- Use min_t(int, state->history_len, CROS_EC_SENSORHUB_TS_HISTORY_SIZE - 1)
  for history shift loop start index.
- Rename cros_ec_sensor_ring_check_for_past_timestamp() to
  cros_ec_sensor_ring_is_past_timestamp() and return true when the sample has
  a past timestamp.
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 73 ++++++++++++++-----
 1 file changed, 55 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index cc038af59218..20fa47cbee32 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -22,15 +22,21 @@
 
 /* Precision of fixed point for the m values from the filter */
 #define M_PRECISION BIT(23)
+#define MAX_DRIFT_PPM 200LL
+#define MAX_M ((s64)(MAX_DRIFT_PPM * M_PRECISION / 1000000))
 
 /* Only activate the filter once we have at least this many elements. */
 #define TS_HISTORY_THRESHOLD 8
 
 /*
  * If we don't have any history entries for this long, empty the filter to
- * make sure there are no big discontinuities.
+ * make sure there are no big discontinuities (e.g. after suspend or long idle).
+ *
+ * This is set to 2 seconds to accommodate normal batching flush intervals
+ * (which can be up to 1-2 seconds) without constantly resetting the filter,
+ * while still ensuring a reset occurs during actual long gaps or suspend.
  */
-#define TS_HISTORY_BORED_US 500000
+#define TS_HISTORY_BORED_US 2000000
 
 /* To measure by how much the filter is overshooting, if it happens. */
 #define FUTURE_TS_ANALYTICS_COUNT_MAX 100
@@ -259,7 +265,7 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	s64 m; /* stored as *M_PRECISION */
 	s64 *m_history_copy = state->temp_buf;
 	s64 *error = state->temp_buf;
-	int i;
+	int i, start;
 
 	/* we trust b the most, that'll be our independent variable */
 	x = b;
@@ -271,13 +277,36 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 		return; /* we already have this irq in the history */
 	dy = (state->y_history[0] + state->y_offset) - y;
 	m = div64_s64(dy * M_PRECISION, dx);
+	/*
+	 * Clamp the calculated slope to a realistic range (+/- 200 ppm).
+	 * Temporary large jitter spikes can produce huge slopes (e.g. +/- 20000 ppm)
+	 * that would otherwise corrupt the median filter history.
+	 */
+	m = clamp(m, -MAX_M, MAX_M);
+
+	/*
+	 * Detect ODR (Output Data Rate) or Mode changes (e.g., transition from
+	 * active streaming to low-frequency batching). If the time delta (dx)
+	 * changes by more than 10x in either direction, reset the filter history
+	 * to prevent mixing noisy active samples with batching samples.
+	 */
+	if (state->history_len > 1) {
+		s64 prev_dx = -state->x_history[1];
+
+		if (prev_dx > 0 && (abs(dx) > 10 * prev_dx || prev_dx > 10 * abs(dx))) {
+			state->history_len = 0;
+			m = 0;
+		}
+	}
 
 	/* Empty filter if we haven't seen any action in a while. */
 	if (-dx > TS_HISTORY_BORED_US)
 		state->history_len = 0;
 
 	/* Move everything over, also update offset to all absolute coords .*/
-	for (i = state->history_len - 1; i >= 1; i--) {
+	start = min_t(int, state->history_len,
+		      CROS_EC_SENSORHUB_TS_HISTORY_SIZE - 1);
+	for (i = start; i >= 1; i--) {
 		state->x_history[i] = state->x_history[i - 1] + dx;
 		state->y_history[i] = state->y_history[i - 1] + dy;
 
@@ -398,23 +427,29 @@ cros_ec_sensor_ring_fix_overflow(s64 *ts,
 	state->last = *ts;
 }
 
-static void
-cros_ec_sensor_ring_check_for_past_timestamp(struct cros_ec_sensorhub
-					     *sensorhub,
-					     struct cros_ec_sensors_ring_sample
-					     *sample)
+static bool
+cros_ec_sensor_ring_is_past_timestamp(struct cros_ec_sensorhub *sensorhub,
+				      struct cros_ec_sensors_ring_sample *sample)
 {
 	const u8 sensor_id = sample->sensor_id;
 
-	/* If this event is earlier than one we saw before... */
+	/*
+	 * If this event is strictly earlier than one we saw before, it is truly
+	 * out-of-order and must be dropped to preserve monotonicity.
+	 *
+	 * We intentionally allow duplicate timestamps (==) to pass through here
+	 * because the EC/ISH may report a batch of samples with the same raw
+	 * timestamp. These duplicates are required by the downstream spreading
+	 * logic (cros_ec_sensor_ring_spread_add) to interpolate unique,
+	 * monotonic timestamps for each sample in the batch.
+	 */
 	if (sensorhub->batch_state[sensor_id].newest_sensor_event >
 	    sample->timestamp)
-		/* mark it for spreading. */
-		sample->timestamp =
-			sensorhub->batch_state[sensor_id].last_ts;
-	else
-		sensorhub->batch_state[sensor_id].newest_sensor_event =
-			sample->timestamp;
+		return true;
+
+	sensorhub->batch_state[sensor_id].newest_sensor_event =
+		sample->timestamp;
+	return false;
 }
 
 /**
@@ -547,8 +582,10 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
 	for (axis = 0; axis < 3; axis++)
 		out->vector[axis] = in->data[axis];
 
-	if (sensorhub->tight_timestamps)
-		cros_ec_sensor_ring_check_for_past_timestamp(sensorhub, out);
+	if (sensorhub->tight_timestamps) {
+		if (cros_ec_sensor_ring_is_past_timestamp(sensorhub, out))
+			return false;
+	}
 	return true;
 }
 
-- 
2.56.0.385.gd3acb90ef8-goog

