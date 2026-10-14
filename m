Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2D379989
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963802; cv=none; b=NLfqR6EXLgP2em7n3lZ1TpvJInwEzKx3BXglaTPyjd8wBltbA+L5YHlW2ZfGQcG7a3R0jnwhJwrz+RhYv3MxRDfnC08wD6gn9RhjI6JW2SD2kKWiqaNOBQhiJ6WbCEUUZ8ifaZDz7m7nDIOarr1oFH3MnFnw1lCIpm/wl4DX1hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963802; c=relaxed/simple;
	bh=RdI1ValVHrckWf+LK4K9qCvOYEsK0Mib4xFgNjovC9U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kcfE4NnM6nmRPQ29T0OMVdH6AJDENCxeSs1duIJ0vu/qeFVQpUmvg07kzsMT28fychOzxBH/HW50K524w+FaJCLqQo/L0bmig21HUaMIHa5DtTVbcSmQTg+84ZFbaUmKrfVji+uzR0NnrDpBiINitSJz/ke58So7iylDlpUL7Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZWKKBQeL; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZWKKBQeL"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso1236378a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963791; x=1792568591; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pj+jw3KDNGSk5vFLD/Ng3Wm0Iozh721palMxWZ6QePY=;
        b=ZWKKBQeLR9jQHTCjGoNVTnpaHUpcOXhpLeXOZ6jgiNPhGl9mWFmqpmY7PbmdMUP2St
         JVis5OOefSLuV/vuzZPOIF9yUwnsoBRCTIfmIFLQNlKSHu/ACPqj1j2b4RzUnnkoK1Xv
         +ReyOkz6qFrjt+mcwEnN8nwsmuaTqYc4uLtvohrmCaYkAeLetPSa3vMe+n2i7yy0MzaN
         6MPKw6wLDuaSzc1JDuDEFpczOD4sT7p63rKelVJbtiDDv0qzCGhmWiRSjThjuASzkHiT
         zTEuUTAFCVTfUxS9RS05oNb5r8zJtjfsaKUWv63PeRdfs990Py+iyy5ogbrC3XEs0fAl
         XEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963791; x=1792568591;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pj+jw3KDNGSk5vFLD/Ng3Wm0Iozh721palMxWZ6QePY=;
        b=B+9iE16Rsl1xQw02Tj79upiHZ30xhdLONDlXzMxA+p79Fw52DHjIAdj5bK3K3jpFb5
         s0PmUrOxjzwBwdclcfnSPp4s24OIfRJP8wKFrEH2NL+ls/UcYw8cMeZnDS0ZNOI6qeCu
         6LhpacincetHZkWly0RG/0RswvFcAUVacQf6DDjBWPDCOYKHJzjT6BdMXNRMgIUxIzXB
         wC8zZ9HubcwX6gHeIid+bkAP19TkU1lsckXYFR1QwlrsC2DQlYIyKmgD0zYUgDpquBTZ
         itrbOsa+Ozzqnpq/gpHklLr+9wQkKNqRe/zkkKXAESER0j2Jn+G6bou507BvnOexvj5S
         6DvQ==
X-Forwarded-Encrypted: i=1; AKwUvByF0tL7NmzWmWmOjB4+ayUMfoosqJIHTFAnMEQyP3nr4Y40+3wBQY29jmB5fWXUn+cj7jB0NRkagrilhR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4RjKNcfvV1cZgAHiNlKmQ4tQC4ItiCHJ5rmp46TKOsOJIGGpk
	JHm+fRIMjvA/wC72wUwuUhswydnwxirSXVBkkY+5mPrTkE0DC4zHDTLvDqaZ08ZQCK1WqrBQ1qV
	JH8nXAPmLjF1/PQ==
X-Received: from pgbdp1.prod.google.com ([2002:a05:6a02:f01:b0:cd6:178a:2717])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:314e:b0:3ab:3201:310c with SMTP id 98e67ed59e1d1-3ab3a9aa90amr12744557a91.63.1791963790095;
 Wed, 14 Oct 2026 00:43:10 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:00 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-1-sgsatyam@google.com>
Subject: [PATCH v5 0/6] platform/chrome: cros_ec_sensorhub: Timestamp wrap and
 drift filter fixes
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

This series addresses 32-bit EC timestamp rollover across deep AP
suspend and updates the clock drift estimation and timestamp filtering
logic to prevent Out Of Order (OOO) timestamps and large timestamp gaps
during sensor batching:

1. Account for 32-bit EC hardware timestamp wraps across deep AP suspend
   and restrict overflow adjustments to forward wraps only.
2. Bound the history shift loop start index with min_t() so existing
   entries shift properly without array overrun.
3. Clamp the calculated drift slope (m) within +/- MAX_DRIFT_PPM (5000
   Parts Per Million (PPM)) to accommodate standalone EC clock drift
   while rejecting large interrupt jitter spikes.
4. Reset the timestamp filter history when the time delta (dx) changes
   by more than 10x across Output Data Rate (ODR) or streaming/batching
   mode transitions.
5. Increase TS_HISTORY_BORED_US from 0.5s to 2.0s so normal 1-2s batch
   flush intervals do not repeatedly reset the filter.
6. Rename cros_ec_sensor_ring_check_for_past_timestamp() to
   cros_ec_sensor_ring_is_past_timestamp() and drop strictly past
   samples instead of clamping them to last_ts.

Changes in v5:
- Split the clock drift estimation changes into 5 separate patches and
  include "platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap" in the
  same 6-patch series as requested by Tzung-Bi Shih.
- Squash the MAX_DRIFT_PPM = 5000LL update directly into patch 3/6.
- Drop unrelated whitespace changes in cros_ec_sensorhub.c in patch 1/6.

Satyam Gupta (1):
  platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap

Scott Collyer (5):
  platform/chrome: cros_ec_sensorhub: Fix TS filter history shift index
  platform/chrome: cros_ec_sensorhub: Clamp clock drift slope to
    MAX_DRIFT_PPM
  platform/chrome: cros_ec_sensorhub: Reset TS filter on ODR or mode
    changes
  platform/chrome: cros_ec_sensorhub: Increase TS_HISTORY_BORED_US to 2s
  platform/chrome: cros_ec_sensorhub: Drop sensor samples with past
    timestamps

 drivers/platform/chrome/cros_ec_sensorhub.c   |  37 ++++++-
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 103 ++++++++++++++----
 .../linux/platform_data/cros_ec_sensorhub.h   |   2 +
 3 files changed, 117 insertions(+), 25 deletions(-)

-- 
2.56.0.385.gd3acb90ef8-goog

