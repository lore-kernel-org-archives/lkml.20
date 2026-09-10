Received: from mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8684BFE89
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037249; cv=none; b=U9xrUWwlj2o6/muO+uiff49/Uzdzn9U8RTMwD11XagQ9B5hhQkRiPwxc7HkQBJ7Qx6w3ShbD/phDi4bsYrI6qWbn4qs4s0tXGXtTz0AZE7bdYlrTxZqHoQdbqjda6TxCb2+ZWcQREEGR5sdZlVDdpxa/5dDEqBfL1z0QtQPTDbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037249; c=relaxed/simple;
	bh=xRGhYxmMaJ8iKhjgIgc7Z9g+HkGD66oZpno6a5dsLbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLQDL1LxNgx8j+MzJqIgAwulSbzvxO+7amX6d1hyGkGLIeRmg59NTeOykrSoAuGE9uNmExdKRASPSmYZe091Q951oum/TLvX/ThPfBqdUyok7XZPw2n2AkyOrKUd3JeFRK7CLpu4KXmXXoXX6ToyEgVaAFdIgiqKWHa9HsAVDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OMgJu/d4; arc=none smtp.client-ip=95.215.58.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OMgJu/d4"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xRGhYxmMaJ8iKhjgIgc7Z9g+HkGD66oZpno6a5dsLbs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789037240; v=1; x=1789642040;
 b=OMgJu/d4hn9xBmTZn8Q7wyn2QVHD5ecToUlsKPHXHnko88WqKwyF2XP9njiU4KPVNFc2mjgJ
 xjEmK1Rncbx9v1ojyqG66UJMmxucJv6QNUh2qJCvKG1wIuZyzxOq/pDFcKZ+vZpXjPcyevveshG
 9Z9tEEKYOrKWYV7TW+8cDRXM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4b99439175782190;
	Thu, 10 Sep 2026 10:47:10 +0000
X-Mizu-Trace-ID: 4b99439175782190
X-Migadu-Flow: FLOW_OUT
Date: Thu, 10 Sep 2026 18:47:08 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Zhan Xusheng <zhanxusheng1024@gmail.com>,
	peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: sched/fair: which tasks should nr_pref_llc_running be compared
 against?
Message-ID: <aqKKrMKaZORqNpwt@three-body>
References: <20260827135000.735138-1-zhanxusheng@xiaomi.com>
 <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>
 <apPnJaUS5vq2f85J@three-body>
 <06ed8af87506f858176a81a4c29acf92d24b6dc7.camel@linux.intel.com>
 <apmQaelH5Y7czrOM@fengwei-dev>
 <2b0a35122ee615c6fa51076e5d79330e633755ac.camel@linux.intel.com>
 <aqFFu1Xo52cQV3iy@fengwei-dev>
 <a1b1d5f9a58895b65217671678c6e02bd711241a.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1b1d5f9a58895b65217671678c6e02bd711241a.camel@linux.intel.com>

On Wed, Sep 09, 2026 at 10:47:11AM -0700, Tim Chen wrote:
> On Wed, 2026-09-09 at 19:40 +0800, Chen Yu wrote:
> > Yes, I think this version looks good now. While looking back at Xusheng's proposal,
> > I noticed there is another option:
> > if (env->src_rq->nr_pref_llc_running == env->src_rq->cfs.h_nr_queued) {
> > 	...
> > }
> > May I know why we did not choose this approach, is it because of the following
> > scenario?
> 
> The reason is that a common condition we are trying to avoid in
> alb_break_llc() is the following: We have one task T1 running on cpu preferring
> src LLC and another delay queued task T2 not preferring src LLC and delayed queued.
> 
> - runnable domain (current fix): h_nr_runnable == 1, nr_pref_llc_running == 1 → equal → alb_break_llc() true → suppress.
>   Correct: the only thing actually running here wants to be here; don't rip it away.
> - h_nr_queued alternative: h_nr_queued == 2, nr_pref(queued) == 1 → not equal → alb_break_llc() false → proceed to active balance, 
>   which would then break T1's locality to relieve an "imbalance"
>   that is really just a sleeping T2.
> 
>

Got it, I see.
 
> > Suppose there are 3 queued tasks: p1 and p2 prefer the src_rq, while p3 is a delayed
> > task that also prefers src_rq. In the current implementation, nr_pref_llc_running is 3
> > and h_nr_runnable is 2, so alb_break_llc() might return false. As a result, active load
> > balance would be triggered, and p1 or p2 might be migrated away, which is undesirable.
> > However, would this still be a problem after Lu Wang's active load balance guard patch
> > has been applied?
> > https://lore.kernel.org/lkml/20260903020656.3793626-1-wanglu.priv@gmail.com/
> 
> Lu Wang's patch only mitigate the migrate_llc case but not other migration reasons.
> We shouldn't have done active balance in the example I gave if we are doing
> migration for other non migrate_llc reasons.
>

Indeed. Got it. I've launched some santify tests, will report back later.

thanks,
Chenyu 
