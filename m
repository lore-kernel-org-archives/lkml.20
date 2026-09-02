Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8E13B5318
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351283; cv=none; b=hVZpcS3xFeNBbcHaYCpHWai36XqI9XxIzesOry7Bs7fy+NQCfkne0YMAxaKKTZ8iBCkskTBZCTZWPHBWTkWaBrJnRNoLYW9+wYnuqW5HdDgdg01eTEScKY1jk7WYWmiHKw+d2RjYOwmDM3iYPI9Jov6uJ9dcn3quNBAqZFAwooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351283; c=relaxed/simple;
	bh=4Qglmckg5ZZOC4FNuS9plcraHgT9WetBEDqCdkvpzIQ=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XddFvZlwBdKVYDbabO0xOjkcX8q3IM6VmPUdPRBsi6NqWaFItI07OT/QbvT3DAk4AkoIGur+1XaRU9EuwyjofgH+S9sWsZc8bn/BOayoWZqOhylFjUlFqMF3PKoInzkNoSyyWPBLGivZ2w26E1OHNAJwp78PrGifk0/7ORMCmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDES0Utt; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDES0Utt"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2533d83e3bso132755166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788351278; x=1788956078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/JVKCwTpBvW1MaS3JQ86ucWRa6O3vTXyHiZVvmohp0=;
        b=qDES0Utt0CZI0iv+P+sgYdjhW4dEYISulRW9H73cnMOgU7jMvXc/Ms3pByM/68yU74
         cjFsCFALvCAtSkOULDO5sa2dxtWBMKIevwYHor2MJZiz9hkFtcee3teFQJt9OzUEyCbm
         dSMlHXTXq2DfFmtMchrPSM7JNSWHKk4iSn2N06cmH/YhVcwSVV2BMUNpMZLKlo7eO22I
         AXDX0kDUUcMqXUACZU3vbSCfnfW3RSXkppCdh0tkUjI2ANnZJMr5v0xGbHt98cKrK9bj
         BCHPMZDzNAvDCZDdV7F17OI1De6dmd2kTrzWomA+X6auDuXu4S4BchqqMGtLsEXqMEiD
         uckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351278; x=1788956078;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F/JVKCwTpBvW1MaS3JQ86ucWRa6O3vTXyHiZVvmohp0=;
        b=PlaY+7G+2rh5CFUHm0X3v+YwmpR1cZn6iWs2untOnZIZU8yJ9YzVOzVqjGWkrm/O4T
         pn1/e6n5Q3a35WUf1/bHqg1v3Hek3d/LaQrjol2Xer1WXelH61BmZ1ztuIRXW3HpVuRq
         czYFncP2AIMlJDU61PcBat77DnxdqfcO7F2UoJEodJzPosYdp3RoBLCFY2DWOwD19wtO
         06vQOShA7wdMAgox6Am38FnupDVebD5JB6a4ooaC6W92y+3BOWjRi50/M8C2Me6bhWGv
         kiXd3IfodCVBUMF2oKAr6eTPA3NT2ISwb2aVCKd+s8T8L6kadTCzuZfSxzUgc55wqflR
         h/NQ==
X-Forwarded-Encrypted: i=1; AKwUvByIHoeuu4AMG9RlX0ZxrImD57oHeuD15+D1TtOaS+FYWWIxVCQkShDFjGuH6PnLASt+A4QzNxY0kBVazUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l4DLgwpF5qTPOAVFX4yIwXIdy13tNEMiBCcE3A3Woq39wI1kSd
	EpjHjP5eatHTzuVJDvPgDYMmv4SqnXmEgHKl52y+mhpffxPcc9fEX24J
X-Gm-Gg: AYBFou2W5UVQ/7rrPHW0tRIzCXNe/G3FPFn4PX3VgFUZ7r7uCpgvjWvoXnwP53B8Zik
	IJ5dc3ru01rbRcrdoRI38lEHyj2DC8kiBX4UQ45TY5Gz/w+BjOzymP2lShmEjksMKQnd8Nl7bxh
	7pb/aRndcBkCOeEYJzfojeyW0MByU/ZdCCZRYFh0PaniqyJQGveW6GaCR5mi+Lyz/8QvZ8Cf9JQ
	1FZYkQRBmwq6qkf4y3OtXzqdvd3co6bg7Lp1W2veeMw80e2Vncigci2bRj/s4LDNNTv+E+AcoIX
	uYuBnZ1QeDvCYDXLRHymipyiE7tx+ViwCWQ/RbSytLoC7DwwqzrupHKu2q0sSkKtU5EDF6nFg0j
	HqMftUZHidw47qFN2hCCUlcde1Ebx1Ml0IReo/gO0XuXtNo0KXGO2lt5stmoH+EpDqn46HE4281
	pPVe0alDNieTIzeuTqKtks6GSDVMEF94OL66+utlIzVuoydg47IL6Vh7xbRVMnd1cL
X-Received: by 2002:a17:907:3e8f:b0:c21:3fa7:5a6f with SMTP id a640c23a62f3a-c25d554fea1mr275552166b.24.1788351277323;
        Wed, 02 Sep 2026 05:14:37 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.3.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002f2absm124158266b.17.2026.09.02.05.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:14:36 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d182ef29-a049-4013-95ce-07405f13167a@xen.org>
Date: Wed, 2 Sep 2026 13:14:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/13] KVM: pfncache: use a dedicated invalidation
 sequence for cache refresh
To: David Woodhouse <dwmw2@infradead.org>, seanjc@google.com,
 pbonzini@redhat.com
Cc: joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 ankur.a.arora@oracle.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org,
 syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, suryasaimadhu369@gmail.com, lkp@intel.com,
 nicoyip.dev@gmail.com, frn1furkan10@gmail.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, imv4bel@gmail.com
References: <20260831213632.81023-1-dwmw2@infradead.org>
 <20260831213632.81023-13-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-13-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The gfn_to_pfn_cache refresh path guards against mmu notifier
> invalidations which complete while it has dropped gpc->lock for the
> HVA->PFN lookup: hva_to_pfn_retry() samples kvm->mmu_invalidate_seq
> and retries if it changed, or if mn_active_invalidate_count is still
> elevated.
> 
> That is insufficient for HVA-based caches. mmu_invalidate_seq is only
> advanced by kvm_mmu_invalidate_end() when the invalidated range
> overlaps a memslot, and an HVA-based cache (e.g. the Xen shared_info
> page mapped with KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA) need not be backed
> by any memslot at all. An invalidation of the cached HVA which starts
> and ends entirely within the lookup window is thus invisible to the
> retry check: mn_active_invalidate_count is back to zero and the
> sequence never moved. The refresh then publishes a mapping of a page
> which has already been freed, and the next reader dereferences it:
> 
>    BUG: KASAN: use-after-free in kvm_xen_shared_info_init+0x3c6/0x440
>    Read of size 4 at addr ffff8880599c2900 by task syz.2.383/7257
> 
> Since gfn_to_pfn_cache_invalidate_start() deliberately skips caches
> which are not currently valid (including one whose refresh is in
> progress, as the refresh clears the valid flag before dropping the
> lock), the retry check is the only line of defence, and it must fire
> for *any* invalidation, not just those hitting a memslot.
> 
> Add a dedicated kvm->gpc_invalidate_seq, incremented by every
> kvm_mmu_notifier_invalidate_range_end() under mn_invalidate_lock
> before mn_active_invalidate_count is decremented, and check it in
> hva_to_pfn_retry() instead of mmu_invalidate_seq. Incrementing in
> range_end() in the same critical section as the in-progress count
> also closes the variant where the cache is activated with the
> contested HVA only after invalidate_range_start() has run.
> 
> The same bug is also reachable through the per-vCPU vcpu_info cache
> (KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO_HVA), where the stale mapping is
> then dereferenced by kvm_setup_guest_pvclock() on the next KVM_RUN:
> 
>    BUG: KASAN: use-after-free in kvm_setup_guest_pvclock+0x5bf/0x660
> 
> This intentionally makes refresh retry on *unrelated* mmu notifier
> events; restoring precision (and reworking the GPC locking more
> generally) is left for a subsequent series.
> 
> Reproducers: https://david.woodhou.se/xen_shinfo_race.c
>               https://david.woodhou.se/vcpu_info_race.c
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Reported-by: syzbot+0948c82180d475ad24e2@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a0c5f2c.a00a0220.2c7954.0000.GAE@google.com/
> Tested-by: syzbot+0948c82180d475ad24e2@syzkaller.appspotmail.com
> Reported-by: syzbot+fb7c2dd166d3ea63df2a@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a426dd2.854d4ab9.360e1d.0008.GAE@google.com/
> Fixes: b9220d32799a ("KVM: x86/xen: allow shared_info to be mapped by fixed HVA")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Assisted-by: Claude:claude-mythos-5
> ---
>   include/linux/kvm_host.h |  2 ++
>   virt/kvm/kvm_main.c      | 10 ++++++++++
>   virt/kvm/pfncache.c      | 18 +++++++++---------
>   3 files changed, 21 insertions(+), 9 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>
