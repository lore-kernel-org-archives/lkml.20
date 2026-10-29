Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266133;
	b=cf6Qpdck3x8O9M1r1Ju5kPQMrGXQGGcTlVzu7NxfoeNxbRPqRmv6ntTmJemiqAwgSvW+
	 HmJ/z+jXHGXFMy2T7pBF+tTYeCLK0llA5EVCCOSA7AkVzot1xvYzB3oS7J3Yjkl9UXtUV
	 TSt+dIPv3InTYnghSx991Uo5xRFs8mLiJXU0pM1IWhgljYuPUe3lKZKQ3m9nJ+L9RHAET
	 5LXtYQc0acp8FHtx0r1pbNx6yuKqptJtLJbqNS60t4dvxEY/L676W7S8UP3ZoJLflkPT4
	 i7HK7DH1KJZ0TUy/trGU4yC/1cQK0Gq9OxI/zufgrr2rpaYbdIia0pMpnKquKDJE+WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=b8pOvgJ6ftBD+jWFy+BUMkCeP4sQzdAebnkeUQ4aVeM=;
	b=vE8iAUQwlX4Ix3Y5AXFoSKSBUC8SfLWQwlHsCOfVJcQazMEka9FrlwsQdrcH5UTFMc4x
	 b8l1CiIqldDL440tdey6e9+v4wvAzonaGbKPa0Phcw75ML1kTsaJA5++7/7P2z0TJewcw
	 ekv8MdnETEVstII6YXUlVK05aqKojZXGCHJ3WwgAKFtIzMLYKXafYelbxgQ3tzDUsPif+
	 oBfMMaoh8Nnc65X6pLCapALsZkWN/PT/1RK8IL/YGXlhlVXreFQOiBwBkivhT1OMoEKra
	 BbEXcwncj+P4EAg0Q1aTzCDWvT+qJ3R0a5kBNTEtw7OTY9ha9B6nVMA5WNdYzX7oopw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="pErQcUO/";
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82E7606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82E7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pErQcUO/
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so5891304c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266131; x=1793870931; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b8pOvgJ6ftBD+jWFy+BUMkCeP4sQzdAebnkeUQ4aVeM=;
        b=pErQcUO/9o8FmQbuPXmtbm/bPMWyBn/vM43iNvQJAkO1PthI2RtvQfDDvOzfyEbNaY
         orbcnjhdOAP+rNOWw0Ta8aLadydbIgJc0jxW5xrnA9kzDBtCyjK4eeOwlWqB7QKKfl6T
         dgzcfTn4gV3UB4053GjuCHRVFNRkg04gD6yL/Ujrb6slhafguMYvmUR6UP1LyBzCP2qe
         4t3WyZ9CqwWoK3imvzSROj5zZfeo3kpBXK1tTNJDbx4jCZ0TG5K+0mZyZf4jy1w07rXA
         yttgSv9yTp3m7LKevS22A0MSZoJ4NDMbG6SUFFErYu3EqMVFIyEXIQ8+cheV2fT1mSo0
         UO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266131; x=1793870931;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8pOvgJ6ftBD+jWFy+BUMkCeP4sQzdAebnkeUQ4aVeM=;
        b=ywGUpoIAiM6qkepgcaKKk5dIRT6aUybvk8lxuNyffLdfovG0sl1b1hO6/qwghDjV/v
         tZuzWghI0HDVnbhtPEV6rPBF2d4B2VzE8K0y2XYXpzRZp0Btil3vhD+7aE4FKE0qJ4jq
         mFbAEY7feocwv7/3G0RjXp+8kxW8YSLqbuGcQaXKyn/FiMtIqhCkhNjVlcwIFS7DcgW2
         HioIGsXJk3C5E6RQDnc78wx04nOK3W0u1sogR5uIEZfJmrtWKp/Uxr4amtwFnOYe6wrI
         C7+8x36AlfhmUJZ/HcUA7P7StGRfarm2wnoCLzIqywV0SFc0s+KuGVxqiF6YLCkXhqW0
         lpQw==
X-Forwarded-Encrypted: i=1; AKwUvBxOFbvHqbyYY/tAEWLMkFrhoNQ4COz059Lf2/szjU3aku/wYuaG6wtPixGU00VVsCoHiK0yXr7FRFyNd10=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9J8o2Fg5rrTYHzuEoBHPi7eUKJVA3flWYmx5aPf8z8q+3FlAQ
	hYWa60nbzRCsQhSHfswW5xtUHH2MN6CwkUc2ZzOJUQXfw9qccCTq2vIg7XZ99hLINHuLtC7QHfJ
	19z9Mh6a+b+8KLA==
X-Received: from dli6-n1.prod.google.com ([2002:a05:7022:286:10b0:1a7:a0e9:a225])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:42cb:10b0:165:aced:1fde with SMTP id a92af1059eb24-1a6c27a3ba4mr7332206c88.0.1793266130487;
 Thu, 29 Oct 2026 02:28:50 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:39 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029092846.1567475-1-sgsatyam@google.com>
Subject: [PATCH v6 0/7] platform/chrome: cros_ec_sensorhub: Timestamp wrap and
 drift filter fixes
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

This series fixes how the 32-bit EC timestamps are unwrapped, and
several issues in the filter that converts them to the AP timebase. They
caused sensor timestamps to be off by a whole overflow period (about 71.6
minutes) after long gaps such as suspend, Out Of Order (OOO) timestamps,
and large gaps between sensor samples during batching.

Patches 1 and 2 handle the EC timestamp wrap across long gaps. Patch 3
fixes an off-by-one in the filter history shift. Patches 4 to 6 make the
drift estimate robust to interrupt jitter and to switches between
streaming and batching. Patch 7 drops samples whose timestamp goes
backward instead of re-timing them.

Drift between the AP and the sensor hub, measured from the
cros_ec_sensorhub_timestamp trace event over 10 to 20 minutes:
- Intel ISH (Panther Lake device): about 16 to 21 PPM
- standalone EC (MediaTek-based device): about 2900 PPM

Tested on both devices with the Android CTS sensor tests
(CtsSensorTestCases, 440 tests, all pass), and across a natural wrap of
the 32-bit EC timestamp with sensors running. On the MediaTek-based
device, also tested two 40 minute gaps without FIFO interrupt, longer
than half the wrap period, after streaming the accelerometer at 100 Hz:
with the FIFO interrupt disabled as is done on suspend, and with the
sensors also stopped, as the EC does in suspend, so that samples stayed
in the FIFO across the gap. In both cases the FIFO interrupt timestamp
was unwrapped one period off, patch 2 reset the filter, and the samples
read after the gap got timestamps matching their age, including the 40
minute old ones. Replaying the same traces through the current code
gives timestamps off by up to 71.5 minutes.

Changes in v6:
- Patch 1: rework "Fix AP/EC TS wrap". v5 compensated for missed
  overflows on resume and only detected forward wraps, but the sample
  and interrupt timestamps were still unwrapped separately and could end
  up a period apart, which the forward-only rule never corrected. Derive
  the sample timestamp from the interrupt timestamp instead, which also
  covers samples that stayed in the FIFO during a long suspend.
- Patch 2: new. Reset the filter when the EC and AP elapsed times
  disagree.
- Patch 3: describe the off-by-one precisely and add a Fixes: tag.
- Patch 4: fix the unit mismatch in MAX_M pointed out by Tzung-Bi: the
  slope is in ns per us, so it is 1000 times the unitless drift. With
  the fix, a MAX_DRIFT_PPM of 5000 is really 5000 PPM (v5 clamped at
  5 PPM), which covers the drift measured above.
- Patch 5: drop the unnecessary "m = 0" and use -dx instead of abs(dx)
  so that backward timestamps are not treated as valid intervals.
- Patch 7: reset batch_state[].last_len when dropping a sample, so the
  next batch does not compute its sample period across the gap.
- Rebase on chrome-platform for-next.

v5: https://lore.kernel.org/all/20261014074306.2500909-1-sgsatyam@google.com/
v4: https://lore.kernel.org/all/20261013105753.1370713-1-sgsatyam@google.com/

Satyam Gupta (2):
  platform/chrome: cros_ec_sensorhub: Unwrap sample TS relative to FIFO
    TS
  platform/chrome: cros_ec_sensorhub: Reset TS filter on EC/AP time
    mismatch

Scott Collyer (5):
  platform/chrome: cros_ec_sensorhub: Fix TS filter history shift index
  platform/chrome: cros_ec_sensorhub: Clamp clock drift slope to
    MAX_DRIFT_PPM
  platform/chrome: cros_ec_sensorhub: Reset TS filter on ODR or mode
    changes
  platform/chrome: cros_ec_sensorhub: Increase TS_HISTORY_BORED_US to 2s
  platform/chrome: cros_ec_sensorhub: Drop sensor samples with past
    timestamps

 .../platform/chrome/cros_ec_sensorhub_ring.c  | 114 ++++++++++++++----
 .../linux/platform_data/cros_ec_sensorhub.h   |   2 -
 2 files changed, 93 insertions(+), 23 deletions(-)

-- 
2.56.0.307.g5fe7bd680c-goog

