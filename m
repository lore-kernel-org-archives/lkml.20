Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416934;
	b=p6JSrwRg3orEdpWqGTDw0EnbJolZnd1ht6y+gIXx1giGqTqLDcT9PkMKd93rUKbWGGOR
	 /bOKsaA/1ZzlxSFUNqWMftihjjxnruwcxDk5v8eKWDUAqjQFtf3KjbUAN2H2XsQTa2lp7
	 4qbWaECDh9FaNuc4zgaUFnGH+hWcDqyMac+Ley8aP6+dML6dB455M9hiv3NQrdLgltiQP
	 jkj4RJPX1SyqU558tvh2Fk2wNglt2fRuWkzFiG2pc2ZN5DqZgmp1Y4AnVue2HaMXzV6j9
	 pj22DJc0y/J1XEnHFYJ8tYTxJZ16R2ksr7baGL3dgheVEsT6/znZg5MCg8cdtQgnYbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416934;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2xL4JtPCxQMrloSFtgUXRRA0C1tin+Ad/A0jd9/bkYM=;
	b=fnBO1YVOyvSDpUWiSfgva6OxjJB/w9i6cg0kC52aOtHiBJELyYy0XIIPUgzL7Fi2Q/7S
	 2b5kslxqeMlfWMvGPZxa9RiKqQaOgFrueA5tfoAQSoA32Wf91tJ2BsmTpgxjk7bjzd/R5
	 j1C48lf2+eANGojOUtFucxIOKz9D4K+7SOmaD3kJ7/H8yGW4ELtSy8kRzQ64/0B73tsV0
	 qbyq9VUp4PScUuD+SeTLeV+PcOfoxkzfuW6dszLRJKaX8NM0PWukT/OfWeiR2TH1owdQZ
	 1PfVbHqYzLrKnkpj58l31i4SfnkAsK1ibhYgdfKoH4oL+0JtkfCZiacUOvm+3+8N4OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wj1eHP9U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD6E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wj1eHP9U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041BE1F00A05;
	Wed, 11 Nov 2026 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794416934;
	bh=2xL4JtPCxQMrloSFtgUXRRA0C1tin+Ad/A0jd9/bkYM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Wj1eHP9UoXTLuWIm/oSXJhzBG5YDS3gxfc3S5BvwnqcFW3Bv0gagP0+Q5Y2ieQC7k
	 YU/YrHYvys9H+WIrCyXb6F9hDKNxLiyqwu9vj6AIGJlwq/6dUzI3xtiy2NI/TqMO14
	 gOy3CJHX9PKKpuXYQtNDHTFXuXKEHtuDm/35phJ2ofAiDYZDUB7hiF/eh6BsdHEjfv
	 773IvUYk41TaVhTNtz3l7judE27cBIq5SA9DOUEm7Ypr8xgwatZCms8f5bayXpc4vz
	 HG+b2YApGmlmVY4ByHRBagKVSa2aUZH3gFrze/jzdtZ3Lz6S1bCX0fsVUMGTTyYW1Z
	 6HhopJcAiIMoA==
Date: Wed, 11 Nov 2026 07:08:53 -1000
Message-ID: <0129fb236b7c82b5a5200f476455a46b@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, ziqianlu@bytedance.com,
 Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v2 04/12] sched/core: Make __update_rq_clock() skip updates on UPDATED
In-Reply-To: <20261111122524.GC2669272@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org> <20261107120207.126979364@infradead.org> <3ac37e055b66a46f72edd235f1e93f5f@kernel.org> <20261111102817.GN1779021@noisy.programming.kicks-ass.net> <20261111122524.GC2669272@noisy.programming.kicks-ass.net>
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
Content-Transfer-Encoding: 7bit

Hello, Peter.

(cc'ing Changwoo)

On Wed, Nov 11, 2026 at 01:25:24PM +0100, Peter Zijlstra wrote:
> Notably, I want dequeue and pick / set-next to have the same timestamp
> such that the whole of schedule appears to happen at one instant in
> time.
> 
> For ext you've explicitly chosen to not do so, per the placement of
> scx_rq_clock_invalidate().

IIRC, that wasn't to get a fresh clock after each lock drop. The goals
were:

1. Use the cached rq clock to avoid reading the hardware clock in most
   cases.

2. Avoid reading a really stale clock after the scheduling session is
   long over.

The invalidation is there for the second. With the existing code, the
cached clock can stay around long after the session is finished.

If the core tracks the session and whether the clock is up to date as
suggested in the reply to the cover letter, scx doesn't need its own
valid flag and can do what the other users do. With the rq locked and
pinned, update the clock if needed and use it. Without the lock, use it
if in session and up to date. Otherwise, read the hardware clock.

Thanks.

--
tejun
