Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878118;
	b=tAZHzZBfkdDAbAlp2zBOe+rGb2kQyEYOdKXVoRsfOQ+Mr9OVwli3jgbceTQjjWHl0pUa
	 pQRMW158KU0urzT68xP2pPGdZesLmKu1C0PG5p2rbMlyuypmDPoGog7jxVEGOOyJAZBpn
	 vB2HcLq442SphXddZtkFciviNYCWk0qY00FdPq3sQOJ2/0pFVgdIiSrwKDwLocCJphneI
	 8UcWwszid4Wb7bYIo+ck7omuXOZhNqV2Hdfo8H1y3Pyk9B47NQgidyEVM9HGJQgrhUalC
	 aANFEPjwPgg3pwGzDd2LqNWP79rw/y026Qjl12Cgb2PtbmTcQoicVkPZ7OnojoXmMmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=M3B5P4sZFtbCUwrSNj8EvE49+AO98mNvAKcPlzlXqp8=;
	b=hKRSuBAPqWTSC8CFZuMt8vfyGlCy8o7NEIVYnS55WjvhfpmOgZlCAMpZVYRu2sqZQpVw
	 GXSGg8ZgiJLk58IKiYaVRjr45oEK64xMSYWzaaeu34XbmA2uW/JWjZv5X9Z8uvx5wtMNQ
	 dCQOSal+2SxYec5aUCct9pTsBukdc2RC8Hpt/Ji8RUd2Tevmkg4ZAIR6Zv8sUWmByaXD7
	 ZUZb/cwiyxZ89igQR+O+v2vqbNKcwWA7ErlJSs50ycS/iIi/0bXtVix+qL17+gn6pyGOT
	 IUVfEd8M9AX27Lqg+Np0hKdhhYfnuSHz5K6J76/3PkA6iyJc6r6Imqi0HNRc4TnP7oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="cvCC/9jC";
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418BC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 418BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cvCC/9jC
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf3f829b3so34550385ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794878117; x=1795482917; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M3B5P4sZFtbCUwrSNj8EvE49+AO98mNvAKcPlzlXqp8=;
        b=cvCC/9jCaynhH6kEKuae0WRC3u9hi6zpTZTAcnWq65QzPbP5sWukmddq3WtjogMkia
         /ec0biQ4CnZvdPkpBOjxc9bG/GhjRUuSZjfixXkMNePXRdws8x0sI9UBdlEVImlCUNyP
         7CLbCGimxRFtQd7nE4V2svBrclo7pYifaaYkcn5/vOLexNcstmqE4PYcO0qMoYTcgIEY
         5iVSLjFoAXdRuuhARDS4XwX7YmBnmGHjLlO0i89Orop773/gJLqnerY6NBq5IvLJCuAb
         7sMYaRGx1glkdN8JwZLkKxmq9g7Gao6FOq0h3Ykkat4xEVADDd4VyuWmrPz4bcGkp8TW
         rBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878117; x=1795482917;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M3B5P4sZFtbCUwrSNj8EvE49+AO98mNvAKcPlzlXqp8=;
        b=gZELCTyLasky5HQJGsNQRboxNV8XcFFMdUX29Zb9XadRLaVEbOXOajFyyxMalcdCIx
         WAbhdMGrm2Wr9nbvbxveOLQblok5es9qsT8EfpFL75g4Hynrz/+VhyQRKB9ZNYVnNSgI
         lYWwxeiRRPOhWuKi08lc3IxFq3JsEq6jpcUo+Bnh71kPhtZVwlXn0FfBW08xRhlJ/o1K
         m6xx8hMBeDvlyvowb8FJIVDIKN5TvfsnlV5dI6+cy29MVFCSXIzOyOMBATAaVFj0qVPS
         cPQEu0UygUSvz0RbjehyzrO+0l7V35ZoaHzTt37gS9gSRedqaAYwuoI8dgcP27HwaqyC
         c42g==
X-Forwarded-Encrypted: i=1; AL+hErGiNpiIVGApMT2goOgOXdlqr9ATFnl8vTicF4qSM4QCBTs5iZeTSnV1l3Alc5FVeu569V1wZyUNgJp6cN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z++xxOFq7AVhm74KIxM+bWnJaspbpM+a2erTstm9amXQX2n18jF
	h0P2ufThaMcMaXTcQFvdV7Tje7hGaik4vwrr3AAWVhKtu3z5LHa4YYymaRowmeMV21ZICylV95E
	JaClZhA==
X-Received: from pluq7.prod.google.com ([2002:a17:903:4b47:b0:2e8:5201:ef23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fdaf:b0:2ed:391c:1de1
 with SMTP id d9443c01a7336-2ee0d6654bfmr113200505ad.1.1794878117248; Mon, 16
 Nov 2026 17:15:17 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 16 Nov 2026 17:15:13 -0800
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
Message-ID: <20261117011513.39419-3-seanjc@google.com>
Subject: [PATCH v4 2/2] KVM: Skip gfn-based MMU notifier invalidations for
 guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Naveen N Rao <naveen@kernel.org>, Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexandru Elisei <alexandru.elisei@arm.com>

Don't invalidate gmem-only memslots when responding to MMU notifier
invalidations, as the entire point of gmem-only memslots is so that KVM
doesn't need a VMA to install mappings into KVM's MMU.  Specifically,
page faults are resolved by going straight to guest_memfd, using the gfn
and the associated memslot's gmem.file.  I.e. whether or not userspace
happens to have valid mappings to the same gmem instance is irrelevant,
as are any invalidations for those mappings.

Note!  The exception is KVM's gfn_to_pfn_cache implementation which isn't
yet wired up to pull pfns directly from guest_memfd, i.e. still relies on
userspace mappings/VMAs and thus need to be invalidated, e.g. to ensure KVM
doesn't retain a kernel mapping+pointer to PRIVATE memory.  However, as of
commit da260bcb56fe ("KVM: pfncache: use a dedicated invalidation sequence
for cache refresh"), GPC invalidation no longer relies on memslot lookups,
because GPCs also support HVA-based mappings.  I.e. KVM *must* be able to
detect and handle relevant MMU notifier invalidations even if there is *no*
memslot whatsoever.

In addition to the obvious performance benefits, avoiding unnecessary and
spurious SPTE zaps and TLB flushes will allow KVM to support features like
ARM's Statistical Profiling Extension (SPE)[1] and x86's Secure AVIC[2],
both of which rely on the pages *never* being unmapped from the stage-2
page tables.

Link: https://lore.kernel.org/all/20260903160623.315525-1-alexandru.elisei@arm.com [1]
Link: https://lore.kernel.org/all/cover.1783490022.git.naveen@kernel.org [2]
Cc: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: Naveen N Rao (AMD) <naveen@kernel.org>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
[sean: rewrite changelog to capture the new gpc behavior]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9938b753948c..f0d95e8c37f4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -601,6 +601,10 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
 			unsigned long hva_start, hva_end;
 
 			slot = container_of(node, struct kvm_memory_slot, hva_node[slots->node_idx]);
+
+			if (kvm_slot_has_gmem(slot) && kvm_memslot_is_gmem_only(slot))
+				continue;
+
 			hva_start = max_t(unsigned long, range->start, slot->userspace_addr);
 			hva_end = min_t(unsigned long, range->end,
 					slot->userspace_addr + (slot->npages << PAGE_SHIFT));
-- 
2.56.1.703.gf848ed807c-goog

