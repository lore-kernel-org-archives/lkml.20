Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD1440642
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038461; cv=none; b=JylLzY4Oxt1XDilUkV1s3SdmeLC/b6OfzESiZFU1UwfsBCkU6pDlnoz9yAPsYmwbm2xoMO9LMwoibLYtAQ9yne0rXLIrHhrS6DxibxtWxsnNh5yvLbStnctuYkEriAEa+F6mnalZt/n+aDoXSLjNVzHZFhcWoqYSp9SVsoSiLmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038461; c=relaxed/simple;
	bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=cQumcMWko5afgGdHqkF90woYuV8vD5citct0ASyTFgmeziq6zg9couXUu6NVth7w4P3XptPopM7N+2a/0GZdg5MlG9Irmg3gqZfBLAFQpyhwFq1QJBLPb2xnYWLrUXr1phAmqn6i0TY4aRWHqEHJtB7Is5zU4L9ZOpYuccrUw1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiAiQghj; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiAiQghj"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so116218a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038458; x=1789643258; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
        b=YiAiQghjnVg7/KimUoFcaq9gk2O1+1IQL3xU0x8a+1GW8VHsy3zEu2Y+fr3bIVsY0R
         VR0akzR+ap5J0/xdKXsa6BSYMm6ve4Ot5SnQV3f6VBgFPEh4fj7Yr+qt/9Ww7i4bZebd
         KYS/6sv/o5U2NdzIzvkiy72MMM424E1Pdb1rIbdlEn9Jveup6ER6pRNy48tC50rW6I+P
         ryzJ5YtS1VRFjno0WHBtJyaMntqG7T8wUpofAbRJ46B8gf1Cv5kVgv5SdCKmDud6hTsa
         6xz7QMpeob2xJKOqUFYNRTQgtIE8KyB2MOs9jS8cBpwY2no5ve+aGKfywKhnygpg3ZFX
         eNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038458; x=1789643258;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
        b=LiqtdOyB3Q05ZDj2/R9HBlZwl277V0CNrL1ZZLSoUSatWg8EEHqniP7nW6p2hDa4Gd
         web21lDtqTA4I/RltfdUU4r9WnTuupcObFdCxxwQS6QwOywX7j/OBq5ib4wRxW0wpmWF
         b8YKhSqby4LdpW1+brwgttqilrE85swJptNmnNBRr7nl7Hp4Y7GnH0CgnK67m3XxhGx4
         OmJHmxij6LZQd1Pgvvef9PcUrnZauOMdIM25t2pGg+FalPpEiGEl70M29qHOoxjmjHFh
         UTn5X/16wRWaYDSSmzX5VplXrBd0Np3y1ZgeV6z949NCvry1uAuqiMtKXR3EZ03eHZtN
         Hecw==
X-Forwarded-Encrypted: i=1; AKwUvBx7V1ofippKB55Dxr9goHHanTtavG6mfzfpQ/7/H8GmRgeY57ArPxlJm4htZy4bO9tJ8ZNVDp89EcHtpQg=@vger.kernel.org
X-Gm-Message-State: AFuF++lCQlS/n0FXoZ6HobsCp2qq/FsfnG+mjbwGl8zSaZc+MCPqCmzz
	Y9bd2TLzc28+h+fGJWy6gcRCM0YGjSU3oU8qmDfF8U/Fg50eGD1HMAXv
X-Gm-Gg: AYBFou14MWYYXDa9NriIqB30RvpGEN5KyogtTXiwbsekwPL3vV4mvEKJe+/uBpzHVK8
	nPTnQiBlY9+P64I3WeqIgmUMM2gWUpFRhzJwPNCeES9EVruM2f1c8MCZXPLzbOb7c1kiZYlSYAM
	mwzULZKNpW1uSOMQD6p9vQIP0KJfFT31Ywi08eJqphwVPTu4Ar2FuucodqV3Qb5SvzKipYW1thh
	DrBHtyHEqoOvyixhkCxwis0LVexheyKSrdOtTr7YOjgrTn5WpR/VyaypDqUNuW9zEmoj8VY5fOd
	8dgZZ7jX6GfMOTgaJzrDSY83Cyj3sSXJUO6A6wYvk+FW6JkKz12EZAKXGoilWdxPPB9ViHiuqex
	TVCfEoLm0pm5KmFYh/8awSeCIoLRq1IhYNJ51LMEee/eGY08SRfJ0nk7ljC6reNe1nn1B1KJ1Hj
	5WhxVd3KQCIFYlejmoa7FTe9b6w9R0TRghQuMgBeXFfrIZFQmyZYz2BpFPnVsPYRfpeUTG3lf1f
	e65N84k9rN3w3Epv9pBl2Okq2/cq/TS6Af9AEO1Wx0PlMm7LlHOO68=
X-Received: by 2002:a17:90b:1b06:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-39b2622ba26mr58218547a91.19.1789038457819;
        Thu, 10 Sep 2026 04:07:37 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm43023781eec.6.2026.09.10.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:07:36 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate multiple page table pages
In-Reply-To: <20260902164123.2546762-11-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:34:41 +0530
Message-ID: <8q591i5y.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-11-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Sean Christopherson <seanjc@google.com> writes:

> Add vm_alloc_page_table_pages() and use it throughout arch code to replace
> open coded equivalents.
>
> No functional change intended.
>

Straight forward change. LGTM.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

