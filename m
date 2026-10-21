Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587322;
	b=dvvhO8YKyMaMIEOxChc7IrtXmbnuiIwXrnqsqBzcwlsniPRQNVqChfHxEnWwxRGEZVNZ
	 OwJfpqiM9kSlqAyRd2lycTKPCuSjwa2wA8EdP8E/LA/bjWPP/KUfAM8ii5Vs31AeW7Hb7
	 ScGdqhiSbM+wc5BOo9HLMei5Y+o6D+lkF9NN+Y5t9DQNIwWLh4WF0mqrsk2walGp20JT/
	 XVf3tU+p3vVOzh4Yosjq4IiLOCJ9V7V/upQQ1oXYsV9b5WR50EaRgV5TiMJrCSd+ggNBr
	 tqYTAs7ucY8q6YPPOtGJyiZSAjLEVSG2bU8jb8QRfSd65mmJJOxXs0mkQ3JWupY0oNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587322;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=if5Pp2yj2y088Ag6QNc2cMh+tiY6wmDnShBafn5qCec=;
	b=y6vwsc/QaQSJJSMJKCnUBCdOlYdCC78a2DrJvmzmn5zAxz2x5L44r2YdDcNR79nJKiCU
	 bLcfLgBQ0qCOlmGJjVECj4F5qT2CA2hkO+999ZH4cxRfKYhfLYa7bZhj9FuGeRFDy1iHq
	 czeCUFlizeVHILCSDl2WysymB20J8120NxP8MQms155hZcj3ly9OX9i+urpx95ICAhLdd
	 YNJeOLnlAUx4M2dtNnb8VKCyFVwQGKhY6oMvT4GxTFfN6Y9F+YqK4BdgjAY496WDQiuM4
	 ws2r/bu1kOHEccnq0yzF+3f6wgcODQrgm69jlyVdnqO5RNuwinqCfIDgNw9SGU/bJzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=a1dEv+5a;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0271606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0271606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=a1dEv+5a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=if5Pp2yj2y088Ag6QNc2cMh+tiY6wmDnShBafn5qCec=; b=a1dEv+5aUJsidoKLW42UlDYmOw
	oie5FQgFqhk4irawgD98Zb6W1+JAS0HrOb0aj2AtSF5a0FruFpIRnT0AqUyXpYdvIZtgbskP90abZ
	3hnxJYHy3uJYD2Fhqu06kLb0O2x5/4A99QeGWMKKK9lBQC5cJh/NdMTI1fAv3sFCgOTpJq+bH/+tb
	2kJgILj+1kSyqmLXdolS1JAdcNBkW7cp7C4ptAaQrZ34eIkxOSWC7BOx9oW8nu95AJNSnS9VLEwHY
	DCWWXGeUEyv8s8KjeWltIi0xtJSHTAEApfLmPb9HCi6lsrJZTmb5ezMZsrO7ikMHDWFPH3X33mCDE
	pVYCkI0A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVqe-00000009Id2-1TjN;
	Wed, 21 Oct 2026 12:55:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 08050300720; Wed, 21 Oct 2026 14:55:16 +0200 (CEST)
Date: Wed, 21 Oct 2026 14:55:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, "Li Wang (Hieco)" <li.wang@linux.dev>
Subject: Re: [RFC PATCH 6/6] sched/docs: Add documentation for SMT Buddy
 Assist feature
Message-ID: <20261021125515.GL2823843@noisy.programming.kicks-ass.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261020083746.37068-7-likunyu@open-hieco.net>
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
In-Reply-To: <20261020083746.37068-7-likunyu@open-hieco.net>

On Tue, Oct 20, 2026 at 04:37:46PM +0800, Li kunyu wrote:
> +2.1 SMT_BUDDY_ASSIST
> +--------------------
> +
> +Enable feature:
> +    echo "SMT_BUDDY_ASSIST" > /sys/kernel/debug/sched/features

NO! this is not an interface. Note the 'debug' there.
