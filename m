Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017722;
	b=gEb7FmslayZHWS8gfWce4ExYSC/BK3MyCWf+oxrEhAmW7WaEickbEwKtIUnmTzi0gur0
	 9yVNLJKfd+oILv+9krQqq3tO0PcfVb4lteuqh93sg8d3F2pGKpz/pKuVLRqODbL29BloW
	 004tGeIyJjZztmTqE5mC36/agw5I/Dr3rH/w7X4QzgotdLio03H4S4HUY4kRc69ZSHajb
	 w8ZV5KtKAPHpAtB054Dsqd1vUBbqIK+/QuKBbGddR29kznjE6GPYauroyX+EccRNRAzcE
	 op2hpAjCunJjte7bpmzrXHG4gPMKUyluoRoN4MqIE+t+k2KCEdYTfQDmhfmxd2yVHag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=STcyX3m8xxFaNUr4S3s1ec/7BuFxwi0Gt4EVxDhc2s0=;
	b=A2dZO7iGsbH32r9QZfg4xGeVNrVjevmvwHEmBZizjx70AntfFjsrAVTUaBNcG1v69/Fp
	 skIe6yKIWgullKE26nwHBt+LWx1hd1vzzd/xP9hEqxQ3MeKTgAQs1KCZvKJ6W8mNfQNWF
	 H1Rp7IMXUFqsh0/RCC1Mrc24vhFyVVNVqCnXwnIL4sROcGaC3AeeSp3UssjDiw8htjoIM
	 7b/RNbeVwaNItBR2mfvXdo+5e5fbaRUvlSx3y1FRL9krfI/wmX932hS0awH6cVdc7llWO
	 yVBmv7tgfjAloU9Z3z78rrGUNdCNPO0Z19c3sU1OSrzzk9SRYIUdkRqrKiq4jYD/j1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOvsEboP;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A9606A339
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F23A9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOvsEboP
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so12633015e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017720; x=1794622520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STcyX3m8xxFaNUr4S3s1ec/7BuFxwi0Gt4EVxDhc2s0=;
        b=fOvsEboPOXzv2NtMebSHBJWYELI/Lhy87yEJT+bblgG68i/+nZYejm2bvGtN5izakn
         sxJetVFEdlGXFCrnrEG2RKfMtCIrtP/oqrX9CU0jwP1+8zv2hCyUCHwNsiUj3R4XV3K8
         KaEi8vmYGaabZWLw1zYQya9csnBVPraRG8SlvbjwQj+NpAex3OOpdvL7yLCv+uQGoDKL
         0X/Y+GT4UDUu6KlQaEyiSQJOqTnXRlziFeFWi2poYeGEke2LvL1FmC7AZI522IA0Hp7q
         yAxEXavkDuJPNZvoD0Xl7hBVwCW4KcwrbIQ1fVenUfnFOhK9aWA4qcG9yHbADU2V0yKC
         uN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017720; x=1794622520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=STcyX3m8xxFaNUr4S3s1ec/7BuFxwi0Gt4EVxDhc2s0=;
        b=oULw722WcmsuhxhnupDXVZgdAt9iFE9snqhG4vvT2J33HnPS2Q4Z0R/QMY1RQLnzjo
         dp3oi3LUFrBIarwIsOBgV5ko1PJm9cPs9ORjYNQgMRxA9YLSU1a0c/SfRaVMk4PqbVrM
         N3V+6bbA1KboVzw/AbTlXP3WLl3loPm4SimN1gC5Knz8UQwneSh7qHAx5gL1xnPedGHy
         FAPul4gTZwOxpWcvJxWPzw1ffPTrEYyHD0BwCP1yvnxy7fH8NJqltnasERTXlPuz4iXw
         FiFFoyy6X0t/DvD+0yE6eivJcGZq4ytIPvqhvoT9loNAWz/x6uG7xR0PobCWWbqVKeLG
         UIRw==
X-Forwarded-Encrypted: i=1; AL+hErFaag9B7s1vtAzarD+QHUTh/5Bvwm7vAFpQs1BrQBtJY5vmhFKBgFOn3XNNnvLn6LBCyvev7M1p4P59tOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FDYpP6XXQNTHYGzZtfZHCUZN3SmSJ6vlQiBBMFy/NlnStqSwM
	qWv+27L3wZqE3TWh9bN838MvhdqKThfEoEnH1AEyQXjOFz77a0ebgx0t
X-Gm-Gg: AYBFou0jFTezHzS/eRjNumcNtySykQ2XUukHMVeBHYyBHJ1xpQ3NXZLRSxdRF4TkEa/
	NLySZQelT/iNDUipVuIZwP60afRKPpUA2SE/YAKL9G9pKVz55gjU57ERlqayGJuhWHXcxO8YcAS
	Pfr5YA48b2Nt1eCX7csRle+9T8RZ34i3pLl9u5OcB1jA6dpdYSUebMb1u1Ms4wGm7BvWrN6TRiO
	0cwovjAGlcdgbZj9qnbI9pwxs+SEF85xfqAwRwkzMJnhVHPAF/niyteBOBIQnyFB5g1+Eym0YQr
	TbXx6UgtZmAZOOl/yfgrxLZHBeaF72EZEIdGq6rwmNXi9T6MUtbTS8rnQ7Ar3mw7qSnURdlnwJV
	AQ48W3YtmE/oK35sF7ZxefoFe2ZGDNd4ZM1wXr+lCWfOT77pjRnaVFLauiziDiA5bufPAA1aAfV
	GW5KuFk5R6NyiXaFrzHcpqQLXzb4RwClxhRcxdEib1HbDfCJkopvjUVTzjvjYay/lddnMuf5IC9
	12FpDygOBgjIHpRzcSR+6FOb+X5RN965zThFGRmvetWXPgvAX0kJexO6dwin5eDfF02bqtWwNs8
	8Ji9CzH66TEt1cNU0AFV6mYm4eiCbRjd6OBNN06s6om6ftj8QMUN6KcNnBbsKDgQp5Ony8vTdFx
	xB+Q=
X-Received: by 2002:a05:6000:4301:b0:492:b948:1576 with SMTP id ffacd0b85a97d-492b948165cmr7641858f8f.18.1794017720351;
        Fri, 06 Nov 2026 18:15:20 -0800 (PST)
Received: from localhost.localdomain ([86.124.84.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5f11sm6367449f8f.49.2026.11.06.18.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:15:19 -0800 (PST)
From: Radu Toader <radu.m.toader@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: tj@kernel.org,
	peterz@infradead.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	linux-kernel@vger.kernel.org,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org
Subject: Re: [PATCH 1/2] sched_ext: Add scx_tickbug, a scheduler that holds a task on an idle CPU
Date: Sat,  7 Nov 2026 02:15:09 +0000
Message-ID: <20261107021509.968928-4-radu.m.toader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f043064ddbaa8d0c3bd479100993d6f157076ed25b1ab98b78c05bb2f1effae8@mail.kernel.org>
References: <20261106094343.174905-1-radu.m.toader@gmail.com> <20261106094343.174905-2-radu.m.toader@gmail.com> <f043064ddbaa8d0c3bd479100993d6f157076ed25b1ab98b78c05bb2f1effae8@mail.kernel.org>
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

All three are right. This patch is dropped from v2 at Tejun's request,
so none of it lands, but the fixes are worth recording for anyone who
takes the reproducer out of the archive.

The starvation is a real bug, not a theoretical one. tickbug_enqueue()
routed to the local DSQ only tasks with PF_KTHREAD and
nr_cpus_allowed == 1, so a user task pinned with taskset went to
SHARED_DSQ; task_allowed_on_cpu() then stops any other CPU from taking
it, and tickbug_dispatch() returns before
scx_bpf_dsq_move_to_local(SHARED_DSQ, 0) for as long as nr_held_now is
non-zero. With the hand-off you describe that is unbounded and ends at
the 5 s watchdog, which contradicts the commit message. Your suggested
fix is what I used: dispatch anything with nr_cpus_allowed == 1 to its
local DSQ. A task pinned to a subset of CPUs containing the target CPU
is still delayed by the length of one hold, which -H bounds; the comment
now says that rather than implying the case is covered.

The sleepable comment was wrong twice over, as you note: the op is
declared with BPF_STRUCT_OPS() and not BPF_STRUCT_OPS_SLEEPABLE() as
scx_qmap and scx_sdt do, and since 136deea435dc bpf_task_storage_get()
allocates with bpf_map_kmalloc_nolock() regardless. The comment is
dropped rather than the declaration changed, since nothing here needs to
sleep.

The README now says the scheduler reproduces the condition
tick_irq_exit() handles and can be used to check it, which also matches
the past tense the BPF header comment was already using.

Disclosure: this reply was written by Claude Opus 5 (Claude Code) and
sent on my behalf, in the same session as the patch; the patch changelog
carries the same note.
