Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F5842900F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182669; cv=none; b=X2znQxtQVsnSqpmYH+2LvVCfNwdqw18Y6AISvQtPyuxiZ+29MudPgz7W0ltiujSPKnkvHgyzbserzN6n1z2TmDFx5VmrY48MzsLIZmh1Jl7O8Fc6Ff+TMMGGCeLI6bHO1AV7zNcM777kSlp2f0IHsh/tyHK1O+x/0NqSA/M+EVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182669; c=relaxed/simple;
	bh=NnvS6HtHzk3qZK5Bo4T6POs7BG6dOSKiqdZgyh4O3ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzoZlYi6+XZMYsq7tkO+7zr/JbLzEoYfK8dt6ydRppwqku7MwT0Bgddwimw52SqjwoqP/KcELFdZa4n7tK5vEOUyY1/d6zthUSookcOriX+R7oODMevuazgh5ZYQqEN0iYTdz4C6RK+hCfOFAQi6qw5TeiiYIiy8eL59e+3IlPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=avtLy9AP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="avtLy9AP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DjtUTQ2G6VSAPLZAzQdu2hdsnEafVFpdgPC7S3/2EY8=; b=avtLy9APyyqf0a/7L/3CS5ngrt
	d9th/eG7Oqdnvo3kDIumpon9Yk4XjiiC1PpwpqatnjLGhoMBI3Zp+CZPCYQFG0OFg8gWNvoNqLVY4
	mIguqF+OtvpADKFIfwGVJQw6+q8QjOru9rce9ae6mYR9caBJWWiKUAu51Yp4fzp87eA+K+ND8m5DG
	5Ezt0s4jlZDzo9fOOGyc8mS3pLe56rl+BNYxlicmu2F/d79bPwLjoM2MInvV+sLQsJwtOxa/7WuNX
	mElPlTVvoK/KieaxRVI29JVD7WzLDNvesDzsahrocRXHeca8XvoSoieFOwbm5L8V6MB6JMcUFYSbc
	vOmXoYqw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11zj-00000003Iux-0F8o;
	Mon, 31 Aug 2026 13:24:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AB0E3300E7E; Mon, 31 Aug 2026 15:24:14 +0200 (CEST)
Date: Mon, 31 Aug 2026 15:24:14 +0200
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
Subject: Re: [RFC PATCH v2 08/23] sched/topology: Introduce a per-CPU tasks
 NUMA preferred counter
Message-ID: <20260831132414.GN4120091@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-9-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-9-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:28:01PM +0800, Jianyong Wu wrote:
> Like the existed task LLC preferred counter, sd->llc_counts, introduce
> sd->numa_counts to denotes the task number that prefer each NUMA node in
> a certain rq.
> 

To what purpose? Is not the node occupancy the direct sum of its
constituent llc occupancy?
