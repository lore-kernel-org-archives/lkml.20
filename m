Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B9239D6E7;
	Thu, 15 Oct 2026 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079489; cv=none; b=CIcgONsVwUQ3/N0Nkyh1OPD1bsDnffz61mRtwKRweKk7kHZJ1dGWNP6ljmMNP32Ajfgnsf9iS3IKXNyzUkrQ+kfhNXDprqn7787EePOHaVm0+uXKmCxDSZpYTXLtVEaBH5f6oOXY5OTMm+uGkdVFLCw119IHKCGLOQY0l6LxaTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079489; c=relaxed/simple;
	bh=Kmt3eqXzrIk1GticGB8EBuJzsvlpaYQn/Ti6aENHLtQ=;
	h=From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References; b=tCCiUSjRUUZdGA71VNBjjdLnqzgFsIFjRQ3h8cHMTvvQweyHDNHMgHMOxaODIwVe0zniWZ6pAlU2OQrVGo6Qek2+InPdFUpN1i5ImeE8/TPQJMKU2LjRFmjhTmZmHOBg32Y7mSfGiYc/+/n14Y0UvZq/xSfVgVFjC6iWZ6iOPQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BXmvIgg7; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BXmvIgg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Date:Message-ID:Subject; bh=pV3u3W3cVSRN2sg
	rn4Jh3xJKuGS6llGgumz3/Bt71S4=; b=BXmvIgg7yjTbRob3ynt/eArnI1muIPn
	JRx7MTXUvWuUNN3k3JToIZhWN+zvDR6+FE+1TFW7xJaNnHbTVCvtT867eS48PbQW
	WsXQfF9n6CfDHWYvzoVmaJb6eoKYFEHzIkcYZCr01lbC1Y8Y2PlCXCU/Qb3UXAaj
	U43R2VPOU/a4=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDH725F9tBq_DgYAA--.3201S2;
	Thu, 15 Oct 2026 23:50:30 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Marco Elver <elver@google.com>
Cc: dvyukov@google.com,
	kasan-dev@googlegroups.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 16 Oct 2026 00:41:52 +0900
Message-ID: <179207891210.785435.2410067352826371928@163.com>
Subject: Re: [RFC PATCH 0/4] kcsan: add targeted watchpoint sampling
In-Reply-To: <CANpmjNNhZq6z8hZN-125OPNbho+YBwWJeOsa6QRedkqOdJP0kQ@mail.gmail.com>
References: <20261014095238.2132580-1-sh_def@163.com>
	<CANpmjNNhZq6z8hZN-125OPNbho+YBwWJeOsa6QRedkqOdJP0kQ@mail.gmail.com>
X-CM-TRANSID:PygvCgDH725F9tBq_DgYAA--.3201S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWry3Ww15WryUXr1DKF4fAFb_yoW5Kryfpa
	yFk3yrKr4DJrWIyF92y3W7ZF109rs5Xw4UAa18Kr47A398CFyavr4Iq34UZa98Crn5Aa45
	Ww4UZ34UW3yDAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYhFsUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6ged-GrQ9kf4XQAA3i
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> You should compare fast path disasm before/after, just to make codegen
> isn't adversely affected.

I also checked the x86-64 fast-path code generation as suggested. In
paired GCC and Clang comparisons, I found no new calls, stack spills,
stack-frame adjustment, or callee-saved register saves on the disabled
path. The detailed `__tsan_read8` disassembly comparison is in my reply to
patch 1:

https://lore.kernel.org/lkml/179207802520.771660.5931695730876285158@163.com/

> Questions for discussion:
> 1. Is address-targeted watchpoint sampling a useful primitive for focused
>    KCSAN debugging?
>
> On surface, it seems helpful.
>
> But there's another angle: The need for reproduction arises because we
> want to debug an issue, and the fix it with a code change; after the
> code change and a recompile, are there new data races that were
> introduced as a side-effect? Perhaps the original data race you were
> hunting is gone, but new ones may have been introduced. So my approach
> has never been to try and focus on a single data race, but look for
> data races that may have appeared adjacent to code I touched
> (filtering based on function name). The method of reproduction are
> stress tests that more or less reliably trigger the original data
> race, but should also trigger data races (if they exist) adjacent to
> the code being scrutinized.
>
> But perhaps what you're after is asking "are all accesses to this
> variable data race free" only?

Not exactly. This interface is not intended to prove that all accesses
to a variable are race-free. The motivating use case is narrower: after
a reproducer or report points to a suspicious address, make accesses
overlapping that address eligible for watchpoint setup without unrelated
accesses consuming the skip interval.

I agree that function-scoped filtering and stress testing remain useful
for looking for races around code changed in a fix. Targeted mode is
complementary to that workflow when a known low-frequency location is
difficult to reproduce.

In the motivating loadavg run, targeting `calc_load_idx` produced a KCSAN
report involving `calc_global_load()` and `calc_load_nohz_start()`. A separate
upstream run with the default `kcsan.skip_watch=4000` did not report those
locations during its test window. This is evidence for that workload and
window, not proof that the accesses are race-free when no report appears.

> 2. Should matching accesses bypass the normal `kcsan.skip_watch` interval, as
>    proposed here, or should targeted mode retain its own sampling interval?
>
> It might become quite slow for frequently accessed data, but perhaps
> that's intentional if we want maximum races detected for focused
> testing.

Yes, bypassing the normal `kcsan.skip_watch` interval for matching
accesses is the intended tradeoff in this RFC. Nonmatching accesses
neither set up a watchpoint nor consume that interval. `target=off`
restores normal sampling. Targeted mode is intended for focused debugging,
not steady-state use.

The hot-target cost is therefore expected. In the RFC measurements an
enabled nonmatching target was 26.981 ns/access versus 24.549 ns/access
upstream, while a deliberately hot matching target measured 81.1 us/access
because every matching access entered `kcsan_setup_watchpoint()`.

> 3. Is the existing KCSAN debugfs file an appropriate interface for configuring
>    a single target?
>
> This looks clean enough.

Thanks. I'll keep the debugfs interface as proposed.

