Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814216;
	b=Ci5z8RhyipNf9Vh+PXSBNHcQ2BdbcfPf/7p9f95GSfAum8ur3/sQa2nqtbx+0rOIoE3/
	 A9sDLBeNLMOjHlXFDIZfscfjpCImlHXvdYtT1OBSlYBkse7n/ZcVKPNLCrkXQCHwSS9sN
	 bES+o7pzMqlifIgNDzfn+eyxnVkBokt06uE1HUCpR/nHxle7dPSk00fKHy9Z9LANqGI2U
	 t+Aq9DdD+Xa7mQfuz19vePsp17snMUU8juW6C9EQqP2dxOaOkjzJbYJfP5B7mY0r4TgNc
	 1hAxMl+fu2MfZZa9GhyfwCSIVYYDV6FKy3TuMK9BJDIgkAjY6GN/KbEdzhcdXQ38RYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814216;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=nk2Mh+zI/TT/jjegJO9qYSlN1QKbBbjeWZjZ6ygv24I=;
	b=t+Y9imyNX+RZ0SmKepgn67kLzg4JlmCnFQqfj1ysJm+06SPXL1Xjld+AfL2Y2Ijlmif7
	 nKxpJOy//XD0NMFjILWqS1ic/Bfg6maZSsZG9NH7unKddq58P/UnbAH+1iQMv46EBxrEV
	 XiPlWPrY5Y5RYITv9axQQuj7frUOy609uImG9LOyMLIUhmgG9ryTLF/F/tbfQAAawX3KQ
	 3eUCr6xizm1SZ0USahNryT7lK2KYSQFjE1jq9kv3cm6HQmw4OutHRTe4H65CnCNj3P4kr
	 UVoz3ADSVKqkxpPa4r4x+GX5ZZuY9mM0rXCOlsySPoc6kpSwQ9hFvJ0JyPGIhxb5S/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JkCiI8ip;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lTj5aVeu;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38CF606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B38CF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JkCiI8ip;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lTj5aVeu
Date: Mon, 16 Nov 2026 08:30:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794814210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nk2Mh+zI/TT/jjegJO9qYSlN1QKbBbjeWZjZ6ygv24I=;
	b=JkCiI8ipGs6D6X54MmmtBVhszwJGHWiTFC84HeS/VV8C/PgiPBHK5t7BPpaxFTeg3R1x0n
	9yn9xn8UMkVMDUfuAJJG8OGdcLkN/uYDRZFKLu16Z9GNr4a6/yFZrkl0tYc4K9rYgle2ex
	vsp+Gt3SARQ0UmE8nGemRa8ZQclcIHvSEbw1aQ+uqKOCP5ifFNuA3EXpW0HekIXkHQIG6H
	2YkNalcDW36KJFi54qN6UyLhXQF2tRjCw3AAqH7Ku9tc+w7U1OdXnF12LxsPKw6UEO9RHj
	g79eof3+Ej81SkfwshOZgZTVrV3aIvfehIJC41965sbXn0mP2uPi+LJ8auIaKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794814210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nk2Mh+zI/TT/jjegJO9qYSlN1QKbBbjeWZjZ6ygv24I=;
	b=lTj5aVeuk5Ex7GPn7C4kR6cw3R3/I5G9oHbZoa/gyGd9on3kFZgrEiNwkyco9iphji7HM0
	HxmJV3H6q6qQPYDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jiebin Sun <jiebin.sun@intel.com>
Cc: akpm@linux-foundation.org, dennis@kernel.org, tj@kernel.org,
	cl@gentwo.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	linux-rt-devel@lists.linux.dev, tim.c.chen@linux.intel.com,
	tianyou.li@intel.com, wangyang.guo@intel.com
Subject: Re: [PATCH] lib/percpu_counter: allow concurrent sums with an rwlock
Message-ID: <20261116073008.PvlRj7Tl@linutronix.de>
References: <20261116015655.2744577-1-jiebin.sun@intel.com>
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
In-Reply-To: <20261116015655.2744577-1-jiebin.sun@intel.com>

On 2026-11-16 09:56:55 [+0800], Jiebin Sun wrote:
> __percpu_counter_sum() holds a raw spinlock while reading the global
> count and per-CPU deltas, serializing concurrent sums of the same
> counter. Since a sum changes neither the global count nor the per-CPU
> deltas, use rwlock_t on !PREEMPT_RT to allow concurrent sums with a
> read lock. Global updates take the write lock. The per-CPU fast path
> remains lockless, so sums keep their existing snapshot semantics.
> 
> stress-ng dentry reaches this path through ext4_statfs():
> 
>   statfs -> ext4_statfs -> __percpu_counter_sum
>          -> native_queued_spin_lock_slowpath
> 
> Keep the raw spinlock on PREEMPT_RT, where rwlock_t can sleep.
> Global counter updates can run in atomic context and must not sleep.
> 
> stress-ng dentry test average throughput change:
> 
>   +------------------------+------------+--------------------+
>   | Case                   | Unit       | Average change (%) |
>   +------------------------+------------+--------------------+
>   | Dentry, 64 workers     | bogo ops/s |             +47.34 |
>   +------------------------+------------+--------------------+
> 
> Dentry ran on ext4 with 64 workers pinned to physical CPUs:
> 
>   stress-ng --dentry 64 --dentries 4096 --timeout 20s
> 
> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> Reviewed-by: Tianyou Li <tianyou.li@intel.com>
> Reviewed-by: Wangyang Guo <wangyang.guo@intel.com>
> Signed-off-by: Jiebin Sun <jiebin.sun@intel.com>

It looks okay from RT point of view. Is this limited to this benchmark
or is there a real workload behind this?

Sebastian
