Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0693DB313
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847712; cv=none; b=q+PFgFshOyktllqtWA1fuC9+F6kYn3ehZDxNHNecZZRp/T9LETJ3l1+8y7NSIkGeK8GueZ7+y/7uNABcs0gq4krG6Pc7XaBS0FW7wFuPmNUslrVAENlXB7Id0jPMbc5NcFTdQ5cQAsXOi64q5VdSzPoC2sqh2b/X+ayW7xPdESc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847712; c=relaxed/simple;
	bh=mAh3nAX3kL7MLxSzGqnmDDPsPCYD6Z7jzPbZ8dZAykg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAYSAzkHBAEmf2ixpA6hOnKtFTKTGRKO/XodyS9btYQgkje3l/8Nd4Damq0A9395uRqRElYFCHbi7lHf4Y0I31W8D9syr/EhKpk9vwWCFmG3B7jmLnpE0d4qoSvQoCTVW4L+z1SStXORa/6OJ/lF4vlL6agYErqgEegJX87r4Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=P0UIQBEy; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="P0UIQBEy"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52fa6005224so533271cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787847710; x=1788452510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzfjA7QFnokR+rC2Mkf2GkJZ8x+lNdvBL5B9Dfcy6Vs=;
        b=P0UIQBEyqQwl735kAdiIgS0ERpY9MlkryQ/amVSk4p7bm46u00W4ZTjsQ3NACoEg6H
         cNb88xwVJRqMtdroHbhwyibyBFw1T6JlE8DlE2qwuCeTBBVM+oIlxb1T61qtTG9imyIY
         tty1Blo3kAoUYijW/sdrhSH5rfNs0ucKvhETo5BD6lPybpBvUX3wbMGBUTrFM8T/l4Yq
         ExUaotnICiJoJmKh60K+iVsYBHwg3wc+QS9cG43w5RHDx7agD2tZi2+L36yMhdtG4cCF
         ekr3IMS6qYUDmprT622+AmKuFORPGxRdqv4MRUF/egEmS+awRplkwwRxIXJDvTuwfLjQ
         YImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787847710; x=1788452510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzfjA7QFnokR+rC2Mkf2GkJZ8x+lNdvBL5B9Dfcy6Vs=;
        b=FA70Nq3s91sWhtlLAlefE+AEwBzU26T76+yIEltPYG2Hbf0I4sn3KGiqrHeMBSev/O
         9dkDSnbAJ9pOMj8W/6mna1OWFCGrmJQ5qI1wQJfqlji2OvycYyVYZOs7XKzzxLjysFiE
         pndalQn8nhDCNgB+qyvWrROscN4e3Lv2hnTa5NglMOAkpaTzbftCfLPP1glP+wcHGR9b
         jdkmdU4OF7nNKlVvHfr2mByagIQ0YV2cK6mg71rhyB71gVNx/Xd8BvMZI6nSejoSv7sK
         z0okmQB6s8Qs92GpbkT04pmCi5w0YmkBQnpcuxcQNnbOMUpJrXj9ITm0rEPOfCaziSWQ
         Ij+w==
X-Forwarded-Encrypted: i=1; AHgh+Rp1HvkxT7DduI+RhUaSToq6IJ2LJTm1CmzB7ITgPJhwWKCWYDVf8mqH0iLpv6BTOhyH2dHJyn1bLJivqbI=@vger.kernel.org
X-Gm-Message-State: AFuF++kBFXVwKneF24v5si952v5WOV72i6p9kK7rQ2k20ataDnS0czzH
	PpzbXtAhOPbeOnRyDWNu9cfmdqSfXF36Nco+eBJXoRjHRxrPUQyTY0IHAgl1agUf2qY=
X-Gm-Gg: AR+sD10MNOCW7YcoiLVM05O/VXqY7BvpKH8zxPwk5uGjJrDrWaTXdsFaWElU6BZt/Hq
	xFL7lTF3UoIzu/G/E4Xd/jB3btjy0AfEYJRBqDmAWqAHuqR5X4TNz+5RV0Ogw3K9AGCvC9WgEy8
	B7DIZVzAC/lU6Alct9Zl/EmX8Gjj5m+As5P7nU0eBEb+T67H0s7a4ZMUSrocRkGciZDiE2EdFbb
	mVLRMDgHiJ3zT4ALo+F8odCiyh9Hol2TqAQAi+3D5t3ZxIbHW3sI5QMfBuezFsNxDddcQuJEB9n
	6QN7IaxL4Up8ijXY89TxDsKcPPtey+N/TwtoC9Yd8cMlROxifCN4zP27kkhZJXF6JrdVr+i7Ukj
	NLHN9gx5itSY4UdKUufS808aouSO/6PufI+WiANHrZWscmCqt2rKXwBtBJ88K59w/3+C+cSDoOW
	jBuRWTad6sX4VM2m/mhpMtFTkWLdzsn8FHb8cVE1iJ+NKsA13XVR96pKUmzryq2TYTge9PJQrce
	JhYFsobdGuwmDpeGPrSEPiaI/UDKmJgqozM+lq+x3WTHA==
X-Received: by 2002:a05:622a:10a:b0:51c:8432:1753 with SMTP id d75a77b69052e-52fb96736b4mr922801cf.30.1787847710507;
        Thu, 27 Aug 2026 09:21:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e4270aae9sm40204551cf.16.2026.08.27.09.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:21:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wzcrM-0000000G4hm-2y5d;
	Thu, 27 Aug 2026 13:21:48 -0300
Date: Thu, 27 Aug 2026 13:21:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com, smostafa@google.com,
	praan@google.com, skhawaja@google.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] iommu: Add __iommu_debug_unmap_phys() to drop refs
 by physical address
Message-ID: <20260827162148.GB3769797@ziepe.ca>
References: <20260827145855.1616223-1-xiangzao@linux.alibaba.com>
 <20260827145855.1616223-2-xiangzao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827145855.1616223-2-xiangzao@linux.alibaba.com>

On Thu, Aug 27, 2026 at 10:58:54PM +0800, Yuanhe Shu wrote:
> The IOMMU_DEBUG_PAGEALLOC sanitizer takes a reference on each page at
> iommu_map() time, keyed by physical address, and the only way to drop
> them is the IOVA based iommu_debug_unmap_begin()/end().  A path that
> tears down a page table with mappings still installed has no IOVA to
> unmap with, so add a physical address based counterpart of
> __iommu_debug_map() for those paths, sharing the counting loop through
> __iommu_debug_update_phys().

This is not right. The following patch has the iova:

+                               iommu_debug_unmap_phys(&iommu_table->domain,
+                                                      pt_entry_oa(&pts), oasz);

Every pts has the iova of its current iteration location. Call
pt_index_to_va() and then pts->range->va is the current spot.

Jason
