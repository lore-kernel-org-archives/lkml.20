Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580335;
	b=HnY7VEw2kUNfpm4im3tvpUwB1F5OvJKkF0L7YaAzZ6qnkitBYIxhapTHgDBJcKryK/8f
	 rXnout/ZvnW25tEg9JUl8bFk7TajUJcY6oidRCLi0gNtK4MBL+3wL4hP3eUVULeQydHpe
	 kMT9IV0gPK7sZz62Diw16R/379TEKqCArfhJm1hBmZjzzwz1/nIvSRclS78P6PaACqZvy
	 EygAl7fRFsdOd/scFRvXfL8B7B3rZdv6YXEjwCHjBH+8q5zsCS4wAnbkfJtiWf6LALBt5
	 2KdYtBUeAxS80dnu5esSC8ar/3jM4xu8DgOUUlHAZWw6kqHzsDJUlt6dwoNpq+6UoIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580335;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=FawFiCHhFqUP9UVTI9o6jUdPle4gc8XgnzAN35Imzwc=;
	b=MP7ZueCYe5vRHz5OvxEZUo6gO1zs8TDq6q2QpG6NAo8ahIKtBrn9SVQgeGR14DahpqRd
	 XEZ74cYd+nwzD6ymdcUE2yNPuNTwgh4qs41ChN6V2sPywQoFQ9X+JHvh79ExyWxRTthPV
	 TTlhGzd6IY+a/SI5IdAuBX1ob2RVDHFNqPnELaUzTutnp+8HuC05lruAD3wZ6iiVRhYdg
	 PnD6SYlDk1vrvtkQ1B+lAOgi17glBcJ2O0xbTlmb/RPDxnJPDrYuuvAvR7zc9hIeCTJMn
	 4EaoLBxNxIYuX6JANchvbyHcoAdaSufQm73h7ams1uI2eMRP77jGVlwoHrz2PhE/poA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PQrISobI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ecffbj2f;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5038A606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5038A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PQrISobI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ecffbj2f
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794580329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FawFiCHhFqUP9UVTI9o6jUdPle4gc8XgnzAN35Imzwc=;
	b=PQrISobIqobQMqgflVE/f85lal3u8dJCwS/CL3KqviSq5ihVlt9Y742RnUL9yJrPaRolMr
	wPJQUBVfacmtwb6NmWxhyKJESKgUpmF8fOcMdTfNsvD5prurfrybdePC4hTula20Cryg4p
	3TIyVCr35oT2j8T4yP9HrZKWyct9Nbg4J+iTuOlwDJ6zBv3H1Ome+m1AY9DaPCCVpsgxNa
	ATn4MoR0oodiM2Zr+vbct0Ywa/+6U7+/41ogCQdrDdZxFiJjrXNT0H+ad426uauUCPhTwG
	Nr9cERLU77onu5zKMYDgIKtDdeSeZnPFcQCWEoxQwekI95v/K+Eb0SR1kdT8YA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794580329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FawFiCHhFqUP9UVTI9o6jUdPle4gc8XgnzAN35Imzwc=;
	b=Ecffbj2fAeatwWRbgH3t9FI/sbWOSUEY7y6g0uL2vvz4PwJF/a5r6EVgc/r9fNxCpEB6+e
	ni10FdKZD4Gu4LBg==
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra
 <peterz@infradead.org>, Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/mmcid: Bound the CID allocation busy wait
In-Reply-To: <bd4c03e6-7ea6-4a21-9a3e-74ea9d36fe17@efficios.com>
References: <20260918013454.1850369-1-xujiakai24@mails.ucas.ac.cn>
 <20260918104349.GL776954@noisy.programming.kicks-ass.net>
 <877bjiem45.ffs@fw13> <87mrs8bhp4.ffs@fw13>
 <bd4c03e6-7ea6-4a21-9a3e-74ea9d36fe17@efficios.com>
Date: Fri, 13 Nov 2026 15:32:09 +0100
Message-ID: <87eccossye.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 11 2026 at 20:48, Mathieu Desnoyers wrote:
> On Tue, Oct 20 2026 at 15:54, Thomas Gleixner wrote:
> I have a reproducer for a lockup that starts from the stale state you
> describe. It needs two more things: the execve() fails, and the task is
> moved to another CPU during that execve().

That has been reported already privately to me and a few others and the
reporter provided a similar patch as you.

While both variants seem simpler, I prefer the explicit
re-initialization for the failed exec() case.

It's a NOOP for newly initialized MMs and avoids the pointless fixup
dance for the last user in the common case.

Thanks,

        tglx
