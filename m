Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930423;
	b=zG+2e2Lcef/UGph05KDUFyIRqeZKzaPbpIQy3GTauQV6MeFHxlbuT98aDFPVAOIhgTK0
	 N4okn5VndWpYlgvBkcM/5GpqUSXBmpfPJldS0OZu6p4HCZRtp7PagYU2iOBv2pr/ovIO6
	 jBpMUJYmPQ+xBczKDeje8lYhkHSHRxgxNKlKDxQX12TnYDTPY4dK+SVMU9va+N/ail75+
	 pRTB+aqe9M9RKykYuXGi+yZR5yn+4sU0oI1QwvA34coGfNywifoqscfXqEWcmGGFFp8gN
	 MvyJoAPoiJxF8t+pZd3I2Krc0cKjoHfX/TYXQuMZNncBb9mUI9BB/InqBhA8hTFTJ7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930423;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JFRD0CRAYZvHNjFPbyksB0QTcivDl9S2CuWxhRSo8oQ=;
	b=r2x+esWK+ebTEC+UeTWLZxN8Ik3npKe8ZTIpsxu4FnzJfdSl4jmTiSg5eLYgiEJDbKiU
	 789xzYPGH9YnyOjTJGmoI0y5ZRxZoA1glxV6QYv2BPxBBGgApnh0gFYW++1Wkm7v6CFzD
	 P8CkNH9dmGQSXXyzXnTSwWmSqyb/FTghtrOrSeRPrPVC4nrKg9xFySrMog9WeizEjYK84
	 VBt9izpqodJH7Cn1iKFB5ROeDc+SzoE9+T/3rlY5iyiOtdY827Hno6jMXjNeYsFJO2UIX
	 8UJvZyzTKkI5o6ASHMXLCMJxLnjgffG0XgRwrqlafgaNWCvdEJikVw3RdTzLW5QoCXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=I1QbfMFe;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D2F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D2F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=I1QbfMFe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JFRD0CRAYZvHNjFPbyksB0QTcivDl9S2CuWxhRSo8oQ=; b=I1QbfMFevmvtf7itt5JvPSdxAw
	efQOxrPA2Ox92QYSWFfFnI3XDmp0NBveRvSUuJpoXrL73wvs+C/Hrwzko62J0y7322yyH67t6CYEn
	d5DwbqdFk3/pe6tJwQbDlW68GrmU1k2DVy03CS0SMq+gqYVZz6g/zAtKNwijY14bk8Np8qPn3oFqQ
	qiqYvMLSSuvK6/YzZ2BHKKvNqPJn6zkjoQHd/B9d+WHAbg3dN+QBB/6B8Ea3bLoXaY4Y3mClGvmTU
	Ypr8NmKDC0HI6s9MT7sAAcv8j2UabY4Vh8p/k004WVMO3JniKnQswbMDVy99b2tJvQrghWTjzBHS7
	5W5W1wXg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLOb-00000001jnM-10SL;
	Tue, 17 Nov 2026 15:46:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C3828300708; Tue, 17 Nov 2026 16:46:56 +0100 (CET)
Date: Tue, 17 Nov 2026 16:46:56 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Qais Yousef <qyousef@google.com>, John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/pelt: Skip redundant decay and divisions when
 sched_avg is zero
Message-ID: <20261117154656.GJ1813469@noisy.programming.kicks-ass.net>
References: <18e8d60c92652608.3137322e32332e3235332e313736.371783.0000sendgmr@google.com>
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
In-Reply-To: <18e8d60c92652608.3137322e32332e3235332e313736.371783.0000sendgmr@google.com>

On Tue, Nov 17, 2026 at 12:50:01PM +0000, Chris Wiseman wrote:

> +	sa->load_avg = sa->load_sum ? div_u64(load * sa->load_sum, divider) : 0;
> +	sa->runnable_avg = sa->runnable_sum ?
> +				div_u64(sa->runnable_sum, divider) : 0;
> +	WRITE_ONCE(sa->util_avg,
> +		   sa->util_sum ? sa->util_sum / divider : 0);

This is micro-architectural.

Gemini is trying to sell me:

				IDIV latency (32/64)	Branch mispredict

Apple P-core (M4 tested):	7 			13-15
AMD Zen[45]:			10-13 / 15-20		15-20
Intel Golven Cove+:		12-16			17-22

So on these architectures it is more expensive to mispredict than to
just do the division.


