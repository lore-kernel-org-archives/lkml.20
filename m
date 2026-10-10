Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F23A49E13F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642348; cv=none; b=mUzDX1KN9G/GCgwpoPfgUdc51QS+j2tKZbtzfBNiXMtp7JZNnTYkB1aiD7uOtFOtIqybYiT4W8O8PHzYheERk38t0xMDPKdoqov1tNhA5/BKCqIwDpIPBxMsKWaSEYSFPuQWH9iMrVhoosmgvQBuRbEz+NIxvBfHwqRobRmeS+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642348; c=relaxed/simple;
	bh=gVko3NTCvcTD25dHMXmIdpbGMdQ9kdFLxTHBjPkwhk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9KK3RU3/OriXyOwegP0M86UchowP5m1vQ0g96Ipx+SrfsqOU/5DIfwYKe1R8l4zo71lrpqfk16lHhlCtQoahdxNA+sLZTKMuJ7Hux+OhFpnpth2cNSDsKhEUNGH8J6ckQU4Aa7go2t8dxvIwWYvqnMH5El6OG9mV3efhkcFo1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKl53ocX; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKl53ocX"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6afe8d3980aso758488a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642344; x=1792247144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfFYG7S5LsfE/VVTuIcg/rOspxidrA0GMavY7/KQwWg=;
        b=hKl53ocXJ4ynu8DnKySPHAyZEAK//gbJw8Wu/Pm27MBP3z1zDAymiU8kLI8wm6rZ7/
         Tw7mBetcFsPfm1JjtnvoDc0XPtIyTCJUk9kWqnJ8r7hIR1kSMosNgOgCAr6KlKWUYk/3
         bNd5BKp4xwJ47H2ddUdalKY+OtTK9tOnImZ0xQiCq96SGcBEFE/iTlMdnQ8rxfFwv7PT
         7Z9viNHiU3iFhiez7DD0jOGBZg7mx8eD6yYCWIToU8h1MP/1hbsiQGNzfRk/sG5DS8Kk
         8XRn8qYnqC9cXdCCoeQFsoplJ6tMiBgDgpu3G+51flFyjOWpFNHgiJdeaYlYlfJs/j0F
         qfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642344; x=1792247144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pfFYG7S5LsfE/VVTuIcg/rOspxidrA0GMavY7/KQwWg=;
        b=afJPkOTrTJICRh9Ug6y5GxgV+20w0OaP1Rll4XyxcATGAqTITIDKFpmnMsZkJ60ehk
         Rom7dcHl1CSpblF6LjnSFo623/Uk8HxjGwD69iArpTgE/+Mv1h/fRPj0l9YdLgBuaq96
         XXeAPkUxX7Yw3rUmBpnVv2VGJ2kK9edp3A0wb5KByl5QFq51gcosM8g6zvanpMpMiX1w
         0vQHKRsxWF//A2ePykVKzL2VJyfLKj/ZOWlQr/VWmHUOaS1sX6oM2i6X1RJuSr3mafZv
         AO8Vxt/EtQpBlD7UI0Ku3t8sOePW+fpn9J9lt8rXARkXLAfuqy7nqqGSkfhcjpalad92
         Z7LA==
X-Forwarded-Encrypted: i=1; AKwUvBxWWudBZ93L63TiY6EBZYL/w46BeBdPU2JRVKfK1OPjKMh7tsAn24c4BhEQ3VfYT70f1p6GWJCvkVcDfsk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIz7YkbxkhW4x/u625ljCTMuyf5868MLBabQ5YHJCk+fRL6c+M6
	K602CSAaJK7a71E9agSQ3XdJ4N4xNgDGvm8noeilO5aco2fK+hp/WKOQVVI/N+yd
X-Gm-Gg: AYBFou1BXU8ctv7jy/E0MZwkEAuAUoH8G9saoB/uRPDr8i+6jT3fwKNJg/I9AxhZKHo
	bl+X5T38Y6C4WEtJyd2r4u/CipcyiWzBpDfq+aegPtdhJ1RWP2bhH0h/Ardxbcr/F6FrMZYdUBF
	TN4bF3H7qsehbrmoqT6PMU9Trfjn7z/U0N8ubZBnNMccSeKs5JchxHuP/eQ39g8CutirTaqvD3r
	Ry3Pa9Jcr1xrA8R/cQvqZuFxrVFrLSFD7rBb9FDbmANJz/AQba8yvFdonDATgqxQjdG2DEfa+kG
	TNjXaE1qRRqpOBScgD2End4U5QGD6chesxGJXftHpOj3j7VRS4+HUCwZ6qxHQuaohKSWuTEgS4F
	OzNY4vytqKtRJFdSTof57FVhQVln94vSCXZjILOCj40Xnyc+6YG+Mp0QQbBqulxY5ifAq5uvIN7
	nhtYUyL3/aUNwS6Llcn/ofFrFtHDrIN2yG0c3Uz/zs91cp1QvYRsQwxlvUpF9DBRPlkPtDkA9jd
	uiBlSmzH+WIeBNzF01Ddx5Y+xKoak3zG2XETGLaCA==
X-Received: by 2002:a05:6402:194e:b0:6b0:c1d:a7ce with SMTP id 4fb4d7f45d1cf-6b17c237fc2mr4290283a12.12.1791642344039;
        Sat, 10 Oct 2026 07:25:44 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm2635586a12.34.2026.10.10.07.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:25:41 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v5 1/8] alpha: load the MMU context when switch_mm() switches the current task
Date: Sat, 10 Oct 2026 16:24:27 +0200
Message-ID: <20261010142533.974797-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010142533.974797-1-linmag7@gmail.com>
References: <20261010142533.974797-1-linmag7@gmail.com>
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

Direct callers reach switch_mm() without going through alpha_switch_to():
kthread_use_mm(), which borrows an mm for the current kernel thread,
sched_force_init_mm() on the CPU-hotplug teardown path, and
do_shoot_lazy_tlb(), which switches to init_mm from an IPI. None explicitly
loads the context, so the task can carry on running
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

sched_force_init_mm() needs CONFIG_HOTPLUG_CPU and do_shoot_lazy_tlb()
needs CONFIG_MMU_LAZY_TLB_SHOOTDOWN. Alpha selects neither, so only
kthread_use_mm() is reachable in practice. Test the caller's identity
rather than special-casing individual callers.

The scheduler passes the incoming task, which is not current until
alpha_switch_to() runs; all three direct callers pass current. Test for
that and load the context the way activate_mm() does. All three run with
interrupts disabled across the switch, so this completes before any
shootdown can be taken and needs no asn_lock handshake.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: <stable@vger.kernel.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index eee8fe836a59..d366f89fee58 100644
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
@@ -139,6 +141,16 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	unsigned long mmc;
 	long cpu = smp_processor_id();
 
+	/*
+	 * kthread_use_mm(), sched_force_init_mm() and do_shoot_lazy_tlb()
+	 * switch current's mm without alpha_switch_to(), which loads the
+	 * context. The latter two require options Alpha does not select.
+	 */
+	if (next == current) {
+		__load_new_mm_context(next_mm);
+		return;
+	}
+
 #ifdef CONFIG_SMP
 	cpu_data[cpu].asn_lock = 1;
 	barrier();
@@ -160,7 +172,6 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	task_thread_info(next)->pcb.asn = mmc & HARDWARE_ASN_MASK;
 }
 
-extern void __load_new_mm_context(struct mm_struct *);
 asmlinkage void do_page_fault(unsigned long address, unsigned long mmcsr,
 			      long cause, struct pt_regs *regs);
 
-- 
2.43.0

