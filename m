Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636096;
	b=E/pMGzngHapk7mJtb7N3aykPaDyvw+tcgbVUbPqbeY3hjhDFTVXA5ZhN15FSBvJN3wfT
	 3Cmvz/E+lOmPVHVfYbK6LE0N3CjA3GDyUSz3VQGpLVWTzh4Oetf3gggrSB2fqBsHEc7LU
	 SVpfdiRYP0MUunI7wKA3DV0fD9ovTe1TKJflZ542+xS5uK276RWUCW8DdTiSUPFA6St7v
	 L3+0sW2MnlsZ05tkk1YMJsM8l7rSwjLBPzJ++27icF2sUE00pieK7edVZPMojrZP29nGV
	 hPZCejlWPukA7m93UouFOZM7E60nDH4Sc3DGPrNAvtNOvyilJqe8xgOz7gMmf6AdE7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=r7COp7eSdmI3KWQdqQlR04zrDpvtCg9K9xahMpH03/8=;
	b=vZuif+jNOSvzzFRT2dD+aA/PkMuZDE7V337M9rDcJ1qM665B/afWmRuAJONi0YYQeZn6
	 ZFT8s8JB3CASdInBbGp/ZPV52mD0/KJYGBY9mSL/Yp8PSjWVW3MVniJXLi3ragG2Btb+z
	 //9DJljoiH8uLGMdGztzegkuK3O0DthqKVJWhi4w4o1/8/ed2kVhm1l221+nd/W9JOQaD
	 SEQ0vU9tq0McHZa/647+tKm25IdxOxEGfIeP/QEuZMxIFd5FS9zQNyqGn7EwS9sIDU02A
	 2qhMgIlvYDm76z0psQpDOOgWGpnSK9+2sspThNvf5G7wl+Y0HFbieO/+bQgRaMhU2gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Td8AW8Mx;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F248606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F248606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Td8AW8Mx
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e617b5e9b3so10236845ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792636095; x=1793240895; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7COp7eSdmI3KWQdqQlR04zrDpvtCg9K9xahMpH03/8=;
        b=Td8AW8MxqevqQ5s9rozozIe6yUPmCMYWdP1+M1KZ26QmRay/baJiIlJ7r4V95fWpu1
         Wg1WBH3PfxSejXKwlg7uSiGgVyx5SA0qy7nQ1M800/PHbWxaa8t8Qzl/xtdIW7Yw7tHt
         OURL1ftyosl7Y4U9inFkhrO/WHXWq/eLX4KXGmiY0hWrr+/BY8MrBVIYQxFFsaND0SKY
         e63thHRbrmqKChEDgTxlc8A0UZjk4zBegumbVpBtdSrJI5wnX0CDG3GUf1kp269V2tDm
         q9815mGxRU8lUmGdsUnWkX0HzDwBg6d5X7FkqIQiPYk9BYDNPaeubF6BUqpdN/+xrkOV
         /5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636095; x=1793240895;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r7COp7eSdmI3KWQdqQlR04zrDpvtCg9K9xahMpH03/8=;
        b=c/2h72cq05D9HpDtBRCWCEym7wrHRhvW0HTkGVfiBqDiCxO9hENu7M9mOG1W923aSp
         LEIeGMV1NwTS/8fAmq0dtdQnRNjMlgzr8TjOHRUcbBOKQ4YAswj5Mr1aM8KtyuR6PkDH
         rP7V/pXL2f02QHqOV1lU7G9CVeQvZTT0Hv31okcTVnUaxV1Izi2WKHdnjmDuM6JCb+90
         DYkYL6KjlcnNCxehVNEerk/8lVO0EN0pK3daGjy9wfUCfBJ2hsw3yuXkS3g1jeMx/q2k
         Fyn5tDIRV0usslHkx7sT/D5/t9x2/e3RPKijTWU3VFfPSdHKbfzQ+szB+2hpaT8qhM8R
         p/XQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzCEI8NiCkh0dX//z+WcJMP9eINV4rEfyH5V3uBd7w1Kuh/rzKvotoX6SSVyBK/TVhx7VcHfsUcOqIXNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYILlq8EmmQ2QFqzyUKAVJqplfiyaa70hliQQYJTAkhMbR1n/uyQ
	Ghzq4H5HzO8CIfz0SUWKjb497mk5nYdoBIW2NXfLXm1/ZejDHtVNuQtkomoxrAK1JAkndXJWTbK
	FrxFg5g==
X-Received: from plbjk3.prod.google.com ([2002:a17:903:3303:b0:2e4:b03a:397f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:32cb:b0:2e6:13b1:e196
 with SMTP id d9443c01a7336-2ea43d8876bmr28645595ad.74.1792636095139; Wed, 21
 Oct 2026 19:28:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Oct 2026 19:28:11 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022022813.303978-1-seanjc@google.com>
Subject: [PATCH v2 0/2] KVM: x86: Drop deferred updates of EOI bitmaps
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="UTF-8"

Stop deferring EOI bitmap updates.  As pointed out by Amirmohammad, I missed
this one when removing all the other cases where KVM defers an update until
vmcs01 is active.

v1: https://lore.kernel.org/all/20261017093016.32348-2-amirmohammad.eftekhar@cispa.de

Sean Christopherson (2):
  KVM: x86: Switch to vmcs01 to update EOI exiting bitmap on-demand if
    L2 is active
  KVM: x86: Consolidate invocations of kvm_x86_ops.load_eoi_exitmap()

 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/regs.h             |  6 ------
 arch/x86/kvm/vmx/vmx.c          |  2 ++
 arch/x86/kvm/x86.c              | 27 +++++++--------------------
 4 files changed, 10 insertions(+), 27 deletions(-)


base-commit: 164405e8e9a0378c7e1aff2254625a6553a291f1
-- 
2.56.0.218.g1ec904b173-goog

