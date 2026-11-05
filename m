Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895461;
	b=LtgWyICMex93rOJ7LLn8dWedV3uaKz3MXZN5N2mMMIPAlGBfbHqwtwPF8t60XbZmRW7H
	 X2lKalNgfFpGfii+CsAmhgw/d/GoSgbrCM3ACPwr2JGshZ7VwzPRX84m5GqKt3jOlGi3Y
	 /Gv+1e81M1rVxv8L14+jW/kDEme1fpsfuS9XtpfW4dT0OIkMUEBITpTKgcEQF9aDB3n0q
	 T1l5IcZf3miy5ZOPUjT1YVnduDLnA9PZ2hy6NYccwneB1csxxFvhaetjrBRjzGd0V7QTy
	 g2NCScLFrETf5SbnhRJ4jsW1b5/7X6DhTNNknF2xyx+Hcl7eAL4+SY2OTq7dyutpUDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mPKBLlnM3LFTy4le1GdgYQ+LvOCf+Ky5Ifcj+VZbfQA=;
	b=rjGw0ZT0uOZeC8uFfW8IPYcapUZSpG3Mmpw7DA0u1xFMqqmHSfzbHM7dUAGXIVYw4YAr
	 RUBxbkyyELnjz8lLUGsTfx608yfgfJitvO9kgos+IWRRjPwNvb/vTEeFIysu8VKUAxDH9
	 nIzF1LuljC4Qf/Q26lZYKj5sO9LCpcf9PK41OUyxeQA36Jfkr/3LUb140Fvsd8pFc0B/J
	 RGZT+G2eAp0FfrmvBv7P/gzeSrh27VSb6rkUdBf7t91Eqiz3hDj1qOrUCvfjTBe0PcVnO
	 +I3hmJXLvGAiMrukaBIadmvToqMAQ6NNc9Da/ro+nrYydSB34Q0o65abQM6qab9DTig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OG36GyKe;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB18606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB18606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OG36GyKe
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so456087a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895460; x=1794500260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPKBLlnM3LFTy4le1GdgYQ+LvOCf+Ky5Ifcj+VZbfQA=;
        b=OG36GyKeEkGklSlFnp0cm4Wx0GO4+nwTNu0Z5HJ6o9AByT3J5pn5pMolODYy8XqpNI
         ml/Qy6QnrBvCvOiihpIp52kRzAV4zYTl277m9KCjTgaVlGrnqHU3su8r0+TZBvkENEHX
         EejnJ0s9ODGnU6swA5emaXIjAoG+za0aTXr6qm/PDMO37+fd+Jp2oL6Gp8lfIDNE0Cx8
         9IOwABUOoe4Hz95syzQeRRyJDFySkOdOX72v8OMqRL9lI6qdzlGpckiCkuUQGAm/O3sx
         JsKRe9PUGrt4UcjjB7Oxzd3h0ufiAcuzYY5QSKTk1Hdno2JvM5yOCQ6xbQsA6RG3yX0t
         hWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895460; x=1794500260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPKBLlnM3LFTy4le1GdgYQ+LvOCf+Ky5Ifcj+VZbfQA=;
        b=SiT0G1bLXbXHAF5+UfDdLC/0AqzvmAgi27p1KyvIbT7LakP5h0pcjXlVwL85KKyHNs
         E2+mlaQgiUqMmxGdEn+c7CbYdqXLpU+XH711Mm09OQsiI9CMMrlp3IHm95teCH0WQFpb
         55OmnXKd+vPOZlXoW0D9cbuxIgwiS7+JQ5wLPiy9qEQxkN41mB7viDQtQL2Dsev6meg1
         SHpWOzXV819oRYuI5G8V9Z/bT1Xf5nJylnnpQNSLqPZoxJC0LlOadfhTfAJKTXFlXtPk
         5e8JPUgDacl4OV8h/VOUYQoT+Mlw6ibbT+IOdzrCeMChnfOs91IuXeor9A99Vtw/IhWT
         Suug==
X-Forwarded-Encrypted: i=1; AKwUvBxN6gzEC+UZuaASkahIjaqgTK5czMU6NiP5+6W7BHlKJfRgEDkBRK3D0bV17bt/lFsSknKFFynuPrZv8tU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J7xWIFJKaraRbXbe/7A/OCzEc7RlyH5AO8760LKC/bcwGLqSt
	rn//jpndJe/q9dSipxT3UUj/ZAKSgrlAqK269AO/XAgmvIXO6FbdyG9h
X-Gm-Gg: AYBFou1LzxHZ33/fzHhqQ3bbDQDyWPVUPABl9aWtVgBczs6SJqJKnkdsQssTVJCAZLZ
	zIBKNdvzfdGbNSTJjk/hdhog7CJ/lF5Orz21Fnq3qg+qNwL7JOMx3TJ47W6BidB+XxSUDS7M/jJ
	ov8vVD3Cko7E6Ye1GjIkniZIfAgRbJe4BueLKKtOAODo0y8dGBqlAcghw9Bv/BUaOpKGF/c6qLh
	SbDC15ZU3zAndovf3KWhp49AABH7ZorWZezArYWlxWhSAAK1DtsBCLA8P/8dmuO8hsjfIcWeo/F
	3Nm4WuvXyGmHwfKynbK+wpvJ3o5RfJi+FvFT3EMdKB+rVBX+ow5HjOdLSKagVsUDhNpwsM5/vqf
	h8IQ/YacMgrrcuLGZtVJffwXhfKw1wOYMVsAIzBf3wnmwjpUIOsEmtHXAuCeFiJ5FTfPjgWuIfm
	lmKFos+exALxTIc9ID/tKmQke/w8kpNRaIHpkojUZ2hO+29n7EPgNcSFie8r4QiHJOswvesQwLa
	w66HDCkAa7EqqSYqkFJOzOp6Zs9HVQ15yF34AhRHmb4HtDOj8Zc47l2LGQ4OFIjgoN7rsZxgPCl
	yJlp+b0dvo3YgBwYlyjWXnUbnxnolnWq+rmYCAbhFj55ObuhfScI+d+GNMpD5SKtxji+WvSq5Dl
	VTg8u7jADqix85NuQ6K0jK+I=
X-Received: by 2002:a17:90b:3e4c:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b0afc6476bmr1703983a91.28.1793895460202;
        Thu, 05 Nov 2026 08:17:40 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:39 -0800 (PST)
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
Subject: [PATCH 2/8] clocksource/drivers/timer-goldfish: Fix oneshot mode spurious interrupt
Date: Thu,  5 Nov 2026 16:16:56 +0000
Message-ID: <20261105161702.3515900-3-visitorckw@gmail.com>
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

goldfish_timer_set_oneshot() writes 0 to TIMER_ALARM_HIGH and
TIMER_ALARM_LOW. Writing TIMER_ALARM_LOW arms the alarm for timestamp 0,
which immediately triggers a spurious interrupt when TIMER_IRQ_ENABLED
is set. Meanwhile, goldfish_timer_shutdown() disables interrupts without
disarming the alarm.

Use TIMER_CLEAR_ALARM to disarm the alarm in both functions.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index cc02b012ff76..b1dc8b388470 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -55,8 +55,7 @@ static int goldfish_timer_set_oneshot(struct clock_event_device *evt)
 	struct goldfish_timer *timerdrv = ced_to_gf(evt);
 	void __iomem *base = timerdrv->base;
 
-	gf_iowrite32(0, base + TIMER_ALARM_HIGH);
-	gf_iowrite32(0, base + TIMER_ALARM_LOW);
+	gf_iowrite32(1, base + TIMER_CLEAR_ALARM);
 	gf_iowrite32(1, base + TIMER_IRQ_ENABLED);
 
 	return 0;
@@ -68,6 +67,7 @@ static int goldfish_timer_shutdown(struct clock_event_device *evt)
 	void __iomem *base = timerdrv->base;
 
 	gf_iowrite32(0, base + TIMER_IRQ_ENABLED);
+	gf_iowrite32(1, base + TIMER_CLEAR_ALARM);
 
 	return 0;
 }
-- 
2.56.0.398.g882cbad275-goog

