Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233191;
	b=omtRiPVTTUqyfj/rQkW1+bguQote7IHAOOxP4WScn3Ip2Jbk9Y6fIdIKW6EFjDgjhRic
	 QJf91UqCjtQ0P2z7Rt76LYENfReUM3OVQ0m5CpHKYKdm0s7HIrZX2V5pUC/4jiC2Gzr9X
	 O9s7zTSqFhrjj5YB+pWXyRUx35Bt/TkQc1WiwF3uxxoOODM5uHay/6L3jfgmuq+Fo8xV1
	 ARVzo0WSxu3NRI+4gjyRTt5urOIFbxW5QgrtK7+vUJknEwaKy/8HAmHVJ4dQH4He83Elm
	 uL+cnIxn9AtwARNRgok7YiWuc+qzgHqpUR04qPaAgpgKWWbhEeDpacmnZjtCJmgVThA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233191;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=0BfdVOGjcuEi8cBY7N3KA/lKr6DLGKrG/Pkl4v81otU=;
	b=uc3a/s+Xjk6V3NimUsPWP8bOv35Xn96EpRmPFwPRbXciybJ3B5BtYctUQ2/D0hToKNsd
	 ovYoYhKmP6GiOb8vwn5iSlHnFHkC8dVRxrg1w9XJ6ViHNgH1Nx2UHOtVkPNp/x9M0cX+7
	 aRcHPM6of437dYXop+fNHwaCIBpiE4V9ulE4qHEJ4I637BOKvoHAScwotMsw3d7zKY1PZ
	 n9pWur3USI3eBpSvDqRam05EsJgs/BvHx7YpfHQBoJ1lLOzzEmrvsk1qmSrJwQ2R02DA/
	 1busoOhm1f5p99w1qPiRhVpxqcX6Shr9vhd8yuEwpZEPEbpW4kkUzjUNK8AJGrmJY4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TRbIbGOX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fpUkvC7T;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFFE606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BFFE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TRbIbGOX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fpUkvC7T
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794233187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0BfdVOGjcuEi8cBY7N3KA/lKr6DLGKrG/Pkl4v81otU=;
	b=TRbIbGOXxzA7wAQ3xKKHeRa+zfiMkEXTOL0ZpbW23pZS1V86n/+EFDF/XPvNZYos5dKNkQ
	bapDeWlZObkQwko2CFx1jdBmrHX4QvHT+Ubm8QGNLlE8EFrWw0lHZ6rZ3y+LzoBFOLuV1Z
	jvV+k/exoxQ8VLPenfWIIguakZ83FoAY6i/vWRYPA7twEFmes9Qi+XCrxUXzbzX1RvXg7s
	1tU7oNmmPtn/B9N6fqTTP0YlNFs5avKmczlfSZ7bP4U7EOfDdM9pB9Qfznm59q8Eysgw7E
	Tzaddj+eUfMhqtMH0JW76zxH4rv8GirN+U9o3tqFLYqBzY9T01e8JLBgwtX97A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794233187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0BfdVOGjcuEi8cBY7N3KA/lKr6DLGKrG/Pkl4v81otU=;
	b=fpUkvC7T1ftO+rFh/DyBsoPiVDSeVvwCgkJsrfemAARt93Ci9GOGW5zAmJPU4D8xJmjr/3
	a0IhtSK15cN9NOBw==
To: Breno Leitao <leitao@debian.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Waiman Long <longman@redhat.com>, Petr Mladek
 <pmladek@suse.com>
Cc: Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3] lockdep: Move the emergency section out of
 print_irqtrace_events()
In-Reply-To: <20261109-kcsan-irqtrace-emergency-v3-1-6d62e3406b8d@debian.org>
References: <20261109-kcsan-irqtrace-emergency-v3-1-6d62e3406b8d@debian.org>
Date: Mon, 09 Nov 2026 15:12:26 +0106
Message-ID: <87qzgucd5p.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-09, Breno Leitao <leitao@debian.org> wrote:
> Commit 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep
> splats") made print_irqtrace_events() enter an nbcon emergency section
> by itself. That was meant for lockdep splats, but the function is also
> used outside lockdep (by verbose KCSAN reports, the soft and hard
> lockup detectors, etc).
>
> For KCSAN, as print_report() runs with the raw report_lock held and
> interrupts disabled, so every verbose report writes out the whole
> console backlog under report_lock. Other CPUs that detect a race in the
> meantime spin on report_lock with interrupts disabled, as the lock is
> taken before rate_limit_report() gets a chance to drop the report.
>
> That causes this type of problems (as seen in Meta's fleet):
>
>   BUG: KCSAN: data-race in mlx5e_poll_tx_cq+0x5d8/0x998
>   ...
>   irq event stamp: 28975074
>   smp: csd: Detected non-responsive CSD lock (#2) on CPU#35, waiting 5000000052 ns for CPU#26 ipi_mb+0x0/0x18(0x0).
>   smp: csd: Detected non-responsive CSD lock (#3) on CPU#65, waiting 5000000020 ns for CPU#00 do_nothing+0x0/0x18(0x0).
>   watchdog: CPU71: Watchdog detected hard LOCKUP on cpu 0
>   Kernel panic - not syncing: Hard LOCKUP
>
> Drop the emergency section from print_irqtrace_events() and enter it
> around the call in check_flags(), the only lockdep splat that prints
> the irqtrace events outside of one. The other splats and __warn()
> already wrap their whole output in an emergency section.
>
> Fixes: 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep splats")
> Suggested-by: John Ogness <john.ogness@linutronix.de>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: John Ogness <john.ogness@linutronix.de>
