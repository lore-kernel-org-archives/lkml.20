Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0766B4A7CAC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999676; cv=none; b=kYtMt5+bjp9RPpUuAjkssEY5nrpR+HSJnR12A0sseuTsVLvpyGsRryz5tvbV5VBAzM9bWIcHnyYuzy9VrRUOJyQIqwCpAMaOHZY6ADSh2FGx8c0f3wCbGcsDa4Bni1Ll6PgIyoOIiTuCsQVzRX4sEWctSt65OR/eoOHXbnrld8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999676; c=relaxed/simple;
	bh=xL9CGxkzYt/J3kJ3zE8BdkE7Ib5J15yIahjNrznpznE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KC97FTbzNR9RdZS/ltugXyDDjeCNQxfiKT+LyHcxS7smjnzua+40G4By9p3zL5v5rc8Ay1fm+uOCIxz6Gy51EvvH2gAJ87knP6UvFGKUAWRUdKhZO5tnw7cBxYMyKg7VsyOHEWDP4NuukyJh0rvZEEXTRbpzo7RO9cBu3fR5fIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VOhTs9EY; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VOhTs9EY"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2251607a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999673; x=1790604473; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOYAH6R+ATW22r2VK1upIBbGsmi1bjog4cG/z3wfeFY=;
        b=VOhTs9EYv5RrQD7a7v4qNCPzZC5QdPAZCWf94EqGtSzhkxV5VnPrJg/EboApW7e6cq
         YL4OKfitgmP0DYpw/BYq5fZ21v+F+WcLZMR2MTeibM8QzKqQ3FzzFeGT87sQvXPwNQzm
         EPkzoRcbq40YNkiaoBSTYDERUNjVrEXbCq+53M76aa7P7ePSmGXpVfDueOxProZbuGzv
         3ODscfEwPPiAVImPhYaAaQQRcZUe2A5kchTRN/VoOol5ZP4iC0RVusM0eKyW3C+UrU3p
         4CyhjoDJ6LI+Lr/36PDXa19rVES1UpzNnns2u2jGGCVeuTMMKTQoGBVYcblSjhLyRttN
         4yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999673; x=1790604473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOYAH6R+ATW22r2VK1upIBbGsmi1bjog4cG/z3wfeFY=;
        b=dpAPN7Jb7VAhRj8ioXxl7/6gM5vLCBef1e0nQKvNsn8Vbjb4LM13o0r7AbvPsL4h7K
         DDQCbEa9Z/3Q+XkiPaav37BXX/xaPBKY0Pzq+MI+8W3POmQpc27zgc7AR/zNFBSADvg2
         VWzDnyNeeF022/c0KngjsAZezTzgnJUO5xJtpvsSwnFyCNIReG+FYrCHMYcS45k+pSEc
         GFdrILb6LwX4VzvrjYgD2DaQklSE+PImFHdHbAaxDAvOLZ0AWE0S/CTjNha42AQK91YB
         zYbsuFFMuaSZ/TlsA1n9uzNKPvJN1HxeroMGb29BErxhcilSDp4bbCbcu/W5sgU4jFMs
         MqMw==
X-Forwarded-Encrypted: i=1; AKwUvByP7lCx+VOZBvfdYMiGnda6ZpOP9nYMh7TI9zd/39U76gcA98wH6yvF20JgTRLzEkbJb7SLvBsY1RY9qHY=@vger.kernel.org
X-Gm-Message-State: AFuF++nSTlnyLBETc0fqwqKsEI1SY8YOjFXa+2IhX1/StKO3cQ6c8Q5O
	Sr3Gp4mhaVQfTsRwrR7lxBb8TIa1S4RRZCVilPdBf3dE95hVItJwm6LhtBVEDUyVDvsekEtCrrK
	h9NwNtg==
X-Received: from pgbfu4.prod.google.com ([2002:a05:6a02:4a84:b0:cc5:1d94:8e5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4688:b0:3dd:a196:3094
 with SMTP id adf61e73a8af0-3dda1963396mr11496717637.68.1789999672947; Mon, 21
 Sep 2026 07:07:52 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:44 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999944766.761024.7401957242293009313.b4-ty@google.com>
Subject: Re: [PATCH v2 00/20] KVM: selftests: PPC pre-enabling
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 02 Sep 2026 09:41:03 -0700, Sean Christopherson wrote:
> This is a big pile of cleanups and refactoring to prepare for PPC support in
> KVM selftests.  PPC has paging modes that require multi-page page tables, and
> those page tables need to be naturally aligned.  The original proposal was to
> plumb in an @align param to the page allocators[*], but I didn't love the idea
> of adding another rarely used param to the allocators.
> 
> v2:
>  - Collect tags. [Itaru, Bibo]
>  - Use 0x180000 as the min GPA for page table pages on LoongArch, instead of
>    changing every other arch to use 0x200000. [Sashiko, Bibo]
>  - Opportunistically move the vGIC LPI stress test's global "gpa_base" variable
>    into setup_memslot(). [Sashiko]
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[01/20] KVM: selftests: Use MEM_REGION_PT memslot instead of '0' for s390 regions/segments
        https://github.com/kvm-x86/linux/commit/73ac07325851
[02/20] KVM: selftests: Use the common minimum GPA for page tables on LoongArch
        https://github.com/kvm-x86/linux/commit/9886413e0466
[03/20] KVM: selftests: Use vm_alloc_page_table() to allocate LoongArch page tables
        https://github.com/kvm-x86/linux/commit/befd94805906
[04/20] KVM: selftests: Rename "num" param to "nr_pages" for physical page allocators
        https://github.com/kvm-x86/linux/commit/d220e33516fa
[05/20] KVM: selftests: Use goto instead of do-while to retry finding unused physical pages
        https://github.com/kvm-x86/linux/commit/2c0555c51e7c
[06/20] KVM: selftests: Extend page allocator to support naturally aligned allocations
        https://github.com/kvm-x86/linux/commit/2429ecf7ccd5
[07/20] KVM: selftests: Make the single-page allocator APIs static inline
        https://github.com/kvm-x86/linux/commit/54e83f729385
[08/20] KVM: selftests: Use the innermost page allocator API in the memslot perf test
        https://github.com/kvm-x86/linux/commit/b8d9e6ec747a
[09/20] KVM: selftests: Use the innermost page allocator API in s390's IRQ routing test
        https://github.com/kvm-x86/linux/commit/9c0061d2e7cd
[10/20] KVM: selftests: Add a wrapper API to allocate multiple page table pages
        https://github.com/kvm-x86/linux/commit/7f477ba0878e
[11/20] KVM: selftests: Initialize vm->memslots[] with invalid memslots during creation
        https://github.com/kvm-x86/linux/commit/9e4e2281df12
[12/20] KVM: selftests: Add APIs to override memory region types with custom memslots
        https://github.com/kvm-x86/linux/commit/d69b3e714265
[13/20] KVM: selftests: Add TEST_EXTRA memory region type for "special" memslots
        https://github.com/kvm-x86/linux/commit/9f035aca8765
[14/20] KVM: selftests: Use TEST_EXTRA region in arm64's vGIC LPI stress test
        https://github.com/kvm-x86/linux/commit/5d81014d3868
[15/20] KVM: selftests: Use TEST_EXTRA region in x86's smaller MAXPHYADDR test
        https://github.com/kvm-x86/linux/commit/00c37bfc5b4e
[16/20] KVM: selftests: Use TEST_EXTRA region in set memory region test
        https://github.com/kvm-x86/linux/commit/5ed16822bc45
[17/20] KVM: selftests: Take the memory region type, not memslot, in page allocators
        https://github.com/kvm-x86/linux/commit/36a062568ea8
[18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
        https://github.com/kvm-x86/linux/commit/1856064afc9d
[19/20] KVM: selftests: Automatically pick min_gpa for allocations based on region type
        https://github.com/kvm-x86/linux/commit/6c28a0d7cf12
[20/20] KVM: selftests: Add arch hook to force page tables to be naturally aligned
        https://github.com/kvm-x86/linux/commit/1e59e5a3bdbe

--
https://github.com/kvm-x86/linux/tree/next
