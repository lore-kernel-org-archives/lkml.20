Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70537381E86
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258113; cv=none; b=cyHeBPCQ3IqvsHwYiFMtf7hodnH6xIdFVsmldpdq3oZmNNtXI6qxjT+Wza1xMoPtoPkzjHyIEUJmsru028owLNbspuHDZTcbhVAPCqSbJjdIjrHhOFrF0F8DLW+AcMRuxe1Wz8g2syh1VMScEZYokkJZKsb3Zr5RZBkojwwJ9co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258113; c=relaxed/simple;
	bh=llez6srv0x2mfA82/6nWFmsaOd7iaHQfrJM1x7G3JLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+lO6+g9VFYB62w/intmZP6QgOuc3JPvykLnru3BjGuI5IqofoRP+P/XI5P5+AVIHkf5qZHsmZfwk0uqlvgf6LoTQkqWbUobp9isV4YBCdepaZjGHUpPKn0JOSXTNynI4hs1ZiR2Y6J0OtOq5BmUDNma7vRCa02EdX/RvAFR3pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Azliz5Ri; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Azliz5Ri"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UpdeMGfd8b+o9KqD26nR/EnRAqCD0c+UXHsElmYi9Kc=; b=Azliz5RiKxMn72G8mt17665AVO
	zpTiqmOt8IT5ymxcithw/Mwjj9BlR2HWjn8pQRKcEhUXXzisvVwjFAee68KPIbURnUoSG9pqHaXYu
	RSyC39k+6+phOvdvtrEaEX1FK/ActlGwfx4gNkHoUHQk1OvOUYMNxLqSzqLnq5fY9fobKWhQRhljF
	oDgWJwXLqP+RwVVIyUBycWtpmjRfNhC4a4rtC1CUunjVuG+EWWtvjYOpJznbP2sUTtyPYWEUlLU6v
	lyx3xSNM56wD7kd5Za0FfI8gOabLrTSk6Kt3APAupcTzZq72c6e24hX9srKWrQ7Vg3vVXnc2ywQE9
	tPYQMj8Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1LcP-0000000AqjP-1FAU;
	Tue, 01 Sep 2026 10:21:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9339D300578; Tue, 01 Sep 2026 12:21:27 +0200 (CEST)
Date: Tue, 1 Sep 2026 12:21:27 +0200
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
Subject: Re: [RFC PATCH v2 08/23] sched/topology: Introduce a per-CPU tasks
 NUMA preferred counter
Message-ID: <20260901102127.GY687043@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-9-wujianyong@hygon.cn>
 <20260831132414.GN4120091@noisy.programming.kicks-ass.net>
 <8eb55be5c1e9497c9f34f15436b9d665@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eb55be5c1e9497c9f34f15436b9d665@hygon.cn>

On Tue, Sep 01, 2026 at 08:31:35AM +0000, Jianyong Wu wrote:

> > On Thu, Aug 27, 2026 at 08:28:01PM +0800, Jianyong Wu wrote:
> > > Like the existed task LLC preferred counter, sd->llc_counts, introduce
> > > sd->numa_counts to denotes the task number that prefer each NUMA node in
> > > a certain rq.
> > >
> > 
> > To what purpose? Is not the node occupancy the direct sum of its
> > constituent llc occupancy?
> 
> numa_counts is used by the affinity score in patch 12. It holds, for each
> NUMA node, the number of tasks on this rq whose preferred LLC falls in
> that node.
> 
> You're right that numerically it equals the per-node sum of llc_counts.
> The reason to keep it is granularity: NUMA-level load balance scores at
> node granularity (numa_counts[node] * distance_delta), while NODE-level
> balancing scores at LLC granularity (llc_counts[llc] * ...). Maintaining
> the node aggregate costs only a single llc_to_node() lookup (an O(1)
> array read) plus one increment in enqueue/dequeue, whereas recomputing
> the per-node sum would have to walk every LLC of a node each time the
> NUMA-level score is evaluated.

Consider the trade-off. Adding the accounting adds a cache-miss to every
enqueue/dequeue, while re-computing the value on-demand adds some little
cost to the balancing (slow) path.

If the llc_counts[] array is dense in node order, then it is likely all
relevant numbers are in a single line and computing the sum is in fact
fairly cheap.
