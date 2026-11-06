Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793982311;
	b=s1qW/vXhJNZc1osAySHZt1aMdzlkSkvrcHaT1bwjsgXtIVECnRBle91kdizYGNPhT3AT
	 gvF6qvpnExAdk4p307vaOu7g82oLoDyQ+rc3fc3ExkHbqGadWdbu/J3KgTl1RGLTIkwEs
	 tIS/i860SQfJDdT0z5iJIKU3TES34In8PPk+WERFKlAyvoGE23rWXJbbCiiHwFYi/6XaV
	 unRqA3jY7rC99vYLoCKtxtIa6rqcMiyJAbXot6KfyeBVvIkz1DBQePb5XlXvxb65rXU3B
	 lWg0qDpy1W3xqu045RQawuHbmzDTlIr1xZ4UAsw2GefZMDToJa+piisIgAaurz+Prgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=40wgv2rptPHI88aVcTzl0YyC5G4O6LvCNv2uAv6QEs4=;
	b=4ic9pdKO9BXBYbPngcCsphVTgUTbvIDR5A/v4l6F8fZxWVuc8lLkoLMrn7vNUgx+Kp5/
	 Lpach8HsaNtJpb8qhPbmTXOGe9kEtiwvQhQdt/bMYzeD0UVbQzDklZgE6tYH2ASC1k4/g
	 lOHSOxQMxVEl/7nO6025xr4PrpMov8tY5YSuEgGbLHb3rlCFXqWmL6/w5LdvuVMJN/7+Q
	 4op6mpu/BE208Oy/5BOXAjIrOphpE31ZUIaLngAx/rx8QmyNFT7lzVaqZK/ULIXa6/dqb
	 jl8MQaLHpi21plYgzxJ4CG/ef8FXdieDWdW1OCO0H/qglwqXekbhSUbFr601SXlbqMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RgPamdL6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1CF606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E1CF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RgPamdL6
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1417080a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:25:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793982309; cv=none;
        d=google.com; s=arc-20260327;
        b=ikX5x5G0wccKjThSnQoHMXLBgOYTHPKaXmTwybEcgeBErB2xXMEPhYmFh8JE8Vec0n
         zurStcRZFTlEchNhSzf3YjEuW0+v7Kl+viNuDnPzBA3PgDl/wQqKJnoy2pfE48gKW619
         EZTS7qj9G69TsHaoWi0E+Sul+YF1AQiU4SjIDRjCSNM1yGS69kAdVr1GM1nFHuWws/s4
         qle/5wPMoZNcm6ZNDYTg0PqcQ9ZyC3ZFxxPHClHnGCX0NmQ67gWnx+1A+0cpjnCxDEjq
         /zozRYU84yRYB6Rx+BoV9GuxdwNhYjFtkp9PlSNJrHKpsiv3tnM0utNFFRQeeiX4j8ZY
         rOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=40wgv2rptPHI88aVcTzl0YyC5G4O6LvCNv2uAv6QEs4=;
        fh=LsGfOtR2pu0RB4Jpa5oxmIF2S1I/uFTTm79hVZs2acc=;
        b=EogcTHCZJP6VZqsdtFbi/WGM5znl4jM2Zy+rMYlk0X0+N0tGOflHKCHsYrZPjAgIeq
         yviS4aQ6a9J06vKgPd8Wgai3uaewOx+rbfwEAkrekzzrzOQE6Vm86CONk4Ql3/m8gqmL
         83o7kJsMOf868waqlES/S6RgF2kOA38mYZznU2a+ombeSj0QuYmEWluV7CaV+D+zBaMd
         8o5LKsa00nVuTIlKyIc/r01RB4pQw9L+o6pO1ZTI6RnwS5ZgcExmDuuMjXfzOB8vKR4r
         Xu6RlI3AcYEeNlTulIlh4NSERQE9m4XNRyWDWJtkAZGmZ2c46105rtQ9pFUco6SWs1Hi
         Dlcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793982309; x=1794587109; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40wgv2rptPHI88aVcTzl0YyC5G4O6LvCNv2uAv6QEs4=;
        b=RgPamdL6PkhJDvHQq10C5ChdBFTarMeHLyG9scSalWVpgnctTtuJCUiMfOvaHYyPMl
         mQCBx87oP96yGkuQ4DM4K7IWVtrPKx9diKX2BebYifM1pER0IjUajcu8Au2M2JVNMOqf
         tKI0V3byWgzxhbBofsWk3AXTqVB1JVs1mBtmx57dD0xdL0UNERM2R0p30QH9MrHfuiCH
         uwFAUl/GXvXf00z05HujHAc7RmTV6/xpUpmxb+9ghPtZSLq3v1rHZg3Wdzd83W+p1QBD
         GdbH2QoqjPaf6JMktik6BovbQGvqH4tuODcKy13Fji4gOPOm5rHgZIVjZSojS2DGMqtc
         5jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982309; x=1794587109;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=40wgv2rptPHI88aVcTzl0YyC5G4O6LvCNv2uAv6QEs4=;
        b=mS2CokSieKfesc4FvD9kQ8xkDSA5Ebgj1+PBV36nLrSpew1c7nmo7/b6qGGvjcp/97
         W7dfkJwFOP50YQLRebGRuKon4c5iINu0x803IuSnGEtfc8ObzYxqOHX0HvXzld1DxaLx
         edMY7Hayjo0Mqn3aynnSLGGe9EaeNENEE4agtorNZPQcOzCs2WIy0YbxEWzplThBGdns
         M933xuBHv4g3dTymrKw94Z4iZ9RSG/6181BJmUQY6EE9zGnY5STOnXsym+W1JZqAzoRd
         X/Cq4ggXHMS5vOJnV6KJhhs6ewheyVcSIbk5I99PoCpF4YjC8z6oodKPw7syhKX9Sn7d
         n+Rw==
X-Forwarded-Encrypted: i=1; AL+hErF22d7gW0wQLtl7WCrtN6qZWrxNfa6CZRMDzYFFMNxtXn8QDwFJL6n5pZyahsJfZBdB6GxgVbnv+pPlTgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DpehPrAxhpEWJP4SD0zC+v/15BFlmhvsoSztrXfemYg85LW/i
	cNwFpGDbpeA8pKaO+P2nlqAPLdXtpWhffNh56Qai/1OEwu/jTbI4v4NM5OhLCm3fXP5utyszmaW
	sbYIk39QEnit/AjFmc4jPdB91Y1h3J26VkCFCFeXarQ==
X-Gm-Gg: AYBFou0Ls/xLxjpu7/ycHD8k4xWHPIIT+FWFz7FTr37DxReTLacdLmYc2vyffZNFvRx
	6s9UmXa5DX6K2Yvoli4DZmc9LP2V2SH7Jp3patN78j19hyGHtm82SiT6OtlMFxHIA0zuikPU7ys
	nCDdQDBPMnfIltkQprwGvJ9e24/hZI+NUAq2SiBmETIvJ8pCakMA9j6kQJmC+SUSE8Q8OHnB4Wh
	u2JeoaL00Ip2w0jZE7vSTBi9oQrNnRbcNKXedjf9JLobF9N/EAbMkeHNXfpsFJbs9XFrdSdDFmK
	FOVJTELPxjoMugpXWQwuZKxL5BaOykdnZZQdVuEorCX/dLta+pnstsosIioUcMAy79csbor4zvo
	7vMKQ8fH+Te/rzwKd00zKURo8xpE87wtC/sPoSmOAMXYNkXc8sh+4593EqZXLmqix+gZuuu1la0
	nR+vpH3KutA4V01u/G
X-Received: by 2002:a05:6402:5003:b0:6b5:94d9:10f8 with SMTP id
 4fb4d7f45d1cf-6b5977c8e32mr2171392a12.21.1793982309351; Fri, 06 Nov 2026
 08:25:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105165525.011876858@infradead.org> <20261105170157.616859418@infradead.org>
 <auzB7x4lVcFmTVMs@scheduler.schedules> <20261106083106.GC1779021@noisy.programming.kicks-ass.net>
 <au2VkE9005PlW8VN@scheduler.schedules> <20261106090153.GD1779021@noisy.programming.kicks-ass.net>
In-Reply-To: <20261106090153.GD1779021@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 6 Nov 2026 17:24:58 +0100
X-Gm-Features: AclHuK_fzl8uU0eiF2yxH8eudtRlwcfHvTBM72atpHn8wIO1H9L3zZHPYuhw5Jw
Message-ID: <CAKfTPtC5k_m5eAznJ5Zb5EzsD2=3TKrW9X2VaXW-z=nbq1S--A@mail.gmail.com>
Subject: Re: [PATCH 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor tg::idle
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>, mingo@kernel.org, linux-kernel@vger.kernel.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, joshdon@google.com, tj@kernel.org, jakub@okonski.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 10:01, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Nov 06, 2026 at 11:57:03AM +0300, Kayra Cizmeci wrote:
> > On Fri, Nov 06, 2026 at 09:31:06AM +0100, Peter Zijlstra wrote:
> > > On Thu, Nov 05, 2026 at 10:20:00PM +0300, Kayra Cizmeci wrote:
> > > > On Thu, Nov 05, 2026 at 05:55:27PM +0100, Peter Zijlstra wrote:
> > > > > Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
> > > > > all ancestor tg::idle. This makes it trivial to tell if the current cgroup
> > > > > is marked idle somewhere along its ancestral path.
> > > > >
> > > > > This makes se_id_idle() behave differently. Notably is will now be true
> > > > > when there is a idle cgroup anywhere in the ancestor path. This
> > > > > addresses an issue where preemption of cgroup::idle was overlooked when
> > > > > flattening the runqueue.
> > > >
> > > > How? The diff doesn't touches se_is_idle(). se_is_idle() just looks to
> > > > the policy for tasks:
> > > >
> > > > static int se_is_idle(struct sched_entity *se)
> > > > {
> > > >   if (entity_is_task(se))
> > > >           return task_has_idle_policy(task_of(se));
> > > >   return cfs_rq_is_idle(group_cfs_rq(se));
> > > > }
> > >
> > > > Or am I getting something wrong?
> > >
> > > cfs_rq_is_idle() := cfs_rq->idle > 0
> > >
> > > and cfs_rq->idle is now getting incremented for the whole subtree. So if
> > > any ancestor is idle, this is now true.
> >
> >
> > Yeah, it is for group path. But we call se_is_idle for tasks in
> > wakeup_preempt_fair(). Not groups, no?
>
> Ah, that's what you meant. So we should do something like:
>
>         if (entity_is_task(se))
>                 return task_has_idle_policy(task_of(se)) || cfs_rq_is_idle(cfs_rq_of(se));
>         return cfs_rq_is_idle(group_cfs_rq(se));

This is necessary for the 1st check in wakeup_preempt_sched_idle() to
prevent useless call to find_matching_se()

>
>
> no?
>
