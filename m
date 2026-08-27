Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BC9286D5D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787825102; cv=none; b=Uo+rcYhtG+dBUxxHU+h/bzp2C9IxlV0+QvY6IxUhbfmX2LfsWKyU3+ukT12nVV7sjfupsOyuWWQEMdCpSvJw2gNnZhsctBAsWjCnTFDWpJlQbcI5NDqx82wW08noQ0LUHOlyLQnjoSQ3KwfqVQ7pxtXmC/qgMkG78PyF3SgD6Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787825102; c=relaxed/simple;
	bh=w2JktL+v61DL4h6yBVGKzzOAstSuMDYAe6/bKIYCI7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adVuRC7nImxogtHJdL5w/rBO23n3kV0819vMpEzzQZ3Fg0edioO0WFG7s3TjyuvfmaqECUsYeitzUazD/vkO20TrJX0qmrCi3T7r8Sh0gp12MkC9CCoyiZs56wII+icAHqnp5chgGQt3WrdAIYikDLQtwPQzdGusztbcaBaMUnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TuqX52Vj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TuqX52Vj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4996e2575dbso42705e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787825095; x=1788429895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cyXgf/imt42EyjU9r/iWXqABk8Dr5fOp0hkHgXnc/1I=;
        b=TuqX52Vj6fZaT6ot7EGGdCXtISLaNAKsC090IftWI1Daab/ikzIlRjWEtBhWJ+sErj
         LvcGo2snyGLKjKwABrwMtq+dnhik916yCmu3G7X6LsRMBa9VRW7zANj8WTx33k+4NuiY
         s2jz1+K9nCRC6iAJ5impMUchxC/UyDHwTAyL5OHR6MTG1upr8QrapzdM13bGRi2QOgjs
         xyR5ezn2Rz9N/XP85nRaOoSOl6hr41ahDEAUQg2bqQIx+InkqLR8hVaEJOrCk1jBDXJl
         dWvj3Wg4YQKyQcKaYQPGQrjFsBen9hcYSAKshdkS25gAtua1l4txpKMB5OFPt8fVvrPL
         6xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787825095; x=1788429895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyXgf/imt42EyjU9r/iWXqABk8Dr5fOp0hkHgXnc/1I=;
        b=Sirci8UX2Ka7dXChualRUmB6RrpWINioYRZAZI35JHDnJmLkLcFOPqVZ4dt5tCaayk
         YC2cYTPoD9rjAMREbo4EQSeGbwrW3RBFaNbhOexZLbrWaOMJgttGPcXN80ZaY8A4R2qM
         5jvcUGETRnVT0uT6ozyx/GlpkDJkn9SrXjQpvsxubtLP0GPkGlKdwj36SOBgdgu7Wa3f
         QkP+n3acPZOoYVd3md3LPP1xZt2VYWlt47m11KzxQYDNSu3N084xENsIfkXhlz0eeFDO
         gdV59ianQ2lGeVsWDE7r74Z1h4Z9EgbyE8ZNrIseG7LR0IjZpOksfwvJlEo3m5M+ZMaG
         Eu2w==
X-Forwarded-Encrypted: i=1; AHgh+RomgffRR97vUAbb7Xqev4vdZFu3AYb+1cGX5wTnJaNssjyS1TzlnpdKrUdwW40hFztS+tUv4YK2I32R2bw=@vger.kernel.org
X-Gm-Message-State: AFuF++k69ZGErUUlgUw+QxMbvknHFlBCjiKmvAal2l34dEOhz7ODe8lY
	jiD3dYppDoEUWohSym6R0HTdm4nh5vKsooq2bQr6vkh6Qky7JskTZKnL37ZInQ814g==
X-Gm-Gg: AR+sD12YwPIfo9bRZNXzXwzLIAF0rfWEyyhxWJ+LrT4lnWeGdhr0MZl2c9u9vPYL7tn
	zizYIXCkJtkd5QglmzfLjXLt1JxqFYEE/UbUXE19tgLA/0xQhIwOUE3upPNymqkoFRVULd0gnZw
	kY9zTb+bsLqag8w1Ss04uMBKpG8uB6g+xImq87KUB23kGiSS6vOJGQQThXGn8KSBegHQ4Fv5MA3
	7H1wVTSzxqbkm4IsQK1nJsyb50TY35KtOeVgibi6x82TNK55Dd2VOpE+2q0UOmmwobAYWoZfBUh
	9QB/igRTww6DYxQFMtRMFi9dCSLdvZqhXrGUXk0pnK0NT8J/L4qwW6Ns3/PfhFauqKmiXvPLwxQ
	IHjc3PJ16QGbm9Df03XOjFh7YTiDuUDbzqth+ca21rcu1rn5eEq74c1bWf+ndP2DaSw7FF5sIFC
	Q2pOjc5sL8fwC3vd0nVP3Ir11KgIkieHXKiCr0HROkRn7cOxgaCrZgFkNsc/ZmeGSqxZEENKJ0f
	38shRnG1rKKqFqbdrivtxyzB5xf2g==
X-Received: by 2002:a05:600c:68d2:b0:499:cb15:4511 with SMTP id 5b1f17b1804b1-49b0e6483acmr671155e9.8.1787825094654;
        Thu, 27 Aug 2026 03:04:54 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4af00fd2sm36028375e9.12.2026.08.27.03.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:04:53 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:04:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 23/24] iommu/arm-smmu-v3-kvm: Enable nesting
Message-ID: <apALwh7sRMsn7WS-@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-24-smostafa@google.com>
 <178769159057.3356902.13161185498161727294.b4-review@b4>
 <ao6puxVSNsLC8aql@google.com>
 <20260826123831.GA3667628@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826123831.GA3667628@nvidia.com>

On Wed, Aug 26, 2026 at 09:38:31AM -0300, Jason Gunthorpe wrote:
> On Wed, Aug 26, 2026 at 08:54:19AM +0000, Mostafa Saleh wrote:
> > On Tue, Aug 25, 2026 at 05:59:50PM -0300, Jason Gunthorpe wrote:
> > > > [ ... 129 lines skipped ... ]
> > > > +	ret = smmu_attach_stage_2(&target);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +	hyp_spin_lock(&smmu->hw_lock);
> > > > +	cur_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(hyp_ste_ptr->data[0]));
> > > > +	target_cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(target.data[0]));
> > > > +	target_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(target.data[0]));
> > > > +	if ((cur_valid && !target_valid) ||
> > > > +	    (target_cfg == STRTAB_STE_0_CFG_ABORT)) {
> > > > +		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
> > > > +		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
> > > > +		for (i = 1; i < STRTAB_STE_DWORDS; i++)
> > > > +			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
> > > > +	} else {
> > > > +		for (i = 1; i < STRTAB_STE_DWORDS; i++)
> > > > +			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
> > > > +		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
> > > > +		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
> > > > +	}
> > > 
> > > This doesn't look good enough, a driver can't safe writely to a valid
> > > STE in any order like this, and it can't make it non-valid or risk
> > > breaking guests. We had this bug in linux already, the hitless STE
> > > update in the hypervisor is mandatory for linux guests using PASID.
> > 
> > This piggy-backs on the kernel algorithm, as described in the comment
> > in this patch:
> > +       /*
> > +        * Summary of each host emulated state vs real HW.
> > +        * |    Host    |       HW      |
> > +        * ==============================
> > +        * |    V=0     |       V=0     |
> > +        * |    Abort   |       Abort   |
> > +        * |    Bypass  |       S2      |
> > +        * |    S1      |       S1+S2   |
> > +        *
> > +        * For the host, any V=0 transition is not hitless, all other permutations of
> > +        * (abort, bypass, S1) transitions are hitless.
> > +        * For the HW state, any V=0 transition is not hitless, as all the S2 config is
> > +        * always the same (ttbr, vtcr...), all other transitions should be hitless too.
> > +        * However, the host is not trusted, which means that any V=0 <=> V=1 transitions
> > +        * or any transition to an abort STE we need to enforce writing order of the STE
> > +        * dword 0 and add CFGI.
> > +        * Otherwise, we write the STE in the opposite order to cover cases from abort
> > +        * to S2 or nested.
> > +        */
> > 
> > So this way, the hypervisor doesn't break the STE and keeps the host
> > STE transitions hitless.
> > 
> > Or there is an example that I missed and is broken by this?
> 
> If we are exiting S1DSS mode it looks like this clears S1DSS before
> changing to S2 only mode? That would be a bug.
> 

From S1DSS (nested in HW) to bypass (S2 in HW), the kernel STE writer
will do a hitless update by writing DWORD 0 => CFGI => DOWRD1-3 => CFGI
The hypervisor will transition Nested to S2 only on the first CFGI which
is safe.

However, it would be harder to reason about a buggy or a malicious kernel,
my impression was it can only shoot it's own foot with bad STEs.

I will give this more thought.

> There are also gotchas where writing things out of order can make the
> STE UNPREDICTABLE that must be avoided too.
> 
> We really don't need two versions of this stuf, just use the
> programmer we know it is right at this point.

The problem with that it needs to pull a lot of code out of the
SMMUv3 driver which has things as struct arm_smmu_master.
I will need to check how that can work, but I will try to avoid
that, specially this is not a generic STE writer it has quite
small transitions which shouldn't change in the future.

Thanks,
Mostafa

> 
> Jason
