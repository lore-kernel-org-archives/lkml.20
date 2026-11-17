Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878117;
	b=jGf4B9UH9W1kMir8m6JPD32GlrR+Y5e4j0uOGC1kLdwrqh7ZADVlz1STpPgouMMnslEB
	 p5rWXTxx86LsJRg5AXsHbixsTLU0SYGk6mEA2JH1bKsyVosZ9b3xbaIpZ5kQ+fBGUPwED
	 DsWturvBjqKTrrj1d8yJJ6zaXOnciUgkRjpkNhOp0bfAWx+GonVLXVGVA6I8ZUd+P8fV8
	 /+gU0svMKF1iUN9MtIQLXHXZVipdITB6+Fj9bav3aBQs5UvQsMcsoV9oOhKjQyvDdR5z5
	 nwlZTt1KHrpfrj6ceKjHj6T/qQ1xUzKxNYuA984vPn5QmZx5XPewyOXZtH5GsMtPEeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=TWP/ReH2wMYRtHWwzmCHwWYTzwY7NYJY/sX9pnvvo50=;
	b=hO+4nycRTulBUSkkkclp/56OKK0ciPWQHdKjGI3CXjp8HgVn+CMM4+dpJd9IpGrMJl0Z
	 Z8Irq/G1g21rxvNQQG4WfyI5idY5L705yrxfn/l1kZXtsrHyc+37DPFze/Ef50scQr9+6
	 t8c8SDfUlDRoIqGRBKJkxSHT2ScgbNrzUvVCEauxtYmjBjh1iwaiTnhTH3McA2J/SeWjJ
	 kHTPC52EpCA6E/Az2lKPQCmjzB1OxiyuT48o1YtrOc+T1FQwRCGV2misOY4v+4gw+Dk3n
	 aB68P7K6hmXt8iagdJvAPYwXFW8SnMvrHc49vldN9Pq/qk1KR4BaaKAWTlL7LzCrnWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OMxitlGN;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA8606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8FA8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OMxitlGN
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ee184a2474so28482825ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794878116; x=1795482916; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TWP/ReH2wMYRtHWwzmCHwWYTzwY7NYJY/sX9pnvvo50=;
        b=OMxitlGNWdfPHCXoOJn5m+bZDiy+CMe0I6imxnS3Mc1kJnDKG/7Yr/HKHTXVzMv58k
         2eE0p1H1Yn37Hz+huURTbs/Lu8/eg2zVuOz3FJi4zognvtsrcW33b68X/N4G/eqMTT5L
         WlXPrfI89hZsL6gSVnC+k4CwmBgetQfnyzcoVqP6U6iW+L/Gqf7k2RMoYYu8ukpdeKBO
         eqWKbr+Nnj/4IMY3iNIngdgLi/GqDwZSowcHlddXlW4iPGE1kjOXAHDeG+BViR5H49MF
         MqkOOs0ZxaOc9QpuNdJuLaLvlWwWCgMXJ1sQ5rZIpdar+FY4b5pxjFvW6juKCHtWSxlU
         ekQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878116; x=1795482916;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TWP/ReH2wMYRtHWwzmCHwWYTzwY7NYJY/sX9pnvvo50=;
        b=c4+fOO5gcbR+wUI/dQsA8nBwUz08FApfJu41XCSxTG07Yn8uz5d/WmQSQ9wjOv07IU
         e6DG3x9yF2KbZ65KOlZJhP2bgQ0BMr09WlSQ+2U5HxsbJfmJeV2QF7ScZSFTqMWz96Mc
         CgzHhTu6NDfb1HdagBB6l3oXY8iXf/NZ4IEM2eOS4UHSe/VhBagdTtbhDkCviKRvxuF3
         aLOqv5kkYrVs/RdNnb1AL2yYj5NbG8D1pee8opBjbSgGHjfASoefEcmhfCZDjXksujZR
         2wlOtueN3FtWLb2oTsNt+gZInljjScue75VzOoelxPXRlLhC3BzCqzx6CmUMEcA6Vzgv
         TAOg==
X-Forwarded-Encrypted: i=1; AL+hErHiW+R4QKxMi0hw7c/0Wu3W88rI0HLD7cB82da2F87s/B3FMkay/nD02mxN/9ht1OWUwzA6HrDZcXIHN6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cfX3to+xl1NIXW2bZNGnCpwrEEqkJU8CDDmd7nhxcNpszpZZX
	RTh0kdBz9736qq0YpVbfq4mKH2Kgser9Uj/wrRBsZ03FveCC+KmNomTl/g9QKfl9lLfQzIPDpUv
	5K91m6A==
X-Received: from plkz8.prod.google.com ([2002:a17:902:7088:b0:2e9:84f0:65ba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fd8c:b0:2ef:d669:4796
 with SMTP id d9443c01a7336-2efd6694b61mr14579925ad.57.1794878115971; Mon, 16
 Nov 2026 17:15:15 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 16 Nov 2026 17:15:12 -0800
In-Reply-To: <20261117011513.39419-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117011513.39419-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117011513.39419-2-seanjc@google.com>
Subject: [PATCH v4 1/2] KVM: Disallow prefetching PFNs (for SPTEs) via VMAs
 for gmem-only memslots
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Naveen N Rao <naveen@kernel.org>, Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"

Disallow prefetching SPTEs via fast GUP, i.e. by VMA lookup, for gmem-only
memslots as the whole point of gmem-only memslots is that KVM MMUs should
get PFNs *only* via the direct guest_memfd interface.  More importantly,
this will allow skipping/ignoring/eliding mmu_notifier invalidations for
gmem-only memslots, since it will be impossible for KVM MMUs to have any
mappings based on the to-be-invalidated VMA (as is intended).

Fixes: 576d035e2aef ("KVM: guest_memfd: Track guest_memfd mmap support in memslot")
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-213282@kernel.org
Reported-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Closes: https://lore.kernel.org/all/avdAIMDfgL_wy1rx@gremlin
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf4cb586f140..9938b753948c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3172,6 +3172,9 @@ int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 	unsigned long addr;
 	gfn_t entry = 0;
 
+	if (kvm_memslot_is_gmem_only(slot))
+		return -EINVAL;
+
 	addr = gfn_to_hva_many(slot, gfn, &entry);
 	if (kvm_is_error_hva(addr))
 		return -1;
-- 
2.56.1.703.gf848ed807c-goog

