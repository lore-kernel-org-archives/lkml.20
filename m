Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDBA3CD8B8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579905; cv=none; b=NTv9oE/MBHbSw1mI/I5/1iOrhYjGxKd3TruffWop1WIMsHY60O2E9/eINLrHiM5FOisUbmLw1NMxkX7ysAMVmYJP4a5hsty3hH8EQaW48t4rHe1jzQXqSa50mtKkKj52ey+t9Tdodw7dYqGSiNnqfE/TYGymtnxh0KBy8fOL4AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579905; c=relaxed/simple;
	bh=6opi/5R9M3NXlfgYoH61tIu1FvaiunNCfa3uJFb93kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7nAd5y9hcGgXm5YBOldFP/JAea96lWZa6xsiNyfdujHeP9H+aDHOQqb2ik/zcHhf+BcwqF8cOo0ks4oNzOkQc6k5btHapXv7TV8LTXScMhZTznadqa6KId2ql/aB+vOk6VmppfyugsZ/SKmwzOU4yDE5mykmO2qp4rbZ1avJTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwXQqGpc; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwXQqGpc"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c247f6687dcso44118566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579902; x=1792184702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59gWwwZKc4LtbAwf3F0whP4Jml+i88HQZDtzu/90YQc=;
        b=rwXQqGpc8+yHz2zOiwvJHPG5mdhiojWxn8kHL41yZfpnMlFegWy46GZxSQi1+zm8NN
         6USm7+mxQMZu1qeKrAL+Uo4hWi0C5K1H6+V1P/RfGzWhxcaHA17koYBbvSA//m5vjnPu
         9L+hIdgnzvIIFLDXMEU/BtZbf0X8ZK5GbMOlUBDUjgtZOrOUsbgpChJXnIT397kKiHVp
         qm/rkwqOkIn7RMfyVLxilR9iG/KpU1/SpK7+EHfddKaA4o5IZOuysLLd3C39MI5AKY5f
         V369DzcBaMxX9IiOTKLv5TqmkW7z+zvPhiX1hzIz3oarJcPX9dNKG5irtVLl5gXvi9Mr
         KIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579902; x=1792184702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=59gWwwZKc4LtbAwf3F0whP4Jml+i88HQZDtzu/90YQc=;
        b=fedWWLAJb1ju4Fuvc7Qu6P3N2n+3d/c0EJiOCwvgvZ+rFYzGq8CtyyMweNnH2+A6i4
         atmVGuxWXvifV4EkD8qHSK5ExM0WF262W1a32VemlXi9HdNa1jTROOW0K7tRMNiUP58x
         K3XSGX8/mJ6vLXLJbnPELVWL7pwNkOXYeHjtHFK0lmsSLa2OfHH74qHRNCP22BpNSm5m
         QLGtQ52EnAP2ZY2mIirU3ry6Iii3Dtwmne3pJrNsPz5UXghGJW22PnaooithN8oyrMwE
         aYlGdmJhTLNxENi87ezMKWcv6gk6/hN6WB7Sz3RJlIyfNZFlTJCoNsagqHMcn7VnXadc
         Le2A==
X-Forwarded-Encrypted: i=1; AKwUvByHcBAqgd5LcRrdizs2bLRuIQcR2JRBmtfLHHFQ0q2+SCVCqmmFIwvb6OeZShMw7g8C0AT9XBrHSt/MsTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvDf/b5fxj2C3Jl3sNoOJ5qSxv4xq5FR/ROH3BxhXmUNARJR1S
	4SkeLt5CUFOlU6Y0LqTBt4byJncydTj0xpdh+2+DE3nFacpC6fwbUuJ+
X-Gm-Gg: AYBFou1irJ0/sLm4OgStpBYOdnOzMArNpj7sUzCwGZlqJslhzeL/dAoR8+dcmbnKAPG
	s2EqqSYu5N8YLL3YY4uezMPds9JIf+6b8eIKauqPEmrLGHm+HY4gwapLfWIzwZYj+QZ6AwkLFSL
	Rt4AG30Tlc2YLto2UXpGT5qxic3N5TlhJBLVQDTQIx9tT3Ypa5zGkzXymBssWwmosbcSx9gXhul
	Bhbph5+6eYTASc29z+aLw6WU888ERutO7dO7UiPdC3Fk++2GyUSCotgZODfQE8kP27uKCKMmD6H
	lzYDHKGvhCNu2Zw6vmuC1BSyPbVhHwZ5zd8OUO3UiH11typn38X6g+UTypKJv2G1L1jj/9c15Mz
	cGzYXsKD8aMPi0F9pV5gI2BFKzVOO5gDHTNJ9ODPLUZAv7y78zhBaVr9zSO4UwOdvKjnMCy35NC
	DT06ODyREbX40A32jhc4OQfjarILjMwJLMgBA7nsIhZLAyqoeJCfftKcXx2N0AhmBntOdZtQvgw
	5gM9riIuz/vWxw82b9NH2FM4gfFoAZA4KG9zXjK
X-Received: by 2002:a17:906:630c:b0:c2e:4601:24d7 with SMTP id a640c23a62f3a-c31aa0b038fmr334122466b.39.1791579902349;
        Fri, 09 Oct 2026 14:05:02 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:01 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 1/8] alpha: load the MMU context when switch_mm() switches the current task
Date: Fri,  9 Oct 2026 23:03:46 +0200
Message-ID: <20261009210449.971057-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009210449.971057-1-linmag7@gmail.com>
References: <20261009210449.971057-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ev5_switch_mm() only prepares the incoming PCB. The context is installed
by PAL_swpctx, which alpha_switch_to() issues against that PCB on the way
out of the scheduler.

Two callers reach switch_mm_irqs_off() without going through
alpha_switch_to(): kthread_use_mm(), which borrows an mm for the current
kernel thread, and sched_force_init_mm() on the CPU-hotplug teardown path.
Neither explicitly loads the context, so the task can carry on running
under whatever was loaded before while current->mm says otherwise.

The stale page-table root need not be swapper_pg_dir; it may belong to a
user process that ran on the CPU earlier, and the kthread's user accesses
can then read and write that process's memory wherever the stale mappings
allow. Translations taken that way can also end up tagged with the
borrowed mm's ASN: ev5_switch_mm() writes that ASN into the PCB, which the
next PAL_swpctx installs against the stale ptbr. An address the stale
tables do not map faults instead, and since do_page_fault() resolves
faults against current->mm without reloading the context, the same access
can fault again on return.

sched_force_init_mm() needs CONFIG_HOTPLUG_CPU, which alpha does not
support, so kthread_use_mm() is the only one of the two reachable in
practice; the fix below tests the caller's identity rather than
special-casing either one.

The scheduler passes the incoming task, which is not current until
alpha_switch_to() runs; both direct callers pass current. Test for that
and load the context the way activate_mm() does. Both hold interrupts
disabled across switch_mm_irqs_off(), so this completes before any
shootdown can be taken and needs no asn_lock handshake.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: <stable@vger.kernel.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
Message-ID: <20261008195608.965266-2-linmag7@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index eee8fe836a59..c5cf7dbe6161 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -130,6 +130,8 @@ __get_new_mm_context(struct mm_struct *mm, long cpu)
 	return next;
 }
 
+extern void __load_new_mm_context(struct mm_struct *);
+
 __EXTERN_INLINE void
 ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	      struct task_struct *next)
@@ -139,6 +141,15 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	unsigned long mmc;
 	long cpu = smp_processor_id();
 
+	/*
+	 * kthread_use_mm() and sched_force_init_mm() switch current's mm
+	 * without alpha_switch_to(), which is what loads the context.
+	 */
+	if (next == current) {
+		__load_new_mm_context(next_mm);
+		return;
+	}
+
 #ifdef CONFIG_SMP
 	cpu_data[cpu].asn_lock = 1;
 	barrier();
@@ -160,7 +171,6 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	task_thread_info(next)->pcb.asn = mmc & HARDWARE_ASN_MASK;
 }
 
-extern void __load_new_mm_context(struct mm_struct *);
 asmlinkage void do_page_fault(unsigned long address, unsigned long mmcsr,
 			      long cause, struct pt_regs *regs);
 
-- 
2.43.0

