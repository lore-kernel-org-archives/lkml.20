Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3F03EB0FB
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792315685; cv=none; b=cHDkqoJ5nR3ubEOLfP8KGz3FFO8wk53hzk59Tph7afngP5UoNmOI7rsjvHgN9ZLR6oRjqvoh+gIjwzilUR7FGicpSwuaQg1ENDdR2VhEyBSOgBOf+g/LqcVITrLgTyspS0U+Cs2hn+uY4vz12NqW+EvF7IjF7hhs4r+6DuGlkno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792315685; c=relaxed/simple;
	bh=zg95vLfihPyluNUmN9wHjCiqDxcBF6RAVkaymuHBbMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JDTaVZE+eAUa0q1/143sdtXc+tJWcYXjxpYZo+gfn3ZmC+gzcXJUpMcXCacLbCpwU5f0E2cY1CD0P3A0l3psBs7XzLMEIkNEfL3LKHHgIj8Q7YklQkTo4diK7Yjus3lmrs26CtBd4za5/kCrUHq/mw8HizovtlkeMDtQtwAzyAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ED8IRzGF; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ED8IRzGF"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso777786a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792315682; x=1792920482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JSekHcws2Pk1pfnhpXYhJN9WJ46iQlH59bEeBjR4wUw=;
        b=ED8IRzGFmgROJWFwYkswF0BZp3+hqBIJfM2zpzPbAI5e4rcfdg4cXTbnVDiZSwAh9h
         473gFKlFKA3YlscFRy8gPU5q2gjJUGyldeN/4cSrcMn8T+N5RqwVflnkupmyz+WWJ0j6
         x70smsuBtnJOykmgiR6p3NMK99Wioad4PJ9VwIny+UtoUUcUULOQZKm4WcvU15KRMxgh
         HqBCBUiUKSQjzYR3Gp6SvU7pxkkN9uxczTD5sdDR7hB8XjMjznrcOtpI7M6oISqrqWgK
         HMPCvRgqP7woo/l1BMhwlYIg7pj9/NsGPK8xB59NO09UaU/kabWwrHwcteyrWd8IA4oQ
         Lf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792315682; x=1792920482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JSekHcws2Pk1pfnhpXYhJN9WJ46iQlH59bEeBjR4wUw=;
        b=dpMLhQv8RXi7EOg7c4zTHORrxo4HZxfhEPrZw9VgQgDxDBoWmpxlIMRATb/YbGPb+z
         u3Tw62aKnhR8k99UiNCVXtxTOA1M7AHfAHiqhTOlmUUg+At17rfsgfxGYSdV2QH34Qtk
         UqKi0Z1nFXq06KUul690MIPVnEJcJnOVoVyJ1/XS2us8d3dNNoQ0wBqY3MqfyD45yCzL
         i2AIvynBmscjQxybo1WLQzaDDkd1m1cZ3rbD2oTU5Bq7a7E7JxBOdWnp1lN36QWmnX61
         vCJNNUM9qCi04Kibwtt0FXACAFBeBCZ6KWcLgEOACA0diVlkFBGx3BpEX6T/2MxXJuYc
         H6aw==
X-Forwarded-Encrypted: i=1; AKwUvBx9MUH5B0hh36JeMSIdg4k7jT1y+r4KgtfXMdi9Vx3eMWL244oP8In8N9ZGGgaaPaEKN8O1dwIUlkPUmw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOV3NcSg2cU3xsmzjBQbs1MUjBO1+xQAecDks3dJgzWZ0O1ylX
	5J8NwGEWYk3gOsC3ZkdaiHxEx82K/J3+PG5KZpS7zXmJ0Bu+UTKmJJ2y
X-Gm-Gg: AYBFou3Xvoj+CIxlnP/76WaB0J44fXg/vMbm42QgktflekUgYdrjPqv3wZPo4KeDOYH
	pgBSd/8yV6vTVWtVGJWP6r1PsZITtX2vnNjeXTT+zph4AM2PiPk31bW4hqxLbZ74jXylnTmM6NP
	Ko1LHtNPD16UfKsPRWQ78MiM2fVoOcYzW9B/CSXwMibcqlG26V6IbQSqEM+1E7wKarR00IjW3wV
	cV+XFZDAhKVAE/0tsU1g+9T5uT0hR18RBu1x/tv3pNNPIM8DQRuyw3KqKWDFJiEyvTPrshqYHI0
	RgEe4lNPRbB1SNLP/9Y/x+bAuW2HRbylr5eeCcpAms5DrAnkDvBfUhhjtbcwGs6FLsykSzGrtb2
	JWJfwJMicVMj6UM5XaIgsH8RpqlrbA5VLmezrIvA3hQ5qiBbZNLYPGkp2nb1aKvTFznSDYTS8R5
	GbrCOAQFh5X8Qe8e6ILDEO9RxfbffV+xOBUKQk7cBeqHAt/+2Clmp3dXNcvrHHQe2jyBlAZVcLn
	OplVFY2VJPDDFNHj1KCuZZQfk6/PpPOV+SxMqw+27Xqw45zko+hM3jatG+zBVTcLnoymdqn0X9D
	v4a/jcQ=
X-Received: by 2002:a17:90b:17d1:b0:3ac:96a3:77d5 with SMTP id 98e67ed59e1d1-3acef29b9f8mr3781968a91.36.1792315681941;
        Sun, 18 Oct 2026 02:28:01 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e74bcsm16568217a91.3.2026.10.18.02.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 02:28:01 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: osf: keep the RAW cache current when the buffer is full
Date: Sun, 18 Oct 2026 18:27:05 +0900
Message-ID: <36f5bc0a26aadf8f2208e6423c8a9847568ccd3d.1792315003.git.kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A full IIO software kfifo returns -EBUSY from the buffer push. The
sample handler currently treats that as an application rejection and
returns before publishing the valid sample to the direct-read cache.
Consequently RAW values and the last accepted sequence remain stale
while a consumer is not draining the buffer.

Continue cache admission for this normal saturation condition. Keep
other push failures as errors, and retain all sample, scale and session
validation before publication. The buffered sample is still dropped
when the kfifo is full; subsequent samples can be queued after it drains.

Fixes: 2da37c28edc6 ("iio: osf: add IIO devices from capability reports")
Assisted-by: LLM
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/sensorhubs/osf/osf_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/sensorhubs/osf/osf_core.c b/drivers/iio/sensorhubs/osf/osf_core.c
index 4f73ff5e9572b95e1cd237671f01e149784b92b5..377645e7a8a31c60bb719b7c98e3230f04725f1c 100644
--- a/drivers/iio/sensorhubs/osf/osf_core.c
+++ b/drivers/iio/sensorhubs/osf/osf_core.c
@@ -231,7 +231,8 @@ static int osf_core_handle_sensor_sample(struct osf_device *osf,
 		return -EPROTO;
 
 	ret = osf_iio_push_sample(indio_dev, values, sample.channel_count);
-	if (ret) {
+	/* A full software buffer must not prevent the direct-read cache update. */
+	if (ret && ret != -EBUSY) {
 		dev_err_ratelimited(osf->dev,
 				    "failed to push sensor %#x:%u sample: %d\n",
 				    sample.sensor_type, sample.sensor_index, ret);

base-commit: 6a27f3a7d1063aec5aa3d9370161e850fc3a85dd
