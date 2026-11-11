Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395487;
	b=NhExVqb1pO0gfLMP/i8UIai2AEox0w7SMlF5hDWcUgM0qugmuDXkmmmPMLqq+6c3jGo4
	 aQwIj7qEgPitn1WtpESp2P9KBzJDhRr0C+yupMkBOHWahmzn+cYQY6Bh58iunUBin3xWV
	 tOJNHb7WVJFYEeAhJ7VIrg0n2Limic87Fk43BWGONqezgJ7pVr7jDpFT3JEofnxe0cJbP
	 mvWdwocdPsFzVA1HJTX90mcqHdUAArqNSoWYTBKj578ofKaTUVwCeGHWtGwhKuv9FxuDM
	 grxN4wno6jhSVVTZpgrFOORP0pSNtY/pUajzXF3xcddCup0VrJnG7JVEfwVcLqDRH9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395487;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=ml3p/AxADI1kPwVB1ta2/1LkU6QgLRbPMaZJLAyCaWY=;
	b=jvrKmD/WeK7x9vaF5SeaXhhFBKhMmLAOdyF/UFpjj8Awgt9aBhK+STqnM6DJkXesGCaD
	 39LOcjFnKBJ/eHRdgLzhrHR5vGV9SWWwVG5/gpQkL7hVphKK97Kcq18/8saJgR8yfCY7s
	 XpHEE2Grd7X9G6IEhlupgk5XrU3E+wEJr9s20Bb88Hlsl5cPcDt8A7u0cvHRTb8AX6dFp
	 OMFSEyftNYABmiD+iYkRCmn2lrys05BUMuMvbY1XqJG0K2Biu5o2uzjgapWvFZNXRH+XI
	 olIGkUoh2BQfH1OfvN6BBcfs5g+csCzb3rDV5Qy/oOebrtUo7ll2mmiUfyEwRruGHVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1585D606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1585D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so32090455e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395485; x=1795000285;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ml3p/AxADI1kPwVB1ta2/1LkU6QgLRbPMaZJLAyCaWY=;
        b=oCMRzGypT7svoKrFsXF/9bhNJXqB0qMdtTm4uPttLJTDoTPaNbw+pwNUcL4J/6fQfb
         88tcPcLTUG136f6o8ocVSdzGDkQ/x0Zo0uVxcdvMN6vKTAy6vyQQRjePJdkD2S/dXLlg
         DN4pZppF48DQipXFlbfdIK011s6LZVT3+TASD7uyS7uqGIrt31jENrE9N0RZvGHVwbIF
         0ExZQCmmradLYbiupSi0tY8hHCpHzZ7gp4YbeyNZrulVTnPU1TKXY7ArKjkLffT98Oqi
         2c629xfxLF66TBaXkUJgPHm6Sf0s3we8HAJEMkrVSHhAvWg410Vk0Ql6QMNXq/+V0gc0
         RfdA==
X-Forwarded-Encrypted: i=1; AL+hErFLX4dT7hU+RkHvyZUFm7lhIOP2QGRXpuHYm2EHtVr4z6OOmeEdq/ZSAL5k+aL5K5oFN1unGfbFiAWhjfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OXFU/eyZD2c9cBbuKyFH+fnvYtYJEmYkLp8ncDC14QJgp21tL
	305deDHf8wJLpWJicyAXK+RIc3vDpxDVyhXA7Adbo8YDMpzq/ffHR3Ce
X-Gm-Gg: AYBFou3ha2D7moG4H7xrB8Pqim25l1eka/Fo0ibIuedmsGhayXGAyqF+BYZsJJeBwre
	ucmhPo6EanfA2YroAWkByT57pGghZZKY8swfOGLCBZ8+ciP6+EFjyygTmn4sNZvvOHqkbiyUPI1
	5FbYJ5MRHKeBBXxT+jz3HGclDAeFx6vZDHWuU2/u2pt7TUwewrZpc8z1eabhbI4QIV5Gjui7KJI
	rq0xlzvpjstJiXfSJlFBNqvJ+P9piQexT1t3sMLPkCJkluz+j4UwaseUkk2Gfs7l7y+B5vR6ZDz
	OOe6XvoW2DBhn7QGs6QH3PyftWpdC8h3hf40vRZt2kmljiqgIDo77c66KD7Vw6DNkmo/OeNKsZ8
	KEZfy9gxDcYOxalTEM0o1u9qzY1yzs75EMDxrqAKo2bZfn+pOOMU+PrxvN2pk+GLuATYAKlL4o5
	+tYBGm+PO0TcLE4c62++3VIMW6aLBUwktFEFNMGKn0//BoyaFchdiQ8zQ550hYSA5SqeHMT64St
	IEJHQdEjnMeneBUSYNuo2u2LfxsdeorPPZuU046t8Faw7KosZ3IQqZkBd9y6tEyz3Mc7+Url0Uh
	1SXplD7V0efD5yUXXrBzHMF+BEy7yFfe1VqxhPlT1oIWVkzkkpTXpTE++JHyvWjrGMoChQsb+bH
	kF8oLOZXZGNr+vNF08vjduI5k9DPgy5NeOyQatXokGzG2y1srbxYPkYIZq+rwrIqu
X-Received: by 2002:a05:600c:a0c:b0:4b8:4af2:88b3 with SMTP id 5b1f17b1804b1-4ba0938b7f3mr40085265e9.22.1794395485364;
        Wed, 11 Nov 2026 03:11:25 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02043149sm125436565e9.8.2026.11.11.03.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:11:23 -0800 (PST)
Date: Wed, 11 Nov 2026 14:11:19 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH] KVM: arm64: nv: Initialize hw_mmu to NULL for nested vCPUs
Message-ID: <d3571fb535e1832d2a067649f294b83d824d4350.1794395321.git.dan@cryspen.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Before commit 6ded46b5a4fd ("KVM: arm64: nv: Keep reference on stage-2
MMU when scheduled out"), kvm_vcpu_load_hw_mmu() would set ->hw_mmu on
every load.  Now it only sets it when it is set to NULL.

In kvm_vcpu_init_nested() the vcpu->arch.hw_mmu points to &kvm->arch.mmu
from when it was set in kvm_arch_vcpu_create().

Normally what happens next is a two step process.  KVM_ARM_VCPU_INIT
calls kvm_reset_vcpu_core() and that sets the vcpu into hyp context
(vEL2).  Then KVM_RUN calls kvm_vcpu_load_hw_mmu() which doesn't do
anything.  But that is fine because we are in hyp context and the
->hw_mmu already is pointing to the correct place.

However if, for example, we are restoring a vcpu that was saved in L2
context, then the VMM uses KVM_SET_ONE_REG to overwrite the vEL2 state
that kvm_reset_vcpu_core() set up, and the vCPU is in L2 context when
KVM_RUN loads it for the first time.  Ideally, kvm_vcpu_load_hw_mmu()
would set the hw_mm to point to L2's page tables but, since is non-NULL,
it leaves it as is.  At this point L2 can access L1's memory.

Fix this bug but setting ->hw_mmu to NULL in kvm_vcpu_init_nested() so
that kvm_vcpu_load_hw_mmu() always sets it correctly on the first load.

Fixes: 6ded46b5a4fd ("KVM: arm64: nv: Keep reference on stage-2 MMU when scheduled out")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@cryspen.com>
---
 arch/arm64/kvm/nested.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 78fa433774c6..60bccb66e52c 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -140,6 +140,8 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 		kvm->arch.nested_mmus_size += S2_MMU_PER_VCPU;
 	}
 
+	vcpu->arch.hw_mmu = NULL;
+
 	return 0;
 }
 
-- 
2.53.0

