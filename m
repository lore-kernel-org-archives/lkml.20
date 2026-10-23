Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798269;
	b=Vb3bqaMkgONVhHs5KHw8hrEwgo+1LfRd2rsFzP6gew+cUmBHpVIKTH/RI2qDIH6mVoKs
	 6w4SxdX7Y9/CR1PeSSGjhiyX3WBIqJvM4kI9PDGKtZe0kB4EEAJg6oBXJy4yVkwpoX8Re
	 CXsIQUlZsbXFRZ/8j5Fe/x4Wa4C2qDN1eSJwnGfDYvwiOJs8plGUhS+mDUh9KmkriehqV
	 pCfr1mqkOn9A7rfmquyglL7FvbwlUVhkOrjpjzZpYOcB1kFTNHcqmjysBeMqW3dP8LwwF
	 954M34NEUju3ox5C/wIrbJV5QRCJMfXgBiY85NO2wPQQefb3bGcZsIfdXvivu9HvPmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PWqyUavBnfNEo1DMfRHoVS39e8foN13m8UB6fhUtUw8=;
	b=qsgbz34Aw5nzSETqnZVs09U5omsv82Jwx1o8sfWRVNVbMrP2F9yLinZoWFSdXm0qVzYx
	 XrX4q9q6cUBTw9DYpwXeDRavXBJMvEIARQs1nMfSMcExcu1F4Fq2IxMaPag2NuhJfkgym
	 CrGLQLgjgr4DxLJHRwwX0KyicEbumN1L1RB3aKiApRijNJyVOBeyHY/uxF712w4sAiHCj
	 1mUX/mn5DnkZ+UPmJNCivYtFIx1V+g3t/SJj1FPWdhc9KZUE572/uqheVW6YsgdsY5r40
	 14jd2ER49SAGFy+g2eVU8Ggsclr1JfPCeHv6Uc+kb1nFHR0rNNH2PyYy+VMtUuk1f+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nAA74T8c;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62898606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62898606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nAA74T8c
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ea7f9c11e6so24465ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792798269; x=1793403069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWqyUavBnfNEo1DMfRHoVS39e8foN13m8UB6fhUtUw8=;
        b=nAA74T8cOEJLXMnzpJum2EuGhN6wWZ7houJ5cTni6btqKvu8eDNZNsM6z52TkQNSvf
         WV4DdlHcZGanwbtWs7vRG2iFqSVr+jdHu3kBZEtXyQQCo+Y1AHZ8rLyamggYaMj8aEsB
         499r07UlyW9W4VeveVMUVHxGNsesZOT2hsiEC6MozIdgo2t7qlymOHB0FxuI5JUZu0N1
         kIEVGzbyTqwOL6acytKhR7GY58O9K09BtS3PT3N1wz7Jx0y5LSmeJfKPRyn5T5l5qM7i
         lUdecUozr9SjmHXZFVou7tKJeaRskqeq4yKSFW1dXcVB/W7hjNZA7JzbJgdWyy9hd86y
         B2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798269; x=1793403069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWqyUavBnfNEo1DMfRHoVS39e8foN13m8UB6fhUtUw8=;
        b=yuk7tu864mlREFrOR9EzWAhfYOexohyGUh/+zT+rpjMaTCVWRlMllNQCmYKd3DuxJ4
         WL2v2g13xsyE52ni1vPHhY0yDhnu8VJcufXuTgchB29NNxIRi4h7pIfS4gye2X3/Nzb5
         nh1p2AWyZxVjkJxC02pkZidEOlPkG42eloQ5iSL/VNRwh4eHY4j0v82sF+nF/+0BEWy7
         Z4xdqwMOXeVZZ3l1uHop5u3KGkPerh9XjN+N+dRtr4ae0zafycuxHvs0N07FBLHFM526
         4ZrBE+0gRJ+izWtkoTbOThJ2utp2q+AG1pjjpYXgp3kkxZdMuiOgR/cCURFdtAe5Q9aB
         /nmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEELiOy+jeuOl6n/7LUrGRR3E8N5h0ZhQgx5A34AMBMCIDT17MtCCXfUq9fCRKa2uL67Qg75KSHC5sL9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMZK+dKHGtebx+f7ICrtay6UKwvtoUKLmXYgJOQWb3pOTz2jc+
	kz7I4zrY0vs1xcrcPfkkoJd43U6fwRqD/E/B9j8KfsU9Id9mQN6H4YG0r7Jw4Q5GhA==
X-Gm-Gg: AYBFou0iDPnXYwUxCu3Yo/ByQ7FbzHcR0r+P7q7SyBeNKL/A9ttBYxQmOloRvducNqE
	dVzozwcmxzWlKTvYgqhx8c2fg15zbc4cdcVPln3nuF1D63eaMxkfkcs4MHZDOqFm/nptH0GEe4i
	Jb9bQWyjWOA/P3/KYd+V/awerqzjv29wAxO7Ictpmu9ejYpY8LNdLFF7siyl6/d2HlVZT+sQIeZ
	oacFZg5S3DAM9j0C+UUyY5zhu8bb/RK/5W9d4dHU6Aq3OVUhP0FqbYASP3+G4CUbAGPd5Ie1fuc
	uOjtSVAsxoJFLjQ6sEaoIgmMewxpoCL3AUBTP9EPJpVWwjZvp6jCGPsMclNNyrdgII/6R/AnAY3
	jsS5vWb2iw1ln0lmOIswRK+YuYBG2iCR3uVGB9tSbcJlnDfxRjvcoG/6AJXpmUULKFCiBV25/yl
	OB8rQ7htSVUroBJB9/ToW1Hadsf5jkQl+yt3yet2iMMf+poL6Z+5NrM3gfIfryx0OXVUDHop4bc
	SC3EAyGgpy0H3H9poGQH9WLQnuvzLH0Mu7JOL1xlKTqaFE41sogOJhYC/Hs3bv9R1YWRLb2ARJ0
	7Xl4LfKi619gycvCICRbt4TWHa1xIgkLXPEr4aCXw09WGhjh
X-Received: by 2002:a17:903:1cc:b0:2e6:1917:fa with SMTP id d9443c01a7336-2ea9d12a727mr853705ad.7.1792798268197;
        Fri, 23 Oct 2026 16:31:08 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb27a1bsm707176a91.15.2026.10.23.16.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:31:05 -0700 (PDT)
Date: Fri, 23 Oct 2026 23:31:03 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
Message-ID: <atvppceAqBVx8G9S@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
 <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>

On Fri, Oct 23, 2026 at 02:43:28PM +0100, Robin Murphy wrote:
>On 25/09/2026 2:13 am, Samiullah Khawaja wrote:
>>S1 domains are programmed by CD entries in the CD table. During a new
>>domain attach these are updated using write_cd_entry. Since ASID and
>>TTB0 are in different 64-bit words, the write_cd_entry considers it a
>>non-hitless update and sets V=0. This means such an update is disruptive
>>and would generate translation faults if there are ongoing DMAs.
>>
>>Replace the CD entries by using an unused temporary ASID in following
>>sequence to allow hitless replacement of CD entry,
>>
>>- Update the CD entry with temporary ASID.
>>- Update the CD entry with the target TTB0.
>>- Update the CD entry with the target ASID.
>>
>>Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>>---
>>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 66 ++++++++++++++++++++-
>>  1 file changed, 64 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>index 5732f3ba0122..59f4b8cf89f6 100644
>>--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>@@ -1641,6 +1641,68 @@ void arm_smmu_write_cd_entry(struct arm_smmu_master *master, int ssid,
>>  	arm_smmu_write_entry(&cd_writer.writer, cdptr->data, target->data);
>>  }
>>+/* Invalidate every stage-1 TLB entry tagged with @asid. */
>>+static void arm_smmu_tlb_inv_asid(struct arm_smmu_device *smmu, u16 asid)
>>+{
>>+	enum arm_smmu_cmdq_opcode op = (smmu->features & ARM_SMMU_FEAT_E2H) ?
>>+					       CMDQ_OP_TLBI_EL2_ASID :
>>+					       CMDQ_OP_TLBI_NH_ASID;
>>+
>>+	arm_smmu_cmdq_issue_cmd_with_sync(smmu,
>>+					  arm_smmu_make_cmd_tlbi(op, asid, 0));
>>+}
>
>Feels like this should probably use the existing invalidation machinery...

I see, I can use the arm_smmu_inv_flush_iotlb_tag() to issue
invalidation for the ASID.
>
>>+
>>+static void arm_smmu_cd_set_asid(struct arm_smmu_cd *cd, u16 asid)
>>+{
>>+	cd->data[0] &= ~cpu_to_le64(CTXDESC_CD_0_ASID);
>>+	cd->data[0] |= cpu_to_le64(FIELD_PREP(CTXDESC_CD_0_ASID, asid));
>>+}
>>+
>>+static void arm_smmu_replace_cd_entry(struct arm_smmu_master *master, int ssid,
>>+				      struct arm_smmu_cd *cdptr,
>>+				      const struct arm_smmu_cd *target)
>>+{
>>+	struct arm_smmu_device *smmu = master->smmu;
>>+	struct arm_smmu_cd stage;
>>+	u32 tmp_asid;
>>+
>>+	lockdep_assert_held(&arm_smmu_asid_lock);
>>+
>>+	/*
>>+	 * Nothing is translating through an invalid CD, and an update that
>>+	 * invalidates one cannot be made hitless anyway.
>>+	 */
>>+	if (!(cdptr->data[0] & cpu_to_le64(CTXDESC_CD_0_V)) ||
>>+	    !(target->data[0] & cpu_to_le64(CTXDESC_CD_0_V)))
>>+		goto write_directly;
>>+
>>+	if (xa_alloc(&arm_smmu_asid_xa, &tmp_asid, XA_ZERO_ENTRY,
>>+		     XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL))
>>+		goto write_directly;
>>+
>>+	/* Copy the existing cd entry and update only the ASID. */
>>+	stage = *cdptr;
>>+	arm_smmu_cd_set_asid(&stage, tmp_asid);
>>+	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
>>+
>>+	/* Copy the target cd entry and update ASID to the temporary ASID. */
>>+	stage = *target;
>>+	arm_smmu_cd_set_asid(&stage, tmp_asid);
>>+	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
>>+
>>+	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
>>+
>>+	/* Update to the target cd entry as it should be hitless now. */
>>+	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
>>+
>>+	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
>>+	xa_erase(&arm_smmu_asid_xa, tmp_asid);
>>+	return;
>>+
>>+write_directly:
>>+	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
>>+}
>>+
>>  void arm_smmu_make_s1_cd(struct arm_smmu_cd *target,
>>  			 struct arm_smmu_master *master,
>>  			 struct arm_smmu_domain *smmu_domain)
>>@@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
>>  		struct arm_smmu_cd target_cd;
>>  		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
>>-		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
>>-					&target_cd);
>>+		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
>>+					  &target_cd);
>
>No, we cannot blindly do this for arbitrary ->attach_dev calls - the 
>majority of S1->S1 transitions are going to be moving back and forth 
>between the default domain and user domains, where there is zero 
>expectation, let alone guarantee, that the translations would be 
>equivalent and thus not liable to lead to TLB conflict aborts or 
>amalgamation hell.
>
>This needs to be in a dedicated "I know what I'm doing and I fully 
>accept the consequences if I get it wrong" call path.

Agreed.

I will update this to only be triggered with explicit request from the
Core to satisfy my live update use case where a preserved iommu domain
is being replaced by a new domain setup by the user.

Thanks,
Sami
>
>Thanks,
>Robin.
>
>>  		arm_smmu_make_cdtable_ste(&target, master, state.ats_enabled,
>>  					  STRTAB_STE_1_S1DSS_SSID0);
>>  		arm_smmu_install_ste_for_dev(master, &target);
>
