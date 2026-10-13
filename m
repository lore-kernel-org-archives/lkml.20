Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF0E4E4C41
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889097; cv=none; b=HAevh4nMsj6kwAYK/RZ2wSy0GrVuNZDY7ZB18SfhNaBVsLjte+5nUyPfUZpgag1dbBZtaNfs6k0NDAydTZKsD6KWJMrfbSwxmgrcsgFNBrCh/ImXKyX88bgwqjsnzy+QI+Z8GmxABJx2CCwHI+sMdZxSYY6d1/QWsTVUFhBJuh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889097; c=relaxed/simple;
	bh=rI+fqKv7600fLiPAe7ew1vwAqhZS+CfnUnyx8zEAd+I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=sswteKT82RhjjWJxDe8p/Jrv7o7VwoG3jWcNJy1Nof4l3k7BsJYcSKidodgkFv5EI2MnT7yo8TF7XSuu9KTtzibNtdPv6/PsJfTbMMBBVGyNLklnnG1UhrzbuI/NEnjtXLztnVOv+GIxAnFSGTl97scDjsvP/7oUaaOmZexMnGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pQtEr43v; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pQtEr43v"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8862ed0539dso3131159b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791889089; x=1792493889; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRcero9yayxBQi9YH0PofTatbG/JTWtWWnUcUgbPRtc=;
        b=pQtEr43vH7MI73zWGBdLR45j51ooqap61lkXKNMuri8Bloxi1XisXRXL3AyiqZZk0z
         PwH1Zia83Na3d+m6qh/ALWLY1Te3HMNZ+RfcuN8hsIeMCidEeli/3qgIhHl2DnorTida
         5j85bjsaCfsqYatKdKra6riSz5D7lXvYCt8vyNzGdjBtJbfemDH7kFK3xGN28WEhjCsr
         8BV9iqEzCcKq/8nSFdw2h8EJVsUoGkYdOwPPCHVrSx+Fy815sGIoCgjhmpIVpJZu4eFG
         eZb1vvO34QjHZUbwFSSXZjUvZhwSfXaC2Hh9r72u5A/IyR+ZWcolpC4ZB3AZ9/lNBkBz
         OeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889089; x=1792493889;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRcero9yayxBQi9YH0PofTatbG/JTWtWWnUcUgbPRtc=;
        b=Vo6JSzq4zt7o5MmAwR7rHviZdDa5H9sU0gyAnUO0S5oyeyomCi22466EcNWes0BN2W
         aUlnPGq26i7FU7FLzqkxcbNuf6fb3MFRZJYzns6s/oiCaYw84zFaIDDNcddgkrQosrFS
         2XYMCesnFn4nVSccvKcWfekJJN5pjv27wFO6iFVHZv03MpD6iC3iT4uW9GHtqW0dDXBq
         fO+hwbFbakxE5zH8q8pJN6PK6e1+SncYxsGR1bYBB4w53Z5Vkiygs6YPxQcnBt9jwRYC
         BeF55DS+vBZyy+Y3x7Jz6Qgyk97mcdDUznrube/CDRJEAp7i5iNEj4PrM8h0M72Q6iBZ
         Oubw==
X-Forwarded-Encrypted: i=1; AKwUvByza9GI3s7qdnDjY6G3QdrnO+zsERa3YnECaozYSmDbmtQxfoyYZjTdvsh66ndq0EHABQAUUzFqdQmw1Ok=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXm7udm0CdDErLHwoDQYcp2YeaGI6pwqAokEjAJTOuk0drf/DP
	ZE0ITfHnYM1q2N5nsFd9CUFogLH09qqyaxI4xXscrpX9wdzM0R4LtikwuzG7tVr3U3J5QvWNU60
	YIxAt0gPBS3W2Og==
X-Received: from pfny22.prod.google.com ([2002:aa7:8556:0:b0:899:b329:6c57])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:10c5:b0:880:cb95:aa7b with SMTP id d2e1a72fcca58-897c7ccb939mr10758768b3a.35.1791889089043;
 Tue, 13 Oct 2026 03:58:09 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:58:06 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013105806.1371175-1-sgsatyam@google.com>
Subject: [PATCH] platform/chrome: cros_ec_sensorhub: Increase MAX_DRIFT_PPM to 5000LL
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

MAX_DRIFT_PPM was introduced to prevent large swings in frequency drift
estimation (such as batched mode interrupt jitter exceeding 20,000 Parts
Per Million (PPM)) from corrupting the median filter and causing Out Of
Order (OOO) sensor events.

The initial limit of 200 PPM was chosen based on platforms where sensors
are connected to an Integrated Sensor Hub (ISH) running on clocks derived
from the same PLL as the CPU. However, on platforms where sensors are
connected to a standalone Embedded Controller (EC) running on its own
independent crystal/PLL, the actual clock frequency drift between the EC
and AP can be around 2,500 PPM. Clamping at 200 PPM is too strict for
these configurations and causes an accumulating offset error that
triggers sample drops and timestamp synchronization failures.

Increase MAX_DRIFT_PPM from 200LL to 5000LL so the filter can track
expected clock drift across both ISH and standalone EC configurations,
while still rejecting large interrupt jitter spikes and bounding the
worst-case cumulative batch error (~2.1 ms, well within the fastest 5 ms
sample period).

Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 20fa47cbee32..a5215955470f 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -22,7 +22,7 @@
 
 /* Precision of fixed point for the m values from the filter */
 #define M_PRECISION BIT(23)
-#define MAX_DRIFT_PPM 200LL
+#define MAX_DRIFT_PPM 5000LL
 #define MAX_M ((s64)(MAX_DRIFT_PPM * M_PRECISION / 1000000))
 
 /* Only activate the filter once we have at least this many elements. */
@@ -278,7 +278,7 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	dy = (state->y_history[0] + state->y_offset) - y;
 	m = div64_s64(dy * M_PRECISION, dx);
 	/*
-	 * Clamp the calculated slope to a realistic range (+/- 200 ppm).
+	 * Clamp the calculated slope to a realistic range (+/- 5000 ppm).
 	 * Temporary large jitter spikes can produce huge slopes (e.g. +/- 20000 ppm)
 	 * that would otherwise corrupt the median filter history.
 	 */
-- 
2.56.0.385.gd3acb90ef8-goog

