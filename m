Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446325;
	b=4k3mvEPhjInHpHRHZwUVtJwpIPHTkJnlgdOO509FeNT/Xs/g70LhUUaGeLrsSqCCrukY
	 YxbUoOe3xvW6+erCsCaTdoSRamTgqzRxsMxaqd77XFByFkJznqnlsZ7rSDRtT+02DQ6ci
	 YweUMea0tUyuWAW1iurEVZhYJfj2x/u1XTv7ZxXdujcjtye2LKdbG5j1sQRyLYR2R8RES
	 k2s3jDhmrWwU2g+VOxoELcf11oxppCJ08IDUXar7HKLFsMrst88dyXlZu20qnx6drxsqS
	 H0dGm49jBgX9lCjFKkMbX+nm8RwNkrmujJZP23E3YskAUfkrwPNBBuiHDyFpYVzdxpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=BbOODuGG0FNPjmT+T9b+kLN1Jw1z3hyQyq3dad9XfLI=;
	b=jThJT7kCYL8JM+1DVFDxyA4LjnQlTthcWcZdWJs/4bIz9VA+XBYRrww4EbRGJgEQGr0g
	 iqMn+meC0bjlRDE67DCCj0zZQguBo54fejCjotYWHSDd/qP9S8QBggBWzIRvQ64WjIJ7c
	 fSbwh4lao3MJH74zYDJH0mN/B4wdjJRuYaElzeZkfu5trPwGaPueaP9ipRkG/dK5ocjQ/
	 etIVEhYkDYOBp2GhgU1/Gxm0Qj0gQTuDc8EI/ZMkFI+SgPcOz0wfAMNWDCmYo3HqBA1ZC
	 Ro8ECRQFPucz2mZ5vUmlbA+YU7uNEWuzQ9W7N95dirkth0TACOAjUiclzeHXQx6kG2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x/N4LmaU";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE3606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDDE3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/N4LmaU
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e987a2ba0cso21719465ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446324; x=1795051124; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BbOODuGG0FNPjmT+T9b+kLN1Jw1z3hyQyq3dad9XfLI=;
        b=x/N4LmaUUINrFgwptBM8QAlvbesRfu4BGD9yFRk/riBmXpTFAwL8LzBrtMivIx/h5M
         nnokgp4EAATpf3aI/KwuCHbZyiVUYrODGsx2gtQV/ThZX83DqA7Eb/P+fukzYMu6Gw7K
         XRqNTLL2ANJwV2q/XTaTBREHRukfZvTGYYmw8wU8EzmrLlMae4xXOqn1E7oDo2eAEvHF
         LHMMehFrGb1dJCVfV4StrJ5qftCuWhMd4iBMU8LC7pCNY6O7EaiqWXaclHbgUjralz8V
         R5SwrqA2tY47XgsCnvTJH2xUTV5REZbP7tX9Mseb+JP+Vb4EABFuxvzNc0K6WCp21vKb
         bunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446324; x=1795051124;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbOODuGG0FNPjmT+T9b+kLN1Jw1z3hyQyq3dad9XfLI=;
        b=SeVYiaO8TvQQQJpz1wdyqnPzz7amcYOlDWulpr+ORPaVDytvR7XQ/RC0fbZ4AQDwMo
         AW82sh9l3YY/mcsHyVnKQ0YWWH1KEk9dFqwRWjBbPY1zxOX74lvxWnqcGKWWmJDt5ZuS
         3MF56fmvq0s98+CWO26DbkpkquOgFTRl0nyXkK6d+JrckvP/6qvUmio0TJPTp1ojPGy5
         m0OuSbFP464RSA2mXtIGR7jd7IiL2vPpcawgZ/PRpyeTavwCioGd/jR9V1FnXDEUWuOR
         kbzH8MdwDA7INxOl1W+zjB+bmoJtwTDyU+KK6W2MvuWuGQEO0wfzW9QlCi6mFdCZ1Qnm
         P8zw==
X-Forwarded-Encrypted: i=1; AL+hErE2G/gb8JdLqz4/Mr046DsoLMyvkT0HcODcUd9yMNp+KdBSEZt3cbxml8SWlfd3N4LXXYV63gBScCOzw+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ngBsyUYtIcNpiZb3WOgTka58R+nnBodW9nGh1x9xnuCsKLDvF
	8lbKlL7yesoYW8ehypdGfaCFQcUOafsJlwDzZVShTyTZg5PvxIWjQvS3
X-Gm-Gg: AYBFou3erRwGRqomL84vqrQnBJ4cPcjQImiBmOA0iR0kI/gIOZ/Ia/alulpL031ZuW9
	1VQYvGS5W3mT3YnUnOh/UFzU27s/BTpn2I6lWKciZsjs+P/u/Y9xxpjNUpEi6iw3G8eqgcBGrfo
	uZycqY/ZqMbm8JMjPWyY8J+Z7tyl3Q23KFygpPLqScoDico/I5YXIZT3xBSjhAAJTkLLhaFDQxv
	MgyMBbTbtYQ2sKtV7k2XN+vANJoPD+uoyAL04G9f0bHKvh9KnOaU+hYkuPzRk1hKpzZNCjKlWx8
	h13OpPbf4+uQ+UUyct47pmmzkaLeB3VVDu8HBbPlntoxt+5XFYH92e+kwDsvt2Y8BQjUCo4m9QA
	86MUJugxqDz4zNzPdFr+A+J8tBe1Yw+gu0mJxvi+AlVIVrSPF9xf+bfXRDkpwwcRindBr3CLf0p
	iQdbBaQvO78QzViV7uuwLuKTcMoiIMKIySGyll94ooPM3qqid/j4nY81ffKWux8hSCkHGlxTb0B
	y+ADdJmnNWGVIFknyilbtY7M4QPzaRvE/EekG9J0MW22hST82PNtpwp9q+9uOhSGD1zfv+/0hTC
	0xLMxqe3a0ZdH8giHvevy8t6NbnXvEFzTXlSAdYrOehXwBoAvUN2+Ogza/xiPA9NEmj6Z8T/iH/
	U5XNLdPh25C/4nifaoHSzjgj+YEloD4MqCg==
X-Received: by 2002:a17:902:cf4a:b0:2dd:ad74:ac28 with SMTP id d9443c01a7336-2edd7752fa1mr45783595ad.26.1794446323913;
        Wed, 11 Nov 2026 17:18:43 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7d964sm25621155ad.32.2026.11.11.17.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 17:18:43 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 01:18:42 +0000
Message-Id: <DMSU4S7392QQ.357Y29RMDZ8BJ@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "JP Kobryn" <jp.kobryn@linux.dev>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 0/5] bpf: Check recursion per task for
 preemptible programs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <mikeba@sentinelone.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>
In-Reply-To: <20261111-bpf-preempt-v2-r2-v2-0-9d8f6b952ad2@sentinelone.com>
References: <20261111-bpf-preempt-v2-r2-v2-0-9d8f6b952ad2@sentinelone.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 11, 2026 at 11:39 AM Mike Bazov via B4 Relay <devnull+mikeba.sentinelone.com@kernel.org> wrote:
> This series checks recursion per task instead. Each run already links a
> run context into the task's chain (current->bpf_ctx); the run context
> now records the program, and the check walks the task's chain.

The link walk doesn't look too bad,
but pls share bench trig-fentry/exit/rawtp numbers.
Maybe we should do a per-task array of progs instead to detect recursion?
It's likely more cache efficient than link list walk.

Just for the record here is the illustration of
the case I was concerned about earlier:

  task A, cpu 0                     task B, cpu 0
  buf = lookup(&percpu_scratch)
  fill buf
  <preempted>
                                    buf = lookup(&percpu_scratch)
                                    fill buf
                                    output(buf)
  output(buf)   <- data of B

               today              with the series
  -----------  -----------------  -----------------
  run of B     skipped            runs
  event of A   correct            has the data of B
  who sees it  recursion_misses   nobody

A prog with a scratch map of its own is correct today and
that's what plenty of production bpf progs use today.

This patch set will make them send corrupted events, and nothing counts
this corrupted events. Today, at least, you have a miss count.

Please add it to commit log, so that trade-offs are clear.
Commit log here and in cover letter talk about 'what'.
It needs 'why' and 'trade offs'.

Also should we add an verbose warning to the verifier that
when the tracing prog that uses per-cpu maps might have corrupted
per-cpu data? I know, no one is reading the warnings unless they
are verifier errors, but above scenario really worries me.
I thought about automatic insertion of bpf_preempt_disable() for such lookups
and bpf_preempt_enable() in epilogue.
Maybe that's the way?

> - Timed may_goto keeps its budget per program and CPU, as before: a run
>   in another task can renew the budget of a preempted run.

Not quite.
Today prog->active rejects B before the first insns of the prog.
These insns set count and timestamp.
With the link list approach every B gives A 250 ms more:

  task A, cpu 0                task B, cpu 0
  spins on may_goto
  <preempted>
                               enters the prog:
                               count = BPF_MAX_TIMED_LOOPS
                               timestamp = 0
  spins for 250 ms more

On a hot function A never ends, and it holds rcu_read_lock.
So the promise of may_goto that I just fixed a week or so ago
will be borken again.

pw-bot: cr
