Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66303C81B9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975319; cv=none; b=QgQIYW14CWfw2/Jrz7Bbhl+ycvdhxTrGKc0SWGSWf1NZsX25Q//kpB3aUdP0fLzxf8NwJHGLgWJ5cleJSvLis0sL04tBYpEJvCo3GO2XSimMX/gBAhhnd+6lLK8z4bNswH6ztW1Zsh/k/OV/CkwMI88u8sd2jX7L0YM8PHwcKeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975319; c=relaxed/simple;
	bh=qQHaUt9Qx5ui/jf3XA5Vx5WKrzuF2vNTVY9zHZ1+IO0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a5q7c117Gq/C+o/J7wrOrt/5e33+1yCN4g7fni/fXIrA/KyfJw372LTVYLQcWlWeu57jbbcBrokLv5G0XXzWR/PMKaYPbHF6hwUzR+R23+MSY8nF78vYYmD3q3+XSPBM5KKGxMOsjCO1nIijsZF/L8EyMqe1fjHBZfcRSAh9yDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vLuCw4aJ; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vLuCw4aJ"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso295738a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975318; x=1791580118; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXEfwIOrmzhpBjI7xrdNHIpyWDkfRzHF/aF4EjJTCJM=;
        b=vLuCw4aJn45Zeq+idU4XWU156q4HS8r78ZVKtJP+SE2XGZSuqUib7mj0Q03yj6Zfyf
         aWrjQRYUAlLU93IYDTFgIH0sfUlEUkKdT8gwVmRgD+awIh3LB/+HFzdJOIL8rlNnLqga
         w5XJd8xbr9hABTzCZnvBXg2wNVEG8WXh4u0uDLaKI94xZkiGhJNCo0DdY/052uFe4p0e
         sm3N6mUQu98N7freBUKY1XoOoxfEIWyQQZB0//uSheyAzka1A6QuAhsQEuQLbkXhMzS0
         ydbrk3SBjI27HDEObwlgVRWm4YWdaUZIddkPwkUjTYwZ2gtqqGS5mDeyF7SOr6ZFgZyr
         xgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975318; x=1791580118;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXEfwIOrmzhpBjI7xrdNHIpyWDkfRzHF/aF4EjJTCJM=;
        b=V8c+6F8CcX7jrgOIXqEV9DC7YK+GlVj89WLCBWZCcGDvAKbe60sG4UxuJrPnCtkZry
         pxVpEc8Tp/mxZfDXnsdehUCJtDQvN6nq3A9bZPi/tdVepbg/9bud0jDIybncrzVy8JhF
         3Tq3WOpB8rcVnGD1Z0bUSaaP51kCwS1VX0v5L0MTTCNcJ6ftmgsCf7KsHuVMfY1nPfKE
         Tu8Vkf241hLbtWw4QGFEWg6B4D7pJ90+yXni9Lm2wKOSUZn6w7aDZEq7NYNac3vcCTTU
         D8zqpPv9O8QCJ8TaE9o5Uh4lwbsPVwwK16B07XFWHcvI1RtxhCRKeR+dsUKjeJF/Q3xJ
         yXFw==
X-Forwarded-Encrypted: i=1; AKwUvBxviUZ5Bs6q0GvwKQDnNcCKLqVjVYcHGRoCyU3Q5CBdEWcOcpV55r26jcW0Dr7wtxltlQxlM5Zz7JL4dPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9VxrGZqM07B0dcg6yYze1dIp2jsdvKKVqs/xxNZ8CXf0bhzCm
	dkKSwt5fZACExzrU6UBW9xGfFKjks09vGrr7Wr0HYseCNtRoBiO3iT2e7YYL8f8H1gWaDuZkzSP
	FDPAPHw==
X-Received: from pjbrr6.prod.google.com ([2002:a17:90b:2b46:b0:3a6:c8c9:1392])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b46:b0:3a7:250:333e
 with SMTP id 98e67ed59e1d1-3a7025038dfmr1422619a91.11.1790975316920; Fri, 02
 Oct 2026 14:08:36 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:07:00 -0700
In-Reply-To: <20261002053723.3275202-1-loc@ryzome.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261002053723.3275202-1-loc@ryzome.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097455441.4065912.17506123016485694511.b4-ty@b4>
Subject: Re: [PATCH 0/2] KVM: x86: Fix lost nested APF VM-Exits
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Loc Nguyen <loc@ryzome.com>
Cc: Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, hpa@zytor.com, 
	x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 02 Oct 2026 05:41:43 +0000, Loc Nguyen wrote:
> A nested asynchronous page fault delivered to L1 as a synthetic #PF
> VM-Exit can be lost after KVM queues the exception.  Most callers of
> kvm_queue_exception_vmexit() arrive through kvm_multiple_exception(),
> which requests event processing, but the nested APF path calls the
> helper directly.
> 
> Without KVM_REQ_EVENT, vcpu_enter_guest() can skip
> kvm_check_and_inject_events() and re-enter L2.  A later VM-Exit can then
> clear the pending exception while reconstructing vectoring state.  The
> APF reason remains PAGE_NOT_PRESENT, allowing a later regular #PF to
> consume the stale reason.
> 
> [...]

Applied the fix to kvm-x86 misc.  I'm going to hold off on the selftest for
the moment, I'd like to go straight to having it support both AMD and Intel.

Thanks!

[1/2] KVM: x86: Request event processing for exception VM-Exits
      https://github.com/kvm-x86/linux/commit/88b23a2e8286
[2/2] KVM: selftests: Add a test for lost nested APF VM-Exits
      [SKIP, for now]

--
https://github.com/kvm-x86/linux/tree/next
