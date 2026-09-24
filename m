Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3644248B2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244334; cv=none; b=HtsCKB6E5EId2tByRswBD7KtKisMzBZHZfHpdiobtSfChmKxI8UQmXjel/27UiFfKy0914lFpGyof6e8+4nyG28P4ygLJerLi0+jN+A2s446g7qaAmF0dsonxqE9x+kRxi/pISHr7SBGDTL3V8wRvwFNhUcFYLCFSK+pk7fBsjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244334; c=relaxed/simple;
	bh=YSeOZbycv01BwSJahdAB6QqLIHFMPt+kNhyjtCbM2qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QafCE8WCQOA8pvcFVHIc+tqt0fwPvJnTr4eiCnn+QM2xMF5LEjsd9n5sVVgm5SJCWQiFU3QOGdHFyFe1TiDapmncehQpLXCrmM97l5bA4iBFD5tqrNWL8Q8waVkGCciGokOYm7JDPfSxnjFfFKFRGSJumVAF0lyej08+N9/uAQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GuAA0c+G; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GuAA0c+G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pMlDbFY1DrOFbR3JyHn7RHNElhrPb+lBIPYkDBpaonE=; b=GuAA0c+GhXrInyDCg1NwZc36fo
	4C03HtX7D9B+gkyuCDIYIXAih8o0RIwoiWhCJ1DOja1bL8iMaQ/M/T+4+2TFLZXYBCQjV4MWEd4dH
	PLZONK619i+ZZMdXqZ0Wppdbn0eMsGgPMO4aAvAx3u61dMWlJCnV0yxgsgce0sxGsFV0FE7kl3Eqa
	l90z6g/eliADm5K0mre3swQn3bdWA9SNDKTKDBGoC4NEwLbthqkgArARrYrmzRdMTUL1aC0QhyyY7
	Sik6BLJ+E+Xi7X8UjHvSHRphwilL7VtuLsjEJ4a1LJEruWx2XAJZl0pjNKhST9ym5xpLIHekHFbrb
	DSxmK89A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9gKI-0000000FopH-0Yyj;
	Thu, 24 Sep 2026 10:05:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 432973008D6; Thu, 24 Sep 2026 12:05:13 +0200 (CEST)
Date: Thu, 24 Sep 2026 12:05:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Christopher Lameter <clameter@amperecomputing.com>,
	Shubhang Kaushik <shubhang@os.amperecomputing.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] sched: Clarify WF_SYNC wakeup semantics
Message-ID: <20260924100513.GE4121339@noisy.programming.kicks-ass.net>
References: <20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@gentwo.org>

On Tue, Sep 22, 2026 at 02:57:05PM -0700, Shubhang Kaushik (Ampere) wrote:
> The synchronous waitqueue wakeup comments currently state that a
> synchronous wakee will not be migrated to another CPU. This is not
> guaranteed by the scheduler wakeup path.
> 
> WF_SYNC is an advisory hint that the caller expects the waker to
> schedule away soon. Scheduler classes may use it for placement or
> preemption, but callers must not rely on it to prevent migration,
> preserve CPU locality, or make the wakee run next.
> 
> Keep this contract next to the flag definition, remove the stale
> waitqueue wording, and make the locked helper refer to the unlocked
> variant.
> 
> ---
> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
> ---

Thanks!
