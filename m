Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13EA4C9E19
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769073; cv=none; b=G5yT8L0pQlHqMNGvs+7qktPc7w7bYZBKp79q4UWDDhcpMCARAKGIaNv5m1Aa2eMLb59zTz0WPxT2106v9Z/nOcjSn1KbUJ3rsNoeRQzSRPuEZ3ru8yNbg6rKw84TPeynIi5kn5N9d+YTDLL1UPwA8cFFoBuMNDOVE7ptWdjHhbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769073; c=relaxed/simple;
	bh=1yok3FRCSGsQ646Mv0hPXKN2gXhv1QGhkM+63K5schU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ULbsv5F3wvYHohT92Dza4qOruqqdurhwzC6j5wupQqXY4uWEy35bHwoUX3N7FmrN/4psEldx1Tye4nwlnLyTwYBir9L7uoJ4sDK/P8WDONKCAInNjZSfq2yqwvIjRbSJUawOqdkdB/p0RpR0rL2vJ3ZgiRWc5h8zpticyq6e4rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YwqAh3wC; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YwqAh3wC"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49ffc2b1867so30690315e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790769070; x=1791373870; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NifxUDxp5Rsdto9Mf7fh+CYB6E6X8lzUhSBky1Oeru0=;
        b=YwqAh3wCh920/8+8n3eZHU3DLeqJ49MZlAZJT7yEvCoGEWHpwiemjmf47OSRoTTm61
         wSTB0o5cbMB/HmkLyXONLUp96zvPV0EwyoO20HCbBk/vfeRWWvMREmPd7c3stAL+Ptjv
         MsNHU8X7xTWQcYsQlR/oOxCfU3SfQelOfNUAjSmNARbahgVTIrZc1qnhdqPU8K/SqPLw
         buAVu5vLaqJ/ny5cyXzuAyuzYK9ql2oOs/45ThL315zF6pHP8/Qco7mq+2hCGwjrtjMg
         zwMDtT/M2LCLebPKyxL8dsmYOGRSUX8lri1EUOIdYaWoiw6CbJdE1LKtzuo4uel6un03
         z1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769070; x=1791373870;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NifxUDxp5Rsdto9Mf7fh+CYB6E6X8lzUhSBky1Oeru0=;
        b=O3V/hsBx/hH5xO2VsSgLoaegUKO1m44gaLTvRvhehCIP+4xWdXaK348cMBsNIlpxvu
         29ehMo8siWwJliKI1CGBWowYGscwhm77Bni49VzjNgzCZC979BdOGbdV7wQpybBW6cYL
         coMVLxRniipiBQt/Av2tJNr5/KwQrUnHFeeKiatyMT641aMdHxrOK5MQAdNmMSixHv/A
         EStUzEaTtKZ/xgtbjnkYUcR0SMkHqyM3XLzXDsiQm5wnEPqOAnnyYbs5Y9z41j030ZjG
         3hvtTeh5s771TBCwCcmf/V4POVRQnbxp6t/GUZlp1pCxYXr4ING5tB5gEgFcSmew1vc5
         nvLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ7aH2aj0iaUTHr9CPafEVL8iSdXxTuMg2ReCVYFYdo2BwtWfPBmSb3piymoCfmdgsp55tAqSgWuc63/w=@vger.kernel.org
X-Gm-Message-State: AFuF++nKAmEKjcQ0wHUk7FF2V8qgV35xKd4SYh/X5hfQToZOLDg6sbLx
	b4+qg00cM8K9/E4qQ55uoOcWiih7Q3KmD7vNp0IiT5HgKfktGtBBhtJmWAoUe/ZCqkP8F0EBPT4
	hXZF0rUfcDB1TkA==
X-Received: from wmnb21.prod.google.com ([2002:a05:600c:6d5:b0:4a0:780:74f])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc9:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a01afe12a1mr19133225e9.16.1790769069776;
 Wed, 30 Sep 2026 04:51:09 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:50:39 +0000
In-Reply-To: <46f4b66249f016b675fa16446b2f2f99@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929161730.185271-1-jpiecuch@google.com> <46f4b66249f016b675fa16446b2f2f99@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930115044.337291-1-jpiecuch@google.com>
Subject: Re: [PATCHSET sched_ext/for-7.3-fixes] sched_ext: Fix missing
 ops.dequeue() on remote local DSQ moves
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Kuba Piecuch <jpiecuch@google.com>, Andrea Righi <arighi@nvidia.com>, 
	David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tejun,

On Tue, Sep 29, 2026 at 07:13:07AM -1000, Tejun Heo wrote:
> The fix looks good to me. It effectively reverts the enqueue_task_scx()
> half of b75aaea24c9f ("sched_ext: Properly mark SCX-internal migrations
> via sticky_cpu"), which as far as I can see only ever suppressed this
> ops.dequeue(). Andrea, can you confirm?

Thanks for the review. Following Andrea's suggestion, v2 clears
p->scx.sticky_cpu right after it's read, as before b75aaea24c9f, so the
fix is now a straight revert of the enqueue side.

> - dequeue_remote.c isn't built until 3/3, so 1/3 can't be built or run.
>   Can you put the fix first, followed by the test with its Makefile entry?

Sure, will do in v2.

> - 2/3: 7.1.y also needs 18d62044cda7 ("sched_ext: Preserve rq tracking
>   across local DSQ dispatch"). Without it, the nested ops.dequeue() trips
>   lockdep when ops.dispatch() uses scx_bpf_dsq_move() to another CPU's
>   local DSQ. It's tagged for stable too, but maybe note it as a
>   prerequisite?

Thanks, I missed that. v2 lists it as a prerequisite:

> - 2/3: With sub-scheds, scx_resolve_local_dsq() can divert the task to the
>   reject or rescue DSQ, so "inserted into the local DSQ" in the comments
>   isn't always accurate. Maybe "destination DSQ"? The new comment in
>   enqueue_task_scx() could be two lines, and the description could lead
>   with the late SCX_DEQ_CORE_SCHED_EXEC and be a lot shorter.

Agreed on all three, will address these in v2.

> - 1/3: A task can only be picked straight out of custody through
>   sched_core_find(), which only returns tasks with a core cookie. Checking
>   p->core_cookie on SCX_DEQ_CORE_SCHED_EXEC would be exact and would
>   remove core_sched_in_use() and the skip.

That's much better, thanks. v2 reads core_cookie through a CO-RE shadow
struct, so the test still builds and loads without CONFIG_SCHED_CORE,
and core_sched_in_use() and the skip are gone. I also ran the test with
the runner and all its workers sharing a core cookie on an SMT guest.
Legitimate core-sched picks out of custody do happen there, and the test
passes.

> - 1/3: _SC_NPROCESSORS_ONLN ignores affinity. With the runner confined to
>   one CPU, the test fails instead of skipping. sched_getaffinity() and
>   CPU_COUNT()?

Done.

> - 1/3: Nits. If the /proc scan stays, PR_SCHED_CORE_GET writes a u64, so
>   the cookie should be u64. ops.dispatch() pops one entry per call, so a
>   stale one idles the CPU until the next kick. Maybe loop a few times?
>   missed_dequeue_cnt and core_sched_exec_dequeue_cnt aren't printed
>   per-scenario like the other counters.

The /proc scan is gone in v2. ops.dispatch() now pops up to 8 entries until
it finds one that isn't stale. All counters are now reset before eac
scenario, so everything printed is per-scenario.

> - 1/3: The variants, error conditions and core-sched caveat are repeated
>   across the cover, description, file header and comments. Can you say
>   each once? Also, single-line comments are usually lowercase in
>   sched_ext.

Done.

Thanks,
Kuba
