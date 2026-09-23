Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D8555198A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176880; cv=none; b=fAnlXaoCb2yLsdkhMEl4o7rBWOqlwmPoJzR1mj4pEa8Sx9JJYLaIilMlXGJDt7M+5rOOyreXptlPqHDHSAaWcZmY9Ii/AZvg4TBt7WN+qsr3WnXF8gU5x9bv/vEQq7scZTrE4e2t8q/DoTcMHakdFp64k/MgIJLQ+xFp0jEXGfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176880; c=relaxed/simple;
	bh=3T521fW/HpOHDQpMbkHPHKx9NXhNDw5nf7wdl09SmWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIMxUlzoVBX4vAAArdowig+s64LRsY4+TI3WYWESFAm/xu1P+VCAsn4z0DpIe3cVoLDI0wCvnpwkgwDOVq4jHVlO31vccr4Gxcg2GkoWfIbLoHclxzJbtpQMBItW198W4f0WiVEkSBEoGENtFAco3Jnht3kLGRdOqq+pDNsYuW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MNZCktP0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MNZCktP0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49ccf12bed0so51465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790176876; x=1790781676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EE5PAnd1Wf6p3SmBC2optXiNbJWsLePJtC5K69fq2H0=;
        b=MNZCktP0g4S/SQFgzoweexMHIVcfgyXDVRzsodxD+ev+QFzogow+cv9jJS5AlyQiz9
         fZdJEmnukeymGsEfnWUYc0+n1ippwbbcw5W5zjGnIxwaTv0c+k6K1wN21TfmG3ERTN1Y
         aLv9kqt+g7MNadxvB37p273gw/1Dywe7vXuMrBTIBbfP2JWOjtiISTZvTjYpFsXR7bhc
         AZiYrpqPvkA+wB3t5NB+pougXY2pGAl/F3W1YNeE3GpwKr8Xl8zzd/mHwU8HVRXtCF4F
         r9jKpLJITfIxqHTvQ70KurSjRnl3sRekfq1H7qNn7Z8pdTVNYSSehhIZpFo5QNqO4Lsx
         2r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176876; x=1790781676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EE5PAnd1Wf6p3SmBC2optXiNbJWsLePJtC5K69fq2H0=;
        b=iBWKh5+lPppdLTl/JBrL7pdYMnmVxK6+llZuRpfye2FY8L5Qq/5tSLduxPc1efjNYY
         XvCTBFlOp3cxfV3XVgSJRr0HD3KgDCgN5vCVFHJIcDgHPhjvWuXtJOezuqdFQ2Y/bYf0
         BgQe/NxXCuzgKlMqU2FQflvLG6y8hvOxtCTuEVUeKXa7/l4YC5n0+xaAmw4t8KldXrPQ
         ZB5Uvh71tzxhENyXiSiYRmL5pA9nxYSdbWW6l0u8ojepe4GUr573tqTNvPZYa1TE/Vap
         58SQhvdyp4UGH607zfsPTk2OX/kFmjgfxys4gaQLaBr/l3x8bGgAQ6ERDNIroWTnpaXQ
         IowA==
X-Forwarded-Encrypted: i=1; AKwUvBwChh/izZV7vyHyaFuAfBH0e+qfwAbrpYjAkOTJ2AyHDLibia8DMK4k8r+Eyx29npvNz3Unvx35JALY1QU=@vger.kernel.org
X-Gm-Message-State: AFuF++nKB0qkTJLhBoybcw3V2sJcNZGSXlM4/FRTJrnh4FIKTzPh9HBf
	c5faZnhDbPahDHnEzBHVXIdEVpAozkUxciQGn7oKdYS7nVk6+ObyHS4xoeXe4ud/nA==
X-Gm-Gg: AYBFou28vC38jMJL5TB7sZwUHqD4A9fAnOG0/VJPWSxxYaGy+zWXbe7XGHC3TbO3K/h
	SWhGMlf7t2XNEhG26cFoSd4eo12UgEDM9h9B05KpGvAndGflwLm44Ms0k5x7mEDdrjx6Y8b/zEb
	ojQxTigSlD6NEGDwKxpoaUMvdSvAdwi5uHpo2IdMKXDnWc7E9ACYpXPxOA3Jtp0JhXIxMwNDahI
	fxetFAzc+2perfe5762QJv7ND6tm5D64Om1aRqblR5NrnXEVlT/2B2AbMb1PRMhVYMI9GU2x3gE
	IcjvdTBf+Fg2EciJ1zVauDLLYkIOJzgavY3qGLxSjDG1tdNkN0F3D+B1TaspAUz3VCaWi/52r98
	c9LxmBvz5CR6oaTmw+DY6slbByBbaeyLVK9faDZudIwSYZAEgps7JnJLoz5RDE5OpFthPBBB9vL
	TU3utg9BwV+QMaBAzLWJA9cEzm4SiubZzlYh6uEj5yp9DRTqZmExJmR4Ua++CezdfJzO87TFNHc
	4J9o0VrNbm+jX9tQIeL4eHyGAyCWLCieL12bwY7
X-Received: by 2002:a05:600c:4e8f:b0:49f:e1d3:fe03 with SMTP id 5b1f17b1804b1-49fe586ff32mr27765e9.3.1790176875531;
        Wed, 23 Sep 2026 08:21:15 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3ed96sm1697075e9.2.2026.09.23.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:21:13 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:20:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <arPuS9FXrkYJhbiA@google.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <20260923130031.GE1540250@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923130031.GE1540250@ziepe.ca>

On Wed, Sep 23, 2026 at 10:00:31AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 23, 2026 at 10:42:39AM +0100, Catalin Marinas wrote:
> 
> > On pKVM, we want set_memory_decrypted() to zero the buffer
> > before the host can access it (I guess currently relying on __GFP_ZERO
> > allocations). Since no cryptographic encryption takes place, there's not
> > much point in memset'ing again after the operation as the content was
> > already zeroed.
> 
> It sounds like this a pkvm unique thing, since RMM always makes the
> memory hidden, pkvm flow should do it too. Either inside its guest
> set_memory_decrypted() or inside the hypervisor like RMM.
> 

pKVM doesn't clear memory on sharing (see __pkvm_guest_share_host()),
and that is not a documented behaviour for ARM_SMCCC_KVM_FUNC_MEM_SHARE
(see Documentation/virt/kvm/arm/hypercalls.rst) which implements
set_memory_decrypted().

The guest is definitely the one knowing what is inside the pages and
whether it can be shared or not.
For example, a while ago I was experimenting with inline decryption
to avoid bouncing, and I imagine it might be used to build on in the
future.
Also as these hypercalls are ABI, I'd argue we shouldn't change their
semantics.


> Hypervisor doing it is the right place, hypervisor always needs to
> ensure guest memory is cleansed whenever the guest gives it up. Either
> via a private to shared, unmap or just exiting.
> 

"gives it up" is different than sharing, for example:
- When the guest dies pKVM will zero the memory before returning it
  back to the host.
- At the moment the guest can not relinquish memory (ballooning) but
  that is supported in Android which can zero the page.

Thanks,
Mostafa

> > I don't think cc_make_shared() has the right information on how to
> > safely and efficiently do the zeroing. That's only known to the
> > set_memory_* backend. So you'd have to propagate the flag down.
> 
> +1
> 
> Jason
> 
