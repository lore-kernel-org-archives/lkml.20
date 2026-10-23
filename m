Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763013;
	b=MwJvqyVDFCzGs3nEUeFGVlIbA9f+eTuxC/5OnvHpdjEDtns8DxTE+jL299l7UT1L5xF5
	 1sGbaeIsCr0VgCfQFv0Mu2bQpJIdgCgtFA4gXRXbGD3jMJrgQbZpv3HfagEYeAb8JNvkg
	 sNMoTu1kcADefqm8S1vDTf0Sw2hpyoOYFaGvIxUuOCyIQz8UbuaVVQx+axqRCv7On+tgK
	 W369TDb1ozvIm7KfLZu2eF2CyZe6+TDBpMVLedjy2QAlXJva09AITOC+GF1Z6H91Ad9Ru
	 FcQWkbrs327leAnY6e+ejoVmIqOcvfLLxzs5XwYdX57FcJDOGumXBBNN0bTreTvNjUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763013;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4I8C7LS9Ebq+RsUKShRZmElkynjaFDjGXMud7w6ijM8=;
	b=4Zg6sBr7U7Hn2vDSqqtQFT8zZ9RLUtAy7FpbcF3DXKiYtQJAMeUoGwfKDjmknrfhPhOL
	 V1iXQDu+oUXoW8Y5UawO3oJzlk2If8Hl13nVgo5hKmif0YVE8ddROan900kkMNYB0nTjJ
	 hfoE0w96YyL8BT2hpG2VAp9MsBFnDgfTwJIqc2UO303Us3fEwL9QjA/D6j1Z0up8cc+yT
	 4fICyb5+feFU+maKfEnDfPgaQzRsbgK2VM1pWnPsuwp5m8+5IlKM2+OkZdVi35aVhtq0W
	 z5Hui1o2LSH6qwalRYkKoA+NEXXUyJ5OcemaSn3hiNAdOqFZDDvtaIdRj1/orDjSPow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jlUDdA7Q;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61522606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61522606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jlUDdA7Q
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E2F01C00;
	Fri, 23 Oct 2026 06:43:28 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFFD83F959;
	Fri, 23 Oct 2026 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792763011; bh=fCH8Bmguz7AIGj8B74jO3aVsHYpkx2Drb51PhaFvVVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jlUDdA7Q6YhVFyc3r63QNHS9/fYgwiCfXdlLas7xY55jXXVRMEOVNu1pW87w4JKC8
	 cU2SnHFz2xhR0mLxjQkYnOVkHvEo0x1jyT3tWrZovDoR8l0gGMtADTPqsqbDajasrn
	 COO49/fSsUfhMquBHURVeAEupUdXM/sWVp+tOG/k=
Message-ID: <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
Date: Fri, 23 Oct 2026 14:43:28 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
To: Samiullah Khawaja <skhawaja@google.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260925011308.3381953-4-skhawaja@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2026 2:13 am, Samiullah Khawaja wrote:
> S1 domains are programmed by CD entries in the CD table. During a new
> domain attach these are updated using write_cd_entry. Since ASID and
> TTB0 are in different 64-bit words, the write_cd_entry considers it a
> non-hitless update and sets V=0. This means such an update is disruptive
> and would generate translation faults if there are ongoing DMAs.
> 
> Replace the CD entries by using an unused temporary ASID in following
> sequence to allow hitless replacement of CD entry,
> 
> - Update the CD entry with temporary ASID.
> - Update the CD entry with the target TTB0.
> - Update the CD entry with the target ASID.
> 
> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 66 ++++++++++++++++++++-
>   1 file changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 5732f3ba0122..59f4b8cf89f6 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1641,6 +1641,68 @@ void arm_smmu_write_cd_entry(struct arm_smmu_master *master, int ssid,
>   	arm_smmu_write_entry(&cd_writer.writer, cdptr->data, target->data);
>   }
>   
> +/* Invalidate every stage-1 TLB entry tagged with @asid. */
> +static void arm_smmu_tlb_inv_asid(struct arm_smmu_device *smmu, u16 asid)
> +{
> +	enum arm_smmu_cmdq_opcode op = (smmu->features & ARM_SMMU_FEAT_E2H) ?
> +					       CMDQ_OP_TLBI_EL2_ASID :
> +					       CMDQ_OP_TLBI_NH_ASID;
> +
> +	arm_smmu_cmdq_issue_cmd_with_sync(smmu,
> +					  arm_smmu_make_cmd_tlbi(op, asid, 0));
> +}

Feels like this should probably use the existing invalidation machinery...

> +
> +static void arm_smmu_cd_set_asid(struct arm_smmu_cd *cd, u16 asid)
> +{
> +	cd->data[0] &= ~cpu_to_le64(CTXDESC_CD_0_ASID);
> +	cd->data[0] |= cpu_to_le64(FIELD_PREP(CTXDESC_CD_0_ASID, asid));
> +}
> +
> +static void arm_smmu_replace_cd_entry(struct arm_smmu_master *master, int ssid,
> +				      struct arm_smmu_cd *cdptr,
> +				      const struct arm_smmu_cd *target)
> +{
> +	struct arm_smmu_device *smmu = master->smmu;
> +	struct arm_smmu_cd stage;
> +	u32 tmp_asid;
> +
> +	lockdep_assert_held(&arm_smmu_asid_lock);
> +
> +	/*
> +	 * Nothing is translating through an invalid CD, and an update that
> +	 * invalidates one cannot be made hitless anyway.
> +	 */
> +	if (!(cdptr->data[0] & cpu_to_le64(CTXDESC_CD_0_V)) ||
> +	    !(target->data[0] & cpu_to_le64(CTXDESC_CD_0_V)))
> +		goto write_directly;
> +
> +	if (xa_alloc(&arm_smmu_asid_xa, &tmp_asid, XA_ZERO_ENTRY,
> +		     XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL))
> +		goto write_directly;
> +
> +	/* Copy the existing cd entry and update only the ASID. */
> +	stage = *cdptr;
> +	arm_smmu_cd_set_asid(&stage, tmp_asid);
> +	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
> +
> +	/* Copy the target cd entry and update ASID to the temporary ASID. */
> +	stage = *target;
> +	arm_smmu_cd_set_asid(&stage, tmp_asid);
> +	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
> +
> +	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
> +
> +	/* Update to the target cd entry as it should be hitless now. */
> +	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
> +
> +	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
> +	xa_erase(&arm_smmu_asid_xa, tmp_asid);
> +	return;
> +
> +write_directly:
> +	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
> +}
> +
>   void arm_smmu_make_s1_cd(struct arm_smmu_cd *target,
>   			 struct arm_smmu_master *master,
>   			 struct arm_smmu_domain *smmu_domain)
> @@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
>   		struct arm_smmu_cd target_cd;
>   
>   		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
> -		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
> -					&target_cd);
> +		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
> +					  &target_cd);

No, we cannot blindly do this for arbitrary ->attach_dev calls - the 
majority of S1->S1 transitions are going to be moving back and forth 
between the default domain and user domains, where there is zero 
expectation, let alone guarantee, that the translations would be 
equivalent and thus not liable to lead to TLB conflict aborts or 
amalgamation hell.

This needs to be in a dedicated "I know what I'm doing and I fully 
accept the consequences if I get it wrong" call path.

Thanks,
Robin.

>   		arm_smmu_make_cdtable_ste(&target, master, state.ats_enabled,
>   					  STRTAB_STE_1_S1DSS_SSID0);
>   		arm_smmu_install_ste_for_dev(master, &target);

