Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC00438E8CB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999669; cv=none; b=c4UXNNW8m2m/6nzIga4jDatT2AT3oQNPKAgRVbdikRmWWAPFzwUqtoaCuWCLICjHroDafW4bWSqtoNYGkX8qXQ1dktxXmpFIU8JqNSZOFLYoTh8zj/U04gbne0Ig5rumkJPCaQh5/H7dTVtSxicKlSvPy/IY0KVTYK6oXw4SIhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999669; c=relaxed/simple;
	bh=PnTxVapAI072TI1mWddiiW06LTNn+rrIrioNwXne5Ow=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ih9vmFVV7LMhg0LSwbWQtD2gRUCCKBShq/V+qT5WNONTAb59CNBRazy3ofajIg1erYw9lVovYUwxCjaGVwFmBAOIXPGlUTIloR6zRSunvNLXw/yNUyAflc6nUr/ie4Xd9pTLF1qp+AaDaLGzqO83SiRuaQkl0UyYG4G3ZKxCvL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UXVeHLp8; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UXVeHLp8"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7348bd56fso2272558a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999667; x=1790604467; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bnx/BHDMvq/zoLxBByuVjVwNb3H5wxZ7w/D6NMBnNTk=;
        b=UXVeHLp8Aftj5lTQpTVB8NyFGA9aCsY7v0KOezMTfGOEU7MSbu9k3b5iK/LjMefntL
         CgPSO59i9ffJM0AwN6z+EK/LHL7RHIsoDW3GbkbZ63Uooos9JqhT1dihZecgHo+aMO4+
         eHQ8Pmh9sEukQlD3F9s2aVvklstlneDj+tF9clXZriIdsQU7R0ZupRm3+d3ZJerjZjYZ
         b+c5F/sgDew2ImaPFdoU2Bvz8EVsKHGNT37vkVa/QaDevSqGF0qKxUgdjetQrIR5M285
         tINUeAXuW/zmIM1bTmXfDFfxXbBY9H1byZp4OtDV/ET4UeSc9MruOR3UfiiU5vg5Fy/v
         Qe+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999667; x=1790604467;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bnx/BHDMvq/zoLxBByuVjVwNb3H5wxZ7w/D6NMBnNTk=;
        b=VFnvblhZyb5nQ1f7UI3uvxwOJvtgT4yvmqU2ttws8oH69TjOOJor2f0MrnoGU8u+rr
         kitKLgbb4YBrf2N4tHyAAjMFMwPJpmnFF9ims0NZz5p/KzTgi2WKSclWdEBtiAbJ3pyK
         ie2wU7ZmIn0MPO5HW8Xs8Vgh4Rx+m0JhRRTPr/sD4lX+OgrMky7hmk0kIvuTBPsTUDVg
         jEtso1CUPeORSTrudkz3CK5Ks0Lt1P1oR1weFLgxUX/bxFj37BKZx49WuNM5DrSdoEGP
         SsOTw112ozxvjzHKoS33+oOkWy5CpRIfK1jZMdn2r7w8xR4D+2oNi2sNwfg2EYylrdVQ
         WaKA==
X-Forwarded-Encrypted: i=1; AKwUvByl9kIXawDl1meIdH215zU6lHBP3LQ0jVllbym/HwaUnnZy1xUnAZfy73fBlc4E5Do75FVic1dtmlLfk6A=@vger.kernel.org
X-Gm-Message-State: AFuF++no3kPf/zu7Iqn2up7Co3yDNLmx5pqdErHoPXVtKJPCjg+Ah0ir
	JWR5FPZ9BqxmSeofXbiZ19X3//06IgMbwFFiVjEEn6Uy9+q+bBvIK5GSxFzmVz1fusUuAJCEf1d
	WbYeFQw==
X-Received: from pjbbd16.prod.google.com ([2002:a17:90b:b90:b0:3a0:5e07:c6cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57e8:b0:39e:6c69:34cc
 with SMTP id 98e67ed59e1d1-39e6c693638mr11049201a91.48.1789999667184; Mon, 21
 Sep 2026 07:07:47 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:42 -0700
In-Reply-To: <20260903001625.2792367-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260903001625.2792367-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999926338.754170.2692559524716409337.b4-ty@google.com>
Subject: Re: [PATCH 0/7] KVM: selftests: Fix maxnodes bugs and cleanup related code
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shivank Garg <shivankg@amd.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 02 Sep 2026 17:16:18 -0700, Sean Christopherson wrote:
> This is a spin-off of Shivank's series[*] to fix "flaws" in KVM selftests
> handling of @maxnode in various sycalls.  In quote because the flaw is that
> KVM selftests followed the docs, and the kernel has a longstanding, poorly
> documented off-by-one bug.
> 
> Along the way, massage the xAPIC IPI test to automatically run its page
> migration testcases when possible, because that's the entire reason the
> test exists.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/7] KVM: selftests: Account for kernel's off-by-one bug in NUMA node syscalls
      https://github.com/kvm-x86/linux/commit/be3c6888e1ab
[2/7] KVM: selftests: Fix maxnode argument to migrate_pages() in xapic_ipi_test
      https://github.com/kvm-x86/linux/commit/8883d2410c45
[3/7] KVM: selftests: use BITS_PER_TYPE() for NUMA masks
      https://github.com/kvm-x86/linux/commit/d2dde5c387fc
[4/7] KVM: selftests: Compute node masks on-demand in xAPIC IPI test
      https://github.com/kvm-x86/linux/commit/3a2a37d2d48e
[5/7] KVM: selftests: Add common helper to get mask+number of usable memory NUMA nodes
      https://github.com/kvm-x86/linux/commit/0be096bbc9cc
[6/7] KVM: selftests: Automatically run xAPIC IPI migration test when possible
      https://github.com/kvm-x86/linux/commit/92ed4d5c78fd
[7/7] KVM: selftests: Skip xAPIC IPI migration test when forced but unsupported
      https://github.com/kvm-x86/linux/commit/d5aa06fbfec2

--
https://github.com/kvm-x86/linux/tree/next
