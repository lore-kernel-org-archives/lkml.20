Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891375;
	b=VEFnXAyxbmgCqQ5lwM3heDllZqoayJm857vF48tNB/94YTDne7p5whQVfzVgX1CvWWIJ
	 AkSXDfZF1abmwuCBhUSv5zkoI7aGsnSL1CmamymJdU1E1U7TgcTHw+qUX+3+uxFOZGUTY
	 EW9TKWz7RJ8woFsxg0Bn1jXBjubSnScIWW9gAsAMpJC8slArJUlqVQ4fuVKJs0GRpYvwR
	 jwf3ogmMP9rJ90Y83X4lzMER14Pg0kXRgYvW9Qt1tn1DDVLg6aOmlphFlGkxA2FaXaMhm
	 Jv/J3fhvvaVXAZk7gAuEPv9i0UKRLJw1D9lrp2uaNGu1xRd1i/1Z9g23/Z7wlVxgTKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891375;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TQMPLfLA6vid7ZD39lzJkwTV+Hp6CxAnwF9saCyhUJA=;
	b=N+S5ZwZY60A2k1dzju1nhlmFsUFXE9WPDmGLNTFIiTV3Umx9RKbY1+fYGtDfEGyBo/Ek
	 hKy1cAjnmzyWU9J8IRoRRhLc2Vy83HMEHFio+DS5z8QKC+yf8onIl/vxqh+QXhXsdtwNP
	 mJteCGYbj4iv7zzdPYUqojHc2ekFma0CDkqookEHR7Yq7pZhFIYVXsvbOD6aRkQR0ax/T
	 G3GevrA76z/TuDJQO66RLDQltvL2y3+8A0fq1xugFVgRBjJ9dSiTdZ7TQWIJOd+Du4kSN
	 /2xhb4fftFYpldMZzFJtsmp5QvfpOdyfdpJCgKOkCfY82B0jSsshdnm9JdIwVz7SsSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eXGyKZjM;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3DC606D803
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3DC606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eXGyKZjM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TQMPLfLA6vid7ZD39lzJkwTV+Hp6CxAnwF9saCyhUJA=; b=eXGyKZjMuc52IK8ezrkNEZVwPU
	fKp1zVhsu42hqLfZH1tvD4vxdC2hDy+7r35fvMlnw2rcPpkZ9YXzHFhDyeUBnjtMmov9jX1eBo3bF
	uloABgO/ylYxBLfOzkLjvqJg2Ukx6HKvsjFWKu/QgqjQYab5Q6LIocKDBTPMgFItd81wBh6d3DYGh
	tQPTJLFkpdR3IJXPUahmzkHVNUHE6tgf2GLXYJHH2jMUHvoulpG93vRgW+/UCHA9sme3SJPfRtIxJ
	RVrCJmRfoVaPBe8W8PaFsplGSms23lIwCbZaHAuouyNNpGnzbw3TGXKg8srfhqZJIxaDhnAyUHVU7
	AdGT5kqg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOz5g-000000037xr-0BUW;
	Thu, 05 Nov 2026 15:09:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 73FC1300399; Thu, 05 Nov 2026 16:09:22 +0100 (CET)
Date: Thu, 5 Nov 2026 16:09:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Seiji Nishikawa <snishika@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org,
	syzbot+681e729b2cf0d4860042@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Ahmed Abdelraoof <araoof@amazon.de>
Subject: Re: [PATCH RESEND] sched/core: Do not touch SMT siblings that have
 not joined the core yet
Message-ID: <20261105150922.GR1813469@noisy.programming.kicks-ass.net>
References: <20261105101018.GM1813469@noisy.programming.kicks-ass.net>
 <20261105134035.170438-1-snishika@redhat.com>
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
In-Reply-To: <20261105134035.170438-1-snishika@redhat.com>

On Thu, Nov 05, 2026 at 10:40:35PM +0900, Seiji Nishikawa wrote:
> On Thu, Nov 05, 2026 at 11:10:18AM +0100, Peter Zijlstra wrote:
> > Of the two, I like your better for being more consistent -- but you're
> > doing the same thing 4 times, which does beg the question if we cannot
> > wrap that nicer.
> >
> > How about so then?
> 
> Thanks, this looks nicer.
> 
> I tested it on v7.4-rc1 with the syzbot C reproducer. The warning did
> not trigger in about 1250 seconds (about 6100 offline/online cycles of
> CPU 1).
> 
> Should I send a v2 with this change, or will you apply it yourself?

I have it; if only 0-day would hurry up with the current batch of
sched/urgent patches :/
