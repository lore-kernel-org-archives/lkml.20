Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586667;
	b=FLl5HnDpjgJtE3F/kTQxrVmZe5A5fNfGnRwuNwAzxeQ6r2P6rVLXZk0UZu1Fas70hHQE
	 SL7rrEaglUyygch7v1ocuEpxKFwiIQ+7yIcZV5/DB8zQG0V2SFwZG7H0GrhhWNOYieiqj
	 B10HnZ9XzBmzJe7XTfmIWdqY0BPvXjwzxvMuu7zL3BC0/GZOemGaY8CCIhmcIHnKqPVok
	 QUIjedwnO7Ni5J+AsdfORKrjwEPdVIPjGwRCLcfmH4v8QflNDzaJvqe2jbE0pnfu3RiVq
	 9/bkJw8Z9oXepuFpd/Ew2Rr8YFF0cya3k37YY00qbTIg9OfiM3wi/iHOZu0eUAtGusA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Uv8oNJ50YVZVjWOAvF+++GN7AXIyX4nxoVRnT2Y9xMI=;
	b=XfsQEuRrBGebMUowj8+oYcZWsM7fNwHdzZLoTAVAJ3EYI3nem21DVkB5nS0ve/5Rmc7k
	 AUjVm+8UiWdFTiYoTHXlG9jJgB+atMNwOmAd7OnFO6Zj/3ileqSuiN9oRTqN6Ms31vBew
	 JLdKdGh0iUXRciotlEtQBG6w+nb4D4GjXomKgPBfO69sUOn+cu3ep4QgkOtLMbRXEgkeE
	 wq9qBpcNZ0nDEE3W5SR6lT9yBMVlSS/poLgSQLvS6THUYZp3nRZ7+wDGXWkCYFLZlL5kF
	 sanxS/ujAkToVw8XT59AvXF4hBC1Ve6mcakkByZ7chthU8ExO/aT/epVNUIj1C3lvsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M+uLf2MP;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BD8606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13BD8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M+uLf2MP
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48affdf66f8so121191f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586665; x=1793191465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uv8oNJ50YVZVjWOAvF+++GN7AXIyX4nxoVRnT2Y9xMI=;
        b=M+uLf2MPtBgXq4OQGLxD8MpPH9l+Hmko1OSj5sN3468bT1MeJMdwWiEAjghOOI9rDF
         eYKiO9h0QSL6QCGWZNUsFphzbZHKtEHM/QMCiT6YkYI1R9n51rqDryix8cViTUrsxa60
         lbF4GGCouP7Ppb2b30EOFauZw33EhF4b77L35FTbIstzSVvc6AI2qB5kdVGtWRns1E54
         Biu4VopRLg0ARHmMWJyJy+ZkBagsRDLrU8NM2PBqjYVGIsg0KB3exy5YaoEusiSd2fiF
         dT7Ve7L3reQOANm6+STOnvm+47tTAdkI2hkLLf6BtlyLv2/ry6ryMeITmVXkMdt65VW6
         kF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586665; x=1793191465;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uv8oNJ50YVZVjWOAvF+++GN7AXIyX4nxoVRnT2Y9xMI=;
        b=JuSIUyXSdol988TivKkAsmIPsc8+7p/JJAau7SJ045cdStejiFK1BS/YobvqNDEeLY
         f6y7M5R2FQ473G7BR6LpOIj4iC5Eb0p391HR2zEmjeDeI2V8kOlWb/RZ+2f2kXROqZE/
         SjxEkX5HeKpOODAGN5fQqVp5aI/NtBa9Ztrw+zlmnlLWhl3lV4dzZeBntOus91PiJ/xT
         rdy9eDJ2u/trcCW4ROP5u7b5Whu6xWnfCytk1Ixft/Sfp3jsARAdVc5yavlRP0/c2Bf2
         rRAz3OlhYZNTz7BbynTpUtZM+bEfTaYDFvpHgBskxpTlo1G6nwQnKsbSJuD1KQa5Jomi
         UKUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXlUzz2JlRyCN+Aus5N/913j8vYvFU/CkRICdkBnx4bHH345Eq5HLUhMbQVvO9N0LUDZWnmaqhZ+ohpsY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCZQY74YZQj0751f7R09qJGCWO60eZlcOIx7Bm2a7ohWrK+BHC
	ViCZV0CJKX7QthTV5iPT7+fXpalMaXDa1ZMENFAEdCcdU8QZxyFcyLo6
X-Gm-Gg: AYBFou388a/9rdR/DkmyLL0oZYCNDXvhqhHm08AhXHwHSC7NB/yi4TGLK6Tm42rPa3p
	YtRlXPQzVpcL4GrqfWDPBBh/wb0W1NLEdhmo5PShaihYgU1YXSrGUF2trCfduDINC9IC+oe3SyM
	3Z4Ew0JyzS5kwjTsdBIJ+3MbDRLMgPgx8Ngdmh9dH7bPODA/RwptpKbij/CeNWjmMWvjckEPLbp
	PF87yuI3l5ufQHeL98xpAbX0XNo03xBoJyM15X8Pk2EXHkZUmpVbIV0x2nCrzqZBjiAdrsYepXv
	WBe6wubITZ0YcNh3a8Vu3auCOJ60+nyhuNb6oJNzZ0+G0wpHWAXGr05gQ8hlfuDJx6zFa/+FIlJ
	cltVA5zM7r90mEyaEP7vIdmGj/LnaWqTJBnc6Lz4GKwbQeLtsnHSq2fbbSYVFJ1iQkmV3tnCUam
	D4jD+OR2lC8JjZQr46hGRzeytvQvxC1u2BK9D+ZiptCIPz5v9oOZ95gBlrW6OCIZ344Cu3Cbe2P
	87MFmer8VL6OPOZ4xIXsPWqBFk++PdF2Dz661/q6kqqMIgNzFjN0kKHATs4jKcJtj2T8AnPd4cV
	Ljy2CJ0=
X-Received: by 2002:a05:6000:4024:b0:48d:fb3d:bf28 with SMTP id ffacd0b85a97d-48e2648f34cmr3979076f8f.3.1792586665103;
        Wed, 21 Oct 2026 05:44:25 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254ef1bfsm5587546f8f.6.2026.10.21.05.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:44:24 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:44:21 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] sched/fair: Introduce the SMT_BUDDY_ASSIST
 feature
Message-ID: <atiy9PAq4lvXxWj1@scheduler.schedules>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
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
In-Reply-To: <20261020083746.37068-1-likunyu@open-hieco.net>

On Tue, Oct 20, 2026 at 04:37:40PM +0800, Li kunyu wrote:

> Several benchmarks show performance regressions:
> 
> 1. tbench 32      8325.17    6772.693     -18.65%(degeneration):
> Each tbench sample was run three times. Initially, some measurement
> error was observed. Moreover, this patch series essentially utilized all
> idle CPUs, whereas without the feature enabled, 5% to 10% of idle CPUs may
> remain idle. This led to more CPUs experiencing cache interference and
> other effects. The results are benign and within an acceptable range.

According to what the results are 'acceptable'? If there were some error
why even talk about them?

> 
> 2. schbench(99th) 8       13.8    15.0       -8.70%(degeneration):
> The situation is similar to that observed with tbench. Each sample was
> tested five times. The primary regression occurs under bursty task
> scenarios, in which tasks are spread across idle CPUs, resulting in
> increased memory bandwidth contention, cache latency, and other delays
> over a short interval. This is also considered acceptable.
> 
> 
> Li kunyu (6):
>   sched/fair: Add SMT sibling push in periodic load balance
>   sched/fair: Add is_smt_buddy_run() to skip SMT domain
>   sched/fair: SMT sibling exclusion after successful push
>   sched/fair: Restrict newidle balance to LLC domain
>   sched/fair: Add task burst threshold for large-scale bursts
>   sched/docs: Add documentation for SMT Buddy Assist feature
> 
>  Documentation/scheduler/smt-buddy-assist.rst | 126 ++++++++++
>  kernel/sched/fair.c                          | 239 ++++++++++++++++++-
>  kernel/sched/features.h                      |   9 +
>  3 files changed, 364 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/scheduler/smt-buddy-assist.rst
> 
> -- 
> 2.47.3
> 
