Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266136;
	b=scEOObSOd2BieeZRkZbJfMgq+QR+PZZGFisFTOoXJUqW+Yx6Duw2GEl2uSnbOsmR77ci
	 HrseMvofh6YTugs+9ANNZeXuL6TRQxu0FCnIFVp0oIBxb9Xbqwrh6G3cxqfb1ta9ByT2x
	 6Cc99B+7N2VtyFrHS7lZHKe+9JPsD8GyZjfUQ+ynZpILoUEERu/nbszt5kH8ZLYx3T7+K
	 KIl+YoKv4Mnx9sP5C5xdEWn1FH0V5WycnoTdqDPYXoL330hVLBFjMIJakH808FBUJoqUw
	 1vD8rcROE+yr5IYaSQAemqOV5bTjCcAuKVKdykZTzqwq1nqQ8SLMKtdUBhjsIihyEeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RnDihmKxpybwQ3lflW2lkaGbP/R8N59IQ6Lqmj7g01A=;
	b=Fp//G0xOAwmmxXKaxHsYbjBKJihT7Q/EyNa2tE9bdHp4YXIEq5MyrHOmtfwRuIwkKfbc
	 7TrSJynxu99zx6zse3tLcusdp2MdnAnE3p1/mDCnWjMcNOjrVehgHOjEJ2GE0x6ZiwTKs
	 WuTTbPRKZ3BQ/VK5N63+vzzFXQx3VXjLgJjxpXT7yv0oRLh98NzfWU7VuH/bh0w3MyZNA
	 7ukCelQdPci+6LLe96k7VDm/hP03xchaLcLvYWDss39XFe/r9G6ZKhym/ZEA1zG5OWn7/
	 7XQ0ENIsLS24AIim7l7EHRSi0s56Yh0yIrpRDNR8/SQMdcH8Gi2KlB/PMogN8qYuzQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UgQmEjT2;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86190606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86190606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UgQmEjT2
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05bfa6af5so1596117b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266135; x=1793870935; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnDihmKxpybwQ3lflW2lkaGbP/R8N59IQ6Lqmj7g01A=;
        b=UgQmEjT2OrctjTEuMQWE+DjBo+siW1st7YIBg2iJCENp7kHeTadLkj7Q4ibO2fEeUg
         cXbrxPaz5bm/RGx6JqoOtVaLfoWKfCY/ZHLT4t3cQaDG2ih5qef0dk1Mc+pSIZTntlXS
         SOO7bbOzL+xUgNP1x4eDiOHEpS/TU6RrNIk/rS5HpkA9zn48qsrpKeBhGW+vBkHLBFjb
         cEiAlA8i2/MV3XSbf5imHuWbuDjaFsVauvkavUPMNLIlNXNGOTEiNolnlbSzhJ2sKYRF
         iSY25YJ3yRpHLZB90jhh82+apxrlRSHi51m4oVARv6NANMCfu0iFPU08/Z1gDjGScagP
         QVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266135; x=1793870935;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RnDihmKxpybwQ3lflW2lkaGbP/R8N59IQ6Lqmj7g01A=;
        b=NWUgfeaxk8AjnUApDmeu6sDO9xUwiCpnxxeAy+QToKTX4OKZZze5i9fpnJYR5zA/N5
         J7d+huItoM0T7fqUF5w4g22IS3vaPtB39cu2RXkO6xRSB8zSEu+kWGP0OVMctG7+QnrP
         jXfI/SmjLhIC8frzjJ8+FLCWSiqZXNo9Hpqig+MzhHX7FDxw4vVahGPEEPsklx5k8XQq
         dtOP6SllX3AJSYmNlyHMYcAT//a/mc1/xbEAv8XuspoKaxsq2u86S9T2b61FjCxOiinA
         KbHKDGB8Z4X9XddOw61M8RRSRS27+rmo2zfpFCblFZXaE8eWDpzh1GKHRctRVy4Yec49
         IDog==
X-Forwarded-Encrypted: i=1; AKwUvBxtm3BV56IuYjQNQyIZgHBxZh0KIi8wZW8bIRU7O8v0VlL/y0zKsb4goJpZXrzqOI3jn46xA8/m1iAE0xo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAwQwaSN2I1pCyYyULxNZT+gFEowvQ8GDuYp/CdZy2VrZCoJpS
	Fm9aAHXwuTDadNqV2EglrQ4JD+J2DJFWdGXpuurEPbj3FHjdDZRj4v3YYKzCNhBaK6ElAoy0/Iy
	2+DbQv3Zmt45YmA==
X-Received: from pfud20.prod.google.com ([2002:a05:6a00:10d4:b0:89f:92b2:3fc9])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1d99:b0:886:ead5:6d3b with SMTP id d2e1a72fcca58-8a6e81b6fe8mr3914906b3a.53.1793266134660;
 Thu, 29 Oct 2026 02:28:54 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:40 +0000
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
Message-ID: <20261029092846.1567475-2-sgsatyam@google.com>
Subject: [PATCH v6 1/7] platform/chrome: cros_ec_sensorhub: Unwrap sample TS
 relative to FIFO TS
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

The EC reports the sample timestamp (a) and the FIFO interrupt timestamp
(b) as 32-bit microsecond counters, which wrap every 71.6 minutes. They
are unwrapped by cros_ec_sensor_ring_fix_overflow() with separate states,
assuming that two consecutive values are less than half a period apart.

After a longer gap without events, for instance across suspend, that
assumption no longer holds, and as a and b are not taken at the same
time, one of them may be unwrapped to the next period while the other is
not. The AP timestamp of a sample is computed from b - a, so the sample
timestamps are then off by a whole period, about 71.6 minutes, until
another gap happens to realign them.

Derive a from the unwrapped b and the raw difference b - a instead, so
that a and b always fall in the same period. A sample can be taken long
before its FIFO interrupt, when it stays in the FIFO during a suspend,
but only slightly after it, when it reaches the FIFO before the FIFO is
read. So treat b - a as unsigned, offset by FIFO_TS_SLACK_US for the
latter case: a is then unwrapped correctly for samples up to almost a
whole period older than b.

Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 21 ++++++++++++++++---
 .../linux/platform_data/cros_ec_sensorhub.h   |  2 --
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index d92b602..7eb8841 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -35,6 +35,13 @@
 /* To measure by how much the filter is overshooting, if it happens. */
 #define FUTURE_TS_ANALYTICS_COUNT_MAX 100
 
+/*
+ * A sample can reach the FIFO after the FIFO interrupt and before the FIFO
+ * is read, so its timestamp (a) can be slightly later than the interrupt
+ * one (b). This is how much later it is allowed to be.
+ */
+#define FIFO_TS_SLACK_US (1 * USEC_PER_SEC)
+
 static inline int
 cros_sensorhub_send_sample(struct cros_ec_sensorhub *sensorhub,
 			   struct cros_ec_sensors_ring_sample *sample)
@@ -441,14 +448,22 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
 		(MOTIONSENSE_SENSOR_FLAG_ODR | MOTIONSENSE_SENSOR_FLAG_FLUSH);
 
 	if (in->flags & MOTIONSENSE_SENSOR_FLAG_TIMESTAMP && !async_flags) {
-		s64 a = in->timestamp;
 		s64 b = fifo_info->timestamp;
 		s64 c = fifo_timestamp;
+		s64 a;
 
-		cros_ec_sensor_ring_fix_overflow(&a, 1LL << 32,
-					  &sensorhub->overflow_a);
 		cros_ec_sensor_ring_fix_overflow(&b, 1LL << 32,
 					  &sensorhub->overflow_b);
+		/*
+		 * Derive a from b rather than unwrapping it on its own, so
+		 * that both always fall in the same overflow period. a is at
+		 * most FIFO_TS_SLACK_US later than b, but can be up to almost
+		 * a whole period earlier, when the sample stayed in the FIFO
+		 * while the FIFO interrupt was disabled, e.g. in suspend.
+		 */
+		a = b + FIFO_TS_SLACK_US -
+		    (u32)(fifo_info->timestamp + FIFO_TS_SLACK_US -
+			  in->timestamp);
 
 		if (sensorhub->tight_timestamps) {
 			cros_ec_sensor_ring_ts_filter_update(
diff --git a/include/linux/platform_data/cros_ec_sensorhub.h b/include/linux/platform_data/cros_ec_sensorhub.h
index 0ecce6a..96eaad2 100644
--- a/include/linux/platform_data/cros_ec_sensorhub.h
+++ b/include/linux/platform_data/cros_ec_sensorhub.h
@@ -127,7 +127,6 @@ struct cros_ec_sensors_ts_batch_state {
  * @fifo_info: Copy of FIFO information coming from the EC.
  * @fifo_size: Size of the ring.
  * @batch_state: Per sensor information of the last batches received.
- * @overflow_a: For handling timestamp overflow for a time (sensor events)
  * @overflow_b: For handling timestamp overflow for b time (ec interrupts)
  * @filter: Medium fileter structure.
  * @tight_timestamps: Set to truen when EC support tight timestamping:
@@ -164,7 +163,6 @@ struct cros_ec_sensorhub {
 
 	struct cros_ec_sensors_ts_batch_state *batch_state;
 
-	struct cros_ec_sensors_ec_overflow_state overflow_a;
 	struct cros_ec_sensors_ec_overflow_state overflow_b;
 
 	struct cros_ec_sensors_ts_filter_state filter;
-- 
2.56.0.307.g5fe7bd680c-goog

