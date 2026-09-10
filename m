Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505B837F73D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789012467; cv=none; b=ewEA+FFqSPUUwyjKDvSjisBfhDKcYvcOKeuvAbAXdLtEtalgA68dZ6UGsb4j8zy7PriW9/lYEgH/IxjF4cBH/ZsVTDVbJ6phM7eAdSMVfhO45XpNNfkkE6xe8xWb2FSEt2ylpHnLe6MPWsvHFDoB3bl5TvEgj0yCVya+aQgWz9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789012467; c=relaxed/simple;
	bh=d/AtSbK/FrcKXUPP17SvF9Q6aAL31yz8d1rOrT0WoAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H105P7UijWqY7WJty3p18afqwsQjh5Ogjhqj7dIpQ68r4HjKQgGs5+SmPCEC/PGFqE+k9qgQQ5tmyFP7eOtybAizy2DC4NWB0cwrjKxvhJADEN/b3PHB/F6oEO94eN4uSAWCmgQxrJlwzG05CZ4kBFSmnNAuYHPoqLdvPdXjavs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJeI8K+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVyaaYq+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJeI8K+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVyaaYq+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lHqB352032
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lMVcJQ+sqvw2l53XlRY8ZC
	TqZm8AqXejZyjHgWGkYTo=; b=jJeI8K+/j5d0ufRBd37Ln+QJrnkHsvftwozgsX
	/6/rB3X463T+15rXVMoh3PzdUT3Gx4/CaiZ0JA8bEX/H+3SYiKL/0qZ1Xf9cAcy2
	dkuxf0vTqqi0+bv65X8HNhdJTl1gTDEks1SPPxFe03tDT1o7v3wJXBQb4pKudQ+Q
	KM/SwRYqO4tk4Bf22lhyuBuWqSv2JxiKkCYwOBjsVIxO/ls2nV4phimd8Tq1EtPA
	OJa2WNItsXCIMmAJQSzYToaWNqia9gEG2dpKrPv7CQihHJkgJ4FRXAPTFDoGdRZQ
	MlEYDVMiOTwXwm3qP+2zLPEj/YJ+fgCOOwUrrPKsihQKg7YQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydhxh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:54:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso697364a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789012465; x=1789617265; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lMVcJQ+sqvw2l53XlRY8ZCTqZm8AqXejZyjHgWGkYTo=;
        b=TVyaaYq+IoLio22G7Sy5pI0ITuZnOkPiMFlWh4berg5p9PZ2WxFQzlVh3+JyeyDw0S
         3wsYHJ8RqU9kmvbNM4HRJj+ZXgSm8szL1cwxN0OaxaYrDSxYCZB74zpsvL0wLl98bfDd
         3ohiGhsy5d7ZoDeQ+NaBevU9VqhXflH74qStsX3xANptk3NxdXyVVaKBbdIYAftEN4ar
         imGuZOBfRVSIUHGk8DbEBRZZNI8fAAxz8fIqOdt6qHOPcXWUW7Big/8dRvP7K1XuWiPB
         t2x3K1Z6yUVPImu1vA27vKTphJ6pzlyziZAuG3AoqLdUIT+Jk/BOk/YFRwm5AvjZrYAa
         aCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789012465; x=1789617265;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lMVcJQ+sqvw2l53XlRY8ZCTqZm8AqXejZyjHgWGkYTo=;
        b=JiBoONlLlLMvl+MusBQ/RTJ3BmrzYwLSYtoGw37cZP1hDVby+xGQ+23YZkddj5z0BI
         WMyMhIafXIoESU4uYWDbCmM/1eYOB+F9fwjJPPsWj615Qepu4xK4l1ym7FggVtVm5AMq
         03WmQdwPJNWHhMYUsdSGXgjoAhj6yUzSlzq3r5JTUmbDrG6dhGqbTbaaiJWnUc5l6v+O
         tPKHsKwBnGT+Beh5tpAMPcZtiB2KX1eFUOLcCYvJrxvAxIQCsB4vgJqEgacCjcByxKwj
         eVqkZreYyBX2dEzApu8uqfeejx4r+4Ugkqfu9nPa61l3VsWoMn0CNsX6aIAnJU+dPcPa
         P+kA==
X-Gm-Message-State: AFuF++lK47OPBzIxrZdwNvLkHd+3gbJUKBGD2mTvz0WeK8CWJ4NjK7pU
	gs+tezh+6i4Cs2U0AdCHtbYFPj70D+qm4a91SQThRZYpGqhdUOM/zHb3Dw6joiSeiTrvDHfypBw
	Ltplkh32S0CjyecUZ4JhKoGy5qd3AMgfs/8DHel1NUv2ESnwVMnOrM9eEtYoMz67JVgo=
X-Gm-Gg: AYBFou2qzBLHTam5ymjfGmCVSIJt4DpViB4OOlAu5H5PhqBh7gHbTk4CwV70O+5BAD0
	CgUG64jkF8kUDCBEuMFAm4dNWkXWm1gneobzrC1d0YcZAFVA/sL414xdHyIpu69u9OcqrYLkYrR
	BBvllOnUPebLEWXwxuYZH2SiOcBuV1ULp6xIrHD2z5CbI2DzaNBP/TpV1baRehkVLy6OFC+dY0T
	26Lcj7L9igBa80JKZr+mmSN9Koqo0v7S+ldq7gVeXx3ueOGiDHA4PdxVG7JsLFvotvrxJ+GUfMW
	E1RCVHl8rCqfxA1Jac2OEjyRQs2wagWoYreG4/s1ykULUGvRvRF4Sv5Y9GTvn/8R6CVZkbUF2gA
	cKhUW5eavjI7xC4coOLY4
X-Received: by 2002:a17:90b:2685:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39d7791458cmr3194399a91.7.1789012464639;
        Wed, 09 Sep 2026 20:54:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2685:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39d7791458cmr3194362a91.7.1789012464035;
        Wed, 09 Sep 2026 20:54:24 -0700 (PDT)
Received: from [10.213.104.145] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm44933554c88.11.2026.09.09.20.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:54:23 -0700 (PDT)
From: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 09:23:55 +0530
Subject: [PATCH v2] stop_machine: Defer legacy console flushes while a CPU
 runs a stopper callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-defer-legacy-console-write-on-multi_cpu_stop-v2-1-88324d2f4e7f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANIpomoC/5WOWw6CMBBFt0L67ZDysIhf7sMQQssUaqDFFlBC2
 LsF4wL8uclJ7sy5K3FoFTpyDVZicVZOGe0hPgVEtJVuEFTtmcQ0ZvQSp1CjRAsdNpVYQBjtTIf
 wsmpEMBr6qRtVKYapdKMZoE5QMsl4dKac+JeDRaneh+5efNlN/IFi3B17o1X+0C7Hnjnaez919
 p96joBCwnNv5ynLcnkzzoXPqeqE6fvQBym2bfsAsy0gYAEBAAA=
X-Change-ID: 20260824-defer-legacy-console-write-on-multi_cpu_stop-d3ef6f6b150b
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org,
        Aditya Chillara <aditya.chillara@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789012460; l=4641;
 i=aditya.chillara@oss.qualcomm.com; s=20260626; h=from:subject:message-id;
 bh=d/AtSbK/FrcKXUPP17SvF9Q6aAL31yz8d1rOrT0WoAE=;
 b=YvOYF6gHgrvGW79SIFbZeEayvfmdV7XqVZNptoruMXlOh8ciDMHnQI5W8SZ4nc36eLkw8Oznr
 gBtlHI9MLn5Cl7OeSKJPReIxq4HD1IJ3OuuyJWIqQFwriINpK28Ezoz
X-Developer-Key: i=aditya.chillara@oss.qualcomm.com; a=ed25519;
 pk=3vcOzHlHNCpL/4rvfU3cpTk2xIC7SI+TH0gypa9FdZQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAzOCBTYWx0ZWRfXzi8ziVRP7F4w
 kV0TadkKrnt0VrLfETn3aoQ4KOfcWtphSni3capBOy+kapsH2GYwgPgpYcS7olzfGOcUEP4fAih
 KVvbfuUSVG15HwbGIfze7Pj9uedP+Qs=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa229f1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ADoWPsIPcHmb7yck61MA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: fAWf4Kzf3hMkuv8gxtDakjK1KIaIxn6V
X-Proofpoint-ORIG-GUID: fAWf4Kzf3hMkuv8gxtDakjK1KIaIxn6V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAzOCBTYWx0ZWRfX4+Y0AFIVyaPt
 1q1WCQE0RkIxBCpJyAmHYPnqQa9ZM0idcqdA3/dRxmhVtSoWkJPxe+JYgtInjZbQ9EjgJf5rCTw
 Yw0y7r/Sq4xfg1ZdpOjSlgQl8iObScropyTrr2CSbDhJC0n2e8CfvmrkSekHIXo0IsmNmMBhg3d
 f9swo7Z4viL21tIJgozwNW42ddUGvlN6FkI1yvmYNEDpE4L32YztUiYm4QXdcmRp/UVXTce9kGp
 n15sLOCCaRJTXUFL3MQOhQFGrJ690OipEAKB7eBCYnMeOq0tuEdVamhkBkpyr0ihRpTJqTC1jQD
 82Vfgv/50ZnpAuj7NBdxEIKU5EjRjFWY6qSws7/1dGNMheHxgK1A8kQOgTfLvYaRnS9GgIdOn9y
 fAf+i6nD7xxWxlGVCYT42JX9hqHESxbOTP2ZDUH+TtNytDNsOFsKa4ooVlwxOe0DPiJ+2KbM44B
 xWj2hCChOy0lupBAtFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100038

The cpu stopper thread runs above every other scheduling class, so while a
stopper callback executes, nothing else on that CPU is scheduled. If such a
callback emits a normal-priority printk(), the legacy console path can
synchronously flush the pending console backlog. On systems with a slow
UART and a large backlog, this holds the CPU long enough to starve RT
kthreads such as the watchdog pet, and for multi_cpu_stop() prevents the
CPU from advancing the state machine while the other CPUs wait. The
resulting delay can prevent watchdog servicing long enough to trigger a
watchdog bark or bite.

The same can happen from an interrupt taken during the callback:
multi_cpu_stop() keeps interrupts enabled during MULTI_STOP_PREPARE, and a
printk() may be emitted from a softirq run on irq exit.

Run CPU stopper callbacks in printk-deferred context to prevent legacy
console flushes while they execute.

Signed-off-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
---
A device using a legacy UART console (console=ttyMSM0,115200n8) hit a
watchdog bark/bite about 40 seconds after boot.

stop_machine() (used here for kprobe text patching) stops every CPU by
running multi_cpu_stop() on each of them, through the per-CPU
"migration/%u" threads. These threads run at a higher priority than the
msm_watchdog thread. At bite time, all eight CPUs were still spinning in
multi_cpu_stop()'s MULTI_STOP_PREPARE state, where interrupts are left
enabled.

Heavy SELinux denial logging had built up a large backlog on the
console. One CPU took an interrupt while spinning in MULTI_STOP_PREPARE.
Handling it eventually led to a printk(), and because the console was a
legacy console, that printk() synchronously drained the whole backlog
over the slow UART. While the drain was still running, the watchdog bark
interrupt hit the same CPU, found no recent pet, and escalated to a
bite.

The captured stack for that CPU, innermost frame first:

  qcom_soc_set_wdt_bite
  qcom_wdt_bark_handler
  __handle_irq_event_percpu
  handle_irq_event
  handle_fasteoi_irq
  generic_handle_domain_irq
  gic_handle_irq
  do_interrupt_handler
  el1_interrupt
  el1h_64_irq_handler
  el1h_64_irq
  console_flush_all
  console_unlock
  vprintk_emit
  dev_vprintk_emit
  dev_printk_emit
  __dev_printk
  _dev_err
  btspi_sleep_timeout_handler
  call_timer_fn
  __run_timer_base
  run_timer_softirq
  handle_softirqs
  __do_softirq
  ____do_softirq
  call_on_irq_stack
  do_softirq_own_stack
  __irq_exit_rcu
  irq_exit_rcu
  el1_interrupt
  el1h_64_irq_handler
  el1h_64_irq
  multi_cpu_stop
  cpu_stopper_thread
  smpboot_thread_fn
  kthread
  ret_from_fork

Every other CPU stayed parked in the rendezvous the whole time, since
their stopper threads outrank msm_watchdog. Nothing could pet the
watchdog until the drain finished.

This was observed through multi_cpu_stop(), but the hazard is not
specific to it. Every cpu stopper callback runs in stop_sched_class,
above msm_watchdog and every other thread on the CPU, so a slow flush
from any of them (including single-CPU callbacks such as the migration
and task-migration stoppers) can starve the watchdog just as well. The
fix therefore covers all stopper callbacks, not only multi_cpu_stop().

Fix this by running the CPU stopper callbacks in printk-deferred context.

Reproduced and verified with an out-of-tree test module that triggers
stop_machine() with a queued console backlog and a printk() inside the
rendezvous, paired with a kprobe-based script that flags any console
flush happening while a CPU is inside a stopper callback.
---
Changes in v2:
- Use printk_deferred_enter/exit() to defer legacy console flushes instead
  of in_cpu_stop().
- Link to v1: https://patch.msgid.link/20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com
---
 kernel/stop_machine.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index d085ba1f4b44..31f7af41249f 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -507,7 +507,9 @@ static void cpu_stopper_thread(unsigned int cpu)
 		stopper->caller = work->caller;
 		stopper->fn = fn;
 		preempt_count_inc();
+		printk_deferred_enter();
 		ret = fn(arg);
+		printk_deferred_exit();
 		if (done) {
 			if (ret)
 				done->ret = ret;

---
base-commit: 77ae27fd98f3b548797c9f22c10ab5cf1c4ada53
change-id: 20260824-defer-legacy-console-write-on-multi_cpu_stop-d3ef6f6b150b

Best regards,
--  
Aditya Chillara <aditya.chillara@oss.qualcomm.com>

