Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577683;
	b=SWAZwa6JVWQUcOETr5Eu01VOazHp9Hu8ZZnrY66aXlbMbXAN1CrP2xXhOWBuR94qwj3A
	 1MlUA9Ch1AmF1xcNrTcaG4eph/VBEnvKArgXKEQoN1J1+m+vxPFNz9Hwz7IPutQ6YYDHv
	 x8h3YsI5SyCHZoTsn0I36PDdQ6PHt96FvTgAd/bMh/UrCsfQKMteh6iAxApknmftbRLXA
	 4u9JL0Qlw1Azm4LuugqTsgcNHAyHQwD+s+/MCL/m9zjhOpOR0FqAcpWV+Xas3nTKLY52p
	 iUcw/tOztmFagUdiCkoaziQt/M6r1LYaBNoW3T7oytYUFeK4Vf5axKi6QZ7h5t173uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+Rep6yIuauYWXDcGLLrmPhle1wn1pHduGsJ/4dgXiJs=;
	b=LGWmXkuLex0s4/ms/vHiQCuwFZkE/3Fk087t8WIU8IzUrrSC4A5ytEEXKFqNaIDi9eCN
	 OMy+Q2+VUtV6HluLkSW7csoJgH1V5tJkizof4vUHT9b2TwdhXxGGf4ihIhgp4jlqOeq43
	 O+q++cYv5fjdgbImVsulXJPLZ2f68/aW7aYQ/zK9RRm2sWwTiUc3RFLpZIhVJlQPM0w7u
	 xI3HZq9ouQxO3mrciUbuHFlW1563OoYhbCoI8GFz0sAxarjjRbyxrmVNWahwqTdXHRkSF
	 AB4CqH9OgOJHk0agSUVyWxUWi3S5lBtXFP5DnKtjkOB+HYRNaMk1EDkTXYDHI18pReQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NlK2UyD3;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A060F606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A060F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NlK2UyD3
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea381ce04fso14627205ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577682; x=1795182482; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Rep6yIuauYWXDcGLLrmPhle1wn1pHduGsJ/4dgXiJs=;
        b=NlK2UyD3BaewUX0aHskWZVJ+iyQWJvrvZCYIC65FoWE5ZV0MZdqX4x8H/lv0arEk+q
         /TvkTGDmtkuveaFAasI60NEWVXEp0emvVXNBjSCZ3BsWqC4rjNAbUASEzGR7hSzRRncO
         68vnDo6RwflrmO6cI+qo4vwG6TGLF/y3bNqk2wL/UhFhPYi97/5lpN7vN1qs5ksk0Nsb
         qUsUekER8Zr6taEvK+g9ToJT8P0vTjzS1A1xsRfXkBQUdGGgF4kziCfewb4/fLEVe4xY
         cUHkKsHdmt7WotRLYChy2xv6EN3lK7DGOyhi6XkISo23tCKyiY+v2+2vylX1C6i6dlVv
         YJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577682; x=1795182482;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Rep6yIuauYWXDcGLLrmPhle1wn1pHduGsJ/4dgXiJs=;
        b=R8HUyYaU7pOFnXrUwN8yYzGz5U507FwoGWDW+fzWSjnJkJHYcOy5ihIJxZoFoXJs16
         YEelpjqWtggfQGFd6DeeE0gQzI5iV4+uIJ8EHeRsCFt2RtrpTU/qY1wArr7fbwIrqt2c
         tpH9OMPHLcjsLjXgWYCGnpXjFPFOENZ414lZydWqqCfatPheC1JCmB0zQQpi84LTP9FJ
         EDhggWAUiZtcd90kE8yyaf5J9Fxp04uXp+b9+je2sHhh/6pAVn/FXGCuJ0dVI7gvf00H
         GSQUZPAmf8SmrTZW8dbQosUTqpodkbxa5oLQaojI1n7pBNLTZcZrkL5p/S6c2BwIQPPg
         bfVQ==
X-Forwarded-Encrypted: i=1; AL+hErFd7c3bftpg0Dr77V/TjzoaHXcyOBtzT0w40UiaNA54L/5gD3m7W0+5fiafjKU46gqe0oeJnDoJYTUo63g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x0GW8Ke3GOKYStCLWEXrfs+tJoyiBRcvTtGL4xlW9ErZp0FLS
	u682HNtHRW5nJMrJHwwgGxwgfsHf3I1ZFN/i2PTp4Plh5pbWYvoycyw6WCraVAq6g9F/mVfKEtb
	dlYoyLg==
X-Received: from plfp5.prod.google.com ([2002:a17:902:e745:b0:2ed:b76a:1234])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:324c:b0:2e5:1069:fc11
 with SMTP id d9443c01a7336-2edf16306ffmr39054035ad.1.1794577681821; Fri, 13
 Nov 2026 05:48:01 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:20 -0800
In-Reply-To: <20261022192908.554376-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022192908.554376-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441774942.76067.1957792443574511418.b4-ty@b4>
Subject: Re: [PATCH] KVM: nVMX: Clear nested.smm.guest_mode when freeing
 nested state
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Karthikeyan Bhargavan <karthik@cryspen.com>, Chris Mason <mason@kernel.org>, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 22 Oct 2026 12:29:08 -0700, Sean Christopherson wrote:
> If an SMI arrives while L2 is active, vmx_enter_smm() forces a VM-Exit
> to L1, and records in nested.smm.guest_mode that RSM has to re-enter L2
> and in nested.smm.vmxon that the vCPU was post-VMXON.  free_nested()
> clears the latter, but not the former.
> 
> Userspace can get KVM to free the nested state while the vCPU is in SMM,
> with KVM_SET_NESTED_STATE, e.g. with no VMXON region to say that the
> vCPU isn't in VMX operation, or by flipping the SMM flag back and forth
> with KVM_SET_VCPU_EVENTS.  When the guest then executes RSM,
> vmx_leave_smm() tries to re-enter L2 even though there is no vmcs12 any
> more, and nested_vmx_check_restored_vmcs12() dereferences the NULL
> nested.cached_vmcs12.
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: nVMX: Clear nested.smm.guest_mode when freeing nested state
      https://github.com/kvm-x86/linux/commit/809f39842c17

--
https://github.com/kvm-x86/linux/tree/next
