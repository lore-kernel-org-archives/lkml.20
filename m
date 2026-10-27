Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080091;
	b=z+lPex2JC0TLsG0X/dTzNJHO/U4BNWcQ3lxob4Y0aWBcWhz/zHNtC7dFNPaX0Di5waj0
	 whhFM/VKNgZGuj+AJryVbxmiSh5YrjHGuA3Q6DCKQWjBrEJdHvnskL2tmnjHg4Tr0cxi1
	 tZH4P0E7gRnayTetUuWUX/PVSOKaVGKc6RRrqsIaXtUmFmcD/yw4vtykAH0ftu5hfAzLo
	 tOgb9cdfcDD629PP33mTfY9N+x/iIz368xafdk/yJLu/I8eXLIp7dtYDQmBLvSk0eOiip
	 gT9o0MEyhGABAI1XOtYislSaf9aFFb7iAnxYi4TVKomOnDUFYUOuc0OmA3EZ6n5AFvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=hu1VVEuy5OK5yu8i0DtNiZ9pBzR9sETJXANmDoyRXnI=;
	b=IfM4sflPgS8Gee5zHtSdW4rIjn9sOFHb7r597PiLueJ2TMUWjII7sFkfk4qe00ututgL
	 k9E8E1Gr68vIclsnCD2w6VHlpCCxvgFHaLFK13HiNSa1ZLrXsLz4+y/e2Pgluqp+VFOSA
	 KmygjrB8LRe/e+4Hw4KraFywWbrs+ZdWpvOVQZuFyojl35/jf50OCf9Jlj27nTMBlmkz3
	 1JiceUfNFKb4wl4VUdKqKVncXWNCmVh7LeXpEM3tooHleMriPCImGedrB0m6drG9hU8tF
	 5JwT/so6dKLh/bmuPmONO+y2y8TQDfiy9CMZprXMw3sXRtWoYcQRr9aPU3IQW+wFwRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=B54f5Wdh;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50514606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50514606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=B54f5Wdh
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8fe8e343fso21943475ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793080090; x=1793684890; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hu1VVEuy5OK5yu8i0DtNiZ9pBzR9sETJXANmDoyRXnI=;
        b=B54f5WdhVEf3Hfza/r8Un3VFrKQSq+dkg9VNfZPNbkKbWYU3YRsCadAq6ghFU4LS0G
         k9UO6epK2PcNApqewCx9ojThlkTLbbfpWeE9ss0btSgaS6mYruW2XTafJqGLNFe5UaRw
         t7jbZFpCUNT5IERVnRu1MWaQUJjLflHbwAavI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080090; x=1793684890;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hu1VVEuy5OK5yu8i0DtNiZ9pBzR9sETJXANmDoyRXnI=;
        b=OWUeOuZ9I0Y5mreZ+T0IjA4xfx12YDM2c1giGBpt/qdinQgryWp4r6drL2mYsMKY1l
         eAxUsyhrVuLJiJJifosgoQ0TOKc0uElJPR1Rx01t0jf+Nhev7yvxXg0Wu2PDcjCjz+gU
         q4ClbXaketIsvH8fLHluaHOtlYgzlwm+bjpTtxol5Lsujn5/k31isLtb2BDZHdCya8ay
         S+iONi9wLOxMsAo4zSXfR6GM/Vf7XhyHls74QdTAJCkhG0HehUOPMuwDLbufGANEJOuN
         DzJJpP0ba98DdmwjNUZM2ztUIw5ld8ot7zvMUY65E25QCHJDBOXYAzEJwEE6m5YiIt+X
         cVuw==
X-Forwarded-Encrypted: i=1; AKwUvBywaSzLAc6RYwYSBR5F/a7z2QLbxvI2xV9vz5b7vfflSoE7bJWpWD1hzUBICFCi0HADRVwvx/sIaeiTsK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgg7H/x5gebS+bsi4v8En5EVz/srAKoKJpU/t5vHjkbuikSuKa
	ahru047QjU6c5BPrb1L0Vv+aSwVPD2yVP9iG/6sVtLO6oxvfhxTv89lpS36J84w2aKkz821j0VP
	hwq9DkZ4+mhplVr0=
X-Gm-Gg: AYBFou0gnJjUR6yeWv7d0+lFYhRf6nxiLIwwdc7VwPwNaqdOB00fn/vB9T7FmUgnZDI
	Z9ASKGNergTGmZK1ctHF5WTzfYoPFvU3B6abbJVS4pktzMwTJBQqEJFcHg2wv4oyXtUb+G/AaRq
	EPWcD3t5w+j92tRklKqE15JT6QjNXufD3jFZAof+2lIEGl2k091WkFZ+EfuecBjZ0IlwRIl1D8Z
	n2LnBZUNh2CAIF8wtBkFCbqMnrmM3R4KH1eXaUxBj3UgOzbMw2Qako4YhuSAFHUfzvKTKS2Pe+8
	5JhkobDhdkY9693cICQqCMNcEjlnOa4LH7rko4q2HoU54zInjjUN2wfm66beY779QkcS3g7FOts
	ZCrwIkpnx0PpnbwM92MDnMGPUw6uD780hjH+HW5yYu0dFcKR0XkagziCkno6RVN0s2oOdajEtIV
	ljGyp76XNxQ4CBbN2J2iwFQ4EQaFMq9+0/4D4VMbBJVjXXgAz52m7ytd9IxxcJ76SHABCH78lHW
	7G4A9UnRsMYuCFPafKCW68VsaGrjBIvjNLAwTusLEBe8gnCq9lQHVGNmcT+zrqJ9SkQVUtw7u2y
	dp7r+P8fbJYfIbdIKRIuYYt/R2iVdqsKZjCfW/pbUCpbrGypWZiMmkdjz/XZmTQyhiJEBDM70Pe
	oDyk82dmuKF7r0nyUSIhZbpw=
X-Received: by 2002:a17:903:41c7:b0:2e2:cebe:d811 with SMTP id d9443c01a7336-2ea9c8c986bmr72303125ad.46.1793080089604;
        Mon, 26 Oct 2026 22:48:09 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c912f9sm3579065ad.60.2026.10.26.22.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:48:08 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:48:05 +0800
From: Chris Down <chris@chrisdown.name>
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH] kfence: Allow selecting static keys mode at boot
Message-ID: <auA7FdubFEDVPB7v@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

KFENCE can gate allocations by toggling a static key for each sample, or
by leaving the key enabled and checking an allocation gate. Static keys
mode saves a load and compare per allocation, but sends IPIs to all CPUs
twice per sample interval.

Which tradeoff makes sense depends on the host. For example, on machines
with many CPUs or latency-sensitive workloads, the IPI cost can outweigh
the saving in the allocation path.

For this reason on some machines we prefer to have static keys, and some
we don't. However, today this is configurable only by
CONFIG_KFENCE_STATIC_KEYS, so this means building and shipping separate
kernels. It also for that reason makes comparing the modes on a
particular workload more cumbersome.

Let's add kfence.static_keys= as a boot parameter so that the mode can
be selected per host. The default still comes from
CONFIG_KFENCE_STATIC_KEYS.

Testing with the unoptimised branch layout showed no obvious changes in
performance across allocation sizes.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++
 Documentation/dev-tools/kfence.rst            |  9 ++--
 lib/Kconfig.kfence                            |  4 ++
 mm/kfence/core.c                              | 47 +++++++++++--------
 4 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e0cd..cda98e1b0b68 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2989,6 +2989,12 @@ Kernel parameters
 			Format: <unsigned integer>
 			Default: 75
 
+	kfence.static_keys=
+			[MM,KFENCE] Whether to use static keys to set up
+			KFENCE allocations. Ignored without CONFIG_JUMP_LABEL.
+			Format: <bool>
+			Default: CONFIG_KFENCE_STATIC_KEYS
+
 	kgdbdbgp=	[KGDB,HW,EARLY] kgdb over EHCI usb debug port.
 			Format: <Controller#>[,poll interval]
 			The controller # is the number of the ehci usb debug
diff --git a/Documentation/dev-tools/kfence.rst b/Documentation/dev-tools/kfence.rst
index b03d1201ddae..15212ea1047d 100644
--- a/Documentation/dev-tools/kfence.rst
+++ b/Documentation/dev-tools/kfence.rst
@@ -259,10 +259,11 @@ SLUB) returns a guarded allocation from the KFENCE object pool (allocation
 sizes up to PAGE_SIZE are supported). At this point, the timer is reset, and
 the next allocation is set up after the expiration of the interval.
 
-When using ``CONFIG_KFENCE_STATIC_KEYS=y``, KFENCE allocations are "gated"
-through the main allocator's fast-path by relying on static branches via the
-static keys infrastructure. The static branch is toggled to redirect the
-allocation to KFENCE. Depending on sample interval, target workloads, and
+When using static keys mode (boot parameter ``kfence.static_keys=1``, which is
+the default with ``CONFIG_KFENCE_STATIC_KEYS=y``), KFENCE allocations are
+"gated" through the main allocator's fast-path by relying on static branches
+via the static keys infrastructure. The static branch is toggled to redirect
+the allocation to KFENCE. Depending on sample interval, target workloads, and
 system architecture, this may perform better than the simple dynamic branch.
 Careful benchmarking is recommended.
 
diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
index 6fbbebec683a..2b2ad21aa36c 100644
--- a/lib/Kconfig.kfence
+++ b/lib/Kconfig.kfence
@@ -70,6 +70,10 @@ config KFENCE_STATIC_KEYS
 	  enabling and disabling static keys invoke IPI broadcasts, the latency
 	  and impact of which is much harder to predict than a dynamic branch.
 
+	  Sets the default for the "kfence.static_keys" boot parameter.
+	  Selecting the other mode at boot adds one extra jump to each
+	  slab allocation's KFENCE check.
+
 	  Say N if you are unsure.
 
 config KFENCE_STRESS_TEST_FAULTS
diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index 55d5c114eadf..cfbefca5b78b 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -119,6 +119,9 @@ module_param_named(deferrable, kfence_deferrable, bool, 0444);
 static bool kfence_check_on_panic __read_mostly;
 module_param_named(check_on_panic, kfence_check_on_panic, bool, 0444);
 
+static bool kfence_static_keys __ro_after_init = IS_ENABLED(CONFIG_KFENCE_STATIC_KEYS);
+module_param_named(static_keys, kfence_static_keys, bool, 0444);
+
 /* The pool of pages used for guard pages and objects. */
 char *__kfence_pool __read_mostly;
 EXPORT_SYMBOL(__kfence_pool); /* Export for test modules. */
@@ -845,7 +848,6 @@ static struct notifier_block kfence_check_canary_notifier = {
 
 static struct delayed_work kfence_timer;
 
-#ifdef CONFIG_KFENCE_STATIC_KEYS
 /* Wait queue to wake up allocation-gate timer task. */
 static DECLARE_WAIT_QUEUE_HEAD(allocation_wait);
 
@@ -878,7 +880,6 @@ static void wake_up_kfence_timer(struct irq_work *work)
 	wake_up(&allocation_wait);
 }
 static DEFINE_IRQ_WORK(wake_up_kfence_timer_work, wake_up_kfence_timer);
-#endif
 
 /*
  * Set up delayed work, which will enable and disable the static key. We need to
@@ -897,17 +898,17 @@ static void toggle_allocation_gate(struct work_struct *work)
 		return;
 
 	atomic_set(&kfence_allocation_gate, -kfence_burst);
-#ifdef CONFIG_KFENCE_STATIC_KEYS
-	/* Enable static key, and await allocation to happen. */
-	static_branch_enable(&kfence_allocation_key);
+	if (kfence_static_keys) {
+		/* Enable static key, and await allocation to happen. */
+		static_branch_enable(&kfence_allocation_key);
 
-	wait_event_idle(allocation_wait,
-			atomic_read(&kfence_allocation_gate) > 0 ||
-			!READ_ONCE(kfence_enabled));
+		wait_event_idle(allocation_wait,
+				atomic_read(&kfence_allocation_gate) > 0 ||
+				!READ_ONCE(kfence_enabled));
 
-	/* Disable static key and reset timer. */
-	static_branch_disable(&kfence_allocation_key);
-#endif
+		/* Disable static key and reset timer. */
+		static_branch_disable(&kfence_allocation_key);
+	}
 	queue_delayed_work(system_dfl_wq, &kfence_timer,
 			   msecs_to_jiffies(kfence_sample_interval));
 }
@@ -956,7 +957,7 @@ void __init kfence_alloc_pool_and_metadata(void)
 
 static void kfence_init_enable(void)
 {
-	if (!IS_ENABLED(CONFIG_KFENCE_STATIC_KEYS))
+	if (!kfence_static_keys)
 		static_branch_enable(&kfence_allocation_key);
 
 	if (kfence_deferrable)
@@ -967,22 +968,29 @@ static void kfence_init_enable(void)
 	if (kfence_check_on_panic)
 		atomic_notifier_chain_register(&panic_notifier_list, &kfence_check_canary_notifier);
 
-#ifdef CONFIG_KFENCE_STATIC_KEYS
-	register_reboot_notifier(&kfence_reboot_notifier);
-#endif
+	if (kfence_static_keys)
+		register_reboot_notifier(&kfence_reboot_notifier);
 
 	WRITE_ONCE(kfence_enabled, true);
 	queue_delayed_work(system_dfl_wq, &kfence_timer, 0);
 
-	pr_info("initialized - using %lu bytes for %d objects at 0x%p-0x%p\n", KFENCE_POOL_SIZE,
+	pr_info("initialized - using %lu bytes for %d objects at 0x%p-0x%p%s\n", KFENCE_POOL_SIZE,
 		CONFIG_KFENCE_NUM_OBJECTS, (void *)__kfence_pool,
-		(void *)(__kfence_pool + KFENCE_POOL_SIZE));
+		(void *)(__kfence_pool + KFENCE_POOL_SIZE),
+		kfence_static_keys ? ", static keys mode" : "");
 }
 
 void __init kfence_init(void)
 {
 	stack_hash_seed = get_random_u32();
 
+	/*
+	 * Without jump labels a static key is just another dynamic branch, so
+	 * static keys mode would only add the cost of toggling it.
+	 */
+	if (!IS_ENABLED(CONFIG_JUMP_LABEL))
+		kfence_static_keys = false;
+
 	/* Setting kfence_sample_interval to 0 on boot disables KFENCE. */
 	if (!kfence_sample_interval)
 		return;
@@ -1175,10 +1183,10 @@ void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags)
 	allocation_gate = atomic_inc_return(&kfence_allocation_gate);
 	if (allocation_gate > 1)
 		return NULL;
-#ifdef CONFIG_KFENCE_STATIC_KEYS
 	/*
 	 * waitqueue_active() is fully ordered after the update of
-	 * kfence_allocation_gate per atomic_inc_return().
+	 * kfence_allocation_gate per atomic_inc_return(). There are only ever
+	 * waiters in static keys mode.
 	 */
 	if (allocation_gate == 1 && waitqueue_active(&allocation_wait)) {
 		/*
@@ -1187,7 +1195,6 @@ void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags)
 		 */
 		irq_work_queue(&wake_up_kfence_timer_work);
 	}
-#endif
 
 	if (!READ_ONCE(kfence_enabled))
 		return NULL;

base-commit: bae9a042b03b27924c6fd5bdc00a20d6a44d6041
-- 
2.54.0

