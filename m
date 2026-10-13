Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17901A238F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879758; cv=none; b=CwHWmS3KMDd8xd3uHPBh4Yr0sVtlVFLcNUKjJVj9bT+wJ3DduhVeSa1+f8U1HjoEAeDHWUvYU7Sqnw+bFCF8JybzZMbZxbXyAr+/VG95aXzpByuBpCGzFiLY9CmTQk5TkC9TkRllalQUFm6Pe/JmyvT4iM+2X7kJrfcFBXNKff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879758; c=relaxed/simple;
	bh=bAvuor41lLlVeDP8wdYZS7BlOwLbZAT1AumUAtJEv+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5Sm6xvsAKlfRhAHMcqJFeN6iyq6v99qVmZXaLZFLzIUMBROKcTrFVWeklKZLrS8TPyj+M8khTCs/txzAZiEzn873wuxlB0dT5luGkpITRzkmUoAvQ0fuImZeHus3snepJZjwERqbAzlnB9PFhH19rf4H+K6Y1Xjzno3Y8vrJds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=azfqxOvS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="azfqxOvS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so1580149f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791879755; x=1792484555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0o16lOHfFj6vVRWcNjQS9Yl6CwcGXYm//tE7X4074jE=;
        b=azfqxOvS/XsDHcKIaBlu0Y+fnz4WAmqghKzJvAQ454WRiUJo/sLKcxZdwc/OUkxjBa
         GCl4g0Xcthcb0NZI+9wPZTinnkYwvBrWDhQ6gRZ9/Es0n5SpiIq/Ymvc/fy0xvmJnGTe
         f4pAMuNf8p2E0Vr9jBFVIM3gZXt25+Io1WsuBiB2+Fgn2qdWIXDvBage3CTgjk1o/eh1
         B+WuLhu8I0Ga+VOA8q+QRxtIzKR9VkrRzVuOC4tRR7fGSy3BiB9XloN9R4O+BZxytRVH
         sGFotlr0a+nwglqlvrIYsA1M+0xgIzC1ZgPC14GSNVqdetaiJoxBYkWPAgcbF2ySB9q9
         fkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879755; x=1792484555;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0o16lOHfFj6vVRWcNjQS9Yl6CwcGXYm//tE7X4074jE=;
        b=Ry+ZmTXTc2fjANcR9EWJWjlBi3R+ld0WZpHvvGEHf8KEzL+k23NrUrtd/fPrtF7OZ5
         5s07lUMgv8hxIDtTXnzsV6q2Rpp7H6e45QUWjKVpZ4F49mfRXZLPXplmP7d/YGsgt/UC
         3staUVzw9y+vr++0re8luc0Rd26knfrgyCiSBTWnOmRhv0jeaWjCaZKwtZIGfMQaW3Dn
         k0ZtfL6YTBNfkoOyFR8NSlXOmttY2Lwe76MF0Z0M6O3GtUBm+EeIRfMr7WEOlObEV9vX
         S7ftaANkX4XfX1gsJBA9PSkUsnLzlDtrDt1SXHgS14+BoPNNMomP7EFTCK687iNcogyP
         U1CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmO8rALVgmjkmspJBQ9gU9vBlhH3q9NPMZNBg8AQzg8DMXG4DlHqJg59Io0Sd0uyxPijgRVyTFAgzDxyE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0Mhj9EZyHIJ4i5gqYzAFDew8wM1P1d9f0WBR/KH3/wg9vxKFX
	AnjwVf0DyWmD3ZmfZCdZc/hN5a1xIfn2uJuWSCEDnXPRmciAepc37PRUgKv5bKXsS5fMLY6ddNP
	PebX1PJw=
X-Gm-Gg: AYBFou2P93f95j3eRx919WgVWAt7or29LiUv2b0CjCmV3hxfOSP5YRGC6Ir1NNfFWe5
	bC/bNiudMNR5wYmQ7TX+eqLsvgOQu5OyTIW767bgfXl7k7/CsRQTNtSyNR5uIb7rKHlq1s7k7zf
	YpmFUxfoi94GSTEJ+08psOSWxOG0hcg/i6ERnUrmSUgQGOXD/2o3M55Rq4wOUNtqXQeXcDcz9VK
	iP6Uyc0BtVh+fA4KqqCZ4tSlBytYvqCHmoBqYPe8Y4paQ6JJlOsIRSoi4QZzBJe0woubK0+C8rj
	auTD2tQdfE28Mg1dknNI3uFFhpNjPgCQFjIUtCRP7XwkH+dkTaAbFaFmvbV8emwDfWHGE826ffJ
	+eHxPh115ZRTY9cw7VIkokQR3isM9rYtxRef1H8fYYxY3L6A1Jl68LmFHm8gZhajE8f7Raw08kQ
	hW/9AaWjI2bir4h+2UbfnbKu5v6FOg8+jaiVpXTObAX7yC83SDUf5P9Wws4pyfqDi27FfGhvVff
	VYjsOY6hGuc
X-Received: by 2002:a05:6000:2388:b0:48b:26b:7f8b with SMTP id ffacd0b85a97d-48dbacfbd3amr21310103f8f.57.1791879754824;
        Tue, 13 Oct 2026 01:22:34 -0700 (PDT)
Received: from localhost (109-81-32-161.rct.o2.cz. [109.81.32.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabc3sm3951815f8f.16.2026.10.13.01.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:22:34 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:22:33 +0200
From: Michal Hocko <mhocko@suse.com>
To: Rohit Ner <rohitner@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/memcontrol: log userspace OOM wait entry and
 completion
Message-ID: <as3qSdvoU2dESCsR@tiehlicka>
References: <20261013040034.3919469-1-rohitner@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013040034.3919469-1-rohitner@google.com>

On Tue 13-10-26 04:00:34, Rohit Ner wrote:
> When a memory cgroup hits its limit with memory.oom_control
> oom_kill_disable configured, mem_cgroup_oom_synchronize() puts the
> faulting task to sleep on memcg_oom_waitq and notifies userspace OOM
> handlers to reclaim memory, enlarge limits, or terminate tasks. On
> platforms where userspace is severely stalled under memory pressure
> before a hardware or software watchdog reset, no kernel breadcrumb is
> currently emitted when a memcg enters or exits this userspace OOM wait.

Correct, this is an inherent limitation of the feature. You rely that
the userspace OOM killer implementation is correct and memory pressure
aware.

> Log rate-limited KERN_ERR messages (pr_err_ratelimited) upon entering
> and completing the userspace OOM wait in mem_cgroup_oom_synchronize(),
> including the memcg path, memory usage/limit/unevictable stats, elapsed
> waited_ms, and whether the task exited due to a fatal signal.

Isn't this something you can achieve by adding dynamic tracepoints, bpf
progs etc.? Why do we need that for all users?

-- 
Michal Hocko
SUSE Labs
