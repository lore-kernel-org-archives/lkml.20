Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAA8307AE3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258944; cv=none; b=I3OCsyz56ex1F97WzpCAOb60FZuHsXip0eBX08R5yFLd82nWiY/1/6m3TsotzUkLrPm8TC7+0tyXn+wfUGoqZCXIe5/YJcB98SU2zs89NNjGkbOi3/tRonCD1+kwb8mA+tX7FSRsqWGlt8QEcmYoYMu5DtCiAi+Rek4z3pi32fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258944; c=relaxed/simple;
	bh=MxwPZN7n5B2DE8usWq5PQK1nguduFWWGN/sO04w0Ge0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPkpugDYfCMFdxkL7yfZ57FNJIUWku7EG6td7Ij/tOKi8bJYuNrBMTEitXs3+Kcajrpd16sEhegiMDdbmdXB76NQ9QpGwo1pxKDeos0X9P0Y/D8nN02bDSd91OEcPNVcRiTXflgPjiT4Ke/Td6UHgwikJWi5LK60auiHMjhMSok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ItpGY1Vz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZO7wbO3U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ItpGY1Vz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZO7wbO3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791258942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uYC8oY+LrXwAaiDtJ55Vw+0AspCCI39rFIw270qLm/8=;
	b=ItpGY1Vzh3m+9D2TsrsAQklOt4olWR921sfqkz2Uds4Jp8VW7oJdMzSCEtTDGTSb8Bs1t6
	Rs8wTvPZwxyRkUs8f2j84KgZOLE4hx1XtMPaQvPjvK7YmRd9oaMX3rcxRAcYRwWWHNE7BS
	ynr459bGXaoXLNNaiB1QEyIC+6+XawE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-F68hgQ_qNx6-gK1r1-NclQ-1; Mon, 05 Oct 2026 23:55:41 -0400
X-MC-Unique: F68hgQ_qNx6-gK1r1-NclQ-1
X-Mimecast-MFC-AGG-ID: F68hgQ_qNx6-gK1r1-NclQ_1791258940
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so680104a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791258940; x=1791863740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYC8oY+LrXwAaiDtJ55Vw+0AspCCI39rFIw270qLm/8=;
        b=ZO7wbO3UX7UeElbGdBRU38WvnpdUTc1aSctU/6r+anKijEd0W5VNxKdlO3WGqVM918
         b/9M3EFrRw0dT8YbqogZnWuxTuLxbTRb+IZU+H/dfy0hsoqcU3GrnCu5/3DyvJapSTDy
         0zEnqbWruC84cLrsqzdBrGApolr8A1abkLRuP3fX0ZY5XPKbVzOJRSdKb7GyCAedU/32
         +9FrMGWV7IRCy8bK+rJ7m4rAh5z0mLzMSzmfxGYsoFXi8gWpBjmFm4BO/35eAmtHdyo8
         rzowL+kBYJvPc2PmFQPfA9HlkK6WsxqpGJ1nOQhA71nXInBEnTdwAbrRJ1JC/XZ5sGJD
         Sd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791258940; x=1791863740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYC8oY+LrXwAaiDtJ55Vw+0AspCCI39rFIw270qLm/8=;
        b=1/4/+mMj6NbBGiLxuhF2xd3Y3Hugthy+up8mxeN2jIoKSTMX3+0qQt3kikNzygOzQm
         ayptqeqj1Z84bwn6bXqTLI71C5viZg2WEiTCGKwwxY6G6Oa6Durl2m11c50fBkJltmSp
         sNVYlYD3Q9yl/Vao4mlXupHTno7Zj34oiQcMaKq0yc4RAW7fYlJ4BH+Z65nlH55DQ94v
         lD352rQiNaHmcsCjRiCkhgQGiyFsI0ALimX2w84AFp9YJNjE21jJ8GZualzYDsRhf62D
         cQCPs5tQ+droLG2NCM3zWZpB90BPwFnGX/6+I3tOl2wVzVlz1nYQyjtjyTsl+o6dsGbT
         BUfA==
X-Forwarded-Encrypted: i=1; AKwUvBznvD0ybj2E+gQ9v/WEc23rGulBMRBbe4bJcgXJSIXh66BpubDjMZhFgansJkVD5TqsVOqnTQBqlJKTYyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy3qMOh00YAYTzoJMYyl7GXm5+JEdxidL4oU4Upx/oEwoNGBwK
	RtIko+ESWkdfXFH8fH3Dfc+ybzrqy4xHPuEyVDJEI1zZyJujhs2Ko+BFaLSWmae28FsUAzlOPKw
	6eqwJDh3u/a8Qb313MpKQMrvMeOb0Ei3BB75VnCheqwUCveOvi4Bp7FM+YPcOJNg6RQ==
X-Gm-Gg: AYBFou0Y9Z5GjuOetuENMMcpOCKng6xameZpQl7HOy82YGN/lomJzEgw4NGfPB0DBK8
	MKsOmwJGiaU7u1xYzvc8/uyBclOpxmk5itxstso95UC++PqxcIYt0IyZs/TkaZSfSQvm9D2uPk8
	q+IwIOEgqw6WV5cdpjWNlxLrqxRvai3WMVoxmabGAsght4v9qE0ysQivJpc+sa0v9tBZHDaf8mB
	hDOxW7ioWJa+gkxmQo3A/44cfbuwoDLffldUqTp9G1f75EE+CQzJ1EyWvsmsu8mONdE/M8X+gfL
	39xuSeFFIMSinklg0kGfhQyQvLvN2oiM2V8TZCW3ouaStBHscltbZKsSL4Tm5zs0RTaWOIckveR
	lBSwYkCd/fcVGCvB6/bAaIvw3ceXyYC4eev1jAqhGeA==
X-Received: by 2002:a17:90b:4d84:b0:3a7:ef4:74ba with SMTP id 98e67ed59e1d1-3a8546a64dfmr1230256a91.55.1791258939699;
        Mon, 05 Oct 2026 20:55:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4d84:b0:3a7:ef4:74ba with SMTP id 98e67ed59e1d1-3a8546a64dfmr1230238a91.55.1791258939230;
        Mon, 05 Oct 2026 20:55:39 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6e2b012esm1790452a12.29.2026.10.05.20.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:55:38 -0700 (PDT)
Message-ID: <e7b6a49c-f9ba-410d-b7b6-55c01d1c5015@redhat.com>
Date: Tue, 6 Oct 2026 13:55:28 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-6-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-6-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> KVM arm64 has different types of VMs with all the different modes in which
> the hypervisor code can be run. e.g., VHE, nVHE, pKVM etc. Then there is
> protected VM and normal VMs with pKVM. We might soon add other types,
> e.g., Arm CCA Realm. So in an effort to make the handling of these
> different types of VMs a bit more friendly to the eyes, add a VM flavor to
> the kvm_arch and we could then add handlers for different operations based
> on the VM type.
> 
> Keep the flavor initialisation at the beginning to allow for the detection
> early enough and fail out on any unsupported requests.
> 
> With that, add wrappers for checking the "type" of a VM and replace the
> existing users with the new wrappers.
> 
> Given we already have the construct of "kvm_vm_is_protected" in the core
> KVM code, use that for all confidential compute guests including Realms
> that we are about to add. Adds __VM_PROTECTED marker vm flavor to draw the
> boundary for "protected VMs". In later patches, we would add Realm VMs,
>   which would also be classified as protected.
> 
> Add a explicit helper to detect if a given VM is a "protected" VM under pKVM.
> Change the existing users that precisely want to check the VM type. These
> include :
>    - kvm_arch_prepare_memory_region - For preventing memslot changes after
>      pVM creation.
> 
> All the others are retained as a wider check for confidential guest VMs.
> These are:
>   - kvm_vm_ioctl_set_counter_offset - For disallowing timer offset
>     configuration
>   - io_mem_abort for dabt handling without valid syndrome information
> 
> Both of which are true for Realms too.
> 
> Realms support is restricted to VHE host and thus "kvm_vm_is_protected()"
> checks in the pkvm hyp specific code doesn't need to change, as the only
> protected guests it deals with is "protected pKVM" guests. To tighten this
> init_pkvm_hyp_vm() restricts the hyp copy of the vm_flavor to the ones it
> supports.
> 
> vcpu_is_protected() usage from nVHE hyp code is tricky, as we need to
> convert the vcpu->kvm to the HYP VA before checking the flavor. This
> involves kern_hyp_va() usage in asm/kvm_host.h. To avoid build breaks,
> include asm/kvm_mmu.h to arm64/kvm/mmio.c.
> 
> While at it move the psci_version around to keep the structure packed.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Drop kern_hyp_va() and restrict nvhe code to always use vcpu_is_protected_pkvm()
>   - Drop kvm_vm_is_unprotected_pkvm() and open code the check
>   - Move psci_version field in kvm_arch around to keep the structure packed
> ---
>   arch/arm64/include/asm/kvm_host.h      | 42 +++++++++++++++++++++++---
>   arch/arm64/include/asm/kvm_pkvm.h      |  4 +--
>   arch/arm64/kvm/arm.c                   | 33 ++++++++++++++++----
>   arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 +-
>   arch/arm64/kvm/hyp/nvhe/pkvm.c         |  6 +++-
>   arch/arm64/kvm/hyp/nvhe/switch.c       |  4 +--
>   arch/arm64/kvm/hyp/nvhe/timer-sr.c     |  2 +-
>   arch/arm64/kvm/mmio.c                  |  1 +
>   arch/arm64/kvm/mmu.c                   |  2 +-
>   arch/arm64/kvm/pkvm.c                  |  6 ++--
>   10 files changed, 79 insertions(+), 23 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

