Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856FE4E3235
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778192; cv=none; b=Vyojnj760Yj6ViULjZVTNE3UdLJh+R016ALfLAoarNphK6f9yY0nT+hp5PrRBo5/rHFwJsv1I6Hi6EFbEXcUEU0LKvnKGp6J3xnrmQmRSAv9QKsuY4iM2fDnF7uPHeB/vXp/Ka4aTQIdUKKbw9Tv1wnW/U8qv+QI4I12Obd5uIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778192; c=relaxed/simple;
	bh=8BC5tkKKu64JweVfwPgvVAbEzr4IHGwzukxK7lfs8BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTSRS+I2KfDbvBgDqZiC8cjCsnOiOrFbBEih07yrpTBvijLQaOuaYX24N6hfJKm2EqaYbWhXVa3GN/YZK9c2KWYtn7KsGKpZ5Jznhmkrgp3jH2Ikg50xfTtD0NVMPKOcM6TyHfhfbYT7CXZ6EJ4URXop6lqbjDLDmwt419EX9l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=dApGPgat; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="dApGPgat"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93c59695cc9so377129885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790778177; x=1791382977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hYt6A34RfOeHkAot7XirdGnjVpo9UvZvKcMPW6ASkzI=;
        b=dApGPgatlMJ954ve69TvCXEJGQLZRm25f7FqjDkIQg6z7Mt+WeK719H2wEu0JHXa/P
         64T29gyakAiocg8+Nc6QAg2+OU5FzHOpTSlHs1QogzlbOkprjfxHWjw/4KI/Ug0TuGTd
         j9R8UH1HAfoYJ+bs70O80BoTVm4p6rurApgINlL6QjS2Ej+weSbSLLDLhcMaBOBE+E0w
         XWKgqjwIihKo6rzUP0ZXeyisG83vXgt0K4ezpOrgTwvqinekRO1ImdEzP66QEf08642M
         qsGI3fdkOnhoaHegYg4vc88+mp9yZP7RBLc7fXGlA+UAt0mPPYZBaIrtncIkaJlr0qpv
         ZuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778177; x=1791382977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYt6A34RfOeHkAot7XirdGnjVpo9UvZvKcMPW6ASkzI=;
        b=yxd6bQQcCQUrrw+V/lJdOD1QqbijY4qMCpWOIfpXiNaM8oBbgoikhtKIsORs2xuKkV
         ymtpPpDZCpTXZACsLHma99uX1lxVmC/a8j30iMeuFoxmxoWXeQiviCFAyXpiDjhNp7ec
         w7BHbo29lhCeZ+JJCsWZUC9fwU3YXPSm3DGzJ6Igq6Owop2gNHLqcePbNPHTMRUdNVY+
         dLlZFRxoxWuHN0wIWwGGCySB8K7KNbIX3e9zjs5Zj2wTXX4aw8cJ2HcEeo+thwfBjayO
         zWsGUkDiEbe5kPoTEL0FtTahv7qfd474lcAffnUx196DzDvpj3IOnEAEAhn6wjhjZ7mY
         b7Zw==
X-Forwarded-Encrypted: i=1; AKwUvByp4RVfBE87UsCq43FUhGCLCqcXOL+yr4YEOKVooTNd9r5zyJMvcxU9PPNaaIXP1gJY0WCTHkGJW/mmTBU=@vger.kernel.org
X-Gm-Message-State: AFuF++mC5dP6aGEgTMPrJFJwFgzv6ZA/fg29039Bp5uIIxC7p3UNAKmy
	RUU3s7i7pvmwAEcBCkLf9GUmG8HP3jzeE8FwJW1YLV6zKZ9SfUUtg1W2Xsk+S3n5E0ekCHpbikM
	+3eRg
X-Gm-Gg: AYBFou3s6JQBdB6XhBhmdEbGN0oGv/578HjF1vAP6EOR7QfYGJ59FbBbkKo4g3QZVhJ
	vBx+jjbe570PJTa+06iJu7G19nNwvkWaNdpovZroc/dX1dxOGle6nqAg00GFAGnPaY1+B7j11Xy
	auiZNqZgGCUCy6jLrURlP1Mxww8kXeuB/S9hZrJ2wq3bKqcOJ5Tg1MNtkcsnOXu0lim27T9F/im
	cj0SYl7YtGWnqQWNvWpI0QXShGevxffaljObSd772JDtpn2mRU0qjPKhzD1R3X4ssvvMPB8cHG1
	gzGmJED6dn+lxfsrABnoRR6kzSOW3iE3qI0mzpSO5HPi93fAvFO3PaGspIpqbReyC7lQAoPA/HE
	yPvGyJZ8elZSTcxxNmJGjqw720qkMUD6iw2V8/sie2Q4FbBG87O+/pssgXreWnwFhNfb9D72CQr
	eHxOIyDR3WhKAK6Yk+RpT/dJ4+99W42Koiu/mQJbXXJq3LPNSHTwpQrWaOvshyZThFdtSk
X-Received: by 2002:a05:620a:3195:b0:92e:76a1:96cd with SMTP id af79cd13be357-93ca96692cbmr280574785a.13.1790778176896;
        Wed, 30 Sep 2026 07:22:56 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca7eae7e7sm126812185a.3.2026.09.30.07.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:22:56 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:22:52 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: David Stevens <stevensd@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] sched/psi: clamp negative cpu_clock() skew
Message-ID: <ar0bPEyD5CBK331p@cmpxchg.org>
References: <20260928233743.3777102-1-stevensd@google.com>
 <20260929081004.GS4120091@noisy.programming.kicks-ass.net>
 <20260929081740.GH4121620@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929081740.GH4121620@noisy.programming.kicks-ass.net>

On Tue, Sep 29, 2026 at 10:17:40AM +0200, Peter Zijlstra wrote:
> On Tue, Sep 29, 2026 at 10:10:04AM +0200, Peter Zijlstra wrote:
> 
> > > When running browser workloads on an Intel N100 with a sustained
> > > psi.mem.some of 2-3%, this underflow is observed once every couple of
> > > hours.
> 
> Reading is hard. This is sad, that's a relatively modern chip :-(

I'm still struggling, but I'm under the weather so bear with me.

That's a cpu_clock() implementation issue, right? "The value for
cpu_clock(i) is monotonic for constant i". Presumably violating that
would be a problem beyond psi?
