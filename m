Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990784;
	b=OHu/imsYRJJBIRIUx10ulORxBrOYlJ9dRLB5UTj/SDN3Adz9zWYvJuFxp5plz4JvHotM
	 CjyJALjlF+hjPMyohX/aQnn+ElcGM2ZdlSPJ30Hsw7MeGWsTp/jo6uVs3iVE/EF0OKMTw
	 NhZBoBz2nDlphNbO2s/4jIOXZhuI69ivboVLOsJlxZ49HUPv3/NZo3/m50UWxcRemj2Zd
	 CMeylLm3KsTWA/r70iicfUM6T5GQkAtX0TWdGb0run2yF4JkDv14EMpRQ8zQ6QfUDvEcv
	 dF+TT+jua709+D7rHw6arcxbpLbAVnpyeU43/GQ0hy7isz4366ERJ2okq1B1Bfhul5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mdb5UfcjVPqmmz40z4OyyqW7IHEgbzuUGCcwras+GW8=;
	b=f2v4NEyYyPs2zvYJMpR8rP0hKbFFhsYy667sIIw4DUk4TRwpstc73OHbIbD50dGLwn7Z
	 C3BO+hEab6lTtXCJiqt1E8s3vfimcR/rLDbZ9abMPZ7VerTOamLxv4bJXU6yckVALA39u
	 Z+CrFJtZyYZG/3GJ6DUzZYvzGFozvZp9AUQfhalLVOGBPgH0yoRRvejmTnUMetpNT70kC
	 ZotjKowfy5XnUqSyQ0cWv+EbqRJlC0SB0gkm4l2fczEDmZ4Kygg/KqRL3VwCBIiMOePTl
	 NW4qxFGoE1HZlTfLw9AgPeBQSnD9EzI+mUCuYbvk4UsR80itpPdM1VhBmlKGweL5VNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xigg6Bad;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90DE606A33F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90DE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xigg6Bad
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso704816e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990782; x=1794595582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdb5UfcjVPqmmz40z4OyyqW7IHEgbzuUGCcwras+GW8=;
        b=Xigg6Bad8vROktjBLChSFTJxmcKHG1CvUIakZ3vsIaEefu44U3Bt8v/md9COyzvgy1
         XTgvSARD4JdJeR+rQSPUqOcAc27UTRpLj260564XNAwIlLen4CXP0/Ht+ee+wfYQztlb
         9jpDSOp5AurBUH0yhsghScu5an4AJi0eJFKgHx4MKXNFkKy1D0gnrzgQhm2B17C9Oc9I
         vbduQFpvwghiv7g7znqOGc7FaQLMfBzBiM7rjZU2GQu8RWP8AfhQNN0sYVInvUMU8aX8
         2cqgkZCXkFxNoek1WqERuz1cZS7HOG+Kk6uJP9STl4l6bKFDt6Y0GGmWMa1e6feOQ7qb
         F+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990782; x=1794595582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdb5UfcjVPqmmz40z4OyyqW7IHEgbzuUGCcwras+GW8=;
        b=BnZlvYNjKn9cmhB7jy/3dDc3mTqQxeC+h8TFMXMA7DzkVOKf43vHYFIAFVud/wRffi
         o92/A+cKcngXFp5T1XEIacmg5EuuWr5jYsSelI0oyYj95X6fhy29hISZqv5kp340tWxz
         ALyMS5UNDvxJy4OxQ8oA6S/3js3dyI6tIkXuuBR+ACoCeBy8wZvev+WG7+NNuwWwu4Ti
         +MZHdQxitV2xHIqBIQVCqwaksoiMUchib/KD3AocvdLDtQVabVM8/PEJYm4enjgVOYCb
         yMgC80MlzJqc0PyIgyP4ScI0lj91iEf3gca+BmViR0jWwoT7Tn6bB2FC0uZrFL9Xbl1y
         PAZA==
X-Forwarded-Encrypted: i=1; AL+hErFzDYzTMTygpgIGf8ax47OzKgabHpuBEXRiQkr1gUZmG2C/WT0LctHJnJrIYqcjTcWC/oaoFCundhT5wUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U89uyrb+QMUG5Pt3dgq8nWwEOkffx08ny7LVBEambjW7bItuY
	uLMIIOZkfDKUylJZQ/5+31F50inoFb89DqhrUUo0ioeMF6SKkBvNB/xK
X-Gm-Gg: AYBFou3MmZQw8o6Jxnu2wOttQeHzRZKnjD2eTSJUzSDQgABWkaQP6zV41KyAQSqvD+u
	03iSLMU49MrHBAUk7QYpUASntaOnJ2Z8VFOpa0f3nBoSc1S1MBFvf1gawUy55OjYFNC5seuuS45
	i3D552zmK8IQL/oQR8HyxNuumfL4jFmI2cLn33BsfmjsEgUjN2CBeSn0aD4Im/Gv01dkWHm4YIb
	Sz65JaGI2O4i07OvqOd4uY3ugv+GrKdi/FDotNZ1BqGWioOf36ZLFqfJgh0jg9KmDtvDAPpHEwB
	UaIYTdKN/kXl00CmKFoPXCJ1n8u23F6RpWNmLcGhKT1++hvmbg9ZdDfEpZmqnL3Tzytltcr4N14
	dJAEXaLy9Z24eeIH1FNuFOnxexdUSZVLDRbMa0B3ZIPZBYtU2Fe06PWswQtzxDWKGWSoJ1h19jZ
	TqDR0+oVJU9RnnW3OWYF/gTeYzdFq5lgLRYFUYO0GQwYFNFYZ07maUd0toXt0QYM0EkjHdsrbPu
	lWLVWDy0Flm1zJ+BoJgWbE9YCGdpQ1M+9XTNO43ZzjuXTW8WWyyywnKkE+88hdFewQpKtcf35vb
	DfHCgjEeTum4JcDNmn6c4yuPBMs6pDJ6
X-Received: by 2002:a05:6512:10c2:b0:5bf:f5a3:9a1d with SMTP id 2adb3069b0e04-5c0037aafbamr1088628e87.7.1793990781675;
        Fri, 06 Nov 2026 10:46:21 -0800 (PST)
Received: from localhost ([192.165.153.208])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c002ed4934sm466318e87.7.2026.11.06.10.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:46:21 -0800 (PST)
Date: Fri, 6 Nov 2026 19:46:20 +0100
From: Fredrik Noring <fredrik.noring@gmail.com>
To: Amit Patole <amit.patole@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] lib/genalloc: don't dereference a NULL pool in
 gen_pool_dma_[z]alloc()
Message-ID: <au4gfAfX_p4D4L75@aerith>
References: <20261106-kunit-genalloc-v1-0-ba1ea397dfd8@gmail.com>
 <20261106-kunit-genalloc-v1-1-ba1ea397dfd8@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-kunit-genalloc-v1-1-ba1ea397dfd8@gmail.com>

Hi Amit,

On Fri, Nov 06, 2026 at 09:02:32AM -0500, Amit Patole wrote:
> gen_pool_dma_alloc() returned NULL for a NULL pool since it was added.
> Commit cf394fc5f715 ("lib/genalloc.c: Add algorithm, align and zeroed
> family of DMA allocators") moved that check into
> gen_pool_dma_alloc_algo(), but gen_pool_dma_alloc() now reads
> pool->algo and pool->data before calling it, so a NULL pool is
> dereferenced instead. gen_pool_dma_zalloc(), added by the same commit,
> has the same problem. The _algo() and _align() variants still return
> NULL.
> 
> All in-tree callers check the pool before calling, so this is not
> known to be reachable today, but the four entry points disagree and
> the original behaviour is easy to restore. Check for a NULL pool before
> dereferencing it.

If this change is accepted, may I suggest that the corresponding
documentation

	@pool: pool to allocate from

is updated to (something like)

	@pool: pool to allocate from, or %NULL

as well? There seem to be 8 instances, but some of the others currently
don't accept %NULL, for example gen_pool_virt_to_phys(), which I suppose
could be made to return -1 in that case?

And then there's gen_pool_destroy(), which currently doesn't accept
%NULL either. Error paths can often be simplified if free/destroy/release/etc.
accept %NULL.

I'm not up-to-date with the latest NULL handling policy in the kernel,
but I think some inconsistencies can be found still. :-)

Fredrik
