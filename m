Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A616378828
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790309566; cv=none; b=Iao7Kqv9FHLQEugQZy6t7G7uNp22szk/yvKMN/jJ7z8aCCjiW4bcVBs1HkxN2xvumLRtfcDcr64o7SVC1hokNGGPTlj13Vg9jxvtVceqp8dlz+Hlnr4zJGQTaXsIfberakCUDNqif7AI/uOE+dRw9LTMTqyhjzWRMNLtrXDwsBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790309566; c=relaxed/simple;
	bh=fsGAtT13nBoh2p5VgiySeOwGY+0SCDfVVoO5fWNZ1Mc=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version; b=cYx8saXm0jZ+VUWo2pmgEGHm+PEcOVbrUIYPUUpv9J4STUz5SLGdxVVTAIkCHfyMp01c3rPBJ6HKn/M5K7wMRw3lvgqczuitkMfvpWd+xsdwkAKAS1Ylp1SbP6yoWiubGpQ8KyuT0M46C5tF/bkahsUXpPAp2pKWvlA0xDnITfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efeN0d99; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efeN0d99"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4c3304833so144863a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790309565; x=1790914365; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U4MGTQQsIFwRWN5LVLl2bLnymyqR90tzlWdPdS9c0zU=;
        b=efeN0d99G7U5taPU3XZ87mUu3XE/4vHapP4Z68Jj0UaoC+0/eiGIfLox7TzkgzC/R6
         +B1gFL7L55sGNWTuinWv9mKRm+Kj0TWD98XYO+S5Xr2JRmxDCjG4ofxIbK4/zwpPXneV
         NycNOvqzxNgwW3OwkDnic8thioeLczr1Mu26ZKr3RxAohhYYlzVRQJBVcnxDHkM0ZgSf
         GOCwG0hIi0QASpLKin6ADawoBu63v6lxVdb+WHngV1iwxPPZ/6IrTztzW4aawFKT+c5r
         w56xTexYYx8Sqzs4M7Pfmf3ssoua3JDnL/a5kESygfEGmltl1K8PVSJ1TIV+z1EFYSuC
         IraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790309565; x=1790914365;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4MGTQQsIFwRWN5LVLl2bLnymyqR90tzlWdPdS9c0zU=;
        b=D+mp7lcxLpRKiRle+n8fLWE9ZRnHwU55moQz1yooEtNbmF7wPJ6u6l0IqMPeYznSgy
         rtJqwhGG0PPYG4OGA/i/QumaN66Cpf5Bo4ar6B8xZOIPmZjK7jLGo7I+fIZIJoaMG4yU
         c/TvmWzA5ftplTh3I3ArSqJXwnEVdUfa4plH/pCuJGiTmuzwBaqQnZJPphyj4XaT1Gnh
         o9XYRU/1K0sluwWDlC8OGW752K4ikin9ToUGUV4V2LkBTOG32ltrr+tIdk+NNv0LO+RF
         zpQzCp2tgJ3/eaXHXtOp5Hk/ZSZOGuxtsSCTaIT1RvoH6W3U6CitSd/gpJVxugZq7uy3
         K/iA==
X-Forwarded-Encrypted: i=1; AKwUvBzTXmA/oh4Ia1ulOImd6vAj75thCr2fq1ivef1JHGns5foJEpQUDqIA3SNUKVg80vWDzeC1suu8IzFVm0c=@vger.kernel.org
X-Gm-Message-State: AFuF++n9wok8OqRNBZJJoJgagc1P+rxZaVOGvYiShFHCQ9d7FH0sSKAt
	vkgSDKUacx0NpQbNQR59ZE62DWU/Wzb8vzEOV3RGy/b4Lc4q0ymAfPja
X-Gm-Gg: AYBFou3TH1N6ajaqWePdYQ0X1KE3F0VsYHkbly6S/Tb/V2n29qWgnZEbYkb+eI3fMxq
	nCKbJcG/K+hC70j51GTxFsBQC5IYwg9YtJmv0q0AQzht5HJgET9M7CNPUoUTPZls9NGuJmouhjR
	epkj7mv/I+PVg7OaS8M6+TBv9YlnliiWUAE6zPJhYo3AA7TLWGXCjpw+W4o5X9Z7fGqajmRswsf
	gdg8pG1mZ762joUNhDiTdVP3tHf1Z7Tio6GUikGNXOgi53p90PC9AQLbMZhhBf2M/Y1Obc8/HJi
	+5JEghEVfdBpqAJJhjy8p4J7e8yE6uKU2WincXwZiD2quFPMHWRni8SvKD9BjmnwCF+TyRej70o
	ywrAHXdnqeeS459vxBz8yInK2XKfQ5TwbFmP/JJovgGyo6CN8qohWDRdMACllOHrQvkfMVrV1QQ
	MrRUT8a0Ui+WddhOPdaxo+BCmqzcE4OKqTVQvGkjOs1qEUr2cVWuo8L4eLsMqZPIl+nSmKra+Bs
	x1c7RgKxtw/iquj3gCDDPydDvzsX4T4Bfdtfhg8x6VMI9qk04Og5D+JL0/c/QaiN/mivKPHBK8P
	weXt
X-Received: by 2002:a17:90b:1a8a:b0:3a0:c22d:fbe8 with SMTP id 98e67ed59e1d1-3a0c22e01a7mr228479a91.38.1790309564539;
        Thu, 24 Sep 2026 21:12:44 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b998e2bdsm1908663a91.13.2026.09.24.21.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 21:12:43 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 04:12:43 +0000
Message-Id: <DLO3RV3IQUOV.21BNLF4QS9T4W@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: "Vlastimil Babka" <vbabka@kernel.org>, "Harry Yoo" <harry@kernel.org>,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Hao Li" <hao.li@linux.dev>, "Suren
 Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Brendan Jackman" <jackmanb@google.com>, "Amery Hung"
 <ameryhung@gmail.com>, "Swaraj Gaikwad" <swarajgaikwad1925@gmail.com>,
 "Clark Williams" <clrkwllms@kernel.org>, "Steven Rostedt"
 <rostedt@goodmis.org>, <linux-mm@kvack.org>, <bpf@vger.kernel.org>,
 <linux-rt-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] mm: restrict can_spin_trylock() to preemptible
 context on PREEMPT_RT
In-Reply-To: <arIY0wMQjCCsqidI@gmail.com>
References: <20260919171443.90512-1-kmehltretter@gmail.com> <DLJHZEZMLW0F.27OPPS218CX9Q@gmail.com> <arIY0wMQjCCsqidI@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 22, 2026 at 08:04 AM Karl Mehltretter <kmehltretter@gmail.com> wrote:
> a) Change MM so _nolock() allocation remains safe and can still succeed
>    while pi_lock or an rq lock is held. Existing BPF behavior would
>    remain unchanged. Is this feasible, or would it require substantial
>    allocator changes?

I don't think it's feasible. On RT the sheaves lock, n->list_lock and
zone->lock are all rtmutex based. When trylock succeeded and a waiter
showed up rt_spin_unlock() has to wake it.

> b) Restore BPF local storage's dedicated allocator, and document, with
>    debug checks if possible, that _nolock() must not be used in those
>    scheduler-lock contexts.

No. Local storage is not the only one. bpf_arena_alloc_pages(),
bpf_stream_vprintk(), bpf_task_work_schedule_*() call kmalloc_nolock()
as well and the same sched_waking prog can call them.
bpf_mem_alloc was removed from local storage, because it wastes memory
on preallocation. Same answer for d).

> c) Have MM detect those contexts and return NULL. This prevents the
>    deadlock while preserving ordinary raw-lock callers such as arena,
>    but task-storage creation from scheduler tracepoints then fails
>    deterministically.

This one.
bpf_task_storage_get() with F_CREATE can return NULL and the progs
have to check for it anyway.

> Are these the right alternatives? In particular, what behavior is
> intended from the _nolock() API in these scheduler-lock contexts?

It can be called from any context and it can return NULL.
That's what it does from NMI and hardirq on RT already.
