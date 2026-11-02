Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661041;
	b=josl7pTHgTV5g242h74edTjFElG8JDW/9030JootFYJJ7BDdbDQUJd8qd80a+xdk/xhu
	 e48Ogu36znKuytO5bbLDnV+/6f2+07XlcnXJ3L/B4dDAYo72BIh9okMGsmztGB1DFa9Wa
	 cbaxCf6wSH2Y261qshuGDw5jwgU2F4ycJtVvEyWl9oLd1t/FpF3wNHlGZrkNPfWHgaWy2
	 jAJuPbZrCttypYKCWJQki//ESa9axBkoxVLYBk1nT5rmJWniom3fmgRWhHyOR2oJyJAWR
	 i8OlQR7rfjVWO3wnGALt+eej3pvzWX48jRswy1SAendBpkEqPNbFImJrVSC2a283hpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RNPEXbcvLHlz70jUnJvyWiGs4WgJ8gGzePseO2P4c0Y=;
	b=KfWrxfxgV631FHqAF7j3RoPzl6Cgjny1JCgnTMrwci8nloDbIo/L+6x53TzNt5qpbvMb
	 mWxqldL3GzBDv6ZvZXrnTpi5tTQItsZO4tF9DTjmu87XY9y+U4TgQRyd9vIvFx3xLNj5n
	 c+h79weS8ETXdegvoMDmb8CmCVMcrh22oBOu9JeYnP4VZulE/hQK0yZrD86iRd4OFA9U4
	 E+SU1Ww8OCsSJLN6ZzcoUOho44DhxX01u7Dq7MymN8jxpQsqVt+HC1ZxlEqYRn95nEPh/
	 SXA2XoV7KSShcJiGQR9GSRZikqlHtWFZrzFLfFYH6o/OBxuFTL7WZgn+X5A2nL7wbzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUNjv8iO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ED1vANuR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E237E606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E237E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUNjv8iO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ED1vANuR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2N3VkD2074057
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 23:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RNPEXbcvLHl
	z70jUnJvyWiGs4WgJ8gGzePseO2P4c0Y=; b=ZUNjv8iOu0cW5VdrUGImHyJiA16
	Y+L8jMtCrcru0H+eiv4v+0T6AGLDpg7SuT/sSijN3ioOElR55w7lOd2zSi3aNJka
	Q40NDdlPZuInNL1WYquTpit3QKEn5NCAiirvIo8h9v6Qh6MfHYxzNlSh7VMTB23B
	S+5YTrjCRs6pNv69AOmVdj/r1O/XSWGTivyq3LFfirFuYMw/XXxn520EXWFv4rbZ
	OOLsPv/8PluEs5ceDLV2srFwq3cWw8S1yULOkj4b8TeEzvxZHYYORtIczAwaUsa8
	qaihozL7CbKg+/Lz+B/gXXbjXAVqZVu+4NVHpYYejX26wz6pvpXjOiHlXZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy00tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:10:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so356346085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793661038; x=1794265838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNPEXbcvLHlz70jUnJvyWiGs4WgJ8gGzePseO2P4c0Y=;
        b=ED1vANuRMDOghU3by7FnR2lmz23pq00C/nbAWsAj2mNGIEiBkTxjcrSX8lGBJ5Vwv4
         4lFp12a2tvWBlojEHawd2pZJKYuVYiRwA7JdLN3hDnrjyrQWfUK/VAWbVY9z7BzB2jSC
         OKiSGqh1rGPgo4rCICR1N22AWQtUoVY3dPvnPHXJFe3xgIjvyDPdrI1JaYtTH5EH5rsH
         FBBnq0xVIl+MVT60RnApXIVZ1BKlLCXLuWAL2A1WLD/rqR/yyrYx7zhUvUZwQtpznn6j
         NYuOQW/oanhYb/sQBCHdxz8xdqxr9aOgPqPgVPCxf37Qqb2lOQyFYbKgb2pLEuTSzmSg
         Jdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661038; x=1794265838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNPEXbcvLHlz70jUnJvyWiGs4WgJ8gGzePseO2P4c0Y=;
        b=p5Emrq2GH3Z/N59IBxS8BekJLKX/71jOdfE7yXwsqewnscqIAaukpDQz9Tu2Ltz+Ef
         m4gm8CoNBP75y7YE87lx1x47GOWsSO6oyBOWEWRyJEYAtUVglxnCsUvHP0hWROkaSInB
         BU/SWdgedyGTjPpOamhFi9yoI3u63VybwWnacm627H1DxYNziM/0uiMkJRSCuFwan21X
         tZDJEasI427onpuctALTMUxUh0fniA/Cdpa3jiL6jkf8bj+LWXrMJVl4jJqH3UuMV8cD
         i9Y2QHtkgWODkccdLpfYPJE/LMblUZ9wK6HXUtaWaKF5Z/zPDH3DIw0rncgpuzKy60RQ
         RvZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5qD7rFAOqN1wsKk0FQgvHKwef+9IQNI+3MN39MidehZfK2dV56tPrrItQX8k7cEBmLXZnd460QPjJZKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+oOIrkidTtTmsqFGisbMM+DHkPQRWiSlqRONC+eJko0R2UMju
	lr71g0oD977aDB9+jbKT/4eS/5MvQ2kP4g2VbUMjq4wtwjsBcLuRMdV/sXjkp5SW5rmsjvCgWxM
	xEM5dfnBkJBvWYkVPg/bRcih6cbz/FZHz1Xqatjc3k2NHN/ZovPOhI8t/9UyeV4f5txU=
X-Gm-Gg: AYBFou2dooya7AaVuA8kC3mGOR8QJM3zeoFAmwkdKkDRLPJS9jk1ft03+cgNdN+1Xoz
	Vg4ujfXtbKyxcQBn+KH1kW8NIyz4eGJWj0QKy5DJxM/Omp82MHZp2UEVfWrkxoiohSq5BB8rLvU
	E20eGsLYgPTpY7pubs/XgzUIcLAYA1HLuwDZfWFVANBVUFhJP2SKLBcrhAk7HTClvLeRpceJt3R
	Njz2rvT7fCx4pJ8G5e/CrDN2dcH4HidEAwL/NdOBfsAvbpfrwiEK3eV3WJbTGgNSwDSuiWPTxBS
	9VADBXfsBBRzrnCQxoqQAFZ5BwwqruyPEqSm5TGNetunCGc2xFacMdKm4PjcNiWwtAWEegRtgxS
	7F9Cn/5zTz2eCvuKh2PLq5WFUsQZ8zjkrUQc+3p4kNeUfIrgZDZ5GnZqJ3Ma2Rk0Q3YnNwRSJss
	Tm
X-Received: by 2002:a05:620a:28c6:b0:93c:6fd4:467a with SMTP id af79cd13be357-94421541a87mr1857269685a.2.1793661037888;
        Mon, 02 Nov 2026 15:10:37 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:93c:6fd4:467a with SMTP id af79cd13be357-94421541a87mr1857266285a.2.1793661037320;
        Mon, 02 Nov 2026 15:10:37 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm25198725e9.2.2026.11.02.15.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:10:35 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: akpm@linux-foundation.org, rafael@kernel.org, tglx@kernel.org,
        peterz@infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
        linux-pm@vger.kernel.org (open list:POWER MANAGEMENT CORE),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] powercap: idle_inject: Create per-CPU threads on registration
Date: Tue,  3 Nov 2026 00:09:41 +0100
Message-ID: <71091b05daff46020ccd1bba3ed66b0055c85046.1793660202.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: jtFYuYH9wuPZ-mOEWIIar6CCfEmcI7DA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX0DkjP95kLZbv
 PzP5jwe/eeBosJwwOlzoZ7SO/gd+MJe72C/4SNe58TOE7u42GxMeLxEm2rOjNQH8MBiIydjkxwS
 Pfb1/Rx/A7yjokSIx7Du92OSg7Yj27yBumv5wa3cWt7OeBO+4kVmp7Vp8x6c2wnKgCc1ajGfUZp
 V+yGeExEZCeScnnZQfOv99qN+2Jrs2XruzIl1QoETPq1jtoEq/GMO2M467OAw863iz2d3EOe4LO
 zL/VvBS66c52CDOdSaBhoPIydIXHKe0pVd/igRYBzoifcw+f0EgtlewYJw7e/x2QSDGdyW1B+oL
 NA+NYfqzYlJvp/5qaiRniL7WBONW9Ode37lRfqsaqAJiesplbrxBTasz02QzgUeGRU4OAW30r7A
 F6GtIiivjqaVPNIC51Aynr7J53nZw6cwnx0s9hzU7fuunrRM9FZlZSVVX/taiCRa0MTq8KJJ9IV
 3ENlGKqWt985MAUhUTA==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9186f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=z2xlO20o2AOZ5rEB0BcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-GUID: jtFYuYH9wuPZ-mOEWIIar6CCfEmcI7DA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfXzREBO8/Skhrf
 sZRJcS9lUfmxdGIRFYfhZ0blyG/mFs/EaKjmkRwC8Bj94pkInD3e/k6u+3EmING3O7aJ9CwiECq
 WzF2bIcJ0K8yxFyVZF8XHxcR2BRg004=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020090

Create idle injection threads when a device registers instead of
creating them unconditionally during early initialization. Destroy the
threads when the device unregisters.

Use a per-device smpboot descriptor with the device's CPU mask so thread
creation and CPU hotplug handling are limited to the CPUs registered by
that device. Allow stopping devices whose offline CPUs have not yet had
a thread created, and update the registration documentation to describe
the thread lifecycle and possible failures.

Serialize CPU ownership checks and claims with a framework-wide mutex.
Without serialization, registrations with overlapping masks can both
observe an unclaimed CPU and overwrite each other's device pointer.
Their smpboot descriptors can then share the same per-CPU task, allowing
one device's teardown to destroy a thread belonging to another device.
Registration rollback can also clear another caller's ownership.

Hold the mutex through smpboot registration and failure rollback, and
during thread unregistration through ownership release. This prevents a
CPU from being claimed again until its previous thread is destroyed.

Stop idle injection before acquiring the mutex, keeping timer callback
cancellation and stop-side hotplug exclusion outside the ownership
critical section. Neither the idle injection threads nor their smpboot
hotplug paths acquire this mutex. The existing caller-side lifecycle
synchronization requirement remains in effect.

Reported-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/powercap/idle_inject.c | 69 +++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/drivers/powercap/idle_inject.c b/drivers/powercap/idle_inject.c
index a25eb2018acd..24646b8be9ac 100644
--- a/drivers/powercap/idle_inject.c
+++ b/drivers/powercap/idle_inject.c
@@ -10,11 +10,9 @@
  * It relies on the smpboot kthreads feature providing common code for CPU
  * hotplug and thread [un]parking.
  *
- * All of the kthreads used for idle injection are created at init time.
- *
- * Next, the users of the idle injection framework provide a cpumask via
- * its register function. The kthreads will be synchronized with respect to
- * this cpumask.
+ * Users of the idle injection framework provide a cpumask via its register
+ * function. The kthreads are created on demand for CPUs in this mask and
+ * will be synchronized with respect to it.
  *
  * The idle + run duration is specified via separate helpers and that allows
  * idle injection to be started.
@@ -40,6 +38,7 @@
 #include <linux/cpu.h>
 #include <linux/hrtimer.h>
 #include <linux/kthread.h>
+#include <linux/mutex.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/smpboot.h>
@@ -60,6 +59,7 @@ struct idle_inject_thread {
 /**
  * struct idle_inject_device - idle injection data
  * @timer: idle injection period timer
+ * @threads: per-device CPU hotplug thread descriptor
  * @idle_duration_us: duration of CPU idle time to inject
  * @run_duration_us: duration of CPU run time to allow
  * @latency_us: max allowed latency
@@ -82,6 +82,7 @@ struct idle_inject_thread {
  */
 struct idle_inject_device {
 	struct hrtimer timer;
+	struct smp_hotplug_thread threads;
 	unsigned int idle_duration_us;
 	unsigned int run_duration_us;
 	unsigned int latency_us;
@@ -92,6 +93,9 @@ struct idle_inject_device {
 static DEFINE_PER_CPU(struct idle_inject_thread, idle_inject_thread);
 static DEFINE_PER_CPU(struct idle_inject_device *, idle_inject_device);
 
+/* Serialize CPU ownership changes and the associated thread lifecycle. */
+static DEFINE_MUTEX(idle_inject_lock);
+
 /**
  * idle_inject_wakeup - Wake up idle injection threads
  * @ii_dev: target idle injection device
@@ -279,7 +283,8 @@ void idle_inject_stop(struct idle_inject_device *ii_dev)
 		iit = per_cpu_ptr(&idle_inject_thread, cpu);
 		iit->should_run = 0;
 
-		wait_task_inactive(iit->tsk, TASK_ANY);
+		if (iit->tsk)
+			wait_task_inactive(iit->tsk, TASK_ANY);
 	}
 
 	cpu_hotplug_enable();
@@ -319,12 +324,12 @@ static int idle_inject_should_run(unsigned int cpu)
  * idle
  *
  * This function creates an idle injection control device structure for the
- * given set of CPUs and initializes the timer associated with it. This
+ * given set of CPUs, registers their kthreads and initializes the timer. This
  * function also allows to register update()callback.
  * It does not start any injection cycles.
  *
- * Return: NULL if memory allocation fails, idle injection control device
- * pointer on success.
+ * Return: NULL if allocation or thread registration fails, or a CPU is already
+ * registered; idle injection control device pointer on success.
  */
 
 struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
@@ -342,6 +347,8 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 	ii_dev->latency_us = UINT_MAX;
 	ii_dev->update = update;
 
+	mutex_lock(&idle_inject_lock);
+
 	for_each_cpu(cpu, to_cpumask(ii_dev->cpumask)) {
 
 		if (per_cpu(idle_inject_device, cpu)) {
@@ -352,6 +359,20 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 		per_cpu(idle_inject_device, cpu) = ii_dev;
 	}
 
+	ii_dev->threads = (struct smp_hotplug_thread) {
+		.store = &idle_inject_thread.tsk,
+		.setup = idle_inject_setup,
+		.thread_fn = idle_inject_fn,
+		.thread_comm = "idle_inject/%u",
+		.thread_should_run = idle_inject_should_run,
+		.cpumask = to_cpumask(ii_dev->cpumask),
+	};
+
+	if (smpboot_register_percpu_thread(&ii_dev->threads))
+		goto out_rollback;
+
+	mutex_unlock(&idle_inject_lock);
+
 	return ii_dev;
 
 out_rollback:
@@ -361,6 +382,8 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 		per_cpu(idle_inject_device, cpu_rb) = NULL;
 	}
 
+	mutex_unlock(&idle_inject_lock);
+
 	kfree(ii_dev);
 
 	return NULL;
@@ -372,11 +395,11 @@ EXPORT_SYMBOL_NS_GPL(idle_inject_register_full, "IDLE_INJECT");
  * @cpumask: CPUs to be affected by idle injection
  *
  * This function creates an idle injection control device structure for the
- * given set of CPUs and initializes the timer associated with it.  It does not
- * start any injection cycles.
+ * given set of CPUs, registers their kthreads and initializes the timer. It
+ * does not start any injection cycles.
  *
- * Return: NULL if memory allocation fails, idle injection control device
- * pointer on success.
+ * Return: NULL if allocation or thread registration fails, or a CPU is already
+ * registered; idle injection control device pointer on success.
  */
 struct idle_inject_device *idle_inject_register(struct cpumask *cpumask)
 {
@@ -398,23 +421,15 @@ void idle_inject_unregister(struct idle_inject_device *ii_dev)
 
 	idle_inject_stop(ii_dev);
 
+	mutex_lock(&idle_inject_lock);
+
+	smpboot_unregister_percpu_thread(&ii_dev->threads);
+
 	for_each_cpu(cpu, to_cpumask(ii_dev->cpumask))
 		per_cpu(idle_inject_device, cpu) = NULL;
 
+	mutex_unlock(&idle_inject_lock);
+
 	kfree(ii_dev);
 }
 EXPORT_SYMBOL_NS_GPL(idle_inject_unregister, "IDLE_INJECT");
-
-static struct smp_hotplug_thread idle_inject_threads = {
-	.store = &idle_inject_thread.tsk,
-	.setup = idle_inject_setup,
-	.thread_fn = idle_inject_fn,
-	.thread_comm = "idle_inject/%u",
-	.thread_should_run = idle_inject_should_run,
-};
-
-static int __init idle_inject_init(void)
-{
-	return smpboot_register_percpu_thread(&idle_inject_threads);
-}
-early_initcall(idle_inject_init);
-- 
2.43.0

