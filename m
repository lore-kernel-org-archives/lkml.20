Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A67C429CF3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230383; cv=none; b=YGViCmC+X74Hr6ELTXVB/mK0BkaCceDs+A/8DDI7WhFqlccPU5cWqUl/6XQn7IdHQoGnfcvFHBXTRGcYSqHqIPNMa7+PJ0P/LPFSltYMIYFOfOiBfXTXc6tn/Nlfghr1gO4daW+0S84AEkH3j7xPhzYcfWuFrZ9Mr90gbRq28UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230383; c=relaxed/simple;
	bh=oi8V8m9yhWt2T01PV3i7dkQGa4gKCsXLsiisqVWkrII=;
	h=To:Subject:Message-Id:Content-Type:Cc:Date:From:Mime-Version:
	 Content-Disposition:In-Reply-To:References; b=Aqc7rq4VpAjBzQqPRRuuBgyDtHeOyNwFxKZ+bZzQvJcR9hq84I5j77NO6hgDUWpal4MSCgJGTxKpOS0kShBMx/xRZfWsQH6M+CcoAYxEvsaKqgCD8T1e1CCtXN+cnTY/zClKecA1M/P/wj+p8UGoTwVDpTb3x2WRZ7M8JSFZgtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=YEFk89gk; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="YEFk89gk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788230367; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=I41FvFMGhlMUafyDljZGaCY9IVbp2TA3OePZTsAT+p0=;
 b=YEFk89gk8Ra4AcycBPSObnvkfDUJcXtUzqThN5oLPAX2pjOjCtSdPH2sUfWwQNJkSt0bW/
 5Kz+rTYGcO25kyzY+r0UsI86OKIetU6k3uo+gE34jkRwv5hyA++8f7gFb7sgCUQb7N2+LI
 0VeN3gOk2tyhi2o46IOK3P5/Yrn7pCie6LHad0uPPV3GXJI4U90W7dVpv9lzbXpEim+EIm
 mSjuIz1xD1MYA6vOu4Se4VG5d5t+YenoPnDd4jLLNdLfWKhpVBlnQloUtSVUEobj1+RZze
 IbOfWTh6xiylym5y8X1AshIqDu4xJsvZ1l5lxWNvwLr5fl8Zw7PYpqpyhL1nig==
To: "Wanwu Li" <liwanwu@kylinos.cn>
Subject: Re: [PATCH 0/2] sched/fair: Use cfs_rq->h_curr in the bandwidth paths
Message-Id: <20260901023851.GA4059187@bytedance.com>
X-Lms-Return-Path: <lba+26a963add+eb8f04+vger.kernel.org+ziqianlu@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: "Ingo Molnar" <mingo@redhat.com>, 
	"Peter Zijlstra" <peterz@infradead.org>, 
	"Juri Lelli" <juri.lelli@redhat.com>, 
	"Vincent Guittot" <vincent.guittot@linaro.org>, 
	"Dietmar Eggemann" <dietmar.eggemann@arm.com>, 
	"Steven Rostedt" <rostedt@goodmis.org>, 
	"Ben Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>, 
	"Valentin Schneider" <vschneid@redhat.com>, 
	"K Prateek Nayak" <kprateek.nayak@amd.com>, 
	<linux-kernel@vger.kernel.org>
Date: Tue, 1 Sep 2026 10:38:51 +0800
Content-Transfer-Encoding: 7bit
From: "Aaron Lu" <ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260831101141.391382-1-liwanwu@kylinos.cn>
X-Original-From: Aaron Lu <ziqianlu@bytedance.com>
References: <20260831101141.391382-1-liwanwu@kylinos.cn>

On Mon, Aug 31, 2026 at 06:11:39PM +0800, Wanwu Li wrote:
> Hi Peter, Ingo,
> 
> Since commit 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
> the per-level "is something running at this level" information moved
> from cfs_rq->curr to cfs_rq->h_curr; cfs_rq->curr is now only
> maintained on the root cfs_rq. The cgroup hierarchy is kept for load
> tracking and bandwidth accounting, which makes the bandwidth paths the
> only code that still runs per-level and consults a per-level current.
> Two locations were not updated in this conversion:
> 
>   1/2: throttle_cfs_rq() reads cfs_rq->curr to decide whether the
>        throttled level has a running entity. For intermediate cfs_rqs
>        the check is always false, so quota exhaustion never requests a
>        full sched_cfs_bandwidth_slice() and never arms the deferred
>        throttle task_work via task_throttle_setup_work(); a running
>        task can out-run its group's quota until the next pick armed
>        the work instead.
> 
>   2/2: distribute_cfs_runtime() gates its clock refresh and runtime
>        accounting on cfs_rq->curr, which never fires for cgroup
>        cfs_rqs. Since commit 28ad5427682b ("sched/fair: Call
>        update_curr() before unthrottling the hierarchy")
>        unthrottle_cfs_rq() catches up unconditionally, so this is not
>        a correctness hole today, but the refresh the check was written
>        for is gone.

For this series:
Reviewed-by: Aaron Lu <ziqianlu@bytedance.com>

I also run a test where a nop is affined to a single cpu and I can see
that nop task can use more than its quota from time to time; with this
series applied, this no longer happens, so:
Tested-by: Aaron Lu <ziqianlu@bytedance.com>
