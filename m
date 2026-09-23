Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ED0349CD7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158558; cv=none; b=ahk6Vbdl72BEGn7Fh0CuS+ehpqiOidiXh7i2KCr+w+UkaXzpH5yRCeKuu9/Ch8u0vQwXYJLK13a33qcSvPoXS1n0kw/C7DJcJPME4n76FC4tTPg6iF2CXrITyk0pd3EISf3m0FAn/bnrmpYEs3sL3H7rDDThCn7lDYIVMhD3q5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158558; c=relaxed/simple;
	bh=EIUUzLZaMLycy3iJsghOslrbsHk9RROoG95frX8jYxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nyb0wzw9Fbalr+BLul9fNUFkYAPmyJiPOy9HWspOeI0pNGSNlNJ6ICbc06wU7vdOgMws6g/VUJxW4B3Xae4abo/4sDkvdy7BuOZlpSMsxHe/ILisdM28V2CbeM9ej2hVai+4Z+7RL38HrJ08zjtNrztHVIKuHc/zS2QDyiRtrlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p+UjFKvA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p+UjFKvA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49e65a8f70eso30985e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790158543; x=1790763343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yZHQHfq1ph65L7qxzKlrPBl8SiUbUAuTYjQIuazmnA4=;
        b=p+UjFKvAdAGBkI06GEz9sLyD/K3jPHUa6wQRWu3WabKfTcbdVVKvRGAjyCvwJeuFOi
         eGuuPjjf4hkY5WLMCXyPAkbZwfLKHAPhuo8jKKiQo9fCjJyoyrqby1ZcIoBFhdEY8otj
         dkyRKW9o0C5+1Z52kzD0ZX7I+B6auuvNsGEJZKHuEZH4qacrzdzk3rwAqLlMLjiHLba2
         gbzDAonil5hMkUEYq9taNt9EWCyWA4fyKWAheIrVnfK3LXzODLy0CzP1EVxBS8ky4vqS
         2Alxez2LZQlvol1o1cMikQquZOsrMC3PqXOlcmc+N1BV6KHHI7wISrFt2WNqldaQNTXz
         sHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158543; x=1790763343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZHQHfq1ph65L7qxzKlrPBl8SiUbUAuTYjQIuazmnA4=;
        b=Xr80hbzWtOTVSw0js34JRkemiH6BI2SNm2zSvqp78xpnIEqi5ms9zTdpACieM10xBF
         ByapxgOA8K3vZf5ovlAwzY8UMkRdSoCxsii3/6s2p53w91JIlSOptrp5UafWJ3PrgHl1
         i0ZhsUbqcacb8IwtrdpLVG+nMqRiD5Zc5hlkENd6yEfB/SEUVjZkzOLK8H34oczR5vQW
         FKOZ6WpAP7DTShLehmxHM+k2nebCyeYj/9QIL2p5I9nKjOn7qnjAau2q9kRSRO/ETTPq
         B/mXj2nPeKaOx+vZlLCgHphQOZGxnfVzo+vGU+GsncNSqluppO/Ifa5q7HkuTC3NEPMO
         n/8w==
X-Forwarded-Encrypted: i=1; AKwUvBw89GE9vJHcA6wuRehvGfHRv500k+cIJF3aBJHdBSwx/ah7PFtNCt0q/2Vo3v28sq2nDm6aU+toQ5FHUNU=@vger.kernel.org
X-Gm-Message-State: AFuF++lqCSA8tvBTF/9zbYuhMxXQdek8d2+7mnfdBuO7lbSUtmjpSrAF
	qJZ2YkKylrnG0EM5NejYUTKVT6LiQHdy5kp+BiS+sd6z55MGJyh7DS4FZpUukrUckg==
X-Gm-Gg: AYBFou00pAN47lMHmlBadFZkx7EqbmZ/OFaIV4tFCiiT7wYUxKY2XPeO/8+GUJBtKjA
	gmKnfvkqqz2W8CVmSwrDegK+BL4hr9gAKDaVPbfHq7fabvbTT7234Etyn9cL53ZioFMbn7h+pDj
	8lALHqMKsGOFwcVdbUxJ88j+YKHBK1RvHjuCcnsg8ji8tL9rHX8vZ8BaLM2FK3gS6WF2X3LAQZp
	/3ThgQzTrePTcYJUMdYUCycIaV+pxftP1zt1uY+PfGcOobZNnRlR2xf2aXY8rAaYR5RTY69fS4N
	Zl3XT6CIhM+nifBa6r7yQlv4+qF4PzvjhCbvRG/zom2WBb7doYwFpnhrp+qIfGi6wJai/UQpoZl
	uv+1Y8xBI3+B9ETSqPngVjGTVY6geE2PWpwv2yr202JTu4S/5ItOOSdkzOdEOeW8TvIR1vQh2Bk
	BeCv6cryzuYkLeUOQut8TPQnOhqCe/zy9B6wrpQxHf2RvMgk7/vE0zUhiG0/Edek8tHkaYAf5AH
	Sk+0FlUYjUjP22NoOaL42jyAZ5DF1aIAl23IP8K
X-Received: by 2002:a05:600c:379a:b0:49f:c6ca:42d2 with SMTP id 5b1f17b1804b1-49fe0c0bad5mr679925e9.1.1790158543084;
        Wed, 23 Sep 2026 03:15:43 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1e975asm71831925e9.14.2026.09.23.03.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:15:42 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:15:38 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 05/25] iommu/arm-smmu-v3: Move hitless machinery to
 common code
Message-ID: <arOmyuQwuWkynORS@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-6-smostafa@google.com>
 <arLeIO20VQZD80nr@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arLeIO20VQZD80nr@nvidia.com>

On Tue, Sep 22, 2026 at 12:59:28PM -0700, Nicolin Chen wrote:
> On Tue, Sep 22, 2026 at 01:12:38PM +0000, Mostafa Saleh wrote:
> > Move the hitless STE functions to the common file so it can be
> > reused by the hypervisor.
> 
> s/it/they

Will do.

> 
> > No functional change.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> With some nits:
> 
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -59,10 +59,8 @@ enum arm_smmu_msi_index {
> >  	ARM_SMMU_MAX_MSIS,
> >  };
> >  
> > -#define NUM_ENTRY_QWORDS 8
> >  static_assert(sizeof(struct arm_smmu_ste) == NUM_ENTRY_QWORDS * sizeof(u64));
> >  static_assert(sizeof(struct arm_smmu_cd) == NUM_ENTRY_QWORDS * sizeof(u64));
> > -
> >  static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
> 
> This line removal seems unnecessary.

Yes, I will fix it.

> 
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > @@ -1321,6 +1316,8 @@ static inline u64 arm_smmu_tlb_inv_range_enc(u8 num, u8 scale)
> >  		FIELD_PREP(CMDQ_TLBI_0_SCALE, scale & 0x1f);
> >  }
> >  
> > +#define NUM_ENTRY_QWORDS 8
> > +
> 
> Maybe we should drop the duplicated define in arm-smmu-v3-test.c?

Makes sense, will do.

Thanks,
Mostafa

> 
> Nicolin
