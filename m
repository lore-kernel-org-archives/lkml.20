Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD68E351C0B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364888; cv=none; b=uNHf3Tj7rayJxtY3ep22lELrUszG83u3Pj1V+TJnYlpgqc0FF/VyP2BbKEPw0LUEbCHVpae0XsezJpCqud1U33tyzKjUrQCGV3XRrsmDEbG1LWGzCA4/B96fIv8iNbHZVtWfVNTxSx3uWsEH7GlcA0tllv6TCyHGkZfsLDiyHh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364888; c=relaxed/simple;
	bh=fR66qV3kQLyfv39LEIbTf/Q7lysxPTqD1gJeyle3EBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rQq3RJ86AbrRP0MIflONKHThkhcv6BvAalc7I2KnZ3+WLYMdjkyzMC9Cr8PUS0MRNymtqP0VSNXOXsaD+MlaF37+4RK3QieWfNLrr/6DUdAJuY2CplERTQECYt4rHX9p7aWOZ/Hr3ucZj63ZuQuP0TryE4kjlBKcuXHE86eq4hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpKI3Bjl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpKI3Bjl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49e6bad7b79so14261645e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789364885; x=1789969685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXNYXe0Z5RdbTRhZRnews+9t6bKbA3tmATeBlUSa9XA=;
        b=gpKI3BjlszO82xW9oWd5cFLF9K6ykHRTPU9w7uemhFlRFS7lEazRDUCbE2piYrwUjQ
         e5YETqoWcJtx/7pg4mE1ZTvy0ZQtK5aJO3B26F3caM0hL7tjWuGiOw0YgZNF+gsCxVWY
         iTB4H9NeGi8YC5ShndfMfHC6nFFvSyFdeH0KwzdOMMGjmTWWUX/XFb/EwtcuNn4/JzkH
         Yc19lchqHD116sipSsWEGbmiGCBxmHlOhF4q56XTz40U0pF8+6KXWa38fH/DP0NXgQUb
         QE1P4+KTRidYDbJ7NffNJqYpP0K962dAd6UDc8en/zs1r5KRbBkXZ/wO+cmkJw0I78Vk
         /KLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364885; x=1789969685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXNYXe0Z5RdbTRhZRnews+9t6bKbA3tmATeBlUSa9XA=;
        b=Unx1TqrO/4WHgrJd2SAlEDXpEqslYCPI+PAeEsbt7p9GJEHiQZG0Iwf16U6//thG0H
         AxzKHUzPurmJgT3HLAYJeSpZ9UDFuEcrUxz9YYaQLkjyGrDffDHvJdbbFBr5udFHPvTI
         SP44MkfpYclpMbGXMXLA4IwFRpFj3BUAujqg+ctxg1/lVeuVK5UbBftEp0LRRNjfi78S
         H5jp+x4Ag3XbYaHBm54EzoyjsrfwcNAaPx4YgfhIUetCCqxf+neN3xjcwUDDqWg7GjHk
         PBGVTv/8ds3U1S3pWFHExvMgzTFcR/tX7X80JG4oSauPc8ggekKc6W06BJeEnM8+Rynb
         g7xA==
X-Forwarded-Encrypted: i=1; AKwUvBxwEepSZgP8SHNvR+jZsvrbYvLQNSk0HfMBGbNJqbvYWnNnmaOD6IN8I5u89wmiVllcxzu9rY0CGgjwXdc=@vger.kernel.org
X-Gm-Message-State: AFuF++mo9ieZfoxOoMKzCzT2vBB5TxXy/C8eIJm/QTg8J2GOjtHFS3Fy
	dQAYPxUxQUEjU37VdWic0bMRrUsfzRuWmlH4INiJHu+smHep6DboKiNJ
X-Gm-Gg: AYBFou1FBdx7H/qofFRTfSO20IGCBT/H8YiwUJCZtH4h79e2UwAEcX2BNsNdbPpyXQD
	4np2EUC+SD+WWbZZSYqDGd7wwCn7ta7gqRl8JXUhvppFGae3B4AxTeoLDMyM+hBROZW1EkiPeEH
	9b4INy6DnijADRuSYjyEn1AJ7Ug25CE6nih8avB+Q05NKZ+7s1IcqjkNruqSCynSYTir1lpD7ZJ
	PaJPJxYanE8edLSBPeJaZy6AQHfs4lQFaOMPt3I9lcYWKYHEMajnsyaEkJZjWu1JL9VIDzCXl0/
	vqISOb3+InrWbyid7BFpS+51Pr36+GXR3lDeVf6Hk5+JI9gF7MuQFLmBjG7R0SMfLyiTnZuaSiG
	FfDS/vcbkMwEXPqLaeOSIOR1w0gNTWtvZnJjItijZ+qjbMg7XVjJXnphHUq1XVCk+q9kPBfVMYO
	ahNhxj8PZbaRE5EzCXU9MT1zwDA+zl+FLVt9B7aHJkNYHOJQrPZlC/RLhuNDlR37a/zOGNUkJfQ
	gVEPImqKVLC8ktmNSfmZHmrh4D/gTKAwOVXbnY/J3OIlqfpPKpLN2Xb00dNApl5h6K3Vi6NEaTy
	l/mjADh9Dbz/1lrTGFgaO6lk4DIE54M=
X-Received: by 2002:a05:600c:3586:b0:49e:747e:c00e with SMTP id 5b1f17b1804b1-49e7a64e729mr11700895e9.9.1789364885075;
        Sun, 13 Sep 2026 22:48:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-122-014.77.7.pool.telefonica.de. [77.7.122.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm214537735e9.5.2026.09.13.22.48.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 22:48:04 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <include@grrlz.net>,
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
Subject: [PATCH v3 6/6] sched/core: Pause KCOV in wake_up_new_task()
Date: Mon, 14 Sep 2026 07:46:32 +0200
Message-Id: <20260914054632.12877-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260914054632.12877-1-kmehltretter@gmail.com>
References: <20260914054632.12877-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wake_up_new_task() is built without KCOV instrumentation, but CPU
selection and enqueue call instrumented helpers. During a KCOV-enabled
fork, they can record scheduler, hrtimer and clockevent coverage into the
parent.

The paths depend on runqueue and CPU state, so coverage varies between
identical forks. Pause KCOV for the whole function, extending the
scheduler exclusion to new-task wakeups.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/sched/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index e3b50bbdf3a9..a669f8d99653 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4962,6 +4962,9 @@ void wake_up_new_task(struct task_struct *p)
 	struct rq *rq;
 	int wake_flags = WF_FORK;
 
+	/* Instrumented callees would leak coverage into current. */
+	guard(kcov_pause)();
+
 	raw_spin_lock_irqsave(&p->pi_lock, rf.flags);
 	WRITE_ONCE(p->__state, TASK_RUNNING);
 	/*
-- 
2.53.0

