Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266141;
	b=t752LMBkru7fqZYYi3s+UPJxrMxBWGt145AK2meBCJ2u48uyrgzkkL7dSdeFH349dcrU
	 Lp82hvTaZmdK6cpl71Y/BIzyQAnYwfAg+CvYM6+EGvfL+QXmBWDveezsPUgoJ/vC6ZgtS
	 U/CapQTQjFkDAchtdiJ8X3SL5Zj5SgQQ4i0A9jbiUquCF4yQfN96u+cAFXk9/lOvML9MR
	 O91rL+K46pDiPmyH43UpWQZQLIm42SxxCKy/u9pqkrlizUSRHCaeYQsLcQLYoUyGXRyBq
	 Q1cxo7WHtvcdmPSTY2S2+ZTs785TnvCy16p4ZyFPPdxP1cxMsOhUZxgkHDvfb8YFwjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iBnMDmrSuyFYWI0+QvlyVQXU6PwvT3EWSQPtQjEgOoM=;
	b=WYpawJZvFPTWcDj7GG/ERy6V3+t0IjGX0AaAfWnqJdlJyR/GKDzPy8bs7Sr4SaDX7p+i
	 DefHfuKvsRqRTbT3iYTp4lRHhUT4N9aU244p8VwyxTtUEV4bu/mVmjU0RMPKwyN2ZIbA2
	 Yj4mnZIOmsoQO2SBBruiErZy6IOIvGtOOGphL+Ll0KES14DrTzhs53WMOQ+Mrn0pJmT1s
	 wVEhaN58/BOYt7/+FwiQsD0rntgf1Hm83KN0gR6r02qsIk0hhov+YtelGG+1tWK7AChIR
	 OFjtNh12p9POOXXh+9QcWKqdgn0+wPJlubHnzB37vs1dcZfBSZ3QzTKp36HvPTXnnZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T+LSly9P;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B44606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B44606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T+LSly9P
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e93e2f72bfso30197165ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266140; x=1793870940; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBnMDmrSuyFYWI0+QvlyVQXU6PwvT3EWSQPtQjEgOoM=;
        b=T+LSly9PbEi0PXK/U+U2th51Szy0ceE61ZPwz05N6SoPeysDTWznvgipKvEfFBtcvj
         Qf1I7BCjYSjdugXJjL7milDE7utG2jKX7CJMtENOVcsYoyT/5yghwx8D0jtylthrBu10
         E6cLPA3TRWL+kKirHF0WpoNa9J1vxrkzpqAJwZiz1NlMPYkPMyGfWnFL44UCAKloJ5dM
         mvYRwRyWk7ToajUSiUgrHjeIvrXBSPEKb2CrF/H7g1U7mzQnmVEEcpCPt/Z8DMG6MjRN
         EpwbqfgJLPjm6b9R834ro0InHPKqFQpaDCS/UFx4b4+kQ8aLgCGvM+Ph1yfTyUW+IiU7
         CPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266140; x=1793870940;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBnMDmrSuyFYWI0+QvlyVQXU6PwvT3EWSQPtQjEgOoM=;
        b=guF52ni8Z6LRhvO/FwScGxOX5K7uJQhq8hmD2JSb2X9fmGUjItoFbXzwAXQLBZOuu/
         nFknzmTK9LRNqhes6epevKs7Jx6O2xP3R0UR/8m7ST+lQ4a/kR2Y9Y8oy+rVeSLCVk4v
         yZSO/AH6+fFxdny2wul6kRqLGj4uOMRL/efzql3ctKpUVUb9n3UevMxRTVOtNdHK2J2B
         xvuHkQQmz+dqJ5xyqvA7MMzNTJB5fDBo6DEqeSI8qN9MhbgHCAVnQvqVVlNVuzdK+33z
         XKwSEI4w5Ze13mwdJx8we0yyT2WJCui1/CCPOxm3ZN8vUM1QzKz9fzlSKHLeJUIBaTFX
         KpRg==
X-Forwarded-Encrypted: i=1; AKwUvBwTOlTkQBOigft2u8TvHrO7bZj0TRJzQ7wqQy7MFOcWCfGBrlHdxBpkYTxghXrbM6HYlnFkesbodqEo+FM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPgW/WUWT6HhCbgm8Cu9U7HoRwMs0ptX3phEyvsLRe0EitEoSk
	UkVCKVVLvLBIpWIHYwGvSXC6gveYoZikJZyaUpTblQIZDI3AQkKiOFV3Zmvmkm0NcJULMj1qfek
	OKNTxUzM+hgXGLA==
X-Received: from pjah8.prod.google.com ([2002:a17:90b:5908:b0:3ad:850b:6f1c])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3810:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3ae5828771dmr4094239a91.36.1793266139516;
 Thu, 29 Oct 2026 02:28:59 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:42 +0000
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
Message-ID: <20261029092846.1567475-4-sgsatyam@google.com>
Subject: [PATCH v6 3/7] platform/chrome: cros_ec_sensorhub: Fix TS filter
 history shift index
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

cros_ec_sensor_ring_ts_filter_update() shifts the history arrays by one
entry before storing the new IRQ timestamp pair at index 0, and then
increments history_len. The shift loop starts at history_len - 1, so the
oldest valid entry is overwritten instead of moved, and the entry that
becomes valid when history_len is incremented holds stale data. For
example, after the second update, x_history[1] does not hold the first
IRQ timestamp.

Start the loop at history_len, bounded by
CROS_EC_SENSORHUB_TS_HISTORY_SIZE - 1 so that the oldest entry is
dropped once the arrays are full.

Fixes: 93fe48a58590 ("platform/chrome: cros_ec_sensorhub: Add median filter")
Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 076a65a..c5331d9 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -277,7 +277,7 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	s64 m; /* stored as *M_PRECISION */
 	s64 *m_history_copy = state->temp_buf;
 	s64 *error = state->temp_buf;
-	int i;
+	int i, start;
 
 	/* we trust b the most, that'll be our independent variable */
 	x = b;
@@ -303,7 +303,9 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 		state->history_len = 0;
 
 	/* Move everything over, also update offset to all absolute coords .*/
-	for (i = state->history_len - 1; i >= 1; i--) {
+	start = min_t(int, state->history_len,
+		      CROS_EC_SENSORHUB_TS_HISTORY_SIZE - 1);
+	for (i = start; i >= 1; i--) {
 		state->x_history[i] = state->x_history[i - 1] + dx;
 		state->y_history[i] = state->y_history[i - 1] + dy;
 
-- 
2.56.0.307.g5fe7bd680c-goog

