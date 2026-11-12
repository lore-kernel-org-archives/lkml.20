Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479365;
	b=PwZYJzRh6hoYxgr6rxxvA1Pxv3GYgfHsHwKBLW5fvr4yaM3uchSHpAMHeJvihx4Kno9H
	 UgNfnrIbUBsTl9P5UoDOLYJOkX7T3dkWP7aHj+Ffd91JNXaxfhG61GI05uAIwOKgwAGdV
	 59eNwwvf7WlNPKRsOaidqn+Zo1lCNUzQnfbVbBKXadqmwf38iFgeSV41jYAmv3e2EsmcE
	 caD+R3h0SJ/1QwO7My/Yb1i3LToo98IXynTJcMe3PE59meCzQeXwWKIQgb+CwI5v+lFqk
	 MOq+rrGqKB+2rp0SLcQUC73HJzra22ihMillob2OZSUrLBVDUuO9CealB1zgLhAmFFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479365;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6vncnhn6Q/3wKntfoEarDeUgzDpwaWPokLtUTZ7KM7E=;
	b=3eN9KYLcVM13TOksnz77kRE2koCfqYx/exnHycxE4+HIl2EwGGId5pa7RfEOwYwU0c87
	 NxbLZtVzRmGK4m4h6XL+0B/Qzl+rmvsq/AABOtN8M/R2K0hZnsfQQVdk+NIdgiO0pM0ef
	 g/If9rDYp83tba509f2dnvBC3i3anlOn7xqqtGr431hrQLAKkFnChboYYxTlqMFb3WoTb
	 PuFDYppaCkL0r4NOkiBCQpJ9E9eI07r0A6439wrKpvJwWYpUjSRG/wYP3sv36qoCnB4EN
	 0pBXETH/7ThzY89RM5xXwcpbKjrKxzWOD4fI6GL4n/Q1py+FgoASTmVTcyHzoCUQKxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g0cDVKdj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qo04X0bM;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C16606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C16606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g0cDVKdj;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qo04X0bM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794479363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6vncnhn6Q/3wKntfoEarDeUgzDpwaWPokLtUTZ7KM7E=;
	b=g0cDVKdjm5nVo+7iRxNAHgb8XWsS7fzTJF0kFL3gdUaGH77ToAYZMwF3tpKsKq0rhusUMj
	H/niFxVT8WVdIACvXTorHeSCMt4Ssg0b2DRYr+TLW+VbWMxItFFd+e7zRLj4inGLLvK00s
	miZQxuZPvgMDhyvk974ZZ6D3T72MxpQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-2Jzx882bPQiVWIvzTvAHRw-1; Thu, 12 Nov 2026 05:29:21 -0500
X-MC-Unique: 2Jzx882bPQiVWIvzTvAHRw-1
X-Mimecast-MFC-AGG-ID: 2Jzx882bPQiVWIvzTvAHRw_1794479360
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49034831bb3so3511076f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794479360; x=1795084160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6vncnhn6Q/3wKntfoEarDeUgzDpwaWPokLtUTZ7KM7E=;
        b=qo04X0bMaGEPK6glObVT7+IqbCAQsCHaTD7+bZwjfi2gnoOYzt/y0hvLwGGOcQVM0Z
         dwwUo9dRPm1aqQTmhyBE9xVOxlzvmLL3lRsOVpwPCHkpdQi2zKgRNg7OorNmoJcVYV8d
         IO6NOxSa0DI0FAsN6BjldJS/9U9CSSV11tZlKEZl13THn0APbUAqwGRJV63XudDFdSPU
         FtvXgsjNV2FOhBkO+z1nzN0I+REbI5cMlu5A56RC2fkgsIyKRvScu/OpFu/m/du3i9bk
         8HYBImoLMERKSRqt49K4LG6+WkqPCX+DOhmVGHMo4a6D0T58QT1jVvZ6gDBNm5rMEvUH
         ec/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794479360; x=1795084160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vncnhn6Q/3wKntfoEarDeUgzDpwaWPokLtUTZ7KM7E=;
        b=OZLlvNYNEKM3WXGxczH+5WBUN/mQD6gBkkQGxmBYKT3iLtt5fCZH6gEXPjJmffVmNG
         BHo5y7znSe99Ku1XD0OKv3Y9FV3zzR6/lM917e+YHhbqwiaUzfwf9JY0JvK80zDYrF4N
         lLX50ZwvWPVUUxog1MXKQzoO9NWQFxZHV4c6iFb4eiPI4clVcr2FCcXe/hE1ZMyAJpqs
         DxA9OEkqTVJjpcdYoOGWAIo/4/Gq5+4Xgmy7w1tk2ZH9tX6/FoOXUlhrQQ7FRSf7odFB
         RiFiCgEBHrWYtgAgmJhF7yWa05eNH/EVM6L4atlw4izxIx4jWlAuHkbp0YbnPbmmlEa1
         2jwQ==
X-Forwarded-Encrypted: i=1; AL+hErHunnH9DIanvfaMHH68Qb5MLdPBP5LNCqNKRCw+MUUP/G3F3bqzGhZEs8jxxpglklxhy1qnMj3EFxXRJtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5X2nfgGuBKcH0T4bFjTTgZs+va0dH2DVQJhzQZ0o31G7/WeC3
	NvJPVwjlWHApCNBlvuRycddYJV3gX4pcORzFk91MSFVxQhlql43k6JP5wRbhAAVxK1imMBFK2VD
	4XPCD3GJ5i+Tev5P064wPINTdwgI4/oMsDsTAb617BDCX391fWjJ/K03Rc7Ffs0mGpQ==
X-Gm-Gg: AYBFou03DCGUjAmCf+5TkArFL+X11tmWIPK90rWYDs0CS8Q4BxidG1BhKImF25TYec0
	5P0sgP0vA0AJ1tjoclLCDRajuGqv5jbaGqYZSJY0jn+baNmkJySo7CBZUQja1MXa4Qz0RTn/WvL
	P88Ek8nLvTHd4rB9eagwF2xKD3QUGkmADcwGL3pYePxhh496IyY2IkDn3k4ZOn9iUyLPIalsQUH
	aunmHkdycZnoS1lvegfWF9C5Atx78nt3MojFsWHLfLa2+CBo2cgZnX060biIgIRE3tjJUpeRuGR
	EnpJkDRQdzK9iE325K2ShkgtuDOGG1J+RSPYI1mcNYxX059naMdBsjsOvLY3zPBYGwUtfSihCof
	NfE3Y/au7fHPbQW7Rp1ccfQQc0SeWgqEOR56BzkmVOdYXxk1OFF8j6iBM/jqjwSdRZpfMAaJkxB
	sbZtU=
X-Received: by 2002:a05:6000:3107:b0:48b:d9:cb52 with SMTP id ffacd0b85a97d-499c7b1c5b9mr11631314f8f.27.1794479360330;
        Thu, 12 Nov 2026 02:29:20 -0800 (PST)
X-Received: by 2002:a05:6000:3107:b0:48b:d9:cb52 with SMTP id ffacd0b85a97d-499c7b1c5b9mr11631254f8f.27.1794479359967;
        Thu, 12 Nov 2026 02:29:19 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49bad3cd31dsm1615895f8f.56.2026.11.12.02.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:29:19 -0800 (PST)
Date: Thu, 12 Nov 2026 11:29:16 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 25/29] sched/deadline: Count the bandwidth a boosted
 task is given
Message-ID: <avWU_Gh3cw-8y_9Z@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-26-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-26-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:54, Mathieu Desnoyers wrote:
> sched_setattr(SCHED_DEADLINE) on a sleeping task that priority
> inheritance boosted into the class leaves the new bandwidth out of
> this_bw. switched_to_dl() does not run, since the task is in the class
> already. sched_dl_overflow() changes this_bw only for a task of the
> deadline policy. When the task wakes up, __add_running_bw() warns:
> 
> 	WARN_ON_ONCE(dl_rq->running_bw > dl_rq->this_bw);
> 
> When the task leaves the runqueue, this_bw would stay short by that
> bandwidth, and skew GRUB reclaiming on that CPU.
> 
> Fix this by changing this_bw in __setparam_dl(), which every task that
> gains deadline parameters goes through. If no runqueue counts the
> bandwidth of the task, dl_change_utilization() now adds the new one. It
> now also runs when the bandwidth does not change. It then returns early,
> so that a sleeping task keeps its running_bw and its inactive timer.
> 
> A sugov kthread given a reservation of its own now has its bandwidth
> counted in this_bw. It reaches dl_change_utilization(), so the
> WARN_ON_ONCE() for SCHED_FLAG_SUGOV there goes. sched_dl_overflow()
> returned early for an unchanged bandwidth, even if no root domain counts
> it. That is the case for such a kthread, and for a task that a rebuild
> left out. Admit such a bandwidth as new. Without room, that fails with
> EBUSY. The Sashiko AI review of the third posting found this early
> return.
> 
> A reproducer shows the warning, and this_bw unchanged by the change.
> With this patch, this_bw takes the new bandwidth, and nothing warns.
> 
> Fixes: 8fd27231c330 ("sched/deadline: Track the "total rq utilization" too")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

BTW, the whole sugov thing still remains an hack, but at least after
this it has less chances to break admission control etc. Bah, something
else to maybe keep in mind for the future.

Thanks,
Juri

