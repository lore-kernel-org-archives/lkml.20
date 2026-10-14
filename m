Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A44A0EED
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963821; cv=none; b=miEDpp1yhCDOol4I6xi85N30gwEI2GcAAdAd/2E9LtytavjSyz8ZOaAG2BTVrxWNZ28fDpoVez5krPQWNJfQnjbhqja1ybQe5MgqLsTsJpm2j+u4RNatfP+DSbg2+JjXcpG+jEgZLqRij+3a6Gj5tM84mIl27MkkBRn5ClHw3ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963821; c=relaxed/simple;
	bh=Rq0m96C/XzfFghdstrpkMwk8HDoxdqOBwjSvjkXGvhc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WPtRjOIfLzZ7UWG0d3j6ZoOK4HwlXICPIguPBcfgctOWO1bQpENhdCP850EsGHQpKij6WH10TerEG87/AjFoyJ/lrVz9fogUBDCh4hfwrewEz0Jp+gqpq8TWw9MQsht2ZdyEax01z+4wGwkuobS44MBB8ZNpMdMunpGZmcqh2II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sd9sVUaz; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sd9sVUaz"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so2368825a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963810; x=1792568610; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8ejrhR9Sm9D3IdeJlZMaktlAsgw6di4XLWK+TX1KPs=;
        b=sd9sVUazqz8ofT2G6xZRiAd9drq6SvwTcbbQh/HIHrEy8h4M4wwr7DA7Y8sz6dLsgo
         mDU/OmHaqFANfYONPgyswEBn/YQkf8ujr9ESP6eSUSblbVfc0FlfiXx/Y5k70RjBM9Dm
         pYqBMuEq8v1xn6jxtN2+q1f8cxqF38ZTi2ldlfkYPt0tvMnbMCMiXkDvX8eaqHpACmak
         wG2nSZWxXLYpI7CQx63ux2jqjNsTk/pybx05Z6MFqeWb5VDOkJzQs2EJ1Z9T+swEQxxX
         uq1x5d6fyLGC6OCVZ9R1jw+WAQzi7NNJxKC3VtzhBYl8ipxuU+OwByHRJtlDCDoIopmj
         NJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963810; x=1792568610;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8ejrhR9Sm9D3IdeJlZMaktlAsgw6di4XLWK+TX1KPs=;
        b=1Z6CUKH46iIAdQvgDBSXG0Oiphy+kcAS6hjVwauJUufWCZNKVp6HKA2ocZvw82G/X9
         AXU0wRRORMlqPNpeZHDFnm9n1sIt85Le5XUuK3JEeKd4TBRU18AK7ir2K3FLPU/Cglxs
         yP4Qt1nNMPNFfVn91nAQbSFKH1fY3esC+i8a8f/hMbv8hZl8WUSvHaR0IzNSrgK2Bwy2
         egLTioqStteZeDBDGHs98oyRqeVNc1eCn8skFL8rtLb44aco3PqRoB630Tyy+L1Oh2du
         QgRM5RaP7OxmG3LgbsuwyyhPOf03b5jSQoINYHPHQVyqrG5gRkdKKk2GA2N+wq5qenCC
         l/+w==
X-Forwarded-Encrypted: i=1; AKwUvByiZpUnUpagu0BgjIvODPsy+PqC/b+sxuaPMpcAnO9IuxhQn/JyuZ8Mx7TzO9hT+p1K6QMQ56G3l9k7Pgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZCuluabGAwk+2xBVPiUNhWu4JNEdYz5lTuSNoQuJom6jkNSNw
	GUbSnPAbP3b5knkZjaoWMb9TdxYhG7hC5Tk3uk4fXOE493q8Uir3s8HfkWuRDS4Re0CSrZhyh1E
	BtsPT16Krr0pfzg==
X-Received: from pgbcs1.prod.google.com ([2002:a05:6a02:4181:b0:cc7:d128:5a50])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:6f89:b0:3e1:d43e:3675 with SMTP id adf61e73a8af0-3e1d43e3a3bmr2158178637.2.1791963809541;
 Wed, 14 Oct 2026 00:43:29 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:06 +0000
In-Reply-To: <20261014074306.2500909-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-7-sgsatyam@google.com>
Subject: [PATCH v5 6/6] platform/chrome: cros_ec_sensorhub: Drop sensor
 samples with past timestamps
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

When a sensor event timestamp is strictly earlier than the newest
timestamp previously seen for that sensor, drop the Out Of Order (OOO)
sample instead of clamping its timestamp to last_ts. Clamping past
samples to last_ts previously caused downstream batch spreading logic
(cros_ec_sensor_ring_spread_add()) to treat stale events as a batch of
identical timestamps.

Rename cros_ec_sensor_ring_check_for_past_timestamp() to
cros_ec_sensor_ring_is_past_timestamp() returning true when the sample
timestamp is in the past.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 36 +++++++++++--------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 7740bb42b1df..a5215955470f 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -427,23 +427,29 @@ cros_ec_sensor_ring_fix_overflow(s64 *ts,
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
@@ -576,8 +582,10 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
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

