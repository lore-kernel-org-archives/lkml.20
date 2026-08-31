Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B7138F62A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208736; cv=none; b=qPVNrXVgc0jMEUHAEJ+hIN2I5aj7kReUQxKFWeSO+hjuNxpQMbTiwTOLlZvw+H+CO9VWI2C2wnox39u3HsztPNT4sDNYJKCIhfum9jnwGV+vuVvSyQIo0TRnFy2FNAnf9uEm25eJJf6HcXlsDtx5NSRdjNZ7MOhm/pmrhR+NiFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208736; c=relaxed/simple;
	bh=iDbevmO+BhExRVVSvnLH//sZmRne9ntiLN5cAqRFuaY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=M+QQ/Iw6xboj4aPCHKgyvq4f5BooFMG6Lu7FfAX6hRSqZzeUyFSgk6ecralrIpqSERsXZAuRvXoLFLs+dgioJZWYlY6PatFuBy0BmQOu1bW8w4hqleQBH6WfKFqze9i0mxbf/9hscuBcsrLzbwJOw+Lc/gG1CmTpISe17RTDCW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boj8DfVQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boj8DfVQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79D71F000E9;
	Mon, 31 Aug 2026 20:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208734;
	bh=6BS+gWXUs9LW5bT94s6ckk0YIqKAkR0D90rUL+i7DLw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=boj8DfVQiYh5zdYTF4w6o0stM3yAFG96LZXamBWn8uYXV8A5edYQsV/rX2ngcgZWl
	 HWyStbmOusfqECpuYmkvhs5fHcS5aIY8ZAFkavVDpx9sh2OCD07FD3lFOluud7WmNF
	 i/bgmzRVZlewz/L0elPRC51LFjApxhiGNbMvU6I12aqV9sv/5RmkRxAiAgokhue9+4
	 OwODw/XQN/ygPS78CKU/5lhHc7sFJz6RxEm/9GLulmFNBWvi45D2rC+0Mk9hZM7adG
	 dOWRj8WqSp7V2QJJPejJSKT67tznfIt9muZgihkpItvuNZnTcMlcqiRAtcy6cXHet9
	 BhYj/7FGlEDzw==
Date: Mon, 31 Aug 2026 10:38:53 -1000
Message-ID: <7c884196b9a8890efadeb0a8ef9c1f6e@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: leitao@debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] tools/workqueue/wq_dump.py: Add busy worker
 inspection and BH pool states
In-Reply-To: <20260831181554.117795-3-atomlin@atomlin.com>
References: <20260831181554.117795-1-atomlin@atomlin.com>
 <20260831181554.117795-3-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello, Aaron.

On Mon, Aug 31, 2026 at 02:15:54PM -0400, Aaron Tomlin wrote:
> +            if pool.flags & POOL_BH_DRAINING:
> +                print(' draining', end='')
> +        if pool.flags & POOL_DISASSOCIATED:
> +            print(' disassociated', end='')

Note that POOL_DISASSOCIATED is set by init_worker_pool() and cleared only
for per-cpu non-BH pools, so BH and unbound pools carry it for their whole
lifetime. This would print " disassociated" on every one of their lines.
It's only meaningful on a per-cpu non-BH pool whose CPU is offline.

> +    if args.busy:
> +        for bkt in pool.busy_hash:
> +            for worker in hlist_for_each_entry('struct worker', bkt.address_of_(), 'hentry'):
> +                wq_name = worker.current_pwq.wq.name.string_().decode()
> +                fn_name = prog.symbol(worker.current_func.value_()).name

process_one_work() hashes the worker before setting current_func and
current_pwq, and clears them right after unhashing, all under pool->lock. A
worker caught in either window reads back NULL, so worker.current_pwq.wq
raises and prog.symbol(0) can raise errors and kill the rest of the dump.
Work items can finish at a very high rate, so this wouldn't be difficult to
hit on a busy machine. Maybe catch the exceptions and retry the worker?

> +                dur_str = ''
> +                if 'jiffies' in prog and worker.current_start.value_():
> +                    jiffies = prog['jiffies'].value_()
> +                    dur_s = max(0, (jiffies - worker.current_start.value_()) // hz)
> +                    dur_str = f' for {dur_s}s'

worker->current_start was added in v7.0 by e8e14ac7cfe4 ("workqueue: Show
in-flight work item duration in stall diagnostics"). The 'jiffies' in prog
test doesn't protect the member access, so on an older kernel or vmcore the
first busy worker aborts the dump, the same failure mode the previous patch
fixes for wq->attrs. Please handle it the same way.

Also, the values are plain Python integers, so on a 32bit kernel the
subtraction goes negative when jiffies wraps (the first wrap is five minutes
after boot due to INITIAL_JIFFIES) and the max() turns the duration into
"for 0s". Mask the difference to the target's word size instead, e.g.:

    mask = (1 << (prog['jiffies'].type_.size * 8)) - 1
    dur_s = ((jiffies - worker.current_start.value_()) & mask) // hz

Thanks.

-- 
tejun
