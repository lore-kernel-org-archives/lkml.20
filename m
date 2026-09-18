Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7243B3CE;
	Fri, 18 Sep 2026 11:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731246; cv=none; b=qLSKtahvt4ysvGzVl0wv0+YhAJ+PLSSuXM8wKkXuR4OMBubCrDKMiUBO7/mAVHvQn8HYmn1cc5Jn63kja5/Kq4GxihhxCFScywoJy0EfgMvkB0i50Emmi7bEAveISnAhEhFn7mvd23gG4l7vqlpM787rCFM/K95xL/L0SoNU47k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731246; c=relaxed/simple;
	bh=ji9M5JOrSZ1BOh3v4nKo7Rh+g1/cdqfOlPhRj/6WmDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdNNaghfeXu5mzqTBH3NozJNRMU/f7/Poc8KvXIkK6F1PON9xCmqh7JCHzZ9GvrqZIRpX0STuxO8ScUA211o/zZkIECAgDNjW4RW4W+N2Zd0XcwQw4F4zF7LhcUpElVzaMLBzE2ANw4toe5FCzVe01SsuoU0R77QSciF7qW7rEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Kn/30w5S; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Kn/30w5S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7FRw5ULpNBBaQ5P114E0/6MyXpL6gNIbJYRYSOs36Ew=; b=Kn/30w5SqLaw6Nsw9I3aJwiXL2
	4aoAY6QVb4sRUfEUv47Y1nFPpXjModLxia2+gZqiDW5gNhGLaFfIPhsSj1srP2ye7VwJVKcg7MK2x
	QPuHsAN4QEc7EQoWA5eUFxFZuxOO76ZCP3EiLH2cyvXz72s7Arqei8cyLpBRnkXlBUa00GNjYIJew
	X5YWrysVJsjgKgw6zcDejQZfErZMqn4jid68wcgIu4EqZOo/p7hfKObcco+l5DQIOC9HMGZp2c/W5
	bXUwO2iGqpbIMgZVlcS1nL51qvWrkvQ/qCeNjWeR4XbUHa+DFA3qYA8EqZHRJZx2B9kT67LMWe3uN
	kTfjLprQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wqk-0000000H9DS-3QWD;
	Fri, 18 Sep 2026 11:33:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EF6DA300328; Fri, 18 Sep 2026 13:33:49 +0200 (CEST)
Date: Fri, 18 Sep 2026 13:33:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shubhang Kaushik <shubhang@os.amperecomputing.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Christopher Lameter <clameter@amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] sched: Document WF_SYNC wakeup placement
 semantics
Message-ID: <20260918113349.GM776954@noisy.programming.kicks-ass.net>
References: <20260917-sched-wf-sync-doc-v2-0-6d1f107c0596@gentwo.org>
 <20260917-sched-wf-sync-doc-v2-1-6d1f107c0596@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-sched-wf-sync-doc-v2-1-6d1f107c0596@gentwo.org>

On Thu, Sep 17, 2026 at 01:43:24PM -0700, Shubhang Kaushik (Ampere) wrote:
> WF_SYNC is supplied by callers that expect the waker to schedule away
> soon. The fair scheduler can use it as a placement and preemption hint,
> but its semantics are not documented.
> 
> Document the stable fair-class WF_SYNC semantics. WF_SYNC is advisory:
> it can influence placement and preemption, but does not guarantee CPU
> locality, avoidance of migration, or immediate wakee preemption.
> 
> This documents existing behavior only. It does not establish a new
> WF_SYNC placement policy.
> 
> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>

*groan*, why not just a comment that goes with WF_SYNC? All this
documentation stuff is a dumping ground for bitrot.
