Received: from mta0.migadu.com (out-58.mta0.migadu.com [91.218.175.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EDC27BF93
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788312105; cv=none; b=TvG6pSs853zrGcBIKdxS80jd0My615CuUc1ANw8TJ0xCLZ8b475N2vTwR9nU/EjYOaYY98TkUvgYZ/o/LERI/asB245aH4VJqKIfRuT6gyULunwcVAOA4E8kN712EQWAiMMnOj4vf80YdqUJs1sTcF+Kmzn1/+4KT7i82Y7hSyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788312105; c=relaxed/simple;
	bh=cnYNJPs9LNsxHxYbfan+xf2gAuz5dcYlsIYOr8iWioY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NPLN51CNZR7MtaVcb69DZ1oJR2nlxuXOgmWNAEggZ8s7lohwexo6JDkX//LDvSl0wegnWPT9Tq/SvH7u+Xp013o6nrjMxmW2u7mcB7cgqLH40pcZybE+AQdVl+eV9dYoJDlnQzL5HQRzhSYGOYJ6u68SBTXUTgV4l0/1bvEGFo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aR+AoLXq; arc=none smtp.client-ip=91.218.175.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aR+AoLXq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cnYNJPs9LNsxHxYbfan+xf2gAuz5dcYlsIYOr8iWioY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788312101; v=1; x=1788916901;
 b=aR+AoLXqiFHQWDJ4tGtI6zVcj3lIPBYsuoHZH0Wtth/20b3j3LMxamkMfnkX5W+3h1GJwHCf
 /aREyXxi141rSiFUPFf2QHQzTXucSUGEII4ZMocu1mmKDoyOL27xX/LPKDj3neYusH0rjde3tHl
 7mQcBruaUaGj47Vf03bCo578=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 16aaff76fb8e100b;
	Wed, 02 Sep 2026 01:21:31 +0000
X-Mizu-Trace-ID: 16aaff76fb8e100b
X-Migadu-Flow: FLOW_OUT
Message-ID: <485268f6-52e7-4b55-88d0-56c89bf88008@linux.dev>
Date: Wed, 2 Sep 2026 09:21:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, arighi@nvidia.com, void@manifault.com,
 changwoo@igalia.com, michalblk@google.com, liwanwu@kylinos.cn,
 sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, Tao Cui <cuitao@kylinos.cn>,
 Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/2] sched_ext/scx_flatcg: make cgv_node_less()
 wraparound-safe
To: Tejun Heo <tj@kernel.org>
References: <20260901140343.764080-1-cui.tao@linux.dev>
 <20260901140343.764080-3-cui.tao@linux.dev>
 <beadefcfd5ae112a703b2514f6eebf34@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <beadefcfd5ae112a703b2514f6eebf34@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello, Tejun.

在 2026/9/2 04:00, Tejun Heo 写道:
> Hello,
> 
> On Tue, Sep 01, 2026 at 10:03:43PM +0800, Tao Cui wrote:
> ...
>> long-running host. At the wrap instant the plain comparison puts the
>> wrapped node behind everything else permanently.
> 
> Plain < puts the wrapped node at the front. The unwrapped ones get stuck
> behind it. Also, each CPU picking a cgroup charges it a full slice, so the
> wrap is closer than weeks.
> 
> ...
>> cyclic comparison is valid as an rbtree comparator only because
>> cgrp_cap_budget() clamps every node to within max_budget behind
>> cvtime_now, so any two nodes are far less than 2^63 apart and the
> ...
> 
> cgrp_cap_budget() only bounds the lag. The lead is bounded by the slice
> charge plus pending cvtime_delta on re-insertion.
> 
>> Fixes: 7b742aa2c2c9 ("sched_ext: Add a cgroup scheduler which uses flattened hierarchy")
> 
> Not in mainline. The upstream commit is a4103eacc2ab.
> 
>> +	/* wrap-safe: cap_budget keeps nodes within 2^63 of each other */
>> +	return (s64)(cgc_a->cvtime - cgc_b->cvtime) < 0;
> 
> Use time_before() and drop the comment.
> 

Thanks for both reviews, all points taken. Here's what changed:

1/2: "less than 2^63 apart", folded into the paragraph above.

2/2: wrapped node goes to the front (not behind), wrap timing
corrected (per-CPU slice charge), lag and lead bounds both stated,
Fixes points at a4103eacc2ab, comparator uses time_before(), and the
comment is dropped.

I'll send v3 shortly.

Thanks,
Tao

> Thanks.
> 
> --
> tejun

