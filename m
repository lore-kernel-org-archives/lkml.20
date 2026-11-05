Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793858564;
	b=JE6BDcOwCHzji5rvCwfxoE3MwZNsdL/HCQoLnlgYGJoNDA2Cx0lxOZDfXCenD2JBXxux
	 /rlAUJuAS1BwjyX5pdKgYMkw2HppU+foVwAdw81zex02Wghv1AxfQmUEUOklDg9GOgR1g
	 eDG+r16rvD4cGG/BEvnH7uHaZQw9ipUj+F08R2HEIQiMHD4BqkIvxihiB0LFXzYg286CR
	 jBKUI+us2S08CYMLDXW0OnBvruBtQssnbcfsGdDccnZJknFabUygjGvXXQRqOMhEfKhwU
	 hjt22JJQZWHFZFHXE7f8GKJ1tOklpGjaNJakHiH+Pf1ox7j0BrJYrw3fWtxynfEXYaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793858564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cczdSvxkXhuJ+XLaUhFZC1PNZn+3DdI+EeldN1X1aUQ=;
	b=DZfYBrkvU1FNbiLyCA/dzXH14OKL7830f1qHIdxFTAh8ApeoV5sm4AeW80tf8b80sfOX
	 JFUmbC+b/Gu8dpWzfAWpA8Nnb4me8zA+bM3tkN/3lkwvXKOsabmwz+qQNo/OLHczOwlvQ
	 BaNNCF/pdBu6Ua/CxsD8p3lYHMGEK0RTRK7JviL9Vdcy3qtc657JSNGoEbLv8G8dIdqKd
	 meqi8QpahDGirUgDQCYWu2iO0VTTqc3zeDBmkBTNNTz+157Rqql2fII8UL5ssriUBtPGq
	 PMrNMlYqPJGApcqGurVl7s3iYJKojQ5X1T8HACZuQbNVfpf6njo1r9DZEMUor39LcGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgU6Q3Gr;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DEE606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95DEE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgU6Q3Gr
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b092ea1afbso490707a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793858563; x=1794463363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cczdSvxkXhuJ+XLaUhFZC1PNZn+3DdI+EeldN1X1aUQ=;
        b=jgU6Q3Gri2cVuteXXx2kn6dCr/iRYSaPsqgU/gajbjvMK/HKEFBQqT82x6ALvp6C8n
         aJC/fbs/CZJPjQaMksYYkbOwz2n03rRIL0ueheY6Bgphcgt8GTgX5dMkrJCC+Zko54R0
         wUlA0bA1eDJBJifecvu1b+57y/QRER/GOK3TYCKwYRKZmOZFQ1Jy9uBCHbxNIaBySBsh
         axqK+wtFK5EwSskYaY2mehNtzJrD448oT9VjmOL3OsPzzXk5Q3ptpvbFL+Q+Y+6anmoX
         hrV/qTKwtoCYvD2MO8LSeS1JytMda7IDwx6kQJz6eDDtUMnb0+ISUOOtJUP2q0mQfy+q
         rlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793858563; x=1794463363;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cczdSvxkXhuJ+XLaUhFZC1PNZn+3DdI+EeldN1X1aUQ=;
        b=D1K854RYOXbHzPoHd0eiLkCnSwOkmSnbL4RsKJyqPz8uuTdLfkUuAjAhicG4V4YFW1
         zXGILoaomtqGvsDbipPe2jpS27rEw9hzQXGlqbQHp9u0egKrSXnYaO9w5Rwlh/YhrryW
         GFYcbJMDDHKDQveYLhJ3eqNGLXvfueCdcQec+5SM89mEoC2em72BwZIZcEBUaSzX5aoE
         miC8rvGyegLGzPKeK1sKjYKMKV1pjD6+lIkkb7zvdXCCLWSBArllR8xenxBzsgOfrsq4
         BO5FVaOm/V0GUh7ObwqPt7e4VVzQmWJ2Bd0RGzgjIt9cdhQgmItRDaSd3aisV3/TkkjR
         gABQ==
X-Forwarded-Encrypted: i=1; AKwUvByL5CBDFYT9CTioy3FfpDwXl/8iaBEDApKRFpaIE7jQHhbU8TQ6+sKWYKL1C29SfClobWgvpWd5eGs/taA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X/pWoC7TVu5GrmxlPqiW86VbxedVXYTYvEQympL8fZwF0WbFj
	gRgu1zqF8D7UtNnBIBO+G9CjKx+4YjQtPJ/HRIx/WY4gx29tetwmDG6l
X-Gm-Gg: AYBFou2Ztl9a6ljAD+J7Gnk7UyrYu6e52gKUGaPckggMJm/5HdgluFq0DW5/ZLgCrho
	+g2XXrRnJgBvU6gn277hdv920bgWcvybAaeVc3KqaIgKL+Kbvu21V+rmISLzoMZK2m77hkMPNjg
	TXSrtrRAxmoiRAHzO1G4Ocjga05AaHkN4amv+ovMVwmB4sfVS/0CPtjCoiqdqtY1HtxXN4dtt57
	mXg8JIMdz0zDIfGFURs96Zkef8s5gi75m7fZC8xMIIKLaVyo2r4GzL6AnGthOH3W3MDe5saT22A
	s37I6MxbYRiBiFcGEA+I/zjjxQ6tQARTnEoKKMwuJr2+8ufjxtP7zz3qm7tpT3TTRXuS0s8ERyP
	ggYmdgLYs7VcWWm+3ioQPLe3TaDYPtUTiSH0FfHnk7gnIEQGdinrb3LfMAhPQ9qNZho82kyJNma
	TRT0i0imC1uD/VGP4mxhGNUZ1NQ+N/MQUqDlySvo/s5JMviSYvcbdFVz3tN/l2N7Lsay4NgNaxl
	AJ2G4J7dhywPh3zMnzX1Q1bkAB7sIWH+jwl4tWh39WuY7YrhXSzaSBh5V8FFzXJxAIHlsw4lmqS
	heZ+DJpWwqfGvB6ASw3SqO4DHp4m3RXRaeUkJB3sxGzhEKcxAyhe4LrC
X-Received: by 2002:a17:90b:184c:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3ae897c4ea4mr14514730a91.55.1793858562916;
        Wed, 04 Nov 2026 22:02:42 -0800 (PST)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.214])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094d572e7sm3539249a91.1.2026.11.04.22.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:02:40 -0800 (PST)
From: Qing Wang <wangqing7171@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
	davichazbh@gmail.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	tim.c.chen@linux.intel.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	wangqing7171@gmail.com,
	yu.c.chen@intel.com
Subject: Re: [PATCH v4] sched/fair: Replace random newidle_balance with Bresenham accumulator
Date: Thu,  5 Nov 2026 14:02:31 +0800
Message-Id: <20261105060231.2701208-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030103916.GV2668564@noisy.programming.kicks-ass.net>
References: <20261030103916.GV2668564@noisy.programming.kicks-ass.net>
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

On Fri, 30 Oct 2026 at 18:39, Peter Zijlstra <peterz@infradead.org> wrote:
> On Fri, Oct 30, 2026 at 06:22:26PM +0800, Qing Wang wrote:
> > On Fri, 30 Oct 2026 at 17:56, Peter Zijlstra <peterz@infradead.org> wrote:
> > > Funnily enough, treating this as an independent variable and using a
> > > random number works and 'fixes' the slope change problems.
> >
> > Hi Peter,
> >
> > I explained this in the v3 thread: on a slope change, carrying
> > newidle_window_pos over from the previous window only shifts the
> > first allowed balance in the new-slope window (512 calls) earlier or
> > later; subsequent balances are still uniformly spaced. So the
> > initial value can be anything — it doesn't matter.
>
> It does matter; you're rounding down. If you discard two fractions that
> sum up to more than a whole, you've lost a call.
>
> Let '/' be the integer division; then (3/2 + 3/2) = 2, but (3+3)/2 = 3.
>
> IOW integer division (flooring) does not distribute.
>
> The result here is less newidle calls than should have happened.
>
> You cannot argue they are equal, you can argue the difference is
> irrelevant. But so far you seem unable to see this distinction :-(

Thanks again for your patience.

I think we talked past each other: the lost-calls problem from repeated
rounding down is already fixed in v4 by not clearing newidle_window_pos.
The position is never reset, so the total number of balances is
floor((initial_pos + total accumulated weight) / 1024) -- the long-run
count is exact.

My last mail was only about the initial value of newidle_window_pos in
sd_init(): it shifts the timing of first balance call.

> Also, the uniformity isn't a feature per se, another thing I called out
> earlier. One reason why uniform distribution can be detrimental is if
> two CPUs end up in a synchronized pattern, then you increase contention.
>
> Now, again, there's plenty arguments to be had why that isn't a likely
> issue in this case, but you cannot blindly state that uniform is better.

You're right, and I'm sorry for that. I favored uniformity without a
strong argument, and I kept claiming "equivalent" where the honest claim
is "the difference is bounded" -- the distinction you point out.

Performance-wise, the uniform version should be on par with the random.
And it can indeed run into the synchronization problem you describe,
but that can be mitigated by giving each sd a different initial value.
e.g.:

    .newidle_window_pos = (cpu * 1024) / cpumask_weight(cpu_map)

That leaves the per-window deviation as the only remaining advantage,
as described in v4: the call count stays within one call of the
expected value in every window (vs up to ~41 call for the random
dice in the simulation). I understand if that alone is not enough to justify
the patch -- I'm grateful for the rounds of discussion.

--
Best regards,
Qing
