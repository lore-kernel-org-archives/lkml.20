Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415185;
	b=PKtFGYYXhJaSHghZr3yGl46Gb3eV9v4cJ9vufW5bjN6RJ7z7tO6Kn56pgXP/cYIk6al0
	 C/BXqcaDR100eVyRS9UZUFObx0EHF0Q4b/fR7h76Yv8SK+b9wETlLCUPFmc7YCLK6Lvs8
	 AUdSniBL9Jz/2G6bnMMOAwi8kzQ2YC6be4xx0HmZLOOoWkxsv5/sxseNAUjxLHfdIvbA1
	 HF5Ppj7natfo49r5eQ0N8VIPzlT+0rPDJTQfuFpsOR80IGWaIzuFPerjWc8X3rDjo0qNY
	 8ZHceNHefTacB/yLp5O6kyBGFT4xQtrCW4B6r0IPDDufGsYrcGAYJkK6YQ3BSoaVlRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415185;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=N0DGKa74MD1xd5Zo/tRscMhAyFtbUsntD03rjkZ3mD8=;
	b=a05kouwQI+lLartO8zk2ctj/kL6OYsOyLMDS1uhO0VqYYAOBBjDuFXPEcRTwvHvYfoeP
	 iAJ7WR2znZi5/vvCvayMSgAChuKP/kxNwGi0Ix3UYcLUljALWWnc7wBdgLChUGMGfT2bU
	 XNFzkMTTvq1E8MNTKBGFkVOeDdE4UHQd4JWZ/Ul4pKDnBy3g6UuqAxL2YcvbHgJP0D8SZ
	 6GSYtInWfzVvuhczafyjUdiaHAr/Zhpp1oyWhWJMNnp35hHtxQLfbO+BngwnRpznvtwRK
	 82ZKkGrrqoQXbMocAZwrARrhcK7Wa4FuEG6oV3xhFMx0sr8lGGMutoiT6Av9ONdcH7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oEKNDQr1;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DFE606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2DFE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oEKNDQr1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N0DGKa74MD1xd5Zo/tRscMhAyFtbUsntD03rjkZ3mD8=; b=oEKNDQr1tQeJLrU9u8VMgW8UZv
	pyfIFJW99sLkcptx6dmn6zomTkYwgb5vf0kmoTHFPMbrAEFzdEAdFIY/E5/Op1JO/KujkSDA5a9bI
	ubnt+e96M9vJUhsF+8CHRnpWUgnz0pWTY0oY3ovkrWosnbwEmZ4ckK1flt7RTF6SsmOy01pyWjmul
	Ut/qICWbTtr2tYdlsDZVpCKTqgCaM42IM7WcS17yDSAC5PaYfiARiGurvmZh+zhhBujr9t6tHlA+t
	ALcyep8S1Z5CuC95tKyRocIi27NNchMlPiKENjQl+SDm/FylHTf/AWoLAc5UYvR85dN1DicDFhX+G
	McaQIr2w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBMH-00000009LK9-09U8;
	Wed, 11 Nov 2026 16:39:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EFBA6300969; Wed, 11 Nov 2026 17:39:35 +0100 (CET)
Date: Wed, 11 Nov 2026 17:39:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, tj@kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 05/12] sched/core: Abstract/fix
 rq_clock_start_loop_update()
Message-ID: <20261111163935.GV1813469@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120207.242460109@infradead.org>
 <avBDWS-AY6QQtCuH@scheduler.schedules>
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
In-Reply-To: <avBDWS-AY6QQtCuH@scheduler.schedules>

On Mon, Nov 09, 2026 at 01:26:24AM +0300, Kayra Cizmeci wrote:
> >  struct rq_flags {
> > @@ -1938,14 +1949,14 @@ static inline void rq_pin_lock(struct rq
> >  {
> >  	rf->cookie = lockdep_pin_lock(__rq_lockp(rq));
> >  
> > -	rq->clock_update_flags &= (RQCF_REQ_SKIP|RQCF_ACT_SKIP);
> > +	rq->clock_update_flags &= ~RQCF_UPDATED;
> >  	rf->clock_update_flags = 0;
> >  	assert_balance_callbacks_empty(rq);
> >  }
> 
> Ah you changed it here. So I guess you forgot to change it in
> double_rq_clock_clear_update(), no? :-).

Yes, I managed to completely overlook that function. Grep must've been
broken that day :-)

I typically use telescope-git-grep.nvim, oh well.
