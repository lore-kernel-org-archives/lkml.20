Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614113;
	b=lfMAAbMCfizkTEOIUV++G1ZHLNxMX0gZoC5iPQKOCBzqPqENXz+HH0RW10S5WQJiIQNj
	 Lg/BRf+UbWAuGUmMgmWMv+1S4IgeABWekZS5f1Gb0UJdi3R3el3oYWbXDtIOoHXIGgWiY
	 86ELZFXO2XAzBFy99dmC7oqYB2JXQQ/bCJmPnBbiKtlGbtRc66Mbq4gsn0K+UB2c9I/Kn
	 ekLQsC2Muq7KEU1hAOgXmEfO8/d5I0+tD38cjBK9+7UO0wj3KoApo1p/jnzllGfzO3X//
	 c635vj0IAnPXTutqdSpGnIfwOaCsIyxYsY0lkiSDlhDbsPm9Ztm/y6sREYDqyzQWxww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614113;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2QAuBoqKuE+cIrY28tIIRA/uX6efXaA0O83MjGB9jy0=;
	b=MqFkEVTNhohoPalcNh0eUNP2afWq1eAaoV944sf4MI8EQbR8rQ0sUIb7Nj9XRUuaAGGK
	 PP0CWyySAcKnFSgsvGPB0ulCrakxK2XaKAsGM34XjCYp3pA21RsSePD1MGSKgsxB7EpFL
	 Sgj0v+eYsQoAIojMzAXglIQQSHML7ZlY7gl5LJ1F96kY8a+xq6obQedh/GUSQAX2btf1p
	 lmWG+OVli3bcLHOaKir6/H2s1lpKfFEyVtl8Jur0BpBrRObV1HsG8+qELfPt9fKg23NE+
	 +pP0QwP3GrYyqfUQOXVGLshxKUaXHnSJc7n70IL4gqYKqkTtmgNwqZ5DuQyyEYatakQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JuFYhgTW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ScssRGzI;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9FA606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD9FA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JuFYhgTW;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ScssRGzI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793614111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2QAuBoqKuE+cIrY28tIIRA/uX6efXaA0O83MjGB9jy0=;
	b=JuFYhgTWdvRwg0i5MAfZZB5EaoJo8hguA6s3SSjJq6l3V/ADjXrOvEoMW7twlyPDFcLPjo
	bmKkDPS7zahUHtVH9DAoSUNZKszGRoeDBWQLmQFoZLhEEWm3ugWNRti0yiGzfnG2VIBlUJ
	wfqkj+PiSu+uEgmUjKhUSj5YCBazpi8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-Ac9IhYZgPuGC0iQ9QDFJvA-1; Mon, 02 Nov 2026 05:08:28 -0500
X-MC-Unique: Ac9IhYZgPuGC0iQ9QDFJvA-1
X-Mimecast-MFC-AGG-ID: Ac9IhYZgPuGC0iQ9QDFJvA_1793614107
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e17d30a79so1389374f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793614107; x=1794218907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2QAuBoqKuE+cIrY28tIIRA/uX6efXaA0O83MjGB9jy0=;
        b=ScssRGzIsY5UodUdMsOgx2cVoZbt+bFXTqyOuVexuwkGj6MHCXWLfb+spd/zpFaY1r
         6ooLjoLOdq0EZPoIkxo+zdJDCLuWjWzbzmy5F7Kh5HV/5bCeYvfVw3z5x9L1QecemWNt
         7Ccg/Rb9OEGYnHw18o2r/+x1TodNwoR8ANRymkFb5w5SNaH2ZhStRxfrdXjTUtNosy+B
         /NQRwq2p6ugzcsVJsfTXasCjJuQUlVBV63iFojHwfihBcWk4fg7WqJ+NfBxZMn7x3tbU
         aOaQysyIcUGWmvdIMCdidhOaMIqQbTf4Ucx7c+kpN/BL9GRhYTj2R7EKw3yWnJsK2wmK
         2myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614107; x=1794218907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QAuBoqKuE+cIrY28tIIRA/uX6efXaA0O83MjGB9jy0=;
        b=fkwiJgr7IIFcw8tJlAIP+lDgnruDiwgtBg6S0ZLKPge3LpqCv+1OJjSC4953VzvHpf
         t2toxRns+nL6zk0xCnugZAhy/yCqzKM9s0PZe2bB+aGO90m+cAnPycoUrYmNt3Lkn+/J
         jkGST0mWTRCsCWIpTQ/QQEaE81CBpvQDjks2ifDW84kwTrNRuA8JceDtIFzQKvomH8HY
         8jbXxdk0c6jGbAFHFP8xnI/bBz/Roazf7soQyICXZjG1zw9n85mA/ULW6c++gvGHpcoV
         II8k7ATYPzOsvfRkmrYyQLfwBenlUNfQ+nXphyrk/YvN9O+0JLvirQOdE2lzcpJKnYMe
         C1HA==
X-Forwarded-Encrypted: i=1; AKwUvBwapPlDY3Qa2a49ClAz0churWhQoFuPMpqOlTmxO0D67g/AQ5Q4GvG58BeKl+w6MIyfznPAD/z7yOMdhjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxTSxU3nF0cdxnfwRLN3nQt0pObUHagrpa/z6eTZiU+k9LdYiN
	HLacpCDMSiRrnHmz6Fe+FreX1PcNsJyRb+xbDB+FBLUccsLPSWUcLbyPk05fyCP7nxJx7aMqLPf
	x2BG5VP9moN6Q4cd/8h5+qiiqJbe4pxPop4zJ/QJLjSVEfJ6xnkOIPBI7f7mfLo1fqw==
X-Gm-Gg: AYBFou3R6vVYWB6hO9O+hYiaj7ekCJPTJvLLJvcAwDuhMYzWNju7xiA1dYwH+dCeFEf
	VaWclbCL+DaQJk8bixa8ctU8oSpZs6QW6sF55lAsMdFYuf+OCuYNotiz5qKU/GRRhYcfbSafZd1
	DLr4kEDtH0UN0QT6SMQTBDZRBLEDJpps4Lw37nvJ7rxJh5kr/wfZE8UXFpY3yHhJR8qNlp/ZR3z
	Mbb3aLx/9WePTl40VQTra84kRW6iut6zyiulVoT6XguFlVwWz0jVbMvE5zGSEpwLn5rX3xKfhla
	mY9jbMcPKQvnKu/dc5gMcOf4z3acTdy/PZuiFxeM9kIvNSpYsVGOl1nxpfKR9VhL5EJ3xyiP+nw
	+KGzJJgyE8S7ctNNbDeVrnixMdQETUhxvC7tmys6roN8mo+dWlYsKxqiSiuaCF84Uqxhm3ulLlR
	3zBw==
X-Received: by 2002:a05:600c:3f14:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ac14ec873emr214703045e9.4.1793614107531;
        Mon, 02 Nov 2026 02:08:27 -0800 (PST)
X-Received: by 2002:a05:600c:3f14:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ac14ec873emr214702595e9.4.1793614107099;
        Mon, 02 Nov 2026 02:08:27 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7700c3bsm239439385e9.0.2026.11.02.02.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:08:26 -0800 (PST)
Date: Mon, 2 Nov 2026 11:08:24 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Andrea Righi <arighi@nvidia.com>, sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: sched/deadline: total_bw leak when a task leaves SCHED_DEADLINE
 while not queued
Message-ID: <auhhGAjRtuSb5JP7@jlelli-thinkpadt14gen4.remote.csb>
References: <2b5fb3f22bca6aa383be8f4781923392@kernel.org>
 <auRh42kZI1xLIWNr@jlelli-thinkpadt14gen4.remote.csb>
 <1a24bcdde0bb6e4a8c839351002e841d@kernel.org>
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
In-Reply-To: <1a24bcdde0bb6e4a8c839351002e841d@kernel.org>

On 30/10/26 14:47, Tejun Heo wrote:
> Hello, Juri.
> 
> On Fri, Oct 30, 2026 at 10:22:43AM +0100, Juri Lelli wrote:
> > Does the below help?
> 
> Yes, it fixes the leak. On abf8c33470f7 with the patch, the reproducer leaks
> 0 in all three cases, and 60s of random policy churn ends with total_bw back
> at its starting value. Two problems though.

Thanks for testing and reporting the additional issues!

> sched_setattr(SCHED_OTHER) with SCHED_FLAG_KEEP_PARAMS on a sleeping
> DEADLINE task leaves it DEADLINE, but each call releases its bandwidth, and
> its exit releases it again. total_bw relative to before the task became
> DEADLINE, with a 2ms/10ms task (0.2 CPU = 209715):
> 
>   after the DEADLINE set        +209715
>   after the 1st KEEP_PARAMS call      0
>   after the 2nd                 -209715
>   after the 3rd                 -419430
>   after the task exits          -629145
> 
> After that, sched_setattr(SCHED_DEADLINE) for a new 2ms/10ms task fails with
> -EBUSY while a 3ms/10ms one is admitted, and offlining a CPU fails with
> -EBUSY.

sched_setattr(OTHER, KEEP_PARAMS) on a DEADLINE task doesn't make much
sense to me :).. I'm inclined to think we want to fail early in this
case.

> Switching a sleeping DEADLINE task to SCHED_OTHER after its CPU was offlined
> crashes in the __dl_sub() the patch adds, dividing by
> dl_bw_cpus(task_cpu(p)), which is 0 for that root domain:
> 
>   Oops: divide error: 0000 [#1] SMP NOPTI
>   RIP: 0010:switched_from_dl+0x13a/0x3e0
> 
> Unpatched mainline only leaks in this case.

This one looks like a pre-existing issue which my total_bw fix makes
worse (w/p it we leak but don't crash).

Let me see what I can do about both.

Thanks,
Juri

