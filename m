Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661040;
	b=t1xEGcq2iRsRRCKpFw0A0Sf5NjdATLpWxwq8pjP8hEnOpxxI+DAeqPDensYJoGR8G7pb
	 W9KDtc8jTjKfLCSXfUuY9bvqfEnKx2W0D3Q5qgwc7tx9wCSTT3hosO9QGpWbChS0lTI6r
	 a56NlqxbWYuKWYKwp6oH7c1vTNxD8N6E3M3Bqyg7l21UeQBje7ChmMSts888UG58Qbywh
	 DW+bIu9XCwYWLur4+e1mPGx+msDm88R1eSXTWFCZhpZzbCb0jouKUL+7ouHXL8ntL0afl
	 2TOvHEKw9AO4uPUeEW93YlZVUmwHhauFe/XbcnYGYoDkFoRuriUp/S35VFNmp49SbMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gSxjo7G/C4iKFeABmyD/cOIF2FiAgdOm/dXL8y9CJck=;
	b=4hRSiRUDhf9hOzZAAPQF+RY/K7MXVJd+6tY5UWFrHczUOYbdD3UkQTpLV05ZNOpzONtL
	 o5vAtduP81ED8ZDVL8/eu2okIaffto1kHgu77lRuChL2S6bEc612fNvAvnJQCnb8Ru4Pt
	 SbHINz5XTtFXVB4hCZTGBtk0LfVOLAAJuQ5uvgeNII+ib8aclt/Fzlr0uNWfRO+u8pGFK
	 /9D35WKD3FG1dGsmIFi+f5OncldsClQe8BPPqRegWCC2Ye5faAN3+/BWgiR5ZIp48erni
	 z0Xre3Lqn3X2T615/UuMz2GnwTgEcK4OjzXZxUdyvNyq8oJr6NP4EX5MeF9HbTXJqXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GfXf1IO4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jrx7xuXp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2427606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2427606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GfXf1IO4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jrx7xuXp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K61lx1745221
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 23:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gSxjo7G/C4i
	KFeABmyD/cOIF2FiAgdOm/dXL8y9CJck=; b=GfXf1IO4G333Kn+mISHKagwfJvd
	jg3ziOgrRSmF8W7h2zp2MNPIJ+jghNIW0xLXDO2Fm2KQEhyfls2jx7N2Gf9WN/xW
	ApZxRo7/gdXbngf9TjMw0ixVNCVdVILFFDEDszi8zFzfyD/krL9ZvqLVYEU21yAB
	d75JRXcPSS3nCeAs6VvD5k+4R1RtqKaxTs3GuXauJSL5nvwNS2/95tRbod2sRziP
	Eo2D2L8gT4OjDt9Rg2g5S7F4LaumsKcBsWFTBHtPaKx0knAikw3sGB6dxdbxl8zm
	o3ZSKnIWUKFg5qakEtjA7jfkCqYLb0Mlg1+w1+rAWRZe3j4YHpUi/yQ8eyA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvua9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:10:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c0f73807eso47631166d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793661036; x=1794265836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSxjo7G/C4iKFeABmyD/cOIF2FiAgdOm/dXL8y9CJck=;
        b=Jrx7xuXp27NtS+ZpHTq275mIMFs81aYTcbbe1miNXcaVLHsEKKabp1UmxIM4fwWfjW
         D9oPLVU0ntlZzduv55ntg+0bmjm4kNxINfMyTk9h6/Ode8CrzD3YPIYNrYoNEOsmAQOW
         nd+wvrvARpUx57lRCBJcKpvvw+HVl2VHJn6iQxvrWXQ79vOPzkvKlsilMw3/XmiRQslx
         0SeEkrgVqF5znDZg3LdFlUg4yzngNeuSJVYdwYeqaQgJt778AOtTiHIWGNnjJ84Ymcjs
         9YYonyK77FxEKTXt5zgYfWAo33IiN0/H8lUn5XmTdMDUBkSCJrGmq3zPUCcPKeefJJAq
         5UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661036; x=1794265836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSxjo7G/C4iKFeABmyD/cOIF2FiAgdOm/dXL8y9CJck=;
        b=zoRmEcAJvWL5Biso4C785rg86A7rAlgvJahKAgCfnU9sp1aq/kqARVAFNiuHDZw19+
         K0tFgiZdADgRfevhDRwqwieuOj6R29IysYp+FKvH+7Pl41D4IfSdG8Kgx1+eeVjv0RLg
         E2A+gd0BelJK6/Ejm6wkSFxrnqhQva5aowXpvq4iaGrINS4nKmHiNYTBrmroqtiN9o8o
         VE1dbxMb9bwVjAtDL0Y2HK6l2JX7e9uEHXN/XOQYMVGitoUKa7lW7pK1E+mYAhCHyiLP
         oAl69jyh1N04vn1+DMDpSybIC1WViwuioUgkJnlbTNfzIq51st1HGhwoM2HkB9oKDCsh
         LovA==
X-Forwarded-Encrypted: i=1; AKwUvBwvw10bpvaSYrdpuIYBempnZyUXR+vnD3wIdvwcc9hLdSd1LNax0GzFyfs7nXHKMmY/x/P2tfMOQ/hdVw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1D49FXjh3gH79EsYcSIA9oyC0TgD/sIIHbNFpeC4UBSoARToi
	v+ogZKTMRwsdBG7UG0xiNvePyBYkYp/Z3xzLlM/6+/lW+Wbcy1m0Zd4y9QswFnNqnDuVUq+1so2
	l1GWrKPEEae35qOMJhJD3yIf/ijGSJ0anXdgdQGyx5PEuGfjgx8xZE6ALo7HkmGe0Xy4=
X-Gm-Gg: AYBFou08Gi0jMqDy4yTXPzB3XH8JIhJNnWQK3ayjaT7ULsvpoypjt5HqgFJji63zu/U
	1FBul2wFA0u6lDgCmXDSW2N3GqhDA6ypyFt2EtDGmnOdJj8k6xMjOCJffnGi+ZWXTRoXdCqQeTx
	1n2993nkTQTKdv6WAPFo8/q3acd7uU3fj1iIBu4VwOFq12uPIELEFY8QOv00XxtGKwNCqGbcWpQ
	L55WY1sGLGCBjSZhsKvCeCrjqWMkrQByWxFtVY38Q8mi9V6nAQEseO1BEARlW1pXmaLwvtpLMVL
	eMnSdj2IkXDO8nWDR4oRKK/EXXIDG2TxSM2jISk629O9WbksI66S6XX0QXlSgzHvhLE+0QMdbCw
	1u+EHby0IpgM94Vwww3Nv70lVokdwtLK8paNsvdi3hT/p+Ed0GweUS1ccZ2xhs2bQV/sHDX9Lzq
	Rm
X-Received: by 2002:a05:620a:880e:b0:93e:c12c:fbcf with SMTP id af79cd13be357-944217b26bfmr1799037285a.75.1793661035848;
        Mon, 02 Nov 2026 15:10:35 -0800 (PST)
X-Received: by 2002:a05:620a:880e:b0:93e:c12c:fbcf with SMTP id af79cd13be357-944217b26bfmr1799034385a.75.1793661035243;
        Mon, 02 Nov 2026 15:10:35 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm25198725e9.2.2026.11.02.15.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:10:34 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: akpm@linux-foundation.org, rafael@kernel.org, tglx@kernel.org,
        peterz@infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
        linux-kernel@vger.kernel.org (open list:CPU HOTPLUG)
Subject: [PATCH 1/2] smpboot: Allow restricting per-CPU threads to a CPU mask
Date: Tue,  3 Nov 2026 00:09:40 +0100
Message-ID: <af37c4e7811a86adafb2064e7cf4aa4f5090ab4b.1793660202.git.daniel.lezcano@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae9186d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=igP56NFfHUNPCibkussA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: pCAv8DDM0ab6_ujqiAoALKzO06p1NBhH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MSBTYWx0ZWRfX/pH2kqxahmaF
 tUeW2lSXitqVxFK97AdAVFr6YPB9jrgNiq/H8z5L5B3lBAJBe/8ua0Yh+QGhG3Jz45OmPuD/G8Y
 J9012r5BXLQb9JFP8j0Vi6i30y6i91s=
X-Proofpoint-ORIG-GUID: pCAv8DDM0ab6_ujqiAoALKzO06p1NBhH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MSBTYWx0ZWRfX6ZmDTIGIXLH0
 /83AYE4doDmNIflUwPEgC9b7DeevN6IKTB+1Sxu3Elp5156ABT61LzWjfyZyiF95l9LzbyHI9SF
 yzcNbTNrFS49nFZm+6m51IPrJw7j7B88AfJnMnhl6p5EksFM8W2Htg9KAAuzm6Bi/y5MQhSBUjm
 5OPRv7A3SsaqT9n98BRT9bzT8pADBvZp70TQi0eNEiwOKOwgJVqMO+Ys/2tx57Dqy79o6zluPIs
 QbLpqqn+94d5le6bwuPPkJckER3SG2XjDwOCD1+UX4l8C0uw72Y/o9ZexWPnaYqEhRxDnkuIZVt
 ZXtni/+z8gDrFUMmleNWxA77pyFlUBIXZHMeQvD/GqCj9KNmSjpprZ+DLyDh/IQiClre4kxHPPB
 O2FC8cj4rJEJtOibj2W0iG7WmIg000AF4pEjiIOxR7hOthGCli2DtkMXdSKr9qK8nYJ2vUZQJnp
 8Kgtr9sE64N8HIQx9UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020091

smpboot_register_percpu_thread() creates a thread for every online CPU
and registers the descriptor for subsequent CPU hotplug operations.
There is currently no way to restrict these threads to a subset of
CPUs, even when the user only needs work performed on that subset.

For example, an idle injection device targets a specific CPU mask.
Creating threads outside that mask consumes resources unnecessarily.
Supporting multiple such devices also requires each descriptor to
manage only the threads associated with its own CPUs.

Add an optional CPU mask to struct smp_hotplug_thread and apply it
throughout the thread lifecycle. Registration creates threads only for
online CPUs in the mask. CPU bring-up creates threads for selected
CPUs that were offline at registration, while parking and unparking
are restricted to the same mask.

Apply the restriction to thread destruction as well, both during
unregistration and registration failure cleanup. This is necessary
when descriptors with disjoint masks share the same per-CPU task
storage: tearing down one descriptor must not stop or clear threads
owned by another descriptor.

The caller must keep the mask valid and unchanged until the descriptor
is unregistered. Callers sharing per-CPU task storage must ensure their
masks do not overlap and serialize ownership changes themselves.

A NULL mask preserves the existing behavior, so current users continue
to manage threads on all CPUs.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 include/linux/smpboot.h |  4 ++++
 kernel/smpboot.c        | 17 +++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/smpboot.h b/include/linux/smpboot.h
index 9d1bc65d226c..98c072eeaf24 100644
--- a/include/linux/smpboot.h
+++ b/include/linux/smpboot.h
@@ -5,6 +5,7 @@
 #include <linux/types.h>
 
 struct task_struct;
+struct cpumask;
 /* Cookie handed to the thread_fn*/
 struct smpboot_thread_data;
 
@@ -27,6 +28,8 @@ struct smpboot_thread_data;
  *			unparked (cpu online)
  * @selfparking:	Thread is not parked by the park function.
  * @thread_comm:	The base name of the thread
+ * @cpumask:		Optional mask of CPUs on which to create threads. Must remain
+ *			valid and unchanged until the descriptor is unregistered.
  */
 struct smp_hotplug_thread {
 	struct task_struct		* __percpu *store;
@@ -40,6 +43,7 @@ struct smp_hotplug_thread {
 	void				(*unpark)(unsigned int cpu);
 	bool				selfparking;
 	const char			*thread_comm;
+	const struct cpumask		*cpumask;
 };
 
 int smpboot_register_percpu_thread(struct smp_hotplug_thread *plug_thread);
diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index 4503b60ce9bd..07857523a465 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -168,6 +168,9 @@ __smpboot_create_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 	struct smpboot_thread_data *td;
 
+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
+		return 0;
+
 	if (tsk)
 		return 0;
 
@@ -225,6 +228,9 @@ static void smpboot_unpark_thread(struct smp_hotplug_thread *ht, unsigned int cp
 {
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
+		return;
+
 	if (!ht->selfparking)
 		kthread_unpark(tsk);
 }
@@ -244,6 +250,9 @@ static void smpboot_park_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
 {
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
+		return;
+
 	if (tsk && !ht->selfparking)
 		kthread_park(tsk);
 }
@@ -267,6 +276,9 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
 	for_each_possible_cpu(cpu) {
 		struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+		if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
+			continue;
+
 		if (tsk) {
 			kthread_stop_put(tsk);
 			*per_cpu_ptr(ht->store, cpu) = NULL;
@@ -279,7 +291,8 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
  * 					    to hotplug
  * @plug_thread:	Hotplug thread descriptor
  *
- * Creates and starts the threads on all online cpus.
+ * Creates and starts the threads on online CPUs selected by the descriptor's
+ * cpumask, or all online CPUs if no mask is specified.
  */
 int smpboot_register_percpu_thread(struct smp_hotplug_thread *plug_thread)
 {
@@ -308,7 +321,7 @@ EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
  * smpboot_unregister_percpu_thread - Unregister a per_cpu thread related to hotplug
  * @plug_thread:	Hotplug thread descriptor
  *
- * Stops all threads on all possible cpus.
+ * Stops all threads associated with the descriptor, including offline CPUs.
  */
 void smpboot_unregister_percpu_thread(struct smp_hotplug_thread *plug_thread)
 {
-- 
2.43.0

