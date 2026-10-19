Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428794;
	b=0BiFGqpX/iov1+vJYb4xCS00z0JXHByZJ0wrxYkU2HNPlzQ5lr8vB3nO0Ynp2N3n76qo
	 8wtu2+gWAWKmT/p3FqxxN+4Ap+qS+fI2MSKdSQX6J1HdJSZnjmVvLtOWy3KQ4nBw9t3dW
	 VaJuU+XZjbMO+peN/n2QV+uvmd+CFeYs4qvXQIgoglOIH3o7TNYUOA3fV2SlypwPbfKYb
	 Mq+7uDg8cfjNvtg4p93eIRm4HB5ryoY6SeIcRQZRvmFwdkyH8J3Eajj3UYJCM2XH3z8rL
	 rhO4RNJT/9ydgoNmyu950KBLV/fwNjGTqw6wqVXk+7aQm6kjoQXcSKC08kmR4MZPlxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xyTvuDZR4vVjsu5EkFdRLe73DiEeLvv3Sxajh/2hgAw=;
	b=z0n+lxhOhoA/Jwc37HxX4Q4byguZBDiG+KJ58qiFtq5tM+L68izzhTDwUp3eempBfyvg
	 ck0GqATopK9MQEQF2C7evem1leoCtgybaIrhsyfMILIfQyIol3dzvXvplmJon/emMUjo2
	 sbWhVXzDiIh3oqZgU+ILG4yrCX0Y0OyyH0/AJX70to/OsyC9rA0nJ/BNXx+2RpI3apk5+
	 GRZSzD79MUuc2HCUlAGd+Fpjl+dZbcG9QqohoGR15Sm8re6MioQUQJQBqvCzcIL/dLohG
	 MzxG+0jNcp3F7Kv+95AS8u5m7vQzUQlGqTlxa0ee/iESteGUvhC6HLqxqaYnBrfkLSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Kp2KrA20;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B333E606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B333E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Kp2KrA20
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e7ad9f78dso266938085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792428792; x=1793033592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xyTvuDZR4vVjsu5EkFdRLe73DiEeLvv3Sxajh/2hgAw=;
        b=Kp2KrA20/3xzTbAjDtHlmhYQmbFiJx10VCE8OuIUOcqpJPslRJgPWH+o78XyJjW3e9
         fNomFrSSCAE+fsuGxR6rrpjfcfLhF2REBqBc4EREzVaIrchFdFCbG/8TJS6RFkxDxaQh
         2tIfGJH0/Rtt9xtLeBOLGZQ/7t46v/L+7DYFLwj2jXwFQznP4LOJWKtY3acXbTRtOPrk
         /wSSwgXNcFqZ6yggReQJ10Q9p44znRL1+/67A/IVdA0PtrT5YW8k4kg2jaHguNxU2jEq
         nJLi7a/IQNZaWIiXnmEiGoWHXbv+16oawNtlFVEFp2bMFLkRKhYLT594Bnm7GRys6IeE
         4BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428792; x=1793033592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyTvuDZR4vVjsu5EkFdRLe73DiEeLvv3Sxajh/2hgAw=;
        b=aOMSrQe0f/fc8F0HVnpPeBs741TGKI1pLnuuI1TY9d0wGSVHOT9287Xxk2cf9WhgmK
         KkCUp1jfuxUAmaASbnCrJ9oPql5AFFMkR23YQ6KqbqH1A0Av3bv6PFAgX5PEI+MUDxxa
         OqfXHS8Jacz/oDm40vbb1ODM16cDc6t0a3/EeI2YyQtQulguAhyDH5wV22QwQPvY+Foa
         bK+aM5aFajZKhhvh28KojrYhMen4Gl57KMnWtB/j3ZbolWKOnuJNZDJnlVlYoQWdEDUb
         O4CAJqa5UHtuBQsjzmv0hiT5CdFQ5KHBexWVCWLu+5b/EN/TdvNTKJsxvgg1yeU179de
         P6pg==
X-Forwarded-Encrypted: i=1; AKwUvBwy9XIM4Xn+iqX+YcVZBh/ms0y6G4MkunkdmKF9Vhgkqmoqx4e85dAtH7ux6nMzfC479ky42qFTfcpszic=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOjeaC1oUhKRl/gI1SnLMN82oG0IYM0tzRmjB8BVsV12IkuF2+
	68M8irrhSoLV6hyHXbiZW46ttxKKwn1ca/Ao46DUtLa7oKE8BhKRfUsOJDb9oX9OuNjuoYFhc36
	ug9Gzqxk=
X-Gm-Gg: AYBFou1QfsgNHXz0a6Q0yJI/VAWBQennZdg8pehbmELDBy1LMJqm5pnJoT+I+CP0NL8
	JZI5hlxD9BHREthshFKMC2CkxP/JLkewmj+I9B84qTRdeVIrrCuindjlTEgsYKEF9qaNLRCcruY
	SbH8AoN/9dg0zXlgDy/KWZw6RFdI1OZQTFjdtxgrYGE1aUREV78ipk0lJWVbfNzAh0NTceItdG3
	DEghRrW5SQxJvfjsZPO/ye3K8lH8FMvqebYopyeZndxXkpfWCEy2pqNsNav/roAtjkTStxS4HwY
	CSBBcCL1tKduA+Svtafk+Qo4RD4DKlTsPSTfE3oDyk/nWZIW2Xu8/lcprPqQGKTpIdo/NTChzOD
	v48f6c+J/6jdMB13Xst2b0qLr54uNGFI2SVJs1xFMjbpYWIusmJYijzMO+0mhaePqzMwTJBhNHN
	J9A+dkMj0METqS3fChQ03f78jAqOnOM22UMXAgco2WqwRYgGyZYRdgFwWe6F5VxVqnJdG7XPdcX
	I7OGe41tL6jDJ+BRkwol6XTPgROS4Z8Cn9Vambdvth9xo/7WYab//NtUQv2Pb63bA==
X-Received: by 2002:a05:620a:7106:b0:93b:db80:e0cf with SMTP id af79cd13be357-93f29db7f0fmr1372869985a.60.1792428792624;
        Mon, 19 Oct 2026 09:53:12 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b0d7c74sm1529985a.35.2026.10.19.09.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:53:12 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:53:10 -0400
From: Gregory Price <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, longman@redhat.com, ridong.chen@linux.dev, 
	tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, akpm@linux-foundation.org, 
	mgorman@suse.de
Subject: Re: [PATCH v2] cgroup/cpuset: use mems_allowed_seq when checking a
 policy nodemask
Message-ID: <atZKl0yVl5u624o1@gourry-fedora-PF4VCD3F>
References: <20261019162138.3271947-1-gourry@gourry.net>
 <805cfff2-1856-4b48-9afc-174a56405283@kernel.org>
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
In-Reply-To: <805cfff2-1856-4b48-9afc-174a56405283@kernel.org>

On Mon, Oct 19, 2026 at 06:41:50PM +0200, Vlastimil Babka (SUSE) wrote:
> On 10/19/26 18:21, Gregory Price (Meta) wrote:
> > A cpuset update changes the task's mems_allowed and rebinds its
> > mempolicy in separate steps under mems_allowed_seq, but the check
> > reads both without it.  This can cause a spurious numa placement
> > miss under some cpuset/mempolicy combinations.
> > 
> > A reader that loads one mask before the update and the other after
> > it can see a spurious empty intersection and drop the nodemask.
> > 
> > For example, a task with cpuset.mems={0} and MPOL_BIND={0}.  If the
> > cpuset moves to mems={1,2}, the policy is rebound to {1}.
> > 
> > The allocator can race and compare the old mems_allowed {0} against
> > the new policy {1} - which will result in a dropped nodemask and a
> > misplaced allocation on node 2.
> 
> And since this can have only performance implications and not cause a
> functional issue, we don't need Cc: stable.
> 
> (unlike violating a __GFP_THISNODE allocation which could be quite bad and
> has happened in the past)
> 

Agreed.

~Gregory
