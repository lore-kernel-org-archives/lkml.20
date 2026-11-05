Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874008;
	b=p5IuHW9IcvT6EsazLLR0CP8lHnbeqJ0ys1fjLxymVQHuMEa1sQ/ALZooj2/VZI8CMVu3
	 gmGlEGTwwcK9/oupuyS/vh+CUN65iXB3IBuwhzRMO1+ppWrAH6OdGm+JNDEyFQjHzdAHK
	 kGMbDOLphZ7n9DKGc4HjC2x/LL/4IJsjNV7hOAh3xmh0Vic+s9xhOVGQO2JH+W2iTirRO
	 1bw7S8J/ouNUaKCuBBfeDnarqdq8afv/R2AEqJ0OkGbIOvaE6Xo42m/e41xt4mOrqd5nv
	 FZg8G6/b0Koskt8SGS8q636AEHPkv8dEgyDqfj8PhDnbPjASGu/R7mDqQW3EzwQUUdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874008;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jIr+BXQHSHpw8ds71xVo6cb1zGmQevyMjrEckDJRick=;
	b=ZQtE8scwolMgo4phMdY3Xw6DG2KriixTRGNsMuFAcmI3mteXNZXhFYeqAA4Jz0E9eoAD
	 nlMFB998lSkm1R50jSjxflQ72CcM72kBo2sfm+52enNrxVgx6bSZ9PBMt11PfN0+TQdEF
	 qr7pX0JC1z+iGroKfNJFiLlbrEbAS96WxmX5N/3Njg7G3wG0my0vVV8Le8+L0DcixYD6d
	 ICT+u8i8eHd0VKmmWk6g2Z0eIo+iATxK+vcZNW/BO1972OPkTTBZL/l0/wZUMcUS5kLeu
	 zNUl0HQBVDHsRLd9BWTfXoo1qDKazJu+u52VUDee9gQDfTP1GEjIsBN21RZoZqRJs5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UENpPXCl;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="XmGn3o/S";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38546606D818
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38546606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UENpPXCl;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XmGn3o/S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793874007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jIr+BXQHSHpw8ds71xVo6cb1zGmQevyMjrEckDJRick=;
	b=UENpPXClR7A3VKJiw6bWnIxOhbRYWxGCzumEPmFopMTb5xQqQ6dvdFMH9vZ1IfOwczFDFh
	pUIVKvW0iQfkMVGwDYFyP0IFt5matNB2LtJEU+1mPvxStpMbZaQSjLWrdasuoskjeZBoGn
	9OKpiJ2HTFuR5jYO0m6K0bQ2BFMF5Lg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-dYLCqAbSMuubvmHPSjEIYQ-1; Thu, 05 Nov 2026 05:20:05 -0500
X-MC-Unique: dYLCqAbSMuubvmHPSjEIYQ-1
X-Mimecast-MFC-AGG-ID: dYLCqAbSMuubvmHPSjEIYQ_1793874005
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so1482675f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793874004; x=1794478804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIr+BXQHSHpw8ds71xVo6cb1zGmQevyMjrEckDJRick=;
        b=XmGn3o/SRsBJRZkpXs1pyJ4yDOw6yxczQjG1FFlMbs6lL8/iZaeRMfizV8RMim/rV5
         s+aRRe9P/2IAouXwNl5QYZo4vQ3/LpTFP4aGNQ5oSoi5TXNL7Yv7bwQiWG3tv7mQr+Ch
         DwC16ZjbZCSQusLXy+yjphl/zUMZigoR6smKaiT1hlRkT4YxL4Fn0C8e+Q0St0KZGgrV
         914t2FPRRr5FVNyBxkxh1zkT1axHaHO6H2Ggdtu9zgdc4SVsePPnakHUEnqsnZMRmS4a
         4ct5HntOJxV08+E8hy0xJohgCOS5ZivZhfDML46SCkioc5TLMZEJsYjwm03u3hxyAm+Q
         cGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874004; x=1794478804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIr+BXQHSHpw8ds71xVo6cb1zGmQevyMjrEckDJRick=;
        b=hAMrzEyg/CGr5ngso/V3aLsZ5tY5TaAu6a3J7BMIXizL1XGnkcNAeC6p51O40Nc8US
         LexVaiqzrdEI43Ch50g3qlmSxZHA1anzPbyFWPSUXWA15cxtJrUmY2pVwHDc4BW8w7hl
         F0WwcEs7CxFUVFe0O5hXdxUQfx46yQkG76E42rxgOgHQCl9Zt+i4IPr3YKdh8FZSb/Bn
         m+p/i2MpLAbSBHNVEGqns3T7j7b7PlqmiHRLr/aP7LxioyGSrEXpEaCV7F2qXosVSoAG
         6IoB7qURNWK40JLcJ7tHT6VtjXOBqn4kloHEi0LKP02YyM1mv14qPgI0aKoSXqm8+LF7
         9RpA==
X-Forwarded-Encrypted: i=1; AKwUvBydzxiTVnoqifeug5DR8pt6TN/d9SmFC5ydLjH4La+xUMqEVyCiofQkttxkHhw3bBoOWB1X+4dyME8eewk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fpK1f4Jo4Al7bK+ieJcXMvN88ruHyUgbOEfi61MJmpXO0vFeQ
	JQFrskGORWHQW5JopY3XluQ4GK0EvrEZ59B1+adBRJjpDSFKz57uVpnZaICqGob873q8CALPOpn
	KGgC5pojYF2dMagKhqyDJeFx79vRGHWjBSOuB4I9lvnz6ZRLSRKCFpWVHBnmbO/BjoA==
X-Gm-Gg: AYBFou3Dh3V6dUR699aRYVcQSn4jSHhAgiRQ6M7tF3WbH7Igq9aN/JbvjeCxNjOwthO
	/QAtMe5A7zeP7ajNx3HpjmquhZNZMIVZqkFt8jvrkAB6f/BkEexMyw3E3zFq3lC6pq+/LZnTA6W
	x2GB7wakc4WFQXsuUYJtL2OYX818vK3Bml5KEZD3skGFKpKgnPl50ChQFTMy1b8zuc7wr5D3ciS
	ztXWU2W+Vc4zgUY0NkPZmToKr+0ZwEnRG+2svMYWNGHNVn0Fl42sPlcXXfGH4HOuoNdXi3DPD3K
	HrcI7WBR9+iuSxvB7K+tBc8J71vLw/1xqsQ19ROsfvuERaBaGBWgqXGX6Hh6EQ1yJWgk7QyH/bV
	YSZfcV9YYv203x4BFDW2v6bURQgvyw/Nocrb30Btnwq3W2mH5bwj5RyB1hXZpf4eA8tPwdvxWu/
	vaHA==
X-Received: by 2002:a05:6000:4027:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e6e4f540bmr39671578f8f.18.1793874004482;
        Thu, 05 Nov 2026 02:20:04 -0800 (PST)
X-Received: by 2002:a05:6000:4027:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e6e4f540bmr39671524f8f.18.1793874004043;
        Thu, 05 Nov 2026 02:20:04 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180ee1sm10646770f8f.4.2026.11.05.02.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:03 -0800 (PST)
Date: Thu, 5 Nov 2026 11:20:01 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 03/21] sched/deadline: Do not admit bandwidth for
 parameters that are kept
Message-ID: <auxYUb0-GSpZjhd5@jlelli-thinkpadt14gen4.remote.csb>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com>
 <20261104211207.1392343-4-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261104211207.1392343-4-mathieu.desnoyers@efficios.com>

Hello,

On 04/11/26 16:11, Mathieu Desnoyers wrote:
> sys_sched_setattr() fills a SCHED_FLAG_KEEP_PARAMS request in from the
> task itself (get_params()), with no lock held, and
> __sched_setscheduler() then skips __setscheduler_params(): the task
> keeps the parameters it has, and its dl_bw with them.
> sched_dl_overflow() runs all the same.
> 
> A parameter change of the task's own that lands in between leaves the
> request stale, and dl_param_changed() takes it for a change: total_bw of
> the root domain, and this_bw and running_bw of its runqueue through
> dl_change_utilization(), then hold a bandwidth the task does not have,
> and the release at its 0-lag time, which takes the task's own dl_bw,
> leaves the difference behind.
> 
> There is nothing to admit for parameters that are kept: skip the check.
> 
> Found by reading, after the Sashiko AI review of the first posting of
> this series raised the case the previous patch refuses. Not reproduced:
> it needs a parameter change of a deadline task to land inside the window
> of a SCHED_FLAG_KEEP_PARAMS request on the same task.
> 
> Fixes: a509a7cd7974 ("sched/uclamp: Extend sched_setattr() to support utilization clamping")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

