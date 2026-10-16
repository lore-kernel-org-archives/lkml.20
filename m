Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612E9224AF2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141325; cv=none; b=GUIo61klvnRWKxWYOZEgJZRODDTUvhZNDmIGfs2YqU5m6l/5LN/C1Lzj+4ZfjHQ2XnF6pnLLmVDvObkHiKkPnOFtRc97Bs1lQ9vFgj56ID0OPaZEbnxDnunn8+GuoJcbBDzp0mdthepGGSyPVbJhlBE+A2r2Y4VOcYdrH73K7XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141325; c=relaxed/simple;
	bh=Bf46WCzkGd/LfG6GQ6o+vfWwuVX8SQhYikekptGhfW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GK2jaJl+XSir49FDtsFx6CvWn/Y0fgUSXiIDxqEeVqLPvbGaddAcFuxw4q2j34kKgmt5R+NxXdsN1krcAmQhc8qGD2XsuFYc/TrrevFufXxKwQy+I61VNYcnJkJ2as4yTA6OqMXz4V7A27FT15ic/51yLd8aCFPFUXew9EKZV7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QxANhLM4; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QxANhLM4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oitdBt48NvBWYNnmZoSk8ibnYTdYngETTiTSm3s73IU=; b=QxANhLM4hXb37a67GF41R1v+2m
	WPP7sTiFolzhr/zbfEQTj1x2ZAxT+NCZWNiVnGcGNTgPNh2iiE5lZfjaBe3Q2DIbf89a+NlWNAU6d
	6oJNoaUzOxxIhVP5srkswZ/AQjgUoTXzbiLRm8EsWihNZrxegXPqwEgXc87zjvj0D/jrAQNM+OaG5
	EAUVZWtJagwYc50yLNwYsB8RCFJATuKYFgM1xQdQ1a0DxczcnBWyX2gkM9CnYLHFcvLiqrU86G1Z/
	IhEPZrCYPJ8Yz3gcuAqrMs0B3YPhMQP18i1ZvNoj+MCsPrPbESO+I7fD/Il0PApWZKMJJdk/hyhag
	cIhtJ6Sg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHdou-00000001IMV-12M3;
	Fri, 16 Oct 2026 09:01:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6ACE23008E2; Fri, 16 Oct 2026 11:01:43 +0200 (CEST)
Date: Fri, 16 Oct 2026 11:01:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Hui Su <sh_def@163.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/idle: Make forced polling state race-safe
Message-ID: <20261016090143.GR2009045@noisy.programming.kicks-ass.net>
References: <20261015094211.4156055-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015094211.4156055-1-sh_def@163.com>

On Thu, Oct 15, 2026 at 06:42:11PM +0900, Hui Su wrote:
> cpu_idle_poll_ctrl() maintains a global nesting count for forced idle
> polling. The count is updated with plain increments and decrements while
> idle CPUs read it without synchronization.
> 
> Use an atomic counter to make the nesting count safe against concurrent
> updates and to make idle-side accesses race-free.
> 
> The weak arch_cpu_idle() fallback also permanently switches the generic
> idle path to polling. Keep that state separate from the temporary
> request counter so a concurrent request cannot overwrite, or later
> release, the fallback state.
> 

This is about cpu_idle_poll_ctr(), right? Is there any actual
concurrency on that thing? Afaict there is just init time twiddling
there.
