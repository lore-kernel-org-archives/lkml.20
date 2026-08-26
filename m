Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0343B8921
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743890; cv=none; b=gnbv1x23bV+cfBUAEcvsq5aKqFLzoO2gB1RwEINzjGxT3yEceeTNvMPKBLrmYKlmMGd2ya95GCw3oOX0y1sx+8RRSsllkSGDxaJbyNXJQ3Czf1rY897LhMGMBPJuLkkHtSjaLq8KYugCIjQJ15yzCbbDFmrsUeVnIY1J6A7PfZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743890; c=relaxed/simple;
	bh=eMo7LVmi4kTxJPU1gdBszR5zKP8CvS5o6gjlEOV4Aqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQzkRvHvZ5OGVohPOun/F6RXzboqQPyqproKLRb6xCZYxqnOiQt2sqORKufzznxGLX7s+WtvfseA66sVFyw9rH7Nk7yjuVflm4Nai1tDP0xSC4sGZQAc+HW6KkGBv+i0OxUShaall8o8ccTwDE2oKvsKBmgPLka+V++Jih68zI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MKzGvFRV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MKzGvFRV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a3819e8be8so1969688a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787743887; x=1788348687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oclVe+LnTTMG5CsEFLjmc5yBGNGU84yElgp9RKgPFsM=;
        b=MKzGvFRV3mXwM6gP38jy8fGXgrp8p7leyHZe/3ULhPqJd6Wwr3PrsU3A8pQq9eW8I1
         Fq1FYfmsml8gGJpwJJiDv4MoB3OCfbdJ2/GDk4bF07fiiOuTQOpM1nKQ1O5VWo9IHSwM
         DMgwqUNvTxauvSg+qxQ6zNe50H2QI1fUDIawSwLLCbFCfvh2qeceCAb1S5X0jWhANXZK
         54Y8n3pJLnK5+GMPdxtzvdz9WitthJHRwB0Z6DIa4LUcB/JpM5rLWwLjwBbo1YwEdvxB
         3ssJ2GNBUjJrDsnVKVDpqMTOqgSYpi9MqxE/T4XRBM8l5FL3B20v+LS1k9bpfyStBPRu
         g6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743887; x=1788348687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oclVe+LnTTMG5CsEFLjmc5yBGNGU84yElgp9RKgPFsM=;
        b=mPilhUDShoMqcgmkMw+6pbD23lMn1E/4KYt0qdeOGvjGFUsA5EwOEiR3j+p3Yy1kRL
         NbeYZJzc9NPBxh5BnQuOzIJFy0NSleaqodKMgmgkWfDTxp6UXtl54Ecb3aD1huCnyh3I
         UCxG8st3SLYAIoLHxvESswUKF6+vxZXUjU/LToHCNpiHx4N3q4maI9oBqjl9RHCYs/0w
         F3YM28x+StXmBtZuVNr8dnD3ERx3m6P+7mbXFZkjC80gK+ukmKcnr4amtVIMYMyAZn/l
         46DbsWnwvLrVodDdJeNPLTq44j0tkfmCTZBjwMz0PQ4WgckJ195upL2s05Yv+btXDS8g
         zEQA==
X-Forwarded-Encrypted: i=1; AHgh+RrFA51lUIcz2GAFK9lOuawidz13emk1yjtGclQnCtxJAfqMKIS1n4Vtc9Vh7hTllyuM/EGI8ddTv+BWinw=@vger.kernel.org
X-Gm-Message-State: AFuF++lt7Y+2pK3iyZpv+dRFmRf+I6nwsTwHHApqwT/U+/uMwVT29e8Z
	jxdIEctPcjADYw743l4VT7MqiJJNNOlnkIWw4jEmjWk7QrbJ4sO3yUdAdBbIxAE9JU0=
X-Gm-Gg: AR+sD10HC0IjNhN9I81FTBMIb2mXqVOw/cE1cWBwP1rY3mdGLvyU+uNQTQw579p4u3l
	fDgJCCY9y96JB+62tDZfCnp7pcKX03wlfV+kn6gQH/la5QWuXk5Iw1lzhlrdwQ6X28pmxpXiNkf
	+mCYvlubr13WJTApP1fWIWrePwxz6uwP9I/jT1xyELDiPf0F/k93aGKq4X60dxhueDDJhobEp1u
	tUt+cT7dJalSaXGezPSxM+z9uETHAH+K8AA3hRLju77FUq8XRLbRqm5dimF7UIXtGPp3gRQN/s0
	jsuJ3u9hoaRG/cin/+ep1o66+y+59ukk23Mybj7xU3i3HV1lEcsdwdA7Y7izAN7ndjRbjcbrBdh
	iNm9/9KImY8SSVhEz1LogLsMe2U/S5/N7kdtXe9Wj6CkZTTcOJhQdGWzEDTRZ+1ZE19hyNJW5Yw
	pElUXIMit/r2ZVcqjpeXpmeHq3g66ERxqSx2dRAH/rPWCO/4xlBDFjgYJ44e0/oJEYg6+nHnXEr
	Q==
X-Received: by 2002:a05:6402:5054:b0:697:eb97:a4ed with SMTP id 4fb4d7f45d1cf-6a5df313c4cmr6997437a12.7.1787743886784;
        Wed, 26 Aug 2026 04:31:26 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b621fsm4438273a12.5.2026.08.26.04.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:31:26 -0700 (PDT)
Date: Wed, 26 Aug 2026 13:31:24 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: atomlin@atomlin.com, akpm@linux-foundation.org, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, steve@abita.co,
	mproche@gmail.com, nick.lange@gmail.com
Subject: Re: [PATCH v9 2/2] hung_task: Log summary line when warning budget
 is exhausted
Message-ID: <ao7OjHXyepmwaTr_@pathway.suse.cz>
References: <20260814135718.494513-3-atomlin@atomlin.com>
 <20260814162734.76714-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814162734.76714-1-lance.yang@linux.dev>

On Sat 2026-08-15 00:27:34, Lance Yang wrote:
> 
> On Fri, Aug 14, 2026 at 09:57:18AM -0400, Aaron Tomlin wrote:
> >Once the warning budget is exhausted, hung_task_info() stops printing
> >per-task details. To provide visibility without causing additional log
> >spam, emit a single aggregate summary line at the end of each watchdog
> >scan when hung tasks are detected and the warning budget is exhausted.
> >
> >Keep per-task reports budgeted to avoid flooding dmesg or causing
> >ring buffer overflows during system-wide hangs.
> 
> Hm... not quite unconditional. hung_task_call_panic still gets through
> budget gate, so with hung_task_warnings=1 and hung_task_panic=2, first
> task can exhaust budget and second one still gets full details (right
> before panic).

Great catch!

> I'd write changelog like this:
> 
> Once the warning budget is exhausted, hung_task_info() normally stops
> printing per-task details. When panic is triggered, full details are
> still printed so diagnostics remain available before panic.
> 
> To retain visibility without restoring per-task output after budget
> exhaustion, emit a single aggregate summary line at the end of each
> watchdog scan that detects hung tasks with an exhausted budget. This
> keeps non-panic per-task reports budgeted during system-wide hangs.

Yup, this sounds better.

> >--- a/kernel/hung_task.c
> >+++ b/kernel/hung_task.c
> >@@ -268,7 +268,7 @@ static void hung_task_info(struct task_struct *t, unsigned long timeout,
> > 		debug_show_blocker(t, timeout);
> > 
> > 		if (!hung_task_warnings_printed)
> >-			pr_info("Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings\n");
> >+			pr_info("Future hung task reports won't print details about each process, see sysctl kernel.hung_task_warnings\n");
> 
> Same exception here... next task can hit panic threshold and print full
> details anyway (and this line can be printed while hung_task_call_panic
> is already set).
> 
> I'd make condition and message match actual behavior:
> 
> "hung_task: further per-task details suppressed until warning budget is
> reset or panic is triggered (see sysctl kernel.hung_task_warnings)\n"

Looks better as well.

With the two changes:

Reviewed-by: Petr Mladek <pmladek@suse.com>

One more idea. It might be useful to print a message also
in first clean check after a stall was resolved.

But it might need to add one more variable, e.g.
last_round_count. We could not check
(hung_task_warnings_printed != READ_ONCE(sysctl_hung_task_warnings))
because it might be racy.

It might be done later in a separate patch.

Best Regards,
Petr
