Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F36B3AEF54
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576049; cv=none; b=Y7KVvbx7VrK3+knU75z9TfDMvuoqypCsWCDTGt6MCa8uhIFjIlBw3SwRcwtvj7rKDLYYtc1K1OSZj9Y/Yu9ABhDrwaIkqIqFWiqcM3+vVaXZPdhICaoOqvn79O0AlIOrz2lo5itM+gAE6o+n7/tTkBqhCPGFDsU4+znLUzoDU9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576049; c=relaxed/simple;
	bh=R7MRGcwi8KYo8oF2nSjBYVazbxxdpwpQQ5Jam6NUkS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBdBAB362PSViNS0yIFjCGm4cM/4JBtSJc8CTbaFP7nPN/yxrK0f7hKo4BXjSqSWDtypW2SO5m4XHKK3d3GFz45GtyuEaqJ2mV/AEYPRbmRcgNkipgPzwo2TODySw1c9nl1OpW5Np6ioGRnvqzg1RdDhxKzU/WQpFD/j0VP4uqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qr2KQ6vq; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qr2KQ6vq"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb767cc97so10195471cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789576036; x=1790180836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iod3dGEx4O5QNllF/Jv59fKBS+1dGXD0we4CmqbHy1M=;
        b=qr2KQ6vqzKeQB+qU6s4xjAHelY3Y/I8Hi5/Y1EVVdUw/1+w4lKXVWOh2ont6KacyOg
         gsZV+DV72bjRDSo4RkzeZb4Z0RLF+rfVzAv490q7uzB7szla3GzA9Bhq7xolIdEQatGe
         Dtie31bpQyxxzwOLu3o27plPmBuSIQGKQ73JTHjBaUeDr3ZzOPyrLal625axW7A1vtLP
         DXGp0iFcODVw+OcgikMrIaJGYgkd0B1fjK22W14F71rxzZGYKRMYtf/2mkCLxZ801sZK
         ryrv5ELAQprTGhxUotJKabatoX8FLC6ErEkHS1rSFdtg1PPx/TtOUPCtel4ui/l19VUt
         0ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576036; x=1790180836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iod3dGEx4O5QNllF/Jv59fKBS+1dGXD0we4CmqbHy1M=;
        b=Isou7S+g/HrCsjwzHy3R0xMpRUu3H1cQYMGhWnWOGbpHu20S82ul7okj+BTVFpHVar
         yUz79LzxDkvIA4UQXOpzyyFk4ASghqd5yY3/IbN9W8yEhqMt7p47+mAhmBABO2u9pldh
         ftRZv/67pqqLCHp0vru8ruodN2/eQ0w2lL/oAh+1iF7LoI4fF2alb9ckkf3mrtG9fz+B
         BbMS2e5Sf27m5440nGveTHYxTNdhH6zGKhqB6E7eInWwzonzjdnyDjOppfdF5QiaU1Xu
         TFaglF830X0lLhCXbXqYNIcLC7kAnAXyeG7+BwucJ635D/68KgHUMJA1+lsRq0px2Z1n
         5G4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxKL46HiVqj9VN9couGSSfMILQliaoBEM6XsP+galxmGIzbw3OKWqvSsnIpD/Sb8LVl51I5/Mx72BvgHTg=@vger.kernel.org
X-Gm-Message-State: AFuF++mcNbFdxMVN5jbdQvHr7eQYldLA6UvFkF/i5vo3vwxsEwAHrxGB
	rCfnSK6diFj/w99cdmF9nHCSur29Swjp0IEXb8SHhWgsq5vhLuEd/XuUkMbBQ80dDCE=
X-Gm-Gg: AYBFou3JL0+eSTrZXIphxDfF2H+UbiF3F4XEnxy7P1SSN4BPwrW5WorMNd2/l9vDBQ0
	1X+OH875Jq+p0vw9TrJk6GHdvr34MkYaq/+jbAorg95tpP8RHAnOE1IBJBhOgQmeeBxRV2YgCHQ
	4n3TU+OLWyyqi/iYJRNKrF+okDwvNk05e0FXv3GQijIE0sI6guI/nfVsaIrfLpDxG+aqcGzjjz1
	LmzQo6200XUMfNZGFRK1OJmoS3jabYlAG++zlJqicXL9YJSEhgTMjlR9A22WmbzcOVyA9q/kW9c
	X7Pt5dIVcclevxG389SKRPPOUH31UGdyP18XR/IfwiW9ethgQAI9bSAIpHjJ5110DUKJLU4uxGj
	lBV9V8bC8ZAPI9xRvb0Jbg+NXjv7aqwnJ1BORL8wqIo/0tCD+oSvPdbSpqSpDVQwLJF/Uxt8TRS
	+DfLUS8Q7/AanyRQkCdFhIcsyp7dvpjhB/XWNXJGY1mJiDBu7QbGYriJeeAxF5EZPu0rEtqVMdq
	Buovqx7sMYNJcQBJ5cFUh4TR0PN4Npim4c/NK+Hb+Aql3UQZmBBA8COnNjdGp9hFw==
X-Received: by 2002:a05:622a:1e19:b0:530:b2e4:91c3 with SMTP id d75a77b69052e-5327ef19588mr56557701cf.60.1789576036216;
        Wed, 16 Sep 2026 09:27:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53262091423sm25381111cf.23.2026.09.16.09.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:27:15 -0700 (PDT)
Date: Wed, 16 Sep 2026 12:27:13 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, urezki@gmail.com, chenwandun@huawei.com
Subject: Re: [PATCH 2/2] mm/mempolicy: stop copying the nodemask in the
 interleave paths
Message-ID: <aqq_yv-cQvzuxr5D@gourry-fedora-PF4VCD3F>
References: <20260829015943.1258774-1-gourry@gourry.net>
 <20260829015943.1258774-3-gourry@gourry.net>
 <d7f162eb-4214-456c-9d1b-a8623da61b45@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f162eb-4214-456c-9d1b-a8623da61b45@kernel.org>

On Wed, Sep 16, 2026 at 05:57:22PM +0200, David Hildenbrand (Arm) wrote:
> On 8/29/26 03:59, Gregory Price wrote:
> > The interleave node selectors copy pol->nodes onto the stack so the mask
> > cannot change while they walk it.  nodemask_t is 128 bytes at
> > MAX_NUMNODES=1024, and two of the three run per folio fault.
> > 
> > The copy only buys consistency between the node count and the walk.
> > Drop the consistency and just bounds check the walk instead.
> 
> I think you should document here that accessing the node bitnmap is safe (is RCU
> responsible for that? I think yes), but it can get updated concurrently.
> 

Actually, not quite.

RCU stabilizes the weights and makes accessing them safe. RCU doesn't
help us with the node bitmasks themselves (we were using a cpuset cookie
to stabilize them to take a copy - but we're killin that here).

What makes it safe is that we detect the torn read condition (check for
an empty nodemask) and otherwise don't care about weight skews in the
weighted variant.

I think it's reasonable to add a couple comments to spell out.

Are you ok if I just spin an additional commit to tack on rather than
spin a new version just for comments?

> > +	 * The target was calculated in a separate loop, and a concurrent
> > +	 * rebind can change the total number of nodes.  Clamp this loop to
> > +	 * a single pass (nnodes) to keep the walk bounded by node count.
> 
> Might want to explicitly comment here that we are looking at a moving target and
> might race with node bitmap modifications.
> 

ack.

> > -	nnodes = read_once_policy_nodemask(pol, &nodemask);
> > +	nnodes = nodes_weight(pol->nodes);
> >  	if (!nnodes)
> >  		return numa_node_id();
> >  	target = ilx % nnodes;
> > -	nid = first_node(nodemask);
> > -	for (i = 0; i < target; i++)
> > -		nid = next_node(nid, nodemask);
> > +	nid = first_node(pol->nodes);
> 
> Similarly, I wonder whether we should spell out the raciness.
>

ack.

~Gregory
