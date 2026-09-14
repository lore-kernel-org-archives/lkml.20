Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C70483BD6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398245; cv=none; b=Jt9HE+mKjLB5FGmofMYQDZnTL9u8e8GSeGI1DvzrzOvwUAfyw0+DBBvZDPP4E0b5/Pv0DwdvpzGHSpzaY6mJ7cjcNFNSRAtTwox+tGlQlJCGx8bsxTFvF/Jbf1zliiI4Qv/Nr7+M7Vwnki3+54DZkq0aSxDSrC3rUZ0c4wUZFCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398245; c=relaxed/simple;
	bh=T+y247Z6VdMOgEdIe4RSPSMITZljiLQPhmjGPNPbxlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lkasq3TvfozLpX61rkZHXjDZP3YyalJh6a4/HdxJW6oIizUU1Vz2U+noPn0am4FFq8mugR5bzs8xewvPyWkjMSVmx1M3QNnN8040BQ1me7UQKqvdQFp9577nsjUOE28GmpRiGq0hobL1xbvvT6kso5/C/LSCMAI0xHCItwAj9E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KhZ2vOY4; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KhZ2vOY4"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e2f50d01so27305031cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789398243; x=1790003043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IVNFzTfzSOo1njfHbCOBLAlgi9bYJJLyVSrWJc5ZZbI=;
        b=KhZ2vOY4QFQIizEIjEDdGOJKPLsvVck6WOsHUUcGhvqZOK2I4jFq/fYAYhlmWNp0Lb
         ppzpN6tidRd0bz5js/sI2j5yQbjpypR6gQyfb4BfjZUaqOiKhw2UsNQVoCuQa71X9G75
         8yLQ/hGetDAAyp6TN3KR2oq9doMGv0JPzStRoS9C0ftevvFiCh3DQZmcMJHyvgmfYlcj
         ouUetj+j1xdurs6TmSW/dxTYS6s1jgv9UlsJYp1Pk/0rrpFWDRkfUSICL02uxO7DJxvk
         v7suini6x9dA2FzzkXbt5IEO01FPs3dLTyB9sr8dRwap9fuYSLZM92jriu7sgG+Nbd6m
         8IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398243; x=1790003043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVNFzTfzSOo1njfHbCOBLAlgi9bYJJLyVSrWJc5ZZbI=;
        b=q44SXneSNGzRREZIeJ7YNBkzT3FPmvf+/Hr2PsPghig6LMEQvhYEWrviFCAGC+M8rO
         Z0IGU4z+p2XLdzVyt6UH0O9aHTeCI1pAELnA1mM+TxtHdA2e1vdYzmOhnVpDzNEwLpV3
         DNiL3GxBstsWn9JJAQsLtm6xn5wFq7/t2IQqasT1OIdak7HM66JceJcEiclGv/jDAf9U
         u8N5NTAZZkw2NdlEFVK96c0SHTWWAyZQPBVovjaqZssgkbFqyxBIpglwXDkPxOUKd/+T
         1PycEfNhF4AtmqAKSNxC9rMb9UEUwUgo3gGPdUB5A8KL2cnRB2ZKxfaEG1i1jpAKj5FS
         LqMg==
X-Forwarded-Encrypted: i=1; AKwUvBzG0PeS/ZsF+a07/QQ6kKL5NovbaVvNzIys0b/fWfMidziDCZWdhqez2HIRGgMrVwxtqZptVlpkvCmFVb8=@vger.kernel.org
X-Gm-Message-State: AFuF++muMYxeqr6yd8zglxPQWtzzc0c9tYjtFBK8J2aMts5fg96Q8SMa
	6G2ZfGw6WxtQKfktMd7rjgnyN9JOgOOW94qC3Tt+pVnXN61J9Vg2oFFaB/DRXgPm8Vo=
X-Gm-Gg: AYBFou3UKhKpzvpMtw+hLYPywJ8OBm3A804NN43weMDDTP/2trluiUOxlW2OFRwfXiX
	lVO3BLsip76BVjhKe5GKDzsDoJz1Q5/9vJoTpG8z/8KuraLEJclHxQAQiY3A5LrVxYy/JloKM+t
	B6/TwN0uA++G5oF8NsdO2ZHlUHg4wCnKFXfqdo0Hf83GKDmjEB7G7pmEh287p1ZAxnROnDMamVS
	c0ZuBuvcaPon+uurMFtj01eTvLcTnwJknXdU2ybtlHXIXLzaOdW5OmL3LW+WgySIUBAtwptwElF
	ihYMXExXW9xmm7dPoOgg69K8J4SnHS0QbAffPhDnZiJNuICx8cWhPN7s0NaduaoiJfISuxfcF4t
	NT+HNVgx1rNox8nCXPK/sWt80lQBjTvzTxFlQTBu1vHoiibwu3GclRkJjpDYAohYH4z0E5lFGdT
	46rjqLPC5XPOWa4pRL1r8YB0V3djoBiujSgTAWwuYqUGQ/BGY5Z+D8/8GpYbZtbm7KPgG2DbmTv
	Vx/zNLwbsi1eL+hjQMNHWvl9VnGy8/De38oGvgM2yXK4wr353o1WAbEZ9RaeAcYpw==
X-Received: by 2002:ac8:570d:0:b0:530:db17:b1b1 with SMTP id d75a77b69052e-5310cf168e7mr41979091cf.8.1789398242896;
        Mon, 14 Sep 2026 08:04:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4b9c54sm99561571cf.20.2026.09.14.08.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:04:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 11:04:00 -0400
From: Gregory Price <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, 
	hannes@cmpxchg.org, ziy@nvidia.com
Subject: Re: [PATCH v2 2/2] mm/page_alloc: refactor build_node_zonelist() out
 of build_zonelists()
Message-ID: <aqgMx64sKalkDaoz@gourry-fedora-PF4VCD3F>
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-3-gourry@gourry.net>
 <7e247c67-ea51-4c2e-b02d-8e5ed31cc5e6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e247c67-ea51-4c2e-b02d-8e5ed31cc5e6@kernel.org>

On Mon, Sep 14, 2026 at 04:56:30PM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/12/26 05:04, Gregory Price wrote:
> > Extract per-node fallback-list construction into build_node_zonelist().
> > Build each selected node directly into the destination zonelist so no
> > intermediate node_order array or node count is needed. Print the fallback
> > order as each node is added.
> > 
> > This lets us build new zonelists from candidate nodemasks instead of just
> > the default N_MEMORY node state list.
> > 
> > No functional change: build_zonelists() builds and prints the same FALLBACK
> > list over N_MEMORY with node_load updates as before.
> > 
> > Signed-off-by: Gregory Price <gourry@gourry.net>
> 
> Nice, glad this way of refactor was feasible.
> 

Yup, came out much cleaner than i expected.

> Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> 

Thank you!
