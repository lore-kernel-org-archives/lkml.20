Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86D2443C20
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124572; cv=none; b=Ijvtb5BLE73072WuL2nwnRTzj+qflmcdbO1TpgE7z+MEVNJiXeL2P13VOw4r1jGcRZhH4om/MTNhRGyRYhh5OHkjIGAd7HbAJnvErwcIYgtq4gvesh7UNK1LyJYVI8cr6Yo9I4iEduQx1RrToTd/kIk2voMttj+HgnWh2OAkIvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124572; c=relaxed/simple;
	bh=quqTOEz10dacKj3huyVJoL9fSgL8VPsDg3469gul4Uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7xMZLfL8Iz7MoQOCYf3q6tFTH/XMjyjGd0BqpsAA48x89Ehc0ZIYQhTBLIHMRw/cNlWlHWdn+LFJersev+DpxRQuCF3fJMK0j87m1Ddf7ihdPQVJjTy7mPdy1SLy+6WMqYW/m2Piib+3rWtnki8ECg9M8i7qkeB4I/C/GxT354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TJ1oPpZ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPOxxFSI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TJ1oPpZ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPOxxFSI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqG902726907
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ia248rcR+gB+qzBvQD1y4Nag5Rte+eufLekcCpB4yGM=; b=TJ1oPpZ73trDdH5i
	hr0yrQvIoBhzgbqXg0rv12qTqUQkCU9fRxgkCaSqhnBGryYtYh0hZwAt116gfiXa
	tVs7YLdi3vesP4UJ8WsXsXIViEJ0L+oA1jkylETesUC5iiBpv4i/jf4UjeT+9Leq
	QIu0GlAuR/q3owbA4vVbJZEy5d8zrsf0dCaA/cR7WvQ6bwS5PoA8jq7DA0rXX9po
	u1kubngmj2d2fO2RbmKPnTyaMQz2yGZPXCXlEPuDoeWQTQ8cOiL58f7X0NblDDzZ
	rB9EY4RElZjwpfE5qRNkof3zqdRtsSysvn6osMNUKtfQRpf07Ii4XLCSowkvdiqv
	INR7lg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7ucj32e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:02:48 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8048c813cceso501564a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789124568; x=1789729368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia248rcR+gB+qzBvQD1y4Nag5Rte+eufLekcCpB4yGM=;
        b=KPOxxFSIDuHBV/wazFTIQkE7sfmzkNGf3GSXSgV4NSK2MamgF0XpPD3vrxN2JT/tDM
         IAjd5M6wYKoZT5+dKGGwyyqYy8d4qBqP0QVi7D7nJL+vIcFpgbLpUSRqdZ6IiRxDbE0Q
         1r4VeAMHC0hp1NUhRBC7zjRNT1/jQRbRVtK/xH6zOdOBKjwloWrXXt3jP/pqN2IbINKW
         Y817ku/l7qoig4NEhNpO/1GL+NNFZxyDL7zM2HOwr7Fmhp+9n+S+uvMBtlJENvhTl/+d
         WcdRIXnE1rw5yF9QPQpmOa/k9r356W4yPHj0sn3DWrI3AoGcJRZJVg0dmTnqIRCvv3wM
         0BuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789124568; x=1789729368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ia248rcR+gB+qzBvQD1y4Nag5Rte+eufLekcCpB4yGM=;
        b=TSa4VgSRwFzOorJLrZdh63R7+2JWplkcqLPupQN1vSLC5DSMDj0zsrL4g7WRsMijqF
         dW92y0NYEgVfwmwrje2D91unMgCOzRtnuB5auV0NELezDJ64DPUOGI9iSUZnq6gh2o0W
         dBONcwBEJW9UOinsvipLXeLgPo7SuV99InmbpVo3lhwBJXyAaE5/s+olSzySJjY/ZVNN
         SFFuPppTI6K1etjfSmT654lgnLSistrIdBx/XFKT3smyopv0iMrQaax8hPCHMUPY3Eey
         5oH44f4RQEDY/4B+nTB2YKVGdb7fLOk/4MX+fk4Ds20LySSiISStL+kuNg3z4hkxBMJ4
         vYfA==
X-Forwarded-Encrypted: i=1; AKwUvBzJQk9nNEzsQB4UMBP0nT+zsmrwcFvuWqyJsw2UScwLutSTENoDBHaJ8NWBJAQ/UCpOSqRSZEJd+7L4nuA=@vger.kernel.org
X-Gm-Message-State: AFuF++nbXykD/BUoSTWyHa9Lv9A9h6yqin6aH3HZy1jbkSYyH5gFuZI4
	QANSzZLDldFqktVmSEnQaG4GKmXwTPYLrCWMTXby10bEBqiOHRodTH7bxgHbeKFx+N609PB6858
	0D+LWs7QIYtlVpOYaleK+qBvmqnyrJuqTrZYNxMg9lVFxSfYqAxeKRNMML18trXzV4BJSsBSUE3
	U=
X-Gm-Gg: AYBFou3Hwto70ylgt9OlkXMk0kPWC/99lCx68z7S2lnoq7v2yX9Pf3QGzDChqmyit1u
	QoFT6z4vmwk6Wp2lbHGDjh6gSO4YX+ApIjYLOmb587vwMdEey1Q+X6XBCEIVmf5UgnVUXYYA79c
	r3MseH59PVESAIOyfnhXqFas8mUp0V9QGEkAc02edICwD4qE3TlTEbeZPxCVJksXyj1nCWzoxe3
	taEtsn6aHOcxteE9sqFL6Ov3qj7P9si1S3AB6zQCfBvgprGCUhryx0kB+HntKCdfbAM7Mp8br0C
	RujoXFqds2M05QklK6BaFiCii8qHyWhLLxNWc2OkajkKNV0GN7Y8jbg6qT6G+yRBP5ZZs373tRN
	5g982TNgjMBSSkKBQ+9KA/oqx+/IzvdeMqw==
X-Received: by 2002:a05:6820:5711:10b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6c0b9952e2cmr1653192eaf.1.1789124566865;
        Fri, 11 Sep 2026 04:02:46 -0700 (PDT)
X-Received: by 2002:a05:6820:5711:10b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6c0b9952e2cmr1653069eaf.1.1789124565465;
        Fri, 11 Sep 2026 04:02:45 -0700 (PDT)
Received: from [10.218.24.187] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm6531620eec.0.2026.09.11.04.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 04:02:44 -0700 (PDT)
Message-ID: <bbbbd180-5ee5-4e85-b333-dd5d0a89478b@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 16:32:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] stop_machine: Defer legacy console flushes while a CPU
 runs a stopper callback
To: Bradley Morgan <brads@mainlining.org>
Cc: john.ogness@linutronix.de, linux-kernel@vger.kernel.org, pmladek@suse.com,
        rostedt@goodmis.org, senozhatsky@chromium.org
References: <87984398-AD80-4AC8-B5FD-21219BA85FD5@mainlining.org>
Content-Language: en-US
From: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
In-Reply-To: <87984398-AD80-4AC8-B5FD-21219BA85FD5@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3dfd8 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=lVcFi4vLCyaoz5eIpfwA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE1NSBTYWx0ZWRfX8ch8dE2uAhM2
 3QzFp1aH0BoHKlT64ZrsdCct1DxU2GDuDA6Xss3ggMZfNiSBF7Frc4npbdEty0EtEnNhZT6aaWm
 pCxvgqnWmY7A7GNKn5gLge0MGfjgskMV61vdFfniTw/8ZT7ZD946QULLvDutX6CLzS+JnDMoWYt
 Q0GuPA2zR377Dbx+fvpgB7DhrGdzhSrRMOepGwQqjLUnNscPx1cRK+5g+fZVw1ffOwPkiySKz/n
 OBPBj+1eeMA7AqNnCEvYyi3SEkJEWaIOV9WAnGp3B2tDJr5/I+u3uLe/uJAg6GGTAhJmb3i+IPc
 KfVV+A+9wBqgfJzwX54KcSOE1G659LnUY2CpPV5L6joRCZZT0CxD5h+ia9nzD49MwwFLFr25R2H
 /n8d5QhTllsBzfHhLsLd665ELF6qml/9cx3KNEqNCoShjbaxThkr8lpVhx9STA7IL1hKn3vUger
 bNv+8epuhtyTA78IV5g==
X-Proofpoint-GUID: NEgwY5gynGAzV7AoEcca9u1_NNb89bbw
X-Proofpoint-ORIG-GUID: NEgwY5gynGAzV7AoEcca9u1_NNb89bbw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE1NSBTYWx0ZWRfX4X8+60BS+VdO
 /r6HWsOTxB9SfDQcdYaUXo20dc6l3zex2XpF7nWd1pJSiFKPfz7foxlxJFseuSgduxa0t4LD3nG
 6Z+u61n8sT/L6fI4AvPYoWuihVoCAtY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110155

On 9/10/2026 9:46 PM, Bradley Morgan wrote:
> On 10 September 2026 04:53:55 BST, Aditya Chillara
> <aditya.chillara@oss.qualcomm.com> wrote:
>> The cpu stopper thread runs above every other scheduling class, so while a
>> stopper callback executes, nothing else on that CPU is scheduled. If such
>> a
>> callback emits a normal-priority printk(), the legacy console path can
>> synchronously flush the pending console backlog. On systems with a slow
>> UART and a large backlog, this holds the CPU long enough to starve RT
>> kthreads such as the watchdog pet, and for multi_cpu_stop() prevents the
>> CPU from advancing the state machine while the other CPUs wait.
> Oh!
> 
>> The
>> resulting delay can prevent watchdog servicing long enough to trigger a
>> watchdog bark or bite.
>>
>> The same can happen from an interrupt taken during the callback:
>> multi_cpu_stop() keeps interrupts enabled during MULTI_STOP_PREPARE, and a
>> printk() may be emitted from a softirq run on irq exit.
>>
>> Run CPU stopper callbacks in printk-deferred context to prevent legacy
>> console flushes while they execute.
>>
> 
> Wow! Thanks
> 
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> 
> 
>> Signed-off-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
>> ---
>> A device using a legacy UART console (console=ttyMSM0,115200n8) hit a
>> watchdog bark/bite about 40 seconds after boot.
>>
> 
> Which SOC?

It is "Hawi" (actively being upstreamed as of now)

> 
>> stop_machine() (used here for kprobe text patching) stops every CPU by
>> running multi_cpu_stop() on each of them, through the per-CPU
>> "migration/%u" threads. These threads run at a higher priority than the
>> msm_watchdog thread. At bite time, all eight CPUs were still spinning in
>> multi_cpu_stop()'s MULTI_STOP_PREPARE state, where interrupts are left
>> enabled.
>>
>> Heavy SELinux denial logging had built up a large backlog on the
>> console. One CPU took an interrupt while spinning in MULTI_STOP_PREPARE.
>> Handling it eventually led to a printk(), and because the console was a
>> legacy console, that printk() synchronously drained the whole backlog
>> over the slow UART. While the drain was still running, the watchdog bark
>> interrupt hit the same CPU, found no recent pet, and escalated to a
>> bite.
>>
>> The captured stack for that CPU, innermost frame first:
>>
>>  qcom_soc_set_wdt_bite
>>  qcom_wdt_bark_handler
>>  __handle_irq_event_percpu
>>  handle_irq_event
>>  handle_fasteoi_irq
>>  generic_handle_domain_irq
>>  gic_handle_irq
>>  do_interrupt_handler
>>  el1_interrupt
>>  el1h_64_irq_handler
>>  el1h_64_irq
>>  console_flush_all
>>  console_unlock
>>  vprintk_emit
>>  dev_vprintk_emit
>>  dev_printk_emit
>>  __dev_printk
>>  _dev_err
>>  btspi_sleep_timeout_handler
>>  call_timer_fn
>>  __run_timer_base
>>  run_timer_softirq
>>  handle_softirqs
>>  __do_softirq
>>  ____do_softirq
>>  call_on_irq_stack
>>  do_softirq_own_stack
>>  __irq_exit_rcu
>>  irq_exit_rcu
>>  el1_interrupt
>>  el1h_64_irq_handler
>>  el1h_64_irq
>>  multi_cpu_stop
>>  cpu_stopper_thread
>>  smpboot_thread_fn
>>  kthread
>>  ret_from_fork
> 
> Same question as above, but a added "Is this a modern SOC?"

Yes

> 
>>
>> Every other CPU stayed parked in the rendezvous the whole time, since
>> their stopper threads outrank msm_watchdog. Nothing could pet the
>> watchdog until the drain finished.
>>
>> This was observed through multi_cpu_stop(), but the hazard is not
>> specific to it. Every cpu stopper callback runs in stop_sched_class,
>> above msm_watchdog and every other thread on the CPU, so a slow flush
>>from any of them (including single-CPU callbacks such as the migration
>> and task-migration stoppers) can starve the watchdog just as well. The
>> fix therefore covers all stopper callbacks, not only multi_cpu_stop().
>>
>> Fix this by running the CPU stopper callbacks in printk-deferred context.
>>
>> Reproduced and verified with an out-of-tree test module that triggers
>> stop_machine() with a queued console backlog and a printk() inside the
>> rendezvous, paired with a kprobe-based script that flags any console
>> flush happening while a CPU is inside a stopper callback.
> 
> Hmm, interesting, could you provide what you did? (Not in the description,
> but to me so I can have a look at it)

Sure, here's what I used (the testing code is generated by Claude Code
with claude-opus-4-8 and includes remnants from v1's testing):

diff --git a/drivers/mcs/mcs_repro.c b/drivers/mcs/mcs_repro.c
new file mode 100644
index 0000000000000..ce851212e0950
--- /dev/null
+++ b/drivers/mcs/mcs_repro.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mcs_repro.c - Reproduce the pre-fix bug targeted by the [DNM] patch
+ *               "printk: Defer legacy console flushes from multi_cpu_stop()".
+ *
+ * The bug: a normal-priority printk() issued by a CPU that is *inside*
+ * multi_cpu_stop() takes the legacy_direct flush path and synchronously
+ * drives a slow legacy console (e.g. the ttyMSM0 UART) while the other
+ * rendezvous participants spin waiting for it. The patch adds an
+ * !in_multi_cpu_stop() guard in printk_get_console_flush_type() that forces
+ * legacy_offload instead, so no console flush happens in-window.
+ *
+ * Why a module, and why stop_machine():
+ *   The flush must originate ON a CPU that is executing multi_cpu_stop().
+ *   A userspace/process-context printk (e.g. writes to /dev/kmsg) runs on
+ *   some *other* CPU and can never satisfy this. stop_machine(fn, ...) runs
+ *   @fn on the active participant CPU during MULTI_STOP_RUN, at which point
+ *   this_cpu(multi_cpu_stop_active) is already true (set at the top of
+ *   multi_cpu_stop(), cleared only at its very end). A plain printk() from
+ *   @fn therefore observes:
+ *       in_multi_cpu_stop()          == true
+ *       is_printk_legacy_deferred()  == false  (not RT, not NMI, no
+ *                                                printk_context, not cpu_sync)
+ *   -> unpatched: ft.legacy_direct = true  -> console_unlock() flushes now
+ *   -> patched:   ft.legacy_offload = true -> deferred, no in-window flush.
+ *
+ * Detection: run mcs-printk-probe.sh --baseline while triggering this module.
+ * A "flushes while PROTECTED > 0" result is the reproduced bug.
+ *
+ * Usage (on target, as root):
+ *   insmod mcs_repro.ko                 # fires 'iters' rendezvous on load
+ *   echo 1 > /sys/kernel/mcs_repro/fire # fire another batch on demand
+ *   rmmod mcs_repro
+ *
+ * Module params:
+ *   iters=N     rendezvous to trigger on load / per fire   (default 5)
+ *   backlog=N   records to pre-queue via printk() before each rendezvous so
+ *               the in-window console_unlock() has real work to flush and the
+ *               stall is observable                          (default 200)
+ *   loud=0/1    also printk() a marker outside the window    (default 1)
+ */
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/stop_machine.h>
+#include <linux/smp.h>
+#include <linux/delay.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+static unsigned int iters = 5;
+module_param(iters, uint, 0644);
+MODULE_PARM_DESC(iters, "rendezvous to trigger per fire (default 5)");
+
+static unsigned int backlog = 200;
+module_param(backlog, uint, 0644);
+MODULE_PARM_DESC(backlog, "records to pre-queue before each rendezvous (default 200)");
+
+static int loud = 1;
+module_param(loud, int, 0644);
+MODULE_PARM_DESC(loud, "emit an out-of-window marker printk too (default 1)");
+
+static unsigned int flood;
+module_param(flood, uint, 0644);
+MODULE_PARM_DESC(flood,
+       "in-window printk lines per rendezvous (default 0). On an unpatched "
+       "kernel every one flushes the legacy console synchronously while all "
+       "CPUs are captured in the rendezvous; a large value (e.g. 6000) stalls "
+       "long enough that nothing can pet the watchdog -> bark then bite/reset.");
+
+/*
+ * Runs on the active participant CPU during MULTI_STOP_RUN, i.e. with
+ * this_cpu(multi_cpu_stop_active) == true. This normal-priority printk() is
+ * the payload: on an unpatched kernel it flushes the legacy console right
+ * here, inside the rendezvous window the probe script is watching.
+ *
+ * IRQs are disabled in this phase, but that does NOT defer legacy printing:
+ * is_printk_legacy_deferred() checks printk_context / in_nmi / cpu_sync, none
+ * of which are set by local_irq_disable(). So the legacy_direct path is live.
+ */
+static int mcs_repro_fn(void *arg)
+{
+       unsigned long n = (unsigned long)arg;
+       unsigned int k;
+
+       /*
+        * One in-window flush is a definitive *invariant* reproduction, but a
+        * single line drains in a few hundred us -- far too short to trip any
+        * watchdog. To reproduce the severe form (bark -> bite -> reset), loop:
+        * on an unpatched kernel each of these printk()s takes the legacy_direct
+        * path and synchronously pushes bytes out the slow UART, right here,
+        * while every other CPU spins in the rendezvous with IRQs disabled.
+        * Nothing can pet the watchdog, so a large 'flood' produces an unbounded
+        * in-window stall.
+        *
+        * Keep these at a NORMAL level (KERN_INFO). The flush type is decided by
+        * nbcon_get_default_prio(): a normal printk() stays NBCON_PRIO_NORMAL,
+        * which is the *only* branch the patch guards with !in_multi_cpu_stop().
+        * A higher-priority message (e.g. KERN_EMERG raising NBCON_PRIO_EMERGENCY)
+        * would take the unguarded emergency branch and flush in-window even on a
+        * patched kernel -- a false FAIL. So the message must be normal-priority;
+        * the caller (the .sh runner) raises console_loglevel to 8 so these INFO
+        * lines actually reach the console and get flushed.
+        *
+        * We are stopping every CPU; do NOT sleep here. The stall is the point.
+        */
+       printk(KERN_INFO
+              "mcs_repro: in-window printk (rendezvous %lu) on cpu %d flood=%u\n",
+              n, smp_processor_id(), flood);
+
+       for (k = 0; k < flood; k++)
+               printk(KERN_INFO
+                      "mcs_repro: in-window flood %u/%u rendezvous %lu cpu %d\n",
+                      k, flood, n, smp_processor_id());
+       return 0;
+}
+
+static void mcs_repro_fire(void)
+{
+       unsigned long i, j;
+
+       pr_info("mcs_repro: firing %u rendezvous (backlog=%u)\n", iters, backlog);
+
+       for (i = 0; i < iters; i++) {
+               /*
+                * Pre-queue records so the in-window console_unlock() has a
+                * backlog to drain: the longer the synchronous flush, the more
+                * clearly it overlaps the rendezvous. These run in process
+                * context here (out of window) -- they only build pressure.
+                */
+               for (j = 0; j < backlog; j++)
+                       printk(KERN_INFO "mcs_repro: backlog %lu/%lu\n", j, i);
+
+               if (loud)
+                       printk(KERN_WARNING
+                              "mcs_repro: about to enter rendezvous %lu\n", i);
+
+               /*
+                * stop_machine() with a NULL cpumask stops every online CPU and
+                * runs mcs_repro_fn() on the active one -- from inside
+                * multi_cpu_stop(). This is the trigger.
+                */
+               stop_machine(mcs_repro_fn, (void *)i, NULL);
+
+               /* Let the console/UART drain between rounds. */
+               msleep(20);
+       }
+
+       pr_info("mcs_repro: done. If unpatched, check the probe for "
+               "'flushes while PROTECTED > 0'.\n");
+}
+
+/* --- optional on-demand trigger: echo 1 > /sys/kernel/mcs_repro/fire --- */
+static ssize_t fire_store(struct kobject *kobj, struct kobj_attribute *attr,
+                         const char *buf, size_t count)
+{
+       mcs_repro_fire();
+       return count;
+}
+static struct kobj_attribute fire_attr = __ATTR_WO(fire);
+
+static struct attribute *mcs_repro_attrs[] = {
+       &fire_attr.attr,
+       NULL,
+};
+static const struct attribute_group mcs_repro_group = {
+       .attrs = mcs_repro_attrs,
+};
+static struct kobject *mcs_repro_kobj;
+
+static int __init mcs_repro_init(void)
+{
+       int ret;
+
+       mcs_repro_kobj = kobject_create_and_add("mcs_repro", kernel_kobj);
+       if (mcs_repro_kobj) {
+               ret = sysfs_create_group(mcs_repro_kobj, &mcs_repro_group);
+               if (ret) {
+                       kobject_put(mcs_repro_kobj);
+                       mcs_repro_kobj = NULL;
+                       pr_warn("mcs_repro: sysfs group failed (%d); "
+                               "on-demand /sys/kernel/mcs_repro/fire disabled\n",
+                               ret);
+               }
+       } else {
+               pr_warn("mcs_repro: kobject failed; on-demand fire disabled\n");
+       }
+
+       /* Fire once on load so 'insmod' alone reproduces without extra steps. */
+       mcs_repro_fire();
+       return 0;
+}
+
+static void __exit mcs_repro_exit(void)
+{
+       if (mcs_repro_kobj)
+               kobject_put(mcs_repro_kobj);
+       pr_info("mcs_repro: unloaded\n");
+}
+
+module_init(mcs_repro_init);
+module_exit(mcs_repro_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Reproduce in-window legacy console flush from multi_cpu_stop()");
+MODULE_AUTHOR("mcs-printk-probe");
diff --git a/mcs-printk-probe.sh b/mcs-printk-probe.sh
new file mode 100755
index 0000000000000..d575f55ae15fe
--- /dev/null
+++ b/mcs-printk-probe.sh
@@ -0,0 +1,478 @@
+#!/bin/sh
+# Verify: no legacy console flush on a CPU while it is inside multi_cpu_stop().
+#
+# Tests the [DNM] "printk: Defer legacy console flushes from multi_cpu_stop()"
+# patch by observable consequence, because both decision points are inlined
+# and cannot be probed directly:
+#   in_multi_cpu_stop()            __always_inline (include/linux/stop_machine.h)
+#   printk_get_console_flush_type() static inline  (kernel/printk/internal.h)
+#
+# Trigger: on arm64 every kprobe arm/disarm patches text via
+# aarch64_insn_patch_text() -> stop_machine_cpuslocked(), so probe management
+# is itself a rendezvous. No hotplug needed (but --hotplug widens the window).
+#
+# Usage:
+#   ./mcs-printk-probe.sh                 # full run: setup, stress, report
+#   ./mcs-printk-probe.sh --iters 50
+#   ./mcs-printk-probe.sh --hotplug        # add CPU hotplug as a second trigger
+#   ./mcs-printk-probe.sh --no-backlog     # skip /dev/kmsg log pressure
+#   ./mcs-printk-probe.sh --no-requeue-probe  # tolerate a missing requeue probe
+#   ./mcs-printk-probe.sh --baseline       # kernel WITHOUT the fix: expect the
+#                                          # bug, so in-window flushes = success
+#                                          # (implies --no-requeue-probe)
+#   ./mcs-printk-probe.sh --report-only    # re-analyse an existing trace
+#   ./mcs-printk-probe.sh --cleanup        # remove probes, restore tracing
+set -u
+
+ITERS=20
+USE_HOTPLUG=0
+USE_BACKLOG=1
+REPORT_ONLY=0
+CLEANUP_ONLY=0
+KEEP=0
+NO_REQUEUE=0
+BASELINE=0
+SAVE=/data/local/tmp/mcs-printk-trace.txt
+
+while [ $# -gt 0 ]; do
+       case "$1" in
+       --iters) ITERS=$2; shift 2 ;;
+       --hotplug) USE_HOTPLUG=1; shift ;;
+       --no-backlog) USE_BACKLOG=0; shift ;;
+       --no-requeue-probe) NO_REQUEUE=1; shift ;;
+       --baseline) BASELINE=1; NO_REQUEUE=1; shift ;;
+       --report-only) REPORT_ONLY=1; shift ;;
+       --cleanup) CLEANUP_ONLY=1; shift ;;
+       --keep) KEEP=1; shift ;;
+       --save) SAVE=$2; shift 2 ;;
+       -h|--help) sed -n '2,28p' "$0"; exit 0 ;;
+       *) echo "unknown option: $1" >&2; exit 2 ;;
+       esac
+done
+
+# ---------------------------------------------------------------- tracefs ----
+
+TR=
+for d in /sys/kernel/tracing /sys/kernel/debug/tracing; do
+       [ -f "$d/kprobe_events" ] && { TR=$d; break; }
+done
+if [ -z "$TR" ]; then
+       # --report-only just parses a saved trace; it needs no tracefs at all, so
+       # allow it to run off-target (e.g. analysing a pulled trace on a host).
+       if [ "$REPORT_ONLY" = 1 ] && [ -r "$SAVE" ]; then
+               echo "note: no tracefs; analysing $SAVE only." >&2
+       else
+               echo "FATAL: tracefs with kprobe_events not found." >&2
+               echo "  need CONFIG_KPROBES=y + CONFIG_KPROBE_EVENTS=y; try: mount -t tracefs none /sys/kernel/tracing" >&2
+               exit 1
+       fi
+else
+       [ "$(id -u 2>/dev/null || echo 0)" = 0 ] || echo "WARN: not root; writes to $TR will likely fail." >&2
+fi
+
+# kprobe_events is global -- there is only one list of kprobe events, and any
+# tool opening it with O_TRUNC calls dyn_events_release_all() (see
+# kernel/trace/trace_kprobe.c) which deletes *everyone's* probes and resets the
+# buffer via tracing_reset_all_online_cpus(). On Android, Perfetto/traced_probes
+# does exactly this.
+#
+# The probe list cannot be made private, but the ring buffer, the per-event
+# enables and tracing_on can: a tracefs instance gets its own events/ tree and
+# its own tracing_on. Record into an instance so a competing tracer clearing the
+# top-level buffer does not silently discard our events.
+#
+# EV is where per-event enables and the buffer live; TR stays the top level,
+# which is the only place kprobe_events exists.
+INST=$TR/instances/mcsprintk
+EV=$TR
+USE_INST=0
+if [ -d "$TR/instances" ]; then
+       if [ -d "$INST" ] || mkdir "$INST" 2>/dev/null; then
+               if [ -f "$INST/tracing_on" ]; then
+                       EV=$INST
+                       USE_INST=1
+               fi
+       fi
+fi
+
+BACKLOG_PID=
+# PID of the shell that installed the exit trap, plus a filesystem sentinel.
+# Shell-variable guards alone are not enough: a subshell inherits both the trap
+# AND a copy of the variables, so it can believe it is the main shell. The
+# sentinel file is shared state, so whoever creates it first owns teardown.
+MAIN_PID=$$
+DONE_FLAG=/data/local/tmp/.mcs-printk-cleanup.$MAIN_PID
+case "$DONE_FLAG" in
+/data/local/tmp/*) [ -d /data/local/tmp ] || DONE_FLAG=/tmp/.mcs-printk-cleanup.$MAIN_PID ;;
+esac
+
+cleanup_probes() {
+       echo 0 > "$EV/tracing_on" 2>/dev/null
+       [ -f "$EV/events/kprobes/enable" ] && echo 0 > "$EV/events/kprobes/enable" 2>/dev/null
+       # Each removal is itself a rendezvous; harmless once tracing is off.
+       # kprobe_events lives only at the top level, never in an instance.
+       for p in trig flush flush2 deferred mcs_in mcs_out; do
+               echo "-:$p" >> "$TR/kprobe_events" 2>/dev/null
+       done
+       [ "$USE_INST" = 1 ] && rmdir "$INST" 2>/dev/null
+       :
+}
+
+on_exit() {
+       # Only the main shell tears down, and only once.
+       [ "$$" = "$MAIN_PID" ] || return 0
+       [ -e "$DONE_FLAG" ] && return 0
+       : > "$DONE_FLAG" 2>/dev/null
+       [ -n "$BACKLOG_PID" ] && kill "$BACKLOG_PID" 2>/dev/null
+       wait "$BACKLOG_PID" 2>/dev/null
+       [ "$KEEP" = 1 ] || cleanup_probes
+       rm -f "$DONE_FLAG" 2>/dev/null
+}
+
+if [ "$CLEANUP_ONLY" = 1 ]; then
+       cleanup_probes
+       echo "probes removed."
+       exit 0
+fi
+
+# ------------------------------------------------------- console sanity ------
+# If no legacy console is registered, have_legacy_console is false, the patched
+# branch in kernel/printk/internal.h never executes, and a clean trace proves
+# nothing. Report it rather than silently passing.
+
+LEGACY_HINT=unknown
+if [ -r /proc/consoles ]; then
+       echo "--- /proc/consoles ---"
+       cat /proc/consoles
+       echo "----------------------"
+       if grep -qi 'N.*C' /proc/consoles 2>/dev/null || grep -q 'tty' /proc/consoles 2>/dev/null; then
+               LEGACY_HINT=likely
+       fi
+fi
+
+# ------------------------------------------------------------- setup ---------
+
+if [ "$REPORT_ONLY" = 0 ]; then
+       trap on_exit EXIT INT TERM
+
+       cleanup_probes
+       # Re-create the instance: cleanup_probes removes it.
+       if [ "$USE_INST" = 1 ]; then
+               mkdir "$INST" 2>/dev/null
+               [ -f "$INST/tracing_on" ] || { EV=$TR; USE_INST=0
+                       echo "WARN: could not create tracefs instance; using top level." >&2; }
+       fi
+       [ "$USE_INST" = 1 ] && echo "recording into instance: $INST"
+       echo nop > "$EV/current_tracer" 2>/dev/null
+       : > "$EV/trace"
+       # Remove any saved trace from a previous run. Two consecutive runs reporting
+       # byte-identical counts is the signature of analysing a stale file.
+       rm -f "$SAVE" 2>/dev/null
+
+       add_probe() { # name spec -> 0 if registered
+               if echo "$2" >> "$TR/kprobe_events" 2>/dev/null; then
+                       return 0
+               fi
+               echo "note: could not register probe '$1' ($2)" >&2
+               return 1
+       }
+
+       # Observers first, armed before any trigger. A probe cannot observe its own
+       # arming: the breakpoint goes live inside aarch64_insn_patch_text_cb(), i.e.
+       # partway through a rendezvous the other CPUs already entered.
+       FLUSH_SYM=none
+       if add_probe flush 'p:flush console_flush_all'; then
+               FLUSH_SYM=console_flush_all
+       fi
+       # console_flush_all is static and may be inlined; console_unlock is the
+       # legacy loop's external entry point and survives inlining.
+       if add_probe flush2 'p:flush2 console_unlock'; then
+               [ "$FLUSH_SYM" = none ] && FLUSH_SYM=console_unlock
+       fi
+       if [ "$FLUSH_SYM" = none ]; then
+               echo "FATAL: neither console_flush_all nor console_unlock is probe-able." >&2
+               exit 1
+       fi
+
+       # printk_defer_console_output marks the requeue point: it runs *after* the
+       # per-CPU flag is cleared, so it is the boundary between the protected
+       # region and the benign tail of multi_cpu_stop(). See analysis notes.
+       #
+       # It is a *global* function, so it is in kallsyms unconditionally -- if the
+       # patch is present. Failure to probe it most likely means the running kernel
+       # does not carry the patch, in which case the whole run is moot. Say so.
+       if ! add_probe deferred 'p:deferred printk_defer_console_output'; then
+               if [ "$NO_REQUEUE" = 1 ]; then
+                       echo "WARN: no requeue boundary (--no-requeue-probe); the benign tail of" >&2
+                       echo "  multi_cpu_stop() cannot be distinguished, so late flushes may be" >&2
+                       echo "  reported as violations. Treat any FAIL as needing manual review." >&2
+               else
+                       echo "" >&2
+                       echo "FATAL: cannot probe printk_defer_console_output." >&2
+                       if [ -r /proc/kallsyms ] && ! grep -qw printk_defer_console_output /proc/kallsyms 2>/dev/null; then
+                               if grep -qw multi_cpu_stop /proc/kallsyms 2>/dev/null; then
+                                       echo "  Symbol absent from /proc/kallsyms while multi_cpu_stop is present:" >&2
+                                       echo "  the running kernel does NOT carry the patch under test." >&2
+                                       echo "  Reflash a kernel built with the [DNM] printk deferral patch." >&2
+                               else
+                                       echo "  /proc/kallsyms exposes no symbols (kptr_restrict?), cannot confirm." >&2
+                                       echo "  Check: sysctl kernel.kptr_restrict  (needs 0 to read symbol names)" >&2
+                               fi
+                       fi
+                       echo "  Override with --no-requeue-probe to test the flag window only." >&2
+                       exit 1
+               fi
+       fi
+
+       add_probe mcs_in  'p:mcs_in multi_cpu_stop' || { echo "FATAL: cannot probe multi_cpu_stop." >&2; exit 1; }
+       add_probe mcs_out 'r:mcs_out multi_cpu_stop' || echo "WARN: no kretprobe; window end will be inferred." >&2
+
+       # Verify the enables actually took. Silent failure here (SELinux, or another
+       # tracer clearing kprobe_events via O_TRUNC) yields an empty buffer that
+       # looks indistinguishable from "no events occurred".
+       echo 1 > "$EV/events/kprobes/enable" 2>/dev/null
+       echo 1 > "$EV/tracing_on" 2>/dev/null
+       en=$(cat "$EV/events/kprobes/enable" 2>/dev/null)
+       on=$(cat "$EV/tracing_on" 2>/dev/null)
+       case "$en" in
+       1*) ;;
+       *)  echo "FATAL: events/kprobes/enable did not take (reads '$en')." >&2
+           echo "  Probes are registered but disarmed, so nothing will be recorded." >&2
+           exit 1 ;;
+       esac
+       if [ "$on" != 1 ]; then
+               echo "FATAL: tracing_on did not take (reads '$on')." >&2
+               echo "  Something is resetting tracefs -- most likely Perfetto/traced_probes." >&2
+               echo "  Try: stop traced_probes  (and 'start traced_probes' afterwards)" >&2
+               exit 1
+       fi
+
+       # Snapshot the probe list so we can tell afterwards whether someone deleted
+       # our probes out from under us (O_TRUNC on kprobe_events wipes all of them).
+       probes_before=$(grep -c . "$TR/kprobe_events" 2>/dev/null || echo 0)
+
+       # --------------------------------------------------------- stress --------
+       # The bug needs a normal-priority printk() from an interrupt during
+       # MULTI_STOP_PREPARE plus a pending backlog. An idle system shows nothing.
+       if [ "$USE_BACKLOG" = 1 ] && [ -w /dev/kmsg ]; then
+               # Run the backlog generator as a FRESH PROCESS (sh -c), not a subshell.
+               #
+               # A background subshell inherits the parent's trap handlers, and 'trap -'
+               # inside it is not reliably honoured across shells (notably Android's
+               # mksh). When such a subshell is killed it runs on_exit() ->
+               # cleanup_probes(), deleting our probes and rmdir'ing our instance while
+               # the main shell is still wrapping up. A separate process started by
+               # 'sh -c' has no access to this shell's traps, so it cannot do that.
+               sh -c 'i=0
+                      while [ $i -lt 100000 ]; do
+                              echo "mcs-probe backlog $i" > /dev/kmsg 2>/dev/null || break
+                              i=$((i + 1))
+                      done' &
+               BACKLOG_PID=$!
+       fi
+
+       HP_CPU=
+       if [ "$USE_HOTPLUG" = 1 ]; then
+               # take_cpu_down() spends far longer in MULTI_STOP_PREPARE than text
+               # patching does, so the interrupts-enabled window is much wider.
+               for c in $(ls -d /sys/devices/system/cpu/cpu[0-9]* 2>/dev/null | sort -r); do
+                       f=$c/online
+                       [ -w "$f" ] && [ "$(cat "$f" 2>/dev/null)" = 1 ] && { HP_CPU=$f; break; }
+               done
+               [ -n "$HP_CPU" ] || echo "WARN: no offline-able CPU found; hotplug trigger skipped." >&2
+       fi
+
+       echo "running $ITERS iterations (flush probe: $FLUSH_SYM, backlog: $USE_BACKLOG, hotplug: ${HP_CPU:-no})"
+
+       # Register the trigger probe ONCE, outside the loop.
+       #
+       # Deleting a dynamic event calls tracing_reset_all_online_cpus()
+       # (kernel/trace/trace_dynevent.c:114), which walks ftrace_trace_arrays and
+       # clears EVERY trace array -- including our instance. Deleting -:trig inside
+       # the loop therefore wiped the buffer on every iteration, leaving only the
+       # last iteration's events behind.
+       #
+       # enable/disable alone still patches text via arch_arm_kprobe() ->
+       # aarch64_insn_patch_text() -> stop_machine_cpuslocked(), so each toggle is
+       # a full rendezvous, and neither toggle resets the buffer.
+       echo 'p:trig schedule' >> "$TR/kprobe_events" 2>/dev/null
+       [ -f "$EV/events/kprobes/trig/enable" ] || echo "WARN: trigger probe unavailable; relying on hotplug only." >&2
+
+       i=0
+       while [ $i -lt "$ITERS" ]; do
+               # Two rendezvous per iteration: arm on enable, disarm on disable.
+               echo 1 > "$EV/events/kprobes/trig/enable" 2>/dev/null
+               echo 0 > "$EV/events/kprobes/trig/enable" 2>/dev/null
+
+               [ -n "$HP_CPU" ] && { echo 0 > "$HP_CPU" 2>/dev/null; echo 1 > "$HP_CPU" 2>/dev/null; }
+
+               i=$((i + 1))
+       done
+
+       [ -n "$BACKLOG_PID" ] && { kill "$BACKLOG_PID" 2>/dev/null; wait "$BACKLOG_PID" 2>/dev/null; BACKLOG_PID=; }
+
+       # Did tracing survive the run? If something reset it mid-flight the buffer
+       # will be short or empty, and that is a tooling failure, not a PASS.
+       on_after=$(cat "$EV/tracing_on" 2>/dev/null)
+       en_after=$(cat "$EV/events/kprobes/enable" 2>/dev/null)
+       probes_after=$(grep -c . "$TR/kprobe_events" 2>/dev/null || echo 0)
+       [ "$on_after" = 1 ] || echo "WARN: tracing_on became '$on_after' during the run (reset by another tracer?)." >&2
+       case "$en_after" in
+       1*) ;;
+       *)  echo "WARN: events/kprobes/enable became '$en_after' during the run." >&2 ;;
+       esac
+       if [ "$probes_after" -lt "$probes_before" ] 2>/dev/null; then
+               echo "" >&2
+               echo "DIAGNOSIS: kprobe_events shrank from $probes_before to $probes_after entries" >&2
+               echo "  during the run, so events were lost. Note that ANY dynamic-event" >&2
+               echo "  deletion also calls tracing_reset_all_online_cpus()" >&2
+               echo "  (kernel/trace/trace_dynevent.c), which clears every trace array --" >&2
+               echo "  including our instance. Possible causes:" >&2
+               echo "    - another tracer opening kprobe_events with O_TRUNC (deletes ALL" >&2
+               echo "      entries at once; on Android usually traced_probes/Perfetto)" >&2
+               echo "    - a stray cleanup racing this run (deletes only OUR entries)" >&2
+               if [ -r "$TR/kprobe_events" ]; then
+                       echo "  Surviving entries:" >&2
+                       sed 's/^/    /' "$TR/kprobe_events" >&2 2>/dev/null
+               fi
+       fi
+
+       # Guard these: if the instance was removed mid-run the writes would emit
+       # "can't create .../tracing_on: No such file or directory" noise.
+       if [ -f "$EV/tracing_on" ]; then
+               echo 0 > "$EV/tracing_on" 2>/dev/null
+       else
+               echo "WARN: $EV/tracing_on is gone; the recording buffer was destroyed." >&2
+       fi
+       if [ -r "$EV/trace" ]; then
+               cp "$EV/trace" "$SAVE" 2>/dev/null && echo "raw trace saved to $SAVE"
+       else
+               echo "" >&2
+               echo "FATAL: the recording buffer was destroyed before it could be saved." >&2
+               echo "  Refusing to report: any verdict now would describe stale or absent" >&2
+               echo "  data, not this run. Nothing was measured." >&2
+               echo "  Re-run; if this repeats, something on the device is deleting kprobe" >&2
+               echo "  events (see the DIAGNOSIS above for what survived)." >&2
+               exit 1
+       fi
+fi
+
+# ------------------------------------------------------------ analysis -------
+# Per CPU, walk the event stream and track state:
+#   mcs_in    -> PROTECTED   (a flush here is a failure)
+#   deferred  -> TAIL        (flag already cleared; a flush here is expected)
+#   mcs_out   -> IDLE        (flushes here are normal operation)
+
+SRC=$SAVE
+if [ ! -r "$SRC" ]; then
+       if [ -n "$TR" ] && [ -r "$EV/trace" ]; then
+               SRC=$EV/trace
+       else
+               echo "FATAL: no trace to analyse ($SAVE unreadable)." >&2
+               exit 1
+       fi
+fi
+
+awk -v baseline="$BASELINE" '
+function ev(l) {   # event name sits after the timestamp colon
+       if (match(l, /: [a-z_0-9]+:/)) {
+               s = substr(l, RSTART + 2, RLENGTH - 3)
+               return s
+       }
+       return ""
+}
+function cpuof(l) {
+       if (match(l, /\[[0-9]+\]/))
+               return substr(l, RSTART + 1, RLENGTH - 2) + 0
+       return -1
+}
+function tsof(l) {
+       if (match(l, /[0-9]+\.[0-9]+:/))
+               return substr(l, RSTART, RLENGTH - 1) + 0
+       return 0
+}
+/^#/ || /^$/ { next }
+{
+       e = ev($0); c = cpuof($0); t = tsof($0)
+       if (e == "" || c < 0) next
+       total++
+
+       if (e == "mcs_in") {
+               state[c] = "PROTECTED"; enter[c] = t; windows++
+       } else if (e == "deferred") {
+               if (state[c] == "PROTECTED") { state[c] = "TAIL"; requeues++ }
+               else { requeue_outside++ }
+       } else if (e == "mcs_out") {
+               if (state[c] == "PROTECTED" || state[c] == "TAIL") {
+                       dur = t - enter[c]
+                       if (dur > maxdur) maxdur = dur
+                       sumdur += dur; ndur++
+               }
+               state[c] = "IDLE"
+       } else if (e == "flush" || e == "flush2") {
+               if (state[c] == "PROTECTED") {
+                       viol++
+                       if (viol <= 12)
+                               printf("  VIOLATION cpu%-2d t=%.6f  (%+.6fs into window)  %s\n",
+                                      c, t, t - enter[c], e) > "/dev/stderr"
+               } else if (state[c] == "TAIL") {
+                       tail_flush++
+               } else {
+                       outside++
+               }
+       }
+}
+END {
+       printf("\n=========== multi_cpu_stop / legacy console flush ===========\n")
+       if (baseline == 1)
+               printf("mode                   : BASELINE (kernel WITHOUT the fix)\n")
+       printf("events parsed          : %d\n", total)
+       printf("rendezvous windows     : %d\n", windows)
+       if (ndur > 0)
+               printf("window duration        : avg %.6fs  max %.6fs\n", sumdur / ndur, maxdur)
+       printf("requeues (in-window)   : %d\n", requeues + 0)
+       if (requeue_outside > 0)
+               printf("requeues (out-of-win)  : %d   <- unexpected; check probe pairing\n", requeue_outside)
+       printf("flushes outside window : %d\n", outside + 0)
+       printf("flushes in benign tail : %d   (after requeue, flag already cleared)\n", tail_flush + 0)
+       printf("flushes while PROTECTED: %d\n", viol + 0)
+       printf("------------------------------------------------------------\n")
+
+       if (windows == 0) {
+               printf("INCONCLUSIVE: no rendezvous observed. Probes may not have armed,\n")
+               printf("  or tracing was off during the trigger loop.\n")
+       } else if (outside == 0 && tail_flush == 0 && viol == 0) {
+               printf("INCONCLUSIVE: no legacy console flush seen anywhere. The absence of\n")
+               printf("  in-window flushes proves nothing unless flushes happen at all --\n")
+               printf("  check /proc/consoles for a legacy (non-nbcon) console and re-run\n")
+               printf("  with log pressure.\n")
+       } else if (baseline == 1) {
+               # Inverted expectation: without the fix, in-window flushes are the bug
+               # being demonstrated, and their absence means the stress never landed.
+               if (viol > 0) {
+                       printf("REPRODUCED: %d legacy flush(es) inside multi_cpu_stop() across %d\n", viol, windows)
+                       printf("  rendezvous. This is the pre-fix behaviour the patch targets.\n")
+                       printf("  Record these numbers, then re-run on a patched kernel WITHOUT\n")
+                       printf("  --baseline and expect PASS (0 in-window flushes).\n")
+               } else {
+                       printf("NOT REPRODUCED: %d flush(es) seen, but none inside a window.\n", outside + tail_flush)
+                       printf("  The unpatched kernel should show in-window flushes, so the stress\n")
+                       printf("  likely never coincided with MULTI_STOP_PREPARE. Widen the window\n")
+                       printf("  and raise pressure: --hotplug --iters 200.\n")
+                       printf("  Note the race needs an interrupt-context printk() inside a short\n")
+                       printf("  window; a quiet device can miss it for many runs.\n")
+               }
+       } else if (viol > 0) {
+               printf("FAIL: %d legacy flush(es) inside the protected region.\n", viol)
+               printf("  Enable stack traces to see the escaping path:\n")
+               printf("    echo stacktrace > <tracefs>/events/kprobes/flush/trigger\n")
+       } else {
+               printf("PASS: no legacy console flush inside any protected region,\n")
+               printf("  across %d rendezvous, with %d flush(es) observed elsewhere.\n",
+                      windows, outside + tail_flush)
+       }
+       printf("============================================================\n")
+}
+' "$SRC"
+
+exit 0
diff --git a/mcs-repro-run.sh b/mcs-repro-run.sh
new file mode 100644
index 0000000000000..c826e3c2eb0d6
--- /dev/null
+++ b/mcs-repro-run.sh
@@ -0,0 +1,265 @@
+#!/bin/sh
+# mcs-repro-run.sh - On-device runner: drive mcs_repro.ko (the in-window printk
+# trigger) while mcs-printk-probe.sh records, to reproduce the pre-fix bug
+# targeted by the [DNM] "printk: Defer legacy console flushes from
+# multi_cpu_stop()" patch.
+#
+# This is a SEPARATE file from the probe on purpose, and like the probe it
+# contains NO adb commands -- run it ON the target as root. Push both scripts
+# and the .ko to the device first (see the adb commands your host provides).
+#
+# What it does:
+#   1. starts mcs-printk-probe.sh --baseline in the background (it arms the
+#      kprobes, records, then tears down and prints the verdict);
+#   2. waits until the probe reports it is armed and recording;
+#   3. insmod's mcs_repro.ko (its stop_machine() callback issues a normal
+#      printk() from inside multi_cpu_stop() -> on an unpatched kernel that is a
+#      legacy console flush in the protected window);
+#   4. keeps firing more rendezvous (/sys/kernel/mcs_repro/fire) until the
+#      probe's recording window closes, so an in-window flush is guaranteed to
+#      overlap regardless of exact timing;
+#   5. rmmod's the module and prints the probe's report.
+#
+# A "flushes while PROTECTED > 0" / REPRODUCED verdict is the bug. On a patched
+# kernel the same run should print PASS (0 in-window flushes).
+#
+# Usage (as root, on target):
+#   ./mcs-repro-run.sh
+#   ./mcs-repro-run.sh --iters 500 --backlog 400
+#   ./mcs-repro-run.sh --dir /data/local/tmp --report /data/local/tmp/rep.txt
+#   ./mcs-repro-run.sh --loglevel 0     # do not touch console loglevel
+#   ./mcs-repro-run.sh --crash          # SEVERE form: watchdog bark -> reset
+#   ./mcs-repro-run.sh --crash --flood 10000
+#
+# By default the console loglevel is forced to 8 for the run (and restored
+# afterwards) so the module's normal-priority KERN_INFO in-window printk()s
+# actually reach the console and get flushed -- otherwise a low loglevel
+# filters them out and no in-window flush happens. Use --loglevel 0 to leave
+# the current setting untouched.
+#
+# --crash reproduces the SEVERE form of the bug instead of the measurable
+# invariant. It runs NO probe (no kprobes, no recording, no report): the module
+# reaches multi_cpu_stop() on its own via stop_machine(), and a large in-window
+# 'flood' of KERN_INFO printk()s drives the slow legacy UART synchronously while
+# every other CPU spins with IRQs disabled -- nothing pets the watchdog, so on
+# an unpatched kernel you get a soft-lockup/RCU-stall bark then a watchdog bite
+# and reset. This is destructive by design: the device is expected to reboot,
+# so no teardown runs. On a patched kernel the flush is offloaded and the box
+# survives. Expect NO shell prompt back if it works.
+set -u
+
+DIR=/data/local/tmp
+PROBE=
+KO=
+REPORT=
+MOD=mcs_repro
+ITERS=300        # probe trigger-loop length -> how long the recording stays open
+BACKLOG=200      # records the module pre-queues before each in-window printk
+KOITERS=5        # rendezvous the module fires per insmod / per sysfs 'fire'
+NO_BACKLOG=0     # pass through to the probe (--no-backlog)
+LOGLEVEL=8       # console loglevel to force while stressing (0 = leave as-is)
+CRASH=0          # --crash: skip the probe, drive a long in-window flood
+FLOOD=6000       # --crash: in-window printk lines per rendezvous
+
+while [ $# -gt 0 ]; do
+       case "$1" in
+       --dir) DIR=$2; shift 2 ;;
+       --probe) PROBE=$2; shift 2 ;;
+       --ko) KO=$2; shift 2 ;;
+       --report) REPORT=$2; shift 2 ;;
+       --iters) ITERS=$2; shift 2 ;;
+       --backlog) BACKLOG=$2; shift 2 ;;
+       --ko-iters) KOITERS=$2; shift 2 ;;
+       --no-backlog) NO_BACKLOG=1; shift ;;
+       --loglevel) LOGLEVEL=$2; shift 2 ;;
+       --crash) CRASH=1; shift ;;
+       --flood) FLOOD=$2; shift 2 ;;
+       -h|--help) sed -n '2,50p' "$0"; exit 0 ;;
+       *) echo "unknown option: $1" >&2; exit 2 ;;
+       esac
+done
+
+: "${PROBE:=$DIR/mcs-printk-probe.sh}"
+: "${KO:=$DIR/mcs_repro.ko}"
+: "${REPORT:=$DIR/mcs-repro-report.txt}"
+FIRE=/sys/kernel/$MOD/fire
+
+# ------------------------------------------------------------- preconditions --
+if [ "$(id -u 2>/dev/null || echo 0)" != 0 ]; then
+       echo "FATAL: must run as root (kprobes, insmod, /sys writes)." >&2
+       exit 1
+fi
+# --crash runs no probe at all, so the probe script need not even be present.
+if [ "$CRASH" = 0 ] && [ ! -r "$PROBE" ]; then
+       echo "FATAL: probe script not found/readable: $PROBE" >&2
+       echo "  push mcs-printk-probe.sh to the device and/or pass --probe PATH." >&2
+       exit 1
+fi
+if [ ! -r "$KO" ]; then
+       echo "FATAL: module not found/readable: $KO" >&2
+       echo "  push mcs_repro.ko to the device and/or pass --ko PATH." >&2
+       exit 1
+fi
+
+# A short sleep that tolerates shells/toybox without fractional sleep.
+nap() { sleep "$1" 2>/dev/null || sleep 1; }
+
+# The module's in-window printk()s are KERN_INFO (level 6). A message reaches
+# the console only when its level < console_loglevel, so unless the console
+# loglevel is raised above 6 those lines are filtered before the console layer
+# and NO synchronous flush -- hence no in-window stall -- ever happens, even
+# though the legacy_direct path is vulnerable. That is the "needed echo 8 >
+# /proc/sys/kernel/printk" trap. We must NOT raise the message level instead:
+# KERN_EMERG would push the context to NBCON_PRIO_EMERGENCY, whose branch in
+# printk_get_console_flush_type() has no !in_multi_cpu_stop() guard, so it would
+# flush in-window even on a patched kernel (false FAIL). Keep the printk normal
+# priority and raise console_loglevel here instead.
+PRINTK_SYSCTL=/proc/sys/kernel/printk
+SAVED_LOGLEVEL=
+set_loglevel() {
+       [ "$LOGLEVEL" = 0 ] && return 0
+       [ -w "$PRINTK_SYSCTL" ] || { echo "WARN: $PRINTK_SYSCTL not writable; leaving loglevel as-is." >&2; return 0; }
+       # Column 1 is the current console_loglevel; save the whole line to restore.
+       SAVED_LOGLEVEL=$(cat "$PRINTK_SYSCTL" 2>/dev/null)
+       echo "$LOGLEVEL" > "$PRINTK_SYSCTL" 2>/dev/null
+       echo "console loglevel: $(echo "$SAVED_LOGLEVEL" | awk '{print $1}') -> $LOGLEVEL (KERN_INFO must pass the filter to flush)"
+}
+restore_loglevel() {
+       [ -n "$SAVED_LOGLEVEL" ] || return 0
+       # Restore just the console_loglevel column; a plain int write sets that field.
+       echo "$SAVED_LOGLEVEL" | awk '{print $1}' > "$PRINTK_SYSCTL" 2>/dev/null
+       SAVED_LOGLEVEL=
+}
+
+cleanup() {
+       # Best-effort teardown; safe to call more than once.
+       rmmod "$MOD" 2>/dev/null
+       [ -n "${PROBE_PID:-}" ] && kill "$PROBE_PID" 2>/dev/null
+       restore_loglevel
+}
+trap 'cleanup' INT TERM
+
+# ------------------------------------------------------------- crash mode -----
+# The SEVERE reproduction. No probe, no kprobes, no recording: the module calls
+# stop_machine() directly, which is what puts mcs_repro_fn() inside
+# multi_cpu_stop() on the active participant CPU. The 'flood' loop then issues
+# FLOOD normal-priority printk()s from there. On an unpatched kernel each one
+# takes the legacy_direct path and synchronously pushes bytes out the slow UART
+# while every other CPU spins in the rendezvous with IRQs disabled, so nothing
+# can pet the watchdog for the whole duration -> bark, then bite and reset.
+#
+# Deliberately skips rmmod/restore on the way out: if this works the kernel is
+# gone before that could run anyway, and the loglevel lives in RAM so the reset
+# restores it for free. If the box is still alive after, something did not
+# reproduce -- that is reported, not silently swallowed.
+if [ "$CRASH" = 1 ]; then
+       echo "=================== CRASH MODE ===================="
+       echo "iters=1 backlog=0 loud=0 flood=$FLOOD, loglevel=$LOGLEVEL"
+       echo "Expect NO prompt back if this reproduces: bark -> bite -> reset."
+       echo "===================================================="
+
+       rmmod "$MOD" 2>/dev/null
+       set_loglevel
+
+       if ! insmod "$KO" iters=1 backlog=0 loud=0 flood="$FLOOD"; then
+               echo "FATAL: insmod failed; no crash attempted." >&2
+               echo "  Check: dmesg | tail  (vermagic mismatch shows here)." >&2
+               restore_loglevel
+               trap - INT TERM
+               exit 1
+       fi
+
+       # If we get here the module returned control without a reset: the
+       # in-window flood did not stall long enough (or the kernel is patched).
+       echo ""
+       echo "NOT REPRODUCED (severe form): device is still up after flood=$FLOOD."
+       echo "  Either the kernel carries the fix, or the stall was too short to"
+       echo "  trip the watchdog -- retry with a larger --flood."
+       rmmod "$MOD" 2>/dev/null
+       restore_loglevel
+       trap - INT TERM
+       exit 0
+fi
+
+# --------------------------------------------------------------- clean slate --
+rmmod "$MOD" 2>/dev/null
+"$PROBE" --cleanup >/dev/null 2>&1
+
+# Build the probe argument list.
+set -- --baseline --iters "$ITERS"
+[ "$NO_BACKLOG" = 1 ] && set -- "$@" --no-backlog
+
+echo "starting probe: $PROBE $*"
+echo "  (report -> $REPORT)"
+
+# ------------------------------------------------------------ start recording --
+# Run the probe in the background; capture everything it prints (setup notes,
+# the /proc/consoles dump, and the final verdict) into the report file.
+"$PROBE" "$@" > "$REPORT" 2>&1 &
+PROBE_PID=$!
+
+# Wait until the probe has finished setup and armed the kprobes. It prints
+# "running <N> iterations ..." at that point; poll for it. Bail out early if the
+# probe died during setup (its report then holds the FATAL reason).
+armed=0
+tries=0
+while [ $tries -lt 200 ]; do
+       if grep -q "running .* iterations" "$REPORT" 2>/dev/null; then
+               armed=1
+               break
+       fi
+       kill -0 "$PROBE_PID" 2>/dev/null || break
+       nap 0.1
+       tries=$((tries + 1))
+done
+
+if [ "$armed" != 1 ]; then
+       echo "" >&2
+       echo "WARN: probe did not reach the recording stage; see report below." >&2
+       wait "$PROBE_PID" 2>/dev/null
+       echo "==================== probe report ====================" >&2
+       cat "$REPORT" >&2
+       echo "======================================================" >&2
+       exit 1
+fi
+
+echo "probe armed; loading $MOD (iters=$KOITERS backlog=$BACKLOG) ..."
+
+# Raise console loglevel so the module's KERN_INFO in-window lines actually
+# reach the console and get flushed. Restored in cleanup / at the end.
+set_loglevel
+
+# ------------------------------------------------------------- fire in-window --
+# insmod fires KOITERS rendezvous on load; recorded now that the probe is armed.
+if ! insmod "$KO" iters="$KOITERS" backlog="$BACKLOG"; then
+       echo "WARN: insmod failed. Unsigned modules allowed? Already loaded?" >&2
+       echo "  Check: dmesg | tail  (vermagic mismatch shows here)." >&2
+fi
+
+# Keep firing until the probe's recording window closes (probe process exits).
+# This guarantees an in-window printk overlaps the protected region even if the
+# on-load fire happened to fall between rendezvous.
+fires=0
+while kill -0 "$PROBE_PID" 2>/dev/null; do
+       if [ -w "$FIRE" ]; then
+               echo 1 > "$FIRE" 2>/dev/null && fires=$((fires + 1))
+       fi
+       nap 0.2
+done
+echo "fired $fires extra batch(es) while recording."
+
+# --------------------------------------------------------------- report -------
+rmmod "$MOD" 2>/dev/null
+wait "$PROBE_PID" 2>/dev/null
+restore_loglevel
+trap - INT TERM
+
+echo ""
+echo "==================== probe report ===================="
+cat "$REPORT"
+echo "======================================================"
+echo ""
+echo "Look for 'flushes while PROTECTED' and the verdict line:"
+echo "  REPRODUCED  -> in-window legacy flush seen (pre-fix bug present)."
+echo "  PASS        -> no in-window flush (patched kernel, or stress missed)."
+exit 0

--

Tried many approaches but the one that triggered the wdog bite reliably when idle is:

adb wait-for-device && \
adb root && \
adb shell mkdir -p /data/local/tmp && \
adb push mcs-repro-run.sh mcs-printk-probe.sh mcs_repro.ko /data/local/tmp/ && \
adb shell chmod +x /data/local/tmp/mcs-repro-run.sh /data/local/tmp/mcs-printk-probe.sh && \
adb shell "cd /data/local/tmp && ./mcs-repro-run.sh --crash --flood 3000"

Thank you,
Aditya

