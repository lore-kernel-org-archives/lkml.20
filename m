Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794883490;
	b=k6MZx38yFhnh4MHg49TQ/B1oHkhEXrl1jnnVd/dDFQHwIoCzpBlKwXzPdcwL/8zNuN4p
	 a6ASAwUFUxRlxq/zH0FemAQxLzhaE6yzpTS5kZ64KmfkptXiz+Hm9LdDTT/VbprXKsc+W
	 WaThZiIS5nshAIM4q8c8pJT5qchR5PMHTcD6ihLKKdmNpPtQaN1ZSQPyGnHkTXqO5/M4v
	 2TolW4me333N05DVAHEadVZNRYL12xLina/K9i8UNhh5C3X34HcKGtELvt0Evh/RJTLB1
	 pb2kZayVycLxGR4ZKe7EjoWVg/Q+VXS8YmAvPzM+DokhtT1tuRDGzDkjYotSi1Pt7lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Y71Zhi4GfiQqdnuwaNE8zOzr/2i8FDu4fO8GyDaycAQ=;
	b=opfgbr/UyK7Ukx1i0qI2RAXJaKa5wl9D/W0KHYdhODnnhRNRe3MCIFd9FRyqIPH5ag32
	 Hiw5VsFFDVmdwz3rgwfxRp4D7AmRLdsQktb44CzTtS9wlM2XhABGbbpQKVG2R4q67rApm
	 dRzTweYA4GAAgjqz4fTQMkQa/Q+7xVud79An85pXE4jzrQMTBNmlVokw2VkNPATKHzj2q
	 1qlwKFSJt7oIeD+smT2x7w+nEQ52MJaJnp9rYo2UFqAo1+uv0c/aLggFSuBrhYusqFkZF
	 IFEYrPe/4BFBrELifW3l2UiC9623vZnrerdLxiQ6O8RwpDhW66ZXdswG4gaqe3sUnSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S3PtxR5c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF8606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CF8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S3PtxR5c
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c847584b8so5021486d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:44:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794883488; cv=none;
        d=google.com; s=arc-20260327;
        b=IWBzqzNUSFdL0HaLkmZK87m40lLsMVkrlrxN+T7snByg8P3b7SfNPGLB9DJ1pAl9Mk
         DiQJ3VM83wmFr1OnGvCObD4R4BpI6T4pzeFqOeoINvNFc71DjtGRaP3c0ZuEFk/oLRhC
         eLRcVOHoH4MPTFREOPe45L0U+JzeeskHqHmMBnbWTpwRPQK2kkuE8DYDx/TL3tqTGkr1
         JqWdmnYd95QTRNAVLiTi7aWfZLOWVF4DFSJgXDse5TKr3o0h8wW5KBZ1KVsYXMEb06QQ
         XQkJSivBuua8LVCXjRI1UhVMYWMRTS3hFr4mTjz1DEs5S6aYe26mVHPqxDypwyMxIaLR
         +yQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Y71Zhi4GfiQqdnuwaNE8zOzr/2i8FDu4fO8GyDaycAQ=;
        fh=7rDpZxz5zgqvcLMLSVKClbwE3Pzjiz2RqMXq07yzBdw=;
        b=B7AsATQofvf0+0EuCTHfiMkijRXlz3kbQDE0g1dUm0MjLom9AtUAAiDMo4Old92p1l
         bCEb6DrWclGJN4oGvRI/nwYcoX441iAioqwsutwUYz2fxAaTVpupThTvuifwzXIL0qo1
         yZZ94AEAWZBXKHJfY0S77S1ZcWqKrsfaHv5iXAevfIv9Yjdr+t6zmjfZnEfbh7VnuPAi
         BO5wownbuFBYcU80CZbwvgsUPBvqshBSlGA9GdpfADDGG4r/WBIbVyhzoMYlCpVYILhW
         iW/2AYHVHDNdAWQ5XB7pfkWqJnXxEI+6FVkRp+Vvna70z9WMnoeP2/EYzh58zqZvrD0B
         su3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794883488; x=1795488288; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y71Zhi4GfiQqdnuwaNE8zOzr/2i8FDu4fO8GyDaycAQ=;
        b=S3PtxR5crawhGaXvPrwpPF8zg//TV85U3T9rNUedoFp6EGDoRGxEMdknDkDzyB4+LO
         SE3hUFtHDnqczXQ6uTEDOwNUuGnxYPRFatOOd+lb+hhrhnLxDlHC+Rw00e34mxGwriU3
         zA3uj71LwHwIbxqerIEQ1BCcqWCkBYZElQms2cUFBjOgjtTEX7R5o4YJwLI+5m4S4dCV
         figtLs2nJJhpHqcSzwxwdCZvD5n9WdfOg5ZYD7oW52ptdBGXjYJI/Sa6jrvmi5MeahLf
         Ofl43azmnWH5ciBOKHPxvkp8NwdXrEctET4b7qBhfvb5wyGGyReMXplK3RiwNrG4eA/i
         etPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883488; x=1795488288;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y71Zhi4GfiQqdnuwaNE8zOzr/2i8FDu4fO8GyDaycAQ=;
        b=LB8Jpx9fRAVhJqfAdYtFbOBpDLcE267G7Vxe4YEWAuEJXvVRftjbb+ccjLridsRV1m
         eMmKsQ/gB/W4Fqp5YwP24Evl1m5P8pMw/6Vml2ZbaVFMrSGp2VwS28Bft1R+OaShniAf
         1HiIdXkXvV55HKz4jQvMgQ0KpiyPJv/pIDQJHObl35sDTGpk1yDd1Q606901p91wtTIp
         pLAWXcHUPHwgf/o7gx8Q6WKX6ET/25vEr6bl76NGGk0z3zo9sn4I1mC0+Q1Yu6S1d9Xh
         aypb04gyO20F5w7sUqXWBYtmEHRfaSYPb3tx7WrO5v8+lf1hbxHsGCnTp6XyTVLxmfKR
         owJA==
X-Forwarded-Encrypted: i=1; AL+hErFL+5HzJeoU8XcesmjytV9SX2eXpy7HuUWh1D5veGCpS2hcrO2aJwsIb6/BnoTDiyMx4q7MOxSpF9InPhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6bWUNaeMOMk5Mv//ZV28YJG7U9+Mudur5EV9wXDxMUs8ULXBf
	fEE5n7zjiipl4r3HMUBbz1PvsSRlUqWbmqwLpgkVt3nbaOOPEla3tGwqcN4+4Jf/uWXmLCAs36a
	emESnrNA1hvFHCg8GnirJ+/W7IVPu6czymYy14RBTKIZfgOWVq95uqU5i
X-Gm-Gg: AZFdTZel6UteF7ucGtowmElOBSDAI2X8b3HpEUTFYz7j3ZkI8Bhsq6+8CrhMx1AOnfw
	maO6qtiGjoY/VuwUFI/bQrd9l4jwtamkstkk5h9H7tYlxxgroBMra4Nyl3WV/HkVIbxn0X86uhG
	+R0Y3MJSoplT2hYpL1nyS4HZ0QJKCeETe26DLtr+jYzCr3UvrBhNlrrrZBysTpgVjiUuBt0A48L
	Mk+UuFJseehE5ENTKZJ5DKQNQ7gBGJwjqbooLDfSzoCqIVQcNtHQ1TGVGF3NkVBDlMembnvM8QH
	KkI+I2ljJ3yL5zKaiPF3+/76SbufuaSN9Y5fsQeF7bqYJyFgjiNmTB7veP3eMj66gzVioVsUMKo
	MVc9t8D3Raqgvt67pa41eB5aKAIkQWXynYEb7+5fJKLqByG/gLXOALohdR0NsLcOHKQ==
X-Received: by 2002:a05:6214:33c5:b0:91e:a483:3f3a with SMTP id
 6a1803df08f44-920fd43ff0fmr22934896d6.32.1794883487876; Mon, 16 Nov 2026
 18:44:47 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Nov 2026 18:44:47 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261117011513.39419-3-seanjc@google.com>
References: <20261117011513.39419-1-seanjc@google.com> <20261117011513.39419-3-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 18:44:47 -0800
X-Gm-Features: Aa3M54qtM-vil0xv5LnJ3Zg50xXvT7pXuvhebpw4qAE5ZwUljOeOKWcaz5t5YJU
Message-ID: <CAEvNRgHSxudw-6C5t-90dnmmoXFjVHz4m+Gr7a7QzC_Px8oCjg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] KVM: Skip gfn-based MMU notifier invalidations for
 guest_memfd-only memslots
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Naveen N Rao <naveen@kernel.org>, Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> From: Alexandru Elisei <alexandru.elisei@arm.com>
>
> Don't invalidate gmem-only memslots when responding to MMU notifier
> invalidations, as the entire point of gmem-only memslots is so that KVM
> doesn't need a VMA to install mappings into KVM's MMU.  Specifically,
> page faults are resolved by going straight to guest_memfd, using the gfn
> and the associated memslot's gmem.file.  I.e. whether or not userspace
> happens to have valid mappings to the same gmem instance is irrelevant,
> as are any invalidations for those mappings.
>
> Note!  The exception is KVM's gfn_to_pfn_cache implementation which isn't
> yet wired up to pull pfns directly from guest_memfd, i.e. still relies on
> userspace mappings/VMAs and thus need to be invalidated, e.g. to ensure KVM
> doesn't retain a kernel mapping+pointer to PRIVATE memory.  However, as of
> commit da260bcb56fe ("KVM: pfncache: use a dedicated invalidation sequence
> for cache refresh"), GPC invalidation no longer relies on memslot lookups,
> because GPCs also support HVA-based mappings.  I.e. KVM *must* be able to
> detect and handle relevant MMU notifier invalidations even if there is *no*
> memslot whatsoever.
>
> In addition to the obvious performance benefits, avoiding unnecessary and
> spurious SPTE zaps and TLB flushes will allow KVM to support features like
> ARM's Statistical Profiling Extension (SPE)[1] and x86's Secure AVIC[2],
> both of which rely on the pages *never* being unmapped from the stage-2
> page tables.
>
> Link: https://lore.kernel.org/all/20260903160623.315525-1-alexandru.elisei@arm.com [1]
> Link: https://lore.kernel.org/all/cover.1783490022.git.naveen@kernel.org [2]
> Cc: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Cc: Naveen N Rao (AMD) <naveen@kernel.org>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> [sean: rewrite changelog to capture the new gpc behavior]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 9938b753948c..f0d95e8c37f4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -601,6 +601,10 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
>  			unsigned long hva_start, hva_end;
>
>  			slot = container_of(node, struct kvm_memory_slot, hva_node[slots->node_idx]);
> +
> +			if (kvm_slot_has_gmem(slot) && kvm_memslot_is_gmem_only(slot))
> +				continue;
> +
>  			hva_start = max_t(unsigned long, range->start, slot->userspace_addr);
>  			hva_end = min_t(unsigned long, range->end,
>  					slot->userspace_addr + (slot->npages << PAGE_SHIFT));
> --
> 2.56.1.703.gf848ed807c-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
