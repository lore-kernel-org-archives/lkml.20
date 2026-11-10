Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291267;
	b=S/8aAweFsFP3/1RFg7oS2rVQlAevsUZ0g/I53sCctriNzWPjHV2I2q4uSU+OU8o7vJeq
	 k1NdwAuMqdk8eh92NebmUYUCC+V+vi8vIXzhOmJgaolBk4vtWTf7joZ13IKYJMY7/aVNX
	 hqP5CRatfCQOPRCuxzT6jrBuqoIxI3SLdhmxl/39AmKmqTbCoJLWcjc9+SFEHjHK2YExH
	 Ov5LY4yovmN9qZKiopJzkb1W0pXx5Eeq1a71LzB2EepgEgcVbjQl1cOa4lZCDSkUE4w69
	 EjK1CW3uVWkPFpwXLU84a1oSmyz2cju57SH5bMwNb1g94jU0C3xbvvyWnHbU8gRrsYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291267;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=BjkJxNIOZYjYtRtEqr5Rr8/9mY4LqFUYFiIwbhcKsds=;
	b=gMY2S7ZIwwK91N3O7niXmt7v2VFzfpeGx12k1BNli94P/ljoTxVJfV+Kl/y7PHVUYq/Q
	 J4nczZ6skMiugvFOajO2bHh1bRIgFQ93cAj+WxUJ501GTgtZq1mZHlF+COoQwhsUM97Sr
	 mY60z7MLCDjPFGk0YJeUS0kxD+ZZwEtBDyxG3csL0VgysAFLEMNdgALb2potiFSXYOnxv
	 i2T9DOmYwIpRHhYb3g5jtuPUNbN4VXJLsiT41h3C5pGkKCeXqoRlEVMowLmCbgktwX/oE
	 HNb6BmVn7m/pH9c1kiSrmNR2MsDI0l+rHDbFQ4iupvqO6z97EzXrkYrqIvDgTGEED4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80ED606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C80ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b467581b98so14736785e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291265; x=1794896065;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjkJxNIOZYjYtRtEqr5Rr8/9mY4LqFUYFiIwbhcKsds=;
        b=mxVRGNMCMSVmVia6IZqnUxpWxt6mLCFg+QjpfbP/p28EaARcANuPWlCuNLgrliZ7Gr
         Tdq/0yD9r7cf5wQcWuhAgC7e7nrmsYsixJUbJ/MAQ+Wyvb/wjTMnZy2IX1gPka+EUOiD
         ECHZaJlRze8bfbNe2Y0WUAgfab5monN7SuKXe0IbqJ8COsmWwrWLW103Nz5pWA4NqbTK
         k4viurU+CqXf0quqJtMmmxHLybkP2Jk/IJ59S80grErhHimNdvDQqyTyzkd7HY+TnrVc
         Xlz4yNiQTpin67j5h+yz/VSvg9AUTlj9wLHYqo/Q13wL0J71DjNOQVJ3U1+yJXPGw5Af
         5KoQ==
X-Forwarded-Encrypted: i=1; AL+hErEwDPW4kPSl9e1CgWk1CJfy2NbYTTGBTu/B2EAIRTdV+zne7IkCRyrk5Yf4oplxPdSN6AqYfBuGkLUqCws=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ng+QqHBYOItoBrxYR+gpuE9DtNmdWM99moYJllCJtYLcUCQOl
	KW9xWU13jkillpqJB9JUPNxlMwBcBJpjpSjyvryQrnPeJ6eM8QE6WjaZ
X-Gm-Gg: AYBFou1NpGttARl7q621JeICVXC2H4CvEAjkdglT+00zc36l8lqoZIQ8PAcE4fTyJeb
	LmN8PvEIBvd2P0YsMt1qel0te0MPVsYd0l0WdhqoYDHVEsy00l2DDWvEmztu251OdZDGoZGpbV4
	d4AtgZIgIMBN3O9m+yXe5JcrsGuFHlEJVC1dDvhgdo+kUMZMrVzg1aoOCzn7ihkSmkbVVFoEiC7
	l3HN3A/XXs5n96H8VvEvN9UYBjNuQUu7/x7mFvj2tZa/CjrZe46thPkmsT53YgIDk5cRjJ/DK5d
	f/gru7MtAgYW9bDBdAiVF0nt39rteI78ilUQFt/3G37kIXdA5Zy97gPG4OM66GymEEpHxKLN+GT
	9REu1OzNNut/PAIK1r1uT54inoCwmm5BxCwPi/NSnwel4L3OM7ZtyQH2ZN4unmCJS8gsWiEPiFu
	erqOZhKi8w/Ty5DDlYik3kdDV4l2IuRw5eOvwMi6Y4WAA6dSQqNep+/LwptEHKz2um2WW97Ab1n
	NOEKejx2R+kPGpAnnMIZNul6/W45tx4uKwwW4y5EgZrqEIfiXcFn5YxJIeQANlz6QVTXc0rgII3
	8eVFjvEg78pSOwxC2Qgrd0ffC9BpgKPxYRWlg60ZdoHjCbgeXlP0EUf/gYfoW7gZQihcFyrr8Ks
	zKDW1G52RZiIma5/HUwd8r5ges95PwgDYe7Ph0WucQbjGSC6eCrrXoTrwxQ3xglw8
X-Received: by 2002:a05:600c:3d05:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ba0234d4a0mr21225695e9.24.1794291264969;
        Mon, 09 Nov 2026 22:14:24 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835e20f91sm3405814f8f.27.2026.11.09.22.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:14:23 -0800 (PST)
Date: Tue, 10 Nov 2026 09:14:20 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH] KVM: arm64: nv: Invalidate whole L1 blocks on TLBI RIPAS2E1
Message-ID: <6817d113e5f0a9cafe0ce5bc0847276b7f14aacc.1794210561.git.dan@cryspen.com>
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

The shadow stage-2 can map one of the L1's stage-2 blocks with several
smaller leaves.  This happens when the host backs the memory with
smaller pages, when the memslot is dirty logging, or when the L1 block
size falls between two host block sizes.

When the L1 invalidates part of such a block, handle_ripas2e1is() only
unmaps the requested range, so the shadow leaves for the rest of the
block stay valid.  A TLBI must remove every TLB entry for a block it
touches, including the parts outside the range.  The L1 does not need
to issue another TLBI before reusing the rest of the block, so the L2
can still reach those pages through the stale shadow entries.

Use compute_tlb_inval_range() in s2_mmu_unmap_range() to find the L1
block size, the same as the IPAS2E1 path does, and widen the range to
whole L1 blocks.  The other caller, handle_vmalls12e1is(), unmaps the
whole IPA space, so the widening does not change anything there.

This only affects nested virtualization: the host must be booted with
kvm-arm.mode=nested and the VM must be given a virtual EL2.  In such a
VM it breaks the isolation that the L1 hypervisor provides.  An L2 can
keep reading and writing pages that the L1 has taken back and reused,
either for itself or for another L2.  The host, other VMs and VMs
without nested virtualization are not affected, because the shadow
stage-2 only maps the L1 VM's own memory.

Fixes: 5d476ca57d7d ("KVM: arm64: nv: Add handling of range-based TLBI operations")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@cryspen.com>
---
This is part of our formal analysis work at Pereq.  I'm not super
familiar with this code.  Claude wrote a self test that I used to
test, but it's crap and not worth preserving.

I also considered widening the range in handle_ripas2e1is().  We would
need to use the largest block size in that scenario and it seemed like
it might hurt performance.

 arch/arm64/kvm/sys_regs.c | 13 ++++++++++++++--
 1 file changed, 12 insertions(+), 1 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 3d3f4eb82fbd..e1a687dfeea7 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4116,6 +4116,17 @@ union tlbi_info {
 static void s2_mmu_unmap_range(struct kvm_s2_mmu *mmu,
 			       const union tlbi_info *info)
 {
+	u64 start = info->range.start;
+	u64 end = start + info->range.size;
+
+	/*
+	 * An L1 stage-2 block may be held in the shadow S2 as several smaller
+	 * leaves, and R_TVTYQ requires the TLBI to invalidate all of them, so
+	 * widen each end of the range to the L1 block containing it.
+	 */
+	start = ALIGN_DOWN(start, compute_tlb_inval_range(mmu, start >> 12));
+	end = ALIGN(end, compute_tlb_inval_range(mmu, (end - 1) >> 12));
+
 	/*
 	 * The unmap operation is allowed to drop the MMU lock and block, which
 	 * means that @mmu could be used for a different context than the one
@@ -4139,7 +4150,7 @@ static void s2_mmu_unmap_range(struct kvm_s2_mmu *mmu,
 	 * the L1 needs to put its stage-2 in a consistent state before doing
 	 * the TLBI.
 	 */
-	kvm_stage2_unmap_range(mmu, info->range.start, info->range.size, true);
+	kvm_stage2_unmap_range(mmu, start, end - start, true);
 }
 
 static bool handle_vmalls12e1is(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
-- 
2.53.0

