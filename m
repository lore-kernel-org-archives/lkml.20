Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C73A3B42CC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856750; cv=none; b=gG5dtar1nzl4nd1URSt7cXab9W67nb3/gIkNXvtXpWr6MnwtaPq+n0ktLh3cEdDKs2kXQoNwKMqiI+xP/S4tIhBmxOvO3kBMy1YIdE/UQl5l2+fkcKN1a9gPJg02/73+pUZqeVE/looiRQblc0/NkyXrf9AIMY4O83eZcL/5OhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856750; c=relaxed/simple;
	bh=Z+iz63taKQHo+c7eBYcTnzQttJ5PAsiNF5goSAmhfbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNcd3jIfZtcQPyoIuvqY/h7pLYMde3HN2tzxNzG9nMCGKCqNRp4NOQ3xYhlo5WTEaQCaV2Cc++AUoX0uwYP325CMy2Hiv0+AcL66TsdM83/t8gvWdATOZKPb4DjUjpWsTLifckOmaA3Ckz3yKzJ1Fdmlivd2v5bUAHtc/6CBVs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OoFGgC7g; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OoFGgC7g"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso106705e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788856744; x=1789461544; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2bt3KrEqZ1UzyjV8hoPZ5E3RfVTbXnZPVm0wr6pv9s=;
        b=OoFGgC7gJMs2GIzI8D1UBru2htdGO410LpzqEnyAYLsyDD3qyMOE7i1EjTjzqOaKyr
         Vv8ZOtW70XQDMIxgDLh8LttFX6Hg0hCPX9iTntpTPgGwUUlFeH0DrgQgbURnR+KkL476
         A/R/Uem2zE7YGLtf+RAg0OzsGtnU61nKvNYNQgG1xCKKTDvhzlmZ9tmgN1N4F9ezqlO9
         p7ZpaGfWgDL3iuFKJ7Kq0mlDjTKd9e8J63XDmLQVmGG8WX+SeyxSnyuGbPl8so4UODq2
         NZwdsUVdr7QpDmgIZER5g9xkFf0OM+jFEJiarfbpStN3XFfM5gWspNPFzXGjzkWLYpgY
         pzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856744; x=1789461544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X2bt3KrEqZ1UzyjV8hoPZ5E3RfVTbXnZPVm0wr6pv9s=;
        b=M8V/INcWlrEAaoERAR4foUfA2WzMvy3mijCRtoyYnsJvxIpL1+l7Dx0Guav4+ZyM2j
         mpK0tEuhnBZDbO68ma1vG5ATgzpisuZoZeGi/1mde/ZfxRufFS+KKlTrewM28AnVh4rc
         w2oxP8zC4KoABlQvTNWTqBjbk+CdOxAipDW1MR4Ks6BsdL07tHzNcvcoCItc6bL4wmy4
         k7zKAJuOH2axWzB+uhyWryL2t3Fi5++eTmTBPEGbrUB/+OaapCqd5a9DpoFWMV8PKKYu
         PRKWEdAPC2eJ56k3E3hnkQxexTOB3Z4Mo3HyjOBNAzD7per7zuaIHKP8SjDJQUDaQLhf
         hRQg==
X-Gm-Message-State: AFuF++lymybtRj9QNM+Ot6BlKm0jhV0It9CCD7muIcxX+fYHjTxdjkxH
	IE+SbwslKNMpiyVbQ24LR8/WM6nG20SGziAGPNSFEoqKRw//cmUQ3Bu3nCt35jibkw==
X-Gm-Gg: AYBFou2X3u9FlMRssBqfM+WyrYG+oJq0V7dUmPOyVAIZ1LqMvdQaiKrbbde98fZv6pn
	qm0m0zHOAnJEf+yzx2ia/GG3MtCfZ0jOIfZkPzhHZy4mYXiDZtG8Yq9oAr1i2jtL7qh+Mb8NYPS
	E9PMfwk1JgjkTw/hOvggz38tTEEY2WfCKrYb/Faw5O2QXYlSOLxqko4CQZx7pILaiJXHhTBTDZf
	kxIX0UVCuZX6hwVowLvMkrBoL0dR+l+Q3VSSCEYoIsyQX90SJflvnsBei149s1SsGWN1/EoblN1
	CTCu+SSk8Kh9BcmwS2zcadFWwl+75+GwG8u2K387+OwTSDuO46TJd8BeOiwd6XbMU2R8Ku6mP6v
	g8VgcuoO7P5QSeUy4tSgD8MVaLOo2aS6hB5ix1rvLHqT4zBk6rKYS4SIMWIon0Z3Ypz8xJ47b+S
	rYR6gTNctttHcIgv95qqOZkC/ITnTwFaUpCCfn19FDGVEt5ieJgElxbM4bUhbwFak8PTCBtVW3e
	yuDW4CdfoAfR2V7fl7v2+ISXqawXw==
X-Received: by 2002:a7b:c054:0:b0:499:c46c:addc with SMTP id 5b1f17b1804b1-49d010d6113mr2292585e9.2.1788856743315;
        Tue, 08 Sep 2026 01:39:03 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm274178525e9.8.2026.09.08.01.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:39:02 -0700 (PDT)
Date: Tue, 8 Sep 2026 08:38:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jpb@kernel.org,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, praan@google.com
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Relax ASID requirements
Message-ID: <ap_JokRTsUHtF4dN@google.com>
References: <20260907154928.4012151-1-smostafa@google.com>
 <20260907184513.GA2543240@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907184513.GA2543240@ziepe.ca>

On Mon, Sep 07, 2026 at 03:45:13PM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 07, 2026 at 03:49:28PM +0000, Mostafa Saleh wrote:
> > arm_smmu_sva_supported() have some residual checks for ASID from the
> > original commit d744f9e6c222 ("iommu/arm-smmu-v3: Check for SVA features")
> > 
> > As DVM was used for TLB invalidation and the ASID of the domain was shared
> > with the CPU process.
> > 
> > However, the commit
> > d38c28dbefee ("iommu/arm-smmu-v3: Put the SVA mmu notifier in the smmu_domain")
> > removed that support.
> > 
> > So matching the SMMU ASID space to the CPU is unnecessary and can be
> > relaxed.
> > 
> > Remove the CPU ASID related code, and update the print for the SMMUv3.
> 
> It is OK, but maybe this could also be but under an if
> ARM_SMMU_FEAT_BTM?  That is never enabled and is a placeholder to for
> eventual BTM support.

Yes, otherwise SMMUs with BTM would regress in the future.
But I’d assume non-BTM SMMUs will still be supported; falling back
to SW invalidation?

Thanks,
Mostafa

> 
> Once we get the last part of the invs code the BTM support can come
> back in.
> 
> Jasson
