Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400293;
	b=f4M0eN+vk0Wa6EFE5ijPMoRgUvy7aR4McVuaaInBCzW0tAXbAAC/Y0dL7rWz8JerptrJ
	 gV1ET1FzmDiTkw7vpc3ucmk0qVnKI8prEOf1P/785GbsRYHYkke21Dv+ujRCjjEZX0yD/
	 bGfsSRcYFvuYhbOiTK68ucIiZ7X4b0L3plTDOw7riSvQSbKH8CUzkiHj06sElWqRLj9dq
	 JBXnqsZoKEVTTTPvd+q3iEe+FmwMeKcTQVql5cHCvBAt+6xOtYpi5cv//QoPd4x9408vU
	 9XjGl9ynb0TFhcD+6esL84YJdbMMPkk7hVNezbquUO894/sOjz2UsE+t1/QFxeYzlPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400293;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9PwwTo9/HuoiZZpTba89sDu/cM6+u1GZw2VYNJUEfCI=;
	b=q9Xjkg52yJYIweBxp6kN6S2r2oAzLzjZzYWc6pqGFzNvY223SahxBEnATfkovleG9nr+
	 c402j1nGtcIdyhCmksxnyZ307duIxFmYVeW/7x7qn7YyOIO1nfExOh8nf3daH7HTlq2RR
	 zr6/mNiQZp06Dfjmteygfq7q5+CXLQjgHZzoQM7KW4cNU0QM4y5G+kuJ1QZyjwY+KyICL
	 0TG+9PBow+e+eOkRznRIvkqWlNyCOLZMTLnkosarQ7Wmkkny1OpvUl91wSFDo8siOig2n
	 X4r+rZ/jeapipr0WBCB/Ez88PkA8tTjVPUVvcxiEgEIuC2Ug2FalKS3Cpqp+DLsNitA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=R5zy21t9;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EDA606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EDA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=R5zy21t9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9PwwTo9/HuoiZZpTba89sDu/cM6+u1GZw2VYNJUEfCI=; b=R5zy21t9mHOmsQUaei6N4Wq5WK
	riLQIaYb1g5TvUzvVGQeGwAgaSq6hXvsErJj/eZVh/z0KHwbhm1LgSNE47EmixYw0xehW/IUj5Mym
	eX+HXZKHB0fx2CMl7hTMGBC/E6K/jyQmp7hBeoRHGrXzkXFSBj90tA/v4V+9Qx04elOV64qX7FF+0
	B+RdBsjXB0q1E29276jkrPpgiNxaBmULrOUgLzXPwONc6NyqQbzcVhmcj58FTP/WFA6D2g7J5zGkw
	ldEkm3VceLwbk5/IiIp8CTLyRjoqOm28jQ652NPxsMF6XPSpbwoASvC8yCiA8ZUwvnrnpCAXAMNup
	YUbCyI+w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7U5-000000097hC-21KS;
	Wed, 11 Nov 2026 12:31:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0077B3005AF; Wed, 11 Nov 2026 13:31:23 +0100 (CET)
Date: Wed, 11 Nov 2026 13:31:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 10/12] sched/fair: Reflow pick_task_fair() / newidle
Message-ID: <20261111123123.GN2668200@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120207.891592828@infradead.org>
 <35385d363689d515faa172d876170417@kernel.org>
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
In-Reply-To: <35385d363689d515faa172d876170417@kernel.org>

On Wed, Nov 11, 2026 at 01:02:45AM -1000, Tejun Heo wrote:

> an rq which it already updated now marked as not updated. Maybe
> double_rq_clock_clear_update() should follow __rq_clock_clear()?

Yes, definitely. I seem to have completely missed
double_rq_clock_clear_update() and somehow my test run; I promise, I
did one (although I didn't test sched_ext at all); didn't trigger
nothing :/
