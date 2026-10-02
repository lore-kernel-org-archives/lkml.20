Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FDB4E0B79
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953733; cv=none; b=PMyJVKp/bzIMea4V4Kecgecl1NmLfkeTWlpntDJvGAoXTSt2qNAs5mdC/uM/nMo2khrJUbAG4Iz/4rjflTgqTcyx0nstMoOJlEaWXFT0mwBE6j6lRS/8npxFaxoW9Dt/A6OSDAy/QPVAp8rDEaKzS/nyCLwdKfXOR97r3vt58nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953733; c=relaxed/simple;
	bh=rN2GiY5/HkyS1I9EgmemypM94IRF9h269bCwt6E9FiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHrxtKcmuseCZq0tLQUeD3iFSmSaZY9rr3R/GCZZKUaDDvLNv3Mv4AMX7wwokrVIP/KoZ4ljz09y4S6nxIAMiv5W4CwsVDPSEwm3WejQjr+ch6ngXH5vBwS+om4OymxoZ8p0s5wmkrQ7z+r3BNZlzmUXOynTfKfXGMxKWViRIqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WkE2HeLI; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WkE2HeLI"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144df39b6cfso6127075c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790953728; x=1791558528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENyCFbokdLWAmAh2KCAVPVZPtiPMjF2AJu3KZcFQdKM=;
        b=WkE2HeLIincPLQDLN/WKqKSNj4vHpO8bELObDtB8fBD0/ofYFY1tdiFTSB34xcPPr3
         YRRfq/q+1q11QAZu2m1mLZy6gs59mLdt1NgOUmGyFmCdpphBQ/3tjNNnEA1uVDiQWZn8
         ktyZvoMhOBuWnDKpVh3B9n10WN/bXhwy24O3dY4hSHj60JV+NZQi4U6KOr5Yx2Glj4o2
         qPtIn3djP1tHheOC2WzdcVa1U85QzxwNYh5AZt+xZnJa1+kydQDRnxe9+MXgnApRwUr1
         EwautVWSyJRnETzTgGkDGSqLlDkOUa7oBKxOqurInDloM3pfWO7Rc1vrQ2LYJeH4vkYl
         DABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953728; x=1791558528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENyCFbokdLWAmAh2KCAVPVZPtiPMjF2AJu3KZcFQdKM=;
        b=IEX2uPbzyzQl7V+xQSVKAn+ni2+I64qurYv/KCA9+E73XXC5txL0FuYpJnoecCjWsH
         JAiLVihFFdEwaCeoNRKZEtr+0wydBqGElGekogAZiYp4XrdF6FFyou5oaAXBNGTtkbE1
         jHMHeHGn491rzuP3y4Rxd6U6n7J+2l6QOBICVUFOKE1cEQnPsCg8kaLqMhCysgfQRDAo
         QNRNxN4BLb3RYKoNODwIuPUzrMEQWdNAwoeLarVGg5Ka1KahhVQxCyXvAFDq6c7OH6Aq
         M5QNWQgez2q5h/n3rRLCnarmcFBI1Yi3jDnpB/EvGCHxCTVUuoTLCH/Bv0ZfoWhPd2x1
         Emsg==
X-Forwarded-Encrypted: i=1; AKwUvByFTM4ZKIs/b5mM8mR3eXqPQTuMItma6ewahZ0BzYdeJZwGWqxT7WsM4DyY6Ax9BLmoo2rQAn65JOE1EC4=@vger.kernel.org
X-Gm-Message-State: AFuF++lX9kj7Sa0AE2xCmjCEEZXfBLMf5AFkGQS/XY4KXEn9eJ9GNsH9
	+abqrp24GFwKI5lcGqWYlmi+ugo2DwtDBIr30ECW3/dIrpRDnBtx/VH6aeVt0Qy2WMY=
X-Gm-Gg: AYBFou1+WJnZec5y6c07AysEP6RtsYwoqG4C/NoMErPqvCM0cPGWbAnQe09TWBj1CgU
	m/tNaDOQssCPPKoQ5E0agNjvlPzc8SR3xyJq/YE6EfXvxOA8P1EqqGnFnQnVL0DoR/TpOIBqXWL
	Yg9YpW/Jl0wWoestNr5JUDVSNMaOQofyfMReJ+Mt8V6pyXNx9LiuXd1S2K00PeUI26Gxq08Bwhp
	McffS4miCuRBsccDwe79qj06LVPWQTnsfJ7HCUT3KS/cYBQGtd7eKry9CllUEGSeqHFL/uOtzzg
	nTkkAi3KmaArFH08jwMaUoo3aUF1flOXUUoJgPxSnFMwFHKgQcpwuldVGJ3VdUTlZKlw/HC9cop
	FuToDjsmTMWe2MshY4o1hdVnXhEvQIX0OXHlJJeBa8UzYyR4fORaEEtAEK9mZOK7zFWeTlkW0La
	JkgJAssOvamSnj0c8JdepLzI4M8f2W+8a9/UA3PwSmeZLw
X-Received: by 2002:a05:7022:ed04:b0:14c:d8d9:94fb with SMTP id a92af1059eb24-14f5c3f1c17mr2903275c88.23.1790953726759;
        Fri, 02 Oct 2026 08:08:46 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f468c08absm6704330c88.8.2026.10.02.08.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:08:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xCesO-0000000Gmdt-3ju7;
	Fri, 02 Oct 2026 12:08:44 -0300
Date: Fri, 2 Oct 2026 12:08:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pranjal Shrivastava <praan@google.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Logan Odell <loganodell@google.com>, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] iommupt: Introduce IO page table shrinker
Message-ID: <20261002150844.GC3481470@ziepe.ca>
References: <20261001230219.818128-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001230219.818128-1-praan@google.com>

On Thu, Oct 01, 2026 at 11:02:14PM +0000, Pranjal Shrivastava wrote:
> Introduce a lockless, deferred reclamation framework for IOMMU page tables
> built on the generic_pt library. As VMMs and userspace drivers map and
> unmap large, sparse IOVA regions through VFIO and iommufd, page table
> directories are often left allocated but completely empty. generic_pt
> frees a table when a single unmap covers it entirely, but tables that
> empty through a series of partial unmaps stay allocated until the domain
> is destroyed. Under memory pressure, this *stranded* memory cannot be
> reclaimed and has resulted in OOMs.
> 
> This series refcounts leaf directories natively in struct ioptdesc and
> registers a domain-aware MM shrinker that prunes empty directories under
> system memory pressure.

We had talked about doing it this way

But I had proposed a different, and possibly simpler, solution that
addresses *just* the iommufd use case.

After unmapping something have iommufd compute the gap in IOVA that
contains what was unmapped and then issue a 'clean(gap)' operation to
generic_pt.

This is the same operation as unmap, except we know now that the gap
has no PTEs so all it does is clean up the table pointers.

This requires no special refcounting or anything difficult beyond
some locking in iommufd to hold the gap stable while we clean it.

Would it work for you? It seems substantially simpler, but I never
tried to implement it.

An alternative version is closer to what you have here, somehow
connect iommufd to the shrinker and have it lock and walk the gaps
cleaning them on shrink requests?

iommufd has no trouble walking the gaps in the interval tree, there is
a helper that does that computation.

Jason
