Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905350;
	b=woWrJnyBcmsSPevAnNbvbP+kvViefGUh1cDOoUALGtqfOZt2xc1dqSLm+V2fqevV3imo
	 MzwnbgFJGQG/wa+CjwSGshQn+fmP1Q9zuiKN3fS3uNAGhTK6YoDwKq7pp7A4uTevI1Iwz
	 UlbHEfkPaALj1oZZT1zvzqiRXmGLCFMi/iEIrSdIKbRiKLLHyM1jp81fw+PBSvcZPGHX+
	 dmS/vIyH+JX95gSZlsJhIwRtBDFIVCFzZrX6XbNbhxUNyOQNjtv/UKHWlN9PfUtrlWv6l
	 oAn8a9WrCPShwuVZhh9zPA81zgfgawgOq3c+Vuc0igVTxne8QdToKH5AIlQuDy1ykzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7ITq9pil1sbNEwosA9cYsWu7rSF7A5UE/dNpVgRrvCc=;
	b=Tmr5X1uEQaDV2t3M6LN9TX0+vjcNFFg13VHBmSoLaCZ6PFab5vBGBmUagaPpSzo7027E
	 1ZpVQZ7y3TtbU+4rshS+OPUK2asFJDmJlkBqX1ncVz1VoG1ImFuUPUsJiI2BGbXLogQSz
	 X7IfFnUrjJW1lxsLKNZEdEWVVl+/3alR6Ge21Jr7rsjGX6uiz6XnQewC91f7wpNapxkHg
	 VCImq8+qwyb2StM3730Vabmc+Kv0p3dEPsmBxFLmnqnaT6mxMuygD3K2JWd/3sDrRm9Dl
	 b5LoKrIkOQA5phuwKEo604AxKAsTSDw5U8j+aH3UeV6uJ/JGxJzLlKzanVjGaK4/55w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kt+izXBe;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3212A606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3212A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kt+izXBe
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9995cea88so22741485ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793905349; x=1794510149; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ITq9pil1sbNEwosA9cYsWu7rSF7A5UE/dNpVgRrvCc=;
        b=Kt+izXBe3aRIx2YTkIKE/PYSigCNpEKkjmbAg37a1gyOd502QccAgd1x+wB5TleLOY
         cFtmQ7Z2L3HPgcbObodeCy7qDrXolgwEj1sJswRIfZ4n7J+x0dbDa5TVmbF7/eKzcgZf
         E51s4dL6fMWSOlBp4EpdziUTEAmQK1jeqPj0GQln6li78wTp/S823u3VQx2GUvHUpwsJ
         h+ePQ/eMX9lNWRD6X5s9+GcKaI2AaGzpm0n42xZscUSDMSn89gP5fQIL2t1LTnhyuqOh
         jORfUVarmK2JGjbn7NZ49D6H4BJFTfsFkTnvphC4rGfK7CBaq23KUqzDQhTD4JP9NSaA
         Rx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905349; x=1794510149;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ITq9pil1sbNEwosA9cYsWu7rSF7A5UE/dNpVgRrvCc=;
        b=pIJp40Fp5d273d+IO1aENBwCwoV2WUWtibvmOpqg4uVP6Q/5970xkRVdzfDEwRE7RM
         HSiqBARe3jlIZFqimq/hstzQJc7LvhOV1leS8RXlrU5kRv06i9QWoicyQ9iMmjhlEYmo
         1Ybo3h4x8w8vynfVOGEJegno6LXRXu+T0/STNAe5uGCDtbXbEaLGy7gctSOge9SB/O9S
         u2MKi8is4mMqjEMA5I5cI+JzBreC7lpUt4Z5qFgY5O9BDqq0j4ynA/DWPklaFkQ3WEwB
         RR3uxf+MCivh+8qo7JvP1yM0sCAMNwxCJ4YhJyP/Z6xsBDp9dNc/ZhxW6kJ9ZCVmL4DB
         IWoA==
X-Forwarded-Encrypted: i=1; AKwUvBxxJHx7zgrZvLGZny6Sc005znFd1KaSBAuXdtFC5CN8/JwTbcK/dNqAMKDDf97vSVTWley55UAxaZY6DD0=@vger.kernel.org
X-Gm-Message-State: APuU4Z96bECwsj54nWJDJKs4sY0Qh4kKim+5YHB2LUiBPJKBxqdoJU4T
	D5TytTW6e5TgKZOIT0uLSFdrGMFJnE4XsE2X1BU1FhcYcAd7qS+obw1T8ZPe0OAXYhaSyXrTpSq
	H7XZouA==
X-Received: from plbky11.prod.google.com ([2002:a17:902:f98b:b0:2eb:809:b8ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f68f:b0:2e5:334f:f47e
 with SMTP id d9443c01a7336-2ed40aad5c0mr6016315ad.21.1793905349286; Thu, 05
 Nov 2026 11:02:29 -0800 (PST)
Date: Thu, 5 Nov 2026 11:02:28 -0800
In-Reply-To: <autwsR83Ii-tRrqF@gremlin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260714160411.302386-1-alexandru.elisei@arm.com>
 <amPCdAswlk24Xilf@google.com> <anxAGkdyPYXBlS00@raptor> <autwsR83Ii-tRrqF@gremlin>
Message-ID: <auzSxEsGAcm3MYtN@google.com>
Subject: Re: [PATCH v2] KVM: Ignore MMU notifiers for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, david@kernel.org, mark.rutland@arm.com, 
	ackerleytng@google.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 04, 2026, Lorenzo Stoakes (ARM) wrote:
> [updated David's email address to @kernel.org]
> 
> On Wed, Aug 12, 2026 at 10:42:50AM +0100, Alexandru Elisei wrote:
> [ ... ]
> > On Fri, Jul 24, 2026 at 12:52:20PM -0700, Sean Christopherson wrote:
> > > It'll probably take me a few weeks to circle back to this, as I finally crawled
> > > out from underneath a pile of urgent and am just now getting back into review
> > > mode, but this is fairly high on my todo list, so with luck we might still squeeze
> > > this into 7.3.
> 
> Hey Sean,
> 
> I wondered whether you'd had a chance to look at this?
> 
> After discussing this with Marc and Alex it is clear that this is really a
> blocker for Alex's SPE series, as we need a sensible means of ensuring
> that stage-2 mappings stay in place.
> 
> So ideally would prefer to get something like this in in the next cycle,
> if you don't have any objections to it? :)
> 
> If it'd be easier, I think a smaller version of the same patch would also
> give us what we need? I.e. your snippet from June with the page ageing part
> dropped, as below.

The GPC invalidation fix landed, so we can go straight to the super simple v1.
Compile tested only at this point, I'll formally post this (hopefully today),
assuming nothing explodes in testing.

--
From: Alexandru Elisei <alexandru.elisei@arm.com>
Date: Mon, 15 Jun 2026 16:52:44 +0100
Subject: [PATCH] KVM: Skip gfn-based MMU notifier invalidations for
 guest_memfd-only memslots

Don't invalidate gmem-only memslots when responding to MMU notifier
invalidations, as the entire point of gmem-only memslots is so that KVM
doesn't need a VMA to install mappings into KVM's MMU.  Specificially,
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
index cf4cb586f140..599dea22afb8 100644
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

base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
--
