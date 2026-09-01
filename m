Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A67E456DF7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249322; cv=none; b=BcYCWAdTQfUmGZop5Enan97sHsh5JY3AZpgODAln04VbQWXuhQikwFwHwKrnvtFDpBcOwxE7hJPAbPO66xFu4pbhb0BBMhCzbuHygzffdqcXySvyAoqIKIY8g1ZiZZ3SxeFHmYFnfU4a8RZ2+p2neWOKbt0u4Ua4+5TPDADmfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249322; c=relaxed/simple;
	bh=uBjM/K/26wCBzpdKpWc+Hp5EDZGObDeuCaNaSLPt4hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYjNenJmzM7N6gXajSOZQbiUrdZWov11OsMF6OlK+CVmpg7nsQz58CIOmT1dEzvchqpwwwUocWxOOSS/yzHQc6KixI93YGrCYQzmDpjYHhyD7qjMlK7QBVPaEUCNZJyJdz3H/R2fb+OcwGoDV6vJBFewXuyautmCmCC3/Kbwd6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ty4geT8T; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ty4geT8T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uBjM/K/26wCBzpdKpWc+Hp5EDZGObDeuCaNaSLPt4hI=; b=Ty4geT8TvA3szhsylN9HGz0LYG
	LFlRHkgLzaFbiHH6lmuUASPjLw7W38ndHLgZmJoxzl45s8GCauMRCBfATakBNFki8Cm8Cq09t+UII
	lXSvTx/uqvuH0/5qYbBxHlojYiMsfFKNe82G9rv+sz/y1zPHJXNsFz8Hu28G0kDsVoh8Epz3l+hgT
	1p/F55rN5HrX+5i8Fa1aFXalPwdTjKzMxqNwMjwIqlRJb0wpiQYlwu5oR5faeweeeuLcdTHyGBKtP
	4a0WvNbm6gWErWnAnNWjzA+fHKHesF6s1M/xWL0KXzsodlS6crB74Rh6sVbUaNnBfq8EJwxDsL7tt
	QvXmhm5w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1JKd-0000000AiYv-1nB5;
	Tue, 01 Sep 2026 07:55:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 916683002ED; Tue, 01 Sep 2026 09:54:57 +0200 (CEST)
Date: Tue, 1 Sep 2026 09:54:57 +0200
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
Subject: Re: [RFC PATCH v2 09/23] sched/cache: Account percpu sd task NUMA
 preference
Message-ID: <20260901075457.GO4120091@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-10-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-10-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:28:02PM +0800, Jianyong Wu wrote:
> Account for per-NUMA task count preferences within per-CPU sched domains,
> mirroring the existing implementation of LLC task preference logic.

So in general I would really appreciate a few words on *why* you're
doing things. I mean, I can read the patch and see what it does, but I
cannot divinate (esp. not without yet having read the rest of the
patches) why you're doing things.

This is esp. important for large series -- or series that do complicated
things -- or like this case: both!


