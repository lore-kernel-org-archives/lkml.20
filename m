Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578004;
	b=tvhsxC3HOEllHB7MC86o3oARgPHk5MB7StNQUXTSBwlRM1ndiC6Ietw52jdKxO4pXtGH
	 CKPKSsIUb9579cuXYArEPynssVOTUMfcQTIXHa0Z/JnQAra2AIVeThZ/5+wTcxKF1c0hs
	 TjrcOmutQYArvJSsAL1o2bj1z2efOnWSw9K2hnJ1X4/u3h/W9fc1YOT//1CT2DPcwdrc1
	 cKqpY1hRAM+Q9ZwV994XqXGrkA3pz8kiKxrscdKREbxTs/l4BqD99Jc03rk36tyYPHTe3
	 mA4drZEhQjYn1hNyeW4MNfBVfhKeUh1biW7nUP3ASZgdMeMmLsEa8yeumtYYsZ0OUtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dlsL3F8sYJVmEsiFaoMpY1LBlwOoTrnSEiIx7tFA8jw=;
	b=iy5C0YW/L20K1izAci3nPhWUv1leDcUojoK2Fq6ezEVNo3llwj7EglcwUhGMrGmeUt17
	 3Pd44wMGtfo2zTNaKWV+YjUvOiwrM8ebU0JFRGVYf38Z/X6EoGyleR+oV/Tsy2Fmm3+ft
	 8lVCKuXj3GlRDz3l9HegAfzURkkWoO0tIHayzR1zw9wlSEqOW3dxCtYshOHAGWgmKaDg1
	 mmRTe4fzx/hpkYZk6Lf9kJaKZ3W/IBFyGlkM7RCdQFir03CpU1sAF2/+FVF4Z3c6J7n1A
	 qrZ8NOjDD790h2ttVZXQwyxQVABAt4uMLPxLtOBq96FOjT2pVIeBJjR7fwzENFdjrkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mxlhe+Qt;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ABB606EB23
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31ABB606EB23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mxlhe+Qt
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so1260898b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794578002; x=1795182802; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlsL3F8sYJVmEsiFaoMpY1LBlwOoTrnSEiIx7tFA8jw=;
        b=mxlhe+QtvpmAYIZcVFMh1eKW1qV6yNglG0IIW1nW/DD8LmyRUmO43Zejqlym9ykpz1
         9QhFn5wny5QjsvrZ9SGPq+8qEg9lDWsnLVH46VaicYKY7hmXj4PdQsGkWeSMTi9q7ag8
         E4/FLwAtjAZhYo+6ROn7RUCBF3kHFkVuy9egxa/sUMu8qoPJNN5wh/8R8T7Os2qFqlKX
         lF58GPs5YPVM979ApTLkJ1GHepac3VXfEIUVREoXwJbDlSxVQxOGhgwprCjZ+u/JmwIa
         DTTqM97kce1wnbt2LM0wRwXPoK9MQ4uKiuVNmhgwgJoXe/XmKvvzQR71X/j9aO8+UfG6
         LBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578002; x=1795182802;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlsL3F8sYJVmEsiFaoMpY1LBlwOoTrnSEiIx7tFA8jw=;
        b=YcO4Cl81JKkO8uRw3rexd9TxP1+KO3J9pADeRVElYM5bGa00eJZjUaFL0E83dieRXf
         vazCS6HXa3bKJf9wo+ah7tLz3K3+5HMVojoRtQXFvH2V/wfL2ykyuI08NieJKfYQE9AU
         7UUXpMUWVLZsZZrj4FVKtCClDnW24u7O6/P7aT7fmyk6yhn2I0XznQ7Abf9hRcorOAh9
         J8Dme1m5iAUeDLF2sDFXUzRO/Y0PYrjOk6PfGN0635FUiXG7E2E3NfPyEJ3zzCW2puoa
         DnmGIG2HYiOIAELCluFGf+kEV3RcwBeC+/zDUQGwl+VpgUSNUF+9iMf1+DzvsAmH2PUG
         Mzgg==
X-Forwarded-Encrypted: i=1; AL+hErH5z2teOg74NFCx3X/L3HHJxR/cBqk0pGO7EiIOWuIhBlsbxq+ly6ukwhsaGkrWu3VKRgUKhWHWGSDaKBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q1uLqUHQHjNA1+z+QjnxlQuEqv5T3QT/b//UfcT0LbCBzOWAO
	EzPX5JssHnnvkn5arV3+ZZrvClUCV8Fi3yrFpIFKhcgIThdXGNq5k2FkC/pqXMZwQMC1SeLyvcH
	8ZqT0gg==
X-Received: from pfew6-n2.prod.google.com ([2002:a05:6a00:c1c6:20b0:8b6:29f9:ce4c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:88cd:0:b0:8bd:281a:5cb0
 with SMTP id d2e1a72fcca58-8beb3b3ccd9mr2811215b3a.6.1794578002302; Fri, 13
 Nov 2026 05:53:22 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:41 -0800
In-Reply-To: <20261022210134.612848-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022210134.612848-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441778800.76592.3104502166440669144.b4-ty@b4>
Subject: Re: [PATCH v2 0/3] x86/cpuid: KVM: TDX CPUID fixes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Binbin Wu <binbin.wu@linux.intel.com>, 
	Changyuan Lyu <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, 22 Oct 2026 14:01:31 -0700, Sean Christopherson wrote:
> Boris or Dave, can you grab patch 1 for 7.4, ideally sooner than later?  That
> would avoid having to carry a stable topic branch for a trivial change.
> 
> Annotate CPUID entries that have a significant index when reporting TDX
> capabilities to userspace, and enforce that userspace honors significant
> indices to avoid creating a misconfiguring between KVM and the TDX Module,
> which in the worst case scenario could lead to host state getting clobbered.
> 
> [...]

Applied 2 and 3 to kvm-x86 vmx.  Thanks Boris for fast-tracking the CPUID change!

[1/3] x86/cpuid: Mark CPUID function 0x23 as being indexed
      [already upstream as 108775fa28fe04a16f19a828a779689f3d0ea9f0]
[2/3] KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate when filling CPUID entries
      https://github.com/kvm-x86/linux/commit/bfce14e80e89
[3/3] KVM: TDX: Reject KVM_TDX_INIT_VM if indexed CPUID functions don't match
      https://github.com/kvm-x86/linux/commit/c576a80cfc4e

--
https://github.com/kvm-x86/linux/tree/next
