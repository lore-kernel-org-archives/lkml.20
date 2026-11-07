Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057458;
	b=Us2r5urY98LsBdIuoNeRDy0euBlXu2Xz/Onq88Y9v4FiRd6NIR+JX4yOIG+PbhUDheYU
	 I4YMxtYVZfNt7rvlm8sFNtdmzBvbyf0gEjI4F7c3hk4okIMA3Y24GD7aTO+uKv0ykcvC+
	 OCwqxyz+AxVjW17jT5yxG8Ky2rb84kg7ZXBADzxf0ymO00rKFp7AvBD6A/WdUwtFN9RxN
	 5iy1w26j3BEfg4er4VKnihm1h1Bhkp0Bxx9GbyxCFZeULaWM9ogPDp+abI9HGwZB1TASV
	 Oe1ah9sJaDP5b2Rt6Jlbpc6dk0N7fdXfnWMGeUqgi1R3nl56X4E3YY4BpaF2IK5X1ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u7PbzNwj3lxmkhNmK2fXXWzjk/jBMsgMw+OKuxBqyA0=;
	b=f76oOg2Nq1tXbagb4uOGKBoPnRGy/TfuUDLzMLIwJP0auR8YOF+g3RSLPDknllOXOp7N
	 czS8ej2Ve15ainoe+n09JZLjiowMPMqz9zRtVWLHxf4zIQfH3i23/PjTXeflLU9W0W8M9
	 vGhB7+NCOwW0H+AKGS0Sr6M5s9RaJueQ2k/tquahcgWYyr/QuOQU6IG8dRpBkzz2VF5gc
	 FCZFBPbMlxzBr7s2JBX+L3tLeI5MqwI8p1hl9r9gUw21fgZ7HO+SFmd8Hp1+wJHg2wGVB
	 fyTBGpyTOlbVTjvCEpCspK4qdtQdjnEKYtoJ4GytC7ZiKMBdjBPfsHTda2P4+Z51Rug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WANliqgU;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEF0606D82B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAEF0606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WANliqgU
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so13631615e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057456; x=1794662256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7PbzNwj3lxmkhNmK2fXXWzjk/jBMsgMw+OKuxBqyA0=;
        b=WANliqgUeHrcyNqXaa8lXZrCoaKBMm7qTwL+3Dxvh/W8QAGhSw1vwjzEJh3n1z/lbo
         ANep2BG/rMJOHdUQa2fwzHk4KlqFzPtOfKcG7qgq/UDohEpTYYVtt3ryLnyW580vs4LA
         uarblM0nQlOaOLbKLBXQWIpMWl4A6NOiYLXEoIgtsDypJH9eMeMn9xsHNPlvMkaeWo8i
         eolSODHuV/ciQYw9RpDOzJgPkVIIPuMzkqA54iTNUqO0WPYZUWZaH1tKtWnA+Qk6Fmzi
         PuSld7Z/H9ZnmToWEHIehCdjtkOWv6w/GvdBGkreXstTYW1+9tWp1CfSzEOO+4HxvAC/
         1ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057456; x=1794662256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7PbzNwj3lxmkhNmK2fXXWzjk/jBMsgMw+OKuxBqyA0=;
        b=X5lKXZZO1tj2lXrm0OhZ6injwNS3osUNqRGFDAi6mABR7dq7Sh31SmoBUKbueSqIQ4
         Sm8Qe+t9A2CA8al5ecUdWT96EvDWqjru7d94qQuc6N5XYBRbb6ARPSMAH+gYGVgr/09X
         UygQ1Q5lkfLBMITstdVYMnlalOGKuKHcMg0UuWyVZlXpNINM/BYR1R0YbXd0XAsNapV1
         dB1ie/Q1t6aJMPrbXfnEMNGF4ThLLgL3ySwA61ZZcJvZvbpRvgUk97jIFOlSRYfEGd//
         CQGXaXGXCkZaHIbQGq/zUsuS59ZdAze0Euji/UASKxReIrxY9jt5EzRyGofmZDkBTFQo
         O4Dg==
X-Forwarded-Encrypted: i=1; AKwUvByspg5iJnFY+sZQBiMznWvURhd1H2PWN/BLyRvzDQsthd3yWCxJkH+y4V1mdb0ld1ysAcr7Ofogfhs8hcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JWgWTKn3OIU0bSySkMSeJjfKYb2HN68FmHrZS5d4q1XunacvA
	eO92+mr3sReKfqVY72BzTQuhod2ctLRHRgm/dLm/28nj8wTGQTO1dB6t
X-Gm-Gg: AYBFou3ExzQOymQn+Tclp+PcqSFSIeQ9yksIx1M1EnmWnILw7wFtTE9wBHIxT97Z7Vt
	S6wxWUGOKvBYW07pV/hDpi0s6hsFUuMsTTLoATNSZpkKZpPf/GzixM7KL1SimkD7kCPgKH7nD5X
	a+QndpSIr1tyjjgEMOfaNDlPeq/kqYkq6zTOhYcgvplYcGg3tCP7o5RRlJwfWOz9/0GLwYGB6AA
	u9r9RqzJf08P2f8FhE0ovsx4I+jgR9xOIfu5Q5LnxIoRb9SDVypRQz7Ih+Ku0hRvpcwEgleJaov
	PIUqCxQVSruub/jFPDJG4KywT5OZC25ZlKd4e++JJsntQoo4LMFRQ8MnVArHrh7IxeZFEdJCi5G
	fvoiuzBpFTtcCCvG1gUgLtUsqNf57r0S8apuVPmWLYr3GA8RtzsA96aI/C6/9A14YXcqRVc0hGU
	6S68HJG83zJ4SCRpeM57JKiZZ94XK7dhTVMir1f7+xKp9koVB6ajxbfxmvbQW78aT+628wtm9e+
	JKcucVIINcbXqdo4c0MgoE5a91AAUAn6ifM9AH0TH8i3NsW4eRw//k1p261wYF4p5i3dREKdh3q
	NcNpw+lvSfKgmAQ9csplfD/mhdIl4EicXPqAMO44iZVbzj1eICmSt7xY/yYZfQrx/2koWTa2tKx
	fSRgQssnbY/uVjtPBTsp3ZY1UaTRMIfie6L3qP1JNWsviB7W9fxyAmqTLWbw5Ls9f4XYg4bjwHa
	Hwp1RqMGwX6D6cy/9vJUqHTuPTSPgMf9g=
X-Received: by 2002:a05:600c:6211:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4b6df6df844mr101548725e9.16.1794057455872;
        Sat, 07 Nov 2026 05:17:35 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3279f9csm65132675e9.8.2026.11.07.05.17.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 05:17:35 -0800 (PST)
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
Subject: [PATCH v5 6/6] sched/core: Pause KCOV in wake_up_new_task()
Date: Sat,  7 Nov 2026 14:17:10 +0100
Message-Id: <20261107131710.89264-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261107131710.89264-1-kmehltretter@gmail.com>
References: <20261107131710.89264-1-kmehltretter@gmail.com>
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

wake_up_new_task() is built without KCOV instrumentation, but CPU
selection and enqueue call helpers instrumented with KCOV. During a
KCOV-enabled fork, they can record scheduler, hrtimer and clockevent
coverage into the parent.

The paths depend on runqueue and CPU state, so coverage varies between
identical forks. Pause KCOV for the whole function, extending the
scheduler exclusion to new-task wakeups.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/sched/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 4bd0d5736ccf..a63bd78ce5d7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5019,6 +5019,9 @@ void wake_up_new_task(struct task_struct *p)
 	struct rq *rq;
 	int wake_flags = WF_FORK;
 
+	/* Callees instrumented with KCOV would leak coverage into current. */
+	kcov_pause_scope();
+
 	raw_spin_lock_irqsave(&p->pi_lock, rf.flags);
 	WRITE_ONCE(p->__state, TASK_RUNNING);
 	/*
-- 
2.39.5

