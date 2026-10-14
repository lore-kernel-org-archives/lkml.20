Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD5E4A207B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963820; cv=none; b=Iy84pZ3kOxn2w/23KD5eJplBit1NFfI2iiAwi7Hy4iT1MYibTDAzwRvWwOnVcZeb3Lwi1akyQJM0e/0Jx9bdg8m0lHdTgeQXLJqazsR/B2jtBMxbG4AJI2dFF0chH+ZN5nFscu9bcCLp5wUT9odZ0iYzFsyC2+qPNjCZfkhvcCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963820; c=relaxed/simple;
	bh=T0n2ouovgv/ANZ+sKOzeqhgDUXUtz1vNRVdwqMlGgV4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fyr2ohhCYltGMexoa+tovrjpY1edrmL9vscCMboqufBJCzJV/AwHDiE9lIzI7VqfjxYa0BGDntg4fXxPwitreZ2rEP2Dar+LaGpmM/C+nNO3FtfcxQb7KZD6u3BjdaYBZWJQGDpgpo0515rcn3bka9y1lXKJ10EZy3XcsoZoigg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mgnu1SNf; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mgnu1SNf"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88c768885b4so4893364b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963805; x=1792568605; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JzEH+K8H2QFw8M3MXaqtTAIBoB/2ddNSJwxJV/+hC14=;
        b=mgnu1SNflVFqCAOmBtIoELL5vROFFFgYUhLSa+vC7hARffpxKFJ1vXaDzPZHRZ+EZt
         sLK7HJN/xZdmwbzlI4HrKZcu1OnCwHe7GOK3uASY6nWKDSFTx5r0Bv+1t8fbZD4q5ove
         5PZzR/8QClApbzMVj0Wx0VqCZ7FRx8GCLDTEf5h0wJBXHCRh1/JZBKd2ldliEhNLjSNp
         pz/QT2yBTNJDS97FQWhHQEqS8R7xFXCOlHVtnLT3xGo1fVoPvWMVea3TciRfL9/ZUT2P
         s9HPmhrSSRah4yYFLaBHYlsuDG0icJ4lItPpHmtWT/tsiM/ZMogXwsDTjqDjkBojxynG
         wBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963805; x=1792568605;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzEH+K8H2QFw8M3MXaqtTAIBoB/2ddNSJwxJV/+hC14=;
        b=WijD1ReNy2qYYAx7rlrtyVQ1b88AQvQeac77JjV5Yoy5AKAnYk654LJwg9exUqeZ5Y
         uVvUeWg6DoDx6/igjlFjHK2dsLnufxMhxeDZ/iFzZAu8Dg/lL/jY4y5bEttWGX5hJ97/
         lk8hAJ71YVIPESnBoq3kE4OVfW/HQyNIDrhtahVSB8vMbpbXHgRgGx0qv5ZxBO3YcVJK
         lZNNBP78jSI7gfehlILx/C4XyIfDQHdLfdA8uzl+mgzD+xB3RkOPrp40XiKLHJP+LlJc
         Ljv6ya+8GeBFUJ/Z3+9xvFmnrSUyi0nqaeTOAyLvcmxuZAntHjp5pXowKv48o5XWXjV/
         vDPg==
X-Forwarded-Encrypted: i=1; AKwUvBwhm0AZjn6WO26dwVZbqW1+loCMR8WajP7lzRcXt/RovYA2e9Vj1yZ1XbcE/I3DTJqitZQW/mVtXQ37KIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLenZ1UIAQb0WtNUBmTcFQba3wgXf4wrDHCtAedNNU10aYRAOgt
	mNNPGIj1TYBxu+wB2siocvqcfRCSp0MqY6OtgzuY0dp+12+yDHDuD3mUOCM3S61Cu0rWpw8xXte
	JQ4UnhuzX8aSgBg==
X-Received: from pfbic9.prod.google.com ([2002:a05:6a00:8a09:b0:88b:cb5b:e6a3])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:7081:b0:898:b925:f467 with SMTP id d2e1a72fcca58-898b925f78bmr7683758b3a.6.1791963804430;
 Wed, 14 Oct 2026 00:43:24 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:04 +0000
In-Reply-To: <20261014074306.2500909-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-5-sgsatyam@google.com>
Subject: [PATCH v5 4/6] platform/chrome: cros_ec_sensorhub: Reset TS filter on
 ODR or mode changes
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

Detect Output Data Rate (ODR) or mode transitions (such as switching
between active streaming and low-frequency batching) where the time
delta (dx) between consecutive interrupts changes by more than 10x, and
reset the timestamp filter history. This prevents mixing noisy active
streaming samples with larger batched intervals in the median filter.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index ea70847c8792..4d814e2d7297 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -280,6 +280,21 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	 */
 	m = clamp(m, -MAX_M, MAX_M);
 
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
+
 	/* Empty filter if we haven't seen any action in a while. */
 	if (-dx > TS_HISTORY_BORED_US)
 		state->history_len = 0;
-- 
2.56.0.385.gd3acb90ef8-goog

