Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AED3A8755
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646427; cv=none; b=qw1KaOibQAMnHmS7mD4yp3G/F7mYvHbLzgQtcs0RtjyjeBFgK/EQ+7oDEKiHIN1ZC5tif0m5+/MYT9RBRRrfQR8lOKXEWag1Op940sKLO64K1Tmhf1R3xBgqT5dvareI+BM/ZA/DVcIKT5tUG8RuHV4W1zfZEFml7ZY2VcEivuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646427; c=relaxed/simple;
	bh=1Q+7jEa9BSz60lWJHvLNDWD6zcWHlYFWTg8yp+VGCIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYp+jjOQLRxh40o52HYHRq17jahFbth2YuyfOp0T5zVTwpD9lCJ0vtu6CU7ntPXQQUqDIRWlhNP5NDYCpzikP5NeWfKu6tk6TV5giyvq02CT9Jyd7gtPTwl7lK9jqFly9rLXlS10HcLPVoR6alFZPmJdEWzEooQ2P+Q4VeQMjrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTQUk22M; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTQUk22M"
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ab1a154579so198115a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791646425; x=1792251225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wozdN+r/GgwZxNj7OpCytBKWiEzKlAUU4sPZrHIAwLY=;
        b=LTQUk22MjnjQGtMf4xrTK+p+Hug/qCTl6z2cCAjaswU57uuEy6EP/wnrwj5mJ1Km3k
         /17Mb3UOhBydA7QOch/g4tajzs/dqdTKzj9Ks/Yzx4vgueAI/T2cuUQH0U1Tb2RCcabS
         lPAzftu6XsRSMf0Ec2TWaKBj+JDD/QNlXtVVj5boUTyN3IGCA+qdJBW8UlyCLlyZJNrH
         /r9bCXoFIePh22gxyfYEdwJA3zngcqPiRjF+00z/6qxdJ0MtkqKNn5BOR16ElK927rpD
         O6DbhZRUitexDnmIwE9Y2YQyHyUhjt32eghzY8Rl/nS8y1WCtWRjgLb0HUoDpQhOW0HS
         2D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791646425; x=1792251225;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wozdN+r/GgwZxNj7OpCytBKWiEzKlAUU4sPZrHIAwLY=;
        b=RGkfLlSTsJNTRVaa0PfXprEw6SIF6NIkgCuR0wt44qDNeBQLXgULB9sF+nwbiX1Jy7
         cUldkfmd+bvZCQa7BC6Htna6dJbyHrBWdkFe4zBWAmEIvU8fc/j23UZ8rZvIX1eS0FLL
         RScgbqq9yjwW0vInD4uk86o24bdnVJ2hTUfI8l5t/rtpcJ4vCL99n+45wvnUqS9nehI1
         aTyWcpxfGmK9u2NzNHXmCeHBMY7icCLeg0sI805qnAXKw19R/Hv3RJEmiOh7HcDudOmB
         jBIg1HdSNyyYknfoXZiWAZ214AERzKuysnnKiOthftTfwIQVZEm+RksYRPREVHPvSGgm
         ePQA==
X-Forwarded-Encrypted: i=1; AKwUvBw1A68tmqJNCKbuc7opMhLFwq1uu0BMGiac7nkL/DEaOEBi+flNy47kWzdC3mu307d7kqroSAIEg8zlK/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzVF6BVOMWiF1OM2T6kH2RpYpk7nndatT/dTrzgVDHTgTFCUP2
	W3rGitWx5sb0Lg1C0ngf73Mvnwm/EdA6m2uoBcYoMCqWYBnwz+kHz2t6
X-Gm-Gg: AYBFou0uJIk8bWDutrAmqIWkyVYik1UQ0RS/kZvdYscr6mWNAUyHNisnK+MOn4/sloo
	fzH+wADB9v8He6uD/CPrLpZdqYEIsruqkvO9zhAzqjUj/1O5j4DjKmo/LKC+yFkU6Q9PAAcuFya
	aRd/9ZnDBWi0gW7DFRAP5D79+VvHIz0SWuiXKACNcF37ZOvTcOb3gNJhbeXZwYhOIFh9puHkhFn
	7be558+3g+gChj3qHFzarkHtPzizNAsuiwy4yPsD3Unm91HGbnXtL44rDqpzxA4YS+p3dclbje4
	SnK0mG0DMh4vM653SyJ2tl0vGjuJ3d9JHTQh023dPWvdaLq2//PwxJz5T5lPdI+PfYf6tobmoWm
	RnslvEG7cgh3sRLAnK6yqd47R4l0mue3KWs69+KgD4JIMAsXxzPw6vKOHwF1+QlWCl7SbwStTVe
	IrMKEMNt6h68ZMbAQl8j1ZarzPhWkNZwKLI6vEQ9ya6tknDvubm9fNBtaLnU35qntNJdrrBjTu4
	EFzYM1mGv93sWa3L1A=
X-Received: by 2002:a17:90b:3b48:b0:3ab:22b5:3bdd with SMTP id 98e67ed59e1d1-3ab3ae77cecmr4773108a91.45.1791646424758;
        Sat, 10 Oct 2026 08:33:44 -0700 (PDT)
Received: from [192.168.50.100] ([111.199.56.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab338676besm4966303a91.1.2026.10.10.08.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 08:33:44 -0700 (PDT)
Message-ID: <1f9158d3-fb05-4100-9e7b-9519a62d089d@gmail.com>
Date: Sat, 10 Oct 2026 23:33:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] iommu/riscv: Add guest IMSIC GPA mapping helpers
To: fangyu.yu@linux.alibaba.com, gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
 guoren@kernel.org, iommu@lists.linux.dev, jgg@nvidia.com, jgg@ziepe.ca,
 joro@8bytes.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
 tomasz.jeznach@linux.dev, will@kernel.org, zong.li@sifive.com
References: <202610090853.6998rsRH081065@mse-db.zte.com.cn>
 <20261010111837.15424-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20261010111837.15424-1-fangyu.yu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fangyu,

On 10/10/2026 7:18 PM, fangyu.yu@linux.alibaba.com wrote:
>>Hi Fangyu,
>>
>>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>>
>>> IOMMU implementations without the MSI_FLAT capability translate MSI
>>> writes through the second-stage page table, so IRQ forwarding on them
>>> will need guest IMSIC pages mapped into the second-stage domain.
>>>
>>> Add an xarray to the MSI table that tracks the HPA installed for each
>>> mapped guest IMSIC GPA, and two helpers for use with the MSI table lock
>>> held: riscv_iommu_msi_table_map_gpa() installs the initial 4 KiB
>>> mapping, and riscv_iommu_msi_table_replace_gpa_leaf() atomically swaps
>>> the leaf PTE's PFN when a vCPU's VS-file host page moves, rejecting
>>> leaves that do not map the expected old HPA.
>>>
>>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>> ---
>>>  drivers/iommu/riscv/iommu.c | 94 +++++++++++++++++++++++++++++++++++++
>>>  drivers/iommu/riscv/iommu.h | 12 +++++
>>>  2 files changed, 106 insertions(+)
>>>
>>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>>> index e2e77469ea3c..48fc57d6409c 100644
>>> --- a/drivers/iommu/riscv/iommu.c
>>> +++ b/drivers/iommu/riscv/iommu.c
>>> @@ -24,6 +24,7 @@
>>>  #include <linux/moduleparam.h>
>>>  #include <linux/mutex.h>
>>>  #include <linux/pci.h>
>>> +#include <linux/pgtable.h>
>>>  #include <linux/generic_pt/iommu.h>
>>>
>>>  #include "../dma-iommu.h"
>>> @@ -1217,6 +1218,92 @@ void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table)
>>>  	riscv_iommu_iotlb_inval(domain, &gather);
>>>  }
>>>
>>> +int riscv_iommu_msi_table_map_gpa(struct riscv_iommu_msi_table *msi_table,
>>> +				  dma_addr_t gpa, phys_addr_t hpa)
>>> +{
>>> +	struct riscv_iommu_domain *domain =
>>> +		container_of(msi_table, struct riscv_iommu_domain, msi_table);
>>> +	const int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
>>> +
>>> +	/* Guest IMSIC GPA mapping only exists in second-stage translations. */
>>> +	if (!domain->gscid)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	return iommu_map(&domain->domain, gpa, hpa, IMSIC_MMIO_PAGE_SZ, prot,
>>> +			 GFP_ATOMIC);
>>> +}
>>> +
>>> +int riscv_iommu_msi_table_replace_gpa_leaf(struct riscv_iommu_msi_table *msi_table,
>>> +					   dma_addr_t gpa, phys_addr_t old_hpa,
>>> +					   phys_addr_t new_hpa)
>>
>>
>>This might fit better inside generic_pt rather than in the driver,
>>since it walks the page tables on its own and duplicates things
>>the library already owns, like the per-level index widths, the
>>x4 root size, and the PTE layout.
>>
>>I recently tried something very similar, and doing this inside
>>generic_pt turned out to be quite feasible (only a quick experiment,
>>not cleaned up for posting).
>>
> 
> Hi Shuai,
> 
> Thanks for the review. I agree the driver shouldn't carry format
> knowledge that belongs to the library, but I think this particular
> operation doesn't fit generic_pt.
> 
> This is not a generic page-table operation. It is a special
> requirement of RISC-V IOMMU IRQ forwarding (irqbypass) on
> implementations without an MSI page table: the guest IMSIC GPA
> must be mapped into the second-stage domain, and when a vCPU's
> VS-file host page migrates, its leaf must be replaced atomically.

To be clear, I also meant updating the leaf in place,
not unmap + map.

> Because a device may write an MSI at any moment, unmap + map
> would fault. This operation is driven by the IRQ forwarding
> state machine, and because I don't see another generic_pt format
> sharing this flow, I think these helpers would be better placed
> outside generic_pt. I plan to move them into iommu-ir.c so the
> feature-scoped code stays together.

I'm fine with keeping it out of generic_pt. Respect your design.

Thanks,
Shuai

> 
> Thanks,
> Fangyu
> 
>>Thanks,
>>Shuai

