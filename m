Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254214;
	b=z8RMXdrGcT/9UlVo71rt3SGksOaK7xhp+82Ety6JYwlXnGZS7Fw9pf5jG+id9LrBHheM
	 bjRkLJS2wlu7q5FO36Y8LXxWoSJGj3rvqG57ojCldOO7tbgxQqjIa8qQ7d8vJmuMGi6bV
	 NqDtm6/fiKnOaOICOkUrKzhXm2EycbLYPDbtut+GL4nswDO9u54ZowytW65Gp7b063NfI
	 RbyIa6awHda8xk9tHMfDaHLor0lzqE4KYJ8FhlaEYhM3s0+vUPsCOOssQUuLfRMh+85ZB
	 7VsuLqtCizRB6xXrSsBrYgYknr9Wimq0AZdsBlbB3EOpP/IXLbeWag8eOUayuLKpfEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SXqdVx5FuRoJfcSZ0X9tPlMemMPV7a99j+mnsg7v/74=;
	b=jcnSbSUPWwtbcwUrlpCncpZULxCoBA9fKeAbaIcStg8RKFtIr7ztB1Gy0K75MbTE7ECK
	 d0ZvgoIVXWLNlgjbA636BnHJGdPhgEqPcPkIWH02zlcno15sozFyj6oeR+iJcTibRht0F
	 5RElByKHSf9XDbQ7HBZlk/LB1WQDhdzK5Nn0AEH4YSLf5Wx0jj8PUPtOJj3Ji2K6ZJ778
	 m6WoP0P8FF0Bas2FEQZEX+ADepolA6LLXs0RsP/7A5sWqv78T0T4gwjK/BwmN6qhPoS3a
	 JqazDAYvYQKnIAiaXVKYTCTrJ4oGIyzDu+D7P2PlAmWPORqHEn7Z0DooY/E2YCi+q2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="It/ZW3mi";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E430860A2601
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E430860A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=It/ZW3mi
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so1465385e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254212; x=1794859012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SXqdVx5FuRoJfcSZ0X9tPlMemMPV7a99j+mnsg7v/74=;
        b=It/ZW3mi1F849woevc8zv/gjFS2atQmWxScJA3uGW9yGhtBvqjkALgrODpr5oRCPEC
         MyUoDr+R/iIDfTcWKd9MdtvHwSZYj3B8R0a4xKC/1d3mfuUXI6iLh7YLk0DMBiIMNFFs
         PpozlMYb4m3ClOL2tDzFT15WS3LaTB8UenffAhUB5x9+MCz28wMFbnmYEOEgbADzNbID
         gzX3pFb5vPoPv7w0A+bQ/uefxJYvS2YvqU5+jxJpahWy54aYYo+zP9uahZIzxXUH+SzP
         7d97yb5yF1EY3MpCQbTdfThHGNwBNFEmkvQwFeiZU/Oe7kXlWgQsZgEscD89hwMRzs39
         3yFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254212; x=1794859012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXqdVx5FuRoJfcSZ0X9tPlMemMPV7a99j+mnsg7v/74=;
        b=1OHXw35ZpwFLbqs33aiVpBDQ5hPlrweDmOAUGCOdJXd/55orLPDFsbgvbTZK7ahBK6
         FdoM/cZwDNm2s4fzG0VDZ7d23wLxBTUEgVLMyzIT4RIYe1tuSDE6wwllz2xAvC3R2Bpo
         ewXgKq3vO5jMzMC4/htJxzyP7zdKkuxNs8/nxGGnZcNIU/JkEqnyKac1o/ifGxzBekCg
         aqCHwtCzPVoVbHmMOAzTPpB6k7OShutKHwPefA0SyOf90MIk2hY+HIWoMTQsVmNL8B7m
         ORXT5lZdrsDgfzL9pQd9q5m4PAZ95SHGE1wN6xoZXwoyWIBPQ2UuxCsIDEGTfzeYwyXD
         qudA==
X-Forwarded-Encrypted: i=1; AL+hErHfDSXac2V45cZ10EZTf/URrIKzdlqdFWAMaPkEei+izOJsL65BesjhE0mMMULIuuUfKJEfox6yPH6ecYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8jTsSi4FGGKLPF1DL9+DtWXciOyZU4qt+RTUj9F+8qx6p/kM5
	krreEsW4y63Bmh3xi46Ml0vOXDhmpXZJN+mjK34PQsWhOwNBeuHLOkcB
X-Gm-Gg: AYBFou0HeMV4yqlAa4hEQ/HVujJGXMXsKP6nqoNl69fQFvI+Pn9h3L+Ig6+bSdS8hZ3
	WvWModoI/iCNe45jPsknYqwZB/lNBOzX0Ojpg2l6wvSeaGWF7mcEqI9RWuKyHi3QZPqg6RhZ5n2
	STEV5cHXc0JVvVn60YokjsK2VK7zeU1TZJfIL2zww2EKvc1Y1EZeOaIWTGkXFzjeT0FpvzvE5M7
	ItdOJXd1L1KWrQm8nfg/U/9j6BuSiy/YPpzlrwH5c5P39PhsFqnU8rHiBMLa3LyStLmv9aKX2D3
	56qWY8Fr5G2QI+Lij6W1zjnqxUj9wfgM5ikFj/DCh3PN/ufcBuCruf+xUv7OlLHKorESjiL0iRb
	QpEWfq+IbD3x2atKma1qo3MR7tkmIewSF2R4M+2K2lFM3+3UuXd4U16NVMhc24sL5WexUkGm/Eg
	Jnz3WR+KqCXHs7sKrQAJ24thuCJMI8akRPkA/QYPp8tQ1NJFxsI7FCJYf4N80dvkHLd5EBMPf0k
	pWF8hQJVJdEyRnbXQ2sbFmjUGnMBa4xfhmX4/5C1/jqitFnzaHlAu/Z2NhQ9onw111jK5VyiNll
	BzmR3bmUxzZEWdCWqFoCSv59iDjW1nKoi0v8d0Pn+ZnE71SNzZ4jDXM=
X-Received: by 2002:a05:600c:4812:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4ba0233982cmr3105225e9.2.1794254212140;
        Mon, 09 Nov 2026 11:56:52 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm10595085e9.5.2026.11.09.11.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:56:51 -0800 (PST)
Date: Mon, 9 Nov 2026 22:56:47 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	lukasz.luba@arm.com, rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Subject: Re: [PATCH 06/20 v3] sched/eevdf: Add min slice check when selecting
 CPU
Message-ID: <avIh4MZjVyQuF6Yo@scheduler.schedules>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-7-vincent.guittot@linaro.org>
 <au7SabL5pfbsApyB@scheduler.schedules>
 <CAKfTPtBfXOcAd=5RkYepRn15Hg=id9FQ3jh1tQoewOtUSrsjHw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKfTPtBfXOcAd=5RkYepRn15Hg=id9FQ3jh1tQoewOtUSrsjHw@mail.gmail.com>

On Mon, Nov 09, 2026 at 04:55:23PM +0100, Vincent Guittot wrote:
> On Sat, 7 Nov 2026 at 09:57, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> >
> >
> > Hi Vincent,
> >
> >
> > Sashiko reviewed this one so I'll just put here my own concerns instead
> > of repeating.
> 
> Regarding sashiko's feedback about cpu state ranking, I chose this
> ranking on purpose.
> For !SMT :
> - 7 CPU is idle and fully fits (i.e. return immediately)
> - 6 CPU fully fits and is not idle but we can preempt current because
> of slice so the task will run on the best CPU immediately
> - 5 CPU is idle but doesn't fit uclamp min. On such a CPU, the task
> can easily miss its deadline
> - 4 CPU is idle but doesn't fit at all. This is even worse
> 
> For SMT
> - 7:CPU is idle and fully fits (i.e. return immediately)
> - 6: CPU is busy and fully fits. Although CPU is not idle, task can
> preempt current because of its slice and run immediately on a CPU.
> This is similar to an idle CPU (and maybe even better). While writing
> this, I realize that I should probably check the lag too
> - 5: CPU is idle but doesn't fit uclamp min. On such a CPU, the task
> can easily miss its deadline
> - 4: CPU is idle but doesn't fit at all. This is even worse than -5
> - 3: CPU is idle and fits for task but sibling is busy
> - 2: CPU and sibling are busy and fits for task and like-6 task will
> run immediately
> - 1: CPU is idle and doesn't fit uclamp and sibling is busy
>   0: CPU is idle but doesn't fit at all, and sibling is busy.
> 
> Note that with the push mecanism we could look for another CPU for the
> task that will be preempted
> 

Thanks for the great explanation! My only concern is on 6 and 2, as I
explained in my first message, below.

Sashiko also pointed out other concerns, it would be good to check them
all out.

> >
> >
> > Look here:
> >
> > CPU1: CPU2:
> > FA    RA
> >       FC
> >
> > CPU2 has 1 RT and 1 Fair tasks named RA and FC.
> > Let's say RA is running on CPU2 and FC's slice is 10 ms.
> >
> > And let's say FA has 8 ms slice, and a fair task named TC is waking up
> > with 9 ms slice:
> >
> > * We look to CPU1, 9 < 8 is false so we return false
> >
> > * We look to CPU2, 9 < 10 is true so we return it.
> >
> > But the problem is, CPU2 has a RT task running and we are going to
> > compete with the RT task. In that case it can be worse than CPU1.
> >


Thanks,

Kayra
