Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C734489FD1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047635; cv=none; b=hHX17VxPB7nJBPRgjqIyu33fU8bwfJja+LBd6GROXYbIwlcEv7WDVcFNFPI/2vaiRYOGZV8st28bnJ49zz6aRc4QEf1h2ldRGPCUvQC7tRGvcE1Frqlf3WVEw2JCRcB7tnVbn7NgyjpACS5rl3l1y6tmLtaONUQFamVDMya0rTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047635; c=relaxed/simple;
	bh=E0HFg0SzLDxP5QD6hp/YjRxGgume2isM05oS3oy4/Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bA5gUtOnIhNBUQLGogiP9IMP2womL88bXCCdn9Tj5ze37kvD3jX7znHtgp8DFpwzNx41CnhAbNXj0wXhNfONR8MILo/XjcNbRqdRTccdsju/LpJnKyCi118n8r1+7/iFSyuhI2kELK35a/l1NJVc1YnwUR70l/oWUEzCQbM7Dxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=CKQOPX94; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="CKQOPX94"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9399daa3d43so417743485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789047631; x=1789652431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aY0bZ/yqrjuFAG3J6+JEFIWAYMbJQEXce7G9l1M4Rcc=;
        b=CKQOPX94M69/LzUskxyfGliTFAlVsyLopvpt0sLwbo/Pn10hRe1e01BSeZ492LTU4g
         MR/X0W87+Q4KWTSh4DYQ9d4GfhBkEaF5XhmlN2odStk0UBNQHRiJ2ps7TXJRGK5LObBf
         USVNKpzq3unJritdP4Vv3T0g+5U8zi/eB+o8QW+XgPfYZ5RP1Xs23ip3q8ie/xJSv1qc
         RSjlHzvOYynSipCbvraD2YTlpjPe+OgjO7BIcD+yZaDwGiLhrRrT6wXxE5q5oV4e3ZZZ
         d8Uu1zaOHb07ey7RdWw4dvFR7R2jZYDa4+mMt6xoYnsscm4nugSESvns1/BvyKKSITcK
         5zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047631; x=1789652431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aY0bZ/yqrjuFAG3J6+JEFIWAYMbJQEXce7G9l1M4Rcc=;
        b=CVZV4Q6VUftMT4QGYLEC33AAH2/p0zediEUs2AjuvKg2IgI6aRl6EYZwQXW4fpSxED
         wauD4NBFhlC9cvjSoTyNOmKYM9+xqvbS1iNF7496xY6yXfuB8NutduDzxhnN/ORXc/M9
         1nVNmRTo54lenhPBwEjCUDFJYqNlqZcSdmHLTyCw3j+jBhXnTmZxSaBLxaK0tIDT0SdR
         ZRcZdE63TAeNbz2d0FmpCP6cdafgmqPxbao5iKqftrqEySh9T0ekxd8c90Z8cmVUo60c
         PWCPoRj+mbwdw0Y/1YA82OUPCvGhab/OwmenOO6diP+XdVmvIRQOGPwTmoHBDEwEYTxh
         g0sQ==
X-Forwarded-Encrypted: i=1; AKwUvBxopak0ebfybQLbpbO0IYS1Sp8cjPjIc9OPI7BFEMkTYd9SY2Xo8jfbgdcsX4dQ+eyKkKEJDQd7TAHcwC8=@vger.kernel.org
X-Gm-Message-State: AFuF++l/ZTk66KXa8gu/s+TOWMZH7md92/MEl5HPtRv0f22spkgw1CCA
	3ki/4fxPUTaQ13u3YG/1cqM+6YJuSxBeHwEJl/i06HPs3Tj/3XUNXs4p+IVlnWX3d8M=
X-Gm-Gg: AYBFou3kLLAUf+iJhQQdqpay5da10WnxQr4xy3R6n+BpcFKdpIN53JCG+N68VDWaHB4
	XgDDY4wwP29fZ/QdYXBdp5ciZ/BugAhqerSmObRi8qFrARdTdi8w1bfXjzfPeiMu9Mu9zP+JwY+
	nfM9TW3YXtQq2OjHojJ1O01oHCFO0X8e1STLjLQk7PEGMkIlgLCR5hFf6WYKx3bbSJ2g8qs0wly
	UdqJ3oQ2gCXqIryb+9UVXm7XJWNnGeCxSnrpKME9Q6zEps39FrIZc7zqy3C0FGP1AGmhHNjMbn8
	9XZaDInW5hs18CNL7TaSjp0BR2M0tVzwrJanyBczT/R0KF5TF0RvsVzXu7nHj5Mop6VdC9rkx7L
	s9RiNUoWRuinoudF8e+Dbvq6c7q9zrX77uhl7uavG2OE1EmP3wo2rtm2o0n+8WerAyogpTCElHc
	rizbgKs0jJ0WgSTjDt20Py/0RTK+FRfbOocwQKOZ2IGws6ZM+T+Xw+5pqpO1ir3pYPKbNDkn42n
	c9BVhYVsFq3/lzuRT2b/puubwtlvzKqCi1sk/qYRNfAe8DqBOhqm2yNzPBHQmbcKg==
X-Received: by 2002:a05:620a:2a11:b0:939:a2fe:926e with SMTP id af79cd13be357-939a2fe971fmr3077102985a.17.1789047630473;
        Thu, 10 Sep 2026 06:40:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e190f8c3sm78468885a.17.2026.09.10.06.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:40:30 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:40:28 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	pbonzini@redhat.com, seanjc@google.com, akpm@linux-foundation.org, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, shuah@kernel.org
Subject: Re: [PATCH 0/5] KVM: guest_memfd: bind backing memory to a NUMA node
Message-ID: <aqKzIO3DD66Dhkdw@gourry-fedora-PF4VCD3F>
References: <20260902194657.79075-1-gourry@gourry.net>
 <9b67424d-70e5-442b-9ec7-22b1d3db12f4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b67424d-70e5-442b-9ec7-22b1d3db12f4@kernel.org>

On Thu, Sep 10, 2026 at 01:30:04PM +0200, David Hildenbrand (Arm) wrote:
> On 9/2/26 21:46, Gregory Price wrote:
> > guest_memfd allocates its folios through a per-inode shared mempolicy.
> > 
> > Today that policy can only be set after the fact, with mbind() on a host
> > mmap of the fd. That requires the fd to be mappable, and it cannot reach
> > folios that are only ever guest-faulted. Neither holds for a
> > non-mappable (confidential) guest_memfd.
> 
> That looks like an investment into a mechanism we will soon consider legacy, so
> I am not convinced this is the right approach?
> 

Hm, I think i've missed recent work in this space / this context.
Any suggested reading here? Don't want to eat too much of your time.

~Gregory
