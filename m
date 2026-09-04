Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F772AD37
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500614; cv=none; b=pIh8qm7FYb2STod6CudUhiMq44U5263vatHm0K5F87jncLAfSeBZJnbz4kbphYngxv5pHX0+7KD4STnC9i1dN7rOMIDuAibGK2E35Rrs132H5Q+UQ9A+5e0oIJP2HK2ZjAzVrzgy+DIAHlX+tQkmTNA/AmP4TgwC6b/qSR8Pgb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500614; c=relaxed/simple;
	bh=GOt4S3A35WmFPHdVgYbGhV9GJd4mWewvvrTFQVE5Y4c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N3goUdtOW4y89ekmYvC3JpfXYsrQOizltZkRFIlqyLN250246fdw2Ikq5tel31Zd+7GUj1jJcfMUgggNTbtB3zC/A+Kxa67fWXuf8hQYCwjy8N7UB+5tZpJfyVCorXzO+fAN+aImoQWcjpNi4wWMNkzf+Jgx8fvL+NAlbGWj3/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nuw7sikN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RxzPfUsN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nuw7sikN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RxzPfUsN"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788500611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M8w8PdrXkMxqzreuw8IF2MmUn2uLKWXn98faVAhr6cw=;
	b=nuw7sikNr5pz6a/btdnI3tm3+L/GagvN5+iaz1CgDr5Kwn8aq9gEJXUL2D5S77kGbCP2Wp
	gAbekfnKEM7Q8RNOaf0CxnESUYF4yTTclO86z7+0zZY5dLrgTXvY840VEwGamN3FjcHZCK
	xnADHQaEtag0+st9wva9udsYfCOOqMyIcHwNGfzh2sGk/NIHHRoCZOWRqTSZvwKebClWU4
	2SXfZzt8fGEH9Dwus/WqqKF0AshyY805/ZA8aWjd/l3BbtQljBuHWxxERDlwFbVLVhSr8a
	CeppQBu7VrjMGluwkkrFnISTDfd6+jDjZA//j9y2kqaePx6WBHrUZftwfwkNaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788500611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M8w8PdrXkMxqzreuw8IF2MmUn2uLKWXn98faVAhr6cw=;
	b=RxzPfUsNBm2f+IWgaA2F+3g8rK68GRgWGziuz2konoQvo2zA+vMiZ3Sn1We8WJynW3wxRp
	NwDis3hZoAh/jtCA==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Yao Kai
 <yaokai34@huawei.com>
Subject: Re: [PATCH v3 1/2] futex: Add missing rt_mutex_.*_schedule() around
 rt_mutex_wait_proxy_lock()
In-Reply-To: <20260827083738.-6QSwUwb@linutronix.de>
References: <20260824125544.2353006-1-bigeasy@linutronix.de>
 <20260824125544.2353006-2-bigeasy@linutronix.de>
 <20260824132334.GI687043@noisy.programming.kicks-ass.net>
 <874igghi3w.ffs@fw13> <20260827083738.-6QSwUwb@linutronix.de>
Date: Fri, 04 Sep 2026 07:43:30 +0200
Message-ID: <874ig5a7wd.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 10:37, Sebastian Andrzej Siewior wrote:
> On 2026-08-26 20:06:11 [+0200], Thomas Gleixner wrote:
> So this code simply failed to do that, which triggers the
>> lockdep_assert() in rt_mutex_schedule().
>> 
>> And it's obvious from the surrounding comments how this task got there, no?
>
> I would suggest to strip it all from the futex part, not do the flush
> and just please the assert so it keeps quiet. I did some explaining in
> the v2 and then Yao suggested
> 	https://lore.kernel.org/all/5df8a43e-11bb-4881-877d-40034c414984@huawei.com/
>
> which is what I had in mind.

and I'm waiting for a proper patch with changelog for that.
