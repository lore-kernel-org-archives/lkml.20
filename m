Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF17E47279C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252454; cv=none; b=iePtMFADsRVVsu0WS6eiIlAi7TxPvFftq7R+zVirnKHbIR7ClcXiIzy2gfHBfKincvBe9FqhWV5WhYRulNYBU+9khznMft7AhMnkasXyDy+rcNUFQIRTcXaJb7Op23VbMlfQ1O4AmxvDLHkpLNYeqfIsE3ZNKVjWjX4JQW4iq4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252454; c=relaxed/simple;
	bh=GuYMv+3OeZM7dBc1rScPdv7HA9p75oDjDJJKhqaCJCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuxkIxPgMDwiJO6T7vtEThAnkdAQg420GMTd20I29Zkpn522hwK5fpEKqwJsUpO+knonWTxhH2t2qsWKxB3hIjta05U5Kbjm36c36dux7nnZBSF9E2r5VNFUL1419VijnaVuBBF6icHG83x0UqxxdBvVwNYsUTPuwIo4njOpXBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u/z3g++8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u/z3g++8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-498012a61f6so34375e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788252451; x=1788857251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k+HrXbMbxa/Y02K3QZMbt843lXkhHRmzbDFOaV/a9gQ=;
        b=u/z3g++8LZWRuR+R7uR2ZuvX2YmOB1obKc5l+PAN17n62rls7RmjkCPAZbQ+hmSeU0
         AN5jGgeDWW1Sgsq8ApaC8kfFZZW6MWckBn1tDl6Az9DEe0M+EASnoZL3842D+ejhsp74
         8LQJmUft0cexDb2sFh+ae6K3Ypbja0wLhLXXFCBqiXiZKZNzI22MDWOXipYcchYwt0NH
         VaOVco+WhCN5ICqangCSDtgFwcDYqGowIr1Jj54J+AX9xksC+Luk2GkIROHXilVryi4q
         +plY6M2clNIWVZlE7vWgS8AjCIT8dyzSzSRMjvSVnDNnmX05k8rVI+ykrfwvPGV15Gqh
         RHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252451; x=1788857251;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+HrXbMbxa/Y02K3QZMbt843lXkhHRmzbDFOaV/a9gQ=;
        b=ZXfq2Lk0IK3q/ME2ba2TttgIp+2+u8nF86x3rTKikcO90nbNKg8kH9pv2onXvXVhIe
         9p4X7HhLFJesMozl1NBHmUnbiQi6hdTRNRA62LUFg+Lnf7O9L3rb4+SN1uQ1/1PuvAmc
         LqeWhRmr3bLhCxQxBH+DlarIDcg2eSIVd8WNeNTyLwqe+F0kyJ9v2W8HyvhDASYOXdFq
         7DcqkC6vZJg5DEw+PIqAsAuoMcIjiapP33yPyvAFGyf42XV/Bd2oxy5qC45Cm+2I/Vt9
         N6ddLZhs/Ex3gbwnUeUz75tOrBMNOL7lDVknMG0UHBiwJtkFxC7PJuGux14B3dVqeaKl
         JoKQ==
X-Gm-Message-State: AFuF++kD3oxVvjeGieqCMbj62fMlXVrkOP6eOnp12e/6L7IlQTqY9IFl
	wPtEPmtNI/3CaqqkjTUydVAbRD233C9yzzJF98uVy/bqvg5IydHMWdoFngB+GIVzJQ==
X-Gm-Gg: AR+sD12ks7G7OghdYu669dwVuMkm8J1F751/8+i4oXz22vaiNrURYTonId6fAIk5T3/
	kqyWoGll1VaSB5GpzWnVkzn3ZK2/j890Bz9W2+j774ibNEMpWVMgaTWJgbMOj/cpyIY/Q+XkFLB
	/5c0zsnWKgdXZsMe1TuH6oV+fnG8+NkuwWO1LfChlH2EI5vPhwwBOrylXt7XChGaXgeV+CvLspQ
	3OL03sG6EMYWJtgenIvuOpIvulanYICO134J13X+KSzYn1T9s/vuAHNbnKZZnvKRNMd9eJUGb97
	KlrUSJmUy3WHKjPSrl4YCk1n7Qs7tBLKWuuW2iWyHfXeKYl/bdl1B2znrACYkjGCrtpLKP1fJrd
	KspRodMPlauGQ+kJsUsiQj2D1J0ZWF2pc68SysUmR/TxJeORaDsoHabrIYYefhRUgj6kPY2D14n
	BdAPe3a5v6abzj087ZcV6fBfKwb96GxwzcUCeJlm0iEs22OwV6muS8mtGgY1cKYAAHAAUeo2HX8
	LWJYDYiEXv3RLJk8s1xdTjiam5Zuw==
X-Received: by 2002:a05:600c:12c2:b0:499:be2c:94f3 with SMTP id 5b1f17b1804b1-49cdd26e207mr507145e9.6.1788252450501;
        Tue, 01 Sep 2026 01:47:30 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a903eebsm220827575e9.4.2026.09.01.01.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:47:29 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:47:25 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, praan@google.com
Subject: Re: [PATCH 3/7] iommu/arm-smmu-v3-iommufd: Fix error path in
 arm_vsmmu_cache_invalidate()
Message-ID: <apaRHXMxfM7lxdJV@google.com>
References: <20260828125409.1921538-1-smostafa@google.com>
 <20260828125409.1921538-4-smostafa@google.com>
 <178792724269.3808739.17189675074822824146.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178792724269.3808739.17189675074822824146.b4-review@b4>

On Fri, Aug 28, 2026 at 11:27:22AM -0300, Jason Gunthorpe wrote:
> > arm_vsmmu_cache_invalidate() issues commands in batch size.
> > However, if arm_vsmmu_convert_user_cmd() fails, it will return to the
> > user that it processed "cur - cmds" which may be part of a batch not
> > issued yet.
> > 
> > Fix this by calculating the returned entry_num solely based on the
> > "last" that tracks the last batch that was successfully issued.
> > 
> > Also, fix the number of commands for early failing condition.
> > 
> > Fixes: d68beb276ba2 ("iommu/arm-smmu-v3: Support IOMMU_HWPT_INVALIDATE using a VIOMMU object")
> > Reported-by: Sashiko <>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> 
> Nicolin's series fixes this and the other sashiko note about over
> allocation:
> 
> https://lore.kernel.org/all/cover.1785258826.git.nicolinc@nvidia.com/
> 

I see, I will add it to my review list. Hopefully I can get to it by
this week.

Thanks,
Mostafa

> I think it is in good shape, I would rather merge it than hack on this
> further.
> 
> -- 
> Jason
