Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419190;
	b=RbK7+sY+3O6ypLtiawjf3C6Xr95aamhKQIhb21MgROt6O3vpKxmPlfp/X2w17B5ZGXFM
	 yFy0wm0nnX6CjLIrwJH48CZBsvDDvt25rq0cHJinG22xmtCX6KmEX6bs8KRVcWtxL0dp4
	 ybcb61wjB0dHpyDfW7KWZ8ww5WHedaNRl5LYas6+FK3xxnmCntRUnPNMIrhi4iov4csCU
	 pYANXJzQLJ7LXbvBHFNraS5wexhOlZw8i8B/ENrQojt+ObNhjT0BVJzlyBgbpZBO90GnA
	 uUYI/gML+N9QKutMyRH6QCHDEzIY4eyYuVYe2Px9Qq9yi0hu7AUHGX3lrWeKig4vcoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419190;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Wux39rVPBd8xHmRs4BPRMKuHJT2lkiWq+nsT5+59exw=;
	b=D0ztrLPzjLOSY9LVXvkPCDvtoqd0BB6s9i6L03/mas1M6OtNVju6KSa71HKZieTOyEiU
	 SfWQ4PCfYwkRdpE3fGSisv0ObxKjJ2et0mdvv0oABnYVZ2RrniVaVPlAxVC0Lc7ZslCko
	 d3Tba+RUH89zJeWHkV0JKKIuByPiR6ITnZI/XEynLXwIE+ivNYfjK5xAovAbQkPWWf02c
	 lMh2CcgSp+73VCPCzMMRV/jRP6FQeuK3FRzmHkYmC18qIs97z2K3JDzMhOqSnvtrhLmPW
	 FwGBIhv1xXcZtmjN2RWrsOh6qex9DyVOlilNUzkzEJB7JezStAqptPVKATsopBpE2TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=j3zWMcIc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC899606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC899606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=j3zWMcIc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20F0D1576;
	Wed, 11 Nov 2026 09:46:26 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4FD43F632;
	Wed, 11 Nov 2026 09:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794419189; bh=XzPMC4L9NkLD1pgowl99MR5uN/bHkG00JpBclqFOIZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3zWMcIcYAlcXFIdvMucwRr83xNG17WlT17F0tDyRYnbeC/ImKWlIUBHMHbc/sW7+
	 EgEiKp+GoWbXftj6HEJxs/e1Q0J3hHZYt0vwKoKFXlqciWKY8778EhDwERXgzU1Jij
	 ddOMF9mLBR9KNd31ptwA4Y35+sUO60dR3DCKWrIs=
Date: Wed, 11 Nov 2026 17:46:26 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v2 19/23] coresight: trbe: Reload the AUX buffer on
 overflow restart
Message-ID: <20261111174626.GF9176@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-19-3f57cf3199b1@arm.com>
 <d93b9120-197d-4b01-a9ab-8df01657716d@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d93b9120-197d-4b01-a9ab-8df01657716d@linaro.org>

On Tue, Nov 10, 2026 at 03:12:06PM +0000, James Clark wrote:
> 
> On 16/10/2026 17:55, Leo Yan wrote:
> > PERF_EVENT_IOC_SET_OUTPUT lets events share another event's mapped output
> > buffer. For AUX events, this also selects the associated AUX area and
> > sink configuration. Perf normally establishes this sharing during setup.
> > 
> > Consider the following hypothetical live-redirection sequence, permitted
> > by the inspected perf-core paths. P is a parent event and C is its
> > inherited event, with C->parent = P. A and B are mapped AUX destination
> > buffers owned by separate, disabled cs_etm events in different task
> > contexts. All three are per-task events restricted to the same CPU, with
> > compatible output settings. P has no mmap of its own, allowing its output
> > to be redirected while A and B remain mapped through their owner events.
> > 
> > 1. P's output is redirected to A. C inherits from P and begins tracing
> >     on the selected CPU, so its open AUX transaction and TRBE hardware
> >     both use A. P can be inactive while C is running because their
> >     events are scheduled with their respective tasks.
> > 2. A userspace controller calls PERF_EVENT_IOC_SET_OUTPUT on P to select
> >     B. ring_buffer_attach() calls perf_event_stop(P, 0), which returns for
> >     inactive P without stopping C. P->rb now selects B, but C's existing
> >     handle and hardware still use A.
> > 3. C's next buffer overflow invokes trbe_handle_overflow() from the IRQ
> >     handler. It saves buf for A, ends that AUX transaction, then calls
> >     perf_aux_output_begin(handle, C). AUX begin follows C->parent and
> >     reads P's current rb, rebinding the same handle to B.
> > 
> > This is a hypothetical API sequence, not a reproduced TRBE failure or
> > an observed buffer switch in normal perf record operation.
> > 
> > Without reloading buf, __arm_trbe_enable() calculates the next buffer
> > using B through the handle, but its workaround and hardware setup still
> > receive A. If B has never been enabled, its missing CPU association can
> > cause the normal-offset calculation to dereference NULL. With a snapshot
> > buffer, hardware may instead keep using A while perf accounts output to B.
> > 
> > Reload the sink configuration after perf_aux_output_begin() so the buffer
> > and handle refer to the same AUX transaction. If the buffer is missing or
> > its CPU association does not match the interrupt's CPU data, truncate the
> > new transaction and leave TRBE disabled. Truncation requests perf to stop
> > the event; a subsequent normal restart installs the buffer and its CPU
> > association through the sink enable path.
> > 
> > Stopping inherited writers during output redirection remains a separate
> > perf-core fix.
> > 
> 
> Shouldn't we do that instead of this? It seems much better to fix this in
> perf core rather than here which is hard to understand and appears to be a
> bit hacky, and doesn't apply to all users of aux buffers. I would expect
> that even when using PERF_EVENT_IOC_SET_OUTPUT, the buffer should be
> consistent between start and stops from the point of view of individual
> drivers.

This is only a hypothetical scenario. Fixing common issues in perf core
is right thing to do, but I'd rather not spend time on this until we
can identify a real-world case.

> It makes sense to add a workaround in the driver if we can't
> control that behavior, but the code is in the same repo. Maybe we could even
> just leave this patch out and do the core fix later?

Let's see the simplified flow:

  trbe_handle_overflow() {

    buf = etm_perf_sink_config(handle);

    ...

    perf_aux_output_end(handle, size);
    event_data = perf_aux_output_begin(handle, event);

    buf = etm_perf_sink_config(handle);

    ...
  }

The overflow handler ends one AUX transaction and starts another.
Although perf_aux_output_begin() returns updated event_data,
the buf pointer still refers to the old buffer, potentially causing
a mismatch in the hypothetical scenario.

In contrast, Intel PT and SPE use the updated buffer pointer returned
by perf_aux_output_begin() to program the hardware, so they don't
have the same issue.

> Unrelated to this, the sashiko report that says there is an out of bounds
> read if the output is switched to an ETF buffer seems to be pre-existing.
> But it's something worth thinking about.

I roughly remembered the comment mentioned a race condtion due to swap
TRBE and ETF buffer _within_ the same session. I don't think this will
happen. (I will double check Sashiko comment).

Thanks,
Leo
