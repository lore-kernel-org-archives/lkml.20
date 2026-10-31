Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445050;
	b=h2teV5H41Ll7iNrvmXtMeYkA5Y5TzvOQt2qfEsLJPJ84hsgQoOVsfLV142YRMGuQq1hV
	 e4m6G4tR4H9c/TcEtpYYLh5BujCuQy9I2zLtefeWcqIwivTPAOCLio9G1NsDTKq7UM6uX
	 W8BI8mXnJcIZFg98vglSPZ7EXOJ36BdbEYzzwhjuphVmNiovboL59cWdkN4OT7dNYvtEL
	 bt2NZRgkU935V24Ep5JCsLpFnLKpTK0kamZ6yMfXu7tyWQOCNSAfJGpw9JLop2iokqTSM
	 yRr2yQZ3zSgo0EA0/UI+FP1iI/YDejXv7J8rRbKlQrZVpwoEBgLMNsKIeAPq84dmkvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=;
	b=onUJdDDuXRC7bKiVN4uWd9zL3vtMla41ViL8MvjEx705z4SU7uUJ4BWMibdXl05brTpN
	 kmi9hcvSzOr1m3HMaR5L0halNhTc24l6v5MmD7sukDqbOPf8LYeIZz3lowa3pfivQBtl8
	 ja3LPu+CIBCYZqNYxGRmLTYk0yDN7MF0v2mvFEV4vOdmuf94g/d5qXjlbwuO4ZKCWhAsn
	 0WgCsErNvhx0OtcMzHu9KWFbZGLZiEFHU/KWfJH4eJkShqBCfAn7yIxFIyHCe4y13DuBa
	 sa3OXocoMNys+Vx5yFTadHtFOXZ7THGdOUcP4tWtNyknlaYDblkl6uTRZb/0veWo6+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nlvriD47;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7398B606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7398B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nlvriD47
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so17324395e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793445049; x=1794049849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=;
        b=nlvriD47siSUj/pHhAZKx+QLV5KHM/oCUhB2Z72IcmRKuDh3jiEue41W2bEqqDFxx/
         epSfCs0ji+w96+RHDverYdlufb2BeD51SHb8d3aVAf+bP+sHMqHpLrleLcr8XhEat+Nm
         VvdLIP08AZAu/HYXHTlVeHrk2AaqHs9omZ+vtzdVJZTnqNPbFwfOqYWohu0mLNHzx5kJ
         UjaZlR+pqvdN6OFKp6OtIFKhTA/nOquQtmw59tEofdPcG/4gvVN33faezMupVGz9Vq6b
         7noxXbyB6tLXWzdp8rBQ+Uvzirz/0qTMpQojvrDhungxg0breARLZraCM2bJ7BqfbDNO
         f57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445049; x=1794049849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=;
        b=FBGfiODsKjwf3Fns9Bu0weC+r8p0PHDYFKeY1FeIYia4QJYxjaYmLHTxAOpsU866rE
         +Ddpg0HFPXtBTlSOLQhCc/v3gxqAJd/NysWePce0OcwoSKY3mZa2M7x3Nw8DQo/AYDYZ
         tL9JYP3Wy/3VTeRX9xL0QgTMV3Znt7RH0ayboiQZMr9Jbwwiu5Tz21WrKoFcaEmZCtpK
         RYN3fNMwE3bZR5VzSM7yZcSOBnboR5dyyK8xvfTSZcDhQQPqwGubks104axyTuOzQGlp
         4FhZN+PvQpoe08Ai3rZwtVqlfnFGS2SCTRuenCD7w8Pi2oMZv2FZdJGzKqhPd9depgq4
         LkCw==
X-Forwarded-Encrypted: i=1; AKwUvByMWsRyXU8JbcbZcx0eKDAhwtMvmjJc5S8ZufaI5snJQHve/fsCSRvw5L6feda8H6zoxtxVjkbz+E+jNEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFBydwfKUBggjfA9SvgVM/qcUzHgdL9WoeUbW/KQ+HE5yQorCe
	wCp0q+0l/dgCqHBNd2JgOy/hv3EGbUo+pcAhfmNWK+dm3Op55HrnxSZ7
X-Gm-Gg: AYBFou0/NmMlxdL1OgsM0Kt0zTx5gVmUUmvwUmKn8ba5TbT0AK+yFILYa7wm59dmR6s
	0mC8U0gIrl+1/b2LJa91MicAYGI1Q+5dTuGCJe2AESpPU7eo8fcyoB1gQszyOz+V6d4F5GSYuBo
	68/pGGJ/n4e5E9j5ntStfkARQqoFGSVAaQCHGjwaFfsf9heDd4OQNGOp873q9d+N26ri5lSx6ob
	Q56jxBPDXC69TnJpE5nLiXOSHcObNNvXoE4GEuGdVnDAw6ubliCOLwiPbQJ8nOn9xdMZFVfBQvZ
	FNwoUMMuflYid2mkT8GWA8av3bT1U/zfOjjDwn4EJ+2QqIzNSg/OD1yBlu/UiynYFyqF5lKjD0B
	iuXhtOCtGX15MM+t4eUd80rbtEtbdmY6EhzBJY2cMKeK17CjusG6aoim8NKEfb/OmMye72aatKp
	odSjhJirEiYt4pstGyJdAm22zH4QjY5uJEG2uACKVaNo7Toky4uBXVv4uBkwU2PwjAn5rTmMTqG
	RQWqi/pFltWlSJ/JINZ1/cMiVBb8yuNg3YTURCf8ZIU3eHcVtxfWjj3grWeN4coXmxjHW5zCSHU
	Rg1u1zIYc86/1QTYZPoX+DAWjC7vaDdQjWBjApGCRK/RwM+YhtaWvC6MlcdKqjf1Dh8w6xFt6v7
	zZDvtW1qiD50jTzSO72rKC5BIKwkWVCTv2tYJM11V52DwnXZbMlZVwNWReb2Oil7ZF4KUg7aST9
	qNO7lGpeWXHbO1fUYWQuj1/J3bq9ax
X-Received: by 2002:a05:600c:198c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ac151a9a36mr117500995e9.4.1793445048512;
        Sat, 31 Oct 2026 04:10:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a81d-e001-9c9b-db33-f166-0fda.310.pool.telefonica.de. [2a02:3100:a81d:e001:9c9b:db33:f166:fda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm117315545e9.8.2026.10.31.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:10:47 -0700 (PDT)
Date: Sat, 31 Oct 2026 12:10:45 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Hongyan Xia <hongyan.xia@transsion.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 03/13] sched: Split preempt-count bookkeeping from
 raw updates
Message-ID: <auXLfz6mFh_uOvRr@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
 <20261028033127.82193-4-kmehltretter@gmail.com>
 <20261029093219.GH1779021@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029093219.GH1779021@noisy.programming.kicks-ass.net>

On Thu, Oct 29, 2026 at 10:32:19AM +0100, Peter Zijlstra wrote:
> Urgh, so much crazy.
> 
> So WARNs in noinstr code are 'fine'. That is, they should not happen, if
> they do, bad things have happened and we need the warning out ASAP, if
> it takes the machine down, too bad. See the
> instrumentation_{begin,end}() markers in x86 asm/bug.h.
> 
> But yes, the tracing needs to go. But moving that around should not be
> this ugly and also, that will give you the opportunity to fix
> preempt_{en,dis}able_notrace(), since they currently also skip the bound
> checks.

Yes, that's a good direction.

I checked the call chain and DEBUG_LOCKS_WARN_ON() is already fine in
noinstr. arm64 just needs __always_inline on preempt_count() and
should_resched() so Clang doesn't outline them.

I will work on that.

Thanks,
Karl
