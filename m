Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3B936B92D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787808074; cv=none; b=sc6htQIXo9cyHc14kHug9zeGl9cib7GKdL9dReb8BCHYUKbhEdAM/k7+vraUyTPlrnt9RKNOLEXxMib96UxyKGg1QmVw062VlJWSXkxaSedMUjwaObZx50W9DgFPQU5IaB5pLufmdQcPd3x9pWg2R+EnS3qTwaAF7lxtRaFh5ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787808074; c=relaxed/simple;
	bh=USHMu9MeQzTUeJj8sB8FnDKyVuIiI7ck4z7laxH9nVw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gR+SgPUlmSaWQe+tq8OqV//DdGUWzZKaW6E1EMrKVqQ4uY3rmlHlgtkgOlGm/jnWXTGPde9/bIx5DVndlnNxw7itsJNaAs7aF2ZTU8sTgHHJtHm3Gcvb9VujifYJyA61m4v1uYDUNkaD8wy/1neLI3dTel/K5zRcUK5opN38y2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkXOIwXM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrbNAmIV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkXOIwXM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrbNAmIV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3JSEV2863017
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kPQtIeRH1T3dnW6C4X9ZG4
	Yl0FYcoPwUV1hGw7znjhc=; b=VkXOIwXMCdFvZdNZRcX/2ZrGgoKe6+u8qGf8pe
	wUlusC6L2uTMvzqSFqTzvRjVkzXqfSta/fVkq0Dc0EmgGEq3k/PacsTwm83BKUZV
	VGJ2k19lMUKkUqvwYaxUzECUpOs9kX9UKnmUPn08f6nKcaMInK1ODEapmxo47GKk
	cDLnC7yTUFKtHKIo7z22cJnCBtqBAOBLzR2Tr9P3zWkVzuCn2TaadSNtWem3rAtY
	ODm9QSjfoS2PYFWrMIWdKpNkPiSWPGkEoP28JpqkCKw9reIvbq8Xy7z+Sn+RHHfi
	+MRrXLfmAGFbm8hQ9VnQ0Ri1ILVGDBY2Bo7ruZF5hAniPQqg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga075ba3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:21:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2323365a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787808071; x=1788412871; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kPQtIeRH1T3dnW6C4X9ZG4Yl0FYcoPwUV1hGw7znjhc=;
        b=XrbNAmIVuOhzUUDK0sUpg17v3U7GPHUfr1n7N5aXtywSfZwUcfQH0dDEjaAt4buZNH
         ZrxmbKnYBm85vkBtt3OCmJYXRnIkQRnMZISiup2AOz0aCh20GqcxYWxbwBGQDgACnz4o
         unJB3n67pIVfjX+Ny0bnv6fz07O9Ic9fMwdhzsIKb4ghs0ju6LZmYCftQLzr/hjLe2lx
         lt7RiNDD4XcyTtjtwBuQ9hrhehaJbSmEIR9BxFOKD22RtX+6X/KIdcMzR6Mnn5MHw9c1
         WquVu+QsARIMiAWXdaN3FRgZMsohK+vvYMhuM3GBFPBNnhZ/NyaEGS+8jNpMYfKJYTvI
         31FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787808071; x=1788412871;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kPQtIeRH1T3dnW6C4X9ZG4Yl0FYcoPwUV1hGw7znjhc=;
        b=NfHGJFtQnM3ZiwYjtyaPjd7DeH7jg0dD6ipt7x84r62Diat4qnPv2+YX9FZqmxl6VR
         h1RiRAUCkiCvCx0OHDVk8xCtVlBn2pWlC4cN207Rpo1FjN7hFc99NgGjYKqZOwTcwlTF
         oELK0CY4JfqnyMGUsPoNJW/gzQfOSePL9/zqrw281t9zhEWESQGfIk8JUDrLU9r4AYm0
         waCiXyLtzF8K6jgYvwuA9fW7GmlLq0EeBGnXSMziLArOyU7Sbj2hkdWLUCW3vs99ogLs
         kjL+FfoN60sVeeywmU7vJ5AGRxxgffx3rwOI19C88MO6OvtU09SKx7Fer3P8IPhHMQFT
         3vbQ==
X-Gm-Message-State: AFuF++mCyhikempSIk/ovja/acgGALgIxj5/TeSIXHBhjPFhsBzYviBH
	OdN884tH8SQtevnfO3h2REIg5ySLPQMg9bM08cKyEqv1L56P7KHNXFbhF00A+fsFAkA/C2+gcs3
	R+FUaGXxzysKcFcuV+flmu9zE5gwj9aTKnpQvj6Wc1I1ird2ZRRUFB4NJl2BovQ4EkIs=
X-Gm-Gg: AR+sD11b7BtnCxCwIfui7PLMMBAKsu5h7rPxMYl93sGNNT/byZURgRJ8EV1F2U1Qpc+
	JNlJexxQlSH2g/t2kQhxO+G4ZFIf9J0xaJjqFCjacpIYoxADJQ3l84xgWx1r+u/eFodf6C5ON+z
	N9RLh2hXgJWWD3fhkMpetgf1NN3LE1cUoxKuGBlUOMWIMm6OCDObQyZOMokp20e+vcoL1YBCAp5
	wgiKWEIhAU7dR2y2/KCPA5UNfF0SwmA1FIMeZcU5yoha35HR9G+RTEZU/FrvGinZAyTR7XWgJdv
	1ZtSGk4V+WUwB4lqSdvHkdDl7Chj+YB5fLr6Xh2zpkgEQP/pS9JbL4Qy+ePQMHpwxMll4HsBQ3b
	AaZHRXM5VUQ5Eh9G5Cd0X
X-Received: by 2002:a17:90b:1a90:b0:396:6344:3b62 with SMTP id 98e67ed59e1d1-3966d71a0e4mr24243400a91.12.1787808070831;
        Wed, 26 Aug 2026 22:21:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1a90:b0:396:6344:3b62 with SMTP id 98e67ed59e1d1-3966d71a0e4mr24243304a91.12.1787808070335;
        Wed, 26 Aug 2026 22:21:10 -0700 (PDT)
Received: from [10.213.104.145] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da25c09sm23734633eec.31.2026.08.26.22.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 22:21:09 -0700 (PDT)
From: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
Subject: [PATCH 0/2] printk/stop_machine: Defer legacy console flushes
 while a CPU runs a stopper callback
Date: Thu, 27 Aug 2026 10:50:56 +0530
Message-Id: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADjJj2oC/yXNywrCMBBA0V8ps3YgbTWIvyJSmmRSR2IS8vBB6
 b8bdXk2966QKTFlOHUrJHpw5uAb+l0H+jr7hZBNMwxikOI47NGQpYSOllm/UQefgyN8Ji6EweO
 9usKTjnXKJUQ0I1lppeoPQkFLxkSWX7/d+fJ3rupGunwfsG0f018/TpAAAAA=
X-Change-ID: 20260824-defer-legacy-console-write-on-multi_cpu_stop-d3ef6f6b150b
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org,
        Aditya Chillara <aditya.chillara@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787808067; l=4053;
 i=aditya.chillara@oss.qualcomm.com; s=20260626; h=from:subject:message-id;
 bh=USHMu9MeQzTUeJj8sB8FnDKyVuIiI7ck4z7laxH9nVw=;
 b=Zl8B9dridxvmxxFuGoh8N2ntvNj5VH5+agQ3owlfg7S11a7KTndjZ8+LWjJYL1x4m6dI67fRU
 TowO1hieUMaB0femLfQIBDX7BSKITB3RaCRLiyyX7L0BdhhubX9DWHX
X-Developer-Key: i=aditya.chillara@oss.qualcomm.com; a=ed25519;
 pk=3vcOzHlHNCpL/4rvfU3cpTk2xIC7SI+TH0gypa9FdZQ=
X-Proofpoint-ORIG-GUID: tjAveEynbndejnHH0CyvuaEQJnDZF7Ns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA0MSBTYWx0ZWRfX2UXa2xyCZJ7v
 qPvsxepR1hTQogi54W8DSinR2mTC6WYcEau9FY313axJoxDxhHPia8OpoAwmsHxl4ZwXrU/p8tR
 /p73zJ4n+VCI7b2pFqUk5mv2d/fUhxczMaujiVVRXqTPiIImPzPw5TfIOoihlxOYIA7BmMYrh0F
 hc3Wo+OgmPZZtnRLoKXbMvIkRbGQn3iIowIsSp5lWzi6bw20RqlhEA3pjmR1veOH7Zd1TJypH7J
 RVefZ1DMZZfD/ENypRYMzAsKVu6f4QTiWmT6Fag3M/QPbmd7KDqH2P14bginMQkE19ThWLKkuzi
 zJPSrXl8fLFsMNfhso7r70vz/8LpETSX8qjfJf7YWMN9nfW3/QpcTpeXsQCguqs2235HyJFHFNy
 ep5moESLDhmHmDjDKjXreRjhPpd779+wrTFExpwlo1K34e2NEgRyLea3rIwUyJxQo7RWXrVVm5S
 HTq/6u/qCmbDDWPw7gQ==
X-Proofpoint-GUID: tjAveEynbndejnHH0CyvuaEQJnDZF7Ns
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA0MSBTYWx0ZWRfXxJ/MyQpjrUXQ
 W4M6amVeQ1Tb+D/TXAC7ouh8JcjaxLocEW/OBkbf3B8sdgzg6SVzDcOAvZA7CJDaoZCSxHGO1HH
 HOMJ5O9rNmOOMxeC0Z9ho/WXJ27svqI=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8fc947 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OaVfGLliuWVxJM3UbAgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270041

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

Fix this by having the cpu stopper mark the CPU active while a callback
runs, and having printk use that marker to defer legacy console flushes
until the callback returns:

  1/2 stop_machine: Track when a CPU executes a stopper callback

      Add a per-CPU flag, set in the stopper dispatch path around the
      callback, and an in_cpu_stop() accessor.

  2/2 printk: Defer legacy console flushes while a CPU runs a stopper callback

      Route legacy console output through the offload path instead of
      flushing it directly while a CPU is inside a stopper callback, and
      flush it once the callback returns. Emergency and panic output is
      unaffected.

Reproduced and verified with an out-of-tree test module that triggers
stop_machine() with a queued console backlog and a printk() inside the
rendezvous, paired with a kprobe-based script that flags any console
flush happening while a CPU is inside a stopper callback.

Signed-off-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
---
Aditya Chillara (2):
      stop_machine: Track when a CPU executes a stopper callback
      printk: Defer legacy console flushes while a CPU runs a stopper callback

 include/linux/printk.h       |  5 +++++
 include/linux/stop_machine.h | 13 +++++++++++++
 kernel/printk/internal.h     |  9 ++++++++-
 kernel/printk/printk.c       | 23 +++++++++++++++++++++++
 kernel/stop_machine.c        | 29 +++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 1 deletion(-)
---
base-commit: 77ae27fd98f3b548797c9f22c10ab5cf1c4ada53
change-id: 20260824-defer-legacy-console-write-on-multi_cpu_stop-d3ef6f6b150b

Best regards,
--  
Aditya Chillara <aditya.chillara@oss.qualcomm.com>

