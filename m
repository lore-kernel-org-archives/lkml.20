Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214184;
	b=JRI2miYDGzMG51BCD8iXunv9mVainFhWKyZa/itq8xlnoY/ZwfKQuFc3caIYwyuZ0Wl1
	 tp/559nwY3zfX3SSTHp1bg42t2YhZpOmlfdN8R3zXbljtCUoHIk70TDvjbeV+5K2S5SFX
	 spSGSKTfShaOR5TQnVDGfBg+UGoXxJAM5GFzzaap8uzipcHaxdOhMIa6ZQ6b7kJwG+ZWC
	 ya6Ivp0FLeHlErA11CvxxWstskGJlq98CCQwcPKye0PnJ/qJxCvQbptAAS9iogwUUp6lz
	 vRX/LbnE7MD4orEkVXvXDpVS6w94ZlRss+YFzT8NKDsUT6r4cZ/q2nMY8pec5Fp+9+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=;
	b=2dwG/m2t/qzKBpM0VBx/Dr4W0QTphndoKtuXkovP1pRvH2hWXc6PUmaspwWGfMYSAliM
	 YYwPzaI1PmztKpvHWYmXIG/oa5F6fiL1niPBGxnLPdJ2/p4DVIzQPbY2yOEgeTAdlz3Gb
	 NVedg4xHMLn+qjTv7CPjO6jLc12t55HOl48PH9eZBgly5TtuERErZIkC+xy6+yNplM5Pz
	 79Ad0x04U7P4SrBufbDtp1wOUodHKX7/mXsj/WDtWcckjEPOY86vsbRVRyUijwQOPdN2y
	 K3RI7bKuzEL+DPeI64l0j1btFQ8I9HnoP7pYY27xFwqKiEPwO7VVeUyOwv4VbePT1UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PBBEXKdM;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87D0606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A87D0606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PBBEXKdM
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1920900a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214183; x=1793818983; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=;
        b=PBBEXKdMwfX+FjL1d5AZipaGfCOiVWPE3ZyGym/gyDjDtfCSZrVdtSa4uiqDHkUAnw
         nWn0JCeheccbKH+eq26vu7CIhvWZv7xT5cW7fsKeMpcAlFpHqzT5ibP85wG2AX/lsRon
         TdSnzsVXvxkKaZGTazt7S0ncI90qxjJdg+x21UouS6k4kJRok83E8UPGJr897LPL3tDR
         /Nx3bD17OLmsPvbZe4ifj4bJFa5nRrjMjbh3Fcx2L0ohXcoB4bWCgz/MfbE825NH4Bcv
         JyNMLGtOSIuFQPO/uobuTFC/iJS3fXRYHvdJqMkt4W9++3eQzL5XW+luaLqedqQZ/n95
         IBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214183; x=1793818983;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=;
        b=1DINi3o/su1KJhIuflqwS7FTqey0WR5xm845A/gH3xBS9RSdSLDVn8aqitu1GGRP/o
         3ZYZ34O1ewsNYycjuWNC5SIRBz2/YBWjgPJF8F2EvjfwmRNQPi+akT2ttO2ZU52xaRNJ
         YJRaRvMNC6d3wHt27VY/kZIFiS2JkqtyPl1ikW+YB4gJPsaKv7nWPpJ+IYXr2QgmfPWJ
         O1q8RPoiKYXJDaXukMPRmI7eZlii6DSoX883VEJrAvItNWdyxl9c+Goxi6TznSHIf7ol
         zULFcEVumEMnjp38s6Uh67yYAn/4xMmzGT8GqzBQsHFLRWQW2mWA88tG657JH/8uvQ+6
         OJRA==
X-Forwarded-Encrypted: i=1; AKwUvByQ1Lz/NPja7p9GQHUWOPaLVu7PFAQcvHeOVolNqT7TT5l42sZR8ETyF3TK+31uXTGS1ocsbt3rVy/09o8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbsUuJ1G/cHMJTGcMd4QkyKUYJAQz9DOCekVKc0BRdBK2gmIMV
	oZWe4rWjdibW3Rc+eFaKAFcaW+UBwpVMNP3st3gz3vpHX7usLrN9XoUjHPwwXlGxFZwSuSSdFeE
	h7bIQ5A==
X-Received: from pjbmh6.prod.google.com ([2002:a17:90b:4ac6:b0:3aa:f38e:cb2d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:264d:b0:3ac:9d83:8856
 with SMTP id 98e67ed59e1d1-3ae57e3d6c1mr2423992a91.9.1793214182870; Wed, 28
 Oct 2026 12:03:02 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 12:02:53 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-2-seanjc@google.com>
Subject: [PATCH 1/7] KVM: s390: Drop unused and unreachable kvm_arch_vcpu_should_kick()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Drop s390's kvm_arch_vcpu_should_kick() stub as the one and only call site
is wrapped with "#ifndef CONFIG_S390".

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/s390/s390.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/s390/kvm/s390/s390.c b/arch/s390/kvm/s390/s390.c
index 18fb200f854a..9900a1a1c148 100644
--- a/arch/s390/kvm/s390/s390.c
+++ b/arch/s390/kvm/s390/s390.c
@@ -3922,13 +3922,6 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 	return false;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	/* kvm common code refers to this, but never calls it */
-	BUG();
-	return 0;
-}
-
 static int kvm_arch_vcpu_ioctl_get_one_reg(struct kvm_vcpu *vcpu,
 					   struct kvm_one_reg *reg)
 {
-- 
2.56.0.313.g2479322e68-goog

