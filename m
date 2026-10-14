Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051FE49A3B9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963804; cv=none; b=saEIbFtYbnrg1giX+ttK7lpyMK9PGqdTCCTNURjBNfvTgSFFMnSicGdB026ZpL6NQxL8B0Ip7hb3KJ4Ao3qMCQKyTmcLxA2c5YirPYqXLvrU+g6TP5LtG0U2wHTLIGyPUshzstnz5EqNCIckDsnbB6t298hNJ40TmO8reXkbx74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963804; c=relaxed/simple;
	bh=ZS71hUPkI/ZzO52MEAYoo6mpeL5VZT1U5WnEdVlvNqE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D/Tety3SlH9LP1R9do/Oxad1NzZqpGib3t0WLGDNNqsPnReD5v8j2zIaTKne3RkSj//9XDO8CVzkhAMhg9IsampDeQw350iSAik39H1BlmDlMOe9Yjv3IGuV/vzEx2m4IGhhaxpJNHLb0FDpSsGeOgk5+eZndV1krQD72154igw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TeInoCiC; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TeInoCiC"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88c768885b4so4893183b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963795; x=1792568595; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAAJ9xwhtD02LHJkl/YA1PsBrgQEn+qnpmlU4tU13fU=;
        b=TeInoCiCW6YtS60c4QiQEOtZ67kELSkRb4gWy0Pqw4wIgeSNXi7UgHhQA9t1ejBxdw
         jTgaVg0Pw6Aw5TrV7ZoWVlmAjdjcncaw6O9a06A4RpYFRv9RYVQkQ1WOui5xE745nB7A
         cX9ycXo/5r+9UA2rwtEam/iwrvMG3w4TTrItTSIWAg9LJ1FR5+4gzpJ6+8+erVWoBWKW
         +FIWd2mlHTLV1tFWkfJsmBPfF5OdEmRGJb//rvIZ29skURJuMtP1jKCM6cFFlliZk9wb
         F0I9uik4wm7hKz5W6qDrKtFA7zE6CzPWH9zYuTnUoSfoYiHId9NgeM3f1nQVDMzPtwXB
         G3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963795; x=1792568595;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAAJ9xwhtD02LHJkl/YA1PsBrgQEn+qnpmlU4tU13fU=;
        b=VCmmmd9+DeHLX5o8m1EwcMDS6AUmX2SS+oWGd0XBaraxuPu0+FiaW4UGl8eOrh0c+v
         OmS+49ZwiEA655hrWFm943baZkeC+cFYapP/CxmumGXn3qaS6xptBr4yYuhB1b23SQRa
         VwnHCfpjte+vFGrQ+nkeX2Sq0ERSCg3GIuQl+5/lw0roaSdeRKRozFukAl16jxCztJt6
         LlYguYH+qgAx7wiF/rklw0OFSesH8WP/3FE2SJXNetW3wwSUDk1Ci1DXWnKq6IYsXiqT
         NUlReDYWHHttGOZh4kOuy24IcAB2oZNlsaqQudXx7pfzpKFlodyrb64wkA+FLjEnSauI
         tcpQ==
X-Forwarded-Encrypted: i=1; AKwUvByK0ocXdguE9s/p48FgRQRAqDwN+pMEoLfbnm+egY2gvHpZ3sXqP0V0A0OirAKF54YkM8oKCa3kSFso9hA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh7O3scgAOYCqF2ImomxDD5yY2L57FBFzq5rhYDoqiWbIKgS1n
	nHPv6dUh3yg9HRULbwuEpoY8TdkoMz7Ya4ri1xWTWueieT0zYkxLxd3pRk/abmUiACVFsUNCgdk
	aOa2A1L+XbWnktw==
X-Received: from pfbbj3.prod.google.com ([2002:a05:6a00:3183:b0:897:ada4:5702])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:893:b0:89a:19ae:10e9 with SMTP id d2e1a72fcca58-89a19ae138fmr8309158b3a.38.1791963794722;
 Wed, 14 Oct 2026 00:43:14 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:01 +0000
In-Reply-To: <20261014074306.2500909-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-2-sgsatyam@google.com>
Subject: [PATCH v5 1/6] platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

When the AP goes into deep sleep, the EC physically continues executing
and silently wraps its 32-bit timestamp counter one or more times.
Because Linux natively advances ktime_get_boottime() across suspend,
the AP clock leaps forward but the incoming 32-bit EC timestamp
appears historically delayed.

Calculate how many 71.5 minute epochs were swallowed during sleep by
dividing the AP's recorded sleep duration against the overflow period.
By injecting these missed wraps directly into the running EC offset
tracker, the EC timeline snaps forward instantly and achieves parity
with AP boottime, avoiding fatal negative delta time-skew calculations.

Any massive suspend gaps (>500ms) inherently trigger the
TS_HISTORY_BORED_US fallback during the first post-resume sensor event,
scrubbing the poisoned clock drift data. Because the clocks are
explicitly resynchronized by the math above, newly arriving samples
remain valid and are delivered without being warped by stale filter
history.

Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub.c   | 37 ++++++++++++++++++-
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 30 ++++++++++++---
 .../linux/platform_data/cros_ec_sensorhub.h   |  2 +
 3 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub.c b/drivers/platform/chrome/cros_ec_sensorhub.c
index 31fb8bdaad5a..5644ff4f8a90 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub.c
@@ -227,6 +227,8 @@ static int cros_ec_sensorhub_suspend(struct device *dev)
 	struct cros_ec_sensorhub *sensorhub = dev_get_drvdata(dev);
 	struct cros_ec_dev *ec = sensorhub->ec;
 
+	sensorhub->suspend_time = ktime_get_boottime();
+
 	if (cros_ec_check_features(ec, EC_FEATURE_MOTION_SENSE_FIFO))
 		return cros_ec_sensorhub_ring_fifo_enable(sensorhub, false);
 	return 0;
@@ -237,8 +239,41 @@ static int cros_ec_sensorhub_resume(struct device *dev)
 	struct cros_ec_sensorhub *sensorhub = dev_get_drvdata(dev);
 	struct cros_ec_dev *ec = sensorhub->ec;
 
-	if (cros_ec_check_features(ec, EC_FEATURE_MOTION_SENSE_FIFO))
+	if (cros_ec_check_features(ec, EC_FEATURE_MOTION_SENSE_FIFO)) {
+		/*
+		 * The EC's 32-bit hardware timestamp natively rolls over every
+		 * 71.5 minutes. When the AP goes into deep sleep, the EC
+		 * physically continues executing and silently wraps its 32-bit
+		 * timestamp counter one or more times.
+		 *
+		 * Because Linux natively advances ktime_get_boottime() across
+		 * suspend, the AP clock leaps forward, but the incoming 32-bit
+		 * EC timestamp appears massively historically delayed due to
+		 * the lost silent overflows.
+		 *
+		 * Calculate how many 71.5 minute epochs were swallowed during
+		 * sleep by dividing the AP's recorded sleep duration against
+		 * the overflow period. By injecting these missed wraps directly
+		 * into the running EC offset tracker, the EC timeline snaps
+		 * forward instantly and achieves active parity with the AP
+		 * boottime, avoiding fatal negative delta time-skew
+		 * calculations.
+		 *
+		 * Lastly, massive suspend gaps (>500ms) inherently trigger the
+		 * TS_HISTORY_BORED_US fallback during the first post-resume
+		 * sensor event, scrubbing the poisoned clock drift data.
+		 */
+		u64 sleep_duration = ktime_to_us(ktime_sub(
+					ktime_get_boottime(),
+					sensorhub->suspend_time));
+		u64 missed_overflows = div64_u64(sleep_duration, 1ULL << 32);
+
+		sensorhub->overflow_a.offset += missed_overflows * (1ULL << 32);
+		sensorhub->overflow_b.offset += missed_overflows * (1ULL << 32);
+
 		return cros_ec_sensorhub_ring_fifo_enable(sensorhub, true);
+	}
+
 	return 0;
 }
 #endif
diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 1205219515d6..cc038af59218 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -369,13 +369,31 @@ cros_ec_sensor_ring_fix_overflow(s64 *ts,
 				 struct cros_ec_sensors_ec_overflow_state
 				 *state)
 {
-	s64 adjust;
-
 	*ts += state->offset;
-	if (abs(state->last - *ts) > (overflow_period / 2)) {
-		adjust = state->last > *ts ? overflow_period : -overflow_period;
-		state->offset += adjust;
-		*ts += adjust;
+
+	/*
+	 * We must strictly detect exclusively forward overflows. A naive `abs()`
+	 * check paired with a dual-direction adjustment (`+/- overflow_period`)
+	 * is fundamentally flawed during deep suspend. If a device sleeps for
+	 * longer than half the overflow period (e.g. 45 minutes), the massive
+	 * legitimate forward leap in time is mathematically aliased as a backward
+	 * jump.
+	 *
+	 * This would historically cause the logic to forcibly inject a negative
+	 * `overflow_period` adjustment, irrevocably corrupting the sensor's
+	 * timestamps backwards by ~71 minutes upon resume and failing CTS.
+	 *
+	 * By eliminating the negative adjustment path and exclusively evaluating
+	 * `state->last - *ts > (overflow_period / 2)` via signed arithmetic, we
+	 * ensure that multi-minute sleep leaps bypass the threshold safely as
+	 * large negative relative differentials, naturally carrying time forward
+	 * without bogus timestamp rollbacks. Furthermore, the massive timestamp
+	 * differential will naturally trigger the TS_HISTORY_BORED_US threshold
+	 * downstream, safely resetting the historical median filter array.
+	 */
+	if (state->last - *ts > (overflow_period / 2)) {
+		state->offset += overflow_period;
+		*ts += overflow_period;
 	}
 	state->last = *ts;
 }
diff --git a/include/linux/platform_data/cros_ec_sensorhub.h b/include/linux/platform_data/cros_ec_sensorhub.h
index 0ecce6aa69d5..498a7d827b19 100644
--- a/include/linux/platform_data/cros_ec_sensorhub.h
+++ b/include/linux/platform_data/cros_ec_sensorhub.h
@@ -175,6 +175,8 @@ struct cros_ec_sensorhub {
 	s64 future_timestamp_total_ns;
 
 	struct cros_ec_sensorhub_sensor_push_data *push_data;
+
+	ktime_t suspend_time;
 };
 
 int cros_ec_sensorhub_register_push_data(struct cros_ec_sensorhub *sensorhub,
-- 
2.56.0.385.gd3acb90ef8-goog

