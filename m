Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482216;
	b=i0NqKJcqh3zBEUqXbRLMucqqgOVHKfKzdGbC3EeH8D8s94ga0tz26JFYFRCKOotzPuWq
	 JuqSWDiAPDfxkoV9CQOoQsSPdhC5LhBJWJuy5NsAA3SzBGVlyCEhwoU+GVV8X/tUrew/E
	 f5tOinPw4hm2Rl7Q1k9ySbnYBfkZgzxDkYVAd2FN/mzDxiFOZ5r7ZOXP3t7X10wf9eyTS
	 x23PT9L/5csjoNeim/7cDiKxDKs/SfJmq0sTNJS1zmBOS0VKIDy7+mocZa6VG7vOkfJCe
	 btbzBFpSo8XW6sMikBnAKn6lV1d8S67Y+EBpvJK2zVTErj32Arjuk3TPlwjltLNlhAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482216;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=r9Luiy9pcz3o5siDNpoXL2tithCSCSkKKGJObmQjB8M=;
	b=qCsw3yTH7S4bvRJkB7CQTyt3tp8Opaf0NjJqwtbgpM75h/ZLlRDeDEFaVsRaSZ0iLlvT
	 Qaj0drXUSanzS0kXU4ZM/jfdsZaiA29CFM5ZpcNJ9UaNA+2AOTkX0yoUag7YSMuEHn7JD
	 RVhM35sut5Y+njFFPexh3f1mBo72c/0vP8sKZa+EQFd7ihZ4lRk2srds6dJVDZRFDGJdc
	 7ampuaha7reWLOuAeE27T3zNk14VwcFCXy4rTdQ6gsrXW/eeI8ffQNO3mgaJ42mpt98cl
	 mkQlKLCQxrx2D4Vi7qJVkdh88zJ6kL9p0QiP3+S/QzeKAcjGwpsFJFP2C+0bAlbMTcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=qPRpxXsV;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45432606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45432606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=qPRpxXsV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=r9Luiy9pcz3o5siDNpoXL2tithCSCSkKKGJObmQjB8M=; b=qPRpxXsVlaPOa0MyYcKJ7CBBdE
	OyAQ4lIo+67src7Wkylkiw9JR0ggxF3bbI7S0pWBlmr5emNL2xIc5q8lnebXH1GFVJWczkTEAz8ba
	2lzSHHRNkMaPJmej939a6A/e7lCtwbeSHQk734p79OV4adVoHdUyOsRY3JGzWbj+mz2nK/evpK1w7
	6l5mlu2V/P5g/3O6whuWgfKgbnoYq5/TUxowHgiAG22/OhwkwsFsqxqCeLrgceAVzGu5wlyGdYnCv
	cLoSwXvU1XYEo8zADyDWktT9+O8//sWZoxckA2jv802CjlLmMmmy1LUCjip9Sz4TKOpuDgwyfil7p
	yTJjQ9Aw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSnT-00000006ayn-05IG;
	Thu, 12 Nov 2026 11:16:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1987A30066A; Thu, 12 Nov 2026 12:16:50 +0100 (CET)
Date: Thu, 12 Nov 2026 12:16:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH] sched/fair: Avoid transient double accounting for
 delayed tasks
Message-ID: <20261112111650.GT1779021@noisy.programming.kicks-ass.net>
References: <20261112083447.25603-1-kprateek.nayak@amd.com>
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
In-Reply-To: <20261112083447.25603-1-kprateek.nayak@amd.com>

On Thu, Nov 12, 2026 at 08:34:47AM +0000, K Prateek Nayak wrote:
> When a task is delayed, h_nr_runnable is adjusted via set_delayed().
> 
> A dequeue of delayed task with DEQUEUE_DELAYED would decrement
> cfs_rq->h_nr_runnable again in dequeue_hierarchy() and then correct it
> immediately in __dequeue_task() via clear_delayed().
> 
> Adding:
> 
>    WARN_ON_ONCE(((int)cfs_rq->h_nr_runnable) < 0);
> 
> in dequeue_hierarchy() after h_nr_runnable accounting is tripped
> reliably during early boot.
> 
> Although the cfs_rq->h_nr_runnable accounting is transient, this
> incorrect value gets cached in se->runnable_weight and can affect PELT
> calculation until the next enqueue / dequeue adjusts the runnable
> weight.
> 
> Similarly, a task enqueue should never reach enqueue_hierarchy()
> for just ENQUEUE_WAKEUP && se->sched_delayed. Wakeup of delayed tasks
> must couple ENQUEUE_DELAYED which gets correctly handled in
> enqueue_task_fair().
> 
> Avoid incorrect accounting in __dequeue_task() and warn for
> incorrect wakeup flags if delayed tasks reaches enqueue with just
> ENQUEUE_WAKEUP.
> 
> Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>

Urgh, thanks!
