Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925545;
	b=yH8uDvpFJzwcrUlJvuVTCncukmbiU2b1cyb23B7hc/98CzY2COfFdprD2NParle7d8Rg
	 xs7qFYPJ5OG6y4KtcknFkaK69veKgeqaoP/mi1w+jIsOPRBlt6D6KF4lJKX5r3P5oz6BI
	 G0UxTQIa4qFsqxTzxAiohCS04YXbR/oqbRE1f2YLs67Am3C7JFFQQYaldkbN0E8ZDmPPK
	 OWz7toNeLED4HPyAargTcWJBPKB114rTIRYfVFB2niZIi6Qqs3rEcKxG2dkw4fgRoztC1
	 7G7GxFoL5E1b6GDMmrWovND69cY4MCBklflM/dVU1awLCdCDj1ORMfO6h/sa3o6hEag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rjmPFH4B/D4fb22VPFX9Sq3mznItdFyAVWsb2qu0yoE=;
	b=R+Pilr/olr6GA3VX7foHwe7H3PigK9VvEtbEB+HyoEkC1AxL4jgJNJCtsJsiDFox8N7e
	 1BruS8gd8gjTgYAPZrREbR9wHcxTNHym7RTIQjXMgkMV25wG1eVsw1VKLs/b/Pz5XYsBt
	 cR4IfY642otm4Am0paas00dkw5SUltOGflVnGZJM/oUniDWW1h//tcwF5i1/+NngyrzYo
	 2GRqwGuUZjcTDwpqjRYV5LikE7AKn7TuocCqCN2U+jVPds2bVCLeaoUUjenlSo9Zydorx
	 s00n1JJgeCYhPSliTW+TgVWFx/1bmGShxUDgVblUGi2eWW28PpUdguI9eeGj74BwN/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ziNmk/7F";
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070FF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 070FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ziNmk/7F
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-706113e92f9so3372833eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925544; x=1795530344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjmPFH4B/D4fb22VPFX9Sq3mznItdFyAVWsb2qu0yoE=;
        b=ziNmk/7Fj2K6npKDMXlNpJG+DPNkQjx67XtPs78oEXYXe16FTVbzkBLQsy84mPglw+
         svB6LHK/4Hm2ckc2UZToUDqD4991PFt2GtwxqWdTlx9fUOwEi0McMdb58eVFdtkMbB2b
         DIycqQT7h+0bwqJOU1yzcxWEo3LVwSkpFyYyw9jLlBcqdERaTBWCF/bsh6znlLgHOwoc
         6ri63cdtYj9Ky23WH3ITsOTaJQLlS+wQ5b/DHuYzXM471xdR2h7u2i2vCP/Txc7ZC6SC
         RICXR/Sv4/HYqHYy7KUX3ZRpequdRG32zUW/n/LQeo13ZDeXfyqaCngEqBqkKoXmFy0u
         Fiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925544; x=1795530344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjmPFH4B/D4fb22VPFX9Sq3mznItdFyAVWsb2qu0yoE=;
        b=oXwdXH28lE8LwZQJ79nNjKfv3I/Q/kBTXKnJ3A76BQKQmYoFjeU/m9LddyS+ZUIggX
         daUy8emNZThTdS6fO+wPA/6GRYVrYHuY77R+KVib4uFoh/qbT8XdZE6gTQOYisD9afVa
         X+i5WI4/4PuDNr+fmw8FyC0SjNLEG9N5LzHKrPqqixSNWeozDNWWjEQy3cRF5Ky5SK9g
         dPsypcA6smXPeG6d4sNoY86qycCd/ZPrHM/htjmWt6Rsn8E1R/HdFIlmVlKrOJvRXmH3
         f15PTALP77XCEi7tDgOopTEsVW1tLTLWp8v+ST8lb0ABIJRSDb2dR5jnrlG26opzAWC5
         aJFA==
X-Forwarded-Encrypted: i=1; AL+hErHBY9WaWowoWwcC1EKaacGCuKhFpuk+2Uj0mDEPKiMqnN5oKDTeoPcq4vVPfEa7cDzoWkXhJQ+J1yrAR9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8l1JTuwjd84bc2PMCU5YOevLO5xtreTiw4kbmMNkaOGLFhe5V
	NPpG52sY12O+TN92Ae+ZaX6M6b6/NsO+O0xvOtIRpPSfEKRC0KXFE/Fg
X-Gm-Gg: AYBFou22RtU6St1N9hmPmWdf+EFAfFCG583ljt05w3wtCJIaOciWqqQl9+Q9S4AKWo+
	2waQ0bYK23AUVHS09+BSN9gw1cc3YtSDfMEq2ArK7G7UfCZXe7np8SIQw+Lnc1/eh8+HHg631LB
	dn2/WgB8upULy8Ss+WSYRbswc07XsbURq7XjK6BNQjUdjpGSmG3YFg1pyUFghhVVci7LmGQYUjx
	HKRjkrf2GqD/uB6PZF+uk8Vvdtojm+Dfk2+qq7aLaz/S9CFw9ml4w0LQyBK2j4M/lSH+Ltclvp6
	KnTrH1nMj/t6Nt13Th1iXPhljE5jWOCXVe4Ig0IaacWlH8pm1U3O6yd+/1JkJmm6nEuCZ3qOEYN
	U5FYAhkLKgsMIY4HvMZpiRmOhWmYnz8TfjL1R85/4JKAej9JjGZ5QIgQ28KxDkVgzKUPUMnKgu7
	J9TUkqh/xRf0GCyWTQvxGoqZe04EEFLDKCOxDkJbaAnJbkFM35g/DLOL+uFPWxJ83c8RY/lXYdZ
	FVTUEDPWXFsyyxaeKMv7FmlU71g364ew/rYuJ4X7alyYkMIqYWxNzYCrU1knWn31wc4NawDnZou
	1jSUsHT8KXRLG3CQMKRKKrEIPTBwKm/h7ok=
X-Received: by 2002:a05:6820:3388:20b0:71a:eea9:81b7 with SMTP id 006d021491bc7-71aeea987dfmr3362475eaf.54.1794925543956;
        Tue, 17 Nov 2026 06:25:43 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71af0a8a18csm5313709eaf.4.2026.11.17.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:25:42 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCHv2 2/4] powerpc/watchdog: Disable preemption in arch_touch_nmi_watchdog()
Date: Tue, 17 Nov 2026 19:55:18 +0530
Message-Id: <3cb2893bf883be87ea1c3712344ac03f727937d0.1794924821.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1794924821.git.ritesh.list@gmail.com>
References: <cover.1794924821.git.ritesh.list@gmail.com>
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

touch_nmi_watchdog() can be called from preemptible context, e.g.
sysrq-w via /proc/sysrq-trigger. The powerpc implementation uses
smp_processor_id(), so with DEBUG_PREEMPT we get:

  root@buildroot:/# echo w > /proc/sysrq-trigger
  sysrq: Show Blocked State
  BUG: using smp_processor_id() in preemptible [00000000] code: bash/238
  caller is arch_touch_nmi_watchdog+0x3c/0xd4
  CPU: 0 UID: 0 PID: 238 Comm: bash Not tainted 7.4.0-rc2-00029-g7664547149ae-dirty #126 PREEMPT
  Call Trace:
   dump_stack_lvl+0x138/0x150 (unreliable)
   check_preemption_disabled+0x120/0x158
   arch_touch_nmi_watchdog+0x3c/0xd4
   show_state_filter+0xf0/0x338
   sysrq_handle_showstate_blocked+0x24/0x38
   __handle_sysrq+0x134/0x3a8
   write_sysrq_trigger+0x178/0x22c
   proc_reg_write+0xf4/0x150
   vfs_write+0xfc/0x71c
   ksys_write+0x8c/0x150
   system_call_exception+0x310/0x590
   system_call_vectored_common+0x15c/0x2ec
  ---- interrupt: 3000 at 0x7ffd01755b98

Unlike the generic version, which only sets a flag, we update the CPU's
timebase stamp and its SMP watchdog pending bit, so a migration in
between touches the state of a CPU we are no longer on.

Disable preemption across the update. While at it, let's also mark the
function as notrace (since we might be within a tracer when this
function gets called).

Fixes: 2104180a5369 ("powerpc/64s: implement arch-specific hardlockup watchdog")
Cc: stable@vger.kernel.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 44f178e07531..32d4e716cb0a 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -456,12 +456,16 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 	return HRTIMER_RESTART;
 }

-void arch_touch_nmi_watchdog(void)
+notrace void arch_touch_nmi_watchdog(void)
 {
 	unsigned long ticks = tb_ticks_per_usec * wd_timer_period_ms * 1000;
-	int cpu = smp_processor_id();
+	int cpu;
 	u64 tb;

+	/* Callers may be preemptible. Stay on this CPU for the update. */
+	guard(preempt_notrace)();
+	cpu = raw_smp_processor_id();
+
 	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
 		return;

--
2.39.5

