Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487146;
	b=c/0j4iIKUjeE5gW+B1GAGYa6N5T0Ki6TWfVw+TQYila8QWc4Edt8O3e0zrWK9Mr2/fKF
	 vGRkH04CMnsfG008B67kI1mVuoNeqIPxoyHYQFEnYmmtOVj3ERXOadi2UBglRIaRfNM/j
	 BJpo83xFGqTrYEefutqs8A3/RyFzgXEzwaYd2aPVkaVpkJP6lQ8YczLWsp7Vng3GlyAQ9
	 4x46Wtqj9SJN747kLEXqbSbXSHSwJd9R135XY4QAyr5DwGvI70KGPu8Um75cld+6c5vpo
	 6ZHP+u1V13RcoWZfAp9ypW53ZFthFhfS/U7u9fwe5yIYfqfgcLemA7nt2SetvaYmGjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487146;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=4zLWZGgkuL5QGLEn/c6m5YMqj6fz95cJUh8MEYG4flg=;
	b=SEl8DRpAfQsbA2NpOF+7LGYj1N+xgpEqtShtdjzIsC4Dbc4ClHasQ6xf+coqWAacoV41
	 GIO9jgY7BqT2ejtXGXJdmCVxrk/ebrKzzxCV5bm3hlik9UgLY7Fk4LU0pgXn6bw6Dvn4b
	 GzJ7lDa2nOuJZ9PR1JOGSla8DL0ONZgD+VNKKh74HqbN/SwW+QqW2vNrOpweFXx7FCtwI
	 heX0irSruw4BDKCR7mbm0oKcVAIYCjWtCq9GUOGx4vMnSFjiqWHKKtLyg136zRs0qEB/V
	 6/Ypc1dMFOdJU/GRGBZxbW9XypL7cCcfyPr/7l8ZszFKF3O5EhU540j4B+8QdsvI/kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=iblguaoc;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDF5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DDF5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=iblguaoc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4zLWZGgkuL5QGLEn/c6m5YMqj6fz95cJUh8MEYG4flg=; b=iblguaoce3+HnY9wIYcJerw9oD
	9ESXB6nOa1eb780W8wKHoHlr7CK8LVT3khPuPDELh5dx1Jd5kPFZWY4H5odhYz0ErzJwCX9GThRC1
	Q+dNt1ZU5bvgNDgte2iWfSA8GhiDnpC0DgeNHfnRDODrY4kMABIioUVrWGA+Sd1jHMDn7rnVqLnwU
	p5Xomt5ihkbymBX2y3bRq+8hSQ4o9MZ933T1x7FeKB6ProuLvIAMpof7u6mddL4AYL8IwWx5r6rld
	BVg5sihi6fn5eCmKX5GbUwjYUmXvRIHlj4GCze1VbuFJ8+OYhDEVhLh+f0TwkTdhY2sAWwIzl31YW
	m5zvI8bw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRU4r-00000007HbG-0g5n;
	Thu, 12 Nov 2026 12:38:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B647430066A; Thu, 12 Nov 2026 13:38:52 +0100 (CET)
Date: Thu, 12 Nov 2026 13:38:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Don <joshdon@google.com>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>, mingo@kernel.org,
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, tj@kernel.org,
	jakub@okonski.org
Subject: Re: [RFC][PATCH 3/3] sched/eevdf: Fix sched idle task group
 preemption
Message-ID: <20261112123852.GE1922751@noisy.programming.kicks-ass.net>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.765325702@infradead.org>
 <CABk29Nujsg7FNY4yJ3Yd0maT0GEtvxacUWvTDiT5HD=-YVqTvg@mail.gmail.com>
 <avMeP-80bZz-zdtO@scheduler.schedules>
 <CABk29NsBzdEYOdLqj9HsrCqO6RzW_G574RzY+=vJp+564R2u=w@mail.gmail.com>
 <20261112123119.GX1813469@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261112123119.GX1813469@noisy.programming.kicks-ass.net>

On Thu, Nov 12, 2026 at 01:31:19PM +0100, Peter Zijlstra wrote:
> On Tue, Nov 10, 2026 at 09:51:21AM -0800, Josh Don wrote:
> > On Tue, Nov 10, 2026 at 6:20 AM Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> > >
> > > Hi Josh!
> > >
> > > On Mon, Nov 09, 2026 at 04:10:30PM -0800, Josh Don wrote:
> > >
> > > > >  /*
> > > > > - * Preempt the current task with a newly woken task if needed:
> > > > > + * Preempt an idle entity in favor of a non-idle entity (and don't preempt
> > > > > + * in the inverse case).
> > > > > + */
> > > > > +static inline enum preempt_wakeup_action
> > > > > +wakeup_preempt_sched_idle(struct sched_entity *cse, struct sched_entity *pse)
> > > > > +{
> > > > > +       int cse_is_idle, pse_is_idle;
> > > > > +
> > > > > +       cse_is_idle = se_is_idle(cse);
> > > > > +       pse_is_idle = se_is_idle(pse);
> > > > > +
> > > > > +       if (cse_is_idle || pse_is_idle) {
> > > > > +               find_matching_se(&cse, &pse);
> > > > > +               WARN_ON_ONCE(!pse);
> > > > > +
> > > > > +               cse_is_idle = se_is_idle(cse);
> > > > > +               pse_is_idle = se_is_idle(pse);
> > > >
> > > > now that se_is_idle() is checking for any ancestors with idle, this
> > > > doesn't appear to be correct. Some motivaing examples:
> > >
> > > So we want to keep the idle difference between groups with idle
> > > ancestors? FWIW, I asked about this but then thought it was knowingly
> > > and that was what we wanted. I'm still not sure what we want...
> > 
> > cgroup properties are cgroup hierarchy position relative, this just
> > maintins that behavior for cpu.idle as well. There was a more
> > extensive discussion on this in the previous RFC, which is how we
> > landed back on the find_matching_se() restoration.
> 
> Well, I'm still not convinced we need this.
> 
> Realistically idle means: "don't care, run whenever you have a minute".
> To then preempt such a task for another such a task just because its
> somewhere else in the hierarchy makes no sense, you don't care about
> either of them, we shouldn't be preempting.
> 
> Anyway, I've pushed out the first two patches to queue/sched/urgent
> since they address the worst of it. We can chew on all this a bit more I
> suppose. But I cannot convince myself that there is any situation in
> which we (should) actually care about the timeliness of anything in a
> cgroup::idle container.

Perhaps even to the point that we should have idle (either the task or
the cgroup property) imply an extra long slice length, much like how it
implies a very low weight.
