Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B69236453
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609276; cv=none; b=am5qfODvlGV4sxLxdhGSsccYpSGwUe6bsVAa1MTivYiSRsN/Z9ZYWbJWsjbIqx1rJBzIOhFXzCbaFd2DPIgJAdRtgtX3P1uLkH6BSSXHGdcnpLdJQRzSrd+/Q80mLEwu4vUXkhhAAnyJ2zeEmM5TgsXa/g19dBoJp8q6/idoJwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609276; c=relaxed/simple;
	bh=pCZRKaN7b0DZpONbjkmfo6/OIA6Jc9dc5IrybdG4dlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=caURGz41W6T4lrU5nIhwC19xj0EQQPHXuU4TQGQYnBTv7JXGkt0IbPoA7ndFoogzcY90Xy79zsIcpQEW4iHCbjXGMBpytF7XCckZAbTMFbZ1zhYrmNhcJmb/z+GJo1TO29sMrxYz3Kq4lT9Jm7UY/eL5qGmNxziN3xRAcA6SraM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl4s/blK; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl4s/blK"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-38fd9408220so64306a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789609274; x=1790214074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=phs6j4c6GSVsgWqjzCyy6AX6x537GMsS5N7HEcIYNoA=;
        b=kl4s/blKlNDW9286CSER/1sYPh1isl/9ZOGXqbeenmj9p2IszLbyqaABqH0J5t4Cve
         +fG7dlnmGQ/iyTevsOp65VDZBmJ7YwGtvI/wllL6hsR+WsXLqtDLpoA3OIpJWdyxjDiw
         wm38Y3Kp59/i7Ttyn3HKMemJsBDtHyCdwEFUKtEZb7+ohjt//KyyuIJD7dv6R1Dtdb47
         uJxGbBRppynQC9ZU6n+JwC93ImY6kkBQkl120DsprRWHA5mZoarKsrXNfS5DENI7z6WM
         L6D/gnAzY2g0iX4POVWoc06HNYj/Nq2GeijtIdLwwhNszxpP+bHbjDem31jEg2jh3ho+
         ebJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609274; x=1790214074;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phs6j4c6GSVsgWqjzCyy6AX6x537GMsS5N7HEcIYNoA=;
        b=LpuDS4LAh5lHPd6hb1BJp7HrENOajbwOj/t82m4YKOP5K6Mi3Xg8PMHFv6o7WsB4mA
         w3GThT6YGwn8wqhQT2856A4t+qyOEOsLc0RXUEL49lbP+5Q2eWcVRfBk6BlyuiYe9cgp
         DaYlBbqADJ0MNrY5ZV+j3IWkAN9BzEml9I1FgGLZNc/b1379mjmRkyBckBel6LtDjClp
         HoLBPYVDX6rB+kW5X4xG4uuqHPUZsTZbBpaojce/bWlfeI6StBjCmkSEVlPyLVUpAubX
         ZfXBAfrUCXIN4oJdny8nJqBBoJvvZ7LYXSd00vjKzPBISvqOi1eqKGo0C8oWbX3eYCFB
         42Ng==
X-Forwarded-Encrypted: i=1; AKwUvBz/YlZBS20tgnB6WaBLkbDL5DdnY67S2XRN+Hng3tY4iTrcEOCw4xmzDb2Ctt0k1qFBwAH7QH3jDgec7lQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kM9uVm/IqJNxmRWz56pVUjEXp/VUKs4mJlNotWWkYSsn1lN85Z
	YBJP1xSr/pCC/YOPc4JoHOzT6SGws+B7Hppdm2bmDCYEw4pzTxSDeKEy
X-Gm-Gg: AYBFou04wnMZWAz5HgpzdkHz7icYW8RFZzweyxOHU4vZ8UuOoURtGSjGNANOm4mL+II
	cBYiEvGwGcxWxORt0Efo1bWxgf6Va1BXmdw8SZcMWaZTq2bUNBjyN75PHCxMVoReW9h0I5dt+uo
	0/LhSeVeQ7xoc7DVKVlAoOIy/qWfqmzOYcai5mTuMcZ/3wabhN0baQb1kq3adKk6yziV4tPHA0N
	/MF0W3MAFgNJVB7P6QxVE1ktXIw6uyRs9ax4+41gQn/zWUQE1eznudzWRIYXSfG6GiRT4o8Ykyn
	lFdW2UjIhzPLGnCJYWc2KdDCUlQcfPDbFe021iXe75uTZQcSHS9cjKMFqNGwXZaSjd/x5h1Ghis
	Z4zu3G/EB4yZGYtQRS5Ur/IoaDCxoZT8T4c50VgKKI+7OqEESSe3d4dJ1zQz4h6jzytenYBnWXD
	u6hYevM3Wa5Bb8KI3J+HGaBCTOv3k0677LczrXXdUEmNybPu3N9DDUMgAhsqVWZ/HLTU8BnQA0u
	0kSqDUsAHPJfqZXg5D+ilGOhtBO2FxpUH/dntYfbqiPm609gksvIQ==
X-Received: by 2002:a17:90b:3b41:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39e1e48a416mr10022482a91.15.1789609273770;
        Wed, 16 Sep 2026 18:41:13 -0700 (PDT)
Received: from ?IPV6:2409:8900:87c0:1605:195c:9057:4549:3b0b? ([2409:8900:87c0:1605:195c:9057:4549:3b0b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3618ab38sm1949715a91.10.2026.09.16.18.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 18:41:13 -0700 (PDT)
Message-ID: <8530f6cf-3c61-4bd1-871d-b589ef0412bd@gmail.com>
Date: Thu, 17 Sep 2026 09:40:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 00/10] iommu/riscv: Add hardware dirty tracking for
 second-stage domains
To: fangyu.yu@linux.alibaba.com
Cc: guoren@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, baolu.lu@linux.intel.com,
 jroedel@suse.de, zong.li@sifive.com, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, jgg@nvidia.com, jgg@ziepe.ca, kevin.tian@intel.com,
 atish.patra@linux.dev, skhawaja@google.com, vasant.hegde@amd.com,
 joerg.roedel@amd.com, gong.shuai@sanechips.com.cn
References: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/15/2026 11:28 AM, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> The RISC-V IOMMU architecture defines an AMO_HWAD capability (Hardware
> Access/Dirty update) that allows the IOMMU to atomically set the A/D bits
> in second-stage PTEs on DMA access.  When DC.tc.GADE is asserted, the IOMMU
> autonomously sets D on the first write to a page mapped by an iohgatp
> domain.  This series wires that capability up to the iommufd dirty-tracking
> interface (IOMMU_HWPT_SET_DIRTY_TRACKING / IOMMU_HWPT_GET_DIRTY_BITMAP) and
> reports IOMMU_CAP_DIRTY_TRACKING.
> 
> Design notes
> ------------
> 
> * The feature is scoped to second-stage (iohgatp) domains only; these are
>    the domains created for KVM / VFIO device pass-through when userspace
>    allocates an HWPT with IOMMU_HWPT_ALLOC_NEST_PARENT or
>    IOMMU_HWPT_ALLOC_DIRTY_TRACKING.  First-stage (iosatp) domains are not
>    touched by this series.
> 
> * The page-table side plugs into the existing generic_pt dirty hook
>    framework (amdv1 / vtdss style).  RISC-V adds the three required PTE
>    ops – is_write_dirty / make_write_clean / make_write_dirty.
> 
> Testing
> -------
> 
> * Test on QEMU RISC-V, a nvme and an e1000e device was passed through
>    to an L2 guest via vfio-pci + iommufd.
> 
> * generic_pt KUnit: the existing test_dirty case now runs and passes for
>    the RISC-V 64-bit format.
> 
> Follow-up work
> --------------
> * Build a dedicated end-to-end test case that drives the full flow
>    (HWPT_ALLOC with DIRTY_TRACKING -> attach -> IOAS_MAP -> generate real
>    DMA -> SET_DIRTY_TRACKING -> GET_DIRTY_BITMAP -> verify bitmap against
>    expected IOVA footprint) so that the behaviour can be regression-tested
>    beyond the KUnit PTE-level coverage.
> 
> * If possible, rebase and retest on top of the updated "iommu irqbypass"
>    patchset.
> 
> ---
> Changes in v4 (Jason's suggestions):
>      - Rebased the series on top of [1] and [2].
>      - Drop the RISC-V-specific pt_num_items_lg2() top-level special case.
>      - Validate page-table address widths by translation stage: accept only
>        Sv39/Sv48/Sv57 widths for first-stage tables and only Sv39x4/Sv48x4/
>        Sv57x4 widths for second-stage tables.
>      - Replace the aliased first-stage/second-stage MODE union with
>        independent FSC/IOSATP and IOHGATP MODE fields.
>      - Add pt_dirty_supported() to restrict RISC-V generic_pt dirty tracking
>        to second-stage tables.
>      - Link to v3:
>        https://lore.kernel.org/linux-riscv/20260821132749.82070-1-fangyu.yu@linux.alibaba.com/
> Changes in v3 (Andrew Jones's suggestions):
>      - Rebased the series on top of Andrew Jones' generic_pt RISC-V supported
>        feature mask fix, which adds PT_FEAT_RISCV_SVPBMT to the supported feature
>        set.
>      - Added PT_FEAT_RISCV_S2 to the RISC-V generic_pt supported feature mask and
>        KUnit feature matrix.
>      - Kept PT_FEAT_SIGN_EXTEND only for first-stage RISC-V KUnit configs; second
>        stage configs now use PT_FEAT_RISCV_S2 without sign-extension semantics.
>      - Split RISC-V IOMMU capability checks into first-stage FSC and second-stage
>        IOHGATP helpers.
>      - Updated second-stage paging domain setup to use GPA widths 41/50/59 and to
>        avoid PT_FEAT_SIGN_EXTEND.
>      - Link to v2:
>        https://lore.kernel.org/linux-riscv/20260507113706.11400-1-fangyu.yu@linux.alibaba.com/
> Changes in v2 (Jason's suggestions):
>      - Introduced a single PT_FEAT_RISCV_S2: second-stage selection is driven
>        purely by this feature bit.
>      - Switched from dynamic DC.tc.GADE toggling to static pre-enable.
>      - domain_alloc_paging_flags: follow the switch/case design from other
>        drivers.
>      - Drop IOMMU_CAP_DEFERRED_FLUSH in riscv_iommu_capable.
>      - Remove the .hw_info-related patch.
>      - Link to v1:
>        https://lore.kernel.org/linux-riscv/20260428131359.34872-1-fangyu.yu@linux.alibaba.com/
> 
> [1] https://lore.kernel.org/linux-iommu/1-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com/
> [2] https://lore.kernel.org/linux-iommu/20260818092444.42755-1-andrew.jones@oss.qualcomm.com/
> 
> Fangyu Yu (6):
>    iommupt: Add RISC-V Second-stage (iohgatp) page table support
>    iommupt: Add RISC-V dirty tracking PTE ops
>    iommu/riscv: Add domain_alloc_paging_flags for second-stage domain
>    iommu/riscv: Pre-enable GADE for second-stage domainsgon
>    iommu/riscv: Add dirty tracking support for second-stage domains
>    iommu/riscv: Add IOTINVAL.GVMA after updating DDT/PDT entries

Hi Fangyu,

This patch (10/10) is missing from this series.
It was also missing in RFC v3.

Thanks,
Shuai

> 
> Tomasz Jeznach (2):
>    iommu/riscv: report iommu capabilities
>    RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
> 
> Zong Li (2):
>    iommu/riscv: use data structure instead of individual values
>    iommu/riscv: support GSCID and GVMA invalidation command
> 
>   arch/riscv/kvm/Kconfig                       |   2 +
>   drivers/iommu/generic_pt/fmt/iommu_riscv64.c |   2 +-
>   drivers/iommu/generic_pt/fmt/riscv.h         | 158 +++++++++++--
>   drivers/iommu/riscv/iommu-bits.h             |   7 +
>   drivers/iommu/riscv/iommu.c                  | 224 +++++++++++++++----
>   include/linux/generic_pt/common.h            |   4 +
>   include/linux/generic_pt/iommu.h             |  11 +
>   7 files changed, 336 insertions(+), 72 deletions(-)
> 

