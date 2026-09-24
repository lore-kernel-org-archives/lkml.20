Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3387D380FD5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258830; cv=none; b=HyuzR0nit+fdM2Koggg8evFHQshgslYnn4jd6YKSHQulVNmewqINv7WphIzvI/mXgIno+bwKLcR5T1YnM8rgdss0q5gYJ60tCXn5ZEcleaWnMPt1sYmxDBGSG8wi0XzLyTc5TpsDs9eyvUVUo291bkESDBIwBNv+7eee/AZva0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258830; c=relaxed/simple;
	bh=8tYi0WAgjaIJKipC9deR0xFZyoQuyzFMvHZ4foYg+RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc+HxoTXsaJMcHKuzqLJDfNBlm3/4DAp3DzylLbULuPrE30Ukynfp/8EXc010/Wi5yJmoAOgiRgl7hmQAluBFywKkZI/3KOT1URlNIh4BsbkgwK9pXBB2/rRdH62WjnVe/GmDsOQ9r2pnQB/atyBlTLCvMKJJFVhbDymUrAXy9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=dcimGur3; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="dcimGur3"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so22521521cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790258828; x=1790863628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ztBx4OPk6JOhZIQ7ImRBBL50CNHJh8elF9MxANZMVE=;
        b=dcimGur3kPV9EKM93rmL3TDcB5EE3EPswfpDMtbdZfH/MJnWsv7KWDImHpNRV1IF1C
         MTO5Cxdmxz8kw0VfY35H23Ca6QrzCWq/g5iBRE1DpOgIiRoFlONvQqppJcc+WCuNZcJZ
         ZtER8+1tUg+FY3Hbb0SfX59ElhBp1WRBguMmZYx5oDM83S8iuDGSJAwyao4VuoVjdEXC
         l06IZQyua43U5iABwOmcOnIHHG/v2RFll0PSgaKT+0hYQ3TWJWkfyCFtnwQjliSDo7zd
         OgY7LmaJ48q+Hj5Z22OGyVRCVNI7Z7zdxKJjObVfd/4NnasrJ7CLKuAhuKr9ZP6zIBnt
         Flhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258828; x=1790863628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ztBx4OPk6JOhZIQ7ImRBBL50CNHJh8elF9MxANZMVE=;
        b=G8nCD76n7gSUwNxLD3YCyRREXhoKtqPh/uFg0VInslWnIji5QP8wRS9Uoz6ivoAzs6
         nDSlrSFXJ4jnqOS23wOiwlxMlU73odGoZW/hXxiPCK/RLAQhPmEOLrpO4I+OsNvqUcNs
         703xT05xG93iY/ix7zJEYmRAi1XSQ5MYRYYgFNY1Xi6bKR+KPyED1GttDzG3PU+7h2q0
         vYQoYQYosQcR2udL+j1xIU6C+xMIT+4z4h7Ubo0bVkVF3SnwBC3327B3fsCpgJ5mAhfZ
         YnkzN83nSF5oWgnYHpL87VNZkxjfZEPss9fXzTk93+8cauU0fDvKr/BpW1M+Hevulo3U
         8LbA==
X-Forwarded-Encrypted: i=1; AKwUvBxvv68CIv0kJwQq+8Jc4jd74Mj3vuuBPF14qIWwrcSKAQvxLb33VgDo6qvYpvFErZKAt1DvlTyuz+UxMsc=@vger.kernel.org
X-Gm-Message-State: AFuF++mCi06nzsiCiYMOo6yNAE0Y0PvXmvreGt6C3NoJbt+FTeilygOu
	g3jBiX7Zl1w4w0iH8Q52BssEIpGKXa+5sz3Qk3BWda66k7oLQUGJf6EUKKu602M4aWA=
X-Gm-Gg: AYBFou2RlxX46TzAL4kJXItRii8gmsekCG2pSLUT7dihGJwtz/aR7oac+T387FHOZ2y
	pTkGAYl4UFL68y57LNxXHjJ94Y00hroRIfdQqxp6zyF6N8c7hLTVojY3GQmrsbd5e2cFELjfcoH
	dw9uDxr2cwrnSC6dz8PSFxpxE3yYk/Xf+bL67b0FUMyM4w+qZ5XST1psDksSj/YsE06WLYXH18e
	8X5XK+2waAH9577rXbvhaG3K4pXkc+zFSDWd+DyJ+iBw5jYNP3FONgTo3ZMJnuunV4/DGzdI9ql
	X2lgf3F0j/UJ6KXyFD2jVT84sROm98oM2aHO8DgGNKP5apDTrZsR8a85FYlvQ2qISvz5T4T+/Op
	kvOR3k3da/rgbXQ54j/B8BC1QP5WdCXNiAlZ6LpWtD6KV0d9qzq729M53O8oPCY/Fy871bK/djo
	ZULER0DR1Lp8dg916BYhwNCobrIMXx5aMx8fREUdIbQ+47+Uq42O/FV8rmgcUhuj4a7V9GwGaVj
	gUKtM4iWsDe2ytRymml8pwZLFV9DnbvBCSdSgUDiQndqWAUWBQ6sBc=
X-Received: by 2002:a05:622a:1f8f:b0:532:bda6:a48b with SMTP id d75a77b69052e-532fea0a65cmr25291591cf.12.1790258828027;
        Thu, 24 Sep 2026 07:07:08 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eaec185esm43147051cf.3.2026.09.24.07.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:07:07 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:07:05 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, 
	hannes@cmpxchg.org, shy828301@gmail.com, raghavendra.kt@amd.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 2/7] mm: allow shared folios to be promoted to a fast
 tier
Message-ID: <arUtcPIw_FaUSPv4@gourry-fedora-PF4VCD3F>
References: <20260922182928.2199090-1-gourry@gourry.net>
 <20260922182928.2199090-3-gourry@gourry.net>
 <f0cd5c54-deca-42e7-bc85-1838dfa917f3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0cd5c54-deca-42e7-bc85-1838dfa917f3@kernel.org>

On Thu, Sep 24, 2026 at 01:59:15PM +0200, David Hildenbrand (Arm) wrote:
> I wonder if a better name would just make the comment above (about memory
> tiering) implicit and make more sense of the sysctl_numa_balancing_mode &
> NUMA_BALANCING_MEMORY_TIERING) check.
> 
> 	folio_promotable()
> 
> 	folio_is_promotable()
> 
> 	folio_numa_promotable()
>
> etc.
> 
> because that seems to be what we really test with both things combined.
>

maybe:  folio_numab_promotable() ?

> > -		if ((vma->vm_flags & VM_EXEC) && folio_maybe_mapped_shared(folio))
> > +		if ((vma->vm_flags & VM_EXEC) &&
> > +		    folio_maybe_mapped_shared(folio) &&
> > +		    (!folio_in_lowtier(folio) || !node_is_toptier(node)))
> >  			return -EACCES;
> >  
> >  		/*
> 
> Sashiko has some comment about anonymous shared COW folios. I think it has a
> point, but didn't look too closely.
>

its tl;dr:

`skipping this check means those folios could end up freely migrating east-west
 between slow tiers`

Which cannot happen (we only migrate to top tier, numab will never
migrate *to* a slow tier).

basically false-positive

~Gregory
