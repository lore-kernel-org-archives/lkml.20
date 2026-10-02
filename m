Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA7E46E00C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961651; cv=none; b=avWoRZpEG4IEAHS8m+f2vZh37BV1VzuC6dPLf5eOVWWv6IXl/tzr12I9xYmA3fVSmUaiON8g629CN9q9rqPubAB2ibZjXgvnUglqcPU827iEDTt+XnApCVHGnu52YpGTQFcNisqvH9UWLYepx+Lq2seMipgTMIRGeWp7x9aI650=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961651; c=relaxed/simple;
	bh=OcY+7/0P/gvQi8VSadBXXsgqQ9SByM7tSMYjbn8eB/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RjMdbgdTbc7Vfn1sLxhVWkN8qNKcePWDCc7COKIvELbWLvZw/egxBDQ6bdpDG0qF5Lcll2UDBAPnboyiUtSdGRJ78HUQcWDoNZBQcYZyE8GStMSoHck/qWV7ZwKVzbX9mVs8U6l8IED1UWPOc1ny72sEbbmzfnqxgyUrJ7I3Cfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvsU/IRT; arc=none smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvsU/IRT"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14c96a4b7c7so616440c88.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961639; x=1791566439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=izTe3vFuNEXuKkViQhMtb+ZI5BaXwvWzbJ/LmOaSmrg=;
        b=cvsU/IRTvs9XYNhpctzW/G1BDBplbwu4gk/DBuMbyRWB5ND2YW4F5lmYT2DnchvroS
         YnbdtNGXYCnsqioCqAZaXY1nUZGvGH5rlXOGIpg/J9DPjqUCuiDhAlVAPj8SamXiMRPp
         5KfeglHOTgAKfTeIfhyw9lJdgKJ1mvG24UvU12RAszxxYrJuebY+PjR0LA653Hz9wmZn
         hQsb00UpUV/i29cftwDYb7OsDyttFjtpJb5dnLV3MayItMDjw7hoIntBtBRoYDegJhtO
         Q5lbPRxU+9jqZfPpijdfnaycCJezx2wU5zEsN2JRngHfv6lAQ1/FyJPFyiwoSlDsW1tH
         svzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961639; x=1791566439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izTe3vFuNEXuKkViQhMtb+ZI5BaXwvWzbJ/LmOaSmrg=;
        b=ybZExk3tZtAJe88l87+z1XxU+mgpJt+81bE+8/C4WJH40Gjca0risOB9PBRdMShvp9
         7kiREK29woThOiQLj3QahiPCpmBzUzcweozVEYQ20Qk3+hiMmouAI1Ncx3hfkcrBNCC2
         P2lYaJ2Q7CjVGNWFt8dhiKBBa9vbOVWUsb2AhqPuyius6759TFQxnzyHtRmYPdL3QI4X
         wrcmf7N8/NxFqX/RcVsuw/0Glu5V2tjTwomsqN0poN0fRO1sG7Z4EWQdY5tYWWZXXFOz
         wc1CXuTToJvvAjrVfZq2OwMfbPZBv/EGEarautv+925YSjwEWC/R9Q2U6KLzmGc1QEXf
         26ww==
X-Forwarded-Encrypted: i=1; AKwUvBzZ4qrW5qUtijGdqWLIvjwii0eQpj68S9gru00nXABdOf8cHSC4tpi5mYZlG7aieSbf2rUz0Jl/N+OVhY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhenGJ5CsyeqrPuhEe9ouRE/3GUywnln9gJWEzO9SKIxOB4Czo
	earxqI/Di70hBq/kGNEKqGAQz8KR9Nc6P+GIZsXbOQ1ly16mH/657e1T
X-Gm-Gg: AYBFou1mtN2On8pVLjeqisTatiCGsxYiU2L7pWF6mw4tmExieqMBzPqytcYkGSH8erU
	yXl+mXQJ/Ds4Xzm8+jyK9qd/Fz6N+QWCJpwdlYfODyoyftEV16IP0ovsQxlaWcTVLgiELBg2by+
	lZFPfDJ7NgJSpgwWE466ZXYB0kgXC9wfdMp4U25VB0yRlZAiuSxkRjDDjgIAHEvWxstfKczPZja
	trBykXEz5nIqFTHkauu6cc2K+jf5I1Bm5Q+iQ1VreMubbA39glpyq3t1nl309e65nrqka9ep4js
	Lbpwm+GF7qEqRWEoLG3Abd8RH95yb/bt34eqhUnV9vKXaCjSANJ63OBfLvxJin7nKbIZCS9NXnB
	vXjCSZTMvK8t68C0j698OtSGgf6cc3ypPwylYhJoPVr7y/vMkDRL4I8/TBxlDhCzG69rMhTeN5t
	gfxloV+HJf9qvR5zKXpqTvxaW7Xbmzs06a0+ePNBMKLzdoZkj6jiw4RQ9yVOMOtag3CoO/skUvg
	NOjLy5H23klNlF/zZ4dKODjpgpNcsU6gjUpiRTCZI/9lk/LwRZbAzUlYOnIbY24fG1oLug=
X-Received: by 2002:a05:7301:e101:b0:33e:6714:3945 with SMTP id 5a478bee46e88-34f150658f9mr5329374eec.2.1790961638951;
        Fri, 02 Oct 2026 10:20:38 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f2dfbbsm7816854eec.10.2026.10.02.10.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:20:37 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com
Cc: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	kai.huang@intel.com,
	marsy12010123@gmail.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] KVM: x86: Protect virtualization-enable VM walks with RCU
Date: Sat,  3 Oct 2026 01:20:25 +0800
Message-ID: <20261002172025.3402416-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protect the vm_list walks in kvm_arch_enable_virtualization_cpu() with
RCU, publish and remove VMs with RCU list operations, and wait for
pre-existing readers before tearing down a VM.

The change that introduced kvm_usage_lock replaced kvm_lock with a
dedicated usage-count mutex when enabling virtualization.  Because
vm_list mutators do not take the usage-count mutex, this left the x86
walks without lifetime protection.

During CPU online, the hotplug thread can load a VM from vm_list.  A
concurrent close of the last VM file can then remove that VM and destroy
its vCPUs before the hotplug thread dereferences the stale VM or vCPU.
Reacquiring kvm_lock from the CPU-hotplug path would restore the lock cycle
that the same change fixed.

KASAN reported:

  BUG: KASAN: wild-memory-access in kvm_arch_enable_virtualization_cpu+0x25f/0x870
  Read of size 4 at addr dead0000000000f0 by task cpuhp/3/31
  Call Trace:
   kvm_arch_enable_virtualization_cpu+0x25f/0x870
   kvm_online_cpu+0x1a/0x50
   cpuhp_invoke_callback+0x291/0xfd0
   cpuhp_thread_fun+0x256/0x4a0
   smpboot_thread_fn+0x287/0x6c0

Fixes: 44d174596260 ("KVM: Use dedicated mutex to protect kvm_usage_count to avoid deadlock")
Cc: stable@vger.kernel.org
Assisted-by: GPT-6-Astra
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
Signed-off-by: Qi Zhang <marsy12010123@gmail.com>
---
Changes in v2:
- Rebase onto current kvm-x86/next; keep the same RCU lifetime fix.
- Clarify the scope of the Sashiko finding: the hotplug update of
  tsc_offset_adjustment and the vCPU-load read/reset are unchanged by
  this patch. RCU protects VM/vCPU lifetime; it does not synchronize
  those field accesses. A separate synchronization change would need
  its own analysis and review.

Link: https://lore.kernel.org/r/20260804123243.2213854-1-marsy12010123@gmail.com/ [v1]
Link: https://lore.kernel.org/r/20260804125109.B20491F000E9@smtp.kernel.org/ [review]

 arch/x86/kvm/x86.c  | 6 ++++--
 virt/kvm/kvm_main.c | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1705e7be46ec..6f57374dbb16 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9664,7 +9664,8 @@ int kvm_arch_enable_virtualization_cpu(void)
 
 	local_tsc = rdtsc();
 	stable = !kvm_check_tsc_unstable();
-	list_for_each_entry(kvm, &vm_list, vm_list) {
+	rcu_read_lock();
+	list_for_each_entry_rcu(kvm, &vm_list, vm_list) {
 		kvm_for_each_vcpu(i, vcpu, kvm) {
 			if (!stable && vcpu->cpu == smp_processor_id())
 				kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
@@ -9716,7 +9717,7 @@ int kvm_arch_enable_virtualization_cpu(void)
 	 */
 	if (backwards_tsc) {
 		u64 delta_cyc = max_tsc - local_tsc;
-		list_for_each_entry(kvm, &vm_list, vm_list) {
+		list_for_each_entry_rcu(kvm, &vm_list, vm_list) {
 			kvm->arch.backwards_tsc_observed = true;
 			kvm_for_each_vcpu(i, vcpu, kvm) {
 				vcpu->arch.tsc_offset_adjustment += delta_cyc;
@@ -9735,6 +9736,7 @@ int kvm_arch_enable_virtualization_cpu(void)
 		}
 
 	}
+	rcu_read_unlock();
 	return 0;
 }
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9fff2f4bf2f1..750ee2f8c720 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1217,7 +1217,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 		goto out_err_no_debugfs;
 
 	mutex_lock(&kvm_lock);
-	list_add(&kvm->vm_list, &vm_list);
+	list_add_rcu(&kvm->vm_list, &vm_list);
 	mutex_unlock(&kvm_lock);
 
 	preempt_notifier_inc();
@@ -1279,8 +1279,9 @@ static void kvm_destroy_vm(struct kvm *kvm)
 	kvm_uevent_notify_change(KVM_EVENT_DESTROY_VM, kvm);
 	kvm_destroy_vm_debugfs(kvm);
 	mutex_lock(&kvm_lock);
-	list_del(&kvm->vm_list);
+	list_del_rcu(&kvm->vm_list);
 	mutex_unlock(&kvm_lock);
+	synchronize_rcu();
 	kvm_arch_pre_destroy_vm(kvm);
 
 	kvm_free_irq_routing(kvm);
-- 
2.43.0

