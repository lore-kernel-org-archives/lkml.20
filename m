Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7CE485CDA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352430; cv=none; b=hJh693mjZB7adXr6C4TOAViFEOjfYEESwtbDr21B5Lfa5Il8Yku4WDwVvgchY7ETxxix32Bw/btJfRq3cgJhuOT4gfixbRUcjYeoWZS9N2+Dd8ZT4wg3Er5vAFwSJV5VqESB+/QmBbR3XC+ZGfDFVXwjLzCXME09VDwb1UwyQ+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352430; c=relaxed/simple;
	bh=N+f+UuT6+a0N7ggYzBU5BKJqGircvuuJt/u+QCRUOs8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G57UifZXy9F3nZPBhTdKEm30V8HkPHSyjsH0u7xT3LwvTtqQPuPfUGp9H1UPT+dHVt2YG5IVtS48+1TBS6VSUf9Q4zeLLWLbQOar3XMTraFHO5vuJKuUPxEMFPz03nV+IPW8+383LbMFqC487OgTtkH5rW1Qs0XcU3gI0Q9vIh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpvArwDf; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpvArwDf"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so1785531a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352427; x=1788957227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6rTM7bUENLoVHlvfua3MTc5uosJuRt+h5QzbT7OFoU=;
        b=qpvArwDfTeYKsKgrSRs8KGEfmWYB5ZQNNK2rno4AIUBRtapRUeD5LtDt0UESzFuGFC
         +7J2ezBmPeCmklfwP87siW3yOS7Dr14z3oRIpBHVSLRHIxci/tSmYv+dyp0nAw7Xw8fk
         UZkZv+xxdp3hBJu26taCZn+XyRKgI492yOZpV9973yTbh8Q/pWlVVtZe9i8vtQPLPDR6
         3/D+fefcEb94tqFMJc1TBY5oDfXVprKCp3S0Nr2n5pLSdB4kroKQrT2I35LMl0Hnxwjx
         gOCoqiNbtDOHXWn4ATvLG2QEBNoKbX9vCKwdKRG/LrSLYqzlwVVq1AQNzckN+8fBZ9iI
         J5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352427; x=1788957227;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G6rTM7bUENLoVHlvfua3MTc5uosJuRt+h5QzbT7OFoU=;
        b=ov/K5ICmjbfMwWWY9saQnpCdVCOoZHMFYOzeiCmjqScIWWUIxlzbjt3DQBIqQT7VVi
         mkyBSp5YAECjCRfMShKcfVNuz3G0rV4hgOK3hmSHR9pekC3d6Xs2hD1/xRTr99JxsQ26
         pzUEWiNA3uayqmwxedELuSW6eCdrG64VJNtgG5qzjYrxRaNMgWTG6Uj52a0Kvehob6gA
         fbYUPU4NidqfX0NK5VHXKsXeYzZz0e8EagmvdWycfyHPU0z5YGdIjWISZq0GugQu5hzt
         plvpZa2hPXJ0enwb1x/kYPwIGC81YGkQU0cy5++e1XcRhSMTyFoei/RdHLmXTQGuDgxN
         oQSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCLhrXHbr2U5dxM+pXULKcciRSsVxk3JRRv89GQR3YxQJyFg6NzPPiVMl2DBcyUkJsua6zk3Wine7zbu8=@vger.kernel.org
X-Gm-Message-State: AFuF++kle6721TsPPfSTgnheDT0LIpveM9gzrJrGpaK3YhJVRqBIZDJP
	MlgO0F1l6/NFN0yKMwDc38pLK0QlPZqAIZzhZo/yOCOG90QXsNdnTOcN
X-Gm-Gg: AYBFou2g54R0JX+PXgZjVqTQZDN6diN8X0dJ0LNukVYexd+xBZ2LGget3xPBgBe3G3k
	kq1QthGtDl3CMXkJkryg6bcxSTxk3MOeSPzLDPFov+IXpFCRX7hnSy01Mfl4zeet4Vep/bL9bBs
	v/d4Xin/pImqtUx5KE0eLtb4rhfo7XgWNwYJNU88SD2oqnrPuhu0jx/3EHTiDtXMNB67lBUMOhh
	3ZurkXMGlgqHfNkPeM+1zQOehra10NamHEjPWySoCG73B4yVlFWi2GHNN3A83rNvlaInVwpccNe
	LCy6Wz6PECLVvBwEf6kkBZK0I9Utd8aftOIsDOgllp69t1mLx4ZbK0fZjSpOOCtwshVVOHxlN/Y
	oSNK0kByfLN5e8FX/oZDoR0d3taAGFMElynnBCXDI7V9ZTLnwFU0ivsFczu1J7ovLQmpp9iY2Za
	42KAI0UCMuIFdopQo9TRKkPr0GH9ygjuswIopGqZkHY4AOUEVYbNJL5o5CLiotT6pj
X-Received: by 2002:a05:6402:5057:b0:6a6:32f6:f with SMTP id 4fb4d7f45d1cf-6a6829a522fmr2797446a12.21.1788352426442;
        Wed, 02 Sep 2026 05:33:46 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.3.93])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9329b4sm977768a12.19.2026.09.02.05.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:33:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <fed67a81-80a9-4e10-ab57-0759352db7cf@xen.org>
Date: Wed, 2 Sep 2026 13:33:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] KVM: x86/xen: Use 32-bit locked bts for
 vcpu_info evtchn_pending_sel
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
 <20260831213632.81023-8-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-8-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Replace test_and_set_bit() on vcpu_info->evtchn_pending_sel with an
> explicit 'lock btsl' in kvm_xen_set_evtchn_fast(). The generic
> test_and_set_bit() uses a 64-bit locked operation ('lock btsq') on
> x86-64, and the address of the per-vCPU info is guest-controlled and
> only required to be 32-bit aligned, so an 8-byte access can generate a
> split-lock #AC exception.
> 
> Since evtchn_pending_sel is at most 64 bits wide and port_word_bit
> ranges 0-63, a 32-bit 'lock btsl' suffices for both native and compat
> vcpu_info layouts, and only requires the 4-byte alignment that is
> already guaranteed by the registration path.
> 
> This also eliminates the bogus cast of compat_vcpu_info's 32-bit
> evtchn_pending_sel to 'unsigned long *' which was the original source
> of the split-lock hazard.
> 
> Note, KVM reuses the local gpc. The atomic accesses to pending_bits is
> on the page-aligned per-VM shared_info structure, i.e. doesn't need the
> same treatment as the access is guaranteed to be 64-bit aligned.
> 
> Fixes: 14243b387137 ("KVM: x86/xen: Add KVM_IRQ_ROUTING_XEN_EVTCHN and event channel delivery")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260604193554.1BA311F00893@smtp.kernel.org
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Assisted-by: Claude:claude-mythos-5
> ---
>   arch/x86/kvm/xen.c | 47 ++++++++++++++++++++++++++++++++--------------
>   1 file changed, 33 insertions(+), 14 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>
