Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690449;
	b=pSgnOm7SHlxFNrb8IAUWVsZr3WCoK4Aneaf1fWTY2+oV8dQRzF/8SsB4BMxgAu4rwqBo
	 7XHJOm+xAo88O+6HpeU0j1UZ2oBj71zzRqKSqDVV5BcJUL8W1n1qxznKNutDYy2l/a3yB
	 25G93U/6AyZ4uAsG/a7HqT8W5TC+nbNFcDqD5ST4lWqqGqjploZbPqfJkPuKZn6/D04tt
	 c5ApNKM0WemzQiyr9VrsxOv6dlq3Ze2VoiVgsOhcrgLTtXyuS2JgmPL8VQV8dCYQh+rYc
	 TFUa53dLsdCocLWHSrLOmI/SnHSmeG+r9/zFbBQzsa/U2LDjMbYBFU5g/qtTMUzBu/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690449;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=NYnvmmVZ+DB0wY8M1R887gq0WKcmk09L6Gjh3jQPaE0=;
	b=Niu5NVZxwtqoq2TSHV6/j25rvHjlm8zsKMlcToDum10DR1Xoc8lKnePjE0YhWoz6sPNi
	 6KFTLLinTkyef09IKGgbo3W+Mn5xNbXDQc18qekKTLiFz64pitgTJRa4ppH9gL7f6IbNH
	 1azt2UGZhq+EQ9IwnzOMN0v2kFarSo8/+v5Le8lKnj/mzwEEwAqV7lPi1Ze13SSIBdwYz
	 G6hxvykGhyXtkVKPePg0u8uIZgkG+CODaMM0Wri/JSLqB3/3tqxkkuVKlKwvPcFq+ivIB
	 H7JhCrTGSnOXoYdJ/5vKoOoSdojEmhxEWbP0OER1UEtrDHZBiO6iwvhJKbatvE9vvGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BtN83ODw;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237B6606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 237B6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BtN83ODw
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93f269e335eso502506285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690448; x=1794295248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYnvmmVZ+DB0wY8M1R887gq0WKcmk09L6Gjh3jQPaE0=;
        b=u1C/2Dgr0JTHjAIaAoh3plXg6InmA/9Or2vKgbK+tNYZE5CcIZOrsJjBsIo/SfgbiV
         KjdkFBk7ql9SBO1EfsWdyqoN5I+HNTOCCEOPIhMR9uTaG3VEUEcFXNA6aR8pw9rVVYVt
         1aFYh/LcnpkUyarQq0x/KV3+O/zvIPNtATbv+CVschI6/xjKRvD8lhZVF7R13Tp+/Wsf
         t7/LdU4ks2d164R7dCnV3Tp7i24AclBSRCvmFu1afx36lToEWDWD5hbVBuOGT2FwuiY0
         OZIG79pXZLwKLPqW9JtyOLpoo1PR7G4dUfyu/qQunZGgtFyQXkDJFudkMMRvLdHs0TML
         aNuw==
X-Forwarded-Encrypted: i=1; AKwUvByMJ/CGJxdwKhhPFrbv7R7ZLihD9YdCS5+2gSecbPR88C/p/fW8Q8yng6KJwhmLWrPe3H/yyHHgfvU1Ibo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kKoD+dbdToCGxgrthwVF6SSKbAZwD1Lr/ltiNDnqEBzu4Ppj+
	8FuPXr8J/cnX756qar27kikar0/Z6gpgEfHEWvXc6N2PKPTNXAUPes005o/hAgvTNGH/ZI8dYyx
	G+ZZ7QMO9JbYqvVCOU38w6j3YkPIGyShv3Xzkv3m1TDm2Ogv5TCiaxTBuAbD5MKb8mjBv4zJHbH
	cGzZvRrupK1m03jRXiHJkjQ3HmA2z+gvOfrP1GDnYEiV7JbI5F+zD00gY/O407cn8PXLGjxqMim
	LwtBOPix1/H7bfH
X-Gm-Gg: AYBFou07vjx1I7QVBkCR/CZvahXkCiskag2uG9FiBLypRZVzeiCbchq3kuRXEVhOOHF
	mKjISlVx9eE/vtteoy6zJjqJSR0q4tw0ZW5BjD8lOU53yBVmLy8cBO4er6L0QxrRGgoWAuoyOET
	lLo1QRG4XtxrNCGDwit+Udpiv7qaK4b+K0XexhB25+zaaygDcnE7Ub8fyqFD0iWWMalUtYi7Y82
	1Kah74pctF7v81XHV6a7iE5ubmwfUKERFZgbgjU5LRpX/fhgQ21C2AuKU1M8e84feilh95BXJGb
	lBugLBEb8GzRh56lQ+I/boP7Nv25n6kKkbWS+HajLZmZgA2O2Ae7+ONFD8Gho306/zCGo+BpCfm
	hTHkxEmiAFwfV/12rYYaU2ZZtr1lYTPDM5YJGlkEDYPP82pHo+cyqPtWyybc9OFvNAVWYPdGp6U
	B3XssdznK21oxrlBBQqWtFmMiAfTULRkCV
X-Received: by 2002:a05:620a:319e:b0:93e:d7f0:497a with SMTP id af79cd13be357-94421631534mr1960961185a.16.1793690447981;
        Mon, 02 Nov 2026 23:20:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-944257032cesm104583785a.10.2026.11.02.23.20.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:20:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53664911d46so58410771cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793690446; x=1794295246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYnvmmVZ+DB0wY8M1R887gq0WKcmk09L6Gjh3jQPaE0=;
        b=BtN83ODwkXfawFRNoL5ApKTstEoMazxMRvTKkRTnjV/9MK/G5LYsx94GbfQG2a4pGn
         BlL+n6zVLBgxr7cYKAj8opiwDm9imtdk3OI30lXOFMSLYeRf/oqzxGYPfjzlllQ/WuwH
         7Y8cIP+IXk+0wo7C8KxJI9ZL1S5KicJ+OEuzI=
X-Forwarded-Encrypted: i=1; AKwUvBy+7xY76CzPqUaBAivVUj9MN+tbBmQJ5pI3cLZ/EEUHWC8arcI4O4fwJHmUA4qCiDmfCszIfKnbP/gkaRo=@vger.kernel.org
X-Received: by 2002:a05:622a:1f9b:b0:535:a5f8:a5c8 with SMTP id d75a77b69052e-542b83f24e7mr199085651cf.72.1793690446279;
        Mon, 02 Nov 2026 23:20:46 -0800 (PST)
X-Received: by 2002:a05:622a:1f9b:b0:535:a5f8:a5c8 with SMTP id d75a77b69052e-542b83f24e7mr199085311cf.72.1793690445453;
        Mon, 02 Nov 2026 23:20:45 -0800 (PST)
Received: from vertex.localdomain ([192.19.218.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498c379989sm18885491cf.19.2026.11.02.23.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:20:44 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Bo Gan <bo.gan@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	virtualization@lists.linux.dev,
	linux-coco@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] x86/vmware: Allocate shared storage for steal-time counters
Date: Tue,  3 Nov 2026 02:20:34 -0500
Message-ID: <52b57836c0c28abe1c4157646b39329c603ff77f.1792471114.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792471114.git.zack.rusin@broadcom.com>
References: <cover.1792471114.git.zack.rusin@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Steal time accounts for time a virtual CPU waits to run on the host.
VMware updates a counter in guest memory, but encrypted guests currently
register private memory which the host cannot write.

Allocate the counters together instead of embedding them in every CPU's
per-CPU area, and share them before registering any address. Move setup
for all guests to an early initcall, after the page allocator is available
and before secondary CPUs start, so it can use the normal conversion API.

Keep the allocation for CPU hotplug. Enable accounting only after boot-CPU
registration succeeds, and retain pages whose encryption state is unknown
on failure. A secondary CPU's registration failure must not prevent the
other CPUs from unregistering their counters.

Suggested-by: Borislav Petkov <bp@alien8.de>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20261001235950.GHar7z9v3zfk8odoTh@fat_crate.local
Link: https://lore.kernel.org/r/20260309235250.2611115-5-alexey.makhalov@broadcom.com
Co-developed-by: Bo Gan <bo.gan@broadcom.com>
Signed-off-by: Bo Gan <bo.gan@broadcom.com>
Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v3: Replace the per-CPU infrastructure series with a packed allocation
and ordinary post-allocator conversion in the VMware driver.

 arch/x86/kernel/cpu/vmware.c | 130 +++++++++++++++++++++++------------
 1 file changed, 86 insertions(+), 44 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 34b73573b108..7b7469f2e7d6 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -25,9 +25,12 @@
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/clocksource.h>
+#include <linux/cc_platform.h>
 #include <linux/cpu.h>
 #include <linux/efi.h>
+#include <linux/mm.h>
 #include <linux/reboot.h>
+#include <linux/set_memory.h>
 #include <linux/static_call.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
@@ -145,8 +148,8 @@ static unsigned long vmware_get_tsc_khz(void)
 #ifdef CONFIG_PARAVIRT
 static struct cyc2ns_data vmware_cyc2ns __ro_after_init;
 static bool vmw_sched_clock __initdata = true;
-static DEFINE_PER_CPU_DECRYPTED(struct vmware_steal_time, vmw_steal_time) __aligned(64);
-static bool has_steal_clock;
+static struct vmware_steal_time *vmw_steal_time __ro_after_init;
+static bool has_steal_clock __ro_after_init;
 static bool steal_acc __initdata = true; /* steal time accounting */
 
 static __init int setup_vmw_sched_clock(char *s)
@@ -228,7 +231,7 @@ static bool vmware_is_stealclock_available(void)
  */
 static u64 vmware_steal_clock(int cpu)
 {
-	struct vmware_steal_time *steal = &per_cpu(vmw_steal_time, cpu);
+	struct vmware_steal_time *steal = &vmw_steal_time[cpu];
 	u64 clock;
 
 	if (IS_ENABLED(CONFIG_64BIT))
@@ -253,21 +256,19 @@ static u64 vmware_steal_clock(int cpu)
 			     vmware_cyc2ns.cyc2ns_shift);
 }
 
-static void vmware_register_steal_time(void)
+static bool vmware_register_steal_time(void)
 {
 	int cpu = smp_processor_id();
-	struct vmware_steal_time *st = &per_cpu(vmw_steal_time, cpu);
+	struct vmware_steal_time *st = &vmw_steal_time[cpu];
 
-	if (!has_steal_clock)
-		return;
-
-	if (!stealclock_enable(slow_virt_to_phys(st))) {
-		has_steal_clock = false;
-		return;
+	if (!stealclock_enable(virt_to_phys(st))) {
+		pr_warn("failed to register steal time for CPU %d\n", cpu);
+		return false;
 	}
 
 	pr_info("vmware-stealtime: cpu %d, pa %llx\n",
-		cpu, (unsigned long long) slow_virt_to_phys(st));
+		cpu, (unsigned long long)virt_to_phys(st));
+	return true;
 }
 
 static void vmware_disable_steal_time(void)
@@ -278,12 +279,6 @@ static void vmware_disable_steal_time(void)
 	stealclock_disable();
 }
 
-static void vmware_guest_cpu_init(void)
-{
-	if (has_steal_clock)
-		vmware_register_steal_time();
-}
-
 static void vmware_pv_guest_cpu_reboot(void *unused)
 {
 	vmware_disable_steal_time();
@@ -302,16 +297,11 @@ static struct notifier_block vmware_pv_reboot_nb = {
 };
 
 #ifdef CONFIG_SMP
-static void __init vmware_smp_prepare_boot_cpu(void)
-{
-	vmware_guest_cpu_init();
-	native_smp_prepare_boot_cpu();
-}
-
 static int vmware_cpu_online(unsigned int cpu)
 {
 	local_irq_disable();
-	vmware_guest_cpu_init();
+	if (has_steal_clock)
+		vmware_register_steal_time();
 	local_irq_enable();
 	return 0;
 }
@@ -325,6 +315,76 @@ static int vmware_cpu_down_prepare(unsigned int cpu)
 }
 #endif
 
+static int __init vmware_steal_time_init(void)
+{
+	size_t size = PAGE_ALIGN(nr_cpu_ids * sizeof(*vmw_steal_time));
+	bool encrypted = cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
+	unsigned long addr, flags;
+	int ret;
+#ifdef CONFIG_SMP
+	int hp_state;
+#endif
+
+	if (!has_steal_clock)
+		return 0;
+
+	vmw_steal_time = alloc_pages_exact(size, GFP_KERNEL | __GFP_ZERO);
+	if (!vmw_steal_time) {
+		ret = -ENOMEM;
+		goto disable;
+	}
+	addr = (unsigned long)vmw_steal_time;
+
+	ret = register_reboot_notifier(&vmware_pv_reboot_nb);
+	if (ret)
+		goto free;
+#ifdef CONFIG_SMP
+	hp_state = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					     "x86/vmware:online",
+					     vmware_cpu_online,
+					     vmware_cpu_down_prepare);
+	if (hp_state < 0) {
+		ret = hp_state;
+		unregister_reboot_notifier(&vmware_pv_reboot_nb);
+		goto free;
+	}
+#endif
+
+	if (encrypted) {
+		ret = set_memory_decrypted(addr, size >> PAGE_SHIFT);
+		if (ret)
+			goto remove;
+		/* Conversion need not preserve the zeroes. */
+		memset(vmw_steal_time, 0, size);
+	}
+
+	local_irq_save(flags);
+	ret = vmware_register_steal_time() ? 0 : -EIO;
+	local_irq_restore(flags);
+	if (!ret) {
+		static_call_update(pv_steal_clock, vmware_steal_clock);
+		return 0;
+	}
+
+	if (!encrypted || !set_memory_encrypted(addr, size >> PAGE_SHIFT))
+		free_pages_exact(vmw_steal_time, size);
+remove:
+	/* Keep pages with an unknown encryption state out of the allocator. */
+#ifdef CONFIG_SMP
+	cpuhp_remove_state_nocalls(hp_state);
+#endif
+	unregister_reboot_notifier(&vmware_pv_reboot_nb);
+	goto disable;
+free:
+	free_pages_exact(vmw_steal_time, size);
+disable:
+	vmw_steal_time = NULL;
+	has_steal_clock = false;
+	pr_warn("steal time disabled: %d\n", ret);
+	return 0;
+}
+early_initcall(vmware_steal_time_init);
+
 static __init int activate_jump_labels(void)
 {
 	if (has_steal_clock) {
@@ -350,25 +410,7 @@ static void __init vmware_paravirt_ops_setup(void)
 	if (vmw_sched_clock)
 		paravirt_set_sched_clock(vmware_sched_clock);
 
-	if (vmware_is_stealclock_available()) {
-		has_steal_clock = true;
-		static_call_update(pv_steal_clock, vmware_steal_clock);
-
-		/* We use reboot notifier only to disable steal clock */
-		register_reboot_notifier(&vmware_pv_reboot_nb);
-
-#ifdef CONFIG_SMP
-		smp_ops.smp_prepare_boot_cpu =
-			vmware_smp_prepare_boot_cpu;
-		if (cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
-					      "x86/vmware:online",
-					      vmware_cpu_online,
-					      vmware_cpu_down_prepare) < 0)
-			pr_err("vmware_guest: Failed to install cpu hotplug callbacks\n");
-#else
-		vmware_guest_cpu_init();
-#endif
-	}
+	has_steal_clock = vmware_is_stealclock_available();
 }
 #else
 #define vmware_paravirt_ops_setup() do {} while (0)
