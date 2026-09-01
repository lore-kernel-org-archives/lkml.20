Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7813AD538
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247437; cv=none; b=GSkIkrl8crW3J3NRrobplc06iqSsOq7Xrid3M7zBLyYFVG07IRMMEeZKCFeK0cHtcul/cVwwdAFJI3KQnvIKp6xjbr74B765+tAVbLw0k4trY3DntnkCbcujWD7aL4q53FYU3sRMdqQw+3LPKy4bKY4bNNwTTxm2Io7h9vPqwxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247437; c=relaxed/simple;
	bh=Y5Ex12WIV9wQdBaA9857SL1DSzmnTAW0iQ+jfJYGOGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Arj8kqypb+lEEjuyVWBS2pt+SNauBG+sv664DA5D1oO+oeDw0jlk3uG3aAksEZUxs6vud8ZfMtOd5ArM6/0u5TvvJqQoWapzIEIUR8DM3tPOCo0xNqc/n69wPjVwMG9WaLpM6AswYbO6tp9pz4Dw4x4vGTFHJdGccSQjbENkz4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=U0fkqFji; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U0fkqFji"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iWhfzyQgaYUJtonCqs7Hc3xCwG5I/OFdVxQZLlY0m4E=; b=U0fkqFjibEL2Au50BwXhiEMpAJ
	FHdHxlsHRfE9ddPoa8rf7lCgMRKv8R0QHofEwjFYQmJBCmC+Tolg8GG1fPwUsxRuvRa+YJ74Ppfo6
	QcV27MIXjoNFh35D0OeU3+S4DrKRdwj2JfZRsncSeUjbFH1zsZyH3a50+FYXplGfj/KaPDwlmz7ke
	7heeXq4AYy4kz0AegnczpiqBVkKaneioL+asAzJKQQlIcOlgvmcsrbnaMS6b4wL68taHvyHYZgElp
	ye/iitKbCj9JSY5/4mMsC/2tH32SNuwcadBDQEO/hQiKw363WcDtQyH/9kDltW3nWQo+QPXyFxTgo
	uqa2PJKA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1IgP-0000000AgGO-1l2R;
	Tue, 01 Sep 2026 07:13:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E32853002ED; Tue, 01 Sep 2026 09:13:22 +0200 (CEST)
Date: Tue, 1 Sep 2026 09:13:22 +0200
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
	David Hildenbrand <david@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"jianyong.wu@outlook.com" <jianyong.wu@outlook.com>,
	Yuan Zhong <zhongyuan@hygon.cn>, Huangsj <huangsj@hygon.cn>,
	Fengyu Wang <wangfengyu@hygon.cn>,
	Zhiwei Ying <yingzhiwei@hygon.cn>,
	"justin.he@arm.com" <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 02/23] sched/topology: Introduce a NUMA distance
 matrix with unique distance values
Message-ID: <20260901071322.GX687043@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-3-wujianyong@hygon.cn>
 <20260831115004.GF776954@noisy.programming.kicks-ass.net>
 <ee97dce1db374f50b8e87e51ad133d96@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee97dce1db374f50b8e87e51ad133d96@hygon.cn>

On Tue, Sep 01, 2026 at 06:57:43AM +0000, Jianyong Wu wrote:

> > This example uses Node only, but the code in question is specifically
> > aimed at Cache granularity; might it be better to use a cache example?
> > 
> > A little something like so (I got tired of prompting Gemini to generate
> > more complicates / less broken examples)...

> Originally I tried to use a single big LLC distance matrix. But once I
> realized how much memory and computation time it would cost, e.g. when
> calculating affinity scores in later patches. I dropped it in favor of
> a two-level scheme: the first is a NUMA node distance matrix, and the
> second is an intra-node LLC matrix that only encodes the LLC distances
> inside a single node, so it is very small. This way, both memory and
> time are greatly reduced.

See, that would've made good Changelog material :-) But yeah, fair
enough, the matrix will get rather big I suppose. And going to
triangular matrix storage will only save half, while you still scale by
n^2, so that's not going to help.

> > > Each row of this refined NUMA distance matrix is sorted in ascending
> > order to
> > > generate a unique per-node affinity sequence. This sequence will guide
> > > thread migration logic introduced in subsequent patches.
> > 
> > IIRC greedy has significant worse bounds than many other schemes. This
> > would result in more unique distances than strictly needed here, right?
> > 
> Yes, Greedy edge-coloring is simple but can't guarantee to get the
> optimal result in theory.

Right, so the theoretical count is :delta: or :delta:+1, but the greedy
bound is 2:delta:+1. But IIRC (and I really am not well versed in this
particular area) there are algorithms that are still relatively easy to
implement and get better bounds.

I just asked Gemini (so take with a big pinch of salt and consult your
algorithm book) there are simple algorithms such as Eulerian paths, that
exploit topological constraints, such as hypercubes or 2d meshes, to
still reach :delta:.

> > Since this is all on slow paths anyway, does it make sense to pick a
> > slightly better algorithm in order to reduce this bound and get better
> > results?
> > 
> This matrix currently has two consumers:
> 1. it is sorted to build a unique per-node affinity sequence;
> 2. its values are used to calculate the affinity gain in patch 12.
> 
> Therefore, when changing the de-duplication algorithm, I need to
> consider the requirements of both Consumers, For the first use, any
> symmetric matrix with no duplicate entries in a row is sufficient. For
> the second use, however, the actual values and their differences may
> affect the affinity score.
> 
> It is not yet clear whether using a more optimal algorithm would
> provide any real benefit for these consumers. I will investigate
> whether a tighter matrix can be generated without introducing too much
> complexity, and then decide which algorithm is more appropriate.

Right, fair enough. I'll continue trying to digest the series.
