Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8730D349CF8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790642489; cv=none; b=hmTielbkA210kvCOgLLFZZZ2L7HFiZEg2c7BOpqhabJFCDb3GzW7IT1ELpoTjz4sSBhJr4Rv+oOXNoJykCCLIWOkfJ83SBm09kJMnLuK6avNNG2k99DxuaegLaSguksGldrlo+9zGQHdfqidd3BlgOx78H2p3SJGcp8qEvxdIiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790642489; c=relaxed/simple;
	bh=tZZZr1CPozPRTFjo9ntrI25q+cyqlBujqnrT564JpMY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fDKd3/unv6tZFznpJGTHS1+FWY0xa/h5mLLXvyWKLHTCqt1SyKYAk881s3ameQO8Rk8oT4wROSXUwa4G0FsO9HdmGyre7b09QJz0wuO7M2wJw7mr1SogO+waBJJ6V3cr5czGG3grwzw6Dq3a1FdDJN3LWB9XwVsEwFbZ56+bAaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fitXOy9z; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fitXOy9z"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0ca27a114so2515164a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790642488; x=1791247288; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yk6u7JlIY9cpCj86tRiO0V0xPpeT5SfEotOmOCGfdo0=;
        b=fitXOy9zc6dxS+c5zUmN31yOhetlZWwa6/+sbm/Z/y14L+3JJcHWbHJT60XwVKobG2
         5nd6lQpke0A+BeBbkotbAYcEL/QQ+krF1VAnfYWrtGoCvHgVyTNO3AZmy017B35y+uOW
         2VQfBZo/zLPAfhjX4pzdYZ8HlGviHJgoR2EF9lpxTO5a7RaXHGfiYMhJ2fquMBFc80Q0
         eF2jgtfSJd0dCZZxiuR2vXYRsMNFiFYE1zn9dNNjn5r+uSyP59K9+wrQ1tNuLB2tSBlA
         sBbewdR2DvGqhHxznG8cgdUa03cSCRwAa7TqByEgbdsPLm8V0dG+ktelpugx3R3mMkWW
         m74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790642488; x=1791247288;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yk6u7JlIY9cpCj86tRiO0V0xPpeT5SfEotOmOCGfdo0=;
        b=npBs4Sk1k4vVZDH42SLc4lG/dS5RZauaJIFOdHWa8N7+JW5dkCuCmv9AkV3i9gh9rk
         zJhvlesUrr2elISSAOkQzIdwLAxZpko64MAfURO7HfcOfG87EIdDWQLUDP/oxZRafG2t
         X6Y0PbGNQW9Pr0NTO4ihw9jKn2lSi3KTk1XrW8px9FlZ6tR3Gh7fHTMz1vuuWrlZlvo7
         BTafMnTOIHtlSrpNlupnxkkmY2yqltYHWSea0PgH5XNCbcZ5vD9jaFF91h+CE9YQUM1x
         8taSnArG7Sj4LIXVk5bZE3RuU6Tgs4vS8lSJ2aOndW8rKYwDGwObdrYt8PqFPh0hA74D
         f2BQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8nH7GctWqfzjL8pKOVNP/ufDLl6lQ2wkfWV77Sh+laeLZZm2ZkhSXxb6bs2I8w1+NdK5gCBHN4VQajGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgZ3MJM4zK7yb08HJQ5gVDG8UzejeER0x13N6RdKqXDyEfolrN
	HSeZC8e3ZL1to9PKS1TiTFBWdoNJM1JEEyunsoPDPhcmwrEGM7Yb4qRFvhcu1olt4ynEUF8cgCE
	P4rRPkA==
X-Received: from pgdu19.prod.google.com ([2002:a05:6a02:2f53:b0:cc7:9e4f:bfea])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c50:b0:3a0:d823:c74a
 with SMTP id 98e67ed59e1d1-3a0d823cb89mr7425271a91.65.1790642487472; Mon, 28
 Sep 2026 17:41:27 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:26 -0700
In-Reply-To: <f0ce99261caf71e88cd0d51a4053abb77454e8bf.1790208413.git.jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790208413.git.jmattson@google.com> <f0ce99261caf71e88cd0d51a4053abb77454e8bf.1790208413.git.jmattson@google.com>
Message-ID: <arsJNv9HrFGMJSho@google.com>
Subject: Re: [PATCH v2 4/4] KVM: selftests: Add coverage for the
 EFER_LMSLE_MBZ defeature
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nikunj@amd.com, yosry@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 23, 2026, Jim Mattson wrote:
> +	/*
> +	 * Per AMD APM vol. 2, if CPUID.80000008H:EBX[bit 20] is set, "64-bit

Please tell your LLM not to quote specific volumes/sections in code comments.
It's a-ok for changelogs to reference specific sections, because those are
naturally timestamped (and can even explicitly call out the APM/SDM version).
But code/comments are usually read without the context of when the code/comment
was added, i.e. are much more likely to become stale in practice.

> +	/*
> +	 * EFER_LMSLE_MBZ, CPUID.80000008H:EBX[bit 20], is a "defeature" bit,
> +	 * i.e. is set when the CPU does *not* support long mode segment
> +	 * limits.  KVM enumerates the defeature if and only if KVM refuses to
> +	 * set EFER.LMSLE, i.e. if the CPU doesn't support LMSLE, or if KVM
> +	 * doesn't support nested SVM.  Derive the expectation from raw CPUID
> +	 * and kvm_amd's "nested" module param rather than from
> +	 * kvm_cpu_has(X86_FEATURE_SVM), so that the assertion doesn't simply
> +	 * compare KVM's enumeration to itself.
> +	 *
> +	 * Note, kvm_amd's "nested" is an "int" module param, i.e. reads back
> +	 * as '1'/'0' and not as 'Y'/'N'.  Query the param if and only if the
> +	 * CPU supports SVM, i.e. if and only if kvm_amd is the module in
> +	 * play.  Checking the vendor string wouldn't suffice, e.g. Zhaoxin
> +	 * and Centaur CPUs are "GenuineIntel"-adjacent at best, but run VMX
> +	 * and thus load kvm_intel.

Happily, that support is actually already in kvm-x86, i.e. there's now a
host_cpu_is_intel_compatible sitting in the "selftests" branch.  That's mildly
annoying as I don't want to take this series through "selftests", but that's
easy enough to deal with, by deliberately touching the same code so I don't
forget to tell Paolo about a semantic-only conflict.

I also want to add a helper for "nested" so that we don't end up with similar
checks sprinkled here and there, but with a scary comment instructing developers
to use kvm_cpu_has(X86_FEATURE_{VMX,SVM}) (I want to avoid having two common ways
of doing one thing).

I'll send a v3 (assuming my code works) with this:

	/*
	 * EFER_LMSLE_MBZ, CPUID.80000008H:EBX[bit 20], is a "defeature" bit,
	 * i.e. is set when the CPU does *not* support long mode segment
	 * limits.  KVM enumerates the defeature if and only if KVM refuses to
	 * set EFER.LMSLE, i.e. if the CPU doesn't support LMSLE, or if KVM
	 * doesn't support nested SVM.  Derive the expectation from raw CPUID
	 * and kvm_amd's "nested" module param rather than from
	 * kvm_cpu_has(X86_FEATURE_SVM), so that the assertion doesn't simply
	 * compare KVM's enumeration to itself.
	 */
	lmsle_mbz = this_cpu_has(X86_FEATURE_EFER_LMSLE_MBZ) ||
		    !this_cpu_has(X86_FEATURE_SVM) ||
		    !kvm_is_nested_virtualization_enabled();
