Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930620;
	b=a1m+b/GOZE90FNmG0y6Nz/UjOiOcIVuHdvnvNRUIQfAQ30VLp4FwLNGwHqgFSX1PIXn7
	 pt2KwsSQHQAJWElq+dEivdDn3HKkyX2XOclyNrEDVdO+MN9o0VS6+mWltYeX7JE0S2rgk
	 bSORwMo9VseeLR66AAI8PFcG8fv1hVxzHH23SPKgr02ParAcGPdecBmZNSGvBiDGjPSMb
	 FulhN8evulp9Qg+vnrMSY7swVfwKRPKTFIPbdKnyST8DvIlWloiTaM0VMql6zMfXB+rJp
	 j4AZWKUxEb3ghG3+fZs6/q624JqNLFUPFcrS+o70KNHL9ffil3XXFynbGbWUXTlOOgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930620;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DWGBw+ma+bMigxCgLDrq/Q/j3clEUU2w1Ctfb4UCi3E=;
	b=E79Lz/w/8sp6pazyhky/JvNuN7QNskvEIj0GIly3qUf5iuIdCFFgVL/aqIJ+AM1z3HSo
	 DUn783E7xzc/uiLoe6zVjg6TrjJwxfUx39sbwaHGTqXqxZ4jvg5B7H4chqvA+S12yse7y
	 ZqlNqOjBVW1d48d6QTqXwNbzIOR5bDNEyKI59T3YIJJh95J0kYjocnmTunspzE2muONDj
	 gV26glOgChlCAA36d/WUoA9WKVXKFrbz+A3txNzON3BETuWH869VVcfbBGqaGZn2EySSs
	 nMdBocyqbpo4ulIzfuPfuYmoTy1wCVXOH4YKtoLTGJQBD0yjw1NTLmIiwFuuE2RiEgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zz8cXtlA;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ak7sinso;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B3E606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B3E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zz8cXtlA;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ak7sinso
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794930619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DWGBw+ma+bMigxCgLDrq/Q/j3clEUU2w1Ctfb4UCi3E=;
	b=Zz8cXtlApWjpbVuXttVbWrASbW6zZyPywXsITzdXJpjrn2DYk66Ddk+sZ1jMQqdRVfB+Hh
	nt7gMExRENyMbXfWeH7tIEgT6G7YJcK4IXZR2YfPA6IlNqmVccnFO9VR5YFJIyMs/YEuGe
	dbiFXBOFIKclUvgjyjd97Eq9rt1kNHg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-PyMWHORdN52y0d7UgxKDxQ-1; Tue, 17 Nov 2026 10:50:16 -0500
X-MC-Unique: PyMWHORdN52y0d7UgxKDxQ-1
X-Mimecast-MFC-AGG-ID: PyMWHORdN52y0d7UgxKDxQ_1794930615
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490c1867460so3107969f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794930615; x=1795535415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWGBw+ma+bMigxCgLDrq/Q/j3clEUU2w1Ctfb4UCi3E=;
        b=ak7sinsom3feMrz1/XDpcYkXy3ZCzXP5caP8YQw8MKBmBvOmJftsTQ+pYR9nd/KHmX
         4pdU7TBXNnnh2YawYrUel9wy7nEfafmSvxTwTq0Pc53r7SVbjQsbnlw4x2TEIJXWjOXG
         q37lxkcRkXAhIKYXnhyL7jheNIedltMkuTaqrrrc+zdvid2iCOadxpfzytF5FJcvH/Wd
         ffP9uV2UnjGQjOG41mX+NAy12pSAr0CLWEMVjRGz1RiP3D5xjD6UQ/3zBPXWohJlhDoG
         DYfwL822jwI4NTyfF2cosYo0AjBZsYSTpheJCzytntDH6STykplrV2Lbm3GvCDfLHg4R
         9Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930615; x=1795535415;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWGBw+ma+bMigxCgLDrq/Q/j3clEUU2w1Ctfb4UCi3E=;
        b=Hv7DrKEpnW1c82Qm+v9+edgVQ1oS9nExhLyWqwuvfqXNf4DECuJ6rMUy2W9izaIfbq
         KxHSKIhwlSH665yrHt8egneu/trbe36UMwLH9Fly+GpOy5ea1/Mza4QSknSKNKsu3BYZ
         jUFbsKrsWdJy2Yf5FNacCFJ9IQIpf+ihCsQkYNQAThbDe/EwVXrzCDxLBGNCpRE6Omny
         kbKwJwm/602BomZSSh0jzG3MuMxtQbE6+zS2Sa5eV9EbHvt37dgyMI4vIckivWMRQ09t
         egmTt5ZM6CqqYCCqWtWQGqsskoaKBbu1uih9C4/eqpjQm8jG4US5w9PmldQ9wLpq51bs
         HG9A==
X-Forwarded-Encrypted: i=1; AL+hErHU4C5679jRjVdERnqElTlcRRLHIoR6O7/O8R92c6yKt/0msxryj3l0p9JjZeKB//eMMnwUoHtAFS13EMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SEHJaeL8hyQkAYyfgCL6H/DYqos0kd4du2f5st65IstnZhQ5U
	VEQuFKSWQNqe4pq1+ZAZcYMiZUW46Ezoj7XgPioo5s4YrbaVGEmtitJmA4duEnJOBvP46ly+iy1
	qZ8udMLPNw9xh5YvjIy+viiKY1/jce32W5v9q8JzN6NQQIb8jgvrrT6A1Y8CfRvVUNA==
X-Gm-Gg: AZFdTZem5KMdH852i0Cmhd0N7kTHYduQbPfPCI6Z/pqVv/jw1L2c9YNvCj2CmcGdgqK
	DOBBiUH6LOs2ITw8to2Iap7pDOJHrD9MyNUgIGTfxIhNIdUvg5ufAbE+eCIaE8odFfzepJcYTgi
	68i0ieEl4mD91wyLddVSwFfazeqILT7ynXie5nKkuwlR895PMNbtXSlWSFpR+WFY3gK5lcKTEHp
	ZVkWfJl++iTXP9+7fNs9dJDJrz3ZRvSSf8m+55nVnsvgT/SnLb4n/pACT3fOJUhbyV0+BmbhK95
	gYYTtMRV8/PE59CQhv7i9SGv233qYJRMIyHsCMQXGmXbwf/X407Epo8XIak9CFTakq+AV30IVgo
	Pfx20NWF7Bxbv+PxcqTyNx6Uxn/bqLobrwy4C7KVuv+V+S+7sMje/C7j/KXXhVqZepN/zsXNWVe
	y7Fkw=
X-Received: by 2002:a05:6000:2906:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-49c73afb0damr32270863f8f.50.1794930614804;
        Tue, 17 Nov 2026 07:50:14 -0800 (PST)
X-Received: by 2002:a05:6000:2906:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-49c73afb0damr32270802f8f.50.1794930614342;
        Tue, 17 Nov 2026 07:50:14 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm23414900f8f.53.2026.11.17.07.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:50:08 -0800 (PST)
Date: Tue, 17 Nov 2026 16:49:49 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Yuri Andriaccio <yurand2000@gmail.com>
Cc: tj@kernel.org, bsegall@google.com, cgroups@vger.kernel.org,
	dietmar.eggemann@arm.com, hannes@cmpxchg.org,
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
	luca.abeni@santannapisa.it, mgorman@suse.de, mingo@redhat.com,
	mkoutny@suse.com, peterz@infradead.org, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com,
	yuri.andriaccio@santannapisa.it
Subject: Re: [RFC PATCH v7 00/29] Hierarchical Constant Bandwidth Server
Message-ID: <avx3nfSu1cl9I0W1@jlelli-thinkpadt14gen4.remote.csb>
References: <212c244d534ee1fdb0538a980789e16c@kernel.org>
 <20261111175657.250354-1-yurand2000@gmail.com>
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
In-Reply-To: <20261111175657.250354-1-yurand2000@gmail.com>

On 11/11/26 18:56, Yuri Andriaccio wrote:

...

> - `cpu` and `cpuset` controllers are decoupled, as it was before the `cpuset`
>   integration patch. The user/admin is responsible for inconsistencies between
>   the two controllers (i.e. empty intersection between active server in the
>   rt-cgroup and the allowed cpuset just disallows executing RT tasks entirely).

Curious to see what Tejun (and others) think about this and the other
points, but FWIW I'd also lean towards decoupling.

It looks like the enforcement you need for it is already in the
patchset: RT tasks can't be placed on CPUs where their cgroup's server
has no runtime (find_lowest_rt_rq() skips them). So an empty
intersection between a cgroup's per-CPU entries and its cpuset just
means no RT execution there, and that's the user's configuration, same
as an isolated partition with no tasks in it.

Thanks,
Juri

