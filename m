Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086599;
	b=BlpEbEWHpkl0HFjRTpfxZ5kOU74BT0JB8mlc+7XxwU6L/xczWiFaEDnSQh+3kn5feu0D
	 jVmQfl9OhPgVPD2CDmhBxa1ujxnHytPsT0769J/2ppPaUIabjBwfRVNAbahJbnKu2NnN2
	 IwM7RnHOOTG/kDDlwXGYGNGNxicDCsLvZEHWW1+wrjc1HM1zny5mFeMdZxO6765ZK0mcX
	 4jCPeUb/SJOd72R9olE1KIcbcYXTT/beejt8nb+wfIJnT1YEtUUqa9DUoiQawLNLaAiX/
	 qEw0Yqb09fWj52v5ourB8a9WPkB15J6PrzdMODgRiTmuxvxPdqPOZIqoTg0p3EMhJrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086599;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1iqiUC774uIz1noqTv66R/pcx1jq2Y3gBT5EkDOI8+U=;
	b=dh17JNrxYBM5tBR/rb7SUIazO4wbVWOYk8c5cGtH9K+zNOqczG8nNHqERvVmmtFWbQz/
	 ewhlcH4VVzwQfzyu9GyUJTH972WPJSzSzLwlQl14m4w6wosz5i5Nh+RNVXnksBlldLejR
	 RnBMJy/7wnIt6lgwthrZnobB5fXwMpQTaWXcBDIOA6yKbCSuVMQGOHl3q1DAlH+mcH6HW
	 +TsaHFvid77GmRpK16xkCHiKl52TtJoM5cv6nIr/+gMXYxcuQvegfyknhmNKhwxm4XZUh
	 fX7PMcNzg1Ih2R3vL/KPY/vYE0isgEa4wGGoebB4Fqdep1RsngF8fTB8nR50npcEdkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.94
Received: from mta0.migadu.com (out-94.mta0.migadu.com [91.218.175.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9816860A6F57
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9816860A6F57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dmqT96w8wTTUeTOZNcr8vlUEdj+NSgO8Wwrd2wCr44Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793086595; v=1; x=1793691395;
 b=bjQq2tyxEe9OTBmG0Dqfb2eCsJWmXyMGMm82E3d8RYDnkAPLIxekObBnzI0Gj+Fo7wI6Y92I
 4Aua35paKGksXn8hML4IsMX2SEiQLAhuPembjW9cFF6PVkL4OsC0novNkOoisMmtfEFTbUSuWg/
 fUcPWee6J4fMrnmpzLSp5d+E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 77ba2e4eb353bbfd;
	Tue, 27 Oct 2026 07:36:35 +0000
X-Mizu-Trace-ID: 77ba2e4eb353bbfd
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: vgic-v4: Don't allocate vPEs when userspace clears nASSGIcap
Date: Tue, 27 Oct 2026 07:36:34 +0000
Message-ID: <20261027073634.440288-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <at-saZT_ixQxsZIr@kernel.org>
References: <at-saZT_ixQxsZIr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Oliver,

On Mon, 26 Oct 2026 19:39:21 +0000, Oliver Upton <oupton@kernel.org> wrote:
[...]
> Looking at both of the patches now, I'd rather we just fix the
> predicates and use those to consistently gate GICv4. Untested as always:

I open coded the nASSGIcap check because vgic_its_create() only sets
has_its after vgic_v4_init(), but the predicate is the better place for
it.

> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
[...]
> @@ -1866,9 +1866,16 @@ static int vgic_its_create(struct kvm_device *dev, u32 type)
>  
>          mutex_lock(&dev->kvm->arch.config_lock);
>  
> +        /*
> +         * Make an early indication that this VM has an ITS so calls to
> +         * vgic_supports_direct_irqs() work as intended, rolling back state
> +         * if we fail to setup GICv4.
> +         */
> +        dev->kvm->arch.vgic.has_its = true;

This makes vgic_supports_direct_irqs() true for running vCPUs before
vgic_v4_init() has allocated their vPEs. On GICv4.0, a vCPU loaded in
that window hits the WARN_ON(vgic_v4_load()) in vgic_v3_load()
(vpe->irq is still 0). With an msleep() holding vgic_its_create()
there, my reproducer, which creates an ITS while a vCPU runs, hits it
on the FVP. Keeping the store after vgic_v4_init(), where it is today,
avoids that window (diff below).

[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
[...]
> @@ -248,8 +248,8 @@ int vgic_v4_init(struct kvm *kvm)
>  
>          lockdep_assert_held(&kvm->arch.config_lock);
>  
> -        if (!kvm_vgic_global_state.has_gicv4)
> -                return 0; /* Nothing to see here... move along. */
> +        if (!vgic_supports_direct_irqs(kvm))
> +                return 0;

vgic_supports_direct_irqs() is also true for any vGICv5 VM, so with
this, creating an ITS on an initialised one, on a GICv5 host with
legacy support, reaches its_alloc_vcpu_irqs() with no GICv4 irqdomain,
where irq_domain_create_hierarchy() dereferences a NULL vpe_domain_ops.
The diff below keeps the has_gicv4 test.

It gates vgic_v4_init() on the part of vgic_supports_direct_msis()
that doesn't read has_its. That part is false for the GICv2 VM from
patch 1 and for a vGICv5 VM, so the diff drops your vgic.h hunk:

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5913a20d83019..a60697238a7a7 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -48,7 +48,7 @@ bool vgic_has_its(struct kvm *kvm)
 	return dist->has_its;
 }
 
-bool vgic_supports_direct_msis(struct kvm *kvm)
+bool vgic_supports_vpes(struct kvm *kvm)
 {
 	/*
 	 * Deliberately conflate vLPI and vSGI support on GICv4.1 hardware,
@@ -58,7 +58,12 @@ bool vgic_supports_direct_msis(struct kvm *kvm)
 	if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
 		return false;
 
-	return kvm_vgic_global_state.has_gicv4 && vgic_has_its(kvm);
+	return kvm_vgic_global_state.has_gicv4 && vgic_is_v3(kvm);
+}
+
+bool vgic_supports_direct_msis(struct kvm *kvm)
+{
+	return vgic_supports_vpes(kvm) && vgic_has_its(kvm);
 }
 
 bool system_supports_direct_sgis(void)
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index ed236f083f0d7..0a4b9a74425b4 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -248,7 +248,7 @@ int vgic_v4_init(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (!kvm_vgic_global_state.has_gicv4)
+	if (!vgic_supports_vpes(kvm))
 		return 0; /* Nothing to see here... move along. */
 
 	if (dist->its_vm.vpes)
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index b71d486ae5145..7fc29a395a7db 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -500,6 +500,7 @@ static inline bool vgic_host_has_gicv5(void)
 }
 
 bool system_supports_direct_sgis(void);
+bool vgic_supports_vpes(struct kvm *kvm);
 bool vgic_supports_direct_msis(struct kvm *kvm);
 bool vgic_supports_direct_sgis(struct kvm *kvm);
 

Tested on the FVP (GICv4.0 and GICv4.1): KVM doesn't leak doorbells in
either patch's case, a GICv3 VM still gets its vPEs when the ITS is
created, and the reproducer above doesn't hit the WARN. Does that work
for you? If so, I'll send it as v2.

Cheers,
/fuad
