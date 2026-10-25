Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792935146;
	b=eQrFZWrR3wKGdlew7/NQ+WeqBo6Y/XrwGMLzI3DBgYfga0zIsonF/VsX9WB3HzDKesUN
	 QBF5HBZO/mjYmw8Qgk1rOq/3RMpZ0d7ckquofXdo01Qwq0qTDkHQuZ47ecolct5z36maV
	 ypWntuI/9xjRaKl7+JiVfYB+HzDzFqeQaZvvqpCBbpzMC6SEUhjmOJGVkbGgq2dpqQyDM
	 89DgiCtyr1arJ9oYLCkdiHdksezI1AWK4klYmgdZz1kanPd1ZwMuNyK1He29JqMt3qFt9
	 4W4o9xvsZLTFBiKPIYaaVx6zAf0o3Y7w90vB4TGzZGqubSOCr56NaFbiNppz6oZ9ghg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792935146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OcGgvWRppF08rxdxED6gZ5Zn9Wj39GXAsFDDIxUPXPQ=;
	b=xZszma9rhm/StmMMJLN8w5aO0gqArzKKnabd2bCsHJwp90Wp6j0Yd8gEmJIAS2MQxtp5
	 tAq9fuWALCl5b023U6oqBp+iIW0wAlSj1sYvdx7a/4IxXMTbUvKjMYYm1wAhg/17LGjHR
	 WrB+tanNzKEhKJEeqooyVnX353xpzo0oC25nZD2S0Pqi7mEarC8HACWdpxwYBfGoqtGCh
	 iYLp4xQ2JJzBFhKgO90bI432nYctHMj8sprp+lZXw+EmI0vjzRCkFbnZ4PseE4Q5EKxgY
	 WmGz7S8V+1cZw5Gd0HhidFdzmVKoAEIKIMV77HnTSw75p3Hhs9JmKJxQm2yF9PP2+KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ezv5wTN+;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ECD606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4ECD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ezv5wTN+
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so2730723a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792935145; x=1793539945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OcGgvWRppF08rxdxED6gZ5Zn9Wj39GXAsFDDIxUPXPQ=;
        b=ezv5wTN+Mz3AWK1OaUJWXsaICNfy+Yd2zilEQZqjly9YBxd9mwUCcXydPRHI4GJdRH
         Gdj0/4I8OdnsnIADtZAbWvDM6JlFyTSAc0iYtf6U3I1wujYFFiSssfSEkS+vgelyAbEh
         i7sscFY6kGy4Ivh/8iJw6kIhY7Ms/VEpKTmSTl4Cz5oo+lG7E3TZflkIRtrcnRR47bgA
         4SbE+EqNUJL1w7PlgjiYzy/8Wa6JNTRcnGhZV5dJFlM4iTa268QmhXY//yngOUtI3ahH
         1sRH8O4YqxJalctaBfzHSfmZ9J81PiyHpPRlgfRSHQEqEj+RjAVUc8hxT3vLTZTrQ6sj
         AaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792935145; x=1793539945;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OcGgvWRppF08rxdxED6gZ5Zn9Wj39GXAsFDDIxUPXPQ=;
        b=LDzP39Ml60AxSKsbCRgKkMqQ6iQD5mxIL+qOtJnV/Dw4hxCU6uR/ikVjSDmbzOnj3c
         vqrWyHDjqSSrVtmRgrCJ6peGgiMMwPwowswds+wpDF0Se8sEHZPETqmp+Bj87hQsisKV
         ZFP8EHabuWJrDIelyDVbvAmZ3p2tj121xP/8XpIIpYdz4/9U1nikAlztem2blryDF3C8
         6V0yi1HNbJUchgUcfc+VsRi4l9S/o32078I4hAfFGGxh6yUCtN9aoTXN2HV65KAv4cwG
         jxrawkoghWdrDpZvD5F2MuEBeYPggJSn2kIsIppQXi275apRUKyQ14NCXTKJWAQSotB0
         J3eA==
X-Forwarded-Encrypted: i=1; AKwUvBwboBWRHNvwUzK+AquLGAbHdUrfDl6figRVeiNp67fMLs5ytHipUNHCiSWnhN5imfqsGI8BhlR+CjxDUXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvMzY3W4nhKigy2NBtfmJvqeK/CoymvJ047Jx4DCIHNN9swjjC
	/a7hjxgjASDAlCxXToOooVVXnZXmQU1bwRNRjAW88zGT5+uqtpep0JQT
X-Gm-Gg: AYBFou0UKf4kEol8zUMQI3IzzvQfxGKvZxDuDAAV/7q9uiGqGkCwFEiiKDvCwOC36qO
	GoqlOYuPEr21efq8os5w9QWUk2V8cJSAeLQpw3ax9Vp5St3EcT5T6OsromsZoHv1W701FN0N5Vj
	PfmQuIKMlJA3YfbCTsbXtrz8GDixN3bS4Sw4mice4U79QBV0QzVAQetMgDEBGAnGerS1eI02oLT
	9T87/IeTd99e2/d67aTEWA435m2ukTAeF0mj2CZ7OvtF65zytzJUfW0yIoCEN4VLfz8TnOy/eUZ
	9r24SN9oZrAUDbOrPqoHaMqfUFzHz5ANM2I6ECRK6Bzg/bwYF7VKKJTG4bIJBP8gVEYVjKxxGyl
	2JS9ZyHKQJAhE3xgyRevr3VvifHQAkjGnjFCgV873T+C0V9QDIhmUIbyT+XY6D1GIt7EX5z2RZG
	HBLLVUQK9tWs1ZcNUxaYnWVIEMs1zVW3aU+ReEPTiK4TL/WTJYrsxW1zWso4uXpfQ99jk1tFYKz
	ZfUTcnm6SX7ApGZOII/WLHL+O3TiByZa1/SWNLAsMKdEuF/mwZAZoBzVy7Obp8KJRxcTY7AnXeq
	WxdEVF9kdkM7QIcZ7OWHrpd6ltUMb+aoOojtLg==
X-Received: by 2002:a17:90a:e7d2:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3adead2426fmr3897098a91.25.1792935145198;
        Sun, 25 Oct 2026 06:32:25 -0700 (PDT)
Received: from yafangs-Air ([240e:46e:1b00:3755:d15e:318f:88ff:4335])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bf7cbsm5070368a91.16.2026.10.25.06.32.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 06:32:24 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: tj@kernel.org
Cc: akpm@linux-foundation.org,
	andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	cgroups@vger.kernel.org,
	daniel@iogearbox.net,
	david@kernel.org,
	eddyz87@gmail.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	juri.lelli@redhat.com,
	laoar.shao@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	memxor@gmail.com,
	mingo@redhat.com,
	mkoutny@suse.com,
	peterz@infradead.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	tim.c.chen@linux.intel.com,
	vincent.guittot@linaro.org,
	yu.c.chen@intel.com
Subject: [RFC PATCH v3 bpf-next 0/5] BPF-based per-cgroup NUMA balancing mode selection
Date: Sun, 25 Oct 2026 21:32:04 +0800
Message-ID: <20261025133212.51440-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <7bcbfa61a8c69e6ffd81e97652d981b0@kernel.org>
References: <7bcbfa61a8c69e6ffd81e97652d981b0@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Tejun,

> On Mon, Oct 19, 2026 at 02:41:52PM +0800, Yafang Shao wrote:
>> An opt-out wins and binds the subtree: a DISABLED request anywhere in
>> the chain opts the cgroup's tasks out entirely. Otherwise the requested
>> bits OR together and the kernel reads them independently, the way
>> kernel.numa_balancing reads them, so a combined NORMAL|TIERING engages
>> both modes. A DISABLED request only speaks for the cgroup's tasks,
>> never for its memory, which follows the remaining requests of its
>> ancestors.
>
> Can you explain the reasoning behind the basic design decisions?

I missed your mail before. Sorry about the late response.

> - The folio paths resolve through folio_memcg() while the task paths use
>  the task's cgroup. Why isn't the whole thing tied to memcg?

On the unified hierarchy the task's cgroup and its memcg are the same node
wherever the memory controller is enabled, so tying the whole thing to
memcg is behaviorally identical in the common case.

The only difference shows up on cgroups without the memory controller
enabled: today a request there still reaches the task paths (the field
lives on struct cgroup), while the folio paths could never see it, since
folios charge to the nearest memcg-enabled ancestor. That asymmetry is
exactly what your question points at.

I'm fine with anchoring both sides on memcg, and bpf_numab_set_mode()
will reject cgroups that don't have the memory controller enabled.
Deployments that don't enable the memory controller anywhere can
still make a system-wide request through the root memcg.

> - Why do the task and folio paths combine the chain differently? DISABLED
>  binds the subtree for tasks but is skipped for folios.

DISABLED is an opt-out of work, not a freeze of memory: it speaks for
the cgroup's tasks and never for its memory. A folio charged to an
opted-out cgroup can still be hot for tasks that opted in; freezing it
would let one cgroup's opt-out block the promotion of the memory they
share

> - Some of the folio paths already have the faulting task.
>  should_numa_migrate_memory() takes @p, and the do_numa_page() and
>  migrate_misplaced_folio() checks run in the faulting task's context.
>  Why not use the task there?

It comes down to the common migration backend, which runs for user
tasks and for kswapd alike: folio_migrate_flags().

Fault path (user task):

  do_numa_page
  + mpol_misplaced
     + should_numa_migrate_memory
       + folio_numab_in_tiering_mode
  + migrate_misplaced_folio
     + migrate_pages
        + folio_migrate_flags
           + folio_numab_in_tiering_mode

Kswapd demotion (no task):

  kswapd
  + migrate_pages
    + folio_migrate_flags
      + folio_numab_in_tiering_mode     

folio_migrate_flags() must key on the folio: kswapd has no task to
ask. And one migration asks the same question twice: once to decide
whether the folio moves, once to reset its access time. The two
answers must agree. If one check keyed on the task and the other on
the folio, a folio whose toucher and owner disagree would move by
one rule and reset by another. 

So the rule is simple: if a folio is available, key on the folio;
otherwise, key on the task. This also makes the keying robust to
future refactoring: if one of these functions is ever called by a
kernel thread, the answer does not change.

> Stepping back, the basic design decisions don't seem to have been
> thought through, and the descriptions restate them at length without
> explaining them. I'm not the best person to judge how useful the
> feature is in practice, but getting this version into acceptable shape
> is likely a lot more work than having someone who knows how to do it
> just write it. I don't think it makes sense to drag this out and force
> it into shape over many review rounds.

You're right — the descriptions restate the design at length without
explaining it. I'm not a native speaker, so I had an LLM rewrite my
commit logs, and it restated them at length without explaining
anything — the exact symptom you called out. In the next version I
will write them myself and only use the LLM to fix grammar.
