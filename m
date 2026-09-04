Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C492418348
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503254; cv=none; b=lUYOx3tT2NdPC8SGMgiJ0rl6LCnZHvTc19GTsHKcEC9EjcFGnszbEEvc3g+NwX6kDA0iav4h5bmUrKAWpr06bSg6RqgDteTZ0VQxqy45fH1ZkYcvkqdV9awT36qS/klvzU7edWWsHRSYHO2uCoOeb0KjraWXk7fb/Q6htRLhv80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503254; c=relaxed/simple;
	bh=ikSdKD5ajiQaXYPlfLAWn0De0A7chXy33MSVWmVxeIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jieULvNx5d2DCRJ1YUEyzhTkCaIx2smTeuPhvRp6z0eukGWyFcO0UDpOyL8GpYweYSrQIxr1hn4ijpw9IsnPpmuMcXqtnvvA8k0rIcghjuXxjVxZ1lRNlu1n2nSV2MuGFivN29RWrVShk/e0cpNGJ378NDhELzadjzsYYb2aR5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCC+z5p5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCC+z5p5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750351F00A3D;
	Fri,  4 Sep 2026 06:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788503252;
	bh=cu0gp4QvfiZCbMS9FUDGSKA7SVBqH+TI1AgZ38lFb2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hCC+z5p5+LFbUnO2l9vgCz2Mb481JGpfi5NSAHCotIpMC7UgpewLpBU+sJyEfrzdE
	 ogwyxHfdgbaX6QYpRZuRz+7w029KUO64/8sdEaLq2prFAbVCBLrIGHFV/xZZkQIuzQ
	 ZyO7VWFBE9ktv60FfX5QWaOKKPyAzc+2vziTSanfJRQh0APdMs4ONRW6oHPb6bogga
	 P3uhczgJJdZRJLNVRliTx+JfgjSgGmEZwl3g9xuTYt0dlN6XxAPico/0vJsEj4TTXE
	 CmbCX9Y6VOOIuqTag8z/+iYMOxDwEQv9M55C3A6D6bzfbSk4eaOPRxRNmJHmBOAZRW
	 U249KhqYgp/JA==
Date: Thu, 3 Sep 2026 20:27:31 -1000
From: Tejun Heo <tj@kernel.org>
To: Hui Su <sh_def@163.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, jstultz@google.com,
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/cputime: Account cgroup fields to the scheduling
 context
Message-ID: <appk0wG9RlWojNLJ@slm.duckdns.org>
References: <apmuywWz3c0keI2i@slm.duckdns.org>
 <20260904023705.106589-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904023705.106589-1-sh_def@163.com>

Hello,

On Fri, Sep 04, 2026 at 10:37:05AM +0800, Hui Su wrote:
> You're right that cputime_adjust() reconciles the user/system split
> against the total usage, so my description of this as a user-visible
> cpu.stat inconsistency was too strong.
> 
> My patch followed the cgroup accounting behavior introduced by
> aa4f74dfd42b, where cgroup_account_cputime() charges CPU time to the
> donor, and tried to make the tick and vtime cgroup field accounting
> follow the same context.
> 
> Following your suggestion, the simpler fix is to make cgroup CPU usage
> follow the execution context as well, matching the per-task and
> thread-group accounting. That would also let me drop the cputime boundary
> and donor lifetime machinery from this patch.

cgroup accounting deviating from task accounting doesn't seem to make sense
to me but I haven't thought too much about proxy execution, so let's hear
what John has to say.

Thanks.

-- 
tejun
