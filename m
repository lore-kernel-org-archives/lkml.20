Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808843;
	b=vOBBidSZtlkBtSInue2Q7HcaAV/Z+1MLVvwYbWt1kHtiKR+0LiDas/vHO69ApBb08xE8
	 5KpLF5NRXIBQlgd4IgSstASfAdGnTQx6liPtSgx0FJV/rfGz5s9Om3NeQA5eBY4VcZRwP
	 Ro6DuuNsMSbSCNX//M5wZ15M6oUL2VLro6U3YV21VItDLCYOXQAXWriW0bYtJgDAvNA4S
	 iyZ8QwC7HOOSlYgMpxziVxWVd0KVpuzrvSUCbH0u0xawnoI7TjpIFWUNGsbHLsR8QlTi4
	 eIEfEQXwZ0oS0b0uvPX51AWsr+TETxhWh+9G0tWAqJV9mE08LEa7iyT98yskFPn5sOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4EJinoQFWOQAxBpp8/0xszfKNpVkrh34c2hx1lgmetc=;
	b=WP87/HvmxpB5JgEyFa1038oWY1abaQJmGiZTeyLLAWz291NxvT7NTL23hkUl/IB+g9kB
	 bR4sjbkKtB51ZZjmCPxA6JlycSDsknZMZ6WmpGJY2srAobE+7vYonNuTXHKvYqfQxFQco
	 eEwE61jpneyJ+a6q2zkG2HhnJkgQdTnRjOEtYYCg98BFJiVaHGAWgYNscHTF96MIBAcxh
	 Q6s0iFXIbb408VRCZ4wxwoELF0MOFOiJhvoL/e/JLebkQk4Yg7j/BS4QjBshMGL+Nd1Ut
	 Y6vWP+DXZFi8cwCTHk0CDP7easCw/WDUqidEhq3U19z6p8dqRK3uKAzwYer3B232jBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=d9GO3iNB;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1A3606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1A3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=d9GO3iNB
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso4574488a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794808841; x=1795413641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4EJinoQFWOQAxBpp8/0xszfKNpVkrh34c2hx1lgmetc=;
        b=d9GO3iNB2Bctm9pXqWB8hItP9cXWXKvwk7wQllaTWSa3kg3LloGHw6v8aSmSkjbD6t
         QGgy8QIDNx3FY/MVZFAhPEoOAxmwvmEu/FgX6zhZJavk13uAqApGAP4TS+GhLlf6VRjV
         heO8i3gtiHVCxQ+J1+XJCxjOCKNVyCvesinNIa7xxgurdPLAR9FgsmX/Ey8sGR07jmwk
         hQh/hLU6yvP0yTOIg02kcRBCI3VByZpBOI96XE+UUcXQilmELeV4Z+mGkGMDkJ21uJlN
         CGN5eqDtgGDT8GvtqBcavchMgMVpovNa6O6x7kT0hlzxvOWaOG3QDYjFQ9gxmQr+Go2K
         8Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808841; x=1795413641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EJinoQFWOQAxBpp8/0xszfKNpVkrh34c2hx1lgmetc=;
        b=JAxOJjrO1z3kBD4P/rrfzRdUpu181DWN1jh2zNOs63u9bNTD3mA3k97jlOj8YeGpYL
         CouQYGlgNnvQdlKI2KF2pFXtDW5hXPvQEmoTHVyu+4Wotf3zTYn32+u5mSVGxS7akqd8
         jxH3KJt050LTQ84DMHMyhi200JXgVAbRPK7R2jKU0ynous7IUTA6YpFsObGsD1YgXyTs
         Tx3Y7TCXkLUdk3NuexbPPVtOdmUtbr3xRHWZLbMqFIPZc+VHdvoG4s7kzmY1VfvyUYVh
         cQ21nSYtxL7j8gtKhNRdcM6gIQo8fxWvkjO8CXJx0lz5rXF3X+pY7y+yQMnWv2YSqBYz
         sDFg==
X-Forwarded-Encrypted: i=1; AL+hErEH/+2wa1xgLe1Xbe77w/wpLI6VtyXgfAjNdwrkxTuwJHlEpM+XFhcMghnmiO1wvl0iNF0cwmWoXjcB128=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sOTCIxtuIb9HZn9hA+8kbjb0rRcDz15q2HCg+LJBV7HQcKkpS
	Ydi+099x7oTEvYjh1+vB25kikqtoZdBovoKlbJzRVNvLH+lXjvjBqSBCy4A0QYIcRCWGyJiYA9O
	y9pU4zpD7Ig==
X-Gm-Gg: AYBFou0SyeP/CNGb0DSGFJB7RIY3VtTmjrcb7wy2pq7X5WjlMZEuyUcpaQt2ETYcndr
	6/AqW8FlESnPc2KHlvSKMH3mXUvPj/No60ZXsi1/lIdDtCiabBSq8F1AS9eDIXvWvb73igEXb+k
	B+3iO6fLbzgSdMwvSOuTCXwW/998o/n0yvKVtdkyY+QU1CALRi2UK1yQY5sYBlJJRbJE1UALqAk
	9lRmRUvDcBlAXqWqC8GIy22WH9R6mAN1Zmgse/gBmDqGob96nH8THf5hGD5e8JY6A3y1cpSy6NO
	u4s11R2Sx/WV64VPmGTZF24T7kO2w4rhTFGodalJiOkXuLOYJ9Bn0T+3no3+aihRik2jlfApN62
	Rl6XL8GojS0J+dpzdxNXtGtxsjwpCh2e+HodHioF4A7tf/hAGSWIsrnYr0rloNBYrweDvg7LeCh
	44soq6oAqjdlnBC3NEv/wOg7QeJXGqj4+XBmmagUNpeDR9mvk4XhHeiDSzNLN114E+4c7TFOohH
	rl06f08HakTsZoYC26blX3iWkqsuHdFCaVpu7hWOMfnW8hWzDAGQvAOtjPYU3aJ2KDMvjaNTLTV
	0eWePqbGI59lQYcCYH4=
X-Received: by 2002:a05:6402:2389:b0:6b7:1c:ead6 with SMTP id 4fb4d7f45d1cf-6b7c0be11abmr4151963a12.28.1794808841111;
        Sun, 15 Nov 2026 22:00:41 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm3973648a12.4.2026.11.15.22.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:00:40 -0800 (PST)
Date: Mon, 16 Nov 2026 09:00:36 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jintack Lim <jintack.lim@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH 2/2] KVM: arm64: nv: Update the shadow MMU's VMID for AT
 emulation
Message-ID: <5467fc4aae218b86846454bba96c3ba2b95931bf.1794808373.git.dan@pereq.eu>
References: <cover.1794808373.git.dan@pereq.eu>
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
In-Reply-To: <cover.1794808373.git.dan@pereq.eu>

There is a missing kvm_arm_vmid_update() before the __load_stage2()
in __kvm_at_s1e01_fast().  The bug affects nested virtualization on
arm64.

In KVM a "stage 2" refers to the VM's page table mappings. The
__kvm_at_s1e01_fast() function emulates the AT instruction, which
translates a virtual address the way the MMU would and returns the
result.

Each stage 2 has a VMID, which the hardware uses to tag TLB and
walk-cache entries, so that one VM never uses another's entries.  There
are only 2^8 or 2^16 VMIDs, which is quite limited, so vmid.c hands
them out by generation.  When they run out, a rollover starts a new
generation and flushes the TLBs: the VMIDs active on a CPU at that
moment are kept, and every other VMID can be given to another VM.

The kvm_arm_vmid_update() function checks the VMID's generation, takes
a new VMID if it is from an old generation, and marks it as active on
this CPU.  Without this, the shadow MMU's VMID could be an old one that
now belongs to another VM, or a rollover on another CPU could hand it
to another VM while we are using it.  Either way the AT fills TLB entries
tagged with another VM's VMID.

To fix this, call kvm_arm_vmid_update() to update the VMID before loading
the shadow stage 2.  That marks it as active on the CPU.  Then at the end
of the function, undo that.  Restore the original VMID as active while
checking for and handling rollover.

Fixes: 477e89cabb14 ("KVM: arm64: nv: Add basic emulation of AT S1E{0,1}{R,W}")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/kvm/at.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 06765881a4c8..34c9d10188e0 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1455,6 +1455,7 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 		}
 	}
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, SCTLR_EL1),	SYS_SCTLR);
+	kvm_arm_vmid_update(&mmu->vmid);
 	__load_stage2(mmu);
 
 skip_mmu_switch:
@@ -1496,8 +1497,11 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 
 	write_sysreg_hcr(HCR_HOST_VHE_FLAGS);
 
-	if (mmu_cs)
+	if (mmu_cs) {
+		kvm_arm_vmid_update(&vcpu->arch.hw_mmu->vmid);
+		config.vttbr = kvm_get_vttbr(vcpu->arch.hw_mmu);
 		__mmu_config_restore(&config);
+	}
 
 	return par;
 }
-- 
2.53.0

