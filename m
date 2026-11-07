Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017718;
	b=vcDulzvTFSf4SPa8bxUaDdk43q9a9xcw0boXWZ8s+6Rw2Q3RH6Iy9veJRx5LTQudhxvV
	 eL1gHESbeet2/+UyKDnCgqp+l4kebClkf3FwTU7yCZEU1GwcGCWfBeu+trZSs5FPEcD4z
	 2KyMH8g8Lo+YuuqjkcWLcOOe0RnkKQ5nO0Ma+fgk4TmnIILNHTRx/Tn6DlYGG2GVEUgYj
	 HL2klFMNi/Orze9YLkndhsyCHYlJ6fccLIgLHlYAmVgnf05lqD/x9vQ/AT/Kmtp2XHo//
	 zDaxeSbxmOuKk0/qCe6yPGUFR5Li7t7BODzO73dLlH55akBZXusUeZBtwO1I6shCUfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wikFKZw4t4TcuII1gnI7d31HqgOIm3ag7690hAeyUhA=;
	b=nNS/w0MBUTQ9xmOrJThvP+WHkupQq46l5blLgm9o4fgELHvP3qtU+wNqPIJ2+TftJHv/
	 Sm7TQaPIfoeWbAnN9H4oln+xBBOpaXbnEoGc1H0y/0tVpVT3LXFEY8ozXFmHfgjaoBbMf
	 E/PqI0A5Pio1tNQHNJBpysVvZVDAEAhDTvs2Nx7FvjoxwzVl4l4hGsHr8ZWrO4cIXQzZ9
	 d6DHbkns95/eWkADEofowFmC3FI29pTRd9HjWSxCp5pIOjaXG9n7GTLZ6UBqHMO+O046A
	 ZKjUMJlCO1bylD6Dc6VVG46I1wG7g4dnlSLNGzlxmYDTEwGllarNPameHttYCW4h3cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=McOLOv5u;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D55606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D55606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=McOLOv5u
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11540635e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017716; x=1794622516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wikFKZw4t4TcuII1gnI7d31HqgOIm3ag7690hAeyUhA=;
        b=McOLOv5uPocWeQYs0J1CzVJ7oBNbutOabdLWzEtIfCRWBUAA2m8Wu2kL80jD1lvS+n
         uFgN/1vvBLiQvUFmFRTDDb9M/uRzvPlc7PT+dGnruVgq1F92pmDgc0F9gM4Z6n2wVUHN
         P2mFThHUwLk8/DKJix4h4qSZNfeODvzOeQYMHOz4/kdOBlhCY3bUNu7NrJMG/hoMOUyk
         /MNw4U0a/pUNCUFvMKgip2erjFOM6UUSU/1S+uisqkjfvpbgVfK6Pi/bfzk26d4IodeF
         UkW+oilNBdVGw7J0aiTIUhJc+I5dzoor2yJVr1nbAefpoZBEk8kevntUjR4ui1/CsxvR
         ZApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017716; x=1794622516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wikFKZw4t4TcuII1gnI7d31HqgOIm3ag7690hAeyUhA=;
        b=uitaGr9ragfIXq1BhtJBFQucD2CzgjPKbJaranV44wV/OsXL0F1qJwjLZ+XKz6GbrE
         WkCnYKV9D7DaQpH/eid+3wtskkfzyiQURt71JYCT7IyU9ULI64IfJ2pzjBMjBcLu8CIR
         DTUQ9uGKOBEDWcYVwZDUD98ER2AphMb+MA4uae4az+kh/iruaV52ElFEcVs+662vc8PW
         3PD9RTvuuV9wBT7bY/OTOBqBL5gLgHgVqPWbjgPu2uD8GApBFKC/m/UPRKCo3agSkXpx
         TBPi+V2B6JCvRB8BeL2AFuNIZ7wRrF76C1Ffk3Q4bjntk+zxzuB+JPb3h3+QWVwmlNqJ
         V2Hw==
X-Forwarded-Encrypted: i=1; AKwUvByWaXfVz60sbNVwdzvp24Ze0YjbJ+8I5M/0DSOx6MsZcNQQ1JYqwljFAmLw+hSn0IThgXL90Rmzj2A5eMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tlBxExtnqfHigMEug5yckJ17/c5gO7vYJLlBq+g6YWFSYEWMV
	iIZ0w0r/rfjd/fnikvkm4hbclodW6RvZ3KpBxvCoS9gQajf+rTxp9GV5
X-Gm-Gg: AYBFou2FXQaKSeQqrTAHl8mHOnN8ed9Xq0um/+dMWYXMjOZ4hgrUBKLu5qN3ht7MrbH
	z9+35/g6I0qDVAPQaruGZyrTAyyfsmZ9Jv8Wt663kIPKl9ao8bhgKcGHMF7hc/m9sIErQ5SbEGb
	KcOOpg9cFatyi9hw0K+qj5pfpTFbeQeXE8Wat4zQ8L3dTtUi2Hl0jr9YZBSc2dE93xEXhFDiBNN
	JN/uHFOKuhqhUn16eWzfCQjEaYstnS9OwGWmR4/ofmpSfW+H5c44f7JzAQLDuuefr8VGf+7b88Y
	cbp4iPwnGRlxFjC/T7iCO78PCS7sUp2a3KE9oISZvjMGW5YjNXIAyjLvXsfyFViUSP5+x43wJER
	4Gcg1zc7KmsCETyYBFChcREYuHHvMhIL0tHbdv1cVoifZhwchNhsh6JJ9hdP4jUAj0rOYiiFX4i
	k6TEbffnAovkNfIxfYDM6df7YLAeFxMo4/YhEVwl17RASYWqBwUn0KaGFvaae9Sm4GvDAusKyWF
	0Obys5vhiS63fmMdjPjpuHls92SPKxo9Q40Z/jWgizrXrPI82jUsL4jg7rcAckwZEWarIk1Sr3q
	iVHf8g6oMjiPQMcw7hBO9Gl7WkK//uBs/lwTxgEr7POFLb+FtZquKyVTb95FU5HmA45GNl+sdgq
	O0Q==
X-Received: by 2002:a05:600c:4e8e:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4b6e054a25cmr71898355e9.34.1794017716295;
        Fri, 06 Nov 2026 18:15:16 -0800 (PST)
Received: from localhost.localdomain ([86.124.84.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5f11sm6367449f8f.49.2026.11.06.18.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:15:15 -0800 (PST)
From: Radu Toader <radu.m.toader@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com,
	tj@kernel.org,
	tglx@kernel.org,
	frederic@kernel.org,
	anna-maria@linutronix.de,
	bigeasy@linutronix.de,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org
Subject: Re: [PATCH 2/2] softirq: Treat an interrupted idle task as idle in tick_irq_exit()
Date: Sat,  7 Nov 2026 02:15:07 +0000
Message-ID: <20261107021509.968928-2-radu.m.toader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106102315.GT1813469@noisy.programming.kicks-ass.net>
References: <20261106094343.174905-1-radu.m.toader@gmail.com> <20261106094343.174905-3-radu.m.toader@gmail.com> <20261106102315.GT1813469@noisy.programming.kicks-ass.net>
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

On Fri, Nov 06, 2026 at 11:23:15AM +0100, Peter Zijlstra wrote:
> So is_idle_task() is also true for idle-injection tasks. I *think* that
> is also right in this case, but it wasn't mentioned.
>
> That is, we can have tasks that are not rq->idle for which
> is_idle_task()/PF_IDLE is true, those tasks will also 'run' an idle
> state, see play_idle_precise() and its users.

You are right on both counts, and it should have been mentioned. v2
names it.

I agree it is also right here, for the same reason the idle task needs
it: during injection the CPU does run an idle state. play_idle_precise()
sets PF_IDLE and loops on do_idle(), so TS_FLAG_INIDLE is set and
tick_nohz_irq_exit() has exactly the work to do there that it has for
the idle task. What it is not is confined to sched_ext - it reaches the
idle_inject() users, intel_powerclamp and cpuidle_cooling - and v2 says
so rather than leaving that for a reviewer to find.

Writing it up also showed that my claim the new gate is "strictly wider"
than the old one is wrong, so it is gone. PF_IDLE is set by
cpu_startup_entry() and not by init_idle(), so a CPU on its idle task
before that point satisfies idle_cpu() but not is_idle_task(current).
Nothing is lost there, since TS_FLAG_INIDLE is only set inside do_idle()
and so tick_nohz_irq_exit() had nothing to do, and nohz_full CPUs are
covered by tick_nohz_full_cpu(cpu) either way. But the gates overlap
rather than one containing the other, and v2 states that instead.

Patch 1 is dropped from v2 at Tejun's request; the reproducer stays in
the archive and the fix links to it.

Disclosure: this reply was written by Claude Opus 5 (Claude Code) and
sent on my behalf, in the same session as the patch; the patch changelog
carries the same note.
