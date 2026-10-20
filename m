Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486497;
	b=KLe+A+7vu2smaeNzkdbPENsrm5WD6fYbrmCxcXVSN4niWycNUdVcOVAbrbJY27vr0Jhx
	 H+gjsLl4dUXVqQprwLopQht8jvh8n81KRRmtHm5rO12ueb1UGcrSxu4DiM9MvPD2X9dWD
	 tS8iUvHO/jnSCBxZ/2Cpq8nGuNBu1zXHdBLCQwP0AL5xWWBOAK4fd8E7XBligm32JXCFC
	 gzvL6YHLsrbt87o7++5KNeNriwa7fb7KTbMjvoP1mQzrezJKkeQcdiJi51bc9PmJg3iIF
	 toBc4w9AmU8+yGKXUwYDqpS2ps0NPtSJvmipHDXcBIVS9w1FWh67qn1O6uCDmggWYxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ah055MuUD0C6B1dAYun3nbxELChx3aUY//F37qF2gZg=;
	b=m4LRQqkwWnbSm2Keuy88ykfFC9xQrH9BPrNNhpmMqmXsoWTydFszgVTnyKC4FIE+BKZV
	 o1ot/PjGk9wrgsFD9DXXfecOoRU9C8MUPWalXsKktltaHvFBJjIZ5m8OsZehxY5kaKS08
	 UrqK8HiYiCGDSNpBt6IDOjLB+ImEeq4BBF8cTFKXkWByiFT5VJ8hnrice82jEwxbwK+2x
	 YHV/TPb7OwJ9RLjBJruvA1pBl9IdOFekfO6ypnCx3NZ/M4SMs8uWAEacS9z1eZ4BYYY0M
	 Vvr3Xg3x6C3/LMhAUB62Kgm4ccFUlN+9YtMA3kyofQ66IHywc2Ip2d2rhTfdKeWTCNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TEO7fG0G;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DF7606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DF7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TEO7fG0G
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so617421a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792486496; x=1793091296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ah055MuUD0C6B1dAYun3nbxELChx3aUY//F37qF2gZg=;
        b=TEO7fG0G50Io5kgU/X0rvSixXyEC+pcbToqG5fnNyHELaBJOtK4A0yxYmWfBsrsJ2w
         Dd39t5PNPAY37JgNOhLjqzqphQsE1JRT7LAHJ6PBt3yQ6TSTJ2a6ikTGaj4VzqV09Zd/
         kvL0Ni7Kq5pdlHfiUY1/OFnhdlE7HrBRqTnS7wV/v/+NXiu9xgwphxpOczLZMxhvs92v
         F41ipYiltv9JbjSQb+JAtpnHfhzxp0y53l4J4CUgz4mXaK2jU1Rlj0zqcb7X8oQTV7u5
         4iWHwlH4F4iHg2UI6UdhXSOiWqYGl6rq8C01GHHJ8nSBf5Dl0NEBNAz39DiJVWrMa5Wo
         4fYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486496; x=1793091296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ah055MuUD0C6B1dAYun3nbxELChx3aUY//F37qF2gZg=;
        b=tkeecd2dCTkjFvaitFhRIiJt9tStOF4SxNqfLUQauCAa0BuuYtJM4UeQB1tEBcNxbU
         46R57isvM2n8+MIGxGJcmMwpEdUq/02UUkv+hyEhBv5JVURASNUdrBf+jtbRC4Uotfwe
         ssez8XkIQnsaQjNJh81TK2BI+yOMpREscbdeVYQEplKnGik6ZGE4pTS/0OF2eE1D5xZU
         m6iY6VriV6Ijf0di4bd24x2tT4T2u0L4OdppG5BYwJxI6tJc/obEi1qqghHtGDq9uN8M
         vztTjo4zSeDaTsf/LJIuGZk3NSKl9qerlZcIfmBq+MYCYFPpYWYWsQGyf/7u3Z8tcPZn
         FJOg==
X-Forwarded-Encrypted: i=1; AKwUvByHhZ3+orfqiEf7kw4qRCZWIrxFZSs3fXcGxSst+1CNRwDfU0kSzj05SK1zPvKaY/QM4v2IpJ3lq+t2O4E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs1EV89p3oC//m0fGBvDGyOshXT8eenRklqaLA+KCeAeDEqBPV
	qaZaXkzIE9u9PFtCRUSgmESX6lrJi56D1uYMrYVvafr8RQ0/ocKEliOZ
X-Gm-Gg: AYBFou2oxGPNKCYTiTx5NzybMLxxIJxt0+rFFgjcajUVFwa0bYAJ5TVfMnP9GSXKwwp
	81RYMgFS7x/CGjFnhUE1D+H/zeNJ3VNi/XBtof2+YUZ/s/o6bcCkjgC3Hexyzu6O9oXnTKeZdek
	NCcPihMKbT4jDfRzXMrjnC1ijBqer6+sNp724x8VBLmZ1tXwifrybUwxqj+inzMjx5yv7qcmW4/
	kqLOrhQdrlHdFiyGoTeRJeYjywn+e8Eotf8bZbH7RDDsoecJlFxlnvzuLP2Skbl6ebIc/momfPz
	qXi/nVz8diCtomVk1549DrcXvl/957L6DMJZQqRVVZhnKF7L0A8P/FotMRtP8AS5f9uR3oFr0MN
	UfZd0rN1tXugqBqZY5IX3n37sEc9GVKlYLWEirIjwNBqDAefTp0Meekp4pLGB0GLlSkAwCb7mvV
	djebKHs5uGUBEgdpz4d98J/tNZj69GZtnbGTScKZ1CJnrTQLUxgNKaHyZKJ6VwHSIuc+6kEay9P
	l+PWRvSR/OyEy69nzC1hXZrKO7e/RYkl73mkxxmeorJnw3sfQ==
X-Received: by 2002:a05:6a00:929e:b0:880:a842:bb0a with SMTP id d2e1a72fcca58-8a04bf63014mr7973628b3a.9.1792486496166;
        Tue, 20 Oct 2026 01:54:56 -0700 (PDT)
Received: from HXDQXTDYHN.bytedance.net ([203.208.167.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4540237b3a.50.2026.10.20.01.54.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 01:54:55 -0700 (PDT)
From: Jinmeng Zhou <jinmengzhou22@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Feng Wu <feng.wu@intel.com>,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinmeng Zhou <zhoujinmeng@bytedance.com>,
	stable@vger.kernel.org,
	Guixiong Wei <weiguixiong@bytedance.com>
Subject: [PATCH v2 2/2] KVM: x86: Wake blocked vCPUs before offlining a CPU
Date: Tue, 20 Oct 2026 16:54:01 +0800
Message-Id: <20261020085401.80296-3-jinmengzhou22@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020085401.80296-1-jinmengzhou22@gmail.com>
References: <20260924080648.51014-1-zhoujinmeng@bytedance.com>
 <20261020085401.80296-1-jinmengzhou22@gmail.com>
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

From: Jinmeng Zhou <zhoujinmeng@bytedance.com>

Posted-interrupt wakeup state is tied to the physical CPU on which a vCPU
blocks.  When a CPU is offlined, sched_cpu_deactivate() removes it from the
active mask, but a blocked vCPU stays on that CPU's wakeup list and its
posted-interrupt descriptor still targets that CPU's APIC.

If a device posts an interrupt after the old CPU goes offline, the wakeup
notification cannot make the blocked vCPU runnable.  The vCPU cannot fix
the stale notification destination, because that happens only after the
vCPU is scheduled back in.

Add an optional x86 vendor cpu_offline() callback and call it from the
CPUHP_AP_X86_KVM_ONLINE teardown.  That teardown runs after CPUHP_AP_ACTIVE
has deactivated the CPU.  Have VMX wake every vCPU on the dying CPU's
posted-interrupt wakeup list, so that the scheduler places the vCPU on an
active CPU and vmx_vcpu_pi_load() rebuilds its wakeup list and
posted-interrupt destination state.

A single pass over the list is sufficient.  Once the CPU is inactive, the
scheduler won't select it for a wakeup, and balance_push() moves any task
that is switched in on it to an active CPU before the task can run.  Thus
no vCPU can block on the CPU and add itself to the list after the walk.

Use __kvm_vcpu_wake_up() rather than KVM_REQ_UNBLOCK.  A vCPU with no
pending event goes back to the block loop after its posted-interrupt state
has been migrated, and no spurious wakeup is reported to the guest.

Initialize the per-CPU posted-interrupt wakeup lists in vmx_init() before
calling kvm_x86_vendor_init().  Once the CPU hotplug state is registered,
a concurrent CPU offline can invoke the VMX callback, which must not walk
an uninitialized list.

Fixes: bf9f6ac8d749 ("KVM: Update Posted-Interrupts Descriptor when vCPU is blocked")
Cc: stable@vger.kernel.org
Co-developed-by: Guixiong Wei <weiguixiong@bytedance.com>
Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
Signed-off-by: Jinmeng Zhou <zhoujinmeng@bytedance.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  1 +
 arch/x86/kvm/vmx/main.c            |  1 +
 arch/x86/kvm/vmx/posted_intr.c     | 18 ++++++++++++++++++
 arch/x86/kvm/vmx/posted_intr.h     |  1 +
 arch/x86/kvm/vmx/vmx.c             | 16 ++++++++++------
 arch/x86/kvm/x86.c                 |  3 ++-
 7 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index e213c9ae3e301..f2a805783f045 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -17,6 +17,7 @@
 KVM_X86_OP(check_processor_compatibility)
 KVM_X86_OP(enable_virtualization_cpu)
 KVM_X86_OP(disable_virtualization_cpu)
+KVM_X86_OP_OPTIONAL(cpu_offline)
 KVM_X86_OP(hardware_unsetup)
 KVM_X86_OP(has_emulated_msr)
 KVM_X86_OP(vcpu_after_set_cpuid)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 683bb8bf43a94..d47863ce2c5ae 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1509,6 +1509,7 @@ struct kvm_x86_ops {
 
 	int (*enable_virtualization_cpu)(void);
 	void (*disable_virtualization_cpu)(void);
+	void (*cpu_offline)(unsigned int cpu);
 	cpu_emergency_virt_cb *emergency_disable_virtualization_cpu;
 
 	void (*hardware_unsetup)(void);
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 4c52ab8d07869..5a3f77f42d20d 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -894,6 +894,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 
 	.enable_virtualization_cpu = vmx_enable_virtualization_cpu,
 	.disable_virtualization_cpu = vt_op(disable_virtualization_cpu),
+	.cpu_offline = pi_cpu_offline,
 	.emergency_disable_virtualization_cpu = vmx_emergency_disable_virtualization_cpu,
 
 	.has_emulated_msr = vt_op(has_emulated_msr),
diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 4a6d9a17da238..1905472b336d3 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -266,6 +266,24 @@ void pi_wakeup_handler(void)
 	raw_spin_unlock(spinlock);
 }
 
+void pi_cpu_offline(unsigned int cpu)
+{
+	struct list_head *wakeup_list = &per_cpu(wakeup_vcpus_on_cpu, cpu);
+	raw_spinlock_t *spinlock = &per_cpu(wakeup_vcpus_on_cpu_lock, cpu);
+	struct vcpu_vt *vt;
+	unsigned long flags;
+
+	/*
+	 * CPUHP_AP_ACTIVE has already deactivated the CPU.  Wake blocked vCPUs
+	 * so that they are scheduled on another CPU and rebuild their posted
+	 * interrupt wakeup state in vmx_vcpu_pi_load().
+	 */
+	raw_spin_lock_irqsave(spinlock, flags);
+	list_for_each_entry(vt, wakeup_list, pi_wakeup_list)
+		__kvm_vcpu_wake_up(vt_to_vcpu(vt));
+	raw_spin_unlock_irqrestore(spinlock, flags);
+}
+
 void __init pi_init_cpu(int cpu)
 {
 	INIT_LIST_HEAD(&per_cpu(wakeup_vcpus_on_cpu, cpu));
diff --git a/arch/x86/kvm/vmx/posted_intr.h b/arch/x86/kvm/vmx/posted_intr.h
index a4af39948cf04..530f1347f8b0d 100644
--- a/arch/x86/kvm/vmx/posted_intr.h
+++ b/arch/x86/kvm/vmx/posted_intr.h
@@ -11,6 +11,7 @@
 void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu);
 void vmx_vcpu_pi_put(struct kvm_vcpu *vcpu);
 void pi_wakeup_handler(void);
+void pi_cpu_offline(unsigned int cpu);
 void __init pi_init_cpu(int cpu);
 void pi_apicv_pre_state_restore(struct kvm_vcpu *vcpu);
 bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 612ab07d4100f..ff1a6ccbd043b 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8889,6 +8889,16 @@ int __init vmx_init(void)
 	if (setup_vmcs_config(&vmcs_config, &vmx_capability) < 0)
 		return -EIO;
 
+	/*
+	 * Initialize the per-CPU lists before common x86 init, which registers
+	 * the CPU hotplug callbacks that walk the posted-interrupt wakeup lists.
+	 */
+	for_each_possible_cpu(cpu) {
+		INIT_LIST_HEAD(&per_cpu(loaded_vmcss_on_cpu, cpu));
+
+		pi_init_cpu(cpu);
+	}
+
 	r = kvm_x86_vendor_init(&vt_init_ops);
 	if (r)
 		return r;
@@ -8898,12 +8908,6 @@ int __init vmx_init(void)
 	if (r)
 		goto err_l1d_flush;
 
-	for_each_possible_cpu(cpu) {
-		INIT_LIST_HEAD(&per_cpu(loaded_vmcss_on_cpu, cpu));
-
-		pi_init_cpu(cpu);
-	}
-
 	vmx_check_vmcs12_offsets();
 
 	return 0;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a08ae25f373fb..38bffe6ec9b4b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6823,8 +6823,9 @@ static int kvm_x86_cpu_online(unsigned int cpu)
 static int kvm_x86_cpu_offline(unsigned int cpu)
 {
 	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
-		return kvmclock_cpu_down_prep(cpu);
+		kvmclock_cpu_down_prep(cpu);
 
+	kvm_x86_call(cpu_offline)(cpu);
 	return 0;
 }
 
-- 
2.39.5

