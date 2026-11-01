Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553847;
	b=pFZgpSChyy38bwlBduGYm88YjlEqgBuqeotJEZ0gQ301JmzOeCB3103WRuuuIxcBTIT9
	 e5u21WleCiQrVKeccsT6vwJ3Noj+d4vAV3dJ/jwDBJ0nzEJSoMyHXgGrDLKJoUg1wu9lA
	 pcvAPJs9mvF4/uZw4plFPJvMpV0rMDTUH9HJNNI7sdDy907qFpbIgOl8TUfE+WuyIZn0t
	 JTXgnTZmx9PM/ciXO6QOdt+GGwQYkWYuHiS1o7MCN2wr+4v1RnY/gn9rYlrNe9/DHIy+Y
	 JW2Yuq9WtnubOoMmi6N+4pzbk6TXkVCDFhIcLsYuI12tdVcWbNjXO/Rne2AQbWE5f8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=geP4LBbByf6jqZAYZXnFddd2WnwFImkXZjArY2LjBTw=;
	b=VNWVUrMuPS6RTFbmeiYIbIZx5yYjbGwq4Qg0n27AENJxIdDihGz/fCwzEcKDdiQwIyzU
	 OY2BwZMIx/13fQuPvoJrYux13emoMIl36Ilk+RhPPXr4/0TAzBTXWwH9G+mg/XMVDCKSq
	 /KZW64fD/LuIpEOOPt3fG0MQZubPV8VSluUvkIFO8TDYZ7rhsl3lEAo2j4GPvEZOHUfYy
	 MfwcG7D3Y7YlJOy8Gc0d53CZ0HxztDop1hF2IF//9izvq5o2jQnpVb3uXpG/MMVSz2nuz
	 f5NXaGzrvkZH6E+QsJWyyHe3eQrisnYmk8ND8K0Ad8zQXI+4orgwuTWuSsQk3NWyK+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbq8SoP4;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BE3606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22BE3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbq8SoP4
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a208d93758so24154005e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793553845; x=1794158645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=geP4LBbByf6jqZAYZXnFddd2WnwFImkXZjArY2LjBTw=;
        b=cbq8SoP45wBF2lxLaCWC46/W997bbozdIguYoa0M1kKaFZdWYivZ5TWUyxWykuxNt8
         uT3ohcFFeUMQZpg1eBNgoT83SShbChhmv6K3xdKSJuOMKi9YhMMV81e1j39aOqQIYrEx
         H3Iy2HMxwIqbQ1mAPOBIHZ+x0tL5Bt6tp/eOkoSa1IUdcwuZdCWAg2dPfv5vOiBXzhq3
         X6uf6ztA+z6VgOMa0kitntu/KaTBVys+++Itpsh3t7NbMN1wiqNyc++WmR/j5kDO/ghM
         q3ayyNCcYdsF850/CL1g5PNPu1CVgbA+GzbznbeKI5VnCOPID+/xsQzlZ1JvfoxxDNGB
         J64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553845; x=1794158645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geP4LBbByf6jqZAYZXnFddd2WnwFImkXZjArY2LjBTw=;
        b=ikCgDpFl0Oojy6QGEB8NQ7cBnk0sB2i7kUqpaJN0bSYwReYgUGf0tQ+kqGjp7FD07X
         p5XFICTXqom6JU8HpdVBEcCeu6IUEDCLonszo7MKpl7Bn4MVQ+K0fxC+wK0IMz+Fatfl
         Y7Nhx5CRXkYw8kBbbS53MKTVwI6B0aG4ARnEQ0MUDxW/PS5vD87/jQuKbaGVep+VmuJb
         E39t7s+LyQaHLbHRDpiKoSNRcvGwBYwcLZhuoptQ7pigZeYtDOzYtEVKdr3/UFCqEfRx
         jAtGcvaTDTif592kKbVECv4ccy9hFQxcisidLoJZQ2uaH23n0sgxc6gaix/BgZX5zdmq
         ZNBw==
X-Forwarded-Encrypted: i=1; AKwUvBxUTTGuSTH6Msi0cx2tBggMz6xMBHEW9nMTpDWrLRyqwEG43fNE+6Vj10xpU3z7BV31AukTnwbDQyPcsY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLxTD9KtthwXd+c+Y7xMRrifSsyL89foYit1SeOUR2Kr/lfJoq
	FK7uY4+4+w7aKqJWq8+4wgOHizmNRxJ7UMcfMYuMsDz087qGWLZRtKNG
X-Gm-Gg: AYBFou1sLVNVFTU27R6hBXHIW2lSMMajLnMsAfkE+Z5QILEfYDTLGu2HDgTWnn/FfCk
	RV5+pnr0DU74gYeMumLnQdR2roUxOTrOh5Lod6LElRCZnoVJRzzZ4RgeLQk6uvzin9ReuLxC3e/
	+Jf/7I4cUG4MJJ6Xe5n1lJFru38rZnwVeW8DB0a7zFe8agAQFvsYiE8doas11oZXUzxuvOHLJ7z
	opbqNCDzOIf5JaNJM+GOCAATFufTCWttV/FDYkz3DeSmfSrg7QqH+OwhYr6wUsCoUAXAqj2y1ZG
	LEt1frM0OO8LVA4CrSp4sdUaCF1r+y7QPSWnMWXBz/JJF7i+1w1DE9JR4lG5mYm7AjjH4wRk81T
	4BrWM+BgNgrhgjPvYCoDqqYLxyB8OksOdbpqiYQp1b4JoDbf5Pt7gXqHYqbqKyQL6yvqX/YmuZV
	IqjTXgl6Z5EW0IxbXkRcvwXrlGWxYJoXO5tMtkXAUb2h6CP5J2m1mXrvhLxeWaRWuWGnMUIMflQ
	+dA0wO0uyJ40kMxAGmZIicQ9POb3F5syQSQR2lGkKpOA6ILHT/kk7ykvbisMWUo644s9yZ0dqFF
	J+c0OOCkHZjzuHuV1cVYECSpzXPrC6NeNWAWfKWsd3bZQg==
X-Received: by 2002:a05:600c:8183:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4ac180f2ba7mr171235365e9.12.1793553845239;
        Sun, 01 Nov 2026 09:24:05 -0800 (PST)
Received: from thinkpad ([213.137.66.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf723b5dcsm213915675e9.14.2026.11.01.09.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:24:04 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: anna-maria@linutronix.de
Cc: frederic@kernel.org,
	tglx@kernel.org,
	mingo@kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] hrtimer: Refresh softirq deadline after clock changes in low-res mode
Date: Sun,  1 Nov 2026 19:23:44 +0200
Message-ID: <20261101172344.426489-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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

In periodic low-resolution mode, hrtimer_run_queues() updates the clock
base offsets at each tick but does not refresh softirq_expires_next.
When CLOCK_REALTIME is moved forward, an expired soft hrtimer can
therefore remain pending until the old monotonic deadline is reached.

Reevaluate the next expiry when hrtimer_update_base() observes a new
clock-was-set sequence, before checking whether to raise HRTIMER_SOFTIRQ.

Fixes: 5da70160462e ("hrtimer: Implement support for softirq based hrtimers")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/time/hrtimer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 17dd38a6cee7..5d1df371e931 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2289,6 +2289,7 @@ void hrtimer_run_queues(void)
 	struct hrtimer_cpu_base *cpu_base = this_cpu_ptr(&hrtimer_bases);
 	unsigned long flags;
 	ktime_t now;
+	unsigned int seq;
 
 	if (hrtimer_hres_active(cpu_base))
 		return;
@@ -2306,7 +2307,10 @@ void hrtimer_run_queues(void)
 	}
 
 	raw_spin_lock_irqsave(&cpu_base->lock, flags);
+	seq = cpu_base->clock_was_set_seq;
 	now = hrtimer_update_base(cpu_base);
+	if (seq != cpu_base->clock_was_set_seq)
+		hrtimer_update_next_event(cpu_base);
 
 	if (!ktime_before(now, cpu_base->softirq_expires_next)) {
 		cpu_base->softirq_expires_next = KTIME_MAX;

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.53.0

