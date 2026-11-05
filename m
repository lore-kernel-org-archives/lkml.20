Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905702;
	b=POrUleQmkZEAmH6oyuag8BiYSk52pfdD6f26YA0K21IBMS391DzrPVG4PPIpN4vHQJH8
	 UC3+7zGzBpdyrZBpYp9l56QHCjawDb7xnfLVHvfvVacTGXfKeW72WFtw/vAU/O8SUGPXN
	 SKfed7gU7JGAo5/0ojHsexWG3bsb82s7czp7tVvx5FYI5c+qfQZMaaCHwfeQSwrG/oSQy
	 mxpAviTI1FJjhTBJv2v+FGTe45o7iTj9LOMbbUWjXviNlKvkRsoKgHX65wsNX/eH+mkZ7
	 UWOY1LhA2JmUYEXl0emyBh74Aqshdz9LF/E8tEL8FNjaJZ9ss5iPh/1ADojHRC2T62Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EgrEjWq1dkccGneJGxtKcBDSZQyn1idPPnv0strekvo=;
	b=JR8Z6MUyh/tte0Jd9jtaKMO7AOU0HO9FuHIcq0VmIsFqkRhVp9Fz3ZyJOtLgFaYdK2PF
	 Lcp4G4BtGJlmtpGPIwgs6RulJ4LU6Dtg90B3X7GEdvyviHShkyDCq5h2lyCyZJ9Y4jEhz
	 YXIL8XJI4hJEbH50QyhTwt3SSd5orvMPIapVoDsRzg34tipSavZ9kyj/TrdSii2HApIcS
	 pACCozMzEWr59hGGU3Q/aK1+ldnqbknlv/YXqiNmmezmhJkvTja6tr/ktMo5BQXHxJ7kr
	 ZSyZI14LhTQpRhCcexhlsMhrheDepoXIyfrqOrXWGwO3rKIb/ztwMVO5VaGUxxY2OSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1t3HC4J;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9F606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F9F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1t3HC4J
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed216ed20dso8123545ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793905702; x=1794510502; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgrEjWq1dkccGneJGxtKcBDSZQyn1idPPnv0strekvo=;
        b=Z1t3HC4JPfaqY5QaOL1TJjLm2Yf8K3fz6vV0RGq//80ezjK0r8FvaUcvEGDJz83cjv
         prpeOohIpU9/yXt/YPfd1Bi39Hh2QwZC8jzoXly0ZI5jRTrxKVvX31zF2oJQdkWdu4h4
         crWCNQFLe0zGzMVrLw+B4jCGZvm4+8OBcqu0Je+R9clIwI0dqEw/OiT9VjKKhpWXa7gS
         XGVPy6CRxOcVctae7OkBKgeSrrtGPcy07MRquXAlr5+elHzx0itjg4Gle0OzSUQY8/fg
         N29D3GkDi0xB14axB4uWFjW7gZMdXkl619+h+Rnc6ycPTHexMkknQKYVgCUFSHwpUfPG
         JfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905702; x=1794510502;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgrEjWq1dkccGneJGxtKcBDSZQyn1idPPnv0strekvo=;
        b=lwNzFouK9ImSeOsUlLNXG2G8IH7Ak8g18YHAlvRVD5auPVBWftl/dSas6SWDsIeZJa
         OG/+I8RcddDjky7HrvNDcGiOBA1A/zIu8T/6iw56A++LN4kNrYUMSboF26CK7F33xgh4
         YNBktozqANZ1bo020f1ZgJqcXY3sInpIgiledq5HwSxEK2/SALgz6fhomTM9W+PHoooQ
         gX2aOgLOGchooPrYgye03cgX63p0OnGivfB8FnqlSnhuuU5Z5OvVSItUvtsBtCaXigbs
         5jLjsyZ40K9A8jTQkHgjUGRnby1GdjxJKEDoGqqvBNGttI6p5FeWocFnSwNgTagk27cj
         6Mmw==
X-Gm-Message-State: APuU4Z+u1FubGXhKKSCVy7KILtn6TQw+wBH9dW3U7IwcXlRoEaptLSTg
	bEDhK3itIqBsODw09/vh5CFBXgE2k2wPe3exJEXlr969dm2uyTkox8Zd8+eFJETqRTlzALVAdku
	USlk+2Q==
X-Received: from plbay8.prod.google.com ([2002:a17:902:8b88:b0:2eb:337a:cac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19c3:b0:2e7:67ad:8e9d
 with SMTP id d9443c01a7336-2ed40da6654mr4115955ad.30.1793905701489; Thu, 05
 Nov 2026 11:08:21 -0800 (PST)
Date: Thu, 5 Nov 2026 11:08:20 -0800
In-Reply-To: <20261105164531.313849-6-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105164531.313849-1-pbonzini@redhat.com> <20261105164531.313849-6-pbonzini@redhat.com>
Message-ID: <auzUJOrdHz4pwMuL@google.com>
Subject: Re: [PATCH 5/5] KVM: x86: move asynchronous page fault handling to vcpu_enter_guest()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Hillf Danton <hdanton@sina.com>, Steven Rostedt <rostedt@goodmis.org>, Harry Yoo <harry@kernel.org>, 
	syzbot+f11512d1e5878ba5e60e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 05, 2026, Paolo Bonzini wrote:
> Fully handle the PV async #PF in vcpu_enter_guest().  This has several
> advantages; first of all nested async #PF code (which has more to do
> with host page faults than nested MMU page faults) is moved away from
> MMU page fault handling, second host_apf_flags is hidden (though only
> partly so, because it is replaced by EXIT_FASTPATH_APF) and the node
> put on the stack.
> 
> Reported-by: syzbot+f11512d1e5878ba5e60e@syzkaller.appspotmail.com
> Link: https://patch.msgid.link/auqAsEk9o6buPNiR@google.com
> Co-authored-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/x86/include/asm/kvm_host.h |  6 +++---
>  arch/x86/kvm/mmu.h              | 21 ++++++++++++---------
>  arch/x86/kvm/mmu/mmu.c          | 21 ++-------------------
>  arch/x86/kvm/svm/nested.c       |  4 ----
>  arch/x86/kvm/svm/svm.c          | 14 +++++++-------
>  arch/x86/kvm/vmx/main.c         | 20 +++++++++++---------
>  arch/x86/kvm/vmx/nested.c       |  3 +--
>  arch/x86/kvm/vmx/vmx.c          |  6 +-----
>  arch/x86/kvm/x86.c              | 17 +++++++++++++++--
>  9 files changed, 52 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 93170c70a17c..f72028efe2ca 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -209,6 +209,7 @@ enum exit_fastpath_completion {
>  	EXIT_FASTPATH_REENTER_GUEST,
>  	EXIT_FASTPATH_EXIT_HANDLED,
>  	EXIT_FASTPATH_EXIT_USERSPACE,
> +	EXIT_FASTPATH_APF,

Ha!  I had coded up EXIT_FASTPATH_PF too, but never proposed it because it wasn't
useful since my approach used a dedicated kvm_x86_ops hook.

I'll take a close look at this series today or tomorrow.
