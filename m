Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E071B381B0D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787808077; cv=none; b=M5IXcusUji2Ik6CdLU3meGjqU/Cl6P0bjsMMw6/v0msUx69NnimPp87aiFlmny1EUhU5ponB1yZ/Lj6fMwroZnTOFrzmjRFOdvXO7juzu20ISrPYAcl3+ab16iTYDK/k9IRSc9jhTNlk5pIAqdouFav7zewn7WdWvG7SBTvKn5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787808077; c=relaxed/simple;
	bh=kjDR/D7LPdvgDM4pefUxqSAvBAfOPT1V659fB5GlNWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l3JFm+Kfo753CkkLgLRCFZDQjnQPpznx0c6KFnX+WP5zMKerHyBOC2OK8nLb7VTm5aLUU0LgO4uuemv/pqg7hV7GbHvzs8h19Saqdw2TtHJmOqHIXgcqEu7TieMAxTbMKdGtik/84KV5R9nZKViE7p45EnFhYFZt1vT6praZbQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J37O9UP7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8tVzCYr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J37O9UP7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8tVzCYr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3J0EX1665967
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xv3IIYIE+BN+vFwAFrajkJNHRbsBTd+G179aP6n55qw=; b=J37O9UP7S5+to3wP
	i7J8mEjQXee+CrkqPl5ge+tBTLWRg0Fn5HKVWTUwcGZ2+lUlerIWhAGqqd+sNZ6T
	yLuydCfTZUR6HR8RJbWz6r6qBBkXw50YwS4V5QIC4zQJIM541GpLn8aVLawKBwNG
	cuWfEfGjZOvX1p2OIVoMMNot0jh2zr9SAJAaHS8Wc1QvoujiclS2N7sQYHn4l4C5
	3L5nIe2+fn4jGR67CoYP5VggqllqQNfLZwhJTNUFe+nTVubC+0oNCNWe83i/khcq
	Cx/zcLDmbxUx9Uoo42k4NPMKFCg4PGtjTGV3d1RQPxTyn3kmf3DqXVCsQzMzAQW8
	QTYB8A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaa3bgwjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:21:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396638f9a18so3365758a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787808074; x=1788412874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xv3IIYIE+BN+vFwAFrajkJNHRbsBTd+G179aP6n55qw=;
        b=e8tVzCYr+HB9hoe/s77X+yUmJEcRa4xqADESFKjF0bZHUfVCa/0G1sivVs1/dDyntI
         UDvny4OYcsc6luakEHlrq36v/fTCq65znzRBlTQSH4DE7/nKD4mgiGZQ3tQ65zWI0+oZ
         pFpi/zSBQiDvzB9Tcme13P1OvSGN8rCabqr7hQyw5nqmKUssrczTLS2Jlp+U/qY3vbRt
         GDtfm3NO+7S7wx3u7bO6cOq4NaaPZH/Ro113nv/YANUWtBaFtcb4TK4FMPx53Y4vzIZD
         VgmUS50mNx3VnmpL1Y5E5dzwhFDsX5OI+SzWO/7fw4TE65ukjvwCyk+SuIXMxUzuRVC3
         vLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787808074; x=1788412874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xv3IIYIE+BN+vFwAFrajkJNHRbsBTd+G179aP6n55qw=;
        b=gsuM/kgFjuGDHKsj5ilei4K2hP5PQzQw+HCKuUWHZ4gLLcQkzi1uSGMLcV0nMS676s
         FINOwGpASHTbim5tgVxpV+HxilwoxXi0Qf5seDQ+WbRKwvuxD4J/WiPfWzN6SfDSXGz6
         dX6c46h6ezXmybG7Pb+XCbmcsoo1FNm48gbJwS3cvLSW0/PUPOmqxa/hRUAfrJz2/JeN
         Mtkz1x9v9qFPxPEkpPnHEfANBTPMkHsxOv6U/Fm28PTTd5Adw2ewB+eaINWROMltwlTY
         BqRkMjoI94zV6PjQlZq/SsUwSqhdIA4p1t3xTyuS11foNb0Zd7QmWfGMBGHevi69zHH7
         mttw==
X-Gm-Message-State: AFuF++ky+9Z7667PMombSQvoSlLBhOCuoVgAB69bqBT64R5te5bBTrUY
	09TT0GpGhvcmKKrI6Xqv984QUr602PFKkPxEllR31zdm2RWoMLkihIPD2DauvmdAhRO0BwZkJws
	Ygxjmj05PA7HuH4sDCu7udN03+PpGIk4u/w82GMT/TN+KHB49MICnyHs90iQ2+aJ+B3A=
X-Gm-Gg: AR+sD117BQtA5D+i+AbWi33ChFB9gjjfx8xPzpjELgEfejJDYB7afV9e3Qa7/O+3jYa
	ByDmrqoiQVxti6pS8A8FYGvyGs0hfB0bT/k/reM8hfz9GQS0KsH7v/1VeAohfNVrSvK9FlzQj7E
	ZLkIX7dKotPAapuaXdOrkRl/1kgdGrQ7dYXktAPnjFo/etiSfjBrocdpwu9+8VNC3w5ke1zqw4B
	bIlKX22YskvbaXg0joejMb+w5ydYgZVPdPlgSidLjXcdCAky62hytgegdzLAEAVl4CMZ7IrG8Ug
	4T1wbOFNRjs544694hMBz662kWbYZaeXCRYxIQdR9UD0KNxGaNnqJeEF8Y50ks8FK4P+4f/c0KU
	6rX7yQGRteZaJC1h/A9Hm
X-Received: by 2002:a17:90b:3fc4:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-3966d443146mr26001454a91.12.1787808073576;
        Wed, 26 Aug 2026 22:21:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc4:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-3966d443146mr26001361a91.12.1787808073095;
        Wed, 26 Aug 2026 22:21:13 -0700 (PDT)
Received: from [10.213.104.145] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da25c09sm23734633eec.31.2026.08.26.22.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 22:21:12 -0700 (PDT)
From: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:50:57 +0530
Subject: [PATCH 1/2] stop_machine: Track when a CPU executes a stopper
 callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-1-3b9f6bb4679f@oss.qualcomm.com>
References: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com>
In-Reply-To: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org,
        Aditya Chillara <aditya.chillara@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787808067; l=3222;
 i=aditya.chillara@oss.qualcomm.com; s=20260626; h=from:subject:message-id;
 bh=kjDR/D7LPdvgDM4pefUxqSAvBAfOPT1V659fB5GlNWA=;
 b=s5V3la4kCXHfsm6oMmYSaV9k3hJkf+8MYeJIEfxiuhBckq/c5pPTNZ/Ofw+jlz8+jmxlZHy6/
 dx+GClhMy9ECxxU3DqSyYTETIHOMECjEN+gwr2pFAa6gFnXaHzrhAhD
X-Developer-Key: i=aditya.chillara@oss.qualcomm.com; a=ed25519;
 pk=3vcOzHlHNCpL/4rvfU3cpTk2xIC7SI+TH0gypa9FdZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA0MiBTYWx0ZWRfX3KtjTXV1JtMg
 wR36qK34+u6HpHufMKyhggj0FN6+CBPLBM5pKxt9gsOigafDpEef2vGVqhg/DkL5UPZ83MjDO1U
 r+sAkDIQoNKMJRYvKxgSKux0jR/18KIB17STji90wb9fls2QnpnVPdaNzj4t8rkPyuBahAzOd3D
 pWHDQRZO1Eyw6un8fo7d32EZMboTgdKo6+kheCNNqhkgTmePaRpvd/CZB7zcQYLqPJ9MXFl+n8r
 QEU4UU9XpRa9FeXzppQ7KEAqBr4IWnv+r/Po/40VX6JpsPM8KBi91gDHc4bSJJFUL8rKDeY9oKA
 cqGy26ueGAip+KPriRs+g8ogy+TC5fJYpVOPoHdr6BsQqxYIEbyilaQD7UJw2csmp2JrWhY0qn9
 CxMGLatUA5MqGm9xAfTjpdh7rW+W58Gm33B2YBRjmtEl8riXU2fTM0Uvg28QFl46ZAcmAPVOcWy
 JVMcahXYjpuQgvPCeHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA0MiBTYWx0ZWRfX0qMl/wp0EBjA
 y8yvYp9mZNQ1NivpmAwANk7KL/e1XXURTsj6N6JMsJTyxSXNCrr/Ikuhyu+kMXoUYa9v9XXV6WL
 EuBlr6QPI3wEl6RKsAsBaGZD4mNV8Go=
X-Proofpoint-ORIG-GUID: 4o5Q5KStQ3pniRI-0NvPWV0HStBiW6lt
X-Proofpoint-GUID: 4o5Q5KStQ3pniRI-0NvPWV0HStBiW6lt
X-Authority-Analysis: v=2.4 cv=KbfidwYD c=1 sm=1 tr=0 ts=6a8fc94a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ufIu5EhPaA2AthKxfoUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270042

The cpu stopper thread runs in stop_sched_class, above every other
scheduling class. While a stopper callback executes, nothing else on that
CPU is scheduled, including RT kthreads such as a watchdog pet thread. A
callback that performs a long, slow operation can therefore starve those
threads, and for multi_cpu_stop() stall the whole state machine. The same
is true of an interrupt taken during the callback: multi_cpu_stop() keeps
interrupts enabled during MULTI_STOP_PREPARE, and softirqs may run on irq
exit.

Add a per-CPU flag covering execution of a stopper callback, set in the
dispatch path before the callback runs and cleared after it returns, and
expose in_cpu_stop() so callers can detect this context and defer
operations that could hold the CPU.

Assisted-by: LLM
Signed-off-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
---
 include/linux/stop_machine.h | 13 +++++++++++++
 kernel/stop_machine.c        | 22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/linux/stop_machine.h b/include/linux/stop_machine.h
index 84e7fb627ba4..ae71a829f036 100644
--- a/include/linux/stop_machine.h
+++ b/include/linux/stop_machine.h
@@ -38,6 +38,14 @@ void stop_machine_park(int cpu);
 void stop_machine_unpark(int cpu);
 void stop_machine_yield(const struct cpumask *cpumask);
 
+/*
+ * True while the current CPU is executing a cpu stopper callback. The
+ * stopper runs above every other scheduling class, so nothing else on the
+ * CPU is scheduled until the callback returns. Callers use this to defer
+ * work that could hold the CPU too long (e.g. slow console flushes).
+ */
+bool in_cpu_stop(void);
+
 extern void print_stop_info(const char *log_lvl, struct task_struct *task);
 
 #else	/* CONFIG_SMP */
@@ -84,6 +92,11 @@ static inline void stop_one_cpu_nowait(unsigned int cpu,
 
 static inline void print_stop_info(const char *log_lvl, struct task_struct *task) { }
 
+static inline bool in_cpu_stop(void)
+{
+	return false;
+}
+
 #endif	/* CONFIG_SMP */
 
 /*
diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index d085ba1f4b44..d38fabb0b9f1 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -48,8 +48,21 @@ struct cpu_stopper {
 };
 
 static DEFINE_PER_CPU(struct cpu_stopper, cpu_stopper);
+static DEFINE_PER_CPU(bool, cpu_stop_active);
 static bool stop_machine_initialized = false;
 
+bool in_cpu_stop(void)
+{
+	bool ret;
+
+	preempt_disable();
+	ret = READ_ONCE(*this_cpu_ptr(&cpu_stop_active));
+	preempt_enable();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(in_cpu_stop);
+
 void print_stop_info(const char *log_lvl, struct task_struct *task)
 {
 	/*
@@ -507,7 +520,16 @@ static void cpu_stopper_thread(unsigned int cpu)
 		stopper->caller = work->caller;
 		stopper->fn = fn;
 		preempt_count_inc();
+
+		/*
+		 * Set before the callback runs so an interrupt taken during it,
+		 * and any softirq run on irq exit, sees the CPU as inside a
+		 * stopper callback.
+		 */
+		this_cpu_write(cpu_stop_active, true);
 		ret = fn(arg);
+		this_cpu_write(cpu_stop_active, false);
+
 		if (done) {
 			if (ret)
 				done->ret = ret;

-- 
2.34.1

