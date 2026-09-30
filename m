Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8F9547074
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770323; cv=none; b=purg7pFqRQFWJ4e0oOzzKfCleiR3E76ulBjFSLUPjafJP3+e0cQeUJ3yTP/GfxX4dLgevk99F0UNEswyn9SDW/Isp9ojrOfeVljB0S0Tt6xOu3TsTGBI1zgOe3VycBhMzIPXrYpjC9Nsc74w3PWMc9bZU7ocNvs6l8JC6Mskla0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770323; c=relaxed/simple;
	bh=heiLNgxCRShurwcEkBpHOEt50V9w8wXC0MeKwIR/wJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lupqyjSGo6sqSgdTts+3uyWsysJM7sraFugiIAxOcKZqzg8Ysc4cixYPabK2W2N2vMBEvtwIZX208/xlwMjXJv8iRIJnNK8mYdQK18/99sUkmo07egj/DmIf1II/tR4Ja1W5lAbcAvfFurGw5sd3dD3Lg61/hPkI8QiHoRB4A0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6z0fnEj; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6z0fnEj"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-499c0f06935so1170299fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790770317; x=1791375117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZFYvPCDLrvrC5oT74t7swbnU8bzwyNGtjBbSx2EyWUU=;
        b=K6z0fnEjZUNruyGZwT7EUz7Ktdq+q9ZGwpSQS/eESmThnUQFCdeKQ8XFBWQ7HIY1cR
         GNeIE84dgpiYTOfEjYShPhQ6QIaRsqZTWlxvqbPwgRyEGe7Cl7NXZycxRUIcvpbVQsAb
         vVRrq/AEpNhS7w3EpMexz/wl5CgzopLSizPs/cDep+qZ1avYziKQ9b7KeJ+P0T6ooSo8
         8+pO4T/bDYmkEryrCc8wZ0v8z/wqMqp0uxDrzcai8Cs6JHRMstX8oReYETlKeM+YTt4H
         vsrul9XMrT9rHKHHnXzrmH3GmXPaJJOZUf7nDOI9D2cDntEa2AOilepcUgXJF8yihFsa
         LA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770317; x=1791375117;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFYvPCDLrvrC5oT74t7swbnU8bzwyNGtjBbSx2EyWUU=;
        b=OZpx33BMHNijgsyahtFrlkaWQ7BsEqxNPe6XPyP42laHgfPyI+S2/qnGYjGQhPN4ec
         aBfVuEnkKfOI2NQZYlsQSti0G89qB9ddswfdkyBVgpzci6cwPoGcNlBE4BGzlMUuHsDq
         yqo50Y7vGiPBDb6518wN72xVcowX/L30mCzIp0xtT9NG6kPUoKPu/bq0gWupiXQnDHQm
         bync9TpYCP1TzPUP4GhJeOWihX9Si4wgoiXeIdhvfBtuSoadh0pk/XXxVpEYu/+OCcvp
         k9Y/BEx2Xco3souqmaSQU4aQYb4rZWeYy1PEGWuii85LR30FwkecD0Z2nARdgPrASpYC
         lKkg==
X-Forwarded-Encrypted: i=1; AKwUvByj0HX+FqPohT1sbJR0QDhPfSzOtRXNZ5DKuJgWEM+K6LLkt096P2Otl+9FDC3W38Pm92BhO5y/rVxVDZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mjGH1qd0Mk7xEypQhB08aG+P/AE4JOh+V1LsfRQFzV63UKUhDa
	kZaDvuQ09ZTJnRoSDY4fUyqXJrwHptOSO9yp7YOQlAo421c2bwa0qacv
X-Gm-Gg: AYBFou26SNNtYfYkASoevs49Ey9+d/r2ZWgbPn93/XQADW1L8s1PCLASN7uSGXHUdVy
	nqkYNcbTRgEGFuO9+swD84M1uDnEIkok+e5r0w7HasaHZk7LXKq2nf+yI1pTGKkZdr9PGV0EZvm
	QXZ3KFQaUSYO8Hn9Ky25p478sgzurmW/nCvCC9VgFMSfG2eZI9suJqfmvJZY9uYZ6GQlpmspPQe
	2LqkfKRNLnDOxJPNHrYDFSh8i5MLMBKF6SRlvHiSokX5+pYGtTK6b2//JLnGMuq31WRObF3B4vY
	yG23zOhJ1I5YNZH0g2ZHZ2rw2T+3vgzz42npZOzzJlEmuo5qNYA5iT8+pUv9gGhMDfEiBomUZrE
	8YhF4lDet8hc2Simf0vhOgVxd0YG99JMkZNs8esc0EW6JWcyuQ8RBUtqRPsy9cCCjXAaCJZDZHs
	2xUcweOBDu+yojz5nARxcE0HBVAxzsibXhaeRqanuAM1cqjp1kFDsVP9bEj/W1AMe0VAQphWXCu
	lyas3wOWXz4F/7EJOE6ome6T/P7GQ==
X-Received: by 2002:a05:6870:9615:b0:49d:c9ed:21f2 with SMTP id 586e51a60fabf-49ddda314d9mr1064165fac.18.1790770317220;
        Wed, 30 Sep 2026 05:11:57 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:8::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49de00cd469sm522330fac.17.2026.09.30.05.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:11:56 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Li Zhe" <lizhe.67@bytedance.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference with MPOL_WEIGHTED_INTERLEAVE policy
Date: Wed, 30 Sep 2026 05:11:52 -0700
Message-ID: <20260930121154.687586-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <808292b4-841c-45bd-aacd-b487be1858ca@bytedance.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 30 Sep 2026 19:52:05 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:

> On 9/30/26 7:26 PM, David Hildenbrand (Arm) wrote:
> > On 9/30/26 09:26, Li Zhe wrote:
> >> MPOL_WEIGHTED_INTERLEAVE is useful on tiered-memory systems because it
> >> can seed a workload's new allocations across fast memory and slower
> >> capacity memory according to a configured ratio.
> >>
> >> That initial placement is useful for workload managers and orchestration
> >> systems.  They can take the amount of fast memory and slower capacity
> >> memory on a machine into account before starting a workload, and choose a
> >> weighted policy that seeds the workload across the tiers at allocation
> >> time.  This avoids starting from an all-fast or all-slow placement and
> >> then relying on promotion or demotion to reshape a large working set.
> >>
> >> After those pages have been placed, however, the policy cannot currently
> >> opt in to migrate-on-fault placement.  set_mempolicy() and mbind()
> >> reject MPOL_WEIGHTED_INTERLEAVE when MPOL_F_NUMA_BALANCING is specified,
> >> so memory tiering cannot promote hot pages that were initially placed on
> >> the slower nodes by the weighted policy.
> >>
> >> Initial placement is only a starting point.  Pages initially allocated on
> >> fast memory are not necessarily the long-term hot pages, and pages
> >> initially allocated on slower memory may become hot as the workload's hot
> >> set changes.  The policy therefore needs to be able to combine weighted
> >> initial placement with memory tiering's NUMA fault based hot-page
> >> promotion.
> > Ok, so memory allocation will respect the weights but balancing will ignore
> > them? That really sounds rather odd to me.
> >
> > And I assume that was the reason why we might have disallowed the combination:
> > it turns a weighted mechanism into an unweighted mechanism.
> >
> > So are we really sure these semantics that you would essentially set in stone
> > here are the semantics we want? (ignoring weights)
> Yes, that is a fair concern. It does look odd if the weights are
> interpreted as a hard resident placement ratio.
> 
> My understanding of the existing MPOL_WEIGHTED_INTERLEAVE ABI is that
> the weights are allocation weights, not a long-term resident ratio. The
> sysfs ABI documentation says that these weights only affect new
> allocations, and that changing them at runtime will not migrate already
> allocated pages.  The implementation also has normal allocation fallback
> if the selected weighted target cannot satisfy the allocation.
> 
> The use case here follows that interpretation.  The weights are used to
> seed the initial placement across memory tiers.  After that, with an
> explicit MPOL_F_NUMA_BALANCING opt-in, memory tiering would promote hot
> pages based on access patterns, not based on the original allocation
> ratio.  Users that want weighted allocation without that behavior would
> keep using MPOL_WEIGHTED_INTERLEAVE without MPOL_F_NUMA_BALANCING.
> 
> That said, I agree that allowing this flag combination would set the
> semantics for it.  If reusing MPOL_F_NUMA_BALANCING for this is too
> ambiguous, do you think we should model this as a separate opt-in ABI
> for "weighted initial placement plus access-based balancing" instead?
> For example, a separate flag or policy mode would make it clearer that
> the weights are not intended to constrain migrate-on-fault placement.
> 
> If the allocation-only interpretation of the weights is acceptable, I
> can make it explicit in the commit message and documentation in v2.
> Otherwise I would appreciate your suggestion on the preferred interface.

I see two usecases for weighted interleave. Let's say you first allocate
all the cold memory, and then all the hot memory using an interleave
policy. This leaves the same hotness in both tiers since they are
interleaved:

In one scenario you might genuinely want to keep some hot memory in
both tiers to maximize bandwidth utilization.

But in the other case when you are not limited by bandwidth, you might
indeed want to start out with a weighted interleave allocation to
reduce variance on where hot memory lands, and then make promotion /
demotion decisions based on access.

Zhe, do you have a specific use-case in mind? For the second use
case I would be curious to see if you see any meaningful performance
differences in startup time when comapring a workload using other
mempolicies for the allocation and then tiering vs. using weighted
interleave and then tiering. 

But yeah, I think David is right that we should go over the semantics
and really make sure this is what we want to commit to.

Thanks again Zhe! Have a great day,
Joshua

> Thanks,
> Zhe
