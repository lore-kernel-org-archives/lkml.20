Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694925;
	b=ZLw0gIHGs92kNYgCl57Y3oPXHN6okO3O7eXAV4FjIpsMSLdxXQTH31Pz3nyrOB6mdoYp
	 GPDLPiNyR4V/OFDudwKDYkX5Hq4zIlEJjz+rsTicw6vItLbij37/AnGYV2pY79E65bQZF
	 snk8EgRO4ZXFqAEabPVnxweT907Gj2534K09wa97TaNYfDIPP0dNxDWniq9Ok/C5FCWIz
	 Rk3lbx9dGaDIpKw+lpU80VThqz0HDB/tYuMQ+5dZ7borAnA+e6rojPShwVBdXk5BZZxbX
	 HObheObIXjaXaP7/5TvicG1sW4F3MDic1XLhqhmpi4k/+zwroiDeHqrfhtocM7eWxuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=iWHBYSDDRbBFmboyivmyPuuxpV2Imqwe1ws4K2s/aOg=;
	b=kJZ/97qcqTe4iji0FKd7URhNz6t3f53CCU76ev8S+1ur5MJKoQ+Z1TlAa8ivzr3cDxVw
	 fF361lucvyTQgEr5qe0kru8SN2RmiJ4Ec5iXQ/X/jA05TtDWtwfnNDA74tb3xnpSYr+V8
	 mW1qFyunDvUOeIqb44LxVg4dwt3Y0btLrFNEOwSwpwYUZ5IdEPW7nTZO3IcXxGLiBLijY
	 svs/ec2hIlHWs3idCrNhvcFd4PYLWFHAUeRU39x/N2BMnquM181WWjJkg9CFsVk71rWTB
	 xCM3YeOuAEdtR22mb8UZtFghRzHIC+OohqNLLL6XceDJaCn6VIhxRIfWolh2MRqn6sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Zxzss+ER;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB39A606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB39A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Zxzss+ER
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2603664eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794694924; x=1795299724; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iWHBYSDDRbBFmboyivmyPuuxpV2Imqwe1ws4K2s/aOg=;
        b=Zxzss+ER748UbQmvseUJT9YFqCpzoaHruE873lloL0Bm+hW0ZXaEfQM1C4Q36vGIoz
         CUtTDJq3fXyhpTSJicdrlkl2xk5FP5yT1nTWn9sOdLxbw6GwdXh47enPNcS0nIopq/kR
         71fiPE9eS0MtVa5QFdM+7faXZicWQEA70MuYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694924; x=1795299724;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWHBYSDDRbBFmboyivmyPuuxpV2Imqwe1ws4K2s/aOg=;
        b=fYZqnY7WlIZIayW+RfTgb5q3H9NVS6ZGVlw0x/B7CniwktjCfwZy26VYCHHEXA/AkG
         jfwpBYQXhI57zpC9ZeWu3EDoW0ZPM6ZB9VknBikyyA/MlvUFQbd5HxklLOO8zPVPeiIr
         oPlmxsutH10mqjfM1P0qNwZ8rkS2oe+rpLRaj7Gvyn60Vlv8sWLcojZ1bwxzh0/3igr7
         u8CTr+vbkEvMF3a9dp/jMU14tzD/vjFjpzifSr6emg0vk8Qk7evD9qhh18U/0ZimHGjf
         pcrTwlSQ1dvlW1qqPBkQ8KGaJqehcrs8VROVH6xHnvQiB0x7ZCcXfeEi0XPzYCoDDlY7
         b7Sw==
X-Forwarded-Encrypted: i=1; AL+hErGIYSl/zmBmIGxQCBjvHEdN92wxEdsklBOPwG0Gi9W8HBLnF0k5xlaMZLBWZcJIJ+xVWto86E57pqdzoJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7/kt299vKS8KxpGpSWn6G+xB5EKgKJ5UMEO5Ntel7RE6wNqMD
	WVT7/tFEfOthloHo7GzB20iEsS/AaT7Wy8jwbO80fDU7n4fqX9pqkrCtM/thgaytuT4=
X-Gm-Gg: AYBFou2dbIgllK9uFZC8WZkoS8YZ0G7U89KPBID8UUA0T93ZMHt6ItXYOg+zyBpSR4R
	br3ibqVReFmW7sGAi7DDAbr43nq+wg4ZwAh/SUVT/c7S7FV0mBbWiUN589n0r2mqp4FV5gJZn4x
	fQZnT9VBcA/tKLkredaasjyUQQpyS1/dVc3BFWVmXn35ZTKpl9KkkzygOYcqb9OQgCTvYvUxnCJ
	hUcTlUBmP09t10Pu/r0HHJzBfjw2261+VnEOJx7iPiJ4YOZ1A5tqHaTvLVNfBILSvfKTOvt+JH5
	EWSZwgpyXKy4UDZ2R09n832xjmZcLcZmxb++7uNHpOVVuiQbnZUngzgTBKANNEOIsb2DvAkoCal
	nn3qNZP3gG5nMF3XbZ8Hb8QBN/JqRsve0r1+q5WwraKjfCfsTBVlZqM3o001MqvWZ7t4HA2VrOH
	BsmlaryHzZaYhajtsBUKYo6B3ZZbemxMQ90OxZURZE4SGe9m1vEYLCBdWXmogL8m6SiPquuyjmj
	1fOqDlzdH3yY8Jn9NYe379lWMEQEqVjHVcs3zG4TecxytBDgGPzBcs9t+/E8VsfG6n3I3SUc66o
	sBb+28G0CmaS73VxO7cjjjpUbZeJk/s3GHvDe97tspQpaS55aL7brNsc9Qpj9ccrVqlIiT72OXQ
	ARBnpcS3X19swZtFEyyWHdEP0De7Pnvyrr8FI+QSvALN4WqB3tFVf2VRxpNqk5XrenVGIQl4xPT
	gTVx1XblG2AmE2ALQfyX7bHXmCSAup9GgMEi4HEwhYi6zjIcH75OtGyPHq37PWBMqgsmD/Ryncj
	aHO3klSy2k=
X-Received: by 2002:a05:7301:4604:b0:376:703c:8819 with SMTP id 5a478bee46e88-379681c6998mr7125048eec.38.1794694923819;
        Sat, 14 Nov 2026 14:22:03 -0800 (PST)
Received: from [172.18.0.3] ([164.86.38.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm33509247eec.25.2026.11.14.14.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:22:02 -0800 (PST)
Date: Sat, 14 Nov 2026 14:21:37 -0800
From: Chris Down <chris@chrisdown.name>
To: Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
	Serge Hallyn <serge.hallyn@ubuntu.com>, driver-core@lists.linux.dev,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] kernfs: Build paths in linear time with respect to depth
In-Reply-To: <91fa9a5de005245ed3c1bde305fc6778@kernel.org>
References: <au_pnu4s141ylqHD@chrisdown.name>
	<91fa9a5de005245ed3c1bde305fc6778@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114142137.ecf5e6af6608b218@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Tejun,

Thanks for taking a look!

Tejun Heo writes:
>I don't think a 15,000 deep cgroup chain makes much sense as a use case.
>A lot of other stuff in the controllers will break down at five-digit
>depths, and quadratic isn't that expensive when the base number is
>small. Did you see this overhead in more realistic scenarios?

Agreed that nobody should be building anything like that on purpose, and
at the depths people actually use there isn't much in it. Here's the
median read of /proc/self/cgroup in a 4 CPU VM, with single character
names:

     depth    before    after
     4        304ns     258ns
     16       549ns     396ns
     64       2.8us     1.0us
     256      69us      4.2us
     1024     2.5ms     20us
     2046     12.0ms    43us

What bothers me more is that whoever picks the depth isn't the one who is
affected by it. cgroup.max.depth defaults to max, so anyone with a
delegated subtree can make a deep chain. Every read of /proc/<pid>/cgroup
for a task at the bottom of it then takes that long with css_set_lock held
and IRQs off. It doesn't take five digits for that to become problematic,
either. Here's the median fork() + exit on another CPU of the same VM
while one task does that in a loop:

     depth of reader    before    after
     (no reader)        51us      52us
     64                 56us      53us
     256                363us     60us
     1024               5.0ms     93us
     2046               21.9ms    117us

(In case you're wondering why 2046, that's about as deep as you can go
without brushing up against PATH_MAX.)

You're right that other things break down at depths like 15,000. Just
creating that chain takes minutes. But that only slows down whoever
creates it. This slows down fork and exit for everyone else.

>Even if it is worth doing, the implementation looks too convoluted. Most
>of the complication seems to come from supporting wrapping to keep the
>head of an overlong path. The only callers that care about what the
>buffer holds on overflow are debug outputs. How about changing the
>contract so that on overflow the buffer keeps the tail end of the path
>instead of the head, which is more useful anyway, and the function
>returns -E2BIG rather than the length?

Yeah, that's a lot nicer, thanks.

The one caller I found which relies on the start of the path being kept is
SEQ_printf_task_group_path() in sched/debug. Its fallback buffer appends
"..." when the path fills it, which will now be on the wrong side. That
code is moving to sched.h in tip at the moment, so I'll send the fix for
it there separately, rather than have the two conflict in -next.

Based on what you said, in v2 I'll also drop Fixes: and Cc: stable, since
this is now a change in behaviour rather than only a speedup.

Thanks!

Chris
