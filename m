Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702901;
	b=KpLDf6A+6H8kdT0d0PymHQ6TBCYpR+Hye+OBkxm+w3kV+sDXG1F97/8a4Yz29rbVKBMa
	 WNFjbsW8dyC6DUn5us/q9P0Pd7iMQ6oC7KYeeiE6VjVilFRP0GWt3ofan636OUStncHWm
	 Z4AxHVxYQFumiy5o6ycCt9yTi4uG1WED62vlKVmR3EPU481cVDIzqIVVLAVAtz+PYtV4b
	 36mktlQiquWwAd8/RrU/fOIsfJyZvqTbWCWqqLEbexQd8tTz2+RTxfro+LLr3faSZaYCm
	 9SE1AyBWJ/soXOF7KAvz9NuTWuVwjpRX8f/qB0p2p70MUKXnjZe5Ga10Pj6b71y+WbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=OCOTNO/IXud/wgdz3r5yHSjAgnmq1BH8vHgLtdaK+l4=;
	b=KT3/9HB3dyuGM6J4CGfFbf7+OsQIMAS/UV0dnojBzYIf9tlGfEK63R6bWUXKxN2F5pmG
	 TVvOisoii0ogI8Udf4pBbDn0xhtPNMp1C4WbXPtamCqhZOZfD5kN6F7RbFv9ZRMnJMkae
	 tZ1TG2er37ayVDg1+rCMGRhRjx9cl/pvb4NnWnHuMCje4/eQxz0MC08BMUuv7iJmv27Hc
	 bZgWM7hrt/GLgSgFYhlRHEfPT9QNjDtf50BP275UalYDIdl7BztJf0WA9LzTN+g9Hu/T8
	 jLBaezMCukVh6hkHbLupqqeeL6NXZCbJ3cn9hafA+Hbmegel4JlxaHDsHTzYSbgI9RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DrELhp+l;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA2606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20AA2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DrELhp+l
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89f71ac2e2fso198343b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792702900; x=1793307700; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCOTNO/IXud/wgdz3r5yHSjAgnmq1BH8vHgLtdaK+l4=;
        b=DrELhp+lBsFky1XaNVigTB5xQlL8X0/xojJcvUjAHF6FgpTphCdmGUlv0pjsAUE1uA
         5l3WXId7fm4EO7HuXPGCBZc3M0oUD/RZlZ+Bsm7+T8E7kEJpof1xHawdM8UUO4NPuR2H
         YwKL9D224gRJvUSfh7wRTv3wZ9hofXB4JrhYQ/vPZ2gh7ToSZzJH6LzTt54aDu9QjS/J
         d6wlFo1TQYc5mCJHzgXcv2Rv8AT/LJ7ZNNgBMoqfI1UtxVxbfU+2T+JJfrbhaOCFU1IT
         JDGu9ESCUTUV21mhPQtb+tabzewR9WArk/mJxDM5II3gHn5GPkDVuVP8pTl1uSXsUJAB
         Qwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702900; x=1793307700;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OCOTNO/IXud/wgdz3r5yHSjAgnmq1BH8vHgLtdaK+l4=;
        b=vPx+99MEf6+AqaNmNo6NJJnzPsP9CRIDlhZHZibQDPHvuOAT/iSahxIEqUuZcaBHx+
         JTSl3MMIzD7Ig45aCS3AWxLU4FM9g9EBI28b1liDtRKPgSCJbNvK0SiloMBXoWy41KjB
         ar4Pv7DYSdeERbqgFPkx3MoVat+AeLBYJtEBAR+jTuNQ3sQLOeP5lqw0IX1tyAvrOdDw
         lvpAPqGcuHUR0df69iANbW6bBnBJJBXWYi42TNI1attu0+0hVq13lj3hxYI/keRj/J1h
         8gdh+AB5+BtOXEK+3jEGFXH2p7yVe3bbsz6edctNKFU06oYjq+KivaZDE7kkXAnKZzIz
         5oFg==
X-Forwarded-Encrypted: i=1; AKwUvBxjEIefJdinn4YB4q0Q31SZP2sd/GGdjC1yxO3j2JWt1LoiQ0rXaj0A/iX0j/lOapwXN36dtuD94PE0UkI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPTre9IF1VIGyqilO8NOTcI+vXH2dtaPHYt6lQWky4geHzIyfN
	q+i1zjgstoWlS6sK88/cAoi8xL7PrCOhGmxGGGIDJoY6cUIX+BDid5BJyZUW8gaurKM7PQ9iJdI
	Omlz6YQ==
X-Received: from pga23.prod.google.com ([2002:a05:6a02:4f97:b0:cd8:b4c4:efd9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3e01:b0:3e2:2c81:bc6a
 with SMTP id adf61e73a8af0-3e376674955mr107626637.47.1792702899271; Thu, 22
 Oct 2026 14:01:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 14:01:31 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022210134.612848-1-seanjc@google.com>
Subject: [PATCH v2 0/3] x86/cpuid: KVM: TDX CPUID fixes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Binbin Wu <binbin.wu@linux.intel.com>, 
	Changyuan Lyu <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Boris or Dave, can you grab patch 1 for 7.4, ideally sooner than later?  That
would avoid having to carry a stable topic branch for a trivial change.

Annotate CPUID entries that have a significant index when reporting TDX
capabilities to userspace, and enforce that userspace honors significant
indices to avoid creating a misconfiguring between KVM and the TDX Module,
which in the worst case scenario could lead to host state getting clobbered.

Patch 1 is a fix to mark function 0x23 as being indexed.  That change is
needed to avoid tripping a WARN sanity check that KVM and the TDX Module
agree on which functions are indexed.

I'd like to take this through the KVM tree as it seems extremely unlikely
the cpuid_function_is_indexed() will conflict or grow other dependencies,
i.e. creating a shared topic branch for this seems rather silly.  Actually,
a better alternative would be to rush patch 1 into 7.4 so that I can use
7.4-rc2 as a base (even rc3 or rc4 would be a-ok).  /me adds an intro

Note, SIGNIFCANT_INDEX isn't a typo, KVM's uAPI macro is misspelled...

v2:
 - Add CPUID.0x23 to the indexed set. [Rick, Binbin]
 - Document that zeroing the index when it's supposed to be ignored is KVM
   ABI that at least QEMU relies on. [Binbin]
 - Zero out all of flags to ensure garbage isn't reported to userspace.

v1: https://lore.kernel.org/all/20260223214336.722463-1-changyuanl@google.com

Changyuan Lyu (1):
  KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate when filling CPUID
    entries

Sean Christopherson (2):
  x86/cpuid: Mark CPUID function 0x23 as being indexed
  KVM: TDX: Reject KVM_TDX_INIT_VM if indexed CPUID functions don't
    match

 arch/x86/include/asm/cpuid/api.h |  1 +
 arch/x86/kvm/vmx/tdx.c           | 22 +++++++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)


base-commit: 814607cd40df80d5727957adaa857e0feca43497
-- 
2.56.0.257.gf7497c7d27-goog

