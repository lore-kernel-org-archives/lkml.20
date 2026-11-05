Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870683;
	b=zWZ16G/rs10NidPlj5u7Fq84eZQorsY3pn3PWL1EJOTOmHYOapx1fkuaA7oh4XfZeDuK
	 VmQcItyF63+bTY6X05b5jr9eVM7HoP/uwKejkgkEsuFYZV9yoOcnQIkX5U9t27Hy8BL6Z
	 mGrnmfEEyLRKeLs6PPxR1E2DaGBToFsQXRJ7r3DpN1sxPMr8QeJKKhbH5bhzr5Xo3eTFa
	 h4IIvopWH51UHSHdcAodFm2oTWbTUovhQ89q+nyt7wZMBKrLHZXKwoe2SF/9PzewaQCR0
	 SjHS57+1mlZ5TGEaF0Zuai+NfjT8XKbsxYB7/xidbwWo9fKLlVQR3m+6YXGIUl593+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=+ILXSPmJcPxcyzhv7sEKBDCKuam6W5/9182e4M5VGdA=;
	b=1s0G+m7wSkDCMptTCB/+dp2hQu0LXHzWsbCVlPOH3hw35qa1BNwYzPUMgQGK8CavfW5N
	 VAZ4krusqi2q7DvdFmEjreVAxnwZCuctIPhsjB1pq8sJsRsnm5yFCzyh9QhSr3KzYXAPZ
	 8ga2FLDi2LnRq4ZlazukA/SrSBAE77G3gbXQHrRwQGKcnRYMJjlk4cSBH0vbqtvBRLca0
	 NCRgWMjzV1JsH+Pd8k4ozLvjATuHop3sFnDikcO0T1UJQ9Y5FrfNowQepUOtWcxXxpjoN
	 sIUOBzducyV0L/Qel+E54Q7InHFR9iDvWJfEgh6XLR+6mGx8u02JpI5LAn6BXNSLwkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RRfTorEm;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639E5606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 639E5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RRfTorEm
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdab938dc83so728421a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793870683; x=1794475483; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ILXSPmJcPxcyzhv7sEKBDCKuam6W5/9182e4M5VGdA=;
        b=RRfTorEmytytxf531JrQgzfOaZQoe/02hp2b4u1bsu0/qAX8KgcI62ZiuvUMlIMgbS
         CJgSXNyvE/6saGGfqCDqTNUp7fJe454EQo7m3Xcnzjlj33dKTqs1sur+S3NxW598R8Em
         K71DKWAKXWfO0z9+q52Iue+oUG3wemwcToSvMiuhMRdkQf34UqdVrY43c9NdG7T4uVBD
         gwNfyXTbLRtKQOZ0UjRxQ6+uAIFAHhgKl1aA4Vtcwx/azxrao54JnCcRcodRBQxGczGQ
         lPowvPpwUTbYUfnlip7umv/tlpzQUK4UtZaw6wcRHh/t3KWyS6eQFCApXcq4gL2YJQz8
         MjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870683; x=1794475483;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ILXSPmJcPxcyzhv7sEKBDCKuam6W5/9182e4M5VGdA=;
        b=0TBfkXT6bR2fN657Kx7UOLxcXydRyHvErE+aiYbfj/uS8z/8RmQwprz5erFhB4TInY
         lV3G9/AYdtT5TeoASSvS6De5BHQ580Hjb3ebSUlbddppNrJ59xVhnaqePaumj254AKX8
         kxoq5aCJURe+0VP642LlSr8KH4vs57aPqyYNApjbZFtclbGl3zrN0nPa7O65LMv0O471
         jckfBd/dJKCt48BS0r5pee/ZxK/IH63LCp8s3Co+B4T9xiWgmZ8a+sSVKW53whpQpveZ
         GOEsS+lPU4aB+yGw9nDfD4ChGVeZZjOwQzsedR6rT8I4/i3cRDKH0kTR9du38ckfkTmU
         Z1Fw==
X-Forwarded-Encrypted: i=1; AKwUvBxAy+By8GVtFHyxRSz8mn/BP4bcicg8a9ODkZPhJDd9O8wViWCVnGtXpU4YK2rw7Nd3rgzhk6p5GHEtVbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HIzdzOneXB9+P+m/qsFn8gLZWn6cZ56pKFAQyUSA6Lrggb6Xc
	SiBxmTVrVGGuXtURkJ2qJ8WwXSZ+wQBPJ5x6f2ouOXAZL4uM4BEzHYJ9
X-Gm-Gg: AYBFou0oZ6BecarIIvV5fJJ0AMPrgnY+wQyid+K0kKOKgmUxSOeD29H/YYVheW3CXbx
	l2KY3TApY0gP5hBmjQBBCdrkjS7eBNoGa3WtArO3fXr/+0VCBaI5uEdkbDiEjbZet7utPZAZ//f
	+Hjv+vNDnhxPaWXASH5mlNFzqD0HhHo/iJymW+C2UsmXQ0Z2Ky7RXYoS5IVCfFXoM/JvSXpHqxM
	71uz5cW52w6nZuB8MNlU+xcY6nLdjPdKYyIJv/ngwC+traT41gArA1hH+VCliYXMNc40SYzEWoJ
	AawLr/Xs+KpRT6mf1bMSWbP2hg8K4u+jjqzGpUW1Oy4wJ593re1PRYihVOMx9ku+ZTQnKdI6Bvo
	9fOEmFj3HPKU80H4qCliW1igfCCziEA/7uaw8wgBFaQ3f+ChgWRWHH2ECyX5KJgDKkfl8J2hVHo
	Zk4NI3/pRZf12DhNc35iAXrl+syXl+sCZo8vneq6jANrQjvpzFHcwomj6DmLbhpsUhrQLCydWOC
	PoRO6ll3WH9q6iM6DJdF670AUs1oQWc4sPoP/pgBu3jG/woNXDKhQw8a0eL5jeQDbtuizSoDrXo
	Y224N1YiGlVpl/gxMsmNFVmHotqJhVT7R7s/206eLx/iPUHkXb3HOwQZT49C9GoOw1o8fVsJTHB
	AF8eHyjaWDr7XaVRBMQrLMqiLE9VxZpo=
X-Received: by 2002:a17:90b:57c5:b0:3ab:31e6:12fc with SMTP id 98e67ed59e1d1-3ae89282d02mr16051145a91.0.1793870682360;
        Thu, 05 Nov 2026 01:24:42 -0800 (PST)
Received: from 0001-report.eml ([117.28.251.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312e45dsm3685396a91.3.2026.11.05.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:24:41 -0800 (PST)
From: Chengfeng Lin <lin2530632123@gmail.com>
To: Qing Wang <wangqing7171@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] sched/fair: Replace random newidle_balance with
 Bresenham accumulator
In-Reply-To: <20261030091946.2498870-1-wangqing7171@gmail.com>
References: <20261030091946.2498870-1-wangqing7171@gmail.com>
Date: Thu, 05 Nov 2026 17:03:36 +0800
Message-ID: <179386941645.8.3608399700168338187.sembench-newidle-v4@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Qing and Peter,

I tested v4 with the native MMTests sembench workload on v7.3. It improves
throughput by about 2% at 815 workers, much less than the improvement from
disabling NI_RANDOM in an earlier diagnostic comparison.
These tests use the posted v4, with newidle_window_pos initialized to zero.

The machine is an i7-12700KF with 32 GiB RAM. All 20 logical CPUs are
available, including SMT and E-cores. The original benchmark binds each
worker to one logical CPU, cycling through the allowed CPUs. Its main
thread remains free to migrate and scans the work items to wake workers.
Workers do very little work before waiting again. I used sembench-ng at
26350892f66d [1], built with:

  gcc -O2 -g sembench.c -lpthread -lm -o sembench

The two native futex wake/sleep conditions are:

  ./sembench -r 30 -o 2 -t 8   -w 4
  ./sembench -r 30 -o 2 -t 815 -w 101

Here, -r 30 requests a 30-second run, -o 2 selects futex operations,
-t sets the worker-thread count, and -w limits each main-thread iteration
to at most 4 or 101 worker wakeups, respectively.

The benchmark's execution loop and affinity code are unchanged. The kernels
use full preemption, powersave with balance_performance, and Turbo enabled.

First, matched v7.3 baseline / v4 / baseline builds, using the same config
and GCC 15.2.0, gave this mean throughput in worker completions/s
(the benchmark's "burns/s"). Each column is a fresh boot with nine measured
calls per condition; NI_RANDOM and NI_RATE stay on.

  Workers      Baseline A           v4          Baseline B
        8      2,668,465         2,876,585          2,674,225
      815      1,112,251         1,136,952          1,117,457

The 815-worker gain is 1.98%, or about 22,100 additional completions/s,
with a maximum within-boot CV of 1.24% and 0.47% baseline drift.
At 8 workers the mean gain is 7.68%, but the patch group's CV is 3.32%,
so that result is less precise.

For context, the earlier same-image NI_RANDOM on / off / on comparison
used the same workload and nine measured calls per condition. The toggle
is NI_RANDOM / NO_NI_RANDOM in /sys/kernel/debug/sched/features:

  Workers      NI_RANDOM      NO_NI_RANDOM      NI_RANDOM return
        8      2,687,751         2,698,677          2,691,362
      815      1,108,891         1,367,185          1,105,461

At 815 workers, the mean gain is 23.48%, or about 260,000 additional
completions/s, relative to the mean of the two baselines; the baseline
return differs by -0.31%.
The disabled group has a 7.18% CV, but all nine runs are above both
baseline groups. The 8-worker change is +0.34%. NI_RATE and the other
features are unchanged.

I also ran separate main-thread-only perf stat diagnostics at 815 workers,
with three runs per setting. Counts cover each complete benchmark
invocation and are normalized by that run's total worker completions:

  Main-thread metric                    NI_RANDOM    NO_NI_RANDOM
  CPU time / worker completion (us)          0.673           0.593
  Context switches / 1,000 completions     286.62          242.82
  CPU migrations / 1,000 completions         0.593           1.973

CPU time per completion falls by 11.85% and context switches by 15.28%,
while migrations rise 3.33-fold. The main thread uses less CPU time and
incurs fewer context switches for the same number of worker completions,
despite migrating more. These diagnostics are separate from the clean
throughput measurements above.

For historical context, reverting 155213a2aed4 on matched v6.15.11 also
recovered throughput; migration stacks showed other CPUs pulling the
main thread through new-idle balancing. That commit raised the estimated
cost after failed attempts and has since been reverted upstream.

I hope these results are useful to the discussion. The feature toggle is
a diagnostic control, not a recommendation to disable it generally.
I'd be happy to test follow-up changes if that would help.

Thanks,
Chengfeng

[1] https://github.com/davidlohr/sembench-ng/tree/26350892f66df56e6fa06a0c7c104ef1de322136
