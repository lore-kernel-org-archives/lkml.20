Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928257;
	b=hKkvGAs9v9iOPy+fzAERIRHt/4pMmVMokRB6cbODTAQ6XxSnwqEMQQNniIi7ZOtJutlU
	 EznP2xYcWBzks9okUPyRcyYcNpJ6QrJ0yAo76N5obSEBR0TG6L7kmTVOXyQpm+xpsP+By
	 OjRoVC5RFaGrseKcPwc+NE1bDnGPf5bLeW+PEua2ijGA8s2ys785Y/9uB5rX5hRWK+0LV
	 9I1lkO83tbZUb4W98WgygRk+6PnViP4nzq5dufwZg3Y230ccz2iYssJnPD+9NVfdEqZmB
	 EZnWwKYbIJMp9OkHZNXTmikiESjgpH15PzLQDu04zxKYEQ4ov9Ucji+oKoiN4G91jYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928257;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=I1w61MJ3lN24Q1khsYsJyrxVKAtxK4Sd/Gb6+BHix1I=;
	b=5KV1+pL9sNWOwHGZcyqV9Zucf5gHJs9BR0SAGD4cdnbxx0jMDhj2uet1wp6QnplJC2ep
	 9rPuvvqG7vWHFfN8bQgkcOwyiCaABuxRRKXXJ0/O+8d+T2dD1ozFE8eBply4+ODHydT7x
	 Hkru/MJ7QRsa0RCnona6kGgylYaCXphjLfsbYccxXS3EZ/JbFsfgMNm8ScOZZE5hlSOnF
	 iIhP3w2H/voxo2Pi1mpqD3BPLhyiP87/kV3OUFW1yi42Cp0O2FcNWmgfkFluJNYrI+/V/
	 GYM6GoWWJ3/PhPRZPJeyZjcO5ppoOTT6zs2nUNC/jnWOe31ea9tW71yatUiRjIW7XzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b="cxw/XbED";
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A0B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72A0B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cxw/XbED
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I1w61MJ3lN24Q1khsYsJyrxVKAtxK4Sd/Gb6+BHix1I=; b=cxw/XbEDTxhV8g6hQGFV8MuZUv
	klkaAtnxYMiBWaD43Z3LWstjpibt1ZZw3VS94wHvPTudaRF6b8P8fHrH4sxhRY6OZviE6kp9olcYb
	Y3XkLiW+9VxVBx7Nt63DnYn0/pfpp5KUgpjAp+2yWVC968UDg/mZAxt/Yft28Xbx0GRSCOwoOtTmY
	+AUuI6myEotI6gMhLeczyuPDsfPdzmTBs+5NnhP7EGDahYx+XriAjibL19getmfvOqMcZ3dmeie6y
	0uXKBCWocMZuKUq9dFe4FbsYbgc+0mGXWCKeEZ3C9cd6fzOZPvnevRTnJNiMXoJxrOUoIK99Mbr4l
	vkWSu8Sw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKpg-0000000F71X-3Z5k;
	Tue, 17 Nov 2026 15:10:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EBD25300400; Tue, 17 Nov 2026 16:10:51 +0100 (CET)
Date: Tue, 17 Nov 2026 16:10:51 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Seiji Nishikawa <snishika@redhat.com>,
	Mian Yousaf Kaukab <ykaukab@suse.de>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <20261117151051.GH1813469@noisy.programming.kicks-ass.net>
References: <20261113160655.2909479-1-mgorman@techsingularity.net>
 <avxht-AL1t6I6IXA@techsingularity.net>
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
In-Reply-To: <avxht-AL1t6I6IXA@techsingularity.net>

On Tue, Nov 17, 2026 at 02:27:38PM +0000, Mel Gorman wrote:
> On Fri, Nov 13, 2026 at 04:06:55PM +0000, Mel Gorman wrote:
> > RT_PUSH_IPI is intended to minimise latency and rq lock contention when
> > migrating tasks to balance RT task distribution. The problem is that
> > if a CPU is rt_overloaded but has no tasks that can be pushed then IPIs
> > can be fired continually at the same CPU but fail to move any task due
> > to migrate_disable() on PREEMPT_RT. A specific case was "pgrep" running
> > at RT priority, its CPU being the target of a continuous stream of IPIs
> > without any task moving.  While the pgrep can be bound to another CPU by
> > the application, the underlying problem was that pgrep is spinlock-intensive
> > which disables migration on PREEMPT_RT.
> > 
> 
> I know the rate of scheduler patches at the moment is completely insane
> but is there anything else I should do with this patch?

IKR :/ Let me go have a look.
