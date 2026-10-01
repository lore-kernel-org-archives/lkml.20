Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0BE1D5CC9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868368; cv=none; b=G5XPfrtbb7FgR96kDQOISUCx1meSL3HMNiwtdeWq31k4FbhWFRtpvpCxmAoedw37jsrJITTsZPVZPcI7AUZXoyU/2m3W4cUxfktR3LHE6Q6cO2hohd+fkholBywFSmxqCZXuggg6UpvxViBAYyotRT0g2QTIbxV4E/C8PXgiuaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868368; c=relaxed/simple;
	bh=yrWtzD+Y2zzA6pAxlCWnuQ/FCEsiB+jx4CfpSLCYsxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3hy39cE417MChpvxT6ywWSCXjuKM9U9nc8W67/5bIPtPqQiaQFMX9/e9BY6WFDS2mqD/hUM8K22/BiSq+icy1ZnkzkX4yr2wb477H6sFZISpT1SQoH5vjbN2IohIN6AqaNJ6BXxUdcfpsXWknwXxaAF90JKkzlFIQk6cnd4s1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gsgfYX6o; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mAjWzKDi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gsgfYX6o";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mAjWzKDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790868366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w/hpqVflB8WfsdWh8gig5XZXFQD9BLKhn5uQalNXGDg=;
	b=gsgfYX6oV5z8UYSUQxkAWoBu6TcK+Ja7SxrxzYDGXRs/SqheIVxwUMy0oSF+/h+4MJX80O
	0B4pYIUhfWkK8oUsv7z9uC1aa1Xj+7FoG6zZdwbgZhLW41DP/uzDaQKKn3e2WUsabsLbU2
	phLIEkZaraEHuPuCbcqPpGikYfSmMwo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-6CZqSI6gNy-otiWgoE4DeQ-1; Thu, 01 Oct 2026 11:26:04 -0400
X-MC-Unique: 6CZqSI6gNy-otiWgoE4DeQ-1
X-Mimecast-MFC-AGG-ID: 6CZqSI6gNy-otiWgoE4DeQ_1790868364
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f6e8b5996so6095333f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790868364; x=1791473164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/hpqVflB8WfsdWh8gig5XZXFQD9BLKhn5uQalNXGDg=;
        b=mAjWzKDixh9avB+f+7r0kfoDIcLuqmTpNYP2TuJHgk/jWdjDiRcZ3qGaQwtX0UeLzQ
         7O6mSMt7RtDd94YVYPhzkUlHTKSYpjVX5EfGGccupjbOzpry9VgNdVa71oQjccas688e
         8fVPqIjflRJ50Oep6cz1bzAVyrm4LRkZY+rQNZJLkD42l4dzhvDr1CATFv6WQBbHM0hS
         YXPpF0aeZtbRD7hFyORQOHafbyhuwu5k6ue7ag7Ny+HOMZ12zXUDo9pGwR6EWQWmriom
         zMhbvJWNk60Om/frzwwTIjWIOZ2G8/4F/Paq/NkatT9JeYO5RlKhdK3iCTUGW8GKPY/M
         fMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790868364; x=1791473164;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/hpqVflB8WfsdWh8gig5XZXFQD9BLKhn5uQalNXGDg=;
        b=LL5dlFORlWZvxljQ4YRKo7iJov0A9MHGNWDptC8TdPuHKv72GbrCOUZgimMu6n5IT5
         bWVqrtQLgR2FrJsj9geiUk165cpQfxjMYiyWgW79qFY+nTCouoL+lNIohUMtUtDSx5n7
         H6xK+ZJGH538CCrFAsMEsY0c554VRQxz1FCTijC/eA3bnNZJN4iW0txrJfGRvYWWynGy
         Kfg9EJppeE3TO3jvJj6ZlJMIoFFnpsUpf56vpYNLNTH5wRzpQDxpR6N6XxSLvK0Hipi5
         y8dkjIlYJqIk1Az64tQAJIq/6NS+dLICOlSZKZQgoaFx4CR3N9AKT9CfZDr8uZNQ3wE3
         CQxw==
X-Forwarded-Encrypted: i=1; AKwUvBzmuC8PoB+bVyIxsewpFdOo2tYRLjtTA5zxT3lyo2da/RGu66fUpxxL8SnwXTP2+HP6OHXzTB2ODXb44D0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOFyX+uqBsgh/zNz/Y8Y065LOjucQyXUG0rmtoFdCuTfQ9nc6G
	MLeRJdbOkujDwbwfGTPL8Nvqksve9zCC/VIufSIKZjQI4rlyWnBjLJFOq8tybqdvBzm8lWu06sp
	xOg56++uMAI4+l3fVAgf6pMIfo1tbrPF2m2IZJ+ZDPM6HP/9a0NChvpEGKFs86+hdPA==
X-Gm-Gg: AYBFou3NE3zf2C/CDLLCJYSkzaalGlzLbPF+bOWcpPLjj1dqOZtoFdx4hlWkaq+apuW
	vLRjK3a87us5vIPamqQ/aAy44DOsQonR9bW/d1qQFgDrWrmBMH2VCXNhPuW3Kk8XypID58ZGZCt
	eJDKSqxdoSab8p80gzVC4VMQOzeeCbzhbbr6ooR9aJSDBJn6e1Y7LfNX/iYIQwGEUp3oqYihSY6
	lyqDPsFpXqFRsZnh+IleT+ML3XEUg0SG199NA6YYkFi41q5fG32xuzc3ci4ZJHeyZrIa/OaTxRB
	xgVkaRvk3PTOgFNJ7ahvdlNf1THTAo8Ba3rlQMRNaT469P24hM8qo0cHrIovfvGBx89j44KYbFs
	3FiybkUtbvXAi/oeOcs9qyb+/SQCa
X-Received: by 2002:a05:6000:2613:b0:48a:f509:c22a with SMTP id ffacd0b85a97d-48b1256b860mr5933f8f.0.1790868363520;
        Thu, 01 Oct 2026 08:26:03 -0700 (PDT)
X-Received: by 2002:a05:6000:2613:b0:48a:f509:c22a with SMTP id ffacd0b85a97d-48b1256b860mr5866f8f.0.1790868362985;
        Thu, 01 Oct 2026 08:26:02 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.14.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0690e721sm7077992f8f.20.2026.10.01.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:26:01 -0700 (PDT)
Date: Thu, 1 Oct 2026 17:25:59 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Andrea Righi <arighi@nvidia.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Haufe <dhaufe@simplextrading.com>,
	Cao Ruichuang <create0818@163.com>,
	Furkan =?utf-8?B?w4dhbMSxxZ9rYW4=?= <frn1furkan10@gmail.com>,
	ionut.nechita@windriver.com
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Message-ID: <ar57h-DsEVtuZnVw@jlelli-thinkpadt14gen4.remote.csb>
References: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
 <20261001142735.GT2009045@noisy.programming.kicks-ass.net>
 <20261001143314.GK4121620@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001143314.GK4121620@noisy.programming.kicks-ass.net>

On 01/10/26 16:33, Peter Zijlstra wrote:
> On Thu, Oct 01, 2026 at 04:27:36PM +0200, Peter Zijlstra wrote:
> 
> > >  bool sched_can_stop_tick(struct rq *rq)
> > >  {
> > >  	/* Deadline tasks, even if single, need the tick */
> > >  	if (rq->dl.dl_nr_running)
> > >  		return false;
> > >  
> > >  	/*
> > > +	 * If there are RT tasks, we may need the tick (for >1 RR tasks),
> > > +	 * but we must also service lower-priority CFS/SCX tasks via dl-servers.
> > >  	 */
> > > +	if (rq->rt.rt_nr_running) {
> > > +		bool cfs_or_scx_queued = false;
> > > +
> > > +		if (rq->cfs.h_nr_queued) {
> > > +			dl_server_start(&rq->fair_server);
> > > +			cfs_or_scx_queued = true;
> > > +		}
> > > +#ifdef CONFIG_SCHED_CLASS_EXT
> > > +		if (rq->scx.nr_running) {
> > > +			dl_server_start(&rq->ext_server);
> > > +			cfs_or_scx_queued = true;
> > > +		}
> > > +#endif
> > > +		if (cfs_or_scx_queued)
> > >  			return false;
> 
> What the purpose of this boolean, both true assignments above can simply
> be return false, no?

But we won't start the ext_server, even if EXT tasks are present, if we
return false in case CFS tasks are present.

> 
> > >  
> > > +		/*
> > > +		 * Only RT tasks, no CFS/SCX. Stop servers to prevent spurious
> 
> No DL either, you've filtered those out above.

Right.

> 
> > > +		 * wakeups. Tick can stop for single RR or any FIFO, but must
> > > +		 * run for multiple RR (round-robin behavior).
> > > +		 */
> > > +		dl_servers_stop_all(rq);
> > > +		if (rq->rt.rr_nr_running > 1)
> > > +			return false;
> > >  		return true;
> > > +	}
> 

