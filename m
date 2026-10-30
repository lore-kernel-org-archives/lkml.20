Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385664;
	b=Jt3lqT7r5Nh1lkvi78AVRoR8fYQbqU4nmly9Hoxsy7iehofafg2ReT7LukBGVeOzxyHB
	 zxYv9Yy0eeTP+jieabXfq+XQANx9In0Q+vSxlSYfJaSpCFMnoXj/Q1PmLBAmKJ1+9goD2
	 nYu8RZzhjAx7davdlZp0PDskYfscRleJ+CphtUMUqYBgWLv6SyUPuqJK9iShfCRvlAeMH
	 j5IlZFPgr3IP+2kSriaUT2kSDXC7rpj0QPtcrNS1K+I0qq5Yxuw4sWbkiiHr9NbdjQjfk
	 6SdaGio1ELyWKPh6XyuawZshHM+jwSXdS0mMYNxMOu753uTvZPbBIOhcETJgqrzaelw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Ru4Nxp5wg59Jn04kqGuPVEqcSV5Cvw988WkwJ8HZ7Wg=;
	b=iHZDHuSIuq/YL+o2dW7wI+anw49srKge64zSre5PF+u0lDUgM+zKiR/u0RmsAysmUV5V
	 4DsDZ81PpzYpgjD9bRnRcS/dD3fuZaoae+B+HzlMfI4jnTnGsnJTVeT4/U5CNKyfI37Fh
	 ddQZR+b/r2506WctSWi0zNJ2oSSRnzfCzvgu833h/xp22qmlE6z3DmLLPMgYS4fWlfMc1
	 +90Llb2dQ314QZo08zfYOEtl3aBUIwlmPDHBvEFzvPCz127vaq30PUOsLGdL7hrZiEpUS
	 eIWUJOTunS1n4Tw8CWzGfWRlJEHamyiiVGMh3b7xiaR4vYIAuFm7axIOpvEH/6NKiNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CJ1cgqaC;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A91606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CJ1cgqaC
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd67e98f68fso1083807a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793385663; x=1793990463; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ru4Nxp5wg59Jn04kqGuPVEqcSV5Cvw988WkwJ8HZ7Wg=;
        b=CJ1cgqaCdmVkgVvoSrpzV90w4M7aiPEyxsQZxW975c3eTbCo96gClsF/cWMXPA0Cjg
         8hXj73iQEJ5a04jQ3GlJnrHGR1XdoyMHwB32fx7DA/4o8Nvh7bnf/IU7Mwcrcy5w5ZTL
         ulr2a4S4ghGVbhzgRzWIHQw0iqVNNTL211N7NPeaOOtxudS3IiSk16RGCp6UCNRd+3a+
         eh702HsaufX8wgyMLK33k+Km5UKfPtYmQdXjM32FR1nxQ0lTzOKcCOSr5kANZ3IqvfFj
         A2PdelYDK2e8DE144SdV+ZOnYx13tscLUlAws2FBKTapr7kJsa9Ia6QKr3TuUIoPQHwV
         hxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385663; x=1793990463;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ru4Nxp5wg59Jn04kqGuPVEqcSV5Cvw988WkwJ8HZ7Wg=;
        b=PaQRN/LdsrIOCNJUC4e6L6/3F5RrWcLgJ7KzB9zvWC81XGECuDUQ/zzGWcr+ujolS6
         +pMJSWNhzURoerU2n+6yknsU+3apI6SwXW+u5q6leLQtAKVPNdaMycqT9Zf+1o+XwvkF
         T1AXgplGThcDUEpVni3fejWHKnvd/CHibB3Q2UUq04VIlldZ5btpAxt8wnScXw44vh0D
         +pMGXCt6na9zOYR+7/L9vPT5ooATL6SWZ8pWimszhTl1dXQsgTDF6S8BsuSyxebatOqM
         wVO0tbR+EVvhDTkQDVzztjmtas0lkzugVdrfMxN28hzqB2HgiYclcjkXWhqltFLuLNH4
         NJWg==
X-Forwarded-Encrypted: i=1; AKwUvBzaBGA+VxxB9DOfjSqJDCKtnvUk1JhYXcERIBog0VX+x8UZ69duYPfh5szsNfhnUkgdH1nKg0U4fDBWwWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIu5zJiFcXy1gebQcMKcO0iBYImqNlYmZgxtvLHDogNHlzXPfN5
	C/zjvaz8BGNzIB8D9caQNHYj97fKA8PIKZP2fN+954j9WK7O3OErxUyPuuDyNPdOe8e51QfOWo+
	NAqvIKA==
X-Received: from plhq17.prod.google.com ([2002:a17:903:11d1:b0:2e9:64c:38da])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74e:b0:2ea:33ae:d3e3
 with SMTP id d9443c01a7336-2eb36520f26mr32504155ad.61.1793385663293; Fri, 30
 Oct 2026 11:41:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:41:02 -0700
In-Reply-To: <20261030032937.2813-3-ma.mandourr@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030032937.2813-1-ma.mandourr@gmail.com> <20261030032937.2813-3-ma.mandourr@gmail.com>
Message-ID: <auTkvnRMn4tlcuqp@google.com>
Subject: Re: [PATCH v2 2/2] KVM: selftests: Verify that L2's LMSW leaves
 L1-owned CR0 bits alone
From: Sean Christopherson <seanjc@google.com>
To: Mahmoud Abumandour <ma.mandourr@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 29, 2026, Mahmoud Abumandour wrote:
> Verify that an LMSW in L2 that exits to L0 only leaves an L1-owned CR0.TS
> set, and that L2 reads an L1-owned CR0.NE from the read shadow.
> 
> Assisted-by: LLM
> Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
> ---
>  .../kvm/x86/nested_exceptions_test.c          | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> index f47432526e..e33d2e0db0 100644
> --- a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> +++ b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
> @@ -109,6 +109,40 @@ static void l1_svm_code(struct svm_test_data *svm)
>  	GUEST_DONE();
>  }
>  
> +static u64 l2_cr0;
> +
> +static void l2_lmsw_test(void)
> +{
> +	/* Toggle CR0.MP, which KVM intercepts and L1 doesn't. */
> +	asm volatile("lmsw %w0" : : "r" (get_cr0() ^ X86_CR0_MP));

We should add lmsw(), and also test MOV CR0 because it's easy to do so.

> +	l2_cr0 = get_cr0();
> +	asm volatile("fnop" ::: "memory");
> +	GUEST_FAIL("L2's FNOP didn't take #NM");

*sigh*

Again, I have no idea if you/AI even realize the careful dance that's going on
here.  I *wanted* to say this should simply have L2 assert on the expected CR0
value, but doing so results in false passes because trying to report the assert
means making a ucall(), ucall_alloc() does a memset(), and the compiler likes to
generate SIMD instructions for memset().  I.e. trying to report a failure triggers
the #NM that L1 expects.

So the code is fine, but this needs a big fat pile of comments and the changelog
needs to explain what's going on as well.

> +}
> +
> +/*
> + * L1 owns CR0.TS (set) and CR0.NE, both with a read shadow of 0.  L2's LMSW
> + * must leave both alone: FNOP takes #NM and L2 reads both as 0.
> + */
> +static void vmx_run_l2_lmsw(void)
> +{
> +	u64 cr0 = vmread(GUEST_CR0);
> +
> +	vmwrite(CR0_GUEST_HOST_MASK, X86_CR0_TS | X86_CR0_NE);
> +	vmwrite(CR0_READ_SHADOW, cr0 & ~(X86_CR0_TS | X86_CR0_NE));
> +	vmwrite(GUEST_CR0, cr0 | X86_CR0_TS);
> +	vmwrite(EXCEPTION_BITMAP, BIT(NM_VECTOR));
> +	vmwrite(GUEST_RIP, (u64)l2_lmsw_test);
> +	vmresume();
> +
> +	GUEST_ASSERT_EQ(vmread(VM_EXIT_REASON), EXIT_REASON_EXCEPTION_NMI);
> +	GUEST_ASSERT_EQ(vmread(VM_EXIT_INTR_INFO) & 0xff, NM_VECTOR);
> +	GUEST_ASSERT_EQ(l2_cr0, (cr0 & ~(X86_CR0_TS | X86_CR0_NE)) ^ X86_CR0_MP);

Just use vmx_run_l2(), most of this is copy+pasted from there anyways.

> +
> +	vmwrite(CR0_GUEST_HOST_MASK, 0);
> +	vmwrite(GUEST_CR0, cr0);
> +}
> +
>  static void vmx_run_l2(void *l2_code, int vector, u32 error_code)
>  {
>  	vmwrite(GUEST_RIP, (u64)l2_code);
> @@ -149,6 +183,8 @@ static void l1_vmx_code(struct vmx_pages *vmx)
>  	vmwrite(EXCEPTION_BITMAP, INTERCEPT_SS_DF);
>  	vmx_run_l2(l2_ss_injected_df_test, DF_VECTOR, DF_ERROR_CODE);
>  
> +	vmx_run_l2_lmsw();
> +
>  	vmwrite(EXCEPTION_BITMAP, INTERCEPT_SS);
>  	vmx_run_l2(l2_ss_injected_tf_test, FAKE_TRIPLE_FAULT_VECTOR, 0);
>  	GUEST_ASSERT_EQ(vmread(VM_EXIT_REASON), EXIT_REASON_TRIPLE_FAULT);
> -- 
> 2.25.1
> 
> 
