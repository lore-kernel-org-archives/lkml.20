Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7DB30F7FA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266878; cv=none; b=n1r2odtbmYkRZnvdTxt2+sx3p2+OnCHNJphQnRodgwoiu5xu35B27UoyJe1Ze/zhOeo/C0ANbmYJhAErPZUw32TNtrEK6xATXd8wt2ycDS6anybnAlJkvtU1lpq6pbPp+bEehdeM9s5IhHS69lredTCAlX2vHk05eejsVaHpHpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266878; c=relaxed/simple;
	bh=ZMkVQoLwFSjQFh71mnpOjYBkEbZBfqefoZXd/fVVZXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9zViA7ciKLnMwuNH+Iv7rgqVq8b6MHMTMNfX121io5SAFQPytPJQJSF2WvPBxkM+Nisi1+kguE+7RvxBIIykpvWqf8ygbe2TXxROaVGgWgYamz7hM870vhHjD7mO63FWIPHO6ogyf1I9rN14XcJDYe3AOhaR7J2W8hJyaPwWMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LRH/L1Jd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LRH/L1Jd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sCcI1xDRgy13rJLNRCaipdSq/zHJb80XoO4QrN/D7d4=; b=LRH/L1JdeSKQMpoPSr2wSN7WmB
	fzfB+ZCm1SNnodEdvJo3EBXK75+WWQQafDgDQ8yfgf3JgaoNkOEXqPTlUgtMO0HGNWxmYaC9Ku8gf
	aosrdu0gtHg4dwmYEVeALhBdXOWm4Mi/QMQIWtCpcOT1CSMix16u5+Z9SPT8DCXSaLfhcwf3Z0Dpf
	DvLZKPjEnPkW7Nf0rSlqZtcfAVLB2ogBxaNR03gnTSNH/eENs3gRA6EYLzKplJT4DC19r0+zy5oEU
	4wtVD4h0wBReSJV9HSeB68YseXCQPWG2faqwhXNgRU5Rr7KnaPz3lYsfgvcK0Rlz4GYCpMvqOoRIa
	NMFfFyVg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ntp-000000057uY-2PPd;
	Tue, 01 Sep 2026 12:47:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5EF67300578; Tue, 01 Sep 2026 14:47:36 +0200 (CEST)
Date: Tue, 1 Sep 2026 14:47:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jianyong Wu <wujianyong@hygon.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, jianyong.wu@outlook.com, zhongyuan@hygon.cn,
	huangsj@hygon.cn, wangfengyu@hygon.cn, yingzhiwei@hygon.cn,
	justin.he@arm.com
Subject: Re: [RFC PATCH v2 17/23] sched/fair: Fine-granularity NUMA balancing
Message-ID: <20260901124736.GI776954@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260828020731.785556-1-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828020731.785556-1-wujianyong@hygon.cn>

On Fri, Aug 28, 2026 at 10:07:31AM +0800, Jianyong Wu wrote:
> NUMA balancing currently consists of two coupled components:
> task migration and page migration. These two mechanisms work in tandem.
> However, task migration may conflict with other subsystems such as CAS,
> which aggregates tasks solely via task migration. Conflicts arise when
> both CAS and NUMA balancing are enabled simultaneously.
> 
> This patch addresses the problem by introducing a fine-grained NUMA
> balancing mechanism, allowing task migration and page migration to
> be enabled or disabled independently.

Sorry, but this doesn't make sense.

At every point NUMA migration should take precedence over LLC. The
remote node penalty is much greater than the 'other' llc penalty.

It is always beneficial to get tasks placed near the memory, and if
tasks cannot be so moved, to move memory near to where the tasks are.

As a secondary concern, it is beneficial to keep tasks constrained to a
minimal set of LLCs inside this node.

Disabling page-migration or numa task-migration separately completely
wrecks things and you might as well just disable NUMA balancing. 

Now, if the process spans multiple nodes we should go do the same again
as this patch set does for llc, spread/interleave over the minimal set
of nodes that do fit.
