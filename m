Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6469C2FDC28
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788924957; cv=none; b=nnkomdQgailrLAUUHMHePdYf5M/J9gedbRwMwJqf4mQAjhxnUQf/eLUfaJ6+4FTkIpZBRGENnkW3Fm7g5ndu1RSgOpsA6dg74TUX5tFWy0NvZTxeluX4yhmdYjOl2ZCLe4ObrboOIkBt4Vp0WKcVTdLT1OUbpdQ0M8pNWW2sp4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788924957; c=relaxed/simple;
	bh=qgpnyyF/4Gf5v/qT00wUMXsFVueOpzRVzIQ/M7FjTSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/KDRIUku6H44OOShTwUI3PRA34hpjAPUKouwj8s3+LRt9jPTBO58ABPeoYxWhimhdH69EKL9YxddZjIuwxeGU4bafwF2multxXRlDd46TFmoMOeo3pSbvNYNl3RgVezT7s37/HxCfykD0R8X4n5t4QOwIMx7p5XY8QKKEnzYjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TohjZNi6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TohjZNi6"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-398a5aad413so4286112a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 20:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788924956; x=1789529756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oYrPFDc8VCXN4ipBSlQL/si5rs5sJ/hlXymUwQCTqLY=;
        b=TohjZNi6aPhWZ+UrA/Y69gQac5x7gLlXQA9i9REcZZcO8hozcdcvbmoVbwdfJNu6ex
         5pA7p+v7JJi8dcYH3ol0ulMmPq9dCPGe40MH/WAp0HU5fnMrAGlwIV5iV0oIYz7nmJiO
         AaQOdfnpqyKqEYJ2vZ/4JMvbe1J1pnw7MynQmN1EVr/Hc1gwdmPp5ICd7XnDAa6M+Cd7
         Ajcz7Y7gJMZx+fAEwMj8GD1CjuRtXRT0Ndi885NDKt2Z9oJSMy4+8A7TnMDEqoCAxWPt
         UqXrEQX7nugCuaofZA1v36tCfke+ck3XgbQa4JSRNXvuNnaVaPQX5UnxlFkGdphR5SVd
         SDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788924956; x=1789529756;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYrPFDc8VCXN4ipBSlQL/si5rs5sJ/hlXymUwQCTqLY=;
        b=G3TOWEicxlkgOuo+vVhATZOyIyXpzF1p2/5YzKe5nh+wL9A74xUQZPwpuiTNkV4gc6
         TSoLkxo95OtykvSDrGUUvJlh/hkJnp/3PukHOwMAx2GWtfff+GtHHA0StzyM/pZx9S4O
         7jfcTZVvRANqIgtbURD5FORrdSNJVNdbaj+Lq1kAVdCAlACYEih1Ho09S1b+NZX3KWkP
         XEYI0tPZnCTFbIw2xxh/nglFrVcQi4ztQvetgfuzXQ//zi0Y0huNdkim5GY1Cxuar3k3
         d/PcNsfDiE+W74t1uAm4xIiAcmB1Nsk9vCY0Hk/ol4P/qEbLlXCdjBf+tF7rZak6AZM1
         +0jw==
X-Forwarded-Encrypted: i=1; AKwUvBzuhP7LQcPLErWkvH+useRgWUyERT3x07Mc5gJHkcTsWeyQJ4/LjR2fsj7NdN2tlGGLPbRe2dAbmaylm3o=@vger.kernel.org
X-Gm-Message-State: AFuF++np/08bTd0iYpkTodyD85L85cxgeUSzd3m3NZbfK4qyQdA+yY+j
	J3+f11QAZNsMtldKJTfUYr6GCVGei9OaX0lPqbupz5OPLR4VNoIWuY69
X-Gm-Gg: AYBFou019Wi+mV/kK/nelbW7UbZ2ul9llzhAOogLBQsHKia27dY+oYueafqTFLYRBif
	dLENZM6azv23+K3S4Ka8iEn41IR+eWQSfYcig0LLNxjR8HsqwrbOxo0T5GHd9t0tdYAF1CFVv1P
	7NN+GJIMVff6JzROaewOI0gvy2BYyemR5SxbpzXS3XCFPe25rxAsx7ebySwm/qz7zbac69lY4e2
	xW4GbmfLvvlY0zlLJqA3GM81f+Hv7wGrYcIzhEk/7NKAU/RmFaU2Br3P2xd65vAgxq1mRgao8S+
	TKDI5hqm/C5TwFMUv/pK8EYX3aKsGHcoN3SmNi0Xuzb9pHKocQU2Hve9MR64fCmCAp7K6W1O/+F
	pcSJ6Rp9vDjUtPgERhzVSa7boao2BHWS9l16slpfLqokQcjsguaYuHNotY1oSINByn6ioOCryL2
	mw6/5CK218S+i9LrygNix4B/Y8GHEi45a0Uom46rsF6SE/Lm3Bjh8qLBjJpuutNQF4ue7Rhw==
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr47665056a91.25.1788924955272;
        Tue, 08 Sep 2026 20:35:55 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ba0a7b2c3sm5291085a91.0.2026.09.08.20.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 20:35:54 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/13] srcutree: Add reader-free fastpath to synchronize_srcu_atomic()
Date: Wed,  9 Sep 2026 11:35:45 +0800
Message-ID: <20260909033546.2432205-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0d4af6318ac67486858be1df8d436147b444a2d2.camel@infradead.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 08 Sep 2026 23:26:06 +0100 David Woodhouse <dwmw2@infradead.org> wrote:

> On Tue, 2026-09-08 at 13:29 -0700, Paul E. McKenney wrote:
> > On Mon, Sep 07, 2026 at 03:58:19PM +0800, Kunwu Chan wrote:
> > > From: Kunwu Chan <kunwu.chan@gmail.com>
> > > 
> > > synchronize_srcu_atomic() is restricted to srcu_read_lock_atomic() and
> > > srcu_read_unlock_atomic(), whose read-side critical sections disable
> > > preemption.  In the common case where there are no readers at all, the
> > > grace period therefore need not do the index flip.  Add a fastpath
> > > that sums both ranks of the per-CPU ->srcu_ctrs[] counters and, if the
> > > lock counts match the unlock counts on both ranks, ends the grace
> > > period immediately, skipping the srcu_advance_state() scans, mirroring
> > > the similar Tiny SRCU fastpath.
> > > 
> > > Correctness requires the counter-sum proof to follow the grace-period
> > > anchor written by srcu_gp_start(); placing it before the anchor could
> > > let this grace period miss a pre-existing reader and return without
> > > waiting for it.  The smp_mb() between the unlock and lock sums pairs
> > > with the smp_mb() in __srcu_read_lock().  The grace period is ended
> > > manually under ->lock and ->srcu_atomic_gp_flag.
> > > 
> > > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > 
> > Adding David Woodhouse on CC.
> > 
> > David, does this provide appropriate performance in your use case?
> 
> Compared with the early bail that I had before, there's a *slight*
> shift into the higher-latency buckets as expected, but definitely not
> enough that I care. We're doing this whole thing to eliminate the
> multi-millisecond p100 latencies that happen when we invoke the
> workqueue, and the differences we're looking at in the table below are
> *well* below what we care about:
> 
> 
>   ┌─────────────┬───────────────────┬───────────────────┬───────┐
>   │   bucket    │  try-first (#10)  │    Kunwu (#11)    │   Δ   │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ [0,1µs)     │ 5,338,474 (60.8%) │ 4,953,657 (56.8%) │ −7%   │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ [1,2)       │ 1,077,998         │ 1,087,133         │ ≈     │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ [2,4)       │ 803,244           │ 790,489           │ ≈     │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ [4,8)       │ 811,708           │ 880,673           │ +8%   │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ [8,16)      │ 366,183           │ 597,443           │ +63%  │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ [16,32)     │ 338,731           │ 361,243           │ +7%   │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ [32,64)     │ 14,290            │ 28,823            │ ×2.0  │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ [64,128)    │ 2,549             │ 3,655             │ +43%  │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ [128,256)   │ 555               │ 783               │ +41%  │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ [256,512)   │ 456               │ 625               │ +37%  │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ [512µs+)    │ 13                │ 8                 │ ≈     │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ max         │ 1.07ms            │ 1.56ms            │ +46%  │
>   ├─────────────┼───────────────────┼───────────────────┼───────┤
>   │ total walks │ 8,777,514         │ 8,723,453         │ −0.6% │
>   └─────────────┴───────────────────┴───────────────────┴───────┘
> 
>   (192-CPU PREEMPT_RT host, 12 concurrent gfn_to_pfn_cache invalidation
>   reproducers, 300-second windows; each "walk" is one invalidation drain
>   which includes the synchronize_srcu_atomic() call. #10/#11 are just
>   local build numbers.)
> 

Thanks, David, for testing this with your KVM workload and confirming 
the current approach works well.

I’ll keep looking into the fastpath for synchronize_srcu_expedited() 
as well, while preserving the existing SRCU semantics.

Thanks,
KunWu

