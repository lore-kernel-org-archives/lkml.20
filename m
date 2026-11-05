Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895456;
	b=oGMi0aJfeTT8Bna0xG9cuOsF86U/RN8KD8mzeW6PDTVNyiXHnC/hr4fLMpc216c1VN0L
	 jkbE4ZyzlnMLkfD+yTP70Hu5XF9QBoxMvNHR5xOI+GKtZic/OKgqz8ljjdJiwJo8zVEzn
	 NVmvQMu6C+D7xTqw6lB8rgnq8isthiIaueKxEcKTvWd8yRQHqNfIjscnwkNKYaKOpWYL9
	 EXulAJtZqBfm0kpG5wlZDbw3ZEDxRGFeZAB2Z/Pai1sfsyrkcXzKrZ5RpuGQWlCfbmOnn
	 p2y8gaouuVzQc+UXl/eWgaOtHtX7cavMEXVwnRwayi7P0Ng/67+sU+wttXy8RQccb5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sbmd56cc2B8bxAxFxQAEiOtDnzrJfFeIJKzZDYlgN4Q=;
	b=zgTURbHl6dUoZpmSSFOhXKe1yMzm9ao2ygpN6AaYO7f6jXNMy8BhCcRBIfwvsDlgV37r
	 G9J5TJBa5ARcWbefoQ0UTuUzio5KqionZVRi7G7qj7yV07PED2eo9JVhwjgfv7evBM1E/
	 yDyhoLL/PWOkgInbGTdqRgp5iPqao9DqcQQFAIOvboHAkyVHRx9BJorenTktQqmYMnBFK
	 uT4U+FtphjVhtnRK2iFeR/qX9ftTlbuW0fN4wa/nogoydRtRdcp2Toj1fMK+XvHMixVDl
	 Irl15witqSAyKzHaHFbhKCjm1Z4cnNyHYgBPjCgNDWR2Szg9iCt+IyCTRZSX2Wvi54w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0K3UckVr;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3E606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF3E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0K3UckVr
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1801881a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895455; x=1794500255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sbmd56cc2B8bxAxFxQAEiOtDnzrJfFeIJKzZDYlgN4Q=;
        b=0K3UckVrwk704uqfWgBZoh1/MgtY53rla5NDjY64X8pneeGJNlwOVV6mDr5AaIj4fD
         JW7vWrm4t37K4AHg1E0vwfm6uL0/6w2Pm3DtsAg/vg1HWgktvLkTInSb0OKfD+FQZfiE
         wRCjX+Q1JmNxNJJFgumP35OvCljvE/yn+kdac8rZzbflzJC7o6kIaS088rDZnnpKWwk9
         idao8SZQVi3YpeeAk6WwkssI/WtLvJTPmV0IsT7+rQpZBoLeFXDvUz0oGcgxOv2KLZvn
         m+1wVfHxE/U++9oQ2oFbQxN54+f/lt4eFIve7M5dZTSiFQH4U63IBo6J/yU3MiQpG0hj
         m+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895455; x=1794500255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sbmd56cc2B8bxAxFxQAEiOtDnzrJfFeIJKzZDYlgN4Q=;
        b=eC27LsvuP4P9IdEwvSpqbWQZ55O3dvx4wUU12GvFJs+7rHEjsAPrnz1NhNfGxWRbuu
         SW1otJb1s+qLcbr0WUyXwqoFIO4ndeeB3HJPpgbkr+C9VxBHRRBkwPN+M0tbHVlXh6NU
         xXOY3weePOxBc49Xq5JSdNXEqPObuEmrQdsBnQvB+bJWK2cXlooU7uTl9iBcBpXg11j6
         n/pypkSvc60mf2P8YOJoRng0St6UKTJbblqXxjlVPLwuq9CV6HesLW9S5EXnt2/VDYHN
         DHbgzKVdgquVaJdI0DOUmYm/5fvbOgGMvUH6mYWZgUxfeKF3tArZ+51NjQnuUwoxw1Hr
         j9bg==
X-Forwarded-Encrypted: i=1; AKwUvBzGhAidNQ3QkUjyIAno/OolnfBC/o80BIGiOt6sgcCZumQ0Rga1V7oHGo/jSM21IgWrre3Eo56dwqfJiFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FkV0PPEuRqiA6Yi4vrj6kTacZTnu9IBZGweasMXNGgjqJf5kw
	WtMaEbY+T4pQ6g1/1nvJhmYcabmv4pkTfMH5uT6cnC4/ZjB4ebmQMTSc
X-Gm-Gg: AYBFou1KP25rOXj1MlPzC1Y/gmzyhi1h2zGa7QM93vmu2eeC4pT8OB1C2khmrVY0zKV
	mMAzfX2HFcpFqtrTqS2uVPZ913ljHihBt1NwNXSiolGlz3nwkUWMDlTp9M09vCv3LRhw0LR24v8
	7zwgsMvoQRVVIQtNkP/pAvKn/bsFAj25gjg6HfBibsM+RE+TAx8vVIRscz3qa5C2o2fuRqh4msN
	hytLrE9WHWulN60sPO1YwLWyS6PLrYa2X3OD7pQT9XdEyU87EFsYTQZEaSPPkp8Wa+ozGmfCx1l
	mbxchKuEh0PPH8u9erCImGevH/aX1rjgfk6rWCNtPYEVR79bfPDbLU86f6ttn+P+DHHaMoEi42x
	wtfANZPRSBQSRcg3gmjv3tPtn7xuxb3Yqudcp5hSYZ0gXtsRMezV/WGvn4+Ly1cH9kFD0//xYmV
	uf9fc8/MbrLTqadVl+hNCMGh8NZVxdcNzgELZ8EVym1930TeOauRG2d3lYCP26ob247sn7RE8tP
	ciLvQmPKR0v6K9fkHfJG5K/KNoOuzZY+sOn1e6pPDwKsYqnPf3vvQYIjfCHbL22LSo4jpg+NhL5
	5/sjAlz8uEZY2OHeUIvODoeTVyJepukyJtwFnzNzfO3KQPXGVLhD4jfM7CKiQbozgVApivvu3l0
	QCAuA1fDi7Dro5115PpkU4zDufY8fNLz6tfOGseDIVmeI
X-Received: by 2002:a17:90b:4b90:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3ae8984b662mr17099226a91.58.1793895455036;
        Thu, 05 Nov 2026 08:17:35 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:33 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/8] clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
Date: Thu,  5 Nov 2026 16:16:55 +0000
Message-ID: <20261105161702.3515900-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading TIMER_TIME_LOW latches the upper 32 bits of the current time
into TIMER_TIME_HIGH. Because goldfish_timer_read() reads these two
registers without synchronization, a concurrent reader from an interrupt
or another CPU can read TIMER_TIME_LOW in between and overwrite the
latched high bits.

Protect the register read sequence with a raw spinlock.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 3fe12c7ee7b7..cc02b012ff76 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -6,6 +6,7 @@
 #include <linux/clockchips.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/goldfish.h>
 #include <clocksource/timer-goldfish.h>
 
@@ -14,6 +15,7 @@ struct goldfish_timer {
 	struct clock_event_device ced;
 	struct resource res;
 	void __iomem *base;
+	raw_spinlock_t lock;
 };
 
 static struct goldfish_timer *ced_to_gf(struct clock_event_device *ced)
@@ -30,6 +32,7 @@ static u64 goldfish_timer_read(struct clocksource *cs)
 {
 	struct goldfish_timer *timerdrv = cs_to_gf(cs);
 	void __iomem *base = timerdrv->base;
+	unsigned long flags;
 	u32 time_low, time_high;
 	u64 ticks;
 
@@ -37,8 +40,10 @@ static u64 goldfish_timer_read(struct clocksource *cs)
 	 * time_low: get low bits of current time and update time_high
 	 * time_high: get high bits of time at last time_low read
 	 */
+	raw_spin_lock_irqsave(&timerdrv->lock, flags);
 	time_low = gf_ioread32(base + TIMER_TIME_LOW);
 	time_high = gf_ioread32(base + TIMER_TIME_HIGH);
+	raw_spin_unlock_irqrestore(&timerdrv->lock, flags);
 
 	ticks = ((u64)time_high << 32) | time_low;
 
@@ -107,6 +112,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		return -ENOMEM;
 
 	timerdrv->base = base;
+	raw_spin_lock_init(&timerdrv->lock);
 
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
-- 
2.56.0.398.g882cbad275-goog

