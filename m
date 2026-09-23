Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FA853D9F2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174663; cv=none; b=SXH8ndCmT7dfeVg8nva4b/LqgW0kny76DAxscgFElQFjh6YLwQcj11kPdlVywHNNmHdKty9vJBSdWZ92eD+2A6bD1DoMGo3gmbTMNgnFRmeNnOA93NWvQo76Fl19qaUDbtDCyiVNt52mNIqVsZQPRWyy4M+pygQEEF9HUdQQcU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174663; c=relaxed/simple;
	bh=j03Liecp+aphFEidddPTQRqnkjH1q+gzEpbLO3AiDjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2s3oY5XnmyAW44JBBSjQ5ySFQWeihUTuEuwjiRzxt3qbMxk9/hggnmnbL2Zo4EzkccG8e1LWf94cTDBAeB4vi3JzdXfmKlhhqlpKTE5vaYb5rNYkA9n2fqNuq1R4KDSmPTqVWPufpCDeDWnLv1BGIL8uhpDNdKSxwjo4So9TP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Xa7B0gM1; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Xa7B0gM1"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5306abbdccbso9061081cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790174660; x=1790779460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ida2noRUeQ9O57M8GX64707eMt/ciX4GKxu6FkxXbAo=;
        b=Xa7B0gM1lXBF28BTHA1je4Ix0MqQvvU3A+OPhs8KsJ7JQGZEBu1nY/BsTvJO9NQYBT
         iNnHPGimCfW7RzRK/0mN4nzIkFxZGXFo3j2/UyLn2ZOD11UK41bfG/WL1Pis7zxQ0L2R
         vJ7cKjbFkI5/sShFH9RPWM4N91p3lJ7oIBrFbT/AusK2dLs95kQT4zUYhj0PK55KIWfs
         lJzRmgZHIlMHNC1QkdVmFI7d9Z4YM4IQMGnW4gcgL2P7AhvNvMPERdsKvYpiArDEqMAf
         jHQvbPkHwN3l+yBF7QMA1WNzKGNvbRvktlvAIby33UyXvWtAXWTCQblQ0N2jk5GjPRB8
         3diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174660; x=1790779460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ida2noRUeQ9O57M8GX64707eMt/ciX4GKxu6FkxXbAo=;
        b=SrEgWqnEkoNQYMwoUrANyVGqZ/2uKZOpVMrmZ8xliQYybp/0QZECl+fq3o/97/Wayw
         +U4uRRopbBws4JVv/RwJTarmATRJ6dUys0E1fhUEKGODo7ywQMaMuJkUl9qDhhO2yrKa
         1BQglRBZONXOeBM70DMWZJgu0yQNgcXwuCDVO9BUOF+cFj23wOkAmcb8WV7u1dQFCn31
         CegNoKElp948uPOvgvpuCaq5Lpuhfv3vkYIOvMqoe2ahOz4YQeFH9+aesTWYvJtPGnEf
         O8uA3bFqFYrDXnWIcFaj53K2HKA4nONdQTpaDKXLe1p/nIKquE1F4jF+IosOaZRhqzFb
         6eFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmCn0aA5EF+e5/agO2eXqQeiclc3P3nUN232pv35ZNfLflP3MtSNLOMWMJlrVcXsibM4s4VzZOUxbKTsA=@vger.kernel.org
X-Gm-Message-State: AFuF++lz/wAVJWmiJ2YGXESRig2/4P3cJJgyQTPdFBOKhmdMf76Ile3g
	NFz63puVLZ3NW+6dGxrlvXo0zAXielcAfTmhfZArlXpr5pG/NObApxSiNMVpLU3CqoY=
X-Gm-Gg: AYBFou2aUHUzvnfjzokJ9XwZ3sHd8aSYRQAli6h5aWnwvc4wceV9VJPKr2huGFLnkbL
	SRmkNWVtkGk8Ny321oaufvIy9wadsvSgOBjdYswbOJaMCPlXsd1S58yTPYnLLLqpI3c+pLm1YGT
	k2CqOPKnvSJDRKBSRErylOQOR5ElYb1xSzbh+Ovs8gwVxOFVWQntOsNxNPfI8arnLlO5jkmxjxh
	LibPHBPSVAAr1MxxaIL0yOwfhwyyhRXnjKVQSkfkbaa15h6beHim1yLhs5IUs+ZRMyqSeyvLzcn
	/eBe41IyDbEBUKqtX1CQWNTKPAAFEQKh/1dtFHNNvu+iImMLxoOv9cHYXqk14ELYExqQZKQwy4V
	ybrCbKdmYFbLRBViSx/Se7X1zP2kZIocce4GE74hZxJLt1awLF6WnZ2iZp+8pFRkfaYupf+dJpX
	UZsQhcS27xK6uy2WLT9T3tM+EfF6TrRGQ7doYdjBcwXa/qJSsxe1JsYqmKxEf2pCqfcahNzrtLd
	IRVqzeMEycL2ZXD/JUSxWMioDLLio/WUlxJC0BuSs/DY14sF3jCqLh2
X-Received: by 2002:a05:622a:86:b0:531:2eb:be76 with SMTP id d75a77b69052e-532db85279cmr96539711cf.22.1790174660094;
        Wed, 23 Sep 2026 07:44:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eaec185esm21362971cf.3.2026.09.23.07.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:44:19 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:44:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, david@kernel.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 01/10] selftests/mm: exercise MADV_COLD and MADV_PAGEOUT
Message-ID: <arPjwPwVxdvdR5S0@gourry-fedora-PF4VCD3F>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-2-gourry@gourry.net>
 <arPgwegm8XgbEUrO@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arPgwegm8XgbEUrO@gremlin>

On Wed, Sep 23, 2026 at 03:26:05PM +0100, Lorenzo Stoakes (ARM) wrote:
> 
> I think in general we want to avoid putting stress tests as part of the
> selftests in general? Or at least if they might take a long time to run or
> excessive memory usage, etc.
> 
> Though that might be benchmarks, as we have the THP stress tests so maybe it's
> OK?
> 
> >
> > Assisted-by: LLM
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> 
> In any case I really do think this should be split out into smaller parts, this
> is a _gigantic_ change :)
>

Absolutely, but alas my poor email hosting throttles me if i send too
many emails - and sending a 38-part series where the important part is
the endpoint of the refactor moreso than the individual tests...
instant 24-hour timeout.

I'm working on a solution.  Need better hosting.

> Since you list a whole bunch of different test areas and you're exercising
> different things you should be able to split this out logically across those I
> think?

As mentioned, this was originally ~28 patches split out, but i think
ultimately only the contractual tests should be shipped.

Maybe there's an argument for keeping some of the implementation
details - they're fairly easy to find in the code below for individual
inspection.

Examples

contractual: These tests won't change behavior based on implementation
 - authorized file PAGEOUT evicts a clean file page;
 - unauthorized shared-file PAGEOUT leaves the page resident; and
 - private-file PAGEOUT reclaims a COW page but preserves a file page.

implementation detail: behavior can change without breaking a contract
 - full and partial MADV_COLD on a PTE-mapped THP

~Gregory
