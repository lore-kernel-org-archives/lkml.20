Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E759941D223
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991141; cv=none; b=CjxAXDco+oCdp+h54z4l5cZjzt6M43Qxvte1pdshKvneoZfouxBNzwHFGGxD7cv5IzJ2tjw9QtQAxNajiqTNjxDLEOvT75R1lKWIrA4r95PqGLTkkz4VhqjOOrM5+5f5sQ9a2z+dbJN+vu3BvN9uOj+zmWZ98ve/bWqcqSI/oZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991141; c=relaxed/simple;
	bh=Wd9EOkT/dIRoEhws180E9cEsi9GkAX9mx8wO4tLtJko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1JS10P1s0/mViL823NrmsjSZ+UxO3/dKCLP3pTImUcznmZBjrh768QpkvSnjfhWdNSS4IifK2ASPvjDNAux6EqP2b0Zfw9xJdCQmciUN6j/gX7EQHsxH2xezXz+d/5nhwTF/1KDk2j9qN3/oxWj0abisjvzRA+OWbb/348o11Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=isVtSoIw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="isVtSoIw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Wd9EOkT/dIRoEhws180E9cEsi9GkAX9mx8wO4tLtJko=; b=isVtSoIwVXsl1futn+Pv5tTPs4
	fMZkoH9esBoaxcXUYZkJTt5eHD9q2pOm2K6do7RUpNJ8l0ShCJ8tr0OpMqXVt93mWHeJ4y4XTnZ8X
	HcIhJyfCgxlMALECovma+CwzUqllyWmzMp5Otyo2M+9+q7ZrnF3cuD9tdRw9WfXc73TcKZfoxG8+N
	7caD4ITuMrXmnScnVIIuiPjKd8LoN8sNKmHIgab1lmbNu7S3c5SRcr4vbCxmyh/OBKrlmg+YOV9p0
	LC5TVNbdPya4yeGLwKoWV24aJETZstXg75eVJnSfoJAon469OBVZlRoCHRk3z9xcoS5m+5W7t1VPr
	UfV0+6Vw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QJe-0000000A5Q8-2S8u;
	Wed, 09 Sep 2026 21:58:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 24F00300B5F; Wed, 09 Sep 2026 23:58:50 +0200 (CEST)
Date: Wed, 9 Sep 2026 23:58:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: vincent.guittot@linaro.org, bsegall@google.com,
	dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
	mgorman@suse.de, mingo@redhat.com, rostedt@goodmis.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/eevdf: fix rb augmented with multi fields
Message-ID: <20260909215850.GP776954@noisy.programming.kicks-ass.net>
References: <20260908135526.2783039-1-vincent.guittot@linaro.org>
 <20260909185828.1158142-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909185828.1158142-1-kayracizmeci@gmail.com>

On Wed, Sep 09, 2026 at 09:58:27PM +0300, Kayra Cizmeci wrote:

> The bool exit on min_vruntime_update() parameter appears to be unused
> when I grep or search for any use case. Could we remove it?

grep for RBCOMPUTE, you'll find it used in RBNAME ## _propagate().
