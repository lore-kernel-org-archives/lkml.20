Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06134AA03D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375696; cv=none; b=utZkwKU7QfPBzJqRA+PMOgfJDT8wX3FYenHJSkeUZNJp7fJG5j589yWVuu1b+BUCvo/Y4oJZZREw+qri6T5Wvd3z5irmwhNRyj75uYo5L9UI3UOKMuDUDjQIcXyoaNtMHeZA9Z3TThLuqyXbwFv/fuSnkEXPwup9ONAdPOG8zIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375696; c=relaxed/simple;
	bh=Pj3Tfj/rXbhYtoCKSJ4tuNiipc0mwby1qypcJp1Kk7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8os89Npt7BGDCVpQUbQgRJr1r6B7lMZmjvKPFZXxW268rEpHr0XbI9vb7i/0f+QZgzjYw302DS9d3EzBXey69IidtzfD0q5+FZORRU5ojN8bs3Q1nCQw7/vFwcuOXVuzMXUJwyScWMADLX0VddFvgJxW5dbzZaOtfJW7LT1WIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWlTn01M; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWlTn01M"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2544ff970dso208745566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788375693; x=1788980493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNUfCL4s/ReoBmg8c9La9jH0Egi+d1LIRRzTEf1FzS0=;
        b=LWlTn01MHKJI/rt8KhroFjQ4dr+gEj0ua2yXhS0Y6g6L389PATHCxrHrxH5YTVDjRd
         a6w5AnN+cQ4k+p24WQYT/RCbS66KsYpBjnC0RoxF/UVn2MV222yRXGn/Qdy2zamVHyCw
         nUyhXpfxaFPX9Y6wy9bx+LdOv/eond11ojhfUJ2DjaZMsIJzW2vErSjCZmiHxzAu9vcl
         dh21AV22YOPs/aj81JJHUH9jIskwewgV/3SpqKd599Oo8B+6o5M/IlecAGe81jheuqqO
         iOWTAs71rNtRZYz4NEN5jkNchCSEO4GjKAViNzXYYm1XHJqFtQqvfZBIFWo22jkXh5pH
         DKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788375693; x=1788980493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNUfCL4s/ReoBmg8c9La9jH0Egi+d1LIRRzTEf1FzS0=;
        b=OTW7cRPuUD/Y5JQNWNZpAo5p2o7JuPewlG3oe+SdIoSsHwpS98m4UAVmPKgpNIetsv
         vmSCgXh7271ywwyI+aUtE9ng3FZ2Eqe/PDIZNxpGWU0lPz7Y7I18YcsmUzSH3UPQq0nd
         O/tNbr17tSKOtuQhNCxaL5vrOWrYRrcz5bRI4/E5e1RwPb8qcPNWMs2hG7JPmb7fVSkB
         w1hCro2CBoNDCOfBQ1ABdWSgxOJac5p7124pOXDF/IeVHRRFzZlUDPvjHPyzfmSxDqFm
         CMpDE/VMwriVUilEGZHfxehDVLpT71dkvceLJBnMgFMDY4Ci6laFYxDnkJHvoeBP3SE6
         Pq1Q==
X-Forwarded-Encrypted: i=1; AKwUvByV6ZiAWOKhZtnQ/GO/m5B9ALoWYLVrX7S9WfaFrLB7ybfMUQM3yrzYgH19lPAglX6CQUGl5WHgM06hevQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m7Qwbg+vtOICAVwG+RrtMF3Q9NiReJMAhuU27t7YqfeaoN6C+l
	5bRqJfroWlfe/k6EKP33wLNr7COofnSHr19VXMrcymqaLuq69B2QIQU=
X-Gm-Gg: AYBFou3iTAQZQ/Xh+8N4kNNiJe9Fqhj2Xm1MhPVXDNY6kxkmIeaWqNPQnjRk6+FrDzl
	CY446pFxFsjG/JLgpBG9RScvZgxpkePuxQBuVx2MkRnd1huAn6LTChge/mcjXIakJBVX1Bph3+f
	APmhoGtILuER1J0rfLrUX/czE2H8arvQXuetK7CDVF+RQQdP5W9qolxCeSN262m/gXv9RipxhZB
	E95QI+ODmoMTG2mBhs0XTbvMN30CRr9pqabCZrIRIwriqvaWdx+nTVrAHBHc220VesuvJqO4v/p
	21XaeAV5tYIPX8hfcG9HciMJOoqohB6y6TDrgFkeYVBIicaKL/wtEiB7p4TTRWIZoj5udEMtXx2
	21L80Vb2oo9x+SdbQH1LpdFn9aYLRfWPbaTCQqeIasO54NvlYm0WybBFfzyGk20z/MFTfQqcJbG
	aIGTxKYbHnCRwWR9yTxrfRtLw2vImBBzqPgTGaQP3GYh6SDWcP+9A=
X-Received: by 2002:a17:907:7293:b0:c25:2e93:28a6 with SMTP id a640c23a62f3a-c25d52871f2mr443022966b.3.1788375692672;
        Wed, 02 Sep 2026 12:01:32 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f42307e6sm611866b.55.2026.09.02.12.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:01:32 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	Wei Wang <weiwan@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net: yield the CPU on every exit of the threaded NAPI poll loop
Date: Wed,  2 Sep 2026 22:00:53 +0100
Message-ID: <20260902210053.263070-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

napi_threaded_poll_loop() reaches cond_resched() only when it is about to
iterate. When __napi_poll() clears repoll the loop breaks first, and
napi_thread_wait() returns without scheduling if work is already pending.
Under a receive load arriving as fast as it is drained the kthread never
yields, and on CONFIG_PREEMPT_NONE nothing else on that CPU runs.

Everything waiting for deferred work on that CPU then blocks. Deleting a
netdev hits three such waits - synchronize_net(), flush_all_backlogs() ->
flush_work() and rcu_barrier() from netdev_run_todo() - which is how this
was found. run_backlog_napi() runs the same loop, so the backlog kthread
can be held off the same way.

rcu_softirq_qs_periodic() does not cover it: it reports a quiescent state
but does not schedule, so the work items and the callbacks still wait.
Moving only that call is not enough either - the delay then migrates from
synchronize_net() to flush_work() and rcu_barrier().

Without the patch the kernel reports the thread holding the CPU:

  rcu: INFO: rcu_sched self-detected stall on CPU
  rcu:  0-....: (5999 ticks this GP) ... (t=6000 jiffies g=913 q=1218)
  CPU: 0 UID: 0 PID: 203 Comm: napi/qdma_eth-0 Not tainted 6.18.44 #0
  Hardware name: Nokia XG-040G-MD (UBI) (DT)
  pc : __dma_sync_single_for_device+0x8/0xfc

Measured on that board (Airoha AN7581, quad core Cortex-A53, PREEMPT_NONE,
HZ=100, airoha_eth with threaded NAPI) while it terminates a 950 Mbit/s TCP
receive load. 30 minute runs, timing "ip link del" of a dummy interface:

                          before        after
  mean                    31.09 s       0.20 s
  worst                  151.92 s       1.00 s
  over 1 s              13 of 37      0 of 89
  RCU stalls, classic          14            0
  RCU stalls, expedited        43            0
  packet rate           79363 p/s    79520 p/s

The packet rate is the control: the same work is done in both runs, so the
difference is not a lighter load. Three of the four CPUs sat around 65%
idle throughout the first run and did not help - the deferred work the
delete waits for is tied to the CPU the poll loop holds.

On preemption, raised in v1: same board and load, unpatched, two halves
differing only in that choice - worst "ip link del" 248.48 s with 8 stalls
under PREEMPT_NONE against 0.39 s and none under PREEMPT_LAZY. So lazy
preemption does hide the symptom, and PREEMPT_NONE and PREEMPT_VOLUNTARY
builds are what is left. It is not the NAPI thread being preempted more -
nonvoluntary_ctxt_switches on it is 4.6/s under LAZY against 13.9/s under
PREEMPT_NONE - so that is a measurement, not a mechanism. The missing yield
is there under either model.

The loop is unchanged in Linus's tree - net/core/dev.c at v7.3-rc1 is
identical here to net/main. The numbers come from 6.18 because that is the
only kernel this board runs: mainline carries en7581-evb alone, while the
SoC dtsi, the board DTS and the airoha_eth changes it needs are still out
of tree. On 6.18 the loop has no busy_poll_last_qs parameter, but with that
pointer NULL the two are the same code, so the change under test is this
one. The busy-poll path is unaffected; cond_resched() was already reached
there.

Reproducing needs the loop re-entered tens of thousands of times a second,
which depends on the driver and the shape of the load rather than on this
board: threaded NAPI can be turned on for any driver through
/sys/class/net/<dev>/threaded, and what it takes on top is little or no
interrupt coalescing. It did not reproduce on mtk_eth_soc, whose net_dim
moderation folds the same packet rate into far fewer interrupts.

Fixes: 29863d41bb6e ("net: implement threaded-able napi poll loop support")
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
v2:
  - answered the tree question: the loop is unchanged in Linus's tree at
    v7.3-rc1, and said why the numbers have to come from 6.18
  - re-ran the A/B on a kernel with no out-of-tree module, so the splat and
    the numbers now come from an untainted 6.18.44 build
  - added the preemption-model measurement, and why PREEMPT_NONE and
    PREEMPT_VOLUNTARY are still the exposed configs
  - noted the repro is not board-specific
  - shortened the comment; no other code change
v1: https://lore.kernel.org/netdev/20260814220427.623427-1-sochnev.v.74@gmail.com/

 net/core/dev.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 38336858c168..5c7f8cdf8443 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -7924,11 +7924,13 @@ static void napi_threaded_poll_loop(struct napi_struct *napi,
 			gro_flush_normal(&napi->gro, HZ >= 1000);
 		local_bh_enable();
 
-		/* Call cond_resched here to avoid watchdog warnings. */
-		if (repoll || busy_poll_last_qs) {
+		if (repoll || busy_poll_last_qs)
 			rcu_softirq_qs_periodic(last_qs);
-			cond_resched();
-		}
+
+		/* napi_thread_wait() can return without scheduling, so yield on
+		 * every exit, not only when the loop iterates.
+		 */
+		cond_resched();
 
 		if (!repoll)
 			break;
-- 
2.55.0

