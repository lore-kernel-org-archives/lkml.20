Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266154;
	b=0EQIZ7DsN7Nw+FjM/xZPry68tneNL4menL1mJJWBsMSMFosn0mO+azUMKFUGmb7ZCCwN
	 X1flY5EHAt5d1P6wjL/QEVtCzRf4GTvz12IJg+kuejPHr/pXMX9wzheJdmVdCXmc7cEIy
	 o+IMYpfx1z8HvRwHF2WNQc0AxxiKvFOeHHuEST7UkwQFPcQ9cS+tLpWvovd4XuJZH/okq
	 nBdRnQT68D+dDc/1J2ug+u0uHMBA1q9v8UT6dQChPWZKs7aYT9hJ0W9b9ZZLi9pyH9eZr
	 mXaXrMQmPdl76iLHpnEq8QyypKb0HXH6C43oVx7/NmpMv4E3NOyES5q5/JvGCHZm15A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=todkOwyfVIhQ069n5dpYrblRp+El6QG9QdYJZ7QqQQ8=;
	b=rwCtWWcUy4vk05GUKuBXnx4E3vUdyQNQYlNWHYIem4bAjNsKhRLUAnHxIFcag+d0YzfX
	 IDErCHNfdNUufLain2cmt7FeZRVmXtMObVWraB0pjXxEyYMa4tQ2WBTTcZ/P3brtVGrfw
	 /rkOFNLT9HE+pYpYqeOtv0bQt/eUz5IIUvDAt5WnmFFtEneB9fT/fxvVqoJIneyBjPn1n
	 IeOKavLbtJy6ElbQlNX0zVwRDAKQTUwgz813PhbJOuQdGxlUhlldu48RS+PqXIcy8SGVh
	 xKZV5gbxxeeU+43HuUkVH+ZkIfOBmwF4RPbf+g2g1E0XNjX/6c4SfT3W4n9ejKdjRkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lg6QsTs9;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0422606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0422606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lg6QsTs9
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so6595646eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266153; x=1793870953; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=todkOwyfVIhQ069n5dpYrblRp+El6QG9QdYJZ7QqQQ8=;
        b=lg6QsTs90acXCAuuZaf4irV3ReksLKtiEmJFB+Wp3ENA3vq4xcKmtdA4gRv0CPkhkt
         oo9j+POCjuI9FpQTRZWlT2RNGc7utLL/PeIbZMrgzGHq090ItbH9QEK5E5ssMeqiZR0k
         IY1+A24pv4J84pgodLW2zBZ13OyF13DmavcOlmzC3TeGdwHm+vnO8kPt3IP9NEUHTO1a
         Cgj73wiZbcD75Y8sa55SBpln3pO9AeNIvb3j4bhT6kloNyvZiYv9HFmn/etqBLFj2n8t
         pUVvKSBujiwzVMLaPzi4CFUK6c/d0nLgpBtpGZVinoHkvL4d4DjLIGIxejRVA2/si6Vo
         mi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266153; x=1793870953;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=todkOwyfVIhQ069n5dpYrblRp+El6QG9QdYJZ7QqQQ8=;
        b=15R/M9qh7WwACgRBMTj65OWa3vxvgu0QJQ7ECZr3WzCy3BNVjsQQuEYzSLq6ucae1D
         TNzgOyNAYvxKUI8WQcsm0B9p2gvyoUQ073iHUMUZl0/Lx/yYN2vDFO7TS6/aZQfDY5OT
         XndqJRxv/ebWq1cK88q38UwQCcHOka/LGyCv/D/4g7kjNggG94dhNhxOR9Xu3aOaZYor
         LAcmaanrxEtLZ8G7MAh8tarlvMHa1pSWGR1cRbGDol8hguYULBBFuteFEKRYROeMRQ5F
         EdqQFmwygs6Q6MFjvc/xJ2nd1kIQMCPtriGMkRAdVDwP0YvcXVu17pXlTALagmzUqvkP
         Ei5g==
X-Forwarded-Encrypted: i=1; AKwUvBz2c6Tc0n9HoCfKkNj9bMOrtiQltjY6dM8w+bywST5judzdo7/mdeU/qwPEY6pEZBZayShVD3gdHPjQ9jA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkZjO2o11xcibV3I9liK1Kf2knsHEtJJq1TCfhwN7DKVWKPqCg
	I5W/RR0sjwQSFZ0ZonT9T6lau7bPon67uqEN3Bq9SasrBTTgiQd0SCflrHXvHoU6MehfAUAHMfT
	7elxQ1Ac1BnvkHQ==
X-Received: from dlaj3.prod.google.com ([2002:a05:701b:2803:b0:1a8:2945:774e])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7023:d01:b0:16c:4eef:a526 with SMTP id a92af1059eb24-1a6cbe7e09bmr7413687c88.15.1793266152510;
 Thu, 29 Oct 2026 02:29:12 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:46 +0000
In-Reply-To: <20261029092846.1567475-1-sgsatyam@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029092846.1567475-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029092846.1567475-8-sgsatyam@google.com>
Subject: [PATCH v6 7/7] platform/chrome: cros_ec_sensorhub: Drop sensor
 samples with past timestamps
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

When a sample timestamp is earlier than the newest timestamp seen for
that sensor, the sample is clamped to the last batch timestamp so that
the batch spreading logic re-times it. This makes the spreading logic
treat it as part of the previous batch, which produces stale timestamps
downstream.

Drop such Out Of Order (OOO) samples instead. The previous batch length
then no longer covers the interval up to the next batch, so reset it to
prevent the next batch from computing its sample period across the gap.

Rename cros_ec_sensor_ring_check_for_past_timestamp() to
cros_ec_sensor_ring_is_past_timestamp() and make it return true for past
timestamps.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 43 +++++++++++++------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index ef20aac..bc3f120 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -440,23 +440,29 @@ cros_ec_sensor_ring_fix_overflow(s64 *ts,
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
@@ -608,8 +614,17 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
 	for (axis = 0; axis < 3; axis++)
 		out->vector[axis] = in->data[axis];
 
-	if (sensorhub->tight_timestamps)
-		cros_ec_sensor_ring_check_for_past_timestamp(sensorhub, out);
+	if (sensorhub->tight_timestamps &&
+	    cros_ec_sensor_ring_is_past_timestamp(sensorhub, out)) {
+		/*
+		 * Drop the sample. The previous batch length no longer
+		 * covers the interval up to the next batch, so reset it to
+		 * prevent the next batch from computing its sample period
+		 * across the gap.
+		 */
+		sensorhub->batch_state[out->sensor_id].last_len = 0;
+		return false;
+	}
 	return true;
 }
 
-- 
2.56.0.307.g5fe7bd680c-goog

