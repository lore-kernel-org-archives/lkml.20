Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412054;
	b=wYlW7z+E5t+tAUMNp0KwCIFomaNKb71vMlVWc5eatfPDzMhWGLovJjEb6xNg9gQ7UJ1S
	 pwjtz462dnYFeEGqmVpRJzew84R6niIdi1wybQIPcsSdTsiZG+jzHkAdPzUnepNS0nbFL
	 AGyM8gLXRDLPpwnsg55tDftJeE8ERZv4XSyK5sMgXRkst1innjBMNiQCwgimHvn+i41D0
	 Qe0RosKPlfejKnnebZLuSBzfjRAejWt87qZL50EIgpYRXr7X/qkSdwT0oZrhMidiXZZRT
	 qqpP8VW+emZdohlvS3RPrz0LOurAJNFNTbK3BUJMTGRo+4Xz6cSeE5Ici0XTwsM9oSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412054;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8JFpaAsG9vSxGmUvW8VP+sDnwaF6mPE4UBPNJaxYmJs=;
	b=OPdzlLPfDF6VeJs8RJievpWliJa78XC/ESgiSnpqogjICwTpdP68uWrbJidhz8XY6qmi
	 rvpidQvVuA+5xrL/xBpJiTaeoyXO0HdoOF5MZMKZ/Dc20u6Xeu6bJ0Bp3EYOwk+MfEfm4
	 1mByiAPHqqwaXsNcZC34bQTm08/5yaPX47SdFVU3swWZWq5Qxl3syqXfJO8wXKev1meAw
	 G2ruDJQxA/26Exwo3J6UgMf0ByWuXDcfsqNYE/HI8C4vJ+AZ+vluY58/idLa/hE2usRZ+
	 eSfZKWiVAmUWVlm5umd3lW7P8Hbzf5Wip+9YsmP+Wx7P1vFRw748/98LQt9XaoiAJdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=DWSzvPaB;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4B9606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A4B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=DWSzvPaB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8JFpaAsG9vSxGmUvW8VP+sDnwaF6mPE4UBPNJaxYmJs=; b=DWSzvPaBR+QkdbcO0fAC9kUOxL
	bIFreNzt8kOXDyuaL/vWNlhuQTY/1vpUKTA2t854106izH+ldcJ2BQTmreGPmRRqguUZ0+14fWW6y
	FfY0KUFSOstqkvTjefj3PGLaU4h+zhhmnttFkAVHakt12DyeDJk5+5UZIpQWfs28QrIhDwrvqFXEt
	Zoz2yses9jxUbcMJvOJesRSJDfA1ISwnTB/FqvYqoA1yqn3lIZOSw4rB6axniGrVzOhy95qqwDvr2
	eg7CZ7P2A6TFLKExtYEfLUcZSbvXY2VV/09qX1EAfFI+5cAAzqxcMX234m24E+94zy1i6nHbnmFS4
	7H6xsGow==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAXl-0000000B9Z9-0HHV;
	Wed, 11 Nov 2026 15:47:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 410D230031E; Wed, 11 Nov 2026 16:47:24 +0100 (CET)
Date: Wed, 11 Nov 2026 16:47:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, mingo@kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
Message-ID: <20261111154724.GO1779021@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120208.153536827@infradead.org>
 <a98c40701cc874318e7fe475d90795c6@kernel.org>
 <20261111130512.GO2668200@noisy.programming.kicks-ass.net>
 <20261111131152.GD2669272@noisy.programming.kicks-ass.net>
 <avRzGYNT-_p3KP9R@scheduler.schedules>
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
In-Reply-To: <avRzGYNT-_p3KP9R@scheduler.schedules>

On Wed, Nov 11, 2026 at 05:57:01PM +0300, Kayra Cizmeci wrote:
> Hi Peter!

> Let's say a fair task named TA is working in CPU1, a DL task named DA is
> waking up. We enter the normal wakeup path, and call enqueue_task_dl()
> and from there enqueue_dl_entity(). enqueue_dl_entity() sets next_class
> to dl_sched_class. Later enqueue, when we call wakeup_preempt TA does
> not gets preempted because:
> 
> void wakeup_preempt(struct rq *rq, struct task_struct *p, int flags)
> {
> 	struct task_struct *donor = rq->donor;
> 
> 	if (p->sched_class == rq->next_class) {
> 		rq->next_class->wakeup_preempt(rq, p, flags);
> 

Gah, you're right. This don't work right. Let me try again.
