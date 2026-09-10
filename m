Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE19447127D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039532; cv=none; b=i1oNieZ34j43Z8hpemmn6IR970KEEC0jmmjk9YWTiQquNtmxfJD4uflaEDhQB2chqzYbx4qNcaYpQStubwRH620Hg48GMt+HZKXxVxwwKF0/rLFXvJhPr6U9gWNG8wsr9ZTFcVw5HMPtgerfbuSg0sA9afk8xkO8VBOOBShYZzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039532; c=relaxed/simple;
	bh=DzaaWZMUxb/8rJWyFS7HLbxklJPbE9+saYd1xLzHX/Q=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=t6qrxCUVivwvc00mgyMEz1Z22BcXhElOBF7C9ULs1nBt06fUTDJBkIs4uD+Sa+aXBXYBN/y03oANLCYb9ApF9zMVYt4hGJKbAfBqYdX178chb6LO5W5S8VVnTZAUniJ9GxbeZ84Nr9R7tuMftQKgv3mLhfGgCJfs3Brw3SvW2lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eing4fk5; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eing4fk5"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b28df1f600so5353311b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039529; x=1789644329; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rKoYJ3dn9mRGunMRInGIver5jTSz1tQREqhFgol67GU=;
        b=eing4fk5KAONTKTXzzEKrsaDMKcjaYa/LOqpRPovIhpZIOEVvEvOZvPmmHP9rNPxP2
         nQKutm/P09DrB4/mXDb8SwjEdQ12mTmGbimWt33D8m5epLlzX3x9+yWdETdD6zFf15e+
         KPHIb1n3bgEGAhG5oOE/+lp0V4uAHdPfEzTGZqBDwFuf09mY+usTdwrKSMEe/hOipvE5
         FX6WkGQyA/FjeIqXgRfEDbvk4S0eNDjy0se1c72KDyWA7IhJAlCR2j2eXHMfjCwklx2b
         C1tHQS3gnYcbfnVfMh8NxaKHxHs6RpAVoVa2LQRPnq3v+8xNE2bJYNb31d7pyODgeeVB
         N92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039529; x=1789644329;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKoYJ3dn9mRGunMRInGIver5jTSz1tQREqhFgol67GU=;
        b=s16Kqy+4RQNbl4I5hYVSF61WupSuof0xk7Hvb1Z/Et7EmI2uVGzJgTQugeJ8sCrWPk
         PbXCguniH7wFskkXDWhsDL6QPn8h3Eg0g9JpsXHyhocD+Xlk1E5LzVu3/IvEOjf7OglQ
         xfCL4xddXsfjyMN0UPgadRvd3odPmgR73nQT+wHb3fnmnCEggkhKAEDSYMdZU37ORM7x
         GQ8wYiwelhg/YEAQfZe3kx18op5lwjsufpzNTim+la58roo6eXnjJ2pG6nCUjPoio9iy
         O16eVlfAhQjr2tukPZkY9TWsUA3obHxiQPL0FS8geGt/XX71Bcjs2fu+vjEhjj0Hdc3+
         lIWA==
X-Forwarded-Encrypted: i=1; AKwUvBxzAMWY6DnPENQcmn2hxH7dN9cPmB96dABexP96VGLS+Ex1Fh8pO3bETVQHQqA0TFixlj0SOpP0jY1ZjBk=@vger.kernel.org
X-Gm-Message-State: AFuF++n4SXwOI2uT6z0BeM1GQ2TWfrDctjWz+TqXl+pI3HOEeoaEESqK
	HAVd6KWpKlibAIRZKeEUUyFz1UdL60Yu18KZMoNHlAn/4+unRjNtKYvm
X-Gm-Gg: AYBFou29hrTHOZAomnuOd5nEdrPFhynjIjGQnzxaDZj8l0QnpS6Im5h/bLh6vY2TIfW
	f3+FlUhZyLvS8BBkPh2XgbL9/JyQzqja73h6RbeCMb2puaSZApEFX+pyb933759pXPnnacUQ5N/
	EjijXax1KXN71cpr7q4PU0dKABL8Tgrw0bGxwqKmhtI2TfMxz0obhGvlPlmMJaSFCWGc+lGlXky
	ZYiL2lq1kZkVzGkxyn7h+ZUpMXNfJ1WwBOiP42MokLl1/hvDxxucp/Ea8c5TmF1lOcdRXE4I1gR
	gwLUef7solBgeX0MVYeBf+EQto9lU7QAxAEVmYsPkGL+8fz8BRo1BSlCjg6zrVPJiWoB3j2ToVW
	jfNTmMotgUgFg4RjykJyGXXXjL+jmTw7k0tBaj8e5u5yzRR87yUHro0TR38h9Cm0jkqP72xLF4N
	oUNI/edR//tUKxeKg0vK/ED3W7PXJp/8wj/3ylR0P6kgafucsdyqUAu02+p0vvJPEgOfImWoakt
	HXOngGV51DHODrAFQ/KKvXc4XjuQ8CU/QsIj/oByX7n1DKaEEKJgbM=
X-Received: by 2002:a05:6808:bca:b0:4b9:e6ab:d086 with SMTP id 5614622812f47-4b9e6abd362mr23531944b6e.38.1789039529448;
        Thu, 10 Sep 2026 04:25:29 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1435c2ae6b5sm6444309c88.1.2026.09.10.04.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:25:28 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 12/20] KVM: selftests: Add APIs to override memory region types with custom memslots
In-Reply-To: <20260902164123.2546762-13-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:48:26 +0530
Message-ID: <5x0d1hj1.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-13-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Sean Christopherson <seanjc@google.com> writes:

> Add and use APIs to override memory region types instead of open coding the
> logic in tests, partly to dedup test code, but mostly to add some amount of
> protection against conflicting overrides.  This will allow converting more
> tests to override memory regions without taking on too much risk of bugs in
> the long term, e.g. due to silently overriding a region multiple times.
>
> Deliberately "unroll" the loops in __vm_create() and the CMMA test's
> create_main_memslot() to avoid filling all memslots in anticipation of
> adding an "extra" memslot that is for test use and *only* test use, i.e.
> shouldn't be configured by core library code.
>
> Converting tests to overriding memory regions will allow taking the region
> type instead of the raw memslot in the physical page allocator APIs.
>

May I suggest few changes in the naming of these APIs:

static inline void vm_override_mem_region(struct kvm_vm *vm,
					      enum kvm_mem_region_type type,
					      u32 slot)
{
	TEST_ASSERT(vm->memslots[type] == KVM_INVALID_MEMSLOT,
		    "Memory region type '%u' was already overridden with slot=%u",
		    type, vm->memslots[type]);

	vm->memslots[type] = slot;
}

static inline void vm_override_add_mem_region_flags(struct kvm_vm *vm,
					    enum kvm_mem_region_type type,
					    enum vm_mem_backing_src_type src_type,
					    gpa_t gpa, u32 slot, u64 npages,
					    u32 flags)
{
	vm_override_mem_region(vm, type, slot);
	vm_userspace_mem_region_add(vm, src_type, gpa, slot, npages, flags);
}

static inline void vm_override_add_mem_region(struct kvm_vm *vm,
					  enum kvm_mem_region_type type,
					  enum vm_mem_backing_src_type src_type,
					  gpa_t gpa, u32 slot, u64 npages)
{
	vm_override_add_mem_region_flags(vm, type, src_type, gpa, slot, npages, 0);
}

Those "_add_" and "_flags" in the function names easily gives away
the difference in the APIs, rather than differentiating via "__".

However, logically the change looks good - so feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

