Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722826;
	b=mv6xhyW3vuhsrBKVl6DzTltmL435BFSCy/CmN1Cu4VckVkkIibRtE4WtzvVmZCvVkpin
	 UxaPcTLsdKebt3C1YM+N2Qn5tXdfLaBz/puEeRUivFQ2idXD/nZkmEAxoOYgyC2ypLmDU
	 SHYWy4fCMeE4dwHjXrVH3GI0VH1k4MdRlV2Z0d3tr0lvSZN81uZUpaZ3YmN6/GIQEr2UA
	 /Gklx720wI90Hyy81OmgTI6OuoHCb+phRRv/eb2ZGu9sbllfHPx5UHtcY2L7KkGjjTzva
	 HKQpzs+Zo2I6gB2koqvjyZLMQ1xbiee+qWDEjnW/9ZBIAKj7UOW3ahJHyHVMqH68WUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722826;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=hWrA8NhtxzstAUEu/T8XI9QJuMJO8OlRPrMrAUmaBE0=;
	b=3F4PBeLpkw6tpYJgHzGqC6JpxCgQM9KZSnBTOs76N+FRx1ISjL8mBHjB2z/zDknVDx38
	 oqYnuf1FGQmVHyHOErqys0s9xeOzLfa9b2jsjSURdM3hhxljlgXYuzIYcroMrXoEsiVF0
	 g6yloWsEDRCuqzTif3oq4UzytWMhlLkGYDwxNY8iwB8ZUVUrqvAA7zhwW3Z7nP/0oBkJU
	 +UWK3xc+oLsbC8Ef76GlMWPZdP3VD+vD0QzD8ClgssFnQN00JO7I3sNk0cKOZBuhyTBJx
	 tqi/rdXlbBeyXP8zZZt7bWR1KXOTqjg0daV3pDsnP5RMnPklMVGh+3zO97LGVAw8vmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e5Td77DV;
	arc=none smtp.remote-ip=91.218.175.84
Received: from mta0.migadu.com (out-84.mta0.migadu.com [91.218.175.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390B6606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390B6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e5Td77DV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5E02A5wHBmpYnX5KdvdmDO0B3Uy/0sGJV6ZUwMIlvIE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793722823; v=1; x=1794327623;
 b=e5Td77DVkqmMvBqXKsgX4DIN4I+CNT7Ta/R9qOHAyKdgJ6Amu4LDRw6Az1ZutcXkdX30iGqn
 k11PZXjcLBqGf1K7qnZMSDcF7srNlHe2LHWUAIzh7FviXurgCk09mLb549AMtMeQtcevH1+A3wQ
 2DrplhOf3J1dWv5dFQAZH/0s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2f481ca3731aa5df;
	Tue, 03 Nov 2026 16:20:20 +0000
X-Mizu-Trace-ID: 2f481ca3731aa5df
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so6888e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:20:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzT4ug9UVr9Dc+1jUP2Tk4pzNmuQyV9VKau/pd4onSHtCbt7KBlSPcxPR697UUqu6X6Au/vmdkqCHjqQAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xJI5ZX3X3X05lYX1Gdi+POUqRXija6lJg03GDQONTEyiLdxNQ
	AdqJvKIwpJHYjCRzp5VdOWvpErqxJI3N0GpI86qZqV8PqHcVeDEI1Asklen9Z414QB8fXNWJPfH
	NTMY3se1QMd8w7v57LFykSxHQZmB7dbQX5oq+FuTP
X-Received: by 2002:a05:6512:1087:b0:5bf:c0d0:8fff with SMTP id
 2adb3069b0e04-5bff0efda80mr116496e87.11.1793722814476; Tue, 03 Nov 2026
 08:20:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-3-fuad.tabba@linux.dev> <9841ba98-7f07-4d5d-8397-a07e22ba7f51@arm.com>
In-Reply-To: <9841ba98-7f07-4d5d-8397-a07e22ba7f51@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 16:19:38 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxWA2o7RkZw_17QMfYjXYN2dW-X6Rmj95YN1iYBvBzrCg@mail.gmail.com>
X-Gm-Features: AclHuK-ekQu6wnuQHHw6haPOsqIeceQhl_GCt9dfFhk4lQ1KKTD7xUnwcbQL5cQ
Message-ID: <CA+EHjTxWA2o7RkZw_17QMfYjXYN2dW-X6Rmj95YN1iYBvBzrCg@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Skip empty IPA ranges when destroying
 stage-2 page-tables
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Tue, 03 Nov 2026 10:27:54 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> > After destroying each chunk, look up the entry at its start and, if it
> > is empty and larger than a chunk, skip its whole range. The lookup reads
>
> Could we not lookup first before we destroy, that way we can avoid
> destroy walks ?

I'd rather keep it after the walk. Looking first relies on no empty
table being left linked above KVM_PGTABLE_MIN_BLOCK_LEVEL: the lookup
would return one of its empty entries, and the loop would skip past
the table without freeing it.

I don't think anything leaves such a table behind today, but looking
after the walk doesn't depend on that, since the walk frees every
empty table it passes through. That's one extra walk per empty region.
I'll add to the comment why the lookup comes after the walk.

[...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> > @@ -1010,9 +1010,20 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
[...]
> >                   next = stage2_range_addr_end(addr, end);
> > -                KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
> > -                                                             next - addr);
> > +                kvm_pgtable_stage2_destroy_range(pgt, addr, next - addr);
>
> minor nit: Given the kvm_pgtable_stage2_destroy_range() is the only
> called from here, and this caller would benefit from the walk
> information, would it make sense to return a hint back ? Not sure how
> much of that is possible. We do this in the RMM, always return a hint
> of the next possible address. Of course this is not that expensive
> as the CCA case and could be dealt in a separate series.

kvm_pgtable_stage2_destroy_range() is also called by
kvm_pgtable_stage2_destroy(), which EL2 uses to free a pKVM guest's
stage-2, so I'd rather not change it in a fix.

Cheers,
/fuad
