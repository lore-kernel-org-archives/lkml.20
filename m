Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417574E56EB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286915; cv=none; b=umBXvO6BPp5tbpYPwfZHVg+lmqG7Hth6UuH+fSkr4jAkGxdYurDlkZbNCZ+Nn9T7hV1/4HGUpJo+ltJnGuSuyuTTPQiqAt1F1dw0wdPy0aFLGYnNVqx7ARiLFLhuQAMxjV+HA3/j/kI2ZEWU/D29NfuJkER6etMeKxLmpXyj898=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286915; c=relaxed/simple;
	bh=AmAFroaXL17QSnFsH/PQWr/UvsxMnLiTjSzJHT5lPFw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n886f6Fp8NsfYvCw/CzQOlZQ0HTkiM5/O5t9ol2JM9YKp40nXxy1sCCVrCvVmxfsDgzllReRUijtu22ZOhuRWDBaIPmVpyB/y6fgOamvNdE8oPSlMb8oqjU2umgAolPFNKVsT82waC1C6DhO1sVh+Gnwj3IYa60barLGqvYGX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jx3O5O0O; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jx3O5O0O"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso121279a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790286914; x=1790891714; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezHhSJt+7qSkRvAzEm8z+BVF8AxbcHuofPSZIn2ErA4=;
        b=Jx3O5O0OQbOrlSv8FPt37hOWlflcYKIJzV6Q2m28y7mU9zlKOexP+3gDgCCVAoy4FH
         aOytYokS0GgY9vaWVMiSv2mlApxM5GO6eWPNaQ5mN2k/3LvoC+8u1DzEoG7aFhZ9SJQA
         kSAZhQQaNBsT/+Iy5VWR+CCS3UIWB03v9giPVjNOBJ/aeAGuzmb0Ru00Til+ODvBVl7c
         bINxc5F5k/bBHiv8KkKW4PH2zPjrCnUQ9Nkx7DoN8zuxySuFd2jxy7sMXrEOy4PqRvgT
         rcrndTxnegLxomveVSj9Gpcnzpliv72NV1tEXtC+nufhFeOj2ZQXs9uGqmmMtpxII1yT
         1GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286914; x=1790891714;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezHhSJt+7qSkRvAzEm8z+BVF8AxbcHuofPSZIn2ErA4=;
        b=I7s6fODln9nAY9NMmPIbMU4Ok41BrEDnXuFWDpRJ6C3CqvIkUjHrqGOcmE+e2lkdiS
         EY9xWs8d6/CtbohdoMwbMCLdoQfMCwjmdL7+CoXl4wtM63B7bHeNT3KhJyie/owkB0m+
         e3AZenmAo0BlCM9pqNwYvbkxVxAk/WmopvKRM+OKHquM34bQWXiDHOjEY9lGLrQMGYeo
         pKiR1N7UIKzIj1p/manLSCk7561vP//IMVp8CJsldKatn3ACdRJwD8qBcHiDVvhrBmcQ
         pi7RT8LE6HRi6XmnQeMFbjrZP0LSfHNweWiHldF0INcmS7mQZh6jET3UbjA5HFnNgmB8
         rI6w==
X-Forwarded-Encrypted: i=1; AKwUvByr2vIzvSSlHRQ6hi0TYJwb3EOf9axKT4epifmQ/lzufGMJXAP33OM5y3Fhq8aqasis8XDdwoCT37wtd4o=@vger.kernel.org
X-Gm-Message-State: AFuF++n0EktFFB4202peIJW7pO58VNVejARVzwhx/uABIDnb7QpG6NUM
	ahgJMcDSHhZuWL+Svm0wr6yjPPsvvd7bbfKOc/t5u1tGK4S6c0zIlGGnqG64HbZKMe/TnV5lyTu
	gm2vqSA==
X-Received: from pgte15.prod.google.com ([2002:a65:688f:0:b0:cc7:80f9:3931])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d21:b0:3dd:a196:30a6
 with SMTP id adf61e73a8af0-3de0e9b22f2mr3581598637.86.1790286913447; Thu, 24
 Sep 2026 14:55:13 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:52:09 -0700
In-Reply-To: <20260819094903.3060020-1-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179028366994.2006772.3458650384627466944.b4-ty@b4>
Subject: Re: [PATCH v4 0/9] KVM: TDX: Enable VM-DoS Prevention Features for TDX
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	nik.borisov@suse.com
Content-Type: text/plain; charset="utf-8"

On Wed, 19 Aug 2026 17:48:54 +0800, Xiaoyao Li wrote:
> This is v4 of the series to enable the Notify VM Exit and Bus Lock VM
> exit for TDX, which fixes the KVM CAP issue related with them and allow
> userspace to actually enable the features.
> 
> Compared to v3, this v4 adds 5 more patches.  The first 8 patches target
> for stable kernels while only the patch 9 doesn't have to.  Patch 1 is a
> single patch to enable Notify VM exit for TDX.  Except patch 6, patch
> 2-7 are mandatory for enabling Bus Lock VM exit for TDX in patch 8.
> 
> [...]

Applied to kvm-x86 vmx, thanks!

[1/9] KVM: TDX: Enable Notify VM exit
      https://github.com/kvm-x86/linux/commit/d93395058c19
[2/9] KVM: TDX: Check if there is valid exit infos based on vp_enter_ret
      https://github.com/kvm-x86/linux/commit/0966c881ea13
[3/9] KVM: TDX: Set bits 31:16 to 0 for the synthesized Exit Reason
      https://github.com/kvm-x86/linux/commit/b43c520b198a
[4/9] KVM: TDX: Don't assume exit_reason[31:16] is all-0 in tdx_to_vmx_exit_reason()
      https://github.com/kvm-x86/linux/commit/bc335ce04408
[5/9] KVM: TDX: Update exit_reason on wait_for_sept_zap return
      https://github.com/kvm-x86/linux/commit/e5f1d62c59ae
[6/9] KVM: VMX: Preserve negative return value in vmx_handle_exit() with bus lock detected
      https://github.com/kvm-x86/linux/commit/cef48693da1e
[7/9] KVM: VMX: Make handle_bus_lock_vmexit() a shared helper
      https://github.com/kvm-x86/linux/commit/326fa2c9b4d3
[8/9] KVM: TDX: Enable Bus Lock VM exit
      https://github.com/kvm-x86/linux/commit/63d196e2e204
[9/9] KVM: VMX: Consolidate the exit handler for VMX and TDX
      https://github.com/kvm-x86/linux/commit/213bbf18f07a

--
https://github.com/kvm-x86/linux/tree/next
