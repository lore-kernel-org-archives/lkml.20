Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835563AC17
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790640130; cv=none; b=WDnUbeNFTPUpQk2tQq+ymrOFOus8R7DqTlAMGmfhaE+yCZujLl7JpmZTzpL1VwJ/gRXgHNIsRfObxb0PLWm0dNmnhUIF/zpFiI2Tjk67AusYfYAHrsm8oWT4GHBm3EUAOPpr2mTswz0UYrWVGavdRTtVVjAaKKpszM38n+6Mv+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790640130; c=relaxed/simple;
	bh=EABWZ24IxIct0Mhf1uXCrghBWDfhCoX7TCulKmtg4xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FikjQ5PNNdkdXRez20VbWeh0Z0TiAhpeMjSRXjh+z7J6d46H2M6/zerP1LzGLjRXn2MZ4aosUW4UEDGwyK8RLHykVwVKSTIr6G+Yu+XPbWbv672tqEyjwCQfA44tjiTpC9sFREOESfV/hma6hm6HNHzDBgGSyex7s5sEvJ8r+kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qLAfDvdU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qLAfDvdU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so9755ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790640129; x=1791244929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bl0AjuwmuTt9b9m42lFEHpaVtMv37QnWF5BqITX5uS4=;
        b=qLAfDvdUSduXxCCk9/Qn6Juifwy+ZW4P+OhMpbrdYWq1GrGyiUhqD0rGT1L2pK4D+p
         6odqiQB0Fh1G2mKZpphDM4d1Ie+2H3EJYcBBxb1EOWhzGtqPPoSKwHwJB11xzTDQpNeA
         +43AlbtDt+Gh5hYwtb+WdyEAqqOG5fXP+USGttia2079FSt/ax4Uhg9DMKZJwO6O5hOw
         kKrbYdZ3tuAvqqrc02hVunst1VfJHoX6HkydOO7NZBcnuAgfHF5mSUgYl42jUJ4OJWyE
         WriX49P2b7Nx+GOOjuSEAaPJbIkmhdtWZO/nD6Som9ZLD24VbCxBG2Ier1/LvHxdiCdH
         CBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640129; x=1791244929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bl0AjuwmuTt9b9m42lFEHpaVtMv37QnWF5BqITX5uS4=;
        b=Fl/6r/Ma6q54LXjNTPDUn0zFNU5cRhaQG4yQmZ2a5/ODoXqRAu1lNT0rtqUTvBqh1u
         Ddz8rKID9osKRfh4hcQdp8lXH6rDI1CsIvC6/cfCEWunBWoC6CpVvFjdyprkBX1WF0lK
         NHcUbUetg0hFX2TFo4Y61CC3bBWWG8Buzy59vi7N8qtBehLTTLOTVh40SHVkWsrJiPQv
         vglwcjnoClsD+Cx82vFOGORAxVCblsiEKlwTIlCzAnj1WofHgNuhfo/21lHwrBgBTdIg
         Du7ICVVVZ27HnDI4+zeVp2o8D1J31lF78tLyBaA5sxrk/BoNi6NNg9JhaSOOQ/U9X42O
         NB8A==
X-Gm-Message-State: AFq9FYKKl59jrvWRci7fGHG8I0ZoVSoHoFQ5BrsNMfNnOgfhQAaglu+/
	lBd2KZmRfkFnVNnMnWI3SofFJTkn/buXCfE+KS2Um2wA/+TmAxkuz2fD5FyFtAzsCRS89HmAVtT
	ZaXgGglkX
X-Gm-Gg: AYBFou0y4uIBz/98Q6AFzTX1KZgJGLAtS2M1mBfvNG9RIDvUeC4tQzebiZAoz0jqL97
	3vfsV+akj5ZhlyC++m5d6uwcYegGPSjWscJdxHuDGujmWRV0Suqjnm3oZ6JioVvsFszRYitN5Y0
	j+1geJCjnq08yJOnYnSUw5ql1yEQYprmac/S784WSwwy013+ypGzhJV+grjKbNKGT4M/TEVQDBK
	CuKNYevPFsqMjfkdf6oPpJwuQSag83aREk4Sfh6NYWRw8HY+nR8+xnRfISeNOSLFLCalcCBcmXP
	juDGc6epyhDiK+MBZ1gfWsCK7LY4teQ/5tFcebc5qgnWNcZ3vRSMGDXI27VjO0LTqcpQrozo5pm
	7RC7krxQhhVQHSuXcMwKBZr1Yvks1lRbYH0bbBb72IVBIy7NqrNj/hvY+kXcG47ma/dv1TGAqFa
	7d+1bYy35fJtMApGK7coQ+RHFDIiU1FEHAyfLe6jE7LuSrXe43ehmFHWYcXlju0hm08DXMuONe7
	GmedhLy5laGjqnnkwkGTndQ5TZc64JFMkz1TMfpp4169yk=
X-Received: by 2002:a17:903:986:b0:2df:8e89:3bff with SMTP id d9443c01a7336-2e2c7ab83e7mr1395595ad.17.1790640127941;
        Mon, 28 Sep 2026 17:02:07 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498179081sm1843895a91.14.2026.09.28.17.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:02:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 00:02:01 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com
Subject: Re: [PATCH v2 3/5] iommu/arm-smmu-v3-test: Add missing error checks
 for inv array
Message-ID: <arr_-bvl3qGR14BZ@google.com>
References: <20260924085616.300650-1-smostafa@google.com>
 <20260924085616.300650-4-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924085616.300650-4-smostafa@google.com>

On Thu, Sep 24, 2026 at 08:56:14AM +0000, Mostafa Saleh wrote:
> arm_smmu_invs_merge() and arm_smmu_invs_alloc() can return NULL or
> errors which are checked by the driver but not the test.
> 
> Add KUNIT_ASSERT_NOT_ERR_OR_NULL() after calling them to fail the
> test instead of accessing NULL or ERR pointers.
> 
> Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
> Reported-by: Sashiko <>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
