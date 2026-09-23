Received: from mta1.migadu.com (out-231.mta1.migadu.com [95.215.58.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9615F3403E8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162332; cv=none; b=gppaPOT8B005jKasx26Kv9Zch9RJNsRRQCwzM/1QVbqIg3gqIvbLDkbIX0KFBvWB1Pgu3sbdDLP+tYJW9eh5mU3tRgAbP++dYDtNXImWhnkyAlVY0yHNnOac8N6IsAWv5l+tWsxek0vo84qWo9jyhPosZgDPXlfj/GXxvdUCGZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162332; c=relaxed/simple;
	bh=89HG7hn4Kzj5UE8Z7ANkfgcmDmkP7G7K3Oq+gIvcB8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbG+2YRs+AD8hx9p/GyTNJkAbaPqCIjdl4htfxQc9mofzgNy2sgCdrXYkR1y2fASvR2tKeQE2ZlrBDcRPyFnsn62DMLXvLboKjdIrOA8khFucIw4S+kkYa4eFNrBD8iCUB1d452CZCET3QeFZoALjyQsjZL93/J2mtzrU/hdz44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oWFfUyCY; arc=none smtp.client-ip=95.215.58.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oWFfUyCY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=89HG7hn4Kzj5UE8Z7ANkfgcmDmkP7G7K3Oq+gIvcB8g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790162328; v=1; x=1790767128;
 b=oWFfUyCYrxOA2P8XqCb3C5QjOg9G0THTsSe6WqsdSWz0K7K1WngqaqFJ7CFY8u5wVi+adeDV
 Ha00nalK7YCLT8rH6hkdyFuLiPI63jUu0OkP6NIaYGcB2rSxV+zoRrho6izSzdj9NhEhtSYP2AT
 Hwg5Xaw9S0XipeSsK6OneEBI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 51a444d2b8b3a857;
	Wed, 23 Sep 2026 11:18:48 +0000
X-Mizu-Trace-ID: 51a444d2b8b3a857
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso5098e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxL7xIkXNtUQZ1o86UlDHCAyt7KktJJhwRJNNBbht9DFDTisNzRLVaaqcUKDdvq7Slg3vlEJI6rfftYW4A=@vger.kernel.org
X-Gm-Message-State: AFuF++mNQf2/A5rY/e8dxQu3wFWgx604X1zAjvtpOZfV38PQO9WDKA6I
	7U/yBXqVvRSDscPsNyTnzP4/C+T19RMeG9KGHUCKU2H3a/6FoAYm3UoMP2AAyK0cPdvbAX5Xa9z
	XVvKcbw+PR/M0gN0RUvKdAsCbuhf5qV38P2klC9t1
X-Received: by 2002:a05:6512:acd:b0:5b8:d049:c45f with SMTP id
 2adb3069b0e04-5b8d8853d0fmr127952e87.14.1790162326446; Wed, 23 Sep 2026
 04:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org> <20260922-kvm-arm-prefault-v3-10-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-10-787bd3bc7e3f@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 12:18:10 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyCc=T+HkvWv1g2Fg3OxGaa1i8Hdv296ivPc94jQqZq9g@mail.gmail.com>
X-Gm-Features: AcwNN1XC5SLsTqs8zqxJrWyrAoHwz-wo27sOUtBe-7VaIdl2y8EQBRd7i4qQqDs
Message-ID: <CA+EHjTyCc=T+HkvWv1g2Fg3OxGaa1i8Hdv296ivPc94jQqZq9g@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] KVM: arm64: Implement KVM_PRE_FAULT_MEMORY
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 22 Sep 2026 15:18:04 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> +static long __pre_fault_s2(struct kvm_s2_mmu *mmu, struct kvm_vcpu *vcpu,
> +                           gpa_t gpa, struct kvm_memory_slot *memslot, s8 level)
[...]
> +        if (is_gmem)
> +                ret = gmem_abort(&s2fd, &result);
> +        else
> +                ret = user_mem_abort(&s2fd, &result);

When kvm_gmem_get_pfn() fails, gmem_abort() calls
kvm_prepare_memory_fault_exit() before returning, which on this path
writes vcpu->run's exit_reason and memory_fault fields outside
KVM_RUN. If that happens on a vCPU between its KVM_EXIT_MMIO and its
next KVM_RUN, kvm_arch_vcpu_ioctl_run() reads KVM_EXIT_MEMORY_FAULT
instead, skips kvm_handle_mmio_return(), and the guest repeats the
access. Could gmem_abort() skip that exit when result is set?
user_mem_abort() never writes kvm_run.

Cheers,
/fuad
