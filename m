Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793343314;
	b=iAfjWREvRWOuAsKrOS6ZXpS/JUjdD+Q+C/fQcMZE1k+dD+MSQarQahALDfFr0Q5qkrjL
	 SgXeK3j1607hhxt57i7KaMOzTnlMx+FRhjl/lvgEtoEDlq0lXid35kPzKcB5KkK/5I9Vk
	 bd/66GdLWfxysOz7izRwy4duXr7nJtVI3+2e6sFKwlclYcpsJol8WlYjF+B3EFPRb2hQu
	 /18n6exhnPwLD5xTsftZr4yAnfokfR6bekD7a39dYrQ9EQPysNMkBRXApnMPrDFCbF5EI
	 2LEIkxQ1WyT/4kYD1q1bmNW9r35CuZv9v+EIJTzAYhqXGFmTONBY+cPsNP9ZmzmR7Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793343314;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=3SNb3XAimffZF8lhF2ZXuU29Lg77VRW3YU19zWiSJv4=;
	b=R4HBZKLblQCfzlNeTS0071I6dG1NGSF3LEGfraZMUJCVfXBR13RdPjfkzuIsF+Q4tNAF
	 DTKWG1s/12HQXGTONO39KQoWG920bK2L3iMH1H6nKISs/m9wie9vzbzDcKtpC3T7kwZmC
	 u7eqsZYwPBL3ipyUBvXYFIodJrQnMn2JS9C4ndxbaIpjoCHzhj6483LG0eeQ108SMDNNU
	 EhkEEwzusBU7qAFH4JbhrNZTlJHmABIGkxRDDXHGYst0D5ILaOosiRtvF7f8iM+cv8kuR
	 rScyRuDUl6Bwlg7CaufXl+lP9bJdLgUyHmRkmcHtXx/RyFWaNrr+HltTtPn2JvifTjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RgNGMNoe;
	arc=none smtp.remote-ip=209.85.128.226
Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC6E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RgNGMNoe
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-8aea7b7ca0cso3545977b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793343313; x=1793948113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3SNb3XAimffZF8lhF2ZXuU29Lg77VRW3YU19zWiSJv4=;
        b=08VKsUWPCaJdqH4GnEhsAuG6vsvlnw6h5vqNF7302jxZkPHuJSY4DGSpLfcD4VZB1H
         TIj3K2EXh+1uhVOQ8L0QQUyrURUBmbMGG6QZ17mKsW29lroGT9vnDBj6YOHicEbCeOMj
         IdAiF3RdrElUlsb8WVRoL87SgVRcL3qoOuPK42k2smzg0O7e1IMkKfmUFEUYsnQs91gg
         DZeM+z6os+MkL9aBM9Uu03NVxJM5lcnYNPbPlA6kGXQgSKl1MBHIHk3RZZRHmsLOJ7Yw
         UYcOJjhUiM2rXB+huk2itxSu3NhTYNU+XGNnN2PmUDfWvakP5Yc365BRjqDdSP4vzYXJ
         P2eA==
X-Forwarded-Encrypted: i=1; AKwUvBzuA3QoXjVT9pOUrQTRN2Tyzvf1Iz7TMrI8yu7CmF3zMoQvw/PE0xEyuE2R2+MIxgbs7eNBqAgDeJ1hR1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2QqF7ayBqF8Tb89ys4j1PSY4RIf/jzdN3oLN2RqtYr7fR9nZU
	jncSyVc24UnUBKK41fA3M2riOyTBzcX932QJDYNc//PV5T9sNr9myJbJ5L3hhACNzHbSaZrebyw
	gm1POicuAknqXJ3QrGIriyXRcHVPLrbHTfksJan1eHadvz9Xdk8f+T03a/o8ksKfUntl3ed2OEa
	TjDudNjyZ2zI7TD0jhBxSikOB0MkZfJ+c4Cf6IgKUBX8igJ9PLBbWkoz8xFnxIAdI5BNoKdYmM5
	4z2GuHHC9nwBsp8VJc=
X-Gm-Gg: AYBFou1gH01LlsRERLhyRcJNouiJU/+9pOr6AAqi2zP42SOew+IhiWNKmLQ5qshYNQs
	bEkcC+GuXpKgGpWmpkH835wIa/UXbDJBai/E3Lx4omtQArnJm+EhfyewQfAxBcGrZZFZ9WXpSVk
	+Rm0uSK79IfoWREtwz3l+WxTowAXZqnAADN9NXCK1nTDFz5+T4pG2hJXac7yUCHFFVMVLdcWMfY
	vLMSHvW8JfI8M9/WC5TbeFuQrBXrPtzNqBM9saJfjNvtfL3qPgcSi/nbGN6C5o5swSfUE2KbgYF
	kutZVCIm9OwDxWwg2pEviw56x5VZL90C73IprpUbdZgA2HjBqBjfs8lnBBsETp30iPxHX1VVTor
	jo6EWkdX5C4NSt9Sfb33m7eyt3Qi6aDuwBvZo2SAsvkRwOVbaIQhEaClG92hyVBOoUNb75oz5Tp
	mSBZ0X5fLg9WqoOM+sx//8RsC5KkTMQw3h
X-Received: by 2002:a05:690e:168f:b0:675:3dfb:41a2 with SMTP id 956f58d0204a3-67ba4c87fcfmr857953d50.1.1793343312645;
        Thu, 29 Oct 2026 23:55:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67ba753dfdcsm8936d50.32.2026.10.29.23.55.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 23:55:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1151116eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793343311; x=1793948111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SNb3XAimffZF8lhF2ZXuU29Lg77VRW3YU19zWiSJv4=;
        b=RgNGMNoepay0fg1JzLcFcJz54PD0FzUaLTMTjAxj21tM2+jcpCgIqCK5enktdvoDDp
         m+AzpxeLhMb+PAwen6xu/AQDoyHcR7IMaF9/WHzppG1C/QLjdeLMo0qTotEHfA2Rk79f
         OiSBRmouc0YfTaaMaFQq1dAtCTa3aOPZH/0+A=
X-Forwarded-Encrypted: i=1; AKwUvByVdLy6uM0VQ/To47HvHd3bJ6g3olyu7PZhhJNSzGKWooT/WHPn4JKDhckZxUaJV7RH3cuEYMdKGjiAZxI=@vger.kernel.org
X-Received: by 2002:a05:701b:4292:10b0:1a4:c892:b132 with SMTP id a92af1059eb24-1ac5e6f53a5mr2227668c88.23.1793343311093;
        Thu, 29 Oct 2026 23:55:11 -0700 (PDT)
X-Received: by 2002:a05:701b:4292:10b0:1a4:c892:b132 with SMTP id a92af1059eb24-1ac5e6f53a5mr2227615c88.23.1793343310368;
        Thu, 29 Oct 2026 23:55:10 -0700 (PDT)
Received: from photon-dev-haas ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm6767430c88.10.2026.10.29.23.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:55:10 -0700 (PDT)
From: Ajay Kaher <ajay.kaher@broadcom.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org,
	vamsi-krishna.brahmajosyula@broadcom.com,
	alexey.makhalov@broadcom.com,
	tapas.kundu@broadcom.com,
	yin.ding@broadcom.com
Subject: [BUG] sched/fair: GPF in update_blocked_averages() on stale leaf cfs_rq of freed task_group (6.1.159)
Date: Fri, 30 Oct 2026 06:22:37 +0000
Message-ID: <20261030062237.849668-1-ajay.kaher@broadcom.com>
X-Mailer: git-send-email 2.53.0
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

We hit a general protection fault in update_blocked_averages() on a
6.1.159-based kernel (Photon OS 5.0, 6.1.159-9.ph5). It looks like a
use-after-free: a cfs_rq of an already-freed task_group was still on
rq->leaf_cfs_rq_list.

We have no reproducer and no vmcore.

Oops (trimmed):

  general protection fault, probably for non-canonical address
  0x54a403b28017e80: 0000 [#1] SMP NOPTI
  CPU: 7 PID: 0 Comm: swapper/7 Not tainted 6.1.159-9.ph5 #1-photon
  Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop
  Reference Platform, BIOS 6.00 11/12/2020
  RIP: 0010:update_blocked_averages+0x1b9/0x770
  Code: 48 89 de 48 89 c7 e8 ef 29 01 00 85 c0 0f 85 fc 02 00 00 48 8b
  83 50 01 00 00 48 8b 80 c8 00 00 00 4a 8b 34 30 48 85 f6 74 31 <48>
  83 be e0 00 00 00 00 48 8b 86 80 00 00 00 0f 85 68 03 00 00 48
  RSP: 0018:ffffbd3346524ef8 EFLAGS: 00010006
  RAX: ffff9e87e85c9500 RBX: ffff9e82b3d92e00 RCX: 0000000000000000
  RDX: 0000000000000001 RSI: 054a403b28017da0 RDI: 0000000000000000
  R13: ffff9e8110e17800 R14: 0000000000000038 R15: ffff9e82b3d92f40
  Call Trace:
   <IRQ>
   run_rebalance_domains+0x4b/0x77
   handle_softirqs+0x9b/0x250
   __irq_exit_rcu+0x90/0xc0
   irq_exit_rcu+0xe/0x17
   sysvec_apic_timer_interrupt+0x7c/0xa7
   </IRQ>
   <TASK>
   asm_sysvec_apic_timer_interrupt+0x1b/0x20
   RIP: 0010:native_safe_halt+0xb/0x17
   ...
   do_idle+0x21b/0x290
   cpu_startup_entry+0x2a/0x37
   start_secondary+0x174/0x197
   </TASK>
  Kernel panic - not syncing: Fatal exception in interrupt

Decoding the Code: bytes against __update_blocked_fair() (inlined):

  call update_cfs_rq_load_avg ; test eax,eax ; jne ...
  mov rax,[rbx+0x150]       ; cfs_rq->tg          (RBX = cfs_rq)
  mov rax,[rax+0xc8]        ; tg->se              (RAX = ffff9e87e85c9500)
  mov rsi,[rax+r14]         ; tg->se[cpu]         (R14 = 0x38 = cpu 7 * 8)
  test rsi,rsi ; je ...
  cmp qword [rsi+0xe0],0    ; se->avg.load_avg    <-- faults, RSI garbage

i.e.

  se = cfs_rq->tg->se[cpu];
  if (se && !skip_blocked_update(se))

The cfs_rq at ffff9e82b3d92e00 was still on CPU 7's leaf list. Its
cfs_rq->tg and tg->se still looked like valid kernel addresses, but
tg->se[7] contained 054a403b28017da0. That fits the tg->se array having
been freed by free_fair_sched_group() and reused, while the cfs_rq that
should have been unlinked by unregister_fair_sched_group() was still
walked by for_each_leaf_cfs_rq_safe().

The teardown order (sched_release_group() -> RCU ->
unregister_fair_sched_group() -> RCU -> free_fair_sched_group()) should
be safe, unless something re-adds the dying group's cfs_rq to the leaf
list after unregister_fair_sched_group() has run. The comment in
unregister_fair_sched_group() [1] says this cannot happen because only
empty groups are destroyed, so on_list can be checked speculatively
without risk of the cfs_rq being re-added. The actual removal is done
under rq->lock by list_del_leaf_cfs_rq().

We therefore suspect a path that calls list_add_leaf_cfs_rq() on a
cfs_rq of a group that is already past sched_release_group().
Candidates are enqueue_entity(), tg_unthrottle_up(),
propagate_entity_cfs_rq() (via attach/detach on a task group change or
task exit) and the enqueue/unthrottle loops. We could not tell which one
from this oops.

What we checked
 - fc661f2dcb7e ("sched/fair: Prevent dead task groups from regaining
   cfs_rq's") [2] and the 6.1.y backport of 3b4035ddbfc8 ("sched/fair:
   Fix potential memory corruption in child_cfs_rq_on_list") [3] are
   both in 6.1.159.
 - We found no later fix in mainline (as of v7.3-rc7) or in 6.1.y for
   leaf-list handling or task_group teardown. Mainline
   unregister_fair_sched_group() keeps the same on_list logic, so we
   believe mainline may still be affected. We have not reproduced it
   on mainline.

Questions
 - Is this a known issue, or has it already been resolved upstream?
 - Do you have any thoughts on what might be triggering this?

- Ajay

[1] unregister_fair_sched_group() in v6.1.159, kernel/sched/fair.c:
    https://elixir.bootlin.com/linux/v6.1.159/C/ident/unregister_fair_sched_group
[2] https://git.kernel.org/torvalds/c/fc661f2dcb7e
[3] https://git.kernel.org/torvalds/c/3b4035ddbfc8

