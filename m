Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830005;
	b=JsK7p11qeMFXry3y4ZEZiH+uTcDf8ZjGKN4fDnviLORab5tusTGhQUQ7JWi+5rS5OLrx
	 jNDm5bYb3LMMYi4B4qt1T8CXsMVV7M7zML6cxbvpKHqewMcgQUjT3BfBNsq0B+OLFv8tO
	 zNHrGlvuS58FbuVixqOSlPtVykMUtmxvjr8AggWJFftJvC2m+ktC0zXcugy6E046vcmDU
	 PjP/kXYIRZjdq46ZZz016uMocR6aTUgf1Z0yRnWipfBG4j7lSbPY02WrRcCH+2en/Kp4d
	 jeNZ1+h9aWHgyPwo8Zar662WbHkQo1NqcVSJJmQ53sf6nkDW85d2sNoQEGvZTSxdXXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=APyAEXSG9B0KEvsmlIgqb108CR+kX9ZzkkBiV+80GpM=;
	b=nU939fKwPBUOIOZx6uBI7s5o26mSZobKYgzV2wN/W5bR9dnI2zl4PDRXssGvekmUO8Jq
	 gOzbeaQXOKsFYbboy/JarB3ll6JmlZm/ojv4Nd0/Spn3TYaMUi1QWFj/hBpziZ5H4yOAY
	 BVLns30a4U+w+rJL3EEC7fngI8AUIY8QqYMOHxgzurhkVwQg063zUSrfxH4BeztyF0umA
	 lhiMfROw4nEBWKvkPDYeYdEsPmRDB9ZY/mxyGQ75A00cpYxSskN/ejG9Hix3S8Vu3uC9h
	 mRXFpBbt311pBG0bbYpSTHsiEdrCX4qcShemzAoPAD+fTW/qSVZQ3nBcWIToEoDV5IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nE1J3IvH;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1210606CA38
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1210606CA38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nE1J3IvH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so7872475e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793830003; x=1794434803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APyAEXSG9B0KEvsmlIgqb108CR+kX9ZzkkBiV+80GpM=;
        b=nE1J3IvHMoQNzkY6NWqRvTSMsazSaZ3o2FOqE6Vkft2ehjTHn8aLnOYg8vT1EO270t
         eN2FAdZlBp8+YwE8ukzqk0r9FrwOxyhmziNfpWj2ioOMKExpHNcgFJE5otJ9L0caAtyh
         yau15/gp49jgw9swqjV53ow9czN9NUQdqeNf3T27Xa35gyFtoWXqTSc7pSL6GR08oAkM
         b2DGAmy7a6UHSRwQp8Ohc3POW7QyBy4QRZZG0yMg1lf6J+mPIwmySw/yfAkqbiw4sbce
         xBEOCYYleBJo/LjnRGx2+5aVtfNFXjhIGVB9Xv354q4SsV8Pa4rFQcR5uwVdllR7FUZH
         auUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830003; x=1794434803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=APyAEXSG9B0KEvsmlIgqb108CR+kX9ZzkkBiV+80GpM=;
        b=g5zoR3ACJuZTjfS1sbifGhI5+I+O0H1BBDyCqztZgfIVLSHvxXzCRnegxoOi6DKm8x
         wUQemCDEUfsdA9Uhu8IuMjB1CW6iDcMNbQ//obuLSs7lgYqkAAsBgoBwIwMStRuGrPfb
         T/Dve09mD/Mx+EoC8eX4978h/YRbQl/gWZIVGlT0u1DNxU8K7/KNoUj/pauF+qWrqUvj
         L3Ey3i9skdEJGlFtmpym+72ulYEY7olz//tQT2ZcKl/U0167obFq8MNkYUUcOCY3AuMj
         FvoFnsQtdjklJKmugJCLsAQmXxdDnFYcAa528P5D6cVXPl60EL2SfpnBUxP15Z+slSfq
         /4HQ==
X-Forwarded-Encrypted: i=1; AKwUvByUuZqPn5jCQ+Ru6hCDoOjPbb21EjiESjKYgwq3fDlk/bXc59Xk4N10WRA8pdwBGx0D79BBqo5uSwo0Cn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l50elBKgr7F9XRGnA9iB4Sk7T6GPtOHnPcPemj79UI/I828xC
	qyXBM4GTEky6UNTtSG3b0fcDK3bEZXAxhXN+ZdMRavmFJAtsxtfsVS5y
X-Gm-Gg: AYBFou3+ZBp6hGoYA+fXjFyoIzvNSe5xRAIkO/qcrgAiW8OA5SChsGANGvzSsaCugqO
	OEzyEHnf8QKGVEY2FMZ2kOf7UPxeQ1jcW1deDpLf0DLvUCZbVQqCFrdOQRrQit6K9MqnY13nvm2
	L3TbbemCObIhkUO1XNQfWu/p/vU8u3SrDCBaaQ/Gnx015TBbPxaeB09SCHrWvBk/gSwl4hGggOy
	1M8xo72tr/oizSVtNrri+v3yvdaitHfQXJOljMK8SpCL+9n+bzqVmTpJHbs4HrNqjnPL45z9ljk
	PG6mn7iqUsgBgHy5su+iBdxFioIX/xfOyM7dOrkxchjcg5VripzV07lpTvL+F4T4DfsNnl04Hfv
	ckBBjs3dMVsXcseOcuo6spCyuG7fZXriPx49qFLyeHnXYlxtxuAClPS4QB5yvaUZ1fWNS1i2zDT
	WmWBgudSs+mM2g7tTlygJXoP9c3mZb1EqTq6Yn31bc6RoKGQPEo0b9mJmSd+uIPjfLI2OiuR6C2
	Ch0JtlvQqFD4DT21gX88gLywkpgbENW8g7vWtZQsKhcVehyFTdzwqygJaA6UuftoNzy9aU/PADj
	7N8BFQV4uCRT6Pj8Nrnn
X-Received: by 2002:a05:600c:470a:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4ac16acfe61mr380977515e9.5.1793830002799;
        Wed, 04 Nov 2026 14:06:42 -0800 (PST)
Received: from fedora ([2.35.201.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22f4sm24879935e9.13.2026.11.04.14.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:06:41 -0800 (PST)
From: Francesco Nigro <nigro.fra@gmail.com>
To: Mike Galbraith <efault@gmx.de>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [REPORT] sched: ITMT + DELAY_DEQUEUE: woken task waits ~1 ms behind another task on the preferred CPU while allowed CPUs are idle
Date: Wed,  4 Nov 2026 23:06:22 +0100
Message-ID: <20261104220622.3542344-1-nigro.fra@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <32db09358aecb92c55c8c1295fa71b6a73306999.camel@gmx.de>
References: <20261103154603.1893325-1-nigro.fra@gmail.com> <25edb6cd36cb77b82b40826b97232438f1443516.camel@gmx.de> <20261103233352.2282883-1-nigro.fra@gmail.com> <32db09358aecb92c55c8c1295fa71b6a73306999.camel@gmx.de>
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

On Wed, 2026-11-04 at 04:13 +0100, Mike Galbraith wrote:
> In your specific case, dunno.  In general, absolutely.

I checked with boost on too, on the same box and kernel. I ran
asym_min and tbench on CPUs 4-7, without SMT siblings, with clocks
pinned and boost off, and with boost on and the full frequency
range, DELAY_DEQUEUE on.

With boost on, 0.82-1.09 % of asym_min wakeups per run waited at
least 0.5 ms with ITMT on, and none with ITMT off.

tbench throughput was the same with ITMT on or off in every setting
(within 1 %), and so was the busy CPUs' clock (within 0.2 %).
According to these new runs, with boost on ITMT gives no throughput
advantage and still causes the long stalls.

As a side note, I agree about DELAY_DEQUEUE: disabling it reduced
tbench throughput at full load, with ITMT on or off.

Scripts and raw output:
https://github.com/franz1981/itmt-delay-dequeue-repro/tree/1400f15

Tool use as in the report.

Thanks,
Franz
