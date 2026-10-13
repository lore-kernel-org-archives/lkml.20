Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D65652CCC9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914354; cv=none; b=coGWWM4QgQUqMcAmusJeEPg84lT9IYGk2bgG0MuMXpmViGA+Z2hx4/GZhJHM5Phf09R9df6dAipLKp2cqC4DoF9Y7LprsVnDO2IWSe9Z2bikI4tmQ27MgDUpgfrF65+/7TCGOm9Q4mYmnqyPggN8NBwGwo5ldfaBF4+EPYZmQPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914354; c=relaxed/simple;
	bh=X1V1CfzprcJNalDbhBAN3MBfTAGwlskY0D+/vWCYLmg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bo5fQ8eG1GBLOrAUlYlSCSPyjnOQPQOGfDm7WxIU6wOSQ+NzcaXYACCTqtvTO3mH/yADCtKrFv/0uJoCGm6UeBsvSQfTlDoCB0+ccUPH5X+Gy/e4Yk8KYiImufGXL8s3DhpO89fRH7T4HE4EBrZLxLZeLD21xHK3imCkCzuozzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mjfdeM8m; arc=none smtp.client-ip=91.218.175.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mjfdeM8m"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X1V1CfzprcJNalDbhBAN3MBfTAGwlskY0D+/vWCYLmg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914347; v=1; x=1792519147;
 b=mjfdeM8mQIrcsQmttYN0E6+e/wyTDLuv10u9rYFusbHGBCvr8TA6ZC7z5h6c59iW/h0DuxYF
 hIRrTHkcUbYNxr1KStoVDQ9D22xH9qXQzy+5ZmNsQoNyb9De5SS67Wrge01BWbbM82fN5NHNibo
 j5mVUjBnjlAIbA5epjnNsX3o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id cb33ef432d5e52a9;
	Tue, 13 Oct 2026 17:59:06 +0000
X-Mizu-Trace-ID: cb33ef432d5e52a9
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Eric Dumazet <edumazet@google.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-rt-devel@list.kernel.org,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v6.1-rt 00/15] net: Backport backlog-NAPI threads to resolve PREEMPT_RT softirq warning in SMP flush
Date: Wed, 14 Oct 2026 01:58:34 +0800
Message-Id: <cover.1791912669.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wen Yang <wen.yang@linux.dev>

*** Overview ***
Backport the backlog-NAPI smpboot-thread mechanism and its prerequisite
NAPI/RPS/defer_list work from upstream (v6.4 - v6.9) to v6.1-rt-next.

*** Problem ***
On PREEMPT_RT, RPS steers packets to a remote CPU's backlog by sending an
IPI. The IPI handler (rps_trigger_softirq) calls ____napi_schedule(), which
raises NET_RX_SOFTIRQ. do_softirq_post_smp_call_flush() then sees a softirq
pending that was not pending before the flush, and NET_RX_SOFTIRQ is not
masked by SCHED_SOFTIRQ_MASK, so it fires:

  WARNING: CPU: 1 PID: 0 at kernel/softirq.c:315 do_softirq_post_smp_call_flush+0x3d/0x50
  Call Trace:
   <TASK>
   flush_smp_call_function_queue+0x50/0x70
   do_idle+0x178/0x260
   cpu_startup_entry+0x21/0x30

The same path then calls invoke_softirq() -> wakeup_softirqd() with IRQs
disabled in interrupt context, which the RT maintainers consider a design
violation ("raising a softirq from an SMP call function").

Commit 8d152d22d9f0 ("net: Avoid the IPI to free the") worked around this
only for the skb defer_list by delegating the purge to a workqueue. That was
incomplete: it did not touch RPS steering, and workqueue scheduling adds
latency to deferred skb recycling.

*** Solution ***
Upstream v6.9 dad6b9770263 ("net: Allow to use SMP threads for backlog NAPI")
adds per-CPU smpboot threads ("backlog_napi/%u"). On PREEMPT_RT
use_backlog_threads() is unconditionally true, so cross-CPU backlog and
defer_list work bypasses IPIs and softirqs entirely:
  1) Cross-CPU backlog enqueue sets NAPI_STATE_SCHED_THREADED and wakes the
     remote CPU's backlog_napi thread with wake_up_process().
  2) defer_list cleanup is folded into the same thread (80d2eefcb4c8).
  3) The old defer_work workaround is reverted (patch 01).

*** Backport Adjustments ***
All 15 patches apply cleanly in sequence against 6271c130c6e5. Two patches
needed hand work. Every deviation from the upstream text is listed below,
together with the base difference that forced it -- there is no edit made
just for the sake of editing.

1. Patch 06 (____napi_schedule): upstream 8b43fd3d1d7d writes
   __raise_softirq_irqoff(); the backport keeps raise_softirq_irqoff().
   Reason: 6.1-rt's ____napi_schedule() already uses raise_softirq_irqoff(),
   because stable 533824e6a0fb (upstream 77e45145e303, "net: Handle
   napi_schedule() calls from non-interrupt") deliberately added the
   ksoftirqd wakeup there to fix the NOHZ tick-stop "local softirq work is
   pending" stall. Applying the 2023 upstream text verbatim would silently
   revert that later fix. The 2023 commit predates it, so this is a
   forward-port artefact, not a behavioural choice.

2. Patch 13 (backlog-NAPI threads): five hunks were re-anchored. None changes
   behaviour; each is forced by a 6.1-vs-v6.9 base difference, verified
   against 6271c130c6e5:
   a) backlog_napi percpu definition
        upstream anchor : "unsigned int sysctl_skb_defer_max"
        6.1 anchor      : "int netdev_max_backlog"
      Both variables sit in the same block right after the "Receiver
      routines" comment, so the declaration lands in the identical place.
      Pure textual anchor.

   b) ____napi_schedule(): WRITE_ONCE(napi->list_owner, ...) dropped
      napi_struct has no list_owner member on 6.1 (grep over 6271c130c6e5's
      netdevice.h returns nothing), so keeping the line does not compile.
      list_owner only backs the napi_by_id()/list-ownership bookkeeping from
      a later upstream series; it is not consulted anywhere on the backlog
      path, so omitting it cannot change behaviour.

   c) napi_threaded_poll() split into napi_threaded_poll_loop() + wrapper
      Not a deviation: the same split, applied to 6.1's function body, which
      after patches 09-11 is textually the upstream pre-image. Verified: the
      extracted napi_threaded_poll_loop() is byte-identical between upstream
      dad6b9770263 and this backport.

   d) smpboot block anchor
      Upstream anchors the new backlog_threads block on the code following
      net_page_pool_create(); 6.1 has no net_page_pool_create() (0
      occurrences in 6271c130c6e5). The block is anchored on the comment
      preceding net_dev_init() instead. The inserted code is identical.

   e) net_dev_init()
      Same cause: the "if (net_page_pool_create(i)) goto out;" context lines
      do not exist on 6.1 and were dropped. Both substantive additions are
      kept verbatim, and one of them is load-bearing, not cosmetic:
        INIT_LIST_HEAD(&sd->backlog.poll_list);

      6.1 never initialises backlog.poll_list (no INIT_LIST_HEAD and no
      netif_napi_add for the backlog NAPI in 6271c130c6e5's dev.c). That was
      harmless while the backlog NAPI was only ever reached via
      list_add_tail(), which does not require a pre-initialised node. The
      threaded path calls __napi_poll() on the backlog NAPI with no
      list_add() at all, and __napi_poll() tests:

          if (unlikely(!list_empty(&n->poll_list))) {
                  pr_warn_once("%s: Budget exhausted after napi rescheduled\n",
                               n->dev ? n->dev->name : "backlog");
                  return work;          /* leaves *repoll unset */
          }

      (the "backlog" fallback in that message shows upstream expects this
      NAPI to reach it). On a zeroed node list_empty() returns false, so the
      backlog thread would take this branch on every budget exhaustion,
      print the spurious "backlog: Budget exhausted after napi rescheduled"
      warning and stop repolling. The INIT_LIST_HEAD is therefore required
      for correctness on 6.1, exactly as it is upstream.

*** Test ***
Environment: virtme-ng (vng 1.38) + QEMU/KVM, x86_64, 4 vCPU, 2 GiB.
  baseline: Linux 6.1.183-rt68-rc1
  patched : Linux 6.1.183-rt68-rc1-00015-g567a12e641cc
  config  : CONFIG_PREEMPT_RT=y CONFIG_RPS=y CONFIG_VETH=y CONFIG_SMP=y
            CONFIG_NR_CPUS=4 CONFIG_IRQ_TIME_ACCOUNTING=y

Topology: veth pair, RPS on veth_rx (rx-0/rps_cpus = 1 << 1) steering all RX
to CPU 1. The flood is generated from CPU 0 with ping -f; the peer netns
kernel answers ICMP, so no userspace server is needed.

The key metric is CPU 1's hardirq time, read from /proc/stat field 7 with
CONFIG_IRQ_TIME_ACCOUNTING=y. It is accounted inside the guest kernel, so it
is immune to host vCPU scheduling noise -- unlike userspace wall-clock
measurements, whose run-to-run variance (~3%) exceeds the effect.

Run with: vng --run <bzImage> --cpus 4 --memory 2G \
              --qemu-opts='-machine accel=kvm' --exec 'bash this-script'

  #!/bin/bash
  # cross-CPU RPS IPI cost on PREEMPT_RT.
  # Requires CONFIG_IRQ_TIME_ACCOUNTING=y (hardirq time = /proc/stat field 7).
  set -uo pipefail
  CPU=${CPU:-1}; SECS=${SECS:-20}; HZ=$(getconf CLK_TCK)

  ip netns del ns_rx 2>/dev/null; ip link del veth_tx 2>/dev/null
  ip link add veth_tx type veth peer name veth_rx
  ip netns add ns_rx; ip link set veth_rx netns ns_rx
  ip addr add 192.168.100.1/24 dev veth_tx; ip link set veth_tx up
  ip netns exec ns_rx ip addr add 192.168.100.2/24 dev veth_rx
  ip netns exec ns_rx ip link set veth_rx up

  sleep 1
  ip netns exec ns_rx sh -c "echo $((1 << CPU)) > /sys/class/net/veth_rx/queues/rx-0/rps_cpus"

  irq() { awk -v c="cpu$CPU" '$1==c{print $7}' /proc/stat; }   # hardirq ticks
  rps() { awk -v c=$CPU 'NR==c+1{print $10}' /proc/net/softnet_stat; }

  i0=$(irq); sleep $SECS; i1=$(irq)                            # idle baseline
  dmesg -C; r0=$(rps); j0=$(irq)
  timeout $SECS taskset -c 0 ping -f 192.168.100.2 >/dev/null 2>&1
  j1=$(irq); r1=$(rps)

  idle=$(( (i1 - i0) * 1000 / HZ )); load=$(( (j1 - j0) * 1000 / HZ ))
  ipis=$(( 16#$r1 - 16#$r0 ))
  echo "[$(uname -r)]  CPU$CPU, ${SECS}s windows"
  echo "hardirq time : ${idle} ms idle -> ${load} ms loaded"
  echo "cross-CPU IPIs: ${ipis}"

  [ "$ipis" -gt 0 ] && echo "ns/IPI       : $(awk -v t=$load -v n=$ipis 'BEGIN{printf "%.1f", t*1e6/n}')"
  echo "warnings     : $(dmesg | grep -c do_softirq_post_smp_call_flush)"

  ip netns del ns_rx 2>/dev/null; ip link del veth_tx 2>/dev/null

Results (20 s windows, ping -f flood CPU 0 -> CPU 1):
  Metric                        Unpatched        Patched      Change
  ------------------------------------------------------------------------
  CPU1 hardirq time (idle)      10 ms            10 ms        -
  CPU1 hardirq time (loaded)    910 - 960 ms     40 ms        ~-96%
  as fraction of CPU1 wall time 4.6 - 4.8%       0.2%         -
  cross-CPU IPIs                2.13M - 2.37M    0            -100%
  per-IPI hardirq cost          406 - 428 ns     n/a          -
  do_softirq_post_smp_call_flush 2               0            eliminated

  Two independent unpatched runs gave 960 ms / 2,365,244 IPIs (406 ns/IPI) and
  910 ms / 2,125,950 IPIs (428 ns/IPI). The per-IPI cost is stable across runs
  and the total scales linearly with the IPI count, which closes the
  attribution. The patched kernel stays at the idle floor (40 ms) because no
  IPI is sent at all.

The unpatched IPI path therefore burns ~1 second of the RT CPU's time per 20 s
of cross-CPU RPS load (4.6-4.8% of that CPU) at ~400 ns per IPI. CPU 1's
softirq time also drops to zero on the patched kernel: the packet-processing
work moves out of softirq context into the backlog_napi thread, which is
exactly the intent of the series.

RT wakeup latency was also measured separately (SCHED_FIFO:90 task waking every
200 us on CPU 1 under the same flood, 8 rounds): p50 ~2.2 us and p99 ~5-8 us on
both kernels, with no significant difference. On PREEMPT_RT the softirq path is
already forced into ksoftirqd, which cannot preempt a SCHED_FIFO task, so the
IPI path does not extend RT wakeup jitter. The gain of this series is CPU time
and correctness, not wakeup latency.

*** Summary of measured benefit ***
  - Eliminates the do_softirq_post_smp_call_flush WARN_ON_ONCE (2 -> 0) and
    removes the invoke_softirq()/wakeup_softirqd() call from IPI context.
  - Removes 100% of cross-CPU RPS IPIs (2.1-2.4M -> 0) under load.
  - Recovers ~1 s of CPU time per 20 s of load on the RT CPU, i.e.
    4.6-4.8% -> 0.2% of that CPU spent in hardirq context, at ~400-430 ns
    per IPI on the unpatched kernel.
  - Micro-architectural: patch 02 saves ~14 cycles (~4 ns) per
    skb_defer_free_flush() lock (upstream measurement); patches 05/06 avoid
    redundant NET_RX_SOFTIRQ raises inside net_rx_action(); patch 08 relaxes
    sd->defer_lock to BH-only.
  - No regression in RT wakeup latency; the loopback/same-CPU path keeps the
    inlined fast path (use_local_napi).


Eric Dumazet (9):
  net: napi_schedule_rps() cleanup
  net: add softnet_data.in_net_rx_action
  net: optimize napi_schedule_rps()
  net: optimize ____napi_schedule() to avoid extra NET_RX_SOFTIRQ
  net: add debugging checks in skb_attempt_defer_free()
  net: do not provide hard irq safety for sd->defer_lock
  net: move skb_defer_free_flush() up
  net: make napi_threaded_poll() aware of sd->defer_list
  net: optimize napi_threaded_poll() vs RPS/RFS

Jesper Dangaard Brouer (1):
  net: avoid irqsave in skb_defer_free_flush

Sebastian Andrzej Siewior (4):
  net: Remove conditional threaded-NAPI wakeup based on task state.
  net: Use backlog-NAPI to clean up the defer_list.
  net: Allow to use SMP threads for backlog NAPI.
  net: Rename rps_lock to backlog_lock.

Wen Yang (1):
  Revert "net: Avoid the IPI to free the"

 include/linux/netdevice.h |   9 +-
 net/core/dev.c            | 304 +++++++++++++++++++++++++-------------
 net/core/skbuff.c         |  17 +--
 3 files changed, 215 insertions(+), 115 deletions(-)

-- 
2.25.1

