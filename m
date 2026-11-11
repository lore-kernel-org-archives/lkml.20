Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359489;
	b=v3YvvymWh4icoTloyahZkRhnELw4O+GpcrABfR3qmKWj18vJT1ibATR0e4ChRMWQAz1i
	 sfoSAwW/G6pBG0A9jTCBgKj4y9tTaorS8N6EvndkMMntcXG9F9N80JcZ6wdVOEWjXf7V0
	 0ibuLtUr8DNsyqcbYwKY5JUS086h9TUq8RdfdH6J0Q/MLBWf8+9uWYJErV7/+v1emz4Lv
	 2huv6WSHsSuECnaXEmN2eliffAEPn4MRJaHr2/VzMyptj9kicgnyMyFgJkQWOP2dtUuOH
	 UWe4vvYKwVXocH6r9EhF0S/wTh6kI9co2zcxgO2uhg42d7fzvfBtQO1q3WTpXow1gDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359489;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sacFON38Zqc0y3/J2tRgjPnVF2lQtxza0CfI8l1J14w=;
	b=QaaTq0t0TC/ZNDn0Au0hbzePBfjJYwlccx7PraD0mwG5UD7ngm7UMrAzj3EKxXWCCbf7
	 XFkLwmbvYpi1gWi6LSH0NhnEOI055zhqHb+yjlmD3K3It7ghIV1ainSB9S52H3E7M0u3J
	 JnOv9ygKJfMALxtWYYGIML2QQHcbsxjKL8JnN5R576d1D0p9C8JZsqP+pyxIIQ2mu06dS
	 dtK72Qw669M24SkLSfq2azx0obdZ5IdfnqNui3TOFQWDf7kUll0PYGXBs5HUhuDtJCXOX
	 PXxJk22E7QfZpRhP+4Mo+xRdZsQASxbX5QRimfNA0ae16Xo3FRFe5n7NrdGlsQzbGzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khPm8Q3l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B04606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khPm8Q3l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0D41F0089F;
	Wed, 11 Nov 2026 01:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794359489;
	bh=sacFON38Zqc0y3/J2tRgjPnVF2lQtxza0CfI8l1J14w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=khPm8Q3l6F4l9V4rcj12Iu8e0Gak+NZZJR83Rr5qogwDtvtCmtOPxisQE0yU4d4zs
	 uJx1sep3ZEUYayqkaZJEhVem0wZD4rJm4W/k0i+BMhH3gP3ixS9+khNvHdrkne2Tnk
	 6xsBAH8CRhF+Ka+f5mWRb79956wzAU1EN0phtKkX7xKH4SIcgD+1YyEXSImSKr5daL
	 j/d90Ot9YMP2Up+WZF1rJIERAlcudbis8eATnIikfHVBXZSufMLOJhfsd35Q3rUnHx
	 0F1jfCUKi1oNoionkI6zwyKU0hUTu3t7XQHRkdZ1G07CnQYJ7lvDVdy9lVSYWPb98D
	 tE0jS9RBu66Bw==
Date: Tue, 10 Nov 2026 15:11:28 -1000
Message-ID: <3ac37e055b66a46f72edd235f1e93f5f@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 04/12] sched/core: Make __update_rq_clock() skip updates on UPDATED
In-Reply-To: <20261107120207.126979364@infradead.org>
References: <20261107115913.261163891@infradead.org> <20261107120207.126979364@infradead.org>
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

On Sat, Nov 07, 2026 at 12:59:17PM +0100, Peter Zijlstra wrote:
>  static void __update_rq_clock(struct rq *rq)
>  {
> +	bool update;
> +
>  	lockdep_assert_rq_held(rq);
>  
> +	update = !(rq->clock_update_flags & RQCF_NOP_MASK);
>  	rq->clock_update_flags |= RQCF_UPDATED;
>  
> -	if (!(rq->clock_update_flags & RQCF_ACT_SKIP)) {
> +	if (update) {

RQCF_UPDATED is cleared only by rq_pin_lock() and
double_rq_clock_clear_update(), so a path which takes the rq lock with
raw_spin_rq_lock() inherits it from the previous holder and its
update_rq_clock() is now silently skipped.

Previously, you said to clear on unlock. Why not do that? That'd be less
confusing overall.

Thanks.

--
tejun
