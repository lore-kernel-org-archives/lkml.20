Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356767;
	b=OJtBP+sE1dHPo6y5FJn4Jn5nisM1eVeg5ARzYT6CE9YPZIZo3y5UBuQH52nw4yiN50CP
	 vN2k5/U1iM2UPo8VEwNW4Aw17HEklqY6ZdBBq+KXLS9DdIvTmqLIbAY6p/GtH99pvkyU6
	 QUCJ5FpPUlv6FbWVR3QZrGZm1fAJVAHP52ECg+96qbn/PsKpjTRp9zYs1z31kXOykYEBW
	 OQJMQLPcbsU9MXH5M7g/NtscFIP2YC3Q014puJ41ZAjivT93Dkf9zxjYB8W//nhKaZxuj
	 W65yRzdiNt06QUzsp57xxpFxdBe3K688Uj+EdqvglhCnacIcAl9KdRcKtj1VVTQkB5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356767;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=wjG7FKcF6DVIebf85CftR2JZDuCPKvbO2fDSgQ7TNGI=;
	b=u5Sgo8OdYMTXUOoKHMQBdEiP55pIx3I0AOkc45iTKul/DSOXyePKKzhxcY/KxMQnUDcu
	 xSXfRR0itCVdUDPfECpqJ9PRarbomKVhUapm0V0hInvR8B3PpaYEVy1WxXZ8dWBvqYSh/
	 GaQN90bH5PQY6HfgNI5DzzCtPTCSXkWrhdRm/lbzFX+z5T/dvKywydN9S0gCB7Ko/dWt9
	 G0E/R+gGqKA8rI9Fm8JrpeoC/WONp2Jlq2R0+MQY41Vt+58SFrVSL0iH3TMGk4vOORidA
	 6QIht5Zg4zzhXClQR/yhOE9R1DzPVo9QvctIbVh0vPirQw0CmQASDWPbijvQqZqMI6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DIufyy0l;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35980606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35980606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DIufyy0l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wjG7FKcF6DVIebf85CftR2JZDuCPKvbO2fDSgQ7TNGI=; b=DIufyy0lzL8N/D2Ao3OItTiaPS
	V0K6YxP1xJoaB77n1JhmRoPsB1Kc2vYGedOva0IfMWHZi99+G61H62/k6vHlKTLQFwCo5rXq3pAqM
	WLCByLdpcnzVBBBwMvYO5g97yBSGeFuR66ONDfOSIewuGopbASMBKZdZduLEJihKObnuC+tH7W35q
	SM6J06ypFu9JUTBWjePKetOimLJ8/KuSdtKYQQO5nc5hfnBPa1AhVMn0CnWrjl34n2QFTD4GbtTkL
	VW0ji38tfFLkv6tW9n2WYMU+JfBYT3KgCKMjjoMyFwjDDl1X3KRVu1yVVUvbkXhLRcvgHh3D1jowS
	5cSX1PzQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk10-00000000EY8-1mrn;
	Fri, 30 Oct 2026 10:39:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CF2873002D9; Fri, 30 Oct 2026 11:39:16 +0100 (CET)
Date: Fri, 30 Oct 2026 11:39:16 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Qing Wang <wangqing7171@gmail.com>
Cc: bsegall@google.com, davichazbh@gmail.com, dietmar.eggemann@arm.com,
	juri.lelli@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	rostedt@goodmis.org, tim.c.chen@linux.intel.com,
	vincent.guittot@linaro.org, vschneid@redhat.com,
	yu.c.chen@intel.com
Subject: Re: [PATCH v4] sched/fair: Replace random newidle_balance with
 Bresenham accumulator
Message-ID: <20261030103916.GV2668564@noisy.programming.kicks-ass.net>
References: <20261030095630.GJ2668200@noisy.programming.kicks-ass.net>
 <20261030102226.2501158-1-wangqing7171@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030102226.2501158-1-wangqing7171@gmail.com>

On Fri, Oct 30, 2026 at 06:22:26PM +0800, Qing Wang wrote:
> On Fri, 30 Oct 2026 at 17:56, Peter Zijlstra <peterz@infradead.org> wrote:
> > Funnily enough, treating this as an independent variable and using a
> > random number works and 'fixes' the slope change problems.
> 
> Hi Peter,
> 
> I explained this in the v3 thread: on a slope change, carrying
> newidle_window_pos over from the previous window only shifts the
> first allowed balance in the new-slope window (512 calls) earlier or
> later; subsequent balances are still uniformly spaced. So the
> initial value can be anything — it doesn't matter.

It does matter; you're rounding down. If you discard two fractions that
sum up to more than a whole, you've lost a call.

Let '/' be the integer division; then (3/2 + 3/2) = 2, but (3+3)/2 = 3.

IOW integer division (flooring) does not distribute.

The result here is less newidle calls than should have happened.

You cannot argue they are equal, you can argue the difference is
irrelevant. But so far you seem unable to see this distinction :-(

Also, the uniformity isn't a feature per se, another thing I called out
earlier. One reason why uniform distribution can be detrimental is if
two CPUs end up in a synchronized pattern, then you increase contention.

Now, again, there's plenty arguments to be had why that isn't a likely
issue in this case, but you cannot blindly state that uniform is better.
