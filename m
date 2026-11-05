Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908323;
	b=weSGgafzoGfV8Nb1nMNFTUNE5JdygGZQoOGK9DAkiv5iZcFhqxyCqygXS0uDTJqaQEzM
	 X0UP+SEVJpuKqVr1XRDTi1A1siwCYACgSpcAfABNsTIXSlPqxDflCbcVQlnsPXWch4rmv
	 hcf3z+7qJ+Q38hOIjfRAnJHrOP3i+G5ZGtH6tkt4hr2hyDCnoE0Y6hqm5JDYqDucA2T8b
	 Rew3qZ4Tcj2z2emOEXtUV9w58mRw47Wlh1mqrMhtMxqVVbs5tiYwN0+uT6h4Tl7GxGSdE
	 FIyBprGzr+TYnXWg7wI4TLx3eYASPpsL4eA1F49bUHdGbAAE17hs1815Kf1DMy9HjXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E9t5hHnAag1EnA1IvHhWRwDHScTDeDJAqRJADEROHAM=;
	b=hnu703fKPy9J762wcGNJqh/nZUpy5TOSTqSvhWqx63IAcCSH5/8njiYQ+6GIFkGcoXc2
	 hMXfZOBeOUUoz8Pgh9ufSUg0ziTPFaWZ5duJpm1esZK3CgfECD1S7JtIZrwNUSc7mXuaz
	 gp0MwnwF/aoBerCxqg7ZPpFZf1gKHqp+N7N4t8OoIP+72ZgbqpumVaNM8hS6EH8/4Qzh2
	 hWFKEQuWJQFNlyCC/9fWroy1t03zz21lBlJnsbUeXoGERwbNEJhZr9Tc5gh1/y4xWmbio
	 90K0XyLwcEvgBTWxotvzC3olmXFIDpkkFRR/DsspWbZjCm5lYfYOWO31NITDVlYnm9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvJMfIQH;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E85606A6C0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E85606A6C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvJMfIQH
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so2766275e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908322; x=1794513122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E9t5hHnAag1EnA1IvHhWRwDHScTDeDJAqRJADEROHAM=;
        b=PvJMfIQHklp/6lrIJDb4DxHqeo8UgGdpsAu9dqQBOFpKyjqnOfM/bLgV3jxURH5B6C
         peftRdY9+W+wmrPZ3XDgPPzndrl8XFrtQKEW2KmejcJyjMbVQytxJ4wYg+NEdbJ+kAMb
         YgbG8/TLr5IdJxT9UkKKgf0QtKgOPlH9VIMBTFgRway+YkJj8wMlFpeYvfN9mFDljH81
         vt3JkDpxF4pVmCMAJhLHG6iLtEDLCGbY1lXGeo7kO/Y4waQ5E6rMiaH6J0bxlSA1sBx7
         SFfRyAQSlHD9i6J8DHV2lrf6bpl0GeOeyt6r6SCkSKRHbjY58i3VmbMTDSjXjjNcp9Ik
         h2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908322; x=1794513122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9t5hHnAag1EnA1IvHhWRwDHScTDeDJAqRJADEROHAM=;
        b=rAJfaB8FeJ8l/4b3ELAyuWrXdee6U27DJ3kH2+KomGUxkTGNWqT8XhCDRHh/CkShof
         vNwojUlMZ6GN66RSMNQgfbjK0zUP8GJfs1twz5RTSgLqWssvRTcR5423ePMnTh1heuP8
         o1RqEEeSnjB1upGvMJAJk0G4ALTwYI481Bwi3VR1cQ/tINQn8XQRPSecIT4cIh0Lyiaz
         Zb1ooMpn175mHyKYdn0HIY1qwktFsIL6Djo1WfgCZir8BrenDgLu2L7epmIBJn88aImK
         Yv/rQs8AYRDII0oNOCSOyOyXqaz7NIhjqaSBrKgPKcSN4SOnFuEVl3vvd8zFhA3wkokw
         p+8w==
X-Forwarded-Encrypted: i=1; AKwUvBzN8Wzuq2RZO5IaW/RlPBrcaQQRxJ9fArTTwk5cGcpUbaEorIzXi3LCyrKcTXdGqY0wADOVDSlZnQEO9Hs=@vger.kernel.org
X-Gm-Message-State: APuU4Z84Epub8KSsYS+CCK59xmUdsJpcpHGLfmKTGUQkjochHxCsVBZG
	aUcU5IdMQP0rQF8x0t8KCNFVawXpsctwwWVwMeJ46cuwK4MGoykelSGT
X-Gm-Gg: AYBFou1FOOUzmhBlqn/QhChxJeT6uyFonkG5nlLnRrv3Pype3B6aXd9HwAL3nxu/tlD
	pO3icturaijK0teNLv4BrywdxFVFyJJmWX10/f4WOl7fAuFV0q5w7ucAfou6p01iKJVMATAur/k
	e2S9d2xgGIa3GV/5o8EbfsLvDChDY47gjpDpQ/Ag3apr26PUCu4AAGRKPS5J1FnKrIN4LyHlrY8
	BpUHejlEtZSNfLzOITM/+kTQbUaLrgBpsiENzvfva/27ViEbhtq5sLwBPzuG48MV+yw3KXij2Qs
	gfDQzScjy59d5QTamhP7wJD0CH0IsPBEnTrkXRq62/0z03+1CTafy1f9RMsXXugaSPkaLyHFOpo
	dal8ABTkNhtWliG7m1QwLGA9DIBf1L4dAjBw29GElqaWYr92G5JXQQtfK6o8BsEheP/GSKY3xrb
	d+TP4tLMJuYoq7RPgcJHrHWza3/zcQ8UG8eZLeAcwRWpyBJwJy77VRfu8oiirF53E5jOEH6vHzX
	OHjoMsFqJgqTld7rp4gb//bT+ZXTyObcS2IZQ68pdlTPHksogppp68UHbRHgShT1SzC3YcyMdeb
	+u6N1KuAM/OxlaMhz4HDiZWOkXVPcEarHBfzUEP43EbjLginng==
X-Received: by 2002:a05:600c:6d8f:b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4b6d82b2c85mr3060825e9.0.1793908321669;
        Thu, 05 Nov 2026 11:52:01 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e1b5d676sm2497515e9.7.2026.11.05.11.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:52:01 -0800 (PST)
Date: Thu, 5 Nov 2026 22:51:57 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: juri.lelli@redhat.com, peterz@infradead.org, mingo@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it, mathieu.poirier@linaro.org, 
	longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de, clrkwllms@kernel.org, 
	parri.andrea@gmail.com, m.szyprowski@samsung.com, weihengqiuu@gmail.com, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3 01/24] sched: Fix cpuset_mutex double unlock in
 __sched_setscheduler()
Message-ID: <auzdzi_ZIqmYFV-Z@scheduler.schedules>
References: <20261105193359.1450487-1-mathieu.desnoyers@efficios.com>
 <20261105193359.1450487-2-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261105193359.1450487-2-mathieu.desnoyers@efficios.com>

On Thu, Nov 05, 2026 at 02:33:36PM -0500, Mathieu Desnoyers wrote:
> From: Andrea Parri <parri.andrea@gmail.com>

> Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261016062629.2102883-1-sh_def%40163.com
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Cc: stable@vger.kernel.org
> Reviewed-by: Waiman Long <longman@redhat.com>
> Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

You gotta add your own SoB, no?


Cheers,

Kayra
