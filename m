Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72BD1A683C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788482198; cv=none; b=PQ9kbpIy9MMVElGNDhRwvBjNga2hwJKegY5iBFHPOI746vk56d/v00nyRoR75SvNfQOP/J+478w7RFTS9Jx1RG8RD2qEP8CJwypWfyXbojchLnle61hWVTNMlbrn3WbG+PuUy7MfYrKdqgfUWTTpYy+0NFov5axbX53r8MdlwOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788482198; c=relaxed/simple;
	bh=x5LDPsdvbXimywbzcLmSFkCU3DoJpJnex4rJgmAGAVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8iSYTnlf+j9a2rrVjkwrxSTIejXV71bp1C+37aNXnJUHVmuocL/6SA79FNKgcbBBOlavIgEPNxG1Y95wEOrZSREu51c93QRsyvgEMSnY/fxxicJdpiW6E8X289VITCG7UYJssQT5xlO8mA7/Vr/3y8rp0hx0+8uzUVtDGbUypM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZHD3+8HY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=minhbbCV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZHD3+8HY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="minhbbCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788482195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6GMexSWWuoc9Cddr8yMae7nQERhafauV/Q+TnV8uPo=;
	b=ZHD3+8HYAOqVcONtAwigZHibYQ7EZQJrHoVpmAUCOvS3RuyRAZ82FD0J2zgFlQBIWMCvXo
	4603P2X2mOO5eNjQDkM8WTQak4yD0DJ1xNQ4RvJUMP9WJyP1t5DzJEzwxrZS2vnwhsxVBW
	uMTu+ke9y4oOBnkLzabzkrvp6S3Nhtk=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-Nii55jaJMf2Xm9QDrqLvBw-1; Thu, 03 Sep 2026 20:36:33 -0400
X-MC-Unique: Nii55jaJMf2Xm9QDrqLvBw-1
X-Mimecast-MFC-AGG-ID: Nii55jaJMf2Xm9QDrqLvBw_1788482193
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc44d708055so1016779a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788482192; x=1789086992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6GMexSWWuoc9Cddr8yMae7nQERhafauV/Q+TnV8uPo=;
        b=minhbbCV//wngwdOvnvxuFdIDunlp9r0pYUroTUIARqXMSpPEn5IGg/G0zUUfepah6
         /NzyVu7Pa7/FbrVbbAQeuwQ45Q41oDyXRH5UdQXYe3WQL36etmr8aFBdNt5EubXtJj6P
         maqyLQIBCs4/6TTiKVXNvWVTuxvZM1cQ/50EQO9FO2DggZCDwWyEqAqSj7bvz7EOtF3L
         UrUMwG3BPLou4mBFxHYHn8B17U0R38lL6/ZDKJnmQM2SQkHnZd+VqmsCfg3gZxteUwtO
         obbitc6nwnp9nT1DkYlsP2p4/XvBUN4bLd2NlcPVydUSabtlOhuaSGBHHymGGOy2HCRm
         VJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788482192; x=1789086992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6GMexSWWuoc9Cddr8yMae7nQERhafauV/Q+TnV8uPo=;
        b=aFdKRcMhQ2LpRPLw+l4l31Rrzqx+oKyXPV27oud9VqrXIb8qf+TdGrBC2EKOatbiNu
         PrNuzFJOEtcSdGiiYybuMDje7n9I/BcGnzF5ZnfhWcVjFpdUp6rXHbspUsyGd/9htsmY
         a6nOt2qORmJnsPgmuy4oUC1ulz17vuVvHXNNFSC8aoxb+r/8J9U1jg9QvkDFgP1DSuI6
         JRORsIs0VREa+f5tK4lgf6HHS3f9mTWmgmuXn9kh/L3OHFYzec/UqlHVBrPu5ufJEEjp
         vUKz9UK1OxByFfQDCaDPZ7iQUD6j7vMBhEtO9A+H25EFidFJJPsYPeEb/D7dp+yzZFZ/
         g7Ew==
X-Forwarded-Encrypted: i=1; AKwUvBwA2jkwYKPRUHc9hUrj8NSMsBlq3fNIUMfxNR0++vcvPTupvnkVkAzvq9I01UErpK0oQI4DS7QWHVZHBg8=@vger.kernel.org
X-Gm-Message-State: AFuF++kDCJTlqKzcOwmKxl0YOCdR384Peilq8J7bvpxeZoeMa6708a2C
	HtJxzFFm/Jfz01mtEmTE33zTlvuovCaY7ozz/k5qjwPuZBoySFCJ7OczMM6vfFEv1hCDGmmVYTY
	PXSnpZZOcLbN7IAhV3bm22qYjEXIpTW03AZOysJmBpAnQGh73E84ax8Pmhb5fYO3cNA==
X-Gm-Gg: AYBFou077rpySucVj5vJ1tt0YoqV8NtRIkdFKMZfNjXbII/6tWjyHWHOYzxgWcpSxYv
	2EQIkZNByfHuax2wqFFEhsKOgopj41p9gijtAuGzh9E2XxKPl0x0/Yy3mQUsgZl/AIHm8VSLDqU
	9HhZmzSfXclrIHtj1vu/q1XwjakCnlAFCUXZ3MIhnlCxkRQkqTOwXSS9175SNCfWlt6PcWem06m
	HL+i1S3gUj0ndRBCQeEcg3sgJhbLl9GlFnSQf1Ipfgaho4Bxnr26M+bya1VvdunU32vvxiWnTJ7
	b1jKUCB3ZwzXeX6lNgPZy2eneaRxXieuFn8OBXxtTuskNqlhz/aDTipM+0/yyg3VId9let2XwDx
	iCf71McjX7fLqLYjnz9NeyaX+V/NJp+bEIqys3Qb72w==
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr3925687a91.21.1788482192431;
        Thu, 03 Sep 2026 17:36:32 -0700 (PDT)
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr3925599a91.21.1788482191942;
        Thu, 03 Sep 2026 17:36:31 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm2233190eec.22.2026.09.03.17.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 17:36:30 -0700 (PDT)
Message-ID: <a7fb4f62-bc2c-49f9-848f-9f64235f95a1@redhat.com>
Date: Fri, 4 Sep 2026 10:36:19 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] KVM: guest_memfd: Stop returning struct page from
 PFN lookup
To: Ackerley Tng <ackerleytng@google.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
 Yan Zhao <yan.y.zhao@intel.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Vishal Annapurve <vannapurve@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
References: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
 <20260826-gmem-no-return-page-v4-5-3bb9c1ddb4e3@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260826-gmem-no-return-page-v4-5-3bb9c1ddb4e3@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 7:01 PM, Ackerley Tng wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> KVM currently expects guest_memfd PFN lookups to return a refcounted struct
> page, which callers hold across fault handling.
> 
> Drop the page's refcount before returning from kvm_gmem_get_pfn() to
> prepare for the in-place conversions series.
> 
> CoCo shared-to-private conversion handling must inspect folio refcounts to
> ensure exclusive ownership by guest_memfd. A concurrent guest page fault
> taking a temporary reference on the folio causes conversions to fail due to
> an elevated refcount.
> 
> While this refcount is also taken on host userspace page faults, that
> refcount is taken on behalf of the host userspace page tables. This
> refcount will be dropped when conversions unmaps the page. Either way, once
> there's an mmap() or userspace mapping, the pages are open to way more
> refcounts, transient or not. This patch focuses on just dropping refcounts
> before handing KVM a page.
> 
> guest_memfd already notifies KVM of page invalidations, so callers within
> KVM only need to respect the MMU invalidation protocol to safely rely on
> guest_memfd for page presence.
> 
> Since the page refcounts are dropped, don't return the struct page pointer.
> 
> Not returning the struct page from the guest_memfd PFN lookup moves KVM
> closer toward supporting memory backends that are not backed by struct
> page.
> 
> Here are some notes on the cleanup in the callers of kvm_gmem_get_pfn():
> 
> kvm_release_faultin_page() in ARM's gmem_abort() originally also serves to
> set the page dirty and accessed under some conditions. The dirty and
> accessed flags don't matter for guest_memfd anyway, so it is safe to just
> drop the call to kvm_release_faultin_page().
> 
> For ARM's kvm_translate_vncr(), the local page pointer must be initialized
> to NULL so that the shared cleanup path that releases faulted-in pages
> safely no-ops for guest_memfd.
> 
> For x86, no additional changes are required in the MMU fault path because
> the page fault tracking structure is zero-initialized at the start of page
> fault handling, ensuring the refcounted page pointer is already NULL.
> 
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Closes: https://lore.kernel.org/all/anZ4W9o5pTWIEgMY@yzhao56-desk.sh.intel.com/
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Michael Roth <michael.roth@amd.com>
> Tested-by: Michael Roth <michael.roth@amd.com>
> Tested-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>   arch/arm64/kvm/mmu.c     | 4 +---
>   arch/arm64/kvm/nested.c  | 4 ++--
>   arch/x86/kvm/mmu/mmu.c   | 2 +-
>   arch/x86/kvm/svm/sev.c   | 8 ++------
>   include/linux/kvm_host.h | 6 ++----
>   virt/kvm/guest_memfd.c   | 9 ++-------
>   6 files changed, 10 insertions(+), 23 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


