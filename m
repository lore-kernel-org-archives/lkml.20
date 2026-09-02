Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043144A4829
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360770; cv=none; b=ngU+QVX/Q7dtGp1buASXqrGXXVO6iliDW/ceDnVqdsimKeoKaDwSndrJc1h/M78HBnuLEXIC0W1Xx51XrQkMLRtXhJgKQ6pxs1dpzApOYwQEHhkIttSMK+S6DbQaoKMTHIWRGlRwpDxQMl6Rg2lCo350a5ejXzVSD4CKrzcX3gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360770; c=relaxed/simple;
	bh=t8SM8twx/NkDDPqpoymoufz4eLwZ8z72s78GcVnNOUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mI5ZRvZZA67VpNdl3V5bpae7KS2SyjMxd808wIERfSw/v6mktZgiWVrWdRyVQdKaquRAyMP2KrDxf+M0gXsEVMLLxK5zSa4398J1eBdibXhXVqlgDTzSqa9mCb2NxZGrH7ECQj76xSWO4HpJq+ClXn+MwjrN5XOYepDOapJi4iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=AAW3/0R/; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="AAW3/0R/"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-930c0f9c1b1so126405585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788360768; x=1788965568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nA5nu0+O7KB9P/Xs27S/xlgEyjuqVVZbaW6JykZXG08=;
        b=AAW3/0R/Pel7tEckUBRpT0J2kuJ9FDAlyTbYARLHEWA2oPKTrIWOOk+OXxU1PSxTq5
         xdMcGpnzyl7aOld2lVYV7xLXk0pF3OIojJKaT+KJ+30eRar+7sS559Fu3LxfSRQ9/l/O
         i5kv6MOLtYw9YniUDcYNhpWeO0meDxWGCUyaDntDHatQEbcY7ey6YTL06rnZ0hB27RHu
         MrF4GWrKLwO5wBQxEc88vlvneRf/MbNafkJQ/OI12rCCQYZKHm5RwwZFvBTabue5bjr2
         Ns756wF66wTdtoKQ0s141WRDWk842S1wVk7DkPYwcLc9fOJ1a4Ui8K3bpxOZprpEd6as
         SiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360768; x=1788965568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nA5nu0+O7KB9P/Xs27S/xlgEyjuqVVZbaW6JykZXG08=;
        b=By3tgPGl8SZpy5WtcwsEqVjook+QZq1eeB8VnUq83hB8xJoaw1P6d9r3SktzYoU4ru
         0z3rSQqFGPmwa6Vn+E3NH1h3yTqrkNAdQJ8UalteIFhTyojum92DY1LbPYni9Er++awu
         c6DT06TryUcrF+BfXTWWgqf0vDS5jaW3uzSQnpu9geGUbP4gjKgUd4iLxqqKEQSDNI+m
         Bl/dSOx+wU+chypjx5egib5uJ3N+DADiNSLjBTibRIuXWML+g75vBRVh0Ypzsahtk9QD
         jiP7j+U4C8mCl8MrqcLDXj1ayVNVkp4VrowpvWR+G4qYlSuSstlncgQESFzmvQoxRZXu
         oKnw==
X-Gm-Message-State: AFuF++mXWO6VCYN3bGTRklfkaNxnUAsNQ4nHPxlvyi8nrhjA7rGi/Urs
	xSGNd0sfhKwvAwhik3Cm1Ecd7BWhG7dpBeorxHKJ6NSnMiRW+uWlWTgI+kgHgSGt6YE=
X-Gm-Gg: AR+sD11zskcBawOMju913duajqGHFQfrcXc4KVki70fmf9/S9rizkdecMcTFun6dh3n
	D9jmjwQdk2UZZXaxQ3FUQFRAtUy8IdPAUIrMSa/5BMy855/IEWcGcilzSZoVBfPFf7LCihCQn4b
	Flz0VEDTl6pReMzVnWOHSdeM8rdlUPwKuJxdCWhxnswUYWiMBt3BwxkQnKdQ44zZSxAclHrda7s
	FMYXgff7tgQN1bkDNgP56GKV9JuwORP6w86KL2jYGVSi+gDRsY4DBYe1RLMdB9HQfhdCJDfo+RQ
	pypjsg+JYwA7dTofKuObIGC3GsclPgFkKWJPg49FpFb3gFJ5mcl0xO5+9eHklmbutO64tZDvNCS
	4M+mLBnRPmCjHqGmLB2gEm3uTjkSJucSTiLmOM3O0vsIaWIUeHVcQG2yjo2qlZAqGCe7lMPo7yY
	EzmmvAWc+WC5yfhLLmKCcVDvDBIuROwfae8o5/yhgkumCD23u7XpbMOdP+BF9RFrY9FlZjeRr1I
	82oaBDz/KACSuW8v75lBwrlPE5HVT5FvT4RjHotTSWB
X-Received: by 2002:a05:620a:294b:b0:934:9524:2e89 with SMTP id af79cd13be357-93960dd6f3amr562266385a.13.1788360767786;
        Wed, 02 Sep 2026 07:52:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f35fb95sm220613785a.23.2026.09.02.07.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:52:47 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:52:45 -0400
From: Gregory Price <gourry@gourry.net>
To: Rakie Kim <rakie.kim@sk.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, urezki@gmail.com, chenwandun@huawei.com, linux-mm@kvack.org, 
	kernel_team@skhynix.com
Subject: Re: [PATCH 2/2] mm/mempolicy: stop copying the nodemask in the
 interleave paths
Message-ID: <apgzMZQPTxS9QtDy@gourry-fedora-PF4VCD3F>
References: <20260829015943.1258774-3-gourry@gourry.net>
 <20260902090047.1944-1-rakie.kim@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902090047.1944-1-rakie.kim@sk.com>

On Wed, Sep 02, 2026 at 06:00:44PM +0900, Rakie Kim wrote:
> 
> > @@ -2712,9 +2713,13 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
> >  	table = state ? state->iw_table : NULL;
> >
> >  	/* calculate total, detect system default usage */
> > -	for_each_node_mask(node, nodes)
> > +	for_each_node_mask(node, pol->nodes)
> >  		weight_total += table ? table[node] : 1;
> 
> I have a minor comment on this part. After this change, everything
> else reads pol->nodes fresh at the point of use - the weight sum
> and the walk both look at the current mask. Only nnodes is still
> the count from this earlier read. If the mask changes in between,
> the loop bound no longer matches the mask the loop is actually
> walking, so the walk can stop short of the pages the weight total
> planned for. Would it be better to count the nodes in the loop
> that sums the weights, the way weighted_interleave_nid() does it
> in this patch?
>

I don't think this actually fixes anything?

But basically the proposal is to widen the SRCU() window further to
include the cpuset cookie entirely.

e.g.

SRCU() {
	cpuset_cookie() {
		for_each_node_mask(node, pol->nodes)
			weight_total += ...
			nnodes++;
	}

	/* ... snip - single node quick-exit ... */

        /* ... actual multi-node bulk allocation ... */
	for_each_node_mask(node, pol->nodes) {
		nr_allocated = __alloc_pages_bulk(gfp, node, ...);

		/*
                 * At this point, due to a torn read from pol->nodes
		 * we can visit a node that wasn't present previously
		 * or we can skip a node that was present previously.
		 *
		 * In either case, weight_total is the wrong value for
		 * the set of nodes being walked anyway - we are going
		 * to skew in the distribution no matter what.
		 */
	}
}

I'm not sure widening the SRCU window is worth it here, it doesn't
actually buy us anything.

Also we'd be calculating the weight total every time even when there's a
scenario where we quick-exit because the entire allocation fits in the
first node in the mask.

> 	nnodes = 0;
> 	for_each_node_mask(node, pol->nodes) {
> 		weight_total += table ? table[node] : 1;
> 		nnodes++;
> 	}
> 
> [...snip...]
> 
> Thanks again for your time.
> 
> Rakie Kim
