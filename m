Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A763BC687
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162854; cv=none; b=ILr6jiJfUgS4IrnMuuwcl+7g6I5EYPr4tu2Q/IAqayrbANLNqTs2b1LSWad0RmDL38BDOwHje5Aw9syQjQYG5wWAWBxxxjLljxQdnlAA4pZwif7txhvPrqtC3aWy5LPwlwXW8XCjoM41mdcE5Hkc+THC8yk9vQM6MaHk5YNAQKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162854; c=relaxed/simple;
	bh=X82haFxsdgKx1jjnaKgCGlknhRGQInX8s7YpCkTIPnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trlgTDNZ00mLZ+On5ROMwjbFJCBLKjxPaLanFCjbEruxQ3Z/rRkYwWKaqas/4yysGSqPxsHSUPw+LsNMci1qYvbAaEB96suc+VSRKv2DKdOm4WSCprRuDuBZbIvtN/RkTJEX1n//HHNFRJO9n+yxt455ltV1i0qd1n/fQcezUbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=NhjLXRzh; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NhjLXRzh"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f269e335eso3183885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792162852; x=1792767652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qAdHy+XfZaVWAHH+k3kEYHLQsWiJDDa9Am4rmLNBNPw=;
        b=NhjLXRzhLV4Mw3/IIY7KSa+yogOWqwD77ounn2r61fuSD3eugTgZ5D+v7Y53D1Cc90
         CEJStPx7qou9+2Lt7NYh3/zx8J41AHLOW7Y7eWUrMBNPXY2303fzPQ1/cKSXesHoOhVH
         yI2bz+bR0AjD14lz+xoI7AC9V/e961mTzfQEnK3uQB2ywfQhrYyznf9JzWja5U+d8/jw
         fHGVoz/oC56ejsg4VKDNjcd0//KRcTU+7V/TgNMRnWkTkQTYxnWFjeq7YH1zrum/ru1d
         MGkhtxi25MFzzjwSEt018Ks4vJ7u2vrIKnbj8dTLRmLbc5zQi3vJPmbz/m+g/C7hRU5P
         597A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162852; x=1792767652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAdHy+XfZaVWAHH+k3kEYHLQsWiJDDa9Am4rmLNBNPw=;
        b=lgu+bu7j318Izr7j3CY5+vEbPb3Vq7PlqoAC9ebUAqbDvuXdIrEP1zjLPbEH+9cD37
         Nt59mYXn0dq2q+rxpRx+JA78hJ4e+SexaALmJ26QpNzI+NzZKVN1ztDE7cbH5XTh3tTb
         UVd+6S5YqN7+OIfdHFLcuCJ5NCMVFSpBCptsQhYC/mzW3/+Cn2JCL/V9L9lyd+2O7e8m
         0ndPB19Als4xDulowu8mAvZwpgoOiumR4jTBLvysv2vz11rfX0cWz9MOLNfiQrCWygQj
         As29Dqx9AQ+60WbNCv5vCiaw77XGHAW+ZdAVFaqfMqiEXWXa+PGcPYc1q8Zpxww7mOin
         Jh7w==
X-Forwarded-Encrypted: i=1; AKwUvBzSZ9XolBKL/qPyC+YeQqhzaJyxSHuUf5OioosvWMSJ5ZXZAtl7bWtA9Kp+LD7NgZKCf3+a9UqN2IArpLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUk0VxVQD/+yscmE1kKG+q3TQGeGZo82JN2gMNE12b+dff7ChA
	D3DOxLa5sQx7zWYK0SNjnXSuWjxqkyxBwgthd6t5ika37V3SaGWXHQXb64gkZpkzGHs=
X-Gm-Gg: AYBFou2Dr6JbVu1PjaiuJ3f4IgiUkeuwzFwXJ1dQZjZlG9OFakSeBB0Pdn3//DxhPzf
	k/P57bn3TaGNJslbR0B4I5OddXRmnWHe7nO9ZTFjX6ilz0nCY2Vz7HG0oVoyFCKlA8q3JC5T8aL
	gXFsla1lSfzKX6I7mJ5miUYZzSfztxgVnmeKdAgMSrI4wTWcKk0i6nRqxn38rlMEIKA4MaNGDQW
	+NPmK95dH2Niace/t4SfF2tIdX0RFNVe3Mj4+7nOGm/YGtEBgQY9kPZtamHMCHGN9cyqLqZPIdX
	610xJMzlX+scQz2hPQ6DsiT2yqikROr9gFLX1DeKudOdbQMz4j3HkxywBaK07SiimK0wbYzFVIR
	nepGCBJetHSzenAsbDuR5Qr1qgX/MiGV29Cuw0v559Z8F0sZPMF06H3uIIdryHzzRrh3f+2Kc8X
	fttzFEdCvzUHGYCMCzq9G7bPClBQF0S4CbB8NZKI2zWOwjshhb5OkyagFr8FeEzVlaK5WIpBPqu
	rRKRDu10UMs8ZvR/+/LS9ivchMicVjBn7r03fkxJNANamJiMcfR7R19
X-Received: by 2002:a05:620a:40c3:b0:93e:646c:9133 with SMTP id af79cd13be357-93f29da5d84mr10749685a.64.1792162851675;
        Fri, 16 Oct 2026 08:00:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a0d0718sm232558985a.5.2026.10.16.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:00:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHjQP-00000001teG-31SO;
	Fri, 16 Oct 2026 12:00:49 -0300
Date: Fri, 16 Oct 2026 12:00:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
	aou@eecs.berkeley.edu, atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com, gsh517025@gmail.com,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
	robin.murphy@arm.com, seanjc@google.com, tomasz.jeznach@linux.dev,
	will@kernel.org, wu.fei9@sanechips.com.cn,
	zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH 02/12] iommufd: Add RISC-V IOMMU hwpt and vIOMMU types
Message-ID: <20261016150049.GG14213@ziepe.ca>
References: <20261015235400.GZ14213@ziepe.ca>
 <20261016073020.10119-1-gong.shuai@sanechips.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016073020.10119-1-gong.shuai@sanechips.com.cn>

On Fri, Oct 16, 2026 at 03:30:20PM +0800, Gong Shuai wrote:
> Hi Jason,
> 
> Thank you for your review.
> 
> > > +/**
> > > + * struct iommu_hwpt_riscv - RISC-V IOMMU stage-1 page table data
> > > + *			     (IOMMU_HWPT_DATA_RISCV_S1)
> > > + * @tc: Guest device context translation control
> > > + * @iosatp: Guest device context stage-1 root page table pointer
> > > + */
> > > +struct iommu_hwpt_riscv {
> > > +	__aligned_u64 tc;
> > > +	__aligned_u64 iosatp;
> > > +};
> >
> > Like the others you need a spec reference explaining exactly what
> > these fields are.
> 
> I'll add references to the device-context sections of the RISC-V IOMMU
> specification ("Leaf DDT entry", "Device-context fields", "Translation
> control (tc)", and "First-Stage context (fsc)"), and I'll also include
> detailed field information, as ARM does.
> 
> Also, I'll rename the field from iosatp to fsc. It holds iosatp when
> PDTV=0 and process-directory-table pointer (pdtp) when PDTV=1, and the
> two share the same layout, so the name should cover both interpretations
> and the uAPI won't need to change when Process-Directory-Table (PDT)
> support is added.

You might be better off just to have a data[] array of the device
context. I prefer the fields are not parsed out in userspace..

Future specs may add more guest controlled bits and in other places?

Jason
