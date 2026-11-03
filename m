Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748854;
	b=ZVT9CnNVTGxP8rS5lgYqJI6sOc4NflHYpz6qXxyrTDj2c4+o7lDivNiinshjRzcvba8a
	 3z0QpsAiJqJ3kOa3FmJO3+XBaYHenlAXpyPqlaxW9gVkITVJxDa3+dAcUuYNnOmkVyZtA
	 WIX/vjHG/hQ5rderut+eT6WalYwz8IXmahpABY5qT56S9oxumQeGtMifmZceAuKvcdr1r
	 hGFoYJiSKva43ypzVqqGo0AnZ742nIbZTbm0ijkDUkKV146AI3PwGs00m3A72/89JOYgy
	 1OI1jlwQQAovduQ+/7d73Zxe6VPQyun6ExuygpBC5PGLHtWvQR+ntxhJTecmtVFPhcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NHa3SLlf+DLkC9TdarwfhodZoRfY5RS1Z5V6v7io5kQ=;
	b=Kj5v2n+XlFku+wlwU3ORe/usBg7MRwqf8ExQOTuv8/nX+pq9DTxY4n+MLg7/jI4T2R4i
	 ie5MYNIc/cDkVvBoYexyxEyPQfaCWtKLWocWlchijrxHSKqKmFAmIKXTVIq8v5CFYEhSL
	 zvLhU0Ovmv8wzwoXMBJ66r1jruLp47LGOCeyQk34onpFevDbj1vF0Rm/jbt3NPU0x+Ffx
	 6/UCpkhck7CUiDdXUYuiOUw7cJMrv8xbQ3fz9+Ghg2qJs2Af5of3m2D+93LLuebMKJij5
	 iMHBmYnua/kAxW4xx1dNMebeTb9CjeDpEhiSwoqps33K6bRpc7T9Repl6K8qhp+HF8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Efby7Hk4;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2C5606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2C5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Efby7Hk4
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so766725e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793748852; x=1794353652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHa3SLlf+DLkC9TdarwfhodZoRfY5RS1Z5V6v7io5kQ=;
        b=Efby7Hk4FTpj5p+/1I7YbLSnsWkC1Qyah8L4kteH5N15noZv+ZXiB5yrmesnrLQmxv
         7SPbzn+qf/z6E43zM/w8Re2N+0b9Ho9oHPbe3X1FoY9mBpjA0sATYEF4td+t7Nd9BjsJ
         gglVBdZ//AIOnYtuSphsIqL4z/mpMNDKUEBufV8BAovz+VXB+Xc0+Id0ZaMKWRthOuSz
         jivCKHO1zCDqculfTT18ac8R/FZWSOMX+Mzl4+GPX+YGftvS0WsoWm02S7qOrhvyFQol
         IhL4jN7Cl62XtDWI3ND17H+ygA0zghI+f46scTLuXXqgab+tEtwR5h/PeMYmNxWemdkb
         a8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748852; x=1794353652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHa3SLlf+DLkC9TdarwfhodZoRfY5RS1Z5V6v7io5kQ=;
        b=L9OYdZqOSkjixIefW5amyUNXjpgwR0QXk5E1BPdEsOIvkIMZiRKCEEbUnhEATpV1ca
         xrjBo/jI0fC6lcfLMH/iuGi7Va9oNrUVSVRfyL6/3hAdqH5X+TCypHOatESEkY5Ph4ts
         YJpFJsKqpd0SPuinEjNbC55ddCYVZ+E04DERmVbv5KMBgD6k3jAWqLA2K0g3vOI4BqQ1
         rYPBnyyPrcUZA95IjMzaFyHSoKiyk0u7fB+ZcZjczJba0Ub7diMEbhm+PSbhdTQ5E0cT
         o9Yv/YCYvWdq/7jzDIia8tjTa8nwdt9pg6KBqifxLBbQB6y06azIksi3F0DGI9uD9ALH
         ls2w==
X-Forwarded-Encrypted: i=1; AKwUvBzr457lcprz/iTlVJirEd4cy6nT6xRKw9qj58MhdaDSO1aORgUUejJHSIAexI/vgCwmthuYrPGMNn/jwFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sHE91TuP7XOCjdg/ab5GpLUppO3YFqIfCwiDJsRRuz77TesyN
	G50KCE6rJbRMEd+Vs9N0RyS6aV8hbqq2YnMfKcpZbH1fGhphOfPtE0uo
X-Gm-Gg: AYBFou3i1tmxAvOKUVEsTqllEK5kkThLgPDklAIVYmSmyEyY94y0j0eteSeSJCJmjo7
	pMOPzLuzI4MJLNyu3nWklzFZeN+ns5evWsAZEbVbyl0C5/7ZgE6YAJC+J3gk4K4UpEm3cz9s8e2
	LH2vC9L8nIc4F0Y6rOdB+KOyPTxUqQzHa2vRrDNLQSMctjB1DzRepLpe5ufs3GyJmvpg2U0rWMb
	DE1bXs68mTlqeBMzrqLtjHR5YFyl5iHtfVN0/LzRzTe459X5c8p6XwR5YDe09tFEXfSov1wlEh/
	SREnlES5gbyxyi8Pt1nAi/m3yUkJQWtQDcufgVD7MxQbiv2hA55sX8UdsVKEUmEFLJmfRKjc1DO
	wv57UzIwCh5CBqDV5rs5s0v5AhxyNFDaFyagFf0qzgSJ6kdVeTt21bL+vx922o3gRcjFLzR+Dry
	cCC6FpEFDlR7Lu22BUWevV+4o6rnSG8chyC2KeiCmGiCSQh3lvrErB1Ph8ybgYe3ipLCQcH/s4Z
	TDDbC3cXYGRMli7yMqe5PHyuS36I8oU7pF/dkPSzueltXnI9qqY0xZKuyKK1qkgSOx+P+ap8COu
	jk9rtSGWnx69nJm9Cns=
X-Received: by 2002:a05:600c:3f06:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ac181e75c2mr359360955e9.13.1793748851968;
        Tue, 03 Nov 2026 15:34:11 -0800 (PST)
Received: from fedora ([2.35.201.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecb4sm9524955e9.3.2026.11.03.15.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:34:10 -0800 (PST)
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
Date: Wed,  4 Nov 2026 00:33:52 +0100
Message-ID: <20261103233352.2282883-1-nigro.fra@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <25edb6cd36cb77b82b40826b97232438f1443516.camel@gmx.de>
References: <20261103154603.1893325-1-nigro.fra@gmail.com> <25edb6cd36cb77b82b40826b97232438f1443516.camel@gmx.de>
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

On Tue, 2026-11-03 at 18:27 +0100, Mike Galbraith wrote:
> Mmm, that's a be careful what you wish for thing.
[...]
> Not a keeper.

Thanks, that answers my second question for your patch; I had listed
it as earlier work on the same step.

The stalls in the report happen when both busy threads are on CPU 6
at the same time. What the report doesn't show is where the two threads
run the rest of the time. With ITMT on, both run almost only on CPUs 6
and 7, the two highest-ranked of the four: each starts about half of
its bursts on each, and under 3 % on CPUs 4 and 5. With ITMT off, the
two threads' main CPUs differ in every run (run 1: one thread starts
99.9 % of its bursts on CPU 5, the other 100 % on CPU 6). Per-CPU burst
counts from the earlier reproducer (asym_stack2.c), 5 runs of 30 s:
https://github.com/franz1981/itmt-delay-dequeue-repro/blob/49b6d72cb41d2535964c87a660178dd636d1d366/results-final.txt

Is it expected that ITMT keeps two busy threads on the same two
top-ranked CPUs, sometimes on the same one, while the other allowed
CPUs are idle?

Thanks,
Franz
