Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078216;
	b=Tm0AbbFTkP8s/miR1nHtvTAy5vA4iAQrxaSoMrUsM5EWBknjHgsWql3LzsumQHidjvyr
	 9Q2ZbvrvUk1qSkc+EwHaLk7CYCWt2v+2WQRrGk4idKBmCW3oL3lZQ8kegoaRhBYVDFnjd
	 LeyoS5sF4gAjlrojY2IhcXsq15/S/2RHWv6IWXc/SyybimvsTiygUxJtp0zLvwS62zp7l
	 MQVrQO1HU9qNZDDNX2BzmjyGmpjtmC7fxFeHPNDXq3kqVl7ufcaLgvmJOwk+mwilzNfDy
	 mPXZTZfmL/Uz+Ng+j28V3/JXT5a7QWOolr/yzjE17A/Ab2TwH6m/uDXmI6Ijnn9Nhaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vGh75Iw3Cr4ZXSsVzMiMk9iqd5h96hKoaA3EVoxwtCM=;
	b=C+keg6Oik7W7IIBcSCxnJH9xjShrWZAiNM43Z/m0gcYychmj7gtWlFzuPIumFYYZtjPY
	 GC4+VmXdqrRjV0vc1LM1DjG9GuuaqhOURJiVK4VxBdPGdCJ/lz9zG4p+gFrw2r2hA4GL1
	 SqC+7SfpEF2C95JU5bTdqaGN6bY0WUJUUEFBPyoQl/vyETPUIeGJEzTO2s5ot7Wm3JOOJ
	 WxPhJGqZf7/rQJNSjYBJ+TqVnf/kYrjy4+oAF4TxcJ+IVbnaegR6ZExBzzx3juBLxuLv5
	 oFyvEMilyulwqjKYX47Fi+uIcG2yKXOJSwdb7knMlG8WGKspr3oKH3X8mwDPwO5XPbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ca3f3ZlK;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8D606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FC8D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ca3f3ZlK
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3adc8668936so1081918a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078215; x=1793683015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vGh75Iw3Cr4ZXSsVzMiMk9iqd5h96hKoaA3EVoxwtCM=;
        b=Ca3f3ZlKBertWWsGkM+3esqXj7KCLdbJU4qzIEIPUYga91dju10BzgHUv8NiFhqftR
         rdD+xIJ0T2bULvy4cEkYeI3iArHJTMXJsvsb5H1N3bR7TuLSBj/+O0+Ka/EfA0w+qoh7
         mIq3pNU0IFMN0nIfNL0MY3lp0eqPXHba/tc3Y6fzpa3vVfUlyNT/icfbKRYfVRdaUOSk
         VF94vsng/3PwuV1OO3vmynb3UNUwltsYiLjGsOYkXmVJvWjgy4EocXAWQyv/7gcCfCOx
         G6xxW6ThQZsI72QQf+lOtDSw4QF5RXns74jk3v37AoM21rxws09cWyTjIRuJvOWMX7qq
         5UFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078215; x=1793683015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGh75Iw3Cr4ZXSsVzMiMk9iqd5h96hKoaA3EVoxwtCM=;
        b=D7F5nHwUVphSoEvrBR4086e+f12z/bTORW57N/8RvLk0PSYIsNWqJoHnuOUT2IkNui
         S9AZBqcQN41qztNSwmDSIFtM84qZgAqhgOMy0gDO26Lzd6EJ8US4vXu9Cix93ipq+cvq
         6aSMIErdZnDedSSzCA5se11y7nV5r/2wrmOM0TAsSTRiE9Dicyuk/wUfiosl/HsmvS59
         WcN+WCgfznfZBhc9rcO/bHH/pjHK+ehVunTpeKJ8VkZJkCddec55tdvO+k0W/yvXI9Cq
         r4lOMKNYdhcc3F8WGnVEx8RKrs92xuAKH3p45m90qilZ5jNARH76pvl6vcI7Qcb82iad
         MbFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeqUcRjygfrjToMHbYTUsTPAaSP7naHOnQIIZ4kFXgDRKTLENL8wfwnnFXSHS19KYaTzKy4QYlupfCgbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW7eKgV7DLlJ+ix9eRxxWPse6HGYbHpQM5DtMGKtxu84zc6Pwz
	bUC4OSo2GEBhV2eGCnzaQlt/Zlri3afD079ktOcFkOHYVubIFvtI811r
X-Gm-Gg: AYBFou1RXL2vwQ08gVVcnmQNJ1AXOE/OiDbhTaPrNnT86pRJ+0hJG+gkhIr4xcvt04P
	HwgxEIZN+50N8atudwcVs0TvEdRvBH2o5N5Qm6+/BE3HOep532GJjU3d18fxjMI64remz/fildh
	N32MggZTdzQSO/GxKGdcqunmf4Hu3b0knsOMLxnCW+41xZctOo2tsagOjjMiONjgsvEBbD4gtb1
	yxDq/ui+Vm0EWX13KdohGXOs1YCqSFrQMzu6Eh73ZUR4e0ti4WhRR4udIC93tMGtYyY51JJrFk6
	+MvsGOtBdqETJpBNoiTPzcL1f+ugy2+Iw6NWw/6LwttqyytRC/o8INXaY6zzPjRoWNp6YKf2FJr
	xJJRw0Gqd8R834aWpp3lR2pzkl3L/glA3p+J2VkbmOxnaZSkdz+R8htmrvVl8edvRGfLJOTUTyW
	GDSG8uHLKfaT4DYIWq20wdJVqMsojQJ1BiQDTkCkJrFVus6UaWrU7r80SCw444Uur2Rp6gFCFLg
	D4IuSHFJuhcXSEQLXy4rFD38BV6oIZvmB8PSdugrA5v0Qcfw+X0YHbFLcsG5EujRr/mpP+tMPTh
	CHbyWHs=
X-Received: by 2002:a17:90b:4a86:b0:3a7:e126:4980 with SMTP id 98e67ed59e1d1-3adeae6d5cdmr7235384a91.43.1793078214787;
        Mon, 26 Oct 2026 22:16:54 -0700 (PDT)
Received: from nixos ([2607:9000:3000:11::93f5:b3b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614daasm1920474a91.4.2026.10.26.22.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:16:54 -0700 (PDT)
From: sprooc <sprooc69@gmail.com>
To: tj@kernel.org
Cc: sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junbin Zhang <sprooc69@gmail.com>
Subject: [PATCH] sched_ext: Reject rq-lock-taking kfuncs in tracing programs
Date: Tue, 27 Oct 2026 13:16:34 +0800
Message-ID: <20261027051634.2009082-1-sprooc69@gmail.com>
X-Mailer: git-send-email 2.54.0
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

From: Junbin Zhang <sprooc69@gmail.com>

scx_bpf_cpuperf_set() and scx_bpf_cidperf_set() are members of
scx_kfunc_ids_any, which is registered for BPF_PROG_TYPE_TRACING.
A tracing program can run in a context which already holds the target
rq lock, in which case scx_cpuperf_set() attempts to acquire the same
lock again:

  __schedule()
    rq_lock(rq);                          /* rq->__lock is held */
    trace_sched_switch();
      BPF tracing program
        scx_bpf_cpuperf_set(smp_processor_id(), 1024);
          scx_cpuperf_set();
            locked_rq = scx_locked_rq(); /* NULL */
            rq_lock_irqsave(rq, &rf);    /* same lock */

scx_locked_rq() only tracks rq locks held during SCX callback
invocations, so it cannot detect an rq lock held by the surrounding
kernel code.

The deadlock can be reproduced with two BPF programs. The first is a
minimal SCX scheduler, which only needs to be registered and enabled:

  SEC(".struct_ops.link")
  struct sched_ext_ops minimal_ops = {
          .name = "minimal",
  };

The second is a tracing program attached to tp_btf/sched_switch,
which fires from __schedule() with rq->__lock already held:

  SEC("tp_btf/sched_switch")
  int BPF_PROG(on_sched_switch, bool preempt, struct task_struct *prev,
               struct task_struct *next, unsigned int prev_state)
  {
          scx_bpf_cpuperf_set(bpf_get_smp_processor_id(), 1024);
          return 0;
  }

With both programs attached, the next context switch on any CPU
deadlocks that CPU. Lockdep reports:

  WARNING: possible recursive locking detected
  7.3.0-rc7 #3 Not tainted
  swapper/3/0 is trying to acquire lock:
   (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x1e/0x30

  but task is already holding lock:
   (&rq->__lock){-.-.}-{2:2}, at: __schedule+0xeb/0x1430

   Possible unsafe locking scenario:

         CPU0
         ----
    lock(&rq->__lock);
    lock(&rq->__lock);

    *** DEADLOCK ***

  Call Trace:
   <TASK>
   print_deadlock_bug.cold+0xc0/0xd0
   __lock_acquire+0x12fa/0x1b80
   lock_acquire+0xd1/0x2f0
   _raw_spin_lock_nested+0x32/0x40
   raw_spin_rq_lock_nested+0x1e/0x30
   scx_cpuperf_set+0x1e9/0x310
   scx_bpf_cpuperf_set+0x9b/0x230
   bpf_prog_..._on_sched_switch+0x3d/0x41
   bpf_trace_run4+0x125/0x450
   __traceiter_sched_switch+0x4b/0x70
   __schedule+0x94a/0x1430
   schedule_idle+0x26/0x50
   cpu_startup_entry+0x2d/0x30
   start_secondary+0xfc/0x100
   </TASK>

The CPU remains locked up with interrupts disabled.
scx_bpf_cidperf_set() is similarly affected, as it resolves the CID
through scx_cid_to_cpu() before reaching the same rq-locking path.

There is no reliable way for these kfuncs to determine whether the
surrounding tracing context already holds an rq lock. Reject calls to
both kfuncs from tracing programs at verification time, while
preserving their availability to SCX struct_ops and syscall programs.

Fixes: a11d6784d731 ("sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()")
Signed-off-by: Junbin Zhang <sprooc69@gmail.com>
---
 kernel/sched/ext/ext.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 4b7d2602b4d4..88f4abe944a8 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -11822,6 +11822,22 @@ static const struct btf_kfunc_id_set scx_kfunc_set_any = {
 	.filter			= scx_kfunc_context_filter,
 };
 
+/*
+ * Kfuncs which may take the rq lock on their unlocked path.
+ *
+ * A tracing program can execute in any kernel context, including ones which
+ * already hold the rq lock (e.g. sched_switch). scx_locked_rq() only tracks
+ * rq locks taken for SCX callbacks, so from such a context it returns NULL
+ * and these kfuncs would acquire the already held rq lock again and deadlock
+ * the CPU. They cannot be made safe for tracing programs, so keep them off
+ * the tracing hook. Members must also stay in scx_kfunc_ids_any so that
+ * struct_ops and syscall programs keep their access.
+ */
+BTF_KFUNCS_START(scx_kfunc_ids_no_tracing)
+BTF_ID_FLAGS(func, scx_bpf_cpuperf_set, KF_IMPLICIT_ARGS)
+BTF_ID_FLAGS(func, scx_bpf_cidperf_set, KF_IMPLICIT_ARGS)
+BTF_KFUNCS_END(scx_kfunc_ids_no_tracing)
+
 /*
  * cpu-form kfuncs that are forbidden from cid-form schedulers
  * (bpf_sched_ext_ops_cid). Programs targeting the cid struct_ops type must
@@ -11930,6 +11946,7 @@ int scx_kfunc_context_filter(const struct bpf_prog *prog, u32 kfunc_id)
 	bool in_any = btf_id_set8_contains(&scx_kfunc_ids_any, kfunc_id);
 	bool in_cpu_only = btf_id_set8_contains(&scx_kfunc_ids_cpu_only, kfunc_id);
 	bool in_cid = btf_id_set8_contains(&scx_kfunc_ids_cid, kfunc_id);
+	bool in_no_tracing = btf_id_set8_contains(&scx_kfunc_ids_no_tracing, kfunc_id);
 	u32 moff, flags;
 
 	/* Not an SCX kfunc - allow. */
@@ -11942,7 +11959,7 @@ int scx_kfunc_context_filter(const struct bpf_prog *prog, u32 kfunc_id)
 		return (in_unlocked || in_select_cpu || in_idle || in_any || in_cid) ? 0 : -EACCES;
 
 	if (prog->type != BPF_PROG_TYPE_STRUCT_OPS)
-		return (in_any || in_idle || in_cid) ? 0 : -EACCES;
+		return (!in_no_tracing && (in_any || in_idle || in_cid)) ? 0 : -EACCES;
 
 	/*
 	 * add_subprog_and_kfunc() collects all kfunc calls, including dead code
-- 
2.54.0

