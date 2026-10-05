Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45C64D7D29
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226701; cv=none; b=cT0pgG4c/GoHfo8YOkNW6xYfK2djhEUzEx0nfGGmjwWJ++sdFkP4qNy8TmeeO010wfjkq8uosmNcKSnmbjPY1tP++A4dXfwMuNlZxJ5Sb9HmdPJl155GUDoLWWT6SneJlZqZgvVdqNfE1J9HjegqyL4ZMJhEwKewvHTaldnFyl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226701; c=relaxed/simple;
	bh=kaH16PG0n5qXMp1A+1ketXJJnLdvjaHIZnQlZIlJjfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CW76YethF0XjdxtB+swjkMInErEHAtAP61T9byAUJ9X/V+lCupONcnA/j633wt2Oj/w6xDUV7HnvL5Z1q8+wAYlnkA2qZNvNwrqJKr67CrUGbLWDJtx0HpBa41tAlfYflEoBlxVFl3kHO4sY1i0Wbu9mJUxNhZrcShmdp98FBpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvCy6vVb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvCy6vVb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1728d8dfcso11917195e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226698; x=1791831498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrdUODYcC4o3InxGyBh8xP7Mso3oU5634kbBFJDiJnI=;
        b=VvCy6vVbuGFlmPceUXnPfXJHp5xmWD8a4YNj3bZmWdYG11yEFS8YKA/SExSP8dBwDH
         q/THpGRHSQBwK2TWO07Cm4VPmcr8Sz3iC0avbYZY2wD+0sA90wdHYlRelwHc3fWiMupQ
         /j3SMxOBHnns7ZoawDfJeTccZfr9jsOXQxNPv2jpuTApflxl8WlJ9fFDQq4v1SWEtcWP
         7qQHT8rsJTP6grm6YJ+09pZpUt/ZlSVW2jmb/Y6l6mJoDWlDcI4g4moaXKjkE7sDNFzw
         Va0zr5wOTqGLIHmTlWbSHY4A8tx0lcz/ZS4qjNDs0V/ixHW1fqd/zH3mu5aXVQyiACga
         R8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226698; x=1791831498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrdUODYcC4o3InxGyBh8xP7Mso3oU5634kbBFJDiJnI=;
        b=1L0YN8PWm59pN+MMzwhc/S7+A3rs6UqK55hYlaM2b6EYXKsl5hhJZmKOHDoyBpvcYL
         H+9raW38jPIe7JHd9OyBZkCUd1NPueNnWcN4bMK3w4JLVvWoldPWcFqZZUFSUrKHytGx
         qepb3iuCyZZobU5QS5e245H+q/0DhKZqovaD0R/26EFv0+5TAU5uQ6SW3mRsvGuteE2N
         nS5ML9FvGDTMpMqWKcSWlaVi9VWd3bf4AzauXuuC8yDd+dA9n1uKmwNYOtNts9NrCKXr
         yQdw0CwSxGxI+MmzrVhwOo0EWPiNgGEsH3V5FRKpAp7yxZZ13GeXUA6B/iRkGtQMwspe
         0E4g==
X-Forwarded-Encrypted: i=1; AKwUvBx+pV3aYzfU0o8Z62f9IqwpmB8+AE6+g5ZW/ogf1+QEX0LlNRCbqf86FW5nXJZCkkPx4nEZ5eEUfCg/XNg=@vger.kernel.org
X-Gm-Message-State: AFuF++kNwypBH/WBREt8uI/oWnMJQpLjFnV1jOoyD2fIqQhVr18vTnnQ
	BGG4LzLlZcnnWPgQnNwJ43ZnQsWhnJipqlQdBZrAsnGjgmKo+6lJP2xo
X-Gm-Gg: AYBFou1+ISvEYulnVsratW2VNx4xyXudNlJ7cY9C+d1KwjqfDJ4AZVjhh+dljtXopVJ
	oFLpOEINcKaWUJReYIVC3itiCCugopVUCAlcDR1kzVEJe2fYv7VKbRUWb91C5gIjaCoguAX3bSp
	ytAk8m3iXtk9BtYXD0S3bryR2QFSVBhob1gppykh8HS+VlRCLmLSJMBU7S4ZMwVCxIxxBiKwUmP
	sfD9e4Xy/rGs2nh1gBdQOIbDBzRFiPtV4RGAn4js29SeoqspiSefjgZjldMeeApq8EFB1igKncx
	1/6PzXkpPFLzanw/cgHlRBjsuJMhQAKjkxHYA4K4lk0ExXEcCmjc0otPhiPjPQE+aFEn3iUvpBS
	HhVJmYrQoc+x3cY9PsqiA6fFkevlp4E/w7SKIEGySFiUAr7m3OiKqiBNPUNeqah/q6chwFAXhtn
	+CaRKWEvLrX32u86YSyc0yWJSf1+EU7Zw+1PuMNBKPezNBz/eVB3+TGg9UnSoZAxmY3CzT8iyvl
	wz63T3LVqqCK/Q/nrxl+rF+NJhtd2YGI/yudrQLU+gz6Bm3RHcZHrDLzuo7oboiRMsCoOkocBwl
	1ete9KFGiU8HejVjZb7sPG2dViOjdJ++jM2bcl47zkhHqR2wWwqiF64paA2ZgxmHlsGUnVT+/d+
	8Xg==
X-Received: by 2002:a05:600c:4f43:b0:4a1:79be:c507 with SMTP id 5b1f17b1804b1-4a179bec5ffmr932745e9.27.1791226697815;
        Mon, 05 Oct 2026 11:58:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm281196795e9.2.2026.10.05.11.58.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 11:58:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <brads@mainlining.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] kcov: Use unsigned int for kcov_start() mode parameter
Date: Mon,  5 Oct 2026 20:57:58 +0200
Message-Id: <20261005185803.39170-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005185803.39170-1-kmehltretter@gmail.com>
References: <20261005185803.39170-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

task_struct::kcov_mode usually holds an enum kcov_mode value, but it can
also carry flag bits such as KCOV_IN_CTXSW, so the field is unsigned int.

kcov_remote_softirq_stop() passes the saved raw value through
kcov_start()'s enum kcov_mode parameter before kcov_start() stores it
back into the unsigned int field. The parameter type therefore does not
match the values it receives.

Type the parameter unsigned int, like the field and the saved copy. No
functional change.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
---
 kernel/kcov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 35420f0ac524..79dabbad5a38 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -350,7 +350,7 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
 #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
 
 static void kcov_start(struct task_struct *t, struct kcov *kcov,
-			unsigned int size, void *area, enum kcov_mode mode,
+			unsigned int size, void *area, unsigned int mode,
 			int sequence)
 {
 	kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
-- 
2.53.0

