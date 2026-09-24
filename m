Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0AC25B091
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237939; cv=none; b=SCgx4aAm7XdLmtVzJWExIEfCZFEixbstSc4dy2s020Vqe2FMsLQcMiQXvwloFPtYHyPyAkhcKDb6E6Y8+aeXyVA/vBguNvmDnfwI9BvTdX8MhgWm5c8sDgmH+z4ewXA0HnSrTyzJiuq39M2p82AmzpA8UGNMOFnH2fu1b6hc1A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237939; c=relaxed/simple;
	bh=wZuq7eC8OrYGdcaqCRFbmsq6ewXm1RrabCWSktmSbEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5CHDKmpFONDhIXc9S59v3SHaajAOY2+DEyZ6pVXFIqcTMaHwOwcQAIjVLsmqt57121JJdzaNouAElz7FySN5XrPh6VnjteoIru9qB2SXoMOIVhcnuRU0HGAUQIxGiZ35VLg8FRj5Xrp07YRADrRIhXwoAPkIwAOInsMVTpcfvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T73IFnSV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T73IFnSV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso32025e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790237936; x=1790842736; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=To3pmZtljGj4X5rJ/mnIJvMelKkwi9aYdQXapoWl02w=;
        b=T73IFnSVoMn3oXW39/QSINzxKMH36UR5tzMwYpSUHS5gmbEWy2scHdrc3hGxvgGDtl
         gQrCmFHpy2JSDdyF8aCEg2pD1jfFlLIbUV963y9F7WhIpDuJnzG+jN4XXjLaRK2XuiGe
         c2r7DOUV61oNUXDOe1V6mH1auma2IkyckUo6uXcn7aEuXXSFb6aWqYWJ36eZgERysfeg
         iNCfoqG5R/miv5aLbZT2FV+m5okmC1uqNDd4ZowtaCNErM6wwkJ6hb9QF0oIN3T80ya9
         vs6K3Xfpu6ZMKUIbQ4KExGF1uoyn5ckJWqfjDMCTaFkQ0rWGHh5Zkum7czRwX9At4udB
         /8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790237936; x=1790842736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=To3pmZtljGj4X5rJ/mnIJvMelKkwi9aYdQXapoWl02w=;
        b=1kVYljsxd6AnUwb/skT4VdWu/Q8MvgvyhLX3cUoT+hzMwnoZPSix2fKwOzNLn1+e4u
         f9ZC2C6/SggEKoPhZ7t4WVYRz+oX1C6UwrhiDxwTcxxKTWnjdn7KRPNfDvoNTuOPq9ON
         XxBP/AG3F3WLXK+dG9p3tj6wTNpB80hYTO7b1GWkSEzfYzIGp2PDqCo2LZRuGo9buf/7
         ZrGekS5gVh7me8iKOUeHDk6NoKFi3qPu/e45ZuzqHTMPfNUEjF39F2iLaBhexX1drpi9
         qkTHx1tNAgcivYSeG54WxMDDOoDQA1BAIlIpSNvNnhWIYJFXuhKHdb0lBf5q0zPSrAqp
         bNHw==
X-Gm-Message-State: AFuF++kAAmAK7kcmzEEkdvpzkly2J+Q7DmmQHZYLxjCVhwwqsDYj/aAe
	W64W+sBxEu1cPoqCSSBKEKSfNQT/obY5qQJ03Wi53+9lJgGNVLnudk0XT/fsJfxuLQ==
X-Gm-Gg: AYBFou3h43KtMCbBNAXmrnumWbTvm5j7Im3MgKU933ncKOarfXwvVvWjtlo2zVbp16r
	c85w4g1p+vfU61om2dGuTMWmMThVok+KGWvl3TlTH0n07wFi5OFt7Z0cy0Y9N+Yw3BWHcgN7JI2
	7wL6zH2YAktpoTq/Jhg4hBs2EAO41gvyexIW56cU1DU8en8CmQYi+Ekw9WF4M3EijQKTuVGHil+
	gC0wL7HXoIXIbZw8SDckYuDe88GHt8rVb7hRawDfrpSsmi12k+I1UQJ9NAkdN2XPd0hEkJc3zec
	/PXevodGKEtAK+9EZnnnuiyRkyWT5fpXyCnAD01TIHJSrlSm/hgG2owin3yqmWIgNhgxXbFXFhp
	Mt0+jVv/Oi1z9OJq12i3f5MxfRyD2GVoD1DnfoOOHncV+BNZsoxS5pNhUdljkPJ71aK8I3Kzmcv
	mSZ0k99M6BUiCBdkkhm1iOcl4zZdLD8gEC9rOUK/g7LIajm5UoTRaX9rOnYCNJdvofmHFSw1Ehd
	WO9pqw9tGIcbkn18J9MH+RhcgEmv5NgPuukaYFoXA==
X-Received: by 2002:a05:600c:4aaa:b0:49f:ddcf:45b7 with SMTP id 5b1f17b1804b1-49fe5632713mr652925e9.10.1790237935405;
        Thu, 24 Sep 2026 01:18:55 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd42f2sm47160755e9.15.2026.09.24.01.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:18:54 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:18:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, nicolinc@nvidia.com,
	praan@google.com
Subject: Re: [PATCH 0/7] iommu/arm-smmu-v3: Fixes reported by Sashiko
Message-ID: <arTc6smwFV3G2rSa@google.com>
References: <20260828125409.1921538-1-smostafa@google.com>
 <20260924000344.GA3560397@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924000344.GA3560397@nvidia.com>

On Wed, Sep 23, 2026 at 09:03:44PM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 28, 2026 at 12:53:35PM +0000, Mostafa Saleh wrote:
> > While running sashiko locally on the pKVM SMMUv3 driver patches, it
> > reported some pre-existing issues in the SMMUv3 driver (the RB tree
> > corruption and a missing NULL check) and given that this is not the
> > first time a pre-existing issue appears in the driver from sashiko,
> > I went ahead and passed the whole driver to Sashiko which reported a
> > dozen of other issues(except the last one in this series), I included
> > fixes for bugs I believe are true or worth fixing (others were mostly
> > missing NULL checks or bizarre HW/FW configs I don’t think are needed).
> > 
> > I also sorted the patches based on severity from the most critical to
> > the least, so it is easier to apply a prefix if some bugs are too
> > theoretical
> > 
> > Mostafa Saleh (7):
> >   iommu/arm-smmu-v3: Ensure L2 tables are visible before L1 ptrs
> >   iommu/arm-smmu-v3: Prevent rbtree corruption from duplicate streams
> >   iommu/arm-smmu-v3-iommufd: Fix error path in
> >     arm_vsmmu_cache_invalidate()
> >   iommu/arm-smmu-v3-test: Fix arm_smmu_v3_test_debug_print_used_bits()
> >   iommu/arm-smmu-v3-test: Add missing error checks for inv array
> >   iommu/arm-smmu-v3-test: Fix OOB in arm_smmu_v3_invs_test_verify()
> >   iommu/arm-smmu-v3-test: Fix UBSAN error
> 
> Does this need a respin? At least the 3rd patch there should no go
> as the iommufd tree has a different version of that fix now

Yes, I will respin shortly, I will also drop patch 2 as  Nicolin
posted a new version of his patch.

Thanks,
Mostafa

> 
> Jason
